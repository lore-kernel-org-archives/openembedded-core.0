Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE0BCC7EE26
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 15:21:04 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.30349.1683300058593247463
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 08:20:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=uz+zsBRQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-643557840e4so2193606b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 08:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683300058; x=1685892058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O3XPHuz+LqEv2qht/5+bWocBXmdLc2sMyGSPmCKem0E=;
        b=uz+zsBRQ8vbJY4hKhdB/GnXMCKcG4nKb6fB9WVqYOVQvDWORCTn4dMn6r5/NiAm4Vg
         OwuT1IoKT+x5i83FynH3YGdCMEtfzayfW1mfCfK46c6ejb8zlFsOQqwZKnFcMXhvIaak
         uTR0zlk9ojtQR4R2nf86k3NLRrj4US4DXjJo06i5gQ8NRKP0dQNQHMH7TaIVUuMuw5lf
         vkEPOfwbrEN/vhj2sAR8mBLMP134dQqg7w25ni8H2QM6FrGY7A+vPut8yK3aUQp5uN/q
         Eo0LfY3OXY4IBRY+jVY8WBn2MGEbh+XzuA/px/6ADJg0dGZXJhrqnVehz+jSYENvDYq5
         VMQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683300058; x=1685892058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O3XPHuz+LqEv2qht/5+bWocBXmdLc2sMyGSPmCKem0E=;
        b=AVvK9lHMX+5Xuc/VN5azYYQiWEhz/Hi4tCEMXnoqK6k1/hzPD0irTttYbr/9kWn/ko
         Qaj+fRsPADrLft9JXanersy5vQn359fTJ1cQI2vs+9U+EBQwUeq+LMI/PO8AGYL1TYLv
         Zj1n/BRdr/OaERA4588Poa2qeXAxpI1hOKXpuaJQGux+Mi+3mgEvuZRD9THyYPwHNAma
         ritNnEOFBiSxRq0vBFfb1Wqs30Itr5Ie7b3Sfja0wq+MjBvqsacZJ7u9m2XbgZI3Nvo4
         Z5/EYRSTkPzpppnjjzHZ9b+ISrEKaKfG0Bk4Cc8nRmT02y8PJt7tQR/k/Uz8fYWM/ghr
         djPg==
X-Gm-Message-State: AC+VfDymPjlX3nXL+0fBBV+BgkFdEHwuvEX2MS72CwOuOoHtQ9lWsz4b
	V5r0V4HbulUHGjuIFK0pIyMf+Poqe7FhEglIrRI=
X-Google-Smtp-Source: ACHHUZ7aLodt5aVSBE+l3ItFtWn8jZ4GUZshl/Wq5t/qV0XnpGGSJduXBtS79idYXYJrxdUFf1/QaA==
X-Received: by 2002:a05:6a00:10ce:b0:63d:24e4:f9c with SMTP id d14-20020a056a0010ce00b0063d24e40f9cmr2907762pfu.17.1683300057608;
        Fri, 05 May 2023 08:20:57 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c11-20020aa78c0b000000b00643864d03dfsm1831591pfd.171.2023.05.05.08.20.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 08:20:57 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 27/35] kernel-fitimage: Fix the default dtb config check
Date: Fri,  5 May 2023 05:19:38 -1000
Message-Id: <f8efe7d50860e44cd22a91685d0438c5c73d8557.1683299764.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1683299764.git.steve@sakoman.com>
References: <cover.1683299764.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 15:21:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180947

From: Arslan Ahmad <arslan_ahmad@mentor.com>

The current check for default dtb image checks if the file exists and is
not empty but appends a slash to the path due to which the file is never
found. It also doesn't replace slash in filename with _ as done when
populating the DTB variable. A better way to check the existence of the
device tree would be from the list of DTBs since this is used during
compilation.

Signed-off-by: Arslan Ahmad <arslan_ahmad@mentor.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit e8e31e11b158837804d029e85f5f8ed3c219a4ea)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


