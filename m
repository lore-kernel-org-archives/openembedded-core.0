Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5B82F753DE
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Oct 2018 01:06:04 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id l41-v6so3186009qtl.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Oct 2018 18:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=TsfGBoc6DtMjbIRXirGqr9MA3wJPnq+nhUyzkcA3G4Y=;
	b=uNiiPZ5HYq1cSkPIn3TnONKjxdhTMTh8M6eiEKw1tGazNYHOoUSgd5onZPP996UrdS
	67Pu9JFE6+4oBjA5LkobtxqchAkck790Xdl+cSeI68/OJrQ9AyUb7hY6T6HdAz0qKXn+
	w2qc4SDCWArhpd2pJaZVf7ZJoHNGPFMfxfQHtPDBo7zSM97VoS420LE0F3bUwtly+SNU
	DsZcGSWsVUBq9CZY3ICXrzNNEoGn9by1pd6LZH39NpTyywmMQjkg3hArNf84ACNiC5f7
	kuixLomxjdLa+KZ/iBN8sLdbx8U0Oc4NqCBVmND0R/lnI25h5f3tDGkIt1qPkaUzohND
	fxmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=TsfGBoc6DtMjbIRXirGqr9MA3wJPnq+nhUyzkcA3G4Y=;
	b=bX7t6IiieDOja6btFWb0ls5FLD/rIPdP8yy41AZi3Sy5xvc9zvXQPR3TF3BGJKDwPO
	0lXYVd+OvaVvLm7TqpjEoPWkA66/e5dZ0eOuTtLbpFr7RpFnmmgLjha0zSQQsLjpyAHe
	WVTJsdB51mFIcLKTpadRypQWDPkAyNdm2vDpBcUg/VCAclyS1cYLjr7YMbTT3t6MNLOq
	022wqagVESGge7UbpKzyWmYgQb2479u8p5n+cqq3nR6V17NTcJ1WlSXG/gIpIEsugbkh
	MShwJXS/CRmLIXGKlz8PDB698cndMSKagHcfFZUukJ0/3K8TsUwZItRuY8r7KFg4mvJg
	M2hg==
X-Gm-Message-State: ABuFfoiYCtWSM2/xSG6H8n9UpbaW/NnWzpIZP/a0KWUWtnxV/sEpkDKf
	08FC9DerzJN1xzZopsXp0RuYcIv9fKjeiml3WCQ=
X-Google-Smtp-Source: ACcGV620QHnAC8mpsAWQWrQUWRJBqfjyMR4ofhELSGD3+BGeWBPvWELo4JtXbBf1qF5PyfmPDeOyxdQSVvVz+4y2LV8=
X-Received: by 2002:a0c:d585:: with SMTP id
	g5-v6mr11611739qvi.50.1538787965039; 
	Fri, 05 Oct 2018 18:06:05 -0700 (PDT)
MIME-Version: 1.0
References: <20181005143808.13457-1-achille.fouilleul@gadz.org>
In-Reply-To: <20181005143808.13457-1-achille.fouilleul@gadz.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 5 Oct 2018 18:05:38 -0700
Message-ID: <CAMKF1sou=YKSAnXKVe16YhVA7aD1U1rYy8CrbNQ26VTojT-TvQ@mail.gmail.com>
To: achille.fouilleul@gadz.org
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] binutils: fix symlinks
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
X-List-Received-Date: Sat, 06 Oct 2018 01:06:04 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 5, 2018 at 7:38 AM Achille Fouilleul
<achille.fouilleul@gadz.org> wrote:
>
> For nativesdk, symlinks created by do_install contain ${SDKPATHNATIVE}.
>
> This is a problem with SDKs that include nativesdk-binutils and nativesdk-gcc.
> When extracting such an SDK dangling symlinks are created, because
> relocate_sdk.py does not adjust symlinks. As a result gcc ends up calling the
> host binutils.
>
> Use the os.path.relpath function to obtain shorter relative paths, which do not
> contain ${SDKPATHNATIVE}.
>

this seems to make sense, LGTM we need to test it out for other
classtypes though

> Signed-off-by: Achille Fouilleul <achille.fouilleul@gadz.org>
> ---
>  meta/recipes-devtools/binutils/binutils.inc | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
> index 37813dd864..8af48e735b 100644
> --- a/meta/recipes-devtools/binutils/binutils.inc
> +++ b/meta/recipes-devtools/binutils/binutils.inc
> @@ -128,12 +128,12 @@ do_install () {
>         # We don't really need these, so we'll remove them...
>         rm -rf ${D}${libdir}/ldscripts
>
> +       bindir_rel=${@os.path.relpath('${bindir}', '${prefix}/${TARGET_SYS}/bin')}
> +
>         # Fix the /usr/${TARGET_SYS}/bin/* links
>         for l in ${D}${prefix}/${TARGET_SYS}/bin/*; do
>                 rm -f $l
> -               ln -sf `echo ${prefix}/${TARGET_SYS}/bin \
> -                       | tr -s / \
> -                       | sed -e 's,^/,,' -e 's,[^/]*,..,g'`${bindir}/${TARGET_PREFIX}`basename $l` $l
> +               ln -sf $bindir_rel/${TARGET_PREFIX}`basename $l` $l
>         done
>
>         # Install the libiberty header
> --
> 2.18.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

