Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E591DC28B28
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 19:52:56 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.4653.1741809168345822821
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 12:52:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Qd7+Xvf4;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2feb91a2492so487473a91.2
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 12:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741809167; x=1742413967; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lpNSRWK49vv51SeJfLXed+XqSnsTQy6sjzbba/qxboo=;
        b=Qd7+Xvf4I3I3+GAOe1bZfaJ+D2EW1XwjPqA3JKHje+BSVzjghWOd78mBJdOMfuWyql
         ir50bdTiQDnidzWzM6RhOhPHpxXHvpYGrU4ZEdnm4PDFzBUdisi4YvvTI1Q5nDdEil5+
         Z6dnkoNBrgbfcNEfJZg83Gj7X4AIOIiOJjPnCn/fOmTI2pNQDrNkyW/8XE0+vtQz6D4I
         +U9/LEz0SqfUBEvw9FZZ/LpWFgLO1VDKcvAOw8xkd7l2MSsdQ7xvqB5JEfe2IXHN5fhU
         imok5RzMaKrKYX0FvnQiM+/m1EByIGbYoEujjs8zgeZFgiA0UZ53GdKxKV0HhWt//ZM4
         pNUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741809167; x=1742413967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lpNSRWK49vv51SeJfLXed+XqSnsTQy6sjzbba/qxboo=;
        b=OSEJc34G3vFLRRyHd8QVl8cec31zqCy8oHGGnl92cIOCIJchj5uCNQ2X3R1X2isWif
         +YCxyNOypcBpSngxJ3xW3Yd/OMj+GOYF0Cdiyq6GvJ/779UmsIQoInoGz5GsRsmUoPf3
         lhanPkFgydRj+IV0u6kE6VGuPuCwN4eecphV9CT5yEjmeKCJKBOBvXfMVR6neTOVvWVp
         mfIC1EDMQJJ3GUwuU4/yVsZfUQaS+2q2tH7UKwfFB6h5K8HAkWiaf1nQxVb3yKgS4RFT
         S+IZleCAtEp1DvJGk3yjt5Qg2G2eyvtjjTrNoksFipdVPhuCLWv6j5LN9np8oZs66y3k
         wagw==
X-Gm-Message-State: AOJu0YzLPcofi2mx/vPDDeJ7Ua6zMFVZ7qfw1HG1aa9nKytTrZM9XYiz
	0ddG8mAjlGU6MybL2bQEquFoD6d2tqvoB7FSIxT6B+iGNHArvlVOqXvzDDzhQ7H11mtGfq5Ho1l
	A
X-Gm-Gg: ASbGncuS8Stox5lZ8mGDw3hIgAnG4rJGHEM95hpYo8qg58QvU8ZLI2VMJ15YD2ynPi/
	k89CAPTfFziG+xmCJzUXdN/wA6XVrPGWVINBGoiNeSnF005/Zghw4vmN06NYG7TZGKdRU60ZCh+
	3M1MpHgh8aTebYY0EI63zB8QWC5JmLhE+fvp3TCWzUT/qxpu/WQ21W/z+cCHEQopGsaSV3/lihx
	tpKTV8bgPZLcekb8QsRRmn1wKg5e3XCDzJWIsyVkNqOxeIAHsrLJf5LCjV4K1xAzRXn2sKtwDtD
	ZbyL8jN551kf9H2KGY0fp6pwuaHXfG2J6DeYQlFhtRUXig==
X-Google-Smtp-Source: AGHT+IEGnFJ+jWuJTUlMlGgh9IbKZZLpwc2DCLMHCM1ozAR+z9z0hPYGemjzCHj6jsmbGechAkay/Q==
X-Received: by 2002:a05:6a21:6b04:b0:1f5:5903:edd3 with SMTP id adf61e73a8af0-1f55903f155mr27738358637.11.1741809167575;
        Wed, 12 Mar 2025 12:52:47 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5779:a397:ba1c:2b0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56093c2f5sm1389955a12.67.2025.03.12.12.52.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 12:52:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 05/25] grup: patch CVE-2024-45781
Date: Wed, 12 Mar 2025 12:52:13 -0700
Message-ID: <ef41ef5730d08371d1eb03f94fa9357edf26889f.1741808973.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741808973.git.steve@sakoman.com>
References: <cover.1741808973.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 19:52:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212672

From: Peter Marko <peter.marko@siemens.com>

Cherry-pick patch mentioning this CVE.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../grub/files/CVE-2024-45781.patch           | 35 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2024-45781.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2024-45781.patch b/meta/recipes-bsp/grub/files/CVE-2024-45781.patch
new file mode 100644
index 0000000000..bd0b6aa04a
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2024-45781.patch
@@ -0,0 +1,35 @@
+From c1a291b01f4f1dcd6a22b61f1c81a45a966d16ba Mon Sep 17 00:00:00 2001
+From: B Horn <b@horn.uk>
+Date: Sun, 12 May 2024 02:03:33 +0100
+Subject: [PATCH 2/2] fs/ufs: Fix a heap OOB write
+
+grub_strcpy() was used to copy a symlink name from the filesystem
+image to a heap allocated buffer. This led to a OOB write to adjacent
+heap allocations. Fix by using grub_strlcpy().
+
+Fixes: CVE-2024-45781
+
+Reported-by: B Horn <b@horn.uk>
+Signed-off-by: B Horn <b@horn.uk>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+CVE: CVE-2024-45781
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=c1a291b01f4f1dcd6a22b61f1c81a45a966d16ba]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ grub-core/fs/ufs.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/grub-core/fs/ufs.c b/grub-core/fs/ufs.c
+index a354c92d9..01235101b 100644
+--- a/grub-core/fs/ufs.c
++++ b/grub-core/fs/ufs.c
+@@ -463,7 +463,7 @@ grub_ufs_lookup_symlink (struct grub_ufs_data *data, int ino)
+   /* Check against zero is paylindromic, no need to swap.  */
+   if (data->inode.nblocks == 0
+       && INODE_SIZE (data) <= sizeof (data->inode.symlink))
+-    grub_strcpy (symlink, (char *) data->inode.symlink);
++    grub_strlcpy (symlink, (char *) data->inode.symlink, sz);
+   else
+     {
+       if (grub_ufs_read_file (data, 0, 0, 0, sz, symlink) < 0)
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 43ba632ce2..58f4a6e181 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -19,6 +19,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0001-grub.d-10_linux.in-add-oe-s-kernel-name.patch \
            file://0001-RISC-V-Restore-the-typcast-to-long.patch \
            file://0001-misc-Implement-grub_strlcpy.patch \
+           file://CVE-2024-45781.patch \
 "
 
 SRC_URI[sha256sum] = "b30919fa5be280417c17ac561bb1650f60cfb80cc6237fa1e2b6f56154cb9c91"
-- 
2.43.0


