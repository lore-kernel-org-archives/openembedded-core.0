Return-Path: <nathan@nathanrossi.com>
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id 551AF7F265
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2019 14:23:36 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id 4so9642260pld.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Sep 2019 07:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=/NmXkALFFSZ/JDxFTYsH1jDahqhIizq+3LZtHaO9aEA=;
	b=RLM02WdSDMTEkGSmcjmocCLFC5iRTghB9OQqN6umX6jZ0vTdCwk7CSVYQXCmz65OJZ
	1KPUrdAwuQULwk7KXYxZgVtn6ia5bvMvfpksqFxOff7K4HWXXYRNWAe265xY28Xb4cGa
	N4v7nYtEi5hNlqKzWYu26VkM0FDCXlU1OBtyW7J6iJlpNjZd8gees4WkDbeYJ2JEcF9E
	zbh4GHI1ZJqCjYiRI4+KvdoiCGkk3FBY+vLIpLEIQ5QCeRHhygFIN6cE4lg4yotB7xmB
	ALDyFetT2kEllmhTlrnkII4sJLsvc0bion76r4e21itLXUgkDSW37WGLA6T5kopebkSM
	RWJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:content-transfer-encoding:mime-version;
	bh=/NmXkALFFSZ/JDxFTYsH1jDahqhIizq+3LZtHaO9aEA=;
	b=O5OGIy7iIrJg/DLyu3AfjMo9+ZaVXG9hHQVdSv9dZ6bTLUOhpsv8wNA5tCgMV+IWsv
	s42Q+3CZdMcAOgQAWUrksC/c0v6X8lhoTM2LyAcq3nEdK64aTJDxnd7Uaz/qqO5sYpap
	vAB3ysfHLpSCsvKlAzlruKcl/fI15VU7rIKxEEiSc5CYp9x9gAnuiA7xJrLDv9ZaABbh
	VAImVCz1X3kA50/nTbnvUjCdNkIEotE5rZyPDgBocQvzjyQVWys7XAboRRn5cn3Td/o4
	L/Qzw3v03IigwqhrmESfHTx5Y0wONkLUDbu42WlZX9UVjSP+lsd5PASAOjayeObszGFu
	mDSQ==
X-Gm-Message-State: APjAAAV0atTECEuaBH1u8eoU301KRDoCBF9VybHH2kZ+hywLK/CjLURB
	RIysD1Suxp7d/bHmBNylR0ssXW6dAN/TqA==
X-Google-Smtp-Source: APXvYqyQdTfE0B1bzECHhKxLjRrAnNbI5IuMSKNNQL+5vfmAdIQ/HfANx3Yib0RQ0TITwANthds9rA==
X-Received: by 2002:a17:902:d886:: with SMTP id
	b6mr15894162plz.149.1567607017334; 
	Wed, 04 Sep 2019 07:23:37 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.76.229])
	by smtp.gmail.com with UTF8SMTPSA id
	j18sm24747181pfh.70.2019.09.04.07.23.35
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 04 Sep 2019 07:23:36 -0700 (PDT)
Date: Wed, 04 Sep 2019 14:23:23 +0000
Message-Id: <20190904142323.21781-2-nathan@nathanrossi.com>
In-Reply-To: <20190904142323.21781-1-nathan@nathanrossi.com>
References: <20190904142323.21781-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH 2/4] oeqa/selftest: For toolchain tests do not fail if a test failed
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
X-List-Received-Date: Wed, 04 Sep 2019 14:23:36 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Do not fail the running selftest test case if the test suite has a
failed test case. Currently toolchain tests suites (binutils, gcc,
glibc) fail but this does not indicate failure to execute the tests.

Also remove the logging of each test that failed.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/lib/oeqa/selftest/cases/binutils.py | 6 ------
 meta/lib/oeqa/selftest/cases/gcc.py      | 6 ------
 meta/lib/oeqa/selftest/cases/glibc.py    | 5 -----
 3 files changed, 17 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/binutils.py b/meta/lib/oeqa/selftest/cases/binutils.py
index 4edee09390..7f887959e4 100644
--- a/meta/lib/oeqa/selftest/cases/binutils.py
+++ b/meta/lib/oeqa/selftest/cases/binutils.py
@@ -52,13 +52,7 @@ class BinutilsCrossSelfTest(OESelftestTestCase):
         if not os.path.exists(sumspath):
             sumspath = os.path.join(builddir, suite, "testsuite", "{0}.sum".format(suite))
 
-        failed = 0
         with open(sumspath, "r") as f:
             for test, result in parse_values(f):
                 self.tc.extraresults["ptestresult.{}.{}".format(ptestsuite, test)] = {"status" : result}
-                if result == "FAIL":
-                    self.logger.info("failed: '{}'".format(test))
-                    failed += 1
-
-        self.assertEqual(failed, 0)
 
diff --git a/meta/lib/oeqa/selftest/cases/gcc.py b/meta/lib/oeqa/selftest/cases/gcc.py
index 0ad6e21d6b..4f7ffdcb2a 100644
--- a/meta/lib/oeqa/selftest/cases/gcc.py
+++ b/meta/lib/oeqa/selftest/cases/gcc.py
@@ -71,7 +71,6 @@ class GccSelfTest(OESelftestTestCase):
         bb_vars = get_bb_vars(["B", "TARGET_SYS"], recipe)
         builddir, target_sys = bb_vars["B"], bb_vars["TARGET_SYS"]
 
-        failed = 0
         for suite in suites:
             sumspath = os.path.join(builddir, "gcc", "testsuite", suite, "{0}.sum".format(suite))
             if not os.path.exists(sumspath): # check in target dirs
@@ -84,11 +83,6 @@ class GccSelfTest(OESelftestTestCase):
             with open(sumspath, "r") as f:
                 for test, result in parse_values(f):
                     self.tc.extraresults["ptestresult.{}.{}".format(ptestsuite, test)] = {"status" : result}
-                    if result == "FAIL":
-                        self.logger.info("failed: '{}'".format(test))
-                        failed += 1
-
-        self.assertEqual(failed, 0)
 
 class GccSelfTestSystemEmulated(GccSelfTest):
     default_installed_packages = ["libgcc", "libstdc++", "libatomic", "libgomp"]
diff --git a/meta/lib/oeqa/selftest/cases/glibc.py b/meta/lib/oeqa/selftest/cases/glibc.py
index 6a34da39d9..7992ea6bf2 100644
--- a/meta/lib/oeqa/selftest/cases/glibc.py
+++ b/meta/lib/oeqa/selftest/cases/glibc.py
@@ -43,15 +43,10 @@ class GlibcSelfTest(OESelftestTestCase):
 
         builddir = get_bb_var("B", "glibc-testsuite")
 
-        failed = 0
         self.tc.extraresults["ptestresult.sections"]["glibc"] = {}
         with open(os.path.join(builddir, "tests.sum"), "r") as f:
             for test, result in parse_values(f):
                 self.tc.extraresults["ptestresult.glibc.{}".format(test)] = {"status" : result}
-                if result == "FAIL":
-                    self.logger.info("failed: '{}'".format(test))
-                    failed += 1
-        self.assertEqual(failed, 0)
 
 class GlibcSelfTestSystemEmulated(GlibcSelfTest):
     default_installed_packages = [
---
2.23.0.rc1

