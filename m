Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8236DC433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 14:28:18 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.7079.1645799297866462815
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:28:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=vKTPP++T;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id 195so4795473pgc.6
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=T78WBh3TO3vj763d+pDDcIgHSfV3auRhaxGWyT80l34=;
        b=vKTPP++T7wWcPlzrAK+atG+Pu+7VJ8UXrD1z/I8hyGJIgF7ss37G4uLv6vhXXmpEi4
         NEMWlMnwzMZLeit0f3P62jA3zWq82qFvCFlI86RxCE1ljjYBvwTDflfevLTz3Yp3delE
         Sdtr6PmA2Rh5ggF4D3OYzKfXs64LHfbUqzauS5AxZ+2JW+pKUcOZzKOiuukT9l5SPnmD
         rMFOnxNfdxHYwDaIiOGm7AtHOhOK+UU5dBM2SC9TxC37VUT5NmRoZvgP3hYPUOa4Nq5N
         nZVewHyT+RULO3pn+9QnYStNpCKH8DzxWgCQbUMebJjXvOpzpzB+L+gpOqlc+j/0CMvx
         uiZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T78WBh3TO3vj763d+pDDcIgHSfV3auRhaxGWyT80l34=;
        b=o/UZsaI+9RaNObo33jTqFXqMJq+2uM8NXxommQAZxu5l5rwktOLGuAJMB55qUExUr4
         1f3hZ5EOuRJ6Sm4XJWrZonYG3z/30Er4nw8Qy6SfoKEpc75IAyqrFH3ck485loik9JwU
         /pOlOsQAVhskkGCjv8k5kFP4cUc5uNca+5+xYgxcib7FOssZqeiMByXbSACCNYnxoYIc
         n1+dKE/QNZKL7yuHaNDX2NHZ68oH5Q3gWfr1VXeiVlwlrfnVG1eX4khvhI9nElXU/JX5
         EeaXyjOQ/n+X54hiLpW8bPfqWVuXRfiVxmuTyDo3RSDB17Ufgih39LOkFuhXkeZAG9I2
         KqgQ==
X-Gm-Message-State: AOAM530h7dinfd5SBPzEfqQYvltFts13PuyiNPhNEKvwPHRy95WpMQgl
	CsVPZX4SZWMAzJ3RRqnNh2Zv/p93CKVyS+XU
X-Google-Smtp-Source: 
 ABdhPJysK/ZfvPiUPamEJAG26v0ag/5HPx4QnKNq9rCtlTIaKOzA+pdoUki3RF7AKhCLYZjqJaNcPA==
X-Received: by 2002:a63:a545:0:b0:34c:9ba5:6125 with SMTP id
 r5-20020a63a545000000b0034c9ba56125mr6316323pgu.392.1645799296896;
        Fri, 25 Feb 2022 06:28:16 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h17-20020a63df51000000b0036b9776ae5bsm2864538pgj.85.2022.02.25.06.28.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 06:28:16 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 39/50] grub: test for malformed jpeg files
Date: Fri, 25 Feb 2022 04:26:19 -1000
Message-Id: 
 <d8cdb3a17f6e874d232979307a3f25511172d086.1645798648.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645798648.git.steve@sakoman.com>
References: <cover.1645798648.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 14:28:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162385

From: Marta Rybczynska <rybczynska@gmail.com>

This patch adds a fix for handling malformed JPEG files in grub's
video/readers/jpeg. It is a part of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


