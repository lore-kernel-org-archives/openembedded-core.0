Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BD20C4167B
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 12:57:43 +0000 (UTC)
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
 by mx.groups.io with SMTP id smtpd.web11.34517.1702040261796087093
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Dec 2023 04:57:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@zhukoff.net header.s=fm1 header.b=AFPoJ5gr;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=x+airqEs;
 spf=pass (domain: zhukoff.net, ip: 64.147.123.21, mailfrom: pavel@zhukoff.net)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 26F383200A13;
	Fri,  8 Dec 2023 07:57:41 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Fri, 08 Dec 2023 07:57:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1702040260; x=1702126660; bh=GIl53FBk5Z
	V5TKmbxMhx9ntkigDi5nZdw7oKjHSFIKU=; b=AFPoJ5grdWw1VnS46dWJlgINyp
	ZHhwhpafAS5l3OZjvXuBJ4JtGlhWYjPXrhdXJnNdWN3ckPoYKBNjDzNA/2R6NVUP
	tW20JD4dAZZethFhAVB2+gYuDL16O4ApSdocJWHnnuC+0pbSw4vIWwaqD0LL2WyG
	BYQMRwO4+wO3nu9QZZKfxJDJddld35FZ5Lc/MKFWD8MlEELtcVbpKvjtftwBPlh8
	ZfEx6Dww7xTRoQb6II7GwlTsVZD9ofNHzBPT69/WsF2ApexRTRQt8IMsvAnENLGn
	winUn4OanshHasFRUa+HslP+UJAMY7V2MWtVqpmxuA79tHBcGr0l5Hgu/FtQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1702040260; x=1702126660; bh=GIl53FBk5ZV5T
	KmbxMhx9ntkigDi5nZdw7oKjHSFIKU=; b=x+airqEsXG4XG6YZQyGA+RFdhz+jT
	UwqWUkTnr7nnAqDhi1ljcT9QWdNv2+Egwh/ApVJaw4kJWMsgWuCLnPA9L0hb9SWN
	ZnxK4n29HIsFrCVPPUvFAOo9gOE3Jt67VF9A8QM2VIW6srxGxRVyIn/nXGX7sMxO
	zvcHhCh6wK6EOJpcJ/Fu3Hy8aV/whua7GcC6mprVXMYpPNep0LoDtqSL+mcJBDDz
	EeJJEIqxwyxMcRpEFE44QuUPxmpNufABAFhjVcJHn73WfRRwjzERCk7SNZsLWGsK
	GhgDK4K94Sk8vkThv99ku2jCBHfQ2v87cDFZbEf9gfBR9QR23SZXF2lqw==
X-ME-Sender: <xms:xBJzZRLM3xQt6hnw8VrOwgsXRT3mqi0yX4U-Zg35oR1NtAx5uqIgMg>
    <xme:xBJzZdIrMPlJjlvYGfgW9-bSJnGLOtmAoKdN07pMAgR1w3e_RZxdvGyAIAors5Deu
    pNZ_dQIdYlELt_mnE4>
X-ME-Received: <xmr:xBJzZZus2dmUQyCnuCqtuXjiNNomR881PjgE8wM3hVh4ILm9KezLEk_BSKjVrrxDBH9DeuYs56GU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudekiedggeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpefrrghvvghlucgkhhhukhhovhcuoehprghvvghlseiihhhukhho
    fhhfrdhnvghtqeenucggtffrrghtthgvrhhnpeevfeejkeejudegledtkeejhfettdefje
    euffehieekvddugfdtffffledvvdefhfenucevlhhushhtvghrufhiiigvpedtnecurfgr
    rhgrmhepmhgrihhlfhhrohhmpehprghvvghlseiihhhukhhofhhfrdhnvght
X-ME-Proxy: <xmx:xBJzZSYsiSAxTTh5HoWuSVqSq8tseuo3fOLDeA5YW8JjgawIw9L-Yw>
    <xmx:xBJzZYa0XfuVmygT7aKJJBZqF45vCOlN5edPibefatqqgpEiui1VNA>
    <xmx:xBJzZWDdhFd9o68hDupF3HZD7EMmULxCk1mO-gGKfRCd2uNaV-cYYA>
    <xmx:xBJzZRCi96Y8ZAvkbNEZSOoMtIgbP5Cco5VYpICqvRXqQGry6HbRLQ>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Dec 2023 07:57:39 -0500 (EST)
From: Pavel Zhukov <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Cc: Pavel Zhukov <pavel@zhukoff.net>
Subject: [PATCH v3] bbtests.py: Add test for unexpanded variables in the dirname
Date: Fri,  8 Dec 2023 13:57:41 +0100
Message-ID: <20231208125741.772372-1-pavel@zhukoff.net>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 12:57:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192056

Regression test for [Yocto #15255]

Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
---
 meta/lib/oeqa/selftest/cases/bbtests.py | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/selftest/cases/bbtests.py
index d242352ea2..2bc1898f2b 100644
--- a/meta/lib/oeqa/selftest/cases/bbtests.py
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py
@@ -362,3 +362,13 @@ INHERIT:remove = \"report-error\"
 
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
+        self.assertTrue(re.search("ERROR: Directory name /.* contains unexpanded bitbake variable. This may cause build failures and WORKDIR polution", result.output), msg = "mkdirhier with unexpanded variable should have failed: %s" % result.output)
-- 
2.41.0


