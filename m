Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 483C0723B3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Mar 2015 06:42:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t2Q6gZZd015253
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 23:42:35 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 25 Mar 2015 23:42:35 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 25 Mar 2015 23:42:34 -0700
Message-ID: <86e4a87a659cffcf2383c89cdcec9ee4e2b84faa.1427352132.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1427352132.git.liezhi.yang@windriver.com>
References: <cover.1427352132.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] patch: fix CVE-2015-1196
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
X-List-Received-Date: Thu, 26 Mar 2015 06:42:36 -0000
Content-Type: text/plain

A directory traversal flaw was reported in patch:

References:
http://www.openwall.com/lists/oss-security/2015/01/18/6
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=775227
https://bugzilla.redhat.com/show_bug.cgi?id=1182154

[YOCTO #7182]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/patch/patch.inc              |    5 +-
 .../patch/patch/patch-CVE-2015-1196.patch          |  200 ++++++++++++++++++++
 2 files changed, 204 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/patch/patch/patch-CVE-2015-1196.patch

diff --git a/meta/recipes-devtools/patch/patch.inc b/meta/recipes-devtools/patch/patch.inc
index 332b97a..d306403 100644
--- a/meta/recipes-devtools/patch/patch.inc
+++ b/meta/recipes-devtools/patch/patch.inc
@@ -4,7 +4,10 @@ produced by the diff program and applies those differences to one or more \
 original files, producing patched versions."
 SECTION = "utils"
 
-SRC_URI = "${GNU_MIRROR}/patch/patch-${PV}.tar.gz"
+SRC_URI = "${GNU_MIRROR}/patch/patch-${PV}.tar.gz \
+        file://patch-CVE-2015-1196.patch \
+        "
+
 S = "${WORKDIR}/patch-${PV}"
 
 inherit autotools update-alternatives
diff --git a/meta/recipes-devtools/patch/patch/patch-CVE-2015-1196.patch b/meta/recipes-devtools/patch/patch/patch-CVE-2015-1196.patch
new file mode 100644
index 0000000..d408346
--- /dev/null
+++ b/meta/recipes-devtools/patch/patch/patch-CVE-2015-1196.patch
@@ -0,0 +1,200 @@
+From 4e9269a5fc1fe80a1095a92593dd85db871e1fd3 Mon Sep 17 00:00:00 2001
+From: Andreas Gruenbacher <andreas.gruenbacher@gmail.com>
+Date: Mon, 19 Jan 2015 23:18:30 +0100
+Subject: [PATCH] Make sure symlinks don't point outside working directory
+ (CVE-2015-1196)
+
+When creating symlinks from git-style patches, make sure the symlinks don't
+point above the current working directory.  Otherwise, a subsequent patch could
+use the symlink to write outside the working directory.
+
+* src/pch.c (symlink_target_is_valid): New function to check for valid symlink
+targets.
+* src/util.c (move_file): Use symlink_target_is_valid() here.
+* tests/symlinks: Add valid and invalid symlink test cases.
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+
+Upstream-Status: Backport
+
+---
+ NEWS           |  3 ++
+ src/pch.c      | 54 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ src/pch.h      |  1 +
+ src/util.c     |  7 +++++++
+ tests/symlinks | 53 +++++++++++++++++++++++++++++++++++++++++++++++++++++
+ 5 files changed, 117 insertions(+)
+
+diff --git a/NEWS b/NEWS
+index 42afed7..d3f1c2d 100644
+--- a/NEWS
++++ b/NEWS
+@@ -1,3 +1,6 @@
++* With git-style patches, symlinks that point outside the working directory
++  will no longer be created.
++
+ Changes in version 2.7.1:
+ 
+ * Two critical bug fixes in the "diff --git" format support.
+diff --git a/src/pch.c b/src/pch.c
+index 55e1504..f05ef83 100644
+--- a/src/pch.c
++++ b/src/pch.c
+@@ -454,6 +454,60 @@ name_is_valid (char const *name)
+   return is_valid;
+ }
+ 
++bool
++symlink_target_is_valid (char const *target, char const *to)
++{
++  bool is_valid;
++
++  if (IS_ABSOLUTE_FILE_NAME (to))
++    is_valid = true;
++  else if (IS_ABSOLUTE_FILE_NAME (target))
++    is_valid = false;
++  else
++    {
++      unsigned int depth = 0;
++      char const *t;
++
++      is_valid = true;
++      t = to;
++      while (*t)
++	{
++	  while (*t && ! ISSLASH (*t))
++	    t++;
++	  if (ISSLASH (*t))
++	    {
++	      while (ISSLASH (*t))
++		t++;
++	      depth++;
++	    }
++	}
++
++      t = target;
++      while (*t)
++	{
++	  if (*t == '.' && *++t == '.' && (! *++t || ISSLASH (*t)))
++	    {
++	      if (! depth--)
++		{
++		  is_valid = false;
++		  break;
++		}
++	    }
++	  else
++	    {
++	      while (*t && ! ISSLASH (*t))
++		t++;
++	      depth++;
++	    }
++	  while (ISSLASH (*t))
++	    t++;
++	}
++    }
++
++  /* Allow any symlink target if we are in the filesystem root.  */
++  return is_valid || cwd_is_root (to);
++}
++
+ /* Determine what kind of diff is in the remaining part of the patch file. */
+ 
+ static enum diff
+diff --git a/src/pch.h b/src/pch.h
+index 0c7ff62..58861b0 100644
+--- a/src/pch.h
++++ b/src/pch.h
+@@ -37,6 +37,7 @@ bool pch_write_line (lin, FILE *);
+ bool there_is_another_patch (bool, mode_t *);
+ char *pfetch (lin) _GL_ATTRIBUTE_PURE;
+ char pch_char (lin) _GL_ATTRIBUTE_PURE;
++bool symlink_target_is_valid (char const *, char const *);
+ int another_hunk (enum diff, bool);
+ int pch_says_nonexistent (bool) _GL_ATTRIBUTE_PURE;
+ size_t pch_line_len (lin) _GL_ATTRIBUTE_PURE;
+diff --git a/src/util.c b/src/util.c
+index 66ae90f..636eded 100644
+--- a/src/util.c
++++ b/src/util.c
+@@ -470,6 +470,13 @@ move_file (char const *from, bool *from_needs_removal,
+ 	    read_fatal ();
+ 	  buffer[size] = 0;
+ 
++	  if (! symlink_target_is_valid (buffer, to))
++	    {
++	      fprintf (stderr, "symbolic link target '%s' is invalid\n",
++		       buffer);
++	      fatal_exit (0);
++	    }
++
+ 	  if (! backup)
+ 	    {
+ 	      if (unlink (to) == 0)
+diff --git a/tests/symlinks b/tests/symlinks
+index 96626b3..6211026 100644
+--- a/tests/symlinks
++++ b/tests/symlinks
+@@ -146,6 +146,59 @@ ncheck 'test ! -L symlink'
+ 
+ # --------------------------------------------------------------
+ 
++# Patch should not create symlinks which point outside the working directory.
++
++cat > symlink-target.diff <<EOF
++diff --git a/dir/foo b/dir/foo
++new file mode 120000
++index 0000000..cad2309
++--- /dev/null
+++++ b/dir/foo
++@@ -0,0 +1 @@
+++../foo
++\ No newline at end of file
++EOF
++
++check 'patch -p1 < symlink-target.diff || echo "Status: $?"' <<EOF
++patching symbolic link dir/foo
++EOF
++
++cat > bad-symlink-target1.diff <<EOF
++diff --git a/bar b/bar
++new file mode 120000
++index 0000000..cad2309
++--- /dev/null
+++++ b/bar
++@@ -0,0 +1 @@
+++/bar
++\ No newline at end of file
++EOF
++
++check 'patch -p1 < bad-symlink-target1.diff || echo "Status: $?"' <<EOF
++patching symbolic link bar
++symbolic link target '/bar' is invalid
++Status: 2
++EOF
++
++cat > bad-symlink-target2.diff <<EOF
++diff --git a/baz b/baz
++new file mode 120000
++index 0000000..cad2309
++--- /dev/null
+++++ b/baz
++@@ -0,0 +1 @@
+++../baz
++\ No newline at end of file
++EOF
++
++check 'patch -p1 < bad-symlink-target2.diff || echo "Status: $?"' <<EOF
++patching symbolic link baz
++symbolic link target '../baz' is invalid
++Status: 2
++EOF
++
++# --------------------------------------------------------------
++
+ # The backup file of a new symlink is an empty regular file.
+ 
+ check 'patch -p1 --backup < create-symlink.diff || echo "Status: $?"' <<EOF
+-- 
+2.1.4
+
-- 
1.7.9.5


