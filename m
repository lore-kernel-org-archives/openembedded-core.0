Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F4E2C433EF
	for <webhook@archiver.kernel.org>; Thu, 30 Sep 2021 14:08:14 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web08.12831.1633010892202426842
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Sep 2021 07:08:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: thomas.perrot@bootlin.com)
Received: (Authenticated sender: thomas.perrot@bootlin.com)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id A786824000C;
	Thu, 30 Sep 2021 14:08:09 +0000 (UTC)
From: Thomas Perrot <thomas.perrot@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: alexandre.belloni@bootlin.com,
	mingli.yu@windriver.com,
	Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [OE-core][PATCH v4] libevent: mark util/monotonic_prc_fallback as
 retriable
Date: Thu, 30 Sep 2021 16:08:01 +0200
Message-Id: <20210930140801.557763-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Sep 2021 14:08:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156494

Backport a patch to fix the below ptest failure:
 # ./run-ptest
 Running tests:
 EVPORT
 Skipping test
 KQUEUE
 Skipping test
 EPOLL
 test-eof: OKAY
 test-dumpevents: OKAY (output not checked)
 regress:
  FAIL ../libevent-2.1.12-stable/test/regress_util.c:1478: assert(diff.tv_sec == 0): 1 vs 0 util/monotonic_prc_fallback:
  [monotonic_prc_fallback FAILED]
 1/312 TESTS FAILED. (33 skipped)
 FAILED
 regress_debug:
  FAIL ../libevent-2.1.12-stable/test/regress_util.c:1478: assert(diff.tv_sec == 0): 1 vs 0 util/monotonic_prc_fallback:
  [monotonic_prc_fallback FAILED]
 1/312 TESTS FAILED. (33 skipped)
 FAILED
 [snip]

(From OE-Core rev: edecbbdacab5227c75e4a199e124389f8036b421)

[YOCTO #14507]

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 ...-monotonic_prc_fallback-as-retriable.patch | 28 +++++++
 ...ts-are-marked-failed-only-when-all-a.patch | 81 +++++++++++++++++++
 .../libevent/libevent/run-ptest               | 10 +--
 .../libevent/libevent_2.1.12.bb               |  4 +-
 4 files changed, 117 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-support/libevent/libevent/0003-test-mark-util-monotonic_prc_fallback-as-retriable.patch
 create mode 100644 meta/recipes-support/libevent/libevent/0004-test-retriable-tests-are-marked-failed-only-when-all-a.patch

diff --git a/meta/recipes-support/libevent/libevent/0003-test-mark-util-monotonic_prc_fallback-as-retriable.patch b/meta/recipes-support/libevent/libevent/0003-test-mark-util-monotonic_prc_fallback-as-retriable.patch
new file mode 100644
index 000000000000..ea322511d7e9
--- /dev/null
+++ b/meta/recipes-support/libevent/libevent/0003-test-mark-util-monotonic_prc_fallback-as-retriable.patch
@@ -0,0 +1,28 @@
+From 5a9a5faf27d85c89b40fb610cd23a4b62a7dbf0e Mon Sep 17 00:00:00 2001
+From: Azat Khuzhin <azat@libevent.org>
+Date: Sun, 19 Sep 2021 00:57:31 +0300
+Subject: [PATCH] test: mark util/monotonic_prc_fallback as retriable
+
+Refs: #1193
+
+Upstream-status: Backported [https://github.com/libevent/libevent/commit/04fcd7c6df158bb65261867de4b9ec8439696934]
+---
+ test/regress_util.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/test/regress_util.c b/test/regress_util.c
+index 45caa2700a40..a9e80db20149 100644
+--- a/test/regress_util.c
++++ b/test/regress_util.c
+@@ -1672,7 +1672,7 @@ struct testcase_t util_testcases[] = {
+ 	{ "monotonic_res_fallback", test_evutil_monotonic_res, TT_OFF_BY_DEFAULT, &basic_setup, (void*)"fallback" },
+ 	{ "monotonic_prc", test_evutil_monotonic_prc, 0, &basic_setup, (void*)"" },
+ 	{ "monotonic_prc_precise", test_evutil_monotonic_prc, TT_RETRIABLE, &basic_setup, (void*)"precise" },
+-	{ "monotonic_prc_fallback", test_evutil_monotonic_prc, 0, &basic_setup, (void*)"fallback" },
++	{ "monotonic_prc_fallback", test_evutil_monotonic_prc, TT_RETRIABLE, &basic_setup, (void*)"fallback" },
+ 	{ "date_rfc1123", test_evutil_date_rfc1123, 0, NULL, NULL },
+ 	{ "evutil_v4addr_is_local", test_evutil_v4addr_is_local, 0, NULL, NULL },
+ 	{ "evutil_v6addr_is_local", test_evutil_v6addr_is_local, 0, NULL, NULL },
+-- 
+2.31.1
+
diff --git a/meta/recipes-support/libevent/libevent/0004-test-retriable-tests-are-marked-failed-only-when-all-a.patch b/meta/recipes-support/libevent/libevent/0004-test-retriable-tests-are-marked-failed-only-when-all-a.patch
new file mode 100644
index 000000000000..ae7db0b7aa85
--- /dev/null
+++ b/meta/recipes-support/libevent/libevent/0004-test-retriable-tests-are-marked-failed-only-when-all-a.patch
@@ -0,0 +1,81 @@
+From 36ebd92fa53c0097f1e2f9ec5aa5b5c6ec1b411d Mon Sep 17 00:00:00 2001
+From: Thomas Perrot <thomas.perrot@bootlin.com>
+Date: Wed, 29 Sep 2021 13:50:35 +0200
+Subject: [PATCH] test: retriable tests are marked failed only when all
+ attempts have failed
+
+Fixes: #1193
+
+Upstream-status: Pending
+
+Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
+---
+ test/tinytest.c | 13 ++++++-------
+ test/tinytest.h |  2 +-
+ 2 files changed, 7 insertions(+), 8 deletions(-)
+
+diff --git a/test/tinytest.c b/test/tinytest.c
+index 85dfe74a720e..bf2882418eb6 100644
+--- a/test/tinytest.c
++++ b/test/tinytest.c
+@@ -310,7 +310,8 @@ testcase_run_forked_(const struct testgroup_t *group,
+ 
+ int
+ testcase_run_one(const struct testgroup_t *group,
+-		 const struct testcase_t *testcase)
++		 const struct testcase_t *testcase,
++		 const int test_attempts)
+ {
+ 	enum outcome outcome;
+ 
+@@ -348,7 +349,7 @@ testcase_run_one(const struct testgroup_t *group,
+ 		if (opt_verbosity>0 && !opt_forked)
+ 			puts("SKIPPED");
+ 	} else {
+-		if (!opt_forked)
++		if (!opt_forked && (testcase->flags & TT_RETRIABLE) && !test_attempts)
+ 			printf("\n  [%s FAILED]\n", testcase->name);
+ 	}
+ 
+@@ -525,22 +526,20 @@ tinytest_main(int c, const char **v, struct testgroup_t *groups)
+ 		struct testgroup_t *group = &groups[i];
+ 		for (j = 0; group->cases[j].name; ++j) {
+ 			struct testcase_t *testcase = &group->cases[j];
+-			int test_attempts = 3;
++			int test_attempts = (testcase->flags & TT_RETRIABLE) ? 3: 1;
+ 			int test_ret_err;
+ 
+ 			if (!(testcase->flags & TT_ENABLED_))
+ 				continue;
+ 
+ 			for (;;) {
+-				test_ret_err = testcase_run_one(group, testcase);
++				test_ret_err = testcase_run_one(group, testcase, test_attempts);
+ 
+ 				if (test_ret_err == OK)
+ 					break;
+-				if (!(testcase->flags & TT_RETRIABLE))
++				if (!--test_attempts)
+ 					break;
+ 				printf("\n  [RETRYING %s (%i)]\n", testcase->name, test_attempts);
+-				if (!test_attempts--)
+-					break;
+ 			}
+ 
+ 			switch (test_ret_err) {
+diff --git a/test/tinytest.h b/test/tinytest.h
+index d321dd467542..c276b5339331 100644
+--- a/test/tinytest.h
++++ b/test/tinytest.h
+@@ -92,7 +92,7 @@ char *tinytest_format_hex_(const void *, unsigned long);
+ 	tinytest_set_flag_(groups, named, 1, TT_SKIP)
+ 
+ /** Run a single testcase in a single group. */
+-int testcase_run_one(const struct testgroup_t *,const struct testcase_t *);
++int testcase_run_one(const struct testgroup_t *,const struct testcase_t *, const int test_attempts);
+ 
+ void tinytest_set_aliases(const struct testlist_alias_t *aliases);
+ 
+-- 
+2.31.1
+
diff --git a/meta/recipes-support/libevent/libevent/run-ptest b/meta/recipes-support/libevent/libevent/run-ptest
index d3b5e793c3c5..ef4260d1c413 100644
--- a/meta/recipes-support/libevent/libevent/run-ptest
+++ b/meta/recipes-support/libevent/libevent/run-ptest
@@ -1,14 +1,14 @@
 #!/bin/sh
 
 # run-ptest - 'ptest' test infrastructure shell script that
-#   wraps the libevent test scripts 
+#   wraps the libevent test scripts
 #
 # Trevor Gamblin <trevor.gamblin@windriver.com>
 ###############################################################
 LIBEVENTLIB=@libdir@/libevent
 LOG="${LIBEVENTLIB}/ptest/libevent_ptest_$(date +%Y%m%d-%H%M%S).log"
 
-cd ${LIBEVENTLIB}/ptest 
+cd ${LIBEVENTLIB}/ptest
 
 # Run only the libevent "regress" test. All other test scripts in the
 # libevent "test" folder are related to performance, e.g. read/write
@@ -16,9 +16,9 @@ cd ${LIBEVENTLIB}/ptest
 # in the ptest log.
 ./test/regress 2>&1| sed -e '/TESTS/d' -e '/tests/d' -e '/OK/ s/^/PASS: / ; /FAILED/ s/^/FAIL: / ; /SKIPPED/ s/^/SKIP: / ; /DISABLED/ s/^/SKIP: /' | cut -f1,2 -d ':' | tee -a ${LOG}
 
-passed=`grep PASS ${LOG}|wc -l`
-failed=`grep FAIL ${LOG}|wc -l`
-skipped=`grep -E SKIP ${LOG}|wc -l`
+passed=`grep PASS: ${LOG}|wc -l`
+failed=`grep FAIL: ${LOG}|wc -l`
+skipped=`grep -E SKIP: ${LOG}|wc -l`
 all=$((passed + failed + skipped))
 
 (   echo "=== Test Summary ==="
diff --git a/meta/recipes-support/libevent/libevent_2.1.12.bb b/meta/recipes-support/libevent/libevent_2.1.12.bb
index 4b419eab226d..e26e8a9b5725 100644
--- a/meta/recipes-support/libevent/libevent_2.1.12.bb
+++ b/meta/recipes-support/libevent/libevent_2.1.12.bb
@@ -16,6 +16,8 @@ SRC_URI = "https://github.com/libevent/libevent/releases/download/release-${PV}-
            file://run-ptest \
            file://0001-test-regress_dns.c-patch-out-tests-that-require-a-wo.patch \
            file://0002-test-regress.h-Increase-default-timeval-tolerance-50.patch \
+           file://0003-test-mark-util-monotonic_prc_fallback-as-retriable.patch \
+           file://0004-test-retriable-tests-are-marked-failed-only-when-all-a.patch \
            "
 
 SRC_URI[sha256sum] = "92e6de1be9ec176428fd2367677e61ceffc2ee1cb119035037a27d346b0403bb"
@@ -56,7 +58,7 @@ do_install_ptest() {
 	do
 		install -m 0755 $file ${D}${PTEST_PATH}/test
 	done
-        
+
         # handle multilib
         sed -i s:@libdir@:${libdir}:g ${D}${PTEST_PATH}/run-ptest
 }
-- 
2.31.1


