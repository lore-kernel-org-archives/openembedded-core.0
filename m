Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FB82CAC597
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 05:56:39 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.7252.1758174995647303081
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Sep 2025 22:56:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S7uq3HLt;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: zboszor@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-32e372c413aso606335a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 22:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758174995; x=1758779795; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HX4y2L4R10xbjxEEsHgI1U2EPwDNKhlgPbrECejNvZs=;
        b=S7uq3HLtnCn0Klj+UBVM0KNyKd+OTh/RLlbCT7PFOMQt+ObttKo4Sw8sAUGcaPOidj
         iwtlrnFVtQJsCWQBz0YOTD6l2QYMI4tHyDmDsWjq3qUT4Cr5xehGPCujHYkk0hp7M/nD
         z20EUUECklzbazT9qIZPmmTS86pl0MlIXCZkKQ+1P8UNPivU7ab8mlEgSuhzprIBlO5p
         jPNbXCmbEtquP0XDEaDglGfNe1n9K4J87jg8iyLIOZuJ++YK5HNXc1SZIt2Yz0dfwvsX
         I/kY1nbtKD75+1qlhh78eua/P45/AS9WPonql8gHqE3kPRyqXCScoMsYgbrVPprp2Llh
         P+Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758174995; x=1758779795;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HX4y2L4R10xbjxEEsHgI1U2EPwDNKhlgPbrECejNvZs=;
        b=rjqqPsF8ugC9wHncQffYBUvtW2v1HodBtVCCl77DxneL0rSqPHnbstpz3+VrWTPfVP
         IeJVOiWh/4/5HL3f19sygmiYS60tw6wdLIjCh5dM2yYQSTIYuN7zPEbgjbUXaxQLrete
         Ahar/4ot2sQQy5cFO17kXd9w/WIVZjXAiQNJYSxcFPfzPe9WRalwUYFWQdBY9OO3a/ID
         iQql9Qk6VNdE7c+sHYxDCW4dc6ihccQ8Xk709Cs5nlgME+n/Dk/VpZTo/oxq4Gil6OgC
         eQHdxC0DhJ2nuU6CugWOeyraeJ57oGBrCuC8l1fljCPVSBmp2KdyhQSCTbHuxg5rtt/V
         CuUg==
X-Forwarded-Encrypted: i=1; AJvYcCUJclES6wsdQWN+2LqaliGL0xucW/JevOomqjpToTtBk4y1OdtLW21Uc8fs5C5VdYmDP/l8XlEuUb7Ek+KFx8pXcg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwjtQfla26T8si1/X6i5kiGcPE2h72eikGoQGTTaJQlRhzUD5MS
	ed4LQiBRRXdBVtZpk6gaT7DhKkwoZFy55Hj0Fau+505xlba6kSgSvBI4
X-Gm-Gg: ASbGncvYyMn7LlA2M4xKb/auzltdeFxebo+g08uoqiveE6AIZqz8iJetRn3LjlCrwmD
	b410brTOLbrK5OkEkCoAmWn0rsSPsWh2j26jgivzWgQMARtOsLfG+9SxBNjaD24C5mXWl2+48jJ
	ERjy5V7cGd1R2Ku7WGpAfQEVwuyJZ3BcKMVB8zHE518PYdO7TpZbZ5uloiGpbwfGvwEvlyr2OOb
	IhiZxMVBBmk4xjScZWPTRsKQ2AaAcFT/ybti1lHJJk473nP1f5TWvGV6/Ty8D9atNX1T6L2syqw
	FO1diqIfYDNuzqdp0pDsYAhiXFIgCvSRx/wmAXaFug7/RmsNbXB1CwvBirMF8WIV8eu3nWt/KNf
	XXJsE95fTkksE/Nr+NqjWhR+rSQEOAG/ifPD3AsYQXyb0oSGVdera2Z5pFeYf2U925Ix7Ibx8z9
	s=
X-Google-Smtp-Source: AGHT+IHSm4cS6ZX06dRqQCIxdcWYXzTuDnie/NqX9lVlwv9YsmmA0JAxCNic9xim7xHPjWBuiJu98w==
X-Received: by 2002:a17:90b:5387:b0:32d:e780:e9d5 with SMTP id 98e67ed59e1d1-32ee3f75aa4mr4835985a91.22.1758174994957;
        Wed, 17 Sep 2025 22:56:34 -0700 (PDT)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54ff35aa0esm1230878a12.4.2025.09.17.22.56.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 22:56:34 -0700 (PDT)
Message-ID: <3ef6265a-5600-4e48-85f3-a01c5c13b459@gmail.com>
Date: Thu, 18 Sep 2025 07:56:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 15/16] xkeyboard-config: update 2.44 -> 2.45
To: Khem Raj <raj.khem@gmail.com>
Cc: alex.kanavin@gmail.com, f_l_k@t-online.de,
 openembedded-core@lists.openembedded.org
References: <20250911085123.1551425-1-alex.kanavin@gmail.com>
 <20250911085123.1551425-15-alex.kanavin@gmail.com>
 <P12O2T.G9TC7LOZ6AEG@t-online.de>
 <CAMKF1sokUU3n1uDAXTD8ebxFTsSVmZX-4B9iSB1mFQ+3vp7K=Q@mail.gmail.com>
 <CANNYZj994mKx9TLP+1uYf3YDK1ArbkzAJHtyrERhYX5NFT-=EA@mail.gmail.com>
 <18661636B9C9FA43.26272@lists.openembedded.org>
 <18661644E619375D.26272@lists.openembedded.org>
 <bf58632b-e6b1-48a0-a598-07db4184204a@gmail.com>
 <CAMKF1spkFDgxHRBgO7Mph9NPqerRSd1FeJjpTY2wiTZwwEj6qw@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CAMKF1spkFDgxHRBgO7Mph9NPqerRSd1FeJjpTY2wiTZwwEj6qw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 05:56:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223626

2025. 09. 17. 17:10 keltezéssel, Khem Raj írta:
>
>
> On Wed, Sep 17, 2025 at 6:57 AM Böszörményi Zoltán <zboszor@gmail.com> wrote:
>
>     2025. 09. 17. 15:53 keltezéssel, Zoltan Boszormenyi via lists.openembedded.org
>     <http://lists.openembedded.org> írta:
>     > 2025. 09. 17. 15:52 keltezéssel, Zoltan Boszormenyi via lists.openembedded.org
>     <http://lists.openembedded.org> írta:
>     >> It's not transient. It happens if I try to build xkeyboard-config-native
>     >> after -c cleanall. Wasn't there a way/bbappend to turn absolute symlinks
>     >
>     > Sorry, I meant bbclass.
>
>     I found it. Adding inherit relative_symlinks to the recipe fixes it.
>
>
>
> Thanks for digging. Send a patch please

Sorry, I missed your mail, I went to sleep.
But I can see you have already created the same patch as I have locally.


