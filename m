Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1U2Igk-0005xE-LI
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 10:50:11 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r149YM1K010173
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Feb 2013 01:34:22 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.131) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Mon, 4 Feb 2013 01:34:21 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 Feb 2013 17:34:14 +0800
Message-ID: <b3040834daa4640f588a0df302ad931966d9ac89.1359968242.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1359968242.git.hongxu.jia@windriver.com>
References: <cover.1359968242.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] populate_sdk:support incremental deb image generation
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
X-List-Received-Date: Mon, 04 Feb 2013 09:50:19 -0000
Content-Type: text/plain

When use the incremental image generation, and the type of previous image
has no change, don't remove the rootfs

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/populate_sdk_base.bbclass |   13 ++++++++++---
 meta/classes/populate_sdk_deb.bbclass  |    2 +-
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index c587af8..783682f 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -65,8 +65,15 @@ fakeroot python do_populate_sdk() {
 }
 
 fakeroot populate_sdk_image() {
-	rm -rf ${SDK_OUTPUT}
-	mkdir -p ${SDK_OUTPUT}
+
+	# When use the incremental image generation, and the type of previous image
+	# has no change, don't remove the rootfs
+	if [ "${INC_DEB_IMAGE_GEN}" = "1" -a -d ${T}/dpkg ]; then
+		echo "NOTE: Start incremental generation"
+	else
+		rm -rf ${SDK_OUTPUT}
+		mkdir -p ${SDK_OUTPUT}
+	fi
 
 	# populate_sdk_<image> is required to construct two images:
 	#  SDK_ARCH-nativesdk - contains the cross compiler and associated tooling
@@ -90,7 +97,7 @@ fakeroot populate_sdk_image() {
 	rm -f ${SDK_OUTPUT}/${SDKPATHNATIVE}${libdir_nativesdk}/*.la
 
 	# Link the ld.so.cache file into the hosts filesystem
-	ln -s /etc/ld.so.cache ${SDK_OUTPUT}/${SDKPATHNATIVE}/etc/ld.so.cache
+	ln -snf /etc/ld.so.cache ${SDK_OUTPUT}/${SDKPATHNATIVE}/etc/ld.so.cache
 }
 
 fakeroot create_sdk_files() {
diff --git a/meta/classes/populate_sdk_deb.bbclass b/meta/classes/populate_sdk_deb.bbclass
index e1705e7b..687f63d 100644
--- a/meta/classes/populate_sdk_deb.bbclass
+++ b/meta/classes/populate_sdk_deb.bbclass
@@ -60,7 +60,7 @@ populate_sdk_deb () {
 
 	#move remainings
 	install -d ${SDK_OUTPUT}/${SDKPATHNATIVE}/var/lib/dpkg
-	mv ${SDK_OUTPUT}/var/lib/dpkg/* ${SDK_OUTPUT}/${SDKPATHNATIVE}/var/lib/dpkg
+	cp -rf ${SDK_OUTPUT}/var/lib/dpkg/* ${SDK_OUTPUT}/${SDKPATHNATIVE}/var/lib/dpkg
 	rm -rf ${SDK_OUTPUT}/var
 
 	populate_sdk_log_check populate_sdk
-- 
1.7.10.4



