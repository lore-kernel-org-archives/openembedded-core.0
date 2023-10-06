Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADA2FE94101
	for <webhook@archiver.kernel.org>; Fri,  6 Oct 2023 19:13:07 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
 by mx.groups.io with SMTP id smtpd.web11.2785.1696619577930029473
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Oct 2023 12:12:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@zhukoff.net header.s=fm2 header.b=GtbAAfE9;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=SJVvdu5d;
 spf=pass (domain: zhukoff.net, ip: 66.111.4.28, mailfrom: pavel@zhukoff.net)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 489FB5C013C;
	Fri,  6 Oct 2023 15:12:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Fri, 06 Oct 2023 15:12:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1696619577; x=
	1696705977; bh=xe6HLWVk4lQlvXH6aF0wyCsRQ+3At8zDDdK/u2bJIXI=; b=G
	tbAAfE9kYDqSd/he2xUDw8dz8JONh2qc1rBTrfhZJvbkmjblkpswyKIOIU9kvosV
	8FWlSWHuh6FyCeuHco62/M080gOCbl3/ZPOrEy1310pew5YeopN9lfVZraUPn34Y
	M4ooWOlaERBhREI7cfH37/uOqkhiAaabfMXmnXOHbYz7vM4kJJnnPAV56G1gelHL
	9R99ZHAbDuI0+psOqlb5DVijpBp9w+lcYX7Pz5OHXANAMxlIJ+6rsXPN+AGSlpUd
	nOk1mPyr4YK6JZsNqu4s+Yn6KAmPY84Td775wt5ayiphTOrDTOnJCM+g8CvsC2kX
	OkwQJb2kkJpI6Rg5krYTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1696619577; x=
	1696705977; bh=xe6HLWVk4lQlvXH6aF0wyCsRQ+3At8zDDdK/u2bJIXI=; b=S
	JVvdu5dT4ubb1F5pf8v8qoPip0Xx59Eeicii5R9r1V7CnlY1n4+C0nc4SdsuHJ9A
	Zqt3ipYGDkMZiLC1CpLhKH08XZRyMtcx7cNY7ywv1VfkrxhqVWb9PPro4sms1LUW
	ZuSCVuEOJo8SCRdXOy8BF1edOshbdF/3EB2Edauu+zjC3Jesujb3uuJA7V64EUKG
	r1BbCxw2hqdffORkFNbHFivbWYmIN3Wu7XJ8ilg3Nupq2xUw8pqgQ1WgrfXwqhLi
	eKEND9RA+r6LjsNCzxJvzj++RiHmWkwzsC70JAqP7FMlSClkjcr3JCpjkqc6qu4e
	18ik4d8kmFx7hBxL68JzA==
X-ME-Sender: <xms:OVwgZRsLcbmFZP4DPtwRdp5HCy8utVY1VWcQcKYMsPeaqx7YOWlCWw>
    <xme:OVwgZacY9nNZfKgTcwmdyjd3ZK3eL9Tt8j1MweC4l29avhfL2yWOkC4NFSGLS1lgv
    xCr69GLr03ejXGq5y0>
X-ME-Received: <xmr:OVwgZUzhQv0ju4_SIVWf8EsKd8xtCye1f9DguJndqLC1ACSqV7mF9WDi49_EAD7EdQnw-iNBR2hDF2gMpgSRSZm8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrgeeigddufedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpefrrghvvghlucgkhhhukhhovhcuoehprghvvghlseiihhhu
    khhofhhfrdhnvghtqeenucggtffrrghtthgvrhhnpeegieevvdeiieekheekfeeigfdtue
    ejffeugedutdeutdetffdvgfetledtleekveenucevlhhushhtvghrufhiiigvpedtnecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpehprghvvghlseiihhhukhhofhhfrdhnvght
X-ME-Proxy: <xmx:OVwgZYOh18rwn6CMXuYbQ5-8uGTR7txy8jivVcWbaJ96DA3J-24MnQ>
    <xmx:OVwgZR8789POZjZOx1QEzZ2TjKbdl620Izlsu7mqCpN789bVEw-K4g>
    <xmx:OVwgZYWiKKkGS5g2uGHO2n4fNnUSIka2wcYPIrXn17RmQL7zMSBUAA>
    <xmx:OVwgZeFb1huz3iUNeS3Oj1f5I03KFsu6C63qmbobFs8gfqCKvM6eyg>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Oct 2023 15:12:56 -0400 (EDT)
From: Pavel Zhukov <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Cc: Pavel Zhukov <pavel@zhukoff.net>
Subject: [PATCH v2 3/4] dummy-sdk-package.inc: Specify providers version
Date: Fri,  6 Oct 2023 21:10:13 +0200
Message-ID: <20231006191013.3770695-4-pavel@zhukoff.net>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231006191013.3770695-2-pavel@zhukoff.net>
References: <20231006191013.3770695-2-pavel@zhukoff.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 19:13:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188780

Some of the packages require versioned providers
(DEPENDS: perl (>= 5.38) is an example and for such packages
do_populate_sdk fails because dummy packages provided unversioned
packages (PROVIDES: perl) which doesn't meet the version requirement.
Specify 999.9-r9 version for such provides to work this around

Fixes [Yocto #14995]

Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
---
 meta/recipes-core/meta/dummy-sdk-package.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/dummy-sdk-package.inc b/meta/recipes-core/meta/dummy-sdk-package.inc
index 99863b86f1..b1571a2cc5 100644
--- a/meta/recipes-core/meta/dummy-sdk-package.inc
+++ b/meta/recipes-core/meta/dummy-sdk-package.inc
@@ -18,14 +18,17 @@ ALLOW_EMPTY:${PN} = "1"
 PR[vardeps] += "DUMMYPROVIDES"
 PR[vardeps] += "DUMMYPROVIDES_PACKAGES"
 
+DUMMYMAXVER ??= "999.9-r9"
 DUMMYPROVIDES_PACKAGES ??= ""
 DUMMYPROVIDES_PACKAGES_FILTERED = "${@' '.join([pkg for pkg in d.getVar('DUMMYPROVIDES_PACKAGES').split() if d.getVar('IMAGE_INSTALL') is None or pkg not in d.getVar('IMAGE_INSTALL').split()])}"
 DUMMYPROVIDES_PACKAGES_MULTILIB = "${@' '.join([multilib_pkg_extend(d, pkg) for pkg in d.getVar('DUMMYPROVIDES_PACKAGES_FILTERED').split()])}"
+DUMMYPROVIDES_MAXVER = "${@' '.join(['{} (= {})'.format(pkg, d.getVar('DUMMYMAXVER')) for pkg in d.getVar('DUMMYPROVIDES_PACKAGES_MULTILIB').split()]) + d.getVar('DUMMYPROVIDES')}"
+
 DUMMYPROVIDES += "${DUMMYPROVIDES_PACKAGES_MULTILIB}"
 
 python populate_packages:prepend() {
     p = d.getVar("PN")
-    d.appendVar("RPROVIDES:%s" % p, "${DUMMYPROVIDES}")
+    d.appendVar("RPROVIDES:%s" % p, "${DUMMYPROVIDES_MAXVER}")
     d.appendVar("RCONFLICTS:%s" % p, "${DUMMYPROVIDES_PACKAGES_MULTILIB}")
     d.appendVar("RREPLACES:%s" % p, "${DUMMYPROVIDES_PACKAGES_MULTILIB}")
 }
-- 
2.41.0


