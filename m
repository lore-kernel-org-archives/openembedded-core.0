Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 844056C245
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2018 22:59:35 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id t15-v6so13060014wmt.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2018 14:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=aWoWHr+mCMSRX20HG7EGXAVayKhnF7Cemeojt/trKcM=;
	b=HGMUxJEk6TAkBt2DqFifXuRpf2mxnXjm/QpOmYm2I7C1sVe5VAIb3Kin+SKb0reZ4D
	MNexBxwJRjuR7i+uwWI+l0lBtAg3GolYYEYoBqX7ViNfdqkGMby7UuET8ZFNxqdNPBse
	1PKtvJlmviJlU3P62kyNoQ6DqXbaSJ2Ifon/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=aWoWHr+mCMSRX20HG7EGXAVayKhnF7Cemeojt/trKcM=;
	b=D5fOgih96NtcC+CJw7gDvMnEgtdc+JUvl6iPFWnb679DEqp9dsLSDptwywji953L9r
	unEcmonQQU8kmSKEwBv9OOX4OKTd/9V5UDycbREPgABNYX5OReXLBIzox1y9+5CQTThu
	D1StfrEzzsUOu99XxV2kqwPVMpl3v/p+3wAm5emmOWCix9/YpUnK1qzk4d8vtqvs54S8
	k1pX5OlskP//lgoOq/QK3AaNPG/oj2+sgXVQeF85IRI525/h8iVmmxmHZO0JVcLru4rW
	OW3M+u1AemUnxVr3a2QDlOY2ZjNRzxhlIQRYyqQ7mWYRV51r2pKL3q4YygOlTyRyY7XM
	qQPg==
X-Gm-Message-State: AGRZ1gLRrRKozwk/Ex5diyvAvoLU0QdJz9KdVdL8Xhq752prYeK1QCMQ
	trp8wQt2AO974U+pDJM5719EewGV6ak=
X-Google-Smtp-Source: AJdET5fP/kJOuFbLicMLo7zoQzOkSCmiOiczJjqkyHzFYuOunay+IBw2T5/H6TW2q6KIcWtLLYYD/A==
X-Received: by 2002:a1c:48c2:: with SMTP id
	v185-v6mr4935268wma.1.1542149975570; 
	Tue, 13 Nov 2018 14:59:35 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	y2-v6sm36426474wrh.53.2018.11.13.14.59.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Nov 2018 14:59:34 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Nov 2018 22:59:29 +0000
Message-Id: <20181113225932.17726-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181113225932.17726-1-richard.purdie@linuxfoundation.org>
References: <20181113225932.17726-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/5] oeqa/runner: Sort the test result output by result class
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
X-List-Received-Date: Tue, 13 Nov 2018 22:59:35 -0000

We want to see failures/errors listed last since this is the most easily
visible part of the log on consoles or autobuilder output and makes
human processing easier rather than having to scroll up and scan for
a single failure.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/runner.py | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index e8f9ee0109b..7035adfaae0 100644
--- a/meta/lib/oeqa/core/runner.py
+++ b/meta/lib/oeqa/core/runner.py
@@ -122,6 +122,7 @@ class OETestResult(_TestResult):
         self.tc.logger.info("RESULTS:")
 
         result = {}
+        logs = {}
         if hasattr(self.tc, "extraresults"):
             result = self.tc.extraresults
 
@@ -140,12 +141,20 @@ class OETestResult(_TestResult):
             if case.id() in self.starttime and case.id() in self.endtime:
                 t = " (" + "{0:.2f}".format(self.endtime[case.id()] - self.starttime[case.id()]) + "s)"
 
-            self.tc.logger.info("RESULTS - %s - Testcase %s: %s%s" % (case.id(), oeid, status, t))
+            if status not in logs:
+                logs[status] = []
+            logs[status].append("RESULTS - %s - Testcase %s: %s%s" % (case.id(), oeid, status, t))
             if log:
                 result[case.id()] = {'status': status, 'log': log}
             else:
                 result[case.id()] = {'status': status}
 
+        for i in ['PASSED', 'SKIPPED', 'EXPECTEDFAIL', 'ERROR', 'FAILED', 'UNKNOWN']:
+            if i not in logs:
+                continue
+            for l in logs[i]:
+                self.tc.logger.info(l)
+
         if json_file_dir:
             tresultjsonhelper = OETestResultJSONHelper()
             tresultjsonhelper.dump_testresult_file(json_file_dir, configuration, result_id, result)
-- 
2.17.1


