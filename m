Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
	[209.85.217.65])
	by mail.openembedded.org (Postfix) with ESMTP id AB21861033
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2020 20:07:58 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id a2so268916vso.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2020 12:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2iTJ9QLw20m+1otGjByne+6Jy5EySt/gu9EehL2+4LE=;
	b=ebfGYtVpCbySHZ/LEuk+lHsMPZOtTeep5RhKQER7dkt4zmKJOWbNghKSKOs2XLAIbJ
	sQ/IUB5843nDT/cEvPCrskXqLsWGJ/s6t6Y9p+BLQ7mmopKLE5Zt3Mr4cfPoNVz6KpRn
	u9OR4IZIUvzlBF0RbgDv7kvFP4O5VIv58xCweH0LR9BNiSav21cn8hRK4vVtONc7rpGi
	IpUn7CAo/JGrbl+Huyl0a7CAq5NYiYpQ6ycTVOISah5LtsbFhSwcbpuZkz0mAFlmTQsB
	v+KlnPSZCvTRcZzx+hSJ+OdIs7Rg3HlGJlE72sUj+ST9HHObVII+irJ4j2ePP7IntJOV
	lj7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2iTJ9QLw20m+1otGjByne+6Jy5EySt/gu9EehL2+4LE=;
	b=f4KEt805wAEfjKmVWkz70Gio9FD2ErRsLEStF8YkBUNYsGEsxxtZ7Bewt6PncNTNk/
	qMO+DL0kXyA/rxcSsLUNr/ivQgleH6xrbN55biUmXJFhD/pjMdgWw16Wk7bRL4nI5fMC
	8HQPd+TDMBYRjXhgqDAJ8IjJVGD9nnPnIAcQxIc7v34H7wYxYImle7MJLouqyaqdTi5A
	zViMAnzR0N5Q31Bgi+PBJhjTe0d+3rC3q8VXd1ms7aSI30D7LA5q48OdBScHkzhZ8l+n
	OHWN2Xfs8BhslnyFl22/xC+69YVzzxue/cm+ALGJwpu4prNjsUxXk1NW13GBP6xozFM3
	6fMA==
X-Gm-Message-State: APjAAAXPL+UI4vjtygNTUOD/M77Ju/CkZwx6FP8TNDv1BDPsxyyUmDku
	k8nfR/fCH3OPYndpGN5xi10IjDoYzqp7khr/B20=
X-Google-Smtp-Source: APXvYqwz2qtJ0lUwOH0OPZRcD7qL8Y6JMkvyEE8X2aiQ2k3JCXsArrW9C1mJ5LXPJutW38D+Xv5PQnhuTl385uDLn0g=
X-Received: by 2002:a67:ee4e:: with SMTP id g14mr434577vsp.223.1582747679182; 
	Wed, 26 Feb 2020 12:07:59 -0800 (PST)
MIME-Version: 1.0
References: <20200225141733.54584-1-eugenyshcheglov@gmail.com>
In-Reply-To: <20200225141733.54584-1-eugenyshcheglov@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 26 Feb 2020 12:07:46 -0800
Message-ID: <CAJ86T=VH+nVRgdWr4hyX0WZVnGwu=4MOsSs7a_8QcqAYHt1nfA@mail.gmail.com>
To: Yevhenii Shchehlov <eugenyshcheglov@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] utils.bbclass: Avoid recursive symlink in oe_soinstall
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
X-List-Received-Date: Wed, 26 Feb 2020 20:07:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 25, 2020 at 6:17 AM Yevhenii Shchehlov
<eugenyshcheglov@gmail.com> wrote:
>
> This patch fixes an issue when oe_soinstall function creates
> non-functional recursive symlinks in case library soname is equal
> to library real (file) name.
>
> Signed-off-by: Yevhenii Shchehlov <eugenyshcheglov@gmail.com>
> ---
>  meta/classes/utils.bbclass | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
> index cd3d05709e..dea824f54f 100644
> --- a/meta/classes/utils.bbclass
> +++ b/meta/classes/utils.bbclass
> @@ -25,7 +25,7 @@ oe_soinstall() {
>         libname=`basename $1`
>         case "$libname" in
>             *.so)
> -               bbfatal "oe_soinstall: Shared library must haved versioned filename (e.g. libfoo.so.1.2.3)"
> +               bbfatal "oe_soinstall: Shared library must haved versioned filename (e.g. libfoo.so.1.2.3 instead of libfoo.so)"

This patch look OK but it might be nice to also clean up this error
message (and the Example comment a few lines above it) to drop the 3
levels of version number. There should only be 2, ie the fully
versioned filename would be libfoo.so.1.2 instead of libfoo.so.1.2.3

>                 ;;
>         esac
>         install -m 755 $1 $2/$libname
> @@ -33,8 +33,12 @@ oe_soinstall() {
>         if [ -z $sonamelink ]; then
>                 bbfatal "oe_soinstall: $libname is missing ELF tag 'SONAME'."
>         fi
> +       if [ "$sonamelink" == "$libname" ]; then
> +               bbwarn "oe_soinstall: $libname soname is equal to real (file) name. Minor version should be added to a real name (e.g. libfoo.so.1.2 instead of libfoo.so.1)"

It might be clearer to say:

"oe_soinstall: $libname soname is equal to fully versioned real (file)
name. The soname should include the major version only (e.g.
libfoo.so.1 instead of libfoo.so.1.2)"

> +       else
> +               ln -sf $libname $2/$sonamelink
> +       fi
>         solink=`echo $libname | sed -e 's/\.so\..*/.so/'`
> -       ln -sf $libname $2/$sonamelink
>         ln -sf $libname $2/$solink
>  }
>
> --
> 2.25.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

