Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C802A61F47
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Aug 2013 05:16:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7P5Gpja021764
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 24 Aug 2013 22:16:51 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Sat, 24 Aug 2013 22:16:49 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sun, 25 Aug 2013 01:16:34 -0400
Message-ID: <ea59bde8fe9e8ac1b90fee7a2d74cbf16424a0dc.1377405083.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1377405083.git.bruce.ashfield@windriver.com>
References: <cover.1377405083.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/7] guilt: update to latest git version
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
X-List-Received-Date: Sun, 25 Aug 2013 05:16:52 -0000
Content-Type: text/plain

Uprev guilt to the latest guilt version from its upstream repository.
As part of the uprev all of the previous changes required for the
yocto kernel tools to use git to manipulate series files have been
dropped. These changes were specific to circumventing parts of guilt's
internal santiy checking to allow specific Yocto kernel manipluation
of sub-series files.

Since the kernel tools no longer need guilt, we can use an up to date
and nearly pure upstream version of guilt.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 .../guilt/files/guilt-import-commit.patch          |   96 ------
 meta/recipes-devtools/guilt/files/guilt-init.patch |   25 --
 meta/recipes-devtools/guilt/files/guilt-pop.patch  |   73 -----
 .../guilt/files/guilt-push-no-series.patch         |   29 --
 meta/recipes-devtools/guilt/files/guilt-push.patch |   42 ---
 .../guilt/files/guilt-set-git_exec_path.patch      |   29 --
 ...lt-update-supported-git-versions-to-1.8.x.patch |   28 --
 meta/recipes-devtools/guilt/files/guilt.patch      |  319 --------------------
 .../guilt/files/improve_auto_header_gen.patch      |   71 -----
 .../files/make_git_commands_conditional.patch      |   48 ---
 .../guilt/files/optional_head_check.patch          |   60 ----
 .../guilt/files/uninstall_force.patch              |   14 -
 .../{guilt-native_0.33.bb => guilt-native_git.bb}  |   21 +-
 13 files changed, 6 insertions(+), 849 deletions(-)
 delete mode 100644 meta/recipes-devtools/guilt/files/guilt-import-commit.patch
 delete mode 100644 meta/recipes-devtools/guilt/files/guilt-init.patch
 delete mode 100644 meta/recipes-devtools/guilt/files/guilt-pop.patch
 delete mode 100644 meta/recipes-devtools/guilt/files/guilt-push-no-series.patch
 delete mode 100644 meta/recipes-devtools/guilt/files/guilt-push.patch
 delete mode 100644 meta/recipes-devtools/guilt/files/guilt-set-git_exec_path.patch
 delete mode 100644 meta/recipes-devtools/guilt/files/guilt-update-supported-git-versions-to-1.8.x.patch
 delete mode 100644 meta/recipes-devtools/guilt/files/guilt.patch
 delete mode 100644 meta/recipes-devtools/guilt/files/improve_auto_header_gen.patch
 delete mode 100644 meta/recipes-devtools/guilt/files/make_git_commands_conditional.patch
 delete mode 100644 meta/recipes-devtools/guilt/files/optional_head_check.patch
 delete mode 100644 meta/recipes-devtools/guilt/files/uninstall_force.patch
 rename meta/recipes-devtools/guilt/{guilt-native_0.33.bb => guilt-native_git.bb} (45%)

diff --git a/meta/recipes-devtools/guilt/files/guilt-import-commit.patch b/meta/recipes-devtools/guilt/files/guilt-import-commit.patch
deleted file mode 100644
index bd746c5..0000000
--- a/meta/recipes-devtools/guilt/files/guilt-import-commit.patch
+++ /dev/null
@@ -1,96 +0,0 @@
-guilt: import commits via git format-patch
-
-Rather than attempting to process commits directly, it
-is preferable to try dumping the change via git format-patch
-to take advantage of the proper header/subject/from lines that
-are generated.
-
-If patches cannot be exported, fall back to importing 
-commits via a more custom method.
-
-Upstream-Status: Inappropriate [oe-specific]
-
-Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
-
----
- guilt-import-commit |   40 +++++++++++++++++++++++++++++-----------
- 1 file changed, 29 insertions(+), 11 deletions(-)
-
---- a/guilt-import-commit
-+++ b/guilt-import-commit
-@@ -20,46 +20,64 @@ fi
- disp "About to begin conversion..." >&2
- disp "Current head: `cat $GIT_DIR/refs/heads/$branch`" >&2
- 
-+# try git-format-patch first, if it fails fall back to internal 
-+# methods.
-+patches=`git-format-patch -o $GUILT_DIR/$branch $rhash`
-+if [ -z "$patches" ]; then
-+    need_custom_patches="1"
-+fi
-+
- for rev in `git rev-list $rhash`; do
-+    if [ ! -z "$need_custom_patches" ]; then
- 	s=`git log --pretty=oneline -1 $rev | cut -c 42-`
- 
- 	fname=`echo $s | sed -e "s/&/and/g" -e "s/[ :]/_/g" -e "s,[/\\],-,g" \
--			-e "s/['\\[{}]//g" -e 's/]//g' -e 's/\*/-/g' \
-+			-e "s/['\\()<>[{}]//g" -e 's/]//g' -e 's/\*/-/g' \
- 			-e 's/\?/-/g' | tr A-Z a-z`
- 
--	disp "Converting `echo $rev | cut -c 1-8` as $fname"
-+	disp "Converting `echo $rev | cut -c 1-8` as $fname.patch"
- 
- 	mangle_prefix=1
- 	fname_base=$fname
--	while [ -f "$GUILT_DIR/$branch/$fname" ]; do
-+	while [ -f "$GUILT_DIR/$branch/$fname.patch" ]; do
- 		fname="$fname_base-$mangle_prefix"
- 	        mangle_prefix=`expr $mangle_prefix + 1`
--		disp "Patch under that name exists...trying '$fname'"
-+		disp "Patch under that name exists...trying '$fname.patch'"
- 	done
- 
- 	(
- 		do_make_header $rev
- 		echo ""
- 		git diff --binary $rev^..$rev
--	) > $GUILT_DIR/$branch/$fname
-+	) > $GUILT_DIR/$branch/$fname.patch
- 
- 	# FIXME: grab the GIT_AUTHOR_DATE from the commit object and set the
- 	# timestamp on the patch
- 
--	# insert the patch name into the series file
--	series_insert_patch $fname
-+	patches="$patches $fname.patch"
-+    fi
- 
--	# Only reset if the commit was on this branch
--	if head_check $rev 2> /dev/null; then
-+    # Only reset if the commit was on this branch
-+    if head_check $rev 2> /dev/null; then
- 		# BEWARE: "git reset" ahead! Is there a way to verify that
- 		# we really created a patch? - We don't want to lose any
- 		# history.
- 		git reset --hard $rev^ > /dev/null
--	elif [ -z "$warned" ]; then
-+    elif [ -z "$warned" ]; then
- 		disp "Warning: commit $rev is not the HEAD...preserving commit" >&2
- 		disp "Warning: (this message is displayed only once)" >&2
- 		warned=t
--	fi
-+    fi
-+done
-+
-+rpatches=`echo "$patches" | sed 's% %\n%g' | tac`
-+for patch in $rpatches; do
-+
-+    iname=`echo $patch | sed s%$GUILT_DIR/$branch/%%`
-+    echo "Inserting $iname"	
-+	
-+    # insert the patch name into the series file
-+    series_insert_patch $iname
- done
- 
- disp "Done." >&2
diff --git a/meta/recipes-devtools/guilt/files/guilt-init.patch b/meta/recipes-devtools/guilt/files/guilt-init.patch
deleted file mode 100644
index 1583346..0000000
--- a/meta/recipes-devtools/guilt/files/guilt-init.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-guilt: allow previously initialized branches to be re-initialized
-
-Upstream-Status: Inappropriate [oe-specific]
-
-Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
-
----
- guilt-init |    6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
---- a/guilt-init
-+++ b/guilt-init
-@@ -20,9 +20,9 @@ while case $# in 0) break ;; esac; do
- 	shift
- done
- 
--if [ -d "$GUILT_DIR/$branch" ]; then
--	die "Branch $branch appears to be already initialized (GIT_DIR=$GIT_DIR)"
--fi
-+# if [ -d "$GUILT_DIR/$branch" ]; then
-+# 	die "Branch $branch appears to be already initialized (GIT_DIR=$GIT_DIR)"
-+# fi
- 
- [ ! -d "$GUILT_DIR" ] && mkdir "$GUILT_DIR"
- mkdir -p "$GUILT_DIR/$branch"
diff --git a/meta/recipes-devtools/guilt/files/guilt-pop.patch b/meta/recipes-devtools/guilt/files/guilt-pop.patch
deleted file mode 100644
index 9c05427..0000000
--- a/meta/recipes-devtools/guilt/files/guilt-pop.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-guilt: pop and delete tags
-
-Add support for popping to a tag and the ability to delete
-a tag while popping from the tree
-
-Upstream-Status: Inappropriate [oe-specific]
-
-Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
-
----
- guilt-pop |   28 ++++++++++++++++++++++++++--
- 1 file changed, 26 insertions(+), 2 deletions(-)
-
---- a/guilt-pop
-+++ b/guilt-pop
-@@ -17,6 +17,13 @@ while [ $# -gt 0 ]; do
- 		-n)
- 			num=t
- 			;;
-+                -t|--t)
-+                        tag=$2
-+                        shift
-+                        ;;
-+	        -d|--d) # can only be used with --t
-+                        delete_tag=t
-+                        ;;
- 		*)
- 			break
- 			;;
-@@ -24,7 +31,7 @@ while [ $# -gt 0 ]; do
- 	shift
- done
- 
--# "guilt-pop" or "guilt-pop foo" or "guilt-pop -n foo"
-+# "guilt-pop" or "guilt-pop foo" or "guilt-pop -n foo" or "guilt-pop -t <tag>"
- if [ -z "$all" ] && [ $# -gt 1 ]; then
- 	usage
- fi
-@@ -44,12 +51,26 @@ fi
- patch="$1"
- [ ! -z "$all" ] && patch="-a"
- 
-+
-+# tag processing will just roll into another one of
-+# the pop types, number or patch name
-+if [ ! -z "$tag" ]; then
-+        git-rev-list HEAD ^$tag > /dev/null 2>/dev/null
-+	if [ $? -eq 0 ]; then
-+	    revs="`git-rev-list HEAD ^$tag`"
-+	    num=`echo "$revs" | wc -l`
-+	    patch=$num
-+	else
-+	    echo "Cannot find tag $tag";
-+	    exit 0
-+        fi
-+fi
-+
- if [ ! -s "$applied" ]; then
- 	disp "No patches applied."
- 	exit 0
- elif [ "$patch" = "-a" ]; then
- 	# we are supposed to pop all patches
--
- 	sidx=`wc -l < $applied`
- 	eidx=0
- elif [ ! -z "$num" ]; then
-@@ -96,3 +117,6 @@ pop_many_patches `git rev-parse refs/pat
- p=`get_top`
- [ ! -z "$p" ] && disp "Now at $p." || disp "All patches popped."
- 
-+if [ ! -z "$delete_tag" ]; then
-+	git tag -d $tag
-+fi;
diff --git a/meta/recipes-devtools/guilt/files/guilt-push-no-series.patch b/meta/recipes-devtools/guilt/files/guilt-push-no-series.patch
deleted file mode 100644
index 3446f10..0000000
--- a/meta/recipes-devtools/guilt/files/guilt-push-no-series.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-guilt-push: Avoid duplicate hits in a series
-
-If a series file becomes mangled and a patch name appears in there
-more than once, then the guilt-push will fail a horrible and
-incomprehensible death.  Make it fail in a sensible way.
-
-Upstream-Status: Inappropriate [oe-specific]
-
-Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
-
----
-
- guilt-push |    5 +++++
- 1 file changed, 5 insertions(+)
-
---- a/guilt-push
-+++ b/guilt-push
-@@ -90,6 +90,11 @@ else
- 	if [ -z "$eidx" ]; then
- 		die "Patch $patch is not in the series or is guarded."
- 	fi
-+
-+	matches=`echo $eidx | wc -w`
-+	if [ $matches -gt 1 ]; then
-+		die "Patch $patch is in the series multiple times"
-+	fi
- fi
- 
- # make sure that there are no unapplied changes
diff --git a/meta/recipes-devtools/guilt/files/guilt-push.patch b/meta/recipes-devtools/guilt/files/guilt-push.patch
deleted file mode 100644
index 5ec290b..0000000
--- a/meta/recipes-devtools/guilt/files/guilt-push.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-guilt: add support for pushing and tagging
-
-It can be handy to push AND tag at the same time.
-
-Upstream-Status: Inappropriate [oe-specific]
-
-Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
-
----
-
- guilt-push |   16 +++++++++++++++-
- 1 file changed, 15 insertions(+), 1 deletion(-)
-
---- a/guilt-push
-+++ b/guilt-push
-@@ -19,7 +19,11 @@ while [ $# -gt 0 ]; do
- 		-n)
- 			num=t
- 			;;
--		*)
-+                -t|--t)
-+                        tag=$2
-+                        shift
-+                        ;;
-+		*)      
- 			break
- 			;;
- 	esac
-@@ -126,3 +130,13 @@ do
- 	fi
- done
- 
-+ret=$?
-+if [ $ret -ne 0 ]; then
-+    exit $ret
-+fi
-+
-+# if a tag was specified, tag the tree now.
-+if [ -n "$tag" ]; then
-+    git-rev-parse HEAD > "$GIT_DIR/refs/tags/$tag"
-+fi
-+
diff --git a/meta/recipes-devtools/guilt/files/guilt-set-git_exec_path.patch b/meta/recipes-devtools/guilt/files/guilt-set-git_exec_path.patch
deleted file mode 100644
index a40ec6f..0000000
--- a/meta/recipes-devtools/guilt/files/guilt-set-git_exec_path.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-guilt: set GIT_EXEC_PATH in guilt wrapper
-
-git has the habit of tracking the directory where it was 
-installed. If you build git, relocate git and then remove
-the old directory --exec-path will return that original
-(now non-existent) directory. We insist that git and 
-guilt be in the same directory to ensure they are matched,
-so we use the environment variable GIT_EXEC_PATH to 
-force the issue.
-
-Upstream-Status: Inappropriate [oe-specific]
-
-Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
-
----
- guilt |    2 ++
- 1 file changed, 2 insertions(+)
-
---- a/guilt
-+++ b/guilt
-@@ -23,6 +23,8 @@ esac
- # we change directories ourselves
- SUBDIRECTORY_OK=1
- 
-+export GIT_EXEC_PATH=`dirname $0`/../libexec/git-core
-+
- if [ -z "$DO_NOT_USE_GITREPO_COMMANDS" ]; then
-     . "$(git --exec-path)/git-sh-setup"
- fi
diff --git a/meta/recipes-devtools/guilt/files/guilt-update-supported-git-versions-to-1.8.x.patch b/meta/recipes-devtools/guilt/files/guilt-update-supported-git-versions-to-1.8.x.patch
deleted file mode 100644
index 579d9bc..0000000
--- a/meta/recipes-devtools/guilt/files/guilt-update-supported-git-versions-to-1.8.x.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From d7fb5d4e159071b6255181fcf436300038fe9e6c Mon Sep 17 00:00:00 2001
-From: Bruce Ashfield <bruce.ashfield@windriver.com>
-Date: Wed, 16 Jan 2013 20:48:11 -0500
-Subject: [PATCH] guilt: update supported git versions to 1.8.x
-
-guilt errors on the new 1.8.x git series, when it shouldn't, since
-1.8.x works fine with the existing guilt version.
-
-Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
----
- guilt |    1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/guilt b/guilt
-index 346f929..6505653 100755
---- a/guilt
-+++ b/guilt
-@@ -37,6 +37,7 @@ case "$gitver" in
- 	1.5.*)	;; # git config
- 	1.6.*)	;; # git config
- 	1.7.*)	;; # git config
-+	1.8.*)	;; # git config
- 	*)	die "Unsupported version of git ($gitver)" ;;
- esac
- 
--- 
-1.7.10.4
-
diff --git a/meta/recipes-devtools/guilt/files/guilt.patch b/meta/recipes-devtools/guilt/files/guilt.patch
deleted file mode 100644
index 8e5b61e..0000000
--- a/meta/recipes-devtools/guilt/files/guilt.patch
+++ /dev/null
@@ -1,319 +0,0 @@
-guilt: enhanced patch queue management
-
-guilt prefers to track the status and series of patches
-under .git/patches. But this location doesn't allow the
-status of a quilt queue to be committed to a secondary
-repository and later restored.
-
-This change does three things:
-
-  - allows GUILT_BASE to be changed (with a default to "wrs")
-  - allows shadow tracking of the patches (for rebase)
-  - enhances the header detection and creation of patches
-    as they are pushed onto the tree.
-
-Upstream-Status: Inappropriate [oe-specific]
-
-Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
-
----
- guilt |  183 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++---------
- 1 file changed, 159 insertions(+), 24 deletions(-)
-
---- a/guilt
-+++ b/guilt
-@@ -153,14 +153,16 @@ get_branch()
- 
- verify_branch()
- {
--	[ ! -d "$GIT_DIR/patches" ] &&
-+	[ ! -d "$GUILT_DIR" ] &&
- 		die "Patches directory doesn't exist, try guilt-init"
--	[ ! -d "$GIT_DIR/patches/$branch" ] &&
-+	[ ! -d "$GUILT_DIR/$branch" ] &&
- 		die "Branch $branch is not initialized, try guilt-init"
--	[ ! -f "$GIT_DIR/patches/$branch/series" ] &&
-+	[ ! -f "$GUILT_DIR/$branch/series" ] &&
- 		die "Branch $branch does not have a series file"
--	[ ! -f "$GIT_DIR/patches/$branch/status" ] &&
-+	[ ! -f "$GUILT_DIR/$branch/status" ] &&
- 		die "Branch $branch does not have a status file"
-+	[ -f "$GUILT_DIR/$branch/applied" ] &&
-+		die "Warning: Branch $branch has 'applied' file - guilt is not compatible with stgit"
- 	[ -f "$GIT_DIR/patches/$branch/applied" ] &&
- 		die "Warning: Branch $branch has 'applied' file - guilt is not compatible with stgit"
- }
-@@ -339,6 +341,17 @@ BEGIN{}
- '
- }
- 
-+# usage: do_get_only_patch patchfile
-+# similar to do_get_patch except everything leading up to
-+# the first diff line and after the last chunk are removed
-+do_get_only_patch()
-+{
-+	cat "$1" | awk '
-+BEGIN{}
-+/^(diff )/,/^(-- |END{})/
-+' | sed '/^-- *$/D'
-+}
-+
- # usage: do_get_header patchfile
- do_get_header()
- {
-@@ -352,8 +365,13 @@ do_get_header()
- BEGIN{skip=0}
- /^Subject:/ && (NR==1){print substr($0, 10); next}
- /^From:/{skip=1; next}
-+/^Author:/{skip=1; next}
-+/^Date:/{skip=1; next}
-+/^commit/{skip=1; next}
- /^[ \t\f\n\r\v]*$/ && (skip==1){skip=0; next}
- /^(diff |---$|--- )/{exit}
-+/^diff --git/{exit}
-+/^Index: /{exit}
- {print $0}
- END{}
- '
-@@ -415,6 +433,15 @@ series_insert_patch()
- 	mv "$series.tmp" "$series"
- }
- 
-+series_append_patch()
-+{
-+    # unlike series_insert_patch, which inserts the passed
-+    # patch after the current top patch, this function always
-+    # appends the patch to the series
-+
-+    echo $1 >> "$series"
-+}
-+
- # usage: series_remove_patch <patchname>
- series_remove_patch()
- {
-@@ -473,8 +500,7 @@ remove_patch_refs()
- # usage: pop_many_patches <commitish> <number of patches>
- pop_many_patches()
- {
--	assert_head_check
--
-+	head_check "`tail -1 < "$applied" | cut -d: -f 1`"
- 	(
- 		cd_to_toplevel
- 
-@@ -508,50 +534,149 @@ remove_ref()
- 	)
- }
- 
-+prep_patch()
-+{
-+	patch=$1;
-+	tgt=$2;
-+
-+	if test -f $patch; then
-+	    case $patch in
-+		*.gz)  gzip -dc $patch > $tgt ;;
-+		*.bz2) bzip2 -dc $patch >  $tgt ;;
-+		*) cp $patch $tgt ;;
-+	    esac;
-+	fi;
-+}
-+
- # usage: commit patchname parent
- commit()
- {
- 	(
- 		TMP_MSG=`get_tmp_file msg`
-+		TMP_PATCH=`get_tmp_file patch`
-+		TMP_PATCH_OUT=`get_tmp_file patch_out`
-+		TMP_INFO=`get_tmp_file info`
- 
- 		p="$GUILT_DIR/$branch/$1"
- 		pname="$1"
-+		prep_patch "$p" "$TMP_PATCH"
-+		p=$TMP_PATCH
-+
- 		cd_to_toplevel
- 
- 		git diff-files --name-only | (while read n; do git update-index "$n" ; done)
- 
-+		# borrowed from git-am
-+		header_type=git
-+                git mailinfo "$TMP_MSG" "$TMP_PATCH_OUT" \
-+                        <"$p" >"$TMP_INFO";
-+
-+                # skip pine's internal folder data
-+                grep '^Author: Mail System Internal Data$' \
-+                        <"$TMP_INFO" >/dev/null
-+
-+                git stripspace < "$TMP_MSG" > "$TMP_MSG.clean"
-+		mv "$TMP_MSG.clean" "$TMP_MSG"
-+		git stripspace < "$TMP_INFO" > "$TMP_INFO.clean"
-+		mv "$TMP_INFO.clean" "$TMP_INFO"
-+
-+		# If mailinfo couldn't get something , try another way
- 		# grab a commit message out of the patch
--		do_get_header "$p" > "$TMP_MSG"
-+		if [ ! -s "$TMP_MSG" ] || [ ! -s "$TMP_INFO" ]; then
-+		    do_get_header "$p" > "$TMP_MSG"
-+		    header_type=guilt
-+		fi
- 
--		# make a default commit message if patch doesn't contain one
--		[ ! -s "$TMP_MSG" ] && echo "patch $pname" > "$TMP_MSG"
-+		# last try: make a default commit message if patch doesn't contain one
-+		[ ! -s "$TMP_MSG" ] && echo "auto_msg: patch $pname" > "$TMP_MSG"
- 
--		# extract a From line from the patch header, and set
--		# GIT_AUTHOR_{NAME,EMAIL}
--		author_str=`sed -n -e '/^From:/ { s/^From: //; p; q; }; /^(diff |---$|--- )/ q' "$p"`
--		if [ ! -z "$author_str" ]; then
-+
-+		if [ "$header_type" = "guilt" ]; then
-+
-+  		    # extract a From line from the patch header, and set
-+	            # GIT_AUTHOR_{NAME,EMAIL}
-+		    author_str=`sed -n -e '/^From:/ { s/^From: //; p; q }; /^(diff |---)/ q' "$p"`
-+		    if [ ! -z "$author_str" ]; then
- 			GIT_AUTHOR_NAME=`echo $author_str | sed -e 's/ *<.*$//'`
- 			export GIT_AUTHOR_NAME="${GIT_AUTHOR_NAME:-" "}"
-                         export GIT_AUTHOR_EMAIL="`echo $author_str | sed -e 's/[^<]*//'`"
--		fi
-+		    fi
-+
-+
-+		    # check in the patch for a subject
-+		    SUBJECT="$(sed -n '/^Subject/ s/Subject: //p' "$p")"
-+		    if [ -z "$SUBJECT" ]; then
-+			# if we can't find a subject in the patch, then let's construct
-+			# one from the header of the patch itself
-+			SUBJECT=`cat "$TMP_MSG" | head -n 1`
-+			if [ ${#SUBJECT} -gt 60 ]; then
-+			    SUBJECT=${SUBJECT: -60}
-+			fi
-+		    fi
-+
-+		    if [ -z "$SUBJECT" ]; then
-+			# if we are *still* without a subject, then just use
-+			# the patch name
-+			SUBJECT=`echo $1 | sed 's%^patch *%%'`
-+
-+			if [ ${#SUBJECT} -gt 60 ]; then
-+			    SUBJECT=${SUBJECT: -60}
-+			fi
-+		    fi
- 
--		# must strip nano-second part otherwise git gets very
--		# confused, and makes up strange timestamps from the past
--		# (chances are it decides to interpret it as a unix
--		# timestamp).
--		export GIT_AUTHOR_DATE="`stat -c %y "$p" | sed -e '
-+		    SUBJECT=`echo $SUBJECT | sed s'%^ *%%'`
-+
-+		    if [ ! -z "$SUBJECT" ]; then
-+			echo "$SUBJECT" >> $TMP_MSG.subject
-+			echo "" >> $TMP_MSG.subject
-+			cat "$TMP_MSG" >> $TMP_MSG.subject
-+			mv "$TMP_MSG.subject" "$TMP_MSG"
-+		    fi
-+
-+  		    # must strip nano-second part otherwise git gets very
-+		    # confused, and makes up strange timestamps from the past
-+		    # (chances are it decides to interpret it as a unix
-+		    # timestamp).
-+		    export GIT_AUTHOR_DATE="`stat -c %y "$p" | sed -e '\
- s/^\([0-9]\{4\}\)-\([0-9]\{2\}\)-\([0-9]\{2\}\) \([0-9]\{2\}\):\([0-9]\{2\}\):\([0-9]\{2\}\)\.[0-9]* \(.*\)$/\1-\2-\3 \4:\5:\6 \7/'`"
--		export GIT_COMMITTER_DATE="$GIT_AUTHOR_DATE"
-+		    export GIT_COMMITTER_DATE="$GIT_AUTHOR_DATE"
-+		else
-+		    # using git headers, closely related to git-am
-+		    
-+		    GIT_AUTHOR_NAME="$(sed -n '/^Author/ s/Author: //p' "$TMP_INFO")"
-+		    GIT_AUTHOR_EMAIL="$(sed -n '/^Email/ s/Email: //p' "$TMP_INFO")"
-+		    GIT_AUTHOR_DATE="$(sed -n '/^Date/ s/Date: //p' "$TMP_INFO")"
-+		    if test -z "$GIT_AUTHOR_EMAIL"
-+		    then
-+			echo "Warning: patch does not have a valid e-mail address."
-+			GIT_AUTHOR_EMAIL=$GIT_AUTHOR_NAME
-+		    fi
-+
-+		    SUBJECT="$(sed -n '/^Subject/ s/Subject: //p' "$TMP_INFO")"
-+		    if [ ! -z "$SUBJECT" ]; then
-+			echo "$SUBJECT" >> $TMP_MSG.subject
-+			echo "" >> $TMP_MSG.subject
-+			cat "$TMP_MSG" >> $TMP_MSG.subject
-+			mv "$TMP_MSG.subject" "$TMP_MSG"
-+		    fi
-+		    export GIT_AUTHOR_NAME GIT_AUTHOR_EMAIL GIT_AUTHOR_DATE
-+		fi
- 
- 		# commit
- 		treeish=`git write-tree`
- 		commitish=`git commit-tree $treeish -p $2 < "$TMP_MSG"`
-+		if [ ! $? -eq 0 ]; then
-+		    echo "ERROR. Could not commit tree"
-+		    git-reset --hard HEAD^
-+		    exit 1
-+		fi
- 		git update-ref HEAD $commitish
- 
- 		# mark patch as applied
- 		git update-ref "refs/patches/$branch/$pname" HEAD
- 
--		rm -f "$TMP_MSG"
-+		rm -f "$TMP_MSG" "$TMP_LOG" "$TMP_PATCH" "$TMP_INFO" "$TMP_PATCH_OUT"
-+
- 	)
- }
- 
-@@ -568,7 +693,7 @@ push_patch()
- 		bail_action="$2"
- 		reject="--reject"
- 
--		assert_head_check
-+		head_check "`tail -1 < "$applied" | cut -d: -f 1`"
- 		cd_to_toplevel
- 
- 		# apply the patch if and only if there is something to apply
-@@ -671,7 +796,7 @@ refresh_patch()
- #			 incldiffstat
- __refresh_patch()
- {
--	assert_head_check
-+	head_check "`tail -1 < "$applied" | cut -d: -f 1`"
- 
- 	(
- 		TMP_DIFF=`get_tmp_file diff`
-@@ -711,6 +836,10 @@ __refresh_patch()
- 
- 		head -n "-$N" < "$applied" > "$applied.tmp"
- 		mv "$applied.tmp" "$applied"
-+
-+		# update the shadow status.
-+		ref=`cat $GIT_DIR/refs/tags/${branch}_top`
-+		echo "$ref:$1" >> $applied_shadow
- 	)
- }
- 
-@@ -791,7 +920,12 @@ diffstat=`git config --bool guilt.diffst
- # The following gets run every time this file is source'd
- #
- 
--GUILT_DIR="$GIT_DIR/patches"
-+
-+# GUILT_DIR="$GIT_DIR/patches"
-+if [ -z "$GUILT_BASE" ]; then
-+	GUILT_BASE=wrs
-+fi
-+GUILT_DIR="$GUILT_BASE/patches"
- 
- branch=`get_branch`
- 
-@@ -814,6 +948,7 @@ fi
- # very useful files
- series="$GUILT_DIR/$branch/series"
- applied="$GUILT_DIR/$branch/status"
-+applied_shadow="$GUILT_DIR/$branch/shadow_status"
- guards_file="$GUILT_DIR/$branch/guards"
- 
- # determine a pager to use for anything interactive (fall back to more)
diff --git a/meta/recipes-devtools/guilt/files/improve_auto_header_gen.patch b/meta/recipes-devtools/guilt/files/improve_auto_header_gen.patch
deleted file mode 100644
index fa7dd8a..0000000
--- a/meta/recipes-devtools/guilt/files/improve_auto_header_gen.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-guilt: improve the generation of an automatic header
-
-Patches that do not have a proper header are encountered when generating
-a tree. This improves the detection of these patches and generates a sane
-header so the eventual commit will be coherent
-
-Upstream-Status: Inappropriate [oe-specific]
-
-Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
-
----
-
- guilt |   24 ++++++++++++++++++------
- 1 file changed, 18 insertions(+), 6 deletions(-)
-
---- a/guilt
-+++ b/guilt
-@@ -591,7 +591,12 @@ commit()
- 		fi
- 
- 		# last try: make a default commit message if patch doesn't contain one
--		[ ! -s "$TMP_MSG" ] && echo "auto_msg: patch $pname" > "$TMP_MSG"
-+		if [ ! -s "$TMP_MSG" ]; then
-+		    echo "auto_msg: importing `basename $pname`" > "$TMP_MSG"
-+		    echo "" >> "$TMP_MSG"
-+		    echo "This is an automatic import of patch $pname, no headers were" >> "$TMP_MSG"
-+		    echo "detected and a default message was constructed" >>  "$TMP_MSG"
-+		fi
- 
- 
- 		if [ "$header_type" = "guilt" ]; then
-@@ -599,12 +604,14 @@ commit()
-   		    # extract a From line from the patch header, and set
- 	            # GIT_AUTHOR_{NAME,EMAIL}
- 		    author_str=`sed -n -e '/^From:/ { s/^From: //; p; q }; /^(diff |---)/ q' "$p"`
--		    if [ ! -z "$author_str" ]; then
--			GIT_AUTHOR_NAME=`echo $author_str | sed -e 's/ *<.*$//'`
--			export GIT_AUTHOR_NAME="${GIT_AUTHOR_NAME:-" "}"
--                        export GIT_AUTHOR_EMAIL="`echo $author_str | sed -e 's/[^<]*//'`"
-+		    if [ -z "$author_str" ]; then
-+			author_str="auto commit <unknown@unknown>"
- 		    fi
- 
-+		    GIT_AUTHOR_NAME=`echo $author_str | sed -e 's/ *<.*$//'`
-+		    export GIT_AUTHOR_NAME="${GIT_AUTHOR_NAME:-" "}"
-+                    export GIT_AUTHOR_EMAIL="`echo $author_str | sed -e 's/[^<]*//'`"
-+
- 
- 		    # check in the patch for a subject
- 		    SUBJECT="$(sed -n '/^Subject/ s/Subject: //p' "$p")"
-@@ -615,6 +622,11 @@ commit()
- 			if [ ${#SUBJECT} -gt 60 ]; then
- 			    SUBJECT=${SUBJECT: -60}
- 			fi
-+
-+			# remove the line from the tmp msg
-+			mv "$TMP_MSG" "$TMP_MSG.work"
-+			cat "$TMP_MSG.work" | grep -v -E ".*$SUBJECT.*" > "$TMP_MSG"
-+			rm "$TMP_MSG.work"
- 		    fi
- 
- 		    if [ -z "$SUBJECT" ]; then
-@@ -629,7 +641,7 @@ commit()
- 
- 		    SUBJECT=`echo $SUBJECT | sed s'%^ *%%'`
- 
--		    if [ ! -z "$SUBJECT" ]; then
-+		    if [ -n "$SUBJECT" ]; then
- 			echo "$SUBJECT" >> $TMP_MSG.subject
- 			echo "" >> $TMP_MSG.subject
- 			cat "$TMP_MSG" >> $TMP_MSG.subject
diff --git a/meta/recipes-devtools/guilt/files/make_git_commands_conditional.patch b/meta/recipes-devtools/guilt/files/make_git_commands_conditional.patch
deleted file mode 100644
index c912397..0000000
--- a/meta/recipes-devtools/guilt/files/make_git_commands_conditional.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-guilt: allow operation outside of git repos
-
-Sometimes guilt is sourced when there isn't a containing git repository.
-Some of the git commands that are always called will report errors 
-unecesarility in this scenario. This adds a variable that will inhibit
-those problematic calls
-
-Upstream-Status: Inappropriate [oe-specific]
-
-Signed-off-by <bruce.ashfield@windriver.com>
-
----
-
- guilt |    9 ++++++---
- 1 file changed, 6 insertions(+), 3 deletions(-)
-
-
---- a/guilt
-+++ b/guilt
-@@ -23,7 +23,9 @@ esac
- # we change directories ourselves
- SUBDIRECTORY_OK=1
- 
--. "$(git --exec-path)/git-sh-setup"
-+if [ -z "$DO_NOT_USE_GITREPO_COMMANDS" ]; then
-+    . "$(git --exec-path)/git-sh-setup"
-+fi
- 
- #
- # Git version check
-@@ -921,14 +923,15 @@ diffstat=`git config --bool guilt.diffst
- # The following gets run every time this file is source'd
- #
- 
--
- # GUILT_DIR="$GIT_DIR/patches"
- if [ -z "$GUILT_BASE" ]; then
- 	GUILT_BASE=wrs
- fi
- GUILT_DIR="$GUILT_BASE/patches"
- 
--branch=`get_branch`
-+if [ -z "$DO_NOT_USE_GITREPO_COMMANDS" ]; then
-+    branch=`get_branch`
-+fi
- 
- # most of the time we want to verify that the repo's branch has been
- # initialized, but every once in a blue moon (e.g., we want to run guilt-init),
diff --git a/meta/recipes-devtools/guilt/files/optional_head_check.patch b/meta/recipes-devtools/guilt/files/optional_head_check.patch
deleted file mode 100644
index 01e1d02..0000000
--- a/meta/recipes-devtools/guilt/files/optional_head_check.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-guilt: allow guilt-push to opt out of head checking
-
-Depending on the method used to construct a tree, it is entirely
-possible that branches are not only made up of guilt created commits.
-This mixed mode is valid, and in particular is valid when applying
-patches to a tree. 
-
-In the default mode of operation, you will see a warning such as
-this when working on a branch:
-
-Expected HEAD commit dbd5861f81a92b8b329561f94b8575c7ee6768b6
-                 got 3e8e6f6bd9f1772b91fc1fe9949f541d0560b487
-
-This looks severe, but is harmless during tree construction, 
-since even if the HEAD commit was expected, you can still run into
-issues pushing a patch. This is particularly seen when templates are
-adding patches to a kernel.
-
-To make this look less ominous, we make the head check for patch
-pushing opt-in. Which means that by default, you'll no longer see 
-this warning if you work with a mixed mode branch during tree 
-construction.
-
-Other modes such as pop or refresh can run into problems when 
-the HEAD commit isn't tracked or expected, so they should remained 
-checked.
-
-Upstream-Status: Inappropriate [oe-specific]
-
-Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
-
----
- guilt      |    3 +++
- guilt-push |    3 +++
- 2 files changed, 6 insertions(+)
-
---- a/guilt
-+++ b/guilt
-@@ -417,6 +417,9 @@ head_check()
- 			return 0 ;;
- 	esac
- 
-+	# If do_head_check isn't set, bail, we are "opt-in"
-+	[ -z "$do_head_check" ] && return 0
-+
- 	if [ "`git rev-parse refs/heads/$branch`" != "`git rev-parse $1`" ]; then
- 		disp "Expected HEAD commit $1" >&2
- 		disp "                 got `git rev-parse refs/heads/$branch`" >&2
---- a/guilt-push
-+++ b/guilt-push
-@@ -23,6 +23,9 @@ while [ $# -gt 0 ]; do
-                         tag=$2
-                         shift
-                         ;;
-+                --head_check)
-+                        do_head_check=t
-+                        ;;
- 		*)      
- 			break
- 			;;
diff --git a/meta/recipes-devtools/guilt/files/uninstall_force.patch b/meta/recipes-devtools/guilt/files/uninstall_force.patch
deleted file mode 100644
index 8f7cea1..0000000
--- a/meta/recipes-devtools/guilt/files/uninstall_force.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-guilt: force removal when uninstalling
-
-Upstream-Status: Inappropriate [oe-specific]
-
-Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
-
---- a/uninstall.orig
-+++ b/uninstall
-@@ -12,4 +12,4 @@
- 
- shift
- 
--(cd $PRE; rm "$@")
-+(cd $PRE; rm -f "$@")
diff --git a/meta/recipes-devtools/guilt/guilt-native_0.33.bb b/meta/recipes-devtools/guilt/guilt-native_git.bb
similarity index 45%
rename from meta/recipes-devtools/guilt/guilt-native_0.33.bb
rename to meta/recipes-devtools/guilt/guilt-native_git.bb
index d4dd616..9c75c3c 100644
--- a/meta/recipes-devtools/guilt/guilt-native_0.33.bb
+++ b/meta/recipes-devtools/guilt/guilt-native_git.bb
@@ -3,24 +3,15 @@ LICENSE = "GPLv2"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b6f3400dc1a01cebafe8a52b3f344135"
 
-PV = "0.33"
-PR = "r4"
-
 inherit native
 
-SRC_URI = "http://ftp.de.debian.org/debian/pool/main/g/guilt/guilt_${PV}.orig.tar.gz\
-           file://guilt-push.patch \
-	   file://guilt-pop.patch \
-	   file://guilt.patch \
-	   file://guilt-init.patch \
-	   file://guilt-import-commit.patch \
-	   file://uninstall_force.patch \
-	   file://guilt-push-no-series.patch \
-	   file://make_git_commands_conditional.patch \
-	   file://improve_auto_header_gen.patch \
+SRC_URI = "git://repo.or.cz/guilt.git \
 	   file://guilt-bash.patch \
-	   file://guilt-update-supported-git-versions-to-1.8.x.patch \
-	   file://optional_head_check.patch"
+          "
+
+SRCREV="c2a5bae511c6d5354aa4e1cb59069c31df2b8eeb"
+
+S="${WORKDIR}/git"
 
 SRC_URI[md5sum] = "d800c5e0743d90543ef51d797a626e09"
 SRC_URI[sha256sum] = "64dfe6af1e924030f71163f3aa12cd846c80901d6ff8ef267ea35bb0752b4ba9"
-- 
1.7.10.4


