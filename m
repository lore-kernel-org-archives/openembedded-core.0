Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9EDDB7C7A7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2019 21:34:48 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x3GLYSGn026166
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2019 14:34:39 -0700
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Tue, 16 Apr 2019 14:34:18 -0700
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 16 Apr 2019 14:34:18 -0700
Message-ID: <20190416213418.18695-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [PATCH 1/1] parted: change device manager check in ptest
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
X-List-Received-Date: Tue, 16 Apr 2019 21:34:48 -0000
Content-Type: text/plain

t6001-psep should check for device manager the same way as
other ptests for parted -- look for an environment variable.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 meta/recipes-extended/parted/files/dm_check.patch | 22 ++++++++++++++++++++++
 meta/recipes-extended/parted/parted_3.2.bb        |  1 +
 2 files changed, 23 insertions(+)
 create mode 100644 meta/recipes-extended/parted/files/dm_check.patch

diff --git a/meta/recipes-extended/parted/files/dm_check.patch b/meta/recipes-extended/parted/files/dm_check.patch
new file mode 100644
index 0000000..bc0e95f
--- /dev/null
+++ b/meta/recipes-extended/parted/files/dm_check.patch
@@ -0,0 +1,22 @@
+parted: change check for device-manager
+
+Other ptests use this method.
+
+Upstream-Status: Pending
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+
+--- a/tests/t6001-psep.sh
++++ b/tests/t6001-psep.sh
+@@ -19,7 +19,9 @@
+ . "${srcdir=.}/init.sh"; path_prepend_ ../parted
+ 
+ require_root_
+-(dmsetup --help) > /dev/null 2>&1 || skip_test_ "No dmsetup installed"
++
++test "x$ENABLE_DEVICE_MAPPER" = xyes \
++  || skip_ "no device-mapper support"
+ 
+ # Device maps names - should be random to not conflict with existing ones on
+ # the system
diff --git a/meta/recipes-extended/parted/parted_3.2.bb b/meta/recipes-extended/parted/parted_3.2.bb
index 6189fd2..131e14b 100644
--- a/meta/recipes-extended/parted/parted_3.2.bb
+++ b/meta/recipes-extended/parted/parted_3.2.bb
@@ -19,6 +19,7 @@ SRC_URI = "${GNU_MIRROR}/parted/parted-${PV}.tar.xz \
            file://run-ptest \
            file://Makefile \
            file://0001-libparted-Use-read-only-when-probing-devices-on-linu.patch \
+           file://dm_check.patch \
 "
 
 SRC_URI[md5sum] = "0247b6a7b314f8edeb618159fa95f9cb"
-- 
2.7.4


