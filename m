Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web11.1249.1593621361150169018
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2020 09:36:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RmuRb06u;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id l2so22438621wmf.0
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2020 09:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=srGiUuA5NlF5kfCLf6GxNqv8J8UVjwgljjI1juRA4ic=;
        b=RmuRb06uAecWcu16M/p1rAugmWlwvS4GPwSbLSQJc25/7pOIlu+p7paoSbJCZzzmoV
         GHo4ozzozhtPYe9+2ogwjaUDFiVGSreS4AeJZ8XMJIgQBRTQxMm89hWNckMl0/qT6/mY
         ORQeUPgSi1aG9HwxZkzQYC2UrWCgp7CBLWG4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=srGiUuA5NlF5kfCLf6GxNqv8J8UVjwgljjI1juRA4ic=;
        b=VzyzP5jJtDHHn8o27p4pGMwZmcielGWQJ7MeouKsw1wN+CGrtkblLtlj5AO2fjX5Q3
         vJtfehyTFvh9ZAbymkNxKWEfkCsdMA2b5+3xDYQrNUpJ0XOjWrxp9246fV4fLl1Xz7a5
         Mxe6S0LdR6XMQujIh/YTCy5n+lplqyIA+mpfDE/t/fSwQC0FcLcL+FTA+YWe1Jn5GmN3
         FOQ3u8X1xcQUr7Iu2hvTaqzj3LfKAaFvtM85SrsR/Rx8u0MH332rE+O80+FYaqX8fO4U
         Z6d6UFHqAUDq1uNeXq5MCFjhs3TcYCMXQssAkkl6av7tP/y6yRhcfJtLErj+WOF5B3hn
         piPg==
X-Gm-Message-State: AOAM533QJhgjPQRmQVYjRymDPuhfkNOPJpVe5DlafF9T4SusAU6sbGWT
	P6yNCanSrZzkh9yeMHkXmqDy9g==
X-Google-Smtp-Source: ABdhPJy1LlCaCCdsvhzGyiTAPdHNhSVchkW7LKxCHPpLHy2GEkzmSmTsk2tKXpEXILZ4eXxtNXxSZw==
X-Received: by 2002:a1c:7916:: with SMTP id l22mr22328889wme.91.1593621359702;
        Wed, 01 Jul 2020 09:35:59 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id l14sm7772779wrn.18.2020.07.01.09.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2020 09:35:57 -0700 (PDT)
Message-ID: <aa8752ad52e2075016d4f14b84bbef8e9b40b7cd.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] netbase: use git fetcher
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Yu, Mingli" <mingli.yu@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 01 Jul 2020 17:35:56 +0100
In-Reply-To: <3c5fff8d-aa64-5f36-7db1-2570bbbbf520@windriver.com>
References: <20200629043119.1798934-1-mingli.yu@windriver.com>
	 <c3e569088010a8242703f559f99de658e427f32b.camel@linuxfoundation.org>
	 <3c5fff8d-aa64-5f36-7db1-2570bbbbf520@windriver.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-07-01 at 10:05 +0800, Yu, Mingli wrote:
> 
> On 7/1/20 4:08 AM, Richard Purdie wrote:
> > On Mon, 2020-06-29 at 12:31 +0800, Yu, Mingli wrote:
> > > From: Mingli Yu <mingli.yu@windriver.com>
> > > 
> > > Use git repo as the the previous URL only stores
> > > the latest source file and fails to locate the
> > > source tar file if we don't upgrade timely.
> > > 
> > > Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> > > ---
> > >   meta/recipes-core/netbase/netbase_6.1.bb | 6 +++---
> > >   1 file changed, 3 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/meta/recipes-core/netbase/netbase_6.1.bb b/meta/recipes-core/netbase/netbase_6.1.bb
> > > index bc0049c020..c13685e8ad 100644
> > > --- a/meta/recipes-core/netbase/netbase_6.1.bb
> > > +++ b/meta/recipes-core/netbase/netbase_6.1.bb
> > > @@ -6,10 +6,10 @@ LICENSE = "GPLv2"
> > >   LIC_FILES_CHKSUM = "file://debian/copyright;md5=3dd6192d306f582dee7687da3d8748ab"
> > >   PE = "1"
> > >   
> > > -SRC_URI = "${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}.tar.xz"
> > > +SRC_URI = "git://salsa.debian.org/md/netbase.git;protocol=https"
> > > +SRCREV = "0fc1e4ce39328f7388badace0aaf7b7294d5ed61"
> > >   
> > > -SRC_URI[md5sum] = "e5871a3a5c8390557b8033cf19316a55"
> > > -SRC_URI[sha256sum] = "084d743bd84d4d9380bac4c71c51e57406dce44f5a69289bb823c903e9b035d8"
> > > +S = "${WORKDIR}/git"
> > >   
> > >   UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/n/netbase/"
> > >   do_install () {
> > 
> > This still breaks all oe-selftest:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/1095
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/1087
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/1083
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/1098
> > 
> > oe-selftest -r reproducible.ReproducibleTests.test_reproducible_builds
> 
> It's weird, I did run reproducible build locally with "oe-selftest -r 
> reproducible.ReproducibleTests.test_reproducible_builds" and It succeeds 
> at my side.
> 
> BTW, the netbase only introduces 3 files as below:
> # rpm -ql netbase
> 
> /etc
> 
> /etc/protocols
> 
> /etc/rpc
> 
> /etc/services
> 
> And I did the three files' checksum and the checksum turns out to be the 
> same when with the commit and without the commit.
> 
> Anyway, I will investigate the issue again.

This is the diffstat output on the result:

https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20200630-_jn1koza/packages/diff-html/

It shows this is a timestamp problem, the timestamps aren't always the
same. It should be using SOURCE_DATE_EPOCH.

Cheers,

Richard

