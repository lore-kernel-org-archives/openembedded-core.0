Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id A87CA6C245
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2018 22:59:34 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id z13-v6so15172741wrs.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2018 14:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=9J88ChkjZthFQSVjTWt7QeAshkeawUbZ6CHy3+eVmx8=;
	b=ZaEEpUOScIXliuxrprj08KwpLCo+aekEeTLgmYPlzePimMzOj52O/oMGLbmrgNTYos
	1R9io7McCfdegIBmaCvQU5rJCeBtP0MkZM6Jp4RIY+X76RPYPkHHAkR7i+sqajTwDmJP
	j/E+kb75zilZAO2jIzEEjaZ1PkQuwXvodkCZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=9J88ChkjZthFQSVjTWt7QeAshkeawUbZ6CHy3+eVmx8=;
	b=azV9FXw3L+GCr14bQTnnu+sNCRVNwJMxxRDLFSvYHXnO3I4v2uxyePlh1tSpquuaq+
	/BBkXFqzma5hAMJB1/I742SEj9wbGFNzQk3PSf5dA/imAFevvyx1QEAUz47QBVS7fnAV
	iiJgSKYJANFSUI4Ptx9F4vws/eQNwFIMMydY/+BUQfkbr/vOfhZtvPRehcQv5Fxt6lUQ
	D5nVDK90jehnmxoujN8oMwalUqG85hyo87LQ7bAUZdG/Y/mFwAEe+yyAXnDYWWVHPW9o
	GTG0P3FulPD7xhehJyKICydctVo2d+4VQORzCkD/EWuJadv5Qlcjb9ArMV+TGFjYOhvH
	7j6Q==
X-Gm-Message-State: AGRZ1gJYWQ1J9P/reTccseSSH6lKUP4boG278yegYDOIayz/CKzzpNNR
	bZWJ0mapZ1Nic8Kdaoim7JjI8Sm5KRU=
X-Google-Smtp-Source: AJdET5dyKhSwRtEyNx8j0RUnCV/w6s5wBdR0b6TXFRuDaO+0VC+OcrHam4U13C5ivn0C1eNdDKb9Fw==
X-Received: by 2002:adf:94a3:: with SMTP id 32-v6mr6273946wrr.98.1542149974671;
	Tue, 13 Nov 2018 14:59:34 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	y2-v6sm36426474wrh.53.2018.11.13.14.59.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Nov 2018 14:59:33 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Nov 2018 22:59:28 +0000
Message-Id: <20181113225932.17726-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/5] oeqa/runner: Always show a summary of success/fail/error/skip counts
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
X-List-Received-Date: Tue, 13 Nov 2018 22:59:34 -0000

Its useful to have the counts of success/failure/error/skipped at the end of the
results to allow for easier human reading of what happened.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/runner.py | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index 034f2232402..e8f9ee0109b 100644
--- a/meta/lib/oeqa/core/runner.py
+++ b/meta/lib/oeqa/core/runner.py
@@ -76,9 +76,7 @@ class OETestResult(_TestResult):
             msg = "%s - OK - All required tests passed" % component
         else:
             msg = "%s - FAIL - Required tests failed" % component
-        skipped = len(self.skipped)
-        if skipped:
-            msg += " (skipped=%d)" % skipped
+        msg += " (successes=%d, skipped=%d, failures=%d, errors=%d)" % (len(self.successes), len(self.skipped), len(self.failures), len(self.errors))
         self.tc.logger.info(msg)
 
     def _getTestResultDetails(self, case):
-- 
2.17.1


