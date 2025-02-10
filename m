Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1890C0219B
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 16:14:20 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.55515.1739204052782377356
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Feb 2025 08:14:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ij7FlBBa;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-439350f1a0bso11961255e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 08:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1739204051; x=1739808851; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0UAynny/mMEyYqByZKuBPogKsG4JktbhF14EQqMJYN8=;
        b=ij7FlBBaWu9rGOBVyXSJiO691nI4g2bnZwQWdr0EdHaOjet6nxIxpB6e8X8yUBJKJc
         n6oELhYXdv7cYXkBENwSVNsM1jaZGnDZrih1fzAtxk0OjiuaBNxAbmW8m3uOA6T/KiFC
         Tq93kVEXqTuc1uAtXy8UFSzHFdFfp87m+tYNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739204051; x=1739808851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0UAynny/mMEyYqByZKuBPogKsG4JktbhF14EQqMJYN8=;
        b=kL5gAML0nQX90JzCcKgm9+uv9cR+8Ao4GvKMOl5mdhtyG5plyfeS5rvSgQzdrHFA3g
         21TBSz/GlL9GazaeSxUKd9bVVzH1hCy61yT5nCRntM4CZvxcPLDrCKYutswkaQHJEQe3
         fZS/J55lFPxQcdTtC4tHtkDTgJCQ2pROuPW+5+Jsh+BT+p39tDUc+K0qFCiYh8rtZrhX
         s2EwdHziAk4Z1q9nB1gI63/2yKvP9XMsnTZS4mGI8dfw3u6PqkyAkbU6t5n0IVHiv/lh
         I6i7x9N3Wue/GBsiUs3SY0XpJ6VzZH6oyVNUkRSlgRCv0OE4RjPp3CWMjASb4d6QVi5s
         fL/g==
X-Gm-Message-State: AOJu0YyuHVwilA6W6+SVWFkVl6ilFaygdYngGGyZnnY8DVrZ4hoQc4SC
	sqrB5uvth//X7258HOI8yYA/F//oRqYeSGm4sydTk2roCsc4qIH5WHfCEqjIMIl4Awgp6lz9u/p
	Z
X-Gm-Gg: ASbGncty9ihp51eSdpGqfSFrcTrr3NV/bCSg2fQQVilo5jDxz94YTHwkqEbBGHmlLZE
	TQ0RJB/A56XISUos3ZgfKK9NAfSD/rgZF/WiZU4hKTLTY2gOX2Di5XvhvC10U/PUcG7DtkU1fJ9
	GfINqbo1sVjld8Do/tGJ+zgGZSaVIwiaJibVo15dXbBsAtY2cP3a52JJkCbTNlQ/tbLpFDVc6Pf
	81YQSfgnMtbAGGGIDqksrI/n35URGz1zBH16Vu1SfnpjJBCvGRl/EQtZ1sgk9+jj77jEjDnsrA5
	w3SrxHmXxFKO8cHKKz28NXG1aidf5/m/hKBTzn0Smg4=
X-Google-Smtp-Source: AGHT+IFc8opRFhY2PjVKSt3ui6QnD3+0zPos9u0VJFDdxPeo36xtvGM6ibyGOf9wemG4hmq+CjSrVA==
X-Received: by 2002:a05:600c:4444:b0:435:edb0:5d27 with SMTP id 5b1f17b1804b1-43912d2288cmr150907955e9.9.1739204050826;
        Mon, 10 Feb 2025 08:14:10 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:d33a:26d6:1846:991])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390db11264sm182262495e9.35.2025.02.10.08.14.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 08:14:10 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] oeqa/runtime: Add debugging if networking fails
Date: Mon, 10 Feb 2025 16:14:06 +0000
Message-ID: <20250210161406.384031-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250210161406.384031-1-richard.purdie@linuxfoundation.org>
References: <20250210161406.384031-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 16:14:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211103

If networking fails, we can get useful informaiton over the serial connection. Add
this fallback code so that any issues can be more easily debugged by showing the
host and target networking states.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/runtime/case.py       | 16 ++++++++++++++++
 meta/lib/oeqa/runtime/cases/ping.py |  3 ++-
 meta/lib/oeqa/runtime/cases/ssh.py  |  3 ++-
 3 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/runtime/case.py b/meta/lib/oeqa/runtime/case.py
index f036982e1f8..9515ca2f3d6 100644
--- a/meta/lib/oeqa/runtime/case.py
+++ b/meta/lib/oeqa/runtime/case.py
@@ -4,6 +4,9 @@
 # SPDX-License-Identifier: MIT
 #
 
+import os
+import subprocess
+import time
 from oeqa.core.case import OETestCase
 from oeqa.utils.package_manager import install_package, uninstall_package
 
@@ -18,3 +21,16 @@ class OERuntimeTestCase(OETestCase):
     def tearDown(self):
         super(OERuntimeTestCase, self).tearDown()
         uninstall_package(self)
+
+def run_network_serialdebug(runner):
+    status, output = runner.run_serial("ip addr")
+    print("ip addr on target: %s %s" % (output, status))
+    status, output = runner.run_serial("ping -c 1 %s" % self.target.server_ip)
+    print("ping on target for %s: %s %s" % (self.target.server_ip, output, status))
+    status, output = runner.run_serial("ping -c 1 %s" % self.target.ip)
+    print("ping on target for %s: %s %s" % (self.target.ip, output, status))
+    # Have to use a full path for netstat which isn't in HOSTTOOLS
+    subprocess.call(["/usr/bin/netstat", "-tunape"])
+    subprocess.call(["/usr/bin/netstat", "-ei"])
+    subprocess.call(["ps", "-awx"], shell=True)
+    print("PID: %s %s" % (str(os.getpid()), time.time()))
diff --git a/meta/lib/oeqa/runtime/cases/ping.py b/meta/lib/oeqa/runtime/cases/ping.py
index bc543f6c41e..efb91d4cc9d 100644
--- a/meta/lib/oeqa/runtime/cases/ping.py
+++ b/meta/lib/oeqa/runtime/cases/ping.py
@@ -7,7 +7,7 @@
 from subprocess import Popen, PIPE
 from time import sleep
 
-from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.runtime.case import OERuntimeTestCase, run_network_serialdebug
 from oeqa.core.decorator.oetimeout import OETimeout
 from oeqa.core.exception import OEQATimeoutError
 
@@ -36,6 +36,7 @@ class PingTest(OERuntimeTestCase):
                     count = 0
                     sleep(1)
         except OEQATimeoutError:
+            run_network_serialdebug(self.target.runner)
             self.fail("Ping timeout error for address %s, count %s, output: %s" % (self.target.ip, count, output))
         msg = ('Expected 5 consecutive, got %d.\n'
                'ping output is:\n%s' % (count,output))
diff --git a/meta/lib/oeqa/runtime/cases/ssh.py b/meta/lib/oeqa/runtime/cases/ssh.py
index 89d64430e5c..b632a29a017 100644
--- a/meta/lib/oeqa/runtime/cases/ssh.py
+++ b/meta/lib/oeqa/runtime/cases/ssh.py
@@ -7,7 +7,7 @@
 import time
 import signal
 
-from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.runtime.case import OERuntimeTestCase, run_network_serialdebug
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.runtime.decorator.package import OEHasPackage
 
@@ -32,6 +32,7 @@ class SSHTest(OERuntimeTestCase):
               time.sleep(5)
               continue
           else:
+              run_network_serialdebug(self.target.runner)
               self.fail("uname failed with \"%s\" (exit code %s)" % (output, status))
         if status != 0:
             self.fail("ssh failed with \"%s\" (exit code %s)" % (output, status))

