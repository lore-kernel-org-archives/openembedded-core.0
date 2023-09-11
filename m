Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C36CCEE7FF4
	for <webhook@archiver.kernel.org>; Mon, 11 Sep 2023 13:40:11 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web10.58614.1694439606391157551
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Sep 2023 06:40:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([91.232.154.11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1qfh92-00AWZ1-1L;
	Mon, 11 Sep 2023 16:40:04 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1qfh92-00AzaZ-5a; Mon, 11 Sep 2023 16:40:04 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 2/2] openssh: improve banner ptest failure logging
Date: Mon, 11 Sep 2023 16:39:50 +0300
Message-Id: <20230911133950.2618970-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230911133950.2618970-1-mikko.rapeli@linaro.org>
References: <20230911133950.2618970-1-mikko.rapeli@linaro.org>
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
 Symbol: NEURAL_SPAM(0.00)
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: RCPT_COUNT_TWO(0.00)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_DKIM_NA(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: ASN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Message-ID: 20230911133950.2618970-2-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 91.232.154.11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Sep 2023 13:40:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187491

Log the input and output banner files. Output seems to
contain more lines than input which fails the test but
it's not clear what is in there from the ssh command
stderr. So print them out to dig deeper into the root
cause.

Upstream rejected previous logging patch so they will likely
do the same for this:
https://github.com/openssh/openssh-portable/pull/437

Reference: https://bugzilla.yoctoproject.org/show_bug.cgi?id=15178

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 ...h-log-input-and-output-files-on-erro.patch | 61 +++++++++++++++++++
 .../openssh/openssh_9.4p1.bb                  |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch b/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch
new file mode 100644
index 0000000000..2c14014fed
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch
@@ -0,0 +1,61 @@
+From f5a4dacc987ca548fc86577c2dba121c86da3c34 Mon Sep 17 00:00:00 2001
+From: Mikko Rapeli <mikko.rapeli@linaro.org>
+Date: Mon, 11 Sep 2023 09:55:21 +0100
+Subject: [PATCH] regress/banner.sh: log input and output files on error
+
+Some test environments like yocto with qemu are seeing these
+tests failing. There may be additional error messages in the
+stderr of ssh cloent command. busybox cmp shows this error when
+first input file has less new line characters then second
+input file:
+
+cmp: EOF on /usr/lib/openssh/ptest/regress/banner.in
+
+Logging the full banner.out will show what other error messages
+are captured in addition of the expected banner.
+
+Full log of a failing banner test runs is:
+
+run test banner.sh ...
+test banner: missing banner file
+test banner: size 0
+cmp: EOF on /usr/lib/openssh/ptest/regress/banner.in
+banner size 0 mismatch
+test banner: size 10
+test banner: size 100
+cmp: EOF on /usr/lib/openssh/ptest/regress/banner.in
+banner size 100 mismatch
+test banner: size 1000
+test banner: size 10000
+test banner: size 100000
+test banner: suppress banner (-q)
+FAIL:  banner
+return value: 1
+
+See: https://bugzilla.yoctoproject.org/show_bug.cgi?id=15178
+
+Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
+---
+ regress/banner.sh | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+Upstream-Status: Denied [https://github.com/openssh/openssh-portable/pull/437]
+
+diff --git a/regress/banner.sh b/regress/banner.sh
+index a84feb5a..de84957a 100644
+--- a/regress/banner.sh
++++ b/regress/banner.sh
+@@ -32,7 +32,9 @@ for s in 0 10 100 1000 10000 100000 ; do
+ 	verbose "test $tid: size $s"
+ 	( ${SSH} -F $OBJ/ssh_proxy otherhost true 2>$OBJ/banner.out && \
+ 		cmp $OBJ/banner.in $OBJ/banner.out ) || \
+-		fail "banner size $s mismatch"
++		( verbose "Contents of $OBJ/banner.in:"; cat $OBJ/banner.in; \
++		  verbose "Contents of $OBJ/banner.out:"; cat $OBJ/banner.out; \
++		  fail "banner size $s mismatch" )
+ done
+ 
+ trace "test suppress banner (-q)"
+-- 
+2.34.1
+
diff --git a/meta/recipes-connectivity/openssh/openssh_9.4p1.bb b/meta/recipes-connectivity/openssh/openssh_9.4p1.bb
index 2c85780e4d..1cf6937038 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.4p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.4p1.bb
@@ -25,6 +25,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://sshd_check_keys \
            file://add-test-support-for-busybox.patch \
            file://0001-openssh-regress-Makefile-print-logs-if-test-fails.patch \
+           file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch \
            "
 SRC_URI[sha256sum] = "3608fd9088db2163ceb3e600c85ab79d0de3d221e59192ea1923e23263866a85"
 
-- 
2.34.1


