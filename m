Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 448B765D20
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jun 2014 17:06:40 +0000 (UTC)
Received: by mail-wg0-f50.google.com with SMTP id m15so2262721wgh.33
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jun 2014 10:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=w7UV6qeIWfrba1T9n0JX6V0WN5MwUCzVvTpPJV+kFdI=;
	b=l+95IQdxcjeGb+gkc69fjB4VJ+atJMeT89kaNGPK3gRWHx/LZZa/x6ZlmO47otCz/o
	4ZAtfkOfIasEYSBvS8XJJ8nmGn/ZiIWRnS2UI6EqTyg58AxrAr5HJqZZIeT4YeIt1HOl
	G7vZyhbUUFma45X3m21rCVtCb37qHqVtGFZcZhcvy2grU6q3pUL82RTPCGCYp0Lu6uPu
	6PjUfgcrmDTGLqqHMrXxlQdOrXgRYANZhC2m0DGorg3lRPnIsOcZH1zaNZf1krkR8baf
	doupbpMJzgcjwhPn0NmKaOJO8uChEjt5KXOe/zmPvhTvlChTUse2DLIM26Sh+Ey+R4nS
	AdMw==
X-Received: by 10.194.189.81 with SMTP id gg17mr11275117wjc.107.1403715999076; 
	Wed, 25 Jun 2014 10:06:39 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	f6sm55699769wiy.19.2014.06.25.10.06.38 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 Jun 2014 10:06:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jun 2014 19:06:36 +0200
Message-Id: <1403715997-3389-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
Subject: [PATCH 1/2] sstate-diff-machines.sh: Return non-zero return code when there was some failure detected
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
X-List-Received-Date: Wed, 25 Jun 2014 17:06:43 -0000

* add --analyze option, which is useful when using from jenkins job
  where you don't want to read output just to dectect how bad it was
* I was always using something like this inside jenkins job, but better
  to share it in original script

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 scripts/sstate-diff-machines.sh | 85 ++++++++++++++++++++++++++++++++++++-----
 1 file changed, 75 insertions(+), 10 deletions(-)

diff --git a/scripts/sstate-diff-machines.sh b/scripts/sstate-diff-machines.sh
index 860be73..056aa0a 100755
--- a/scripts/sstate-diff-machines.sh
+++ b/scripts/sstate-diff-machines.sh
@@ -1,7 +1,8 @@
-#!/bin/sh
+#!/bin/bash
 
-# Used to compare sstate checksums between MACHINES
-# Execute script and compare generated list.M files
+# Used to compare sstate checksums between MACHINES.
+# Execute script and compare generated list.M files.
+# Using bash to have PIPESTATUS variable.
 
 # It's also usefull to keep older sstate checksums
 # to be able to find out why something is rebuilding
@@ -27,6 +28,7 @@ machines=
 targets=
 default_machines="qemuarm qemux86 qemux86-64"
 default_targets="core-image-base"
+analyze="N"
 
 usage () {
   cat << EOF
@@ -48,6 +50,12 @@ Options:
   --targets=<targets>
         List of targets separated by space, will use the environment variable TARGETS if it is not specified.
         Default value is "core-image-base".
+
+  --analyze
+        Show the differences between MACHINEs. It assumes:
+        * First 2 MACHINEs in --machines parameter have the same TUNE_PKGARCH
+        * Third optional MACHINE has different TUNE_PKGARCH - only native and allarch recipes are compared).
+        * Next MACHINEs are ignored
 EOF
 }
 
@@ -72,6 +80,10 @@ while [ -n "$1" ]; do
       targets=`echo $1 | sed -e 's#^--targets="*\([^"]*\)"*#\1#'`
       shift
         ;;
+    --analyze)
+      analyze="Y"
+      shift
+        ;;
     --help|-h)
       usage
       exit 0
@@ -94,14 +106,67 @@ done
 [ -n "$targets" ] || targets=$default_targets
 
 OUTPUT=${tmpdir}/sstate-diff/`date "+%s"`
+declare -i RESULT=0
 
 for M in ${machines}; do
-  find ${tmpdir}/stamps/ -name \*sigdata\* | xargs rm -f
+  [ -d ${tmpdir}/stamps/ ] && find ${tmpdir}/stamps/ -name \*sigdata\* | xargs rm -f
   mkdir -p ${OUTPUT}/${M}
-  export MACHINE=${M}; bitbake -S none ${targets} | tee -a ${OUTPUT}/${M}/log;
-  cp -ra ${tmpdir}/stamps/* ${OUTPUT}/${M}
-  find ${OUTPUT}/${M} -name \*sigdata\* | sed "s#${OUTPUT}/${M}/##g" | sort > ${OUTPUT}/${M}/list
-  M_UNDERSCORE=`echo ${M} | sed 's/-/_/g'`
-  sed "s/${M_UNDERSCORE}/MACHINE/g; s/${M}/MACHINE/g" ${OUTPUT}/${M}/list | sort > ${OUTPUT}/${M}/list.M
-  find ${tmpdir}/stamps/ -name \*sigdata\* | xargs rm -f
+  export MACHINE=${M}
+  bitbake -S none ${targets} 2>&1 | tee -a ${OUTPUT}/${M}/log;
+  RESULT+=${PIPESTATUS[0]}
+  if ls ${tmpdir}/stamps/* >/dev/null 2>/dev/null ; then
+    cp -ra ${tmpdir}/stamps/* ${OUTPUT}/${M}
+    find ${OUTPUT}/${M} -name \*sigdata\* | sed "s#${OUTPUT}/${M}/##g" | sort > ${OUTPUT}/${M}/list
+    M_UNDERSCORE=`echo ${M} | sed 's/-/_/g'`
+    sed "s/${M_UNDERSCORE}/MACHINE/g; s/${M}/MACHINE/g" ${OUTPUT}/${M}/list | sort > ${OUTPUT}/${M}/list.M
+    find ${tmpdir}/stamps/ -name \*sigdata\* | xargs rm -f
+  else
+    printf "ERROR: no sigdata files were generated for MACHINE $M in ${tmpdir}/stamps\n";
+  fi
 done
+
+function compareSignatures() {
+  MACHINE1=$1
+  MACHINE2=$2
+  PATTERN="$3"
+  PRE_PATTERN=""
+  [ -n "${PATTERN}" ] || PRE_PATTERN="-v"
+  [ -n "${PATTERN}" ] || PATTERN="MACHINE"
+  for TASK in do_configure.sigdata do_populate_sysroot.sigdata do_package_write_ipk.sigdata; do
+    printf "\n\n === Comparing signatures for task ${TASK} between ${MACHINE1} and ${MACHINE2} ===\n" | tee -a ${OUTPUT}/signatures.${MACHINE2}.${TASK}.log
+    diff ${OUTPUT}/${MACHINE1}/list.M ${OUTPUT}/${MACHINE2}/list.M | grep ${PRE_PATTERN} "${PATTERN}" | grep ${TASK} > ${OUTPUT}/signatures.${MACHINE2}.${TASK}
+    for i in `cat ${OUTPUT}/signatures.${MACHINE2}.${TASK} | sed 's#[^/]*/\([^/]*\)/.*#\1#g' | sort -u | xargs`; do
+      [ -e ${OUTPUT}/${MACHINE1}/*/$i/*${TASK}* ] || echo "INFO: ${i} task ${TASK} doesn't exist in ${MACHINE1}" >&2
+      [ -e ${OUTPUT}/${MACHINE1}/*/$i/*${TASK}* ] || continue
+      [ -e ${OUTPUT}/${MACHINE2}/*/$i/*${TASK}* ] || echo "INFO: ${i} task ${TASK} doesn't exist in ${MACHINE2}" >&2
+      [ -e ${OUTPUT}/${MACHINE2}/*/$i/*${TASK}* ] || continue
+      printf "ERROR: $i different signature for task ${TASK} between ${MACHINE1} and ${MACHINE2}\n";
+      bitbake-diffsigs ${OUTPUT}/${MACHINE1}/*/$i/*${TASK}* ${OUTPUT}/${MACHINE2}/*/$i/*${TASK}*;
+      echo "$i" >> ${OUTPUT}/failed-recipes.log
+      echo
+    done | tee -a ${OUTPUT}/signatures.${MACHINE2}.${TASK}.log
+    # don't create empty files
+    ERRORS=`grep "^ERROR.*" ${OUTPUT}/signatures.${MACHINE2}.${TASK}.log | wc -l`
+    if [ "${ERRORS}" != "0" ] ; then
+      echo "ERROR: ${ERRORS} errors found in ${OUTPUT}/signatures.${MACHINE2}.${TASK}.log"
+      RESULT+=${ERRORS}
+    fi
+  done
+}
+
+function compareMachines() {
+  [ "$#" -ge 2 ] && compareSignatures $1 $2
+  [ "$#" -ge 3 ] && compareSignatures $1 $3 "\(^< all\)\|\(^< x86_64-linux\)\|\(^< i586-linux\)"
+}
+
+if [ "${analyze}" = "Y" ] ; then
+  compareMachines ${machines}
+fi
+
+if [ "${RESULT}" != "0" -a -f ${OUTPUT}/failed-recipes.log ] ; then
+  cat ${OUTPUT}/failed-recipes.log | sort -u >${OUTPUT}/failed-recipes.log.u && mv ${OUTPUT}/failed-recipes.log.u ${OUTPUT}/failed-recipes.log
+  echo "ERROR: ${RESULT} issues were found in these recipes: `cat ${OUTPUT}/failed-recipes.log | xargs`"
+fi
+
+echo "INFO: Output written in: ${OUTPUT}"
+exit ${RESULT}
-- 
2.0.0


