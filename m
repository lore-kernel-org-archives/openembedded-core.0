Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1487C83F25
	for <webhook@archiver.kernel.org>; Sat, 12 Jul 2025 12:51:55 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web10.35635.1752324707725453629
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Jul 2025 05:51:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=NZ1/jZxz;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-1329275-2025071212514502b9c865805f5a0b7d-m_qtq7@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 2025071212514502b9c865805f5a0b7d
        for <openembedded-core@lists.openembedded.org>;
        Sat, 12 Jul 2025 14:51:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=6e7GLhUtRfNda/yIovVxwHUuJeRdg240weAZEHFPhy4=;
 b=NZ1/jZxzEQoqj5wYRIF0LhRtiE0RNK59p9WJOPPYADnBa+yllvkJ6MkCB6wUvv/UrKH3j7
 ZVNFjgxOlL4jcZirtx2jujcKE7uDKg57/26V6craBJ//yQwNY3cAsIvYsDlEJflx2HHgVBph
 pWSKhSVIaIrTvpSiCu6IVrLlT7Z0xQY9Irilgh18OxlMiuNYnqnbszkIASnw0utYPLHUN1Ay
 Bg+TKRfec093SA6Uta6Sg+T+OYeiEfLvtqzp7yJcsJxrxKYKw3PUqB+DGdUFJdaurCf1FfC/
 DKjr/X/WFLNND8zZuFCuLEQ4gq/IiAupR41TQLltR/Xl4KHq1Ov9j59Q==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 2/2] oeqa/utils/command: simplify tap detection
Date: Sat, 12 Jul 2025 14:50:43 +0200
Message-ID: <20250712125103.3404739-3-adrian.freihofer@siemens.com>
In-Reply-To: <20250712125103.3404739-1-adrian.freihofer@siemens.com>
References: <20250712125103.3404739-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Jul 2025 12:51:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220179

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Simplify the code by removing the fallback to ifconfig if the ip command
is not available. ip commands are nowadays available on all host
machines. The transition from ifconfig to ip has taken place long time
ago e.g. for the runqemu-gen-tapdevs script.

This also fixes the detection of tap devices if the tap devices are not
named tap0, tap1, etc. but have a different name, e.g. foo0, foo1 which
is the case if the OE_TAP_NAME environment variable is set.

Some examples:

$ ip tuntap show mode tap
$ sudo ./scripts/runqemu-gen-tapdevs 1000 2
Creating 2 tap devices for GID: 1000...
Creating tap0
Creating tap1
...
$ ip tuntap show mode tap
tap0: tap persist group 1000
tap1: tap persist group 1000
$ sudo ./scripts/runqemu-gen-tapdevs 1000 0
Note: Destroying pre-existing tap interface tap0...
Note: Destroying pre-existing tap interface tap1...
$ ip tuntap show mode tap
$ sudo OE_TAP_NAME=foo ./scripts/runqemu-gen-tapdevs 1000 2
Creating 2 tap devices for GID: 1000...
Creating foo0
Creating foo1
...
$ ip tuntap show mode tap
foo0: tap persist group 1000
foo1: tap persist group 1000
$ sudo OE_TAP_NAME=foo ./scripts/runqemu-gen-tapdevs 1000 0
Note: Destroying pre-existing tap interface foo0...
Note: Destroying pre-existing tap interface foo1...
$ ip tuntap show mode tap

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/utils/commands.py | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index e049e1ee682..91542209685 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -405,13 +405,11 @@ def runqemu_check_taps():
     """Check if tap devices for runqemu are available"""
     if not os.path.exists('/etc/runqemu-nosudo'):
         return False
-    result = runCmd('PATH="$PATH:/sbin:/usr/sbin" ip tuntap show', ignore_status=True)
+    result = runCmd('PATH="$PATH:/sbin:/usr/sbin" ip tuntap show mode tap', ignore_status=True)
     if result.status != 0:
-        result = runCmd('PATH="$PATH:/sbin:/usr/sbin" ifconfig -a', ignore_status=True)
-        if result.status != 0:
-            return False
+        return False
     for line in result.output.splitlines():
-        if line.startswith('tap'):
+        if 'tap' in line:
             break
     else:
         return False
-- 
2.49.0


