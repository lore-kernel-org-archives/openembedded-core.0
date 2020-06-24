Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web10.253.1593015506155775132
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2020 09:18:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FNhtAKuK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id z13so2875462wrw.5
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2020 09:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=/2mtPsm5bnhy3AQXPEEc5D7N4ywlg5Z4ir2rUldaz84=;
        b=FNhtAKuKoiJlmLxOpHSaEu8SZEApOscAEfYK0bHrPi+8V9FRIc+KIVwDM3sYkkree/
         2v2B81qXfxuLi6h3XFZrSKBe3hhpntCiqtSa+wpUu3FBs5gC/HRIt91LiHpyIHGRuQzb
         kQ7J+Qc8eyqVwdQgnKhckQGEzKI5iPvJ60sgg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=/2mtPsm5bnhy3AQXPEEc5D7N4ywlg5Z4ir2rUldaz84=;
        b=ZrlXINrs+Euj1iRkZ3bg5bVpkZQ14yxcliMe3xbIwNElvourQbq5wQ6M+JY5RPM8da
         7gcOlbzSb6ph+qFX9Tit07ppP+qSc2QR58pKRE848K5x1D2iiAp0Yv1HBszXUYyVTAYI
         WBYcJfea7QxhCcihwlId+drcNaMK5uhGlZuquXQ10Vbkgwn0drwsoA2xWugr7REq8p9F
         6H2KJMuEiwgeHibnLpvA9AqdA48Psz9mCYGP9Gup9nlc28Kw3xqcC2fUBnbtVC8fLdns
         ZLc3oZwWkYNViy2CKF8ivizVaVHmSCtdIBZJaQNrNwJFPfap+pb380AKmx8vT8CPcIYI
         a1Dw==
X-Gm-Message-State: AOAM533eN97Q2yyV0r8OYn4+ayRL3vwMouuzQPsKx3FtiQ4uPHdIwheH
	5aAbVjOiwohMB+hFT+D801aFbQ==
X-Google-Smtp-Source: ABdhPJyP+rM+iDUpNZ0bBYPHE3P9dsmXS+Ukia61bQjhX8cENcZMIR8VhXipM4WX6nf+/QBtwQSc+A==
X-Received: by 2002:a5d:62d1:: with SMTP id o17mr31278352wrv.162.1593015504630;
        Wed, 24 Jun 2020 09:18:24 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id 1sm8428813wmf.21.2020.06.24.09.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 09:18:23 -0700 (PDT)
Message-ID: <764ae03515c1e73c6eaa394a68b4b98877b38577.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH 1/1 v3] classes/kernel: Use a copy of image for kernel*.rpm if fs doesn't support symlinks
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Xu, Yanfei" <yanfei.xu@windriver.com>, Bruce Ashfield
	 <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 24 Jun 2020 17:18:22 +0100
In-Reply-To: <77c7e877-527a-3e39-ad58-2b34c4cffa05@windriver.com>
References: <20200619114727.40142-1-yanfei.xu@windriver.com>
	 <20200619114727.40142-2-yanfei.xu@windriver.com>
	 <CADkTA4NApB19MmwAWP3Mgtf+zNEtsPuSxL7h19S8c3FNoC2o4Q@mail.gmail.com>
	 <144b99d5a5b327d660925ff5ee18139d7dc088c3.camel@linuxfoundation.org>
	 <7d7b57ca-5419-971d-6701-4cd2e8958960@windriver.com>
	 <b456775facefdc593552db94bf2de51f5725aa97.camel@linuxfoundation.org>
	 <77c7e877-527a-3e39-ad58-2b34c4cffa05@windriver.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2020-06-24 at 23:57 +0800, Xu, Yanfei wrote:
> 
> On 6/24/20 9:08 PM, Richard Purdie wrote:
> > On Wed, 2020-06-24 at 09:47 +0800, Xu, Yanfei wrote:
> > > On 6/24/20 5:51 AM, Richard Purdie wrote:
> > > > On Tue, 2020-06-23 at 10:31 -0400, Bruce Ashfield wrote:
> > > > > On Fri, Jun 19, 2020 at 7:47 AM <yanfei.xu@windriver.com>
> > > > > wrote:
> > > > > > From: Yanfei Xu <yanfei.xu@windriver.com>
> > > > > > 
> > > > > > Some filesystems don't support symlink, then you will get
> > > > > > failure
> > > > > > when
> > > > > > you install or update the kernel rpm package. Now we use a
> > > > > > copy
> > > > > > of
> > > > > > image for these filesystems instead of symlink.
> > > > > > 
> > > > > > Suggested-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > > > > Suggested-by: Richard Purdie <
> > > > > > richard.purdie@linuxfoundation.org>
> > > > > > Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
> > > > > > ---
> > > > > >    meta/classes/kernel.bbclass | 19 ++++++++++++++++---
> > > > > >    1 file changed, 16 insertions(+), 3 deletions(-)
> > > > > > 
> > > > > > diff --git a/meta/classes/kernel.bbclass
> > > > > > b/meta/classes/kernel.bbclass
> > > > > > index 20a0135fc9..1269b54343 100644
> > > > > > --- a/meta/classes/kernel.bbclass
> > > > > > +++ b/meta/classes/kernel.bbclass
> > > > > > @@ -94,6 +94,22 @@ python __anonymous () {
> > > > > >            d.appendVar('RDEPENDS_%s-image' % kname, ' %s-
> > > > > > image-
> > > > > > %s' %
> > > > > > (kname, typelower))
> > > > > >            d.setVar('PKG_%s-image-%s' % (kname,typelower),
> > > > > > '%s-
> > > > > > image-
> > > > > > %s-${KERNEL_VERSION_PKG_NAME}' % (kname, typelower))
> > > > > >            d.setVar('ALLOW_EMPTY_%s-image-%s' % (kname,
> > > > > > typelower),
> > > > > > '1')
> > > > > > +        d.setVar('pkg_postinst_ontarget_%s-image-%s' %
> > > > > > (kname,typelower), """
> > > > > 
> > > > > You were previously concerned about boot issues if the
> > > > > unversioned
> > > > > image link/copy was deferred until boot. I don't see a
> > > > > summary of
> > > > > why
> > > > > that's no longer a concern in the v3 of the patch. Can you
> > > > > confirm
> > > > > that it isn't an issue ? Is it simply because the booted
> > > > > image
> > > > > isn't
> > > > > installed via this package, and hence we are fine ?
> > > > 
> > > > I'm suspecting this patch is why we're seeing selftest
> > > > failures:
> > > > 
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/1055
> > > > 
> > > Do you mean this patch has been applied? and introduce new
> > > issues?
> > 
> > Yes, I reverted it and retested and confirmed this patch causes the
> > selftest failure in the link to the build above.
> > 
> OK, I am trying to analyse the log. But I haven't figured out what
> cause
> it fialed， and how to reproduce it on my mechine. I'd apprecate any
> information.

The command to reproduce should be:

oe-selftest -r efibootpartition.GenericEFITest.test_boot_efi

Cheers,

Richard

