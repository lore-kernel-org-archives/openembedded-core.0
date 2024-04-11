Return-Path: <jsbronder@cold-front.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1EF7C4345F
	for <webhook@archiver.kernel.org>; Thu, 11 Apr 2024 19:47:38 +0000 (UTC)
Received: from wfhigh4-smtp.messagingengine.com (wfhigh4-smtp.messagingengine.com [64.147.123.155])
 by mx.groups.io with SMTP id smtpd.web11.27900.1712864853357125991
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Apr 2024 12:47:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cold-front.org header.s=fm1 header.b=rdmrf8yk;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=b8I24/7Q;
 spf=pass (domain: cold-front.org, ip: 64.147.123.155, mailfrom: jsbronder@cold-front.org)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfhigh.west.internal (Postfix) with ESMTP id A0F001800106
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Apr 2024 15:47:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Thu, 11 Apr 2024 15:47:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm1; t=1712864852; x=1712951252; bh=Q6zH4fbfTiTOhvoPa1kL+
	wWVm3QyQC/JjqZXBGfy69Q=; b=rdmrf8ykkrRVYEO8KWQlo+121eEvqE1HH7c4M
	PuVdi9lAbxgAA0VFztjp9tcjylZb0G0VUm1AFqriN8p0HCOy9k5cALvDudZj47js
	e5y2/AsLeIk7MinEqS00L1Ron6MH3/1iiYQDkXFBflBNIbqueMFO5HzHejjOwVU7
	BmUtR2ffhZZSwTeV2aezbmJ0CVgTm4jPOx46T9uqsUY+P3G4HzuwBeiaAMFeK9KQ
	q4jm1nX0pdAEmKAHpGqap4Ta76mLBOks7pfzgNC9GuKxJ+Pk4mCwtpCR1NkCtShU
	N5vIdXDO8th0rN2O77q2tOZxATR4fJxuZgEzZ4ZByiHIcG8fQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:date:feedback-id:feedback-id:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1712864852; x=1712951252; bh=Q6zH4fbfTiTOhvoPa1kL+wWVm3Qy
	QC/JjqZXBGfy69Q=; b=b8I24/7QVnD/mfLSEf7l/MLp9frYCw9WwK0gsIAPlEfW
	RTsjygzQEfMRfIvTFowCDhrI7anLXXqMkKFbuyo1/TEpDc2Ocid9Xl7xudWqfAnU
	tDt7ApgVo9aLhdB1qi6S4X5x/eokNGoGO4PvKYUdkAB1LG1rHMUHfVRBmpBmZBFF
	YwzRV8QW7+YNZK9y8XDiQxph32WN3yFsquDNq51FQFw5ctXcAlfxHT/Gp7R9NyNk
	NnO5AG4f1t/LKB07nRsoYZgyKO9iATpg6VqBodR1PMpHJjqaFVDkf4Es9yAfiDh4
	8E4y2GRC8M2PKWM24PVubPlsw7Wt1NyoJBjpvz9Ycw==
X-ME-Sender: <xms:Uz4YZv_rS3aINArxZC7bQzHefq4fl7uxED63wVt8aR-z3F9jCC1dpg>
    <xme:Uz4YZruxZI3-FJYZuhwPETutsrjcR5Wonk-UdYPofJmP54Zp9pyZDH5d4fgbtESvZ
    V-ebK0CPG4kI0016A>
X-ME-Received: <xmr:Uz4YZtAGUqUMjFNlzuIeg3-L7_IIe-Z-G2_z_5Gy78F47BN7DIAFJs7lQQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudehkedgudegvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpefluhhsthhinhcuuehrohhnuggvrhcuoehjshgsrhhonhguvghr
    segtohhlugdqfhhrohhnthdrohhrgheqnecuggftrfgrthhtvghrnhepvdfhtdfhffeiff
    evteevieefuedvtdfhleduieetudekgefgveffgffffffffffhnecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhssghrohhnuggvrhestgholh
    guqdhfrhhonhhtrdhorhhg
X-ME-Proxy: <xmx:Uz4YZrcyrwIfPj_le-lAuf6W1pQ2Xdds4N_1jEXfECkmwc55SFdyxg>
    <xmx:Uz4YZkPGIDugNCoA215s9gdwLecG2lgLRSl4zyvoineqL0dtPNOyag>
    <xmx:Uz4YZtk4v_9KdO-teysoKtjjCXP8t36AbTpWB7OjHE92fJGJmhtS8g>
    <xmx:Uz4YZuu7J7rMcACVh-vHth7NSXDPiv7ObwD0Heq-DohLBRPp4T5-aA>
    <xmx:VD4YZu0930GRU6p3OGl8O7gyCXmBTLD0v4paNKRHphQz73r-_dxLL5Z5>
Feedback-ID: iea0042cb:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-core@lists.openembedded.org>; Thu,
 11 Apr 2024 15:47:31 -0400 (EDT)
From: Justin Bronder <jsbronder@cold-front.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/2] Clear remaining ${PYTHON_PN} uses
Date: Thu, 11 Apr 2024 15:46:35 -0400
Message-ID: <20240411194727.26317-1-jsbronder@cold-front.org>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Apr 2024 19:47:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198143

Removing a couple of remaining ${PYTHON_PN} uses that were missed in the prior scrubs.


