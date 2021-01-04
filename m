Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web09.338.1609795044067859997
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jan 2021 13:17:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PCMdeLDr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id v14so527512wml.1
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Jan 2021 13:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=x6w4VLHfbQenMx5jLW22rMHjcBu3Bl6bicdHyu3DYTA=;
        b=PCMdeLDr6Yx0yjPqK8zxzu2VakaraPYXXPQSvUl20mat268je2QUFKFIA56rInX1sU
         uwBgI7ATz+fsWWbDo74n5UHIQ+QrvgReStfpxnTMwfL6lh6PQiJV1isnliGbJ/Qoupfw
         Ax903GbJZtkAaPa/F/OyQ5d6mcjit1Rf5n050=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=x6w4VLHfbQenMx5jLW22rMHjcBu3Bl6bicdHyu3DYTA=;
        b=fVM1dupas84txt1kayBJeu4Oodqb4W5jUWAQBLALGH1uhyz2pYEYLQMA/RtNaSRFRl
         +IXK1TXFItPztrljdhbbH7qMwj8ynsOmyGJurh22I1DgQ34GrcmWviFtf96nHZvoq2Jq
         3sEb/H0CTN9s6u4B8+FcDf0VHFMPtzH8tVrK30LGClje3szxk3At6ZQIqK7He5c/oRTM
         SX/YQPt+h1+631Ull/K02ABofjt7T+AazIMs4G4qnpWdYR/Zux2mePjbexhHTQxlS1c/
         d4l1+1m9KzueQbW/bdE0iF93yhSNJhwklvCX3kZJpPWwEVkeptVxhKK9xo6Eex11H5Al
         9+Kg==
X-Gm-Message-State: AOAM530iUkbNdYU+CbMWInXYxYhzj0HBv5O8T7RlW5PXJtiNUtd02BQt
	V35AFDkvRO9E5DyRwQf9FmcWVw==
X-Google-Smtp-Source: ABdhPJyLMQelSY65aQGY50tCofuFeDDt/MJ6UM9takKsyyzbGpQmwFiJfC6Mf0pzBbGOj33rIDvhGQ==
X-Received: by 2002:a7b:c385:: with SMTP id s5mr646425wmj.170.1609795042406;
        Mon, 04 Jan 2021 13:17:22 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:4767:d28d:f91a:aa32? ([2001:8b0:aba:5f3c:4767:d28d:f91a:aa32])
        by smtp.gmail.com with ESMTPSA id c20sm942734wmb.38.2021.01.04.13.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 13:17:21 -0800 (PST)
Message-ID: <e51444968f2ea90d3fa1aa53bad47c5668234b1a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [V2][oe][master][PATCH] packagegroup-cross-canadian: repackage when multilibs gcc gdb binutils changes
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Randy MacLeod <randy.macleod@windriver.com>, Chen Qi
 <Qi.Chen@windriver.com>,  openembedded-core@lists.openembedded.org
Date: Mon, 04 Jan 2021 21:17:16 +0000
In-Reply-To: <093bfa8a-ea5d-8cd2-997f-869b3674d4ca@windriver.com>
References: <20201208015819.154331-1-jiping.ma2@windriver.com>
	 <b75e80f1-6253-ed4e-c91d-5a57d342dadf@windriver.com>
	 <093bfa8a-ea5d-8cd2-997f-869b3674d4ca@windriver.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-01-04 at 16:00 -0500, Randy MacLeod wrote:
> On 2020-12-24 2:03 a.m., Chen Qi wrote:
> > ping
> 
> Ping v2.
> 
> Is there a problem with this solution or
> do you think we shouldn't handle the use case for some reason?
> 
> ../Randy
> > 
> > On 12/08/2020 09:58 AM, Jiping Ma wrote:
> > > 1. Build SDK without "MULTILIBS = """ in local.conf.
> > > 2. Build SDK again with "MULTILIBS = """ in local.conf, build
> > > will fail with the error info.
> > > Error:
> > >   Problem: conflicting requests
> > >    - nothing provides binutils-cross-canadian-arm needed by
> > > packagegroup-cross-canadian-nxp-ls1028-1.0-r0.x86_64_nativesdk
> > >    - ......
> > > diff --git a/meta/recipes-core/packagegroups/packagegroup-cross-
> > > canadian.bb b/meta/recipes-core/packagegroups/packagegroup-cross-
> > > canadian.bb
> > > index 3b430c0814..b6b3e5235f 100644
> > > --- a/meta/recipes-core/packagegroups/packagegroup-cross-
> > > canadian.bb
> > > +++ b/meta/recipes-core/packagegroups/packagegroup-cross-
> > > canadian.bb
> > > @@ -17,8 +17,13 @@ RDEPENDS_${PN} = "\
> > >       meta-environment-${MACHINE} \
> > >       "
> > >   
> > > -# When TUNE_ARCH changes but MACHINE does not (for example when
> > > a machine definition is updated),
> > > -# cross-canadian.bbclass prevents variable dependency
> > > propagation to TRANSLATED_TARGET_ARCH
> > > -# This will result in erroneous reuse of previous sstate
> > > packages. The following line
> > > -# establishes a direct dependency instead.
> > > -do_package[vardeps] += "TUNE_ARCH"
> > > +# When TUNE_ARCH, GCC, GDB, BINUTILS changes but MACHINE does
> > > not (for example when a machine
> > > +# definition is updated), cross-canadian.bbclass prevents
> > > variable dependency propagation to
> > > +# TRANSLATED_TARGET_ARCH This will result in erroneous reuse of
> > > previous sstate packages. The
> > > +# following line establishes a direct dependency instead.
> > > +do_package[vardeps] += "\
> > > +    ${@all_multilib_tune_values(d, 'BINUTILS')} \
> > > +    ${@all_multilib_tune_values(d, 'GDB')} \
> > > +    ${@all_multilib_tune_values(d, 'GCC')} \
> > > +    TUNE_ARCH \
> > > +    "

I keep putting off reviewing this as its wrong in several different
ways and its hard to explain. In particular:

a) vardeps takes names of variables yet all_multilib_tune_values()
returns values, not variable names. This alone makes it incorrect.

b) BINUTILS, GCC and GDB are artificial constructs which change with
TRANSLATED_TARGET_ARCH only so listing three values here is 
suboptimal, we just need to worry about TRANSLATED_TARGET_ARCH.

So really you want a way to say "depend on all the multilib versions of
TUNE_ARCH" but there is no way to express such a thing as a list of
variables.

You could put ${@all_multilib_tune_values(d, 'TRANSLATED_TARGET_ARCH')}
replacing TUNE_ARCH and it would probably work just as well as the
above but is also technically incorrect due to a).

I don't know how to fix this properly, except perhaps constructing an
artifical variable which does contain the expanded values of
TRANSLATED_TARGET_ARCH as vardepvalues?

Cheers,

Richard

