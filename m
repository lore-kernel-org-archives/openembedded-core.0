Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74628EDE9A1
	for <webhook@archiver.kernel.org>; Thu, 14 Sep 2023 10:37:07 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web10.8806.1694687816864494654
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Sep 2023 03:36:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1qgjiO-00A7rp-22;
	Thu, 14 Sep 2023 13:36:53 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1qgjiO-007Esn-Cn; Thu, 14 Sep 2023 13:36:52 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 1/3] openssh: capture logs in run-ptest
Date: Thu, 14 Sep 2023 13:36:43 +0300
Message-Id: <20230914103645.1725054-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspam-Score: -0.4 (/)
X-Rspam-Report: Action: no action
 Symbol: ARC_NA(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Symbol: FROM_HAS_DN(0.00)
 Symbol: TO_DN_SOME(0.00)
 Symbol: R_MISSING_CHARSET(0.50)
 Symbol: URI_HIDDEN_PATH(1.00)
 Symbol: MIME_GOOD(-0.10)
 Symbol: R_SPF_ALLOW(-0.20)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: RCPT_COUNT_TWO(0.00)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: NEURAL_HAM(0.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_DKIM_NA(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: ASN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Message-ID: 20230914103645.1725054-1-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Sep 2023 10:37:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187630

Drop patch to improve logging since upstream rejected it
but capture failure logs in run-ptests with similar code
as what upstream uses when running the tests via
https://github.com/openssh/openssh-portable/blob/master/.github/run_test.sh#L23

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 ...ss-Makefile-print-logs-if-test-fails.patch | 34 -------------------
 .../openssh/openssh/run-ptest                 | 14 ++++++++
 .../openssh/openssh_9.4p1.bb                  |  1 -
 3 files changed, 14 insertions(+), 35 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssh/openssh/0001-openssh-regress-Makefile-print-logs-if-test-fails.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/0001-openssh-regress-Makefile-print-logs-if-test-fails.patch b/meta/recipes-connectivity/openssh/openssh/0001-openssh-regress-Makefile-print-logs-if-test-fails.patch
deleted file mode 100644
index 3355ac4f23..0000000000
--- a/meta/recipes-connectivity/openssh/openssh/0001-openssh-regress-Makefile-print-logs-if-test-fails.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 554f7baed050f89ffc2a7192d3071e8c5420f6d3 Mon Sep 17 00:00:00 2001
-From: Mikko Rapeli <mikko.rapeli@linaro.org>
-Date: Fri, 25 Aug 2023 10:35:28 +0000
-Subject: [PATCH] openssh regress/Makefile: print logs if test fails
-
-Some tests are failing in CI runs and reproduction has failed. Print
-the captured sshd and ssh client logs if test fails. This should
-help to fix the root causes.
-
-Reference: https://bugzilla.yoctoproject.org/show_bug.cgi?id=15178
-
-Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
----
- regress/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Upstream-Status: Denied [https://github.com/openssh/openssh-portable/pull/437]
-
-diff --git a/regress/Makefile b/regress/Makefile
-index d80bf59..a972dff 100644
---- a/regress/Makefile
-+++ b/regress/Makefile
-@@ -229,7 +229,7 @@ t-exec:	${LTESTS:=.sh}
- 		done; \
- 		if [ "x$${skip}" = "xno" ]; then \
- 			echo "run test $${TEST}" ... 1>&2; \
--			(env SUDO="${SUDO}" TEST_ENV=${TEST_ENV} ${TEST_SHELL} ${.CURDIR}/test-exec.sh ${.OBJDIR} ${.CURDIR}/$${TEST}) || exit $$?; \
-+			(env SUDO="${SUDO}" TEST_ENV=${TEST_ENV} ${TEST_SHELL} ${.CURDIR}/test-exec.sh ${.OBJDIR} ${.CURDIR}/$${TEST}) || (echo return value: $$?; echo capturing logs; cat *.log; exit 1); \
- 		else \
- 			echo skip test $${TEST} 1>&2; \
- 		fi; \
--- 
-2.34.1
-
diff --git a/meta/recipes-connectivity/openssh/openssh/run-ptest b/meta/recipes-connectivity/openssh/openssh/run-ptest
index 8a9b770d59..1e6eec5799 100755
--- a/meta/recipes-connectivity/openssh/openssh/run-ptest
+++ b/meta/recipes-connectivity/openssh/openssh/run-ptest
@@ -4,6 +4,20 @@ export TEST_SHELL=sh
 export SKIP_UNIT=1
 
 cd regress
+
+# copied from openssh-portable/.github/run_test.sh
+output_failed_logs() {
+    for i in failed*.log; do
+        if [ -f "$i" ]; then
+            echo -------------------------------------------------------------------------
+            echo LOGFILE $i
+            cat $i
+            echo -------------------------------------------------------------------------
+        fi
+    done
+}
+trap output_failed_logs 0
+
 sed -i "/\t\tagent-ptrace /d" Makefile
 make -k BUILDDIR=`pwd`/.. .OBJDIR=`pwd` .CURDIR=`pwd` SUDO="sudo" tests \
         | sed -u -e 's/^skipped/SKIP: /g' -e 's/^ok /PASS: /g' -e 's/^failed/FAIL: /g'
diff --git a/meta/recipes-connectivity/openssh/openssh_9.4p1.bb b/meta/recipes-connectivity/openssh/openssh_9.4p1.bb
index 1cf6937038..a38d9c2b81 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.4p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.4p1.bb
@@ -24,7 +24,6 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://fix-potential-signed-overflow-in-pointer-arithmatic.patch \
            file://sshd_check_keys \
            file://add-test-support-for-busybox.patch \
-           file://0001-openssh-regress-Makefile-print-logs-if-test-fails.patch \
            file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch \
            "
 SRC_URI[sha256sum] = "3608fd9088db2163ceb3e600c85ab79d0de3d221e59192ea1923e23263866a85"
-- 
2.34.1


