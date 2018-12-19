Return-Path: <matt@madison.systems>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id D1A477BDAB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2018 21:41:09 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id n18-v6so18695100lji.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2018 13:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=NMEwbUFNied1yDyBfyxhDhUJLSI+BbJj7zFzD+w42eM=;
	b=ypoQ+aD9l3Hde62v6VX4DYo7wYK5/gt2J75d5JmsBn4BcweitPGWZ4tJr27DMyg8mT
	rpfxSm0iowFsl4xkN4o8a7mit/BPvT55/kCgq+eFc1I/zH07qpjxNJeXkwLg+zeQJn3C
	QD0MG7pLRe1HOyD4OfKwLv+sMg6TfRId9+1VYwzcaPGXEAaTYFD7rHe6PFub5I05hdR1
	uN4y8uSCtj4Lu0NCni9yNC2jQWuchKYDIBKsK+BNXXC7Np8BA6RuhUj3DM8x+GKN0x15
	7sC6HWUSyG2yxJEbDBgPA82uQefbScxH2LqLgUSLp6AA5KdRKbVllkD4Xmca/FHD+HAV
	mU3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=NMEwbUFNied1yDyBfyxhDhUJLSI+BbJj7zFzD+w42eM=;
	b=goH4CReAqB/j8F+v6BZHRZXDhA4I5fiPvhYSGSxwsn8xfCvM3qQBsjo4dQkEvKV1zB
	Ppz7iOdojwIix0MKVtleGzO2faFjENJmMxUpqOWw5/pFKXUx0JRGRaLTsXrtOVtmZTjm
	wxexKVsTKytTd6TltFxkI0U3MEp9e9Wfho/wi2I+AZt0dhEQb9GCjYPStq6DTbIMT5TG
	IQlG8cTfY5fd4rr26jt7SPyX55mQzBkl0G4y4AgQVZy5pTAxTAmaC+LHvRd64cIN7L1T
	/08A980aOrtlmeSk5OKb0TAfBh7Yy+uwxpoBHFLRkXxHbE54HuGwoKYQ6Rleu3IHMYBz
	Vliw==
X-Gm-Message-State: AA+aEWYDNl5y+JuBHAssTQ9Qkjxtxn2o3THuenATDmxn6KtX5xEbf58D
	gJ8N1FWuImWZBv16nQ+avhR5GXKOY7ThHfj+VVg2EQ==
X-Google-Smtp-Source: AFSGD/VhennyN9KxN41SYUJzjx3K/QUTs+pY2sx+LzSelwt/vTxOzYDVXHwuvfrIUvvYG210PyKtrvM3wRPb3I+xzcE=
X-Received: by 2002:a2e:5d12:: with SMTP id
	r18-v6mr15467141ljb.89.1545255670234; 
	Wed, 19 Dec 2018 13:41:10 -0800 (PST)
MIME-Version: 1.0
References: <20181219175040.10507-1-damien.riegel@gmail.com>
In-Reply-To: <20181219175040.10507-1-damien.riegel@gmail.com>
From: Matt Madison <matt@madison.systems>
Date: Wed, 19 Dec 2018 13:40:58 -0800
Message-ID: <CAGgRHJr+obHJrRNFCDsPJN18w0-dtQsxAa_+Kk2KBMppDSycoA@mail.gmail.com>
To: Damien Riegel <damien.riegel@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] [RFC] go.bbclass: install dependencies under $GOPATH instead of $GOROOT
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
X-List-Received-Date: Wed, 19 Dec 2018 21:41:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 19, 2018 at 9:51 AM Damien Riegel <damien.riegel@gmail.com> wrote:
>
> To package a go application in Yocto, one needs to also package its
> dependencies to keep the build reproducible and under control. The
> default install task of the go class puts the source in ${libdir}/go/src.
>
> ${libdir}/go/src is where the standard go packages resides, aka $GOROOT.
> When a go package has dependencies on other go packages, they must be
> located under $GOPATH, otherwise errors like this one may happen:
>
>   Non-standard package <packagename> in standard package <packagename>
>
> This point of this patch is to trigger a discussion on how this issue
> can be tackled in Yocto. Following code is working but should not be
> considered for inclusion.

Can you describe the context of this a bit more?  The way go.bbclass
is set up, all of your recipe's dependencies (and their dependencies)
should already have been installed in the per-recipe sysroot (where
GOROOT lives for the current recipe's build), and should get resolved
from there. GOPATH gets set to ${B} for the current recipe's build.
Nothing in the GOROOT should be importing packages that reside in
GOPATH, which is what that particular error message is indicating. If
you're getting that error, then there might be something wrong with
recipe dependencies.

-Matt
>
> Signed-off-by: Damien Riegel <damien.riegel@gmail.com>
> ---
>  meta/classes/go.bbclass | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
>
> diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
> index 167d02e3fa..c0ed3211cd 100644
> --- a/meta/classes/go.bbclass
> +++ b/meta/classes/go.bbclass
> @@ -111,9 +111,9 @@ do_compile_ptest_base() {
>  do_compile_ptest_base[dirs] =+ "${GOTMPDIR}"
>
>  go_do_install() {
> -       install -d ${D}${libdir}/go/src/${GO_IMPORT}
> +       install -d ${D}/gopath/src/${GO_IMPORT} ${D}${libdir}/go
>         tar -C ${S}/src/${GO_IMPORT} -cf - --exclude-vcs --exclude '*.test' --exclude 'testdata' . | \
> -               tar -C ${D}${libdir}/go/src/${GO_IMPORT} --no-same-owner -xf -
> +               tar -C ${D}/gopath/src/${GO_IMPORT} --no-same-owner -xf -
>         tar -C ${B} -cf - pkg | tar -C ${D}${libdir}/go --no-same-owner -xf -
>
>         if [ -n "`ls ${B}/${GO_BUILD_BINDIR}/`" ]; then
> @@ -172,9 +172,21 @@ do_install_ptest_base() {
>         chown -R root:root ${D}${PTEST_PATH}
>  }
>
> +do_fixupdeps() {
> +       gopath="${WORKDIR}/recipe-sysroot/gopath"
> +       if [ -d ${gopath} ]; then
> +               tar -C ${gopath} -cf - src | tar -C ${B} --no-same-owner -k -xf -
> +       else
> +               echo "no dependencies to fixup"
> +       fi
> +}
> +
>  EXPORT_FUNCTIONS do_unpack do_configure do_compile do_install
>
> -FILES_${PN}-dev = "${libdir}/go/src"
> +addtask do_fixupdeps after do_configure before do_compile
> +
> +SYSROOT_DIRS_append = "/gopath"
> +FILES_${PN}-dev = "/gopath/src"
>  FILES_${PN}-staticdev = "${libdir}/go/pkg"
>
>  INSANE_SKIP_${PN} += "ldflags"
> --
> 2.19.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

