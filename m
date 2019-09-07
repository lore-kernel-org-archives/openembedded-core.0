Return-Path: <nathan@nathanrossi.com>
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
	[209.85.214.176])
	by mail.openembedded.org (Postfix) with ESMTP id 934267F46A
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Sep 2019 12:55:17 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id x3so4456089plr.12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Sep 2019 05:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:from:to:cc:subject:content-transfer-encoding
	:mime-version; bh=8XV+po39LPJk0k0yUlkq94BqcVItL0noml3yV+9MOno=;
	b=SetWJsSNRchaL0giCxKHKw1Z731zN4VV1LrlsPZDGvzFCLBNTTIUnqVn1FtK2GvSGO
	2/nM2wCsqCYJWgIny3YqiuE7FvtHc+o5K8YO47FxScNUobMpf3ARraD8mL1oKkCvyal1
	lD7MdAeWkZEgHUE0/nj1HYwLIUZi/CjDR2ijiFamq5PD/jGYshdNWfyK5pyXFf0qvddQ
	wBcwh7/pRBV6a2I/2GgIBNHIrSFnS0JXKOXcZSjPrZ121PlA51QKMUDWIjX+NX0PgS+g
	9B8G/gf+Y3Hgd9MM/mZkBKxCYD/cc7cPxxSjAO2S2bkXbx47rbGWIo1ii4zxpKDSvqrY
	joKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=8XV+po39LPJk0k0yUlkq94BqcVItL0noml3yV+9MOno=;
	b=CvJhKHxZ2VcAlL3iHSNslKYGM/GNdkKhg9PVFKDPQEGLKAR1fsSu9uk6PUcFhYZxSl
	T2rfKjRUCeBPFz8DAIMX4ug5eRppCoP0Gl7vFBj5nKaXZKMIl5Y7PSdLiHGVlpA0TBwE
	Qfa9ZqahE+Hsh3Dcc7NrVoNoerzqbYSmZ6dWsSc75k1E2xdEsQI9cyhU0JhHrYfqifiN
	Cn8J4MDkQjjFQm3m3UoRljhbjpl8knNDXGeJtavQXlZGDhbT1I7yq3h3SuhhSzSfCI7e
	teQGEEYMVAf8NbeYLhdJwQnHAEhe3ktjGppMCdCpKAjrCZybjMsdWkhEPTAIFrUtwpz3
	pZHw==
X-Gm-Message-State: APjAAAUM3dyuJTDp3Lr42maXLUhXarJSGo5XaonNx2ZRqhshh2HCfb3U
	2RXz2L0jIBajwoM0TwLkcElfTAqrOjoi2g==
X-Google-Smtp-Source: APXvYqyHa7Spc1nNkqVuFOYSTaRPZi0lUVyrfXuVba+lNRp7XrFvJW8pfRGoN65zxjhD+aXY188d6g==
X-Received: by 2002:a17:902:bd4a:: with SMTP id
	b10mr14221975plx.219.1567860918083; 
	Sat, 07 Sep 2019 05:55:18 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.76.229])
	by smtp.gmail.com with UTF8SMTPSA id
	c125sm13034931pfa.107.2019.09.07.05.55.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 07 Sep 2019 05:55:17 -0700 (PDT)
Date: Sat, 07 Sep 2019 12:55:06 +0000
Message-Id: <20190907125506.17536-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH 1/7] oeqa/core/runner.py: Fix OETestTag listing
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
X-List-Received-Date: Sat, 07 Sep 2019 12:55:17 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Use the __oeqa_testtags attribute added by OETestTag and display no, one
or more tags separated by a comma. Also change the formatting of the
output so that the list of tests is formatted as "<test> (<tags>)" and
remove the table header for "id" (it is no longer available).

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/lib/oeqa/core/runner.py | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index 930620ea19..63a8bae93f 100644
--- a/meta/lib/oeqa/core/runner.py
+++ b/meta/lib/oeqa/core/runner.py
@@ -205,23 +205,20 @@ class OETestRunner(_TestRunner):
                 self._walked_cases = self._walked_cases + 1
 
     def _list_tests_name(self, suite):
-        from oeqa.core.decorator.oetag import OETestTag
-
         self._walked_cases = 0
 
         def _list_cases(logger, case):
-            oetag = None
-
-            if hasattr(case, 'decorators'):
-                for d in case.decorators:
-                    if isinstance(d, OETestTag):
-                        oetag = d.oetag
-
-            logger.info("%s\t\t%s" % (oetag, case.id()))
+            oetags = []
+            if hasattr(case, '__oeqa_testtags'):
+                oetags = getattr(case, '__oeqa_testtags')
+            if oetags:
+                logger.info("%s (%s)" % (case.id(), ",".join(oetags)))
+            else:
+                logger.info("%s" % (case.id()))
 
         self.tc.logger.info("Listing all available tests:")
         self._walked_cases = 0
-        self.tc.logger.info("id\ttag\t\ttest")
+        self.tc.logger.info("test (tags)")
         self.tc.logger.info("-" * 80)
         self._walk_suite(suite, _list_cases)
         self.tc.logger.info("-" * 80)
---
2.23.0.rc1

