Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32476EB8FCE
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 13:23:23 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web10.8744.1694006600536424475
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 06:23:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1qdsV3-00HLGZ-0W;
	Wed, 06 Sep 2023 16:23:17 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1qdsV2-007B0F-Ta; Wed, 06 Sep 2023 16:23:16 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH] openssh: capture ptest regression test failure logs
Date: Wed,  6 Sep 2023 16:23:11 +0300
Message-Id: <20230906132311.1710272-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspam-Score: -1.4 (-)
X-Rspam-Report: Action: no action
 Symbol: ARC_NA(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Symbol: FROM_HAS_DN(0.00)
 Symbol: TO_DN_SOME(0.00)
 Symbol: R_MISSING_CHARSET(0.50)
 Symbol: R_SPF_ALLOW(-0.20)
 Symbol: MIME_GOOD(-0.10)
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
 Message-ID: 20230906132311.1710272-1-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 13:23:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187315

When tests fail, capture the sshd and ssh client logs from
the failing test run. These are needed to investigate
the root cause.

Reference: https://bugzilla.yoctoproject.org/show_bug.cgi?id=15178

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 ...ss-Makefile-print-logs-if-test-fails.patch | 34 +++++++++++++++++++
 .../openssh/openssh_9.4p1.bb                  |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/0001-openssh-regress-Makefile-print-logs-if-test-fails.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/0001-openssh-regress-Makefile-print-logs-if-test-fails.patch b/meta/recipes-connectivity/openssh/openssh/0001-openssh-regress-Makefile-print-logs-if-test-fails.patch
new file mode 100644
index 0000000000..bcadbbed0b
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/0001-openssh-regress-Makefile-print-logs-if-test-fails.patch
@@ -0,0 +1,34 @@
+From 554f7baed050f89ffc2a7192d3071e8c5420f6d3 Mon Sep 17 00:00:00 2001
+From: Mikko Rapeli <mikko.rapeli@linaro.org>
+Date: Fri, 25 Aug 2023 10:35:28 +0000
+Subject: [PATCH] openssh regress/Makefile: print logs if test fails
+
+Some tests are failing in CI runs and reproduction has failed. Print
+the captured sshd and ssh client logs if test fails. This should
+help to fix the root causes.
+
+Reference: https://bugzilla.yoctoproject.org/show_bug.cgi?id=15178
+
+Upstream-Status: Pending
+
+Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
+---
+ regress/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/regress/Makefile b/regress/Makefile
+index d80bf59..a972dff 100644
+--- a/regress/Makefile
++++ b/regress/Makefile
+@@ -229,7 +229,7 @@ t-exec:	${LTESTS:=.sh}
+ 		done; \
+ 		if [ "x$${skip}" = "xno" ]; then \
+ 			echo "run test $${TEST}" ... 1>&2; \
+-			(env SUDO="${SUDO}" TEST_ENV=${TEST_ENV} ${TEST_SHELL} ${.CURDIR}/test-exec.sh ${.OBJDIR} ${.CURDIR}/$${TEST}) || exit $$?; \
++			(env SUDO="${SUDO}" TEST_ENV=${TEST_ENV} ${TEST_SHELL} ${.CURDIR}/test-exec.sh ${.OBJDIR} ${.CURDIR}/$${TEST}) || (echo return value: $$?; echo capturing logs; cat *.log; exit 1); \
+ 		else \
+ 			echo skip test $${TEST} 1>&2; \
+ 		fi; \
+-- 
+2.34.1
+
diff --git a/meta/recipes-connectivity/openssh/openssh_9.4p1.bb b/meta/recipes-connectivity/openssh/openssh_9.4p1.bb
index 3f232a839d..2c85780e4d 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.4p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.4p1.bb
@@ -24,6 +24,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://fix-potential-signed-overflow-in-pointer-arithmatic.patch \
            file://sshd_check_keys \
            file://add-test-support-for-busybox.patch \
+           file://0001-openssh-regress-Makefile-print-logs-if-test-fails.patch \
            "
 SRC_URI[sha256sum] = "3608fd9088db2163ceb3e600c85ab79d0de3d221e59192ea1923e23263866a85"
 
-- 
2.34.1


