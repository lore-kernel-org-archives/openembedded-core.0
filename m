Return-Path: <nate.karstens@garmin.com>
X-Greylist: delayed 430 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 10 Dec 2015 03:44:33 UTC
Received: from p3plsmtpa09-09.prod.phx3.secureserver.net
	(p3plsmtpa09-09.prod.phx3.secureserver.net [173.201.193.238])
	by mail.openembedded.org (Postfix) with ESMTP id BE98E607AB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 03:44:33 +0000 (UTC)
Received: from localhost.localdomain ([74.222.250.91])
	by p3plsmtpa09-09.prod.phx3.secureserver.net with 
	id rfd81r0041z4HfN01fdPvs; Wed, 09 Dec 2015 20:37:24 -0700
X-Sender: nate@karstens.us
From: Nate Karstens <nate.karstens@garmin.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Dec 2015 21:36:37 -0600
Message-Id: <1449718597-2085-1-git-send-email-nate.karstens@garmin.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] dhcpcd: add recipe for dhcpcd
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
X-List-Received-Date: Thu, 10 Dec 2015 03:44:36 -0000

Adds a new recipe for dhcpcd. Modifies the configure script to keep the
host system header files from being used instead of the target system.

Signed-off-by: Nate Karstens <nate.karstens@garmin.com>
---
 .../dhcpcd/dhcpcd-6.9.4/configure.patch               | 12 ++++++++++++
 meta/recipes-connectivity/dhcpcd/dhcpcd_6.9.4.bb      | 19 +++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-connectivity/dhcpcd/dhcpcd-6.9.4/configure.patch
 create mode 100644 meta/recipes-connectivity/dhcpcd/dhcpcd_6.9.4.bb

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd-6.9.4/configure.patch b/meta/recipes-connectivity/dhcpcd/dhcpcd-6.9.4/configure.patch
new file mode 100644
index 0000000..d61b05e
--- /dev/null
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd-6.9.4/configure.patch
@@ -0,0 +1,12 @@
+--- ./configure
++++ ./configure
+@@ -316,9 +316,6 @@
+ if [ "$STATIC" = yes ]; then
+ 	echo "LDFLAGS+=	-static" >>$CONFIG_MK
+ fi
+-for x in $INCLUDEDIR; do
+-	echo "CPPFLAGS+=	-I$x" >>$CONFIG_MK
+-done
+
+ if [ -z "$DEBUG" -a -f .fslckout ]; then
+ 	printf "Found fossil checkout ... "
diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_6.9.4.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_6.9.4.bb
new file mode 100644
index 0000000..1c0aff4
--- /dev/null
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_6.9.4.bb
@@ -0,0 +1,19 @@
+SECTION = "console/network"
+SUMMARY = "dhcpcd - a DHCP client"
+DESCRIPTION = "dhcpcd runs on your machine and silently configures your computer to work on the attached networks without trouble and mostly without configuration."
+
+HOMEPAGE = "http://roy.marples.name/projects/dhcpcd/"
+
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://dhcpcd.c;endline=26;md5=7daf225c91b8065ecc974fc594b2a7de"
+
+SRC_URI = "http://roy.marples.name/downloads/${BPN}/${BPN}-${PV}.tar.xz \
+           file://configure.patch"
+
+SRC_URI[md5sum] = "02f5043a415cd4b6d089631a0cd95f5b"
+SRC_URI[sha256sum] = "c3f3ff7473ef158a1e71db9aea7424df2c3477ad064e2b542f27948a5abc9ba0"
+
+inherit autotools
+
+B = "${S}"
+EXTRA_OECONF = "--enable-ipv4 --enable-ipv6"
-- 
1.9.1


