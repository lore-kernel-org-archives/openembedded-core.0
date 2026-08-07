Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3372BC5AC7A
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 10:57:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40267.1786100250476702138
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Aug 2026 03:57:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=K1tYFwjm;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB99D1516
	for <openembedded-core@lists.openembedded.org>; Fri,  7 Aug 2026 03:57:25 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7CE913F9A2
	for <openembedded-core@lists.openembedded.org>; Fri,  7 Aug 2026 03:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786100249; bh=R8luE/NLslfpVIYcgKNStZRr3NVTHG5cqc5VXvbKYnc=;
	h=From:To:Subject:Date:From;
	b=K1tYFwjm+a7A22MBw4cv7UW6zBkkWcoSBvyE0OvX9/qpAl4mrY/vQSygheI7ykJRj
	 Bi7k0MLbN+8byjYh0EGwp+nZis4F7vpD5lh7J/a0T9x4pF2FCmOQrsQwrhMiDllY+2
	 l7j4zZkbRdlNje6hjIdVPvrImAR8am3xa3l/aB1E=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] fontconfig: upgrade 2.18.2 -> 2.18.3
Date: Fri,  7 Aug 2026 11:57:28 +0100
Message-ID: <20260807105728.3857790-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Aug 2026 10:57:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243005

Abridged upstream changes:
- fc-cat: exit with non-zero if not successfully done
- Workaround a longstanding use-after-free warning
- Fix a null pointer dereference
- Add Noto Sans as system-ui for fallback
- Drop Noto Sans CJK KR from 60-nonlatin.conf
- Correct sat.orth
- Add an orth file for Balinese
- Update orth files for jv, so, su, tl to use native scripts
- Add orth files for scripts used by Noto font families
- Update mni.orth to use Meetei Mayek script
- Add orth files for Cuneiform languages (akk, sux, hit)
- test: Add cache format compatibility tests for orth file additions
- Add orth files for ancient scripts (xna, hlu, ecy)
- fc-cache: Create backward-compatible cache symlinks for cross-version d=
iscovery
- Add implicit rule to update genericfamily property against syntactic-su=
gar
- fc-genconf: Use alias syntactic-sugar instead of the pair of test-edit =
config
- Allow to limit the targeted family for TTC
- test: Fix test_genconf.py to avoid unexpected family name in testing co=
nf
- test: Fix compiler warnings
- fc-fontations: Allow unnecessary_transmutes lint in bindgen-generated R=
ust code
- Fix another compiler warnings
- Fix the compiler warnings on MinGW
- Fix "FileType is deprecated"
- Fix unknown type name locale_t on macOS

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../fontconfig/{fontconfig_2.18.2.bb =3D> fontconfig_2.18.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/fontconfig/{fontconfig_2.18.2.bb =3D> fontc=
onfig_2.18.3.bb} (96%)

diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.18.2.bb b/meta=
/recipes-graphics/fontconfig/fontconfig_2.18.3.bb
similarity index 96%
rename from meta/recipes-graphics/fontconfig/fontconfig_2.18.2.bb
rename to meta/recipes-graphics/fontconfig/fontconfig_2.18.3.bb
index 792d44b7f0d..16037aeaa30 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig_2.18.2.bb
+++ b/meta/recipes-graphics/fontconfig/fontconfig_2.18.3.bb
@@ -23,7 +23,7 @@ DEPENDS =3D "expat freetype zlib gperf-native util-linu=
x"
 SRC_URI =3D "https://gitlab.freedesktop.org/api/v4/projects/890/packages=
/generic/fontconfig/${PV}/fontconfig-${PV}.tar.xz \
            file://revert-static-pkgconfig.patch \
            "
-SRC_URI[sha256sum] =3D "cf8e6576ef0484c15079bdaf77cd9c51c464df5365814ada=
4d3ee7331ea31eb5"
+SRC_URI[sha256sum] =3D "4f7b554a38cdf78c033f666c8871f3749e14a094f65a07f6=
30c91ed0b43d35e3"
=20
 UPSTREAM_CHECK_URI =3D "https://gitlab.freedesktop.org/fontconfig/fontco=
nfig/-/tags"
 UPSTREAM_CHECK_REGEX =3D "releases/(?P<pver>.+)"
--=20
2.43.0


