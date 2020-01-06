Return-Path: <Zhe.He@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 343697F8BD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2020 09:59:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 0069xYQe015655
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Jan 2020 01:59:34 -0800 (PST)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Mon, 6 Jan 2020 01:59:33 -0800
From: <zhe.he@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 6 Jan 2020 17:59:32 +0800
Message-ID: <1578304772-424157-1-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] nm01: Remove prefix zeros of the addresses output by nm before comparing
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
X-List-Received-Date: Mon, 06 Jan 2020 09:59:33 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

The latest nm v2.33.1 outputs symbols addresses without prefix zeros
for "nm -f posix", which causes the following error.
nm01 5 TFAIL: Got wrong format with -f bsd

Backport a patch to fix it.

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 ...ix-zeros-of-the-addresses-output-by-.patch | 43 +++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20190517.bb     |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-nm01-Remove-prefix-zeros-of-the-addresses-output-by-.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-nm01-Remove-prefix-zeros-of-the-addresses-output-by-.patch b/meta/recipes-extended/ltp/ltp/0001-nm01-Remove-prefix-zeros-of-the-addresses-output-by-.patch
new file mode 100644
index 0000000000..502ea69055
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-nm01-Remove-prefix-zeros-of-the-addresses-output-by-.patch
@@ -0,0 +1,43 @@
+From 59cb0dd9f8e65b2d398fcaf4d163cbc8e1d0ae45 Mon Sep 17 00:00:00 2001
+From: He Zhe <zhe.he@windriver.com>
+Date: Tue, 31 Dec 2019 15:02:48 +0800
+Subject: [PATCH] nm01: Remove prefix zeros of the addresses output by nm
+ before comparing
+
+The latest nm v2.33.1 outputs symbols addresses without prefix zeros
+for "nm -f posix", which causes the following error.
+nm01 5 TFAIL: Got wrong format with -f bsd
+
+Let's remove the prefix zeros before comparing.
+
+Upstream-Status: Backport [http://lists.linux.it/pipermail/ltp/2020-January/014884.html]
+
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+Reviewed-by: Li Wang <liwang@redhat.com>
+Reviewed-by: Petr Vorel <pvorel@suse.cz>
+Tested-by: Petr Vorel <pvorel@suse.cz>
+---
+ testcases/commands/nm/nm01 | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/testcases/commands/nm/nm01 b/testcases/commands/nm/nm01
+index 30c41bd..fd9d3d9 100755
+--- a/testcases/commands/nm/nm01
++++ b/testcases/commands/nm/nm01
+@@ -84,8 +84,11 @@ test5()
+ 	EXPECT_PASS $NM -f bsd $TST_DATAROOT/f1 \> nm_bsd.out
+ 	EXPECT_PASS $NM -f posix $TST_DATAROOT/f1 \> nm_posix.out
+ 
+-	ROD awk '{print $3 $2 $1}' nm_bsd.out \> nm1.out
+-	ROD awk '{print $1 $2 $3}' nm_posix.out \> nm2.out
++	ROD awk '{print gensub(/\y(0+)([0-9a-fA-F]+)\y/, "\\2", "g")}' nm_bsd.out \> trimmed_nm_bsd.out
++	ROD awk '{print gensub(/\y(0+)([0-9a-fA-F]+)\y/, "\\2", "g")}' nm_posix.out \> trimmed_nm_posix.out
++
++	ROD awk '{print $3 $2 $1}' trimmed_nm_bsd.out \> nm1.out
++	ROD awk '{print $1 $2 $3}' trimmed_nm_posix.out \> nm2.out
+ 
+ 	if diff nm1.out nm2.out > /dev/null; then
+ 		tst_res TPASS "Got BSD format with -f bsd"
+-- 
+2.7.4
+
diff --git a/meta/recipes-extended/ltp/ltp_20190517.bb b/meta/recipes-extended/ltp/ltp_20190517.bb
index 60f749b4c0..f70687fc44 100644
--- a/meta/recipes-extended/ltp/ltp_20190517.bb
+++ b/meta/recipes-extended/ltp/ltp_20190517.bb
@@ -51,6 +51,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0001-cve-2017-17052-Avoid-unsafe-exits-in-threads.patch \
            file://0001-overcommit_memory-update-for-mm-fix-false-positive-O.patch \
            file://0001-mkswap01.sh-Add-udevadm-trigger-before-swap-verifica.patch \
+           file://0001-nm01-Remove-prefix-zeros-of-the-addresses-output-by-.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.24.1


