Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C179EC38141
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 14:45:08 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web10.75890.1674225899787294524
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jan 2023 06:45:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1pIsdT-006KU8-GB; Fri, 20 Jan 2023 16:44:55 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1pIsdT-00CEHj-6c; Fri, 20 Jan 2023 16:44:55 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 00/14] oeqa runtime tests when qemu hangs
Date: Fri, 20 Jan 2023 16:44:36 +0200
Message-Id: <20230120144450.2913935-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspam-Score: -1.2 (-)
X-Rspam-Report: Action: no action
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: ARC_NA(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Symbol: FROM_HAS_DN(0.00)
 Symbol: TO_DN_SOME(0.00)
 Symbol: R_MISSING_CHARSET(0.50)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: MIME_GOOD(-0.10)
 Symbol: RCPT_COUNT_TWO(0.00)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: NEURAL_HAM(-0.00)
 Symbol: R_SPF_NA(0.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_DKIM_NA(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: ASN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Message-ID: 20230120144450.2913935-1-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 14:45:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176192

I get a qemu hang on kirkstone, swtpm and optee. One of the
optee-test/xtest hangs the qemu machine in some kind of deadlock.
While this needs to be debugged and tested, the oeqa runtime tests
also hanged and never returned. Thus this patch set. With these changes
qemu deadlock is detected and with do_testimage() task eventually exits
with all correct tests failing and the hangin qemu system killed.
There are a lot of debug prints added by this patch set but I don't of
any other way to debug complex python code. strace output from the hang
doesn't tell where the deadlock happened.

Tested on kirkstone and cherry-picked to master. If something blows up
I'll do more testing on master branch based setup.

Mikko Rapeli (14):
  oeqa ssh.py: move output prints to new line
  oeqa ssh.py: fix hangs in run() and add debug prints
  oeqa ssh.py: clarify timeout API and add more debug prints to run()
  oeqa ssh.py: add connection keep alive options to ssh client
  testimage.bbclass: add debug prints for major state changes
  oeqa dump.py: add error counter and stop after 5 failures
  oeqa qemurunner.py: use os.set_blocking() instead of fcntl()
  oeqa qemurunner: read more data at a time from serial and log all of
    it
  oeqa qemurunner.py: increase boot failure warning log from 25 to 100
    lines
  oeqa qemurunner.py: add debug prints to stop()
  oeqa qemurunner.py: add timeout to QMP calls
  oeqa qemurunner.py: kill qemu if it hangs
  oeqa qemurunner.py: add debug output to run_serial()
  oeqa qemurunner.py: improve logging in run_serial()

 meta/classes-recipe/testimage.bbclass |  8 ++++
 meta/lib/oeqa/core/target/ssh.py      | 63 +++++++++++++++++++++------
 meta/lib/oeqa/utils/dump.py           | 23 +++++++++-
 meta/lib/oeqa/utils/qemurunner.py     | 41 ++++++++++++++---
 4 files changed, 113 insertions(+), 22 deletions(-)

-- 
2.34.1


