Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web12.15.1625676206627519169
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jul 2021 09:43:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LHZQekd+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id j16-20020a05600c1c10b0290204b096b0caso2122274wms.1
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jul 2021 09:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=DM5+U2s4pp3IteD0mwyE7G1ECjCswrWjnzY65rtelx8=;
        b=LHZQekd+fBiZ/j5Sy59As/NLw/zkTNIzJom87h7PajvA2nnWmA2Ad0hTEP9rtPCJ+B
         MuXnMh7lBKKCD6O0xE5w3HfIt1QJ1r8mfWH3Q8winRoJribpA50ANEYimDmvsTAV3VXA
         n338jkOLDVAey22xhuJSZz4DPDKJgNE4O8MJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=DM5+U2s4pp3IteD0mwyE7G1ECjCswrWjnzY65rtelx8=;
        b=AnYDBtNxTO7XqnJ1RQLZBxgfvI7ZBj/WInHx5AfVZbJTpOGLkoqKUDTZ7raSnbd3IU
         0dkMUcu/TXvqqsvSHAXpKdNZbECQLtlon0EWunE7kUA37yC2sX7jitxX8j52m5lAvzq9
         C1y3HaGlqPsLpqhB+4JiD0FY8pROl61y3bwz3KR5U6jwV2UeBuIRaOg4VJZGhNJOTC/+
         yHDn1QcbuHao6GJWdxUtGvtC6emIfkcTxY2jSn5yTcHxYBoG1XpboMeuaunvnd5hPmtg
         kK0mhjPpyPYy7Z5xQvFY15dDup40Y4ZuRUfkUZzS5L1YKEYGtuOd7gKBsyXvTa+SPFMx
         zjhA==
X-Gm-Message-State: AOAM530rusxvHv//4qG7g0JDd/OJaB+Xhgdv3OlVJQ3gVA7XNOB6vm5d
	uqmwAjfu9Li8rOx1fD1IvHG+Tg==
X-Google-Smtp-Source: ABdhPJyc2XFxAI+8E38h9Cw+11qFTQooxp+ONOdhbOcGIAZGM4DmCbe4VEIibTXdl/+1uFUOOecIVw==
X-Received: by 2002:a05:600c:d0:: with SMTP id u16mr27746008wmm.96.1625676204914;
        Wed, 07 Jul 2021 09:43:24 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:8f67:c2fd:32f6:7bc5? ([2001:8b0:aba:5f3c:8f67:c2fd:32f6:7bc5])
        by smtp.gmail.com with ESMTPSA id x19sm2310294wmi.10.2021.07.07.09.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jul 2021 09:43:24 -0700 (PDT)
Message-ID: <f333fc6a29c1764056241c87df46c1ec9d715e96.camel@linuxfoundation.org>
Subject: Re: [OE-core] license.bbclass does not add recommends to dynamic packages
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Mike Crowe <yocto@mac.mcrowe.com>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 07 Jul 2021 17:43:22 +0100
In-Reply-To: <20210707130521.GA4032@mcrowe.com>
References: <20210707115334.GA498@mcrowe.com>
	 <f78a557b2ce4df340b55194f551e599bffbe21ae.camel@linuxfoundation.org>
	 <20210707130521.GA4032@mcrowe.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-07-07 at 14:05 +0100, Mike Crowe wrote:
> On Wednesday 07 July 2021 at 13:25:17 +0100, Richard Purdie wrote:
> > On Wed, 2021-07-07 at 12:53 +0100, Mike Crowe via lists.openembedded.org wrote:
> > > We're using LICENSE_CREATE_PACKAGE to create ${PN}-lic package files and
> > > relying on the automatically generated recommends to cause them to be
> > > installed in the image. This works well for most packages, but fails for
> > > packages where we only install package created using PACKAGES_DYNAMIC.
> > > 
> > > For example, liborc is being installed in our image but that package lacks
> > > a recommends for orc-lic, so the licences that apply to it are not being
> > > installed. This is because license.bbclass:add_package_and_files iterates
> > > only over the packages listed in PACKAGES.
> > > 
> > > Steps to reproduce on current master:
> > > 
> > > $ echo 'LICENSE_CREATE_PACKAGE = "1"' >> conf/local.conf
> > > $ bitbake orc
> > > $ dpkg-deb -I tmp-glibc/deploy/ipk/armv7vet2hf-neon/orc_0.4.32-r0_armv7vet2hf-neon.ipk|grep Recommends
> > >  Recommends: orc-lic
> > > $ dpkg-deb -I tmp-glibc/deploy/ipk/armv7vet2hf-neon/liborc-0.4-0_0.4.32-r0_armv7vet2hf-neon.ipk|grep Recommends
> > > $
> > > 
> > > (I would have expected the last command to produce the same output as the
> > > penultimate one.)
> > > 
> > > Even if I could fathom out how to fix orc and any other recipes so that they
> > > did add the ${PN}-lic dependency, I'd be worried about not noticing that
> > > the problem affected other recipes in the future.
> > > 
> > > Is there a way to teach license.bbclass:add_package_and_files to add the
> > > ${PN}-lic recommends for dynamic packages, or would it be necessary to
> > > teach package.bbclass to do so?
> > 
> > That all sounds rather horrible :/.
> > 
> > Would IMAGE_INSTALL_COMPLEMENTARY += "*-lic" work instead?
> 
> That seems to have worked well.
> 
> I wonder whether this means that it would be better to stop adding the
> recommends automatically and tell users that need this to use
> IMAGE_INSTALL_COMPLEMENTARY instead (either directly, or by teaching
> license_image.bbclass to modify it based on another variable.)

That would seem the better option to me at least...

> Losing the recommends would also meaan I wouldn't need to add
> --no-recommends to the image recipes that don't need the licence files.
> 
> Thanks for the speedy response!

No problem, glad it works/helps!

Cheers,

Richard

