Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RrEwA-0005EI-4m
	for openembedded-core@lists.openembedded.org;
	Sat, 28 Jan 2012 21:31:50 +0100
Received: by dakf10 with SMTP id f10so2005039dak.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Jan 2012 12:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ISqkgBYyS3VMKGYAZj7uDVb/mSQ+xRUW5zC0zt7EBxo=;
	b=jr4dBoVX6eNc6NVjzU5gRmrDnc20xUmdElFw4gSMgGCEuB9e6BKng9jGUS9lLAfb84
	04S8kOmnV9o87J/MCtX1dusIZrXzghfBDlOK25B+qN8W64DavYRWF7qSfPdF7LhcIxZ/
	ol1GpCAEjFJJw8+XcXXzXV3/xrTQIhkyudFp4=
Received: by 10.68.73.69 with SMTP id j5mr26619183pbv.11.1327782237059;
	Sat, 28 Jan 2012 12:23:57 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id j5sm31699843pbe.1.2012.01.28.12.23.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 28 Jan 2012 12:23:56 -0800 (PST)
Date: Sat, 28 Jan 2012 12:23:49 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120128202349.GE22106@sakrah.homelinux.org>
References: <cover.1327684024.git.chris_larson@mentor.com>
	<a36fa8d970d1a2eceb16774604e5b5b7aff0b2cb.1327684024.git.chris_larson@mentor.com>
MIME-Version: 1.0
In-Reply-To: <a36fa8d970d1a2eceb16774604e5b5b7aff0b2cb.1327684024.git.chris_larson@mentor.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 03/10] binutils: fixes for build with an external csl toolchain
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 28 Jan 2012 20:31:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (27/01/12 11:13), Christopher Larson wrote:
> From: Christopher Larson <chris_larson@mentor.com>
> 
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---
>  meta/recipes-devtools/binutils/binutils.inc |    5 +++--
>  1 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
> index 6130ab4..e343242 100644
> --- a/meta/recipes-devtools/binutils/binutils.inc
> +++ b/meta/recipes-devtools/binutils/binutils.inc
> @@ -51,6 +51,7 @@ B = "${S}/build.${HOST_SYS}.${TARGET_SYS}"
>  EXTRA_OECONF = "--program-prefix=${TARGET_PREFIX} \
>                  --enable-install-libbfd \
>                  --enable-shared \
> +                --disable-werror \

I specifically wanted to avoid this option but I guess we have to have
it to support wide versions of gcc.

>                  ${@base_contains('DISTRO_FEATURES', 'multiarch', '--enable-64-bit-bfd', '', d)}"
>  
>  EXTRA_OECONF_virtclass-native = "--enable-target=all --enable-64-bit-bfd --enable-install-libbfd"
> @@ -113,11 +114,11 @@ do_install () {
>  	cd ${D}${bindir}
>  
>  	# Symlinks for ease of running these on the native target
> -	for p in ${TARGET_SYS}-* ; do
> +	for p in ${TARGET_PREFIX}* ; do
>  		ln -sf $p `echo $p | sed -e s,${TARGET_PREFIX},,`
>  	done
>  
> -	rm ${D}${bindir}/ar ${D}${bindir}/strings
> +	rm -f ${D}${bindir}/ar ${D}${bindir}/strings
>  
>  	oe_multilib_header bfd.h
>  }
> -- 
> 1.7.8.rc4
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
-Khem


