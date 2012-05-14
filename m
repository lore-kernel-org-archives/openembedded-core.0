Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1STqZh-0005pU-BC
	for openembedded-core@lists.openembedded.org;
	Mon, 14 May 2012 10:24:17 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q4E8EEOW029819
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 May 2012 01:14:14 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Mon, 14 May 2012 01:14:13 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 14 May 2012 16:11:34 +0800
Message-ID: <b82a9a6f0dd12135e53eedc75b0833ce7dfb3eab.1336983006.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1336983006.git.liezhi.yang@windriver.com>
References: <cover.1336983006.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 2/2] rootfs_rpm.bbclass: save rpmlib rather than remove it
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
X-List-Received-Date: Mon, 14 May 2012 08:24:18 -0000
Content-Type: text/plain

The rpmlib was removed when core-image-minimal, which would make the
increment rpm image generation doesn't work in the second build, since
list_installed_packages would get incorrect value in the second build,
move the rpmlib to ${T} rather than remove it, and move it back when
INC_RPM_IMAGE_GEN =1.

[YOCTO #2440]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/image.bbclass      |    6 ++++++
 meta/classes/rootfs_rpm.bbclass |    6 +++++-
 2 files changed, 11 insertions(+), 1 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 4610731..b5fca32 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -142,6 +142,12 @@ fakeroot do_rootfs () {
     # When use the rpm incremental image generation, don't remove the rootfs
     if [ "${INC_RPM_IMAGE_GEN}" != "1" -o "${IMAGE_PKGTYPE}" != "rpm" ]; then
         rm -rf ${IMAGE_ROOTFS}
+    elif [ -d ${T}/saved_rpmlib/var/lib/rpm ]; then
+        # Move the rpmlib back
+        if [ ! -d ${IMAGE_ROOTFS}/var/lib/rpm ]; then
+                mkdir -p ${IMAGE_ROOTFS}/var/lib/
+                mv ${T}/saved_rpmlib/var/lib/rpm ${IMAGE_ROOTFS}/var/lib/
+        fi
     fi
 	rm -rf ${MULTILIB_TEMP_ROOTFS}
 	mkdir -p ${IMAGE_ROOTFS}
diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index 9039b21..fbc46c0 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -154,7 +154,11 @@ EOF
 }
 
 remove_packaging_data_files() {
-	rm -rf ${IMAGE_ROOTFS}${rpmlibdir}
+	# Save the rpmlib for increment rpm image generation
+	t="${T}/saved_rpmlib/var/lib"
+	rm -fr $t
+	mkdir -p $t
+	mv ${IMAGE_ROOTFS}${rpmlibdir} $t
 	rm -rf ${IMAGE_ROOTFS}${opkglibdir}
 }
 
-- 
1.7.1



