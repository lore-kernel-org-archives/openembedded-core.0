Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2D3B57451F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2018 14:07:09 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id q3-v6so43474878wrj.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2018 07:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=nDwOdFD9sCDXfrGIAN3+eGE46EwnqI43W9/BlSYAlWk=;
	b=Yb/M3+OyhaYtsUeUQxc+k+ohgiNi7MTc1ODsha0s9mdnktug12pd2lRU/0hyiOOGp5
	cFetVFkRWU+qOWsD1glArayx2l3jlGnyHmxEfPZi8qkRywXKujx5//I1iWkikofgcXz9
	lWK0U/moawj5/L1AZra7DhYW8ormaVY61YqnNzvfxjUaa9LFldjk4F4OApJF+IhnyU9P
	28NlhRu60k7ZIe0h3Pjg43vNnIUQCRxAl3+KWytgEbnKP3dRjrXnzWkk2ZZGkziYnOKo
	Tpjg7VXSuAl08J/45pvEcLrRuhNcb/7bwv5n6rSrNbLO4dWEuqsz0l0dFWK7J21bph+/
	fwvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=nDwOdFD9sCDXfrGIAN3+eGE46EwnqI43W9/BlSYAlWk=;
	b=XDK7H9BX7uji/4G8JORuwofg8hGxd5kuQ+xQAm6wfzr5q7tTs2oUlvH70cCSQTK8v9
	GIZmfGXNFshI/ALrga9YzQoCojXDMAX3dT3wgiKm9OCidRM37jpPm9Vq1l4onGLeA8st
	8T7IQrh8BMcnGRDkb8iZlAimlykFVEBeA66UQluu8v3JcB26edFbg/ibmxLafq01n4SF
	gGdLsp62XXDvQuSGTawgXkxL0T2dn6kKgf7v7+w97UjeTIMYFPNSWh/5d7jvn+/o2oo3
	1zdrbjEsmljtbz16QyhYJxx21FTBDb2RT8oAIhMjUWyq4pL60chlW+YC9ui3MP4D4W4P
	uDWA==
X-Gm-Message-State: ALQs6tAdY/NT8xl3WkbXC250YTbUtOC6CNDTv0ECgwhxyQyGzhntjrWP
	vs0g7hof80Ju/HPHWE9OmloJJQ==
X-Google-Smtp-Source: AIpwx481zRciLoEnRyogwQ/oRvZwhtf9GLv1b9/FJ5xmnQId3AfsJ0MPpY5sSU0sEQqUd+SiQvIkeg==
X-Received: by 2002:adf:d1cc:: with SMTP id
	m12-v6mr23888645wri.214.1524665230364; 
	Wed, 25 Apr 2018 07:07:10 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	i44-v6sm14531657wri.17.2018.04.25.07.07.09
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 25 Apr 2018 07:07:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 25 Apr 2018 14:07:05 +0000
Message-Id: <81da4ba239442ee5f27c29ad7d6e3e7e495d628c.1524665115.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1524665115.git.Martin.Jansa@gmail.com>
References: <cover.1524665115.git.Martin.Jansa@gmail.com>
Subject: [pyro][PATCH 3/3] scripts/test-dependencies.sh: remove
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
X-List-Received-Date: Wed, 25 Apr 2018 14:07:10 -0000

* with RSS used in pyro this script isn't very useful anymore
* RSS makes sure that the dependencies are almost always deterministic
  the only case known to me where dependencies are different based on
  what was already built in TMPDIR are runtime dependencies resolved
  by shlibs code in package.bbclass (which is using global pkgdata, not
  specific to given recipe and its RSS) as described here:
  https://bugzilla.yoctoproject.org/show_bug.cgi?id=9217#c4
  but for this case it's not worth running complete test-dependencies.sh
  runs

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 scripts/test-dependencies.sh | 286 -----------------------------------
 1 file changed, 286 deletions(-)
 delete mode 100755 scripts/test-dependencies.sh

diff --git a/scripts/test-dependencies.sh b/scripts/test-dependencies.sh
deleted file mode 100755
index 0b94de8608..0000000000
--- a/scripts/test-dependencies.sh
+++ /dev/null
@@ -1,286 +0,0 @@
-#!/bin/bash
-
-# Author: Martin Jansa <martin.jansa@gmail.com>
-#
-# Copyright (c) 2013 Martin Jansa <Martin.Jansa@gmail.com>
-
-# Used to detect missing dependencies or automagically
-# enabled dependencies which aren't explicitly enabled
-# or disabled. Using bash to have PIPESTATUS variable.
-
-# It does 3 builds of <target>
-# 1st to populate sstate-cache directory and sysroot
-# 2nd to rebuild each recipe with every possible
-#     dependency found in sysroot (which stays populated
-#     from 1st build
-# 3rd to rebuild each recipe only with dependencies defined
-#     in DEPENDS
-# 4th (optional) repeat build like 3rd to make sure that
-#     minimal versions of dependencies defined in DEPENDS
-#     is also enough
-
-# Global vars
-tmpdir=
-targets=
-recipes=
-buildhistory=
-buildtype=
-default_targets="world"
-default_buildhistory="buildhistory"
-default_buildtype="1 2 3 c"
-
-usage () {
-  cat << EOF
-Welcome to utility to detect missing or autoenabled dependencies.
-WARNING: this utility will completely remove your tmpdir (make sure
-         you don't have important buildhistory or persistent dir there).
-$0 <OPTION>
-
-Options:
-  -h, --help
-        Display this help and exit.
-
-  --tmpdir=<tmpdir>
-        Specify tmpdir, will use the environment variable TMPDIR if it is not specified.
-        Something like /OE/oe-core/tmp-eglibc (no / at the end).
-
-  --targets=<targets>
-        List of targets separated by space, will use the environment variable TARGETS if it is not specified.
-        It will run "bitbake <targets>" to populate sysroots.
-        Default value is "world".
-
-  --recipes=<recipes>
-        File with list of recipes we want to rebuild with minimal and maximal sysroot.
-        Will use the environment variable RECIPES if it is not specified.
-        Default value will use all packages ever recorded in buildhistory directory.
-
-  --buildhistory=<buildhistory>
-        Path to buildhistory directory, it needs to be enabled in your config,
-        because it's used to detect different dependencies and to create list
-        of recipes to rebuild when it's not specified.
-        Will use the environment variable BUILDHISTORY if it is not specified.
-        Default value is "buildhistory"
-
-  --buildtype=<buildtype>
-        There are 4 types of build:
-          1: build to populate sstate-cache directory and sysroot
-          2: build to rebuild each recipe with every possible dep
-          3: build to rebuild each recipe with minimal dependencies
-          4: build to rebuild each recipe again with minimal dependencies
-          c: compare buildhistory directories from build 2 and 3
-        Will use the environment variable BUILDTYPE if it is not specified.
-        Default value is "1 2 3 c", order is important, type 4 is optional.
-EOF
-}
-
-# Print error information and exit.
-echo_error () {
-  echo "ERROR: $1" >&2
-  exit 1
-}
-
-while [ -n "$1" ]; do
-  case $1 in
-    --tmpdir=*)
-      tmpdir=`echo $1 | sed -e 's#^--tmpdir=##' | xargs readlink -e`
-      [ -d "$tmpdir" ] || echo_error "Invalid argument to --tmpdir"
-      shift
-        ;;
-    --targets=*)
-      targets=`echo $1 | sed -e 's#^--targets="*\([^"]*\)"*#\1#'`
-      shift
-        ;;
-    --recipes=*)
-      recipes=`echo $1 | sed -e 's#^--recipes="*\([^"]*\)"*#\1#'`
-      shift
-        ;;
-    --buildhistory=*)
-      buildhistory=`echo $1 | sed -e 's#^--buildhistory="*\([^"]*\)"*#\1#'`
-      shift
-        ;;
-    --buildtype=*)
-      buildtype=`echo $1 | sed -e 's#^--buildtype="*\([^"]*\)"*#\1#'`
-      shift
-        ;;
-    --help|-h)
-      usage
-      exit 0
-        ;;
-    *)
-      echo "Invalid arguments $*"
-      echo_error "Try '$0 -h' for more information."
-        ;;
-  esac
-done
-
-# tmpdir directory, use environment variable TMPDIR
-# if it was not specified, otherwise, error.
-[ -n "$tmpdir" ] || tmpdir=$TMPDIR
-[ -n "$tmpdir" ] || echo_error "No tmpdir found!"
-[ -d "$tmpdir" ] || echo_error "Invalid tmpdir \"$tmpdir\""
-[ -n "$targets" ] || targets=$TARGETS
-[ -n "$targets" ] || targets=$default_targets
-[ -n "$recipes" ] || recipes=$RECIPES
-[ -n "$recipes" -a ! -f "$recipes" ] && echo_error "Invalid file with list of recipes to rebuild"
-[ -n "$recipes" ] || echo "All packages ever recorded in buildhistory directory will be rebuilt"
-[ -n "$buildhistory" ] || buildhistory=$BUILDHISTORY
-[ -n "$buildhistory" ] || buildhistory=$default_buildhistory
-[ -d "$buildhistory" ] || echo_error "Invalid buildhistory directory \"$buildhistory\""
-[ -n "$buildtype" ] || buildtype=$BUILDTYPE
-[ -n "$buildtype" ] || buildtype=$default_buildtype
-echo "$buildtype" | grep -v '^[1234c ]*$' && echo_error "Invalid buildtype \"$buildtype\", only some combination of 1, 2, 3, 4, c separated by space is allowed"
-
-OUTPUT_BASE=test-dependencies/`date "+%s"`
-declare -i RESULT=0
-
-build_all() {
-  echo "===== 1st build to populate sstate-cache directory and sysroot ====="
-  OUTPUT1=${OUTPUT_BASE}/${TYPE}_all
-  mkdir -p ${OUTPUT1}
-  echo "Logs will be stored in ${OUTPUT1} directory"
-  bitbake -k $targets 2>&1 | tee -a ${OUTPUT1}/complete.log
-  RESULT+=${PIPESTATUS[0]}
-  grep "ERROR: Task.*failed" ${OUTPUT1}/complete.log > ${OUTPUT1}/failed-tasks.log
-  cat ${OUTPUT1}/failed-tasks.log | sed 's@.*/@@g; s@_.*@@g; s@\.bb, .*@@g; s@\.bb:.*@@g' | sort -u > ${OUTPUT1}/failed-recipes.log
-}
-
-build_every_recipe() {
-  if [ "${TYPE}" = "2" ] ; then
-    echo "===== 2nd build to rebuild each recipe with every possible dep ====="
-    OUTPUT_MAX=${OUTPUT_BASE}/${TYPE}_max
-    OUTPUTB=${OUTPUT_MAX}
-  else
-    echo "===== 3rd or 4th build to rebuild each recipe with minimal dependencies ====="
-    OUTPUT_MIN=${OUTPUT_BASE}/${TYPE}_min
-    OUTPUTB=${OUTPUT_MIN}
-  fi
-
-  mkdir -p ${OUTPUTB} ${OUTPUTB}/failed ${OUTPUTB}/ok
-  echo "Logs will be stored in ${OUTPUTB} directory"
-  if [ -z "$recipes" ]; then
-    ls -d $buildhistory/packages/*/* | xargs -n 1 basename | sort -u > ${OUTPUTB}/recipe.list
-    recipes=${OUTPUTB}/recipe.list
-  fi
-  if [ "${TYPE}" != "2" ] ; then
-    echo "!!!Removing tmpdir \"$tmpdir\"!!!"
-    rm -rf $tmpdir/deploy $tmpdir/pkgdata $tmpdir/sstate-control $tmpdir/stamps $tmpdir/sysroots $tmpdir/work $tmpdir/work-shared 2>/dev/null
-  fi
-  i=1
-  count=`cat $recipes ${OUTPUT1}/failed-recipes.log | sort -u | wc -l`
-  for recipe in `cat $recipes ${OUTPUT1}/failed-recipes.log | sort -u`; do
-    echo "Building recipe: ${recipe} ($i/$count)"
-    declare -i RECIPE_RESULT=0
-    bitbake -c cleansstate ${recipe} > ${OUTPUTB}/${recipe}.log 2>&1;
-    RECIPE_RESULT+=$?
-    bitbake ${recipe} >> ${OUTPUTB}/${recipe}.log 2>&1;
-    RECIPE_RESULT+=$?
-    if [ "${RECIPE_RESULT}" != "0" ] ; then
-      RESULT+=${RECIPE_RESULT}
-      mv ${OUTPUTB}/${recipe}.log ${OUTPUTB}/failed/
-      grep "ERROR: Task.*failed"  ${OUTPUTB}/failed/${recipe}.log | tee -a ${OUTPUTB}/failed-tasks.log
-      grep "ERROR: Task.*failed"  ${OUTPUTB}/failed/${recipe}.log | sed 's@.*/@@g; s@_.*@@g; s@\.bb, .*@@g; s@\.bb:.*@@g' >> ${OUTPUTB}/failed-recipes.log
-      # and append also ${recipe} in case the failed task was from some dependency
-      echo ${recipe} >> ${OUTPUTB}/failed-recipes.log
-    else
-      mv ${OUTPUTB}/${recipe}.log ${OUTPUTB}/ok/
-    fi
-    if [ "${TYPE}" != "2" ] ; then
-      rm -rf $tmpdir/deploy $tmpdir/pkgdata $tmpdir/sstate-control $tmpdir/stamps $tmpdir/sysroots $tmpdir/work $tmpdir/work-shared 2>/dev/null
-    fi
-    i=`expr $i + 1`
-  done
-  echo "Copying buildhistory/packages to ${OUTPUTB}"
-  cp -ra $buildhistory/packages ${OUTPUTB}
-  # This will be usefull to see which library is pulling new dependency
-  echo "Copying do_package logs to ${OUTPUTB}/do_package/"
-  mkdir ${OUTPUTB}/do_package
-  find $tmpdir/work/ -name log.do_package 2>/dev/null| while read f; do
-    # pn is 3 levels back, but we don't know if there is just one log per pn (only one arch and version)
-    # dest=`echo $f | sed 's#^.*/\([^/]*\)/\([^/]*\)/\([^/]*\)/log.do_package#\1#g'`
-    dest=`echo $f | sed "s#$tmpdir/work/##g; s#/#_#g"`
-    cp $f ${OUTPUTB}/do_package/$dest
-  done
-}
-
-compare_deps() {
-  # you can run just compare task with command like this
-  # OUTPUT_BASE=test-dependencies/1373140172 \
-  # OUTPUT_MAX=${OUTPUT_BASE}/2_max \
-  # OUTPUT_MIN=${OUTPUT_BASE}/3_min \
-  # openembedded-core/scripts/test-dependencies.sh --tmpdir=tmp-eglibc --targets=glib-2.0 --recipes=recipe_list --buildtype=c
-  echo "===== Compare dependencies recorded in \"${OUTPUT_MAX}\" and \"${OUTPUT_MIN}\" ====="
-  [ -n "${OUTPUTC}" ] || OUTPUTC=${OUTPUT_BASE}/comp
-  mkdir -p ${OUTPUTC}
-  OUTPUT_FILE=${OUTPUTC}/dependency-changes
-  echo "Differences will be stored in ${OUTPUT_FILE}, dot is shown for every 100 of checked packages"
-  echo > ${OUTPUT_FILE}
-
-  [ -d ${OUTPUT_MAX} ] || echo_error "Directory with output from build 2 \"${OUTPUT_MAX}\" does not exist"
-  [ -d ${OUTPUT_MIN} ] || echo_error "Directory with output from build 3 \"${OUTPUT_MIN}\" does not exist"
-  [ -d ${OUTPUT_MAX}/packages/ ] || echo_error "Directory with packages from build 2 \"${OUTPUT_MAX}/packages/\" does not exist"
-  [ -d ${OUTPUT_MIN}/packages/ ] || echo_error "Directory with packages from build 3 \"${OUTPUT_MIN}/packages/\" does not exist"
-  i=0
-  find ${OUTPUT_MAX}/packages/ -name latest | sed "s#${OUTPUT_MAX}/##g" | while read pkg; do
-    max_pkg=${OUTPUT_MAX}/${pkg}
-    min_pkg=${OUTPUT_MIN}/${pkg}
-    # pkg=packages/armv5te-oe-linux-gnueabi/libungif/libungif/latest
-    recipe=`echo "${pkg}" | sed 's#packages/[^/]*/\([^/]*\)/\([^/]*\)/latest#\1#g'`
-    package=`echo "${pkg}" | sed 's#packages/[^/]*/\([^/]*\)/\([^/]*\)/latest#\2#g'`
-    if [ ! -f "${min_pkg}" ] ; then
-      echo "ERROR: ${recipe}: ${package} package isn't created when building with minimal dependencies?" | tee -a ${OUTPUT_FILE}
-      echo ${recipe} >> ${OUTPUTC}/failed-recipes.log
-      continue
-    fi
-    # strip version information in parenthesis
-    max_deps=`grep "^RDEPENDS = " ${max_pkg} | sed 's/^RDEPENDS = / /g; s/$/ /g; s/([^(]*)//g'`
-    min_deps=`grep "^RDEPENDS = " ${min_pkg} | sed 's/^RDEPENDS = / /g; s/$/ /g; s/([^(]*)//g'`
-    if [ "$i" = 100 ] ; then
-      echo -n "." # cheap progressbar
-      i=0
-    fi
-    if [ "${max_deps}" = "${min_deps}" ] ; then
-      # it's annoying long, but at least it's showing some progress, warnings are grepped at the end
-      echo "NOTE: ${recipe}: ${package} rdepends weren't changed" >> ${OUTPUT_FILE}
-    else
-      missing_deps=
-      for dep in ${max_deps}; do
-        if ! echo "${min_deps}" | grep -q " ${dep} " ; then
-          missing_deps="${missing_deps} ${dep}"
-          echo # to get rid of dots on last line
-          echo "WARN: ${recipe}: ${package} rdepends on ${dep}, but it isn't a build dependency?" | tee -a ${OUTPUT_FILE}
-        fi
-      done
-      if [ -n "${missing_deps}" ] ; then
-        echo ${recipe} >> ${OUTPUTC}/failed-recipes.log
-      fi
-    fi
-    i=`expr $i + 1`
-  done
-  echo # to get rid of dots on last line
-  echo "Found differences: "
-  grep "^WARN: " ${OUTPUT_FILE} | tee ${OUTPUT_FILE}.warn.log
-  echo "Found errors: "
-  grep "^ERROR: " ${OUTPUT_FILE} | tee ${OUTPUT_FILE}.error.log
-  RESULT+=`cat ${OUTPUT_FILE}.warn.log | wc -l`
-  RESULT+=`cat ${OUTPUT_FILE}.error.log | wc -l`
-}
-
-for TYPE in $buildtype; do
-  case ${TYPE} in
-    1) build_all;;
-    2) build_every_recipe;;
-    3) build_every_recipe;;
-    4) build_every_recipe;;
-    c) compare_deps;;
-    *) echo_error "Invalid buildtype \"$TYPE\""
-  esac
-done
-
-cat ${OUTPUT_BASE}/*/failed-recipes.log | sort -u >> ${OUTPUT_BASE}/failed-recipes.log
-
-if [ "${RESULT}" != "0" ] ; then
-  echo "ERROR: ${RESULT} issues were found in these recipes: `cat ${OUTPUT_BASE}/failed-recipes.log | xargs`"
-fi
-
-echo "INFO: Output written in: ${OUTPUT_BASE}"
-exit ${RESULT}
-- 
2.17.0


