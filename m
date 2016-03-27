Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id DDCC4605BB
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Mar 2016 06:42:56 +0000 (UTC)
Received: by mail-qg0-f47.google.com with SMTP id c67so54180029qgc.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Mar 2016 23:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SACSRQ+zPSpV5BjZopchnXF+5T6RQjuBjaMwEQwkmm4=;
	b=CbsMyYi29DzWRLosUBvMGVWpgGcIGGKQ+RgbSDluDZFuhWdx5wLNOm4htlGEGbA+B5
	dycFObuDC3xa5oZ8JIeClyuL1pURKak1uAZyHzRaAwYroJj9G0L9qHFBU7ET6YmsN1TN
	EoRj5xrwKVgghLcU80hSa49opahTZUr5h1ogfgtwW2ifxcMn9PP0JXZCYORpcZPedv/2
	le/jzG9Luwk57pMep+llApgSxSrsgq7jYIuOMZAuu1TMpWK7Ge/2dDxnOdMhZvye1eCr
	eW5ut+vp0lc1L8GTduLwPxak7Vx3OlNj9plkIJKlpSsegz6aWJ+MLO1U38oAwoeuH7I6
	3nxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SACSRQ+zPSpV5BjZopchnXF+5T6RQjuBjaMwEQwkmm4=;
	b=g6qCzr3mPS7KqsOFfVkHFM2SxtQkBjdSA3/641RWyBGENDy+9CyElcRrJkikUcB4SO
	fdmLyTWycCAJJ2wp/bq3O1RZYmTqr1D1yZowNMK31ngp+TXg/txw+sEXsb20R/aEmFju
	z0XCoM/uEGhDIPgpuGsoV8ROWzo3kq2MW+fRIAPO6xHbBMGBo20HklqE67ZVg1lkDw70
	GvCie9awau5vP1cdycOqcHkn4cNL8gQXx037y8e6yrnq3Vl+AweFinpqgIPPhO7qqGpC
	mold8SHQ+Glxv0mXZlyCeKIupNrTx6N09F8AyzBSrsQV5MEjm7ieZbdBcFd0dmtsXw0h
	x0IQ==
X-Gm-Message-State: AD7BkJLTp4PsdYM9Q0jWcEwDIpL7HjuYMPhOg0WCA6QE35hRVE2SvoRw07QF1+ynLVOpSf6EKLam0UDEQvivCA==
X-Received: by 10.140.172.212 with SMTP id s203mr28445974qhs.41.1459060976978; 
	Sat, 26 Mar 2016 23:42:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Sat, 26 Mar 2016 23:42:27 -0700 (PDT)
In-Reply-To: <1459039503-5526-1-git-send-email-net147@gmail.com>
References: <1459039503-5526-1-git-send-email-net147@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 26 Mar 2016 23:42:27 -0700
Message-ID: <CAMKF1sqV+PeZZvH1Am-MEs-f3e4JtENPdX=ByDesatb3EGM76Q@mail.gmail.com>
To: Jonathan Liu <net147@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gdb-cross-canadian: disable conflicting PACKAGECONFIG variables
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
X-List-Received-Date: Sun, 27 Mar 2016 06:42:57 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Mar 26, 2016 at 5:45 PM, Jonathan Liu <net147@gmail.com> wrote:
> The PACKAGECONFIG variables in gdb-common.inc don't work correctly for
> the cross recipes so they need to be disabled.
>
> Python support was not being enabled because the python PACKAGECONFIG
> added --without-python to OE_EXTRACONF.
>
> The recipe depends on nativesdk-readline and the readline PACKAGECONFIG
> just adds an unnecessary extra dependency on readline. The
> --with-system-readline configure argument is explicitly added
> to EXTRA_OECONF to ensure we link to nativesdk-readline.
>
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>  meta/recipes-devtools/gdb/gdb-cross-canadian.inc | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
> index ae97759..952f28f 100644
> --- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
> +++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
> @@ -13,7 +13,12 @@ RDEPENDS_${PN} += "nativesdk-python-core nativesdk-python-lang nativesdk-python-
>
>  GDBPROPREFIX = "--program-prefix='${TARGET_PREFIX}'"
>
> -EXTRA_OECONF_append = " --with-python=${WORKDIR}/python"
> +EXTRA_OECONF += "--with-python=${WORKDIR}/python"

should this point to a valid python location ?

> +EXTRA_OECONF += "--with-system-readline"
> +
> +# Disable conflicting PACKAGECONFIG variables in gdb-common.inc
> +PACKAGECONFIG[python] = ""
> +PACKAGECONFIG[readline] = ""
>
>  SSTATE_DUPWHITELIST += "${STAGING_DATADIR}/gdb"
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

