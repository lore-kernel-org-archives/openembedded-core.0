Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9C3C57ED5F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2019 08:56:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x6F8uKfJ004508
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2019 01:56:20 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Mon, 15 Jul 2019 01:56:20 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 15 Jul 2019 16:56:18 +0800
Message-ID: <1563180978-169800-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <20190715083133.2329.31270@do>
References: <20190715083133.2329.31270@do>
MIME-Version: 1.0
Subject: [PATCH v2] mdadm: fix ptest hang
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
X-List-Received-Date: Mon, 15 Jul 2019 08:56:19 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

Before commit[80d17497b7 mdadm: improve the run-ptest],
the mdadm ptest just run some tests without
"--keep-going" option. After the option added in
commit 80d17497b7, all test cases have chance to
be called.

But the logic in mdadm upstream commit
[e2a8e9d tests: wait for complete rebuild in integrity checks]
will make the test enter infinite loop especially in
qemu env as commit e2a8e9d update the logic from
"check wait" to "check state 'U*'" for testcase
tests/01r5integ and tests/01raid6integ. Considering all
other cases still use "check wait" logic, so revert e2a8e9d
to make tests/01r5integ and tests/01raid6integ also use
"check wait" logic to avoid the infinite loop.

[YOCTO #13368]

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 ...s-wait-for-complete-rebuild-in-integrity-.patch | 53 ++++++++++++++++++++++
 meta/recipes-extended/mdadm/mdadm_4.1.bb           |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-extended/mdadm/files/0001-Revert-tests-wait-for-complete-rebuild-in-integrity-.patch

diff --git a/meta/recipes-extended/mdadm/files/0001-Revert-tests-wait-for-complete-rebuild-in-integrity-.patch b/meta/recipes-extended/mdadm/files/0001-Revert-tests-wait-for-complete-rebuild-in-integrity-.patch
new file mode 100644
index 0000000..b196084
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0001-Revert-tests-wait-for-complete-rebuild-in-integrity-.patch
@@ -0,0 +1,53 @@
+From 02a41c3fd560fb5250186dd6b3cff6b21daa2e2b Mon Sep 17 00:00:00 2001
+From: Mingli Yu <Mingli.Yu@windriver.com>
+Date: Mon, 15 Jul 2019 14:12:24 +0800
+Subject: [PATCH] Revert "tests: wait for complete rebuild in integrity checks"
+
+This reverts commit e2a8e9dcf67a28bc722fa5ab2c49b0bc452d4d74
+as the logic "check state 'U*'" will make the test enters
+infinite loop especially in qemu env, so revert it to
+use the previous logic "check wait" which also used
+commonly by other tests such as tests/02r5grow, tests/07revert-grow
+and etc.
+
+Upstream-Status: Submitted[https://marc.info/?l=linux-raid&m=156317157314030&w=2]
+
+Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
+---
+ tests/01r5integ    | 2 +-
+ tests/01raid6integ | 4 ++--
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/tests/01r5integ b/tests/01r5integ
+index 48676a2..ffb30ce 100644
+--- a/tests/01r5integ
++++ b/tests/01r5integ
+@@ -27,7 +27,7 @@ do
+      exit 1
+     fi
+     mdadm $md0 -a $i
+-    while ! (check state 'U*'); do check wait; sleep 0.2; done
++   check wait
+   done
+   mdadm -S $md0
+ done
+diff --git a/tests/01raid6integ b/tests/01raid6integ
+index 12f4d81..c6fcdae 100644
+--- a/tests/01raid6integ
++++ b/tests/01raid6integ
+@@ -47,10 +47,10 @@ do
+          exit 1
+        fi
+        mdadm $md0 -a $first
+-       while ! (check state 'U*_U*'); do check wait; sleep 0.2; done
++       check wait
+     done
+     mdadm $md0 -a $second
+-    while ! (check state 'U*'); do check wait; sleep 0.2; done
++    check wait
+     totest="$totest $second"
+   done
+   mdadm -S $md0
+-- 
+2.7.4
+
diff --git a/meta/recipes-extended/mdadm/mdadm_4.1.bb b/meta/recipes-extended/mdadm/mdadm_4.1.bb
index 766004f..5df3f90 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.1.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.1.bb
@@ -18,6 +18,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
            file://0001-Compute-abs-diff-in-a-standard-compliant-way.patch \
            file://0001-fix-gcc-8-format-truncation-warning.patch \
            file://debian-no-Werror.patch \
+           file://0001-Revert-tests-wait-for-complete-rebuild-in-integrity-.patch \
 	   file://mdadm.init \
 	   file://0001-mdadm-add-option-y-for-use-syslog-to-recive-event-re.patch \
            "
-- 
2.7.4


