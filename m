Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id BA75761B89
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 18:31:52 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id a141so3254725wme.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 11:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=fLTH913eXxWCJN+6sfFDjPy48JKeAJ0tWq7anlLbFhc=;
	b=CMUBIsxD2rwvzDQeKHc+M6eHzj0XFA5l+p8aEX1jZgh3MyWMh5rOpiJRQdRFrhcVYe
	ag10NlOseIvUbmbr2pGyFubDJl0d3MpPiW8ir78xF3eTAMV8rs6V6I9IazNrFKvS+HzF
	rnZ/pSJqRKhLiXv24Y0KyOA0D+CdKb1ErD0I4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=fLTH913eXxWCJN+6sfFDjPy48JKeAJ0tWq7anlLbFhc=;
	b=o8fS8s1qPoRsz9s9sOm2vSatMmFO11KLJmL9F+MHL/P40rR+fq+XNH9dFXSBcFDWRP
	kLdEaJvIlX9wnS7JLPeoXSPdMvJU2BfltDzbTfCBA93NNGsbtdQWNEDbQ9qNkPnRVMU9
	l1LVG2aNcGSoa+rsZ2d61XP8Hl2G19pZhUzShGKqpzkaXe8gGXb9V1ju99ijg7HQmAe7
	30bIdPfVHGwOVhBtq1l6evMWaKMsWKe6lat3d9EMEBNTUtyXAR55BHAJlgF196z++WLI
	XNV9zHQfjjyERq7tEwttpZoDh8YaKkshMCOe2SAf6JIUKS695Jo41sG0YzUQwai4UkSJ
	k2zg==
X-Gm-Message-State: ANhLgQ1DAH1BUv/mtVItdZki02IsYHmF8F5+FqpVakEcAOL9K0somn8g
	G6pAFF+U2ezG6Cvkf2wiwQUAUzk8wOc=
X-Google-Smtp-Source: ADFU+vvb0brP6O8cLVkg84xWfQJyl2fv6zcbm6d0nn/KUt89nrkkUg3ad6NV9zN9CoVthKks5mZQcA==
X-Received: by 2002:a7b:cdfa:: with SMTP id p26mr63898wmj.39.1583951513326;
	Wed, 11 Mar 2020 11:31:53 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id o3sm9972406wme.36.2020.03.11.11.31.52
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Mar 2020 11:31:52 -0700 (PDT)
Message-ID: <52dc073deff28f726b7b9f451640a673009df419.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Wed, 11 Mar 2020 18:31:51 +0000
In-Reply-To: <53da03e4-b7e4-8882-3d10-ff27a051f07b@gmail.com>
References: <20200311114421.65442-1-richard.purdie@linuxfoundation.org>
	<53da03e4-b7e4-8882-3d10-ff27a051f07b@gmail.com>
User-Agent: Evolution 3.35.91-1 
MIME-Version: 1.0
Subject: Re: [PATCH] coreutils: Fix -dev package dependencies
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Mar 2020 18:31:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-03-11 at 11:29 -0700, Khem Raj wrote:
> 
> On 3/11/20 4:44 AM, Richard Purdie wrote:
> > The new ptest dependencies present some challenges, in particular
> > libmodule-build-perl
> > which effectively depends on gcc. In multilib images, this results
> > in both
> > libXX-gcc-symlinks and libYY-gcc-symlinks being installed which
> > conflict. This also
> > makes little sense.
> > 
> > The easiest way to fix this is to disable the automatic -dev
> > package dependencies
> > and manually specify the correct ones.
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >   meta/recipes-core/coreutils/coreutils_8.31.bb | 4 ++++
> >   1 file changed, 4 insertions(+)
> > 
> > diff --git a/meta/recipes-core/coreutils/coreutils_8.31.bb
> > b/meta/recipes-core/coreutils/coreutils_8.31.bb
> > index cba0bfe15cc..eac016319eb 100644
> > --- a/meta/recipes-core/coreutils/coreutils_8.31.bb
> > +++ b/meta/recipes-core/coreutils/coreutils_8.31.bb
> > @@ -149,6 +149,10 @@ inherit ptest
> >   
> >   RDEPENDS_${PN}-ptest += "bash findutils gawk liberror-perl
> > libmodule-build-perl make perl perl-module-file-stat python3-core
> > sed shadow"
> >   
> > +# -dev automatic dependencies fails as we don't want libmodule-
> > build-perl-dev, its too heavy
> > +RRECOMMENDS_coreutils-dev[nodeprrecs] = "1"
> > +RRECOMMENDS_coreutils-dev = "acl-dev attr-dev gmp-dev libcap-dev
> > bash-dev findutils-dev gawk-dev shadow-dev"
> > +
> 
> this also means that any indirect dependency in future has to be
> added here manually right ? or will that situation never happen, if
> it will then perhaps a note in comments might be useful about that

If DEPENDS change, we may need to tweak this, yes.

The whole -dev thing has a bug open about reworking it and its a mess
already so this is really a bandaid for now.

I'd rather have this and coreutils-ptest than not have the ptests.

I'm trying to be pragmatic about it! :)

Cheers,

Richard


