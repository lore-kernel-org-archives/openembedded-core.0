Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4E0C360720
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 16:51:35 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id n7so8289964qtb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 09:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Wu5XB2cJXsFtnZwjNyBDFj5jghiW6w7bw/PEvZQk5V0=;
	b=FacNj2Mg7IZLyZY3KFu6opYQDdxlNSOd3zmiw0zSDO+OTdQy20rBocUw2WaavfC+4i
	iiQEveg67h3kiiHldjOBnDMddH03wASxRpawq/QzFCO6A+C4KSqGbC2rKrJr9HHxdWWC
	7FkOBr2uqkzSQKE2lDRcGZ8ZuWwdN/YpTjZMg5XK3i13H3GBz00ihvbAfLyV4I9N5hIP
	RlaFAT9oAF7CvAizqXjFGeOOHveyUZb0PhVN9zPLyWtih0m9t/DSlD+JJutGq7mUiKCo
	Jh3fVQiV4AFM9DjSykUruSfwyeZtfPS4nNqKDc8xRhVlHxiTna7JVece+e2R7fWj+tB7
	YE7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Wu5XB2cJXsFtnZwjNyBDFj5jghiW6w7bw/PEvZQk5V0=;
	b=dt+ZmS4f3ANfz9IwG/Ytx4MuDdxqeiJ/56ou6JDJC5YyFtJFAUoyKpZDi7MuGosrB3
	FC7JibIXIa89tTntTDuM0AgalVdR9vFgLOCI4BzBHKd+SgvkN/C3peV7Tc3Gq8h3USO2
	wL0z8EPLR0XvUYRih15IWDAcxn0mPIsXjCt4DOmAYqOwuXdkdG894UK2dFZ9+UCzkp6M
	Q4fz/8foWgsMJiWuLaaRqbH7WH4BgiOBn7I/KslPDUwfzDth+MMkzxdqkX7f8f2MwitV
	eAMKqkkOLuTEjqoUGOb5VsLwdNN06eLb+jnkGEh/Gffc5daKN4OgMEr0O28SWQMOaPCs
	VlFg==
X-Gm-Message-State: APjAAAVt8nFVdDWkRj/HdMXl7aSNS10+6Ts4G6K92NQtAEbGVWHDrcFE
	7FUmXcpO1B9UvnHdfeghl1lhD5QDtXtNxqaMvX0=
X-Google-Smtp-Source: APXvYqx5lOJ8bJbF7Re4Mfbu7bNuyAjIYhwyIVcnCQNOawCW7pCSlVz4AYPVZ2IBZekKQ7kTrAtptQWDzePSD98/c84=
X-Received: by 2002:ac8:d4c:: with SMTP id r12mr16184917qti.88.1567183895925; 
	Fri, 30 Aug 2019 09:51:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190830155354.18038-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20190830155354.18038-1-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 30 Aug 2019 09:51:10 -0700
Message-ID: <CAMKF1sq8F5yc6G7i2L7+3aBLHeuumT_c-DFs=7EBzTvfe1iPNA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-cross: Clean up fixed-includes
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
X-List-Received-Date: Fri, 30 Aug 2019 16:51:35 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 30, 2019 at 8:54 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> We had interesting failures where building gcc-cross-powerpc with 5.0 kernel
> headers, then building eudev after moving to 5.2 headers failed.
>
> gcc-cross doesn't rebuild when linux-libc-headers changes due to its
> listing in SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS. This shouldn't matter but
> fixincludes as adding asm-generic/socket.h to its filtered list which
> was then replacing the real header with an older version. This mismatch
> lead to build failures.
>
> We trust the Linux kernel headers to be ANSI safe so lets just clear out
> any headers and trust the originals to be correct.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-devtools/gcc/gcc-cross.inc | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
> index 6222c2e8c91..e417b898734 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross.inc
> +++ b/meta/recipes-devtools/gcc/gcc-cross.inc
> @@ -196,6 +196,8 @@ do_install () {
>         # We use libiberty from binutils
>         find ${D}${exec_prefix}/lib -name libiberty.a | xargs rm -f
>         find ${D}${exec_prefix}/lib -name libiberty.h | xargs rm -f
> +
> +       find ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include-fixed -type f -not -name "README" -not -name limits.h -not -name syslimits.h | xargs rm -f

Whats different for limits.h and syslimits.h as compared to standard
headers from libc, Maybe we should just get that sorted as well while
here


>  }
>
>  do_package[noexec] = "1"
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

