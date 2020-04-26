Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web12.7776.1587888779865312100
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Apr 2020 01:13:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FvO6Bu/3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id d15so15102413wrx.3
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Apr 2020 01:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=n4mYvn2MHimWUpvgMcnZzPx0yBhrQL8CtaBjOf8PXSE=;
        b=FvO6Bu/3ekjwJuvLUSNe/BpQjv23qPGk3AEWXL4nN3IZwlt5Jv6c+rFyBPpd9TyCqy
         dL94V80QMdZA8gnOLeADW/BKyyiVjtFpPUJpyH5g6gYFVUsdRmlQmVntPZzKefuqnf/3
         i5ykeR9i33+mN7Jida0F/ey70QvSzHNXqSEEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=n4mYvn2MHimWUpvgMcnZzPx0yBhrQL8CtaBjOf8PXSE=;
        b=FEjy+SvfUWeD2uNLKKHH17d1DEDdeoGQYiMtjZ9HVkxqEbrPn+6r5dSbfwam7YD6Pe
         P9WdVl7Fi302Tz4t2Z5j/FFLG1ZaO34BsuFLdnsZXa4vKN+UdEt2kD8o/5yd+fQKsHfj
         BpvPn7iiCYPdw8timTMvdqdzopIxFO0CDCLTvWZtAlrlIjTK+/Y2bk30TVi3kYST1hCP
         46/bjTFwyFW6fBSyvU4GdywwYurmr2jC9eiX32pZSimzKEB1ulRkUIOOOWicsL1LPvHZ
         g8cri8VS/44nxTlwb9nUlL/paOQYLgX/cWXeOCJmzQuCt2dpn+Xsqhnx/vNFzyT6uOCC
         lrfw==
X-Gm-Message-State: AGi0PuaGR856KoDQWR/xj6fBdSOyy5ImXBHMB4KEw5DVO8xy8rtHOBl7
	p9yEVXDcfBM7lrsEybV6H97pSQ==
X-Google-Smtp-Source: APiQypIA3WcvXr5cpwOXGXi8w1M6rEZXcEjA9dIXyo1gZ5m6os+OgaMtZ/9GlxWGdzVyhOhQz5IQfA==
X-Received: by 2002:adf:cd8c:: with SMTP id q12mr22373990wrj.419.1587888778188;
        Sun, 26 Apr 2020 01:12:58 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id 91sm16790345wra.37.2020.04.26.01.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2020 01:12:57 -0700 (PDT)
Message-ID: <16cffe54465cee6007792d6ac394987306f17f1f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH RESEND] bitbake.conf: do not let DISTROOVERRIDES fall back to empty string
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, OE Core mailing list
	 <openembedded-core@lists.openembedded.org>
Date: Sun, 26 Apr 2020 09:12:55 +0100
In-Reply-To: <CAJ86T=XGh5y_S_K=nzA30pFY=LixQhFcO3jLcZco0cb5XCdLEw@mail.gmail.com>
References: <20200425151908.1020349-1-masahiroy@kernel.org>
	 <9bccecbd0ff9ba88e9afc12a9b9475775bef03e5.camel@linuxfoundation.org>
	 <CAJ86T=XGh5y_S_K=nzA30pFY=LixQhFcO3jLcZco0cb5XCdLEw@mail.gmail.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-04-25 at 14:37 -0700, Andre McCurdy wrote:
> On Sat, Apr 25, 2020 at 8:38 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Sun, 2020-04-26 at 00:19 +0900, Masahiro Yamada wrote:
> > > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > > index 4b544a22cd..eb3dd0007e 100644
> > > --- a/meta/conf/bitbake.conf
> > > +++ b/meta/conf/bitbake.conf
> > > @@ -739,7 +739,7 @@ DISTRO_NAME ??= "OpenEmbedded"
> > >  OVERRIDES = "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:pn-
> > > ${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}${LI
> > > BCOV
> > > ERRIDE}:forcevariable"
> > >  LIBCOVERRIDE ?= ""
> > >  CLASSOVERRIDE ?= "class-target"
> > > -DISTROOVERRIDES ?= "${@d.getVar('DISTRO') or ''}"
> > > +DISTROOVERRIDES ?= "${DISTRO}"
> > >  MACHINEOVERRIDES ?= "${MACHINE}"
> > 
> > Whilst this can't happen with our standard definitions now, the
> > side
> > effects of it not being set are nasty so I'd prefer to retain this.
> 
> What exactly can go wrong? MACHINEOVERRIDES is empty every time we
> build a -native recipe, so just having :: in OVERRIDES or
> FILESOVERRIDES doesn't appear to be an issue. Is there something
> special about DISTROOVERRIDES ?

native.bbclass sets MACHINEOVERRIDES = "" whereas with this change
DISTROOVERRIDES would be set to "${DISTRO}" instead of "" as it
currently is today. I think unexpanded variables were sub-optimal in
FILESOVERRIDES but I don't remember the details of why. 

Cheers,

Richard


