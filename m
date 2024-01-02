Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D956AC46CD2
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 16:45:28 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.33260.1704213922452839702
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jan 2024 08:45:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AGekVPKG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40d6b4e2945so45135055e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 08:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1704213921; x=1704818721; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lfadq7eH4WbkhQ8lzm16q1bdyqNTEfq/etwx9gXt4ec=;
        b=AGekVPKGEbmK2bABIGRmvS4kLKjRPZonvSPLfvtwk292obSlOKFhVi75cLr8n3jdtp
         j6hErXIUAl3ExsnrIqIviAfkUXDV6+Gm81GV13Oa0RdmbM1sVHjvnWYMC4q6rZeH0f/B
         6E34VBjJUnevlDab1Vobj2VbB8wnMjELa7z24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704213921; x=1704818721;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lfadq7eH4WbkhQ8lzm16q1bdyqNTEfq/etwx9gXt4ec=;
        b=mTfg4g4BvEf8rv5QcwPGiv5/7zqSxXbD0SnkKVB9qwnBqHNKp+AScWle2mI742EF1O
         5VALPkAjg99bySNg7vtHTVtn3kKvP/mNPLu85fABm1mcyuPbKcIPryEcVoXLrrw49vpO
         2kGTqteZKMoiHtyibphV2z6tgo22cqOpMf36uRmD9fxMX04B3gJMBp57Y6tW49cjpxAo
         gjPSblBdpQ1+lgmjYEheLS4pppeGGAp7jbZbcr9ON18dK4Ok5m2NXFDEJwN7l68KUFkm
         6P6d+2hskIOz/NPKl757GUTE1uFQB+ahGcxl4Ek5TJJa8+5LQMt6BckyxVroG/a+fFPj
         xojQ==
X-Gm-Message-State: AOJu0Yyqkjf9lZktbe1382lkOcamxVDweojtvkNw7JeH8mR0chI9lDM9
	wTC1iJxh1H39MPQmcQFdQjhs6J3o27D2ng==
X-Google-Smtp-Source: AGHT+IFFedFyF3eyrC/VExZfQmoyyCZlKRXr9Bc5pBhGyNgmwoBvE0hIC8+NfUfUDYqyycCRIO5AXg==
X-Received: by 2002:a05:600c:3d93:b0:40d:8898:a7c with SMTP id bi19-20020a05600c3d9300b0040d88980a7cmr1161045wmb.96.1704213920866;
        Tue, 02 Jan 2024 08:45:20 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:fbfd:7888:db42:b332? ([2001:8b0:aba:5f3c:fbfd:7888:db42:b332])
        by smtp.gmail.com with ESMTPSA id fa23-20020a05600c519700b0040d88f6bc94sm7555909wmb.34.2024.01.02.08.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 08:45:20 -0800 (PST)
Message-ID: <3355eb0d17a4dc6f4b8ffa63c097da4e8b81b9eb.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] sanity.bbclass: CHeck for additional native
 perl modules.
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Philip Balister <philip@balister.org>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 02 Jan 2024 16:45:19 +0000
In-Reply-To: <5e4c5bc7-937a-4161-a6ac-79969e3842e6@balister.org>
References: <20240102112135.3594972-1-philip@balister.org>
	 <cb8e91d0ac9ad995d5e54529c7aa986d0ef346f8.camel@linuxfoundation.org>
	 <5e4c5bc7-937a-4161-a6ac-79969e3842e6@balister.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 16:45:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193246

On Tue, 2024-01-02 at 11:40 -0500, Philip Balister wrote:
> On 1/2/24 10:34, Richard Purdie wrote:
> > On Tue, 2024-01-02 at 06:21 -0500, Philip Balister wrote:
> > > Since we use the build systems native perl, we need to check that all
> > > perl modules required for a build are installed. For a default Fedora=
 39
> > > install, autoconf-native and libxcrypt both fail to build due to miss=
ing
> > > perl modules. After taking careful notes, this commits adds checks fo=
r
> > > File::Compare, File::Copy, open, and FindBin.
> > >=20
> > > [YOCTO #14691]
> > >=20
> > > Signed-off-by: Philip Balister <philip@balister.org>
> > > ---
> > >   meta/classes-global/sanity.bbclass | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global=
/sanity.bbclass
> > > index 9b824915f2..57353b9478 100644
> > > --- a/meta/classes-global/sanity.bbclass
> > > +++ b/meta/classes-global/sanity.bbclass
> > > @@ -532,7 +532,7 @@ def check_git_version(sanity_data):
> > >   def check_perl_modules(sanity_data):
> > >       import subprocess
> > >       ret =3D ""
> > > -    modules =3D ( "Text::ParseWords", "Thread::Queue", "Data::Dumper=
" )
> > > +    modules =3D ( "Text::ParseWords", "Thread::Queue", "Data::Dumper=
", "File::Compare", "File::Copy", "open", "FindBin" )
> > >       errresult =3D ''
> > >       for m in modules:
> > >           try:
> >=20
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/8418
>=20
> Curious, so the Ubuntu autobuilder doesn't have the perl open module?=20
> Can you build libxcrypt on that builder?
>=20
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14691#c7 shows the=
=20
> build failing until I install the perl-open package.

$ perl -e "use open"
open: needs explicit list of PerlIO layers at -e line 1.
BEGIN failed--compilation aborted at -e line 1.

Cheers,

Richard

