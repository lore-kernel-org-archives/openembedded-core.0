Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5E33C47258
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 10:27:27 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
 by mx.groups.io with SMTP id smtpd.web10.8995.1706005642664631203
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jan 2024 02:27:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@zhukoff.net header.s=fm3 header.b=MamOYKx3;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=LjnsbRhr;
 spf=pass (domain: zhukoff.net, ip: 66.111.4.27, mailfrom: pavel@zhukoff.net)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id CA39F5C023C;
	Tue, 23 Jan 2024 05:27:21 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Tue, 23 Jan 2024 05:27:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm3; t=1706005641; x=1706092041; bh=djIWV8x665j9BB9N65/J1
	TSUmQlOnoHpDjBMur0hybk=; b=MamOYKx3b7Vj7S38QK71rgF6B4OaJZ+9jEVMh
	bOYfD5IF9TxMAM2LcaFlhAjeCd1P2/p6s8t2bf4+P8yRLTw4BFZ+oaVMO7i6RGoC
	qV2PoSSr9hPkxDRzOGbmI7NtFPhINAuVnJaY+LCfBzrAsd1oodl/XbC4MqBR730x
	yEqcxjQBrofRV2QkJEURwoxQFoGLjfd+pxhMrkklgpJxZGqf29WPLmbyNaIVIgLV
	tdwdRy/WXSwux4/jHUm1e6dku/zLKyYJEV7R0T8Gd9MPVeMubvT77hq9EqIwcuMa
	soni/Haihx104tnejzIQBv47v0E3AFljIF2IpC/X92BsLNBVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1706005641; x=1706092041; bh=djIWV8x665j9BB9N65/J1TSUmQlO
	noHpDjBMur0hybk=; b=LjnsbRhrz+nvVJ03tfzbhKIQ43zzSZq0Kw3ZzfAF8dsV
	Aa89jLpYv3QelndWHU17nZo+EfBldbI3/4qvSkuxi3awHT1HSct7jNv6srQnWrT0
	lN4UZwhWTUSt5MEumVQJTH11I/OGw7R8C0c+LWI6MT9KipGYsQzjXoNAJjyLFQmR
	rTDs91LAegcz1syYi4zc2+s/cx0HHAyRGSIclfA4t0/GsmfyjcXJwQPQnwpiRXQC
	gUM5Kw/qIsc+dn+zK03cGvN4Y+fe1QxsoUd7Ymcyb+B1u7E5PXH98I+k1yi2vCg+
	uB2Xafoon+9xrZaweh3fzWsElWPQxwTwSA1s/sHVQg==
X-ME-Sender: <xms:iZSvZcIslEujCLwkJmuZHuwQ9wiYBvnTOFigktIPzsJNd7m_DQ5Yig>
    <xme:iZSvZcJ2GxV7SovptR30UoLqjstAHg5q-qryVymi5qAcFDTwyMm75bBKhzlUxs1W3
    cRFdwP7OgCHfIOqpUM>
X-ME-Received: <xmr:iZSvZcs0nFfP5XakKiSeCwHDQKVWNG9rfdAqynxLhu2jH0Sr4UWYUKADrcHyDA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdekkedgudehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpefrrghvvghlucgkhhhukhhovhcuoehprghvvghlseiihhhukhho
    fhhfrdhnvghtqeenucggtffrrghtthgvrhhnpeevfeejkeejudegledtkeejhfettdefje
    euffehieekvddugfdtffffledvvdefhfenucevlhhushhtvghrufhiiigvpedtnecurfgr
    rhgrmhepmhgrihhlfhhrohhmpehprghvvghlseiihhhukhhofhhfrdhnvght
X-ME-Proxy: <xmx:iZSvZZZI-J5NyYRAoNrPXKU4YKARLpJ9M3AlVm8tgCNefks0Hxnitw>
    <xmx:iZSvZTZwefuv18tSSm_go-u02LER9SSHvfRlW-FioUZJXM34zb68ag>
    <xmx:iZSvZVDnM_R5XKRbvIm9z73NWu2wDeLP1aL0r9uuzSJ4gRgyFk5kWg>
    <xmx:iZSvZUAAkS64I3p8kV7kb_GMZ7phOfAsM2SNCXr8dDaZKJ1922pV9A>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 23 Jan 2024 05:27:20 -0500 (EST)
From: Pavel Zhukov <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Cc: Pavel Zhukov <pavel@zhukoff.net>
Subject: [PATCH v2] mdadm: Disable ptests
Date: Tue, 23 Jan 2024 11:27:11 +0100
Message-ID: <20240123102710.658065-2-pavel@zhukoff.net>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 10:27:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194226

As agreed upon in the bug triage meeting, disable mdadm ptest for the time being

Related: [Yocto #15181] [Yocto #15159] [Yocto #15308] [Yocto #15309]

Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
---
 meta/conf/distro/include/ptest-packagelists.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index ef6f471e7b..a1643c5548 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -104,7 +104,6 @@ PTESTS_SLOW = "\
     libgcrypt \
     libmodule-build-perl \
     lttng-tools \
-    mdadm \
     openssh \
     openssl \
     parted \
@@ -135,6 +134,7 @@ PTESTS_PROBLEMS:append:x86 = " valgrind"
 #    ifupdown \ # Tested separately in lib/oeqa/selftest/cases/imagefeatures.py
 #    libinput \ # Tests need an unloaded system to be reliable
 #    libpam \ # Needs pam DISTRO_FEATURE
+#    mdadm \ # tests are flaky in AB.
 #    numactl \ # qemu not (yet) configured for numa; all tests are skipped
 #    libseccomp \ #  tests failed: 38; add to slow tests once addressed
 #    python3-numpy \ # requires even more RAM and (possibly) disk space; multiple failures
@@ -147,6 +147,7 @@ PTESTS_PROBLEMS = "\
     libinput \
     libpam \
     libseccomp \
+    mdadm \
     numactl \
     python3-license-expression \
     python3-numpy \
-- 
2.43.0


