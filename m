Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69AFAC61D85
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 02:31:24 +0000 (UTC)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
 by mx.groups.io with SMTP id smtpd.web10.10871.1700620283544698419
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Nov 2023 18:31:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=dhsS51Ax;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.175, mailfrom: steve@sakoman.com)
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3574297c79eso22474395ab.1
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 18:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700620282; x=1701225082; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1rKm4xhR+Sufw+tn0LMDAF8GZBM23fJVr/CUedmE484=;
        b=dhsS51AxVEdq5jhxnJvS2pn9WnAhEmuT9BgdioEy8Hoi9B8986F3bCDKi0B6eAiTjS
         zB9AV7fGdtiYPVSV5C+IOnt88+Fzy7n2lvKuxAZsMCzesJwp+CG7EK2nbcPELkuWXhhT
         rdHoWYEk6LoMEJ8DFZ0igVZ8L11ziiTgXX7otlcixi66DCjbuewp5URlUueEukIkist4
         NgLfgXFZr5ZJSpf/Lrbe3Ta7asndiHa81xrZkAWyjdVgYdtX3j48wl6UO2fVUoavfi0p
         fQCdaJa6hO4YSuRw75subtIHnvLmMmXOO5MEfmkA8b6QESzq0I2mW9VcvwwwmA2HwC8j
         MwKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700620282; x=1701225082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1rKm4xhR+Sufw+tn0LMDAF8GZBM23fJVr/CUedmE484=;
        b=QM3COkU6scv9N7xVTaAb3KiTBuHfOED4df5H5sr8ZExpmwqvHpVFKdoXPySDhGheTV
         XbRwLSCQVKJz55RFLn5s5gJnQPWSJjgpKZXJn0Ld7FDwSK4a7LG8WCR/muARMJ1LRV0t
         1jeq0JzJ0SiW8y7nuFl9ipEDesLFy+ZG34z5jP9wRfjM6HLeuGSOzEs3UO8TT9MIZxTE
         VxgJkUOIJjiDLiJQQEmU9MhpRGvLGJ0wy1B0C6qenoPu3yDw6nOkaQYIdS/nIWSYsKAX
         0vwasGPqZDBDPivw6D7EvvPGV2bhffgSYX2vFeg46bf4HQUqk76eorslus9mwl7GuZev
         OCeQ==
X-Gm-Message-State: AOJu0YyJr1AenZ97cb1mHpOF66ymz2B9yCLgVjAGfXitXT1Dmr9j6qV4
	StB+aVjTcjV6TLcLAqvK75kqLsLEQEsHSs07bPbKXg==
X-Google-Smtp-Source: AGHT+IEzVnefs42/k9IzMfEKO94xd7DFkaagwKXi6xNT7wPpvxSztE3f/Q/3yd62YM9Ep6pO4MM3QQ==
X-Received: by 2002:a92:c56f:0:b0:351:5acb:281 with SMTP id b15-20020a92c56f000000b003515acb0281mr1027338ilj.31.1700620281938;
        Tue, 21 Nov 2023 18:31:21 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id d11-20020a056a00198b00b006cb9a43ae4esm4384182pfl.215.2023.11.21.18.31.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 18:31:21 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/16] grub: fix CVE-2023-4692
Date: Tue, 21 Nov 2023 16:30:59 -1000
Message-Id: <c89835b37366dde6c74f8221fd5a295ecabf8225.1700620126.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700620126.git.steve@sakoman.com>
References: <cover.1700620126.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 02:31:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191001

From: Yogita Urade <yogita.urade@windriver.com>

An out-of-bounds write flaw was found in grub2's NTFS filesystem driver.
This issue may allow an attacker to present a specially crafted NTFS
filesystem image, leading to grub's heap metadata corruption. In some
circumstances, the attack may also corrupt the UEFI firmware heap metadata.
As a result, arbitrary code execution and secure boot protection bypass
may be achieved.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-4692
https://bugzilla.redhat.com/show_bug.cgi?id=2236613

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../grub/files/CVE-2023-4692.patch            | 97 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 98 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2023-4692.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2023-4692.patch b/meta/recipes-bsp/grub/files/CVE-2023-4692.patch
new file mode 100644
index 0000000000..4780e35b7a
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2023-4692.patch
@@ -0,0 +1,97 @@
+From  43651027d24e62a7a463254165e1e46e42aecdea Mon Sep 17 00:00:00 2001
+From: Maxim Suhanov <dfirblog@gmail.com>
+Date: Thu, 16 Nov 2023 07:21:50 +0000
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
+CVE: CVE-2023-4692
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=43651027d24e62a7a463254165e1e46e42aecdea]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ grub-core/fs/ntfs.c | 18 +++++++++++++++++-
+ 1 file changed, 17 insertions(+), 1 deletion(-)
+
+diff --git a/grub-core/fs/ntfs.c b/grub-core/fs/ntfs.c
+index 2f34f76..6009e49 100644
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
+	    }
+	  at->attr_nxt = at->edat_buf;
+	  at->attr_end = at->edat_buf + u32at (pa, 0x30);
++	  pa_end = at->edat_buf + n;
+	}
+       else
+	{
+	  at->attr_nxt = at->attr_end + u16at (pa, 0x14);
+	  at->attr_end = at->attr_end + u32at (pa, 4);
++	  pa_end = at->mft->buf + (at->mft->data->mft_size << GRUB_NTFS_BLK_SHR);
+	}
+       at->flags |= GRUB_NTFS_AF_ALST;
+       while (at->attr_nxt < at->attr_end)
+@@ -230,6 +232,13 @@ find_attr (struct grub_ntfs_attr *at, grub_uint8_t attr)
+	  at->flags |= GRUB_NTFS_AF_GPOS;
+	  at->attr_cur = at->attr_nxt;
+	  pa = at->attr_cur;
++
++	  if ((pa >= pa_end) || (pa_end - pa < 0x18))
++	    {
++	      grub_error (GRUB_ERR_BAD_FS, "can\'t parse attribute list");
++	      return NULL;
++	    }
++
+	  grub_set_unaligned32 ((char *) pa + 0x10,
+				grub_cpu_to_le32 (at->mft->data->mft_start));
+	  grub_set_unaligned32 ((char *) pa + 0x14,
+@@ -240,6 +249,13 @@ find_attr (struct grub_ntfs_attr *at, grub_uint8_t attr)
+	    {
+	      if (*pa != attr)
+		break;
++
++              if ((pa >= pa_end) || (pa_end - pa < 0x18))
++                {
++	          grub_error (GRUB_ERR_BAD_FS, "can\'t parse attribute list");
++	          return NULL;
++		}
++
+	      if (read_attr
+		  (at, pa + 0x10,
+		   u32at (pa, 0x10) * (at->mft->data->mft_size << GRUB_NTFS_BLK_SHR),
+--
+2.40.0
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index c14fe315d3..aaee8a1e03 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -38,6 +38,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://loader-efi-chainloader-Simplify-the-loader-state.patch \
            file://commands-boot-Add-API-to-pass-context-to-loader.patch \
            file://CVE-2022-28736-loader-efi-chainloader-Use-grub_loader_set_ex.patch \
+	   file://CVE-2023-4692.patch \
 "
 
 SRC_URI[sha256sum] = "23b64b4c741569f9426ed2e3d0e6780796fca081bee4c99f62aa3f53ae803f5f"
-- 
2.34.1


