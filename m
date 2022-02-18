Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A344C433F5
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 10:06:56 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web12.9115.1645178815197539428
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Sc3ZSFS1;
 spf=pass (domain: gmail.com, ip: 209.85.221.48,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id f3so13493312wrh.7
        for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=im+R/71YIG4t1O0t8OloEyUdg5Wzrb6lnV3WBZfD7BU=;
        b=Sc3ZSFS1iM2TSxPvxpY7JgPkOgU2Z11w7dRofrIERm/RHWkHPdQCaD3rRMNRPnNFv5
         AhMvZ0dl6Jyo8qilE4cc5b127sdulTAeLhm5vV0+gpEsGPitePVuU4DzrG2iMyQ3wvWC
         ZFsi92OfljrVRkReUv3Qi3c0m4wJ9I6GkDIRcTRQS3qNsgdvAS/mvf/CMMWri7GlKOiy
         K8rlGFn6fJrXw2iqbFikMzrXhvRTNjklxbH03Fq5wWo5z2Dqnm95zWOAUPqlfRWXKQe+
         +Z7Dyp3dxFOiW0ewV9SikkN0eG9rtnjkXbXF1HOXmRS7lhX7VbVu1WdLlzz9r3N7hJm8
         eCOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=im+R/71YIG4t1O0t8OloEyUdg5Wzrb6lnV3WBZfD7BU=;
        b=T8Uuzn6mfQX1D18WUoK34MuhRiSj8a5vyIzcDfD84jkTPwvP4L/ZGY7agHkfbgfKzA
         W6gEHfhbVxYPvedQjx+O7Iam4hze+V12u/Sp4BfRjM0DvdSlDboDC3HZRzEI+L0t2WSm
         +prgEE1uzLgz7Te0+qdFAVQHr2yv+QEjWBhQe2DBU66ZObjKp6c1RApNd9rKd6Twb7wp
         cJghL7Oo0ZSi0kbdXaWvcsbCNLJn9sCQxiVLY9MJKPuxe8ZL9c9oITCs1zAKQ7nuqlPW
         NeBbKbYMJSzBM8ksC+ZQQAsVcWPFwuBh0lp08EzDACmMQbYB1dWb+ZR6Th04IRTToLvV
         /LAw==
X-Gm-Message-State: AOAM533SRLMM43HQ7cfnHfYIbpncjOntWg1pQqCRSS5kRTB2S9+ZwQP6
	cflMcCEGfvILw0mS0mZ2w5k=
X-Google-Smtp-Source: 
 ABdhPJxvT+XHSCUzdYsCniANIn31t8a+DzLBKTCsMT5R6arei5YI114qUOO4abAUC00Mil1xypq/YA==
X-Received: by 2002:adf:816c:0:b0:1e6:88a9:eb6c with SMTP id
 99-20020adf816c000000b001e688a9eb6cmr5382528wrm.645.1645178813703;
        Fri, 18 Feb 2022 02:06:53 -0800 (PST)
Received: from localhost.localdomain ([80.215.178.41])
        by smtp.gmail.com with ESMTPSA id
 z5sm4808494wmp.10.2022.02.18.02.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 02:06:53 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
To: anuj.mittal@intel.com,
	openembedded-core@lists.openembedded.org,
	steve@sakoman.com
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [PATCH 35/46][dunfell] grub: test for malformed jpeg files
Date: Fri, 18 Feb 2022 11:05:43 +0100
Message-Id: <20220218100554.1315511-36-rybczynska@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220218100554.1315511-1-rybczynska@gmail.com>
References: <20220218100554.1315511-1-rybczynska@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 10:06:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161923

This patch adds a fix for handling malformed JPEG files in grub's
video/readers/jpeg. It is a part of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
---
 ...eg-Test-for-an-invalid-next-marker-r.patch | 38 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0035-video-readers-jpeg-Test-for-an-invalid-next-marker-r.patch

diff --git a/meta/recipes-bsp/grub/files/0035-video-readers-jpeg-Test-for-an-invalid-next-marker-r.patch b/meta/recipes-bsp/grub/files/0035-video-readers-jpeg-Test-for-an-invalid-next-marker-r.patch
new file mode 100644
index 0000000000..3fca2aecb5
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0035-video-readers-jpeg-Test-for-an-invalid-next-marker-r.patch
@@ -0,0 +1,38 @@
+From 88361a7fd4e481a76e1159a63c9014fa997ef29c Mon Sep 17 00:00:00 2001
+From: Darren Kenny <darren.kenny@oracle.com>
+Date: Fri, 4 Dec 2020 15:39:00 +0000
+Subject: [PATCH] video/readers/jpeg: Test for an invalid next marker reference
+ from a jpeg file
+
+While it may never happen, and potentially could be caught at the end of
+the function, it is worth checking up front for a bad reference to the
+next marker just in case of a maliciously crafted file being provided.
+
+Fixes: CID 73694
+
+Signed-off-by: Darren Kenny <darren.kenny@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=5f5eb7ca8e971227e95745abe541df3e1509360e]
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ grub-core/video/readers/jpeg.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/grub-core/video/readers/jpeg.c b/grub-core/video/readers/jpeg.c
+index 31359a4..0b6ce3c 100644
+--- a/grub-core/video/readers/jpeg.c
++++ b/grub-core/video/readers/jpeg.c
+@@ -253,6 +253,12 @@ grub_jpeg_decode_quan_table (struct grub_jpeg_data *data)
+   next_marker = data->file->offset;
+   next_marker += grub_jpeg_get_word (data);
+ 
++  if (next_marker > data->file->size)
++    {
++      /* Should never be set beyond the size of the file. */
++      return grub_error (GRUB_ERR_BAD_FILE_TYPE, "jpeg: invalid next reference");
++    }
++
+   while (data->file->offset + sizeof (data->quan_table[id]) + 1
+ 	 <= next_marker)
+     {
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 04c9b4c092..75782b7eb2 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -81,6 +81,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0032-video-fb-fbfill-Fix-potential-integer-overflow.patch \
            file://0033-video-fb-video_fb-Fix-multiple-integer-overflows.patch \
            file://0034-video-fb-video_fb-Fix-possible-integer-overflow.patch \
+           file://0035-video-readers-jpeg-Test-for-an-invalid-next-marker-r.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.33.0


