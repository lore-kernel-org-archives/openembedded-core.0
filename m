Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACA88C47074
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 22:47:40 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.851.1704235657507924431
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jan 2024 14:47:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GK99Z2UW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40d76923ec4so37648825e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 14:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1704235656; x=1704840456; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tu6CbHxPFUQzn4u51zJ4VkiBF4NBrnGwnUdY86uCWXM=;
        b=GK99Z2UWQ+0L1zLjNcaZJYU9ZsdXKb3d3Q2/myYCHUzA5qSICuOPg/dljmpjE5HtPc
         JKf1KtnTMwpnesgHANjlXEJXK1DVAFNFzap/ldN/1eQXn4eM8qlScGjMpb1LKqxdMQ+D
         yORrWw3kCtOfVFGZVu1jysNKbZBPtg6x3+JHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704235656; x=1704840456;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tu6CbHxPFUQzn4u51zJ4VkiBF4NBrnGwnUdY86uCWXM=;
        b=nwW84jTs42HYkjAp7rznoYlSgTN9rOk+U4xQnfOrtGdd6NMRiKIa5v6QzrWgyRnuLK
         behSYo896oqsJf1r9940gBxlxptZd8NA4eLSBg7yILdRyFH+DneYgwy9C4FPx4H5CkQH
         0IM3FPI74j5FpqwtRDdX65ytZCbmZYIl7rdCW9IIFbRuxeEq9gLyZI5agPLk3pEWeO8R
         mHXy/nX55Ai9Lwo5v5yl1IBH0Ll7mOToGDKUjePW4olagwffp/SWu3/jxQKx6KMBSSKr
         z+FPntD0rmKIJJiCjpMDQoVZGmieaFbRqfrxfbhfQenjJvXCuVt3rXFaXDdbkVfUig1E
         VQGA==
X-Gm-Message-State: AOJu0Yw5EwAO0xBBOh3tpW3cAL2uSoeZe0qgiTOMVG0x8q9RjpNRnThc
	yC9/o44/V4HPH+CfdgzGwzv/ZJdyGtlAwA==
X-Google-Smtp-Source: AGHT+IEdGPTM2a2gsKJuobpom99Ayxr0BGKiMs/JYxeiFKCVL9fPbw/iVbTbnGfgzhGGNgGr3jcUHQ==
X-Received: by 2002:a05:600c:c17:b0:40d:8cb7:7954 with SMTP id fm23-20020a05600c0c1700b0040d8cb77954mr753382wmb.89.1704235655894;
        Tue, 02 Jan 2024 14:47:35 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:8ee8:87cd:f714:75d2? ([2001:8b0:aba:5f3c:8ee8:87cd:f714:75d2])
        by smtp.gmail.com with ESMTPSA id m1-20020a05600c4f4100b0040d5b849f38sm399469wmq.0.2024.01.02.14.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 14:47:35 -0800 (PST)
Message-ID: <b5a6aa8721be8f493162546cd742615e0fd0145c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] sanity.bbclass: CHeck for additional native
 perl modules.
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Philip Balister <philip@balister.org>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 02 Jan 2024 22:47:33 +0000
In-Reply-To: <f0af4f52-8d7b-41aa-ae30-b082f1a348cb@balister.org>
References: <20240102112135.3594972-1-philip@balister.org>
	 <cb8e91d0ac9ad995d5e54529c7aa986d0ef346f8.camel@linuxfoundation.org>
	 <5e4c5bc7-937a-4161-a6ac-79969e3842e6@balister.org>
	 <3355eb0d17a4dc6f4b8ffa63c097da4e8b81b9eb.camel@linuxfoundation.org>
	 <f0af4f52-8d7b-41aa-ae30-b082f1a348cb@balister.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 22:47:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193260

On Tue, 2024-01-02 at 16:14 -0500, Philip Balister wrote:
> On 1/2/24 11:45, Richard Purdie wrote:
> > On Tue, 2024-01-02 at 11:40 -0500, Philip Balister wrote:
> > > On 1/2/24 10:34, Richard Purdie wrote:
> > > > On Tue, 2024-01-02 at 06:21 -0500, Philip Balister wrote:
> > > > > Since we use the build systems native perl, we need to check that=
 all
> > > > > perl modules required for a build are installed. For a default Fe=
dora 39
> > > > > install, autoconf-native and libxcrypt both fail to build due to =
missing
> > > > > perl modules. After taking careful notes, this commits adds check=
s for
> > > > > File::Compare, File::Copy, open, and FindBin.
> > > > >=20
> > > > > [YOCTO #14691]
> > > > >=20
> > > > > Signed-off-by: Philip Balister <philip@balister.org>
> > > > > ---
> > > > >    meta/classes-global/sanity.bbclass | 2 +-
> > > > >    1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >=20
> > > > > diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-gl=
obal/sanity.bbclass
> > > > > index 9b824915f2..57353b9478 100644
> > > > > --- a/meta/classes-global/sanity.bbclass
> > > > > +++ b/meta/classes-global/sanity.bbclass
> > > > > @@ -532,7 +532,7 @@ def check_git_version(sanity_data):
> > > > >    def check_perl_modules(sanity_data):
> > > > >        import subprocess
> > > > >        ret =3D ""
> > > > > -    modules =3D ( "Text::ParseWords", "Thread::Queue", "Data::Du=
mper" )
> > > > > +    modules =3D ( "Text::ParseWords", "Thread::Queue", "Data::Du=
mper", "File::Compare", "File::Copy", "open", "FindBin" )
> > > > >        errresult =3D ''
> > > > >        for m in modules:
> > > > >            try:
> > > >=20
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/8=
418
> > >=20
> > > Curious, so the Ubuntu autobuilder doesn't have the perl open module?
> > > Can you build libxcrypt on that builder?
> > >=20
> > > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14691#c7 shows th=
e
> > > build failing until I install the perl-open package.
> >=20
> > $ perl -e "use open"
> > open: needs explicit list of PerlIO layers at -e line 1.
> > BEGIN failed--compilation aborted at -e line 1.
>=20
> Why isn't anything easy!
>=20
> $ perl -e "use open ':std'"
>=20
> does complete on Fedora 39. What is confusing me is why the check seems=
=20
> to go through on my Fedora 39 , but and not the AB machine. I suppose it=
=20
> is time to add typos to confirm the code attempts to execute.

The system caches the host checks. I suspect for testing you need a
clean tmpdir or "rm cache/sanity_info".

> I am guessing I could tell bitbake the module is "open ':std'".

I suspect that would work.

Cheers,

Richard

