Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45581C433FE
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 18:28:21 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.2222.1643826499875309767
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 10:28:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qoEASl59;
 spf=pass (domain: gmail.com, ip: 209.85.218.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id d10so198395eje.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 10:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x/q/W6Rcn4W1NLAcJ9o1WKdMuyiZkk72c60ZMpwaeb8=;
        b=qoEASl59pXn2xvz4zK/fopbVYXz01J6HYFLZL167yUZgsCLg5VuVPMIc5fZSKj2vg2
         BKOrKz7FhWmVPZ8FI8TYH4x2s1KYKdmlgqpDI54R/p7TFsw113V6UBjwAsNMq72PEdRv
         SbICJ+4w1eYHdzmmk2CMRpP0xgajA53pCwCB4lkpQsyELitmmZcDK7ERnir4iN8bN8aE
         tV1YJDrrfOHShiaJtlyt90vb0m+kfbJbFu1shNxKP4mBmL0vfDtcn01PDD0kxERm6fd7
         3yWbekb5ohAh60F8kJdX40wiLwnD0G5iU1J9nRvjc9ClEQzb72pynFNibncKb1mWGfwY
         d7fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x/q/W6Rcn4W1NLAcJ9o1WKdMuyiZkk72c60ZMpwaeb8=;
        b=pEzJ2Cz+QtIKc7ILap6gjy0KDQkn0PFPsKZHaHzY5X/g2Y/PC1+c6CFcZ+wh2vr53N
         erF4HrgoomylBUwP1LeuQqNOSAyMPVc9cFOCmT/9YIXi7igZKrTQrYI1JNC42Mv1LDCG
         OP+3qtMQ0yM3Yq2zTtimfyYEfavnx8Erxa1hVnFDMLhm1ioG+c424HQm5FKDM65vqmKm
         dvBCJ5QVVs9Vc6i3GSL7Bvqyv8zebFYJSoLWsvbBZ9LooltWUC2D0xCLKAYmBbPDoKV3
         +bsOk6r/dKkS8Vp825j2cN0Z5xJqygTV3QhR2uJzxMyVSMrajmffInj4ZaLVyy72ERar
         DKgw==
X-Gm-Message-State: AOAM532yEVRguH9JMj8wXZ/dj1EYrqaoHmfoiNcCSY9OPmPbbiMcaMXy
	0kApxjMFM0FXmqUtVxDb0lzDJ+zJRO8=
X-Google-Smtp-Source: 
 ABdhPJy5Pak3KPhx+gxHuJO+LzjSrkpRFW1o2I0+MsDXbtKXDIhcIqFtsgN7vXjqRtWV04Mhs2s43Q==
X-Received: by 2002:a17:906:58c6:: with SMTP id
 e6mr25297216ejs.733.1643826498490;
        Wed, 02 Feb 2022 10:28:18 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 i12sm15644203ejy.43.2022.02.02.10.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 10:28:18 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 18/33] mmc-utils: upgrade to latest revision
Date: Wed,  2 Feb 2022 19:27:43 +0100
Message-Id: <20220202182758.919991-18-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220202182758.919991-1-alex@linutronix.de>
References: <20220202182758.919991-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 18:28:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161243

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/mmc/mmc-utils_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
index 5ccdaceb79..918c0a429c 100644
--- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -5,7 +5,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://mmc.c;beginline=1;endline=20;md5=fae32792e20f4d27ade1c5a762d16b7d"
 
 SRCBRANCH ?= "master"
-SRCREV = "3969aa4804edb8aed7bcb3c958e49d0c7388b067"
+SRCREV = "fd41dca5b14df7faefdda5dc6c0bbcdc8f6facc0"
 
 PV = "0.1+git${SRCPV}"
 
-- 
2.20.1


