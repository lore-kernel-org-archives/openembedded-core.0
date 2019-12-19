Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0D8BF7FDB6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 08:52:52 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id a5so4571830wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 00:52:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=J8rkrX3QxXT6piPsLHZoTPiPSE/Ue2K2k9AxrrWKL+M=;
	b=q85pBaPtS8TGG/1frNlPKJcLD8+O0Lhph6JV+AIbmCZU0sW+X4htZoLnRy3QPPTdYW
	P6ldjDuVwF5OrJj1A9fMeGcIv92s7saEsdBZlEEVYJ4QvFr4sSStOPZqsfhM8tHkTSm+
	fyNDyKPINcbbemYpI6CC91+72GNyDC22yWTjsqakQFaSk+ki+bFqBp6j+ot2XEL1AHzI
	H6ljLjBCacVGYpkj0L/nCoDWdWH72EneEWGR8eS6phqVP2RaKgyBwWSJDuRzwhlJkl/i
	YMWyRPbg7MR6XwAZkCOHoP28w5Q2KLgIujiC1Eb1cBp0whqZxtSoBg7RFYpmZ4vIj42g
	P7qw==
X-Gm-Message-State: APjAAAVV4XwSdGX+jn47Gl7PgLaMVqIXYGvJKXqUjoUhgI7W8hwnUjwA
	J7vPSDFNmGUupn4uFFW09Q9VMG9O
X-Google-Smtp-Source: APXvYqwHILdXiEY1qJdD7JUFiH2HXSs1ajZqsu/6qHFljfUzwU/ICP+tdk9Jv7LvgdFrRqfzy95JPA==
X-Received: by 2002:a05:600c:2488:: with SMTP id
	8mr8485182wms.152.1576745573414; 
	Thu, 19 Dec 2019 00:52:53 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id t81sm5802122wmg.6.2019.12.19.00.52.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 19 Dec 2019 00:52:52 -0800 (PST)
Message-ID: <679f8a273b8e113fadace659a84c35b1338ddbff.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Dec 2019 08:52:50 +0000
In-Reply-To: <20191218233928.696037-1-raj.khem@gmail.com>
References: <20191218233928.696037-1-raj.khem@gmail.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Subject: Re: [PATCH] cmake: Displace VERBOSE setting
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
X-List-Received-Date: Thu, 19 Dec 2019 08:52:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Khem,

On Wed, 2019-12-18 at 15:39 -0800, Khem Raj wrote:
> Setting VERBOSE always, while is fine on one hand for debugging, its
> coming at an expense of creating lots and lots of logs, e.g. qtwebkit
> compile logs alone with VERBOSE is 163MB, there are many other large
> packages which use cmake e.g. WPE, webkitgtk etc which are in same range
> with out this option on, the logs reduce to 861K and also speeds up
> build a notch
> 
> If user needs to enable this logs for targetted debugging debugging that
> could be added via
> 
> EXTRA_OECMAKE_BUILD += "--verbose"
> 
> in recipe
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Ross Burton <ross.burton@intel.com>

I don't agree with the reasoning to always disable this by default. - it's
way too useful in general. I can't count the number of times it was enough
to look at the log.do_compile to figure out something is wrong.

Now you have to recompile everything with this merged, and something that
took 5 minutes to debug becomes an arduous task.

If the Webkit build is too verbose, you should make that specific recipe
less verbose. E.g. you could always set
EXTRA_OECMAKE_BUILD, and just clear
it out in the webkit recipe.

Otherwise, based on the same reasoning, you should disable all logs, not just
cmake logs: kernel, make output in general, bitbake logs. They all take up space.

Seriously, those logs are useful, keeping in mind that often logs are
collected on build-machines, and having easy access is a huge time-saver.


Cheers,
Andre'



> ---
>  meta/classes/cmake.bbclass | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
> index 8ccb1eefc7..8a44a0c216 100644
> --- a/meta/classes/cmake.bbclass
> +++ b/meta/classes/cmake.bbclass
> @@ -181,9 +181,14 @@ cmake_do_configure() {
>  	  -Wno-dev
>  }
>  
> +# To enable VERBOSE option to emit all kind of logs for a given recipe add following in it
> +#
> +# EXTRA_OECMAKE_BUILD += "--verbose"
> +#
> +# Then run do_compile again
>  cmake_runcmake_build() {
> -	bbnote ${DESTDIR:+DESTDIR=${DESTDIR} }VERBOSE=1 cmake --build '${B}' "$@" -- ${EXTRA_OECMAKE_BUILD}
> -	eval ${DESTDIR:+DESTDIR=${DESTDIR} }VERBOSE=1 cmake --build '${B}' "$@" -- ${EXTRA_OECMAKE_BUILD}
> +	bbnote ${DESTDIR:+DESTDIR=${DESTDIR} } cmake --build '${B}' "$@" -- ${EXTRA_OECMAKE_BUILD}
> +	eval ${DESTDIR:+DESTDIR=${DESTDIR} } cmake --build '${B}' "$@" -- ${EXTRA_OECMAKE_BUILD}
>  }
>  
>  cmake_do_compile()  {
> -- 
> 2.24.1
> 


