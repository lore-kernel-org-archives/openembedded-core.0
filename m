Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32506C3DA6B
	for <webhook@archiver.kernel.org>; Sat, 27 Aug 2022 18:26:44 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web09.51800.1661624794124135801
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 11:26:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=xFwdVxQt;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id q9so4221539pgq.6
        for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 11:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=iCqYTSPOICIqjztsinEtMkr75O6C4HZT9VLsA4Br/2o=;
        b=xFwdVxQtJaLd3AvnCMEPKcCYSiz53pbsqLSzi07X8MG9iIgenoyMXUKuw/tPStOHTE
         BorXj/QMvCDzgIU1ADgD5nvGo07vuPU76bB2phcJzndiy564k1aUNNVEq2Fy/3tluR9N
         nbseo3GGrtITMMUuCC1SCS9j3n8qNeCrBoYF24uh9AUFsaq1UpQzvHUEPd2wYwylGxr9
         QTRwdpVzAMy9z5UuBFHqnSI6qWZv+U9h6IT5+NmEZWcvFeimov6VYE77x6OLATc3urY1
         pzshkDByTBiLrUJ2yw1CwXKmEl2a179r6LwqrGVyfU2UHHGs8NdZlahP4lqRS+vglQSL
         qk5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=iCqYTSPOICIqjztsinEtMkr75O6C4HZT9VLsA4Br/2o=;
        b=7qMaAfkndMAU+500cEX1R2B1TvcgpLlBjB5uiDn0SOl4yZc0865AIVEvYULhiJjlbz
         Q1Iy/9HIhoiaRxsJ6Q/D5Z/yx+1/+gZ6GKko8BfEDUTrEM8cYh8m07ym2rvwTea9xtC2
         ZYtYICnet8bfr6ciSfrFCziwp1+h2wSDWffSF8PxbP0uCMEWNXp+Qp2dUWBQ9hafws5N
         e9RuEr9hW1ceLPYUFo4xh1kPXsOpD7ttM520Sthx+72EqEEsC5LGgzjt+HCzTYcxttUW
         +V2DQd2eNHAQFQcVPadxiLgocB4LZqikB9lerW3RwSf8khE6tbwc3mIP/OrJqtbiziiY
         9CPA==
X-Gm-Message-State: ACgBeo3diI0AbgEtuBMQ2MRqc7JB0ei0p1mMQ0emrwm5KcHsq9wG/Wxz
	6ETTTmaE+0QwSQXMVGqOdEbbdoOlfIpwv98B
X-Google-Smtp-Source: 
 AA6agR7yL3SDt89ZCqD6sKUTZISpomBkf1ThVMJOhf48bmTIhVv70EmlzIccwjMy/eH5Q8G5O3O6Cg==
X-Received: by 2002:a05:6a00:886:b0:537:5a57:4760 with SMTP id
 q6-20020a056a00088600b005375a574760mr9275056pfj.21.1661624793083;
        Sat, 27 Aug 2022 11:26:33 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 r21-20020a170902ea5500b001708c4ebbaesm3864716plg.309.2022.08.27.11.26.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Aug 2022 11:26:32 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/24] kernel-fitimage.bbclass: only package
 unique DTBs
Date: Sat, 27 Aug 2022 08:25:38 -1000
Message-Id: 
 <c4dd5a4e606b7c8a16e31c0c0878d77fcd317961.1661624569.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661624569.git.steve@sakoman.com>
References: <cover.1661624569.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Aug 2022 18:26:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169955

From: Awais Belal <Awais_Belal@mentor.com>

The KERNEL_DEVICETREE and related variables could potentially have a device
tree listed multiple times and this works okay for most scenarios. However,
when we create FIT entries for these we get duplicate nodes and uboot-mkimage
fails with

fit-image-initramfs-image.its:219.58-229.19: ERROR (duplicate_node_names): /images/fdt-freescale_imx8mp-evk-ecspi-slave.dtb: Duplicate node name
fit-image-initramfs-image.its:307.50-317.19: ERROR (duplicate_node_names): /images/fdt-freescale_imx8mp-evk-ndm.dtb: Duplicate node name
fit-image-initramfs-image.its:362.54-372.19: ERROR (duplicate_node_names): /images/fdt-freescale_imx8mp-evk-rm67199.dtb: Duplicate node name
fit-image-initramfs-image.its:417.56-427.19: ERROR (duplicate_node_names): /images/fdt-freescale_imx8mp-evk-usdhc1-m2.dtb: Duplicate node name
fit-image-initramfs-image.its:648.59-658.19: ERROR (duplicate_node_names): /configurations/conf-freescale_imx8mp-evk-ecspi-slave.dtb: Duplicate node name
fit-image-initramfs-image.its:744.51-754.19: ERROR (duplicate_node_names): /configurations/conf-freescale_imx8mp-evk-ndm.dtb: Duplicate node name
fit-image-initramfs-image.its:804.55-814.19: ERROR (duplicate_node_names): /configurations/conf-freescale_imx8mp-evk-rm67199.dtb: Duplicate node name
fit-image-initramfs-image.its:864.57-874.19: ERROR (duplicate_node_names): /configurations/conf-freescale_imx8mp-evk-usdhc1-m2.dtb: Duplicate node name
ERROR: Input tree has errors, aborting (use -f to force output)
uboot-mkimage: Can't open arch/arm64/boot/fitImage.tmp: No such file or directory

We fix this by tracking the DTBs we're compiling in the FIT and only picking
up unique ones.

Signed-off-by: Awais Belal <awais_belal@mentor.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 98acfea1e82a90c920bdd636033f930ac034b318)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel-fitimage.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 7e09b075ff..56d71ba8fa 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -527,6 +527,10 @@ fitimage_assemble() {
 			fi
 
 			DTB=$(echo "$DTB" | tr '/' '_')
+
+			# Skip DTB if we've picked it up previously
+			echo "$DTBS" | tr ' ' '\n' | grep -xq "$DTB" && continue
+
 			DTBS="$DTBS $DTB"
 			fitimage_emit_section_dtb $1 $DTB $DTB_PATH
 		done
@@ -536,6 +540,10 @@ fitimage_assemble() {
 		dtbcount=1
 		for DTB in $(find "${EXTERNAL_KERNEL_DEVICETREE}" \( -name '*.dtb' -o -name '*.dtbo' \) -printf '%P\n' | sort); do
 			DTB=$(echo "$DTB" | tr '/' '_')
+
+			# Skip DTB if we've picked it up previously
+			echo "$DTBS" | tr ' ' '\n' | grep -xq "$DTB" && continue
+
 			DTBS="$DTBS $DTB"
 			fitimage_emit_section_dtb $1 $DTB "${EXTERNAL_KERNEL_DEVICETREE}/$DTB"
 		done
-- 
2.25.1


