Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web09.17776.1630897607158377309
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Sep 2021 20:06:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10098"; a="219925643"
X-IronPort-AV: E=Sophos;i="5.85,271,1624345200"; 
   d="scan'208";a="219925643"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2021 20:06:47 -0700
X-IronPort-AV: E=Sophos;i="5.85,271,1624345200"; 
   d="scan'208";a="522846492"
Received: from unknown (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.236.127])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2021 20:06:46 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 2/4] tar: Fix CVE-2021-20193
Date: Mon,  6 Sep 2021 11:06:22 +0800
Message-Id: <c2caf2a775f9493fa3d86521daf477e8b20da37b.1630897275.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1630897275.git.anuj.mittal@intel.com>
References: <cover.1630897275.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anatol Belski <anbelski@linux.microsoft.com>

Signed-off-by: Anatol Belski <anbelski@linux.microsoft.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../tar/tar/CVE-2021-20193.patch              | 133 ++++++++++++++++++
 meta/recipes-extended/tar/tar_1.32.bb         |   1 +
 2 files changed, 134 insertions(+)
 create mode 100644 meta/recipes-extended/tar/tar/CVE-2021-20193.patch

diff --git a/meta/recipes-extended/tar/tar/CVE-2021-20193.patch b/meta/recipes-extended/tar/tar/CVE-2021-20193.patch
new file mode 100644
index 0000000000..89e8e20844
--- /dev/null
+++ b/meta/recipes-extended/tar/tar/CVE-2021-20193.patch
@@ -0,0 +1,133 @@
+From d9d4435692150fa8ff68e1b1a473d187cc3fd777 Mon Sep 17 00:00:00 2001
+From: Sergey Poznyakoff <gray@gnu.org>
+Date: Sun, 17 Jan 2021 20:41:11 +0200
+Subject: Fix memory leak in read_header
+
+Bug reported in https://savannah.gnu.org/bugs/?59897
+
+* src/list.c (read_header): Don't return directly from the loop.
+Instead set the status and break.  Return the status.  Free
+next_long_name and next_long_link before returning.
+
+CVE: CVE-2021-20193
+Upstream-Status: Backport
+[https://git.savannah.gnu.org/cgit/tar.git/patch/?id=d9d4435692150fa8ff68e1b1a473d187cc3fd777]
+Signed-off-by: Anatol Belski <anbelski@linux.microsoft.com>
+
+---
+ src/list.c | 40 ++++++++++++++++++++++++++++------------
+ 1 file changed, 28 insertions(+), 12 deletions(-)
+
+diff --git a/src/list.c b/src/list.c
+index e40a5c8..d7ef441 100644
+--- a/src/list.c
++++ b/src/list.c
+@@ -408,26 +408,27 @@ read_header (union block **return_block, struct tar_stat_info *info,
+ 	     enum read_header_mode mode)
+ {
+   union block *header;
+-  union block *header_copy;
+   char *bp;
+   union block *data_block;
+   size_t size, written;
+-  union block *next_long_name = 0;
+-  union block *next_long_link = 0;
++  union block *next_long_name = NULL;
++  union block *next_long_link = NULL;
+   size_t next_long_name_blocks = 0;
+   size_t next_long_link_blocks = 0;
+-
++  enum read_header status = HEADER_SUCCESS;
++  
+   while (1)
+     {
+-      enum read_header status;
+-
+       header = find_next_block ();
+       *return_block = header;
+       if (!header)
+-	return HEADER_END_OF_FILE;
++	{
++	  status = HEADER_END_OF_FILE;
++	  break;
++	}
+ 
+       if ((status = tar_checksum (header, false)) != HEADER_SUCCESS)
+-	return status;
++	break;
+ 
+       /* Good block.  Decode file size and return.  */
+ 
+@@ -437,7 +438,10 @@ read_header (union block **return_block, struct tar_stat_info *info,
+ 	{
+ 	  info->stat.st_size = OFF_FROM_HEADER (header->header.size);
+ 	  if (info->stat.st_size < 0)
+-	    return HEADER_FAILURE;
++	    {
++	      status = HEADER_FAILURE;
++	      break;
++	    }
+ 	}
+ 
+       if (header->header.typeflag == GNUTYPE_LONGNAME
+@@ -447,10 +451,14 @@ read_header (union block **return_block, struct tar_stat_info *info,
+ 	  || header->header.typeflag == SOLARIS_XHDTYPE)
+ 	{
+ 	  if (mode == read_header_x_raw)
+-	    return HEADER_SUCCESS_EXTENDED;
++	    {
++	      status = HEADER_SUCCESS_EXTENDED;
++	      break;
++	    }
+ 	  else if (header->header.typeflag == GNUTYPE_LONGNAME
+ 		   || header->header.typeflag == GNUTYPE_LONGLINK)
+ 	    {
++	      union block *header_copy;
+ 	      size_t name_size = info->stat.st_size;
+ 	      size_t n = name_size % BLOCKSIZE;
+ 	      size = name_size + BLOCKSIZE;
+@@ -517,7 +525,10 @@ read_header (union block **return_block, struct tar_stat_info *info,
+ 	      xheader_decode_global (&xhdr);
+ 	      xheader_destroy (&xhdr);
+ 	      if (mode == read_header_x_global)
+-		return HEADER_SUCCESS_EXTENDED;
++		{
++		  status = HEADER_SUCCESS_EXTENDED;
++		  break;
++		}
+ 	    }
+ 
+ 	  /* Loop!  */
+@@ -536,6 +547,7 @@ read_header (union block **return_block, struct tar_stat_info *info,
+ 	      name = next_long_name->buffer + BLOCKSIZE;
+ 	      recent_long_name = next_long_name;
+ 	      recent_long_name_blocks = next_long_name_blocks;
++	      next_long_name = NULL;
+ 	    }
+ 	  else
+ 	    {
+@@ -567,6 +579,7 @@ read_header (union block **return_block, struct tar_stat_info *info,
+ 	      name = next_long_link->buffer + BLOCKSIZE;
+ 	      recent_long_link = next_long_link;
+ 	      recent_long_link_blocks = next_long_link_blocks;
++	      next_long_link = NULL;
+ 	    }
+ 	  else
+ 	    {
+@@ -578,9 +591,12 @@ read_header (union block **return_block, struct tar_stat_info *info,
+ 	    }
+ 	  assign_string (&info->link_name, name);
+ 
+-	  return HEADER_SUCCESS;
++	  break;
+ 	}
+     }
++  free (next_long_name);
++  free (next_long_link);
++  return status;
+ }
+ 
+ #define ISOCTAL(c) ((c)>='0'&&(c)<='7')
+-- 
+cgit v1.2.1
+
diff --git a/meta/recipes-extended/tar/tar_1.32.bb b/meta/recipes-extended/tar/tar_1.32.bb
index ebe6cb0dbd..3ae6d674a5 100644
--- a/meta/recipes-extended/tar/tar_1.32.bb
+++ b/meta/recipes-extended/tar/tar_1.32.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "${GNU_MIRROR}/tar/tar-${PV}.tar.bz2 \
            file://musl_dirent.patch \
+           file://CVE-2021-20193.patch \
 "
 
 SRC_URI[md5sum] = "17917356fff5cb4bd3cd5a6c3e727b05"
-- 
2.31.1

