Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FEA1C7115B
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 08:37:36 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.3189.1750408646557172541
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jun 2025 01:37:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YUOwWPdc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-450cb2ddd46so9133025e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 01:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750408645; x=1751013445; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bKG7MY9/M/xG7V0+qiGewDUmeMpYT1KA7RWxdBS9VOE=;
        b=YUOwWPdcOMtju1nWhAsbHFRjhuInE4rmU66Dd8M1BEGoMfW2EikX2gnQm6r8X2/ye3
         wcOVitw03rdnpDsDwlw0VTNiu5SOzv2HWWaRV1SrvFurd6wL7XopRKRhcNHYyr2NXE1G
         Xl135l50jQQRNQCXksbnwRP1LdMjT6w5oEq5M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750408645; x=1751013445;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bKG7MY9/M/xG7V0+qiGewDUmeMpYT1KA7RWxdBS9VOE=;
        b=KBVAz8AE/vD07hkJSFGypDY+j1BgZzDnf4hCaAaW0Gc1oRUrcBleiZfBxzz4CbIYOZ
         aNQN+uqo/hgcTpZgjx1u18jtV7Qnmy4gujALhFIR1+hGNLR9cRGiCmj9dNgV6D1592Wz
         V6baLCh8I3JKkESN0p5cfg4wESwSCLKzM8Ix5+l+b0p6PrUhcso8e+PkrMh+8S666aer
         uT5gS57Mx5vq7OSxp5lNFWm4Lsit6FnlRYo4M+6fxezMi32Y/EstD6FmF2Y7Q61YR5xL
         3qARXnNtLtUlluBWAIiJR4iNEDvHqsQroaRAJen2mRMi6SJO6Marqsu/GtPqNg89/777
         lecA==
X-Forwarded-Encrypted: i=1; AJvYcCXwj69iVze/cwPLObn8NIKLdozEb+m67p1DUn49Xga4c+IqvWpB+rmZjCradwB2PcYOJzPxbmbU6t3we7tvksyOKg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxj0HZLBZTjUurH4fxRrebiATUwcm7T+oAoTNL/NrljXyG9KuEr
	uQMvEiMeOAf5cl/oWLh4u05KkU+o9NwsnKvD1fOWrs3aiMeBOurDcxV/txGMBnaXd4toAKzqEFk
	WIEMMJkk=
X-Gm-Gg: ASbGncuiKjFEeOhm9muFa8RDMsaMhPunjzNiKhe2yecALELiKCcP6kxRrOBDjeRm5A8
	7bjk1WkpMItLyd06fmvvmK/R8Q/babosQeRz/mY7UYD34GqvNSnVG+I4qJNoNbP2ZMQqW6wZKPE
	tqnOywe1C1i8Dqzb+ImWwxoZrgh3BkT47Oc/CRr6XRkYkgSDFf0343HAq3GAs+BcUxn434cURbT
	XTod7+2vDwlvoYzyXgCYC3did62dTPAy8Aih5OX5JibEi3zDErgalB5Smo8K7DQ1iAXgeXiYoWx
	L/R1qz69874OWznAx+BQ7olEDqnK2ehJ+M3JHpEOm8cHQPQDZ1P+Ir0r6DLn6Bwygrzd1U8KKTj
	imdyRN6QkKjRwzWy4cXTJ46xpekANlWPA1LTO5ohU/E0e/AihavPfBnGCmJ+l/A==
X-Google-Smtp-Source: AGHT+IFWb4vyHVQoIQq9+WWjVYqYi1DniGPusFvS9Ywc1/upKQvcib3pX0TdTICxeHk7sqMDFGhaJw==
X-Received: by 2002:a05:600c:5025:b0:450:d386:1afb with SMTP id 5b1f17b1804b1-453659c5915mr18804605e9.9.1750408644765;
        Fri, 20 Jun 2025 01:37:24 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b606:370e:6752:7b3d? ([2001:8b0:aba:5f3c:b606:370e:6752:7b3d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ead202asm51354885e9.27.2025.06.20.01.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 01:37:23 -0700 (PDT)
Message-ID: <2d995673dc400fc83232f0b711e34809b3908645.camel@linuxfoundation.org>
Subject: Re: [OE-core] Gcc-15 test results summary
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Harish.Sadineni@windriver.com, Patches and discussions about the
 oe-core layer <openembedded-core@lists.openembedded.org>
Cc: "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>, "MacLeod, Randy"
	 <Randy.MacLeod@windriver.com>
Date: Fri, 20 Jun 2025 09:37:23 +0100
In-Reply-To: <PH0PR11MB56580BF59A4AB6491B2982F1EF77A@PH0PR11MB5658.namprd11.prod.outlook.com>
References: 
	<PH0PR11MB56580BF59A4AB6491B2982F1EF77A@PH0PR11MB5658.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 08:37:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219117

On Fri, 2025-06-13 at 08:05 +0000, Sadineni, Harish via lists.openembedded.=
org wrote:
>=20
> Gcc 15 test results diff between yocto and upstream gcc


Thanks for sharing these Harish. I am really happy to see the delta
between our testing and upstream reducing to this level and the work is
much appreciated!

For those interested, this is an example autobuilder report:

https://valkyrie.yocto.io/pub/non-release/20250620-
8/testresults/testresult-report.txt

which for toolchain, can be filtered as:

For qemuarm64:

Recipe                       | Passed       | Failed   | Skipped    | Time(=
s)  =20
---------------------------------------------------------------------------=
---
binutils                     | 256          | 1        | 13         | 1105
binutils-gas                 | 992          | 2        | 5          | 39
binutils-ld                  | 1148         | 6        | 166        | 51
gcc-g++-user                 | 425618       | 0        | 3240       | 2893
gcc-libatomic-user           | 54           | 0        | 0          | 600
gcc-libgomp-user             | 5714         | 0        | 489        | 813
gcc-libitm-user              | 46           | 0        | 2          | 703
gcc-libstdc++-v3-user        | 18306        | 1        | 798        | 1770
gcc-user                     | 371167       | 39       | 6169       | 2161
glibc-user                   | 5535         | 239      | 78         | 4954

For qemux86-64:

Recipe                       | Passed       | Failed   | Skipped    | Time(=
s)  =20
---------------------------------------------------------------------------=
---
binutils                     | 304          | 1        | 10         | 1633
binutils-gas                 | 1917         | 4        | 1          | 135
binutils-ld                  | 1741         | 6        | 111        | 322
gcc                          | 204376       | 15       | 3168       | 2663
gcc-g++                      | 241371       | 18       | 1649       | 1084
gcc-libatomic                | 54           | 0        | 0          | 157
gcc-libgomp                  | 5747         | 7        | 475        | 2080
gcc-libitm                   | 27           | 19       | 2          | 153
gcc-libstdc++-v3             | 18303        | 34       | 781        | 1473
glibc                        | 6011         | 74       | 164        | 7239

for qemuriscv64:

Recipe                       | Passed       | Failed   | Skipped    | Time(=
s)  =20
---------------------------------------------------------------------------=
---
binutils                     | 248          | 1        | 13         | 1413
binutils-gas                 | 605          | 1        | 9          | 28
binutils-ld                  | 902          | 6        | 164        | 39
gcc-g++-user                 | 237225       | 6        | 2242       | 1281
gcc-libatomic-user           | 54           | 0        | 0          | 858
gcc-libgomp-user             | 5686         | 0        | 495        | 1183
gcc-libstdc++-v3-user        | 18069        | 1        | 820        | 1474
gcc-user                     | 251207       | 216      | 19679      | 1282
glibc-user                   | 5354         | 249      | 55         | 6138

Which compared to the thousands of failures we used to see is much improved=
!

We may be at the point where we want to filter out the known failures.
There are also clearly still some test name processing issues, such as:

"ptestresult.binutils-ld.can't read "enable_libctf": no such variable"

Cheers,

Richard



