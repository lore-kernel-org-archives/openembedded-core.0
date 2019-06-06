Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id 651637CEE0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2019 09:45:19 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id e5so157719iok.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jun 2019 02:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3/lwxdcCZO7J66wngqNlmMyxLucCgNLZv2j9KJpokJs=;
	b=W+0Pbs8H58mKpCOfzZjwvSUiGI4Cfe6yHouo+mHbPpSRAdb5kC9taGV89nWYrKzzAz
	wKdJ84xL1R3QeAr3U07zHtZgE+JBKUZ5RvZ9KfqwhgyfUvRKTyCYys2+u60bPXwVPFY4
	iZBudbDkqMtFjGICF/Xjt4SivISOKHc/ow5iAqnu1B5icbcYReuLpMsPpIKS0UWlvwTF
	4VNJA0INIsnnAVKOh7WIFNv+cO4MtQseuyPQmTaPDpQShWMsVuczmQGRFEcZrzDmjHuv
	x3s00gC6jF/RLOShyX2UVpFTOG3Pi5pWbKgob+oMN51He//77YQFXVGEnJ5MlHXTwcpg
	PoLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3/lwxdcCZO7J66wngqNlmMyxLucCgNLZv2j9KJpokJs=;
	b=kvzG/xNiOvEyYrgzvIByZDsJ3/Yl0O8xO9p5u5nHXb1v+zZvzTcFcS7Od52dFI3qMk
	M783hyfA6SFobFjy6AwxktjrjtiKo97g23znJV19y0UzboZtrA3uYsun7HtW6/Krk959
	e4DCLqc87yptpdjSeXVzzjeRuvdLwLX6fTMIV1k0E0I1og4PN8lcH0fcvZC6gH5Yiqr4
	ai/dJIpPh5+HXkaCz7/XuXdXHm0zTaa9bLwMdOuT2W2OMv/mIQYF9jj0BiS0NpnZiT/H
	jox/lMUAz89M5UdwhQfy4o48Sim6WS3VFHv1mp55LJ+0vY3AMRomJCCjJ2iJTAUiaUk1
	2ltg==
X-Gm-Message-State: APjAAAXrLKq0sPZQ18NWHm95vfq0U5olPyDzgoboQAUGEef7fbDKGH/l
	zIAfOcIZT50N5HIu6ExIbf8Z2h2y/XxiAQHsq8YDTA==
X-Google-Smtp-Source: APXvYqw0gKtXj9Pu08loHXQAihuLcztvuJpE8tPLTQEeueud2ULTV4ykGr3PhoVwwmPN+rQXd9LW74TzWfd3daAJaNE=
X-Received: by 2002:a6b:bc02:: with SMTP id m2mr6312886iof.25.1559814320421;
	Thu, 06 Jun 2019 02:45:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190606020544.26181-1-douglas.royds@taitradio.com>
In-Reply-To: <20190606020544.26181-1-douglas.royds@taitradio.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 6 Jun 2019 10:45:07 +0100
Message-ID: <CAJTo0LY8p=p=6kOxQBkrUPXi_EPTpCnAXzrp7con1q7pOxj0EA@mail.gmail.com>
To: Douglas Royds <douglas.royds@taitradio.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] json-c: Disable icecc to avoid implicit-fallthrough warning as error
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
X-List-Received-Date: Thu, 06 Jun 2019 09:45:19 -0000
Content-Type: text/plain; charset="UTF-8"

Considering the pain that the gcc upgrade introducing that warning
caused I'll be *very* surprised if this problem is limited to json-c.
Could the icecc class forcibly disable that warning instead?

Ross

On Thu, 6 Jun 2019 at 03:06, Douglas Royds via Openembedded-core
<openembedded-core@lists.openembedded.org> wrote:
>
> icecc preprocesses source files locally before shipping them off to be compiled
> on remote hosts. This preprocessing removes comments, including /* fallthrough */
> comments in switch statements that normally prevent the implicit-fallthrough
> warning.
>
> Rather than turning off -Werror by patching configure.ac, it is simpler to
> disable icecc completely for json-c. There are very few source files to compile,
> so the compilation is quick even without icecc.
>
> See https://github.com/icecc/icecream/issues/419
>
> Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
> ---
>  meta/recipes-devtools/json-c/json-c_0.13.1.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-devtools/json-c/json-c_0.13.1.bb b/meta/recipes-devtools/json-c/json-c_0.13.1.bb
> index 5b10e68297..8d2a20352d 100644
> --- a/meta/recipes-devtools/json-c/json-c_0.13.1.bb
> +++ b/meta/recipes-devtools/json-c/json-c_0.13.1.bb
> @@ -21,6 +21,7 @@ RPROVIDES_${PN} = "libjson"
>  inherit autotools
>
>  EXTRA_OECONF = "--enable-rdrand"
> +ICECC_DISABLED = "1"
>
>  do_configure_prepend() {
>      # Clean up autoconf cruft that should not be in the tarball
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

