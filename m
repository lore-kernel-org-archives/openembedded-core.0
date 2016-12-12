Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3466670022
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 06:02:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uBC62tCr031353
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Dec 2016 22:02:56 -0800
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Sun, 11 Dec 2016 22:02:54 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 12 Dec 2016 13:59:46 +0800
Message-ID: <772f125f1e12f725c3487ef682190708491c3aae.1481522082.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <cover.1481522082.git.jackie.huang@windriver.com>
References: <cover.1481522082.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] ltp: avoid segmentation fault in netns tests
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
X-List-Received-Date: Mon, 12 Dec 2016 06:02:55 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

* backport a patch to avoid segmentation
  fault in netns tests.

* rename previous patch to have ordered
  prefix number.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 ...twork-nfsv4-acl-acl1.c-Security-fix-on-s.patch} |  0
 ...rs-netns_netlink-Avoid-segmentation-fault.patch | 50 ++++++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20160126.bb          |  3 +-
 3 files changed, 52 insertions(+), 1 deletion(-)
 rename meta/recipes-extended/ltp/ltp/{0001-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch => 0036-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch} (100%)
 create mode 100644 meta/recipes-extended/ltp/ltp/0037-containers-netns_netlink-Avoid-segmentation-fault.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch b/meta/recipes-extended/ltp/ltp/0036-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch
similarity index 100%
rename from meta/recipes-extended/ltp/ltp/0001-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch
rename to meta/recipes-extended/ltp/ltp/0036-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch
diff --git a/meta/recipes-extended/ltp/ltp/0037-containers-netns_netlink-Avoid-segmentation-fault.patch b/meta/recipes-extended/ltp/ltp/0037-containers-netns_netlink-Avoid-segmentation-fault.patch
new file mode 100644
index 0000000..18d1f72
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0037-containers-netns_netlink-Avoid-segmentation-fault.patch
@@ -0,0 +1,50 @@
+From 193ce739b2a5174269a958b00c3a5590de944e0d Mon Sep 17 00:00:00 2001
+From: Huacai Chen <chenhc@lemote.com>
+Date: Thu, 27 Oct 2016 14:45:52 +0800
+Subject: [PATCH] containers/netns_netlink: Avoid segmentation fault
+
+In order to avoid segmentation fault (use NULL as a function pointer),
+this patch modify check_netns() by passing a dummy function pointer to
+do_clone_unshare_test().
+
+Signed-off-by: Huacai Chen <chenhc@lemote.com>
+Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
+
+Upstream-Status: Backport
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ testcases/kernel/containers/netns/netns_helper.h | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/testcases/kernel/containers/netns/netns_helper.h b/testcases/kernel/containers/netns/netns_helper.h
+index 2a331ae..7df6dcb 100644
+--- a/testcases/kernel/containers/netns/netns_helper.h
++++ b/testcases/kernel/containers/netns/netns_helper.h
+@@ -56,6 +56,12 @@ static void check_iproute(unsigned int spe_ipver)
+ 	pclose(ipf);
+ }
+ 
++static int dummy(void *arg)
++{
++	(void) arg;
++	return 0;
++}
++
+ static void check_netns(void)
+ {
+ 	int pid, status;
+@@ -64,8 +70,8 @@ static void check_netns(void)
+ 		tst_brkm(TCONF | TERRNO, NULL, "CLONE_NEWNS (%d) not supported",
+ 			 CLONE_NEWNS);
+ 
+-	pid = do_clone_unshare_test(T_UNSHARE, CLONE_NEWNET | CLONE_NEWNS, NULL,
+-			NULL);
++	pid = do_clone_unshare_test(T_UNSHARE, CLONE_NEWNET | CLONE_NEWNS,
++	                            dummy, NULL);
+ 	if (pid == -1)
+ 		tst_brkm(TCONF | TERRNO, NULL,
+ 				"unshare syscall smoke test failed");
+-- 
+2.7.4
+
diff --git a/meta/recipes-extended/ltp/ltp_20160126.bb b/meta/recipes-extended/ltp/ltp_20160126.bb
index 7ee84e3..841302b 100644
--- a/meta/recipes-extended/ltp/ltp_20160126.bb
+++ b/meta/recipes-extended/ltp/ltp_20160126.bb
@@ -62,7 +62,8 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0033-shmat1-Cover-GNU-specific-code-under-__USE_GNU.patch \
            file://0034-periodic_output.patch \
            file://0035-fix-test_proc_kill-hang.patch \
-           file://0001-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch \
+           file://0036-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch \
+           file://0037-containers-netns_netlink-Avoid-segmentation-fault.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.8.3


