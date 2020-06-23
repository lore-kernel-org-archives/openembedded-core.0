Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web10.439.1592949080275321331
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2020 14:51:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=K1RB17hw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id g18so160832wrm.2
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2020 14:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=0eHVyFpEMXALiZxf+0huF8Nn7gJ0z6DVXw9qB+KMLrk=;
        b=K1RB17hwESgDorM5jDgrKPQCtz+UfJqTI7pdPybCe3tLebmC2ytsjVCvbumBgyrw8K
         XrMg7l69au6gO6rJVFOysuyroxlaDId5tDtw4BK0G1GwMl/3nD8jsywrtZflhVBO0OQo
         w+PY3jdsd3lOsZ1VnDrjlfGV+QUsv4YDZ8mHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=0eHVyFpEMXALiZxf+0huF8Nn7gJ0z6DVXw9qB+KMLrk=;
        b=Ibv+3dnphsqhTR1yylT7mCwxPguCzKDKNayqfb+X28gd1li/tigP9P7e5Xe+z4FNhM
         va0J+NFzTTUplrPL+hlVusFV11EDQHzIdiFuDRxuYYuTLFgh4HxdOxIjohnHeZzjuib4
         8oBrtSZTZEJeQqn5Jg4IVXQzbshS2P9fBlLY7PC9DwRkVaQWiwaebpDSKTmB0y6mAaIX
         sGKwJwqpa8llb4LYmfCeBaAVclFZJE8ZHkHN0GAYfDK0qBx0YcDKWWlEHUoZ+BXiXvas
         wdwFz8LFDsqMKLLNUzq3qS7DWUPfwrOadlVzYWFD+TqvTl47LHYkp3FRzskty3bfOwtu
         0GIg==
X-Gm-Message-State: AOAM532fhrQ2tSMWaNkSK9R/Kaaf7TYVKZkpO8qUnn46510TFHjy4BDl
	QsP2GbAhkre65qovwiEZWdWLpw==
X-Google-Smtp-Source: ABdhPJysQTiczrH5GRWERwDJcuUflRaJRxNd0grBp17qr3FNL+tKoCKpmhHfaaW5JIocPt5TAD3YpQ==
X-Received: by 2002:adf:80e6:: with SMTP id 93mr26629396wrl.17.1592949078776;
        Tue, 23 Jun 2020 14:51:18 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id z1sm10542979wrh.14.2020.06.23.14.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 14:51:17 -0700 (PDT)
Message-ID: <144b99d5a5b327d660925ff5ee18139d7dc088c3.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH 1/1 v3] classes/kernel: Use a copy of image for kernel*.rpm if fs doesn't support symlinks
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, "Xu, Yanfei"
	 <yanfei.xu@windriver.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 23 Jun 2020 22:51:16 +0100
In-Reply-To: <CADkTA4NApB19MmwAWP3Mgtf+zNEtsPuSxL7h19S8c3FNoC2o4Q@mail.gmail.com>
References: <20200619114727.40142-1-yanfei.xu@windriver.com>
	 <20200619114727.40142-2-yanfei.xu@windriver.com>
	 <CADkTA4NApB19MmwAWP3Mgtf+zNEtsPuSxL7h19S8c3FNoC2o4Q@mail.gmail.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-06-23 at 10:31 -0400, Bruce Ashfield wrote:
> On Fri, Jun 19, 2020 at 7:47 AM <yanfei.xu@windriver.com> wrote:
> > From: Yanfei Xu <yanfei.xu@windriver.com>
> > 
> > Some filesystems don't support symlink, then you will get failure
> > when
> > you install or update the kernel rpm package. Now we use a copy of
> > image for these filesystems instead of symlink.
> > 
> > Suggested-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > Suggested-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
> > ---
> >  meta/classes/kernel.bbclass | 19 ++++++++++++++++---
> >  1 file changed, 16 insertions(+), 3 deletions(-)
> > 
> > diff --git a/meta/classes/kernel.bbclass
> > b/meta/classes/kernel.bbclass
> > index 20a0135fc9..1269b54343 100644
> > --- a/meta/classes/kernel.bbclass
> > +++ b/meta/classes/kernel.bbclass
> > @@ -94,6 +94,22 @@ python __anonymous () {
> >          d.appendVar('RDEPENDS_%s-image' % kname, ' %s-image-%s' %
> > (kname, typelower))
> >          d.setVar('PKG_%s-image-%s' % (kname,typelower), '%s-image-
> > %s-${KERNEL_VERSION_PKG_NAME}' % (kname, typelower))
> >          d.setVar('ALLOW_EMPTY_%s-image-%s' % (kname, typelower),
> > '1')
> > +        d.setVar('pkg_postinst_ontarget_%s-image-%s' %
> > (kname,typelower), """
> 
> You were previously concerned about boot issues if the unversioned
> image link/copy was deferred until boot. I don't see a summary of why
> that's no longer a concern in the v3 of the patch. Can you confirm
> that it isn't an issue ? Is it simply because the booted image isn't
> installed via this package, and hence we are fine ?

I'm suspecting this patch is why we're seeing selftest failures:

https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/1055

Cheers,

Richard

