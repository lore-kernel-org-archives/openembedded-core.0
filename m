Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 515F87F811
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 15:32:40 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id h4so1587922pgv.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 07:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=0AEpn0MM5Q4+6k7P2lGzy0rSJzDHBE7zhKTP7bWs+60=;
	b=JXfzZdXhhzECMXVAO1+BaZP68xf3EfYq3YuDZTp/A0TwC/hcI/TUP6z1Kw3p0dJoUn
	jFmFfKRwyxk/OdUwmNvunWesNsy2b3iFy0A72qmeovX+r605ibZXxZGW/m4E5spifKLh
	EBFjFJVdY/0MU+i+lIa5ufO4BRYK6IZQi0+pD+3D/iINAte0lbgp8hunJc0oOHXtMukf
	Sl7J2ZAiGY+udtSPtapUIIUdKDmfdTetgf8JWfD+31PzcXYQw1o54ZLinrXUTx9DE8yL
	FwvN0JXHi5YDtJzWcVfS6b1KauBZyyOTprsgKkfWB9YAZ/9pyoUA7ozJWZoLpvtjllso
	8PfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=0AEpn0MM5Q4+6k7P2lGzy0rSJzDHBE7zhKTP7bWs+60=;
	b=VBwZNPMhgrol/IWoiTtTjqHCE28p+tgj2oKWWEzH4h4a7SLdz0qsbafJTgk/pRCAN1
	ZlmY3J5YyoSmqeNTxYP4C/QSn7DF7OHHmYK6DBt4EmUTPZb4w5sLOID1M+sO8UrHdmuk
	4UVXeto8JNs8NduVBaY0Bkd+eZzdOaBqplHjb3hVVCnBzhNe4hXlYoU5HOg+kkftrPfw
	k4s52fvEwsu+5efBUvpV3+2MpkgEmKm8nbM0X+qau40iKVmG85WsArdPY2Qy5/0kG4UM
	uSmaz7bxfYdzzV1VZZ9ZKPIUugwjuwZJbgNt1VdpYdM0tE0tUGt2F66uZUZWP42qQp0t
	rUcw==
X-Gm-Message-State: APjAAAXqUqwryDawVIbKVL5Z14xe5EOaV7XlEREOaKq+nv6QpslOUx5v
	2c6QDDFNR6jkSIO+h2YC9zvSrHij
X-Google-Smtp-Source: APXvYqwc4MeC6hvXdmT6lPryQdQQe7vfzqj8BuviJ4H8jLb96UHsx0CzXqfjf/ynZL1olUB1gTwpng==
X-Received: by 2002:aa7:8517:: with SMTP id v23mr2122511pfn.75.1573659161190; 
	Wed, 13 Nov 2019 07:32:41 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id
	s18sm3713613pfm.27.2019.11.13.07.32.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Nov 2019 07:32:40 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2019 07:31:58 -0800
Message-Id: <869f46863e218c2d18ae7b4c0b28775fa07ba8b8.1573658916.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573658915.git.akuster808@gmail.com>
References: <cover.1573658915.git.akuster808@gmail.com>
Subject: [zeus 16/31] ltp: Fix overcommit_memory failure
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
X-List-Received-Date: Wed, 13 Nov 2019 15:32:40 -0000

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


