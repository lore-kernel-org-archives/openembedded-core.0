Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5B38C4167B
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 11:38:22 +0000 (UTC)
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
 by mx.groups.io with SMTP id smtpd.web11.28750.1702035501010803673
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Dec 2023 03:38:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@zhukoff.net header.s=fm1 header.b=cxjdOlV7;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=o6hlfrBP;
 spf=pass (domain: zhukoff.net, ip: 64.147.123.24, mailfrom: pavel@zhukoff.net)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailout.west.internal (Postfix) with ESMTP id 4B1913200A49;
	Fri,  8 Dec 2023 06:38:20 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Fri, 08 Dec 2023 06:38:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1702035499; x=1702121899; bh=zIHing1lwx
	Li2MY+DHlNI90O4SV7If7GFv3XKznqNVY=; b=cxjdOlV71DD2Y9fCaqF2K1kSN7
	kkMtx1oAHT0yB3S3HXcE/SGTDRkn4upnFhRAoImVyUxh5HrjFB9HHDz9vTwV1Luk
	Zp4wCVqYf+u2TW3uQx/TIcC4LeD8ltCXhgkuDfDnr9efbyBc1XK0e5+wzhAYlSyL
	AOGT8A+9WXRE3UTtxAd4XEkMZDwyIn5YotdVeWQwFD0hPjC7EQ7rbpT2YUgu99a5
	KEfop4ks+PyAyt0ygxOt1xUM24brJH0LLzhjV4rJjtaS59OJDLzksZGjb/NDXajK
	ZFD+CR8smpBUhjGiU9e1ZXKeMXZ7OE6Jedy3XTM4SJ7z/vDTwYhktDKlOeDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1702035499; x=1702121899; bh=zIHing1lwxLi2
	MY+DHlNI90O4SV7If7GFv3XKznqNVY=; b=o6hlfrBPi7y4gRYE+lfW9CyqwNb7+
	9robfNMUKK2CqKel8SZPibOZCDi1cnoZYvpepAk7ax6XGe10yAXo6+0ARb9mtRqj
	QPK6ktHPAJJ/96Tdv4y99dTejtvLa7xfzBpSe5MVGQxX3U4r5C3DvvTjV3GHrsol
	ZOjBTQ3SD4lEFzzdWlhIIq9lyVfOo5BDYYV3GJIRa4seMh24jbC0WtCEXMLCxPnz
	94gPUYeKdB6rC0a9V7mxCCjhRVcPwgPWOOGuCQUZleh9qS2rypaTtzV1dV2rcJgg
	klnK8CKk8IDO8B7KddneOFa8gJEZ0xfPF6Ge/qvRIa265PvfCf4Uuu+0w==
X-ME-Sender: <xms:KwBzZZiIsnSSoRddAL5j3PEUpT4KBqgBTlYn_IKhTPpGtGfk2kBEuQ>
    <xme:KwBzZeDU0hr50S2f4Dz-KAT7x-NtNFfAWBkM9G9XGX3um5YqlLpbP7L00M-knDmZB
    oq0B4teIUF7C12lo7M>
X-ME-Received: <xmr:KwBzZZE75kwClAHb5FoWY7tvaF6jE76aqTvN8LNlP8kn9xKKJRIZRnUI69BQx7-XoHQfVwyNuMAU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudekiedgfeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpefrrghvvghlucgkhhhukhhovhcuoehprghvvghlseiihhhukhho
    fhhfrdhnvghtqeenucggtffrrghtthgvrhhnpeevfeejkeejudegledtkeejhfettdefje
    euffehieekvddugfdtffffledvvdefhfenucevlhhushhtvghrufhiiigvpedunecurfgr
    rhgrmhepmhgrihhlfhhrohhmpehprghvvghlseiihhhukhhofhhfrdhnvght
X-ME-Proxy: <xmx:KwBzZeQOG4R_Dh_iZPAee9mX4lP9W1Cg_maydKvkBH7hVvC3HiIEzw>
    <xmx:KwBzZWzzWT2vNChjizeicqiDNCedW9HprcDbWvH08eUQ-tUWzRKYvw>
    <xmx:KwBzZU5JdoBYA0WSvfE3ldWRxkUnQOgFIXYsUeEKdGb4jGR8OFzmaA>
    <xmx:KwBzZcbZ7rt21MHt2PAUd2WpVkPcXWWaMkzHkUxNOfPuiVXUCvR6zw>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Dec 2023 06:38:18 -0500 (EST)
From: Pavel Zhukov <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Cc: Pavel Zhukov <pavel@zhukoff.net>
Subject: [PATCH] bbtests.py: Add test for unexpanded variables in the dirname
Date: Fri,  8 Dec 2023 12:38:13 +0100
Message-ID: <20231208113813.766894-1-pavel@zhukoff.net>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 11:38:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192044

Regression test for [Yocto #15255]

Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
---
 meta/lib/oeqa/selftest/cases/bbtests.py | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/selftest/cases/bbtests.py
index d242352ea2..03faf1a881 100644
--- a/meta/lib/oeqa/selftest/cases/bbtests.py
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py
@@ -362,3 +362,12 @@ INHERIT:remove = \"report-error\"
 
         result = bitbake('gitunpackoffline-fail -c fetch', ignore_status=True)
         self.assertTrue(re.search("Recipe uses a floating tag/branch .* for repo .* without a fixed SRCREV yet doesn't call bb.fetch2.get_srcrev()", result.output), msg = "Recipe without PV set to SRCPV should have failed: %s" % result.output)
+
+    def test_unexpanded_variable_in_path(self):
+        """
+            Test if typo SRC_URI => SRC_URL causes bitbake to explode
+        """
+        recipe_name = "gitunpackoffline"
+        self.write_config('PV:pn-gitunpackoffline:append = "+${UNDEFVAL}"')
+        result = bitbake('{}'.format(recipe_name), ignore_status=True)
+        self.assertTrue(re.search("ERROR: Directory name /.* contains unexpanded bitbake variable. This may cause build failures and WORKDIR polution", result.output), msg = "mkdirhier with unexpanded variable should have failed: %s" % result.output)
-- 
2.41.0


