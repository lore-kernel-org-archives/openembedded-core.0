Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1225A7D68C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Apr 2019 21:56:07 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id x12so9180829qts.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Apr 2019 14:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Qldy6WYOc1i0ZOE/bmMb7c8hoUWuMsf8ygC8WHlCfns=;
	b=YJx/vv8KGX8RBeLcWvRhksnlCKPjSsoe/tQ3An0Bb6x5FXeOUr7vRAfOfVQSrKFDk6
	VuOROyYySBYEOddcZoCFv1uoZh3wKEb3MumnSA6UQKwRHEBYdsumWbwEXwOUfHj+EfrQ
	DNM+6I4w+90Iv7TBRR4iKy6Ef19SvnjEIMC+bpNz26N9PyePZsiqdDGpwO8XvxwPa53e
	98+1NDt14O13Ut+ANJvQ4/NEs3E5tfIDDElF88xx4eAmfBGVR9JEvRNJLEZep8N2JxZ+
	RcFY81nWodUA5t7SyKUbHCFHz6C1Eke15XuauxZeBNsvDdxeWacGukVWlXcAEZbK+ISw
	ORXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Qldy6WYOc1i0ZOE/bmMb7c8hoUWuMsf8ygC8WHlCfns=;
	b=KpVKRB02UGBKSAx0VXEJ7z2EmMZY6LmpFw4BdiXfkiPxa1vYZRbONA3B5+hdZjGekq
	kkSp6X5Txc1a8GYDvqPrvwL+LNWiahj52ChNgy7hTvgw81OxhY7fEpyVwY/tb4McdmQp
	EwMZMuUy77yQIcbc4aIWoQVYtg6mD/aSMvqgdUz5evqSFJFXGu34AObqbM4mc8V7UtMl
	9p5Urk4vLtOh6wQBdEJLgn1l3c+pivIoXoTtG/eV3/SSaRtTKG/7oHUWLIejPCoaivwi
	8wf263B4f/yDQjMeuKZmpIaSJz5fFQe8ROukpn5KWuBuhtM31IInBgcwiXLJcrtgvvvC
	efpg==
X-Gm-Message-State: APjAAAXp22LxjQFMR6U27fQBvHkWKKVXnM3awQqY9DnC3RJVER3nLb90
	RZwSzaIbaO5Z6r4HlNGxpTyAxJzGEEri5uHjbJk=
X-Google-Smtp-Source: APXvYqw1Bufetufp1mckFDBX3uw0Xeh9yqtm5d535V5TmtYp8D3217WaFZNP6WFFNC8JV6+EZ4BH5R7w7YNQ/3OTpLk=
X-Received: by 2002:ac8:2aa4:: with SMTP id b33mr13243214qta.127.1554501368871;
	Fri, 05 Apr 2019 14:56:08 -0700 (PDT)
MIME-Version: 1.0
References: <1554368553-1851-1-git-send-email-dengke.du@windriver.com>
In-Reply-To: <1554368553-1851-1-git-send-email-dengke.du@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 5 Apr 2019 14:55:43 -0700
Message-ID: <CAMKF1sops9Hv0UTsQfUjq-DUfD3h1Wpf0artnf3y97RYfrBKvQ@mail.gmail.com>
To: Dengke Du <dengke.du@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] perf: workaround the error cased by maybe-uninitialized warning
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
X-List-Received-Date: Fri, 05 Apr 2019 21:56:08 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 4, 2019 at 2:03 AM Dengke Du <dengke.du@windriver.com> wrote:
>
> When enable DEBUG_BUILD, the perf build failed by the following error:
>     libbpf.c:727:36: error: 'data' may be used uninitialized in this function [-Werror=maybe-uninitialized]
> This is ok until Khem commit a patch in oe-core:
>     16643b03227466e2c80a24c2d079fe36e89553c1
> This commit import "-Og" option to "DEBUG_OPTIMIZATION", result in this error.
>
> Actually, the warning was misinformation. We explore the code in libbpf.c:
>     https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/lib/bpf/libbpf.c#n640
> --------------------------------------------------------------------------
>         if (scn)
>                 data = elf_getdata(scn, NULL);
>         if (!scn || !data) {
>                 pr_warning("failed to get Elf_Data from map section %d\n",
>                            obj->efile.maps_shndx);
>                 return -EINVAL;
>         }
>         ......
>         using data...
>         ......
> --------------------------------------------------------------------------
> If the 'scn' was not null, the data will be initialized. if the data was null,
> the function will return -EINVAL, so the data must be not null, but compiler
> can't see it in 'if' code block, so treat it as 'maybe-uninitialized'.
>
> Signed-off-by: Dengke Du <dengke.du@windriver.com>
> ---
>  meta/recipes-kernel/perf/perf.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
> index 5acdcfb..546076f 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -271,3 +271,4 @@ FILES_${PN}-perl = "${libexecdir}/perf-core/scripts/perl"
>
>
>  INHIBIT_PACKAGE_DEBUG_SPLIT="1"
> +DEBUG_OPTIMIZATION_append = " -Wno-error=maybe-uninitialized"

I was thinking that this would be applied globally, but I think doing
it on need bases is
a better approach so this looks ok to me.

