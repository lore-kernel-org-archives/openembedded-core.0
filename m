Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF053C10DC1
	for <webhook@archiver.kernel.org>; Wed, 29 Nov 2023 23:05:18 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.57560.1701299116509854843
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Nov 2023 15:05:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=YBgt81nE;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6cb66f23eddso309169b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 15:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701299115; x=1701903915; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WXY/JlwvlfL6OdIZ8xIV7UNLHWXKsaCts5AakJGJXDM=;
        b=YBgt81nExvCQ3yhQ60sv2ZnmxwGV7gzq3ZTHfJh+mvogB16JfRAYBpyH+KLf8lbGOY
         /aHnyjr4rt87fK9WqOEHtv9viezgsAkMeT82FJaKiE/g7S+Ag1tMeGhdTfETb5bLpF2o
         wxr4hdUiusIOiCPIJe9eCjQXsCy8U9Ih93qfEFmEn/rzWV/NR0qXgj3s6NYYeHg9mTR8
         axsY04DRW1DV46EbuYkbh4uIMInDmdu5b+z7wWu9dsWu5nEYn/EL5LNx0b5mRch9ZXeP
         TF/i64tX89WjBL4y3JS5Zg1VTFAMSvmkJP3t6BnkRytZIFhDk9DHfdFrDGzBV2593hKz
         0zBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701299115; x=1701903915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WXY/JlwvlfL6OdIZ8xIV7UNLHWXKsaCts5AakJGJXDM=;
        b=boYxpHhId5djao3wjnnRRbdn6in6FPrBYkoQkeDgRZZ6CPq5NgVb+K73aUZ4WQErQp
         8/DkTlSlazekNdR8flv8rz+gPnjugo4PJ2fGfD1MUW6IV75mhlNzAfCznZwamWHJhuNP
         kGB/iEsI5OZubk2nzexJpDf1gOMFjHCpTa6VOhd2cmR1P4wtrD9gCr1LcYbOfOjGEJfR
         +IsdmbAupBGPbn/6X2MXD7NIc7LM9tDEEp+s1DP1b7kWDzDbc0dC260/T30hQIHxZQoI
         Nr9wcZcNRbIZHEkw8pLFnxQg7cMl923Cr4eQ+ihXTJaMBJtKdY0CX5zLrnE92qDfQfOP
         d5Vg==
X-Gm-Message-State: AOJu0YwzT/Gc4we7TtadbVPZqVokb66qFEOwolBPZSH06omW46RHPGLZ
	THXvRAOBKfJpoARmJTnmj4tahLfaBSau+vIohEjcLA==
X-Google-Smtp-Source: AGHT+IHX03ihzDOL3I3hA+RFYOMGm/F7g0uDB5I33CqQ7Op7HLGJaBur/0AASlowkXR6UW9KIh/qeA==
X-Received: by 2002:a05:6a21:3293:b0:18c:f9a7:6f75 with SMTP id yt19-20020a056a21329300b0018cf9a76f75mr6078143pzb.3.1701299115183;
        Wed, 29 Nov 2023 15:05:15 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id u4-20020a17090341c400b001cfc9c926b7sm6918999ple.75.2023.11.29.15.05.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 15:05:14 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/8] grub: fix CVE-2023-4693
Date: Wed, 29 Nov 2023 13:04:56 -1000
Message-Id: <1bbbba098dba85ec1b875512d75f7eca9026e781.1701299008.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701299008.git.steve@sakoman.com>
References: <cover.1701299008.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 23:05:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191467

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://git.savannah.gnu.org/gitweb/?p=grub.git;a=commit;h=0ed2458cc4eff6d9a9199527e2a0b6d445802f94

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../grub/files/CVE-2023-4693.patch            | 62 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2023-4693.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2023-4693.patch b/meta/recipes-bsp/grub/files/CVE-2023-4693.patch
new file mode 100644
index 0000000000..1b6013d86d
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2023-4693.patch
@@ -0,0 +1,62 @@
+From 0ed2458cc4eff6d9a9199527e2a0b6d445802f94 Mon Sep 17 00:00:00 2001
+From: Maxim Suhanov <dfirblog@gmail.com>
+Date: Mon, 28 Aug 2023 16:32:33 +0300
+Subject: [PATCH] fs/ntfs: Fix an OOB read when reading data from the resident
+ $DATA attribute
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
+Reported-by: Maxim Suhanov <dfirblog@gmail.com>
+Signed-off-by: Maxim Suhanov <dfirblog@gmail.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/gitweb/?p=grub.git;a=commit;h=0ed2458cc4eff6d9a9199527e2a0b6d445802f94]
+CVE: CVE-2023-4693
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ grub-core/fs/ntfs.c | 13 ++++++++++++-
+ 1 file changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/grub-core/fs/ntfs.c b/grub-core/fs/ntfs.c
+index 7e43fd6..8f63c83 100644
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
+2.25.1
+
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index aaee8a1e03..e6c6cd98b4 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -39,6 +39,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://commands-boot-Add-API-to-pass-context-to-loader.patch \
            file://CVE-2022-28736-loader-efi-chainloader-Use-grub_loader_set_ex.patch \
 	   file://CVE-2023-4692.patch \
+           file://CVE-2023-4693.patch \
 "
 
 SRC_URI[sha256sum] = "23b64b4c741569f9426ed2e3d0e6780796fca081bee4c99f62aa3f53ae803f5f"
-- 
2.34.1


