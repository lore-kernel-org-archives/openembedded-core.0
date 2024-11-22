Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93F0FD75E5F
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 15:03:36 +0000 (UTC)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
 by mx.groups.io with SMTP id smtpd.web10.26127.1732287602038001582
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Nov 2024 07:00:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ENTEuwMb;
 spf=pass (domain: gmail.com, ip: 209.85.166.45, mailfrom: majortomtosourcecontrol@gmail.com)
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-83ac817aac3so79537239f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 07:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732287601; x=1732892401; darn=lists.openembedded.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SebHcAQpo1Isk+nYek+WUObHYHb01upbpNDgq8Qhe8w=;
        b=ENTEuwMbG6nhj0GUUVy92nDgNOq3a89S0Itvfnx44TWTcB57LZ0krKOenJ+cs7z5O0
         rgJW5hwC8POvo0TEtPzDqoGWJzkn/EmpfN0skX8r7um5oL8RpgjRrp09wNffFd0bro4Y
         8nKb26JCs4tztItol+FZNvaLafiwWlBagg+L8AzfC8JodH10YvPMj+xRXMZL8/ZTJkv9
         6hyB0qmsiEJPN/+mjqGcgPeRKjEXgf1jt6oByk6RFjfCFCxK4ySYiJ87pKhCPcW5igyb
         pisN7nl9u44n9+xnua0rm8O9tumx0vzjtS7lPXnXmtoJtdJnQ0EbnuN7X2vtfhY3z2dZ
         kiqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732287601; x=1732892401;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SebHcAQpo1Isk+nYek+WUObHYHb01upbpNDgq8Qhe8w=;
        b=p5ceHYpn9BcRG94s+BAAfUjcg7zSG0Eg77dHLL83YC02h/7vrcCfO8oCEX6wG41nwW
         CYSvUoNC0G2rZZi4Ksspgmw0UqfkO/XMevWks9YgrxBR7aFMwGoTlgrbH6g8wUh3w4Wd
         r43HlbzQp1etn5m8IiJ+5C3zcQ6wjiPu12dB+un/BTvB48KbUGzpRjKTiP4b89K+9eMs
         UFVAHD7MK7MDcAk9EwfmzbjGLpXfL28T5Q45SUQ4hw1ycf25byCRLnGn9yvYn2At54Sn
         kVWz9HfuLYE4wU3ChA5xoKYYhTLbLZI2hwphZiSC3sQSZdQuFFwHmnuQZSTkHWpA1yrl
         gSvQ==
X-Gm-Message-State: AOJu0YyApMJylI1sY+cGQOqip3WFH4l1wzd/9ilwyiu5zKDgobihcxkp
	bhcACz/nNxzBL6AH013W+VXiWyQvxylgVvwWAY5XWo55jW7Ka/lULhtDcw==
X-Gm-Gg: ASbGnctzyjTVl3D05ijoUPsQnTCY8ywaYIlTEbIbv6pcRY+Edll1iz/GRZ7VPeymHV9
	I7odjv14w31BvYWW+0YAkl59rrsmj1oNMA9BS+HMZVviYJr6vntGJIdP5u5TlhezQ9rRMzvcf+I
	bfuB05jJpxi9lVrk+h9FUyxaf6VLF4ZaMHH2y3F8JwC4J4mOv6LN7fIZbDBgX5ejUp0164h2eOV
	7clIbD0coNbldKvCP1CipZlAXh0kRcxlavWMD/urSZFU7QKy9g5Hw7m2JXKcXigAjgJwnJ7skQM
	1VnwsvS8S6ajkr0kQUWMV0jJQLI=
X-Google-Smtp-Source: AGHT+IH7P1104S0Ze0b3AzrSOgPVJQQTCH16IhyiP5Y5cs72jczrtXlPdplGrcqWeN7sxs/fmwEvJA==
X-Received: by 2002:a05:6602:6c15:b0:83b:2da6:239a with SMTP id ca18e2360f4ac-83ecdd290f5mr291549039f.15.1732287601096;
        Fri, 22 Nov 2024 07:00:01 -0800 (PST)
Received: from [172.26.252.3] (174-29-210-206.hlrn.qwest.net. [174.29.210.206])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e1e1524f56sm129606173.57.2024.11.22.07.00.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2024 07:00:00 -0800 (PST)
Message-ID: <c881ce7a-be09-4190-b209-e4de5b55ff4e@gmail.com>
Date: Fri, 22 Nov 2024 08:00:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: openembedded-core@lists.openembedded.org
Cc: sean.anderson@seco.com, alexandre.belloni@bootlin.com, al.kochet@gmail.com
From: Clayton Casciato <majortomtosourcecontrol@gmail.com>
Subject: [PATCH] uboot-sign: fix U-Boot binary with public key
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 15:03:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207623

Fixes [YOCTO #15649]

The U-Boot binary in the "deploy" directory is missing the public key
when the removed logic branch is used.

The simple concatenation of the binary and DTB with public key works as
expected on a BeagleBone Black.

Given:
MACHINE = beaglebone-yocto
UBOOT_SIGN_KEYNAME = "dev"

Post-patch (poky/build/tmp/deploy/images/beaglebone-yocto):
$ hexdump -e "16 \"%_p\" \"\\n\"" u-boot-beaglebone-yocto.dtb \
| tr -d '\n' | grep -o 'key-dev'
key-dev

$ hexdump -e "16 \"%_p\" \"\\n\"" u-boot.img \
| tr -d '\n' | grep -o 'key-dev'
key-dev

Non-Poky BeagleBone Black testing (Scarthgap):
U-Boot 2024.01 [...]
[...]
Using 'conf-ti_omap_am335x-boneblack.dtb' configuration
Verifying Hash Integrity ... sha256,rsa4096:dev+ OK
Trying 'kernel-1' kernel subimage
[...]

Signed-off-by: Clayton Casciato <majortomtosourcecontrol@gmail.com>
---
Sponsor: 21SoftWare LLC

 meta/classes-recipe/uboot-sign.bbclass | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/uboot-sign.bbclass
index a17be745ce..7ee73b872a 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -122,13 +122,7 @@ concat_dtb() {
 	# If we're not using a signed u-boot fit, concatenate SPL w/o DTB & U-Boot DTB
 	# with public key (otherwise U-Boot will be packaged by uboot_fitimage_assemble)
 	if [ "${SPL_SIGN_ENABLE}" != "1" ] ; then
-		if [ "x${UBOOT_SUFFIX}" = "ximg" -o "x${UBOOT_SUFFIX}" = "xrom" ] && \
-			[ -e "${UBOOT_DTB_BINARY}" ]; then
-			oe_runmake EXT_DTB="${UBOOT_DTB_SIGNED}" ${UBOOT_MAKE_TARGET}
-			if [ -n "${binary}" ]; then
-				cp ${binary} ${UBOOT_BINARYNAME}-${type}.${UBOOT_SUFFIX}
-			fi
-		elif [ -e "${UBOOT_NODTB_BINARY}" -a -e "${UBOOT_DTB_BINARY}" ]; then
+		if [ -e "${UBOOT_NODTB_BINARY}" -a -e "${UBOOT_DTB_BINARY}" ]; then
 			if [ -n "${binary}" ]; then
 				cat ${UBOOT_NODTB_BINARY} ${UBOOT_DTB_SIGNED} | tee ${binary} > \
 					${UBOOT_BINARYNAME}-${type}.${UBOOT_SUFFIX}
-- 
2.34.1

