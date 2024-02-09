Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6644FC4828F
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 19:27:58 +0000 (UTC)
Received: from fout4-smtp.messagingengine.com (fout4-smtp.messagingengine.com [103.168.172.147])
 by mx.groups.io with SMTP id smtpd.web10.21897.1707506871907256802
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Feb 2024 11:27:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@zhukoff.net header.s=fm3 header.b=ivaqWjy0;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=gFOg7Q7u;
 spf=pass (domain: zhukoff.net, ip: 103.168.172.147, mailfrom: pavel@zhukoff.net)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id 001B413800A6;
	Fri,  9 Feb 2024 14:27:50 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 09 Feb 2024 14:27:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm3; t=1707506870; x=1707593270; bh=DCTzelxJNLPhXnUjQ+gqj
	MmTAkAglJ15sFaXgjvCSD4=; b=ivaqWjy0Sq4W2dqoe9rdO32SnNolrF7DKdYhJ
	0QNNWQUbWk3iXQotnMv5e6bvta6LN3IShwj4grItlpZXFZ0wQ2u07X9MH9EjABcG
	+DTQzjRXPiaBssB+k22LgnpLX5cg9UOM43LmKRFWpRCeI5TiPrLRCg6KkP5R1mFq
	WyBd80fjA3DwWnEpKrMiePDWMPI0oMlhQ54Qul9kiR0L3bbxgHQZcIyqmZEP8bZH
	Bnc4QDzSSPcqRsqu+87NKhNyzBdXp7TTshWsNSt0zkhx+M6X5nFpzLUMqFtVLC/p
	OqWmWJ9PXlXpUALGwgACvrdeuZ5WWEu1XaoTr0ftpw1EAfT1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1707506870; x=1707593270; bh=DCTzelxJNLPhXnUjQ+gqjMmTAkAg
	lJ15sFaXgjvCSD4=; b=gFOg7Q7uK6w8uRCn6aQ0eAAlHh3VXgpHFX/JCsg0Hc+E
	mBCYgfAO1yiPzoopzPsMrswT9eYFOA+rVI46gjn9M/hHjKUjpKMmbc/n4iy+fXUa
	oWTaVT7PmC52/ZS9bcNldmYxWLDA5jf5dkTtB+TT/QmIY686hhXVkC2834+O6dM8
	2/llgPupMQCMlNfkUOn03r3X6Tt7QMo7JmKvGPbjDUUDJ7YPbzpDOPCZq1n4+hoD
	kXJnCfaDgi/HNitUOjMVMbOH3BjvpfZb2dsOWJ2IwWGlvZ5B7xGTD4n3srhCg/c+
	Sj7hVcdA1+BuRTuWcO/N3NSErB9cc2a/Prg0Wm7aKw==
X-ME-Sender: <xms:tnzGZRRC0MkcSkpLbFMKmpJbHKE1UOe0tcoDrAQgH3Hhlbnugnebiw>
    <xme:tnzGZaw2cJPtsmngY_7apjFNMUOWyLZrlriteKBprjt6y5ivr68ANPP_LbFaGeUwh
    S0Zd_MBvyJq7y1mLeY>
X-ME-Received: <xmr:tnzGZW0n1h1Z_lib7TBE6dr5iHPxzni2ZhSJ9tb6aJIUlKZr0TGo6FNozx_WiChly_Pf2cFczORcFHz6k6y30H_Z>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrtdeigdduvdefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpefrrghvvghlucgkhhhukhhovhcuoehprghvvghlseiihhhukhho
    fhhfrdhnvghtqeenucggtffrrghtthgvrhhnpeevfeejkeejudegledtkeejhfettdefje
    euffehieekvddugfdtffffledvvdefhfenucevlhhushhtvghrufhiiigvpedtnecurfgr
    rhgrmhepmhgrihhlfhhrohhmpehprghvvghlseiihhhukhhofhhfrdhnvght
X-ME-Proxy: <xmx:tnzGZZAj-j78oHLPxHebmbl6XUTl-zu17194YuUoj3u0bqWnMUUDig>
    <xmx:tnzGZahIeHExI2zhRVTgQzbxG3KvANAxnjxta4ixtiU5HSgqgNynsA>
    <xmx:tnzGZdp7RI3Pv8XHO6e0prYzt11W40opqkNxYSDS3oqTnGu8qxMvLA>
    <xmx:tnzGZdvCtOrWueQDkvRYQTjh7zckwTdP1LpLEOj6RQ6lGG7PrnTFiw>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Feb 2024 14:27:50 -0500 (EST)
From: Pavel Zhukov <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Cc: Pavel Zhukov <pavel@zhukoff.net>
Subject: [PATCH] systemd.bbclass: Check for existence of the symlink too
Date: Fri,  9 Feb 2024 20:27:28 +0100
Message-ID: <20240209192727.4041133-2-pavel@zhukoff.net>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 19:27:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195245

If the packages' service file is a link to parameterized service file
provided by different package [1] then link is dangling link at
do_package stage and os.path.exists(path) returns False even if the link
exists. Replace os.path.exists with lexists to fix this issue.

[1]
An example:
  Package A provides myservice@.service

  Package B depends and rdepends on A and provides:
  myservice@B.service -> myservice@.service

Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
---
 meta/classes-recipe/systemd.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/systemd.bbclass b/meta/classes-recipe/systemd.bbclass
index 9a16babe43..48b364c1d4 100644
--- a/meta/classes-recipe/systemd.bbclass
+++ b/meta/classes-recipe/systemd.bbclass
@@ -170,7 +170,7 @@ python systemd_populate_packages() {
                     base = service[:at] + '@' + service[ext:]
 
                 for path in searchpaths:
-                    if os.path.exists(oe.path.join(d.getVar("D"), path, service)):
+                    if os.path.lexists(oe.path.join(d.getVar("D"), path, service)):
                         path_found = path
                         break
                     elif base is not None:
-- 
2.43.0


