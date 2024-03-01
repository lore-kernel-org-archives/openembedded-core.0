Return-Path: <michal.seben@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CFC0C5475B
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 15:06:05 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.25199.1709305557428983560
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Mar 2024 07:05:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=michal.seben@siemens.com header.s=fm1 header.b=HoxOyc4P;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-1325011-20240301150554a1fa57d585bdc1369a-anzqqo@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20240301150554a1fa57d585bdc1369a
        for <openembedded-core@lists.openembedded.org>;
        Fri, 01 Mar 2024 16:05:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=michal.seben@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=MV+m3tGkncU9ikmAnF1OFHNrSmNnwueQled5ja4LM9Q=;
 b=HoxOyc4PYws3HcXZjwfkhooozbgnvHNMbeul0tkhEICgg+7vKin8QbN3kXPx/XeQJxTD4f
 gzLaBaW7SpAqM/vq+WhKqdD9ZLolqJbVDpeCjX70PfWsALbJzMDSHLcQTRzukAGEk+/dGd0a
 WAetQu3UUbusU6mWTxUECGgGqDXz0=;
From: "M. Seben" <michal.seben@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: michal seben <michal.seben@siemens.com>
Subject: [OE-core][PATCH] testimage: allow to set runqemu bootparams option
Date: Fri,  1 Mar 2024 16:05:27 +0100
Message-Id: <20240301150527.254951-1-michal.seben@siemens.com>
In-Reply-To: <20240301141726.244561-1-michal.seben@siemens.com>
References: <20240301141726.244561-1-michal.seben@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1325011:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Mar 2024 15:06:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196462

From: michal seben <michal.seben@siemens.com>

Allow to set runqemu bootparams option using TEST_EXTRABOOTPARAMS
variable. This option can be used .e.g. to mask service only for
testimage task.

Signed-off-by: michal seben <michal.seben@siemens.com>
---
 meta/classes-recipe/testimage.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
index ad040ee8f0..6e2800e3c3 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -47,6 +47,8 @@ TESTIMAGE_FAILED_QA_ARTIFACTS += "${@bb.utils.contains('DISTRO_FEATURES', 'ptest
 # TEST_QEMUBOOT_TIMEOUT can be used to set the maximum time in seconds the launch code will wait for the login prompt.
 # TEST_OVERALL_TIMEOUT can be used to set the maximum time in seconds the tests will be allowed to run (defaults to no limit).
 # TEST_QEMUPARAMS can be used to pass extra parameters to qemu, e.g. "-m 1024" for setting the amount of ram to 1 GB.
+# TEST_EXTRABOOTPARAMS can be used to set the 'bootparams' option for the runqemu script
+# e.g. "systemd.mask=NetworkManager-wait-online.service" to mask particular service
 # TEST_RUNQEMUPARAMS can be used to pass extra parameters to runqemu, e.g. "gl" to enable OpenGL acceleration.
 # QEMU_USE_KVM can be set to "" to disable the use of kvm (by default it is enabled if target_arch == build_arch or both of them are x86 archs)
 
@@ -358,7 +360,7 @@ def testimage_main(d):
     try:
         # We need to check if runqemu ends unexpectedly
         # or if the worker send us a SIGTERM
-        tc.target.start(params=d.getVar("TEST_QEMUPARAMS"), runqemuparams=d.getVar("TEST_RUNQEMUPARAMS"))
+        tc.target.start(params=d.getVar("TEST_QEMUPARAMS"), extra_bootparams=d.getVar("TEST_EXTRABOOTPARAMS"), runqemuparams=d.getVar("TEST_RUNQEMUPARAMS"))
         import threading
         try:
             threading.Timer(int(d.getVar("TEST_OVERALL_TIMEOUT")), handle_test_timeout, (int(d.getVar("TEST_OVERALL_TIMEOUT")),)).start()
-- 
2.39.2


