Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.401.1590595606587244526
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2020 09:06:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id ED8EF40C06;
	Wed, 27 May 2020 16:06:45 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UI08OX-ya9Ie; Wed, 27 May 2020 16:06:45 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C47D740A18;
	Wed, 27 May 2020 16:06:43 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 8842E1731FF; Wed, 27 May 2020 12:06:43 -0400 (EDT)
Date: Wed, 27 May 2020 12:06:43 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: Re: [OE-core] [PATCH] make-mod-scripts: Fix a rare build race condition
Message-ID: <20200527160643.GL17660@denix.org>
References: <20200527160355.3169339-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200527160355.3169339-1-raj.khem@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 27, 2020 at 09:03:55AM -0700, Khem Raj wrote:
> There is a build break which often happens whem using 4.1 kernel
> 
> /bin/sh: 1: scripts/basic/fixdep: Permission denied
> scripts/Makefile.host:124: recipe for target 'scripts/dtc/srcpos.o' failed
> make[3]: *** [scripts/dtc/srcpos.o] Error 126
> 
> this patch sequences the build targets so it can work reliably with
> different kernel versions

Oh, I remember this failure from few years ago. Was it fixed upstream? Any 
specifics?


> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  .../make-mod-scripts/make-mod-scripts_1.0.bb               | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> index 0be1422a24..c7edb20ee4 100644
> --- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> +++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> @@ -23,7 +23,8 @@ EXTRA_OEMAKE = " HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="
>  #
>  do_configure() {
>  	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
> -	oe_runmake CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
> -	           -C ${STAGING_KERNEL_DIR} O=${STAGING_KERNEL_BUILDDIR} scripts prepare
> -
> +	for t in prepare scripts_basic scripts; do
> +		oe_runmake CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
> +		-C ${STAGING_KERNEL_DIR} O=${STAGING_KERNEL_BUILDDIR} $t
> +	done
>  }
> -- 
> 2.26.2
> 

> 

