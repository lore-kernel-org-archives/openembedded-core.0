Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F000D29DEC
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 08:55:00 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.55135.1768294496913366576
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jan 2026 00:54:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=epP1q8b/;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-2026011308545576513ba2ae0002079c-owbd88@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 2026011308545576513ba2ae0002079c
        for <openembedded-core@lists.openembedded.org>;
        Tue, 13 Jan 2026 09:54:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=9VLZ0ZQXcBMXhLSPvqct7yLGltxJHV5D75yiuybih0w=;
 b=epP1q8b/jpu9RmSkY4zzd3TLKyw85GTPSr99CCIsPci4MRgtAbgRut5krou5jQMz+6gzf1
 S8nEReW0o8G/m8XC2HbI7BMKPkHarz7Gegy+jsGL9nyqi0Y6b52AgD9jZ//ekKnXS9l/BfCo
 qM8+meiKztVc87+HY9LqVM6+0CUOYzZ7RWShJOUyH1zWJ2qK+ExOoZRdPmeuW4Qj/RfcvG8V
 VWaTuhz+vJclqIXS3SoZL3kZugNnfQkUr5GLyOGWrmZt+k0FmfoKW1674Ku9yO9TNW4JrJQ9
 gyzRGhFVRtBq1j91a9EiSheVGAHNcZW6ZQDEBA0MHpLkfb18KPUB7Mdw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH 2/2] oeqa-runtime: avoid crash in run_network_serialdebug for missing netstat
Date: Tue, 13 Jan 2026 09:54:44 +0100
Message-Id: <20260113085444.15243-2-peter.marko@siemens.com>
In-Reply-To: <20260113085444.15243-1-peter.marko@siemens.com>
References: <20260113085444.15243-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 08:55:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229234

From: Peter Marko <peter.marko@siemens.com>

If netstat is not installed on the host, the function fails.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/lib/oeqa/runtime/case.py | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/runtime/case.py b/meta/lib/oeqa/runtime/case.py
index 095bcf434a..23796c0cdf 100644
--- a/meta/lib/oeqa/runtime/case.py
+++ b/meta/lib/oeqa/runtime/case.py
@@ -32,7 +32,10 @@ def run_network_serialdebug(target):
     status, output = target.runner.run_serial("ping -c 1 %s" % target.ip)
     print("ping on target for %s: %s %s" % (target.ip, output, status))
     # Have to use a full path for netstat which isn't in HOSTTOOLS
-    subprocess.call(["/usr/bin/netstat", "-tunape"])
-    subprocess.call(["/usr/bin/netstat", "-ei"])
+    try:
+        subprocess.call(["/usr/bin/netstat", "-tunape"])
+        subprocess.call(["/usr/bin/netstat", "-ei"])
+    except (OSError, subprocess.SubprocessError) as e:
+        print("netstat failed: %s" % e)
     subprocess.call(["ps", "-awx"], shell=True)
     print("PID: %s %s" % (str(os.getpid()), time.time()))

