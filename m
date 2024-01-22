Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6214CC4725D
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 08:55:09 +0000 (UTC)
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
 by mx.groups.io with SMTP id smtpd.web11.69213.1705913704848222313
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 00:55:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@zhukoff.net header.s=fm3 header.b=wMIJHso1;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=o3PSX2Bg;
 spf=pass (domain: zhukoff.net, ip: 64.147.123.19, mailfrom: pavel@zhukoff.net)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 2C7EB32002E2;
	Mon, 22 Jan 2024 03:55:04 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Mon, 22 Jan 2024 03:55:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1705913703; x=
	1706000103; bh=M4FFm08AoYpUkDSg0HtBFu9WfmAi4UrFyKJxSS1NH3M=; b=w
	MIJHso1/eteckn2CWvnHdyZYytFZZnTrWNbgMxnf492rYTPlZUMIk0yew469hbGr
	KvdmhM7u/PoJxYQlnslx6yUFcVzf9lV9K4wJ02l/MhWfdImuR7v8M07GH8njrfGv
	irVKYj3Vs9TVhLouKVtSngqd7Ap/v24Qx3vVnNLDxa6kQzbIOj+l4rektakqJaW6
	BXQx9EJFswccXYrycH/RwiiP2kSsw+1v1i4LI3m0OMH/vegM5SUAzGZc9P/tNtC8
	pHzOcvJ/gd2QPcEAE72u2r+ux6buTWkuxxbAGR2aZXMalFQOxsYNwYUuatfT6sjZ
	Xz7p7uRsZPf7vy6MAzXjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1705913703; x=
	1706000103; bh=M4FFm08AoYpUkDSg0HtBFu9WfmAi4UrFyKJxSS1NH3M=; b=o
	3PSX2BgYnOeeQM15wb9IrWiMHe8rmMWmvZuPphFBnBwTqP+TXRAXBmO2xne5iAKw
	+Ur7aQyENJNHP2LNFdc71BGSALHYZljtv8ECnndvgRVU6OpZD5+Hg/tDcGDgDJH6
	0DkbRBdorFKEmjReO3yhdl5ReQhGx8c+TOaPI6/ae7k7fI2qNXTstjcoSpoj2AKk
	81hTFmcdzygjFp9Vvtla6a6lF1impVwQPP4XsM1k9dR+JuoULEQI5VIzlSgUnBO3
	GWE3e2UkQx1yxn6mjw/6QxuER7LUP6xxoZ8QBP2qBkJmZvvnB2gUSWDVBrzpdLP0
	Wud+1HTgz8nNHDL+HZRlg==
X-ME-Sender: <xms:Zy2uZTMBH1TFT5rbe0qc17Yrolk49ayCU0YC02Z33xfFtcHTtzK5CA>
    <xme:Zy2uZd9wQUk00sCFyIKfo__wJNRzYw47BuvzdTokm65Xqy3cZbf2kJF2Ow122xvCC
    megLY4Enz2A5ZTQDGU>
X-ME-Received: <xmr:Zy2uZSTBOWMHUaxTUo1XOj33NB2yVkO4sZ_QPHqvG0N_l5DqavzKNpQKYkx-78c5ocYBhXzyo1sxAUUpYnzx8EO2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdekhedguddvgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestd
    ekredtredttdenucfhrhhomheprfgrvhgvlhcukghhuhhkohhvuceophgrvhgvlhesiihh
    uhhkohhffhdrnhgvtheqnecuggftrfgrthhtvghrnhepfffggeetteeuteduueegfffgfe
    dvtdetledtgfdukeeufffhtdfgheeihfevgeejnecuffhomhgrihhnpehkvghrnhgvlhdr
    ohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hprghvvghlseiihhhukhhofhhfrdhnvght
X-ME-Proxy: <xmx:Zy2uZXsAMa0lpSEA_7GXwu9Y7BkgVaWrkuI_E8y4hzCCvpHdS66Ovw>
    <xmx:Zy2uZbd68xsPB587KfdHA6zihgtS37nKOCfh6MqVDvY-lQUdGTyH2Q>
    <xmx:Zy2uZT1Ghvp7ma95gPAw_WHIiQOS4Z0VS22BLWOA0OEszmK1Tavjsw>
    <xmx:Zy2uZble6Be74r2ej6-QblslX4NRMNhiSix4ICp06SclSfM4nXQnIA>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Jan 2024 03:55:02 -0500 (EST)
From: Pavel Zhukov <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Cc: Pavel Zhukov <pavel@zhukoff.net>
Subject: [PATCH 2/2] mdadm: Disable ptest
Date: Mon, 22 Jan 2024 09:54:33 +0100
Message-ID: <20240122085443.637472-4-pavel@zhukoff.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122085443.637472-2-pavel@zhukoff.net>
References: <20240122085443.637472-2-pavel@zhukoff.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 08:55:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194127

mdadm tests are flaky and cause a lot of failures on autobuilder.
Disable them for now. Keeping ptest code in the recipe to fix/enable
in the future

Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
---
 meta/recipes-extended/mdadm/mdadm_git.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/mdadm/mdadm_git.bb b/meta/recipes-extended/mdadm/mdadm_git.bb
index 53574dfdc3..d95df66af5 100644
--- a/meta/recipes-extended/mdadm/mdadm_git.bb
+++ b/meta/recipes-extended/mdadm/mdadm_git.bb
@@ -10,7 +10,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/mdadm/mdadm.git;protocol=https;branch=master \
-           file://run-ptest \
            file://mdadm-3.3.2_x32_abi_time_t.patch \
            file://0001-mdadm.h-Undefine-dprintf-before-redefining.patch \
            file://0001-Fix-the-path-of-corosync-and-dlm-header-files-check.patch \
@@ -31,6 +30,11 @@ S = "${WORKDIR}/git"
 
 inherit autotools-brokensep ptest systemd
 
+# Disable ptests for now as they're flaky
+# but keeping ptest code in case we want to enable them in the future
+PTEST_ENABLED="0"
+SRC_URI:append = "${@bb.utils.contains('PTEST_ENABLED', '1', ' file://run-ptest', '', d)}"
+
 DEPENDS = "udev"
 
 SYSTEMD_SERVICE:${PN} = "mdmonitor.service"
-- 
2.43.0


