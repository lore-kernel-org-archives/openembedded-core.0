Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F6EEC43334
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 04:57:01 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by mx.groups.io with SMTP id smtpd.web09.3098.1658811411684625714
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jul 2022 21:56:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@zhukoff.net header.s=fm3
 header.b=yCz1v/8p;
 spf=pass (domain: zhukoff.net, ip: 66.111.4.28, mailfrom: pavel@zhukoff.net)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 05F545C00A7;
	Tue, 26 Jul 2022 00:56:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 26 Jul 2022 00:56:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm3; t=1658811411; x=1658897811; bh=OjmL9TJ2Q+yRtgRHJLFX/H+uz
	C0rlmJA01vsw97ctfk=; b=yCz1v/8pz335VKdFyYJfG/sOsGNTwdreIhvQj7o9I
	j5CrBJGSKwcQghNEhp0Wgtkl4LkkFXsC/otLvxdxN+j7OUBPFdkIqoVgydyLEryy
	WHoT/T38yxDwmx3GesqnGHVH1qddExhEj94Lhq1gvYyRnRIGp9mJI/wCUQenWUre
	T38hB9EptLNXtOXcukXXQUV/4xhwzCshCvAxT+hnYWVkoZkE50OLmqaXvr0Xgyh+
	wB+Dbg2Sxh8MgpLbEUsDivPmS/n7y+cITcBx65VGxi+jNktBsnWx7GdTpQxu2whB
	/NnAwxb8bZgDaZ8Ctigo0YkdfkjmHtcFZZGXQ6RRjn2nQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1658811411; x=1658897811; bh=OjmL9TJ2Q+yRtgRHJLFX/H+uzC0rlmJA01v
	sw97ctfk=; b=aCP39+4NgH/C3Il1Hi2Zby2ystzaFkcp8xwgDpV9l548sGGNpLZ
	3+DibJ8VUTf9rcEjmM97pqEOZpPv9cwmB04eAqexbrU+3beIVGiDNHmNuem8W9Y2
	EAYApFkzP/IGp5orCQLCZhBz/nGV9NSDWJsmMFFqIbujfYXh/JWbIxDFU4N32GLU
	R6Pq8DNIeoDY8gFW4LXxXKrHGjNzh8bOuq6Z73+g0AyZhjuS46vuaaRTht+usBK7
	gKtvNge7+hVkJUleTIyU0FIKHilBuBro0OtKAvGOqfa36KYnZBzYttTeZLJfHql4
	PPB/KIejKde8eGevYx19v6GEhv0l8iPu4cQ==
X-ME-Sender: <xms:EnTfYoOVAEAKPFGDJ7CHZryJHqL1mF-0x-q7C3MTOqaHNIUelWP--g>
    <xme:EnTfYu92TX1QDg0NDJjZO8kZHgOBqZDZk48z1e9EptO3GORZU12N59PLrCW7iHXx0
    DwM6WS5yxamROojny0>
X-ME-Received: 
 <xmr:EnTfYvS1itATquVq-5gll8S55LOfbHiOVdxjWAqh766-Bkzwd7B5uj66TfN29D1IPOPw4CBrv5Nq20Awn0xjrGc>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvddtledgkeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomheprfgrvhgvlhcu
    kghhuhhkohhvuceophgrvhgvlhesiihhuhhkohhffhdrnhgvtheqnecuggftrfgrthhtvg
    hrnhepveefjeekjedugeeltdekjefhtedtfeejueffheeikedvudfgtdffffelvddvfefh
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrvh
    gvlhesiihhuhhkohhffhdrnhgvth
X-ME-Proxy: <xmx:EnTfYgsdXAQR83Mj__Qbk_CtCYHgAAlJziVJ6QwyQS02Ukd4VJEosQ>
    <xmx:EnTfYgcEuClMfEmxdxIycQ0F6QG-yl23E9YBrt9s5zCIUoEa9MZsww>
    <xmx:EnTfYk2dUmAGQ9fgmB_mRcO1MH8MH7ni5esS9YGQoxqGyaat1sVySg>
    <xmx:E3TfYv6CxaOuhOuOw4JqXoWAqUmEyXQ4nobQYMPvzOvKgiq9N-oD-Q>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 26 Jul 2022 00:56:49 -0400 (EDT)
From: Pavel Zhukov <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Cc: Steve Sakoman <steve@sakoman.com>,
	Khem Raj <raj.khem@gmail.com>,
	pavel@zhukoff.net,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Pavel Zhukov <pavel.zhukov@huawei.com>
Subject: [kirkstone][PATCH] gcc-runtime: Pass -nostartfiles when building
 dummy libstdc++.so
Date: Tue, 26 Jul 2022 06:55:51 +0200
Message-Id: <20220726045551.19356-1-pavel@zhukoff.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Jul 2022 04:57:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168493

From: Khem Raj <raj.khem@gmail.com>

This is a dummy shared object therefore reduce dependencies further by
not requiring the C startup files, we wont use this shared library for
anything useful anyway

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>

---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index c85b5888d4..8074bf1025 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -68,8 +68,7 @@ do_configure () {
 	# libstdc++ isn't built yet so CXX would error not able to find it which breaks stdc++'s configure
 	# tests. Create a dummy empty lib for the purposes of configure.
 	mkdir -p ${WORKDIR}/dummylib
-	touch ${WORKDIR}/dummylib/dummylib.c
-	${CC} ${WORKDIR}/dummylib/dummylib.c -shared -o ${WORKDIR}/dummylib/libstdc++.so
+	${CC} -x c /dev/null -nostartfiles -shared -o ${WORKDIR}/dummylib/libstdc++.so
 	for d in libgcc ${RUNTIMETARGET}; do
 		echo "Configuring $d"
 		rm -rf ${B}/${TARGET_SYS}/$d/
-- 
2.35.1


