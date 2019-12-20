Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
	[209.85.128.43])
	by mail.openembedded.org (Postfix) with ESMTP id E994D7FCE6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2019 16:23:37 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id c127so2131882wme.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2019 08:23:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=QMmOVDyn78odk/Liyd0mme4+U2WLeVHz0kfoj8lj+DQ=;
	b=qtQI04Piw/ItxfQkuA1mqiGBm7yT/7JCz4drF8LV/49rhkF3FywCJxc6dw6RyhGQUT
	49XgK2Qa62ZcTxTy3me5a/MsR9f06evACmzM0XxHVCJcEYBu9ezn4ZhFuaGlCezGeEQc
	gIp9TiafpQexXmESlAGhzoOZoyvs00b/OfoOPtIACKBIrDML2rudUPvfPF0zEF9o8GsD
	u4NRmOasusk1LrJ26PvbDYfObMKKiL9/g/Xy1HqSaaqygyhh+FXdl/heYfQHHVqhX3XK
	hFklJbfvPGJxApVyHsYqQ0qLXQIwwnnwSeYo9H/zfTadYs13nx4r3iowZgJAvXmcZ4sd
	Kwxg==
X-Gm-Message-State: APjAAAVABu5gOY2Rxs/ar5CIWE7HO8Z5nbQ1EN9kmWeKeDjTZ7Euoetu
	wFv6pS3emX+IDHynDl7f963LQF6m
X-Google-Smtp-Source: APXvYqx39ksV/PasyP7ECjnU+M4lMxSrwfPeuneKsqVkKf8MrhBlKng+uEwsdYRcTHl+eq098MhklQ==
X-Received: by 2002:a1c:ded6:: with SMTP id v205mr17132095wmg.86.1576859017996;
	Fri, 20 Dec 2019 08:23:37 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id x1sm9964981wru.50.2019.12.20.08.23.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Dec 2019 08:23:37 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Dec 2019 16:23:35 +0000
Message-Id: <20191220162335.36069-1-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
Subject: [PATCH] oeqa/runtime/ptest: fix detection of failed tests
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
X-List-Received-Date: Fri, 20 Dec 2019 16:23:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since commit d6065f136f6d ("oeqa/logparser: Various misc cleanups"),
7b17274c30c6 in poky, the ptest OEQA is unable to detect failures
in any of the test results.

The reason is that the test result string changed from 'fail' to
'FAILED', because the original mapping has been removed as part of
that commit, but the code in here is still trying to match against
the old string, resulting in no matches, i.e. everything is treated
as successful, even if it shouldn't be.

Update the OEQA ptest test to actually work again and report
failure if there was a failure.

Note that the ptest test is marked as @expectedfail, so even though
this test now again starts to fail, the overall OEQA test result is
not affected - but at least the overall OEQA test summary reflects
the correct status again.

In other words:
    RESULTS:
    RESULTS - ping.PingTest.test_ping: PASSED (0.26s)
    RESULTS - ptest.PtestRunnerTest.test_ptestrunner: PASSED (4.05s)
    RESULTS - ssh.SSHTest.test_ssh: PASSED (0.60s)
    SUMMARY:
    image-debug () - Ran 3 tests in 4.937s
correctly changes to:
    RESULTS:
    RESULTS - ping.PingTest.test_ping: PASSED (0.24s)
    RESULTS - ssh.SSHTest.test_ssh: PASSED (0.56s)
    RESULTS - ptest.PtestRunnerTest.test_ptestrunner: EXPECTEDFAIL (4.13s)
    SUMMARY:
    image-debug () - Ran 3 tests in 4.937s
instead.

Signed-off-by: André Draszik <git@andred.net>
---
 meta/lib/oeqa/runtime/cases/ptest.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/ptest.py b/meta/lib/oeqa/runtime/cases/ptest.py
index d8d1e1b344..aef79f62a9 100644
--- a/meta/lib/oeqa/runtime/cases/ptest.py
+++ b/meta/lib/oeqa/runtime/cases/ptest.py
@@ -68,7 +68,7 @@ class PtestRunnerTest(OERuntimeTestCase):
 
         failed_tests = {}
         for section in results:
-            failed_testcases = [ "_".join(test.translate(trans).split()) for test in results[section] if results[section][test] == 'fail' ]
+            failed_testcases = [ "_".join(test.translate(trans).split()) for test in results[section] if results[section][test] == 'FAILED' ]
             if failed_testcases:
                 failed_tests[section] = failed_testcases
 
-- 
2.23.0.rc1


