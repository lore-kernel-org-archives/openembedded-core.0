Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B412EEEB576
	for <webhook@archiver.kernel.org>; Thu,  1 Jan 2026 00:21:25 +0000 (UTC)
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com [209.85.217.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.95394.1767221980854050773
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Dec 2025 14:59:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@elder-tomes-com.20230601.gappssmtp.com header.s=20230601 header.b=XiSgXLpl;
 spf=pass (domain: elder-tomes.com, ip: 209.85.217.68, mailfrom: levi.shafter@elder-tomes.com)
Received: by mail-vs1-f68.google.com with SMTP id ada2fe7eead31-5e53441429fso8347620137.2
        for <openembedded-core@lists.openembedded.org>; Wed, 31 Dec 2025 14:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=elder-tomes-com.20230601.gappssmtp.com; s=20230601; t=1767221979; x=1767826779; darn=lists.openembedded.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OKbnT9wp3Horpq2acUOZNWHhfaXh/mk7mlUZ2X+dnxQ=;
        b=XiSgXLplrWSNSjKwGrqB9tcDKfitxbH7mijXZ7294AlBqFymWUAVaONME6fKwGlUWu
         YHp0qPBluszsMjfx51TQbMO15XCO176b2sMg+cyVRUm6M0H4ZbBZN3kLTMPvDOZQmXtx
         gGkNFx02WhpheP+d8rgvfdSh2ofCA4FP/va0bGhYe2BQ9Fv0MKnWDnmuSnR8NhcDQZkR
         VpuiikDja3RsBbVTI+JlJtsVFafBYNm5CS+t8L1M/OGP3eZGtu9m3GOe0IVtdsjk/naH
         MxPJx/pXfodb2GnkgFDy0YngBbem+kt1bJLrpyoGbtOGqp1OLiXAsRAr2gZ9bOsui0eQ
         lG1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767221979; x=1767826779;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OKbnT9wp3Horpq2acUOZNWHhfaXh/mk7mlUZ2X+dnxQ=;
        b=dPf28FplKc9YySSWIPTSQ7LtyYrNlXc4L8zSAiLDplnLJHFgQWh4DO6bs8M/3KP6sY
         Nh3Kg+WjUTp7Gl1c2acq6rti05b4R7MtK0zKslB+LTBWgiQ045soD79zRtbWdwvH7mW9
         pjK0rLQuOorUHAhw5P6u8C5pFyqVDluWD2ndVykWW2ZZx616mYz64097E/+F1dQ6NTmN
         R17aJT1PeIqINULFYEwXsWr4FzItBbT0UzlcTbVvqkc/FwsXcEZLxaOFje3jBLfP6ZVE
         uGmhs2oYKn429wScLS2HAeCxsAEkIQ6Uup2BP8qFtS7z9nYCnXhDDjfXzMVcWiROJzhO
         EZ7A==
X-Gm-Message-State: AOJu0YyaBDzIFpMYUWGImVYVRTZdJSfVo7I4boCPLRtloI4ivjNQBXaE
	3Va77LYSLYltDVdjfMQLhzuU9YQLwh9JZVPWbGh8TGeI4hVSCMmhxTw6W6fjNd9wQUM/Yw2qEP6
	I1GEzb9I=
X-Gm-Gg: AY/fxX6H6K+PrBGZHO8zL190bmRkM2A74KkVJXWxH541z8LRxhDu4GPAa1yLGh/BevN
	GYP/JuozD6p6rrJGjbp3IiXD66R+Df/+t3yYNlXaTMjLvRoQmxvX/brFq1OXvGR6h04kRzEEwiM
	pFI/2NQBH9+eNMbGPbPxd6iP3VBSRRf+WFpB+zetzwJJCWj7VmdHiG0a2RYEsFlNAxgdsYyNMqF
	iJydprrwbgokQJvn/GrNwrdGSG+PqbRfMmKNz3wCROVNkgv6ksmP+DnwmGCfGAUrDHc8HFo05sh
	7g8qAPzlxPeb1yUS8kcQgf52GlIrHbw+mqRr79W3gAtN8u73/OfUdrutHZhXhNvg/+aNqhJbDrH
	6IUzN1w7XvpoDqM30SK89G4bDAH85uhHio3r7cSaUV2ZIip35GLvntMq648GMouJBUzHU9cODNr
	zwycYvcWuMPJDkqxQ1vX9051PKh0cTSBgTny11rCz2F/4hFNeVcO8MDn6twOW7
X-Google-Smtp-Source: AGHT+IFnQtqAO6uLuKUuXMbnOCS0j3qbEEtJ5nIH6RvAhDqEwTlxAvopQ1uua0F9bSUI/MY9Jmmhiw==
X-Received: by 2002:a05:6820:1517:b0:65f:1296:7690 with SMTP id 006d021491bc7-65f1296776cmr85571eaf.83.1767221570779;
        Wed, 31 Dec 2025 14:52:50 -0800 (PST)
Received: from [192.168.1.8] (c-73-169-9-114.hsd1.co.comcast.net. [73.169.9.114])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-65d0f6f0e78sm22350976eaf.15.2025.12.31.14.52.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Dec 2025 14:52:50 -0800 (PST)
Message-ID: <585429b3-5763-4c61-97ae-2c73266c887d@elder-tomes.com>
Date: Wed, 31 Dec 2025 15:52:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: openembedded-core@lists.openembedded.org
From: Levi Shafter <levi.shafter@elder-tomes.com>
Subject: [PATCH] image_types.bbclass: make fsck optional
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jan 2026 00:21:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228752

The fsck in oe_mkext234fs() was added to prevent an extra reboot on the
target:

https://git.openembedded.org/openembedded-core/commit/?id=a93d0059341

This has the side effect of increasing delta between images which
prevents reproducibility. In many cases, the added security provided by
image reproducibility is worth the extra reboot upon first booting the
target. The use of fsck should be included by default, but left
configurable.

[YOCTO #16110]

Signed-off-by: Levi Shafter <levi.shafter@elder-tomes.com>
---
Sponsor: 21SoftWare LLC

 meta/classes-recipe/image_types.bbclass | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/image_types.bbclass
b/meta/classes-recipe/image_types.bbclass
index e6ef0ce11e..63dc504f8c 100644
--- a/meta/classes-recipe/image_types.bbclass
+++ b/meta/classes-recipe/image_types.bbclass
@@ -92,8 +92,14 @@ oe_mkext234fs () {
 	bbdebug 1 "Actual Partition size: `stat -c '%s'
${IMGDEPLOYDIR}/${IMAGE_NAME}.$fstype`"
 	bbdebug 1 Executing "mkfs.$fstype -F $extra_imagecmd
${IMGDEPLOYDIR}/${IMAGE_NAME}.$fstype -d ${IMAGE_ROOTFS}"
 	mkfs.$fstype -F $extra_imagecmd ${IMGDEPLOYDIR}/${IMAGE_NAME}.$fstype
-d ${IMAGE_ROOTFS}
-	# Error codes 0-3 indicate successfull operation of fsck (no errors or
errors corrected)
-	fsck.$fstype -pvfD ${IMGDEPLOYDIR}/${IMAGE_NAME}.$fstype || [ $? -le 3 ]
+
+	if [ '${RUN_FSCK}' = "0" ]; then
+		bbdebug 1 "Skipping fsck for reduced image delta"
+	else
+		bbdebug 1 "Running fsck on image"
+		# Error codes 0-3 indicate successful operation of fsck (no errors or
errors corrected)
+		fsck.$fstype -pvfD ${IMGDEPLOYDIR}/${IMAGE_NAME}.$fstype || [ $? -le 3 ]
+	fi
 }

 IMAGE_CMD:ext2 = "oe_mkext234fs ext2 ${EXTRA_IMAGECMD}"

