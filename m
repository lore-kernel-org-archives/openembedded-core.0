Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92612C43334
	for <webhook@archiver.kernel.org>; Thu, 16 Jun 2022 05:58:51 +0000 (UTC)
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by mx.groups.io with SMTP id smtpd.web12.14856.1655359129926206474
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 22:58:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail, err=mail: unclosed angle-addr;
 spf=pass (domain: zhukoff.net, ip: 64.147.123.20,
 mailfrom: pavel@zhukoff.net)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 29A0F3200911;
	Thu, 16 Jun 2022 01:58:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Thu, 16 Jun 2022 01:58:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1655359127; x=1655445527; bh=7YJno9rIL6drq5qc0itWd1NnE
	oSV+k5QzLBEO9SWEOg=; b=wnxJ9OQ1hNxfL1Pmu9WV/RfZZb2+BW3Rs6ecvwFM9
	dsy4istF2z45tnh2e+QQa8P6ZhpNO6XUSpIoJB9AQFfOrKcHjNUfh9m9lz2pqzr9
	0WJ4KkaV2i2Cn+Wmp/DS5perUPmfqQS9kmcP6wNBhgY5LBl2Jry9Vs6DpXV2TEt9
	5f/PMFpPnx1eb+BPzbqKGW7H5PjOmy1ZKFlZ76hwBxJ3Jh6c7Ts53HK861T7Ny49
	fQmoyxehQckXv6BaOF/V5jhalwHgegd/zPBJ7LYuwyyPva7yo8dCam/RVc2Up2iI
	DLoP3HoRqKaLdqurdKpFS718DuJgiIZL92HzFINWin2uQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1655359127; x=1655445527; bh=7YJno9rIL6drq5qc0itWd1NnEoSV+k5QzLB
	EO9SWEOg=; b=repZS+As+Q0ngLNlHBKeGDckULXDGCXPsQT086W6mLQb16kpIGh
	ltSsu04W6NCJ8baYuHMeVhnFTXR2GKXkVKgeWKZxZL8gVgiawuu94fNUha6AHFwX
	OjbzdplPDQFRZFchefKfxF+FOFodajnRyvK+QWeu61U2+gODDpcdLPw8HL1Uf8rS
	QdVPnUHNgVJhTjHMV8gGzCgcHmf0w4J4ag6l8/R9Y3vKOKss4cUPMsWiOVJm9WU+
	YO09vvNB1KQkxE9zcbZX0yhanvn3pV9+hG4L19MF3QoyLQpBbfNCXa0/e+etd2V0
	UhKdM9MvcQ11gd5PXEJXVO9i/Hi43d/Ue8A==
X-ME-Sender: <xms:l8aqYjxZ_N2T42uM7E-URAuMbbVYXAzOhuwqNCS5Wja03gj6FVsxlg>
    <xme:l8aqYrQC5M_Ax9NtlwfTxYcIRnzm-oC8Ja8sCQaCZM0q_vrP-4NEtNta5zYoDQdWp
    OxKi6xDP3wnenp4NyY>
X-ME-Received: 
 <xmr:l8aqYtU20-th1m_OvxUz4XTq5j4lXdhm3kz4vbJUGbvDbHYorqIvvOxVCuPDSzc5auC4PNh8E1R5c_pPSVGabZk>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedruddvvddguddttdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enogeurgguqdfhrhhomhculdektddmnecujfgurhephffvvefufffkofgggfestdekredt
    redttdenucfhrhhomheprfgrvhgvlhcukghhuhhkohhvuceophgrvhgvlhesiihhuhhkoh
    hffhdrnhgvthenucggtffrrghtthgvrhhnpeeileehjeevgeetjeeuieeghedvjedtteev
    teehiedvieefteehfffggfdtteffgfenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehprghvvghlseiihhhukhhofhhfrdhnvght
X-ME-Proxy: <xmx:l8aqYtgicbOPlWEOxobby7WMoxpXkC5dMdhCO49uZQgYezMjEzQs7w>
    <xmx:l8aqYlCq3bdU-loX7jmm2gZINdvUK6Udo2dQnCqaQ0xBzIQ2Gavw0Q>
    <xmx:l8aqYmIADFMVd7E82zC9HYGV1wfOsc0un8wxGoGsBAwHO6gAFPcElQ>
    <xmx:l8aqYoOxtWpH9SYvCiKQ8bq_Kkw0sS8oEmE3S__dNW5j4jmG3Bc5-Q>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Jun 2022 01:58:46 -0400 (EDT)
From: Pavel@codeaurora.org, "Zhukov <pavel"@zhukoff.net
To: openembedded-core@lists.openembedded.org
Cc: Steve Sakoman <steve@sakoman.com>,
	pavel@zhukoff.net,
	Pavel Zhukov <pavel.zhukov@huawei.com>
Subject: [kirkstone][PATCH] systemd: update
 0008-add-missing-FTW_-macros-for-musl.patch
Date: Thu, 16 Jun 2022 07:58:28 +0200
Message-Id: <20220616055827.26204-1-pavel@zhukoff.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jun 2022 05:58:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167000

Fixes fuzz warning with insane class ihnerited introduced in 4c3f51142b
Kirkstone specific, master has been updated to 251.2 and FTBFS with musl [Yocto 14838]

Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
---
 .../systemd/0008-add-missing-FTW_-macros-for-musl.patch   | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch b/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch
index 4cce9a3fe6..0c0d3d0b62 100644
--- a/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch
+++ b/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch
@@ -21,12 +21,12 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  3 files changed, 22 insertions(+)
 
 diff --git a/src/basic/missing_type.h b/src/basic/missing_type.h
-index aeaf6ad5ec..3df1084ef2 100644
+index 6c0456349d..5140892e22 100644
 --- a/src/basic/missing_type.h
 +++ b/src/basic/missing_type.h
-@@ -19,3 +19,23 @@ typedef int (*comparison_fn_t)(const void *, const void *);
- #define __COMPAR_FN_T
- typedef int (*__compar_fn_t)(const void *, const void *);
+@@ -14,3 +14,23 @@
+ #ifndef __GLIBC__
+ typedef int (*comparison_fn_t)(const void *, const void *);
  #endif
 +
 +#ifndef FTW_ACTIONRETVAL
-- 
2.35.1


