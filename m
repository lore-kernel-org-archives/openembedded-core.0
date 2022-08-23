Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 158EEC32774
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 14:58:52 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by mx.groups.io with SMTP id smtpd.web08.32935.1661266728156073282
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 07:58:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@zhukoff.net header.s=fm1
 header.b=IV/QCuXR;
 spf=pass (domain: zhukoff.net, ip: 66.111.4.27, mailfrom: pavel@zhukoff.net)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 5985D5C024B;
	Tue, 23 Aug 2022 10:58:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Tue, 23 Aug 2022 10:58:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm1; t=1661266727; x=1661353127; bh=ZDsDA5f2WMQGlRW4lJjU5ctwa
	5xlfwNhigVxcGuNhgE=; b=IV/QCuXR1sVh1EcsRXMRKY0KyaJr310tj9cUCGfrV
	GYJZDZ/bm9jW5H6g7/Q7uIJa6eio2UU/NT27CCp748fw+oxHUGukk8YIEWZCLY4/
	HAYmM9Fp/Ak/t1uEByeugorgmd12zmRsLL8nz2ZENKhqQdqtdV3RCNRRRqj6KVS+
	maqFYppanx2IkqX49MIma89bo3ImTuDfpQ1kmtqS2P/W0Uai7WouoiF1SbOWcc8X
	LjZz6/LqIASHxZqZzXiRq+MS37lq8g13HGT7eYR7gVE/os8xj89UCdC4nmbLvF6N
	BBRoJHdbfENtjF1duNAOYs5tbEatyWmjPaLGD8jDH64Gw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1661266727; x=1661353127; bh=ZDsDA5f2WMQGlRW4lJjU5ctwa5xlfwNhigV
	xcGuNhgE=; b=uBG18R5VYQMz51BTv+dB7+IJNTDo3jx+LaZ6vWspIy/NLXSdG2N
	JpVAc1qvcWyBF+anxgiREozPBNfYbM1cK4te79Px3gj16xBpvwR8F0yQVWg7LBeD
	JbQ+kMPmvn1NK6WPwq7IJgxU+l3qksKfuRL/MFCBVlKtV4WZAvO7+OAj794yn9R/
	fs36RufGTfxRKpVs8oUBjGHPfsdqihvGj2JnfPgquMS03cZ+YYJ8H7c7r5kaBrXb
	aK1aqNERLFekwx2JIDvgInjIgGVKMvRubTci4cg8z8NlrOdg3imBW7AmTdWeCul0
	scAORGmox1/986XxCPM1A2+yKIOTmIl1zqQ==
X-ME-Sender: <xms:J-sEYymuscBKK5lG7WhupSoFRzah_ajhacfo3Ijg4iCkPAu-JFzNcg>
    <xme:J-sEY50Z4hHvAF_sLWFr2Tu7TocHl9tV0uQz5RKjiO8zOXS1S8-pFm0v0o1_sHBK_
    txtqRXJInWhTGZiYfc>
X-ME-Received: 
 <xmr:J-sEYwpOZHqDpvftAa348sAGLx1QebIZoyuSxi8cFwnVBe8bvdmwY74JVJdFNMH6SVNiQlRC3lKeGCdUyoO7z0g>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvdeiledgkedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpefrrghvvghlucgkhhhukhhovhcuoehprghvvghlseiihhhukhho
    fhhfrdhnvghtqeenucggtffrrghtthgvrhhnpeevfeejkeejudegledtkeejhfettdefje
    euffehieekvddugfdtffffledvvdefhfenucevlhhushhtvghrufhiiigvpedtnecurfgr
    rhgrmhepmhgrihhlfhhrohhmpehprghvvghlseiihhhukhhofhhfrdhnvght
X-ME-Proxy: <xmx:J-sEY2mi7RwnBWWDuiQTocDYsxDknsQplcqfLccFtsKPINHf_maxQg>
    <xmx:J-sEYw1BKNRFcMHDLibgd5Pv68l_UmEqeAXesqwahWp0kkI3BK5iZA>
    <xmx:J-sEY9v8dz7HfnRkZCbH1UUNwvK1LmpXFLOMxPOkAPaZf7V0p-vwMA>
    <xmx:J-sEY19iJblE1NX-FjFTKWmJDQfUdM0m5rHagIqY3kq7BBMXLtKJ2g>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 23 Aug 2022 10:58:46 -0400 (EDT)
From: Pavel Zhukov <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Cc: Pavel Zhukov <pavel@zhukoff.net>
Subject: [PATCH] parselogs: Ignore xf86OpenConsole error
Date: Tue, 23 Aug 2022 16:58:22 +0200
Message-Id: <20220823145822.28366-1-pavel@zhukoff.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Aug 2022 14:58:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169713

[Yocto #13854]

If VT argument was not specified Xorg server tries to bind to VT1, then
VT2 and so on. In some cases (runqemu with nographics or serial options
for example) VT1 can be taken by systemd getty service which generates
error message. Do not fail on this message if Xorg is running. (covered
by test_xorg_running test)

Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
---
 meta/lib/oeqa/runtime/cases/parselogs.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
index 1f9365f3a86..01ae4518cb0 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -64,6 +64,7 @@ common_errors = [
     "[pulseaudio] authkey.c: Failed to load authentication key",
     "was skipped because of a failed condition check",
     "was skipped because all trigger condition checks failed",
+    "xf86OpenConsole: Switching VT failed",
     ]
 
 video_related = [
-- 
2.35.1


