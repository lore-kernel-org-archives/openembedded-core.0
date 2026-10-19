Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D258CCF2E8
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 14:58:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36899.1792421924487287577
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 07:58:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=jLfFWeFk;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 954F1202C
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 07:58:40 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6EBE13F673
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 07:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792421923; bh=XTvFSa2g48AZPKXHicOnSkzILzhB698ml7wqQFsk/Mg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jLfFWeFkCB0wZcegmbb4btTcbmOfviemuePW1peXDPpDX06mPSKfiUwzh41WvHPCv
	 lh23kxLaShunN6AnUFfilAyJxgswDnwiF2JilPjFXGpRuLHXkSWJlrRnwNCzEqopFC
	 xYiCHdu1gT7PqwnFIyegSPuP8YK5K09vVCmIopCE=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/6] lib/oe/package: improve regex when looking for libraries
Date: Mon, 19 Oct 2026 15:58:35 +0100
Message-ID: <20261019145837.2487873-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019145837.2487873-1-ross.burton@arm.com>
References: <20261019145837.2487873-1-ross.burton@arm.com>
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 14:58:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248186

Don't match() on .*\.so as that has false-positives for files named like
"file.something".  Instead, search for ".so" followed by either a dot or
the end of the filename.

Note that in an ideal world we'd reuse the elffiles list, which has
already been populated for the debug stripping. Unfortunately at present
this is not accessible here.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oe/package.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 5938798cef0..8ecb2555f3a 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -1619,7 +1619,7 @@ def process_shlibs(pkgfiles, d):
         bb.note("not generating shlibs")
         return
=20
-    lib_re =3D re.compile(r"^.*\.so")
+    lib_re =3D re.compile(r"\.so(?:\.|$)")
     libdir_re =3D re.compile(r".*/%s$" % d.getVar('baselib'))
=20
     packages =3D d.getVar('PACKAGES')
@@ -1780,7 +1780,7 @@ def process_shlibs(pkgfiles, d):
                     darwin_so(file, needed, sonames, pkgver)
                 elif hostos.startswith("mingw"):
                     mingw_dll(file, needed, sonames, pkgver)
-                elif cpath.is_executable(file) or lib_re.match(file):
+                elif cpath.is_executable(file) or lib_re.search(file):
                     linuxlist.append(file)
=20
         if linuxlist:
--=20
2.43.0


