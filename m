Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id 6B6346BA9D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2019 05:31:17 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id q7so2794148pgi.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2019 22:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:from:to:cc:subject:content-transfer-encoding
	:mime-version; bh=pEH/khTWD3PP6tJ6R95QRsADX7oZFKn4Yg3lH7aW6PM=;
	b=ZIonODfqWuBFazAttOVBxpXxZnfN+7ACZz6duWg7ZNK2c3WhaF35BgIOygvErJGViV
	QNiQjxxWJYLcDQNOEWLh2obt0jdY9GCrw2RAWTTv6Kg2qCoxSTBNhQ+EKwDxLfTpsQ5k
	RB60rvYO/KpmInrGXNNZVYMEIRS80+p6ZfhnbN8C3tIYK7XNPa0xi+zbH8zHXrV9NSdr
	PeTNUpgM9h6wfjvOan4oCkCfNNxH0NLsFWCFaJXsY8GSu6xA/xearGWDjtO3t5Z4RTpS
	QHq6lwJIe68AeTP4bTY31tBNAXtxoUFkFqr6YAe9OGAbqd/CO8s41zOz3aMqEoeiMJ0+
	2nHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=pEH/khTWD3PP6tJ6R95QRsADX7oZFKn4Yg3lH7aW6PM=;
	b=Amzh08eEWlnxf4hLVTYYq17/oIqyCBr2+++ytMGkHt8ZECbvJm0YwVLzYLNIakML2O
	inZOqub5wBS/XSWMBepdsyTh89pmu2E6+MLNx+/9jJtsFDwfIJdaAIow7shvD+D/WIez
	imp3400/T+wlzkJUDZBo9Y7cTYqc+1w3wVvcRx7wuywCd3mY2j07vqvMmoFc2ATsaQv6
	W9+kRVTtAR05H7x+RRjTmYXV4XUNNIbqMYArbT1hKdhWZY6yX6rZ7mNYWFy427/uLPIB
	bsx8mJcANErjAi2B8TRIkT6ddTmgTBGMdi6hjWaQ4iogY1KZwSL5/1btNgXmM/YoYTZZ
	NoJw==
X-Gm-Message-State: APjAAAWvvlZJ2G3ME6p5K82cg/Aewmr9/74v/n/es+PoaNJ8e6JYMrlX
	zcpL+U03RfsgMwYmGHCCUZ0/Xw==
X-Google-Smtp-Source: APXvYqxScMdmJTV69D14zeoQhj/+hfYB/fbDYIO8GwfQ8JtAT8jfTCjT+12a3Metbev7iVaeK9NeqA==
X-Received: by 2002:a17:90a:2284:: with SMTP id s4mr7551705pjc.3.1569562278241;
	Thu, 26 Sep 2019 22:31:18 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.51.94])
	by smtp.gmail.com with UTF8SMTPSA id
	z12sm1120712pfj.41.2019.09.26.22.31.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 26 Sep 2019 22:31:17 -0700 (PDT)
Date: Fri, 27 Sep 2019 05:31:08 +0000
Message-Id: <20190927053108.14495-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH 1/2] oeqa/core/utils/concurrencytest.py: Handle exceptions and details
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
X-List-Received-Date: Fri, 27 Sep 2019 05:31:17 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Handle the streaming of exception content with details data. The
testtools package allows both 'err' and 'details' kwargs but can only
pass one of them to the parent.

To handle the passing of exception traceback and details data at the
same time, encode the traceback into the details object and remove the
'err' arg from the add* result call. This encodes the traceback similar
to how 'err' is handled without any details object. Decoding is already
done by testtools when the traceback is encoded in the details object.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/lib/oeqa/core/utils/concurrencytest.py | 31 +++++++++++++++++------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/meta/lib/oeqa/core/utils/concurrencytest.py b/meta/lib/oeqa/core/utils/concurrencytest.py
index 6293cf94ec..0f7b3dcc11 100644
--- a/meta/lib/oeqa/core/utils/concurrencytest.py
+++ b/meta/lib/oeqa/core/utils/concurrencytest.py
@@ -78,29 +78,29 @@ class ProxyTestResult:
     def __init__(self, target):
         self.result = target
 
-    def _addResult(self, method, test, *args, **kwargs):
+    def _addResult(self, method, test, *args, exception = False, **kwargs):
         return method(test, *args, **kwargs)
 
-    def addError(self, test, *args, **kwargs):
-        self._addResult(self.result.addError, test, *args, **kwargs)
+    def addError(self, test, err = None, **kwargs):
+        self._addResult(self.result.addError, test, err, exception = True, **kwargs)
 
-    def addFailure(self, test, *args, **kwargs):
-        self._addResult(self.result.addFailure, test, *args, **kwargs)
+    def addFailure(self, test, err = None, **kwargs):
+        self._addResult(self.result.addFailure, test, err, exception = True, **kwargs)
 
-    def addSuccess(self, test, *args, **kwargs):
-        self._addResult(self.result.addSuccess, test, *args, **kwargs)
+    def addSuccess(self, test, **kwargs):
+        self._addResult(self.result.addSuccess, test, **kwargs)
 
-    def addExpectedFailure(self, test, *args, **kwargs):
-        self._addResult(self.result.addExpectedFailure, test, *args, **kwargs)
+    def addExpectedFailure(self, test, err = None, **kwargs):
+        self._addResult(self.result.addExpectedFailure, test, err, exception = True, **kwargs)
 
-    def addUnexpectedSuccess(self, test, *args, **kwargs):
-        self._addResult(self.result.addUnexpectedSuccess, test, *args, **kwargs)
+    def addUnexpectedSuccess(self, test, **kwargs):
+        self._addResult(self.result.addUnexpectedSuccess, test, **kwargs)
 
     def __getattr__(self, attr):
         return getattr(self.result, attr)
 
 class ExtraResultsDecoderTestResult(ProxyTestResult):
-    def _addResult(self, method, test, *args, **kwargs):
+    def _addResult(self, method, test, *args, exception = False, **kwargs):
         if "details" in kwargs and "extraresults" in kwargs["details"]:
             if isinstance(kwargs["details"]["extraresults"], Content):
                 kwargs = kwargs.copy()
@@ -114,7 +114,7 @@ class ExtraResultsDecoderTestResult(ProxyTestResult):
         return method(test, *args, **kwargs)
 
 class ExtraResultsEncoderTestResult(ProxyTestResult):
-    def _addResult(self, method, test, *args, **kwargs):
+    def _addResult(self, method, test, *args, exception = False, **kwargs):
         if hasattr(test, "extraresults"):
             extras = lambda : [json.dumps(test.extraresults).encode()]
             kwargs = kwargs.copy()
@@ -123,6 +123,11 @@ class ExtraResultsEncoderTestResult(ProxyTestResult):
             else:
                 kwargs["details"] = kwargs["details"].copy()
             kwargs["details"]["extraresults"] = Content(ContentType("application", "json", {'charset': 'utf8'}), extras)
+        # if using details, need to encode any exceptions into the details obj,
+        # testtools does not handle "err" and "details" together.
+        if "details" in kwargs and exception and (len(args) >= 1 and args[0] is not None):
+            kwargs["details"]["traceback"] = testtools.content.TracebackContent(args[0], test)
+            args = []
         return method(test, *args, **kwargs)
 
 #
---
2.23.0

