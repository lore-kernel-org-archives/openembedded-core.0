Return-Path: <hjadon@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 582FBCD98F6
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 04:03:08 +0000 (UTC)
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35831.1781841779824511198
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2026 21:03:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=g+D1y52b;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: hjadon@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=47244; q=dns/txt;
  s=iport01; t=1781841779; x=1783051379;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zx0gJ1S2miZbO849wYtpmkNKISXsFW/ulb35e7k0eg4=;
  b=g+D1y52beUJCEwTLGj+lGSFAvjgcJhNmIKSZTDFb0Fie8D1wUx3BBKmD
   lHutrVV87WoCukqxbLWWW1/T6diC3h1dM9OjgG9stAZZzsZ7gi5s97QcM
   CYwcpiXsqlcouTKRGz8inNkB9q8QUBgkkUGyDD2vTXGYx92DEnbJsk5cs
   6JcqAvSMfufd7ioGfXKnJdX1rsobnVsRtkB6+Hj1gYaQ/hIz6M8qwuQtF
   SVwzko68Kxrys5u7tWlhZ6LfwExcdoY4Xcv64+hE4NOtyFzSG+nddwp7g
   O+rggpDa5/oTXyGYoUIbupuEyJmmEprXhKKgXvXGkM3WiKHkcTwsjiJ2N
   w==;
X-CSE-ConnectionGUID: TaUaTvljRcuudyAVhLlqCA==
X-CSE-MsgGUID: 2amuvfPBRn6DJwKtIsMYlQ==
X-IPAS-Result: =?us-ascii?q?A0BqBgC9vjRq/4//Ja0+GAQdAQEBAQkBEgEFBQGCEIJXd?=
 =?us-ascii?q?F5DSQOEGDyRdItnj1iCc4FkBg8BAQEPLhYNBAEBghKCdI1KAiY4EwECBAMCA?=
 =?us-ascii?q?wEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBDhOGFQgyDScEAgGGLAECAQQLDgEIB?=
 =?us-ascii?q?AsBNBIZEgEDAQIDAiYCIgcEIxgJCRGCaAGCOgM2AxEGQpZzm0R6fzOBAYNaA?=
 =?us-ascii?q?gMJAkNQ2EkIBRCCRgELFAGBCi6FP4J8IAGFAlsYAYR8JxsbgXKBFYNpgQWBG?=
 =?us-ascii?q?jcLAwEBF4EJCAERAgEGDoNngmoEgiKBDIFaGIEfgRksgVGDaYcYSIECHANZL?=
 =?us-ascii?q?AFVEw0KCwcFgWYDNRIqFW4yHYEjPhc0WBsHBYEegXuBAoUDIx8DOX+BaIElZ?=
 =?us-ascii?q?2YVMDWBAQERHwqBJAMLGA1IESw3FBsEPQFuB4x3Fw4BgXAgDQ4LBgEBFRcED?=
 =?us-ascii?q?D4JCgEHDAgOAQFQCDgBCBYWBwEEDx0BLhweDQeSVAMJBwqQFoIhgTWeOTBxC?=
 =?us-ascii?q?iiDdYwhjT6CAIV8GjOEBIFXkkCSUZkIglmKA4EuhAmDU44GBmiEaIF/JWlwc?=
 =?us-ascii?q?BU7DQmCUQkKQBkPgzeKdgsLgXgfhB+CPb9/JzICAQEHAzABBwIHAQwEgXOQA?=
 =?us-ascii?q?CyBUQEB?=
IronPort-Data: A9a23:bZtG+K9l68+Xn55KLk07DrUD13+TJUtcMsCJ2f8bNWPcYEJGY0x3n
 TEdXz+Abq7fNGb1fYxwOoy0oR5U7ZeGy4RjQVFkryBEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4muyyHjEAX9gWAsbDtEs/7rRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kKNLARxvhzA1tF6
 OEUORkzbjSHnsmflefTpulE3qzPLeHxN48Z/3UlxjbDALN+H9bIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZP0Yn1lQ/UPrSmM+ohHDzdDtwo1OOrq1x6G/WpOB0+OS8boqKJ4PbGq25mG7Cr
 2fb4WrBKCscavC91hmZ02mJt+v2yHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl7HQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:eQUNsqviev8eLGkxD3MqSwjx7skDWtV00zEX/kB9WHVpmwKj+P
 xG+85rsSMc6QxhPU3I9urgBEDtex7hHP1OkOss1MmZPDUO0VHAROoJ0WKI+VPd8kPFmtK1rZ
 0QEJRWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqEuEiWpRGthdB8ATMHf8LnFL
X-Talos-CUID: 9a23:7ipyFGO+xnZqie5DZCBa/XIKHsIfeWDAwGb5HU+cDX9CYejA
X-Talos-MUID: =?us-ascii?q?9a23=3A1qG0cA856U6P9wJ2BYAOl86Qf51h5rmwBngnq5N?=
 =?us-ascii?q?Yl+ubFjBRIBKsiA3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,212,1774310400"; 
   d="scan'208";a="496875797"
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Jun 2026 04:02:57 +0000
Received: from sjc-ads-21441.cisco.com (sjc-ads-21441.cisco.com [10.128.164.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id 9D0B518000394;
	Fri, 19 Jun 2026 04:02:57 +0000 (GMT)
Received: by sjc-ads-21441.cisco.com (Postfix, from userid 1879343)
	id D2507CC1611; Thu, 18 Jun 2026 21:02:56 -0700 (PDT)
From: "Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hjadon@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: vchavda@cisco.com
Subject: [OE-core] [master] [PATCH v2] tar: Fix CVE-2026-5704
Date: Thu, 18 Jun 2026 21:02:50 -0700
Message-Id: <20260619040250.2179888-1-hjadon@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-21441.cisco.com [10.128.164.182];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.128.164.182, sjc-ads-21441.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 04:03:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239116

From: Himanshu Jadon <hjadon@cisco.com>

Backport the upstream 3-commit fix chain for CVE-2026-5704.

The final CVE fix is [1], which depends on the earlier cleanup in [2]
and the behavioral change in [3]. Keep this patch order so the final
fix applies cleanly and preserves the upstream logic.

Also include upstream follow-up [4] to fix the --no-overwrite-dir ptest
regression caused by the CVE backport. Without this follow-up, tar can
temporarily chmod an existing directory even when --no-overwrite-dir is
used, which breaks the upstream --no-overwrite-dir ptest.

[1] https://cgit.git.savannah.gnu.org/cgit/tar.git/commit/?id=b8d8a61b25588caca4efaf9bdd2e3f1a49da77e3
[2] https://cgit.git.savannah.gnu.org/cgit/tar.git/commit/?id=112ead79312ea308e58414b74623f101b8c06f0b
[3] https://cgit.git.savannah.gnu.org/cgit/tar.git/commit/?id=b009124ffde415515081db844d7a104e1d1c6c58
[4] https://cgit.git.savannah.gnu.org/cgit/tar.git/commit/?id=4e742fc8674064a9fa00d4483d06aca48d5b0463
[5] https://security-tracker.debian.org/tracker/CVE-2026-5704

Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
---
Changes in v2:
- Add upstream follow-up 4e742fc8674064 as CVE-2026-5704-regression.patch
  to fix the --no-overwrite-dir ptest regression caused by the CVE backport.
- Applied the regression patch after CVE-2026-5704.patch.

 .../tar/tar/CVE-2026-5704-dependent_p1.patch  | 484 +++++++++++++++
 .../tar/tar/CVE-2026-5704-dependent_p2.patch  | 169 ++++++
 .../tar/tar/CVE-2026-5704-regression.patch    | 176 ++++++
 .../tar/tar/CVE-2026-5704.patch               | 556 ++++++++++++++++++
 meta/recipes-extended/tar/tar_1.35.bb         |   4 +
 5 files changed, 1389 insertions(+)
 create mode 100644 meta/recipes-extended/tar/tar/CVE-2026-5704-dependent_p1.patch
 create mode 100644 meta/recipes-extended/tar/tar/CVE-2026-5704-dependent_p2.patch
 create mode 100644 meta/recipes-extended/tar/tar/CVE-2026-5704-regression.patch
 create mode 100644 meta/recipes-extended/tar/tar/CVE-2026-5704.patch

diff --git a/meta/recipes-extended/tar/tar/CVE-2026-5704-dependent_p1.patch b/meta/recipes-extended/tar/tar/CVE-2026-5704-dependent_p1.patch
new file mode 100644
index 0000000000..b7180e1671
--- /dev/null
+++ b/meta/recipes-extended/tar/tar/CVE-2026-5704-dependent_p1.patch
@@ -0,0 +1,484 @@
+From cb6d041ba711620b52637ebd2f9cb0c445a91e4f Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Fri, 1 Nov 2024 14:15:09 -0700
+Subject: [PATCH] Prefer other types to int in extract.c
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+* src/extract.c (fd_chmod, extract_chdir, open_output_file)
+(extract_file, extract_link, extract_symlink, extract_node)
+(extract_fifo, tar_extractor_t, pepare_to_extract): Prefer char to
+int for typeflag, since it’s a char.  All uses changed.
+(fd_chmod): Use clearer code for errno.
+(extract_dir, extract_file, create_placeholder_file, extract_link)
+(extract_symlink, extract_node, extract_fifo, tar_extractor_t):
+Return bool true for success, false for failure.  All uses changed.
+(open_output_file): Prefer bool for boolean.
+(prepare_to_extract): Simplify by returning the extractor a null
+pointer, rather than storing through a pointer to an extractor.
+
+CVE: CVE-2026-5704
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/tar.git/commit/?id=112ead79312ea308e58414b74623f101b8c06f0b]
+
+Backport Changes:
+- In src/extract.c, the extractor-selection and extraction-control-flow
+  hunk was adapted to the older tar-1.35 code layout around
+  prepare_to_extract() and extract_archive(). The backport preserves the
+  upstream logic but does not apply as an exact textual match in that
+  section.
+
+(cherry picked from commit 112ead79312ea308e58414b74623f101b8c06f0b)
+Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
+---
+ src/extract.c | 141 ++++++++++++++++++++++++--------------------------
+ 1 file changed, 69 insertions(+), 72 deletions(-)
+
+diff --git a/src/extract.c b/src/extract.c
+index 314d8bc0..b384fed3 100644
+--- a/src/extract.c
++++ b/src/extract.c
+@@ -254,9 +254,9 @@ fd_i_chmod (int fd, char const *file, mode_t mode, int atflag)
+    notation.
+  */
+ static int
+-fd_chmod(int fd, char const *file_name, int mode, int atflag, int typeflag)
++fd_chmod (int fd, char const *file_name, int mode, int atflag, char typeflag)
+ {
+-  int chmod_errno = fd_i_chmod (fd, file_name, mode, atflag) == 0 ? 0 : errno;
++  int chmod_errno = fd_i_chmod (fd, file_name, mode, atflag) < 0 ? errno : 0;
+ 
+   /* On Solaris, chmod may fail if we don't have PRIV_ALL, because
+      setuid-root files would otherwise be a backdoor.  See
+@@ -265,7 +265,7 @@ fd_chmod(int fd, char const *file_name, int mode, int atflag, int typeflag)
+   if (chmod_errno == EPERM && (mode & S_ISUID)
+       && priv_set_restore_linkdir () == 0)
+     {
+-      chmod_errno = fd_i_chmod (fd, file_name, mode, atflag) == 0 ? 0 : errno;
++      chmod_errno = fd_i_chmod (fd, file_name, mode, atflag) < 0 ? errno : 0;
+       priv_set_remove_linkdir ();
+     }
+ 
+@@ -275,7 +275,7 @@ fd_chmod(int fd, char const *file_name, int mode, int atflag, int typeflag)
+      supported and if the file is not a symlink.  This
+      introduces a race, alas.  */
+   if (atflag && typeflag != SYMTYPE && ! implemented (chmod_errno))
+-    chmod_errno = fd_i_chmod (fd, file_name, mode, 0) == 0 ? 0 : errno;
++    chmod_errno = fd_i_chmod (fd, file_name, mode, 0) < 0 ? errno : 0;
+ 
+   if (chmod_errno && (typeflag != SYMTYPE || implemented (chmod_errno)))
+     {
+@@ -1036,8 +1036,8 @@ safe_dir_mode (struct stat const *st)
+ 
+ /* Extractor functions for various member types */
+ 
+-static int
+-extract_dir (char *file_name, int typeflag)
++static bool
++extract_dir (char *file_name, char typeflag)
+ {
+   int status;
+   mode_t mode;
+@@ -1089,7 +1089,7 @@ extract_dir (char *file_name, int typeflag)
+ 
+ 	      if (keep_directory_symlink_option
+ 		  && is_directory_link (file_name, &st))
+-		return 0;
++		return true;
+ 
+ 	      if ((st.st_mode != 0 && fstatat_flags == 0)
+ 		  || deref_stat (file_name, &st) == 0)
+@@ -1102,7 +1102,7 @@ extract_dir (char *file_name, int typeflag)
+ 		      if (interdir_made)
+ 			{
+ 			  repair_delayed_set_stat (file_name, &st);
+-			  return 0;
++			  return true;
+ 			}
+ 		      else if (old_files_option == NO_OVERWRITE_DIR_OLD_FILES)
+ 			{
+@@ -1154,7 +1154,7 @@ extract_dir (char *file_name, int typeflag)
+ 	  if (errno != EEXIST)
+ 	    {
+ 	      mkdir_error (file_name);
+-	      return 1;
++	      return false;
+ 	    }
+ 	  break;
+ 	}
+@@ -1167,13 +1167,13 @@ extract_dir (char *file_name, int typeflag)
+     delay_set_stat (file_name, &current_stat_info,
+ 		    current_mode, current_mode_mask,
+ 		    current_stat_info.stat.st_mode, atflag);
+-  return status;
++  return status == 0;
+ }
+ 
+ 
+ 
+ static int
+-open_output_file (char const *file_name, int typeflag, mode_t mode,
++open_output_file (char const *file_name, char typeflag, mode_t mode,
+                   int file_created, mode_t *current_mode,
+                   mode_t *current_mode_mask)
+ {
+@@ -1189,11 +1189,11 @@ open_output_file (char const *file_name, int typeflag, mode_t mode,
+ 
+   if (typeflag == CONTTYPE)
+     {
+-      static int conttype_diagnosed;
++      static bool conttype_diagnosed;
+ 
+       if (!conttype_diagnosed)
+ 	{
+-	  conttype_diagnosed = 1;
++	  conttype_diagnosed = true;
+ 	  WARNOPT (WARN_CONTIGUOUS_CAST,
+ 		   (0, 0, _("Extracting contiguous files as regular files")));
+ 	}
+@@ -1245,8 +1245,8 @@ open_output_file (char const *file_name, int typeflag, mode_t mode,
+   return fd;
+ }
+ 
+-static int
+-extract_file (char *file_name, int typeflag)
++static bool
++extract_file (char *file_name, char typeflag)
+ {
+   int fd;
+   off_t size;
+@@ -1268,7 +1268,7 @@ extract_file (char *file_name, int typeflag)
+       if (fd < 0)
+ 	{
+ 	  skip_member ();
+-	  return 0;
++	  return true;
+ 	}
+     }
+   else
+@@ -1291,9 +1291,9 @@ extract_file (char *file_name, int typeflag)
+ 	    {
+ 	      skip_member ();
+ 	      if (recover == RECOVER_SKIP)
+-		return 0;
++		return true;
+ 	      open_error (file_name);
+-	      return 1;
++	      return false;
+ 	    }
+ 	}
+     }
+@@ -1344,7 +1344,7 @@ extract_file (char *file_name, int typeflag)
+      it doesn't exist, or we don't want to touch it anyway.  */
+ 
+   if (to_stdout_option)
+-    return 0;
++    return true;
+ 
+   if (! to_command_option)
+     set_stat (file_name, &current_stat_info, fd,
+@@ -1359,7 +1359,7 @@ extract_file (char *file_name, int typeflag)
+   if (to_command_option)
+     sys_wait_command ();
+ 
+-  return status;
++  return status == 0;
+ }
+ 
+ /* Return true if NAME is a delayed link.  This can happen only if the link
+@@ -1399,7 +1399,7 @@ find_delayed_link_source (char const *name)
+    process.
+ */
+ 
+-static int
++static bool
+ create_placeholder_file (char *file_name, bool is_symlink, bool *interdir_made)
+ {
+   int fd;
+@@ -1413,7 +1413,7 @@ create_placeholder_file (char *file_name, bool is_symlink, bool *interdir_made)
+ 	     that the link being extracted is a duplicate of an already
+ 	     processed one.  Skip it.
+ 	   */
+-	  return 0;
++	  return true;
+ 	}
+ 
+       switch (maybe_recoverable (file_name, false, interdir_made))
+@@ -1422,11 +1422,11 @@ create_placeholder_file (char *file_name, bool is_symlink, bool *interdir_made)
+ 	  continue;
+ 
+ 	case RECOVER_SKIP:
+-	  return 0;
++	  return true;
+ 
+ 	case RECOVER_NO:
+ 	  open_error (file_name);
+-	  return -1;
++	  return false;
+ 	}
+       }
+ 
+@@ -1484,14 +1484,14 @@ create_placeholder_file (char *file_name, bool is_symlink, bool *interdir_made)
+       if ((h = find_direct_ancestor (file_name)) != NULL)
+ 	mark_after_links (h);
+ 
+-      return 0;
++      return true;
+     }
+ 
+-  return -1;
++  return false;
+ }
+ 
+-static int
+-extract_link (char *file_name, MAYBE_UNUSED int typeflag)
++static bool
++extract_link (char *file_name, MAYBE_UNUSED char typeflag)
+ {
+   bool interdir_made = false;
+   char const *link_name;
+@@ -1531,7 +1531,7 @@ extract_link (char *file_name, MAYBE_UNUSED int typeflag)
+ 		}
+ 	    }
+ 
+-	  return 0;
++	  return true;
+ 	}
+       else if ((e == EEXIST && strcmp (link_name, file_name) == 0)
+ 	       || ((fstatat (chdir_fd, link_name, &st1, AT_SYMLINK_NOFOLLOW)
+@@ -1540,7 +1540,7 @@ extract_link (char *file_name, MAYBE_UNUSED int typeflag)
+ 		       == 0)
+ 		   && st1.st_dev == st2.st_dev
+ 		   && st1.st_ino == st2.st_ino))
+-	return 0;
++	return true;
+ 
+       errno = e;
+     }
+@@ -1548,17 +1548,17 @@ extract_link (char *file_name, MAYBE_UNUSED int typeflag)
+ 	 == RECOVER_OK);
+ 
+   if (rc == RECOVER_SKIP)
+-    return 0;
++    return true;
+   if (!(incremental_option && errno == EEXIST))
+     {
+       link_error (link_name, file_name);
+-      return 1;
++      return false;
+     }
+-  return 0;
++  return true;
+ }
+ 
+-static int
+-extract_symlink (char *file_name, MAYBE_UNUSED int typeflag)
++static bool
++extract_symlink (char *file_name, MAYBE_UNUSED char typeflag)
+ {
+ #ifdef HAVE_SYMLINK
+   bool interdir_made = false;
+@@ -1575,16 +1575,16 @@ extract_symlink (char *file_name, MAYBE_UNUSED int typeflag)
+ 	continue;
+ 
+       case RECOVER_SKIP:
+-	return 0;
++	return true;
+ 
+       case RECOVER_NO:
+ 	symlink_error (current_stat_info.link_name, file_name);
+-	return -1;
++	return false;
+       }
+ 
+   set_stat (file_name, &current_stat_info, -1, 0, 0,
+ 	    SYMTYPE, false, AT_SYMLINK_NOFOLLOW);
+-  return 0;
++  return true;
+ 
+ #else
+   static int warned_once;
+@@ -1601,8 +1601,8 @@ extract_symlink (char *file_name, MAYBE_UNUSED int typeflag)
+ }
+ 
+ #if S_IFCHR || S_IFBLK
+-static int
+-extract_node (char *file_name, int typeflag)
++static bool
++extract_node (char *file_name, char typeflag)
+ {
+   bool interdir_made = false;
+   mode_t mode = (current_stat_info.stat.st_mode & (MODE_RWX | S_IFBLK | S_IFCHR)
+@@ -1616,23 +1616,23 @@ extract_node (char *file_name, int typeflag)
+ 	continue;
+ 
+       case RECOVER_SKIP:
+-	return 0;
++	return true;
+ 
+       case RECOVER_NO:
+ 	mknod_error (file_name);
+-	return -1;
++	return false;
+       }
+ 
+   set_stat (file_name, &current_stat_info, -1,
+ 	    mode & ~ current_umask, MODE_RWX,
+ 	    typeflag, false, AT_SYMLINK_NOFOLLOW);
+-  return 0;
++  return true;
+ }
+ #endif
+ 
+ #if HAVE_MKFIFO || defined mkfifo
+-static int
+-extract_fifo (char *file_name, int typeflag)
++static bool
++extract_fifo (char *file_name, char typeflag)
+ {
+   bool interdir_made = false;
+   mode_t mode = (current_stat_info.stat.st_mode & MODE_RWX
+@@ -1645,31 +1645,31 @@ extract_fifo (char *file_name, int typeflag)
+ 	continue;
+ 
+       case RECOVER_SKIP:
+-	return 0;
++	return true;
+ 
+       case RECOVER_NO:
+ 	mkfifo_error (file_name);
+-	return -1;
++	return false;
+       }
+ 
+   set_stat (file_name, &current_stat_info, -1,
+ 	    mode & ~ current_umask, MODE_RWX,
+ 	    typeflag, false, AT_SYMLINK_NOFOLLOW);
+-  return 0;
++  return true;
+ }
+ #endif
+ 
+-typedef int (*tar_extractor_t) (char *file_name, int typeflag);
++typedef bool (*tar_extractor_t) (char *file_name, char typeflag);
+ 
+ 
+ /* Prepare to extract a file. Find extractor function.
+-   Return true to proceed with the extraction, false to skip the current
+-   member.  */
++   Return an extractor to proceed with the extraction,
++   a null pointer to skip the current member.  */
+ 
+-static bool
+-prepare_to_extract (char const *file_name, int typeflag, tar_extractor_t *fun)
++static tar_extractor_t
++prepare_to_extract (char const *file_name, char typeflag)
+ {
+-  tar_extractor_t extractor = NULL;
++  tar_extractor_t extractor;
+ 
+   /* Select the extractor */
+   switch (typeflag)
+@@ -1683,10 +1683,8 @@ prepare_to_extract (char const *file_name, int typeflag, tar_extractor_t *fun)
+     case CONTTYPE:
+       /* Appears to be a file.  But BSD tar uses the convention that a slash
+ 	 suffix means a directory.  */
+-      if (current_stat_info.had_trailing_slash)
+-	extractor = extract_dir;
+-      else
+-	extractor = extract_file;
++      extractor = (current_stat_info.had_trailing_slash
++		   ? extract_dir : extract_file);
+       break;
+ 
+     case SYMTYPE:
+@@ -1725,18 +1723,18 @@ prepare_to_extract (char const *file_name, int typeflag, tar_extractor_t *fun)
+       break;
+ 
+     case GNUTYPE_VOLHDR:
+-      return false;
++      return NULL;
+ 
+     case GNUTYPE_MULTIVOL:
+       ERROR ((0, 0,
+ 	      _("%s: Cannot extract -- file is continued from another volume"),
+ 	      quotearg_colon (current_stat_info.file_name)));
+-      return false;
++      return NULL;
+ 
+     case GNUTYPE_LONGNAME:
+     case GNUTYPE_LONGLINK:
+       ERROR ((0, 0, _("Unexpected long name header")));
+-      return false;
++      return NULL;
+ 
+     default:
+       WARNOPT (WARN_UNKNOWN_CAST,
+@@ -1749,7 +1747,7 @@ prepare_to_extract (char const *file_name, int typeflag, tar_extractor_t *fun)
+   if (EXTRACT_OVER_PIPE)
+     {
+       if (extractor != extract_file)
+-	return false;
++	return NULL;
+     }
+   else
+     {
+@@ -1763,7 +1761,7 @@ prepare_to_extract (char const *file_name, int typeflag, tar_extractor_t *fun)
+ 	      && errno && errno != ENOENT)
+ 	    {
+ 	      unlink_error (file_name);
+-	      return false;
++	      return NULL;
+ 	    }
+ 	  break;
+ 
+@@ -1773,7 +1771,7 @@ prepare_to_extract (char const *file_name, int typeflag, tar_extractor_t *fun)
+ 	      WARNOPT (WARN_IGNORE_NEWER,
+ 		       (0, 0, _("Current %s is newer or same age"),
+ 			quote (file_name)));
+-	      return false;
++	      return NULL;
+ 	    }
+ 	  break;
+ 
+@@ -1781,9 +1779,7 @@ prepare_to_extract (char const *file_name, int typeflag, tar_extractor_t *fun)
+ 	  break;
+ 	}
+     }
+-  *fun = extractor;
+-
+-  return true;
++  return extractor;
+ }
+ 
+ /* Extract a file from the archive.  */
+@@ -1791,7 +1787,6 @@ void
+ extract_archive (void)
+ {
+   char typeflag;
+-  tar_extractor_t fun;
+   bool skip_dotdot_name;
+ 
+   fatal_exit_hook = extract_finish;
+@@ -1841,12 +1836,14 @@ extract_archive (void)
+ 
+   /* Extract the archive entry according to its type.  */
+   /* KLUDGE */
+-  typeflag = sparse_member_p (&current_stat_info) ?
+-                  GNUTYPE_SPARSE : current_header->header.typeflag;
++  typeflag = (sparse_member_p (&current_stat_info)
++	      ? GNUTYPE_SPARSE : current_header->header.typeflag);
+ 
+-  if (prepare_to_extract (current_stat_info.file_name, typeflag, &fun))
++  tar_extractor_t fun = prepare_to_extract (current_stat_info.file_name,
++					    typeflag);
++  if (fun)
+     {
+-      if (fun (current_stat_info.file_name, typeflag) == 0)
++      if (fun (current_stat_info.file_name, typeflag))
+ 	return;
+     }
+   else
+-- 
+2.44.1
+
diff --git a/meta/recipes-extended/tar/tar/CVE-2026-5704-dependent_p2.patch b/meta/recipes-extended/tar/tar/CVE-2026-5704-dependent_p2.patch
new file mode 100644
index 0000000000..c3a94db5a0
--- /dev/null
+++ b/meta/recipes-extended/tar/tar/CVE-2026-5704-dependent_p2.patch
@@ -0,0 +1,169 @@
+From a934d62acc1edc202e93e9f1b38eff1d880568a0 Mon Sep 17 00:00:00 2001
+From: Sergey Poznyakoff <gray@gnu.org>
+Date: Mon, 12 May 2025 17:17:21 +0300
+Subject: [PATCH] Handle directory members consistently when listing and when
+ extracting.
+
+* src/list.c (skim_member): Recognize directory members using
+the same rules as during extraction.
+* tests/skipdir.at: New testcase.
+* tests/testsuite.at: Add new test.
+* tests/Makefile.am: Likewise.
+
+CVE: CVE-2026-5704
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/tar.git/commit/?id=b009124ffde415515081db844d7a104e1d1c6c58]
+
+(cherry picked from commit b009124ffde415515081db844d7a104e1d1c6c58)
+Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
+---
+ src/list.c         | 22 ++++++++++++++++--
+ tests/Makefile.am  |  1 +
+ tests/skipdir.at   | 56 ++++++++++++++++++++++++++++++++++++++++++++++
+ tests/testsuite.at |  3 ++-
+ 4 files changed, 79 insertions(+), 3 deletions(-)
+ create mode 100644 tests/skipdir.at
+
+diff --git a/src/list.c b/src/list.c
+index e9a68159..928779e1 100644
+--- a/src/list.c
++++ b/src/list.c
+@@ -1440,6 +1440,23 @@ skip_member (void)
+   skim_member (false);
+ }
+ 
++static bool
++member_is_dir (struct tar_stat_info *info, char typeflag)
++{
++  switch (typeflag) {
++  case AREGTYPE:
++  case REGTYPE:
++  case CONTTYPE:
++    return info->had_trailing_slash;
++
++  case DIRTYPE:
++    return true;
++
++  default:
++    return false;
++  }
++}
++
+ /* Skip the current member in the archive.
+    If MUST_COPY, always copy instead of skipping.  */
+ void
+@@ -1447,14 +1464,15 @@ skim_member (bool must_copy)
+ {
+   if (!current_stat_info.skipped)
+     {
+-      char save_typeflag = current_header->header.typeflag;
++      bool is_dir = member_is_dir (&current_stat_info,
++				   current_header->header.typeflag);
+       set_next_block_after (current_header);
+ 
+       mv_begin_read (&current_stat_info);
+ 
+       if (current_stat_info.is_sparse)
+ 	sparse_skim_file (&current_stat_info, must_copy);
+-      else if (save_typeflag != DIRTYPE)
++      else if (!is_dir)
+ 	skim_file (current_stat_info.stat.st_size, must_copy);
+ 
+       mv_end ();
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index 1884b722..6cf726c0 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -240,6 +240,7 @@ TESTSUITE_AT = \
+  shortrec.at\
+  shortupd.at\
+  sigpipe.at\
++ skipdir.at\
+  sparse01.at\
+  sparse02.at\
+  sparse03.at\
+diff --git a/tests/skipdir.at b/tests/skipdir.at
+new file mode 100644
+index 00000000..7106ee74
+--- /dev/null
++++ b/tests/skipdir.at
+@@ -0,0 +1,56 @@
++# Process this file with autom4te to create testsuite. -*- Autotest -*-
++
++# Test suite for GNU tar.
++# Copyright 2025 Free Software Foundation, Inc.
++
++# This file is part of GNU tar.
++
++# GNU tar is free software; you can redistribute it and/or modify
++# it under the terms of the GNU General Public License as published by
++# the Free Software Foundation; either version 3 of the License, or
++# (at your option) any later version.
++
++# GNU tar is distributed in the hope that it will be useful,
++# but WITHOUT ANY WARRANTY; without even the implied warranty of
++# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++# GNU General Public License for more details.
++
++# You should have received a copy of the GNU General Public License
++# along with this program.  If not, see <http://www.gnu.org/licenses/>.
++
++# Description: determining member type when listing and extracting
++# should follow the same principles.
++#
++# Until version 1.35 the same archive member could have been processed
++# as a directory when extracting and as a regular file when being
++# skipped during listing.
++#
++# References: https://savannah.gnu.org/patch/index.php?10100
++
++AT_SETUP([skip directory members])
++AT_KEYWORDS([skipdir])
++AT_DATA([archive.in],
++[/Td6WFoAAATm1rRGAgAhARwAAAAQz1jM4Cf/AG1dADedyh4ubnxHHIi7Cen6orusgKqY3paKeQwp
++3//HS9EIT7Hm+MsndXfRntXVt8mu8oDpLOfC+AB9VldyCtp2jqOfTwa455qfGAcONPn6WWDgsaAh
++O2Y6ptXuaF/vdaNkub7SkOBME8jHYITT5QAAAAAAHtdcflb5Zw8AAYkBgFAAAPYgb0axxGf7AgAA
++AAAEWVo=
++])
++AT_CHECK([base64 --help >/dev/null 2>&1 || AT_SKIP_TEST
++xz --help >/dev/null 2>&1 || AT_SKIP_TEST
++base64 -d < archive.in | xz -c -d > archive.tar
++])
++AT_CHECK([tar tf archive.tar],
++[0],
++[owo1/
++owo2/
++])
++AT_CHECK([tar vxf archive.tar],
++[0],
++[owo1/
++owo2/
++])
++AT_CHECK([tar -xvf archive.tar --exclude owo1],
++[0],
++[owo2/
++])
++AT_CLEANUP
+diff --git a/tests/testsuite.at b/tests/testsuite.at
+index 44ae773b..f2229be1 100644
+--- a/tests/testsuite.at
++++ b/tests/testsuite.at
+@@ -464,7 +464,7 @@ AT_BANNER([Volume operations])
+ m4_include([volume.at])
+ m4_include([volsize.at])
+ 
+-AT_BANNER()
++AT_BANNER([Various tests])
+ m4_include([comprec.at])
+ m4_include([shortfile.at])
+ m4_include([shortupd.at])
+@@ -473,6 +473,7 @@ m4_include([truncate.at])
+ m4_include([grow.at])
+ m4_include([sigpipe.at])
+ m4_include([comperr.at])
++m4_include([skipdir.at])
+ 
+ AT_BANNER([Removing files after archiving])
+ m4_include([remfiles01.at])
+-- 
+2.44.1
+
diff --git a/meta/recipes-extended/tar/tar/CVE-2026-5704-regression.patch b/meta/recipes-extended/tar/tar/CVE-2026-5704-regression.patch
new file mode 100644
index 0000000000..d38b46b8ec
--- /dev/null
+++ b/meta/recipes-extended/tar/tar/CVE-2026-5704-regression.patch
@@ -0,0 +1,176 @@
+From 4e742fc8674064a9fa00d4483d06aca48d5b0463 Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Sat, 26 Jul 2025 21:41:23 -0700
+Subject: [PATCH] --no-overwrite-dir no overwrite even temporarily
+
+Problem and fix reported by Pavel Cahyna in
+https://lists.gnu.org/r/bug-tar/2025-01/msg00000.html
+* src/extract.c (extract_dir): With --no-overwrite-dir,
+skip the chmod if the directory already exists.
+* tests/extrac23.at (--no-overwrite-dir on empty directory):
+Move the part of the test that looks at a nonempty directory ...
+* tests/extrac30.at: ... to this new file, because the test now
+must be run as non-root. Adjust the test to match the new behavior.
+* tests/Makefile.am (TESTSUITE_AT), tests/testsuite.at: Add it.
+
+CVE: CVE-2026-5704
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/tar.git/commit/?id=4e742fc8674064a9fa00d4483d06aca48d5b0463]
+
+Backport Changes:
+- Omit the NEWS update.
+- Adapt tests/Makefile.am and tests/testsuite.at context to the tar-1.35
+  test list carried by OE-Core.
+
+(cherry picked from commit 4e742fc8674064a9fa00d4483d06aca48d5b0463)
+Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
+---
+diff --git a/src/extract.c b/src/extract.c
+index 3bf0d77..4ed19b6 100644
+--- a/src/extract.c
++++ b/src/extract.c
+@@ -1102,31 +1102,6 @@ extract_dir (char *file_name, MAYBE_UNUSED char typeflag)
+ 			  repair_delayed_set_stat (file_name, &st);
+ 			  return true;
+ 			}
+-		      else if (old_files_option == NO_OVERWRITE_DIR_OLD_FILES)
+-			{
+-			  /* Temporarily change the directory mode to a safe
+-			     value, to be able to create files in it, should
+-			     the need be.
+-			  */
+-			  mode = safe_dir_mode (&st);
+-			  status = fd_chmod (-1, file_name, mode,
+-					     AT_SYMLINK_NOFOLLOW, DIRTYPE);
+-			  if (status == 0)
+-			    {
+-			      /* Store the actual directory mode, to be restored
+-				 later.
+-			      */
+-			      current_stat_info.stat = st;
+-			      current_mode = mode & ~ current_umask;
+-			      current_mode_mask = MODE_RWX;
+-			      atflag = AT_SYMLINK_NOFOLLOW;
+-			      break;
+-			    }
+-			  else
+-			    {
+-			      chmod_error_details (file_name, mode);
+-			    }
+-			}
+ 		      break;
+ 		    }
+ 		}
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index baeb55b..a75abdb 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -133,6 +133,7 @@ TESTSUITE_AT = \
+  extrac23.at\
+  extrac24.at\
+  extrac25.at\
++ extrac30.at\
+  extrac32.at\
+  filerem01.at\
+  filerem02.at\
+diff --git a/tests/extrac23.at b/tests/extrac23.at
+index cb63ebb..efc9a32 100644
+--- a/tests/extrac23.at
++++ b/tests/extrac23.at
+@@ -15,15 +15,12 @@
+ #
+ # You should have received a copy of the GNU General Public License
+ # along with this program.  If not, see <http://www.gnu.org/licenses/>.
+-AT_SETUP([--no-overwrite-dir])
++AT_SETUP([--no-overwrite-dir on empty directory])
+ AT_KEYWORDS([extract extrac23 no-overwrite-dir])
+ 
+ # Description: Implementation of the --no-overwrite-dir option was flawed in
+ # tar versions up to 1.32.90.  This option is intended to preserve metadata
+ # of existing directories.  In fact it worked only for non-empty directories.
+-# Moreover, if the actual directory was owned by the user tar runs as and the
+-# S_IWUSR bit was not set in its actual permissions, tar failed to create files
+-# in it.
+ #
+ # Reported by: Michael Kaufmann <mail@michael-kaufmann.ch>
+ # References: <20200207112934.Horde.anXzYhAj2CHiwUrw5CuT0G-@webmail.michael-kaufmann.ch>,
+@@ -38,21 +35,10 @@ chmod 777 dir
+ tar -xf a.tar --no-overwrite-dir
+ genfile --stat=mode.777 dir
+ 
+-# Test if temporary permissions are set correctly to allow the owner
+-# to write to the directory.
+-genfile --file dir/file
+-tar cf a.tar dir
+-rm dir/file
+-chmod 400 dir
+-tar -xf a.tar --no-overwrite-dir
+-genfile --stat=mode.777 dir
+-chmod 700 dir
+ find dir
+ ],
+ [0],
+ [777
+-400
+ dir
+-dir/file
+ ])
+ AT_CLEANUP
+diff --git a/tests/extrac30.at b/tests/extrac30.at
+new file mode 100644
+index 0000000..8c879c9
+--- /dev/null
++++ b/tests/extrac30.at
+@@ -0,0 +1,47 @@
++# Test suite for GNU tar.                             -*- Autotest -*-
++# Copyright 2020-2025 Free Software Foundation, Inc.
++#
++# This file is part of GNU tar.
++#
++# GNU tar is free software; you can redistribute it and/or modify
++# it under the terms of the GNU General Public License as published by
++# the Free Software Foundation; either version 3 of the License, or
++# (at your option) any later version.
++#
++# GNU tar is distributed in the hope that it will be useful,
++# but WITHOUT ANY WARRANTY; without even the implied warranty of
++# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++# GNU General Public License for more details.
++#
++# You should have received a copy of the GNU General Public License
++# along with this program.  If not, see <http://www.gnu.org/licenses/>.
++AT_SETUP([--no-overwrite-dir on unwritable directory])
++AT_KEYWORDS([extract extrac30 no-overwrite-dir])
++
++# Make sure that tar does not change permissions on directories if
++# --no-overwrite-dir tells it not to, not even temporarily.
++
++AT_TAR_CHECK([
++AT_UNPRIVILEGED_PREREQ
++
++# Test that the user cannot write to a unwritable directory
++# if --no-overwrite-dir is used.
++mkdir dir
++chmod 755 dir
++genfile --file dir/file
++tar cf a.tar dir
++rm dir/file
++chmod 555 dir
++tar -xf a.tar --no-overwrite-dir
++genfile --stat=mode.777 dir
++chmod 755 dir
++find dir
++],
++[0],
++[555
++dir
++],
++[tar: dir/file: Cannot open: Permission denied
++tar: Exiting with failure status due to previous errors
++])
++AT_CLEANUP
+diff --git a/tests/testsuite.at b/tests/testsuite.at
+index 5875700..331a6e3 100644
+--- a/tests/testsuite.at
++++ b/tests/testsuite.at
+@@ -352,0 +353 @@
++m4_include([extrac30.at])
diff --git a/meta/recipes-extended/tar/tar/CVE-2026-5704.patch b/meta/recipes-extended/tar/tar/CVE-2026-5704.patch
new file mode 100644
index 0000000000..81c6df3712
--- /dev/null
+++ b/meta/recipes-extended/tar/tar/CVE-2026-5704.patch
@@ -0,0 +1,556 @@
+From b97bbb10103a911d418015b7ff41384af0419952 Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Sun, 22 Mar 2026 12:19:40 -0700
+Subject: [PATCH] Fix more -t/-x discrepancies
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Problem reported by Guillermo de Angel in:
+https://lists.gnu.org/r/bug-tar/2026-03/msg00007.html
+* THANKS: Add him, and sort.
+* src/extract.c (extract_dir, extract_file):
+* src/incremen.c (purge_directory):
+Do not call skip_member, as the caller now does that, and does it
+more reliably.
+* src/extract.c (extract_file):
+Mark file as skipped when we’ve read it.
+(extract_archive): Always call skip_member after extracting,
+as it suppresses the skip as needed.
+* src/incremen.c (try_purge_directory): Remove; no longer
+needed.  Move internals to purge_directory.
+* src/list.c (read_header): Do not treat LNKTYPE header as having
+size zero, as it can be nonzero (e.g., ‘pax -o linkdata’).
+Set info->skipped field according to how the header was read.
+(member_is_dir): Remove; no longer needed.
+(skim_member): Skip directory data too, unless it’s already been
+skipped (i.e., read).
+* tests/extrac32.at: New file.
+* tests/Makefile.am (TESTSUITE_AT):
+* tests/testsuite.at:
+Add it.
+* tests/skipdir.at (skip directory members):
+Fix test to match the correct behavior.
+This fixes a bug introduced in commit
+b009124ffde415515081db844d7a104e1d1c6c58
+dated 2025-05-12 17:17:21 +0300.
+
+CVE: CVE-2026-5704
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/tar.git/commit/?id=b8d8a61b25588caca4efaf9bdd2e3f1a49da77e3]
+
+Backport Changes:
+- Replaced UNNAMED(typeflag) with MAYBE_UNUSED char typeflag in extract_dir()
+  under src/extract.c, as the UNNAMED macro is not available in tar 1.35
+  (introduced later in upstream commit 9280aa3807c1 "Prefer UNNAMED to
+  MAYBE_UNUSED").
+- THANKS file context difference: tar 1.35 has "Jurgen Botz" (ASCII),
+  while upstream has "Jürgen Botz" (UTF-8 umlaut), changed in upstream
+  commit 390950282d98 ("maint: fix some encodings and email addresses");
+  the removed line in the diff reflects the tar 1.35 spelling.
+
+(cherry picked from commit b8d8a61b25588caca4efaf9bdd2e3f1a49da77e3)
+Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
+---
+ THANKS             | 30 +++++++++++++++--------------
+ src/extract.c      | 23 ++++++----------------
+ src/incremen.c     | 22 +++++++--------------
+ src/list.c         | 48 +++++++++++++++-------------------------------
+ tests/Makefile.am  |  1 +
+ tests/extrac32.at  | 47 +++++++++++++++++++++++++++++++++++++++++++++
+ tests/skipdir.at   |  6 +-----
+ tests/testsuite.at |  1 +
+ 8 files changed, 94 insertions(+), 84 deletions(-)
+ create mode 100644 tests/extrac32.at
+
+diff --git a/THANKS b/THANKS
+index aee0a924..03fa49d5 100644
+--- a/THANKS
++++ b/THANKS
+@@ -6,6 +6,7 @@ Many people further contributed to GNU tar by reporting problems,
+ suggesting various improvements or submitting actual code.  Here is a
+ list of these people.  Help me keep it complete and exempt of errors.
+ See various ChangeLogs for a detailed description of contributions.
++This listed is sorted via "LC_ALL=C sort".
+ 
+ Aage Robeck		aagero@ifi.uio.no
+ Adam Borowski		kilobyte@angband.pl
+@@ -36,8 +37,8 @@ Andrew J. Schorr	schorr@ead.dsa.com
+ Andrew Torda		torda@igc.chem.ethz.ch
+ Andrey A. Chernov	ache@astral.msk.su
+ Andy Gay		andy@rdl.co.uk
+-Antonio Jose Coutinho	ajc@di.uminho.pt
+ Anthony G. Basile	blueness@gentoo.org
++Antonio Jose Coutinho	ajc@di.uminho.pt
+ Ariel Faigon		ariel@engr.sgi.com
+ Arne Wichmann		aw@math.uni-sb.de
+ Arnold Robbins		arnold@gnu.org
+@@ -79,9 +80,9 @@ Cesar Romani		romani@ifm.uni-hamburg.de
+ Chad Hurwitz		churritz@cts.com
+ Chance Reschke		creschke@usra.edu
+ Charles Fu		ccwf@klab.caltech.edu
+-Charles McGarvey        chazmcgarvey@brokenzipper.com
+ Charles Lopes		Charles.Lopes@infm.ulst.ac.uk
+ Charles M. Hannum	mycroft@gnu.org
++Charles McGarvey        chazmcgarvey@brokenzipper.com
+ Chip Salzenberg		tct!chip
+ Chris Arthur		csa@gnu.org
+ Chris F.M. Verberne	verberne@prl.philips.nl
+@@ -93,9 +94,9 @@ Christian Callsen	Christian.Callsen@eng.sun.com
+ Christian Kirsch	ck@held.mind.de
+ Christian Laubscher	christian.laubscher@tiscalinet.ch
+ Christian T. Dum	ctd@mpe-garching.mpg.de
+-Christian von Roques	roques@pond.sub.org
+-Christian Wetzel	wetzel@phoenix-pacs.de
+ Christian Weisgerber	naddy@mips.inka.de
++Christian Wetzel	wetzel@phoenix-pacs.de
++Christian von Roques	roques@pond.sub.org
+ Christoph Litauer	litauer@mailhost.uni-koblenz.de
+ Christophe Colle	colle@krtkg1.rug.ac.be
+ Christophe Kalt		Christophe.Kalt@kbcfp.com
+@@ -117,8 +118,8 @@ Dan Bloch		dan@transarc.com
+ Dan Drake               dan@dandrake.org
+ Dan Reish		dreish@izzy.net
+ Daniel Hagerty		hag@gnu.org
+-Daniel Quinlan		quinlan@pathname.com
+ Daniel Kahn Gillmor	dkg@fifthhorseman.net
++Daniel Quinlan		quinlan@pathname.com
+ Daniel R. Guilderson	d.guilderson@ma30.bull.com
+ Daniel S. Barclay	daniel@compass-da.com
+ Daniel Trinkle		trinkle@cs.purdue.edu
+@@ -198,6 +199,7 @@ Greg Hudson		ghudson@mit.edu
+ Greg Maples		greg@clari.net
+ Greg McGary		gkm@cstone.net
+ Greg Schafer		gschafer@zip.com.au
++Guillermo de Angel	gdeangelg@gmail.com
+ Göran Uddeborg		gvran@uddeborg.pp.se
+ Gürkan Karaman		karaman@dssgmbh.de
+ Hans Guerth		100664.3101@compuserve.com
+@@ -222,6 +224,7 @@ Indra Singhal		indra@synoptics.com
+ J. Dean Brock		brock@cs.unca.edu
+ J.J. Bailey		jjb@jagware.bcc.com
+ J.T. Conklin		jtc@cygnus.com
++James Antill            jantill@redhat.com
+ James Crawford Ralston	qralston+@pitt.edu
+ James E. Carpenter	jimc@zach1.tiac.net
+ James H Caldwell Jr	caldwell@cs.fsu.edu
+@@ -233,15 +236,15 @@ Jan Carlson		janc@sni.ca
+ Jan Djarv		jan.djarv@mbox200.swipnet.se
+ Janice Burton		r06a165@bcc25.kodak.com
+ Janne Snabb		snabb@niksula.hut.fi
+-Jason R. Mastaler	jason@webmaster.net
+ Jason Armistead		Jason.Armistead@otis.com
++Jason R. Mastaler	jason@webmaster.net
+ Jay Fenlason		hack@gnu.org
+ Jean-Louis Martineau    martineau@zmanda.com
+-Jean-Michel Soenen	soenen@lectra.fr
+ Jean-Loup Gailly	jloup@chorus.fr
+-Jeff Moskow		jeff@rtr.com
++Jean-Michel Soenen	soenen@lectra.fr
+ Jean-Ph. Martin-Flatin	syj@ecmwf.int
+ Jean-Pierre Demailly	Jean-Pierre.Demailly@ujf-grenoble.fr
++Jeff Moskow		jeff@rtr.com
+ Jeff Prothero		jsp@betz.biostr.washington.edu
+ Jeff Siegel		js@hornet.att.com
+ Jeff Sorensen		sorenj@alumni.rpi.edu
+@@ -249,7 +252,6 @@ Jeffrey Goldberg	J.Goldberg@cranfield.ac.uk
+ Jeffrey Mark Siskind	Qobi@emba.uvm.edu
+ Jeffrey W. Parker	jwpkr@mcs.com
+ Jens Henrik Jensen	recjhl@mediator.uni-c.dk
+-Jérémy Bobbio		lunar@debian.org
+ Jim Blandy		jimb@totoro.cs.oberlin.edu
+ Jim Clausing		jac@postbox.acs.ohio-state.edu
+ Jim Farrell		jwf@platinum.com
+@@ -283,13 +285,14 @@ Joutsiniemi Tommi Il	tj75064@cs.tut.fi
+ Joy Kendall		jak8@world.std.com
+ Judy Ricker		jricker@gdstech.grumman.com
+ Juha Sarlin		juha@tds.kth.se
+-Jurgen Botz		jbotz@orixa.mtholyoke.edu
+ Jyh-Shyang Wang		erik@vsp.ee.nctu.edu.tw
++Jérémy Bobbio		lunar@debian.org
+ Jörg Schilling		schilling@fokus.fraunhofer.de
+-Jörg Weule		weule@cs.uni-duesseldorf.de
+ Jörg Weilbier 		gnu@weilbier.net
++Jörg Weule		weule@cs.uni-duesseldorf.de
+ Jörgen Hågg		Jorgen.Hagg@axis.se
+ Jörgen Weigert		jw@suse.de
++Jürgen Botz		jbotz@orixa.mtholyoke.edu
+ Jürgen Lüters		jlueters@t-online.de
+ Jürgen Reiss		reiss@psychologie.uni-wuerzburg.de
+ Kai Petzke		wpp@marie.physik.tu-berlin.de
+@@ -311,7 +314,6 @@ Kimmy Posey		kimmyd@bnr.ca
+ Koji Kishi		kis@rqa.sony.co.jp
+ Konno Hiroharu		konno@pac.co.jp
+ Kurt Jaeger		pi@lf.net
+-James Antill            jantill@redhat.com
+ Larry Creech		lcreech@lonestar.rcclub.org
+ Larry Schwimmer		rosebud@cyclone.stanford.edu
+ Lasse Collin 		lasse.collin@tukaani.org
+@@ -394,7 +396,6 @@ Oswald P. Backus IV	backus@lks.csi.com
+ Pascal Meheut		pascal@cnam.cnam.fr
+ Patrick Fulconis	fulco@sig.uvsq.fr
+ Patrick Timmons		timmons@electech.polymtl.ca
+-Pavel Raiskup           praiskup@redhat.com
+ Paul Eggert		eggert@twinsun.com
+ Paul Kanz		paul@icx.com
+ Paul Mitchell		P.Mitchell@surrey.ac.uk
+@@ -402,6 +403,7 @@ Paul Nevai		pali+@osu.edu
+ Paul Nordstrom		100067.3532@compuserve.com
+ Paul O'Connor		oconnorp@ul.ie
+ Paul Siddall		pauls@postman.essex.ac.uk
++Pavel Raiskup           praiskup@redhat.com
+ Peder Chr. Norgaard	pcn@tbit.dk
+ Pekka Janhunen		Pekka.Janhunen@fmi.fi
+ Per Bojsen		pb@delta.dk
+@@ -420,9 +422,9 @@ Piotr Rotter 		piotr.rotter@active24.pl
+ R. Kent Dybvig		dyb@cadence.bloomington.in.us
+ R. Scott Butler		butler@prism.es.dupont.com
+ Rainer Orth		ro@TechFak.Uni-Bielefeld.DE
+-Ralf Wildenhues 	Ralf.Wildenhues@gmx.de
+ Ralf S. Engelschall	rse@engelschall.com
+ Ralf Suckow		suckow@contrib.de
++Ralf Wildenhues 	Ralf.Wildenhues@gmx.de
+ Ralph Corderoy		ralph@inputplus.co.uk
+ Ralph Schleicher	rs@purple.ul.bawue.de
+ Randy Bias		randyb@edge.edge.net
+diff --git a/src/extract.c b/src/extract.c
+index b384fed3..3bf0d77e 100644
+--- a/src/extract.c
++++ b/src/extract.c
+@@ -1037,7 +1037,7 @@ safe_dir_mode (struct stat const *st)
+ /* Extractor functions for various member types */
+ 
+ static bool
+-extract_dir (char *file_name, char typeflag)
++extract_dir (char *file_name, MAYBE_UNUSED char typeflag)
+ {
+   int status;
+   mode_t mode;
+@@ -1060,8 +1060,6 @@ extract_dir (char *file_name, char typeflag)
+   if (incremental_option)
+     /* Read the entry and delete files that aren't listed in the archive.  */
+     purge_directory (file_name);
+-  else if (typeflag == GNUTYPE_DUMPDIR)
+-    skip_member ();
+ 
+   mode = safe_dir_mode (&current_stat_info.stat);
+ 
+@@ -1266,10 +1264,7 @@ extract_file (char *file_name, char typeflag)
+     {
+       fd = sys_exec_command (file_name, 'f', &current_stat_info);
+       if (fd < 0)
+-	{
+-	  skip_member ();
+-	  return true;
+-	}
++	return true;
+     }
+   else
+     {
+@@ -1289,7 +1284,6 @@ extract_file (char *file_name, char typeflag)
+ 	  int recover = maybe_recoverable (file_name, true, &interdir_made);
+ 	  if (recover != RECOVER_OK)
+ 	    {
+-	      skip_member ();
+ 	      if (recover == RECOVER_SKIP)
+ 		return true;
+ 	      open_error (file_name);
+@@ -1337,6 +1331,7 @@ extract_file (char *file_name, char typeflag)
+       }
+ 
+   skim_file (size, false);
++  current_stat_info.skipped = true;
+ 
+   mv_end ();
+ 
+@@ -1841,15 +1836,9 @@ extract_archive (void)
+ 
+   tar_extractor_t fun = prepare_to_extract (current_stat_info.file_name,
+ 					    typeflag);
+-  if (fun)
+-    {
+-      if (fun (current_stat_info.file_name, typeflag))
+-	return;
+-    }
+-  else
+-    skip_member ();
+-
+-  if (backup_option)
++  bool ok = fun && fun (current_stat_info.file_name, typeflag);
++  skip_member ();
++  if (!ok && backup_option)
+     undo_last_backup ();
+ }
+ 
+diff --git a/src/incremen.c b/src/incremen.c
+index 7bcfdb93..194d5cb1 100644
+--- a/src/incremen.c
++++ b/src/incremen.c
+@@ -1625,8 +1625,8 @@ dumpdir_ok (char *dumpdir)
+ 
+ /* Examine the directories under directory_name and delete any
+    files that were not there at the time of the back-up. */
+-static bool
+-try_purge_directory (char const *directory_name)
++void
++purge_directory (char const *directory_name)
+ {
+   char *current_dir;
+   char *cur, *arc, *p;
+@@ -1634,18 +1634,18 @@ try_purge_directory (char const *directory_name)
+   struct dumpdir *dump;
+ 
+   if (!is_dumpdir (&current_stat_info))
+-    return false;
++    return;
+ 
+   current_dir = tar_savedir (directory_name, 0);
+ 
+   if (!current_dir)
+     /* The directory doesn't exist now.  It'll be created.  In any
+        case, we don't have to delete any files out of it.  */
+-    return false;
++    return;
+ 
+   /* Verify if dump directory is sane */
+   if (!dumpdir_ok (current_stat_info.dumpdir))
+-    return false;
++    return;
+ 
+   /* Process renames */
+   for (arc = current_stat_info.dumpdir; *arc; arc += strlen (arc) + 1)
+@@ -1666,7 +1666,7 @@ try_purge_directory (char const *directory_name)
+ 		      quote (temp_stub)));
+ 	      free (temp_stub);
+ 	      free (current_dir);
+-	      return false;
++	      return;
+ 	    }
+ 	}
+       else if (*arc == 'R')
+@@ -1700,7 +1700,7 @@ try_purge_directory (char const *directory_name)
+ 	      free (current_dir);
+ 	      /* FIXME: Make sure purge_directory(dst) will return
+ 		 immediately */
+-	      return false;
++	      return;
+ 	    }
+ 	}
+     }
+@@ -1758,14 +1758,6 @@ try_purge_directory (char const *directory_name)
+   dumpdir_free (dump);
+ 
+   free (current_dir);
+-  return true;
+-}
+-
+-void
+-purge_directory (char const *directory_name)
+-{
+-  if (!try_purge_directory (directory_name))
+-    skip_member ();
+ }
+ 
+ void
+diff --git a/src/list.c b/src/list.c
+index 928779e1..c9623eb4 100644
+--- a/src/list.c
++++ b/src/list.c
+@@ -437,20 +437,15 @@ read_header (union block **return_block, struct tar_stat_info *info,
+       if ((status = tar_checksum (header, false)) != HEADER_SUCCESS)
+ 	break;
+ 
+-      /* Good block.  Decode file size and return.  */
+-
+-      if (header->header.typeflag == LNKTYPE)
+-	info->stat.st_size = 0;	/* links 0 size on tape */
+-      else
++      info->stat.st_size = OFF_FROM_HEADER (header->header.size);
++      if (info->stat.st_size < 0)
+ 	{
+-	  info->stat.st_size = OFF_FROM_HEADER (header->header.size);
+-	  if (info->stat.st_size < 0)
+-	    {
+-	      status = HEADER_FAILURE;
+-	      break;
+-	    }
++	  status = HEADER_FAILURE;
++	  break;
+ 	}
+ 
++      info->skipped = false;
++
+       if (header->header.typeflag == GNUTYPE_LONGNAME
+ 	  || header->header.typeflag == GNUTYPE_LONGLINK
+ 	  || header->header.typeflag == XHDTYPE
+@@ -513,11 +508,15 @@ read_header (union block **return_block, struct tar_stat_info *info,
+ 		}
+ 
+ 	      *bp = '\0';
++	      info->skipped = true;
+ 	    }
+ 	  else if (header->header.typeflag == XHDTYPE
+ 		   || header->header.typeflag == SOLARIS_XHDTYPE)
+-	    xheader_read (&info->xhdr, header,
+-			  OFF_FROM_HEADER (header->header.size));
++	    {
++	      xheader_read (&info->xhdr, header,
++			    OFF_FROM_HEADER (header->header.size));
++	      info->skipped = true;
++	    }
+ 	  else if (header->header.typeflag == XGLTYPE)
+ 	    {
+ 	      struct xheader xhdr;
+@@ -531,6 +530,7 @@ read_header (union block **return_block, struct tar_stat_info *info,
+ 			    OFF_FROM_HEADER (header->header.size));
+ 	      xheader_decode_global (&xhdr);
+ 	      xheader_destroy (&xhdr);
++	      info->skipped = true;
+ 	      if (mode == read_header_x_global)
+ 		{
+ 		  status = HEADER_SUCCESS_EXTENDED;
+@@ -1440,23 +1440,6 @@ skip_member (void)
+   skim_member (false);
+ }
+ 
+-static bool
+-member_is_dir (struct tar_stat_info *info, char typeflag)
+-{
+-  switch (typeflag) {
+-  case AREGTYPE:
+-  case REGTYPE:
+-  case CONTTYPE:
+-    return info->had_trailing_slash;
+-
+-  case DIRTYPE:
+-    return true;
+-
+-  default:
+-    return false;
+-  }
+-}
+-
+ /* Skip the current member in the archive.
+    If MUST_COPY, always copy instead of skipping.  */
+ void
+@@ -1464,18 +1447,17 @@ skim_member (bool must_copy)
+ {
+   if (!current_stat_info.skipped)
+     {
+-      bool is_dir = member_is_dir (&current_stat_info,
+-				   current_header->header.typeflag);
+       set_next_block_after (current_header);
+ 
+       mv_begin_read (&current_stat_info);
+ 
+       if (current_stat_info.is_sparse)
+ 	sparse_skim_file (&current_stat_info, must_copy);
+-      else if (!is_dir)
++      else
+ 	skim_file (current_stat_info.stat.st_size, must_copy);
+ 
+       mv_end ();
++      current_stat_info.skipped = true;
+     }
+ }
+ 
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index 6cf726c0..baeb55bb 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -133,6 +133,7 @@ TESTSUITE_AT = \
+  extrac23.at\
+  extrac24.at\
+  extrac25.at\
++ extrac32.at\
+  filerem01.at\
+  filerem02.at\
+  grow.at\
+diff --git a/tests/extrac32.at b/tests/extrac32.at
+new file mode 100644
+index 00000000..3829a483
+--- /dev/null
++++ b/tests/extrac32.at
+@@ -0,0 +1,47 @@
++# Check for file injection bug with symlinks. -*- Autotest -*-
++
++# Copyright 2026 Free Software Foundation, Inc.
++
++# This file is part of GNU tar.
++
++# GNU tar is free software; you can redistribute it and/or modify
++# it under the terms of the GNU General Public License as published by
++# the Free Software Foundation; either version 3 of the License, or
++# (at your option) any later version.
++
++# GNU tar is distributed in the hope that it will be useful,
++# but WITHOUT ANY WARRANTY; without even the implied warranty of
++# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++# GNU General Public License for more details.
++
++# You should have received a copy of the GNU General Public License
++# along with this program.  If not, see <http://www.gnu.org/licenses/>.
++
++# Thanks to Guillermo de Angel for the bug report and test cases; see:
++# https://lists.gnu.org/r/bug-tar/2026-03/msg00007.html
++
++AT_SETUP([skip file injection])
++AT_KEYWORDS([injection])
++AT_DATA([archive.in],
++[/Td6WFoAAATm1rRGBMDbAYAcIQEcAAAAAAAAACYr+9LgDf8A010AMZhKvfVdtHe4Rxjj7M03ek97
++UgeKfJ0ORqYg0XDFntWxdTH4PYrTOo9CoqBrnTM2NcwFBrRVr7aFwdd56vddyAw2QGDjxgNexDU3
++ImTi/+z8ZOLMi/+AybdEpd5aA/M9Maa+8tQ84bySzSAwrmxMWJJ6W9IKvsqfiRa3TrD51v44PZU/
++KLVKpocS56n/O3g+b+hiZwaysR0eLO+tiU8FB/e3PEq3vTtDFVi/YfZMieBWSzomSX9eF13K1yPY
++UuWgp7VokXqduL0YGNVV40MTPG9oAAAApD6mpajengIAAfcBgBwAAOM4xw6xxGf7AgAAAAAEWVo=
++])
++AT_CHECK([base64 --help >/dev/null 2>&1 || AT_SKIP_TEST
++xz --help >/dev/null 2>&1 || AT_SKIP_TEST
++base64 -d < archive.in | xz -c -d > archive.tar
++])
++cp archive.tar /tmp
++AT_CHECK([tar tf archive.tar],
++[0],
++[carrier_entry
++marker.txt
++])
++AT_CHECK([tar xvf archive.tar],
++[0],
++[carrier_entry
++marker.txt
++])
++AT_CLEANUP
+diff --git a/tests/skipdir.at b/tests/skipdir.at
+index 7106ee74..a58a20fd 100644
+--- a/tests/skipdir.at
++++ b/tests/skipdir.at
+@@ -42,15 +42,11 @@ base64 -d < archive.in | xz -c -d > archive.tar
+ AT_CHECK([tar tf archive.tar],
+ [0],
+ [owo1/
+-owo2/
+ ])
+ AT_CHECK([tar vxf archive.tar],
+ [0],
+ [owo1/
+-owo2/
+ ])
+ AT_CHECK([tar -xvf archive.tar --exclude owo1],
+-[0],
+-[owo2/
+-])
++[0])
+ AT_CLEANUP
+diff --git a/tests/testsuite.at b/tests/testsuite.at
+index f2229be1..58757005 100644
+--- a/tests/testsuite.at
++++ b/tests/testsuite.at
+@@ -349,6 +349,7 @@ m4_include([extrac22.at])
+ m4_include([extrac23.at])
+ m4_include([extrac24.at])
+ m4_include([extrac25.at])
++m4_include([extrac32.at])
+ 
+ m4_include([backup01.at])
+ 
+-- 
+2.44.1
+
diff --git a/meta/recipes-extended/tar/tar_1.35.bb b/meta/recipes-extended/tar/tar_1.35.bb
index c7bd1d195e..f7d09a4126 100644
--- a/meta/recipes-extended/tar/tar_1.35.bb
+++ b/meta/recipes-extended/tar/tar_1.35.bb
@@ -48,6 +48,10 @@ SRC_URI += " \
     file://0001-tests-fix-TESTSUITE_AT.patch \
     file://0002-tests-check-for-recently-fixed-bug.patch \
     file://0003-Exclude-VCS-directory-with-writing-from-an-archive.patch \
+    file://CVE-2026-5704-dependent_p1.patch \
+    file://CVE-2026-5704-dependent_p2.patch \
+    file://CVE-2026-5704.patch \
+    file://CVE-2026-5704-regression.patch \
 "
 
 inherit ptest
-- 
2.35.6


