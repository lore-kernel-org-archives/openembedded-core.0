Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id ADC7360290
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2016 03:33:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u6I3X13Y019060
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jul 2016 20:33:03 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 17 Jul 2016 20:32:59 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 17 Jul 2016 20:32:45 -0700
Message-ID: <398faa2fed98c24766aceb983a2f794acb6f45fb.1468811788.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1468811788.git.liezhi.yang@windriver.com>
References: <cover.1468811788.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/9] build-compare: improve deb and ipk checking
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
X-List-Received-Date: Mon, 18 Jul 2016 03:33:03 -0000
Content-Type: text/plain

* The deb and ipk's depends version string is like:
  Depends: libc6 (>= 2.24)
  Update trim_release_old and trim_release_new to match the bracket in
  the end ")".

* The deb's data tarball now is .tar.xz, and ipk's is .tar.gz.

* Update adjust_controlfile() to make ituse trim_release_old and
  trim_release_new.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../build-compare/build-compare_git.bb             |   1 +
 ...001-Add-support-for-deb-and-ipk-packaging.patch |   4 +-
 ...functions.sh-improve-deb-and-ipk-checking.patch | 117 +++++++++++++++++++++
 3 files changed, 120 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/build-compare/files/functions.sh-improve-deb-and-ipk-checking.patch

diff --git a/meta/recipes-devtools/build-compare/build-compare_git.bb b/meta/recipes-devtools/build-compare/build-compare_git.bb
index 09740d4..fa9c6b4 100644
--- a/meta/recipes-devtools/build-compare/build-compare_git.bb
+++ b/meta/recipes-devtools/build-compare/build-compare_git.bb
@@ -14,6 +14,7 @@ SRC_URI = "git://github.com/openSUSE/build-compare.git \
            file://pkg-diff.sh-check-for-fifo-named-pipe.patch \
            file://pkg-diff.sh-check_single_file-return-at-once-when-sa.patch \
            file://pkg-diff.sh-remove-space-in-the-end-for-ftype.patch \
+           file://functions.sh-improve-deb-and-ipk-checking.patch \
            "
 
 SRCREV = "c5352c054c6ef15735da31b76d6d88620f4aff0a"
diff --git a/meta/recipes-devtools/build-compare/files/0001-Add-support-for-deb-and-ipk-packaging.patch b/meta/recipes-devtools/build-compare/files/0001-Add-support-for-deb-and-ipk-packaging.patch
index 5c15218..82fd816 100644
--- a/meta/recipes-devtools/build-compare/files/0001-Add-support-for-deb-and-ipk-packaging.patch
+++ b/meta/recipes-devtools/build-compare/files/0001-Add-support-for-deb-and-ipk-packaging.patch
@@ -3,7 +3,7 @@ From: Paul Eggleton <paul.eggleton@linux.intel.com>
 Date: Tue, 1 Sep 2015 12:04:33 +0100
 Subject: [PATCH] Add support for deb and ipk packaging
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://github.com/openSUSE/build-compare/pull/10]
 
 Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
 ---
@@ -34,7 +34,7 @@ index 06079df..85c9003 100644
      return $RES
  }
 +
-+function adjust_controlfile () {
++function adjust_controlfile() {
 +    cat $1/control | sed '/^Version: /d' > $1/control.fixed
 +    mv $1/control.fixed $1/control
 +    cat $2/control | sed '/^Version: /d' > $2/control.fixed
diff --git a/meta/recipes-devtools/build-compare/files/functions.sh-improve-deb-and-ipk-checking.patch b/meta/recipes-devtools/build-compare/files/functions.sh-improve-deb-and-ipk-checking.patch
new file mode 100644
index 0000000..05420f8
--- /dev/null
+++ b/meta/recipes-devtools/build-compare/files/functions.sh-improve-deb-and-ipk-checking.patch
@@ -0,0 +1,117 @@
+From b4eb7fde10318162bd2d02b9017ef51746752a91 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Thu, 14 Jul 2016 23:14:21 -0700
+Subject: [PATCH 4/4] functions.sh: improve deb and ipk checking
+
+* The deb and ipk's depends version string is like:
+  Depends: libc6 (>= 2.24)
+  Update trim_release_old and trim_release_new to match the bracket in
+  the end ")".
+
+* The deb's data tarball now is .tar.xz, and ipk's is .tar.gz.
+
+* Update adjust_controlfile() to make ituse trim_release_old and
+  trim_release_new.
+
+Upstream-Status: Submitted [https://github.com/openSUSE/build-compare/pull/10]
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ functions.sh | 45 ++++++++++++++++++++++++++++-----------------
+ 1 file changed, 28 insertions(+), 17 deletions(-)
+
+diff --git a/functions.sh b/functions.sh
+index aa572f9..fe493ba 100755
+--- a/functions.sh
++++ b/functions.sh
+@@ -78,7 +78,7 @@ check_header()
+ function trim_release_old()
+ {
+   sed -e "
+-  /\(\/boot\|\/lib\/modules\|\/lib\/firmware\|\/usr\/src\|$version_release_old_regex_l\$\)/{s,$version_release_old_regex_l,@VERSION@-@RELEASE_LONG@,g;s,$version_release_old_regex_s,@VERSION@-@RELEASE_SHORT@,g}
++  /\(\/boot\|\/lib\/modules\|\/lib\/firmware\|\/usr\/src\|$version_release_old_regex_l\$\|$version_release_old_regex_l)\)/{s,$version_release_old_regex_l,@VERSION@-@RELEASE_LONG@,g;s,$version_release_old_regex_s,@VERSION@-@RELEASE_SHORT@,g}
+   s/\(\/var\/adm\/update-scripts\/\)${name_ver_rel_old_regex_l}\([^[:blank:]]\+\)/\1@NAME_VER_REL@\2/g
+   s/^ *//g
+   "
+@@ -86,7 +86,7 @@ function trim_release_old()
+ function trim_release_new()
+ {
+   sed -e "
+-  /\(\/boot\|\/lib\/modules\|\/lib\/firmware\|\/usr\/src\|$version_release_new_regex_l\$\)/{s,$version_release_new_regex_l,@VERSION@-@RELEASE_LONG@,g;s,$version_release_new_regex_s,@VERSION@-@RELEASE_SHORT@,g}
++  /\(\/boot\|\/lib\/modules\|\/lib\/firmware\|\/usr\/src\|$version_release_new_regex_l\$\|$version_release_new_regex_l)\)/{s,$version_release_new_regex_l,@VERSION@-@RELEASE_LONG@,g;s,$version_release_new_regex_s,@VERSION@-@RELEASE_SHORT@,g}
+   s/\(\/var\/adm\/update-scripts\/\)${name_ver_rel_new_regex_l}\([^[:blank:]]\+\)/\1@NAME_VER_REL@\2/g
+   s/^ *//g
+   "
+@@ -133,8 +133,8 @@ function unpackage()
+             ar x $file
+             tar xf control.tar.gz
+             rm control.tar.gz
+-            tar xf data.tar.gz
+-            rm data.tar.gz
++            tar xf data.tar.[xg]z
++            rm data.tar.[xg]z
+             ;;
+     esac
+     popd 1>/dev/null
+@@ -164,6 +164,22 @@ function get_value()
+     sed -n -e "/^___${1}___/,/^___${1}___/p" $2 | sed -e "/^___${1}___/d"
+ }
+ 
++# Set version_release_old_regex_s, version_release_old_regex_l and
++# name_ver_rel_old_regex_l, also the new ones.
++function set_regex() {
++    # Remember to quote the . which is in release
++    # Short version without B_CN
++    version_release_old_regex_s=${version_release_old%.*}
++    version_release_old_regex_s=${version_release_old_regex_s//./\\.}
++    version_release_new_regex_s=${version_release_new%.*}
++    version_release_new_regex_s=${version_release_new_regex_s//./\\.}
++    # Long version with B_CNT
++    version_release_old_regex_l=${version_release_old//./\\.}
++    version_release_new_regex_l=${version_release_new//./\\.}
++    name_ver_rel_old_regex_l=${name_ver_rel_old//./\\.}
++    name_ver_rel_new_regex_l=${name_ver_rel_new//./\\.}
++}
++
+ # Compare just the rpm meta data of two rpms
+ # Returns:
+ # 0 in case of same content
+@@ -194,17 +210,7 @@ function cmp_spec ()
+     version_release_old="$(get_value QF_VER_REL $spec_old)"
+     name_ver_rel_old="$(get_value QF_NAME_VER_REL $spec_old)"
+ 
+-    # Remember to quote the . which is in release
+-    # Short version without B_CN
+-    version_release_old_regex_s=${version_release_old%.*}
+-    version_release_old_regex_s=${version_release_old_regex_s//./\\.}
+-    version_release_new_regex_s=${version_release_new%.*}
+-    version_release_new_regex_s=${version_release_new_regex_s//./\\.}
+-    # Long version with B_CNT
+-    version_release_old_regex_l=${version_release_old//./\\.}
+-    version_release_new_regex_l=${version_release_new//./\\.}
+-    name_ver_rel_old_regex_l=${name_ver_rel_old//./\\.}
+-    name_ver_rel_new_regex_l=${name_ver_rel_new//./\\.}
++    set_regex
+ 
+     # Check the whole spec file at first, return 0 immediately if the
+     # are the same.
+@@ -285,9 +291,14 @@ function cmp_spec ()
+ }
+ 
+ function adjust_controlfile() {
+-    cat $1/control | sed '/^Version: /d' > $1/control.fixed
++    version_release_old="`sed -ne 's/^Version: \(.*\)/\1/p' $1/control`"
++    name_ver_rel_old="`sed -n -e 's/^Package: \(.*\)/\1/p' $1/control`-`sed -n -e 's/^Version: \(.*\)/\1/p' $1/control`"
++    version_release_new="`sed -ne 's/^Version: \(.*\)/\1/p' $2/control`"
++    name_ver_rel_new="`sed -n -e 's/^Package: \(.*\)/\1/p' $2/control`-`sed -n -e 's/^Version: \(.*\)/\1/p' $2/control`"
++    set_regex
++    cat $1/control | trim_release_old > $1/control.fixed
+     mv $1/control.fixed $1/control
+-    cat $2/control | sed '/^Version: /d' > $2/control.fixed
++    cat $2/control | trim_release_new > $2/control.fixed
+     mv $2/control.fixed $2/control
+ }
+ 
+-- 
+2.9.0
+
-- 
2.9.0


