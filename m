Received: from mail-px0-f172.google.com ([209.85.212.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QIsY5-0005Sc-S3
	for openembedded-core@lists.openembedded.org;
	Sun, 08 May 2011 03:12:42 +0200
Received: by pxi6 with SMTP id 6so3029266pxi.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 May 2011 18:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=tdGuTkI2kX4hWIiEdsofjCHM8VegblfB3/YkjnTEx2A=;
	b=tn4pEdgszRopifN3ozWwrW3i2jBJCC6feqjL7u2C8N4KRVFIiYCGPPsDOUgUsnOFMG
	VRoSTMNg/3W9X+VFfzSCStJq2B7M5GBmZEKzipbguhaXY78lydY5JMhh/fU2orxvD5oe
	ZKQeIrI2xsBYbUWcZCcRHEfFUN7YqHtcG+i2g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=BpYKW4FIU8CSSEcMM2DP92rpuer71JS05Y8l7DbYS+YGdc4GiQptBAyOCiTwfhfIvb
	Z7z9kG/M6HAKIslsw+aOoIY6jyXUndHheAuUMnDa99/1Sf0hHgP9m8sCVd17VG2ZDlyw
	mxQWYFJgqurMvBBFOB0h+gMi0KLxilIuytFn8=
Received: by 10.68.65.114 with SMTP id w18mr2842029pbs.355.1304816997367;
	Sat, 07 May 2011 18:09:57 -0700 (PDT)
Received: from sakrah.homelinux.org ([99.57.141.118])
	by mx.google.com with ESMTPS id d2sm3123846pbd.68.2011.05.07.18.09.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 07 May 2011 18:09:55 -0700 (PDT)
Date: Sat, 7 May 2011 18:09:16 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110508010916.GE20352@sakrah.homelinux.org>
References: <cover.1304607797.git.tom_rini@mentor.com>
	<e6bc9c65387b91c316167df66110d4585133b5aa.1304607797.git.tom_rini@mentor.com>
MIME-Version: 1.0
In-Reply-To: <e6bc9c65387b91c316167df66110d4585133b5aa.1304607797.git.tom_rini@mentor.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 2/4] binutils.inc: Switch to TARGET_PREFIX not TARGET_SYS
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
X-List-Received-Date: Sun, 08 May 2011 01:12:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (05/05/11 08:05), Tom Rini wrote:
> When TARGET_PREFIX and TARGET_SYS didn't match up, the symlinks and
> update-alternatives weren't working.  TARGET_PREFIX is what we use when
> configuring so it's what we should be using here.
> 
> This is 79b497edc0ce5d54db564818e59b690d3391d6ce from OE.
> 
> Signed-off-by: Tom Rini <tom_rini@mentor.com>

Acked-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/binutils/binutils.inc |   10 +++++-----
>  1 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
> index d9e859e..882fe7b 100644
> --- a/meta/recipes-devtools/binutils/binutils.inc
> +++ b/meta/recipes-devtools/binutils/binutils.inc
> @@ -110,7 +110,7 @@ do_install () {
>  
>  	# Symlinks for ease of running these on the native target
>  	for p in ${TARGET_SYS}-* ; do
> -		ln -sf $p `echo $p | sed -e s,${TARGET_SYS}-,,`
> +		ln -sf $p `echo $p | sed -e s,${TARGET_PREFIX},,`
>  	done
>  
>  	rm ${D}${bindir}/ar ${D}${bindir}/strings
> @@ -139,11 +139,11 @@ do_install_virtclass-native () {
>  }
>  
>  pkg_postinst_${PN}-symlinks () {
> -	update-alternatives --install ${bindir}/ar ar ${TARGET_SYS}-ar 100
> -	update-alternatives --install ${bindir}/strings strings ${TARGET_SYS}-strings 100
> +	update-alternatives --install ${bindir}/ar ar ${TARGET_PREFIX}ar 100
> +	update-alternatives --install ${bindir}/strings strings ${TARGET_PREFIX}strings 100
>  }
>  
>  pkg_prerm_${PN}-symlinks () {
> -	update-alternatives --remove ar ${TARGET_SYS}-ar
> -	update-alternatives --remove strings ${TARGET_SYS}-strings
> +	update-alternatives --remove ar ${TARGET_PREFIX}ar
> +	update-alternatives --remove strings ${TARGET_PREFIX}strings
>  }
> -- 
> 1.7.0.4
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
-Khem


