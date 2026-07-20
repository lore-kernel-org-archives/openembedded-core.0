Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83FD4C44529
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 09:51:37 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5612.1784541087253425790
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 02:51:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=QgB3dUNE;
 spf=pass (domain: smile.fr, ip: 209.85.218.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c1691e4ec40so575852666b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 02:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784541085; x=1785145885; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HORfcT8wr30Y1NyPXa0bDMd7YQPHTG/8bvXFOrN+02g=;
        b=QgB3dUNEqBUeTXUzvVEXj/E1aHcsn4zwGay6UrtpwgestBbN04kUK1n2d5Bizamykr
         h1a0/KGkxhIg/lh49vbQTv2Upd3vF36QnoR/flldnYkU3mNpa90hOIcGkRiuZQ2ZhdMH
         50tiubLJuojqIaY2lqQExL3ccs7FWXEJDs/mc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784541085; x=1785145885;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HORfcT8wr30Y1NyPXa0bDMd7YQPHTG/8bvXFOrN+02g=;
        b=NG/VGb/aa/sT6FshDo2C6tUn9HUJ59KR/3Lt2NN7qfQVGW4P5wM/ueA7KMwi765bxw
         P+wBpaQTzflrYAiL6BUIeV9nBozFkkBfio0yToKDnmGd7it9TcHse1j498e0fjZOm1tO
         A9x7RJvi5iVk0guvZHYbmK3UtZbuxGr5MbA+k7NgsWthiMYGbSEOGgDozH15PHIDFsyz
         hO6ZRoV/+doXr8Rc+vQUXmnIE4hL5ba4Mx4w7S5mdExwf6jGPLQJSrhMB78kDJ5HaOyg
         Qqp+X6ms29uKmMiibDnnLWCR+tjN/z70AYPX9I7jnr2rIWXMVUVGFUq51JKVuqQriIDA
         rsJw==
X-Forwarded-Encrypted: i=1; AHgh+Rr1jlOdX+mzlK+v9BsUR5LMAid98YR3MHHnV8XqfCwAYqkWziLBFSYDygiRRz9LOUkAGf9/11ezGdx4hVvkR60eAg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz6zK1ydvlznL3jolLEGRDVuseMl4cO5D8GpE+8k/j166vcUg0W
	MRkbsqO51aWpAC7Q18kHinnXw1y3Ea+NjgjebIo2Yn6mQcE3z38Xazoxz4YPG3ikVYs=
X-Gm-Gg: AfdE7clrpI0MocUh8FL5B/+vwYyeHdNzpON5zYdDZQxcV6imN1auG3s31ol98OCSRks
	VKDGLaKNUhc49CQNa5J2ykS1iGUsRWzt08aEwYvmRb/dc13sUBOxWzeXMLkWfbrtDnzxixMjs+z
	8CS3EyAIIzEIs9BefewxgKRWKJ0cDKIPrjSvpYafLrcnAwHLc6S2vAuBnyxtlmzej85BghNnYeL
	Ko81N15gA/Vp8ClOYtJeVk2El0Teolf3psyJUjoI1v4fSpX37INML5qlbsM+dlUfN1sUZ1cL+3S
	T0xtcYFeo4TPpH8A7jkZFsII0hT3EVrsT5xFZSAP+MHqS0YD8Et8knEhmKnBPnNBXr3HhXkI5Dh
	7pRRcpB+rqeiGMIhAvcfWeaPT/CdLXKtMk7ckwHuGWgCtKQ9sZTfz3Q3wosiEPvVQSXcOtwWS2Z
	7xgGFjYe4sDEyqkNPvBUvMcLEtV8V6IpHuhgMSHQQBiJrir3Ek3NUaYkr5GA1ppvzoy8jj9Xco
X-Received: by 2002:a17:907:c0b:b0:c16:198f:d4cd with SMTP id a640c23a62f3a-c16b47d8171mr586066166b.30.1784541085360;
        Mon, 20 Jul 2026 02:51:25 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c17009adfe7sm437203166b.6.2026.07.20.02.51.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 02:51:25 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Jul 2026 11:51:24 +0200
Message-Id: <DK3B0ON55K6X.1HAUH9KGS3PK0@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH] binutils: fix CVE-2025-69645
From: "Yoann Congal" <yoann.congal@smile.fr>
To: =?utf-8?q?Roland_Kov=C3=A1cs?= <roland.kovacs@est.tech>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260716095854.65840-1-roland.kovacs@est.tech>
 <DK2U92VVUXKE.2HBXKS4ZWACG@smile.fr>
 <f81d8c26b92fdb73043c336630ecc54233da05f5.camel@est.tech>
In-Reply-To: <f81d8c26b92fdb73043c336630ecc54233da05f5.camel@est.tech>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 09:51:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241352

On Mon Jul 20, 2026 at 11:46 AM CEST, Roland Kov=C3=A1cs wrote:
> On Sun, 2026-07-19 at 22:43 +0200, Yoann Congal wrote:
>> Hello,
>>=20
>> On Thu Jul 16, 2026 at 11:58 AM CEST, Roland Kov=C3=A1cs via lists.opene=
mbedded.org wrote:
>> > Binutils objdump contains a denial-of-service vulnerability when proce=
ssing
>> > a crafted binary with malformed DWARF debug information. A logic error=
 in
>> > the handling of DWARF compilation units can result in an invalid offse=
t_size
>> > value being used inside byte_get_little_endian, leading to an abort (S=
IGABRT).
>> > A local attacker can trigger the crash by supplying a malicious input =
file.
>> >=20
>> > Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
>> > ---
>> > =C2=A0.../binutils/binutils-2.42.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
>> > =C2=A0.../binutils/binutils/CVE-2025-69645.patch=C2=A0=C2=A0=C2=A0 | 1=
35 ++++++++++++++++++
>> > =C2=A02 files changed, 136 insertions(+)
>> > =C2=A0create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2=
025-69645.patch
>>=20
>> More than a description of the vulnerability, what we need in the commit
>> message is a justification for the patch: i.e. why this is the patch we
>> should take to fix this CVE? In this case, this is trivial, this is the
>> patch referenced from the NVD page, so I've added it.
> I'll keep this in mind, thanks.
>
>>=20
>> Also, the NVD entry looks wrong: only the 2.44 version is said impacted
>> but the patches to fix apply way more than that.
> NVD data marks any version affected, 2.44 is __mentioned__ in the descrip=
tion but no filter or bound
> is set in the CVE metadata.=20

The NVD CPE is:
"cpe:2.3:a:gnu:binutils:2.44:*:*:*:*:*:*:*"
If I read that correctly, that mean only 2.44 is affected.

>>  Can you reach them and fix the NVD data?
> I can ask upstream who issued the CVE to set 2.46 as unaffected/fixed bas=
ed on their bugtracker, but
> that's about it.
Thanks!
--=20
Yoann Congal
Smile ECS


