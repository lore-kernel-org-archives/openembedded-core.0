Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C4D6C10DCE
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 13:22:34 +0000 (UTC)
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
 by mx.groups.io with SMTP id smtpd.web11.35025.1702041747196200728
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Dec 2023 05:22:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@zhukoff.net header.s=fm1 header.b=hoZlqpzV;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=MZvfeFNl;
 spf=pass (domain: zhukoff.net, ip: 64.147.123.21, mailfrom: pavel@zhukoff.net)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 470603200A34;
	Fri,  8 Dec 2023 08:22:26 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Fri, 08 Dec 2023 08:22:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1702041745; x=1702128145; bh=v4c3GqoKee
	XWW/goaOmSnE0fHIFlkPypyrtTiYthSJk=; b=hoZlqpzVB88qQVkQ0FFjHITa44
	vSdAapPW7cppdmiw09zDSZdxzspJIg3+Q9DKGg6uSJ2S7gFL43aAMsqBlgZgvlmG
	XNCQGo7l1BxHny00TH2TWb0OIEgbaEv4EEPfzrkrp/2g7qIaufY3fsE2ABogXkUj
	cn8hj/agNpfhkPNr5+fSQYAlDSm5xRC7iUiq7RbzkdtEPDA1b1gahhoGbBrzK3gx
	HI9VsKoTodW4e3k1ySLZWydvCrG+TQJHqBeKAhioBsgdgcrQP2WO1eN6j3NCA3OY
	ithO+nSghg0IJBU/ilDbKk0UhsTxS8bM8rTOE2hqehv1r8sfHRE1mrqJOWfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1702041745; x=1702128145; bh=v4c3GqoKeeXWW
	/goaOmSnE0fHIFlkPypyrtTiYthSJk=; b=MZvfeFNlA5Akl2rnWbCYNSZW7G/fJ
	XNM1MSw985Y998fBQVCjL72BYyQClpar2DyXI3mgy3YgGoSV2/l+581hSDWiPhdt
	eCfnkKUVhaf3BS6CSPDmkC+fQQ9Vv7Ko+CNO7TW/j3nODk8YGU82qKUgBbi4Jcoy
	9b5n6MwntrkLlDYvWUVhCiFOIFvqfEj6RtOZksOYq85OLnNo5raXA7ee7ro9oRay
	rzLjsoCF/lvmBek5OFwtDbHXZ1NERqC+UtcfW3ckP/JI40vpB/wimLlvd008icW9
	uFLYLGmi8QdnCC3Smdj4USe4slDLM5uNUGPQgV30vmT7/qo54qCH9UaRw==
X-ME-Sender: <xms:kRhzZQjltTQoJn8IVET3fyadKJlOJ4Fg56dLJfNR9lir8RvC3hMQFg>
    <xme:kRhzZZDQjTg6Awhx3Nzz1bhk7cRATH2ASYGbOWaFZtiXoWZyGbo0vi4XNXowo3FZh
    ZgJRYFnmCRWo82o5eM>
X-ME-Received: <xmr:kRhzZYGF45m0bVzP4b7BgthkJiENAnOzyXnAcazab1Ymnl3lKiNgvQFu3yNfx8u0jiRTSxqAVQsK>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudekiedghedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpefrrghvvghlucgkhhhukhhovhcuoehprghvvghlseiihhhukhho
    fhhfrdhnvghtqeenucggtffrrghtthgvrhhnpeevfeejkeejudegledtkeejhfettdefje
    euffehieekvddugfdtffffledvvdefhfenucevlhhushhtvghrufhiiigvpedtnecurfgr
    rhgrmhepmhgrihhlfhhrohhmpehprghvvghlseiihhhukhhofhhfrdhnvght
X-ME-Proxy: <xmx:kRhzZRQqoSWCgiIPVp2OgosuAU3j_z3qpGSxdk2y9UaUv69aC_uXRw>
    <xmx:kRhzZdymIDBY7nJd6fLPPpp6-eCgxnlqfMCrCp3aS5Q1laUUAQ1HVw>
    <xmx:kRhzZf5Ph--yKK0t5HiEehHoxou64SAcSO3WYcY0hq3s7wn6tdZPcA>
    <xmx:kRhzZbZxMbmjCwKivnyhWaDo7Xkwj_42umSHnoz5OYM5H7yISmhEaA>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Dec 2023 08:22:24 -0500 (EST)
From: Pavel Zhukov <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Cc: Pavel Zhukov <pavel@zhukoff.net>
Subject: [PATCH v4] bbtests.py: Add test for unexpanded variables in the dirname
Date: Fri,  8 Dec 2023 14:22:25 +0100
Message-ID: <20231208132225.777579-1-pavel@zhukoff.net>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 13:22:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192060

Regression test for [Yocto #15255]

Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
---
 meta/lib/oeqa/selftest/cases/bbtests.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/selftest/cases/bbtests.py
index d242352ea2..0da59e0f58 100644
--- a/meta/lib/oeqa/selftest/cases/bbtests.py
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py
@@ -362,3 +362,14 @@ INHERIT:remove = \"report-error\"
 
         result = bitbake('gitunpackoffline-fail -c fetch', ignore_status=True)
         self.assertTrue(re.search("Recipe uses a floating tag/branch .* for repo .* without a fixed SRCREV yet doesn't call bb.fetch2.get_srcrev()", result.output), msg = "Recipe without PV set to SRCPV should have failed: %s" % result.output)
+
+    def test_unexpanded_variable_in_path(self):
+        """
+            Test that bitbake fails if directory contains unexpanded bitbake variable in the name
+        """
+        recipe_name = "gitunpackoffline"
+        self.write_config('PV:pn-gitunpackoffline:append = "+${UNDEFVAL}"')
+        result = bitbake('{}'.format(recipe_name), ignore_status=True)
+        self.assertGreater(result.status, 0, "Build should have failed if ${ is in the path")
+        self.assertTrue(re.search("ERROR: Directory name /.* contains unexpanded bitbake variable. This may cause build failures and WORKDIR polution",
+                                  result.output), msg = "mkdirhier with unexpanded variable should have failed: %s" % result.output)
-- 
2.41.0


