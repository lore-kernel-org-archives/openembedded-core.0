Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 859FA60017
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Aug 2014 14:11:04 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id bs8so1420497wib.14
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Aug 2014 07:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=/rGtdyfP848LKUu6RphTg2CwkaLk5B6RKSB2I3FxAlM=;
	b=F/cvmPqAR0RRdPktANTiwEj+uns0wrIBw8dnTVOxDSmHmWMAxKRzDtafcV2hwOBLSO
	SGd1Q8seOfhEZtbkjjTHpeqCWhYvYWZqCZaXj6RApZZQXJ6PsMkVDyOm4ql7QeXVQOEl
	Mgr5W1jRLUIBt3DCkBwU9QKHsW2VusOth+DN+XCOkhBS8ETAGNcXRN2piUdSzF8MKqkh
	G66PSPLcj75wOLTEVA2h57DqTtuEjWbWhGKs8H82PikHVFtR98vIQ9bCw2pxDJAUajwk
	ayybOU/a9t6oi9bV6WOy75jYEYlgXPjjawt01UHiShzSqUQJPZuB+harASpFlyGnBjE5
	5K8A==
X-Received: by 10.195.13.79 with SMTP id ew15mr7973759wjd.19.1406902263403;
	Fri, 01 Aug 2014 07:11:03 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	sa4sm21194843wjb.45.2014.08.01.07.11.02 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Aug 2014 07:11:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Aug 2014 16:11:25 +0200
Message-Id: <1406902285-9277-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.2
Subject: [PATCH] test-dependencies: don't override failed-recipes.log
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
X-List-Received-Date: Fri, 01 Aug 2014 14:11:11 -0000

* when dependency changes are reported in OUTPUTC/failed-recipes.log
  it can be the same as final output file which is later overwritten
  because OUTPUTC == OUTPUT_BASE by default
* use similar format for messages as insane_qa check

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 scripts/test-dependencies.sh | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/scripts/test-dependencies.sh b/scripts/test-dependencies.sh
index 6ebfd3e..ecbb710 100755
--- a/scripts/test-dependencies.sh
+++ b/scripts/test-dependencies.sh
@@ -209,7 +209,7 @@ compare_deps() {
   # OUTPUT_MIN=${OUTPUT_BASE}/3_min \
   # openembedded-core/scripts/test-dependencies.sh --tmpdir=tmp-eglibc --targets=glib-2.0 --recipes=recipe_list --buildtype=c
   echo "===== Compare dependencies recorded in \"${OUTPUT_MAX}\" and \"${OUTPUT_MIN}\" ====="
-  [ -n "${OUTPUTC}" ] || OUTPUTC=${OUTPUT_BASE}
+  [ -n "${OUTPUTC}" ] || OUTPUTC=${OUTPUT_BASE}/comp
   mkdir -p ${OUTPUTC}
   OUTPUT_FILE=${OUTPUTC}/dependency-changes
   echo "Differences will be stored in ${OUTPUT_FILE}, dot is shown for every 100 of checked packages"
@@ -223,9 +223,11 @@ compare_deps() {
   find ${OUTPUT_MAX}/packages/ -name latest | sed "s#${OUTPUT_MAX}/##g" | while read pkg; do
     max_pkg=${OUTPUT_MAX}/${pkg}
     min_pkg=${OUTPUT_MIN}/${pkg}
-    recipe=`echo "${pkg}" | sed 's#/.*##g'`
+    # pkg=packages/armv5te-oe-linux-gnueabi/libungif/libungif/latest
+    recipe=`echo "${pkg}" | sed 's#packages/[^/]*/\([^/]*\)/\([^/]*\)/latest#\1#g'`
+    package=`echo "${pkg}" | sed 's#packages/[^/]*/\([^/]*\)/\([^/]*\)/latest#\2#g'`
     if [ ! -f "${min_pkg}" ] ; then
-      echo "ERROR: ${min_pkg} doesn't exist" | tee -a ${OUTPUT_FILE}
+      echo "ERROR: ${recipe}: ${package} package isn't created when building with minimal dependencies?" | tee -a ${OUTPUT_FILE}
       echo ${recipe} >> ${OUTPUTC}/failed-recipes.log
       continue
     fi
@@ -238,15 +240,15 @@ compare_deps() {
     fi
     if [ "${max_deps}" = "${min_deps}" ] ; then
       # it's annoying long, but at least it's showing some progress, warnings are grepped at the end
-      echo "NOTE: ${pkg} dependencies weren't changed" >> ${OUTPUT_FILE}
+      echo "NOTE: ${recipe}: ${package} rdepends weren't changed" >> ${OUTPUT_FILE}
     else
       missing_deps=
       for dep in ${max_deps}; do
         echo "${min_deps}" | grep -q " ${dep} " || missing_deps="${missing_deps} ${dep}"
+        echo # to get rid of dots on last line
+        echo "WARN: ${recipe}: ${package} rdepends on ${dep} but its not a build dependency?" | tee -a ${OUTPUT_FILE}
       done
       if [ -n "${missing_deps}" ] ; then
-        echo # to get rid of dots on last line
-        echo "WARN: ${pkg} lost dependency on ${missing_deps}" | tee -a ${OUTPUT_FILE}
         echo ${recipe} >> ${OUTPUTC}/failed-recipes.log
       fi
     fi
@@ -272,7 +274,7 @@ for TYPE in $buildtype; do
   esac
 done
 
-cat ${OUTPUT_BASE}/*/failed-recipes.log | sort -u > ${OUTPUT_BASE}/failed-recipes.log
+cat ${OUTPUT_BASE}/*/failed-recipes.log | sort -u >> ${OUTPUT_BASE}/failed-recipes.log
 
 if [ "${RESULT}" != "0" ] ; then
   echo "ERROR: ${RESULT} issues were found in these recipes: `cat ${OUTPUT_BASE}/failed-recipes.log | xargs`"
-- 
2.0.2


