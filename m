Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EFA57731CD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2016 03:32:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u6I3WxO4017340
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jul 2016 20:32:59 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 17 Jul 2016 20:32:59 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 17 Jul 2016 20:32:44 -0700
Message-ID: <fd09dde8e9a412d23bbc7eae0c4cdbc6a029063a.1468811788.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1468811788.git.liezhi.yang@windriver.com>
References: <cover.1468811788.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/9] build-compare: fix checking for named pipe and others
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
X-List-Received-Date: Mon, 18 Jul 2016 03:32:59 -0000
Content-Type: text/plain

* Fixed checking for named pipe
* Return at once when archives are the same
* Fix for type "directory"

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../build-compare/build-compare_git.bb             |  3 ++
 .../pkg-diff.sh-check-for-fifo-named-pipe.patch    | 35 ++++++++++++++++++++
 ...-check_single_file-return-at-once-when-sa.patch | 37 ++++++++++++++++++++++
 ...diff.sh-remove-space-in-the-end-for-ftype.patch | 32 +++++++++++++++++++
 4 files changed, 107 insertions(+)
 create mode 100644 meta/recipes-devtools/build-compare/files/pkg-diff.sh-check-for-fifo-named-pipe.patch
 create mode 100644 meta/recipes-devtools/build-compare/files/pkg-diff.sh-check_single_file-return-at-once-when-sa.patch
 create mode 100644 meta/recipes-devtools/build-compare/files/pkg-diff.sh-remove-space-in-the-end-for-ftype.patch

diff --git a/meta/recipes-devtools/build-compare/build-compare_git.bb b/meta/recipes-devtools/build-compare/build-compare_git.bb
index 9ec8c23..09740d4 100644
--- a/meta/recipes-devtools/build-compare/build-compare_git.bb
+++ b/meta/recipes-devtools/build-compare/build-compare_git.bb
@@ -11,6 +11,9 @@ SRC_URI = "git://github.com/openSUSE/build-compare.git \
            file://0001-Add-support-for-deb-and-ipk-packaging.patch \
            file://functions.sh-remove-space-at-head.patch \
            file://functions.sh-run-rpm-once-to-make-it-faster.patch \
+           file://pkg-diff.sh-check-for-fifo-named-pipe.patch \
+           file://pkg-diff.sh-check_single_file-return-at-once-when-sa.patch \
+           file://pkg-diff.sh-remove-space-in-the-end-for-ftype.patch \
            "
 
 SRCREV = "c5352c054c6ef15735da31b76d6d88620f4aff0a"
diff --git a/meta/recipes-devtools/build-compare/files/pkg-diff.sh-check-for-fifo-named-pipe.patch b/meta/recipes-devtools/build-compare/files/pkg-diff.sh-check-for-fifo-named-pipe.patch
new file mode 100644
index 0000000..e4f0c54
--- /dev/null
+++ b/meta/recipes-devtools/build-compare/files/pkg-diff.sh-check-for-fifo-named-pipe.patch
@@ -0,0 +1,35 @@
+From a78fe4f792a9ac9f4d364e836c8855f48561d6f2 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Thu, 14 Jul 2016 19:52:18 -0700
+Subject: [PATCH 3/4] pkg-diff.sh: check for fifo(named pipe)
+
+Otherwise "cmp -s fifo1 fifo2" will wait for inputing forever.
+
+Upstream-Status: Submitted [https://github.com/openSUSE/build-compare/pull/10]
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ pkg-diff.sh | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/pkg-diff.sh b/pkg-diff.sh
+index 5dd3a38..1f353aa 100644
+--- a/pkg-diff.sh
++++ b/pkg-diff.sh
+@@ -735,6 +735,13 @@ check_single_file()
+          return 1
+        fi
+        ;;
++     fifo*pipe*)
++       ftype_new="`/usr/bin/file new/$file | sed -e 's@^[^:]\+:[[:blank:]]*@@' -e 's@[[:blank:]]*$@@'`"
++       if [ "$ftype_new" = "$ftype"  ]; then
++         return 0
++       fi
++       return 1
++       ;;
+      *)
+        if ! diff_two_files; then
+            return 1
+-- 
+2.9.0
+
diff --git a/meta/recipes-devtools/build-compare/files/pkg-diff.sh-check_single_file-return-at-once-when-sa.patch b/meta/recipes-devtools/build-compare/files/pkg-diff.sh-check_single_file-return-at-once-when-sa.patch
new file mode 100644
index 0000000..b42af25
--- /dev/null
+++ b/meta/recipes-devtools/build-compare/files/pkg-diff.sh-check_single_file-return-at-once-when-sa.patch
@@ -0,0 +1,37 @@
+From 657983ef9ca8f8354172682e17408c4f6b5bc667 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Thu, 14 Jul 2016 19:46:08 -0700
+Subject: [PATCH 1/4] pkg-diff.sh: check_single_file(): return at once when
+ same
+
+If the two files are the same, return at once, this can save a lot of
+time when there are archives inside archives.
+
+Upstream-Status: Submitted [https://github.com/openSUSE/build-compare/pull/10]
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ pkg-diff.sh | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/pkg-diff.sh b/pkg-diff.sh
+index 3cf10aa..402d4a4 100644
+--- a/pkg-diff.sh
++++ b/pkg-diff.sh
+@@ -293,6 +293,13 @@ check_compressed_file()
+ check_single_file()
+ {
+   local file="$1"
++
++  # If the two files are the same, return at once.
++  if [ -f old/$file -a -f new/$file ]; then
++    if cmp -s old/$file new/$file; then
++      return 0
++    fi
++  fi
+   case $file in
+     *.spec)
+        sed -i -e "s,Release:.*$release1,Release: @RELEASE@," old/$file
+-- 
+2.9.0
+
diff --git a/meta/recipes-devtools/build-compare/files/pkg-diff.sh-remove-space-in-the-end-for-ftype.patch b/meta/recipes-devtools/build-compare/files/pkg-diff.sh-remove-space-in-the-end-for-ftype.patch
new file mode 100644
index 0000000..8077172
--- /dev/null
+++ b/meta/recipes-devtools/build-compare/files/pkg-diff.sh-remove-space-in-the-end-for-ftype.patch
@@ -0,0 +1,32 @@
+From 836a6783df9c582a834fca239f227063a5687715 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Thu, 14 Jul 2016 19:49:12 -0700
+Subject: [PATCH 2/4] pkg-diff.sh: remove space in the end for ftype
+
+Versions of file like 5.14 returns a " " in the end, for example:
+ftype="directory ", but we need ftype="directory", remove the space to
+fix the problem.
+
+Upstream-Status: Submitted [https://github.com/openSUSE/build-compare/pull/10]
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ pkg-diff.sh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pkg-diff.sh b/pkg-diff.sh
+index 402d4a4..5dd3a38 100644
+--- a/pkg-diff.sh
++++ b/pkg-diff.sh
+@@ -633,7 +633,7 @@ check_single_file()
+       ;;
+   esac
+ 
+-  ftype=`/usr/bin/file old/$file | sed 's@^[^:]\+:[[:blank:]]*@@'`
++  ftype=`/usr/bin/file old/$file | sed -e 's@^[^:]\+:[[:blank:]]*@@' -e 's@[[:blank:]]*$@@'`
+   case $ftype in
+      PE32\ executable*Mono\/\.Net\ assembly*)
+        echo "PE32 Mono/.Net assembly: $file"
+-- 
+2.9.0
+
-- 
2.9.0


