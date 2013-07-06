Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id 1DFFC6AD31
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Jul 2013 21:24:40 +0000 (UTC)
Received: by mail-ea0-f176.google.com with SMTP id z15so2102042ead.21
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Jul 2013 14:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=e3QdhqqdP7xzLU1Qosb8beKABkecUN2/3Gt5Mz4DzbI=;
	b=OJJjd5xAH1/o+js0qWpb5JtkFphVxXk8spT3JEdpgasWXhS9LjpckGY4HTohl8k0QC
	bIbvbaVmF4kp3K0L0osyH1a9xOrJBGLtZV1Wp6ewOdk39hHbc4v8K2jKYSBwmvq2aB+6
	mBghXF6k/DCgHA7f3Vy6iKGvkG5NdiQ1YRvkQb0gv8NaaCVjN1WJ0r7niSmUwRUTJq0J
	NmHCVmYanbaeCGLKJ9ivrozwhw2iKZSi9JLoWAgwlxxhxHpfqfJtPHpeAsaualPJHYW9
	qDTs6qF8DImOsMflxGJputLyJSSI+jxn3e+zZKcIPmBXiZDh1Bz1+Hs5B2KDb7zTced3
	OlLg==
X-Received: by 10.14.220.66 with SMTP id n42mr17708431eep.67.1373145881241;
	Sat, 06 Jul 2013 14:24:41 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	e44sm27059407eeh.11.2013.07.06.14.24.40 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 06 Jul 2013 14:24:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  6 Jul 2013 23:24:46 +0200
Message-Id: <1373145886-26565-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <20130706122934.GC3288@jama>
References: <20130706122934.GC3288@jama>
Subject: [RFC][PATCH] test-dependencies: add simple script to detect missing or autoenabled dependencies
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
X-List-Received-Date: Sat, 06 Jul 2013 21:24:41 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 scripts/test-dependencies.sh | 250 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 250 insertions(+)
 create mode 100755 scripts/test-dependencies.sh

diff --git a/scripts/test-dependencies.sh b/scripts/test-dependencies.sh
new file mode 100755
index 0000000..99e2ca0
--- /dev/null
+++ b/scripts/test-dependencies.sh
@@ -0,0 +1,250 @@
+#!/bin/sh
+
+# Used to detect missing dependencies or automagically
+# enabled dependencies which aren't explicitly enabled
+# or disabled.
+
+# It does 3 builds of <target>
+# 1st to populate sstate-cache directory and sysroot
+# 2nd to rebuild each recipe with every possible
+#     dependency found in sysroot (which stays populated
+#     from 1st build
+# 3rd to rebuild each recipe only with dependencies defined
+#     in DEPENDS
+# 4th (optional) repeat build like 3rd to make sure that
+#     minimal versions of dependencies defined in DEPENDS
+#     is also enough
+
+# Global vars
+tmpdir=
+targets=
+recipes=
+buildhistory=
+buildtype=
+default_targets="world"
+default_buildhistory="buildhistory"
+default_buildtype="1 2 3 c"
+
+usage () {
+  cat << EOF
+Welcome to utility to detect missing or autoenabled dependencies.
+WARNING: this utility will completely remove your tmpdir (make sure
+         you don't have important buildhistory or persistent dir there).
+$0 <OPTION>
+
+Options:
+  -h, --help
+        Display this help and exit.
+
+  --tmpdir=<tmpdir>
+        Specify tmpdir, will use the environment variable TMPDIR if it is not specified.
+        Something like /OE/oe-core/tmp-eglibc (no / at the end).
+
+  --targets=<targets>
+        List of targets separated by space, will use the environment variable TARGETS if it is not specified.
+        It will run "bitbake <targets>" to populate sysroots.
+        Default value is "world".
+
+  --recipes=<recipes>
+        File with list of recipes we want to rebuild with minimal and maximal sysroot.
+        Will use the environment variable RECIPES if it is not specified.
+        Default value will use all packages ever recorded in buildhistory directory.
+
+  --buildhistory=<buildhistory>
+        Path to buildhistory directory, it needs to be enabled in your config,
+        because it's used to detect different dependencies and to create list
+        of recipes to rebuild when it's not specified.
+        Will use the environment variable BUILDHISTORY if it is not specified.
+        Default value is "buildhistory"
+
+  --buildtype=<buildtype>
+        There are 4 types of build:
+          1: build to populate sstate-cache directory and sysroot
+          2: build to rebuild each recipe with every possible dep
+          3: build to rebuild each recipe with minimal dependencies
+          4: build to rebuild each recipe again with minimal dependencies
+          c: compare buildhistory directories from build 2 and 3
+        Will use the environment variable BUILDTYPE if it is not specified.
+        Default value is "1 2 3 c", order is important, type 4 is optional.
+EOF
+}
+
+# Print error information and exit.
+echo_error () {
+  echo "ERROR: $1" >&2
+  exit 1
+}
+
+while [ -n "$1" ]; do
+  case $1 in
+    --tmpdir=*)
+      tmpdir=`echo $1 | sed -e 's#^--tmpdir=##' | xargs readlink -e`
+      [ -d "$tmpdir" ] || echo_error "Invalid argument to --tmpdir"
+      shift
+        ;;
+    --targets=*)
+      targets=`echo $1 | sed -e 's#^--targets="*\([^"]*\)"*#\1#'`
+      shift
+        ;;
+    --recipes=*)
+      recipes=`echo $1 | sed -e 's#^--recipes="*\([^"]*\)"*#\1#'`
+      shift
+        ;;
+    --buildhistory=*)
+      buildhistory=`echo $1 | sed -e 's#^--buildhistory="*\([^"]*\)"*#\1#'`
+      shift
+        ;;
+    --buildtype=*)
+      buildtype=`echo $1 | sed -e 's#^--buildtype="*\([^"]*\)"*#\1#'`
+      shift
+        ;;
+    --help|-h)
+      usage
+      exit 0
+        ;;
+    *)
+      echo "Invalid arguments $*"
+      echo_error "Try '$0 -h' for more information."
+        ;;
+  esac
+done
+
+# tmpdir directory, use environment variable TMPDIR
+# if it was not specified, otherwise, error.
+[ -n "$tmpdir" ] || tmpdir=$TMPDIR
+[ -n "$tmpdir" ] || echo_error "No tmpdir found!"
+[ -d "$tmpdir" ] || echo_error "Invalid tmpdir \"$tmpdir\""
+[ -n "$targets" ] || targets=$TARGETS
+[ -n "$targets" ] || targets=$default_targets
+[ -n "$recipes" ] || recipes=$RECIPES
+[ -n "$recipes" -a ! -f "$recipes" ] && echo_error "Invalid file with list of recipes to rebuild"
+[ -n "$recipes" ] || echo "All packages ever recorded in buildhistory directory will be rebuilt"
+[ -n "$buildhistory" ] || buildhistory=$BUILDHISTORY
+[ -n "$buildhistory" ] || buildhistory=$default_buildhistory
+[ -d "$buildhistory" ] || echo_error "Invalid buildhistory directory \"$buildhistory\""
+[ -n "$buildtype" ] || buildtype=$BUILDTYPE
+[ -n "$buildtype" ] || buildtype=$default_buildtype
+echo "$buildtype" | grep -v '^[1234c ]*$' && echo_error "Invalid buildtype \"$buildtype\", only some combination of 1, 2, 3, 4, c separated by space is allowed"
+
+OUTPUT_BASE=test-dependencies/`date "+%s"`
+
+build_all() {
+  echo "===== 1st build to populate sstate-cache directory and sysroot ====="
+  OUTPUT1=${OUTPUT_BASE}/${TYPE}_all
+  mkdir -p ${OUTPUT1}
+  echo "Logs will be stored in ${OUTPUT1} directory"
+  bitbake $targets | tee -a ${OUTPUT1}/complete.log
+}
+
+build_every_recipe_max() {
+  echo "===== 2nd build to rebuild each recipe with every possible dep ====="
+  OUTPUT2=${OUTPUT_BASE}/${TYPE}_max
+  mkdir -p ${OUTPUT2}
+  echo "Logs will be stored in ${OUTPUT2} directory"
+  if [ -z "$recipes" ]; then
+    ls -d $buildhistory/packages/*/* | xargs -n 1 basename | sort -u > ${OUTPUT2}/recipe.list
+    recipes=${OUTPUT2}/recipe.list
+  fi
+  i=1
+  count=`cat $recipes | wc -l`
+  for recipe in `cat $recipes`; do
+    echo "Building recipe: ${recipe} ($i/$count)"
+    bitbake -c cleansstate ${recipe} > ${OUTPUT2}/log.${recipe} 2>&1;
+    bitbake ${recipe} >> ${OUTPUT2}/log.${recipe} 2>&1;
+    grep "ERROR: Task.*failed" ${OUTPUT2}/log.${recipe}
+    # here we keep tmpdir between builds
+    i=`expr $i + 1`
+  done
+  echo "Copying buildhistory/packages to ${OUTPUT2}"
+  cp -ra $buildhistory/packages ${OUTPUT2}
+  grep "ERROR: Task.*failed" ${OUTPUT2}/log.* | tee ${OUTPUT2}/failed
+}
+
+build_every_recipe_min() {
+  echo "===== 3rd or 4th build to rebuild each recipe with minimal dependencies ====="
+  OUTPUT3=${OUTPUT_BASE}/${TYPE}_min
+  mkdir -p ${OUTPUT3}
+  echo "Logs will be stored in ${OUTPUT3} directory"
+
+  if [ -z "$recipes" ]; then
+    ls -d $buildhistory/packages/*/* | xargs -n 1 basename | sort -u > ${OUTPUT3}/recipe.list
+    recipes=${OUTPUT3}/recipe.list
+  fi
+  echo "!!!Removing tmpdir \"$tmpdir\"!!!"
+  rm -rf $tmpdir/* 2>/dev/null
+  i=1
+  count=`cat $recipes | wc -l`
+  for recipe in `cat $recipes`; do
+    echo "Building recipe: ${recipe} ($i/$count)"
+    bitbake -c cleansstate ${recipe} > ${OUTPUT3}/log.${recipe} 2>&1;
+    bitbake ${recipe} >> ${OUTPUT3}/log.${recipe} 2>&1;
+    grep "ERROR: Task.*failed" ${OUTPUT3}/log.${recipe}
+    rm -rf $tmpdir/* 2>/dev/null
+    i=`expr $i + 1`
+  done
+  echo "Copying buildhistory/packages to ${OUTPUT3}"
+  cp -ra $buildhistory/packages ${OUTPUT3}
+  grep "ERROR: Task.*failed" ${OUTPUT3}/log.* | tee ${OUTPUT3}/failed
+}
+
+compare_deps() {
+  # you can run just compare task with command like this
+  # OUTPUT2=test-dependencies/1373140172/2_max \
+  # OUTPUT3=test-dependencies/1373140172/3_min \
+  # OUTPUTC=test-dependencies/1373140172 \
+  # openembedded-core/scripts/test-dependencies.sh --tmpdir=tmp-eglibc --targets=glib-2.0 --recipes=recipe_list --buildtype=c
+  echo "===== Compare dependencies recorded in \"${OUTPUT2}\" and \"${OUTPUT3}\" ====="
+  [ -n "${OUTPUTC}" ] || OUTPUTC=${OUTPUT_BASE}
+  mkdir -p ${OUTPUTC}
+  OUTPUT_FILE=${OUTPUTC}/dependency-changes
+  echo "Differences will be stored in ${OUTPUT_FILE}, dot is shown for every 100 of checked packages"
+  echo > ${OUTPUT_FILE}
+
+  [ -d ${OUTPUT2} ] || echo_error "Directory with output from build 2 \"${OUTPUT2}\" does not exist"
+  [ -d ${OUTPUT3} ] || echo_error "Directory with output from build 3 \"${OUTPUT3}\" does not exist"
+  [ -d ${OUTPUT2}/packages/ ] || echo_error "Directory with packages from build 2 \"${OUTPUT2}/packages/\" does not exist"
+  [ -d ${OUTPUT3}/packages/ ] || echo_error "Directory with packages from build 3 \"${OUTPUT3}/packages/\" does not exist"
+  i=0
+  find ${OUTPUT2}/packages/ -name latest | sed "s#${OUTPUT2}/##g" | while read pkg; do
+    max_pkg=${OUTPUT2}/${pkg}
+    min_pkg=${OUTPUT3}/${pkg}
+    if [ ! -f "${min_pkg}" ] ; then
+      echo "ERROR: ${min_pkg} doesn't exist" | tee ${OUTPUT_FILE}
+    fi
+    # strip version information in parenthesis
+    max_deps=`grep "^RDEPENDS = " ${max_pkg} | sed 's/^RDEPENDS = / /g; s/$/ /g; s/([^(]*)//g'`
+    min_deps=`grep "^RDEPENDS = " ${min_pkg} | sed 's/^RDEPENDS = / /g; s/$/ /g; s/([^(]*)//g'`
+    if [ "$i" = 100 ] ; then
+      echo -n "." # cheap progressbar
+      i=0
+    fi
+    if [ "${max_deps}" = "${min_deps}" ] ; then
+      # it's annoying long, but at least it's showing some progress, warnings are grepped at the end
+      echo "NOTE: ${pkg} dependencies weren't changed" >> ${OUTPUT_FILE}
+    else
+      missing_deps=
+      for dep in ${max_deps}; do
+        echo "${min_deps}" | grep -q " ${dep} " || missing_deps="${missing_deps} ${dep}"
+      done
+      if [ -n "${missing_deps}" ] ; then
+        echo # to get rid of dots on last line
+        echo "WARN: ${pkg} lost dependency on ${missing_deps}" | tee -a ${OUTPUT_FILE}
+      fi
+    fi
+    i=`expr $i + 1`
+  done
+  echo # to get rid of dots on last line
+  echo "Found differences: "
+  grep "^WARN: " ${OUTPUT_FILE}
+}
+
+for TYPE in $buildtype; do
+  case ${TYPE} in
+    1) build_all;;
+    2) build_every_recipe_max;;
+    3) build_every_recipe_min;;
+    4) build_every_recipe_min;;
+    c) compare_deps;;
+    *) echo_error "Invalid buildtype \"$TYPE\""
+  esac
+done
-- 
1.8.2.1


