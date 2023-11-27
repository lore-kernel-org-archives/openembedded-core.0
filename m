Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A11EC4167B
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 04:42:55 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.86324.1701060168036134893
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Nov 2023 20:42:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=R8gnoOHP;
 spf=pass (domain: mvista.com, ip: 209.85.214.172, mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1cfa5840db3so19107105ad.2
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Nov 2023 20:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1701060167; x=1701664967; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QQIqt3GLazVULlpLOrfxXUu42pR8DReHEsxwjHIa0Ak=;
        b=R8gnoOHP1f3xtc04WjMkMjUl+t21r6r2AoLZ5mo7YEMJoss7euvzCmDPFBOHPjYDc/
         4GjrinJqI0khiff0BGcVwRdm/JjHwqA5K6kTaHyp1aGzORVEvaNNs/soCG+7aKOUPv6c
         DiU/NTM0W4ivdAuvqfh4b33iaeed6UD6QydRE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701060167; x=1701664967;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QQIqt3GLazVULlpLOrfxXUu42pR8DReHEsxwjHIa0Ak=;
        b=wxBZxPeHzOxd/ZZdev2c5MeypZPP6C+SSwIF9JNDw0m9lJmkOOIr77eZQ4vF2/rDGA
         yxUqDODmJ1yK5chVG7KQhf+Py2wcdh1+IQcYy2OoCPvKE+PpcFLbMELfS7oAS7TvlkJ4
         pK0hEGwwU6Xcw+Sc989mjrnNwEkAlEv2B8aFpBi9zmqDfK8dNRmhgVQyPvsi/2+clMEQ
         wCdNII3rscDRixQ39BAVzyechW602gqhjRYaEUrAAkg2PFB4ih3eERDcQpp6Gog0Ny1d
         CtLjlDbZ7H2WWmCiD7wdjlFdKYPUuYKxqQ1w0621KiYJhS0NtW41gsn3VJV98a8tj14M
         NQVw==
X-Gm-Message-State: AOJu0YxL393UvAjU5wOOSK2/JNFyhD3tcuJs5yamyQSVd1SBIAYMtmIg
	+pV02N12YBC5sryAeF+sdhPEiOSs75/8ZO6Tos7atQ==
X-Google-Smtp-Source: AGHT+IFT1120TTiuq4nfJW5Cwg313lJH7YRgeMJGROoeHsMAcm26OjMV19H0Gsfhx3CmR625hKx8Bw==
X-Received: by 2002:a17:902:db11:b0:1cc:4559:ff with SMTP id m17-20020a170902db1100b001cc455900ffmr14203931plx.13.1701060167158;
        Sun, 26 Nov 2023 20:42:47 -0800 (PST)
Received: from MVIN00016.mvista.com ([43.249.234.204])
        by smtp.gmail.com with ESMTPSA id q7-20020a170902dac700b001cca8a01e68sm6900651plx.278.2023.11.26.20.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Nov 2023 20:42:46 -0800 (PST)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] grub: fix CVE-2023-4693
Date: Mon, 27 Nov 2023 10:12:41 +0530
Message-Id: <20231127044241.60037-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 04:42:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191252

Upstream-Status: Backport from https://git.savannah.gnu.org/gitweb/?p=grub.git;a=commit;h=0ed2458cc4eff6d9a9199527e2a0b6d445802f94

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
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
2.25.1


