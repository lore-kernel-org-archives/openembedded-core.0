Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2EA6C4332F
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 14:11:21 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web10.2496.1702390278975393643
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 06:11:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1rD3Tg-008ayF-1O;
	Tue, 12 Dec 2023 16:11:16 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1rD3Tg-0059oH-5n; Tue, 12 Dec 2023 16:11:16 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH][kirkstone] openssh: drop sudo from ptest dependencies
Date: Tue, 12 Dec 2023 16:11:01 +0200
Message-Id: <20231212141101.1227602-1-mikko.rapeli@linaro.org>
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
 Symbol: R_DKIM_NA(0.00)
 Symbol: R_SPF_ALLOW(-0.20)
 Symbol: ARC_NA(0.00)
 Symbol: ASN(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: TO_DN_SOME(0.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: NEURAL_SPAM(0.00)
 Symbol: RCPT_COUNT_THREE(0.00)
 Symbol: R_MISSING_CHARSET(0.50)
 Message-ID: 20231212141101.1227602-1-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 14:11:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192203

The tests don't actually need sudo on core-image-ptest-openssh.
Based on logs seen in
https://bugzilla.yoctoproject.org/show_bug.cgi?id=15178 it seems
that socket errors from sudo are creeping into stderr which are failing
the banner ptest from openssh. Removing sudo should help removing
the stderr messages and possibly cure the banner test failures.

(From OE-Core rev: 47e754f483b674b207bfddcc8d4c5d9a3008e102)

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-connectivity/openssh/openssh/run-ptest | 2 +-
 meta/recipes-connectivity/openssh/openssh_8.9p1.bb  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

v1: Issue https://bugzilla.yoctoproject.org/show_bug.cgi?id=15178 was still seen on kirkstone
    branch so cherry-pick the master/nanbield commit

diff --git a/meta/recipes-connectivity/openssh/openssh/run-ptest b/meta/recipes-connectivity/openssh/openssh/run-ptest
index 8a9b770d59..9a406e9b65 100755
--- a/meta/recipes-connectivity/openssh/openssh/run-ptest
+++ b/meta/recipes-connectivity/openssh/openssh/run-ptest
@@ -5,7 +5,7 @@ export SKIP_UNIT=1
 
 cd regress
 sed -i "/\t\tagent-ptrace /d" Makefile
-make -k BUILDDIR=`pwd`/.. .OBJDIR=`pwd` .CURDIR=`pwd` SUDO="sudo" tests \
+make -k BUILDDIR=`pwd`/.. .OBJDIR=`pwd` .CURDIR=`pwd` SUDO="" tests \
         | sed -u -e 's/^skipped/SKIP: /g' -e 's/^ok /PASS: /g' -e 's/^failed/FAIL: /g'
 
 SSHAGENT=`which ssh-agent`
diff --git a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
index da7ab7716c..32761b8bb8 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
@@ -170,7 +170,7 @@ RDEPENDS:${PN}-sshd += "${PN}-keygen ${@bb.utils.contains('DISTRO_FEATURES', 'pa
 # conflict with each other
 RDEPENDS:${PN}-dev = ""
 # gdb would make attach-ptrace test pass rather than skip but not worth the build dependencies
-RDEPENDS:${PN}-ptest += "${PN}-sftp ${PN}-misc ${PN}-sftp-server make sed sudo coreutils"
+RDEPENDS:${PN}-ptest += "${PN}-sftp ${PN}-misc ${PN}-sftp-server make sed coreutils"
 
 RPROVIDES:${PN}-ssh = "ssh"
 RPROVIDES:${PN}-sshd = "sshd"
-- 
2.39.2


