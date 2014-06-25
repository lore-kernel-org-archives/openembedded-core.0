Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 6C89E65E71
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jun 2014 17:06:44 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id cc10so8182030wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jun 2014 10:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=f+JbXfnk5nMUNAlhm7jMQ6HyT8WGEQopjbMefGAYw74=;
	b=xNj0BV1RS0Gc2EWWZDZc0L1FnTBJK9RjFOYkbVLWHW9V0lcfp6rvYC8o4ciEg4rooN
	AGkSOgrISUDa9j1jH4Cn4pgB6LRsT2OPOMRvK0RFRhUXOh1NNxLqBpNvsuhCZxAH32kS
	ZFttvz13kZaONtcvqnAEhR1FORas23BdjtbwoSAwuAicdRgeXb6LwvnwgZOXhpGNKu2c
	nTUvhbA9wc4o/DfcjTXN2saI7Mz+H30XjvmRb1Kiw2R4hOyfv+lFBmVGeRXFeFu0LvW3
	R+iNY/ABH+SPU/j/BdtkYRi4FoyolTcwmhjOswAUXR3A8GFvQKYtw0k5fhB2AE8iXlJX
	VEUg==
X-Received: by 10.180.79.168 with SMTP id k8mr42940064wix.35.1403716001726;
	Wed, 25 Jun 2014 10:06:41 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	h3sm8586650wjz.48.2014.06.25.10.06.40 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 Jun 2014 10:06:41 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jun 2014 19:06:37 +0200
Message-Id: <1403715997-3389-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1403715997-3389-1-git-send-email-Martin.Jansa@gmail.com>
References: <1403715997-3389-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] test-dependencies.sh: Return non-zero return code when there was some failure detected
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
X-List-Received-Date: Wed, 25 Jun 2014 17:06:46 -0000

* this is useful when using from jenkins job where you don't want to read
  output just to dectect how bad it was
* add .log suffix to all files, so they can be easily downloaded from
  http servers without default mimetype set to something useful
* add recipes failed in step 1 to steps 2 and 3 to generate standalone
  logs for them

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 scripts/test-dependencies.sh | 52 +++++++++++++++++++++++++++++++++-----------
 1 file changed, 39 insertions(+), 13 deletions(-)

diff --git a/scripts/test-dependencies.sh b/scripts/test-dependencies.sh
index d3212c4..6ebfd3e 100755
--- a/scripts/test-dependencies.sh
+++ b/scripts/test-dependencies.sh
@@ -1,4 +1,4 @@
-#!/bin/sh
+#!/bin/bash
 
 # Author: Martin Jansa <martin.jansa@gmail.com>
 #
@@ -6,7 +6,7 @@
 
 # Used to detect missing dependencies or automagically
 # enabled dependencies which aren't explicitly enabled
-# or disabled.
+# or disabled. Using bash to have PIPESTATUS variable.
 
 # It does 3 builds of <target>
 # 1st to populate sstate-cache directory and sysroot
@@ -131,6 +131,7 @@ done
 echo "$buildtype" | grep -v '^[1234c ]*$' && echo_error "Invalid buildtype \"$buildtype\", only some combination of 1, 2, 3, 4, c separated by space is allowed"
 
 OUTPUT_BASE=test-dependencies/`date "+%s"`
+declare -i RESULT=0
 
 build_all() {
   echo "===== 1st build to populate sstate-cache directory and sysroot ====="
@@ -138,6 +139,9 @@ build_all() {
   mkdir -p ${OUTPUT1}
   echo "Logs will be stored in ${OUTPUT1} directory"
   bitbake -k $targets 2>&1 | tee -a ${OUTPUT1}/complete.log
+  RESULT+=${PIPESTATUS[0]}
+  grep "ERROR: Task.*failed" ${OUTPUT1}/complete.log > ${OUTPUT1}/failed-tasks.log
+  cat ${OUTPUT1}/failed-tasks.log | sed 's@.*/@@g; s@_.*@@g; s@\..*@@g' | sort -u > ${OUTPUT1}/failed-recipes.log
 }
 
 build_every_recipe() {
@@ -162,12 +166,24 @@ build_every_recipe() {
     rm -rf $tmpdir/deploy $tmpdir/pkgdata $tmpdir/sstate-control $tmpdir/stamps $tmpdir/sysroots $tmpdir/work $tmpdir/work-shared 2>/dev/null
   fi
   i=1
-  count=`cat $recipes | wc -l`
-  for recipe in `cat $recipes`; do
+  count=`cat $recipes ${OUTPUT1}/failed-recipes.log | sort -u | wc -l`
+  for recipe in `cat $recipes ${OUTPUT1}/failed-recipes.log | sort -u`; do
     echo "Building recipe: ${recipe} ($i/$count)"
-    bitbake -c cleansstate ${recipe} > ${OUTPUTB}/log.${recipe} 2>&1;
-    bitbake ${recipe} >> ${OUTPUTB}/log.${recipe} 2>&1;
-    grep "ERROR: Task.*failed" ${OUTPUTB}/log.${recipe} && mv ${OUTPUTB}/log.${recipe} ${OUTPUTB}/failed/${recipe} || mv ${OUTPUTB}/log.${recipe} ${OUTPUTB}/ok/${recipe}
+    declare -i RECIPE_RESULT=0
+    bitbake -c cleansstate ${recipe} > ${OUTPUTB}/${recipe}.log 2>&1;
+    RECIPE_RESULT+=$?
+    bitbake ${recipe} >> ${OUTPUTB}/${recipe}.log 2>&1;
+    RECIPE_RESULT+=$?
+    if [ "${RECIPE_RESULT}" != "0" ] ; then
+      RESULT+=${RECIPE_RESULT}
+      mv ${OUTPUTB}/${recipe}.log ${OUTPUTB}/failed/
+      grep "ERROR: Task.*failed"  ${OUTPUTB}/failed/${recipe}.log | tee -a ${OUTPUTB}/failed-tasks.log
+      grep "ERROR: Task.*failed"  ${OUTPUTB}/failed/${recipe}.log | sed 's@.*/@@g; s@_.*@@g; s@\..*@@g' >> ${OUTPUTB}/failed-recipes.log
+      # and append also ${recipe} in case the failed task was from some dependency
+      echo ${recipe} >> ${OUTPUTB}/failed-recipes.log
+    else
+      mv ${OUTPUTB}/${recipe}.log ${OUTPUTB}/ok/
+    fi
     if [ "${TYPE}" != "2" ] ; then
       rm -rf $tmpdir/deploy $tmpdir/pkgdata $tmpdir/sstate-control $tmpdir/stamps $tmpdir/sysroots $tmpdir/work $tmpdir/work-shared 2>/dev/null
     fi
@@ -184,8 +200,6 @@ build_every_recipe() {
     dest=`echo $f | sed "s#$tmpdir/work/##g; s#/#_#g"`
     cp $f ${OUTPUTB}/do_package/$dest
   done
-  grep "ERROR: Task.*failed" ${OUTPUTB}/failed/* 2>/dev/null
-  ls -1 ${OUTPUTB}/failed/* >> ${OUTPUT_BASE}/failed.recipes 2>/dev/null
 }
 
 compare_deps() {
@@ -209,8 +223,10 @@ compare_deps() {
   find ${OUTPUT_MAX}/packages/ -name latest | sed "s#${OUTPUT_MAX}/##g" | while read pkg; do
     max_pkg=${OUTPUT_MAX}/${pkg}
     min_pkg=${OUTPUT_MIN}/${pkg}
+    recipe=`echo "${pkg}" | sed 's#/.*##g'`
     if [ ! -f "${min_pkg}" ] ; then
       echo "ERROR: ${min_pkg} doesn't exist" | tee -a ${OUTPUT_FILE}
+      echo ${recipe} >> ${OUTPUTC}/failed-recipes.log
       continue
     fi
     # strip version information in parenthesis
@@ -231,17 +247,18 @@ compare_deps() {
       if [ -n "${missing_deps}" ] ; then
         echo # to get rid of dots on last line
         echo "WARN: ${pkg} lost dependency on ${missing_deps}" | tee -a ${OUTPUT_FILE}
+        echo ${recipe} >> ${OUTPUTC}/failed-recipes.log
       fi
     fi
     i=`expr $i + 1`
   done
   echo # to get rid of dots on last line
   echo "Found differences: "
-  grep "^WARN: " ${OUTPUT_FILE} | tee ${OUTPUT_FILE}.warn
+  grep "^WARN: " ${OUTPUT_FILE} | tee ${OUTPUT_FILE}.warn.log
   echo "Found errors: "
-  grep "^ERROR: " ${OUTPUT_FILE} | tee ${OUTPUT_FILE}.error
-  # useful for reexecuting this script with only small subset of recipes with known issues
-  sed 's#.*[ /]packages/\([^/]*\)/\([^/]*\)/.*#\2#g' ${OUTPUT_FILE}.warn ${OUTPUT_FILE}.error | sort -u >> ${OUTPUT_BASE}/failed.recipes
+  grep "^ERROR: " ${OUTPUT_FILE} | tee ${OUTPUT_FILE}.error.log
+  RESULT+=`cat ${OUTPUT_FILE}.warn.log | wc -l`
+  RESULT+=`cat ${OUTPUT_FILE}.error.log | wc -l`
 }
 
 for TYPE in $buildtype; do
@@ -254,3 +271,12 @@ for TYPE in $buildtype; do
     *) echo_error "Invalid buildtype \"$TYPE\""
   esac
 done
+
+cat ${OUTPUT_BASE}/*/failed-recipes.log | sort -u > ${OUTPUT_BASE}/failed-recipes.log
+
+if [ "${RESULT}" != "0" ] ; then
+  echo "ERROR: ${RESULT} issues were found in these recipes: `cat ${OUTPUT_BASE}/failed-recipes.log | xargs`"
+fi
+
+echo "INFO: Output written in: ${OUTPUT_BASE}"
+exit ${RESULT}
-- 
2.0.0


