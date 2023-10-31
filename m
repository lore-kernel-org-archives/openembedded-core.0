Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08200C4167B
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 15:35:58 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.1811.1698766556743231105
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Oct 2023 08:35:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=MRPII/2p;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1c9b7c234a7so52517425ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 08:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1698766555; x=1699371355; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O0zf1SCrhHyJRVY3oyiU4P/OFd/VX/kji+OZg/gg1wY=;
        b=MRPII/2pItdoKIi9W324cid3eP0WCmAXAtKFxVa6vqNmZqnFoQex6LNjuUs+itBN67
         cA3B+nnMm+/GN6PjW0wB3ipiAzZPyQU2FmrpgXJ3RpRTqJ7AaV73rp2bElInlfa8MLiI
         ZH6BeznMubiHAwUMLUHuQAY4fF81X0J3rYjAXRXnsqiIvS2uryAaezpizT0vcF4W9z7C
         hyDSpy1hBLsaAuxSBc/AG+f0z8xfU+N885U1NN4s7cFIntwj+TtEoC8Kk59dxRTH4tdc
         kOan+ipDjUVQDqvLQNEiFZRIV2IYyTdUoGeEsFQDeiZHOA3ceHmrLCAzaSIc//DrjI6Q
         nGSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698766555; x=1699371355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O0zf1SCrhHyJRVY3oyiU4P/OFd/VX/kji+OZg/gg1wY=;
        b=nwQzFzrD+2VSU5QE5t5FPGWoSsLjySIkGo3KMmh3Xq5PX+xA3v+k2HoFXY75CzoJLL
         cdvv+xmDLr6wFuPvnGGWL/Ba3NFWAiGv+tBCSXn625BHHelgqYJ8OpSwck2bS3KgbOWy
         qOpRkAgN+JbivHYDd5fsS76mNmaNWQHbgpIOP8aPxdkiWj/EC1HhCjpiSrAPmWNEEMgb
         rYmtrR9K3KBTMgJz9spJEEOuhL6QdpT5iTgXMcbjX72rXyE5QZ5JdIEq9HseIKJDNLTf
         jEUIHxZ2Jigc5WELBj7ot9C5cM/inLNW9eJ8CJjGhcnmqd/SG9jnOS5unx0Ho9OURD4o
         TuRQ==
X-Gm-Message-State: AOJu0YyuBE5/ilqIrgEskmRjBkm9OyJUqG5bHEzvRe2U4Er0DbruTqPZ
	79bNAig8yh6StFFOphmwVkP/UWN+5WxF+dqijVNC4g==
X-Google-Smtp-Source: AGHT+IE2Avd7SMQC/wSKLzUusBMcyKfK+7tiCYwsT+S71iMkI7OkdVWZzXvF1YWPrm6rzmmXpKv1bA==
X-Received: by 2002:a17:903:32c3:b0:1cc:4828:9b07 with SMTP id i3-20020a17090332c300b001cc48289b07mr7377641plr.0.1698766555392;
        Tue, 31 Oct 2023 08:35:55 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id f10-20020a170902684a00b001ca21e05c69sm1498048pln.109.2023.10.31.08.35.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 08:35:55 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 1/5] grub2: fix CVE-2023-4692
Date: Tue, 31 Oct 2023 05:35:40 -1000
Message-Id: <a02081b5aa1ea780f9342a24080d617b34c99b28.1698766338.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698766338.git.steve@sakoman.com>
References: <cover.1698766338.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 15:35:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189853

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Crafted file system images can cause heap-based buffer overflow and may
allow arbitrary code execution and secure boot bypass

Reference:
https://security-tracker.debian.org/tracker/CVE-2023-4692

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../grub/files/CVE-2023-4692.patch            | 98 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 99 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2023-4692.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2023-4692.patch b/meta/recipes-bsp/grub/files/CVE-2023-4692.patch
new file mode 100644
index 0000000000..305fcc93d8
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2023-4692.patch
@@ -0,0 +1,98 @@
+From 43651027d24e62a7a463254165e1e46e42aecdea Mon Sep 17 00:00:00 2001
+From: Maxim Suhanov <dfirblog@gmail.com>
+Date: Mon, 28 Aug 2023 16:31:57 +0300
+Subject: [PATCH] fs/ntfs: Fix an OOB write when parsing the $ATTRIBUTE_LIST attribute
+ for the $MFT file
+
+When parsing an extremely fragmented $MFT file, i.e., the file described
+using the $ATTRIBUTE_LIST attribute, current NTFS code will reuse a buffer
+containing bytes read from the underlying drive to store sector numbers,
+which are consumed later to read data from these sectors into another buffer.
+
+These sectors numbers, two 32-bit integers, are always stored at predefined
+offsets, 0x10 and 0x14, relative to first byte of the selected entry within
+the $ATTRIBUTE_LIST attribute. Usually, this won't cause any problem.
+
+However, when parsing a specially-crafted file system image, this may cause
+the NTFS code to write these integers beyond the buffer boundary, likely
+causing the GRUB memory allocator to misbehave or fail. These integers contain
+values which are controlled by on-disk structures of the NTFS file system.
+
+Such modification and resulting misbehavior may touch a memory range not
+assigned to the GRUB and owned by firmware or another EFI application/driver.
+
+This fix introduces checks to ensure that these sector numbers are never
+written beyond the boundary.
+
+Fixes: CVE-2023-4692
+
+Upstream-Status: Backport from 
+[https://git.savannah.gnu.org/cgit/grub.git/commit/?id=43651027d24e62a7a463254165e1e46e42aecdea]
+CVE: CVE-2023-4692
+
+Reported-by: Maxim Suhanov <dfirblog@gmail.com>
+Signed-off-by: Maxim Suhanov <dfirblog@gmail.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ grub-core/fs/ntfs.c | 18 +++++++++++++++++-
+ 1 file changed, 17 insertions(+), 1 deletion(-)
+
+diff --git a/grub-core/fs/ntfs.c b/grub-core/fs/ntfs.c
+index bbdbe24..c3c4db1 100644
+--- a/grub-core/fs/ntfs.c
++++ b/grub-core/fs/ntfs.c
+@@ -184,7 +184,7 @@ find_attr (struct grub_ntfs_attr *at, grub_uint8_t attr)
+     }
+   if (at->attr_end)
+     {
+-      grub_uint8_t *pa;
++      grub_uint8_t *pa, *pa_end;
+ 
+       at->emft_buf = grub_malloc (at->mft->data->mft_size << GRUB_NTFS_BLK_SHR);
+       if (at->emft_buf == NULL)
+@@ -209,11 +209,13 @@ find_attr (struct grub_ntfs_attr *at, grub_uint8_t attr)
+ 	    }
+ 	  at->attr_nxt = at->edat_buf;
+ 	  at->attr_end = at->edat_buf + u32at (pa, 0x30);
++	  pa_end = at->edat_buf + n;
+ 	}
+       else
+ 	{
+ 	  at->attr_nxt = at->attr_end + u16at (pa, 0x14);
+ 	  at->attr_end = at->attr_end + u32at (pa, 4);
++	  pa_end = at->mft->buf + (at->mft->data->mft_size << GRUB_NTFS_BLK_SHR);
+ 	}
+       at->flags |= GRUB_NTFS_AF_ALST;
+       while (at->attr_nxt < at->attr_end)
+@@ -230,6 +232,13 @@ find_attr (struct grub_ntfs_attr *at, grub_uint8_t attr)
+ 	  at->flags |= GRUB_NTFS_AF_GPOS;
+ 	  at->attr_cur = at->attr_nxt;
+ 	  pa = at->attr_cur;
++
++	  if ((pa >= pa_end) || (pa_end - pa < 0x18))
++	    {
++	      grub_error (GRUB_ERR_BAD_FS, "can\'t parse attribute list");
++	      return NULL;
++	    }
++
+ 	  grub_set_unaligned32 ((char *) pa + 0x10,
+ 				grub_cpu_to_le32 (at->mft->data->mft_start));
+ 	  grub_set_unaligned32 ((char *) pa + 0x14,
+@@ -240,6 +249,13 @@ find_attr (struct grub_ntfs_attr *at, grub_uint8_t attr)
+ 	    {
+ 	      if (*pa != attr)
+ 		break;
++
++              if ((pa >= pa_end) || (pa_end - pa < 0x18))
++                {
++	          grub_error (GRUB_ERR_BAD_FS, "can\'t parse attribute list");
++	          return NULL;
++	        }
++
+ 	      if (read_attr
+ 		  (at, pa + 0x10,
+ 		   u32at (pa, 0x10) * (at->mft->data->mft_size << GRUB_NTFS_BLK_SHR),
+-- 
+cgit v1.1
+
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 58b215d79c..ac73a0b940 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -42,6 +42,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2022-3775.patch \
            file://0001-risc-v-Handle-R_RISCV_CALL_PLT-reloc.patch \
            file://0001-fs-ext2-Ignore-checksum-seed-incompat-feature.patch \
+           file://CVE-2023-4692.patch \
 "
 
 SRC_URI[sha256sum] = "23b64b4c741569f9426ed2e3d0e6780796fca081bee4c99f62aa3f53ae803f5f"
-- 
2.34.1


