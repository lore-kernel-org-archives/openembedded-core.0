Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99900E95A91
	for <webhook@archiver.kernel.org>; Mon,  9 Oct 2023 14:40:20 +0000 (UTC)
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
 by mx.groups.io with SMTP id smtpd.web11.63276.1696862419571352817
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Oct 2023 07:40:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@zhukoff.net header.s=fm2 header.b=YazqBcZ9;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=hKNCXn3E;
 spf=pass (domain: zhukoff.net, ip: 64.147.123.20, mailfrom: pavel@zhukoff.net)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id BE3813200A91;
	Mon,  9 Oct 2023 10:40:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 09 Oct 2023 10:40:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1696862418; x=1696948818; bh=6D4vlpoDbn
	RmHfcVFKrt1RkNc5QdhUR/KO2huCnKAq4=; b=YazqBcZ9zHmau2OJ4KulWS9Zl/
	CRvHBMykW4m55h5oGCCkoyaaExSm5rkP5maKFCQVsrOXaDWuToMGQFRVYJkgvidQ
	oNavgQARR4j5riXK7T8cOeZd2oDekRirydDXyVoO4KYLV6SC9hh3G9QV5ivwM5ze
	io2nCgCxnFSjc+EKiFHMrQoq9m0qarTowG3sP0ZtSri+zj47k6cnJLrkuiNNdAGu
	C8TbC+orhRtCmTW3moLIlgzH64oO/rxCH2YBlewcGt2y8cF2/+Yg+fb4kzS08JIu
	GCbwsu4Bbm13pvk1QrzeXv80evHXhKPnnPkeQ8X+4cnxGJtv6nGmyYjZ+5KA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1696862418; x=1696948818; bh=6D4vlpoDbnRmH
	fcVFKrt1RkNc5QdhUR/KO2huCnKAq4=; b=hKNCXn3EFG+x3lgkCagtqUWIEzxYB
	f3jjWeH0kIA+niYy8ey0p0UfhMXBNCxNGCvJpBMaA8SQTGWUwiWGD4tDUeBZghRR
	GlNv8RsY+ekpdDE5NQxaxm6K/I8HAC1Of4NH7Zyy9e33Or6eu1n8jsnzF2MGwiY3
	zhnCwq1lQ8RXakHvCXJGFhzxafosimh15Dpar7tnRk7h20qh797E6LAqBptHczTx
	puwOTRpgVytqqm+ZmkBXUON71McvsEtS12X61T6b1m5RvIi11ZXul9SdqDU0uBTA
	r6tFQmV3yqn3FqmubCSUKiuNQAP35NIwYo6JpZejJC+dTx2h+b/jjmERA==
X-ME-Sender: <xms:0RAkZdvdl7Em6A46KBuOWrpT0MbN6koGfnvC12uruliYaGV-TdFLrQ>
    <xme:0RAkZWdU1sZNrDFs-qicGHCYpq8xoDBp5X6s9_6Mwl1SWRXtJvTFC_4eN0bKKGTn2
    hqv8ZW-rsePQlCUrYY>
X-ME-Received: <xmr:0RAkZQzSalFcgviKxMq1V1aKvUKuQh_TWTDjS3EYyVoQYXjvw39NZTCXyZ_Odl8x2vHzG57TZplw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrheefgdektdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekredtre
    dttdenucfhrhhomheprfgrvhgvlhcukghhuhhkohhvuceophgrvhgvlhesiihhuhhkohhf
    fhdrnhgvtheqnecuggftrfgrthhtvghrnhepveefjeekjedugeeltdekjefhtedtfeejue
    ffheeikedvudfgtdffffelvddvfefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomhepphgrvhgvlhesiihhuhhkohhffhdrnhgvth
X-ME-Proxy: <xmx:0hAkZUOjJfOHzwhGM-6VJV5WKkMhqn3A4iQr5kpMKwY1L7ZNyOTSSg>
    <xmx:0hAkZd95vC-0oHpoyyPQ68GKjQVloj71IpakAahi7bfBBEAR8E0HwA>
    <xmx:0hAkZUXaOOUMM-IpulOlqDHCH0ckV19giQWnh9-j-mcUX09aF2CGjw>
    <xmx:0hAkZaGkQ882imviM5jI4XdMd-U9LA2ExbSjWke0rlYZi2zBQ6QkGw>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 9 Oct 2023 10:40:17 -0400 (EDT)
From: Pavel Zhukov <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Cc: Pavel Zhukov <pavel@zhukoff.net>
Subject: [PATCH v3 1/4] dummy-sdk-package.inc: Filter packages which are marked for installation
Date: Mon,  9 Oct 2023 16:39:58 +0200
Message-ID: <20231009144001.21150-1-pavel@zhukoff.net>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Oct 2023 14:40:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188837

if packages is provided by dummysdk and in the same time marked for
installation with IMAGE_INSTALL it causes conflict in apt because virtual providers are
not taken into account if package is asked to be installed explicitly.
Filter such packages from provides/conflicts to workaround this problem.
This workaround brakes RPM usecase because of file conlicts with
DUMMYPROVIDES, use DUMMYPROVIDES_PACKAGES_MULTILIB instead (which
doesn't include file based conflicts).
While this is needed for the case of package_deb only adding it for all
package managers to not complicate the code.

Fixes: [Yocto #13338] [Yocto #14066]

Fixes:
The following information may help to resolve the situation:

The following packages have unmet dependencies:
 target-sdk-provides-dummy : Conflicts: bash
E: Unable to correct problems, you have held broken packages.

Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
---
 meta/recipes-core/meta/dummy-sdk-package.inc | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/meta/dummy-sdk-package.inc b/meta/recipes-core/meta/dummy-sdk-package.inc
index bd26e39ad3..99863b86f1 100644
--- a/meta/recipes-core/meta/dummy-sdk-package.inc
+++ b/meta/recipes-core/meta/dummy-sdk-package.inc
@@ -19,13 +19,14 @@ PR[vardeps] += "DUMMYPROVIDES"
 PR[vardeps] += "DUMMYPROVIDES_PACKAGES"
 
 DUMMYPROVIDES_PACKAGES ??= ""
-DUMMYPROVIDES_PACKAGES_MULTILIB = "${@' '.join([multilib_pkg_extend(d, pkg) for pkg in d.getVar('DUMMYPROVIDES_PACKAGES').split()])}"
+DUMMYPROVIDES_PACKAGES_FILTERED = "${@' '.join([pkg for pkg in d.getVar('DUMMYPROVIDES_PACKAGES').split() if d.getVar('IMAGE_INSTALL') is None or pkg not in d.getVar('IMAGE_INSTALL').split()])}"
+DUMMYPROVIDES_PACKAGES_MULTILIB = "${@' '.join([multilib_pkg_extend(d, pkg) for pkg in d.getVar('DUMMYPROVIDES_PACKAGES_FILTERED').split()])}"
 DUMMYPROVIDES += "${DUMMYPROVIDES_PACKAGES_MULTILIB}"
 
 python populate_packages:prepend() {
     p = d.getVar("PN")
     d.appendVar("RPROVIDES:%s" % p, "${DUMMYPROVIDES}")
-    d.appendVar("RCONFLICTS:%s" % p, "${DUMMYPROVIDES}")
+    d.appendVar("RCONFLICTS:%s" % p, "${DUMMYPROVIDES_PACKAGES_MULTILIB}")
     d.appendVar("RREPLACES:%s" % p, "${DUMMYPROVIDES_PACKAGES_MULTILIB}")
 }
 
-- 
2.41.0


