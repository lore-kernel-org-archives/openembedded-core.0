Return-Path: <armccurdy@gmail.com>
Received: from mail-pl0-f43.google.com (mail-pl0-f43.google.com
	[209.85.160.43])
	by mail.openembedded.org (Postfix) with ESMTP id B009674D75
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 00:14:28 +0000 (UTC)
Received: by mail-pl0-f43.google.com with SMTP id f1-v6so1574360plt.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2018 17:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=d+ZUQy4szZpwIOQ8IpW7wqfmbufovkvUf/qf23sN4S4=;
	b=jXoyfxOWCE/7M+gXBIvEgIemSVTLemsvO8sRdVJ23ZxH9eeKTnC1auj5cTt7yE6wDk
	hA8REMepDPgyUIK2ExM0h4x0qj3bO/IHkukC8XiOPVsNysT5czQ+awFNlihk+Saf6e4U
	NtSSFTHHSEnmuTIzOZqmcuVwqGTzaZW9i7toSZRlYzliN2i0d0wzDdkYVbue1wkE4ShQ
	ussLSrO1ZaAlLczGiTxuXkyQ1zuM736S3de+OJpJPxrqAs3cfKQj8wbyneay3ze1S+w8
	sUtxKsGVk1IW2IHCWJTy5lXjppAUDpTSwB9jDVtraMq/jvGUtkxYipJpi44iwtmWDdnN
	hvvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=d+ZUQy4szZpwIOQ8IpW7wqfmbufovkvUf/qf23sN4S4=;
	b=KcEisTDmHpcnOQxawX7yRQ8jZU32sJJlvWMnZpVYA1mQTxW7JmL4+Od2bT1fyEyZHp
	wkd3trIGjx6SKtn28QLjl3gk5jXEC3ODc097fCU8fomaXn4ysSG93rJQQdYsWYNFovMT
	nSzR+pma0QGB5IGGFhCLIWhpNQ1hTRbcGuuTInYFjQgIfaIHoHBgfiv8NerG824RBNf+
	q5ozMHKAM/K/WZj/oTzx17CL5aOaHZZrJgLMqFcKuevVj3H5kT0biDCh4s6BkAXkpuze
	KmmF3+SQPcH8EAXyW+8DOntsU/BmXrZUesIYmOW4wQoR42ntVPOmWF0vnbOXJkASpL4S
	WuEg==
X-Gm-Message-State: ALKqPwc1CPFbepyQrJrFb5kFDjiqfbiv4gXFsDS1FSTqm7AH5xDZhmG+
	skV867p1QhRJtkogv8npTYVFAA==
X-Google-Smtp-Source: AB8JxZps+GWnhW1iGr0IrghQsen75tGNLog1UZl5WlP2tMh9B7ajRXH/kImaePSQuFRvndAopcU2+w==
X-Received: by 2002:a17:902:43a4:: with SMTP id
	j33-v6mr200830pld.118.1527207269353; 
	Thu, 24 May 2018 17:14:29 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	h75-v6sm44191913pfh.148.2018.05.24.17.14.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 May 2018 17:14:28 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 May 2018 17:14:19 -0700
Message-Id: <1527207259-30592-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1527207259-30592-1-git-send-email-armccurdy@gmail.com>
References: <1527207259-30592-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 3/3] cpio: fix CVE-2016-2037
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 25 May 2018 00:14:28 -0000

"The cpio_safer_name_suffix function in util.c in cpio 2.11 allows
remote attackers to cause a denial of service (out-of-bounds write)
via a crafted cpio file."

  https://nvd.nist.gov/vuln/detail/CVE-2016-2037

Note that there appear to be two versions of this fix. The original
patch posted to the bug-cpio mailing list [1] is used by Debian [2],
but apparently causes regression [3]. The patch accepted to the
upstream git repo [4] seems to be the most complete fix.

  [1] https://lists.gnu.org/archive/html/bug-cpio/2016-01/msg00005.html
  [2] https://security-tracker.debian.org/tracker/CVE-2016-2037
  [3] https://www.mail-archive.com/bug-cpio@gnu.org/msg00584.html
  [4] http://git.savannah.gnu.org/cgit/cpio.git/commit/?id=d36ec5f4e93130efb24fb9678aafd88e8070095b

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 ...-CVE-2016-2037-1-byte-out-of-bounds-write.patch | 346 +++++++++++++++++++++
 meta/recipes-extended/cpio/cpio_2.12.bb            |   1 +
 2 files changed, 347 insertions(+)
 create mode 100644 meta/recipes-extended/cpio/cpio-2.12/0001-CVE-2016-2037-1-byte-out-of-bounds-write.patch

diff --git a/meta/recipes-extended/cpio/cpio-2.12/0001-CVE-2016-2037-1-byte-out-of-bounds-write.patch b/meta/recipes-extended/cpio/cpio-2.12/0001-CVE-2016-2037-1-byte-out-of-bounds-write.patch
new file mode 100644
index 0000000..0a30544
--- /dev/null
+++ b/meta/recipes-extended/cpio/cpio-2.12/0001-CVE-2016-2037-1-byte-out-of-bounds-write.patch
@@ -0,0 +1,346 @@
+From ebf9a2d776474181936a720ce811d72bbd1da3b6 Mon Sep 17 00:00:00 2001
+From: Pavel Raiskup <praiskup@redhat.com>
+Date: Tue, 26 Jan 2016 23:17:54 +0100
+Subject: [PATCH] CVE-2016-2037 - 1 byte out-of-bounds write
+
+Ensure that cpio_safer_name_suffix always works with dynamically
+allocated buffer, and that it has size of at least 32 bytes.
+Then, any call to cpio_safer_name_suffix is safe (it requires at
+least 2 bytes in the buffer).
+
+Also ensure that c_namesize is always correctly initialized (by
+cpio_set_c_name) to avoid undefined behavior when reading
+file_hdr.c_namesize (previously happened for tar archives).
+
+References:
+http://www.mail-archive.com/bug-cpio@gnu.org/msg00545.html
+
+* src/copyin.c (query_rename): Drop the hack, as we now work with
+dynamically allocated buffer.  Use cpio_set_c_name.
+(create_defered_links_to_skipped): Use cpio_set_c_name rather than
+manual assignment.
+(read_name_from_file): New function to avoid C&P.
+(read_in_old_ascii, read_in_new_ascii, read_in_binary): Use
+read_name_from_file.
+(process_copy_in): Initialize file_hdr.c_namesize.
+* src/copyout.c (process_copy_out): Use cpio_set_c_name.
+* src/cpiohdr.h (cpio_set_c_name): New prototype.
+* src/tar.c (read_in_tar_header): Use cpio_set_c_name.
+* src/util.c (cpio_set_c_name): New function to set
+file_hdr->c_name and c_namesize from arbitrary string.
+(cpio_safer_name_suffix): Some docs fixes.
+* tests/inout.at: Also test copy-in, and try various formats.
+
+CVE: CVE-2016-2037
+
+Upstream-Status: Backport [http://git.savannah.gnu.org/cgit/cpio.git/commit/?id=d36ec5f4e93130efb24fb9678aafd88e8070095b]
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+---
+ src/copyin.c   | 68 +++++++++++++++++++---------------------------------------
+ src/copyout.c  | 13 +++++------
+ src/cpiohdr.h  |  1 +
+ src/tar.c      | 10 +++++----
+ src/util.c     | 32 ++++++++++++++++++++++++++-
+ tests/inout.at | 19 ++++++++++++++--
+ 6 files changed, 82 insertions(+), 61 deletions(-)
+
+diff --git a/src/copyin.c b/src/copyin.c
+index cde911e..972f8a6 100644
+--- a/src/copyin.c
++++ b/src/copyin.c
+@@ -76,28 +76,7 @@ query_rename(struct cpio_file_stat* file_hdr, FILE *tty_in, FILE *tty_out,
+       return -1;
+     }
+   else
+-  /* Debian hack: file_hrd.c_name is sometimes set to
+-     point to static memory by code in tar.c.  This
+-     causes a segfault.  This has been fixed and an
+-     additional check to ensure that the file name
+-     is not too long has been added.  (Reported by
+-     Horst Knobloch.)  This bug has been reported to
+-     "bug-gnu-utils@prep.ai.mit.edu". (99/1/6) -BEM */
+-    {
+-      if (archive_format != arf_tar && archive_format != arf_ustar)
+-	{
+-	  free (file_hdr->c_name);
+-	  file_hdr->c_name = xstrdup (new_name.ds_string);
+-	}
+-      else
+-	{
+-	  if (is_tar_filename_too_long (new_name.ds_string))
+-	    error (0, 0, _("%s: file name too long"),
+-		   new_name.ds_string);
+-	  else
+-	    strcpy (file_hdr->c_name, new_name.ds_string);
+-	}
+-    }
++    cpio_set_c_name (file_hdr, new_name.ds_string);
+   return 0;
+ }
+ 
+@@ -344,8 +323,7 @@ create_defered_links_to_skipped (struct cpio_file_stat *file_hdr,
+ 	    d_prev->next = d->next;
+ 	  else
+ 	    deferments = d->next;
+-	  free (file_hdr->c_name);
+-	  file_hdr->c_name = xstrdup(d->header.c_name);
++	  cpio_set_c_name (file_hdr, d->header.c_name);
+ 	  free_deferment (d);
+ 	  copyin_regular_file(file_hdr, in_file_des);
+ 	  return 0;
+@@ -1064,6 +1042,22 @@ read_in_header (struct cpio_file_stat *file_hdr, int in_des)
+     }
+ }
+ 
++static void
++read_name_from_file (struct cpio_file_stat *file_hdr, int fd, uintmax_t len)
++{
++  static char *tmp_filename;
++  static size_t buflen;
++
++  if (buflen < len)
++    {
++      buflen = len;
++      tmp_filename = xrealloc (tmp_filename, buflen);
++    }
++
++  tape_buffered_read (tmp_filename, fd, len);
++  cpio_set_c_name (file_hdr, tmp_filename);
++}
++
+ /* Fill in FILE_HDR by reading an old-format ASCII format cpio header from
+    file descriptor IN_DES, except for the magic number, which is
+    already filled in.  */
+@@ -1090,14 +1084,8 @@ read_in_old_ascii (struct cpio_file_stat *file_hdr, int in_des)
+   file_hdr->c_rdev_min = minor (dev);
+ 
+   file_hdr->c_mtime = FROM_OCTAL (ascii_header.c_mtime);
+-  file_hdr->c_namesize = FROM_OCTAL (ascii_header.c_namesize);
+   file_hdr->c_filesize = FROM_OCTAL (ascii_header.c_filesize);
+-  
+-  /* Read file name from input.  */
+-  if (file_hdr->c_name != NULL)
+-    free (file_hdr->c_name);
+-  file_hdr->c_name = (char *) xmalloc (file_hdr->c_namesize + 1);
+-  tape_buffered_read (file_hdr->c_name, in_des, (long) file_hdr->c_namesize);
++  read_name_from_file (file_hdr, in_des, FROM_OCTAL (ascii_header.c_namesize));
+ 
+   /* HP/UX cpio creates archives that look just like ordinary archives,
+      but for devices it sets major = 0, minor = 1, and puts the
+@@ -1152,14 +1140,8 @@ read_in_new_ascii (struct cpio_file_stat *file_hdr, int in_des)
+   file_hdr->c_dev_min = FROM_HEX (ascii_header.c_dev_min);
+   file_hdr->c_rdev_maj = FROM_HEX (ascii_header.c_rdev_maj);
+   file_hdr->c_rdev_min = FROM_HEX (ascii_header.c_rdev_min);
+-  file_hdr->c_namesize = FROM_HEX (ascii_header.c_namesize);
+   file_hdr->c_chksum = FROM_HEX (ascii_header.c_chksum);
+-  
+-  /* Read file name from input.  */
+-  if (file_hdr->c_name != NULL)
+-    free (file_hdr->c_name);
+-  file_hdr->c_name = (char *) xmalloc (file_hdr->c_namesize);
+-  tape_buffered_read (file_hdr->c_name, in_des, (long) file_hdr->c_namesize);
++  read_name_from_file (file_hdr, in_des, FROM_HEX (ascii_header.c_namesize));
+ 
+   /* In SVR4 ASCII format, the amount of space allocated for the header
+      is rounded up to the next long-word, so we might need to drop
+@@ -1207,16 +1189,9 @@ read_in_binary (struct cpio_file_stat *file_hdr,
+   file_hdr->c_rdev_min = minor (short_hdr->c_rdev);
+   file_hdr->c_mtime = (unsigned long) short_hdr->c_mtimes[0] << 16
+                       | short_hdr->c_mtimes[1];
+-
+-  file_hdr->c_namesize = short_hdr->c_namesize;
+   file_hdr->c_filesize = (unsigned long) short_hdr->c_filesizes[0] << 16
+                       | short_hdr->c_filesizes[1];
+-
+-  /* Read file name from input.  */
+-  if (file_hdr->c_name != NULL)
+-    free (file_hdr->c_name);
+-  file_hdr->c_name = (char *) xmalloc (file_hdr->c_namesize);
+-  tape_buffered_read (file_hdr->c_name, in_des, (long) file_hdr->c_namesize);
++  read_name_from_file (file_hdr, in_des, short_hdr->c_namesize);
+ 
+   /* In binary mode, the amount of space allocated in the header for
+      the filename is `c_namesize' rounded up to the next short-word,
+@@ -1297,6 +1272,7 @@ process_copy_in ()
+       read_pattern_file ();
+     }
+   file_hdr.c_name = NULL;
++  file_hdr.c_namesize = 0;
+ 
+   if (rename_batch_file)
+     {
+diff --git a/src/copyout.c b/src/copyout.c
+index 1f0987a..bb39559 100644
+--- a/src/copyout.c
++++ b/src/copyout.c
+@@ -660,8 +660,7 @@ process_copy_out ()
+ 	  cpio_safer_name_suffix (input_name.ds_string, false,
+ 				  !no_abs_paths_flag, true);
+ #ifndef HPUX_CDF
+-	  file_hdr.c_name = input_name.ds_string;
+-	  file_hdr.c_namesize = strlen (input_name.ds_string) + 1;
++	  cpio_set_c_name (&file_hdr, input_name.ds_string);
+ #else
+ 	  if ( (archive_format != arf_tar) && (archive_format != arf_ustar) )
+ 	    {
+@@ -670,16 +669,15 @@ process_copy_out ()
+ 		 properly recreate the directory as hidden (in case the
+ 		 files of a directory go into the archive before the
+ 		 directory itself (e.g from "find ... -depth ... | cpio")).  */
+-	      file_hdr.c_name = add_cdf_double_slashes (input_name.ds_string);
+-	      file_hdr.c_namesize = strlen (file_hdr.c_name) + 1;
++              cpio_set_c_name (&file_hdr,
++                               add_cdf_double_slashes (input_name.ds_string));
+ 	    }
+ 	  else
+ 	    {
+ 	      /* We don't mark CDF's in tar files.  We assume the "hidden"
+ 		 directory will always go into the archive before any of
+ 		 its files.  */
+-	      file_hdr.c_name = input_name.ds_string;
+-	      file_hdr.c_namesize = strlen (input_name.ds_string) + 1;
++              cpio_set_c_name (&file_hdr, input_name.ds_string);
+ 	    }
+ #endif
+ 
+@@ -866,8 +864,7 @@ process_copy_out ()
+   file_hdr.c_chksum = 0;
+ 
+   file_hdr.c_filesize = 0;
+-  file_hdr.c_namesize = 11;
+-  file_hdr.c_name = CPIO_TRAILER_NAME;
++  cpio_set_c_name (&file_hdr, CPIO_TRAILER_NAME);
+   if (archive_format != arf_tar && archive_format != arf_ustar)
+     write_out_header (&file_hdr, out_file_des);
+   else
+diff --git a/src/cpiohdr.h b/src/cpiohdr.h
+index b29e6fb..f4c63be 100644
+--- a/src/cpiohdr.h
++++ b/src/cpiohdr.h
+@@ -129,5 +129,6 @@ struct cpio_file_stat /* Internal representation of a CPIO header */
+   char *c_tar_linkname;
+ };
+ 
++void cpio_set_c_name(struct cpio_file_stat *file_hdr, char *name);
+ 
+ #endif /* cpiohdr.h */
+diff --git a/src/tar.c b/src/tar.c
+index a2ce171..e41f89d 100644
+--- a/src/tar.c
++++ b/src/tar.c
+@@ -282,7 +282,7 @@ read_in_tar_header (struct cpio_file_stat *file_hdr, int in_des)
+       if (null_block ((long *) &tar_rec, TARRECORDSIZE))
+ #endif
+ 	{
+-	  file_hdr->c_name = CPIO_TRAILER_NAME;
++	  cpio_set_c_name (file_hdr, CPIO_TRAILER_NAME);
+ 	  return;
+ 	}
+ #if 0
+@@ -316,9 +316,11 @@ read_in_tar_header (struct cpio_file_stat *file_hdr, int in_des)
+ 	}
+ 
+       if (archive_format != arf_ustar)
+-	file_hdr->c_name = stash_tar_filename (NULL, tar_hdr->name);
++        cpio_set_c_name (file_hdr, stash_tar_filename (NULL, tar_hdr->name));
+       else
+-	file_hdr->c_name = stash_tar_filename (tar_hdr->prefix, tar_hdr->name);
++        cpio_set_c_name (file_hdr, stash_tar_filename (tar_hdr->prefix,
++                                                      tar_hdr->name));
++
+       file_hdr->c_nlink = 1;
+       file_hdr->c_mode = FROM_OCTAL (tar_hdr->mode);
+       file_hdr->c_mode = file_hdr->c_mode & 07777;
+@@ -398,7 +400,7 @@ read_in_tar_header (struct cpio_file_stat *file_hdr, int in_des)
+ 	case AREGTYPE:
+ 	  /* Old tar format; if the last char in filename is '/' then it is
+ 	     a directory, otherwise it's a regular file.  */
+-	  if (file_hdr->c_name[strlen (file_hdr->c_name) - 1] == '/')
++	  if (file_hdr->c_name[file_hdr->c_namesize - 1] == '/')
+ 	    file_hdr->c_mode |= CP_IFDIR;
+ 	  else
+ 	    file_hdr->c_mode |= CP_IFREG;
+diff --git a/src/util.c b/src/util.c
+index 6ff6032..4f3c073 100644
+--- a/src/util.c
++++ b/src/util.c
+@@ -1410,8 +1410,34 @@ set_file_times (int fd,
+     utime_error (name);
+ }
+ 
++
++void
++cpio_set_c_name (struct cpio_file_stat *file_hdr, char *name)
++{
++  static size_t buflen = 0;
++  size_t len = strlen (name) + 1;
++
++  if (buflen == 0)
++    {
++      buflen = len;
++      if (buflen < 32)
++        buflen = 32;
++      file_hdr->c_name = xmalloc (buflen);
++    }
++  else if (buflen < len)
++    {
++      buflen = len;
++      file_hdr->c_name = xrealloc (file_hdr->c_name, buflen);
++    }
++
++  file_hdr->c_namesize = len;
++  memmove (file_hdr->c_name, name, len);
++}
++
+ /* Do we have to ignore absolute paths, and if so, does the filename
+-   have an absolute path?  */
++   have an absolute path?  Before calling this function make sure that the
++   allocated NAME buffer has capacity at least 2 bytes. */
++
+ void
+ cpio_safer_name_suffix (char *name, bool link_target, bool absolute_names,
+ 			bool strip_leading_dots)
+@@ -1426,6 +1452,10 @@ cpio_safer_name_suffix (char *name, bool link_target, bool absolute_names,
+ 	  ++p;
+       }
+   if (p != name)
++    /* The 'p' string is shortened version of 'name' with one exception;  when
++       the 'name' points to an empty string (buffer where name[0] == '\0') the
++       'p' then points to static string ".".  So caller needs to ensure there
++       are at least two bytes available in 'name' buffer so memmove succeeds. */
+     memmove (name, p, (size_t)(strlen (p) + 1));
+ }
+ 
+diff --git a/tests/inout.at b/tests/inout.at
+index 60c3716..730cbd2 100644
+--- a/tests/inout.at
++++ b/tests/inout.at
+@@ -35,7 +35,22 @@ while read NAME LENGTH
+ do
+ 	genfile --length $LENGTH > $NAME
+ 	echo $NAME
+-done < filelist |
+- cpio --quiet -o > archive])
++done < filelist > filelist_raw
++
++for format in bin odc newc crc tar ustar hpbin hpodc
++do
++    cpio --format=$format --quiet -o < filelist_raw > archive.$format
++    rm -rf output
++    mkdir output && cd output
++    cpio -i --quiet < ../archive.$format
++
++    while read file
++    do
++        test -f $file || echo "$file not found"
++    done < ../filelist_raw
++
++    cd ..
++done
++])
+ 
+ AT_CLEANUP
+-- 
+1.9.1
+
diff --git a/meta/recipes-extended/cpio/cpio_2.12.bb b/meta/recipes-extended/cpio/cpio_2.12.bb
index 19ad69b..69d3698 100644
--- a/meta/recipes-extended/cpio/cpio_2.12.bb
+++ b/meta/recipes-extended/cpio/cpio_2.12.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
 SRC_URI = "${GNU_MIRROR}/cpio/cpio-${PV}.tar.gz \
            file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
            file://0001-Fix-CVE-2015-1197.patch \
+           file://0001-CVE-2016-2037-1-byte-out-of-bounds-write.patch \
            "
 
 SRC_URI[md5sum] = "fc207561a86b63862eea4b8300313e86"
-- 
1.9.1


