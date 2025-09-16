Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8DECCAC598
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 13:41:25 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.20387.1758030079654729814
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Sep 2025 06:41:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=mINiWol+;
 spf=pass (domain: linaro.org, ip: 209.85.208.169, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-337e714b3b4so45110931fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 06:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758030078; x=1758634878; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CcOvJHUH1R6+nEWAuHbEVcGwiFOcgXKeOXKaD1YHPc8=;
        b=mINiWol+AS4jUMSh3qrrRLbKQu+8usbZUu99YVwiZOTUaGA3mFL2vixlesA78hRJms
         6k6hM3dFnsq+Bf2Hbk5AFXpvRCVIpAIHxGflnZnhBgV9f7uSAtT9HgnmfwZsh1iv0j1a
         Vi4u13jbjjsBOKBGdy7oxFMUL1ysKca2acS3HebZNAPBild6Ka6UH2Hkn6YYVnU+2tuU
         +wjSIF7scTWiNlpw31b3xXYCQg4kM4krYjiFNXccxst2RNTtoJys6YPS2L6/pphsSBP5
         ocO8B8cp69q2DwG+MubekSlA4oQUbX9z20S6uL84gd2LJoUqJCGKCbXLTlM3We0e66T7
         UzKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758030078; x=1758634878;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CcOvJHUH1R6+nEWAuHbEVcGwiFOcgXKeOXKaD1YHPc8=;
        b=AzydDZvdxz6UDvFS3O0Ds6P64h0BdvNXeg5l+aJWaxAqAUPrr0HoD7xQ4Sb8wHmfnu
         3QtM3hiVXb8xX+A5MmnkZflxuJx4sMxihuhoBhWYdNjvxWSCh9Cv72NDYScMlQQYWG9i
         yLOuQgaa0Kn2109Ylj6MpAYZqu6PNiuyMZmAUTGlBA568YdWx19MEz/iupwXA7kPgxD6
         V+cr78apsnldHMWd4oz6LSi02D99+N/DHff3OoRu/Jur2AMy+n2K0O7S9dGJSHU+ve3H
         RGpvI/LFOQFBjywG3Paq8qQfqB0+hDAfObvrQaUzaDWY+CqkIJ6olxf8X79rsFjIYzfc
         +yrg==
X-Forwarded-Encrypted: i=1; AJvYcCXP34FLDjsvkAzZHOD+qYWDj0m0jqO6qFh/fw7Z0oFI88Nqwx9HzsCm+vfemkJRot9/rMgBq5js5FGTOF7p12g0+w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YztlFfWT4Y1AsAOAiuyBnylfLM9DpVoGQTVVS8uBeqSKK5ZeKsE
	Syj6r7uYx3gF7r+0N83XN2y5r1dyLqgp1Bh93YdyvFhLbXwBPK8ykixE60ZXG0unaao=
X-Gm-Gg: ASbGncvrNVlAvBjVFQ6QpBb/AcXh8Y6iXWXjns2rlpetqXQqMyQDq+bzTA1j5T6bsQh
	9uIkXg6q3MtaNF6eCeWfqsoWfAwSGAsRHFlOxMJG802wVjPwJIPc31vxe2TuhBkwIVd9SNi5dNG
	iTg69E5V7/34l6V5m+IJJ02yR1tm+dqrJajrNpyyP/jw4VcR53yYWGAWJdxknPx+S36+TXfPEoR
	Q1JPHlgq48aMO4BXn98kB8s9GrM1t02A6JUM0a5K+EwYRra2d4/tzjSMds1PZvYmKcG2a6emsDI
	fjmstot1f8z2K5kF/mPHG/MLDP4IiArPmbsACx5YwzOnuncnZ9vVe0obkGpFJXvHFNtP3rM6UDU
	qek+cl+u8ng28xeIjOMk+R43YTzKmgNkBnfL3E7kmvhsyFjRU1VTORzw=
X-Google-Smtp-Source: AGHT+IE4CKL2h09PXwEw4EZpUFbbXxqi7l3wc62kwsMexe/QApye46NCkNi6RNP3819FUGgdFCXD+w==
X-Received: by 2002:a2e:b8c9:0:b0:336:bfb9:2d06 with SMTP id 38308e7fff4ca-3513e9d6030mr43331041fa.30.1758030077109;
        Tue, 16 Sep 2025 06:41:17 -0700 (PDT)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-35321b3a125sm27623081fa.42.2025.09.16.06.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 06:41:16 -0700 (PDT)
Date: Tue, 16 Sep 2025 16:41:14 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: barne.carstensen@danfoss.com, openembedded-core@lists.openembedded.org,
	randy.macleod@windriver.com
Subject: Re: [OE-core] [PATCH] Fixes [YOCTO #15965]
Message-ID: <aMlo-hknGOEJqrGP@nuoska>
References: <20250916122517.1965-1-barne.carstensen@danfoss.com>
 <1865C555FCF7D165.11775@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1865C555FCF7D165.11775@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 13:41:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223552

Hi,

On Tue, Sep 16, 2025 at 04:09:58PM +0300, Mikko Rapeli via lists.openembedded.org wrote:
> This is not for master branch and subject line should be
> something like "[branch name][PATCH] testexport.bbclass: always capture ignore files"
> 
> On Tue, Sep 16, 2025 at 12:25:22PM +0000, Barne Carstensen via lists.openembedded.org wrote:
> > Copy all the parselogs-ignores file so that they are always packed into the testexport.tar.gz (even when testsuite parselog is not selected)
> > 
> > Signed-off-by: Barne Carstensen <barne.carstensen@danfoss.com>
> > CC: randy.macleod@windriver.com
> > ---
> >  meta/classes-recipe/testexport.bbclass | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/meta/classes-recipe/testexport.bbclass b/meta/classes-recipe/testexport.bbclass
> > index 843d777e3b..2f473a8811 100644
> > --- a/meta/classes-recipe/testexport.bbclass
> > +++ b/meta/classes-recipe/testexport.bbclass
> > @@ -79,6 +79,7 @@ def testexport_main(d):
> >  def copy_needed_files(d, tc):
> >      import shutil
> >      import oe.path
> > +    import glob
> >  
> >      from oeqa.utils.package_manager import _get_json_file
> >      from oeqa.core.utils.test import getSuiteCasesFiles
> > @@ -120,6 +121,11 @@ def copy_needed_files(d, tc):
> >                      oe.path.copytree(src, dst)
> >                  else:
> >                      shutil.copy2(src, dst)
> > +    
> > +    # Copy all parselogs-ignores files
> > +    parselogs_ignores = glob.glob(os.path.join(corebase_path, 'meta', 'lib', 'oeqa', 'runtime', 'cases', 'parselogs-ignores-*.txt'))
> > +    for f in parselogs_ignores:
> > +         shutil.copy2(f, cases_path)
> 
> Master branch is quite different. There the tests and their data
> files are now copied from all enabled layers, not just core.
> So I would rather port those fixes to relevant branches to avoid
> duplicating maitenance.

Since the commits are bit scattered, these from master branch
would be needed if not already in the relevant branch:

e5e8f2aa0a63d testexport.bbclass oe-test: capture all tests and data from all layers
05e97d5e6e24b oeqa context.py: use TEST_SUITES if set
2d900c3061e12 oeqa/runtime: set self.runner and handle None

Cheers,

-Mikko

