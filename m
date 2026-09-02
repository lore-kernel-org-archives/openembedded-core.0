Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D977C61DD6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 13:27:39 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12514.1788355656933549390
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 06:27:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pLabnhdq;
 spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-936dfd009d1so277433885a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 06:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788355656; x=1788960456; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=stqTRpmwH5bZlMgKVpyBhoTz+Litz67Dq/AnugtA8Pw=;
        b=pLabnhdqZp4NAicHjd3vuEMJDw4rFVAiIhS/AiciHRPpyTF19/Ypg/52pQlbR6fHXf
         2gDWNaBUIilh0uHwmcIcTLvCbiwkt3YoRCH878F7TzWkRFHSL0g5CbPlTEnDJLFFrUj8
         dITl53suN7J/PKYlHMRvjNHXunSTgaZxcCRFMkFmDUBe+R1GBBKvdzgdDcCn37UoZVlG
         AjUAMeX5+65HQoVhyMc0bLNo3MCZKWiJfrv5xhbAH+RJyUebPyYbj0zomnJe1iUqn/Lc
         yYDLvcMCfTj5ErqrdNfD2VC+Ji0E62Yu7sExCofvrPzllXv8mz7A4b9p5cm8UDC353pA
         rWdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788355656; x=1788960456;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=stqTRpmwH5bZlMgKVpyBhoTz+Litz67Dq/AnugtA8Pw=;
        b=sbToF13ywUijnAjTg2WmLax9TAlWqw6INlGaDFCGDABsG/L3NmXqcLseNGOsuNFTdl
         UyTkLv38o64x35/BvKwd/oEo8mMDROYRBVTokPNEnArbbKJFPY7tt5VQEEIzHYS76EvF
         n2uQQB2Rz0KsrLVDsBxf9+FVcnP51oPAD5RG1LC4YfR236ArdgApSSBJce5zun2KINJ1
         fEmyu8BiLkYoHuWaIE4SQYcE6DCoGAnGX4DLHHqwVrCDDdAhizKWsQxWL1HNPXZ2iS+k
         QcUm6oiDOlsj9KOuGxTX5MG5FMLmGShj21YgQi/+fBAk6tL9ZWY+bRYGt4d6/bZuYGvW
         E/yQ==
X-Gm-Message-State: AFuF++mSYxKf57Xd8mm5MDCS1rcm8Es/8YEQN15rSc5lrLB+f1rTpT4L
	9AgG3Zk+PljkkQdjJXC+CzWEOIGKfqxn8qoGoGA0LpePvgz4dunJaFSusmX4/GZh
X-Gm-Gg: AR+sD11MyMtD7SGTGAiiHTrpalLuqlD5diX8BKlONB//HehaTkocz34yDGwKYilgXdX
	DAR2SY/DeBNCUFhEglYBkPI2RGr00zuMafqX58gkrux8nvjrMSOjtsklzfrg+4sIrnnceGsqdEq
	yW0S0vc7zdTBNUenf+q6qhKlv+XAoyKqJFwmgtvtE8IotBm9eClFtm8G0162X94QqKJKANPl80f
	ADo7iR1gWaLMalXFZWOlYHvYE2u3cJNYpuI8dKgsy5D0eaJA9BpjSNGn/yLF5osLLlHZLrHwZr8
	6p7GtHpS9KbA0lxlV1anuTvDcd37I6kPHGDqdlwTgelUtLpMMWSIBpRS0xXRtGfr4CShU75E1yn
	DP/b+Ep/CG8vuAiVB35PVr9cW8AYIDZMHo4nfTuzEFVtvERs4iDYzESIueXTUCqvKy1QLdKTrbY
	W8aF/mFSgOXSV71egkORiU5CR08Urd+290ppx2ByxhiIpurWtGQ06bq4Sdz+b7db7Mu15/XrleI
	xjlx3dylYisxWtMG4kR6gDP9M2SipCVX9lPsB1vG3HY541dtC11LG1NUza1o5YvtBqMh5ukpjdQ
	cOwckNIoZELG1To6MbEfvWy6jWNQbvsrACSoOZONat2sCOhJyZqEZKJWwdCamEeX+E/ji6PtGQf
	olw+F
X-Received: by 2002:a05:620a:6f0e:b0:939:a45:8c96 with SMTP id af79cd13be357-93965c6719cmr276219485a.19.1788355655342;
        Wed, 02 Sep 2026 06:27:35 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9395f398a18sm203691085a.37.2026.09.02.06.27.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 06:27:34 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 0/3 v2] linux-yocto: stable bumps and tiny fix
Date: Wed,  2 Sep 2026 09:27:30 -0400
Message-ID: <20260902132733.3685768-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 13:27:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244956

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Hi all,

There's some overlapping patches here (that have been sent before), but
I decided to just do this as a new series.

I sent the tiny build fix, without sending the 6.6.151 version bump ..
so it obviously wouldn't apply.

So here's all my pending 6.6 changes, hopefully no issues this time around.

Bruce

Bruce Ashfield (3):
  linux-yocto/6.6: update to v6.6.150
  linux-yocto/6.6: update to v6.6.151
  linux-yocto/6.6: fix tiny build

 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

-- 
2.43.0


