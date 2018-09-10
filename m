Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id ABC09797B6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 16:19:07 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id t5-v6so24839402qtn.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 09:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=O84kfHyFoOm+O4KFbwniWc6SOrkOjJ1kKlV5rPjL1OQ=;
	b=ZtNgbegwfTpdK/eT6prIDQffeZW4/e/oJcVYom4y14vjCRHftVji9bM3pPJTriXsYR
	XvZL8moGoLhsqzP5kJjbj66nnBRrco+mSeNez0pyMPBAeX2FzXc0fd+B0QiGGrCHqRLb
	6iK9miuSx45KOeqQ6rk6r+19z5hMRIkF8PNQj6Uh++kIRTcPq1PVvSRvbk6fwkxX0BcX
	rrTeObuvSxICRS5gKq2YJJFDhS4acGbbVqsV8BP/FoeNzSosGcFK1bQyyJzH5+1FPQSn
	0lgA8G/lQfN1xhRMm36PGCatxQnuiBUB7eiwGpWxcCTfMxvAKRi5pIxRy0/DfeFI4zFB
	9lIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=O84kfHyFoOm+O4KFbwniWc6SOrkOjJ1kKlV5rPjL1OQ=;
	b=LAsk3eryj5ZW+QwbP0OOW1cCVTqJPJ6L6AooTsueKlcHoxzT9X/u3LTjmzNIZwvSfD
	SafDg1Px3CpouBrD0y6JbP4qV9nreak0j/y9vix+u8STImoE3FMWWhhS500/iBz5vb/D
	5YgRumb0TykviDHB1RkL8fyZYv8UtTym9Yc9Z+A8DEqMT3j7jcUjtcI9Ar+dtG4r1E1J
	U/loxmut04i1m9YNgd74eEgIZMuUQxRszzOA/B2lJKKr+xGIAIjR7HtKEShbOn4JnKlc
	PVOqZF8RhtVctbsKCgk961w1dHabrVm9z2T+bKdAcJa67rNSlK9RoWnFU5c3cSojgVX/
	Uj2w==
X-Gm-Message-State: APzg51BH/YTvdudKPV1DJYxDmlNMSH4+6YF6Sm5R2ovgS0qpJNmlyhKW
	k3/qAzI7nUcHc+/bsTJXJCoILNua9UG7MaCX/NI=
X-Google-Smtp-Source: ANB0VdZRSMFouAclZzbpSVahnHBUsloR+DOhJ8kOwfI0IaJUcWRGwa4iZi9Wm8N9jW1X3ciEYyn9PxNKuWlR+XyujLo=
X-Received: by 2002:ac8:758d:: with SMTP id
	s13-v6mr16984379qtq.161.1536596348418; 
	Mon, 10 Sep 2018 09:19:08 -0700 (PDT)
MIME-Version: 1.0
References: <20180910124238.20745-1-nathan@nathanrossi.com>
In-Reply-To: <20180910124238.20745-1-nathan@nathanrossi.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 10 Sep 2018 09:18:42 -0700
Message-ID: <CAMKF1sqRh69ZgpqRLu6zpgaQWeS0+sdLvxZQxupEikONSvgKhQ@mail.gmail.com>
To: Nathan Rossi <nathan@nathanrossi.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libgloss_3.0.0.bb: Fix up mv pattern to include libnosys
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
X-List-Received-Date: Mon, 10 Sep 2018 16:19:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 10, 2018 at 5:43 AM Nathan Rossi <nathan@nathanrossi.com> wrote:
>
> When installing libgloss libraries handle the ${TARGET_SYS}/lib contents
> so that it is placed in ${libdir} instead of ${libdir}/lib. This
> resolves a packaging QA issue.
>
>   ERROR: libgloss-3.0.0-r0 do_package: QA Issue: libgloss:
>   Files/directories were installed but not shipped in any package:
>     /usr/lib/lib
>     /usr/lib/lib/libnosys.a
>     /usr/lib/lib/nosys.specs
>   Please set FILES such that these items are packaged. Alternatively
>   if they are unneeded, avoid installing them or delete them within
>   do_install.
>   libgloss: 3 installed and not shipped files. [installed-vs-shipped]
>
> Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
> ---
>  meta/recipes-core/newlib/libgloss_3.0.0.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/newlib/libgloss_3.0.0.bb b/meta/recipes-core/newlib/libgloss_3.0.0.bb
> index 664a922815..727062ca5d 100644
> --- a/meta/recipes-core/newlib/libgloss_3.0.0.bb
> +++ b/meta/recipes-core/newlib/libgloss_3.0.0.bb
> @@ -18,9 +18,10 @@ do_install_prepend() {
>
>  do_install_append() {
>         # Move libs to default directories so they can be picked up later
> -       mv -v ${D}${prefix}/${TARGET_SYS}/lib ${D}${libdir}
> +       mv -v ${D}${prefix}/${TARGET_SYS}/lib/* ${D}${libdir}

seems to some indentation problem, please check.

>
>         # Remove original directory
> +       rmdir ${D}${prefix}/${TARGET_SYS}/lib

maybe just use -p option above and remove the statement below

>         rmdir ${D}${prefix}/${TARGET_SYS}
>  }
>
> ---
> 2.18.0
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

