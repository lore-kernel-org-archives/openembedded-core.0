Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEC9DC4167B
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 15:36:07 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.1945.1698766558759461523
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Oct 2023 08:35:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Sir7NZxJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1cc3542e328so20740405ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 08:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1698766557; x=1699371357; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a9jCxoeAcQpu4nhwhJgCtOTd1s8OzPMJFRp56+aDMJo=;
        b=Sir7NZxJzqxmDJdrG8RCaNHFpBtA+sTeJ9fZVVSvWEQTWpTCUO8zuCWe9c0W75wpD+
         /GR62aLXBXdJUQ/0G89g5E6GS5X+J8geck3LcW1hDtFD8fZMw18F/SSLNH+dTtaJ5/IY
         FXF+8gQvkeLXTOLE8PWaKJMOaV5ZC5+a5LduYdv92RWBuPPTOgZv8Nu2yZcWZOSp/0zZ
         06qq76kGGLhgJF+f+N+JBOT2pVd0AKUMhDJD/rASg6e1WeSANk6miEAFg9KJKCGe8faU
         ZLhmx+k6+Y7/KCXDVJdK1EU0Czg6uIhOpfs+/waX2VZFUMRvdRWzOU+BK7T0G59CMkxz
         La/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698766557; x=1699371357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a9jCxoeAcQpu4nhwhJgCtOTd1s8OzPMJFRp56+aDMJo=;
        b=TuocfC9qV0xFjDbwYYdt7lafnLOOI30SBudwCHqCa4KQbjwtapP68GGzEdirV77Ng/
         Gf6aL+qH60N0yb+8+9Ac/TX+GupXU/KKsmTjuduxJFVOWHaIb+2zamzBZDHtjkD7SYZ7
         1XEHmp1OSeMg6v6rIKi7fZtRRHrDRufKz4fnz13VTHguEVE2ouGcKAqLhDyGJA+A+gqF
         gDaKNp4Os/Tc1wVuT29ahlil/Y72gDhPFIQViOfsEMzypvLAUdk3lLa4jwCIf+Gud5Dw
         /HlPSPr4S0QcJ7364QhCzrHzQq15Y78FTVHMzBcA3eC3MIYWzTpsFhuojy3DpbSK3ofr
         erMw==
X-Gm-Message-State: AOJu0YwH58XHS2TyHdpYWFC3tvLXYGHpdETU5Aatgmvk3R06neLRyxDt
	1GXJ8ny6bGzdMEouqNnPUiDZPGDmTjDR21vqdsJLxw==
X-Google-Smtp-Source: AGHT+IECbdMCn6SjTjedy5ZFSeEJcRVqG0lEmsx5qJvDCABZnEqY19GXU67QFZEQrnIx+kYZ8W0MhQ==
X-Received: by 2002:a17:902:ce87:b0:1cc:636f:f376 with SMTP id f7-20020a170902ce8700b001cc636ff376mr3730552plg.44.1698766557338;
        Tue, 31 Oct 2023 08:35:57 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id f10-20020a170902684a00b001ca21e05c69sm1498048pln.109.2023.10.31.08.35.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 08:35:56 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 2/5] grub2: fix CVE-2023-4693
Date: Tue, 31 Oct 2023 05:35:41 -1000
Message-Id: <afcb86b8b7936056549600c71a171f9c17ca6980.1698766338.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698766338.git.steve@sakoman.com>
References: <cover.1698766338.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 15:36:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189854

From: Xiangyu Chen <xiangyu.chen@windriver.com>

There an out-of-bounds read at fs/ntfs.c, a physically present attacker
may leverage that by presenting a specially crafted NTFS file system
image to read arbitrary memory locations. A successful attack may allow
sensitive data cached in memory or EFI variables values to be leaked
presenting a high Confidentiality risk.

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../grub/files/CVE-2023-4693.patch            | 63 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2023-4693.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2023-4693.patch b/meta/recipes-bsp/grub/files/CVE-2023-4693.patch
new file mode 100644
index 0000000000..544226a9aa
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2023-4693.patch
@@ -0,0 +1,63 @@
+From 0ed2458cc4eff6d9a9199527e2a0b6d445802f94 Mon Sep 17 00:00:00 2001
+From: Maxim Suhanov <dfirblog@gmail.com>
+Date: Mon, 28 Aug 2023 16:32:33 +0300
+Subject: fs/ntfs: Fix an OOB read when reading data from the resident $DATA
+ attribute
+
+When reading a file containing resident data, i.e., the file data is stored in
+the $DATA attribute within the NTFS file record, not in external clusters,
+there are no checks that this resident data actually fits the corresponding
+file record segment.
+
+When parsing a specially-crafted file system image, the current NTFS code will
+read the file data from an arbitrary, attacker-chosen memory offset and of
+arbitrary, attacker-chosen length.
+
+This allows an attacker to display arbitrary chunks of memory, which could
+contain sensitive information like password hashes or even plain-text,
+obfuscated passwords from BS EFI variables.
+
+This fix implements a check to ensure that resident data is read from the
+corresponding file record segment only.
+
+Fixes: CVE-2023-4693
+
+Upstream-Status: Backport from 
+[https://git.savannah.gnu.org/cgit/grub.git/commit/?id=0ed2458cc4eff6d9a9199527e2a0b6d445802f94]
+CVE: CVE-2023-4693
+
+Reported-by: Maxim Suhanov <dfirblog@gmail.com>
+Signed-off-by: Maxim Suhanov <dfirblog@gmail.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ grub-core/fs/ntfs.c | 13 ++++++++++++-
+ 1 file changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/grub-core/fs/ntfs.c b/grub-core/fs/ntfs.c
+index c3c4db1..a68e173 100644
+--- a/grub-core/fs/ntfs.c
++++ b/grub-core/fs/ntfs.c
+@@ -401,7 +401,18 @@ read_data (struct grub_ntfs_attr *at, grub_uint8_t *pa, grub_uint8_t *dest,
+     {
+       if (ofs + len > u32at (pa, 0x10))
+ 	return grub_error (GRUB_ERR_BAD_FS, "read out of range");
+-      grub_memcpy (dest, pa + u32at (pa, 0x14) + ofs, len);
++
++      if (u32at (pa, 0x10) > (at->mft->data->mft_size << GRUB_NTFS_BLK_SHR))
++	return grub_error (GRUB_ERR_BAD_FS, "resident attribute too large");
++
++      if (pa >= at->mft->buf + (at->mft->data->mft_size << GRUB_NTFS_BLK_SHR))
++	return grub_error (GRUB_ERR_BAD_FS, "resident attribute out of range");
++
++      if (u16at (pa, 0x14) + u32at (pa, 0x10) >
++	  (grub_addr_t) at->mft->buf + (at->mft->data->mft_size << GRUB_NTFS_BLK_SHR) - (grub_addr_t) pa)
++	return grub_error (GRUB_ERR_BAD_FS, "resident attribute out of range");
++
++      grub_memcpy (dest, pa + u16at (pa, 0x14) + ofs, len);
+       return 0;
+     }
+ 
+-- 
+cgit v1.1
+
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index ac73a0b940..fa949fc081 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -43,6 +43,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0001-risc-v-Handle-R_RISCV_CALL_PLT-reloc.patch \
            file://0001-fs-ext2-Ignore-checksum-seed-incompat-feature.patch \
            file://CVE-2023-4692.patch \
+           file://CVE-2023-4693.patch \
 "
 
 SRC_URI[sha256sum] = "23b64b4c741569f9426ed2e3d0e6780796fca081bee4c99f62aa3f53ae803f5f"
-- 
2.34.1


