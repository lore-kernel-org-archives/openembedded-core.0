Return-Path: <Yanjun.Zhu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E27456F672
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 09:46:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2C9kVkq002223
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 02:46:31 -0700 (PDT)
Received: from wind-OptiPlex-780.corp.ad.wrs.com (128.224.162.219) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.169.1; Wed, 12 Mar 2014 02:46:30 -0700
From: Zhu Yanjun <yanjun.zhu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Mar 2014 17:46:29 +0800
Message-ID: <1394617589-29064-1-git-send-email-yanjun.zhu@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] libparted: make sure not to treat percentages as exact
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Mar 2014 09:46:32 -0000
Content-Type: text/plain

---
 ...ke-sure-not-to-treat-percentages-as-exact.patch |   22 ++++++++++++++++++++
 meta/recipes-extended/parted/parted_3.1.bb         |    3 ++-
 2 files changed, 24 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/parted/parted-3.1/parted-libparted-make-sure-not-to-treat-percentages-as-exact.patch

diff --git a/meta/recipes-extended/parted/parted-3.1/parted-libparted-make-sure-not-to-treat-percentages-as-exact.patch b/meta/recipes-extended/parted/parted-3.1/parted-libparted-make-sure-not-to-treat-percentages-as-exact.patch
new file mode 100644
index 0000000..1cf8309
--- /dev/null
+++ b/meta/recipes-extended/parted/parted-3.1/parted-libparted-make-sure-not-to-treat-percentages-as-exact.patch
@@ -0,0 +1,22 @@
+libparted: make sure not to treat percentages as exact
+
+If 1% of the drive size worked out ot be an even power of
+two, it would trigger the exact placement.  Add an exception
+for the percent units.
+---
+ libparted/unit.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libparted/unit.c b/libparted/unit.c
+index e545985..ff479f1 100644
+--- a/libparted/unit.c
++++ b/libparted/unit.c
+@@ -548,7 +548,7 @@ ped_unit_parse_custom (const char* str, const PedDevice* dev, PedUnit unit,
+ 	   do not use 4MiB as the range.  Rather, presume that they
+ 	   are specifying precisely the starting or ending number,
+ 	   and treat "4MiB" just as we would treat "4194304B".  */
+-	if (is_power_of_2 (unit_size))
++	if (is_power_of_2 (unit_size) && unit != PED_UNIT_PERCENT)
+ 		radius = 0;
+ 
+ 	*sector = num * unit_size / dev->sector_size;
diff --git a/meta/recipes-extended/parted/parted_3.1.bb b/meta/recipes-extended/parted/parted_3.1.bb
index 8344ea8..d791275 100644
--- a/meta/recipes-extended/parted/parted_3.1.bb
+++ b/meta/recipes-extended/parted/parted_3.1.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2f31b266d3440dd7ee50f92cf67d8e6c"
 SECTION = "console/tools"
 DEPENDS = "ncurses readline util-linux"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "${GNU_MIRROR}/parted/parted-${PV}.tar.xz \
            file://no_check.patch \
@@ -15,6 +15,7 @@ SRC_URI = "${GNU_MIRROR}/parted/parted-${PV}.tar.xz \
            file://fix-deprecated-readline.patch \
            file://run-ptest \
            file://Makefile \
+           file://parted-libparted-make-sure-not-to-treat-percentages-as-exact.patch \
 "
 
 SRC_URI[md5sum] = "5d89d64d94bcfefa9ce8f59f4b81bdcb"
-- 
1.7.9.5


