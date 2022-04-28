Return-Path: <jsbronder@cold-front.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73AE6C433F5
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 00:10:01 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by mx.groups.io with SMTP id smtpd.web08.4097.1651104596122242728
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Apr 2022 17:09:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@cold-front.org
 header.s=mesmtp header.b=kWvAIvCp;
 spf=pass (domain: cold-front.org, ip: 66.111.4.26,
 mailfrom: jsbronder@cold-front.org)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 238545C008B
	for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Apr 2022 20:09:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Wed, 27 Apr 2022 20:09:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=mesmtp; t=1651104595; x=1651190995; bh=qIzXrASX0PosSjxPl4sb/A
	xGIIUjQMQ+4TGnRM2hts0=; b=kWvAIvCpqbr9zlCvvqY82IGiZf+WvKmJA9h59u
	79iwqc3QKfMfSHUxS5YYqqmelCCGc8Zei2S000S+yhjJp+G7LXZd1nNC/jNRgUIz
	TlAQj6+kezW68JQhYyqRthhgukcZNBoBkXc/ZwSfbdiUWWOxnafTSoqD0Ls9TaBv
	e4iqk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1651104595; x=1651190995; bh=q
	IzXrASX0PosSjxPl4sb/AxGIIUjQMQ+4TGnRM2hts0=; b=fUqCbZtot9/JQgdN+
	/FXxhP0gLS4+Q618QUvUfk6nzleYqnYT5yMqFgwtX4IgY0Mr/Da+SkB7hgR1c9In
	5xUTOxTzToBJdBS1+C1+kRL/EP8sytXLMQmlW/fqYtpVp+9b8aQHWp5q5khiqmyI
	c7lhSqU5IPuzef0z/f/6kh8bYtlcU7L/LksWZxsWP2oN7zMVJjyh0FrZw7yQHEaI
	Bj86rkxzcdDAKTkY2aAzl8snVrpG50HYOT1NG0Vd7Vxp73Rqq27N1cZDeH+gZA0a
	87GRkY25XsbPdWJ/WZ0bbRS9nT7hR4S/T1xypfObID9WMTov9o74Djnf7iTmE9/D
	Eofyw==
X-ME-Sender: <xms:UttpYmDnzwUawWFeT96q_S3Eq89ZmV-33BQTsQT4J4xExtbsV5I2Uw>
    <xme:UttpYgjg2xfXdsIuW8ALNJoU1auiUH2XzTGlaIUmel4y1ANeAah95PNNxxJPW0KWm
    vHrm9lMMMCPJmNXRA>
X-ME-Received: 
 <xmr:UttpYpnrpSKGvQKOjcp9_XMFJQqOBxlepsPvU0PeEJKAPKJbUqMkvJ87xmt0688o_qwS6Zr2vklwHWXN4q07UvYPkcH1H5rHoLB8s-czcGoK>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrudeigdefvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
    dtnecuhfhrohhmpefluhhsthhinhcuuehrohhnuggvrhcuoehjshgsrhhonhguvghrsegt
    ohhlugdqfhhrohhnthdrohhrgheqnecuggftrfgrthhtvghrnhepvdfhtdfhffeiffevte
    evieefuedvtdfhleduieetudekgefgveffgffffffffffhnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhssghrohhnuggvrhestgholhguqd
    hfrhhonhhtrdhorhhg
X-ME-Proxy: <xmx:UttpYkwyQPZd4R66qeaHyKnDV_IzOAYdQvtt2_uvJpVrnpiy8s10-Q>
    <xmx:UttpYrR22QiACKEns6-Btxqj6p-X2-wJH2WOhEJt72hlAOGKHsRQfQ>
    <xmx:UttpYvbeEyxlEuq0p8oRN7CHWkphKtM0suWPj3kzbv6vth9FD8wVbw>
    <xmx:U9tpYuMLaWx9Hjfsm0pTuv7H7oWCbvq1rcRrc5QuXuvKviy2VNXfWQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-core@lists.openembedded.org>; Wed,
 27 Apr 2022 20:09:54 -0400 (EDT)
From: Justin Bronder <jsbronder@cold-front.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] pulseaudio: conditionally depend on
 alsa-plugins-pulseaudio-conf
Date: Wed, 27 Apr 2022 20:09:29 -0400
Message-Id: <20220428000928.13808-1-jsbronder@cold-front.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Apr 2022 00:10:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164931

The alsa-plugins-pulseaudio-conf package is only enabled when
DISTRO_FEATURES contains pulseaudio.

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index a69dd32bd7f..821ce7d1df2 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -254,7 +254,7 @@ RDEPENDS:pulseaudio-server = " \
 # If the server is installed, it's usually desirable to make ALSA applications
 # use PulseAudio. alsa-plugins-pulseaudio-conf will install the configuration
 # that makes the PulseAudio plugin the default ALSA device.
-RDEPENDS:pulseaudio-server += "alsa-plugins-pulseaudio-conf"
+RDEPENDS:pulseaudio-server += "${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'alsa-plugins-pulseaudio-conf', '', d)}"
 
 # pulseaudio-module-console-kit is built whenever dbus is enabled by PACKAGECONFIG
 # but consolekit depends on libx11 and is available only for DISTRO with x11 in DISTRO_FEATURES
-- 
2.35.3


