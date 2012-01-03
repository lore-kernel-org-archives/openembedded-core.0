Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RhxrH-0004L1-87
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 07:28:27 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 02 Jan 2012 22:20:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="91752183"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.112])
	by azsmga001.ch.intel.com with ESMTP; 02 Jan 2012 22:20:54 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 22:19:25 -0800
Message-Id: <32d308bb38612cef2a98a4c40f058b4db50787aa.1325571069.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 039/113] rpm: Fix rpm database files capacity issue.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Jan 2012 06:28:28 -0000

From: Mei Lei <lei.mei@intel.com>

Tune the __db* size in DB_CONFIG.
This will reduce the __db* size from 62MB to 26MB in qemu.

[YOCTO #1769]

Signed-off-by: Mei Lei <lei.mei@intel.com>
---
 meta/classes/rootfs_rpm.bbclass                   |    3 +++
 meta/recipes-devtools/rpm/rpm/rpm-db-reduce.patch |   19 +++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.0.bb            |    3 ++-
 3 files changed, 24 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-db-reduce.patch

diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index 30f3783..999b8a6 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -61,6 +61,9 @@ fakeroot rootfs_rpm_do_rootfs () {
 
 	mkdir -p ${INSTALL_ROOTFS_RPM}${rpmlibdir}
 	mkdir -p ${INSTALL_ROOTFS_RPM}${rpmlibdir}/log
+	# After change the __db.* cache size, log file will not be generated automatically,
+	# that will raise some warnings, so touch a bare log for rpm write into it.
+	touch ${INSTALL_ROOTFS_RPM}${rpmlibdir}/log/log.0000000001
 	cat > ${INSTALL_ROOTFS_RPM}${rpmlibdir}/DB_CONFIG << EOF
 # ================ Environment
 set_data_dir            .
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-db-reduce.patch b/meta/recipes-devtools/rpm/rpm/rpm-db-reduce.patch
new file mode 100644
index 0000000..e063e86
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/rpm-db-reduce.patch
@@ -0,0 +1,19 @@
+Upstream-Status: Inappropriate [configuration]
+
+Change cache size to reduce the usage of disk space from 62MB to 26MB. 
+
+Signed-off-by: Mei Lei <lei.mei@intel.com>
+
+diff --git a/rpmdb/DB_CONFIG.in b/rpmdb/DB_CONFIG.in
+index e0b4689..b64e3a9 100644
+--- a/rpmdb/DB_CONFIG.in
++++ b/rpmdb/DB_CONFIG.in
+@@ -29,7 +29,7 @@ set_thread_count	64
+ 
+ # ================ Memory Pool
+ #XXX initializing dbenv with set_cachesize has unimplemented prerequsites
+-#set_cachesize		0 1048576 0 
++set_cachesize		0 1048576 0 
+ set_mp_mmapsize		268435456
+ 
+ # ================ Locking
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.0.bb b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
index 122d3a9..aae59ec 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
@@ -45,12 +45,13 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
 DEPENDS = "bzip2 zlib db openssl elfutils expat libpcre attr acl popt ${extrarpmdeps}"
 extrarpmdeps = "python perl"
 extrarpmdeps_virtclass-native = "file-native"
-PR = "r27"
+PR = "r28"
 
 # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
 # in order to extract the distribution SRPM into a format we can extract...
 SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.0-0.20101229.src.rpm;extract=rpm-5.4.0.tar.gz \
 	   file://rpm-log-auto-rm.patch \
+	   file://rpm-db-reduce.patch \
 	   file://perfile_rpmdeps.sh \
 	   file://rpm-autogen.patch \
 	   file://rpm-libsql-fix.patch \
-- 
1.7.6.4



