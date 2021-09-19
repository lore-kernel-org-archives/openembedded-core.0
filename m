Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web08.1713.1632076621859610618
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Sep 2021 11:37:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZkFtFbup;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id t8so24639017wrq.4
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Sep 2021 11:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=tHvzwE8AoekV4YzljMAjfq/173Y2UgxJ1klKEoxUV90=;
        b=ZkFtFbupLNsMw13nd63S/bEr668ptcAo6vyMT52i9Su8Nfbd3CSbpOgrFCVYtHr2kG
         cw8N/G8O8vpQ1iVeoKtmEpUjMRmTPREkJwo+aL66ipyaZ4+JMp51yFbpJ2y5tMs6HVel
         ZD6H6Mx3AsY+DH5+63DR2rvKAnCroqMVYBYRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=tHvzwE8AoekV4YzljMAjfq/173Y2UgxJ1klKEoxUV90=;
        b=EclSSnsCd5MCMV4JA045oAKKDD0YA+howpzAJk7RbVzoIDd8mLctzPch0+R6wK/fii
         rewmtEWyW/h9mrCaC8Mgl/+en++JL/m40Ar87UyzArWSZYAXakmj4khBbPnIdC8+XMyA
         rqibJOIdMiQv/bPYu4kl79j5QocfAKQ0EH8RcDzrBtJdPncgO5M2Ap+iwEML8hdDRLZf
         URVbk6hsjuxQd5wrnLInmrkxzax/PssbLXYgLLa6Gflge4X1Fh2+dOyWwOIYZuUCVl7y
         e75D55pp/YcG60zAU5uDWewOchxP6BakwsNOXRTucyrobd21OjPTWk767D5fDCL7wBa5
         SdHA==
X-Gm-Message-State: AOAM531/qWPGGNgGh0mjksFt1njIhyYBhVJYkHrlf4Jy1M1C9eRGGXO9
	/fJ04/OPadzQQzDTGrzAW9SbZQ==
X-Google-Smtp-Source: ABdhPJyrrtQFILGhQcJIOf6paY1hxt8V/i4unTecp3cMtO8J3YoRZqR++rYKlL3XeNhwj3PkQAYM5Q==
X-Received: by 2002:a5d:4985:: with SMTP id r5mr24661899wrq.397.1632076620334;
        Sun, 19 Sep 2021 11:37:00 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:f583:326e:a3bb:7da1? ([2001:8b0:aba:5f3c:f583:326e:a3bb:7da1])
        by smtp.gmail.com with ESMTPSA id f8sm5477632wrx.15.2021.09.19.11.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Sep 2021 11:37:00 -0700 (PDT)
Message-ID: <da6e756775ab97030299f02ee5a9060ee18e8a0e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH] package_ipk/deb/rpm: Drop recursive do_build task dependencies
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Sun, 19 Sep 2021 19:36:56 +0100
In-Reply-To: <3a4c07ef7cfa4b918680ad8f560d2c29@axis.com>
References: <16A633F8E639735E.6604@lists.openembedded.org>
	 <38ae386328c67ce4e48930950b8131d7fe2e10f4.camel@linuxfoundation.org>
	 <3a4c07ef7cfa4b918680ad8f560d2c29@axis.com>
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2021-09-19 at 18:06 +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Richard Purdie
> > Sent: den 19 september 2021 13:03
> > To: openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [RFC PATCH] package_ipk/deb/rpm: Drop recursive
> > do_build task dependencies
> > 
> > On Sun, 2021-09-19 at 11:57 +0100, Richard Purdie via lists.openembedded.org
> > wrote:
> > > This is a controversial change which removes the recursive dependencies
> > > from the do_build target of packaging tasks of recipes.
> > > 
> > > Currently this means when you "bitbake <image>" or "bitbake <recipe>",
> > > the packaging tasks run for all packaging backends enabled for all recipes
> > > in the dependency chain. The same therefore then applies to images.
> > > 
> > > We don't actually need that, it is a convinience thing. Removing it
> > > massively simplifies the task graph and causes much fewer tasks to execute
> > > in many common scenarios. It also means less sstate is fetched for
> > > example when building an image.
> > > 
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > ---
> > >  meta/classes/package_deb.bbclass | 2 --
> > >  meta/classes/package_ipk.bbclass | 2 --
> > >  meta/classes/package_rpm.bbclass | 2 --
> > >  3 files changed, 6 deletions(-)
> > > 
> > > diff --git a/meta/classes/package_deb.bbclass
> > > b/meta/classes/package_deb.bbclass
> > > index eca43e17876..8f0eadbcd2e 100644
> > > --- a/meta/classes/package_deb.bbclass
> > > +++ b/meta/classes/package_deb.bbclass
> > > @@ -320,5 +320,3 @@ addtask package_write_deb after do_packagedata
> > > do_package
> > > 
> > >  PACKAGEINDEXDEPS += "dpkg-native:do_populate_sysroot"
> > >  PACKAGEINDEXDEPS += "apt-native:do_populate_sysroot"
> > > -
> > > -do_build[recrdeptask] += "do_package_write_deb"
> > > diff --git a/meta/classes/package_ipk.bbclass
> > > b/meta/classes/package_ipk.bbclass
> > > index c3b53854e8b..756744279e1 100644
> > > --- a/meta/classes/package_ipk.bbclass
> > > +++ b/meta/classes/package_ipk.bbclass
> > > @@ -278,5 +278,3 @@ addtask package_write_ipk after do_packagedata
> > > do_package
> > > 
> > >  PACKAGEINDEXDEPS += "opkg-utils-native:do_populate_sysroot"
> > >  PACKAGEINDEXDEPS += "opkg-native:do_populate_sysroot"
> > > -
> > > -do_build[recrdeptask] += "do_package_write_ipk"
> > > diff --git a/meta/classes/package_rpm.bbclass
> > > b/meta/classes/package_rpm.bbclass
> > > index 88d861c0e75..9f415b234de 100644
> > > --- a/meta/classes/package_rpm.bbclass
> > > +++ b/meta/classes/package_rpm.bbclass
> > > @@ -752,5 +752,3 @@ addtask package_write_rpm after do_packagedata
> > > do_package
> > > 
> > >  PACKAGEINDEXDEPS += "rpm-native:do_populate_sysroot"
> > >  PACKAGEINDEXDEPS += "createrepo-c-native:do_populate_sysroot"
> > > -
> > > -do_build[recrdeptask] += "do_package_write_rpm"
> > 
> > Just to add a bit more context to this, the bigger impact will be on CI
> > setups
> > including our autobuilder since "bitbake XXX" will no longer do quite what
> > it
> > did before. I'm starting to think we should move to the new behaviour and
> > apapt
> > the CI targets as/where needed.
> > 
> > I have a build running on the autobuilder to see what impact this has on the
> > automated tests. I'd welcome other people's thoughts on this.
> > 
> > FWIW we have removed a lot of these recursive dependencies, this one is one
> > of
> > the few left on do_build but it has been left as it has the biggest user
> > visible
> > impact.
> > 
> > Cheers,
> > 
> > Richard
> 
> You write that this is a controversial change with big user visible impact.
> At the same time you write that we do not need the removed dependencies.
> What I don't see in your commit message, nor in the follow up mail, is _what_ 
> the impact actually is. What will I no longer get when I run `bitbake
> <image>`?

For this change, "bitbake <image>" will no longer generate packages you're not
using. So for example if ipk is you main format but you've enabled deb and rpm
as well, only the ipk will be generated after this whilst before, the others
would too. That may be a big deal for some CI systems, hopefully less so in real
world use.

The patch does need a fix highlighted in autobuilder testing so I'll send v2
soon.

Cheers,

Richard

