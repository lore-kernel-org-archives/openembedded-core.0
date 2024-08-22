Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16F8CC5320E
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 09:35:41 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.9391.1724319338611928319
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Aug 2024 02:35:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AW8BCqcW;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a83856c6f51so56744166b.2
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 02:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724319337; x=1724924137; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U/NE3u6bvLBIKgYbz+9GtNEbJJTyMcVirdxcAdYNvOE=;
        b=AW8BCqcWQ7k8xVOvaQnCKe46fJHonvbCrSGOG6uGdhKZQbiqy3+Ajbb6uc6tve8tEf
         hft6Cv0uNxdi5CyKSPOUW0t8KUie/vPwrFaOtX06RqnR81gRZRUqdJX5YhQ50f1LD1uy
         BkoncPKjjMXrnFuEcOL6fVF8xrtI3sjNaS8D+TklczNpOs2jmbjnk2RgKPcJUEw2DtDd
         8by/EEhz44EtYEynQ6iVgLfMU+Ls0TqEWzRhdvi2FnjupbZEtZuxzL537DA5kuYthW6o
         WKHLNUhCvhR6136JAqTfD4Kfi6rY84r2AIVPrT7BlDvb41FszEl78DSrslnx+R3rls8P
         4w5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724319337; x=1724924137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U/NE3u6bvLBIKgYbz+9GtNEbJJTyMcVirdxcAdYNvOE=;
        b=J9Uuty7i5DwKvOjS9Zzwcwp5gV81EybY7FsTNbCmW5n2caj4RTWb6hMKJ6shpH2hTW
         +Gz6Qj2ZHcfAWntXUd8lWSjU2clszSxLvGb53dk/Xh1AZNfbENflp2L8ROLsFMUJRVb+
         gRCplRyfT9/UY2qZEpQguVcddD+2/Kq5qc3c5+d4H0zRuXqvJB6JjdFnMKLeAHwuIT/O
         dHGtsQLnz7EL0IxnX2nawptpmPeXJAiZPc9hSp7/x0f5IC+5WE/ERetCwsnoHC6yL7Tz
         r2Y25+m3UeMsLU3B+hWTm4u+9OOJV0qq+dk6twEoSBMV44RrC7AP9hUyaIpq7Uy+h8Z0
         ADsQ==
X-Gm-Message-State: AOJu0YzN5Mqvzxyv8OLmmBePrHx/gvt1lQdGvw2l3PXePPMXd+WI6hbg
	3yc3LWG6evLJWX1tHxkzSSh9h2zk4nSRjh+FJIcjLyUJp/+auX7O6shV6w==
X-Google-Smtp-Source: AGHT+IEqG5tRUDvxTT3HX39+mpsaBRgrpALbWuSi+4iDrcfofA2kUUoc+RgsszBOVwWA2HxXIWu7VA==
X-Received: by 2002:a05:6402:909:b0:5be:e6a6:4cc3 with SMTP id 4fb4d7f45d1cf-5c0791ee294mr1086013a12.14.1724319336663;
        Thu, 22 Aug 2024 02:35:36 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c044ddbce5sm698502a12.4.2024.08.22.02.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 02:35:36 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 18/32] linux-firmware: upgrade 20240513 -> 20240811
Date: Thu, 22 Aug 2024 11:35:07 +0200
Message-Id: <20240822093521.36790-18-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240822093521.36790-1-alex.kanavin@gmail.com>
References: <20240822093521.36790-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 09:35:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203633

From: Alexander Kanavin <alex@linutronix.de>

License-Update: additional firmwares, new versions

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...inux-firmware_20240513.bb => linux-firmware_20240811.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20240513.bb => linux-firmware_20240811.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20240513.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20240811.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20240513.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20240811.bb
index 4a87105d986..b6fb0f9a456 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20240513.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20240811.bb
@@ -144,7 +144,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.rtlwifi_firmware.txt;md5=00d06cfd3eddd5a2698948ead2ad54a5 \
                     file://LICENSE.sdma_firmware;md5=51e8c19ecc2270f4b8ea30341ad63ce9 \
                     file://LICENCE.siano;md5=4556c1bf830067f12ca151ad953ec2a5 \
-                    file://LICENCE.ti-connectivity;md5=c5e02be633f1499c109d1652514d85ec \
+                    file://LICENCE.ti-connectivity;md5=3b1e9cf54aba8146dad4b735777d406f \
                     file://LICENCE.ti-keystone;md5=3a86335d32864b0bef996bee26cc0f2c \
                     file://LICENCE.ueagle-atm4-firmware;md5=4ed7ea6b507ccc583b9d594417714118 \
                     file://LICENCE.via_vt6656;md5=e4159694cba42d4377a912e78a6e850f \
@@ -156,7 +156,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "ae024b46fd393d199f66bbe1f3ff5254"
+WHENCE_CHKSUM  = "60b5abcc986d1660637e913a87e1413c"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -244,7 +244,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "9f05edb99668135d37cedc4fdd18aac2802dc9e4566e086e6c6c2e321f3ecc4e"
+SRC_URI[sha256sum] = "58f1a14b800e3d1967986197d83c81f1ad14b7898a557133c58df0c02c538082"
 
 inherit allarch
 
-- 
2.39.2


