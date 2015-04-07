Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 63BD373CEB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Apr 2015 11:24:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t37BOWjD026730
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 Apr 2015 04:24:32 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 7 Apr 2015 04:24:32 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 7 Apr 2015 04:24:24 -0700
Message-ID: <696281317e78332d73d7fbead7d9011367f4c459.1428405830.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1428405830.git.liezhi.yang@windriver.com>
References: <cover.1428405830.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 03/10] patch: 2.7.1 -> 2.7.5
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
X-List-Received-Date: Tue, 07 Apr 2015 11:24:32 -0000
Content-Type: text/plain

* Removed backport patch patch-CVE-2015-1196.patch
* Add HOMEPAGE

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/patch/patch.inc              |    1 +
 .../patch/patch/patch-CVE-2015-1196.patch          |  200 --------------------
 .../patch/{patch_2.7.1.bb => patch_2.7.5.bb}       |    6 +-
 3 files changed, 3 insertions(+), 204 deletions(-)
 delete mode 100644 meta/recipes-devtools/patch/patch/patch-CVE-2015-1196.patch
 rename meta/recipes-devtools/patch/{patch_2.7.1.bb => patch_2.7.5.bb} (60%)

diff --git a/meta/recipes-devtools/patch/patch.inc b/meta/recipes-devtools/patch/patch.inc
index 332b97a..cbfb8cf 100644
--- a/meta/recipes-devtools/patch/patch.inc
+++ b/meta/recipes-devtools/patch/patch.inc
@@ -3,6 +3,7 @@ DESCRIPTION = "patch takes a patch file containing a difference listing \
 produced by the diff program and applies those differences to one or more \
 original files, producing patched versions."
 SECTION = "utils"
+HOMEPAGE = "http://savannah.gnu.org/projects/patch/"
 
 SRC_URI = "${GNU_MIRROR}/patch/patch-${PV}.tar.gz"
 S = "${WORKDIR}/patch-${PV}"
diff --git a/meta/recipes-devtools/patch/patch/patch-CVE-2015-1196.patch b/meta/recipes-devtools/patch/patch/patch-CVE-2015-1196.patch
deleted file mode 100644
index d408346..0000000
--- a/meta/recipes-devtools/patch/patch/patch-CVE-2015-1196.patch
+++ /dev/null
@@ -1,200 +0,0 @@
-From 4e9269a5fc1fe80a1095a92593dd85db871e1fd3 Mon Sep 17 00:00:00 2001
-From: Andreas Gruenbacher <andreas.gruenbacher@gmail.com>
-Date: Mon, 19 Jan 2015 23:18:30 +0100
-Subject: [PATCH] Make sure symlinks don't point outside working directory
- (CVE-2015-1196)
-
-When creating symlinks from git-style patches, make sure the symlinks don't
-point above the current working directory.  Otherwise, a subsequent patch could
-use the symlink to write outside the working directory.
-
-* src/pch.c (symlink_target_is_valid): New function to check for valid symlink
-targets.
-* src/util.c (move_file): Use symlink_target_is_valid() here.
-* tests/symlinks: Add valid and invalid symlink test cases.
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-
-Upstream-Status: Backport
-
----
- NEWS           |  3 ++
- src/pch.c      | 54 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
- src/pch.h      |  1 +
- src/util.c     |  7 +++++++
- tests/symlinks | 53 +++++++++++++++++++++++++++++++++++++++++++++++++++++
- 5 files changed, 117 insertions(+)
-
-diff --git a/NEWS b/NEWS
-index 42afed7..d3f1c2d 100644
---- a/NEWS
-+++ b/NEWS
-@@ -1,3 +1,6 @@
-+* With git-style patches, symlinks that point outside the working directory
-+  will no longer be created.
-+
- Changes in version 2.7.1:
- 
- * Two critical bug fixes in the "diff --git" format support.
-diff --git a/src/pch.c b/src/pch.c
-index 55e1504..f05ef83 100644
---- a/src/pch.c
-+++ b/src/pch.c
-@@ -454,6 +454,60 @@ name_is_valid (char const *name)
-   return is_valid;
- }
- 
-+bool
-+symlink_target_is_valid (char const *target, char const *to)
-+{
-+  bool is_valid;
-+
-+  if (IS_ABSOLUTE_FILE_NAME (to))
-+    is_valid = true;
-+  else if (IS_ABSOLUTE_FILE_NAME (target))
-+    is_valid = false;
-+  else
-+    {
-+      unsigned int depth = 0;
-+      char const *t;
-+
-+      is_valid = true;
-+      t = to;
-+      while (*t)
-+	{
-+	  while (*t && ! ISSLASH (*t))
-+	    t++;
-+	  if (ISSLASH (*t))
-+	    {
-+	      while (ISSLASH (*t))
-+		t++;
-+	      depth++;
-+	    }
-+	}
-+
-+      t = target;
-+      while (*t)
-+	{
-+	  if (*t == '.' && *++t == '.' && (! *++t || ISSLASH (*t)))
-+	    {
-+	      if (! depth--)
-+		{
-+		  is_valid = false;
-+		  break;
-+		}
-+	    }
-+	  else
-+	    {
-+	      while (*t && ! ISSLASH (*t))
-+		t++;
-+	      depth++;
-+	    }
-+	  while (ISSLASH (*t))
-+	    t++;
-+	}
-+    }
-+
-+  /* Allow any symlink target if we are in the filesystem root.  */
-+  return is_valid || cwd_is_root (to);
-+}
-+
- /* Determine what kind of diff is in the remaining part of the patch file. */
- 
- static enum diff
-diff --git a/src/pch.h b/src/pch.h
-index 0c7ff62..58861b0 100644
---- a/src/pch.h
-+++ b/src/pch.h
-@@ -37,6 +37,7 @@ bool pch_write_line (lin, FILE *);
- bool there_is_another_patch (bool, mode_t *);
- char *pfetch (lin) _GL_ATTRIBUTE_PURE;
- char pch_char (lin) _GL_ATTRIBUTE_PURE;
-+bool symlink_target_is_valid (char const *, char const *);
- int another_hunk (enum diff, bool);
- int pch_says_nonexistent (bool) _GL_ATTRIBUTE_PURE;
- size_t pch_line_len (lin) _GL_ATTRIBUTE_PURE;
-diff --git a/src/util.c b/src/util.c
-index 66ae90f..636eded 100644
---- a/src/util.c
-+++ b/src/util.c
-@@ -470,6 +470,13 @@ move_file (char const *from, bool *from_needs_removal,
- 	    read_fatal ();
- 	  buffer[size] = 0;
- 
-+	  if (! symlink_target_is_valid (buffer, to))
-+	    {
-+	      fprintf (stderr, "symbolic link target '%s' is invalid\n",
-+		       buffer);
-+	      fatal_exit (0);
-+	    }
-+
- 	  if (! backup)
- 	    {
- 	      if (unlink (to) == 0)
-diff --git a/tests/symlinks b/tests/symlinks
-index 96626b3..6211026 100644
---- a/tests/symlinks
-+++ b/tests/symlinks
-@@ -146,6 +146,59 @@ ncheck 'test ! -L symlink'
- 
- # --------------------------------------------------------------
- 
-+# Patch should not create symlinks which point outside the working directory.
-+
-+cat > symlink-target.diff <<EOF
-+diff --git a/dir/foo b/dir/foo
-+new file mode 120000
-+index 0000000..cad2309
-+--- /dev/null
-++++ b/dir/foo
-+@@ -0,0 +1 @@
-++../foo
-+\ No newline at end of file
-+EOF
-+
-+check 'patch -p1 < symlink-target.diff || echo "Status: $?"' <<EOF
-+patching symbolic link dir/foo
-+EOF
-+
-+cat > bad-symlink-target1.diff <<EOF
-+diff --git a/bar b/bar
-+new file mode 120000
-+index 0000000..cad2309
-+--- /dev/null
-++++ b/bar
-+@@ -0,0 +1 @@
-++/bar
-+\ No newline at end of file
-+EOF
-+
-+check 'patch -p1 < bad-symlink-target1.diff || echo "Status: $?"' <<EOF
-+patching symbolic link bar
-+symbolic link target '/bar' is invalid
-+Status: 2
-+EOF
-+
-+cat > bad-symlink-target2.diff <<EOF
-+diff --git a/baz b/baz
-+new file mode 120000
-+index 0000000..cad2309
-+--- /dev/null
-++++ b/baz
-+@@ -0,0 +1 @@
-++../baz
-+\ No newline at end of file
-+EOF
-+
-+check 'patch -p1 < bad-symlink-target2.diff || echo "Status: $?"' <<EOF
-+patching symbolic link baz
-+symbolic link target '../baz' is invalid
-+Status: 2
-+EOF
-+
-+# --------------------------------------------------------------
-+
- # The backup file of a new symlink is an empty regular file.
- 
- check 'patch -p1 --backup < create-symlink.diff || echo "Status: $?"' <<EOF
--- 
-2.1.4
-
diff --git a/meta/recipes-devtools/patch/patch_2.7.1.bb b/meta/recipes-devtools/patch/patch_2.7.5.bb
similarity index 60%
rename from meta/recipes-devtools/patch/patch_2.7.1.bb
rename to meta/recipes-devtools/patch/patch_2.7.5.bb
index 1a3b9b1..20ed6c8 100644
--- a/meta/recipes-devtools/patch/patch_2.7.1.bb
+++ b/meta/recipes-devtools/patch/patch_2.7.5.bb
@@ -1,10 +1,8 @@
 require patch.inc
 LICENSE = "GPLv3"
 
-SRC_URI += "file://patch-CVE-2015-1196.patch"
-
-SRC_URI[md5sum] = "95dd8d7e41dcbcecdd5cd88ef915378d"
-SRC_URI[sha256sum] = "c05f28668c3474bc63adcd48abae921d15e71c254fbebdbaeda40456d64039d5"
+SRC_URI[md5sum] = "ed4d5674ef4543b4eb463db168886dc7"
+SRC_URI[sha256sum] = "7436f5a19f93c3ca83153ce9c5cbe4847e97c5d956e57a220121e741f6e7968f"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-- 
1.7.9.5


