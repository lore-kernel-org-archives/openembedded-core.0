Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TEL0v-0001Z9-7v
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 16:12:29 +0200
Received: by eekb57 with SMTP id b57so381003eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2012 06:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=AvkbVspYesDU9IMmQLWvbnEVp7kcHSq1BLMyDo1I5Yw=;
	b=ucSMz9YUVHt6Juu3v272sxFOAhH3WVRhvjooRLE7a8tGbpDdV4JYug9q2RbctBb6et
	mFRbhJvmur7uoqNvXkOdiSgw+fyB+72NKqkV9Cu3u/6zdKCjFgzxmUM/c4HxbYhfMuj+
	/W+bE12iYMmq2G6tC1pn5Sl9/laN+oBhjDKVZTwxb9qOi5yj2vOWKqaBZBo/VqTsci7n
	rERaaEzY6MHW6Bj12B5G+jbWWuiuZZdiS11U4zfXG419QT+nnJpyjIjLu6cS+dtjWT/m
	9XrLSbI5bTD63pJ7BaOuZopT2UJHxl9VdEAg2A3J/FiJaatJHmvNLvDMUxZ9t/o44fWA
	3uHQ==
Received: by 10.14.173.131 with SMTP id v3mr3638396eel.15.1348061481986; Wed,
	19 Sep 2012 06:31:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Wed, 19 Sep 2012 06:30:51 -0700 (PDT)
In-Reply-To: <5ad9edce72b7300237251048d1cddc22259d496f.1348052899.git.laurentiu.palcu@intel.com>
References: <cover.1348052899.git.laurentiu.palcu@intel.com>
	<5ad9edce72b7300237251048d1cddc22259d496f.1348052899.git.laurentiu.palcu@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Sep 2012 06:30:51 -0700
Message-ID: <CAMKF1soHduPtpm5rP8PGDUZVU=p9rV0FbJYtQsTbvOQA38sWSA@mail.gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC 5/7] gdk-pixbuf: generate the pixbuf loader's cache ar rootfs time
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
X-List-Received-Date: Wed, 19 Sep 2012 14:12:29 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 19, 2012 at 4:49 AM, Laurentiu Palcu
<laurentiu.palcu@intel.com> wrote:
> This will generate the loaders.cache file for pixbuf, at rootfs time.
>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> ---
>  meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb |   24 ++++++++++++--------
>  1 file changed, 14 insertions(+), 10 deletions(-)
>
> diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
> index 99f6cb4..c4afb97 100644
> --- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
> +++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
> @@ -57,18 +57,22 @@ FILES_${PN}-dbg += " \
>
>  postinst_pixbufloader () {
>  if [ "x$D" != "x" ]; then
> -    exit 1
> +# Update the target's pixbuf loader's cache. Since the native binary will
> +# throw an error if the shared objects do not belong to the same ELF class,
> +# we trick the gdk-pixbuf-query-loaders into scanning the native shared
> +# objects and then we remove the NATIVE_ROOT prefix from the paths in
> +# loaders.cache.
> +gdk-pixbuf-query-loaders $(find $D/${libdir}/gdk-pixbuf-2.0/2.10.0/loaders \
> +        -name *.so | sed -e "s:$D:$NATIVE_ROOT:g") > \
> +        $D/${libdir}/gdk-pixbuf-2.0/2.10.0/loaders.cache || exit 1
> +
> +sed -i -e "s:$NATIVE_ROOT:/:g" $D/${libdir}/gdk-pixbuf-2.0/2.10.0/loaders.cache
> +



gdk-pixbuf-2.0/2.10.0 seems to be quite hardcoded. Can it be converted
into something more general may be use wildcard appropriately ?

> +exit 0
>  fi
>
> -GDK_PIXBUF_MODULEDIR=${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders gdk-pixbuf-query-loaders --update-cache
> -
> -if [ -x ${bindir}/gtk-update-icon-cache ] && [ -d ${datadir}/icons ]; then
> -    for icondir in /usr/share/icons/*; do
> -        if [ -d ${icondir} ]; then
> -            gtk-update-icon-cache -t -q ${icondir}
> -        fi
> -    done
> -fi
> +# Update the pixbuf loaders in case they haven't been registered yet
> +GDK_PIXBUF_MODULEDIR=${libdir}/gdk-pixbuf-2.0/2.10.0/loaders gdk-pixbuf-query-loaders --update-cache
>  }
>
>  PACKAGES_DYNAMIC += "gdk-pixbuf-loader-*"
> --
> 1.7.9.5
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


