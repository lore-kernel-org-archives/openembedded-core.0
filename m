Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f42.google.com (mail-yh0-f42.google.com
	[209.85.213.42])
	by mail.openembedded.org (Postfix) with ESMTP id A1E9062252
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 19:44:18 +0000 (UTC)
Received: by mail-yh0-f42.google.com with SMTP id a41so4653117yho.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Aug 2014 12:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=iTyWBDPiEFrCE9+RU1orMEj6xGRnPuFGc9Etwy7ebgA=;
	b=BrB65/v2jIe/VrbHqRjw89yccaQmzrf6+2fAoAlo+9ABil69Qfyd6I3QDmJ4ZMGdxE
	ak8kHJ9EFuvdMQOn2IRx4TYAWYh65tdQHlDKYRAfs6xDeh6TiGWuBS2xApW/qLFXsbdA
	gMxpqA6+op6sfCiDvkJSRx6YL8kwOmOP78bY9I0+2mOKTNukciOFPKMbOyAOTUUI8Ayb
	uZgCS2T6BE69FhFoABQPcxR+F0+CEjJuX0RpMw5UkAA7x2ZCcO3h275AjL7LknsOGDgc
	bSsjruoVpZDiyBHL5tvEePYV1eKbQ3ybKXnSRyIahrxXI6FVowobixsZzfG4vRddnR8Z
	RupQ==
MIME-Version: 1.0
X-Received: by 10.236.162.7 with SMTP id x7mr40152355yhk.6.1407181459641; Mon,
	04 Aug 2014 12:44:19 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.56.201 with HTTP; Mon, 4 Aug 2014 12:44:19 -0700 (PDT)
In-Reply-To: <17ffe840a21d09f0dcb1cdfeb13d9d21331055f9.1407177403.git.ben.shelton@ni.com>
References: <cover.1407177403.git.ben.shelton@ni.com>
	<17ffe840a21d09f0dcb1cdfeb13d9d21331055f9.1407177403.git.ben.shelton@ni.com>
Date: Mon, 4 Aug 2014 16:44:19 -0300
X-Google-Sender-Auth: 0WZB8TX-Mq8OwVV7CWnRAGlNw5k
Message-ID: <CAP9ODKqkaSZde6TuXw=VdverfKWP-o03=5VmLgfRNUias50gxg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Ben Shelton <ben.shelton@ni.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 10/20] udev-cache: parametrize sysconf file paths
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
X-List-Received-Date: Mon, 04 Aug 2014 19:44:27 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 4, 2014 at 3:41 PM, Ben Shelton <ben.shelton@ni.com> wrote:
> From: Richard Tollerton <rich.tollerton@ni.com>
>
> The udev-cache facility uses files that represent system states, to
> ensure that the cache tarball is valid to apply. These paths were
> hardcoded in several places; collect them into DEVCACHE_SYSCONF and
> DEVCACHE_CURRENT_SYSCONF in the defaults file.
>
> Natinst-Rally-ID: TA44427
> Acked-by: Gratian Crisan <gratian.crisan@ni.com>
> Natinst-ReviewBoard-ID: 58620
> Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
> ---
...
> --- a/meta/recipes-core/udev/udev/udev-cache
> +++ b/meta/recipes-core/udev/udev/udev-cache
> @@ -23,12 +23,12 @@ if [ "$ROOTFS_READ_ONLY" = "yes" ]; then
>      exit 0
>  fi
>
> -if [ "$DEVCACHE" != "" -a -e /dev/shm/udev.cache ]; then
> +if [ "$DEVCACHE" != "" -a -e "$DEVCACHE_CURRENT_SYSCONF" ]; then
>         [ "${VERBOSE}" != "no" ] && echo "Populating dev cache"
>         (
>                 tar czf "${DEVCACHE}.tmp" dev -C / --exclude=log
>                 mv -f "${DEVCACHE}.tmp" "$DEVCACHE"
> -               mv /dev/shm/udev.cache /etc/udev/cache.data
> +               mv "$DEVCACHE_CURRENT_SYSCONF" "$DEVCACHE_SYSCONF"
>         ) &
>  fi
>
> diff --git a/meta/recipes-core/udev/udev/udev-cache.default b/meta/recipes-core/udev/udev/udev-cache.default
> index 656c2a4..7f39a68 100644
> --- a/meta/recipes-core/udev/udev/udev-cache.default
> +++ b/meta/recipes-core/udev/udev/udev-cache.default
> @@ -2,4 +2,8 @@
>
>  # Comment this out to disable device cache
>  DEVCACHE="/etc/udev-cache.tar.gz"
> +
> +DEVCACHE_SYSCONF="/etc/udev/cache.data"
> +DEVCACHE_CURRENT_SYSCONF="/dev/shm/udev.cache"
> +
>  PROBE_PLATFORM_BUS="yes"
> --

Most users won't need to change this so I think this should have a
default value in the script and don't be added in the default.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

