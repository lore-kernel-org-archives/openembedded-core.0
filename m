Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web08.7223.1612029763555653435
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Jan 2021 10:02:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ICHOzKkC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ed1-f51.google.com with SMTP id d22so14286140edy.1
        for <openembedded-core@lists.openembedded.org>; Sat, 30 Jan 2021 10:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h4ed3b+9ASMo/SSfadrBDc6AyoY5T6ltmTE+vocjhzM=;
        b=ICHOzKkCY5+h0LFoRYFvSnyZazxfjGQv+6RIkz5Gtr5IG7VQTl7qt27HK44Xy3qBc6
         BF3pGNpiLkNzoJcmOHbdn8CfYC2SfzIfOsnfL9maPxFgzE8U2DYtCvrGed89b8nWyW3X
         zT34v/J2LTJJCAgbkEW2MIZU+5yEtswc5YGW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h4ed3b+9ASMo/SSfadrBDc6AyoY5T6ltmTE+vocjhzM=;
        b=KYxu63+Q6uffBcSTjS6924RtxAvF7AWVfKJz1c9geUzhxrh/7uWVWJZrsm8WW3+YYR
         /wfRgZbOuQc/94AFnMVef/9a1ma3uRXAWUJvmIULzZY7GCe8jhlA/ZBl6hEg2B8bjI2q
         PUt9o4w4ZBasym78SV5czO3fNRdSBqYvKw/beeWhfbRODHu7s2V+MSLp8kna1HlsI/LG
         WWpIdJsz7cMNYZ+hrGR2q8vZRg1PNY51s7Nmmj8wYlLfR5gNv5fdN75PxMHV7Rixq8wR
         KL5WMn5NIMoDHxWX44b3dOUpsR/xXTcpd8KENafAg+sLR3XpaW/I/CaNWwl7n9y/ieD3
         cknA==
X-Gm-Message-State: AOAM533+Dhjju8ieJ7LmxSvrXqgibyKx35zbrG4BLBI+sMLHwLPagMaf
	Oljp/U8IvP6oAX6kuVmu37JcV0oXOII98A==
X-Google-Smtp-Source: ABdhPJy35CHDfLhiUfZJqcgV/xXC/iuR/hmFj2hOr66Q/ey6xOHu39FPdjb0xcvV3LBk3pvlcpKKng==
X-Received: by 2002:a05:6402:1bcc:: with SMTP id ch12mr11011150edb.283.1612029761796;
        Sat, 30 Jan 2021 10:02:41 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:1e22:34f6:7a80:adbb])
        by smtp.gmail.com with ESMTPSA id du6sm3855085ejc.78.2021.01.30.10.02.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Jan 2021 10:02:41 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] image_types: Ensure tar archives are reproducible
Date: Sat, 30 Jan 2021 18:02:39 +0000
Message-Id: <20210130180240.1417810-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The tar output seems to vary depending on the version of tar used and distro
configuration. Be explict about the output format to avoid this and be
determinstic.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/image_types.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index c937ae45384..76949d1051d 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -110,7 +110,7 @@ IMAGE_CMD_squashfs-lz4 = "mksquashfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAM
 
 IMAGE_CMD_TAR ?= "tar"
 # ignore return code 1 "file changed as we read it" as other tasks(e.g. do_image_wic) may be hardlinking rootfs
-IMAGE_CMD_tar = "${IMAGE_CMD_TAR} --sort=name --numeric-owner -cf ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.tar -C ${IMAGE_ROOTFS} . || [ $? -eq 1 ]"
+IMAGE_CMD_tar = "${IMAGE_CMD_TAR} --sort=name --format=gnu --numeric-owner -cf ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.tar -C ${IMAGE_ROOTFS} . || [ $? -eq 1 ]"
 
 do_image_cpio[cleandirs] += "${WORKDIR}/cpio_append"
 IMAGE_CMD_cpio () {
-- 
2.27.0

