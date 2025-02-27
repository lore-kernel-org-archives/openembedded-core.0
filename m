Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E858C1B0FF
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 13:20:59 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.10363.1740662451413551195
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Feb 2025 05:20:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=R2ac8aBB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4397e5d5d99so6052625e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 05:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1740662450; x=1741267250; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DUxt8wPpuGT9dTbilJyhiCWFTrHLeUHp7MswkxK5v3I=;
        b=R2ac8aBBba/BgSI1X+YCBDRFxw8vI+o632H7Eoxt38IK8Fvbra1/WsCaNV4BJvEQEg
         w2oXG9cplrsw4jlwdd9uD8qDp9lIqI6gSKi5rqcKkTECLojgC+xJWdapUe9gzlFJHMZT
         viwHeuDRW/6KxTk8LTnCq+/zgabJdz27LNDZc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740662450; x=1741267250;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DUxt8wPpuGT9dTbilJyhiCWFTrHLeUHp7MswkxK5v3I=;
        b=uWxpsWSsbP8OtsDpsir0QMXHBea/glFi4GI4NLbQx8ClCWc6bzb57Vly+gBiMj/ouu
         epp6tJSpmDUxZxgG81yTQqj2bllriXFDCDjGlav+LsW9Kg5LWDxTsMjjWfNvO6zqxQOb
         8/Pq9eJd99nEkcgxV2mtVtjBOigCJXJmTNPLzLkOmcbRwXqWUQH+RmK2ipcvVGfn6/+f
         LZhF6cxCQEWHocXbI93/z25bV/aRkES3XrlSK6eZVoFTBNCbvWXNCKPEwr2M6MohD3kN
         k+Zhv37HDrZD/TQOYQFsyfU9h9o0l8p0P/uj0prVfe7pAnh3zo/rx/OUZCSH/UIHe3e7
         p8bg==
X-Forwarded-Encrypted: i=1; AJvYcCXAn4o0YNlAalbtwiwr51+jBMDP16L9yFB40ihyGdfmCpQIkX+zcc9SboEZrtz3csBDjXFQ/30h9JD34TjkzNXJvw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz5gfwR+Xo9leEo0IUreH4p91VOiJwBUqeBose+OUCEofAcKhts
	FyArvcafxZ0MZu0DNP6N+6Ki+tdTsYmO80vt2/ijZUQjS6YL7IV/qXY+MCIgv3LmlSgjcHL8t/r
	T
X-Gm-Gg: ASbGnctGAu70bF6PkbbKNT3iLz4ezeGj9S0TIIbcdcGouaMffNFPnqmcYgaf1gUyVz+
	UQcXh8vzW5KHDF/0s/ttW74znrh6gcMyKH5GDIGbcTFYS8iDRKoeggH50/DUHC51xVGjbzU0cuV
	yfjl8RN0dh7rm5uiGCnYN0MnmxauwZRfKoesA5e3HAJC/uT1HiPPXN/wnIRgGncxZzNCRaJKn2k
	Q3tEFKfyW3A3T9OjWvr8+CruMdUirsc5WQGoEqB+6eWvpygsMdQRcYUjlWbKyK+0yuZIWujwH4p
	Gs9tXPtHBZ5Ohb58QgX7PYpk0NomAQsl8KdL14WL/K9+CGzzrLefEThiberoGUNF56GjF9QaU+a
	HqmuiYVd/1qjtoa4=
X-Google-Smtp-Source: AGHT+IEMAefnKd4eaE9JN7Q74F62dGPuw33iO9AwSxr62a9NlL4AzaxmegEYMN/fowRdnfjngWf0eg==
X-Received: by 2002:a5d:64c6:0:b0:390:d6ab:6c49 with SMTP id ffacd0b85a97d-390d6ab6e33mr6097081f8f.35.1740662449778;
        Thu, 27 Feb 2025 05:20:49 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:af40:c449:3dc9:d155? ([2001:8b0:aba:5f3c:af40:c449:3dc9:d155])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47a7473sm2076538f8f.38.2025.02.27.05.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 05:20:49 -0800 (PST)
Message-ID: <ebe533c5e028491a241c4112204cea73ff064393.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] sanity: check variable GO_IMPORT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: gavrosc@yahoo.com, openembedded-core@lists.openembedded.org
Date: Thu, 27 Feb 2025 13:20:48 +0000
In-Reply-To: <31891.1740662116747258381@lists.openembedded.org>
References: <30396.1740564040195102040@lists.openembedded.org>
	 <31891.1740662116747258381@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 13:20:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212002

On Thu, 2025-02-27 at 05:15 -0800, Christos Gavros via lists.openembedded.o=
rg wrote:
> hi Richard
> =C2=A0
> I have added the code as you suggested in go.bbclass and then i created m=
eta-mylayer and try to build there "go-helloworld_0.1.bb". It builds fine.
>=20
> =C2=A0
> When i commented GO_IMPORT in the recipe the error i am getting is:
> =C2=A0
>=20
>=20
>=20
>=20
> ERROR: ExpansionError during parsing /home/cg/CG/Programming/Yocto/poky/m=
eta-mylayer/recipes-go/go-helloworld/go-helloworld.bb=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| ETA:=C2=A0 --:--:--
> bb.data_smart.ExpansionError: Failure expanding variable GO_SRCURI_DESTSU=
FFIX, expression was ${@os.path.join(os.path.basename(d.getVar('S')), 'src'=
, d.getVar('GO_IMPORT')) + '/'} which triggered exception TypeError: join()=
 argument must be str, bytes, or os.PathLike object, not 'NoneType'
> The variable dependency chain for the failure is: GO_SRCURI_DESTSUFFIX ->=
 SRC_URI
> =C2=A0
>=20
>=20
> This is caused from this line in the recipe:=C2=A0SRC_URI =3D "git://go.g=
ooglesource.com/example;branch=3Dmaster;protocol=3Dhttps;destsuffix=3D${GO_=
SRCURI_DESTSUFFIX}"
> =C2=A0
> So it looks that expanding GO_SRCURI_DESTSUFFIX variable is executed befo=
re anonymous python function and the error "GO_IMPORT is not set" will not =
be generated.
> =C2=A0
> If you don't have anything to comment , I will try to dive deeper and see=
 how I can adapt it...
>=20

That is unfortunate. As you say, it is expanding it earlier than the
anonymous python.

One slightly evil idea that comes to mind might be:

GO_IMPORT ??=3D "${@bb.fatal("The recipe needs to set GO_IMPORT for go.bbcl=
ass to work")}"

Not sure if that would work or not! It may still give a traceback
although I'm hoping it doesn't.


Cheers,

Richard



