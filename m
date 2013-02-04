Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1U2Igj-0005xA-6O
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 10:50:10 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r149YKvX010161
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Feb 2013 01:34:20 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.131) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Mon, 4 Feb 2013 01:34:20 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 Feb 2013 17:34:13 +0800
Message-ID: <732ebfb266b8f815cc29d12347aac3cbc924c6bb.1359968242.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1359968242.git.hongxu.jia@windriver.com>
References: <cover.1359968242.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/5] image.bbclass:support incremental deb image generation
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Feb 2013 09:50:11 -0000
Content-Type: text/plain

When use the incremental image generation, and the type of previous image
has no change, don't remove the rootfs

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/image.bbclass |   37 +++++++++++++++++++++++++++++--------
 1 file changed, 29 insertions(+), 8 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 9b4dec8..b607f90 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -203,16 +203,37 @@ run_intercept_scriptlets () {
 
 fakeroot do_rootfs () {
 	#set -x
-	# When use the rpm incremental image generation, don't remove the rootfs
-	if [ "${INC_RPM_IMAGE_GEN}" != "1" -o "${IMAGE_PKGTYPE}" != "rpm" ]; then
-		rm -rf ${IMAGE_ROOTFS}
-	elif [ -d ${T}/saved_rpmlib/var/lib/rpm ]; then
-		# Move the rpmlib back
-		if [ ! -d ${IMAGE_ROOTFS}/var/lib/rpm ]; then
-			mkdir -p ${IMAGE_ROOTFS}/var/lib/
-			mv ${T}/saved_rpmlib/var/lib/rpm ${IMAGE_ROOTFS}/var/lib/
+	local is_remove_rootfs=1
+
+	# When use the incremental image generation, and the type
+	# of previous image has no change, don't remove the rootfs
+	if [ "${INC_RPM_IMAGE_GEN}" = "1" ]; then
+		if [ "${IMAGE_PKGTYPE}" = "rpm"	]; then
+			if [ -d ${T}/saved_rpmlib/var/lib/rpm ]; then
+				is_remove_rootfs=0
+				echo "NOTE: Start rpm incremental image generation"
+
+				# Move the rpmlib back
+				if [ ! -d ${IMAGE_ROOTFS}/var/lib/rpm ]; then
+					mkdir -p ${IMAGE_ROOTFS}/var/lib/
+					mv ${T}/saved_rpmlib/var/lib/rpm ${IMAGE_ROOTFS}/var/lib/
+				fi
+			fi
+		fi
+	elif [ "${INC_DEB_IMAGE_GEN}" = "1" ]; then
+		if [ "${IMAGE_PKGTYPE}" = "deb" ]; then
+			if [ -e ${IMAGE_ROOTFS}/var/lib/dpkg/status ]; then
+				is_remove_rootfs=0
+				echo "NOTE: Start deb incremental image generation"
+			fi
 		fi
 	fi
+
+	if [ $is_remove_rootfs -eq 1 ]; then
+		rm -rf ${IMAGE_ROOTFS}
+		rm -rf ${T}/saved_rpmlib
+	fi
+
 	rm -rf ${MULTILIB_TEMP_ROOTFS}
 	mkdir -p ${IMAGE_ROOTFS}
 	mkdir -p ${DEPLOY_DIR_IMAGE}
-- 
1.7.10.4



