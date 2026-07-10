Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD473C44507
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 13:42:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12938.1783690936660911339
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 06:42:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=qcqVB2X2;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B17BB1EA6
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 06:42:11 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B3CD33F66F
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 06:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783690936; bh=cPOY3bNLnflDjBULSy5Ts2BpwcIaTOCxqORBo5pn2ig=;
	h=From:To:Subject:Date:From;
	b=qcqVB2X2OWBKecwvMg3SFXTyr03IAwzgFBpswE2SLewWbUz04bbB4DLpaPRcbvdQ/
	 Lxu8hBJ8fMdxN9hcfyW0hhy8s4hVOgpLv/2pyJkh9dCZg1ttL9eEQIBloE2T6vaOxs
	 jThFBdM5/+jJ1OIEY7jzNstUriQcWYRQWUv/OzTI=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] fontconfig: upgrade 2.18.1 -> 2.18.2
Date: Fri, 10 Jul 2026 14:42:13 +0100
Message-ID: <20260710134214.2097873-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 13:42:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240651

From: Upgrade Helper <auh@yoctoproject.org>

Upstream release notes:

- Fix FcNameUnparse regression
- Use Special FC_CACHE_VERSION for snapshot
- Add more conditional code for FcLocaleSetCurrent()
- fc-cache: do not generate cache when target directory is in deny list
- Add Nerd Fonts to the table
- Add a hash table for fonts to generate expected genericfamily
- Use genericfamily for the search of monospace against :spacing=3D100
- test: Fix a test case failure when BUILDDIR is under /tmp
- test: Fix a regression for sysroot in test framework
- conf.d: Add OpenMoji Color and OpenMoji Black
- meson: Add tests-external-fonts option to disable network-dependent tes=
ts

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../fontconfig/fontconfig/revert-static-pkgconfig.patch   | 8 ++++++++
 .../{fontconfig_2.18.1.bb =3D> fontconfig_2.18.2.bb}        | 2 +-
 2 files changed, 9 insertions(+), 1 deletion(-)
 rename meta/recipes-graphics/fontconfig/{fontconfig_2.18.1.bb =3D> fontc=
onfig_2.18.2.bb} (96%)

diff --git a/meta/recipes-graphics/fontconfig/fontconfig/revert-static-pk=
gconfig.patch b/meta/recipes-graphics/fontconfig/fontconfig/revert-static=
-pkgconfig.patch
index 30d6423037..4337da724f 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig/revert-static-pkgconfig=
.patch
+++ b/meta/recipes-graphics/fontconfig/fontconfig/revert-static-pkgconfig=
.patch
@@ -1,3 +1,8 @@
+From 1de775180219a57c85a0cdcc62fc6482ef8e581e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 23 Apr 2015 20:35:32 -0700
+Subject: [PATCH] fontconfig: Fix pkgconfig file generation to not have
+
 Revert part of http://cgit.freedesktop.org/fontconfig/commit/fontconfig.=
pc.in?id=3D338ffe6b886ad4ba86ff471cb59c4a5e5ffbe408
 We really dont do static linking so its not going to cause issues for us=
 but as such this is harming us by adding absolute
 paths into -I options into fontconfig.pc which is them prepended with sy=
sroot when read back by cross pkg-config and
@@ -7,6 +12,9 @@ gently refuses and rightly so.
=20
 Upstream-Status: Inappropriate [OE-Specific]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ fontconfig.pc.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/fontconfig.pc.in b/fontconfig.pc.in
 index 61b35fb..5bc9bab 100644
diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.18.1.bb b/meta=
/recipes-graphics/fontconfig/fontconfig_2.18.2.bb
similarity index 96%
rename from meta/recipes-graphics/fontconfig/fontconfig_2.18.1.bb
rename to meta/recipes-graphics/fontconfig/fontconfig_2.18.2.bb
index 76b2652738..d2b6050081 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig_2.18.1.bb
+++ b/meta/recipes-graphics/fontconfig/fontconfig_2.18.2.bb
@@ -23,7 +23,7 @@ DEPENDS =3D "expat freetype zlib gperf-native util-linu=
x"
 SRC_URI =3D "https://gitlab.freedesktop.org/api/v4/projects/890/packages=
/generic/fontconfig/${PV}/fontconfig-${PV}.tar.xz \
            file://revert-static-pkgconfig.patch \
            "
-SRC_URI[sha256sum] =3D "2300f3dbfa7253b3a44f4feecdbc8dfa45dde5dc2cfb71fc=
eaf31f394cb41031"
+SRC_URI[sha256sum] =3D "cf8e6576ef0484c15079bdaf77cd9c51c464df5365814ada=
4d3ee7331ea31eb5"
=20
 UPSTREAM_CHECK_URI =3D "https://gitlab.freedesktop.org/fontconfig/fontco=
nfig/-/tags"
 UPSTREAM_CHECK_REGEX =3D "releases/(?P<pver>.+)"
--=20
2.43.0


