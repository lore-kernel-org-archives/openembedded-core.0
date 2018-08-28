Return-Path: <Zhe.He@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5F11F78E59
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 12:43:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7SCh16s001799
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 05:43:02 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Tue, 28 Aug 2018 05:43:00 -0700
From: <zhe.he@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 28 Aug 2018 20:43:00 +0800
Message-ID: <1535460180-251572-1-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] ltp: Remove unnecessary check from creat08 and open10
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
X-List-Received-Date: Tue, 28 Aug 2018 12:43:01 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

Issue: LIN1018-1797

At the point of the following failure, the file being checked, setgid,
is owned by "nobody" in the "nogroup" and tries to inherit SGID from
its parent directory who is in group of "bin". This is forbidden since
Linux kernel v4.18-rc4, unless current process is given CAP_FSETID
beforehand. See "Fix up non-directory creation in SGID directories" in
the kernel. The check in Block3 succeeds since it becomes root again
then.

creat08 3 TFAIL : creat08.c:368: testdir.B.1026/setgid: Incorrect modes, setgid bit should be set
creat08 4 TFAIL : creat08.c:376: Test failed in block2.

open10 3 TFAIL : open10.c:352: open10.testdir.B.1045/setgid: Incorrect modes, setgid bit not set
open10 4 TFAIL : open10.c:359: Test failed in block2.
open10 6 TFAIL : open10.c:443: Test failed because of above failures.

Backport a patch from upstream.

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 ...skip-S_ISGID-check-on-files-created-by-no.patch | 81 ++++++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20180515.bb          |  1 +
 2 files changed, 82 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0043-open-creat-skip-S_ISGID-check-on-files-created-by-no.patch

diff --git a/meta/recipes-extended/ltp/ltp/0043-open-creat-skip-S_ISGID-check-on-files-created-by-no.patch b/meta/recipes-extended/ltp/ltp/0043-open-creat-skip-S_ISGID-check-on-files-created-by-no.patch
new file mode 100644
index 0000000..dc61fcc
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0043-open-creat-skip-S_ISGID-check-on-files-created-by-no.patch
@@ -0,0 +1,81 @@
+From 3c87ef2961dedb10d1f674c6a530e00dbab8ec1b Mon Sep 17 00:00:00 2001
+From: Jan Stancek <jstancek@redhat.com>
+Date: Tue, 17 Jul 2018 10:26:39 +0200
+Subject: [PATCH] open|creat: skip S_ISGID check on files created by non-group
+ members
+
+0fa3ecd87848 ("Fix up non-directory creation in SGID directories")
+fixes problem described in CVE-2018-13405. This commit is getting
+backported to older streams as well.
+
+This patch removes S_ISGID check for files created by non-group members
+in LTP tests creat08 and open10.
+
+Once 0fa3ecd87848 will be in non-rc kernel, we could add a new test
+for this CVE that would be limited to 4.18+ kernels.
+
+Signed-off-by: Jan Stancek <jstancek@redhat.com>
+Acked-by: Cyril Hrubis <chrubis@suse.cz>
+Reviewed-by: Naresh Kamboju <naresh.kamboju@linaro.org>
+
+Upstream-Status: Backport
+[ git://github.com/linux-test-project/ltp.git
+  3c87ef2961dedb10d1f674c6a530e00dbab8ec1b
+  "open|creat: skip S_ISGID check on files created by non-group members" ]
+
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+---
+ testcases/kernel/syscalls/creat/creat08.c | 13 ++++++-------
+ testcases/kernel/syscalls/open/open10.c   | 12 +++++-------
+ 2 files changed, 11 insertions(+), 14 deletions(-)
+
+diff --git a/testcases/kernel/syscalls/creat/creat08.c b/testcases/kernel/syscalls/creat/creat08.c
+index 50f2b3993..d22558ac3 100644
+--- a/testcases/kernel/syscalls/creat/creat08.c
++++ b/testcases/kernel/syscalls/creat/creat08.c
+@@ -361,13 +361,12 @@ int main(int ac, char **av)
+ 			local_flag = FAILED;
+ 		}
+ 
+-		/* Verify modes */
+-		if (!(buf.st_mode & S_ISGID)) {
+-			tst_resm(TFAIL,
+-				 "%s: Incorrect modes, setgid bit should be set",
+-				 setgid_B);
+-			local_flag = FAILED;
+-		}
++		/*
++		 * Skip S_ISGID check
++		 * 0fa3ecd87848 ("Fix up non-directory creation in SGID directories")
++		 * clears S_ISGID for files created by non-group members
++		 */
++
+ 		close(fd);
+ 
+ 		if (local_flag == PASSED) {
+diff --git a/testcases/kernel/syscalls/open/open10.c b/testcases/kernel/syscalls/open/open10.c
+index 613f2288f..14feec9e1 100644
+--- a/testcases/kernel/syscalls/open/open10.c
++++ b/testcases/kernel/syscalls/open/open10.c
+@@ -345,13 +345,11 @@ int main(int ac, char *av[])
+ 			local_flag = FAILED;
+ 		}
+ 
+-		/* Verify modes */
+-		if (!(buf.st_mode & S_ISGID)) {
+-			tst_resm(TFAIL,
+-				 "%s: Incorrect modes, setgid bit not set",
+-				 setgid_B);
+-			local_flag = FAILED;
+-		}
++		/*
++		 * Skip S_ISGID check
++		 * 0fa3ecd87848 ("Fix up non-directory creation in SGID directories")
++		 * clears S_ISGID for files created by non-group members
++		 */
+ 
+ 		if (local_flag == PASSED) {
+ 			tst_resm(TPASS, "Test passed in block2.");
+-- 
+2.11.0
+
diff --git a/meta/recipes-extended/ltp/ltp_20180515.bb b/meta/recipes-extended/ltp/ltp_20180515.bb
index 978d3cd..7c364a6 100644
--- a/meta/recipes-extended/ltp/ltp_20180515.bb
+++ b/meta/recipes-extended/ltp/ltp_20180515.bb
@@ -50,6 +50,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0040-read_all-Define-FNM_EXTMATCH-if-not-already-like-und.patch \
            file://0041-cve-2017-5669-shmat-for-0-or-PAGESIZE-with-RND-flag-.patch \
            file://0042-fs-ftest-ftest06.c-Fix-too-small-name-string-and-rel.patch \
+           file://0043-open-creat-skip-S_ISGID-check-on-files-created-by-no.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.7.4


