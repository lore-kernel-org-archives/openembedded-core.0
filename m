Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 548CFC5B572
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 16:14:00 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11855.1786551233732721693
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 09:13:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=Yqt+oD+c;
 spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd90.aul.t-online.de (fwd90.aul.t-online.de [10.223.144.116])
	by mailout04.t-online.de (Postfix) with SMTP id CAA969F1;
	Wed, 12 Aug 2026 18:13:48 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.161.72]) by fwd90.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wuBaN-2QECaf0; Wed, 12 Aug 2026 18:13:47 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Claude <noreply@anthropic.com>
Subject: [oe-core][PATCH 1/2] clang: fix IsOpenEmbedded() detection for CLANG_EXTRA_OE_DISTRO entries
Date: Wed, 12 Aug 2026 18:13:40 +0200
Message-ID: <20260812161341.822689-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1786551227-BBFFC91C-C5BDB839/0/0 CLEAN NORMAL
X-TOI-MSGID: 54b84f06-d8d9-4c9f-a5a3-4f6a68a52da9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1786551228; i=f_l_k@t-online.de;
	bh=a7oQ/OUQ9iWwmf7W/4n5rxg9f+pcQj1XBid0vHAV2DI=;
	h=From:To:Cc:Subject:Date;
	b=Yqt+oD+cMHKfRXRF8f0LLUGg5m+QiFKNwCDU6q+J0U1KkuVL38MEE5Lb7AtARsVhv
	 j2vJg4uPfVP9fQ0ZA+0i6nMjidquduCyEpecCdNN21dg0Yf+yauLpk7vgUWM4ZmsX/
	 RLW1IdZ1C894R3LEUu9pCtY0nRErkhuA9YkEeYuJqaCm5jf0zncNzD/rRZoz9w/o5u
	 wCr6vkN9b6+efYQXmq2QR9KiF4Ija5RqZdgGMipBdg+kxi6tJ/WgpfxUGzhlPfcogi
	 F8geYVgQftNP1zo4EOkgd+qRKxQAYAYmt+Uw/AKaNBYNBQbjUuDz6OVp3CCNoMjIFc
	 wc7CZ6K3mWmnw==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 16:14:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243296

do_preconfigure builds Distro::IsOpenEmbedded() from CLANG_EXTRA_OE_DISTR=
O,
but two bugs silently defeat OE-host detection for any distro beyond
the shipped default (poky:poky).

The check is assembled by appending each entry as 'NAME ||' and
stripping the trailing operator, so only the first entry gets a
'DistroVal =3D=3D' prefix.
With more than one entry this generates e.g.:
 bool IsOpenEmbedded() const { return DistroVal =3D=3D POKY ||WAYLAND_DES=
KTOP; }
and compiles but IsOpenEmbedded() then always returns true regardless of =
the
actual distro, since a non-zero enumerator is truthy -- the check becomes
disabled rather than extended.

Separately, the .Case() match string is built from the
underscore-converted identifier (needed since it doubles as a C++
enumerator name) instead of the raw distro id as it appears in
/etc/os-release. Since detection compares directly against the raw
ID=3D value, any distro name containing a hyphen never matches.

This only surfaces on a self-hosted OE build host (e.g. via
packagegroup-core-buildessential/-core-sdk) with a non-'poky' DISTRO
registered in CLANG_EXTRA_OE_DISTRO. Mainstream distros never hit
this path, since their native GCC keeps crt objects and headers
together in one directory that clang's default search already finds.
OE-built hosts split these across two directories, which is exactly
what the IsOpenEmbedded()-gated candidate exists to handle -- with it
disabled, native clang-toolchain builds (e.g. libcxx-native) fail:

    /usr/bin/x86_64-oe-linux-ld: cannot find crtbeginS.o: No such file or=
 directory
    /usr/bin/x86_64-oe-linux-ld: cannot find -lgcc: No such file or direc=
tory

Verified with debug instrumentation in
GCCInstallationDetector::ScanLibDirForGCCTriple(): with both fixes
applied, clang -v correctly reports:

    Found candidate GCC installation: /usr/lib/x86_64-oe-linux/16.1.0
    Selected GCC installation: /usr/lib/x86_64-oe-linux/16.1.0

Build each comparison explicitly and join with ' || ', and use the
raw (hyphenated) distro id for the .Case() match while keeping the
underscore-converted identifier only for the generated C++
enumerator/method names.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Co-authored-by: Claude <noreply@anthropic.com>
---
 meta/recipes-devtools/clang/llvm-project-source.inc | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/clang/llvm-project-source.inc b/meta/r=
ecipes-devtools/clang/llvm-project-source.inc
index 85b5ef06dc..5cd08d4085 100644
--- a/meta/recipes-devtools/clang/llvm-project-source.inc
+++ b/meta/recipes-devtools/clang/llvm-project-source.inc
@@ -65,18 +65,19 @@ python do_preconfigure() {
     triple =3D ""
     name =3D ""
     check =3D ""
-    oe_names =3D ""
+    oe_names =3D []
     distros =3D d.getVar('CLANG_EXTRA_OE_DISTRO')
     for distro in distros.split():
-        distro_id =3D distro.split(":")[0].replace('-','_')
+        distro_id_raw =3D distro.split(":")[0]
+        distro_id =3D distro_id_raw.replace('-','_')
         distro_triple =3D distro.split(":")[1]
-        case +=3D '\\n    .Case("' + distro_id + '", Distro::' + distro_=
id.upper() + ')'
+        case +=3D '\\n    .Case("' + distro_id_raw + '", Distro::' + dis=
tro_id.upper() + ')'
         triple +=3D '\\n   if (Distro.Is' + distro_id.upper() + '())\\n =
    return "x86_64-' + distro_triple + '-linux";'
         name +=3D '\\n    '+ distro_id.upper() + ','
         check +=3D '\\nbool Is' + distro_id.upper() + '() const { return=
 DistroVal =3D=3D ' + distro_id.upper() + '; }'
-        oe_names +=3D  distro_id.upper() + ' ||'
+        oe_names.append('DistroVal =3D=3D ' + distro_id.upper())
=20
-    check +=3D '\\nbool IsOpenEmbedded() const { return DistroVal =3D=3D=
 ' + oe_names[0:-3] + '; }'
+    check +=3D '\\nbool IsOpenEmbedded() const { return ' + ' || '.join(=
oe_names) + '; }'
=20
     cmd =3D ['sed', '-i', 's#//CLANG_EXTRA_OE_DISTRO_NAME#%s#g' % name, =
source + '/clang/include/clang/Driver/Distro.h']
     subprocess.check_output(cmd, stderr=3Dsubprocess.STDOUT)
--=20
2.55.0


