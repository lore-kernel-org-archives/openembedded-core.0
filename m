Return-Path: <Zhe.He@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 920D07F7D2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jan 2020 08:50:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 00J8ooCN006362
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jan 2020 00:50:50 -0800 (PST)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Sun, 19 Jan 2020 00:50:50 -0800
From: <zhe.he@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 19 Jan 2020 16:50:48 +0800
Message-ID: <20200119085048.2187-1-zhe.he@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH] ltp: Fix nm01 faliure
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
X-List-Received-Date: Sun, 19 Jan 2020 08:50:49 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

Backport a patch from upstream to fix the following runtime failure.

The latest nm v2.33.1 outputs symbols addresses without prefix zeros
for "nm -f posix", which causes the following error.
nm01 5 TFAIL: Got wrong format with -f bsd

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 ...ix-zeros-of-the-addresses-output-by-.patch | 43 +++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20190930.bb     |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-nm01-Remove-prefix-zeros-of-the-addresses-output-by-.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-nm01-Remove-prefix-zeros-of-the-addresses-output-by-.patch b/meta/recipes-extended/ltp/ltp/0001-nm01-Remove-prefix-zeros-of-the-addresses-output-by-.patch
new file mode 100644
index 0000000000..fe5e7314e0
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
+Upstream-Status: Backport [59cb0dd9f8e65b2d398fcaf4d163cbc8e1d0ae45]
+
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+Reviewed-by: Li Wang <liwang@redhat.com>
+Reviewed-by: Petr Vorel <pvorel@suse.cz>
+Tested-by: Petr Vorel <pvorel@suse.cz>
+---
+ testcases/commands/nm/nm01.sh | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/testcases/commands/nm/nm01.sh b/testcases/commands/nm/nm01.sh
+index 30c41bd..fd9d3d9 100755
+--- a/testcases/commands/nm/nm01.sh
++++ b/testcases/commands/nm/nm01.sh
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
diff --git a/meta/recipes-extended/ltp/ltp_20190930.bb b/meta/recipes-extended/ltp/ltp_20190930.bb
index e56bb575d2..2853b1c819 100644
--- a/meta/recipes-extended/ltp/ltp_20190930.bb
+++ b/meta/recipes-extended/ltp/ltp_20190930.bb
@@ -41,6 +41,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0001-mkswap01.sh-Add-udevadm-trigger-before-swap-verifica.patch \
            file://0001-testcases-fix-an-absent-format-string-issue.patch \
            file://0001-Add-more-musl-exclusions.patch \
+           file://0001-nm01-Remove-prefix-zeros-of-the-addresses-output-by-.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.17.1


