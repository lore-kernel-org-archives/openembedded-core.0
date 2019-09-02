Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3F3F17F392
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Sep 2019 07:56:27 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x827uSi6008685
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Sep 2019 00:56:28 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.182) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Mon, 2 Sep 2019 00:56:27 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1567411673.git.liezhi.yang@windriver.com>
	<52ff602a462453bd3861612bc8139e391d324036.1567411673.git.liezhi.yang@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <4184531c-2314-97d0-6bb7-1919e92bebcd@windriver.com>
Date: Mon, 2 Sep 2019 15:57:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <52ff602a462453bd3861612bc8139e391d324036.1567411673.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 1/1] build-compare: 2015.02.10 -> 2019.08-14
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
X-List-Received-Date: Mon, 02 Sep 2019 07:56:27 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Sorry, the subject should be:

2015.02.10 -> 2019.08.14 (not 08-14).

I've updated it in the PULL.

// Robert

On 9/2/19 4:11 PM, Robert Yang wrote:
> * Removed the following patches which are already merged by upstream:
>    0001-Add-support-for-deb-and-ipk-packaging.patch
>    Rename-rpm-check.sh-to-pkg-diff.sh.patch
>    functions.sh-improve-deb-and-ipk-checking.patch
>    functions.sh-remove-space-at-head.patch
>    functions.sh-run-rpm-once-to-make-it-faster.patch
>    pkg-diff.sh-check-for-fifo-named-pipe.patch
>    pkg-diff.sh-check_single_file-return-at-once-when-sa.patch
>    pkg-diff.sh-remove-space-in-the-end-for-ftype.patch
> 
> * Rebased Ignore-DWARF-sections.patch
> 
> This version is very outstanding when compare binary packages, e.g.:
> PRSERV_HOST = "localhost:0"
> INHERIT += "packagefeed-stability"
> PACKAGE_CLASSES = "package_ipk
> $ bitbake opkg
> $ find tmp/deploy/ipk >/tmp/ipk_1
> 
> Add a "bbnote 'hello'" to autotools.bbclass' autotools_do_configure.
> 
> * BEFORE the upgrading, the result is:
> $ diff /tmp/ipk_1  /tmp/ipk_2 -Nur | diffstat
>   ipk_2 | 1570 +++++++++++++++++++++++++++++++++---------------------------------
>   1 file changed, 785 insertions(+), 785 deletions(-)
> 
> * AFTER the upgrading, the result is:
> $ bitbake opkg
> $ find tmp/deploy/ipk >/tmp/ipk_2
> $ diff /tmp/ipk_1 /tmp/ipk_2 -Nur
> No output
> 
> And if we really modifed a recipe such as opkg, then it would show that it is
> changed.
> 
> For a full world build AFTER the upgrading:
> $ diff /tmp/ipk_6 /tmp/ipk_7 -Nur | diffstat
>   ipk_7 | 2090 +++++++++++++++++++++++++++++++++---------------------------------
>   1 file changed, 1045 insertions(+), 1045 deletions(-)
> 
> There are 10968 packages in totall, 1045 ones have been changed, so we can still
> improve it in the future.
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>   .../build-compare/build-compare_git.bb             |   12 +-
>   ...001-Add-support-for-deb-and-ipk-packaging.patch |   64 -
>   .../files/Ignore-DWARF-sections.patch              |   17 +-
>   .../files/Rename-rpm-check.sh-to-pkg-diff.sh.patch | 1599 --------------------
>   ...functions.sh-improve-deb-and-ipk-checking.patch |  117 --
>   .../files/functions.sh-remove-space-at-head.patch  |   41 -
>   ...nctions.sh-run-rpm-once-to-make-it-faster.patch |  361 -----
>   .../pkg-diff.sh-check-for-fifo-named-pipe.patch    |   35 -
>   ...-check_single_file-return-at-once-when-sa.patch |   37 -
>   ...diff.sh-remove-space-in-the-end-for-ftype.patch |   32 -
>   10 files changed, 9 insertions(+), 2306 deletions(-)
>   delete mode 100644 meta/recipes-devtools/build-compare/files/0001-Add-support-for-deb-and-ipk-packaging.patch
>   delete mode 100644 meta/recipes-devtools/build-compare/files/Rename-rpm-check.sh-to-pkg-diff.sh.patch
>   delete mode 100644 meta/recipes-devtools/build-compare/files/functions.sh-improve-deb-and-ipk-checking.patch
>   delete mode 100644 meta/recipes-devtools/build-compare/files/functions.sh-remove-space-at-head.patch
>   delete mode 100644 meta/recipes-devtools/build-compare/files/functions.sh-run-rpm-once-to-make-it-faster.patch
>   delete mode 100644 meta/recipes-devtools/build-compare/files/pkg-diff.sh-check-for-fifo-named-pipe.patch
>   delete mode 100644 meta/recipes-devtools/build-compare/files/pkg-diff.sh-check_single_file-return-at-once-when-sa.patch
>   delete mode 100644 meta/recipes-devtools/build-compare/files/pkg-diff.sh-remove-space-in-the-end-for-ftype.patch
> 
> diff --git a/meta/recipes-devtools/build-compare/build-compare_git.bb b/meta/recipes-devtools/build-compare/build-compare_git.bb
> index efcf6b6..b0560cc 100644
> --- a/meta/recipes-devtools/build-compare/build-compare_git.bb
> +++ b/meta/recipes-devtools/build-compare/build-compare_git.bb
> @@ -6,22 +6,14 @@ LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
>   
>   SRC_URI = "git://github.com/openSUSE/build-compare.git \
> -           file://Rename-rpm-check.sh-to-pkg-diff.sh.patch;striplevel=1 \
>              file://Ignore-DWARF-sections.patch;striplevel=1 \
> -           file://0001-Add-support-for-deb-and-ipk-packaging.patch \
> -           file://functions.sh-remove-space-at-head.patch \
> -           file://functions.sh-run-rpm-once-to-make-it-faster.patch \
> -           file://pkg-diff.sh-check-for-fifo-named-pipe.patch \
> -           file://pkg-diff.sh-check_single_file-return-at-once-when-sa.patch \
> -           file://pkg-diff.sh-remove-space-in-the-end-for-ftype.patch \
> -           file://functions.sh-improve-deb-and-ipk-checking.patch \
>              "
>   
>   # Date matches entry in build-compare.changes and date of SRCREV.
>   #
> -SRCREV = "c5352c054c6ef15735da31b76d6d88620f4aff0a"
> +SRCREV = "4dfa207660776cae120afa4353aec7f1f2a998d2"
>   PE = "1"
> -PV = "2015.02.10+git${SRCPV}"
> +PV = "2019.08.14+git${SRCPV}"
>   UPSTREAM_CHECK_COMMITS = "1"
>   
>   S = "${WORKDIR}/git"
> diff --git a/meta/recipes-devtools/build-compare/files/0001-Add-support-for-deb-and-ipk-packaging.patch b/meta/recipes-devtools/build-compare/files/0001-Add-support-for-deb-and-ipk-packaging.patch
> deleted file mode 100644
> index 82fd816..0000000
> --- a/meta/recipes-devtools/build-compare/files/0001-Add-support-for-deb-and-ipk-packaging.patch
> +++ /dev/null
> @@ -1,64 +0,0 @@
> -From 02dbc7e3478e409d6f5e3e1c53daddf8838be999 Mon Sep 17 00:00:00 2001
> -From: Paul Eggleton <paul.eggleton@linux.intel.com>
> -Date: Tue, 1 Sep 2015 12:04:33 +0100
> -Subject: [PATCH] Add support for deb and ipk packaging
> -
> -Upstream-Status: Submitted [https://github.com/openSUSE/build-compare/pull/10]
> -
> -Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ----
> - functions.sh | 15 +++++++++++++++
> - pkg-diff.sh  |  6 ++++++
> - 2 files changed, 21 insertions(+)
> -
> -diff --git a/functions.sh b/functions.sh
> -index 06079df..85c9003 100644
> ---- a/functions.sh
> -+++ b/functions.sh
> -@@ -85,6 +85,13 @@ function unpackage()
> -             CPIO_OPTS="--extract --unconditional --preserve-modification-time --make-directories --quiet"
> -             rpm2cpio $file | cpio ${CPIO_OPTS}
> -             ;;
> -+        *.ipk|*.deb)
> -+            ar x $file
> -+            tar xf control.tar.gz
> -+            rm control.tar.gz
> -+            tar xf data.tar.gz
> -+            rm data.tar.gz
> -+            ;;
> -     esac
> -     popd 1>/dev/null
> - }
> -@@ -255,4 +262,12 @@ function cmp_spec ()
> -     rm $file1 $file2
> -     return $RES
> - }
> -+
> -+function adjust_controlfile() {
> -+    cat $1/control | sed '/^Version: /d' > $1/control.fixed
> -+    mv $1/control.fixed $1/control
> -+    cat $2/control | sed '/^Version: /d' > $2/control.fixed
> -+    mv $2/control.fixed $2/control
> -+}
> -+
> - # vim: tw=666 ts=2 et
> -diff --git a/pkg-diff.sh b/pkg-diff.sh
> -index 0f1fa76..3cf10aa 100644
> ---- a/pkg-diff.sh
> -+++ b/pkg-diff.sh
> -@@ -138,6 +138,12 @@ echo "Extracting packages"
> - unpackage $oldpkg $dir/old
> - unpackage $newpkg $dir/new
> -
> -+case $oldpkg in
> -+  *.deb|*.ipk)
> -+     adjust_controlfile $dir/old $dir/new
> -+  ;;
> -+esac
> -+
> - # files is set in cmp_spec for rpms, so if RES is empty we should assume
> - # it wasn't an rpm and pick all files for comparison.
> - if [ -z $RES ]; then
> ---
> -2.1.0
> -
> diff --git a/meta/recipes-devtools/build-compare/files/Ignore-DWARF-sections.patch b/meta/recipes-devtools/build-compare/files/Ignore-DWARF-sections.patch
> index 7dda1ac..2fb62ae 100644
> --- a/meta/recipes-devtools/build-compare/files/Ignore-DWARF-sections.patch
> +++ b/meta/recipes-devtools/build-compare/files/Ignore-DWARF-sections.patch
> @@ -23,18 +23,15 @@ Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
>    1 file changed, 1 insertion(+), 1 deletion(-)
>   
>   diff --git a/pkg-diff.sh b/pkg-diff.sh
> -index 56035c1..0f1fa76 100755
> +index 9c2125e..b0d77c8 100755
>   --- a/pkg-diff.sh
>   +++ b/pkg-diff.sh
> -@@ -658,7 +658,7 @@ check_single_file()
> +@@ -851,7 +851,7 @@ check_single_file()
>           echo "" >$file1
>           echo "" >$file2
> -        # Don't compare .build-id and .gnu_debuglink sections
> --       sections="$(objdump -s new/$file | grep "Contents of section .*:" | sed -r "s,.* (.*):,\1,g" | grep -v -e "\.build-id" -e "\.gnu_debuglink" | tr "\n" " ")"
> -+       sections="$(objdump -s new/$file | grep "Contents of section .*:" | sed -r "s,.* (.*):,\1,g" | grep -v -e "\.build-id" -e "\.gnu_debuglink" -e "\.debug_abbrev" -e "\.debug_aranges" -e "\.debug_frame" -e "\.debug_info" -e "\.debug_line" -e "\.debug_loc" -e "\.debug_macinfo" -e "\.debug_pubnames" -e "\.debug_pubtypes" -e "\.debug_ranges"  -e "\.debug_str" | tr "\n" " ")"
> +        # Don't compare .build-id, .gnu_debuglink and .gnu_debugdata sections
> +-       sections="$($OBJDUMP -s new/$file | grep "Contents of section .*:" | sed -r "s,.* (.*):,\1,g" | grep -v -e "\.build-id" -e "\.gnu_debuglink" -e "\.gnu_debugdata" | tr "\n" " ")"
> ++       sections="$($OBJDUMP -s new/$file | grep "Contents of section .*:" | sed -r "s,.* (.*):,\1,g" | grep -v -e "\.build-id" -e "\.gnu_debuglink" -e "\.gnu_debugdata" -e "\.debug_abbrev" -e "\.debug_aranges" -e "\.debug_frame" -e "\.debug_info" -e "\.debug_line" -e "\.debug_loc" -e "\.debug_macinfo" -e "\.debug_pubnames" -e "\.debug_pubtypes" -e "\.debug_ranges"  -e "\.debug_str" | tr "\n" " ")"
>           for section in $sections; do
> -           objdump -s -j $section old/$file | sed "s,^old/,," > $file1
> -           objdump -s -j $section new/$file | sed "s,^new/,," > $file2
> ---
> -1.9.3
> -
> +           $OBJDUMP -s -j $section old/$file | sed "s,^old/,," > $file1
> +           $OBJDUMP -s -j $section new/$file | sed "s,^new/,," > $file2
> diff --git a/meta/recipes-devtools/build-compare/files/Rename-rpm-check.sh-to-pkg-diff.sh.patch b/meta/recipes-devtools/build-compare/files/Rename-rpm-check.sh-to-pkg-diff.sh.patch
> deleted file mode 100644
> index cff3a9e..0000000
> --- a/meta/recipes-devtools/build-compare/files/Rename-rpm-check.sh-to-pkg-diff.sh.patch
> +++ /dev/null
> @@ -1,1599 +0,0 @@
> -From 4de3df5a1b361cd09a081f0e0bdb94cbf684ed48 Mon Sep 17 00:00:00 2001
> -From: Robert Yang <liezhi.yang@windriver.com>
> -Date: Thu, 19 Feb 2015 00:34:47 -0800
> -Subject: [PATCH] Rename rpm-check.sh to pkg-diff.sh.
> -
> -The tool now accepts package input other than rpm, so change the name
> -which could be misleading.
> -
> -Upstream-Status: Submitted [https://github.com/openSUSE/build-compare/pulls]
> -
> -Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
> -
> -Updated for rpm-check.sh.
> -
> -Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ----
> - build-compare.spec   |    2 +-
> - pkg-diff.sh          |  765 ++++++++++++++++++++++++++++++++++++++++++++++++++
> - rpm-check.sh         |  764 -------------------------------------------------
> - same-build-result.sh |    4 +-
> - 4 files changed, 768 insertions(+), 767 deletions(-)
> - create mode 100644 pkg-diff.sh
> - delete mode 100755 rpm-check.sh
> -
> -diff --git a/build-compare.spec b/build-compare.spec
> -index 14a97e9..5f47ca1 100644
> ---- a/build-compare.spec
> -+++ b/build-compare.spec
> -@@ -25,7 +25,7 @@ Version:        2015.02.10
> - Release:        0
> - Source1:        COPYING
> - Source2:        same-build-result.sh
> --Source3:        rpm-check.sh
> -+Source3:        pkg-diff.sh
> - Source4:        functions.sh
> - Source5:        srpm-check.sh
> - BuildRoot:      %{_tmppath}/%{name}-%{version}-build
> -diff --git a/pkg-diff.sh b/pkg-diff.sh
> -new file mode 100644
> -index 0000000..56035c1
> ---- /dev/null
> -+++ b/pkg-diff.sh
> -@@ -0,0 +1,765 @@
> -+#! /bin/bash
> -+#
> -+# Copyright (c) 2009, 2010, 2011, 2012 SUSE Linux Product GmbH, Germany.
> -+# Licensed under GPL v2, see COPYING file for details.
> -+#
> -+# Written by Michael Matz and Stephan Coolo
> -+# Enhanced by Andreas Jaeger
> -+
> -+FUNCTIONS=${0%/*}/functions.sh
> -+
> -+check_all=
> -+case $1 in
> -+  -a | --check-all)
> -+    check_all=1
> -+    shift
> -+esac
> -+
> -+if test "$#" != 2; then
> -+   echo "usage: $0 [-a|--check-all] old.rpm new.rpm"
> -+   exit 1
> -+fi
> -+
> -+self_script=$(cd $(dirname $0); echo $(pwd)/$(basename $0))
> -+
> -+source $FUNCTIONS
> -+
> -+oldpkg=`readlink -f $1`
> -+newpkg=`readlink -f $2`
> -+rename_script=`mktemp`
> -+
> -+if test ! -f "$oldpkg"; then
> -+    echo "can't open $1"
> -+    exit 1
> -+fi
> -+
> -+if test ! -f "$newpkg"; then
> -+    echo "can't open $2"
> -+    exit 1
> -+fi
> -+
> -+#usage unjar <file>
> -+function unjar()
> -+{
> -+    local file
> -+    file=$1
> -+
> -+    if [[ $(type -p fastjar) ]]; then
> -+        UNJAR=fastjar
> -+    elif [[ $(type -p jar) ]]; then
> -+        UNJAR=jar
> -+    elif [[ $(type -p unzip) ]]; then
> -+        UNJAR=unzip
> -+    else
> -+        echo "ERROR: jar, fastjar, or unzip is not installed (trying file $file)"
> -+        exit 1
> -+    fi
> -+
> -+    case $UNJAR in
> -+        jar|fastjar)
> -+        # echo jar -xf $file
> -+        ${UNJAR} -xf $file
> -+        ;;
> -+        unzip)
> -+        unzip -oqq $file
> -+        ;;
> -+    esac
> -+}
> -+
> -+# list files in directory
> -+#usage unjar_l <file>
> -+function unjar_l()
> -+{
> -+    local file
> -+    file=$1
> -+
> -+    if [[ $(type -p fastjar) ]]; then
> -+        UNJAR=fastjar
> -+    elif [[ $(type -p jar) ]]; then
> -+        UNJAR=jar
> -+    elif [[ $(type -p unzip) ]]; then
> -+        UNJAR=unzip
> -+    else
> -+        echo "ERROR: jar, fastjar, or unzip is not installed (trying file $file)"
> -+        exit 1
> -+    fi
> -+
> -+    case $UNJAR in
> -+        jar|fastjar)
> -+        ${UNJAR} -tf $file
> -+        ;;
> -+        unzip)
> -+        unzip -l $file
> -+        ;;
> -+    esac
> -+}
> -+
> -+filter_disasm()
> -+{
> -+   sed -e 's/^ *[0-9a-f]\+://' -e 's/\$0x[0-9a-f]\+/$something/' -e 's/callq *[0-9a-f]\+/callq /' -e 's/# *[0-9a-f]\+/#  /' -e 's/\(0x\)\?[0-9a-f]\+(/offset(/' -e 's/[0-9a-f]\+ </</' -e 's/^<\(.*\)>:/\1:/' -e 's/<\(.*\)+0x[0-9a-f]\+>/<\1 + ofs>/'
> -+}
> -+
> -+echo "Comparing `basename $oldpkg` to `basename $newpkg`"
> -+
> -+case $oldpkg in
> -+  *.rpm)
> -+     cmp_spec $rename_script $oldpkg $newpkg
> -+     RES=$?
> -+     case $RES in
> -+       0)
> -+          echo "RPM meta information is identical"
> -+          if test -z "$check_all"; then
> -+             exit 0
> -+          fi
> -+          ;;
> -+       1)
> -+          echo "RPM meta information is different"
> -+          if test -z "$check_all"; then
> -+             exit 1
> -+          fi
> -+          ;;
> -+       2)
> -+          echo "RPM file checksum differs."
> -+          RES=0
> -+          ;;
> -+       *)
> -+          echo "Wrong exit code!"
> -+          exit 1
> -+          ;;
> -+     esac
> -+     ;;
> -+esac
> -+
> -+file1=`mktemp`
> -+file2=`mktemp`
> -+
> -+dir=`mktemp -d`
> -+echo "Extracting packages"
> -+unpackage $oldpkg $dir/old
> -+unpackage $newpkg $dir/new
> -+
> -+# files is set in cmp_spec for rpms, so if RES is empty we should assume
> -+# it wasn't an rpm and pick all files for comparison.
> -+if [ -z $RES ]; then
> -+    oldfiles=`cd $dir/old; find . -type f`
> -+    newfiles=`cd $dir/new; find . -type f`
> -+
> -+    files=`echo -e "$oldfiles\n$newfiles" | sort -u`
> -+fi
> -+
> -+cd $dir
> -+bash $rename_script
> -+
> -+dfile=`mktemp`
> -+
> -+diff_two_files()
> -+{
> -+  if ! cmp -s old/$file new/$file; then
> -+     echo "$file differs ($ftype)"
> -+     hexdump -C old/$file > $file1
> -+     hexdump -C new/$file > $file2
> -+     diff -u $file1 $file2 | head -n 200
> -+     return 1
> -+  fi
> -+  return 0
> -+}
> -+
> -+trim_man_first_line()
> -+{
> -+    # Handles the first line if it is like:
> -+    #.\" Automatically generated by Pod::Man 2.28 (Pod::Simple 3.28)
> -+    #.\" DO NOT MODIFY THIS FILE!  It was generated by help2man 1.43.3.
> -+    local f=$1
> -+    sed -i -e '1{
> -+    s|^\.\\"[[:blank:]]\+Automatically[[:blank:]]generated[[:blank:]]by[[:blank:]]Pod::Man[[:blank:]].*|.\\" Overly verbose Pod::Man|
> -+    s|^\.\\"[[:blank:]]\+DO[[:blank:]]NOT[[:blank:]]MODIFY[[:blank:]]THIS[[:blank:]]FILE![[:blank:]]\+It[[:blank:]]was[[:blank:]]generated[[:blank:]]by[[:blank:]]help2man[[:blank:]].*|.\\" Overly verbose help2man|
> -+    }' $f
> -+}
> -+
> -+trim_man_TH()
> -+{
> -+    # Handles lines like:
> -+    # .TH debhelper 7 "2010-02-27" "7.4.15" "Debhelper"
> -+    # .TH DIRMNGR-CLIENT 1 2010-02-27 "Dirmngr 1.0.3" "GNU Privacy Guard"
> -+    # .TH ccmake 1 "March 06, 2010" "ccmake 2.8.1-rc3"
> -+    # .TH QEMU-IMG 1 "2010-03-14" " " " "
> -+    # .TH kdecmake 1 "May 07, 2010" "cmake 2.8.1"
> -+    # .TH "appender.h" 3 "12 May 2010" "Version 1.2.1" "log4c" \" -*- nroff -*-
> -+    # .TH "appender.h" 3 "Tue Aug 31 2010" "Version 1.2.1" "log4c" \" -*- nroff -*-
> -+    # .TH "OFFLINEIMAP" "1" "11 May 2010" "John Goerzen" "OfflineIMAP Manual"
> -+    # .TH gv 3guile "13 May 2010"
> -+    #.TH "GIT\-ARCHIMPORT" "1" "09/13/2010" "Git 1\&.7\&.1" "Git Manual"
> -+    # .TH LDIRECTORD 8 "2010-10-20" "perl v5.12.2" "User Contributed Perl Documentation"
> -+    # .TH ccmake 1 "February 05, 2012" "ccmake 2.8.7"
> -+    # .TH "appender.h" 3 "Tue Aug 31 2010" "Version 1.2.1" "log4c" \" -*- nroff -*-
> -+    # .TH ARCH "1" "September 2010" "GNU coreutils 8.5" "User Commands"
> -+    # .TH "GCM-CALIBRATE" "1" "03 February 2012" "" ""
> -+    #.TH Locale::Po4a::Xml.pm 3pm "2015-01-30" "Po4a Tools" "Po4a Tools"
> -+    local f=$1
> -+    # (.TH   quoted section) (quoted_date)(*)
> -+    sed -i -e 's|^\([[:blank:]]*\.TH[[:blank:]]\+"[^"]\+"[[:blank:]]\+[^[:blank:]]\+\)[[:blank:]]\+\("[^"]\+"\)\([[:blank:]]\+.*\)\?|\1 "qq2000-01-01"\3|' $f
> -+    # (.TH unquoted section) (quoted_date)(*)
> -+    sed -i -e 's|^\([[:blank:]]*\.TH[[:blank:]]\+[^"][^[:blank:]]\+[[:blank:]]\+[^[:blank:]]\+\)[[:blank:]]\+\("[^"]\+"\)\([[:blank:]]\+.*\)\?|\1 "uq2000-02-02"\3|' $f
> -+    # (.TH   quoted section) (unquoted_date)(*)
> -+    sed -i -e 's|^\([[:blank:]]*\.TH[[:blank:]]\+"[^"]\+"[[:blank:]]\+[^[:blank:]]\+\)[[:blank:]]\+\([^"][^[:blank:]]\+\)\([[:blank:]]\+.*\)\?|\1 qu2000-03-03\3|' $f
> -+    # (.TH unquoted section) (unquoted_date)(*)
> -+    sed -i -e 's|^\([[:blank:]]*\.TH[[:blank:]]\+[^"][^[:blank:]]\+[[:blank:]]\+[^[:blank:]]\+\)[[:blank:]]\+\([^"][^[:blank:]]\+\)\([[:blank:]]\+.*\)\?|\1 uu2000-04-04\3|' $f
> -+}
> -+
> -+strip_numbered_anchors()
> -+{
> -+  # Remove numbered anchors on Docbook / HTML files.
> -+  # This should be save since we remove them from old and new files.
> -+  # A trailing </a> or </div> tag will stay also on both files.
> -+  for f in old/$file new/$file; do
> -+     sed -i -e 's%<[ ]*a[ ]\+name[^<]*[0-9]\+[^<]*%%g' \
> -+     -e 's%<[ ]*a[ ]\+href[^<]*#[^<]*[0-9]\+[^<]*%%g' \
> -+     -e 's%<[^<]*id="ftn\.[^<]*[0-9]\+[^<]*%%g' $f
> -+  done
> -+}
> -+
> -+
> -+check_compressed_file()
> -+{
> -+  local file=$1
> -+  local ext=$2
> -+  local tmpdir=`mktemp -d`
> -+  local ftype
> -+  local ret=0
> -+  echo "$ext file with odd filename: $file"
> -+  if test -n "$tmpdir"; then
> -+    mkdir $tmpdir/{old,new}
> -+    cp --parents --dereference old/$file $tmpdir/
> -+    cp --parents --dereference new/$file $tmpdir/
> -+    if pushd $tmpdir > /dev/null ; then
> -+      case "$ext" in
> -+        bz2)
> -+          mv old/$file{,.bz2}
> -+          mv new/$file{,.bz2}
> -+          bzip2 -d old/$file.bz2
> -+          bzip2 -d new/$file.bz2
> -+          ;;
> -+        gzip)
> -+          mv old/$file{,.gz}
> -+          mv new/$file{,.gz}
> -+          gzip -d old/$file.gz
> -+          gzip -d new/$file.gz
> -+          ;;
> -+        xz)
> -+          mv old/$file{,.xz}
> -+          mv new/$file{,.xz}
> -+          xz -d old/$file.xz
> -+          xz -d new/$file.xz
> -+          ;;
> -+      esac
> -+      ftype=`/usr/bin/file old/$file | sed 's@^[^:]\+:[[:blank:]]*@@'`
> -+      case $ftype in
> -+        POSIX\ tar\ archive)
> -+          echo "$ext content is: $ftype"
> -+          mv old/$file{,.tar}
> -+          mv new/$file{,.tar}
> -+          if ! check_single_file ${file}.tar; then
> -+            ret=1
> -+          fi
> -+          ;;
> -+        ASCII\ cpio\ archive\ *)
> -+          echo "$ext content is: $ftype"
> -+          mv old/$file{,.cpio}
> -+          mv new/$file{,.cpio}
> -+          if ! check_single_file ${file}.cpio; then
> -+            ret=1
> -+          fi
> -+          ;;
> -+        *)
> -+          echo "unhandled $ext content: $ftype"
> -+          if ! diff_two_files; then
> -+            ret=1
> -+          fi
> -+          ;;
> -+      esac
> -+      popd > /dev/null
> -+    fi
> -+    rm -rf "$tmpdir"
> -+  fi
> -+  return $ret
> -+}
> -+
> -+check_single_file()
> -+{
> -+  local file="$1"
> -+  case $file in
> -+    *.spec)
> -+       sed -i -e "s,Release:.*$release1,Release: @RELEASE@," old/$file
> -+       sed -i -e "s,Release:.*$release2,Release: @RELEASE@," new/$file
> -+       ;;
> -+    *.exe.mdb|*.dll.mdb)
> -+       # Just debug information, we can skip them
> -+       echo "$file skipped as debug file."
> -+       return 0
> -+       ;;
> -+    *.a)
> -+       flist=`ar t new/$file`
> -+       pwd=$PWD
> -+       fdir=`dirname $file`
> -+       cd old/$fdir
> -+       ar x `basename $file`
> -+       cd $pwd/new/$fdir
> -+       ar x `basename $file`
> -+       cd $pwd
> -+       for f in $flist; do
> -+          if ! check_single_file $fdir/$f; then
> -+             return 1
> -+          fi
> -+       done
> -+       return 0
> -+       ;;
> -+    *.cpio)
> -+       flist=`cpio --quiet --list --force-local < "new/$file"`
> -+       pwd=$PWD
> -+       fdir=$file.extract.$PPID.$$
> -+       mkdir old/$fdir new/$fdir
> -+       cd old/$fdir
> -+       cpio --quiet --extract --force-local < "../${file##*/}"
> -+       cd $pwd/new/$fdir
> -+       cpio --quiet --extract --force-local < "../${file##*/}"
> -+       cd $pwd
> -+       local ret=0
> -+       for f in $flist; do
> -+         if ! check_single_file $fdir/$f; then
> -+           ret=1
> -+           if test -z "$check_all"; then
> -+             break
> -+           fi
> -+         fi
> -+       done
> -+       rm -rf old/$fdir new/$fdir
> -+       return $ret
> -+       ;;
> -+    *.tar|*.tar.bz2|*.tar.gz|*.tgz|*.tbz2)
> -+       flist=`tar tf new/$file`
> -+       pwd=$PWD
> -+       fdir=`dirname $file`
> -+       cd old/$fdir
> -+       tar xf `basename $file`
> -+       cd $pwd/new/$fdir
> -+       tar xf `basename $file`
> -+       cd $pwd
> -+       local ret=0
> -+       for f in $flist; do
> -+         if ! check_single_file $fdir/$f; then
> -+           ret=1
> -+           if test -z "$check_all"; then
> -+             break
> -+           fi
> -+         fi
> -+       done
> -+       return $ret
> -+       ;;
> -+    *.zip|*.jar|*.war)
> -+       cd old
> -+       unjar_l ./$file |sort > flist
> -+       #  10-05-2010 14:39
> -+       sed -i -e "s, [0-9][0-9]-[0-9][0-9]-[0-9]\+ [0-9][0-9]:[0-9][0-9] , date ," flist
> -+       # 2012-02-03 07:59
> -+       sed -i -e "s, 20[0-9][0-9]-[0-9][0-9]-[0-9][0-9] [0-9][0-9]:[0-9][0-9] , date ," flist
> -+       cd ../new
> -+       unjar_l ./$file |sort> flist
> -+       sed -i -e "s, [0-9][0-9]-[0-9][0-9]-[0-9]\+ [0-9][0-9]:[0-9][0-9] , date ,; " flist
> -+       sed -i -e "s, 20[0-9][0-9]-[0-9][0-9]-[0-9][0-9] [0-9][0-9]:[0-9][0-9] , date ," flist
> -+       cd ..
> -+       if ! cmp -s old/flist new/flist; then
> -+          echo "$file has different file list"
> -+          diff -u old/flist new/flist
> -+          return 1
> -+       fi
> -+       flist=`grep date new/flist | sed -e 's,.* date ,,'`
> -+       pwd=$PWD
> -+       fdir=`dirname $file`
> -+       cd old/$fdir
> -+       unjar `basename $file`
> -+       cd $pwd/new/$fdir
> -+       unjar `basename $file`
> -+       cd $pwd
> -+       local ret=0
> -+       for f in $flist; do
> -+         if test -f new/$fdir/$f && ! check_single_file $fdir/$f; then
> -+           ret=1
> -+           if test -z "$check_all"; then
> -+             break
> -+           fi
> -+         fi
> -+       done
> -+       return $ret;;
> -+     *.pyc|*.pyo)
> -+        perl -e "open fh, '+<', 'old/$file'; seek fh, 4, SEEK_SET; print fh '0000';"
> -+        perl -e "open fh, '+<', 'new/$file'; seek fh, 4, SEEK_SET; print fh '0000';"
> -+        ;;
> -+     *.bz2)
> -+        bunzip2 -c old/$file > old/${file/.bz2/}
> -+        bunzip2 -c new/$file > new/${file/.bz2/}
> -+        check_single_file ${file/.bz2/}
> -+        return $?
> -+        ;;
> -+     *.gz)
> -+        gunzip -c old/$file > old/${file/.gz/}
> -+        gunzip -c new/$file > new/${file/.gz/}
> -+        check_single_file ${file/.gz/}
> -+        return $?
> -+        ;;
> -+     *.rpm)
> -+	$self_script -a old/$file new/$file
> -+        return $?
> -+        ;;
> -+     *png)
> -+	# Try to remove timestamps, only if convert from ImageMagick is installed
> -+        if [[ $(type -p convert) ]]; then
> -+	  convert old/$file +set date:create +set date:modify old/${file/.png/_n.png}
> -+	  convert old/$file +set date:create +set date:modify new/${file/.png/_n.png}
> -+	  if ! cmp -s old/${file/.png/_n.png} new/${file/.png/_n.png}; then
> -+	      echo "$file differs ($ftype)"
> -+	      hexdump -C old/${file/.png/_n.png} > $file1
> -+	      hexdump -C new/${file/.png/_n.png} > $file2
> -+	      diff -u $file1 $file2 | head -n 20
> -+	      return 1
> -+	  fi
> -+	  return 0
> -+	fi
> -+        ;;
> -+     /usr/share/locale/*/LC_MESSAGES/*.mo|/usr/share/locale-bundle/*/LC_MESSAGES/*.mo)
> -+       for f in old/$file new/$file; do
> -+         sed -i -e "s,POT-Creation-Date: ....-..-.. ..:..+....,POT-Creation-Date: 1970-01-01 00:00+0000," $f
> -+       done
> -+       ;;
> -+     /usr/share/doc/packages/*/*.html|\
> -+     /usr/share/doc/kde/HTML/*/*/*.html|/usr/share/doc/*/html/*.html)
> -+       for f in old/$file new/$file; do
> -+         # texi2html output, e.g. in kvm, indent, qemu
> -+	 sed -i -e "s|^<!-- Created on .*, 20.. by texi2html .\...|<!-- Created on August 7, 2009 by texi2html 1.82|" $f
> -+	 sed -i -e 's|^ *This document was generated by <em>Autobuild</em> on <em>.*, 20..</em> using <a href="http://www.nongnu.org/texi2html/"><em>texi2html .\...</em></a>.$|  This document was generated by <em>Autobuild</em> on <em>August 7, 2009</em> using <a href="http://www.nongnu.org/texi2html/"><em>texi2html 1.82</em></a>.|' $f
> -+	 # doxygen docu, e.g. in libssh and log4c
> -+	 sed -i -e 's|Generated on ... ... [0-9]* [0-9]*:[0-9][0-9]:[0-9][0-9] 20[0-9][0-9] for |Generated on Mon May 10 20:45:00 2010 for |' $f
> -+	 # Generated on Sat Aug 14 2010 16:49:48 for libssh
> -+	 sed -i -e 's|Generated on ... ... [0-9]* 20[0-9][0-9] [0-9]*:[0-9][0-9]:[0-9][0-9] for |Generated on Mon May 10 20:45:00 2010 for |' $f
> -+       done
> -+       strip_numbered_anchors
> -+       ;;
> -+     /usr/share/javadoc/*.html |\
> -+     /usr/share/javadoc/*/*.html|/usr/share/javadoc/*/*/*.html)
> -+       strip_numbered_anchors
> -+       # There are more timestamps in html, so far we handle only some primitive versions.
> -+       for f in old/$file new/$file; do
> -+         # Javadoc:
> -+          # <head>
> -+          # <!-- Generated by javadoc (version 1.7.0_75) on Tue Feb 03 02:20:12 GMT 2015 -->
> -+          # <!-- Generated by javadoc on Tue Feb 03 00:02:48 GMT 2015 -->
> -+          # <meta name="date" content="2015-02-03">
> -+          # </head>
> -+          sed -i -e '
> -+            /^<head>/{
> -+              : next
> -+              n
> -+              /^<\/head>/{
> -+                b end_head
> -+              }
> -+              s/^\(<!-- Generated by javadoc\) \((\(build\|version\) [0-9._]\+) on ... ... .. ..:..:.. \(GMT\|UTC\) ....\) \(-->\)/\1 some-date-removed-by-build-compare \5/
> -+              t next
> -+              s/^\(<!-- Generated by javadoc\) \(on ... ... .. ..:..:.. \(GMT\|UTC\) ....\) \(-->\)/\1 some-date-removed-by-build-compare \3/
> -+              t next
> -+              s/^<meta name="date" content="[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}">/<meta name="date" content="some-date-removed-by-build-compare">/
> -+              b next
> -+            }
> -+            : end_head
> -+          ' $f
> -+         # Gjdoc HtmlDoclet:
> -+	 sed -i -e 's%Generated by Gjdoc HtmlDoclet [0-9,.]*, part of <a href="http://www.gnu.org/software/classpath/cp-tools/" title="" target="_top">GNU Classpath Tools</a>, on .*, 20.. [0-9]*:..:.. \(a\|p\)\.m\. GMT.%Generated by Gjdoc.%' $f
> -+	 sed -i -e 's%<!DOCTYPE html PUBLIC "-//gnu.org///DTD XHTML 1.1 plus Target 1.0//EN"\(.*\)GNU Classpath Tools</a>, on [A-Z][a-z]* [0-9]*, 20?? [0-9]*:??:?? \(a|p\)\.m\. GMT.</p>%<!DOCTYPE html PUBLIC "-//gnu.org///DTD XHTML 1.1 plus Target 1.0//EN"\1GNU Classpath Tools</a>, on January 1, 2009 0:00:00 a.m. GMT.</p>%' $f
> -+	 sed -i -e 's%<!DOCTYPE html PUBLIC "-//gnu.org///DTD\(.*GNU Classpath Tools</a>\), on [a-zA-Z]* [0-9][0-9], 20.. [0-9]*:..:.. \(a\|p\)\.m\. GMT.</p>%<!DOCTYPE html PUBLIC "-//gnu.org///DTD\1,on May 1, 2010 1:11:42 p.m. GMT.</p>%' $f
> -+	 # deprecated-list is randomly ordered, sort it for comparison
> -+	 case $f in
> -+	   */deprecated-list.html)
> -+	     sort -o $f $f
> -+	     ;;
> -+	 esac
> -+       done
> -+       ;;
> -+     /usr/share/javadoc/gjdoc.properties |\
> -+     /usr/share/javadoc/*/gjdoc.properties)
> -+       for f in old/$file new/$file; do
> -+	 sed -i -e 's|^#[A-Z][a-z]\{2\} [A-Z][a-z]\{2\} [0-9]\{2\} ..:..:.. GMT 20..$|#Fri Jan 01 11:27:36 GMT 2009|' $f
> -+       done
> -+       ;;
> -+     */fonts.scale|*/fonts.dir|*/encodings.dir)
> -+       for f in old/$file new/$file; do
> -+         # sort files before comparing
> -+         sort -o $f $f
> -+       done
> -+       ;;
> -+     /var/adm/perl-modules/*)
> -+       for f in old/$file new/$file; do
> -+         sed -i -e 's|^=head2 ... ... .. ..:..:.. ....: C<Module>|=head2 Wed Jul  1 00:00:00 2009: C<Module>|' $f
> -+       done
> -+       ;;
> -+     /usr/share/man/man3/*3pm)
> -+       for f in old/$file new/$file; do
> -+         sed -i -e 's| 3 "20..-..-.." "perl v5....." "User Contributed Perl Documentation"$| 3 "2009-01-01" "perl v5.10.0" "User Contributed Perl Documentation"|' $f
> -+         trim_man_TH $f
> -+         trim_man_first_line $f
> -+       done
> -+       ;;
> -+     /usr/share/man/*/man*|/usr/share/man/man*|/usr/lib/texmf/doc/man/*/*)
> -+
> -+       for f in old/$file new/$file; do
> -+         trim_man_TH $f
> -+         trim_man_first_line $f
> -+         # generated by docbook xml:
> -+         #.\"      Date: 09/13/2010
> -+         sed -i -e 's|Date: [0-1][0-9]/[0-9][0-9]/201[0-9]|Date: 09/13/2010|' $f
> -+       done
> -+       ;;
> -+     *.elc)
> -+       # emacs lisp files
> -+       for f in old/$file new/$file; do
> -+         sed -i -e 's|Compiled by abuild@.* on ... ... .. ..:..:.. 20..$|compiled by abuild@buildhost on Wed Jul 01 00:00:00 2009|' $f
> -+       done
> -+       ;;
> -+     /var/lib/texmf/web2c/*/*fmt |\
> -+     /var/lib/texmf/web2c/metafont/*.base|\
> -+     /var/lib/texmf/web2c/metapost/*.mem)
> -+       # binary dump of TeX and Metafont formats, we can ignore them for good
> -+       echo "difference in $file ignored."
> -+       return 0
> -+       ;;
> -+     */libtool)
> -+       for f in old/$file new/$file; do
> -+	  sed -i -e 's|^# Libtool was configured on host [A-Za-z0-9]*:$|# Libtool was configured on host x42:|' $f
> -+       done
> -+       ;;
> -+     /etc/mail/*cf|/etc/sendmail.cf)
> -+       # from sendmail package
> -+       for f in old/$file new/$file; do
> -+	  # - ##### built by abuild@build33 on Thu May 6 11:21:17 UTC 2010
> -+	  sed -i -e 's|built by abuild@[a-z0-9]* on ... ... [0-9]* [0-9]*:[0-9][0-9]:[0-9][0-9] .* 20[0-9][0-9]|built by abuild@build42 on Thu May 6 11:21:17 UTC 2010|' $f
> -+       done
> -+       ;;
> -+     /usr/share/doc/kde/HTML/*/*/index.cache|/usr/share/doc/kde/HTML/*/*/*/index.cache|\
> -+     /usr/share/gtk-doc/html/*/*.html|/usr/share/gtk-doc/html/*/*.devhelp2)
> -+       # various kde and gtk packages
> -+       strip_numbered_anchors
> -+       ;;
> -+    */created.rid)
> -+       # ruby documentation
> -+       # file just contains a timestamp and nothing else, so ignore it
> -+       echo "Ignore $file"
> -+       return 0
> -+       ;;
> -+    */rdoc/files/*.html)
> -+       # ruby documentation
> -+       # <td>Mon Sep 20 19:02:43 +0000 2010</td>
> -+       for f in old/$file new/$file; do
> -+          sed -i -e 's%<td>[A-Z][a-z][a-z] [A-Z][a-z][a-z] [0-9]\+ [0-9]\+:[0-9]\+:[0-9]\+ +0000 201[0-9]</td>%<td>Mon Sep 20 19:02:43 +0000 2010</td>%g' $f
> -+       done
> -+       strip_numbered_anchors
> -+       ;;
> -+    */Linux*Env.Set.sh)
> -+       # LibreOffice files, contains:
> -+       # Generated on: Mon Apr 18 13:19:22 UTC 2011
> -+       for f in old/$file new/$file; do
> -+	 sed -i -e 's%^# Generated on:.*UTC 201[0-9] *$%# Generated on: Sometime%g' $f
> -+       done
> -+       ;;
> -+    /usr/lib/libreoffice/solver/inc/*/deliver.log)
> -+       # LibreOffice log file
> -+      echo "Ignore $file"
> -+      return 0
> -+      ;;
> -+    /var/adm/update-messages/*|/var/adm/update-scripts/*)
> -+      # encode version-release inside
> -+      oldfn=`echo "$file"|sed -e s/-$release2/-$release1/;`
> -+
> -+      # fetchmsttfonts embeds the release number in the update shell script.
> -+      echo sed -i -e "s/-$release1/-$release2/g;" "old/$oldfn"
> -+      sed -i -e "s/-$release1/-$release2/g;" "old/$oldfn"
> -+
> -+      if ! diff -u old/$oldfn new/$file; then
> -+           echo "$oldfn is not same as $file"
> -+           return 1
> -+      fi
> -+      echo "$file and $oldfn are same"
> -+      return 0
> -+      ;;
> -+    *.ps)
> -+      for f in "old/$file" "new/$file"; do
> -+        sed -i -e '
> -+          /^%%CreationDate:[[:blank:]]/d
> -+          /^%%Creator:[[:blank:]]groff[[:blank:]]version[[:blank:]]/d
> -+          /^%DVIPSSource:[[:blank:]]/d
> -+        ' "$f"
> -+      done
> -+    ;;
> -+    *pdf)
> -+      # PDF files contain a unique ID, remove it
> -+      # Format of the ID is:
> -+      # /ID [<9ACE247A70CF9BEAFEE15E116259BD6D> <9ACE247A70CF9BEAFEE15E116259BD6D>]
> -+      # with optional spaces. pdftex creates also:
> -+      # /CreationDate (D:20120103083206Z)
> -+      # /ModDate (D:20120103083206Z)
> -+      # and possibly XML metadata as well
> -+      for f in "old/$file" "new/$file"; do
> -+        sed -i \
> -+            '/obj/,/endobj/{
> -+               s%/ID \?\[ \?<[^>]\+> \?<[^>]\+> \?\]%/IDrandom%g;
> -+               s%/CreationDate \?(D:[^)]*)%/CreationDate (D: XXX)%g;
> -+               s%/ModDate \?(D:[^)]*)%/ModDate (D: XXX)%g;
> -+               s%<pdf:CreationDate>[^<]*</pdf:CreationDate>%<pdf:CreationDate>XXX</pdf:CreationDate>%g;
> -+               s%<pdf:ModDate>[^<]*</pdf:ModDate>%<pdf:ModDate>XXX</pdf:ModDate>%g;
> -+               s%<xap:CreateDate>[^<]*</xap:CreateDate>%<xap:CreateDate>XXX</xap:CreateDate>%g;
> -+               s%<xap:ModifyDate>[^<]*</xap:ModifyDate>%<xap:ModifyDate>XXX</xap:ModifyDate>%g;
> -+               s%<xap:MetadataDate>[^<]*</xap:MetadataDate>%<xap:MetadataDate>XXX</xap:MetadataDate>%g;
> -+            }' "$f"
> -+      done
> -+      ;;
> -+  esac
> -+
> -+  ftype=`/usr/bin/file old/$file | sed 's@^[^:]\+:[[:blank:]]*@@'`
> -+  case $ftype in
> -+     PE32\ executable*Mono\/\.Net\ assembly*)
> -+       echo "PE32 Mono/.Net assembly: $file"
> -+       if [ -x /usr/bin/monodis ] ; then
> -+         monodis old/$file 2>/dev/null|sed -e 's/GUID = {.*}/GUID = { 42 }/;'> ${file1}
> -+         monodis new/$file 2>/dev/null|sed -e 's/GUID = {.*}/GUID = { 42 }/;'> ${file2}
> -+         if ! cmp -s ${file1} ${file2}; then
> -+           echo "$file differs ($ftype)"
> -+           diff -u ${file1} ${file2}
> -+           return 1
> -+         fi
> -+       else
> -+         echo "Cannot compare, no monodis installed"
> -+         return 1
> -+       fi
> -+       ;;
> -+    ELF*executable*|ELF*[LM]SB\ shared\ object*)
> -+       objdump -d --no-show-raw-insn old/$file | filter_disasm > $file1
> -+       if ! test -s $file1; then
> -+         # objdump has no idea how to handle it
> -+         if ! diff_two_files; then
> -+           ret=1
> -+           break
> -+         fi
> -+       fi
> -+       elfdiff=
> -+       sed -i -e "s,old/,," $file1
> -+       objdump -d --no-show-raw-insn new/$file | filter_disasm > $file2
> -+       sed -i -e "s,new/,," $file2
> -+       if ! diff -u $file1 $file2 > $dfile; then
> -+          echo "$file differs in assembler output"
> -+          head -n 200 $dfile
> -+          elfdiff="1"
> -+       fi
> -+       echo "" >$file1
> -+       echo "" >$file2
> -+       # Don't compare .build-id and .gnu_debuglink sections
> -+       sections="$(objdump -s new/$file | grep "Contents of section .*:" | sed -r "s,.* (.*):,\1,g" | grep -v -e "\.build-id" -e "\.gnu_debuglink" | tr "\n" " ")"
> -+       for section in $sections; do
> -+          objdump -s -j $section old/$file | sed "s,^old/,," > $file1
> -+          objdump -s -j $section new/$file | sed "s,^new/,," > $file2
> -+          if ! diff -u $file1 $file2 > $dfile; then
> -+             echo "$file differs in ELF section $section"
> -+             head -n 200 $dfile
> -+             elfdiff="1"
> -+          fi
> -+       done
> -+       if test -z "$elfdiff"; then
> -+          echo "$file: only difference was in build-id or gnu_debuglink, GOOD."
> -+          return 0
> -+       fi
> -+       return 1
> -+       ;;
> -+     *ASCII*|*text*)
> -+       if ! cmp -s old/$file new/$file; then
> -+         echo "$file differs ($ftype)"
> -+         diff -u old/$file new/$file | head -n 200
> -+         return 1
> -+       fi
> -+       ;;
> -+     directory|setuid,\ directory|sticky,\ directory)
> -+       # tar might package directories - ignore them here
> -+       return 0
> -+       ;;
> -+     bzip2\ compressed\ data*)
> -+       if ! check_compressed_file "$file" "bz2"; then
> -+           return 1
> -+       fi
> -+       ;;
> -+     gzip\ compressed\ data*)
> -+       if ! check_compressed_file "$file" "gzip"; then
> -+           return 1
> -+       fi
> -+       ;;
> -+     XZ\ compressed\ data*)
> -+       if ! check_compressed_file "$file" "xz"; then
> -+           return 1
> -+       fi
> -+       ;;
> -+     POSIX\ tar\ archive)
> -+          mv old/$file{,.tar}
> -+          mv new/$file{,.tar}
> -+          if ! check_single_file ${file}.tar; then
> -+            return 1
> -+          fi
> -+       ;;
> -+     cpio\ archive)
> -+          mv old/$file{,.cpio}
> -+          mv new/$file{,.cpio}
> -+          if ! check_single_file ${file}.cpio; then
> -+            return 1
> -+          fi
> -+     ;;
> -+     symbolic\ link\ to\ *)
> -+       readlink "old/$file" > $file1
> -+       readlink "new/$file" > $file2
> -+       if ! diff -u $file1 $file2; then
> -+         echo "symlink target for $file differs"
> -+         return 1
> -+       fi
> -+       ;;
> -+     *)
> -+       if ! diff_two_files; then
> -+           return 1
> -+       fi
> -+       ;;
> -+  esac
> -+  return 0
> -+}
> -+
> -+# We need /proc mounted for some tests, so check that it's mounted and
> -+# complain if not.
> -+PROC_MOUNTED=0
> -+if [ ! -d /proc/self/ ]; then
> -+  echo "/proc is not mounted"
> -+  mount -orw -n -tproc none /proc
> -+  PROC_MOUNTED=1
> -+fi
> -+
> -+# preserve cmp_spec result for check_all runs
> -+ret=$RES
> -+for file in $files; do
> -+   if ! check_single_file $file; then
> -+       ret=1
> -+       if test -z "$check_all"; then
> -+           break
> -+       fi
> -+   fi
> -+done
> -+
> -+if [ "$PROC_MOUNTED" -eq "1" ]; then
> -+  echo "Unmounting proc"
> -+  umount /proc
> -+fi
> -+
> -+rm $file1 $file2 $dfile $rename_script
> -+rm -rf $dir
> -+if test "$ret" = 0; then
> -+     echo "Package content is identical"
> -+fi
> -+exit $ret
> -+# vim: tw=666 ts=2 et
> -diff --git a/rpm-check.sh b/rpm-check.sh
> -deleted file mode 100755
> -index dd47642..0000000
> ---- a/rpm-check.sh
> -+++ /dev/null
> -@@ -1,764 +0,0 @@
> --#! /bin/bash
> --#
> --# Copyright (c) 2009, 2010, 2011, 2012 SUSE Linux Product GmbH, Germany.
> --# Licensed under GPL v2, see COPYING file for details.
> --#
> --# Written by Michael Matz and Stephan Coolo
> --# Enhanced by Andreas Jaeger
> --
> --FUNCTIONS=${0%/*}/functions.sh
> --
> --check_all=
> --case $1 in
> --  -a | --check-all)
> --    check_all=1
> --    shift
> --esac
> --
> --if test "$#" != 2; then
> --   echo "usage: $0 [-a|--check-all] old.rpm new.rpm"
> --   exit 1
> --fi
> --
> --self_script=$(cd $(dirname $0); echo $(pwd)/$(basename $0))
> --
> --source $FUNCTIONS
> --
> --oldpkg=`readlink -f $1`
> --newpkg=`readlink -f $2`
> --rename_script=`mktemp`
> --
> --if test ! -f "$oldpkg"; then
> --    echo "can't open $1"
> --    exit 1
> --fi
> --
> --if test ! -f "$newpkg"; then
> --    echo "can't open $2"
> --    exit 1
> --fi
> --
> --#usage unjar <file>
> --function unjar()
> --{
> --    local file
> --    file=$1
> --
> --    if [[ $(type -p fastjar) ]]; then
> --        UNJAR=fastjar
> --    elif [[ $(type -p jar) ]]; then
> --        UNJAR=jar
> --    elif [[ $(type -p unzip) ]]; then
> --        UNJAR=unzip
> --    else
> --        echo "ERROR: jar, fastjar, or unzip is not installed (trying file $file)"
> --        exit 1
> --    fi
> --
> --    case $UNJAR in
> --        jar|fastjar)
> --        # echo jar -xf $file
> --        ${UNJAR} -xf $file
> --        ;;
> --        unzip)
> --        unzip -oqq $file
> --        ;;
> --    esac
> --}
> --
> --# list files in directory
> --#usage unjar_l <file>
> --function unjar_l()
> --{
> --    local file
> --    file=$1
> --
> --    if [[ $(type -p fastjar) ]]; then
> --        UNJAR=fastjar
> --    elif [[ $(type -p jar) ]]; then
> --        UNJAR=jar
> --    elif [[ $(type -p unzip) ]]; then
> --        UNJAR=unzip
> --    else
> --        echo "ERROR: jar, fastjar, or unzip is not installed (trying file $file)"
> --        exit 1
> --    fi
> --
> --    case $UNJAR in
> --        jar|fastjar)
> --        ${UNJAR} -tf $file
> --        ;;
> --        unzip)
> --        unzip -l $file
> --        ;;
> --    esac
> --}
> --
> --filter_disasm()
> --{
> --   sed -e 's/^ *[0-9a-f]\+://' -e 's/\$0x[0-9a-f]\+/$something/' -e 's/callq *[0-9a-f]\+/callq /' -e 's/# *[0-9a-f]\+/#  /' -e 's/\(0x\)\?[0-9a-f]\+(/offset(/' -e 's/[0-9a-f]\+ </</' -e 's/^<\(.*\)>:/\1:/' -e 's/<\(.*\)+0x[0-9a-f]\+>/<\1 + ofs>/'
> --}
> --
> --echo "Comparing `basename $oldpkg` to `basename $newpkg`"
> --
> --case $oldpkg in
> --  *.rpm)
> --     cmp_spec $rename_script $oldpkg $newpkg
> --     RES=$?
> --     case $RES in
> --       0)
> --          echo "RPM meta information is identical"
> --          if test -z "$check_all"; then
> --             exit 0
> --          fi
> --          ;;
> --       1)
> --          echo "RPM meta information is different"
> --          if test -z "$check_all"; then
> --             exit 1
> --          fi
> --          ;;
> --       2)
> --          echo "RPM file checksum differs."
> --          RES=0
> --          ;;
> --       *)
> --          echo "Wrong exit code!"
> --          exit 1
> --          ;;
> --     esac
> --     ;;
> --esac
> --
> --file1=`mktemp`
> --file2=`mktemp`
> --
> --dir=`mktemp -d`
> --echo "Extracting packages"
> --unpackage $oldpkg $dir/old
> --unpackage $newpkg $dir/new
> --
> --# files is set in cmp_spec for rpms, so if RES is empty we should assume
> --# it wasn't an rpm and pick all files for comparison.
> --if [ -z $RES ]; then
> --    oldfiles=`cd $dir/old; find . -type f`
> --    newfiles=`cd $dir/new; find . -type f`
> --
> --    files=`echo -e "$oldfiles\n$newfiles" | sort -u`
> --fi
> --
> --cd $dir
> --bash $rename_script
> --
> --dfile=`mktemp`
> --
> --diff_two_files()
> --{
> --  if ! cmp -s old/$file new/$file; then
> --     echo "$file differs ($ftype)"
> --     hexdump -C old/$file > $file1
> --     hexdump -C new/$file > $file2
> --     diff -u $file1 $file2 | head -n 200
> --     return 1
> --  fi
> --  return 0
> --}
> --
> --trim_man_first_line()
> --{
> --    # Handles the first line if it is like:
> --    #.\" Automatically generated by Pod::Man 2.28 (Pod::Simple 3.28)
> --    #.\" DO NOT MODIFY THIS FILE!  It was generated by help2man 1.43.3.
> --    local f=$1
> --    sed -i -e '1{
> --    s|^\.\\"[[:blank:]]\+Automatically[[:blank:]]generated[[:blank:]]by[[:blank:]]Pod::Man[[:blank:]].*|.\\" Overly verbose Pod::Man|
> --    s|^\.\\"[[:blank:]]\+DO[[:blank:]]NOT[[:blank:]]MODIFY[[:blank:]]THIS[[:blank:]]FILE![[:blank:]]\+It[[:blank:]]was[[:blank:]]generated[[:blank:]]by[[:blank:]]help2man[[:blank:]].*|.\\" Overly verbose help2man|
> --    }' $f
> --}
> --
> --trim_man_TH()
> --{
> --    # Handles lines like:
> --    # .TH debhelper 7 "2010-02-27" "7.4.15" "Debhelper"
> --    # .TH DIRMNGR-CLIENT 1 2010-02-27 "Dirmngr 1.0.3" "GNU Privacy Guard"
> --    # .TH ccmake 1 "March 06, 2010" "ccmake 2.8.1-rc3"
> --    # .TH QEMU-IMG 1 "2010-03-14" " " " "
> --    # .TH kdecmake 1 "May 07, 2010" "cmake 2.8.1"
> --    # .TH "appender.h" 3 "12 May 2010" "Version 1.2.1" "log4c" \" -*- nroff -*-
> --    # .TH "appender.h" 3 "Tue Aug 31 2010" "Version 1.2.1" "log4c" \" -*- nroff -*-
> --    # .TH "OFFLINEIMAP" "1" "11 May 2010" "John Goerzen" "OfflineIMAP Manual"
> --    # .TH gv 3guile "13 May 2010"
> --    #.TH "GIT\-ARCHIMPORT" "1" "09/13/2010" "Git 1\&.7\&.1" "Git Manual"
> --    # .TH LDIRECTORD 8 "2010-10-20" "perl v5.12.2" "User Contributed Perl Documentation"
> --    # .TH ccmake 1 "February 05, 2012" "ccmake 2.8.7"
> --    # .TH "appender.h" 3 "Tue Aug 31 2010" "Version 1.2.1" "log4c" \" -*- nroff -*-
> --    # .TH ARCH "1" "September 2010" "GNU coreutils 8.5" "User Commands"
> --    # .TH "GCM-CALIBRATE" "1" "03 February 2012" "" ""
> --    #.TH Locale::Po4a::Xml.pm 3pm "2015-01-30" "Po4a Tools" "Po4a Tools"
> --    local f=$1
> --    # (.TH   quoted section) (quoted_date)(*)
> --    sed -i -e 's|^\([[:blank:]]*\.TH[[:blank:]]\+"[^"]\+"[[:blank:]]\+[^[:blank:]]\+\)[[:blank:]]\+\("[^"]\+"\)\([[:blank:]]\+.*\)\?|\1 "qq2000-01-01"\3|' $f
> --    # (.TH unquoted section) (quoted_date)(*)
> --    sed -i -e 's|^\([[:blank:]]*\.TH[[:blank:]]\+[^"][^[:blank:]]\+[[:blank:]]\+[^[:blank:]]\+\)[[:blank:]]\+\("[^"]\+"\)\([[:blank:]]\+.*\)\?|\1 "uq2000-02-02"\3|' $f
> --    # (.TH   quoted section) (unquoted_date)(*)
> --    sed -i -e 's|^\([[:blank:]]*\.TH[[:blank:]]\+"[^"]\+"[[:blank:]]\+[^[:blank:]]\+\)[[:blank:]]\+\([^"][^[:blank:]]\+\)\([[:blank:]]\+.*\)\?|\1 qu2000-03-03\3|' $f
> --    # (.TH unquoted section) (unquoted_date)(*)
> --    sed -i -e 's|^\([[:blank:]]*\.TH[[:blank:]]\+[^"][^[:blank:]]\+[[:blank:]]\+[^[:blank:]]\+\)[[:blank:]]\+\([^"][^[:blank:]]\+\)\([[:blank:]]\+.*\)\?|\1 uu2000-04-04\3|' $f
> --}
> --
> --strip_numbered_anchors()
> --{
> --  # Remove numbered anchors on Docbook / HTML files.
> --  # This should be save since we remove them from old and new files.
> --  # A trailing </a> or </div> tag will stay also on both files.
> --  for f in old/$file new/$file; do
> --     sed -i -e 's%<[ ]*a[ ]\+name[^<]*[0-9]\+[^<]*%%g' \
> --     -e 's%<[ ]*a[ ]\+href[^<]*#[^<]*[0-9]\+[^<]*%%g' \
> --     -e 's%<[^<]*id="ftn\.[^<]*[0-9]\+[^<]*%%g' $f
> --  done
> --}
> --
> --
> --check_compressed_file()
> --{
> --  local file=$1
> --  local ext=$2
> --  local tmpdir=`mktemp -d`
> --  local ftype
> --  local ret=0
> --  echo "$ext file with odd filename: $file"
> --  if test -n "$tmpdir"; then
> --    mkdir $tmpdir/{old,new}
> --    cp --parents --dereference old/$file $tmpdir/
> --    cp --parents --dereference new/$file $tmpdir/
> --    if pushd $tmpdir > /dev/null ; then
> --      case "$ext" in
> --        bz2)
> --          mv old/$file{,.bz2}
> --          mv new/$file{,.bz2}
> --          bzip2 -d old/$file.bz2
> --          bzip2 -d new/$file.bz2
> --          ;;
> --        gzip)
> --          mv old/$file{,.gz}
> --          mv new/$file{,.gz}
> --          gzip -d old/$file.gz
> --          gzip -d new/$file.gz
> --          ;;
> --        xz)
> --          mv old/$file{,.xz}
> --          mv new/$file{,.xz}
> --          xz -d old/$file.xz
> --          xz -d new/$file.xz
> --          ;;
> --      esac
> --      ftype=`/usr/bin/file old/$file | sed 's@^[^:]\+:[[:blank:]]*@@'`
> --      case $ftype in
> --        POSIX\ tar\ archive)
> --          echo "$ext content is: $ftype"
> --          mv old/$file{,.tar}
> --          mv new/$file{,.tar}
> --          if ! check_single_file ${file}.tar; then
> --            ret=1
> --          fi
> --          ;;
> --        ASCII\ cpio\ archive\ *)
> --          echo "$ext content is: $ftype"
> --          mv old/$file{,.cpio}
> --          mv new/$file{,.cpio}
> --          if ! check_single_file ${file}.cpio; then
> --            ret=1
> --          fi
> --          ;;
> --        *)
> --          echo "unhandled $ext content: $ftype"
> --          if ! diff_two_files; then
> --            ret=1
> --          fi
> --          ;;
> --      esac
> --      popd > /dev/null
> --    fi
> --    rm -rf "$tmpdir"
> --  fi
> --  return $ret
> --}
> --
> --check_single_file()
> --{
> --  local file="$1"
> --  case $file in
> --    *.spec)
> --       sed -i -e "s,Release:.*$release1,Release: @RELEASE@," old/$file
> --       sed -i -e "s,Release:.*$release2,Release: @RELEASE@," new/$file
> --       ;;
> --    *.exe.mdb|*.dll.mdb)
> --       # Just debug information, we can skip them
> --       echo "$file skipped as debug file."
> --       return 0
> --       ;;
> --    *.a)
> --       flist=`ar t new/$file`
> --       pwd=$PWD
> --       fdir=`dirname $file`
> --       cd old/$fdir
> --       ar x `basename $file`
> --       cd $pwd/new/$fdir
> --       ar x `basename $file`
> --       cd $pwd
> --       for f in $flist; do
> --          if ! check_single_file $fdir/$f; then
> --             return 1
> --          fi
> --       done
> --       return 0
> --       ;;
> --    *.cpio)
> --       flist=`cpio --quiet --list --force-local < "new/$file"`
> --       pwd=$PWD
> --       fdir=$file.extract.$PPID.$$
> --       mkdir old/$fdir new/$fdir
> --       cd old/$fdir
> --       cpio --quiet --extract --force-local < "../${file##*/}"
> --       cd $pwd/new/$fdir
> --       cpio --quiet --extract --force-local < "../${file##*/}"
> --       cd $pwd
> --       local ret=0
> --       for f in $flist; do
> --         if ! check_single_file $fdir/$f; then
> --           ret=1
> --           if test -z "$check_all"; then
> --             break
> --           fi
> --         fi
> --       done
> --       rm -rf old/$fdir new/$fdir
> --       return $ret
> --       ;;
> --    *.tar|*.tar.bz2|*.tar.gz|*.tgz|*.tbz2)
> --       flist=`tar tf new/$file`
> --       pwd=$PWD
> --       fdir=`dirname $file`
> --       cd old/$fdir
> --       tar xf `basename $file`
> --       cd $pwd/new/$fdir
> --       tar xf `basename $file`
> --       cd $pwd
> --       local ret=0
> --       for f in $flist; do
> --         if ! check_single_file $fdir/$f; then
> --           ret=1
> --           if test -z "$check_all"; then
> --             break
> --           fi
> --         fi
> --       done
> --       return $ret
> --       ;;
> --    *.zip|*.jar|*.war)
> --       cd old
> --       unjar_l ./$file |sort > flist
> --       #  10-05-2010 14:39
> --       sed -i -e "s, [0-9][0-9]-[0-9][0-9]-[0-9]\+ [0-9][0-9]:[0-9][0-9] , date ," flist
> --       # 2012-02-03 07:59
> --       sed -i -e "s, 20[0-9][0-9]-[0-9][0-9]-[0-9][0-9] [0-9][0-9]:[0-9][0-9] , date ," flist
> --       cd ../new
> --       unjar_l ./$file |sort> flist
> --       sed -i -e "s, [0-9][0-9]-[0-9][0-9]-[0-9]\+ [0-9][0-9]:[0-9][0-9] , date ,; " flist
> --       sed -i -e "s, 20[0-9][0-9]-[0-9][0-9]-[0-9][0-9] [0-9][0-9]:[0-9][0-9] , date ," flist
> --       cd ..
> --       if ! cmp -s old/flist new/flist; then
> --          echo "$file has different file list"
> --          diff -u old/flist new/flist
> --          return 1
> --       fi
> --       flist=`grep date new/flist | sed -e 's,.* date ,,'`
> --       pwd=$PWD
> --       fdir=`dirname $file`
> --       cd old/$fdir
> --       unjar `basename $file`
> --       cd $pwd/new/$fdir
> --       unjar `basename $file`
> --       cd $pwd
> --       local ret=0
> --       for f in $flist; do
> --         if test -f new/$fdir/$f && ! check_single_file $fdir/$f; then
> --           ret=1
> --           if test -z "$check_all"; then
> --             break
> --           fi
> --         fi
> --       done
> --       return $ret;;
> --     *.pyc|*.pyo)
> --        perl -e "open fh, '+<', 'old/$file'; seek fh, 4, SEEK_SET; print fh '0000';"
> --        perl -e "open fh, '+<', 'new/$file'; seek fh, 4, SEEK_SET; print fh '0000';"
> --        ;;
> --     *.bz2)
> --        bunzip2 -c old/$file > old/${file/.bz2/}
> --        bunzip2 -c new/$file > new/${file/.bz2/}
> --        check_single_file ${file/.bz2/}
> --        return $?
> --        ;;
> --     *.gz)
> --        gunzip -c old/$file > old/${file/.gz/}
> --        gunzip -c new/$file > new/${file/.gz/}
> --        check_single_file ${file/.gz/}
> --        return $?
> --        ;;
> --     *.rpm)
> --	$self_script -a old/$file new/$file
> --        return $?
> --        ;;
> --     *png)
> --	# Try to remove timestamps, only if convert from ImageMagick is installed
> --        if [[ $(type -p convert) ]]; then
> --	  convert old/$file +set date:create +set date:modify old/${file/.png/_n.png}
> --	  convert old/$file +set date:create +set date:modify new/${file/.png/_n.png}
> --	  if ! cmp -s old/${file/.png/_n.png} new/${file/.png/_n.png}; then
> --	      echo "$file differs ($ftype)"
> --	      hexdump -C old/${file/.png/_n.png} > $file1
> --	      hexdump -C new/${file/.png/_n.png} > $file2
> --	      diff -u $file1 $file2 | head -n 20
> --	      return 1
> --	  fi
> --	  return 0
> --	fi
> --        ;;
> --     /usr/share/locale/*/LC_MESSAGES/*.mo|/usr/share/locale-bundle/*/LC_MESSAGES/*.mo)
> --       for f in old/$file new/$file; do
> --         sed -i -e "s,POT-Creation-Date: ....-..-.. ..:..+....,POT-Creation-Date: 1970-01-01 00:00+0000," $f
> --       done
> --       ;;
> --     /usr/share/doc/packages/*/*.html|\
> --     /usr/share/doc/kde/HTML/*/*/*.html|/usr/share/doc/*/html/*.html)
> --       for f in old/$file new/$file; do
> --         # texi2html output, e.g. in kvm, indent, qemu
> --	 sed -i -e "s|^<!-- Created on .*, 20.. by texi2html .\...|<!-- Created on August 7, 2009 by texi2html 1.82|" $f
> --	 sed -i -e 's|^ *This document was generated by <em>Autobuild</em> on <em>.*, 20..</em> using <a href="http://www.nongnu.org/texi2html/"><em>texi2html .\...</em></a>.$|  This document was generated by <em>Autobuild</em> on <em>August 7, 2009</em> using <a href="http://www.nongnu.org/texi2html/"><em>texi2html 1.82</em></a>.|' $f
> --	 # doxygen docu, e.g. in libssh and log4c
> --	 sed -i -e 's|Generated on ... ... [0-9]* [0-9]*:[0-9][0-9]:[0-9][0-9] 20[0-9][0-9] for |Generated on Mon May 10 20:45:00 2010 for |' $f
> --	 # Generated on Sat Aug 14 2010 16:49:48 for libssh
> --	 sed -i -e 's|Generated on ... ... [0-9]* 20[0-9][0-9] [0-9]*:[0-9][0-9]:[0-9][0-9] for |Generated on Mon May 10 20:45:00 2010 for |' $f
> --       done
> --       strip_numbered_anchors
> --       ;;
> --     /usr/share/javadoc/*.html |\
> --     /usr/share/javadoc/*/*.html|/usr/share/javadoc/*/*/*.html)
> --       strip_numbered_anchors
> --       # There are more timestamps in html, so far we handle only some primitive versions.
> --       for f in old/$file new/$file; do
> --         # Javadoc:
> --          # <head>
> --          # <!-- Generated by javadoc (version 1.7.0_75) on Tue Feb 03 02:20:12 GMT 2015 -->
> --          # <!-- Generated by javadoc on Tue Feb 03 00:02:48 GMT 2015 -->
> --          # <meta name="date" content="2015-02-03">
> --          # </head>
> --          sed -i -e '
> --            /^<head>/{
> --              : next
> --              n
> --              /^<\/head>/{
> --                b end_head
> --              }
> --              s/^\(<!-- Generated by javadoc\) \((\(build\|version\) [0-9._]\+) on ... ... .. ..:..:.. \(GMT\|UTC\) ....\) \(-->\)/\1 some-date-removed-by-build-compare \5/
> --              t next
> --              s/^\(<!-- Generated by javadoc\) \(on ... ... .. ..:..:.. \(GMT\|UTC\) ....\) \(-->\)/\1 some-date-removed-by-build-compare \3/
> --              t next
> --              s/^<meta name="date" content="[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}">/<meta name="date" content="some-date-removed-by-build-compare">/
> --              b next
> --            }
> --            : end_head
> --          ' $f
> --         # Gjdoc HtmlDoclet:
> --	 sed -i -e 's%Generated by Gjdoc HtmlDoclet [0-9,.]*, part of <a href="http://www.gnu.org/software/classpath/cp-tools/" title="" target="_top">GNU Classpath Tools</a>, on .*, 20.. [0-9]*:..:.. \(a\|p\)\.m\. GMT.%Generated by Gjdoc.%' $f
> --	 sed -i -e 's%<!DOCTYPE html PUBLIC "-//gnu.org///DTD XHTML 1.1 plus Target 1.0//EN"\(.*\)GNU Classpath Tools</a>, on [A-Z][a-z]* [0-9]*, 20?? [0-9]*:??:?? \(a|p\)\.m\. GMT.</p>%<!DOCTYPE html PUBLIC "-//gnu.org///DTD XHTML 1.1 plus Target 1.0//EN"\1GNU Classpath Tools</a>, on January 1, 2009 0:00:00 a.m. GMT.</p>%' $f
> --	 sed -i -e 's%<!DOCTYPE html PUBLIC "-//gnu.org///DTD\(.*GNU Classpath Tools</a>\), on [a-zA-Z]* [0-9][0-9], 20.. [0-9]*:..:.. \(a\|p\)\.m\. GMT.</p>%<!DOCTYPE html PUBLIC "-//gnu.org///DTD\1,on May 1, 2010 1:11:42 p.m. GMT.</p>%' $f
> --	 # deprecated-list is randomly ordered, sort it for comparison
> --	 case $f in
> --	   */deprecated-list.html)
> --	     sort -o $f $f
> --	     ;;
> --	 esac
> --       done
> --       ;;
> --     /usr/share/javadoc/gjdoc.properties |\
> --     /usr/share/javadoc/*/gjdoc.properties)
> --       for f in old/$file new/$file; do
> --	 sed -i -e 's|^#[A-Z][a-z]\{2\} [A-Z][a-z]\{2\} [0-9]\{2\} ..:..:.. GMT 20..$|#Fri Jan 01 11:27:36 GMT 2009|' $f
> --       done
> --       ;;
> --     */fonts.scale|*/fonts.dir|*/encodings.dir)
> --       for f in old/$file new/$file; do
> --         # sort files before comparing
> --         sort -o $f $f
> --       done
> --       ;;
> --     /var/adm/perl-modules/*)
> --       for f in old/$file new/$file; do
> --         sed -i -e 's|^=head2 ... ... .. ..:..:.. ....: C<Module>|=head2 Wed Jul  1 00:00:00 2009: C<Module>|' $f
> --       done
> --       ;;
> --     /usr/share/man/man3/*3pm)
> --       for f in old/$file new/$file; do
> --         sed -i -e 's| 3 "20..-..-.." "perl v5....." "User Contributed Perl Documentation"$| 3 "2009-01-01" "perl v5.10.0" "User Contributed Perl Documentation"|' $f
> --         trim_man_TH $f
> --         trim_man_first_line $f
> --       done
> --       ;;
> --     /usr/share/man/*/man*|/usr/share/man/man*|/usr/lib/texmf/doc/man/*/*)
> --
> --       for f in old/$file new/$file; do
> --         trim_man_TH $f
> --         trim_man_first_line $f
> --         # generated by docbook xml:
> --         #.\"      Date: 09/13/2010
> --         sed -i -e 's|Date: [0-1][0-9]/[0-9][0-9]/201[0-9]|Date: 09/13/2010|' $f
> --       done
> --       ;;
> --     *.elc)
> --       # emacs lisp files
> --       for f in old/$file new/$file; do
> --         sed -i -e 's|Compiled by abuild@.* on ... ... .. ..:..:.. 20..$|compiled by abuild@buildhost on Wed Jul 01 00:00:00 2009|' $f
> --       done
> --       ;;
> --     /var/lib/texmf/web2c/*/*fmt |\
> --     /var/lib/texmf/web2c/metafont/*.base|\
> --     /var/lib/texmf/web2c/metapost/*.mem)
> --       # binary dump of TeX and Metafont formats, we can ignore them for good
> --       echo "difference in $file ignored."
> --       return 0
> --       ;;
> --     */libtool)
> --       for f in old/$file new/$file; do
> --	  sed -i -e 's|^# Libtool was configured on host [A-Za-z0-9]*:$|# Libtool was configured on host x42:|' $f
> --       done
> --       ;;
> --     /etc/mail/*cf|/etc/sendmail.cf)
> --       # from sendmail package
> --       for f in old/$file new/$file; do
> --	  # - ##### built by abuild@build33 on Thu May 6 11:21:17 UTC 2010
> --	  sed -i -e 's|built by abuild@[a-z0-9]* on ... ... [0-9]* [0-9]*:[0-9][0-9]:[0-9][0-9] .* 20[0-9][0-9]|built by abuild@build42 on Thu May 6 11:21:17 UTC 2010|' $f
> --       done
> --       ;;
> --     /usr/share/doc/kde/HTML/*/*/index.cache|/usr/share/doc/kde/HTML/*/*/*/index.cache|\
> --     /usr/share/gtk-doc/html/*/*.html|/usr/share/gtk-doc/html/*/*.devhelp2)
> --       # various kde and gtk packages
> --       strip_numbered_anchors
> --       ;;
> --    */created.rid)
> --       # ruby documentation
> --       # file just contains a timestamp and nothing else, so ignore it
> --       echo "Ignore $file"
> --       return 0
> --       ;;
> --    */rdoc/files/*.html)
> --       # ruby documentation
> --       # <td>Mon Sep 20 19:02:43 +0000 2010</td>
> --       for f in old/$file new/$file; do
> --          sed -i -e 's%<td>[A-Z][a-z][a-z] [A-Z][a-z][a-z] [0-9]\+ [0-9]\+:[0-9]\+:[0-9]\+ +0000 201[0-9]</td>%<td>Mon Sep 20 19:02:43 +0000 2010</td>%g' $f
> --       done
> --       strip_numbered_anchors
> --       ;;
> --    */Linux*Env.Set.sh)
> --       # LibreOffice files, contains:
> --       # Generated on: Mon Apr 18 13:19:22 UTC 2011
> --       for f in old/$file new/$file; do
> --	 sed -i -e 's%^# Generated on:.*UTC 201[0-9] *$%# Generated on: Sometime%g' $f
> --       done
> --       ;;
> --    /usr/lib/libreoffice/solver/inc/*/deliver.log)
> --       # LibreOffice log file
> --      echo "Ignore $file"
> --      return 0
> --      ;;
> --    /var/adm/update-messages/*|/var/adm/update-scripts/*)
> --      # encode version-release inside
> --      oldfn=`echo "$file"|sed -e s/-$release2/-$release1/;`
> --
> --      # fetchmsttfonts embeds the release number in the update shell script.
> --      echo sed -i -e "s/-$release1/-$release2/g;" "old/$oldfn"
> --      sed -i -e "s/-$release1/-$release2/g;" "old/$oldfn"
> --
> --      if ! diff -u old/$oldfn new/$file; then
> --           echo "$oldfn is not same as $file"
> --           return 1
> --      fi
> --      echo "$file and $oldfn are same"
> --      return 0
> --      ;;
> --    *.ps)
> --      for f in "old/$file" "new/$file"; do
> --        sed -i -e '
> --	/^%%CreationDate:[[:blank:]]/d
> --	/^%%Creator:[[:blank:]]groff[[:blank:]]version[[:blank:]]/d
> --	' "$f"
> --      done
> --    ;;
> --    *pdf)
> --      # PDF files contain a unique ID, remove it
> --      # Format of the ID is:
> --      # /ID [<9ACE247A70CF9BEAFEE15E116259BD6D> <9ACE247A70CF9BEAFEE15E116259BD6D>]
> --      # with optional spaces. pdftex creates also:
> --      # /CreationDate (D:20120103083206Z)
> --      # /ModDate (D:20120103083206Z)
> --      # and possibly XML metadata as well
> --      for f in "old/$file" "new/$file"; do
> --        sed -i \
> --            '/obj/,/endobj/{
> --               s%/ID \?\[ \?<[^>]\+> \?<[^>]\+> \?\]%/IDrandom%g;
> --               s%/CreationDate \?(D:[^)]*)%/CreationDate (D: XXX)%g;
> --               s%/ModDate \?(D:[^)]*)%/ModDate (D: XXX)%g;
> --               s%<pdf:CreationDate>[^<]*</pdf:CreationDate>%<pdf:CreationDate>XXX</pdf:CreationDate>%g;
> --               s%<pdf:ModDate>[^<]*</pdf:ModDate>%<pdf:ModDate>XXX</pdf:ModDate>%g;
> --               s%<xap:CreateDate>[^<]*</xap:CreateDate>%<xap:CreateDate>XXX</xap:CreateDate>%g;
> --               s%<xap:ModifyDate>[^<]*</xap:ModifyDate>%<xap:ModifyDate>XXX</xap:ModifyDate>%g;
> --               s%<xap:MetadataDate>[^<]*</xap:MetadataDate>%<xap:MetadataDate>XXX</xap:MetadataDate>%g;
> --            }' "$f"
> --      done
> --      ;;
> --  esac
> --
> --  ftype=`/usr/bin/file old/$file | sed 's@^[^:]\+:[[:blank:]]*@@'`
> --  case $ftype in
> --     PE32\ executable*Mono\/\.Net\ assembly*)
> --       echo "PE32 Mono/.Net assembly: $file"
> --       if [ -x /usr/bin/monodis ] ; then
> --         monodis old/$file 2>/dev/null|sed -e 's/GUID = {.*}/GUID = { 42 }/;'> ${file1}
> --         monodis new/$file 2>/dev/null|sed -e 's/GUID = {.*}/GUID = { 42 }/;'> ${file2}
> --         if ! cmp -s ${file1} ${file2}; then
> --           echo "$file differs ($ftype)"
> --           diff -u ${file1} ${file2}
> --           return 1
> --         fi
> --       else
> --         echo "Cannot compare, no monodis installed"
> --         return 1
> --       fi
> --       ;;
> --    ELF*executable*|ELF*[LM]SB\ shared\ object*)
> --       objdump -d --no-show-raw-insn old/$file | filter_disasm > $file1
> --       if ! test -s $file1; then
> --         # objdump has no idea how to handle it
> --         if ! diff_two_files; then
> --           ret=1
> --           break
> --         fi
> --       fi
> --       elfdiff=
> --       sed -i -e "s,old/,," $file1
> --       objdump -d --no-show-raw-insn new/$file | filter_disasm > $file2
> --       sed -i -e "s,new/,," $file2
> --       if ! diff -u $file1 $file2 > $dfile; then
> --          echo "$file differs in assembler output"
> --          head -n 200 $dfile
> --          elfdiff="1"
> --       fi
> --       echo "" >$file1
> --       echo "" >$file2
> --       # Don't compare .build-id and .gnu_debuglink sections
> --       sections="$(objdump -s new/$file | grep "Contents of section .*:" | sed -r "s,.* (.*):,\1,g" | grep -v -e "\.build-id" -e "\.gnu_debuglink" | tr "\n" " ")"
> --       for section in $sections; do
> --          objdump -s -j $section old/$file | sed "s,^old/,," > $file1
> --          objdump -s -j $section new/$file | sed "s,^new/,," > $file2
> --          if ! diff -u $file1 $file2 > $dfile; then
> --             echo "$file differs in ELF section $section"
> --             head -n 200 $dfile
> --             elfdiff="1"
> --          fi
> --       done
> --       if test -z "$elfdiff"; then
> --          echo "$file: only difference was in build-id or gnu_debuglink, GOOD."
> --          return 0
> --       fi
> --       return 1
> --       ;;
> --     *ASCII*|*text*)
> --       if ! cmp -s old/$file new/$file; then
> --         echo "$file differs ($ftype)"
> --         diff -u old/$file new/$file | head -n 200
> --         return 1
> --       fi
> --       ;;
> --     directory|setuid,\ directory|sticky,\ directory)
> --       # tar might package directories - ignore them here
> --       return 0
> --       ;;
> --     bzip2\ compressed\ data*)
> --       if ! check_compressed_file "$file" "bz2"; then
> --           return 1
> --       fi
> --       ;;
> --     gzip\ compressed\ data*)
> --       if ! check_compressed_file "$file" "gzip"; then
> --           return 1
> --       fi
> --       ;;
> --     XZ\ compressed\ data*)
> --       if ! check_compressed_file "$file" "xz"; then
> --           return 1
> --       fi
> --       ;;
> --     POSIX\ tar\ archive)
> --          mv old/$file{,.tar}
> --          mv new/$file{,.tar}
> --          if ! check_single_file ${file}.tar; then
> --            return 1
> --          fi
> --       ;;
> --     cpio\ archive)
> --          mv old/$file{,.cpio}
> --          mv new/$file{,.cpio}
> --          if ! check_single_file ${file}.cpio; then
> --            return 1
> --          fi
> --     ;;
> --     symbolic\ link\ to\ *)
> --       readlink "old/$file" > $file1
> --       readlink "new/$file" > $file2
> --       if ! diff -u $file1 $file2; then
> --         echo "symlink target for $file differs"
> --         return 1
> --       fi
> --       ;;
> --     *)
> --       if ! diff_two_files; then
> --           return 1
> --       fi
> --       ;;
> --  esac
> --  return 0
> --}
> --
> --# We need /proc mounted for some tests, so check that it's mounted and
> --# complain if not.
> --PROC_MOUNTED=0
> --if [ ! -d /proc/self/ ]; then
> --  echo "/proc is not mounted"
> --  mount -orw -n -tproc none /proc
> --  PROC_MOUNTED=1
> --fi
> --
> --# preserve cmp_spec result for check_all runs
> --ret=$RES
> --for file in $files; do
> --   if ! check_single_file $file; then
> --       ret=1
> --       if test -z "$check_all"; then
> --           break
> --       fi
> --   fi
> --done
> --
> --if [ "$PROC_MOUNTED" -eq "1" ]; then
> --  echo "Unmounting proc"
> --  umount /proc
> --fi
> --
> --rm $file1 $file2 $dfile $rename_script
> --rm -rf $dir
> --if test "$ret" = 0; then
> --     echo "Package content is identical"
> --fi
> --exit $ret
> --# vim: tw=666 ts=2 et
> -diff --git a/same-build-result.sh b/same-build-result.sh
> -index c8907e2..7e9bd4f 100644
> ---- a/same-build-result.sh
> -+++ b/same-build-result.sh
> -@@ -7,11 +7,11 @@
> - # Enhanced by Andreas Jaeger <aj@suse.de>
> - #
> - # The script decides if the new build differes from the former one,
> --# using rpm-check.sh.
> -+# using pkg-diff.sh.
> - # The script is called as part of the build process as:
> - # /usr/lib/build/same-build-result.sh /.build.oldpackages /usr/src/packages/RPMS /usr/src/packages/SRPMS
> -
> --CMPSCRIPT=${0%/*}/rpm-check.sh
> -+CMPSCRIPT=${0%/*}/pkg-diff.sh
> - SCMPSCRIPT=${0%/*}/srpm-check.sh
> -
> - check_all=1
> ---
> -1.7.9.5
> -
> diff --git a/meta/recipes-devtools/build-compare/files/functions.sh-improve-deb-and-ipk-checking.patch b/meta/recipes-devtools/build-compare/files/functions.sh-improve-deb-and-ipk-checking.patch
> deleted file mode 100644
> index 05420f8..0000000
> --- a/meta/recipes-devtools/build-compare/files/functions.sh-improve-deb-and-ipk-checking.patch
> +++ /dev/null
> @@ -1,117 +0,0 @@
> -From b4eb7fde10318162bd2d02b9017ef51746752a91 Mon Sep 17 00:00:00 2001
> -From: Robert Yang <liezhi.yang@windriver.com>
> -Date: Thu, 14 Jul 2016 23:14:21 -0700
> -Subject: [PATCH 4/4] functions.sh: improve deb and ipk checking
> -
> -* The deb and ipk's depends version string is like:
> -  Depends: libc6 (>= 2.24)
> -  Update trim_release_old and trim_release_new to match the bracket in
> -  the end ")".
> -
> -* The deb's data tarball now is .tar.xz, and ipk's is .tar.gz.
> -
> -* Update adjust_controlfile() to make ituse trim_release_old and
> -  trim_release_new.
> -
> -Upstream-Status: Submitted [https://github.com/openSUSE/build-compare/pull/10]
> -
> -Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ----
> - functions.sh | 45 ++++++++++++++++++++++++++++-----------------
> - 1 file changed, 28 insertions(+), 17 deletions(-)
> -
> -diff --git a/functions.sh b/functions.sh
> -index aa572f9..fe493ba 100755
> ---- a/functions.sh
> -+++ b/functions.sh
> -@@ -78,7 +78,7 @@ check_header()
> - function trim_release_old()
> - {
> -   sed -e "
> --  /\(\/boot\|\/lib\/modules\|\/lib\/firmware\|\/usr\/src\|$version_release_old_regex_l\$\)/{s,$version_release_old_regex_l,@VERSION@-@RELEASE_LONG@,g;s,$version_release_old_regex_s,@VERSION@-@RELEASE_SHORT@,g}
> -+  /\(\/boot\|\/lib\/modules\|\/lib\/firmware\|\/usr\/src\|$version_release_old_regex_l\$\|$version_release_old_regex_l)\)/{s,$version_release_old_regex_l,@VERSION@-@RELEASE_LONG@,g;s,$version_release_old_regex_s,@VERSION@-@RELEASE_SHORT@,g}
> -   s/\(\/var\/adm\/update-scripts\/\)${name_ver_rel_old_regex_l}\([^[:blank:]]\+\)/\1@NAME_VER_REL@\2/g
> -   s/^ *//g
> -   "
> -@@ -86,7 +86,7 @@ function trim_release_old()
> - function trim_release_new()
> - {
> -   sed -e "
> --  /\(\/boot\|\/lib\/modules\|\/lib\/firmware\|\/usr\/src\|$version_release_new_regex_l\$\)/{s,$version_release_new_regex_l,@VERSION@-@RELEASE_LONG@,g;s,$version_release_new_regex_s,@VERSION@-@RELEASE_SHORT@,g}
> -+  /\(\/boot\|\/lib\/modules\|\/lib\/firmware\|\/usr\/src\|$version_release_new_regex_l\$\|$version_release_new_regex_l)\)/{s,$version_release_new_regex_l,@VERSION@-@RELEASE_LONG@,g;s,$version_release_new_regex_s,@VERSION@-@RELEASE_SHORT@,g}
> -   s/\(\/var\/adm\/update-scripts\/\)${name_ver_rel_new_regex_l}\([^[:blank:]]\+\)/\1@NAME_VER_REL@\2/g
> -   s/^ *//g
> -   "
> -@@ -133,8 +133,8 @@ function unpackage()
> -             ar x $file
> -             tar xf control.tar.gz
> -             rm control.tar.gz
> --            tar xf data.tar.gz
> --            rm data.tar.gz
> -+            tar xf data.tar.[xg]z
> -+            rm data.tar.[xg]z
> -             ;;
> -     esac
> -     popd 1>/dev/null
> -@@ -164,6 +164,22 @@ function get_value()
> -     sed -n -e "/^___${1}___/,/^___${1}___/p" $2 | sed -e "/^___${1}___/d"
> - }
> -
> -+# Set version_release_old_regex_s, version_release_old_regex_l and
> -+# name_ver_rel_old_regex_l, also the new ones.
> -+function set_regex() {
> -+    # Remember to quote the . which is in release
> -+    # Short version without B_CN
> -+    version_release_old_regex_s=${version_release_old%.*}
> -+    version_release_old_regex_s=${version_release_old_regex_s//./\\.}
> -+    version_release_new_regex_s=${version_release_new%.*}
> -+    version_release_new_regex_s=${version_release_new_regex_s//./\\.}
> -+    # Long version with B_CNT
> -+    version_release_old_regex_l=${version_release_old//./\\.}
> -+    version_release_new_regex_l=${version_release_new//./\\.}
> -+    name_ver_rel_old_regex_l=${name_ver_rel_old//./\\.}
> -+    name_ver_rel_new_regex_l=${name_ver_rel_new//./\\.}
> -+}
> -+
> - # Compare just the rpm meta data of two rpms
> - # Returns:
> - # 0 in case of same content
> -@@ -194,17 +210,7 @@ function cmp_spec ()
> -     version_release_old="$(get_value QF_VER_REL $spec_old)"
> -     name_ver_rel_old="$(get_value QF_NAME_VER_REL $spec_old)"
> -
> --    # Remember to quote the . which is in release
> --    # Short version without B_CN
> --    version_release_old_regex_s=${version_release_old%.*}
> --    version_release_old_regex_s=${version_release_old_regex_s//./\\.}
> --    version_release_new_regex_s=${version_release_new%.*}
> --    version_release_new_regex_s=${version_release_new_regex_s//./\\.}
> --    # Long version with B_CNT
> --    version_release_old_regex_l=${version_release_old//./\\.}
> --    version_release_new_regex_l=${version_release_new//./\\.}
> --    name_ver_rel_old_regex_l=${name_ver_rel_old//./\\.}
> --    name_ver_rel_new_regex_l=${name_ver_rel_new//./\\.}
> -+    set_regex
> -
> -     # Check the whole spec file at first, return 0 immediately if the
> -     # are the same.
> -@@ -285,9 +291,14 @@ function cmp_spec ()
> - }
> -
> - function adjust_controlfile() {
> --    cat $1/control | sed '/^Version: /d' > $1/control.fixed
> -+    version_release_old="`sed -ne 's/^Version: \(.*\)/\1/p' $1/control`"
> -+    name_ver_rel_old="`sed -n -e 's/^Package: \(.*\)/\1/p' $1/control`-`sed -n -e 's/^Version: \(.*\)/\1/p' $1/control`"
> -+    version_release_new="`sed -ne 's/^Version: \(.*\)/\1/p' $2/control`"
> -+    name_ver_rel_new="`sed -n -e 's/^Package: \(.*\)/\1/p' $2/control`-`sed -n -e 's/^Version: \(.*\)/\1/p' $2/control`"
> -+    set_regex
> -+    cat $1/control | trim_release_old > $1/control.fixed
> -     mv $1/control.fixed $1/control
> --    cat $2/control | sed '/^Version: /d' > $2/control.fixed
> -+    cat $2/control | trim_release_new > $2/control.fixed
> -     mv $2/control.fixed $2/control
> - }
> -
> ---
> -2.9.0
> -
> diff --git a/meta/recipes-devtools/build-compare/files/functions.sh-remove-space-at-head.patch b/meta/recipes-devtools/build-compare/files/functions.sh-remove-space-at-head.patch
> deleted file mode 100644
> index 02e96ba..0000000
> --- a/meta/recipes-devtools/build-compare/files/functions.sh-remove-space-at-head.patch
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -From 402a821e604f280e62c34bf4d40c6d1b4c6c892d Mon Sep 17 00:00:00 2001
> -From: Robert Yang <liezhi.yang@windriver.com>
> -Date: Mon, 4 Jul 2016 20:11:33 -0700
> -Subject: [PATCH] functions.sh: remove space at head
> -
> -The command like:
> -rpm -qp --nodigest --nosignature --qf '<foo> [%{REQUIRENAME}\n]\n'
> -                                            ^^space
> -
> -The space will be printed, and will impact the check result, so remove it.
> -
> -Upstream-Status: Submitted [https://github.com/openSUSE/build-compare/pull/9]
> -
> -Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ----
> - functions.sh | 2 ++
> - 1 file changed, 2 insertions(+)
> -
> -diff --git a/functions.sh b/functions.sh
> -index 85c9003..b1069d2 100644
> ---- a/functions.sh
> -+++ b/functions.sh
> -@@ -26,6 +26,7 @@ function trim_release_old()
> -   sed -e "
> -   /\(\/boot\|\/lib\/modules\|\/lib\/firmware\|\/usr\/src\|$version_release_old_regex_l\$\)/{s,$version_release_old_regex_l,@VERSION@-@RELEASE_LONG@,g;s,$version_release_old_regex_s,@VERSION@-@RELEASE_SHORT@,g}
> -   s/\(\/var\/adm\/update-scripts\/\)${name_ver_rel_old_regex_l}\([^[:blank:]]\+\)/\1@NAME_VER_REL@\2/g
> -+  s/^ *//g
> -   "
> - }
> - function trim_release_new()
> -@@ -33,6 +34,7 @@ function trim_release_new()
> -   sed -e "
> -   /\(\/boot\|\/lib\/modules\|\/lib\/firmware\|\/usr\/src\|$version_release_new_regex_l\$\)/{s,$version_release_new_regex_l,@VERSION@-@RELEASE_LONG@,g;s,$version_release_new_regex_s,@VERSION@-@RELEASE_SHORT@,g}
> -   s/\(\/var\/adm\/update-scripts\/\)${name_ver_rel_new_regex_l}\([^[:blank:]]\+\)/\1@NAME_VER_REL@\2/g
> -+  s/^ *//g
> -   "
> - }
> - # Get single directory or filename with long or short release string
> ---
> -2.9.0
> -
> diff --git a/meta/recipes-devtools/build-compare/files/functions.sh-run-rpm-once-to-make-it-faster.patch b/meta/recipes-devtools/build-compare/files/functions.sh-run-rpm-once-to-make-it-faster.patch
> deleted file mode 100644
> index f5b99d9..0000000
> --- a/meta/recipes-devtools/build-compare/files/functions.sh-run-rpm-once-to-make-it-faster.patch
> +++ /dev/null
> @@ -1,361 +0,0 @@
> -From f34d632c427b1e1570ef9136454fc01d8c9f10a6 Mon Sep 17 00:00:00 2001
> -From: Robert Yang <liezhi.yang@windriver.com>
> -Date: Thu, 7 Jul 2016 19:34:09 -0700
> -Subject: [PATCH] functions.sh: run rpm once to make it faster
> -
> -The rpm tool is a heavy process, it ran 16 (or 17 for kernel)
> -"rpm -qp" times when the pkgs are identical, now we only run
> -"rpm -qp --qf <all we need>" twice (one is for old pkg, and one is for
> -new), save the results to spec_old and spec_new, then use sed command to
> -get what we need later, this can make it 75% faster when the pkgs are
> -identical. Here is the rough data on my host Ubuntu 14.04.4, 32 cores
> -CPU and 128G mem:
> -* When the pkgs are identical:
> -  - Before the patch: 1s
> -  - After the patch: 0.26s
> -  I compare the whole spec firstly, and return 0 if they are the same,
> -  or go on checking one by one if not, without this, it would be 0.46s,
> -  the gain is great when there are lot of packages, usually, we have
> -  more than 10,000 rpms to compare.
> -
> -* When the pkgs are different:
> -  That depends on where is the different, if the different is at the
> -  comparing rpmtags stage:
> -  - Before the patch: 0.26s
> -  - After the patch: 0.29s
> -  Increased 0.03s, but if the different is happend later than comparing
> -  rpmtags, it will save time.
> -
> -Upstream-Status: Submitted [https://github.com/openSUSE/build-compare/pull/9]
> -
> -Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ----
> - functions.sh | 245 ++++++++++++++++++++++++++++++++---------------------------
> - 1 file changed, 132 insertions(+), 113 deletions(-)
> - mode change 100644 => 100755 functions.sh
> -
> -diff --git a/functions.sh b/functions.sh
> -old mode 100644
> -new mode 100755
> -index b1069d2..aa572f9
> ---- a/functions.sh
> -+++ b/functions.sh
> -@@ -10,9 +10,63 @@
> -
> - RPM="rpm -qp --nodigest --nosignature"
> -
> --check_header()
> -+# Name, Version, Release
> -+QF_NAME="%{NAME}"
> -+QF_VER_REL="%{VERSION}-%{RELEASE}"
> -+QF_NAME_VER_REL="%{NAME}-%{VERSION}-%{RELEASE}"
> -+
> -+# provides destroy this because at least the self-provide includes the
> -+# -buildnumber :-(
> -+QF_PROVIDES="[%{PROVIDENAME} %{PROVIDEFLAGS} %{PROVIDEVERSION}\\n]\\n"
> -+QF_PROVIDES="$QF_PROVIDES [%{REQUIRENAME} %{REQUIREFLAGS} %{REQUIREVERSION}\\n]\\n"
> -+QF_PROVIDES="$QF_PROVIDES [%{CONFLICTNAME} %{CONFLICTFLAGS} %{CONFLICTVERSION}\\n]\\n"
> -+QF_PROVIDES="$QF_PROVIDES [%{OBSOLETENAME} %{OBSOLETEFLAGS} %{OBSOLETEVERSION}\\n]\\n"
> -+
> -+# don't look at RELEASE, it contains our build number
> -+QF_TAGS="%{NAME} %{VERSION} %{EPOCH}\\n"
> -+QF_TAGS="$QF_TAGS %{SUMMARY}\\n%{DESCRIPTION}\\n"
> -+# the DISTURL tag can be used as checkin ID
> -+QF_TAGS="$QF_TAGS %{VENDOR} %{DISTRIBUTION} %{DISTURL}"
> -+QF_TAGS="$QF_TAGS %{LICENSE} %{LICENSE}\\n"
> -+QF_TAGS="$QF_TAGS %{GROUP} %{URL} %{EXCLUDEARCH} %{EXCLUDEOS} %{EXCLUSIVEARCH}\\n"
> -+QF_TAGS="$QF_TAGS %{EXCLUSIVEOS} %{RPMVERSION} %{PLATFORM}\\n"
> -+QF_TAGS="$QF_TAGS %{PAYLOADFORMAT} %{PAYLOADCOMPRESSOR} %{PAYLOADFLAGS}\\n"
> -+
> -+# XXX We also need to check the existence (but not the content (!))
> -+# of SIGGPG (and perhaps the other SIG*)
> -+# XXX We don't look at triggers
> -+QF_TAGS="$QF_TAGS [%{VERIFYSCRIPTPROG} %{VERIFYSCRIPT}]\\n"
> -+# Only the first ChangeLog entry; should be enough
> -+QF_TAGS="$QF_TAGS %{CHANGELOGTIME} %{CHANGELOGNAME} %{CHANGELOGTEXT}\\n"
> -+
> -+# scripts, might contain release number
> -+QF_SCRIPT="[%{PREINPROG} %{PREIN}\\n]\\n[%{POSTINPROG} %{POSTIN}\\n]\\n[%{PREUNPROG} %{PREUN}\\n]\\n[%{POSTUNPROG} %{POSTUN}\\n]\\n"
> -+
> -+# Now the files. We leave out mtime and size.  For normal files
> -+# the size will influence the MD5 anyway.  For directories the sizes can
> -+# differ, depending on which file system the package was built.  To not
> -+# have to filter out directories we simply ignore all sizes.
> -+# Also leave out FILEDEVICES, FILEINODES (depends on the build host),
> -+# FILECOLORS, FILECLASS (normally useful but file output contains mtimes),
> -+# FILEDEPENDSX and FILEDEPENDSN.
> -+# Also FILELANGS (or?)
> -+QF_FILELIST="[%{FILENAMES} %{FILEFLAGS} %{FILESTATES} %{FILEMODES:octal} %{FILEUSERNAME} %{FILEGROUPNAME} %{FILERDEVS} %{FILEVERIFYFLAGS} %{FILELINKTOS}\n]\\n"
> -+# ??? what to do with FILEPROVIDE and FILEREQUIRE?
> -+
> -+QF_CHECKSUM="[%{FILENAMES} %{FILEMD5S} %{FILEFLAGS}\n]\\n"
> -+
> -+QF_ALL="\n___QF_NAME___\n${QF_NAME}\n___QF_NAME___\n"
> -+QF_ALL="$QF_ALL\n___QF_TAGS___\n${QF_TAGS}\n___QF_TAGS___\n"
> -+QF_ALL="$QF_ALL\n___QF_VER_REL___\n${QF_VER_REL}\n___QF_VER_REL___\n"
> -+QF_ALL="$QF_ALL\n___QF_NAME_VER_REL___\n${QF_NAME_VER_REL}\n___QF_NAME_VER_REL___\n"
> -+QF_ALL="$QF_ALL\n___QF_PROVIDES___\n${QF_PROVIDES}\n___QF_PROVIDES___\n"
> -+QF_ALL="$QF_ALL\n___QF_SCRIPT___\n${QF_SCRIPT}\n___QF_SCRIPT___\n"
> -+QF_ALL="$QF_ALL\n___QF_FILELIST___\n${QF_FILELIST}\n___QF_FILELIST___\n"
> -+QF_ALL="$QF_ALL\n___QF_CHECKSUM___\n${QF_CHECKSUM}\n___QF_CHECKSUM___\n"
> -+
> -+check_header()
> - {
> --   $RPM --qf "$QF" "$1"
> -+   $RPM --qf "$1" "$2"
> - }
> -
> - # Trim version-release string:
> -@@ -47,18 +101,6 @@ function grep_release_new()
> -   grep -E "(/boot|/lib/modules|/lib/firmware|/usr/src)/[^/]+(${version_release_new_regex_l}(\$|[^/]+\$)|${version_release_new_regex_s}(\$|[^/]+\$))"
> - }
> -
> --function check_provides()
> --{
> --  local pkg=$1
> --  # provides destroy this because at least the self-provide includes the
> --  # -buildnumber :-(
> --  QF="[%{PROVIDENAME} %{PROVIDEFLAGS} %{PROVIDEVERSION}\\n]\\n"
> --  QF="$QF [%{REQUIRENAME} %{REQUIREFLAGS} %{REQUIREVERSION}\\n]\\n"
> --  QF="$QF [%{CONFLICTNAME} %{CONFLICTFLAGS} %{CONFLICTVERSION}\\n]\\n"
> --  QF="$QF [%{OBSOLETENAME} %{OBSOLETEFLAGS} %{OBSOLETEVERSION}\\n]\\n"
> --  check_header "$pkg"
> --}
> --
> - #usage unpackage <file> $dir
> - # Unpack files in directory $dir
> - # like /usr/bin/unpackage - just for one file and with no options
> -@@ -98,6 +140,30 @@ function unpackage()
> -     popd 1>/dev/null
> - }
> -
> -+# Run diff command on the files
> -+# $1: printed info
> -+# $2: file1
> -+# $3: file2
> -+function comp_file()
> -+{
> -+    echo "comparing $1"
> -+    if ! diff -au $2 $3; then
> -+      if test -z "$check_all"; then
> -+        rm $2 $3 $spec_old $spec_new
> -+        return 1
> -+      fi
> -+    fi
> -+    return 0
> -+}
> -+
> -+# Get var's value from specfile.
> -+# $1: var name
> -+# $2: specfile
> -+function get_value()
> -+{
> -+    sed -n -e "/^___${1}___/,/^___${1}___/p" $2 | sed -e "/^___${1}___/d"
> -+}
> -+
> - # Compare just the rpm meta data of two rpms
> - # Returns:
> - # 0 in case of same content
> -@@ -107,56 +173,29 @@ function unpackage()
> - function cmp_spec ()
> - {
> -     local RES
> --    local file1 file2
> -+    local file_old file_new
> -     local f
> -     local sh=$1
> -     local oldrpm=$2
> -     local newrpm=$3
> -
> --    QF="%{NAME}"
> --
> --    # don't look at RELEASE, it contains our build number
> --    QF="$QF %{VERSION} %{EPOCH}\\n"
> --    QF="$QF %{SUMMARY}\\n%{DESCRIPTION}\\n"
> --    QF="$QF %{VENDOR} %{DISTRIBUTION} %{DISTURL}"
> --    QF="$QF %{LICENSE} %{LICENSE}\\n"
> --    QF="$QF %{GROUP} %{URL} %{EXCLUDEARCH} %{EXCLUDEOS} %{EXCLUSIVEARCH}\\n"
> --    QF="$QF %{EXCLUSIVEOS} %{RPMVERSION} %{PLATFORM}\\n"
> --    QF="$QF %{PAYLOADFORMAT} %{PAYLOADCOMPRESSOR} %{PAYLOADFLAGS}\\n"
> --
> 

