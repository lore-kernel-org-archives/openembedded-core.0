Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 074456BCE7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 14:08:34 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id f2so2977036wmj.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 07:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=JZT5LxYKOt2ObGEz6ycMtpmCwI/vp0u/jOUz3OeItWo=;
	b=ZZupegtpJiYV6+wyDe1IhXPaNsWpvVZL2R5wnSiO7tlX9tg6waJ3yJu1jLJbAf0lOi
	0Wbtk4qNn9bcuodODFGWFRT2GB+qxLNukP70Eu4VGwxH4FE1+INF5TBH7GL4dSq4GeEK
	vejn7hm1I3DQa8ls3n8f9d2YS4fu7ONRd2RwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=JZT5LxYKOt2ObGEz6ycMtpmCwI/vp0u/jOUz3OeItWo=;
	b=rfEXYh+WGEbAk7ZaMQpZHRMmyN52vSHnJnhjc6nqGBmequ50KI2LCswlI2r8h8Z7qR
	55rWXhIodp8pXEW+XJ75Vu4q7wEMQWtlaD+Gl8XaOnr2DjF3s28WRvgabTdyb0y1yGUj
	lX8qPGJwzVg/iXCVyvekUpZcN3tO1Re0GA3SUGebxCBaIxO81v84lGMmoyXBhIxTm4YA
	aT1pMvumiIMFaGIIsHBTsBj0RODVrcXMnEDMhr2rZuWBqpC4agGJAwqsogOSrYm4kWn4
	eJ/5sMRZaB5D63I2wiMvYstFrONCYK8NilDIx9gKi78lyD1HGe48W62ihOhLhwt901UP
	lswA==
X-Gm-Message-State: APjAAAXnzFnSZJWqQK+HLjuVnN3xBMBMXJPoguCU3z0s2wINOhfPJdFp
	TMTgkg7lUr2uwHc3yPJRONIEheslpT4=
X-Google-Smtp-Source: APXvYqwvc92UAhLKP4oFUpr7fbLEKNnMU/GrpUiizVM/iJvPnGrHbqrRqkuVkHRFBVWjs3xnIddG0g==
X-Received: by 2002:a1c:9c42:: with SMTP id f63mr5528720wme.23.1557842915712; 
	Tue, 14 May 2019 07:08:35 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	j82sm7088210wmj.40.2019.05.14.07.08.34
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 14 May 2019 07:08:34 -0700 (PDT)
Message-ID: <4588fa927b2e10223bab39d65aab4184db783f49.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Randy MacLeod <Randy.MacLeod@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 14 May 2019 15:08:33 +0100
In-Reply-To: <20190514035716.27376-2-Randy.MacLeod@windriver.com>
References: <20190514035716.27376-1-Randy.MacLeod@windriver.com>
	<20190514035716.27376-2-Randy.MacLeod@windriver.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 2/5] valgrind: do not strip the package or ptests
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
X-List-Received-Date: Tue, 14 May 2019 14:08:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-05-13 at 23:57 -0400, Randy MacLeod wrote:
> About half the ptests will fail if the executables deployed
> as part of the ptest package are stripped. Currently
> there is no easy way to only strip the main valgrind
> package so leave it and the ptests *all* unstripped.
> 
> There is an enhancement filed to enable wildcard stripping:
>    https://bugzilla.yoctoproject.org/show_bug.cgi?id=13343
> so this recipe can be fixed once that is implemented.
> 
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
>  meta/recipes-devtools/valgrind/valgrind_3.15.0.bb | 4 ++++
>  1 file changed, 4 insertions(+)

I did test whether we could get away with a dependency on valgrind-dbg
as in theory that should behave the same way. It doesn't which means
the debug symbol linkage isn't being honoured by valgrind and that is
something we need to look into too :/.

I'm torn on whether to accept this patch or try and fix partial
stripping...

Cheers,

Richard


