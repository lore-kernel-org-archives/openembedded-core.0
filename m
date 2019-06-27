Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5CF1C7C37F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 08:23:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5R8NEPn008419
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 01:23:30 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Thu, 27 Jun 2019 01:23:06 -0700
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 27 Jun 2019 01:23:06 -0700
Message-ID: <20190627082306.56720-1-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta][PATCH] ltp: fix shmctl01 failure when executed.
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
X-List-Received-Date: Thu, 27 Jun 2019 08:23:39 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

schmctl01 fails with following error:
[shmctl01    5  TFAIL  :  shmctl01.c:171: shmctl01 call failed - errno =
22 : Invalid argument]

Backport the patch from upstream can fix it.

Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
---
 ...se-hardcoded-index-0-for-SHM_STAT-te.patch | 81 +++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20190115.bb     |  1 +
 2 files changed, 82 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-shmctl01-don-t-use-hardcoded-index-0-for-SHM_STAT-te.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-shmctl01-don-t-use-hardcoded-index-0-for-SHM_STAT-te.patch b/meta/recipes-extended/ltp/ltp/0001-shmctl01-don-t-use-hardcoded-index-0-for-SHM_STAT-te.patch
new file mode 100644
index 0000000000..d837f073a9
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-shmctl01-don-t-use-hardcoded-index-0-for-SHM_STAT-te.patch
@@ -0,0 +1,81 @@
+From db0a43d9388be2c347a8306751bbe6bec086d062 Mon Sep 17 00:00:00 2001
+From: Jan Stancek <jstancek@redhat.com>
+Date: Mon, 20 May 2019 20:47:20 +0200
+Subject: [PATCH] shmctl01: don't use hardcoded index == 0 for SHM_STAT test
+
+Test fails on SHM_STAT testcase:
+   shmctl01    5  TFAIL  :  shmctl01.c:173: shmctl01 call failed
+                            errno = 22 : Invalid argument
+   shmctl(0, SHM_STAT, 0x601060)           = -EINVAL
+
+since following commit:
+   commit 99db46ea292780cd978d56932d9445b1e8bdafe8
+   Author: Manfred Spraul <manfred@colorfullife.com>
+   Date:   Tue May 14 15:46:36 2019 -0700
+     ipc: do cyclic id allocation for the ipc object.
+
+Don't rely on index 0 being always available, but instead
+use (maximum) index returned by SHM_INFO.
+
+Signed-off-by: Jan Stancek <jstancek@redhat.com>
+Reviewed-by: Petr Vorel <pvorel@suse.cz>
+Acked-by: Cyril Hrubis <chrubis@suse.cz>
+
+Upstream-Status: Backport from v20190517
+[https://lists.linux.it/pipermail/ltp/2019-May/012051.html]
+
+Signed-off-by: Hongzhi Song <hongzhi.song@windriver.com>
+---
+ testcases/kernel/syscalls/ipc/shmctl/shmctl01.c | 21 ++++++++++++++++++---
+ 1 file changed, 18 insertions(+), 3 deletions(-)
+
+diff --git a/testcases/kernel/syscalls/ipc/shmctl/shmctl01.c b/testcases/kernel/syscalls/ipc/shmctl/shmctl01.c
+index 1b46977..52bf23a 100644
+--- a/testcases/kernel/syscalls/ipc/shmctl/shmctl01.c
++++ b/testcases/kernel/syscalls/ipc/shmctl/shmctl01.c
+@@ -79,6 +79,7 @@ static void func_info(int ret);
+ 
+ /* Check routine for SHM_STAT */
+ static void func_sstat(int ret);
++static void func_sstat_setup(void);
+ 
+ /* Check routine for SHM_LOCK */
+ static void func_lock(int ret);
+@@ -110,7 +111,7 @@ static struct test_case_t {
+ #endif
+ 	{&shm_id_1, IPC_SET, &buf, func_set, set_setup},
+ 	{&shm_id_1, IPC_INFO, (struct shmid_ds *) &info, func_info, NULL},
+-	{&shm_index, SHM_STAT, &buf, func_sstat, NULL},
++	{&shm_index, SHM_STAT, &buf, func_sstat, func_sstat_setup},
+ 	{&shm_id_1, SHM_LOCK, NULL, func_lock, NULL},
+ 	{&shm_id_1, SHM_UNLOCK, NULL, func_unlock, NULL},
+ 	{&shm_id_1, IPC_RMID, NULL, func_rmid, NULL},
+@@ -407,9 +408,23 @@ static void func_info(int ret)
+ static void func_sstat(int ret)
+ {
+ 	if (ret >= 0)
+-		tst_resm(TPASS, "get correct shared memory id");
++		tst_resm(TPASS, "get correct shared memory id for index: %d",
++			shm_index);
+ 	else
+-		tst_resm(TFAIL, "shared memory id is incorrect");
++		tst_resm(TFAIL, "shared memory id is incorrect, index: %d",
++			shm_index);
++}
++
++static void func_sstat_setup(void)
++{
++	struct shm_info tmp;
++	int ret;
++
++	ret = shmctl(shm_id_1, SHM_INFO, (void *)&tmp);
++	if (ret < 0)
++		tst_resm(TFAIL|TERRNO, "shmctl(SHM_INFO)");
++	else
++		shm_index = ret;
+ }
+ 
+ static void func_lock(int ret)
+-- 
+2.8.1
+
diff --git a/meta/recipes-extended/ltp/ltp_20190115.bb b/meta/recipes-extended/ltp/ltp_20190115.bb
index 1d0c00b64b..e91dea2f19 100644
--- a/meta/recipes-extended/ltp/ltp_20190115.bb
+++ b/meta/recipes-extended/ltp/ltp_20190115.bb
@@ -50,6 +50,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://define-sigrtmin-and-sigrtmax-for-musl.patch \
            file://setregid01-security-string-formatting.patch \
            file://0001-syscalls-setrlimit03.c-read-proc-sys-fs-nr_open-for-.patch \
+		   file://0001-shmctl01-don-t-use-hardcoded-index-0-for-SHM_STAT-te.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.21.0


