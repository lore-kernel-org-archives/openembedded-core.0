Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10222F30948
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 11:38:43 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42200.1772710713207813536
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 03:38:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A/cXLQ47;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-506a297c14bso67789081cf.2
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 03:38:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772710712; cv=none;
        d=google.com; s=arc-20240605;
        b=RvQeqch2qMFzN+5Mti+Pgw8KHId1IpPrb4pp8LZQRz0Zs6KZAqLQiDUtvxjuOmBUTr
         ITAbZlA5N4Exsux/QXwROMk8HFXnNSiPiYUqHLLKrIESYVZrRluipOOgXD3mjlos6uQJ
         gCztRgSGG4scw9uR88M2xryXQ2ZLDTYjM+Iwg4fRjT5Bgu4H8oc0gOZJa/S/pZE5NK2e
         gxUv/Z7mxJ4u+k+AiBfL2XCCaVpAyjlipn2nN2ZO/QtLaRGR/kekqBjHOkrG3H/+XQhl
         jC81cC9pgjtIxUkid8Bi9HQafD3O6UJh/mYAxpF2v6UvSplYbbv20BJp9iqMfdtzfLBZ
         1Z3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BLs97xVSTH/7xpbwisafb12H8oi0fPFHeoD4nNPX2rk=;
        fh=DuVY+ovRIuOyRnHH2GbZhZlLTAXLHTnU1FAdPcfOkwA=;
        b=HnV336J+DTSHdqmIDht9n+Gwos3qi1JAmo7IMLV612k/03XzY1M36ZOUmtmlIF9EQa
         vjXvDaSnio9mTBC1eP6PziuIVxDfxvc1wImcAoyn9Fe1R6lZ8aTuUOef2NzIJ2DsJYY4
         O2raMvegKYipp2FvGEVbQpQGLwi3+ZYCjwZyK5t2KU7jNI9XFQr3mLqxQh/eoIi5eoqh
         Jr1wYbgNB5/I4CMcwypgOLBNJ3gLbimUBuC2DHSHjVAyrWIanvTc7iOtSvTlBKLB2ZDY
         tSmU3tBuZDvkQJ3xDuPUw4ZZKioLf4mgTSiJ3FZ1e+CHSPwv8+mQ8FU5I68BFfZtMSeS
         n6SQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772710712; x=1773315512; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BLs97xVSTH/7xpbwisafb12H8oi0fPFHeoD4nNPX2rk=;
        b=A/cXLQ47296l7mpHNMWXJ4fG6RkWZ+oGcBrHpS9pjjcnqdLyTBmGRQnO0/olRCYSQZ
         B8kWGWZuZcFy2O8X4lY+kgd7ntikRU9OsXC0bnSrSbBhv6rcnpkEVaiwp3s9Zp06WRRh
         Cxk7dstkX7SRPbp74fUMv51ZQN1p09sr3tkwgnCI8U4Vb1DKG7iZA1AKE6Gq/T6WRTJs
         Nitp/hqBrMTYUriYRxNKp7wneKfX5rZU2R10CZTlOfbJ7I6cbqrbO6/Op475VlnSnrls
         2m1aSdB0X5/QSLHJ6N2BnsR5FYpG3mf5IoHsTZlni+sm7MjChXgRfMj0+Il6V9DJuWke
         exGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772710712; x=1773315512;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BLs97xVSTH/7xpbwisafb12H8oi0fPFHeoD4nNPX2rk=;
        b=FHjTdXxplo/aOcLaEAX0jFy818kmoW63wHTGj7kFS+/3W4yNtmz0IpkmgO7DrhRtue
         ykS9/H0G4jso6hvGvNPrsuFdZfMYL9YgoPUS8+2ZMYxC0oS3KGtL7/Za9kYYtxcA2oTj
         wbEazm8W6jkCEPjWJElWI6WPQK2mxLmYX9XqzNXuo6BV7mAWt03oDVVolHw+TlzZarPN
         crbB80Q92i0fZM+vJk6UP9e5kewA1Wy8jtedmqGFEvnUlmcsMoj0aSkRdkDJ3dyUP8hc
         A4kftP9uTwGjWpdR8srl1+7Uhdn3r/V2Z1qt5IlKteZY32kh9CQQrTqsQb1TxpUHV3E2
         PDsA==
X-Forwarded-Encrypted: i=1; AJvYcCXZk1V7szNjt6N8tAvuiCmPBUvHBrObr/Wcc/UhcQuAtkg9oifWl9/8Xf4Trhx++fHY2XclHZVTO+Fqgb4A1Ccz4A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwFj76n1NSHMeEVoxX4ZeuE6doRSe3jci5XuyygOjDPeDojRVpb
	UlwgFtnFeU+eEZ5yGrqi8jMhe+M3NV+6NNFbJODNpqXN25pyhU9yHsBMGOpag8dmKW55WT7cu7c
	DZmZyn8HKFpuO+QqpJ4DfryFBP0PKxfY=
X-Gm-Gg: ATEYQzyrztAtDLJE3Ak5Jhmo/IXlj/M9Hv5zkSjBO6L69KWNUJNXapwh9+o2BhpOHvq
	44AmJIgitP/+uiCx5LvWtotSNsbHPYRUORWFPP1xd5jJvbtP9kgJqQaoGiwwJxig9JuEIYKDuhr
	0FaWQe28cWyotcp4WHBIOmmclfOUICO62JqGZOJ0BWLpKO8Q5C7pgMGDSaL+YmtLgL1XXbH/8+t
	E9rIrsnovn4UJcJfThnjzBM73tOR+ckEot3figl8BIIr6ZcBzmn72ayHSjJxkqqtZAPZeXtSCsN
	NTzuNQp3gk0WhWLvkZsozRvbTNyB5GPZfUQRp2QTcg==
X-Received: by 2002:a05:622a:14d1:b0:507:3d3:6cd4 with SMTP id
 d75a77b69052e-508db28b7ecmr67385381cf.9.1772710712159; Thu, 05 Mar 2026
 03:38:32 -0800 (PST)
MIME-Version: 1.0
References: <20260304103203.1649-1-wangmy@fujitsu.com> <DGU6LGIXFAH7.3NWXCBMVFRKMC@bootlin.com>
 <CANNYZj--kiqDdV+_-qWC1DVegq98nPbkGVTdf5hP8U6yrX6jbA@mail.gmail.com> <TYWPR01MB118615B4D94453B7B4D2F74FEDC7DA@TYWPR01MB11861.jpnprd01.prod.outlook.com>
In-Reply-To: <TYWPR01MB118615B4D94453B7B4D2F74FEDC7DA@TYWPR01MB11861.jpnprd01.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 5 Mar 2026 12:38:20 +0100
X-Gm-Features: AaiRm53QYvcX53qwU7A3JQwjbyH10ff1Vh57h5wMREP-l_kHA-gTBcJA1FH80rY
Message-ID: <CANNYZj_4=BQPapcKTnipZkSPasUzK0Wqumi48QRdO61NpX=Tag@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 01/10] gst-devtools: upgrade 1.26.9 -> 1.28.0
To: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
Cc: "mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 11:38:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232482

On Thu, 5 Mar 2026 at 02:12, Mingyu Wang (Fujitsu) <wangmy@fujitsu.com> wrote:
> gstreamer1.0-vaapi has been removed upstream, and there is no compatible version for 1.28. Additionally, I haven't found any recipes that still depend on it.
> Should I proceed with removing the gstreamer1.0-vaapi recipe?

Yes.

Alex

