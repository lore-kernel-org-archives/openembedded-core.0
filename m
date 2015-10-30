Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4DE5A75D4A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Oct 2015 14:49:55 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t9UEnubD022133 for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Oct 2015 09:49:56 -0500
Received: from adi-pc-linux.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015103009495583-1110411 ;
	Fri, 30 Oct 2015 09:49:55 -0500 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Oct 2015 16:49:54 +0200
Message-Id: <1446216594-18616-1-git-send-email-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.1.4
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 10/30/2015 09:49:56 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 10/30/2015 09:49:56 AM,
	Serialize complete at 10/30/2015 09:49:56 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-10-30_10:, , signatures=0
Subject: [PATCH 1/1] ptest-runner: Allow running of specific tests
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
X-List-Received-Date: Fri, 30 Oct 2015 14:49:57 -0000

By default ptest-runner executes all ptests found in a system.
With this change, ptest-runner can be given a list of ptest
package names to run (the default is still available).

For example, to run only the zlib and rt-tests ptests:
"ptest-runner zlib rt-tests"

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 .../ptest-runner/files/ptest-runner                | 53 ++++++++++++++++------
 1 file changed, 40 insertions(+), 13 deletions(-)
 mode change 100644 => 100755 meta/recipes-support/ptest-runner/files/ptest-runner

diff --git a/meta/recipes-support/ptest-runner/files/ptest-runner b/meta/recipes-support/ptest-runner/files/ptest-runner
old mode 100644
new mode 100755
index c618f11..204cbdf
--- a/meta/recipes-support/ptest-runner/files/ptest-runner
+++ b/meta/recipes-support/ptest-runner/files/ptest-runner
@@ -1,26 +1,53 @@
 #!/bin/sh
-ANYFAILED=no
-echo "START: $0"
 
-for libdir in /usr/lib*
-do
+determine_ptests_to_run()
+{
+    for libdir in /usr/lib*
+    do
+	[ ! -d "$libdir" ] && continue
 
-    [ ! -d "$libdir" ] && continue
+	for x in `ls -d $libdir/*/ptest 2>/dev/null`
+	do
+	    [ ! -f $x/run-ptest ] && continue
+            [ -h `dirname $x` ] && continue
 
-    for x in `ls -d $libdir/*/ptest 2>/dev/null`
-    do
-        [ ! -f $x/run-ptest ] && continue
-        [ -h `dirname $x` ] && continue
+	    #found a ptest in the system
+	    PTEST_FOUND=$(basename $(dirname $x))
+
+	    # when no pkg-names were specified, by default run each one
+	    if [[ -z $@ ]]; then
+		printf " $x"
+	    else
+		#check if this ptest has been asked for and add it
+		if [[ $@ =~ $PTEST_FOUND ]]; then
+			printf " $x"
+		fi
+	    fi
+	done
+    done
+}
 
+run_ptests()
+{
+    ANYFAILED=no
+
+    #the paths were sanity-checked in determine_ptests_to_run()
+    for ptst_path in $PTESTS_TO_RUN
+    do
         date "+%Y-%m-%dT%H:%M"
-        echo "BEGIN: $x"
-        cd "$x"
+        echo "BEGIN: $ptst_path"
+        cd "$ptst_path"
         ./run-ptest || ANYFAILED=yes
-        echo "END: $x"
+        echo "END: $ptest_path"
         date "+%Y-%m-%dT%H:%M"
     done
-done
+}
+
+echo "START: $0"
+PTESTS_TO_RUN=$(determine_ptests_to_run $@)
+run_ptests
 echo "STOP: $0"
+
 if [ "$ANYFAILED" = "yes"  ]; then
     exit 1
 fi
-- 
2.1.4


