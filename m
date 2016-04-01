Return-Path: <Tudor.Florea@enea.com>
X-Greylist: delayed 325 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 01 Apr 2016 11:50:19 UTC
Received: from mx-3.enea.com (mx-3.enea.com [192.36.1.72])
	by mail.openembedded.org (Postfix) with SMTP id 74CFE73695
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Apr 2016 11:50:19 +0000 (UTC)
Received: from sestovs32.enea.se (172.21.3.146) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.294.0; Fri, 1 Apr 2016
	13:44:52 +0200
Received: by sestovs32.enea.se (Postfix, from userid 4200)	id 0FD02241086;
	Fri,  1 Apr 2016 13:44:52 +0200 (CEST)
From: Tudor Florea <tudor.florea@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 1 Apr 2016 13:44:51 +0200
Message-ID: <1459511092-57587-1-git-send-email-tudor.florea@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: tudor.florea@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH 1/2] ltp: add periodic output for memcg stress test
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
X-List-Received-Date: Fri, 01 Apr 2016 11:50:20 -0000
Content-Type: text/plain

Signed-off-by: Tudor Florea <tudor.florea@enea.com>
---
 .../ltp/ltp/0034-periodic_output.patch             | 43 ++++++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20160126.bb          |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0034-periodic_output.patch

diff --git a/meta/recipes-extended/ltp/ltp/0034-periodic_output.patch b/meta/recipes-extended/ltp/ltp/0034-periodic_output.patch
new file mode 100644
index 0000000..59caefe
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0034-periodic_output.patch
@@ -0,0 +1,43 @@
+Add periodic output for long time test.
+
+This is needed in context of having scripts running ltp tests and
+waiting with a timeout for the output of the tests.
+
+Signed-off-by: Tudor Florea <tudor.florea@enea.com>
+Upstream-Status: Pending
+
+diff -ruN a/testcases/kernel/controllers/memcg/stress/memcg_stress_test.sh b/testcases/kernel/controllers/memcg/stress/memcg_stress_test.sh
+--- a/testcases/kernel/controllers/memcg/stress/memcg_stress_test.sh	2013-11-08 15:54:09.515049081 +0100
++++ b/testcases/kernel/controllers/memcg/stress/memcg_stress_test.sh	2013-11-08 22:32:15.587370406 +0100
+@@ -37,7 +37,8 @@
+         exit 0
+ fi
+ 
+-RUN_TIME=$(( 60 * 60 ))
++ONE_MINUTE=60
++RUN_TIME=60
+ 
+ cleanup()
+ {
+@@ -62,7 +63,7 @@
+ # $1 - Number of cgroups
+ # $2 - Allocated how much memory in one process? in MB
+ # $3 - The interval to touch memory in a process
+-# $4 - How long does this test run ? in second
++# $4 - How long does this test run ? in minutes
+ run_stress()
+ {
+ 	do_mount;
+@@ -81,7 +82,11 @@
+ 		eval /bin/kill -s SIGUSR1 \$pid$i 2> /dev/null
+ 	done
+ 
+-	sleep $4
++	for i in $(seq 0 $(($4-1)))
++	do
++		eval echo "Started $i min ago. Still alive... " 
++		sleep $ONE_MINUTE
++	done
+ 
+ 	for i in $(seq 0 $(($1-1)))
+ 	do
diff --git a/meta/recipes-extended/ltp/ltp_20160126.bb b/meta/recipes-extended/ltp/ltp_20160126.bb
index 720a569..6be2187 100644
--- a/meta/recipes-extended/ltp/ltp_20160126.bb
+++ b/meta/recipes-extended/ltp/ltp_20160126.bb
@@ -60,6 +60,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0031-vma03-fix-page-size-offset-as-per-page-size-alignmen.patch \
            file://0032-regen.sh-Include-asm-unistd.h-explicitly.patch \
            file://0033-shmat1-Cover-GNU-specific-code-under-__USE_GNU.patch \
+           file://0034-periodic_output.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
1.9.1


