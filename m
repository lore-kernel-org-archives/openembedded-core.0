Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 54C147C6A0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2019 23:19:33 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id b2so2583209pgl.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2019 16:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=W5qPN4fKgm6K4OiYrLcLMccg7MeIJvfGd8YDEBRkFy8=;
	b=P5tqYVJPeMYv/B5iMtvQFJlMaMvF5Tiiiofad5MfKJpc7iuM/h4+B2Wxbyu9CT5xJp
	e3I/e51lRWDXRVbD76SEzEioH86+Oeg68HRvRsjRMOMUXkp2KJ5HgqtDLNVaBgt2tBll
	RLynrKpAOjkS3mmXa/XrL5mGmIwAXMQddoXr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=W5qPN4fKgm6K4OiYrLcLMccg7MeIJvfGd8YDEBRkFy8=;
	b=mwk/qRHxktDKdHUqryhABZSspU7AnefCV8PsUXFM+RE59AEVFC+LJdUBC+KOEaI+jN
	ftUdeH+sJ07O7sniFVhbvhqX4rbtE4R4CQ7nTYBWU9H0s1T08j7X8kbqDRQ8822QtgHX
	Rs+nnPIJtP/JJxlplWqtx1lY8ewpnqIFBb7Y9ZlkWCJkpLDlsv6+6pwnamisS934AJYX
	ZsF2Xyb85H+SPvYn4llR5zkpV7ya2KITCiiz7XyXdDfncFbwrBb4ncnB/geuuzXuHSEr
	S+Fc03IQpjt9ykB3uUtzhZLyWQy5sXTDsvt9lD1Bp9R5gSadekEEqXZQIybo0lAQ8sqa
	UDXQ==
X-Gm-Message-State: APjAAAWAqDxvcVWcFMVSapDXQmsCBoV665xYkI3dw/3FMCEIyxP6+4oL
	mMYVLxmyE4a6Vv2o4ZaQMQFVFOzAAc4=
X-Google-Smtp-Source: APXvYqzPFhkPyiKAQFbY3AuXaubhHsSVSS/eVoy/6/smRZ959XcmSk3Z0hrrotwHM4P3n0/qj+22kA==
X-Received: by 2002:a65:6554:: with SMTP id a20mr42273237pgw.170.1552519174255;
	Wed, 13 Mar 2019 16:19:34 -0700 (PDT)
Received: from hex ([12.27.65.221]) by smtp.gmail.com with ESMTPSA id
	u11sm16965696pfh.23.2019.03.13.16.19.32
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 13 Mar 2019 16:19:33 -0700 (PDT)
Message-ID: <8b7a2720fbfc7333bc4f5186e00dd5d8b1bc0a37.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 13 Mar 2019 16:19:30 -0700
In-Reply-To: <20190312211330.30850-1-jonathan.rajotte-julien@efficios.com>
References: <20190312211330.30850-1-jonathan.rajotte-julien@efficios.com>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] lttng-tools ptest: add missing dependencies
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
X-List-Received-Date: Wed, 13 Mar 2019 23:19:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-03-12 at 21:13 +0000, Jonathan Rajotte wrote:
> Multiple tests are failing due to missing dependencies on a bare
> core-image-minimal build with only lttng-tools ptest present.
> 
> "getconf LONG_BIT" is used to get the bitness of the host to run the
> correct consumerd. Depend on glibc-utils.
> 
> perl-module-overloading is needed to validate trace. babelstats.pl
> 
> "head -c" is used to generate a random string. It is easier to
> depends
> on coreutils to get a feature complete "head" than to enable to
> "fancy
> head" feature of busybox. See utils.sh randstring.
> 
> "taskset" is used in a couple of scripts to ensure that events
> generated
> finish in the same buffer. Depend on util-linux.
> 
> Signed-off-by: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com
> >
> ---
> 
> I also submitted the following patches [1] [2] to lttng upstream. It
> should help get the ptest sucess ratio up when they are merged. They
> should be released in the upcoming month.
> 
> [1] 
> https://lists.lttng.org/pipermail/lttng-dev/2019-March/028573.html
> [2] 
> https://lists.lttng.org/pipermail/lttng-dev/2019-March/028574.html
> 
> ---
>  meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)
> 
> diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb b/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb
> index 9d21fb00bf..3324959cc3 100644
> --- a/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb
> +++ b/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb
> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=01d7fc4496aacf37d90df90b90b0cac1 \
>  
>  DEPENDS = "liburcu popt libxml2 util-linux"
>  RDEPENDS_${PN} = "libgcc"
> -RDEPENDS_${PN}-ptest += "make perl bash gawk ${PN} babeltrace procps"
> +RDEPENDS_${PN}-ptest += "make perl bash gawk ${PN} babeltrace procps glibc-utils perl-module-overloading coreutils util-linux"
>  # babelstats.pl wants getopt-long
>  RDEPENDS_${PN}-ptest += "perl-module-getopt-long"

Firstly, I wanted to say thanks for looking at this, there are some
really great fixes in here.

It failed in automated testing as glibc-utils is glibc specific and
musl builds couldn't cope with that.

We can certainly do:

RDEPENDS_${PN}-ptest_append_libc-glibc = " glibc-utils"

but I'm not sure what that would mean for lttng on musl or if lttng
ptest on musl even makes sense.

I'm travelling so haven't been able to dig any further so sorry for
being terse but just wanted to give a heads up on this.

Autobuilder failure:

https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/396

Cheers,

Richard


