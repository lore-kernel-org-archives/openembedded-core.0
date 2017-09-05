Return-Path: <matt@madison.systems>
Received: from mail-lf0-f53.google.com (mail-lf0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id 7380670057
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 10:50:57 +0000 (UTC)
Received: by mail-lf0-f53.google.com with SMTP id d17so9583945lfe.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Sep 2017 03:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zmtR2jYtfX7GdA4mOCHgbl42aauAhWmipl3wtYsZEZ4=;
	b=oz7YE5pu2P5Evylzu7yXW15MwwoNXTrBYAoC/oPlXnJoUsUl0WPkTKmfRYsuXN5fU7
	a+StMPGSg9LrI2tYPiIswS4dF/sTwMkajoLcCOz3R9B9wKc1U/REt4XOnTURLQKj9v7w
	lqNzOmWoZuTjPwQ5EuqsUAdJUThCZajA9vCwHWU0MIwn/uk+ENfx95qKTotfEZeYyDx4
	zZjwIUpNfAL5SNJFseyiFERXg06YeAmFDsP4CHJo8xLYa0U9biwIFO7qtRyaGVhQDAvn
	fZcxlRsbL0hLzXk5T7aKwmk4XTRO2rw9Q3zkCvXxMn6ax+5ypa8XA0aPNU9ieJBUB3JR
	fTHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zmtR2jYtfX7GdA4mOCHgbl42aauAhWmipl3wtYsZEZ4=;
	b=UFYZ0w9hF3Ruq45xNUxmsgjeciiIrwgf49tX7ojSbGTXN1Am7+tRuw/2dWzCJGRLJj
	wszzLSj2xrcd/TYdcjlRvPo+1xXYouS8HGLfDkZs8QzUr8+lDhP5jkh+eyTJ/hSCaEqk
	p1xuuzAV7lSUHbQdtLD2IXkG5iul2LiqocUouaYK3yTjJ+2rLaHmj4+g/pomZjE7M6ig
	SxKeOtnQMuHHDI+w3QwqEjTrEMVBxKufBLtSFogszQkOcMo0q+GKngqUQ+xUwza3hJgC
	mdaiVXqukTxEGbhqIFCajwkRVeWhkyxGdGLjTY84uUCsyZLxIwaHAfjz7ns7EcgVTPhN
	DguA==
X-Gm-Message-State: AHPjjUgRaAw4VD9jglT8WWrijq+hd2nQD/UWs+qj7xzjIs0lf2hS7JRO
	H6JCmyEkKv2BqWwvr2rTkz1/vUYP187z
X-Google-Smtp-Source: ADKCNb6wl42uOe+cLZpXI2O12pDGBJFd+BlzJDSKqcJd9mrsyGRt7RWFd8O6Ne6jNfYvX5KZYYZQd4PWmc352BLqv54=
X-Received: by 10.25.215.38 with SMTP id o38mr1025730lfg.124.1504608658307;
	Tue, 05 Sep 2017 03:50:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.213.146 with HTTP; Tue, 5 Sep 2017 03:50:57 -0700 (PDT)
In-Reply-To: <20170904210608.23764-7-otavio@ossystems.com.br>
References: <20170904210608.23764-1-otavio@ossystems.com.br>
	<20170904210608.23764-7-otavio@ossystems.com.br>
From: Matt Madison <matt@madison.systems>
Date: Tue, 5 Sep 2017 03:50:57 -0700
Message-ID: <CAGgRHJq8yBn+wxaXOMXmc9jrOSODUFOUL=9RFLCFLm7z_o6V7g@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/7] go.bbclass: Enable parallel build
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
X-List-Received-Date: Tue, 05 Sep 2017 10:50:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 4, 2017 at 2:06 PM, Otavio Salvador <otavio@ossystems.com.br> wrote:
> The parallel build is based on PARALLEL_MAKE variable but can be
> overriden setting the GO_PARALLEL_BUILD one.
>
> This change is based on the meta-golang[1] layer. Thanks to Matt
> Madison <matt@madison.systems> for his work on this.
>
> 1. https://github.com/madisongh/meta-golang
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>
>  meta/classes/go.bbclass | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
> index 45f2add810..f80134bf8e 100644
> --- a/meta/classes/go.bbclass
> +++ b/meta/classes/go.bbclass
> @@ -1,11 +1,31 @@
>  inherit goarch
>
> +def get_go_parallel_make(d):
> +    pm = (d.getVar('PARALLEL_MAKE') or '').split()
> +    # look for '-j' and throw other options (e.g. '-l') away
> +    # because they might have a different meaning in golang
> +    while pm:
> +        opt = pm.pop(0)
> +        if opt == '-j':
> +            v = pm.pop(0)
> +        elif opt.startswith('-j'):
> +            v = opt[2:].strip()
> +        else:
> +            continue
> +
> +        return '-p %d' % int(v)
> +
> +    return ""
> +
> +GO_PARALLEL_BUILD ?= "${@get_go_parallel_make(d)}"

This added variable should be appended to BB_HASHBASE_WHITELIST.

Thanks,
-Matt

> +
>  GOROOT_class-native = "${STAGING_LIBDIR_NATIVE}/go"
>  GOROOT = "${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/go"
>  GOBIN_FINAL_class-native = "${GOROOT_FINAL}/bin"
>  GOBIN_FINAL = "${GOROOT_FINAL}/${GO_BUILD_BINDIR}"
>
>  export GOBUILDFLAGS ?= "-x -v ${GO_EXTLDFLAGS}"
> +GOBUILDFLAGS_prepend_task-compile = "${GO_PARALLEL_BUILD} "
>
>  export GOOS = "${TARGET_GOOS}"
>  export GOARCH = "${TARGET_GOARCH}"
> --
> 2.14.1
>

