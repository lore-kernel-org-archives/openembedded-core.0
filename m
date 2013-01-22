Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1TxZKT-0007uo-EK
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Jan 2013 09:35:55 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0M8K7nk016368
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jan 2013 00:20:07 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.131) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Tue, 22 Jan 2013 00:20:06 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Jan 2013 16:19:56 +0800
Message-ID: <c31f9be90dc2dcbb3ed15f6e080442980b013169.1358824498.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1358824498.git.hongxu.jia@windriver.com>
References: <cover.1358824498.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] image.bbclass:support incremental deb image generation
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
X-List-Received-Date: Tue, 22 Jan 2013 08:35:57 -0000
Content-Type: text/plain

When use the deb incremental image generation, and the type of previous image
is deb, don't remove the rootfs. The same rule to the rpm incremental image
generation. If neither of them, rootfs will be removed.

[YOCTO #1893]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/image.bbclass |   21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 0293d2e..5d93d59 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -203,16 +203,29 @@ run_intercept_scriptlets () {
 
 fakeroot do_rootfs () {
 	#set -x
-	# When use the rpm incremental image generation, don't remove the rootfs
-	if [ "${INC_RPM_IMAGE_GEN}" != "1" -o "${IMAGE_PKGTYPE}" != "rpm" ]; then
-		rm -rf ${IMAGE_ROOTFS}
-	elif [ -d ${T}/saved_rpmlib/var/lib/rpm ]; then
+	# When use the rpm incremental image generation, and the type
+	# of previous image is rpm, don't remove the rootfs
+	if [ "${INC_RPM_IMAGE_GEN}" = "1" -a "${IMAGE_PKGTYPE}" = "rpm" \
+		-a -d ${T}/saved_rpmlib/var/lib/rpm ]; then
+
+		echo "start rpm incremental image generation"
 		# Move the rpmlib back
 		if [ ! -d ${IMAGE_ROOTFS}/var/lib/rpm ]; then
 			mkdir -p ${IMAGE_ROOTFS}/var/lib/
 			mv ${T}/saved_rpmlib/var/lib/rpm ${IMAGE_ROOTFS}/var/lib/
 		fi
+
+	# When use the deb incremental image generation, and the type
+	# of previous image is deb, don't remove the rootfs
+	elif [ "${INC_DEB_IMAGE_GEN}" = "1" -a "${IMAGE_PKGTYPE}" = "deb" \
+		-a -e ${IMAGE_ROOTFS}/var/lib/dpkg/status ]; then
+
+		echo "start deb incremental image generation"
+	else
+		rm -rf ${IMAGE_ROOTFS}
+		rm -rf ${T}/saved_rpmlib
 	fi
+
 	rm -rf ${MULTILIB_TEMP_ROOTFS}
 	mkdir -p ${IMAGE_ROOTFS}
 	mkdir -p ${DEPLOY_DIR_IMAGE}
-- 
1.7.10.4



