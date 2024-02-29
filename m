Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D06BC48BF6
	for <webhook@archiver.kernel.org>; Thu, 29 Feb 2024 17:07:06 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.632.1709226420553599566
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Feb 2024 09:07:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=aNclxAHA;
 spf=pass (domain: konsulko.com, ip: 209.85.216.51, mailfrom: tim.orling@konsulko.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-29abd02d0d9so843725a91.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Feb 2024 09:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1709226419; x=1709831219; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VEYtE496SMn/p1vQnamMXQ8s58xdqz0loacZgrTVN3U=;
        b=aNclxAHALHfn2NrYn3njqAbw7c6v9ET833qFdLNG2GNmrEPEAW/L8fwH34nui9R0LE
         5ZOxFlTtWIOJc4A6jYcskwltMZS0V1gi4iz06ZBDxslpARLkxYv0YaLTnA1eeJMscb3L
         Am8KNQlUVak5tFv9b9jx5NuDzCa/P9N4xyHmk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709226419; x=1709831219;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VEYtE496SMn/p1vQnamMXQ8s58xdqz0loacZgrTVN3U=;
        b=N7dEeoggio5odROsjUua7KlMgR2A0RGzuXjfCdrc7/oOMsJM+ODwvBVmztVD1MlBVN
         kdXeSn7B55+PAOpu2iwQ4bhUw6cVwZ9+E0LMAkfMqANs5mBkQH79clg9loxIxhbEt6nU
         ICAJJSw8kpenVPh2s0EBNa6hjuXUB8pHW93SwPrYifEqoJlDFGTfYCQ7em7st7ZFFwdy
         8MJIOi1RDCaI2QKt6e6bXqqT3y8VhvLer+LDEEaWyM+FINzTViyUM5SrDeLSR5iQ6S7s
         xI2eQggPvt1cPn9lvlgOVkdw0fvQvAcfPgkk57tWO2H1IA8vBC6Hy+ClZ7Yv86OLaNuY
         IouQ==
X-Gm-Message-State: AOJu0Yw8ZRgtZINHZV1UmlcC9Ytmpve17ymEZLcOpAPYqh6ELy7zU2+T
	FPnb/7HFv2a0H0L7ngFYrQHgDP5sdFK8apaPl0hXbdVjPQVgxA61hYxlQuj1hsN6hwpisTPMhuA
	UU5w=
X-Google-Smtp-Source: AGHT+IE6698kjSZ7vI3Wf1V9w6RC4XpDBiwRM9QSK99x5z2et7j8sldeubKBevAT4SutttTnu8ivjg==
X-Received: by 2002:a17:90b:4002:b0:29b:12c1:8786 with SMTP id ie2-20020a17090b400200b0029b12c18786mr1620337pjb.24.1709226419456;
        Thu, 29 Feb 2024 09:06:59 -0800 (PST)
Received: from localhost ([2601:1c0:ca01:19f0:4f3c:3494:d05d:7545])
        by smtp.gmail.com with ESMTPSA id bf3-20020a17090b0b0300b0029b178a7068sm783293pjb.50.2024.02.29.09.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 09:06:58 -0800 (PST)
From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-attrs: disable Hypothesis deadline
Date: Thu, 29 Feb 2024 09:06:04 -0800
Message-Id: <20240229170603.3124074-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Feb 2024 17:07:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196444

The deadline is by default 200ms, but this is intended to be useful to
the developer and not necessarily recommended for CI systems. Avoid,
AB warnings by disabling the deadline completely.

https://github.com/HypothesisWorks/hypothesis/issues/3713
https://hypothesis.readthedocs.io/en/latest/settings.html#hypothesis.settings.deadline
https://lists.openembedded.org/g/openembedded-core/topic/104640034#196437

Fixes:
"""
Unreliable test timings! On an initial run, this test took 268.29ms,
which exceeded the deadline of 200.00ms, but on a subsequent run it
took 2.63 ms, which did not. If you expect this sort of variability in
your test timings, consider turning deadlines off for this test by
setting deadline=None.
"""

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
All tests pass on qemux86-64 for core-image-ptest-python3-attrs

 .../0001-conftest.py-disable-deadline.patch   | 45 +++++++++++++++++++
 .../python/python3-attrs_23.2.0.bb            |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-attrs/0001-conftest.py-disable-deadline.patch

diff --git a/meta/recipes-devtools/python/python3-attrs/0001-conftest.py-disable-deadline.patch b/meta/recipes-devtools/python/python3-attrs/0001-conftest.py-disable-deadline.patch
new file mode 100644
index 00000000000..efd78fca608
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-attrs/0001-conftest.py-disable-deadline.patch
@@ -0,0 +1,45 @@
+From 41103f017f6a233ebb477dd1712fe82ea8f1c84c Mon Sep 17 00:00:00 2001
+From: Tim Orling <tim.orling@konsulko.com>
+Date: Thu, 29 Feb 2024 08:45:54 -0800
+Subject: [PATCH] conftest.py: disable deadline
+
+The deadline is by default 200ms, but this is intended to be useful to
+the developer and not necessarily recommended for CI systems. Avoid,
+AB warnings by disabling the deadline completely.
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
+Upstream-Status: Inappropriate [CI specific]
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


