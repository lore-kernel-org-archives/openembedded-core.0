Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C5F6C4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 05:00:04 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.25957.1701147601590254088
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Nov 2023 21:00:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=MXM1wdOa;
 spf=pass (domain: mvista.com, ip: 209.85.214.179, mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1ce3084c2d1so42056855ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 21:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1701147601; x=1701752401; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LDqLAAwSeJnWAkKchnY14hWz/tUmZ8STjtGmVZ2rTSo=;
        b=MXM1wdOahrNh6J0flFHI5eLLgB4uSJPRSijKZsxCzc0BXk96uA7PZd8L0IRfqTAqVt
         pFIuTy2RHeKA8zLMKgv9ajlSPUGDVMV0I4jV5TPHISTy4rwICK68FqsYlMxYCscRIYnb
         JWuAcEQ11K1DF1INGSRHn9AqdJhhUqLUDnMUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701147601; x=1701752401;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LDqLAAwSeJnWAkKchnY14hWz/tUmZ8STjtGmVZ2rTSo=;
        b=oOobYADSbauDnleT45md0qRO+ZK1EVMgygsoB3h/m7t8ZheF+hT4Ag4x6hrGDbLpuH
         D7kigI0gzIXjiNKKzVDzNmDI+9iS1aJ5upN9mOh5Rzvzcn5gwJCJ1GgDjKsv/zxWX4Ke
         MIKxjw04Fy8ot5SAnLV+g103mTMfwrqvDYOt0TqC6nOvY1duGSYbmam1VMDHih9U3jyG
         ha/t62490CkHIjycpzu+twwNGcgL0+NEt1c98PxOZH5qIPiQYkTVEB2Cp5qP4t1DQ/Eu
         X6FzJgUYbjoirmuXiirrf4Tys//F0WTflamOZ0M/M1gpxn2M9ltB1C1Q7ImtJ7WeHoKa
         58qw==
X-Gm-Message-State: AOJu0YzAitWhJ+CH7f+opURsRH48rzIfLMrRr9d/Yzz9WFGPHFeo+1Ou
	InbaA+0qAOu7JrXuir7zZCOHhREfAt+Da5ax6J/nVw==
X-Google-Smtp-Source: AGHT+IGBk67eS9LDuabe4HmQT1rocfdZtPGRd2S6vUtRryeHtpb3myRYzBooYpypH3WDdlaEYS7f/Q==
X-Received: by 2002:a17:903:41c6:b0:1cf:584e:d724 with SMTP id u6-20020a17090341c600b001cf584ed724mr19100290ple.10.1701147600666;
        Mon, 27 Nov 2023 21:00:00 -0800 (PST)
Received: from MVIN00016.mvista.com ([27.121.101.117])
        by smtp.gmail.com with ESMTPSA id q2-20020a170902dac200b001cfc4d8eddesm3771312plx.180.2023.11.27.20.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 21:00:00 -0800 (PST)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [[dunfell][PATCH] grub: fix CVE-2023-4692 & CVE-2023-4693
Date: Tue, 28 Nov 2023 10:29:52 +0530
Message-Id: <20231128045952.61390-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 05:00:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191334

Upstream-Status: Backport from https://git.savannah.gnu.org/cgit/grub.git/commit/?id=43651027d24e62a7a463254165e1e46e42aecdea && https://git.savannah.gnu.org/gitweb/?p=grub.git;a=commit;h=0ed2458cc4eff6d9a9199527e2a0b6d445802f94

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../grub/files/CVE-2023-4692.patch            | 97 +++++++++++++++++++
 .../grub/files/CVE-2023-4693.patch            | 62 ++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  2 +
 3 files changed, 161 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2023-4692.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2023-4693.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2023-4692.patch b/meta/recipes-bsp/grub/files/CVE-2023-4692.patch
new file mode 100644
index 0000000000..0e74870ebf
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2023-4692.patch
@@ -0,0 +1,97 @@
+From 43651027d24e62a7a463254165e1e46e42aecdea Mon Sep 17 00:00:00 2001
+From: Maxim Suhanov <dfirblog@gmail.com>
+Date: Mon, 28 Aug 2023 16:31:57 +0300
+Subject: [PATCH] fs/ntfs: Fix an OOB write when parsing the $ATTRIBUTE_LIST
+ attribute for the $MFT file
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
+Reported-by: Maxim Suhanov <dfirblog@gmail.com>
+Signed-off-by: Maxim Suhanov <dfirblog@gmail.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=43651027d24e62a7a463254165e1e46e42aecdea]
+CVE: CVE-2023-4692
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ grub-core/fs/ntfs.c | 18 +++++++++++++++++-
+ 1 file changed, 17 insertions(+), 1 deletion(-)
+
+diff --git a/grub-core/fs/ntfs.c b/grub-core/fs/ntfs.c
+index 2f34f76..c8d3683 100644
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
+2.25.1
+
diff --git a/meta/recipes-bsp/grub/files/CVE-2023-4693.patch b/meta/recipes-bsp/grub/files/CVE-2023-4693.patch
new file mode 100644
index 0000000000..1e6b6efdec
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
+index c8d3683..4d1fe42 100644
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
index bfcda76c24..bea03f4fc1 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -109,6 +109,8 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2020-27749.patch \
            file://CVE-2021-20225.patch \
            file://CVE-2021-20233.patch \
+           file://CVE-2023-4692.patch \
+           file://CVE-2023-4693.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.25.1


