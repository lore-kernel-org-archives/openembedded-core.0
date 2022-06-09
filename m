Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7861C433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Jun 2022 09:23:01 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by mx.groups.io with SMTP id smtpd.web08.8553.1654766575448679814
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jun 2022 02:22:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@zhukoff.net header.s=fm2
 header.b=NQ+RMno4;
 spf=pass (domain: zhukoff.net, ip: 66.111.4.28, mailfrom: pavel@zhukoff.net)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id BE6F05C006F;
	Thu,  9 Jun 2022 05:22:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Thu, 09 Jun 2022 05:22:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1654766574; x=1654852974; bh=5eFsSZIiKEZ4OI7JGyQWQzOq2
	LTJVMmO/7DmyP/8yDo=; b=NQ+RMno4o3N+sfWBVzYBZUYp33OxazV/XSfTO9lYK
	1gGFtpYBi7aPXAz425+kIa9Z8dUI5pxrSm2MPydkM97Ugx5BqxGQ0E6yK8tWpHxT
	hUeAZ5A1KGsO0TF5L/mV2gHrTjgyosDokUQyPv0Uuzo7qTyWxtU635GXpb0Wsop/
	PXfQ+qTVSqUDqHpegFPKZ0aLMhAVzGIEzMUQNN9juRrB9rj9yLeqJGS3T4rr28e1
	kOWWWFGN8cQj/U2tO99XLTteAZ3IfJLhLgu27+sI2iNHk5gYqFYfjs7Ca3s/V0/I
	gsR3qL0Q4XKYpM0eoGVvpHzdqGe387rVAi/Rk/LEQbmMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1654766574; x=1654852974; bh=5eFsSZIiKEZ4OI7JGyQWQzOq2LTJVMmO/7D
	myP/8yDo=; b=ajOJHfawSZH8RRlXmXtGhnKIhyh998Rexs6at4piXgBZont4WhI
	zBC/sYeTxWxycK49n8Vhea50mvTW9QjEiOrRj7aSQ9tpJOr7qky0xYccxlsEnXY/
	MxZdc2vmdC66Lq+PHAtoPm72zRyk/dErSWzoxqYXylTCJcArgYaC5/tp3wBzhJsb
	pYVTpBZbF3OveV3/iav7bwEPc9Dy/BxedrODUExZyfArzZIXY5CZglclPOTjksVy
	rOONkFtJ2P2eEiBx9pjw3bI9qkN1Jm9AD2UdkYfzb27Dt3QuFYFrQoFZdLR/QLCg
	Wg80lfWLqQgeJAVy45dqx1XJc1hzNrXtfkg==
X-ME-Sender: <xms:7ruhYjiB_glbspxou_TW7w3peyM-4IEMqgh_en8OJ3VNhScQQ-_UDw>
    <xme:7ruhYgBxC-HIum7kOpHqHQUECSVL0vsmMn4WmPNhhVK4xTWfXWuFiFwVyOsBy1ted
    KO_mLf4r4_pELbAtAU>
X-ME-Received: 
 <xmr:7ruhYjF1xTz-bdjCr-iv-ZnVQ-AfLBb60Du1jLqmoff4ooVuiWYzQDKi9o79cxg3hTmCOmvwiuSuoU4NPQmtve0>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedruddtledgudduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpefrrghvvghlucgkhhhukhhovhcuoehprghvvghlseiihhhukhho
    fhhfrdhnvghtqeenucggtffrrghtthgvrhhnpeeftdeuuefgveeufedtveevtdejhfduff
    ejfedtgfelheekkeelueejveduleffvdenucffohhmrghinhepihhnihhtrdhshhenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghvvghlse
    iihhhukhhofhhfrdhnvght
X-ME-Proxy: <xmx:7ruhYgRYbBPOXuuVL-bbJsIkQ-y_75ty8BecSLsUdW48aRohsmmG1Q>
    <xmx:7ruhYgzWKHQSZT2WLB3JGYRm7k31RHP8oWf-vqTQxILooHm6O9MxcA>
    <xmx:7ruhYm6HqGEeJcQt4eDJIEL3Y75TQ5-AgoQRQFPQCZyPDf7JPQQrxQ>
    <xmx:7ruhYtrfjBty5ALACriTFwghXJkt7zOJ8sAMDez7DgEUD9OMPXnaiA>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Jun 2022 05:22:54 -0400 (EDT)
From: Pavel Zhukov <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Cc: pavel@zhukoff.net,
	Pavel Zhukov <pavel.zhukov@huawei.com>
Subject: [PATCH v2] dbus: Soecify runstatedir configure option
Date: Thu,  9 Jun 2022 11:22:36 +0200
Message-Id: <20220609092235.6045-1-pavel@zhukoff.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jun 2022 09:23:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166765

Without specifing runstatedir tmpfiles.d is configured to use /var/run
for dbus and this causes deprecation warnings in system logs.

Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
---
 meta/recipes-core/dbus/dbus_1.14.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/dbus/dbus_1.14.0.bb b/meta/recipes-core/dbus/dbus_1.14.0.bb
index 7598c45f8e..0046b9fda2 100644
--- a/meta/recipes-core/dbus/dbus_1.14.0.bb
+++ b/meta/recipes-core/dbus/dbus_1.14.0.bb
@@ -24,6 +24,7 @@ EXTRA_OECONF = "--disable-xml-docs \
                 --enable-tests \
                 --enable-checks \
                 --enable-asserts \
+                --runstatedir=/run \
                 "
 EXTRA_OECONF:append:class-target = " SYSTEMCTL=${base_bindir}/systemctl"
 
@@ -131,7 +132,7 @@ do_install() {
 		sed 's:@bindir@:${bindir}:' < ${WORKDIR}/dbus-1.init >${WORKDIR}/dbus-1.init.sh
 		install -m 0755 ${WORKDIR}/dbus-1.init.sh ${D}${sysconfdir}/init.d/dbus-1
 		install -d ${D}${sysconfdir}/default/volatiles
-		echo "d messagebus messagebus 0755 ${localstatedir}/run/dbus none" \
+		echo "d messagebus messagebus 0755 /run/dbus none" \
 		     > ${D}${sysconfdir}/default/volatiles/99_dbus
 	fi
 
-- 
2.35.1


