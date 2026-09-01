Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E03CDC624D3
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 17:19:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9.1788283154677946271
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 10:19:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=exvzaxRy;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 49A721BD0
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Sep 2026 10:19:10 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A5CE73F7D8
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Sep 2026 10:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788283154; bh=0rvZX7MVEfa0+B0flVhxqwQ6QzF8kXNJziz9uQXfYvY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=exvzaxRyBXw1D94jaHo/Y/Ui19MNFDybndgcc8UTtqKCZZyJpFIUu67lN48wuC9GT
	 9DqiyEYWnpi1YE3w6nBzQS9EKHHvTBZ7NhjORzICz/DvmnEQ7MW8DMNvPa6FzWgP0h
	 AY7DlyoO3/PJh3R7C2jqHEc9HhkxGCH8MOZZQiz0=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] makedepend: remove recipe
Date: Tue,  1 Sep 2026 18:19:04 +0100
Message-ID: <20260901171904.2579721-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901171904.2579721-1-ross.burton@arm.com>
References: <20260901171904.2579721-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 17:19:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244838

Now that mesa no longer depends on makedepend, there are no users of the
recipe in core.

We could move the recipe to meta-oe, but the layer index says that the
only recipes that depend on this recipe are variations of mesa[1] which
hasn't used makedepend since 2012, so instead the dependency can be
removed from those recipes in master.

[1] https://layers.openembedded.org/layerindex/branch/master/recipes/?q=3D=
depends%3Amakedepend-native

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 -
 .../xorg-util/makedepend_1.0.10.bb            | 20 -------------------
 2 files changed, 21 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-util/makedepend_1.0.10.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index 2966cddc056..512deb141d5 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -503,7 +503,6 @@ RECIPE_MAINTAINER:pn-m4 =3D "Robert Yang <liezhi.yang=
@windriver.com>"
 RECIPE_MAINTAINER:pn-m4-native =3D "Robert Yang <liezhi.yang@windriver.c=
om>"
 RECIPE_MAINTAINER:pn-make =3D "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-make-mod-scripts =3D "Bruce Ashfield <bruce.ashfiel=
d@gmail.com>"
-RECIPE_MAINTAINER:pn-makedepend =3D "Robert Yang <liezhi.yang@windriver.=
com>"
 RECIPE_MAINTAINER:pn-makedevs =3D "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-makedumpfile =3D "Etienne Cordonnier <ecordonnier@s=
nap.com>"
 RECIPE_MAINTAINER:pn-man-db =3D "Hongxu Jia <hongxu.jia@windriver.com>"
diff --git a/meta/recipes-graphics/xorg-util/makedepend_1.0.10.bb b/meta/=
recipes-graphics/xorg-util/makedepend_1.0.10.bb
deleted file mode 100644
index 643624485cd..00000000000
--- a/meta/recipes-graphics/xorg-util/makedepend_1.0.10.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-require xorg-util-common.inc
-
-SUMMARY =3D "create dependencies in makefiles"
-
-DESCRIPTION =3D "The makedepend program reads each sourcefile in sequenc=
e \
-and parses it like a C-preprocessor, processing \
-all #include, #define,  #undef, #ifdef, #ifndef, #endif, #if, #elif \
-and #else directives so that it can correctly tell which #include, \
-directives would be used in a compilation. Any #include, directives \
-can reference files having other #include directives, and parsing will \
-occur in these files as well."
-
-DEPENDS =3D "xorgproto util-macros"
-PE =3D "1"
-
-BBCLASSEXTEND =3D "native"
-
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D43a6eda34b48ee821b3b66f4f753c=
e4f"
-
-SRC_URI[sha256sum] =3D "baf742fb6c76c15febf5181e5cd814066205d8be9aef4abf=
dc2c54b235e14917"
--=20
2.43.0


