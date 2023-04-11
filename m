Return-Path: <arslan_ahmad@mentor.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DB34C76196
	for <webhook@archiver.kernel.org>; Tue, 11 Apr 2023 11:25:51 +0000 (UTC)
Received: from esa1.mentor.iphmx.com (esa1.mentor.iphmx.com [68.232.129.153])
 by mx.groups.io with SMTP id smtpd.web10.11000.1681212343987175592
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Apr 2023 04:25:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: mentor.com, ip: 68.232.129.153, mailfrom: arslan_ahmad@mentor.com)
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="2346133"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa1.mentor.iphmx.com with ESMTP; 11 Apr 2023 03:25:43 -0800
IronPort-SDR: dP6qnfhUobjzEHQLV8j6ho9Qd3pWr6TJocQCWPFLkZq+1pkHTXrBDxxpBUwKmSH5BqSgcG5zp7
 VyBI9qL+L5JpPECt849Sm1YPeaiZYqivMmuUTsp3mYEK1N2wr5paj0Zu0WaRQXakPTBf39AnQK
 8iYG3Kv0+4oH3GFu4UMbiI3kNI30OUYusX9uSPF2pFdXHJjCa5UV5BDmsl4bjlpoB0njFGTrC9
 1fTMEfBUN1ItrMaebYWDG9daG47C8Q2u/AK9NoFYpzmKVsJvFucvfSYLKKMXKNVRPmAtGeKjEJ
 0I8=
From: <arslan_ahmad@mentor.com>
To: <openembedded-core@lists.openembedded.org>
CC: Arslan Ahmad <arslan_ahmad@mentor.com>
Subject: [PATCH] kernel-fitimage: Fix the default dtb config check
Date: Tue, 11 Apr 2023 16:25:09 +0500
Message-ID: <20230411112509.1048226-1-arslan_ahmad@mentor.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-13.mgc.mentorg.com (139.181.222.13) To
 svr-ies-mbx-12.mgc.mentorg.com (139.181.222.12)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Apr 2023 11:25:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179917

From: Arslan Ahmad <arslan_ahmad@mentor.com>

The current check for default dtb image checks if the file exists and is
not empty but appends a slash to the path due to which the file is never
found. It also doesn't replace slash in filename with _ as done when
populating the DTB variable. A better way to check the existence of the
device tree would be from the list of DTBs since this is used during
compilation.

Signed-off-by: Arslan Ahmad <arslan_ahmad@mentor.com>
---
 meta/classes-recipe/kernel-fitimage.bbclass | 36 +++++++++++++++------
 1 file changed, 26 insertions(+), 10 deletions(-)

diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-recipe/kernel-fitimage.bbclass
index b77747404f..6684478c33 100644
--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ b/meta/classes-recipe/kernel-fitimage.bbclass
@@ -388,6 +388,7 @@ symlink_points_below() {
 # $5 ... u-boot script ID
 # $6 ... config ID
 # $7 ... default flag
+# $8 ... default DTB image name
 fitimage_emit_section_config() {
 
 	conf_csum="${FIT_HASH_ALG}"
@@ -404,6 +405,7 @@ fitimage_emit_section_config() {
 	bootscr_id="$5"
 	config_id="$6"
 	default_flag="$7"
+	default_dtb_image="$8"
 
 	# Test if we have any DTBs at all
 	sep=""
@@ -415,7 +417,6 @@ fitimage_emit_section_config() {
 	bootscr_line=""
 	setup_line=""
 	default_line=""
-	default_dtb_image="${FIT_CONF_DEFAULT_DTB}"
 
 	dtb_image_sect=$(symlink_points_below $dtb_image "${EXTERNAL_KERNEL_DEVICETREE}")
 	if [ -z "$dtb_image_sect" ]; then
@@ -469,11 +470,7 @@ fitimage_emit_section_config() {
 		        # Select default node as user specified dtb when
 		        # multiple dtb exists.
 		        if [ -n "$default_dtb_image" ]; then
-			        if [ -s "${EXTERNAL_KERNEL_DEVICETREE}/$default_dtb_image" ]; then
-			                default_line="default = \"${FIT_CONF_PREFIX}$default_dtb_image\";"
-			        else
-			                bbwarn "Couldn't find a valid user specified dtb in ${EXTERNAL_KERNEL_DEVICETREE}/$default_dtb_image"
-			        fi
+			        default_line="default = \"${FIT_CONF_PREFIX}$default_dtb_image\";"
 		        else
 			        default_line="default = \"${FIT_CONF_PREFIX}$dtb_image\";"
 		        fi
@@ -555,7 +552,8 @@ fitimage_assemble() {
 	ramdiskcount=$3
 	setupcount=""
 	bootscr_id=""
-	rm -f $1 ${KERNEL_OUTPUT_DIR}/$2
+	default_dtb_image=""
+	rm -f $1 arch/${ARCH}/boot/$2
 
 	if [ -n "${UBOOT_SIGN_IMG_KEYNAME}" -a "${UBOOT_SIGN_KEYNAME}" = "${UBOOT_SIGN_IMG_KEYNAME}" ]; then
 		bbfatal "Keys used to sign images and configuration nodes must be different."
@@ -593,6 +591,13 @@ fitimage_assemble() {
 				DTB_PATH="${KERNEL_OUTPUT_DIR}/$DTB"
 			fi
 
+			# Set the default dtb image if it exists in the devicetree.
+			if [ ${FIT_CONF_DEFAULT_DTB} = $DTB ];then
+				default_dtb_image=$(echo "$DTB" | tr '/' '_')
+			fi
+
+			DTB=$(echo "$DTB" | tr '/' '_')
+
 			# Skip DTB if we've picked it up previously
 			echo "$DTBS" | tr ' ' '\n' | grep -xq "$DTB" && continue
 
@@ -606,6 +611,13 @@ fitimage_assemble() {
 		dtbcount=1
 		for DTB in $(find "${EXTERNAL_KERNEL_DEVICETREE}" -name '*.dtb' -printf '%P\n' | sort) \
 		$(find "${EXTERNAL_KERNEL_DEVICETREE}" -name '*.dtbo' -printf '%P\n' | sort); do
+			# Set the default dtb image if it exists in the devicetree.
+			if [ ${FIT_CONF_DEFAULT_DTB} = $DTB ];then
+				default_dtb_image=$(echo "$DTB" | tr '/' '_')
+			fi
+
+			DTB=$(echo "$DTB" | tr '/' '_')
+
 			# Skip DTB/DTBO if we've picked it up previously
 			echo "$DTBS" | tr ' ' '\n' | grep -xq "$DTB" && continue
 
@@ -619,6 +631,10 @@ fitimage_assemble() {
 		done
 	fi
 
+	if [ -n "${FIT_CONF_DEFAULT_DTB}" ] && [ -z $default_dtb_image ]; then 
+		bbwarn "${FIT_CONF_DEFAULT_DTB} is not available in the list of device trees."
+	fi
+
 	#
 	# Step 3: Prepare a u-boot script section
 	#
@@ -691,15 +707,15 @@ fitimage_assemble() {
 		for DTB in ${DTBS}; do
 			dtb_ext=${DTB##*.}
 			if [ "$dtb_ext" = "dtbo" ]; then
-				fitimage_emit_section_config $1 "" "$DTB" "" "$bootscr_id" "" "`expr $i = $dtbcount`"
+				fitimage_emit_section_config $1 "" "$DTB" "" "$bootscr_id" "" "`expr $i = $dtbcount`" "$default_dtb_image"
 			else
-				fitimage_emit_section_config $1 $kernelcount "$DTB" "$ramdiskcount" "$bootscr_id" "$setupcount" "`expr $i = $dtbcount`"
+				fitimage_emit_section_config $1 $kernelcount "$DTB" "$ramdiskcount" "$bootscr_id" "$setupcount" "`expr $i = $dtbcount`" "$default_dtb_image"
 			fi
 			i=`expr $i + 1`
 		done
 	else
 		defaultconfigcount=1
-		fitimage_emit_section_config $1 $kernelcount "" "$ramdiskcount" "$bootscr_id"  "$setupcount" $defaultconfigcount
+		fitimage_emit_section_config $1 $kernelcount "" "$ramdiskcount" "$bootscr_id"  "$setupcount" $defaultconfigcount "$default_dtb_image"
 	fi
 
 	fitimage_emit_section_maint $1 sectend
-- 
2.40.0


