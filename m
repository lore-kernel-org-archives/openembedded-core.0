Received: from mail-ie0-f174.google.com ([209.85.223.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UCbuZ-0004kw-Cg
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Mar 2013 21:23:03 +0100
Received: by mail-ie0-f174.google.com with SMTP id k10so6566632iea.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Mar 2013 12:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=MkR734Tp/5JiMuanfLTUq1GG7hUIfR8iojdOSy76djE=;
	b=c+1ld1iZ8W/Md0Ny72QZnjH47QKsi32wcMzPzsg6f1EwflE8k9B4JecMuHiWvFH72w
	GVyQVh46syMB0NT2rUsQMghoKe06Kz/6YhRgocCWFP5OTW3mbXtB+ezqCjjRy4eJEdSJ
	BnLxMNRD4Uf6dhzePWc88T/xkaUlLfcTXmdwaIgcfHaUHju8B7mTDtmaYoZLYwljZL/O
	YODOAFso/Byi8ZHggMRafUGeMd5Ln4O0//AentZGk/+09P7LNHFru6iGl0Py1ZFmw7AI
	qDI/C5HXuvvjHZPyK6UTZAXEEAbe8UVKSfM6yhgyU5/O0gXPrLgN50xw4z09AIFMB9zq
	GAog==
X-Received: by 10.50.12.193 with SMTP id a1mr3698154igc.24.1362427594845; Mon,
	04 Mar 2013 12:06:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.74.163 with HTTP; Mon, 4 Mar 2013 12:06:04 -0800 (PST)
In-Reply-To: <1362330269.4325.28.camel@ted>
References: <ly628a8z00.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAMKF1sp7G1S-B5N-HR-2P_PEhkmeJnjDtskRe6EcubxiHah=nQ@mail.gmail.com>
	<1362330269.4325.28.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 4 Mar 2013 12:06:04 -0800
Message-ID: <CAMKF1sqdJCLdnpr4WrWzQ44yUrpe+bxtjrm+oZrm0H0NxeXhOw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libgcc: Mark libgcc_s as executable to ensure its stripped
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Mar 2013 20:23:04 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Mar 3, 2013 at 9:04 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> libgcc_s is not marked as executable and hence it doesn't get stripped. This
> means its about 1MB larger than it needs to be. There is no good reason it
> shouldn't get stripped so ensure it does and mark as executable.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/recipes-devtools/gcc/libgcc_4.7.bb b/meta/recipes-devtools/gcc/libgcc_4.7.bb
> index 47669a2..6a0931f 100644
> --- a/meta/recipes-devtools/gcc/libgcc_4.7.bb
> +++ b/meta/recipes-devtools/gcc/libgcc_4.7.bb
> @@ -57,6 +57,9 @@ do_install () {
>         # install the runtime in /usr/lib/ not in /usr/lib/gcc on target
>         # so that cross-gcc can find it in the sysroot
>
> +       # Ensure libs are executable else they aren't stripped
> +       chmod a+x ${D}/${base_libdir}/*
> +

hmmm, while this solves the issue I think better fix would for
stripper to know that its a shared object
and can be stripped. Marking libraries with exe (except ld.so which
can execute on its own) seems not
right to me.


>         mv ${D}${libdir}/gcc/* ${D}${libdir}
>         rm -rf ${D}${libdir}/gcc/
>         # unwind.h is installed here which is shipped in gcc-cross
>
>


