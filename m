Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1PztON-0006Mg-5Z
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Mar 2011 17:16:11 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p2GGERxE027852
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 16 Mar 2011 09:14:27 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 16 Mar 2011 09:14:27 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <poky@lists.pokylinux.org>, <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Mar 2011 11:15:22 -0500
Message-ID: <886625bc863930df57c3459930ce002df4097a85.1300291424.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1300291424.git.mark.hatle@windriver.com>
References: <cover.1300291424.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 2/6] rootfs_rpm.bbclass: Add additional system configuration to RPM space
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
X-List-Received-Date: Wed, 16 Mar 2011 16:16:11 -0000
Content-Type: text/plain

The additional configuration should have been there from the beginning.  The
purpose of these config files is to have a consistent Berkeley DB configuration
even if the underlying RPM version changes -- or the RPM macros change.

This likely would not cause any problems until we attempted an upgrade of
either BDB or RPM.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/rootfs_rpm.bbclass |   26 ++++++++++++++++++++++++++
 1 files changed, 26 insertions(+), 0 deletions(-)

diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index caafbdc..04ccabd 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -46,6 +46,32 @@ fakeroot rootfs_rpm_do_rootfs () {
 	# Setup base system configuration
 	mkdir -p ${IMAGE_ROOTFS}/etc/rpm/
 
+	mkdir -p ${IMAGE_ROOTFS}${rpmlibdir}
+	mkdir -p ${IMAGE_ROOTFS}${rpmlibdir}/log
+	cat > ${IMAGE_ROOTFS}${rpmlibdir}/DB_CONFIG << EOF
+# ================ Environment
+set_data_dir            .
+set_create_dir          .
+set_lg_dir              ./log
+set_tmp_dir             ./tmp
+
+# -- thread_count must be >= 8
+set_thread_count        64
+
+# ================ Logging
+
+# ================ Memory Pool
+set_mp_mmapsize         268435456
+
+# ================ Locking
+set_lk_max_locks        16384
+set_lk_max_lockers      16384
+set_lk_max_objects      16384
+mutex_set_max           163840
+
+# ================ Replication
+EOF
+
 	#install pacakges
 	export INSTALL_ROOTFS_RPM="${IMAGE_ROOTFS}"
 	export INSTALL_PLATFORM_RPM="${TARGET_ARCH}"
-- 
1.7.3.4



