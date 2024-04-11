Return-Path: <jsbronder@cold-front.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1803C00A94
	for <webhook@archiver.kernel.org>; Thu, 11 Apr 2024 19:47:38 +0000 (UTC)
Received: from wfout4-smtp.messagingengine.com (wfout4-smtp.messagingengine.com [64.147.123.147])
 by mx.groups.io with SMTP id smtpd.web11.27907.1712864857351343284
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Apr 2024 12:47:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cold-front.org header.s=fm1 header.b=x49b/Csw;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=SA6tpSJ1;
 spf=pass (domain: cold-front.org, ip: 64.147.123.147, mailfrom: jsbronder@cold-front.org)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfout.west.internal (Postfix) with ESMTP id B5B9B1C000CD;
	Thu, 11 Apr 2024 15:47:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Thu, 11 Apr 2024 15:47:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1712864856; x=
	1712951256; bh=2LYxLNNVs08fjU1Iff9l3DJCKvvkiX4moXF9rjjwOtQ=; b=x
	49b/CswtNZd5jrf771fe7NX3L/QO6LErrHQsQEDJUrbnRdD4qCzV+bAn0xiBbMtd
	PHDfwtRcpeSt5wii2CTYmCBw71zcUuZ7P+nuNPKRWZQLQePL2udwVABOL1a7E0OZ
	3mLLWMxggNG1Dk/Csas7hzjqJH84zmufblaJJ4YMaoDBEr1p96iLHVuKqK6V7Ylo
	vBW0MC4Gn/z3tkhQeBmzYbnyI4b8vVPXnXwcjYf/zC1SyL4hqxyr3nwXzq9hqZHY
	Usv/qqSuxkkRkHGd1Alw+A9xexIzHMdhY+F93vzjgdKerZSbiGlso+S+W6HTGi/k
	ALmauju9iGcm09QoEpnVQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1712864856; x=
	1712951256; bh=2LYxLNNVs08fjU1Iff9l3DJCKvvkiX4moXF9rjjwOtQ=; b=S
	A6tpSJ1fHKi4D6dfMIFFzXAge05bKmh5kAUT9y/l4rRjAX3sXGB+VyOZb+fqLeZa
	EtoLJoeLU7YjWwaTZjtX7X4vA/0atJPLNCEvPrkYkQqagHUYB4NJnoRsvmCUNw3Z
	DH2TRqs/6bKqpL/Aok/bwcsfHIrwIXHbTEBEsqpWUKnIlJfKTHKOsh+sd/Z3Htow
	9EVqpCyyFRcT40TDTWmRO9WjIr6pG7ihk5zdPS8wzydpp284OAgA7JESWTcAE4io
	4hrNwrOI6BQ4+GoBpqgCoXrV73siFfYb7hrkXJGU5fUK9Z5ZnIgVW20GZGf2yWd7
	xvCcARdg78Qye8Q842s3A==
X-ME-Sender: <xms:Vz4YZqUtVhMU7Fm0dHU6XLy47gBi2P-imVbr6re9A-KXS90xuJokSg>
    <xme:Vz4YZmnJxRpcoBydRw1QAxYOb6ruAosJIXq3FcrGPdhj2vlilsJQ1z6m3zrnBwznU
    L_WcNOV1U0RqDnmaw>
X-ME-Received: <xmr:Vz4YZuZvV8vATD9YP4feYfOrS6-JlAchGFHIiWg8Nu2_xXKqh0sUVsEygQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudehkedgudegvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestd
    ekredtredttdenucfhrhhomheplfhushhtihhnuceurhhonhguvghruceojhhssghrohhn
    uggvrhestgholhguqdhfrhhonhhtrdhorhhgqeenucggtffrrghtthgvrhhnpeevfffhve
    fhteeluddtheduteetieefueeigfetfeffveeluddtjefhkefftedtveenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjshgsrhhonhguvghrse
    gtohhlugdqfhhrohhnthdrohhrgh
X-ME-Proxy: <xmx:WD4YZhW1rgOEVdwcdiTjBSyG1hDcjBeE6Iptn68Ukxa5goPXZx2SFg>
    <xmx:WD4YZkm8s-kER8_C2II0b2GPMh0q7ZFoJ_gaGYOjAhC2WeZdl2CZng>
    <xmx:WD4YZmdd417CLGqclGX0AvvpWAwWkC37h48VyCWASddQVneL3LwTmw>
    <xmx:WD4YZmHgSowdqzjZ4wK7AKthuyJWVobOHn5O5OPZlLKDjmsGxp5CsQ>
    <xmx:WD4YZpypdAzs7GATBhIHR-DUx_oNMrUU1hb3oevKYHt_-RSmi6S5UQmZ>
Feedback-ID: iea0042cb:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 11 Apr 2024 15:47:35 -0400 (EDT)
From: Justin Bronder <jsbronder@cold-front.org>
To: openembedded-core@lists.openembedded.org
Cc: Justin Bronder <jsbronder@cold-front.org>
Subject: [PATCH 1/2] python3-jsonschema-specifications: drop ${PYTHON_PN}
Date: Thu, 11 Apr 2024 15:46:36 -0400
Message-ID: <20240411194727.26317-2-jsbronder@cold-front.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240411194727.26317-1-jsbronder@cold-front.org>
References: <20240411194727.26317-1-jsbronder@cold-front.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Apr 2024 19:47:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198144

python 2 is gone and we don't need the abstraction now, drop the
remaining usage of this variable.

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
---
 .../python/python3-jsonschema-specifications_2023.12.1.bb       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-jsonschema-specifications_2023.12.1.bb b/meta/recipes-devtools/python/python3-jsonschema-specifications_2023.12.1.bb
index eb63509fce..4ee0dd9b12 100644
--- a/meta/recipes-devtools/python/python3-jsonschema-specifications_2023.12.1.bb
+++ b/meta/recipes-devtools/python/python3-jsonschema-specifications_2023.12.1.bb
@@ -11,6 +11,6 @@ inherit pypi python_hatchling
 
 PYPI_PACKAGE = "jsonschema_specifications"
 
-DEPENDS += "${PYTHON_PN}-hatch-vcs-native"
+DEPENDS += "python3-hatch-vcs-native"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.44.0


