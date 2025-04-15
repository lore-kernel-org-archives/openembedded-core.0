Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 744BBC369AB
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 05:07:31 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.13215.1744693643425059590
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Apr 2025 22:07:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=jCcANRgW;
 spf=pass (domain: linaro.org, ip: 209.85.167.47, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54c090fc7adso3724354e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Apr 2025 22:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744693641; x=1745298441; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jpxtuopfNV/eKkd1Z/F5J7GQVdBfVQj8JurADjXRQnU=;
        b=jCcANRgW8UHa3OHJUfhR0cH6znxGrEnp25WEWrx9TesfcmDktECmM5RxSb5PbXTsmk
         o7QJwdcDiosjcTv8ALt9K2GCmU7ywjWHOObW2J1fQRUbWueF8EwtTrn0C2SzJZCT8p7M
         KNfYc1hbC1ojdRGBDQ4a6kAxy07yW2rWbTo1FCKTgfxbMdaOLbvVNDdhVawjQfeqNZTJ
         mSc47/HclC9F8QLnaweV0mgCdkkRoquLMyAgb4R4oRi1fOY/620WHzZhVdOY+b8ubu3N
         LzRjyDzw+PFhe3FJ8vGJYe5ntXBO8mwKrE8mM7t8otKbjiUBjnt553bxfMc5yNZH6Xme
         U+6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744693641; x=1745298441;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jpxtuopfNV/eKkd1Z/F5J7GQVdBfVQj8JurADjXRQnU=;
        b=tx4WujpjqPdb0dhPiPpAOWCUVlq83uQC/tOFhF5fbkK5kxWos89caoiqgQwU4LYpxI
         LA7MMW09OOK6RdKaqiyEU0rSiH4yZM1ERxSL650z+/Qpo0weqDrvIFqsyJoLDtJb1+dd
         6hU1hPUwYKQDElUQUUtLPEuk0enrA4E4B9sMuppFU2AyufTkgcv8pnU4d40/oeQTv9tG
         D5U+4rPDsM43AdZFiemmFExewho6p5ANRNQ8x/yvaDpARgcTjGTGYeVUIGQtSFaVLoOi
         3bMQ9EU2wXj+vdtbMt+RyGDDKxHzCzHD2Eu+JCJ0shjQ9hmLiCPoO3tXm3YPpVPDb2VM
         H3tg==
X-Gm-Message-State: AOJu0Yzf1uHmsOTv/V/zi5mMIvYtM2bZrB7p2Tb4N+Nm7gdB/p6uG2OG
	LisZuciqdW0AbsxEYJxdlCdEMt7118Kglpd5jx2w26t7B1ETCvdwPsYsMHsYjUY=
X-Gm-Gg: ASbGnctIwF43gGbAc2OItotQ+wdfoKqpztz4tgkVaH+C5OeHE4NT8IftC+q0UmvG0NJ
	Jak2EMkGBSY3Z0isx5c6AlhXblqNda3o9tXDMEG9iaI5sw76R3o8MfTnpAQ6nul/Cvgpq0kqMHP
	i2cB/6C4lG+LidW3q53/XPAjBfqs1piU2r2pTk/O4siCJz8wppPDM3xb6HU9t/rsOLxzef8g1DE
	ei/YYB7CuO9eKODi4YB8xe6f4V8VP/ULNi62XYtmgATNVNaIKfvRMGidiBPNiSCQhH/vzqPw/8R
	JCkpT+bLogoWcSK7E8VJlcABmkFWKRYJqgh8sf32HH8QIOLrrEKYKE+uqXW+9g56rUajxUGZLA=
	=
X-Google-Smtp-Source: AGHT+IFwGJWvRCIAc36vhM3FNYQVlD0OntsA1MIvdLsruz+xPouNBrtmB+qaGOTSrQQxEGqBFpnzRw==
X-Received: by 2002:a05:6512:239e:b0:549:7c8f:8792 with SMTP id 2adb3069b0e04-54d4529eaf2mr4037570e87.29.1744693641489;
        Mon, 14 Apr 2025 22:07:21 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d123619sm1298263e87.42.2025.04.14.22.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 22:07:21 -0700 (PDT)
Date: Tue, 15 Apr 2025 08:07:19 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Trevor Woerner <twoerner@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] oeqa wic.py: clean image build dir before
 rebuild in test_permissions()
Message-ID: <Z_3phyMbfFT4937_@nuoska>
References: <20250407110946.47038-1-mikko.rapeli@linaro.org>
 <20250414205613.GA8398@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414205613.GA8398@localhost>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 05:07:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214821

Hi,

On Mon, Apr 14, 2025 at 04:56:14PM -0400, Trevor Woerner wrote:
> On Mon 2025-04-07 @ 02:09:45 PM, Mikko Rapeli via lists.openembedded.org wrote:
> > The test builds images using wic and then with bitbake
> > and compares results. This fails at least on aarch64
> > build machine and multiple target machines due to
> > pseudo errors. Fix by cleaning the build recipe
> > build directory before rebuild.
> > 
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > ---
> >  meta/lib/oeqa/selftest/cases/wic.py | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
> > index 4f5d43b5ee..55c655cd6d 100644
> > --- a/meta/lib/oeqa/selftest/cases/wic.py
> > +++ b/meta/lib/oeqa/selftest/cases/wic.py
> > @@ -674,6 +674,7 @@ part /etc --source rootfs --fstype=ext4 --change-directory=etc
> >  
> >                  config = 'IMAGE_FSTYPES += "wic"\nWKS_FILE = "%s"\n' % wks_file
> >                  self.append_config(config)
> > +                bitbake('-c clean core-image-minimal')
> >                  bitbake('core-image-minimal')
> >                  tmpdir = os.path.join(get_bb_var('WORKDIR', 'core-image-minimal'),'build-wic')
> >  
> 
> I have seen this issue too, but it is intermittent for me; is this an
> intermittent issue with you as well? This feels a lot more like a hack rather
> than a solution.

This is somewhat reproducible. I don't fully understand what is happening
but it has something to do with pseudo fakeroot database and creating
files with wic directly vs wic via bitbake build. Hack, possibly, but it
fixes the issue. I don't expect pseudo to work correctly if tools are run
in and outside of bitbake build environment.

Cheers,

-Mikko

