Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Se9Gc-0001fY-MG
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jun 2012 20:23:07 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q5BICWX6024034
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2012 11:12:32 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 11 Jun 2012 11:12:31 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Jun 2012 13:18:57 -0500
Message-ID: <f04f9ffc31a1ef108fbfd8c64f11cb39d7ae5773.1339438568.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1339438568.git.mark.hatle@windriver.com>
References: <cover.1339438568.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 6/9] rootfs_rpm.bbclass: Update database configuration file
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
X-List-Received-Date: Mon, 11 Jun 2012 18:23:07 -0000
Content-Type: text/plain

Move the creation of the database configuration files to just before we
perform the install actions.  This ensures they will exist even in SDK or
other non-target filesystem images.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/package_rpm.bbclass |   32 ++++++++++++++++++++++++++++++++
 meta/classes/rootfs_rpm.bbclass  |   31 -------------------------------
 2 files changed, 32 insertions(+), 31 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 097fa12..b84c044 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -454,6 +454,38 @@ EOF
 
 	chmod 0755 ${WORKDIR}/scriptlet_wrapper
 
+	# Configure RPM... we enforce these settings!
+	mkdir -p ${target_rootfs}${rpmlibdir}
+	mkdir -p ${target_rootfs}${rpmlibdir}/log
+	# After change the __db.* cache size, log file will not be generated automatically,
+	# that will raise some warnings, so touch a bare log for rpm write into it.
+	touch ${target_rootfs}${rpmlibdir}/log/log.0000000001
+	cat > ${target_rootfs}${rpmlibdir}/DB_CONFIG << EOF
+# ================ Environment
+set_data_dir .
+set_create_dir .
+set_lg_dir ./log
+set_tmp_dir ./tmp
+set_flags db_log_autoremove on
+
+# -- thread_count must be >= 8
+set_thread_count 64
+
+# ================ Logging
+
+# ================ Memory Pool
+set_cachesize 0 1048576 0
+set_mp_mmapsize 268435456
+
+# ================ Locking
+set_lk_max_locks 16384
+set_lk_max_lockers 16384
+set_lk_max_objects 16384
+mutex_set_max 163840
+
+# ================ Replication
+EOF
+
 	# RPM is special. It can't handle dependencies and preinstall scripts correctly. Its
 	# probably a feature. The only way to convince rpm to actually run the preinstall scripts 
 	# for base-passwd and shadow first before installing packages that depend on these packages 
diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index eafb34b..202f9ce 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -59,37 +59,6 @@ fakeroot rootfs_rpm_do_rootfs () {
 	# Setup base system configuration
 	mkdir -p ${INSTALL_ROOTFS_RPM}/etc/rpm/
 
-	mkdir -p ${INSTALL_ROOTFS_RPM}${rpmlibdir}
-	mkdir -p ${INSTALL_ROOTFS_RPM}${rpmlibdir}/log
-	# After change the __db.* cache size, log file will not be generated automatically,
-	# that will raise some warnings, so touch a bare log for rpm write into it.
-	touch ${INSTALL_ROOTFS_RPM}${rpmlibdir}/log/log.0000000001
-	cat > ${INSTALL_ROOTFS_RPM}${rpmlibdir}/DB_CONFIG << EOF
-# ================ Environment
-set_data_dir .
-set_create_dir .
-set_lg_dir ./log
-set_tmp_dir ./tmp
-set_flags db_log_autoremove on
-
-# -- thread_count must be >= 8
-set_thread_count 64
-
-# ================ Logging
-
-# ================ Memory Pool
-set_cachesize 0 1048576 0
-set_mp_mmapsize 268435456
-
-# ================ Locking
-set_lk_max_locks 16384
-set_lk_max_lockers 16384
-set_lk_max_objects 16384
-mutex_set_max 163840
-
-# ================ Replication
-EOF
-
 	# List must be prefered to least preferred order
 	INSTALL_PLATFORM_EXTRA_RPM=""
 	for each_arch in ${MULTILIB_PACKAGE_ARCHS} ${PACKAGE_ARCHS}; do
-- 
1.7.3.4



