Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C8B366A836
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2013 06:53:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r566rZxu010014
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Jun 2013 23:53:35 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.146) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Wed, 5 Jun 2013 23:53:33 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 6 Jun 2013 14:53:29 +0800
Message-ID: <e9e88f4e13f37f75c0af8d7a039a7642ce3f0d6f.1370500080.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1370500080.git.hongxu.jia@windriver.com>
References: <cover.1370500080.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] ddimage: fix incompatibility with dash
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
X-List-Received-Date: Thu, 06 Jun 2013 06:53:34 -0000
Content-Type: text/plain

On systems with dash as /bin/sh there were failures while invoking ddimage.
Fix to let it work with both bash and dash shells.

[YOCTO #4617]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 scripts/contrib/ddimage |   16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/scripts/contrib/ddimage b/scripts/contrib/ddimage
index 956699c..ab1d4c7 100755
--- a/scripts/contrib/ddimage
+++ b/scripts/contrib/ddimage
@@ -6,11 +6,11 @@ BLACKLIST_DEVICES="/dev/sda"
 # 1MB blocksize
 BLOCKSIZE=1048576
 
-function usage() {
+usage() {
 	echo "Usage: $(basename $0) IMAGE DEVICE"
 }
 
-function image_details() {
+image_details() {
 	IMG=$1
 	echo "Image details"
 	echo "============="
@@ -21,7 +21,7 @@ function image_details() {
 	echo ""
 }
 
-function device_details() {
+device_details() {
 	DEV=$1
 	BLOCK_SIZE=512
 
@@ -61,10 +61,12 @@ if [ ! -e "$IMAGE" ]; then
 fi
 
 
-if [ "${BLACKLIST_DEVICES/${DEVICE}/ERROR}" != "$BLACKLIST_DEVICES" ]; then
-	echo "ERROR: Device $DEVICE is blacklisted"
-	exit 1
-fi
+for i in ${BLACKLIST_DEVICES}; do
+	if [ "$i" = "$DEVICE" ]; then
+		echo "ERROR: Device $DEVICE is blacklisted"
+		exit 1
+	fi
+done
 
 if [ ! -w "$DEVICE" ]; then
 	echo "ERROR: Device $DEVICE does not exist or is not writable"
-- 
1.7.10.4


