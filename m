Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A66FAC46CA0
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 22:53:07 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.10462.1701211984246474743
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 14:53:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=G8GzfYiI;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-5c5f0e325a6so649965a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 14:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701211983; x=1701816783; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WHKxngkCkOR7Bdy9eVtfTzUuPYOkDGk2B9u0KGl3PPQ=;
        b=G8GzfYiIyJJSfKFUKtzQVeJoXqh0mRff//PmoHuhAU/ekE2geCsP8AryOVHZ6dW+zQ
         SQpoSypPD+i22xkqxPZPQGqPSsf6YNBg6DsORpqDo9YyUPv7PjrNtI4YZ4CAvpCv1M2X
         9nDQsrtg4K/qqIayswha4WDRT869tIYgeXS9i9WvnoQCqPUoqix/T4xln+j/RV8+llDo
         ksg0WjUM7yd8tXHjA5QpU3z74HkyqgwMozRSlMPG6kzXJG44dWdVclolD26yT1YsCh8c
         pIz3mPkeGmbcBMkMbm76xX1ltxSoh9qst8qpe4C6GwEQcZMHaLklQeMI/ui86ggPfMGa
         TOEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701211983; x=1701816783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WHKxngkCkOR7Bdy9eVtfTzUuPYOkDGk2B9u0KGl3PPQ=;
        b=Uc99WiZuV6iy8qujZSyeicJeYeRwANxIF6CKiS/hSDEohqjUfgogakOodV+lIMOWL+
         t4rQXNhX6NYpnIpnh8OOi1ziqHXw/fSATw24Vk4RlU99+OWW2Kwhganqs5yagPGz9Fjx
         FHnlpOrP8TpRXbhdvSWcBRjJ88wfU7pvmozUzcUzsoj0ebkt7of6gfcG/ULsNKBOFpYb
         xVjlNGeHgqQQnwSX/TAnqoaii3R3W+k+T9ZcyjmaMkoL4mqzZHR/rPXs62e8m1+l1/+A
         d+7gowE7MUqkQ9Y6CnKww0sJoEayG1ZcXnswh2DWj7iRkXFB7AqsOPpu+jUglttwxxeY
         32FQ==
X-Gm-Message-State: AOJu0Yyemy+onE+EJJfYMmdzUCNj0wxzf97Ds7Qb9Iw3hWnRNuHZaoQ/
	JbK/OBHLXrjhPpn3C8jjrp2B5ZL+QZU+CKrXjGhbzA==
X-Google-Smtp-Source: AGHT+IG6i8D6+fGjN71YQb4WdB+rd6VLQC/UI/3a2ihDmN/Dho2fTfH+EtmEZTuhdW1YeNtpuMZ4ag==
X-Received: by 2002:a17:90b:4f48:b0:285:bb77:1f79 with SMTP id pj8-20020a17090b4f4800b00285bb771f79mr9437269pjb.30.1701211983267;
        Tue, 28 Nov 2023 14:53:03 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id cu20-20020a17090afa9400b00282ecb631a9sm9621898pjb.25.2023.11.28.14.53.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 14:53:02 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/13] grub: fix CVE-2023-4692 & CVE-2023-4693
Date: Tue, 28 Nov 2023 12:52:35 -1000
Message-Id: <f461056d88db0eae5573a0c0ad23c408cff80bd8.1701210903.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701210903.git.steve@sakoman.com>
References: <cover.1701210903.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 22:53:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191403

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://git.savannah.gnu.org/cgit/grub.git/commit/?id=43651027d24e62a7a463254165e1e46e42aecdea && https://git.savannah.gnu.org/gitweb/?p=grub.git;a=commit;h=0ed2458cc4eff6d9a9199527e2a0b6d445802f94

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


