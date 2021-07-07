Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web08.89.1625676502676407233
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jul 2021 09:48:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=c1+XS1n+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id k16-20020a05600c1c90b02901f4ed0fcfe7so2116263wms.5
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jul 2021 09:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Ec892lFmOv+w4Lh0MCl6v0kX6mli8sD2HITmk4NIurk=;
        b=c1+XS1n+piBJKZf1z+bGtZ4n67o3kKxhAoYlMFs3XBagvKHuq4gySS3ZMddkPKacEq
         5jWlyii1HY80HASPHs6Gkl10zQ2AQfzoAemeTHKLi3BErkH8rhaoqumcgN9pqLBzAFXf
         NxLmn8aqI9fXwaSFNOP3ixhDHYruKVZVrk4xI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Ec892lFmOv+w4Lh0MCl6v0kX6mli8sD2HITmk4NIurk=;
        b=YTrPNp978ItP2Fgan9hk9HKeIF8IrwV6TbYeWP7mY5NP761XUoBtasBawhWGt6y0Yc
         PdCzYBLIGNs084lQ2fb9gqcC1C1I+gSRQ++UtrmUUZmpIB7O8wkoRzWQ9PpJK7SdTjYW
         kGzTsuo2v3BB24IJzgC6xZp6dK/YsUbdjSzhyRgUdXpK+WmGUquPoHAMzrHtE0LYaC8V
         13UMkX8X8UppxiM5CPSxk0QsW4TYWNR19lD7+GuAp07XPIhMZfPYBz0A08sNuJpAw6hq
         /iRFVr2rm1zsJ55SONitA33HaeqmZdu8IEX77HrL92JHdO+f6R3RBRyKTr7/Ng768YKv
         F5qg==
X-Gm-Message-State: AOAM53382xDOnU4VEG0YA61DTCuKf7XwadSIuvE/In3azzpU+IeV9tUg
	lQmNItpIVmXAXimjNNj/UGXNEA==
X-Google-Smtp-Source: ABdhPJzUsq3h5XoeBM8MtPsGtr4au/LQaeTy91inik2YbeoUpTDAbW2ZglrpoqWSPtAmxH7mkIwGYA==
X-Received: by 2002:a05:600c:3399:: with SMTP id o25mr27481078wmp.3.1625676501381;
        Wed, 07 Jul 2021 09:48:21 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:8f67:c2fd:32f6:7bc5? ([2001:8b0:aba:5f3c:8f67:c2fd:32f6:7bc5])
        by smtp.gmail.com with ESMTPSA id r9sm15196384wmq.25.2021.07.07.09.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jul 2021 09:48:21 -0700 (PDT)
Message-ID: <303e003d518d15ee79997873f0c8dbac439a25a8.camel@linuxfoundation.org>
Subject: Re: [OE-core] license.bbclass does not add recommends to dynamic packages
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Mike Crowe <yocto@mac.mcrowe.com>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 07 Jul 2021 17:48:20 +0100
In-Reply-To: <168F8FE5ADDC556E.30794@lists.openembedded.org>
References: <20210707115334.GA498@mcrowe.com>
	 <f78a557b2ce4df340b55194f551e599bffbe21ae.camel@linuxfoundation.org>
	 <20210707130521.GA4032@mcrowe.com>
	 <168F8FE5ADDC556E.30794@lists.openembedded.org>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-07-07 at 17:43 +0100, Richard Purdie via lists.openembedded.org wrote:
> On Wed, 2021-07-07 at 14:05 +0100, Mike Crowe wrote:
> > On Wednesday 07 July 2021 at 13:25:17 +0100, Richard Purdie wrote:
> > > On Wed, 2021-07-07 at 12:53 +0100, Mike Crowe via lists.openembedded.org wrote:
> > > > We're using LICENSE_CREATE_PACKAGE to create ${PN}-lic package files and
> > > > relying on the automatically generated recommends to cause them to be
> > > > installed in the image. This works well for most packages, but fails for
> > > > packages where we only install package created using PACKAGES_DYNAMIC.
> > > > 
> > > > For example, liborc is being installed in our image but that package lacks
> > > > a recommends for orc-lic, so the licences that apply to it are not being
> > > > installed. This is because license.bbclass:add_package_and_files iterates
> > > > only over the packages listed in PACKAGES.
> > > > 
> > > > Steps to reproduce on current master:
> > > > 
> > > > $ echo 'LICENSE_CREATE_PACKAGE = "1"' >> conf/local.conf
> > > > $ bitbake orc
> > > > $ dpkg-deb -I tmp-glibc/deploy/ipk/armv7vet2hf-neon/orc_0.4.32-r0_armv7vet2hf-neon.ipk|grep Recommends
> > > >  Recommends: orc-lic
> > > > $ dpkg-deb -I tmp-glibc/deploy/ipk/armv7vet2hf-neon/liborc-0.4-0_0.4.32-r0_armv7vet2hf-neon.ipk|grep Recommends
> > > > $
> > > > 
> > > > (I would have expected the last command to produce the same output as the
> > > > penultimate one.)
> > > > 
> > > > Even if I could fathom out how to fix orc and any other recipes so that they
> > > > did add the ${PN}-lic dependency, I'd be worried about not noticing that
> > > > the problem affected other recipes in the future.
> > > > 
> > > > Is there a way to teach license.bbclass:add_package_and_files to add the
> > > > ${PN}-lic recommends for dynamic packages, or would it be necessary to
> > > > teach package.bbclass to do so?
> > > 
> > > That all sounds rather horrible :/.
> > > 
> > > Would IMAGE_INSTALL_COMPLEMENTARY += "*-lic" work instead?
> > 
> > That seems to have worked well.
> > 
> > I wonder whether this means that it would be better to stop adding the
> > recommends automatically and tell users that need this to use
> > IMAGE_INSTALL_COMPLEMENTARY instead (either directly, or by teaching
> > license_image.bbclass to modify it based on another variable.)
> 
> That would seem the better option to me at least...

To be clear, I'd definitely support dropping that existing RRECOMMENDS code,
I think there are better ways to handle this now. I may even write that patch :)

Cheers,

Richard

