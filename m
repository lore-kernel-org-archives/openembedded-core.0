Return-Path: <arslan_ahmad@mentor.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7246CC6FD18
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 06:17:26 +0000 (UTC)
Received: from esa3.mentor.iphmx.com (esa3.mentor.iphmx.com [68.232.137.180])
 by mx.groups.io with SMTP id smtpd.web11.48414.1680243445069537531
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 23:17:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: mentor.com, ip: 68.232.137.180, mailfrom: arslan_ahmad@mentor.com)
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="977619"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa3.mentor.iphmx.com with ESMTP; 30 Mar 2023 22:17:21 -0800
IronPort-SDR: gN+vknkMsrZwPqvzwoTGXIndSB2H2YiDA0TXHdAY7VfKN+0Rdn37zAhSZCIM9ZpY0qvwNTuJ9H
 oCAbzOK0/ivtW07+kmZOXIMhgmTufCgGKy0r96Xp1poX37EAtrYb9wmJNZDWEYsnQDDYS4LMJf
 PMv44VF7Looq3KnfmCX7rSN/4WoLRk3XKebi8IvjHwEfI6v0mXFY/M3EEWbwe0MReT6U8bZWpT
 wFXGRhv3baHSr79Qk/548QbYP1fdDB/IU2xmcaLCr1C8yUXLS0f4056xmLiiH/K8BQnCPcvT/U
 uFo=
From: <arslan_ahmad@mentor.com>
To: <openembedded-core@lists.openembedded.org>
CC: Arslan Ahmad <arslan_ahmad@mentor.com>
Subject: [PATCH] kernel-fitimage: Fix the default dtb config check
Date: Fri, 31 Mar 2023 11:17:04 +0500
Message-ID: <20230331061705.435976-1-arslan_ahmad@mentor.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-10.mgc.mentorg.com (139.181.222.10) To
 svr-ies-mbx-12.mgc.mentorg.com (139.181.222.12)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 06:17:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179400

From: Arslan Ahmad <arslan_ahmad@mentor.com>

The current check for default dtb image checks if the file exists and is
not empty but appends a slash to the path due to which the file is never
found. It also doesn't replace slash in filename with _ as done when
populating the DTB variable. A better way to check the existence of the
device tree would be from the list of DTBs since this is used during
compilation.

Signed-off-by: Arslan Ahmad <arslan_ahmad@mentor.com>
---
 meta/classes/kernel-fitimage.bbclass | 30 +++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 27e17db951..c75d4e071f 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -345,6 +345,7 @@ EOF
 # $5 ... u-boot script ID
 # $6 ... config ID
 # $7 ... default flag
+# $8 ... default DTB image name
 fitimage_emit_section_config() {
 
 	conf_csum="${FIT_HASH_ALG}"
@@ -361,6 +362,7 @@ fitimage_emit_section_config() {
 	bootscr_id="$5"
 	config_id="$6"
 	default_flag="$7"
+	default_dtb_image="$8"
 
 	# Test if we have any DTBs at all
 	sep=""
@@ -372,7 +374,6 @@ fitimage_emit_section_config() {
 	bootscr_line=""
 	setup_line=""
 	default_line=""
-	default_dtb_image="${FIT_CONF_DEFAULT_DTB}"
 
 	# conf node name is selected based on dtb ID if it is present,
 	# otherwise its selected based on kernel ID
@@ -418,11 +419,7 @@ fitimage_emit_section_config() {
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
@@ -504,6 +501,7 @@ fitimage_assemble() {
 	ramdiskcount=$3
 	setupcount=""
 	bootscr_id=""
+	default_dtb_image=""
 	rm -f $1 arch/${ARCH}/boot/$2
 
 	if [ -n "${UBOOT_SIGN_IMG_KEYNAME}" -a "${UBOOT_SIGN_KEYNAME}" = "${UBOOT_SIGN_IMG_KEYNAME}" ]; then
@@ -542,6 +540,11 @@ fitimage_assemble() {
 				DTB_PATH="arch/${ARCH}/boot/$DTB"
 			fi
 
+			# Set the default dtb image if it exists in the devicetree.
+			if [ ${FIT_CONF_DEFAULT_DTB} = $DTB ];then
+				default_dtb_image=$(echo "$DTB" | tr '/' '_')
+			fi
+
 			DTB=$(echo "$DTB" | tr '/' '_')
 
 			# Skip DTB if we've picked it up previously
@@ -556,6 +559,11 @@ fitimage_assemble() {
 		dtbcount=1
 		for DTB in $(find "${EXTERNAL_KERNEL_DEVICETREE}" -name '*.dtb' -printf '%P\n' | sort) \
 		$(find "${EXTERNAL_KERNEL_DEVICETREE}" -name '*.dtbo' -printf '%P\n' | sort); do
+			# Set the default dtb image if it exists in the devicetree.
+			if [ ${FIT_CONF_DEFAULT_DTB} = $DTB ];then
+				default_dtb_image=$(echo "$DTB" | tr '/' '_')
+			fi
+
 			DTB=$(echo "$DTB" | tr '/' '_')
 
 			# Skip DTB/DTBO if we've picked it up previously
@@ -566,6 +574,10 @@ fitimage_assemble() {
 		done
 	fi
 
+	if [ -n "${FIT_CONF_DEFAULT_DTB}" ] && [ -z $default_dtb_image ]; then 
+		bbwarn "${FIT_CONF_DEFAULT_DTB} is not available in the list of device trees."
+	fi
+
 	#
 	# Step 3: Prepare a u-boot script section
 	#
@@ -638,15 +650,15 @@ fitimage_assemble() {
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


