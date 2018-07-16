Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id 1D49471AC1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 16:33:32 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id c13-v6so32519783wrt.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 09:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=263CP5d/krJCJ9n5Mj5NsLh9FzlApVv9H4rJJTO4b7Q=;
	b=MYdPWLZonuaENwJYrxScWTbVD+66iDUQ+/KVIEh8qzzHp8JhNHLLLzb3EIfFFOMoCt
	8TqKhKHQ1PctQtaFt+HNaWHU3BJB39PmoY5vuuAbGwKQaaV5GXepQ1VY3dkZjVkaYWXA
	IwBS2IKPmyGEe8AnxtdFKfTeqR+ccQAxh9BWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=263CP5d/krJCJ9n5Mj5NsLh9FzlApVv9H4rJJTO4b7Q=;
	b=e3PV5V0H/1ql0dSZIsTuW1a6QRx58KdVEcM3T7zvdbhm5svuiqOqcIQ1qqhapuw+SQ
	AHeKH5cOemfbzOLItXbKCNu+TYsDeqYhVNQZmMZDRlgkQ1zmB32Sc6oiAnLqJil4CRH6
	lFXUCXrFZ2wzMhFWBRiwnP6gqOLfrBT3tzOIghGO6oF9X+6QD/uzYgM3Q4ukLgm8ql9J
	oXUQCobOl8tMOzVD3Uh3cC3MAVQbMGOKzedfUK8Sy4SbRsbbqJLT9hd68dvUMaVt8p0I
	xKpPQkgoLBjpCqKtKRtTFQthICz8qjStMAW9ey+1jrobkq8qX1wVQhcruLJsrj6/gnJ3
	lazw==
X-Gm-Message-State: AOUpUlEXE7OAH2W3sF5GhaYQxLAMEEZPicFI5c6hUps3iSKJyCChGmGf
	WYmhYOpHAyUOf/D60K15ocS+wjuzfVc=
X-Google-Smtp-Source: AAOMgpc90wy6Xr+1rXb5ePpC4Id8F2kU/TMQzZkMbSoR9vFmcEsMMU8Q2doSuhaycUU2WHHzNea+Ow==
X-Received: by 2002:adf:94e2:: with SMTP id
	89-v6mr11291097wrr.48.1531758812743; 
	Mon, 16 Jul 2018 09:33:32 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	j65-v6sm13571188wmd.39.2018.07.16.09.33.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jul 2018 09:33:31 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jul 2018 17:33:23 +0100
Message-Id: <20180716163325.13847-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180716163325.13847-1-richard.purdie@linuxfoundation.org>
References: <20180716163325.13847-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 4/6] oeqa: Remove xmlrunner
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
X-List-Received-Date: Mon, 16 Jul 2018 16:33:32 -0000

This isn't present on modern distros by default and doesn't work with
testtools, needing multiple code paths in the code. Remove it in favour
of finding a better replacement for results collection/analysis.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/runner.py | 54 ++++++------------------------------
 1 file changed, 9 insertions(+), 45 deletions(-)

diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index 0f84a1d2803..6650a63ce73 100644
--- a/meta/lib/oeqa/core/runner.py
+++ b/meta/lib/oeqa/core/runner.py
@@ -7,16 +7,8 @@ import unittest
 import logging
 import re
 
-xmlEnabled = False
-try:
-    import xmlrunner
-    from xmlrunner.result import _XMLTestResult as _TestResult
-    from xmlrunner.runner import XMLTestRunner as _TestRunner
-    xmlEnabled = True
-except ImportError:
-    # use the base runner instead
-    from unittest import TextTestResult as _TestResult
-    from unittest import TextTestRunner as _TestRunner
+from unittest import TextTestResult as _TestResult
+from unittest import TextTestRunner as _TestRunner
 
 class OEStreamLogger(object):
     def __init__(self, logger):
@@ -84,19 +76,10 @@ class OETestResult(_TestResult):
         found = False
 
         for (scase, msg) in getattr(self, type):
-            # XXX: When XML reporting is enabled scase is
-            # xmlrunner.result._TestInfo instance instead of
-            # string.
-            if xmlEnabled:
-                if case.id() == scase.test_id:
-                    found = True
-                    break
-                scase_str = scase.test_id
-            else:
-                if case.id() == scase.id():
-                    found = True
-                    break
-                scase_str = str(scase.id())
+            if case.id() == scase.id():
+                found = True
+                break
+            scase_str = str(scase.id())
 
             # When fails at module or class level the class name is passed as string
             # so figure out to see if match
@@ -167,33 +150,14 @@ class OETestRunner(_TestRunner):
     streamLoggerClass = OEStreamLogger
 
     def __init__(self, tc, *args, **kwargs):
-        if xmlEnabled:
-            if not kwargs.get('output'):
-                kwargs['output'] = os.path.join(os.getcwd(),
-                        'TestResults_%s_%s' % (time.strftime("%Y%m%d%H%M%S"), os.getpid()))
-
         kwargs['stream'] = self.streamLoggerClass(tc.logger)
         super(OETestRunner, self).__init__(*args, **kwargs)
         self.tc = tc
         self.resultclass = OETestResult
 
-    # XXX: The unittest-xml-reporting package defines _make_result method instead
-    # of _makeResult standard on unittest.
-    if xmlEnabled:
-        def _make_result(self):
-            """
-            Creates a TestResult object which will be used to store
-            information about the executed tests.
-            """
-            # override in subclasses if necessary.
-            return self.resultclass(self.tc,
-                self.stream, self.descriptions, self.verbosity, self.elapsed_times
-            )
-    else:
-        def _makeResult(self):
-            return self.resultclass(self.tc, self.stream, self.descriptions,
-                    self.verbosity)
-
+    def _makeResult(self):
+        return self.resultclass(self.tc, self.stream, self.descriptions,
+                self.verbosity)
 
     def _walk_suite(self, suite, func):
         for obj in suite:
-- 
2.17.1


