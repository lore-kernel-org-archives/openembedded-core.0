Return-Path: <matt@madison.systems>
Received: from mail-lf0-f45.google.com (mail-lf0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id F0ACE719A4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 10:39:09 +0000 (UTC)
Received: by mail-lf0-f45.google.com with SMTP id m199so9479460lfe.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Sep 2017 03:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=w3mpV1OrTBENRnKtKMfKb+iCQGertxIBv+5JorFvkpk=;
	b=b9fFAXjwLDjp1qxDR4lRo1gLhFDsR0t5ypL8D/K0ykEsNr8iViUVWC6b7KPqqeJqqD
	52c9VTwQt78NQZTgn2MFoRsz1muxlAgtj9EGH1uo5WP5QqzBEJtSw4Xt8PVxh2wnHF9w
	q4ZJs5PE7ESgVOWieXj2tneTudoH1X1DyExmFJSHfbtyvVV3DuosWTeVYe+SWm364XFC
	sA7frAvQHPA7H6z1BM/V+3lxXzQ9ayda/jlX0ht+O3ipK6Gu0NjWEdbHMpEstCWd0r4V
	ybgA+DkFAb68iihjLo9RT89Njg1hqYjnnLgQTBSMSchRuNXkGLl45mrtmtR3NXTUhIWC
	ui0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=w3mpV1OrTBENRnKtKMfKb+iCQGertxIBv+5JorFvkpk=;
	b=Z07z5K1Qid0VP0MlEWBWR6Lts77IuanBxP6ZhdQgep0QfsdcUtUH0D9RmvzVGLKZ/j
	NaGMrxshQT7Hmk43pPkcKF/F/BmYexo2kvjDcGngShtgN+klhlvRnsfKcdRJ1mSGBxNI
	060e2svKyC//DlGp5PKm6qB6aNclOuzg3T9RD3vbU621xADqm0mGyxbDcbr0M9++5EzD
	3UjMSLxsmOu9DZVeo6n3gGV7EG7frw2BD9+c3o4fSDzxvAOKbd+w1MhUneVhNwm+rvyD
	/lemnDjr6auHrGh2fQjo4mO3mruvjymHdQS7dFvqbE3Taqwvd2z+6ijEzEfngbLy4ttz
	dCAQ==
X-Gm-Message-State: AHPjjUiYTvGt1DCTKTlSnZIXMIfgPXCXUXu9W1qXYiYGF0oH1pRsd9iP
	8k3xkdhT4lm38y3tcw32uGxBa3qMzMr9
X-Google-Smtp-Source: ADKCNb5PFrCHFeHzYRDVOjGy//zjznVq3DrBtzd7qLjEW3jPi2huoM6y28y/ju4/EhvXxi48W80NsEi0n+X5A7iPZYg=
X-Received: by 10.25.16.87 with SMTP id f84mr1024618lfi.172.1504607950470;
	Tue, 05 Sep 2017 03:39:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.213.146 with HTTP; Tue, 5 Sep 2017 03:39:09 -0700 (PDT)
In-Reply-To: <20170904210608.23764-6-otavio@ossystems.com.br>
References: <20170904210608.23764-1-otavio@ossystems.com.br>
	<20170904210608.23764-6-otavio@ossystems.com.br>
From: Matt Madison <matt@madison.systems>
Date: Tue, 5 Sep 2017 03:39:09 -0700
Message-ID: <CAGgRHJoqo+S-LL8frNMVws4mUQmDky+svCCi38-G3hD+D_cFoA@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/7] go.bbclass: Use a global Go build flags
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
X-List-Received-Date: Tue, 05 Sep 2017 10:39:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 4, 2017 at 2:06 PM, Otavio Salvador <otavio@ossystems.com.br> wrote:
> We now use a GOBUILDFLAGS to provide a global variable to control the
> build flags to be given to Go.
>
> This change is based on the meta-golang[1] layer. Thanks to Matt
> Madison <matt@madison.systems> for his work on this.
>
> 1. https://github.com/madisongh/meta-golang
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>
>  meta/classes/go.bbclass | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
> index e073cb91b5..45f2add810 100644
> --- a/meta/classes/go.bbclass
> +++ b/meta/classes/go.bbclass
> @@ -5,6 +5,8 @@ GOROOT = "${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/go"
>  GOBIN_FINAL_class-native = "${GOROOT_FINAL}/bin"
>  GOBIN_FINAL = "${GOROOT_FINAL}/${GO_BUILD_BINDIR}"
>
> +export GOBUILDFLAGS ?= "-x -v ${GO_EXTLDFLAGS}"

You might want to omit the '-x' flag here as a default.  It's useful
when debugging problems with the toolchain, but can make it harder to
find error messages emitted by the compiler.

And I don't think GO_EXTLDFLAGS is being set anywhere (yet)?

Thanks,
-Matt

> +
>  export GOOS = "${TARGET_GOOS}"
>  export GOARCH = "${TARGET_GOARCH}"
>  export GOARM = "${TARGET_GOARM}"
> @@ -32,7 +34,7 @@ GO_INSTALL ?= "${GO_IMPORT}/..."
>  do_go_compile() {
>         GOPATH=${S}:${STAGING_LIBDIR}/${TARGET_SYS}/go go env
>         if [ -n "${GO_INSTALL}" ]; then
> -               GOPATH=${S}:${STAGING_LIBDIR}/${TARGET_SYS}/go go install -v ${GO_INSTALL}
> +               GOPATH=${S}:${STAGING_LIBDIR}/${TARGET_SYS}/go go install ${GOBUILDFLAGS} ${GO_INSTALL}
>         fi
>  }
>
> --
> 2.14.1
>

