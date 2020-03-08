Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id B4C7460661
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Mar 2020 04:18:11 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id l20so3094482qtp.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Mar 2020 20:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=H1AT20trm/lGZlYKtvfOp+uM1WGXbZkLwO59YMJUrZA=;
	b=b/6++QJ9xER2jWbR5EaLdpggMbEkjoLaiR9fs5yYjRf0yJ6C0uGALB+NKIo6tK57Ic
	uhR36vqERZdKX06pnCdvPU+dVutDvWDrNamssAxu6TwFImBmlByGHWlxkj/k0U0zrQTx
	2sVBq/9jnaVNg4u81/Es4LPoyxjQXtO+OF9k558Qqlte62ZwpKCOUcNG0GnSmhdKLE+o
	usCk9t6HJ+WmEDeabmIJFC8i5w+OlwJeE4aRPd9TJ1Nv6agAGPRVyeRI33gpOYi1Iumq
	eMdmd56AaCE8wD2VH4M9pvS2Tg40rinzLSEe0vofQ7c1TAPlvPpPolclf3fYb9Pxp4zF
	MwNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=H1AT20trm/lGZlYKtvfOp+uM1WGXbZkLwO59YMJUrZA=;
	b=WZAWR66uxdqoGhK5HG3rQR03BRxo/z/6X3Bom1qGvDXYCw9K6uBExhxesxqZFM1TAD
	52vU/Nju2E69g3aG/rpGQY9FaY3u6esBMB4SpQEXq3f5jaMGzOuRQ40am1KAI9aO4X9H
	p4mrWCwRI/cPlaJmhKKAa0nxUzJt5e38v9+YADyrTipzNytgeRdpJisJJh4KJcYDBx7Q
	PRQ+Haj0YYYT+YHwljL3Ty0ORigIUWlwUcByWFIOWtUZhC3Y8yT1Iw5Pd7RzjCzClfgY
	9dFjM2RSuGKl7HwaeTmzRblKMyQbG/lpRDst+fb0gLLwLH8MSh4z+afNe85tmFaRD755
	85yg==
X-Gm-Message-State: ANhLgQ2EiFCyRGixtzUnrbU3a8//Nq31fltUgK7zumFiMNezVO09jcDm
	+9qLRfIvEdQ7vZJAv1wlruhMbOjAUP/FLAwPAmu+tLFt
X-Google-Smtp-Source: ADFU+vsQ1SW9q82YuTFd1ET6eZWo5GjbNNr/HjiHea3Rn9l3BOROgpT5aGdKKXDQHQKz5J2S8bZzJRzYaTtTJdgP/b0=
X-Received: by 2002:ac8:3003:: with SMTP id f3mr3510856qte.293.1583641092342; 
	Sat, 07 Mar 2020 20:18:12 -0800 (PST)
MIME-Version: 1.0
References: <20200307223748.1178851-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20200307223748.1178851-1-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 7 Mar 2020 20:17:44 -0800
Message-ID: <CAMKF1spC7POwDTKYGVuAZdZDfYDfeGMz6qRsq4hB3hY-F1aN6Q@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] glibc: Explicitly disable msgfmt
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
X-List-Received-Date: Sun, 08 Mar 2020 04:18:11 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Mar 7, 2020 at 2:37 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> If configure is rerun it finds msgfmt from gettext-native which is installed
> during package_write_ipk|deb and means builds are not determinisic.
>
> Whether msgfmt is needed is debatable (libc.mo files arne't generated without
> it) however we should at least be consistent which this patch ensures.
>

I think we could turn it into a packageconfig and add depending on
gettext-native
in knob,  keep the knob disabled by default. While dont think
translation files will
be commonly installed on systems OE targets but its seems limiting if we simply
disable it.

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-core/glibc/glibc.inc | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
> index 58d2ba7bc44..23a6ca99ae0 100644
> --- a/meta/recipes-core/glibc/glibc.inc
> +++ b/meta/recipes-core/glibc/glibc.inc
> @@ -9,8 +9,11 @@ inherit autotools texinfo features_check systemd
>
>  LEAD_SONAME = "libc.so"
>
> +# msgfmt could come from gettext-native but we don't depend on that and
> +# disable for reproducibility
>  CACHED_CONFIGUREVARS += " \
>    ac_cv_path_BASH_SHELL=${base_bindir}/bash \
> +  ac_cv_prog_MSGFMT= \
>    libc_cv_slibdir=${base_libdir} \
>    libc_cv_rootsbindir=${base_sbindir} \
>    libc_cv_localedir=${localedir} \
> --
> 2.25.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

