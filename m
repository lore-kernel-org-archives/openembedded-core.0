Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id 5D4B17F47E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2019 16:37:55 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id g17so10030505wro.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2019 08:37:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=194cACuXqebDsHnM9dn7aO9DU0Dnd+z831c+s5kYhkA=;
	b=TBHToFe4S+IstIp+jMpyFSKrj6ZMlvycfHX5syxd1H7IcGMcqLobgW+GXIAkpRAJBu
	I/53GxhjEhLLuX8Cq0TpvAfyZt5vmd0GcjXgT5eh0jEMxe9VqWYEZ0SI8fpZ5aboSSpm
	Q95hTZ21GOvpP1BjLkB8p3axAkg1wuxAFPBAwLhr45Lm63lJ5F/VqVeH5cshy+yoNcJI
	nntdNDevq/oaXuDtQIqsFQV6n1nsdVYiPQkj7UWl4GzmueER3E8MX4aj33liz1gh+N/+
	xWt/QiNrl5QghD7+pycPteQO5VZGSe9iSWSz5TM4Gg0QZ20aDt/qkrwQt575jyXUmcm2
	IOXQ==
X-Gm-Message-State: APjAAAUWvlx0qr4KdlGZs/U29bv5v4vnwgofeetpAeiEmDt3kG/mffFO
	uwJDAo6NYoWw+Y0Y71pOhO7vmTaj
X-Google-Smtp-Source: APXvYqyPnhGuaaHvTEF8VcPjMdRTUi5MF9p/JWVUKlWQZ7pAehaDqAV4OKILX+CdeA/uilqJm0w0mg==
X-Received: by 2002:a5d:6ac2:: with SMTP id u2mr16633132wrw.233.1576859875824; 
	Fri, 20 Dec 2019 08:37:55 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	l3sm10142375wrt.29.2019.12.20.08.37.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Dec 2019 08:37:55 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Dec 2019 16:37:54 +0000
Message-Id: <20191220163754.37125-1-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20191220162335.36069-1-git@andred.net>
References: <20191220162335.36069-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v2] oeqa/runtime/ptest: fix detection of failed tests
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
X-List-Received-Date: Fri, 20 Dec 2019 16:37:55 -0000
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
    AssertionError: Failed ptests:
    {'dummytest': ['check_True_is_True', 'test_basic']}

    RESULTS:
    RESULTS - ping.PingTest.test_ping: PASSED (0.24s)
    RESULTS - ssh.SSHTest.test_ssh: PASSED (0.56s)
    RESULTS - ptest.PtestRunnerTest.test_ptestrunner: EXPECTEDFAIL (4.13s)
    SUMMARY:
    image-debug () - Ran 3 tests in 4.937s
instead and we see a summary of the ptest subtests that failed.

Signed-off-by: André Draszik <git@andred.net>

---
v2: update last sentence in commit message
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


