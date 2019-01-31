Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id 2588B6BA11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jan 2019 23:05:56 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id z5so5091612wrt.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jan 2019 15:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=GDCuHADY7JM5YONYVCexQeLqgyBySNvTZd+5ZKmIXwg=;
	b=aeLGEycRxXwWO9PYnodRkiLr+J0K40elIcoDfZ68nPbc/ttBMihtKc3GvCHFOoFcHa
	HKa6PQ7yq9VefYAES9qgnHqAqVi4+CAM4Xh8G8phl3YatVachZyFLVOuRJ/xU7nZ6Izw
	oErDlTUXsFg1WiCUhgCULnQ4YbwuVmNAlKZHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=GDCuHADY7JM5YONYVCexQeLqgyBySNvTZd+5ZKmIXwg=;
	b=rLzvYndgcCkFwLdTZ+XWOxlVc9zRcCGV/9Uy46uFKW7uejDRy1a5F7BGlm+SuhASXg
	sm87gZm7Clprs/hEZ1T3xW2nPnAn7Oth6CrNb5QZRkIGbiAi2vuqWVkJYu3tSf10Zxcq
	pQiNMJaioZE6dTyZ38OJWKTCw5L1g0t3Tcos1Ymwm5c0NYjOaD63E9zK+ebfWIRlpMP5
	Ta9OaRsK4hC3ofwv0tr7HBVYb10tevDQ+IXRQ9Flou904n3uoffQ7VpPlyurn/ZToigw
	Sw2q7Iqga+rfQ6NOQE95EChjWlkChbTTib1EZdSC6/et1s0wYnpu7HZY1xWLyLparhgS
	vgVQ==
X-Gm-Message-State: AJcUukfebCW1B8NijXLfoXgG5DS0lp9PNESv56pNUo19Qu9tSuiiiWxe
	UOltaFn2/mAsJmYWM0gZyvU15S1mLWA=
X-Google-Smtp-Source: ALg8bN7zNdL3bBUjDM1MaNX9e/ZX5388ZHeflMQQHz60JHXyHkN+40gkuIC2S96GTmwlMLg3Rw98rQ==
X-Received: by 2002:adf:b3c3:: with SMTP id x3mr36232194wrd.294.1548975956603; 
	Thu, 31 Jan 2019 15:05:56 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	p10sm4312634wrt.25.2019.01.31.15.05.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 31 Jan 2019 15:05:55 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Jan 2019 23:05:53 +0000
Message-Id: <20190131230553.31750-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190131230553.31750-1-richard.purdie@linuxfoundation.org>
References: <20190131230553.31750-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/2] oeqa/runtime/ptest: Ensure OOM errors are logged
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
X-List-Received-Date: Thu, 31 Jan 2019 23:05:56 -0000
Content-Transfer-Encoding: 8bit

Currently processed being killed by the OOM killer may not be spotted by
ptest-runner. After we complete the tests, check the logs and report if there
were any. This ensures the user is aware of OOM conditions affecting the
ptest results.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/runtime/cases/ptest.py | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/ptest.py b/meta/lib/oeqa/runtime/cases/ptest.py
index 6ae951356d8..2a28ca59a8e 100644
--- a/meta/lib/oeqa/runtime/cases/ptest.py
+++ b/meta/lib/oeqa/runtime/cases/ptest.py
@@ -70,5 +70,13 @@ class PtestRunnerTest(OERuntimeTestCase):
             if failed_testcases:
                 failed_tests[section] = failed_testcases
 
+        failmsg = ""
+        status, output = self.target.run('dmesg | grep "Killed process"', 0)
+        if output:
+            failmsg = "ERROR: Processes were killed by the OOM Killer:\n%s\n" % output
+
         if failed_tests:
-            self.fail("Failed ptests:\n%s" % pprint.pformat(failed_tests))
+            failmsg = failmsg + "Failed ptests:\n%s" % pprint.pformat(failed_tests)
+
+        if failmsg:
+            self.fail(failmsg)
-- 
2.19.1


