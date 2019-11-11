Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 847A37FA45
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 18:30:13 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id p26so11210103pfq.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 10:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=0AEpn0MM5Q4+6k7P2lGzy0rSJzDHBE7zhKTP7bWs+60=;
	b=XJrrt+2pbEKShdj3fwlbpKrsH1pjBy1ugCQyDDC9GfW0DjDM6MxjG69i/07B9xCCLc
	dsNA4x1VAMBnJv5iVr/gUq1Ur6asJDqS8tQk0qp3LExzrBpS0EnSCTioK6QAKTU55nBs
	Wwo/IN1slE0+uTtCNHhGAxgyqAaP/2CZG7dAmrZddXhZKBP2hvyq2h7/mzvzPOCAhbns
	TLyopgX8aC+cv0CU4KLmsAlZusYD/fcED5VHO/J0XLFRlDqHgiQwELplF513AhPer2jG
	bl0E/eXtKZKOQG7UV/vzK5Z2kP2tWLzO2rIhtkb8/CqsofC/rf0EwupwpqZk0vxBnPet
	xARQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=0AEpn0MM5Q4+6k7P2lGzy0rSJzDHBE7zhKTP7bWs+60=;
	b=QGprrAVsFhG0aEMS+AmbvlR2vgtZcpOfVjbt4f6AcDmbg5Bf4x+5ObRhQ8PkE0kESN
	Gygbuun6W+nobSJDdu3Ro51qNO39sZkJOEmZnLl9CrUOTT0B/kdef/019pkwoAH1tfNW
	rpisZ0x9/HgIca7rkYPtCqm2e4e/E7RiUNykagt2HKyJq+7WZLd5tqJJqoE6WaU8WdTb
	9TZdTAZzP2dC426QWwnXcNt1k51WeJotdgoph8l/RzldqyyBmQj2kqG+M1IOOjNtI0Tu
	WhTfM1T2OG8HqkvvSF94NaKw1D/AvoWH0A+1vKSKbKnEVJulhdxoqFunZr9Hn9B/7t/S
	sNSA==
X-Gm-Message-State: APjAAAWG4RZcdfB9HVIr9BfGsg3n21v79wNa3QFwuRobyeUihz3ixQxg
	xVRH/Fdk2wVmYoMZjiJAa8KJUVN8
X-Google-Smtp-Source: APXvYqwWCEi2BgaljWRhq+1sT8ya+kJ4C0pB14KWRJp/zGy7k5cXCSoCbOgPD+ZZ29ktui6NrV/xJA==
X-Received: by 2002:a63:6a86:: with SMTP id
	f128mr30184247pgc.295.1573497014366; 
	Mon, 11 Nov 2019 10:30:14 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:604a:b703:29ca:5c7d])
	by smtp.gmail.com with ESMTPSA id
	l62sm17731698pgl.24.2019.11.11.10.30.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Nov 2019 10:30:13 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Nov 2019 10:29:48 -0800
Message-Id: <869f46863e218c2d18ae7b4c0b28775fa07ba8b8.1573496794.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573496794.git.akuster808@gmail.com>
References: <cover.1573496794.git.akuster808@gmail.com>
Subject: [zeus 06/21] ltp: Fix overcommit_memory failure
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
X-List-Received-Date: Mon, 11 Nov 2019 18:30:13 -0000

From: He Zhe <zhe.he@windriver.com>

Backport a patch from upstream to fix the following runtime failure.

mem.c:814: INFO: set overcommit_memory to 0
overcommit_memory.c:213: FAIL: alloc passed, expected to fail

Signed-off-by: He Zhe <zhe.he@windriver.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...memory-update-for-mm-fix-false-positive-O.patch | 57 ++++++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20190517.bb          |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-overcommit_memory-update-for-mm-fix-false-positive-O.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-overcommit_memory-update-for-mm-fix-false-positive-O.patch b/meta/recipes-extended/ltp/ltp/0001-overcommit_memory-update-for-mm-fix-false-positive-O.patch
new file mode 100644
index 0000000..bed8471
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-overcommit_memory-update-for-mm-fix-false-positive-O.patch
@@ -0,0 +1,57 @@
+From d656a447893dccc310c975a239f482278550c3e0 Mon Sep 17 00:00:00 2001
+From: Jan Stancek <jstancek@redhat.com>
+Date: Tue, 21 May 2019 10:10:44 +0200
+Subject: [PATCH] overcommit_memory: update for "mm: fix false-positive
+ OVERCOMMIT_GUESS failures"
+
+commit 8c7829b04c52 ("mm: fix false-positive OVERCOMMIT_GUESS failures")
+changes logic of __vm_enough_memory(), simplifying it to:
+    When in GUESS mode, catch wild allocations by comparing their request
+    size to total amount of ram and swap in the system.
+
+Testcase currently allocates mem_total + swap_total, which doesn't trigger
+new condition. Make it more extreme, but assuming free_total / 2 will PASS,
+and 2*sum_total will FAIL.
+
+Signed-off-by: Jan Stancek <jstancek@redhat.com>
+Acked-by: Cyril Hrubis <chrubis@suse.cz>
+
+Upstream-Status: Backport [https://github.com/linux-test-project/ltp/commit/d656a447893dccc310c975a239f482278550c3e0]
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+---
+ testcases/kernel/mem/tunable/overcommit_memory.c | 11 ++++-------
+ 1 file changed, 4 insertions(+), 7 deletions(-)
+
+diff --git a/testcases/kernel/mem/tunable/overcommit_memory.c b/testcases/kernel/mem/tunable/overcommit_memory.c
+index 555298f..345764d 100644
+--- a/testcases/kernel/mem/tunable/overcommit_memory.c
++++ b/testcases/kernel/mem/tunable/overcommit_memory.c
+@@ -36,11 +36,10 @@
+  *
+  * The program is designed to test the two tunables:
+  *
+- * When overcommit_memory = 0, allocatable memory can't overextends
+- * the amount of free memory. I choose the three cases:
++ * When overcommit_memory = 0, allocatable memory can't overextend
++ * the amount of total memory:
+  * a. less than free_total:    free_total / 2, alloc should pass.
+- * b. greater than free_total: free_total * 2, alloc should fail.
+- * c. equal to sum_total:      sum_tatal,      alloc should fail
++ * b. greater than sum_total:   sum_total * 2, alloc should fail.
+  *
+  * When overcommit_memory = 1, it can alloc enough much memory, I
+  * choose the three cases:
+@@ -164,9 +163,7 @@ static void overcommit_memory_test(void)
+ 
+ 	update_mem();
+ 	alloc_and_check(free_total / 2, EXPECT_PASS);
+-	update_mem();
+-	alloc_and_check(free_total * 2, EXPECT_FAIL);
+-	alloc_and_check(sum_total, EXPECT_FAIL);
++	alloc_and_check(sum_total * 2, EXPECT_FAIL);
+ 
+ 	/* start to test overcommit_memory=1 */
+ 	set_sys_tune("overcommit_memory", 1, 1);
+-- 
+2.7.4
+
diff --git a/meta/recipes-extended/ltp/ltp_20190517.bb b/meta/recipes-extended/ltp/ltp_20190517.bb
index 4650715..5915b1c 100644
--- a/meta/recipes-extended/ltp/ltp_20190517.bb
+++ b/meta/recipes-extended/ltp/ltp_20190517.bb
@@ -49,6 +49,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0001-testcases-use-python3-everywhere-to-run-python-scrip.patch \
            file://0001-syscall-rt_sigtimedwait01-Fix-wrong-sigset-length-fo.patch \
            file://0001-cve-2017-17052-Avoid-unsafe-exits-in-threads.patch \
+           file://0001-overcommit_memory-update-for-mm-fix-false-positive-O.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.7.4


