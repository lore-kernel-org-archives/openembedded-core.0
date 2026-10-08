Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A138BCA600D
	for <webhook@archiver.kernel.org>; Thu,  8 Oct 2026 17:41:45 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10397.1791444492618400755
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Oct 2026 00:28:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=iob0ZS8M;
 spf=pass (domain: baylibre.com, ip: 209.85.128.45, mailfrom: tgamblin@baylibre.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso45145045e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2026 00:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791444491; x=1792049291; darn=lists.openembedded.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yHODM0Dp7eYx6uxpK5D1NyAtGyM3kTQQnwM9QkiimDs=;
        b=iob0ZS8Mpz6oCF31TLxD6CX+tXWHS0+3tBte0FwaTHncL6JDFYD8m/TlhU5stp4qzK
         +yyQOwgbKhPmUeYC9L4W2M4iL7wm28YwzNi1u2jQy3P7RFgxxwOP0IS0zvL9MYeSlP0A
         oxZUoHOgpdvERaV/xePFdO/geGzo3Y+Te0t4bn/fZYleZNhd98BBGEON8b7IHQoHqBLx
         uVL2oTmZhPJZgnrn9F3t3WdV6eK0lxms9EoIIareH0N8au6WLnHmF1OA53L1Ggy4/4fr
         f3EbCtATZusXI8OegLFYDWsR6rmBDA0UIB6fnlfYKIRF0aXqAkdDpRDnbGDkBXPWWCB+
         zTxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791444491; x=1792049291;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yHODM0Dp7eYx6uxpK5D1NyAtGyM3kTQQnwM9QkiimDs=;
        b=DDCmtZU5QUPrAzOcTmPNAJ45i00IP2/q6SFadQmBFPx3T9cffuMiujxCNHyTthSTUG
         J+lwCZ4Hkige0JG4LBjuR5NPhacJUtmPEOBr6EFYjftA/VE6fZBdjjQimAa29MEIxfuW
         mr+umOgZS7DuWofZIlQvPdbyDQKu5U9ibGxA6Z3WrPk9ar6DgFtbbhae79HRAOksIoho
         sZZNE68CeGZP5HuMY7nziY9ImoVnbFjff2/UIpbAvIEEe37GTU8AJ7rlSF3doKdhiGvj
         Yv3lVwGumFTleUpcbV43I10ZUJYCa//4JgDNamG5QXeMXzWk7vXaljdSxbWMfT/5pqvE
         0Dbw==
X-Gm-Message-State: AFuF++naacRN1CvGnl20gQoHOrQTobTuuu4Vln0JkwBWEJTy5qrAxoLk
	B/q5OVQrC1vtxjOgkGoqcoxUn3Oe5tlZiTEmfeLuCqJ6H6ik1eVrKlAb3YcADScB6Uc=
X-Gm-Gg: AYBFou3JgSxABHqY+fPSCNk+BK7gAPt9L8YhKF1u0y+ThvAagbfHRh9ACk41R2KuFd4
	0SM4TV2ShEmrcFTh8H5bT+/Ndnq59F8z1gF9GS1l2WzqRkIbo2R5RS2HF2Ux0gUjp+lYBed9zx5
	pUrYmeICbmaXYeCiH0/1Y6UIhYRX3sPlspHbcdGcYiKRibHQTSHzuzLPgjVHPogNnvUToWEYO4v
	PMC/DA3UgopKyypsbsvhvW081yPc7mY5j32qFATpyFNlA+99XhVmPReZXbQLwMpaf7jL8W5XXal
	fyrrimioz1UM+WoS8Rbddv82Np6mrt7wPgD11g47ofMKobq8OqF7BFGlsfkiIOeKm4tP5T7nO3k
	nk+b+KegJYt8a9dfWI+gFxF66fZvA1zmN25vg4zEtIjjY7whZOVkaxO2YCECiQCRF4TBZVq+DNv
	9IMIxD5QRno/SmAjEi/0IRhTfsEVffIene7hcGV4TY/9eURvRTIP2fj77x1TXFgNtatTYYs01+m
	0Ld4NMqSpEwEjyBL+GJPFhNmbvrNtTebRZABKZGp2512NNN
X-Received: by 2002:a05:600c:548a:b0:49c:fc6c:be19 with SMTP id 5b1f17b1804b1-4a18067192bmr74500285e9.31.1791444489207;
        Thu, 08 Oct 2026 00:28:09 -0700 (PDT)
Received: from localhost (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a181aeaea2sm101825555e9.5.2026.10.08.00.28.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 00:28:08 -0700 (PDT)
Mime-Version: 1.0
Date: Thu, 08 Oct 2026 03:28:06 -0400
Message-Id: <DLZA2JZDE9QG.3FJ21Z6P2GB6V@baylibre.com>
Subject: Re: [OE-core][PATCH 01/13] scripts: resulttool: add 'durations' option
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>,
 <ross.burton@arm.com>, "tgamblin@baylibre.com" <tgamblin@baylibre.com>
From: "Trevor Gamblin" <tgamblin@baylibre.com>
X-Mailer: aerc 0.22.0
References: <20260923190419.353493-1-tgamblin@baylibre.com>
 <20260923190419.353493-2-tgamblin@baylibre.com>
 <BB4DFAF2-1A9A-488F-97A7-43F96272C09B@arm.com>
 <b94f423e6023039363bb84a1ae14583a5d389be9.camel@linuxfoundation.org>
In-Reply-To: <b94f423e6023039363bb84a1ae14583a5d389be9.camel@linuxfoundation.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2026 17:41:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247440

On Sat Oct 3, 2026 at 5:45 AM EDT, Richard Purdie wrote:
> On Thu, 2026-10-01 at 16:34 +0000, Ross Burton via lists.openembedded.org=
 wrote:
>> On 23 Sep 2026, at 20:04, Trevor Gamblin via lists.openembedded.org <tga=
mblin=3Dbaylibre.com@lists.openembedded.org> wrote:
>> > +# Matches the section titles "resulttool report" prints before each
>> > +# Recipe/Passed/Failed/Skipped/Time(s) table (see template/test_repor=
t_full_text.txt)
>> > +REPORT_SECTION_RE =3D re.compile(
>> > +=C2=A0=C2=A0=C2=A0 r'^\S+ (?:PTest Result Summary \(Libc: [^)]+\)|Ltp=
 Test Result Summary|Ltp Posix Result Summary)$')
>> > +REPORT_ROW_RE =3D re.compile(
>> > +=C2=A0=C2=A0=C2=A0 r'^(?P<name>\S.*?)\s*\|\s*\d+\s*\|\s*\d+\s*\|\s*\d=
+\s*\|\s*(?P<duration>\d+(?:\.\d+)?)\s*T?\s*$')
>>=20
>> Is there a use case for when you have resulttool, a textual summary,
>> but not the JSON test data?=C2=A0 I=E2=80=99m wondering if this function=
ality is
>> useful enough to justify having a fragile regex-based parser on a
>> file that we don=E2=80=99t commit to maintaining the format of.
>
> I'd add that the test cases for this are fragile. They hardcode the
> current report output whilst we really want to ensure that the current
> report output would work properly.
>
> I do think having some duration support in resulttool would be nice but
> I suspect we don't need the report parsing piece. Most cases where you
> have the report you would have or can get the json results.

Thanks for the feedback folks. Let's ignore this series for now and I'll lo=
ok at
a more concise submission sometime soon. My original motivation was to trac=
k AB
test durations, which are now handled more automatically by
https://threexc.github.io/yocto-test-durations/, so I think whatever I do a=
dd
for this to resulttool should be more minimal than this series is.

Trevor
>
> Cheers,
>
> Richard



