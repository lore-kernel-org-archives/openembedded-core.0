Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AD83C4167B
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 03:53:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web11.25594.1702439628421583079
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 19:53:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=MNDbFnYD;
 spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702439629; x=1733975629;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=6TW7XC40FHIov38tzY+M+if5OgmsHtYUdo21NJ4X5OU=;
  b=MNDbFnYDMHZt4HhCJ6FWs4NzTnQpqfP9oP9Gr2N91NvPHYamC7eOpWx/
   Y0hQxuNJxCw8LqOhPgkLIFcVdmJ+s5a76DlY5SByt7g4ijn3bZ1zfpGA/
   k+pHRtUsObEdZZp7v5DOVnlrepgC/hj2MbOkx8/5mlb31QBYlEi5SG32H
   xfBGtjWWVPNDZUA7J9d+N4Vem8+xiOqBbj0wDT8QBvkgJPjtlOf1GOHTS
   zwSjkRacTUQZMaOyP5TgOjMzDvFRHR3qxy+FF4qROjXME+ZkURJ6fH+PH
   1tCyHrybjGvXbKcu78BkX/HTZxlMjFPHqILHk5qS0G9s2opGnLpm9ADTz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="481109631"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="481109631"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 19:53:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="917523926"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="917523926"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by fmsmga001.fm.intel.com with ESMTP; 12 Dec 2023 19:53:48 -0800
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [nanbield][patch 2/6] grub: fix CVE-2023-4692 CVE-2023-4693
Date: Wed, 13 Dec 2023 11:34:05 +0800
Message-Id: <20231213033409.2101308-2-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20231213033409.2101308-1-chee.yang.lee@intel.com>
References: <20231213033409.2101308-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 03:53:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192261

From: Lee Chee Yang <chee.yang.lee@intel.com>

checkout CVE-2023-4692.patch from OE-Core rev:
c89835b37366dde6c74f8221fd5a295ecabf8225

checkout CVE-2023-4693.patch from OE-Core rev:
1bbbba098dba85ec1b875512d75f7eca9026e781

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../grub/files/CVE-2023-4692.patch            | 97 +++++++++++++++++++
 .../grub/files/CVE-2023-4693.patch            | 62 ++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  2 +
 3 files changed, 161 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2023-4692.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2023-4693.patch

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
index 41839698dc..f594e7d3a4 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -42,6 +42,8 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2022-3775.patch \
            file://0001-risc-v-Handle-R_RISCV_CALL_PLT-reloc.patch \
            file://0001-fs-ext2-Ignore-checksum-seed-incompat-feature.patch \
+           file://CVE-2023-4692.patch \
+           file://CVE-2023-4693.patch \
 "
 
 SRC_URI[sha256sum] = "23b64b4c741569f9426ed2e3d0e6780796fca081bee4c99f62aa3f53ae803f5f"
-- 
2.37.3


