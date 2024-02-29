Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3183C54798
	for <webhook@archiver.kernel.org>; Thu, 29 Feb 2024 23:02:20 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.9361.1709247737878041808
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Feb 2024 15:02:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=l9Pj7XOI;
 spf=pass (domain: konsulko.com, ip: 209.85.210.170, mailfrom: tim.orling@konsulko.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6da202aa138so1068820b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Feb 2024 15:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1709247736; x=1709852536; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BiN4BfrqpvrhYQh3cj7WDLw4QOl1i+T0Mkw73t6hj7s=;
        b=l9Pj7XOIwLozugc+MijdKfiNAaKD84nTnMCuRQDsN8fygov5AlXjyJQ927MyS7sRBI
         oBKzK7qTObGlYbi4y/1DichUt6TBmSw1kmOymAo5eunw5ck00L66TdtTAx3DQ4y46NGP
         aR0+qx8FWgmQQzIhWmOYsbIgOFtk0UOPOMTsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709247736; x=1709852536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BiN4BfrqpvrhYQh3cj7WDLw4QOl1i+T0Mkw73t6hj7s=;
        b=OS6070r3P6q4aloqQBQxixmmEUAUB3nvmdcO6ooGR9Z39d+hUurTha1rpnNG8Y3wro
         2mPXQ7r/PZBxCR52iB8K13ZyD/uu7Xefqi6bNE9Swbaw+RZkhZbM+97Jocb76zvq1yPm
         wtl+KfwclYV8xFTTuqWvZ5fXvYSyJ7TwoLepYvUoAHlcMKYd3vZPpucEqIEDer6KlnAC
         g2o0GhqiZi/7OAGAaIyGMz66o1gAaMJyum46+2OsYgIw2TBXcItXyxsJF6ozXPYu+P8O
         emKWu5SCNooHg5gnAalceIui7JaZeHwuqvKUJlI9FVsDfcMdIDaqoOkO468wkOI+TKwX
         gUeg==
X-Gm-Message-State: AOJu0Yync1LWp9/ds4OvHdZEzrgF41fS1gveIAgg8TipyFAF+dXUe9z+
	4YA6MQATu5+raN4zAgsCfCYGKaeBls2hEO6V6uqMnkOUr6kX08a3q6k5A6iPM0JY1rotxXpnXDG
	JlSk=
X-Google-Smtp-Source: AGHT+IFmMvnUobm6nkoTInFbzg6/ywFLAepL1CP4zTJ6ZcKpu4g4mFPNNbvT9TJjmTq0k3A0FpPkEA==
X-Received: by 2002:a05:6a20:9f9a:b0:1a1:1e8b:9044 with SMTP id mm26-20020a056a209f9a00b001a11e8b9044mr4895002pzb.50.1709247736281;
        Thu, 29 Feb 2024 15:02:16 -0800 (PST)
Received: from localhost ([2601:1c0:ca01:19f0:dd22:6cd:814d:406c])
        by smtp.gmail.com with ESMTPSA id j11-20020a63ec0b000000b005ceeeea1816sm1668848pgh.77.2024.02.29.15.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 15:02:15 -0800 (PST)
From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH v2] python3-attrs: disable Hypothesis deadline
Date: Thu, 29 Feb 2024 15:00:26 -0800
Message-Id: <20240229230025.3253330-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240229170603.3124074-1-tim.orling@konsulko.com>
References: <20240229170603.3124074-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Feb 2024 23:02:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196451

The deadline is by default 200ms, but this is intended to be useful to
the developer and not necessarily recommended for heavily loaded CI
systems. Avoid warnings by disabling the deadline completely.

https://github.com/HypothesisWorks/hypothesis/issues/3713
https://hypothesis.readthedocs.io/en/latest/settings.html#hypothesis.settings.deadline
https://lists.openembedded.org/g/openembedded-core/topic/104640034#196437
https://github.com/python-attrs/attrs/pull/1252

Fixes:
"""
Unreliable test timings! On an initial run, this test took 268.29ms,
which exceeded the deadline of 200.00ms, but on a subsequent run it
took 2.63 ms, which did not. If you expect this sort of variability in
your test timings, consider turning deadlines off for this test by
setting deadline=None.
"""

[YOCTO #15350]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
Changes in v2:
* Reference Bugzilla #15350 which is HIGHLY likely to be related
* Change Upstream-Status to submitted, since the comments in conftest.py state
  it is setting up for CI situation. "patience" and deadline=None seem to go
  hand in hand :)

 .../0001-conftest.py-disable-deadline.patch   | 45 +++++++++++++++++++
 .../python/python3-attrs_23.2.0.bb            |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-attrs/0001-conftest.py-disable-deadline.patch

diff --git a/meta/recipes-devtools/python/python3-attrs/0001-conftest.py-disable-deadline.patch b/meta/recipes-devtools/python/python3-attrs/0001-conftest.py-disable-deadline.patch
new file mode 100644
index 00000000000..b1e6d999168
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-attrs/0001-conftest.py-disable-deadline.patch
@@ -0,0 +1,45 @@
+From 41103f017f6a233ebb477dd1712fe82ea8f1c84c Mon Sep 17 00:00:00 2001
+From: Tim Orling <tim.orling@konsulko.com>
+Date: Thu, 29 Feb 2024 08:45:54 -0800
+Subject: [PATCH] conftest.py: disable deadline
+
+The deadline is by default 200ms, but this is intended to be useful to
+the developer and not necessarily recommended for heavily loaded CI
+systems. Avoid warnings by disabling the deadline completely.
+
+https://github.com/HypothesisWorks/hypothesis/issues/3713
+https://hypothesis.readthedocs.io/en/latest/settings.html#hypothesis.settings.deadline
+https://lists.openembedded.org/g/openembedded-core/topic/104640034#196437
+
+Fixes:
+"""
+Unreliable test timings! On an initial run, this test took 268.29ms,
+which exceeded the deadline of 200.00ms, but on a subsequent run it
+took 2.63 ms, which did not. If you expect this sort of variability in
+your test timings, consider turning deadlines off for this test by
+setting deadline=None.
+"""
+
+Upstream-Status: Submitted [https://github.com/python-attrs/attrs/pull/1252]
+
+Signed-off-by: Tim Orling <tim.orling@konsulko.com>
+---
+ conftest.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/conftest.py b/conftest.py
+index 144e5f3..fdead3d 100644
+--- a/conftest.py
++++ b/conftest.py
+@@ -20,7 +20,7 @@ def _frozen(request):
+ def pytest_configure(config):
+     # HealthCheck.too_slow causes more trouble than good -- especially in CIs.
+     settings.register_profile(
+-        "patience", settings(suppress_health_check=[HealthCheck.too_slow])
++        "patience", settings(suppress_health_check=[HealthCheck.too_slow], deadline=None)
+     )
+     settings.load_profile("patience")
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/python/python3-attrs_23.2.0.bb b/meta/recipes-devtools/python/python3-attrs_23.2.0.bb
index 3945798ba5e..a6380979884 100644
--- a/meta/recipes-devtools/python/python3-attrs_23.2.0.bb
+++ b/meta/recipes-devtools/python/python3-attrs_23.2.0.bb
@@ -9,6 +9,7 @@ inherit pypi ptest python_hatchling
 
 SRC_URI += " \
 	file://0001-test_funcs-skip-test_unknown-for-pytest-8.patch \
+	file://0001-conftest.py-disable-deadline.patch \
 	file://run-ptest \
 "
 
-- 
2.34.1


