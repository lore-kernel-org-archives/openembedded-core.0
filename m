Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web09.8042.1620830943115034826
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 07:49:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=bqGEw4/x;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.46, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f46.google.com with SMTP id 69-20020a9d0a4b0000b02902ed42f141e1so10588224otg.2
        for <openembedded-core@lists.openembedded.org>; Wed, 12 May 2021 07:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=HC+6qq5FwdldSqP3FzSDUvZlXbhOzyntJkxOMazT6rw=;
        b=bqGEw4/x2r9lWpvrP8Bax6HqzzPR3e7JUEhwD1XCwUEgQPhD1wvIWT/jaygPh+PDkH
         9PRreVkztVNu39YVgRPZCF3g4kPb7oFW9hjokOLvnAqSXtpTwe+HV1tusgqNUFt4SUE1
         KSMCl3LQE6wLm7yhLgKigi29bHwHo7/NqlxuNBL8rtPX++6L4rleZqpA723IwVPL1bam
         qiMIJCKdFE06o/9I0ZzKu4Lc84vzP5tLCyL8mzFtM3PqZDXaLD4ujXxsf7elBDKv8XlG
         s44LuNRnreJ0xveWnmVwA8zrE7MJQbdD1Bd/e35w6SjEwo8DthQC5KbYlBuFIAg9jD+L
         f2vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HC+6qq5FwdldSqP3FzSDUvZlXbhOzyntJkxOMazT6rw=;
        b=swWjYxkKoYAME+3Z6Tof/yIH7WxFVZBcp28NjK8Ie3OeZU6Cjo9SeA0jQgSHY8fc3g
         r33XqHrAxwaMZs/FeZceWCy/rEQHWJSpZz7CWaBdjtZmaRJ1fNCOdRtMOKfFmpkrrVsO
         iiy+rCdgHaQvjf1aRKC1CfxtPohg4K0L8NrcXVdF5tRBlwda0stJ2JA2uUwwNjw7KKLp
         m9sY/29y577WD2frEN94wb2TY73PqKC4HE0CYFtpg5maPrkMR9qMesr6g4YmKfSjKjmB
         Gq+6JvpIe/DOkBa/t8sOvQt/pbn1ifhvlwi+jB1kg8f2BMQzyETvxdgmmBZlZUe+RghJ
         ZhNQ==
X-Gm-Message-State: AOAM5311JqnAk76ouyAZKnXCpjY7Pp20CufllVOtPIBGAUKSoofO/kRj
	rXYdx9U6ByhyRwpkZVWoxhPNxEnpTF2YqAvUua0=
X-Google-Smtp-Source: ABdhPJxaOwg4Scugk7vNdf+Q7rPz+AqDJIAKExHO47cA03aphOQTpemOmroC4ciFSW5gdHeK5JSNOA==
X-Received: by 2002:a9d:5a12:: with SMTP id v18mr4924371oth.306.1620830941871;
        Wed, 12 May 2021 07:49:01 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id q1sm4621203otc.21.2021.05.12.07.48.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 07:49:01 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/25] tar: Fix CVE-2021-20193
Date: Wed, 12 May 2021 04:47:30 -1000
Message-Id: <c8f48471bea67cbf0f12a35639b764f90acae854.1620830796.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1620830796.git.steve@sakoman.com>
References: <cover.1620830796.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anatol Belski <anbelski@linux.microsoft.com>

Signed-off-by: Anatol Belski <anbelski@linux.microsoft.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1

