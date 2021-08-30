Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web12.13900.1630308851415211051
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Aug 2021 00:34:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10091"; a="197789589"
X-IronPort-AV: E=Sophos;i="5.84,362,1620716400"; 
   d="scan'208";a="197789589"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2021 00:34:22 -0700
X-IronPort-AV: E=Sophos;i="5.84,362,1620716400"; 
   d="scan'208";a="509469312"
Received: from hongkekh-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.234.105])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2021 00:34:20 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 6/9] image_types: Restore pre-btrfs-tools 4.14.1 mkfs.btrfs shrink behavior
Date: Mon, 30 Aug 2021 15:33:57 +0800
Message-Id: <6a72c7c688c7985d19f0387121b3a77639ba6f60.1630306698.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1630306698.git.anuj.mittal@intel.com>
References: <cover.1630306698.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Marek Vasut <marex@denx.de>

Currently the mkfs.btrfs generates large images with a lot of wasted
space. This happens since OE-core updated btrfs-tools from 4.13.3 to
4.15.1 in commit 94b645aa77 ("btrfs-tools: update to 4.15.1") .

Note in mkfs.btrfs(8) manpage section -r says the following:
"
  -r|--rootdir <rootdir>
...
       Note This option may enlarge the image or file to ensure
       it’s big enough to contain the files from rootdir. Since
       version 4.14.1 the filesystem size is not minimized. Please
       see option --shrink if you need that functionality.

  --shrink
     Shrink the filesystem to its minimal size, only works with
     --rootdir option.
...
       Note prior to version 4.14.1, the shrinking was done
       automatically.
"

Add the --shrink option to EXTRA_IMAGECMD_btrfs to reinstate the
original behavior and un-waste the space.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c4a99d36967302c176b62fad840b5e79486ea356)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/image_types.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 8028691405..cee577d5da 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -225,7 +225,7 @@ EXTRA_IMAGECMD_jffs2 ?= "--pad ${JFFS2_ENDIANNESS} --eraseblock=${JFFS2_ERASEBLO
 EXTRA_IMAGECMD_ext2 ?= "-i 4096"
 EXTRA_IMAGECMD_ext3 ?= "-i 4096"
 EXTRA_IMAGECMD_ext4 ?= "-i 4096"
-EXTRA_IMAGECMD_btrfs ?= "-n 4096"
+EXTRA_IMAGECMD_btrfs ?= "-n 4096 --shrink"
 EXTRA_IMAGECMD_f2fs ?= ""
 
 do_image_cpio[depends] += "cpio-native:do_populate_sysroot"
-- 
2.31.1

