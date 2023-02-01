Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A07CC636CD
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 13:58:12 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
 by mx.groups.io with SMTP id smtpd.web11.23905.1675259888170785882
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 05:58:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@zhukoff.net header.s=fm3 header.b=a+1YK5pa;
 spf=pass (domain: zhukoff.net, ip: 66.111.4.27, mailfrom: pavel@zhukoff.net)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 5C1DE5C00B9;
	Wed,  1 Feb 2023 08:58:07 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Wed, 01 Feb 2023 08:58:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm3; t=1675259887; x=1675346287; bh=bezINPvdHaXXN7SFwSQHuReKF
	f7cGNUPLF53m8Afrk0=; b=a+1YK5pawxlRizsDp0TNMArBrQO1WX0lzVkrfqlUG
	/Ipg4EO2VITxexmp2Qh2aHanFiS3XvjFRsSgPB9OcRdeKrZUs4zWy+ErRsLq9HJD
	3RYfyfdbAc2p23xF4cJEI9DMxJyAVo9vm4dnvEC5r+JmS0Dx5oFyB36/9HSMiEOd
	zSAcU+aNpP1AZXN5BlBDnwi0ElY53ZIVmUOhT6aNgi/IWK8RraV0tmf4qTmkZRbV
	W3vNY/uVzsAMn1C+tgkSfo79UN6DeRgwbOjuLXuRcRyZ2XNmZSTS17oCkOiB7p2E
	oz2I1UfEsdbMTwB1ipJ1QiSFDwTLYmlRCAhwkQ2E6HiWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1675259887; x=1675346287; bh=bezINPvdHaXXN7SFwSQHuReKFf7cGNUPLF5
	3m8Afrk0=; b=iKJA4+6Ps3U36PcLR+AfTNgygBWbpfEHAYBQBuz71gCpN+nWJVb
	JDdV2KHzMsAURbKonuCqwckSbPDpUx6d29ru2LVHNPnbNZ9rPsy06Fo8mJgAFIV9
	OuPQIPYoZ6eEQRqB5Fa2Z6mpT28OLmrMdV/1LU7u0YZzRnbxxjmarWM/9YKIFSXx
	eL9kDPJ2IneNgLbxEL1AyNHw3jAYycMTFtQns8g0Hx00kw7erhhcTRTfHID9liTV
	0TNuXnOv3gH8OPFqXsZcrUE5zZ9HWnIItJ3Q84YMkqctH0J6Wey9OqYeS5C8P9yq
	0BjbnNSBoc6FEJPfrKNzisZX5jGXTYYUL1Q==
X-ME-Sender: <xms:72_aY5giIxnN7iR_oZfJzGBGdaATu56iQ5fk1u7nPA6QvN9fMtDWzg>
    <xme:72_aY-BmIEGcEPpnrzvPLVaXokSx86pkMML3jHUUC2fOQ-mmZyZihJfMvSu7QqKyW
    j01PD7notJRXtG9Cc0>
X-ME-Received: <xmr:72_aY5FlGeUr6Aajh0DA2WNnWzyxdBv1V0PeEJj2bzD08ZuE3JHH7KmSXwzS10siCXW18y4zyCvJxrdVRpE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudefiedgheelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpefrrghvvghlucgkhhhukhhovhcuoehprghvvghlseiihhhukhho
    fhhfrdhnvghtqeenucggtffrrghtthgvrhhnpeevfeejkeejudegledtkeejhfettdefje
    euffehieekvddugfdtffffledvvdefhfenucevlhhushhtvghrufhiiigvpedtnecurfgr
    rhgrmhepmhgrihhlfhhrohhmpehprghvvghlseiihhhukhhofhhfrdhnvght
X-ME-Proxy: <xmx:72_aY-TwnwGD1zccbQcaKmkIfmB9xUTxZyBWk3SgZmBLOAznfJXH1w>
    <xmx:72_aY2wt-mkjuHe4Uh7ZQVkfP4AbhWhARiYWdHeShMoI5AsExnXXbg>
    <xmx:72_aY077yuw60CshDPcYfjsekfsUjjolxon-76YWfRXwge_kKDnKOg>
    <xmx:72_aY8ZDnTP0De6CRsH4Do1NIvoCB5HnhNFcChAtOBIX3-1pxAmN8Q>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Feb 2023 08:58:06 -0500 (EST)
From: Pavel Zhukov <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Cc: Pavel Zhukov <pavel@zhukoff.net>
Subject: [PATCH] bitbake.conf: Add mercurial to HOSTTOOLS_NONFATAL
Date: Wed,  1 Feb 2023 14:57:44 +0100
Message-Id: <20230201135743.27494-1-pavel@zhukoff.net>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 13:58:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176531

Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
---
 meta/conf/bitbake.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 5aadf6e707..880a91826b 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -543,6 +543,9 @@ HOSTTOOLS_NONFATAL += "bzr"
 # Used by ssh fetcher
 HOSTTOOLS_NONFATAL += "scp"
 
+# Used by Mercurial fetcher
+HOSTTOOLS_NONFATAL += "hg"
+
 # Link to git-lfs if present
 HOSTTOOLS_NONFATAL += "git-lfs"
 
-- 
2.39.1


