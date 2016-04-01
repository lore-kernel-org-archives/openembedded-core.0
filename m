Return-Path: <Tudor.Florea@enea.com>
Received: from mx-3.enea.com (mx-3.enea.com [192.36.1.72])
	by mail.openembedded.org (Postfix) with SMTP id 0958F760AC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Apr 2016 11:50:54 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.294.0; Fri, 1 Apr 2016
	13:46:22 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4200)	id CDC9D28BA24;
	Fri,  1 Apr 2016 13:46:22 +0200 (CEST)
From: Tudor Florea <tudor.florea@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 1 Apr 2016 13:46:20 +0200
Message-ID: <1459511180-32068-2-git-send-email-tudor.florea@enea.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1459511180-32068-1-git-send-email-tudor.florea@enea.com>
References: <1459511180-32068-1-git-send-email-tudor.florea@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: tudor.florea@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH 2/2] ltp: fix test_proc_kill hanging
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
X-List-Received-Date: Fri, 01 Apr 2016 11:50:55 -0000
Content-Type: text/plain

Signed-off-by: Tudor Florea <tudor.florea@enea.com>
---
 .../ltp/ltp/0035-fix-test_proc_kill-hang.patch     | 23 ++++++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20160126.bb          |  1 +
 2 files changed, 24 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0035-fix-test_proc_kill-hang.patch

diff --git a/meta/recipes-extended/ltp/ltp/0035-fix-test_proc_kill-hang.patch b/meta/recipes-extended/ltp/ltp/0035-fix-test_proc_kill-hang.patch
new file mode 100644
index 0000000..32ae8aa
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0035-fix-test_proc_kill-hang.patch
@@ -0,0 +1,23 @@
+Fix test_proc_kill hanging
+
+Sometimes the signal is delivered to memcg_process before the framework took
+into consideration its pid entered in the tasks. Fixed by delaying the signal
+send command.
+
+Signed-off-by: George Nita <george.nita@enea.com>
+Upstream-Status: Pending 
+
+diff --git a/testcases/kernel/controllers/memcg/functional/memcg_lib.sh b/testcases/kernel/controllers/memcg/functional/memcg_lib.sh
+index ffbe006..e81bf74 100755
+--- a/testcases/kernel/controllers/memcg/functional/memcg_lib.sh
++++ b/testcases/kernel/controllers/memcg/functional/memcg_lib.sh
+@@ -220,8 +220,8 @@ test_proc_kill()
+ 
+ 	$TEST_PATH/memcg_process $2 -s $3 &
+ 	pid=$!
+-	sleep 1
+ 	echo $pid > tasks
++	sleep 1
+ 
+ 	kill -s USR1 $pid 2> /dev/null
+ 	sleep 1
diff --git a/meta/recipes-extended/ltp/ltp_20160126.bb b/meta/recipes-extended/ltp/ltp_20160126.bb
index 6be2187..097c16d 100644
--- a/meta/recipes-extended/ltp/ltp_20160126.bb
+++ b/meta/recipes-extended/ltp/ltp_20160126.bb
@@ -61,6 +61,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0032-regen.sh-Include-asm-unistd.h-explicitly.patch \
            file://0033-shmat1-Cover-GNU-specific-code-under-__USE_GNU.patch \
            file://0034-periodic_output.patch \
+           file://0035-fix-test_proc_kill-hang.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
1.9.1


