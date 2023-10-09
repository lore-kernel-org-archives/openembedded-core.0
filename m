Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CC77E95A96
	for <webhook@archiver.kernel.org>; Mon,  9 Oct 2023 14:40:30 +0000 (UTC)
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
 by mx.groups.io with SMTP id smtpd.web10.63906.1696862423471799649
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Oct 2023 07:40:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@zhukoff.net header.s=fm2 header.b=1lwbZDC8;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=RK6ODhS1;
 spf=pass (domain: zhukoff.net, ip: 64.147.123.20, mailfrom: pavel@zhukoff.net)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id CEEB632001E9;
	Mon,  9 Oct 2023 10:40:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 09 Oct 2023 10:40:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1696862422; x=
	1696948822; bh=xe6HLWVk4lQlvXH6aF0wyCsRQ+3At8zDDdK/u2bJIXI=; b=1
	lwbZDC816qpkGpkAgC1zHViLQF+t+0bNXDDbpud1JC5HipWFonl5QJI0u4aEkxC4
	om/yFLVF+m4S5oBwsgS10HMu82zH4GZDopnFAl85jkMl/t1dNgEPvnd/TmeWGEb/
	AWxoskSNYm9Tx+k6JdVfYBlb8E8dgiGpUTeHiM1pxkZB1RB00LxI2ttLd+Yf2S1s
	dOiT69ISz9aJjVzhqjFzufAhOkEtnQX7DCcPTEbw0Hj3JLgh9nE9e5hc8A6j5dw7
	7EQpmoaw877hbHBK04qzXTo5MAhffrqJFLK6HrzkuQflg9L+OghmX9RhxhwnM9XG
	DMsCExEmZrce4UHLgaeVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1696862422; x=
	1696948822; bh=xe6HLWVk4lQlvXH6aF0wyCsRQ+3At8zDDdK/u2bJIXI=; b=R
	K6ODhS1pQ7vVC+XdzamKs3WiMk/qxY9KKlR5ZMRmCwEG03Rp9F/rFe9K2w24VauB
	Mb+zOfMqbKqnssJWBntncWSRagGN5hnPwXVCLmKzMSdcV+zW+2wTuDBt6YfJSnFT
	jsDMKFYabaf7EP50GsW7HA57tz/9bSwPDTmjFI6ABjre02CYTRKqxQZgVaK7Xdtt
	pR0v4wLXq+BIRTrm7JbUOei1tKe9EB/5YxMyXv3KdpBGtwuLJUFAg2GedHqe8ZG4
	oGf2HFcMCWRzZ5Qrf76CuDTlkNurfuVd3QohOpnl2eMhlYVRq9srrzVlXiYfWJk0
	U4qUyENNccxMnTthEsTlg==
X-ME-Sender: <xms:1hAkZT1_qbtXuZ5EGHWahNEOVsmpgrZfP61lXMiKXn5lQA6Irt3RDw>
    <xme:1hAkZSEXrqkzrC2S51Zzjk4iFWzDmY-PBAFANrXz9K8NonhsiunZSOs2WeeI2F1ul
    ZA1GkK5EThk5fMmvXc>
X-ME-Received: <xmr:1hAkZT7Xs4_Cn4pxVrTxbJiwS7jY2qy1pIvNPvNxJ9BAeGGyRLVEeCf89rT1XHjzr5cFhnvlh38g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrheefgdejlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheprfgrvhgvlhcukghhuhhkohhvuceophgrvhgvlhesiihhuhhk
    ohhffhdrnhgvtheqnecuggftrfgrthhtvghrnhepgeeivedvieeikeehkeefiefgtdeuje
    ffueeguddtuedtteffvdfgteeltdelkeevnecuvehluhhsthgvrhfuihiivgeptdenucfr
    rghrrghmpehmrghilhhfrhhomhepphgrvhgvlhesiihhuhhkohhffhdrnhgvth
X-ME-Proxy: <xmx:1hAkZY3F_zhx5Vd26fMWqcdoMX7Eogikt328ut1fAbJP9P3eUc5RGw>
    <xmx:1hAkZWGPo7ADIBpQN4It-CKUajM_dfHD1X_KS7RNEfuVgwHEFkPxtw>
    <xmx:1hAkZZ_Ox_TlTwCAcD4d_KtUdgYXVip8lMHOFxbkMc3yfF93LkyNaw>
    <xmx:1hAkZRNeIf_p4JLkhpuZncqEycMHDR-XldZ6oabP3WFy4RNHz0IdMw>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 9 Oct 2023 10:40:21 -0400 (EDT)
From: Pavel Zhukov <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Cc: Pavel Zhukov <pavel@zhukoff.net>
Subject: [PATCH v3 3/4] dummy-sdk-package.inc: Specify providers version
Date: Mon,  9 Oct 2023 16:40:00 +0200
Message-ID: <20231009144001.21150-3-pavel@zhukoff.net>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231009144001.21150-1-pavel@zhukoff.net>
References: <20231009144001.21150-1-pavel@zhukoff.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Oct 2023 14:40:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188839

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


