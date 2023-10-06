Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9FE1E81DE3
	for <webhook@archiver.kernel.org>; Fri,  6 Oct 2023 11:22:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.10313.1696591324921848664
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Oct 2023 04:22:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9626911FB;
	Fri,  6 Oct 2023 04:22:43 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0A9A13F5A1;
	Fri,  6 Oct 2023 04:22:03 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/4] ttyrun: add new recipe
Date: Fri,  6 Oct 2023 12:21:59 +0100
Message-Id: <20231006112201.1081909-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231006112201.1081909-1-ross.burton@arm.com>
References: <20231006112201.1081909-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 11:22:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188758

From: Ross Burton <ross.burton@arm.com>

ttyrun is a small tool from IBM's s390-tools package to run a command
if the specified TTY is present, and hang if not.

This is useful so that you can list all of the potential terminals in
inittab and not have getty quiting instantly when a device isn't
present, resulting in the "respawning too fast" errors.

Note that DISTRELEASE has to be set as otherwise "build$(DATE)" is used,
which is non-reproducible.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/distro/include/maintainers.inc  |  1 +
 meta/recipes-core/ttyrun/ttyrun_2.29.0.bb | 33 +++++++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-core/ttyrun/ttyrun_2.29.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index dcc507bb982..b2579fc44c3 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -810,6 +810,7 @@ RECIPE_MAINTAINER:pn-texinfo-dummy-native =3D "Anuj M=
ittal <anuj.mittal@intel.com>
 RECIPE_MAINTAINER:pn-tiff =3D "Alexander Kanavin <alex.kanavin@gmail.com=
>"
 RECIPE_MAINTAINER:pn-time =3D "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-ttf-bitstream-vera =3D "Anuj Mittal <anuj.mittal@in=
tel.com>"
+RECIPE_MAINTAINER:pn-ttyrun =3D "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-tzcode-native =3D "Unassigned <unassigned@yoctoproj=
ect.org>"
 RECIPE_MAINTAINER:pn-tzdata =3D "Unassigned <unassigned@yoctoproject.org=
>"
 RECIPE_MAINTAINER:pn-u-boot =3D "Marek Vasut <marek.vasut@gmail.com>"
diff --git a/meta/recipes-core/ttyrun/ttyrun_2.29.0.bb b/meta/recipes-cor=
e/ttyrun/ttyrun_2.29.0.bb
new file mode 100644
index 00000000000..e0956b9ac61
--- /dev/null
+++ b/meta/recipes-core/ttyrun/ttyrun_2.29.0.bb
@@ -0,0 +1,33 @@
+SUMMARY =3D "Start the program if the specified terminal device is avail=
able."
+DESCRIPTION =3D "ttyrun is typically used to prevent a respawn through t=
he \
+init(8) program when a terminal is not available."
+HOMEPAGE =3D "https://github.com/ibm-s390-linux/s390-tools"
+
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Df5118f167b055bfd7c3450803f184=
7af"
+
+SRC_URI =3D "git://github.com/ibm-s390-linux/s390-tools;protocol=3Dhttps=
;branch=3Dmaster"
+SRCREV =3D "d9ce54dee3ac3827e76624352293a83eb05c727e"
+
+S =3D "${WORKDIR}/git"
+
+EXTRA_OEMAKE =3D "\
+    V=3D1 \
+    CC=3D"${CC}" \
+    DISTRELEASE=3D${PR} \
+    "
+
+# We just want ttyrun and not the rest of s390-utils
+
+do_configure() {
+    oe_runmake -C ${S}/iucvterm/src clean
+}
+
+do_compile() {
+    oe_runmake -C ${S}/iucvterm/src ttyrun
+}
+
+do_install() {
+    install -d ${D}${sbindir}
+    install ${S}/iucvterm/src/ttyrun ${D}${sbindir}
+}
--=20
2.34.1


