Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7598BE81E06
	for <webhook@archiver.kernel.org>; Fri,  6 Oct 2023 15:05:21 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web11.15277.1696604717775831278
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Oct 2023 08:05:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1qomO9-00FSlF-29;
	Fri, 06 Oct 2023 18:05:13 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1qomO9-006bZt-3M; Fri, 06 Oct 2023 18:05:13 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH] openssh: drop sudo from ptest dependencies
Date: Fri,  6 Oct 2023 18:05:02 +0300
Message-Id: <20231006150502.1572335-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspam-Score: -1.4 (-)
X-Rspam-Report: Action: no action
 Symbol: FROM_HAS_DN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Symbol: MIME_GOOD(-0.10)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: RCPT_COUNT_TWO(0.00)
 Symbol: R_DKIM_NA(0.00)
 Symbol: NEURAL_HAM(0.00)
 Symbol: BLOCKLISTDE_FAIL(0.00)
 Symbol: R_SPF_ALLOW(-0.20)
 Symbol: ARC_NA(0.00)
 Symbol: ASN(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: TO_DN_SOME(0.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_MISSING_CHARSET(0.50)
 Message-ID: 20231006150502.1572335-1-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 15:05:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188775

The tests don't actually need sudo on core-image-ptest-openssh.
Based on logs seen in
https://bugzilla.yoctoproject.org/show_bug.cgi?id=15178 it seems
that socket errors from sudo are creeping into stderr which are failing
the banner ptest from openssh. Removing sudo should help removing
the stderr messages and possibly cure the banner test failures.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/recipes-connectivity/openssh/openssh/run-ptest | 2 +-
 meta/recipes-connectivity/openssh/openssh_9.4p1.bb  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh/run-ptest b/meta/recipes-connectivity/openssh/openssh/run-ptest
index 1e6eec5799..b2244d725a 100755
--- a/meta/recipes-connectivity/openssh/openssh/run-ptest
+++ b/meta/recipes-connectivity/openssh/openssh/run-ptest
@@ -19,7 +19,7 @@ output_failed_logs() {
 trap output_failed_logs 0
 
 sed -i "/\t\tagent-ptrace /d" Makefile
-make -k BUILDDIR=`pwd`/.. .OBJDIR=`pwd` .CURDIR=`pwd` SUDO="sudo" tests \
+make -k BUILDDIR=`pwd`/.. .OBJDIR=`pwd` .CURDIR=`pwd` SUDO="" tests \
         | sed -u -e 's/^skipped/SKIP: /g' -e 's/^ok /PASS: /g' -e 's/^failed/FAIL: /g'
 
 SSHAGENT=`which ssh-agent`
diff --git a/meta/recipes-connectivity/openssh/openssh_9.4p1.bb b/meta/recipes-connectivity/openssh/openssh_9.4p1.bb
index a38d9c2b81..e2508aa63a 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.4p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.4p1.bb
@@ -158,7 +158,7 @@ FILES:${PN}-keygen = "${bindir}/ssh-keygen"
 RDEPENDS:${PN} += "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen ${PN}-sftp-server"
 RDEPENDS:${PN}-sshd += "${PN}-keygen ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-keyinit pam-plugin-loginuid', '', d)}"
 # gdb would make attach-ptrace test pass rather than skip but not worth the build dependencies
-RDEPENDS:${PN}-ptest += "${PN}-sftp ${PN}-misc ${PN}-sftp-server make sed sudo coreutils openssl-bin"
+RDEPENDS:${PN}-ptest += "${PN}-sftp ${PN}-misc ${PN}-sftp-server make sed coreutils openssl-bin"
 
 RPROVIDES:${PN}-ssh = "ssh"
 RPROVIDES:${PN}-sshd = "sshd"
-- 
2.34.1


