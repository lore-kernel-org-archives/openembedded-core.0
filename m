Return-Path: <claus.stovgaard@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2888E75447
	for <webhook@archiver.kernel.org>; Tue,  3 Oct 2023 10:37:58 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.105307.1696329473328021644
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Oct 2023 03:37:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DaoOLRlb;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: claus.stovgaard@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-9b281a2aa94so126693666b.2
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Oct 2023 03:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696329471; x=1696934271; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SD/prS48YK9XyvXxyzQGoDU8R4QOmF8cz0Lo7A3/mgU=;
        b=DaoOLRlbZ54EeQSYxb9oJk5i55XfKwsMY8tHDMPqn/araPqrcEly+pK5ywRkpDQeVl
         2AD7i1MwYmtGnxvJKxFzqRWc2IcM/2qx02ytPw0QC8yFGxAIAeqGQ33LXWimb3ZgXeqC
         K83z8MFA7BUYI2aCKBuSwdUtFesnDOGJbCa+8dfnT81Pg0oRmG8Pug2dwb7h/GPUv8wL
         96vsvmLaBg/Dmc7X07J+kXcm1V7JiDCYmsJ0dcatsI8DBLvLgR5e6jV5mu5mmc5cmpW0
         SlI3Kwx95FW4TABNmLlpWMhWwICOIolBa1BoNh3kw7P4gMgLMBFrcmlJ4mWv7kO6Rodu
         rFlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696329471; x=1696934271;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SD/prS48YK9XyvXxyzQGoDU8R4QOmF8cz0Lo7A3/mgU=;
        b=bE+d7bY200iNkpNMptclTyBL2wb5NvsWd8HSChC/9HETSLTmDcuN6yrJIgiVV7BYCz
         NX7V59B1Xj6tym1FdSmAyRN4TMXHNGNUy4PshdJPuXrRA1ohDcUYh+LPuakj33o/XLJJ
         GRAu95eKu8CHoVkUvH6CP65oOe6kyF2QwHbs+0SKsDfVPoqokrsRD1LxJnPx8KLc147v
         RZa7RGcF9BgfstafrbKOHVpgR3v8w/U3RNIQfERDn9Ww8TaMpXWE/ZIfB1U13BBcG4EQ
         DfQcxqlLGj9ujTD0grXaO16lABx0nRWZWLxLLA2Okjxhhm0SQw6FJZPubGZ+07c7YAI9
         jeaQ==
X-Gm-Message-State: AOJu0Yy1i8JZhUiOleSlF0grmJ0UgyqjSuHJ0Km91gIXwDAKC7f+vCD1
	aO2hONCUGaXe8CIuvBuUTV+NQf2hICELvg==
X-Google-Smtp-Source: AGHT+IEO2b5yFypFFDWHJ8RQsUd6oLNJFaV7FIUnfVVR0PCdmGR7Vq/QuhPBFDFoyJ+PPvYgw31xEQ==
X-Received: by 2002:a17:906:8455:b0:9ae:6a8b:f8aa with SMTP id e21-20020a170906845500b009ae6a8bf8aamr12355129ejy.26.1696329471229;
        Tue, 03 Oct 2023 03:37:51 -0700 (PDT)
Received: from [192.168.1.70] ([87.52.106.165])
        by smtp.gmail.com with ESMTPSA id z15-20020a170906668f00b0099b76c3041csm840414ejo.7.2023.10.03.03.37.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 03:37:50 -0700 (PDT)
Message-ID: <8f9b66a29fd0c1308ae9bc97055f0a1b80418c36.camel@gmail.com>
Subject: Re: [OE-core] [PATCH] cups: fix error in patch for CVE-2023-32360
From: Claus Stovgaard <claus.stovgaard@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 03 Oct 2023 12:37:49 +0200
In-Reply-To: <178A91F0AB0CA0BD.31348@lists.openembedded.org>
References: <178A91F0AB0CA0BD.31348@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Oct 2023 10:37:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188629

Hi folks.

It should have been marked with kirkstone - sory for missing this.

On Tue, 2023-10-03 at 12:24 +0200, Claus Stovgaard via
lists.openembedded.org wrote:
> A spelling error was missed when backporting fix for CVE-2023-32360
>=20
> Signed-off-by: Claus Stovgaard <claus.stovgaard@gmail.com>
> ---
> =C2=A0meta/recipes-extended/cups/cups/CVE-2023-32360.patch | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-extended/cups/cups/CVE-2023-32360.patch
> b/meta/recipes-extended/cups/cups/CVE-2023-32360.patch
> index f1b0f9f918..c3db722f1f 100644
> --- a/meta/recipes-extended/cups/cups/CVE-2023-32360.patch
> +++ b/meta/recipes-extended/cups/cups/CVE-2023-32360.patch
> @@ -27,7 +27,7 @@ index b258849..08f5070 100644
> =C2=A0+=C2=A0 </Limit>
> =C2=A0+
> =C2=A0+=C2=A0 <Limit CUPS-Get-Document>
> -+=C2=A0=C2=A0=C2=A0 AuthType Defaul
> ++=C2=A0=C2=A0=C2=A0 AuthType Default
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Require user @OWNER @SYSTEM
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Order deny,allow
> =C2=A0=C2=A0=C2=A0 </Limit>
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188628):
> https://lists.openembedded.org/g/openembedded-core/message/188628
> Mute This Topic: https://lists.openembedded.org/mt/101731071/4454623
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> claus.stovgaard@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


