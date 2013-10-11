Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id CDD376CFE1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 22:16:09 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r9BMEDlo002597 for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 23:16:06 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id hue2aBxy4Rg4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 23:16:05 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r9BMG3ZL002680
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 23:16:04 +0100
Message-ID: <1381529759.29912.191.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 11 Oct 2013 23:15:59 +0100
In-Reply-To: <1381528914.29912.188.camel@ted>
References: <1381528914.29912.188.camel@ted>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: Re: [PATCH] classes: tar 1.32 fixes
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
X-List-Received-Date: Fri, 11 Oct 2013 22:16:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-10-11 at 23:01 +0100, Richard Purdie wrote:
> tar version 1.32 returns:

This should be 1.27, no idea why I wrote 32 in these two patches but
I'll fix that on branch before it goes in...

Cheers,

Richard

> tar: --same-order option cannot be used with -c
> 
> with the commandlines we have been using. We can remove the -s option (which
> is --same-order) to remove the error.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
> index fd06c4a..40c3138 100644
> --- a/meta/classes/libc-package.bbclass
> +++ b/meta/classes/libc-package.bbclass
> @@ -96,14 +96,14 @@ do_prep_locale_tree() {
>  	treedir=${WORKDIR}/locale-tree
>  	rm -rf $treedir
>  	mkdir -p $treedir/${base_bindir} $treedir/${base_libdir} $treedir/${datadir} $treedir/${localedir}
> -	tar -cf - -C ${LOCALETREESRC}${datadir} -ps i18n | tar -xf - -C $treedir/${datadir}
> +	tar -cf - -C ${LOCALETREESRC}${datadir} -p i18n | tar -xf - -C $treedir/${datadir}
>  	# unzip to avoid parsing errors
>  	for i in $treedir/${datadir}/i18n/charmaps/*gz; do 
>  		gunzip $i
>  	done
> -	tar -cf - -C ${LOCALETREESRC}${base_libdir} -ps . | tar -xf - -C $treedir/${base_libdir}
> +	tar -cf - -C ${LOCALETREESRC}${base_libdir} -p . | tar -xf - -C $treedir/${base_libdir}
>  	if [ -f ${STAGING_DIR_NATIVE}${prefix_native}/lib/libgcc_s.* ]; then
> -		tar -cf - -C ${STAGING_DIR_NATIVE}/${prefix_native}/${base_libdir} -ps libgcc_s.* | tar -xf - -C $treedir/${base_libdir}
> +		tar -cf - -C ${STAGING_DIR_NATIVE}/${prefix_native}/${base_libdir} -p libgcc_s.* | tar -xf - -C $treedir/${base_libdir}
>  	fi
>  	install -m 0755 ${LOCALETREESRC}${bindir}/localedef $treedir/${base_bindir}
>  }
> @@ -113,7 +113,7 @@ do_collect_bins_from_locale_tree() {
>  
>  	parent=$(dirname ${localedir})
>  	mkdir -p ${PKGD}/$parent
> -	tar -cf - -C $treedir/$parent -ps $(basename ${localedir}) | tar -xf - -C ${PKGD}$parent
> +	tar -cf - -C $treedir/$parent -p $(basename ${localedir}) | tar -xf - -C ${PKGD}$parent
>  }
>  
>  inherit qemu
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 189d9fd..b0f44c7 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -463,7 +463,7 @@ python perform_packagecopy () {
>      # Start by package population by taking a copy of the installed
>      # files to operate on
>      # Preserve sparse files and hard links
> -    cmd = 'tar -cf - -C %s -ps . | tar -xf - -C %s' % (dest, dvar)
> +    cmd = 'tar -cf - -C %s -p . | tar -xf - -C %s' % (dest, dvar)
>      (retval, output) = oe.utils.getstatusoutput(cmd)
>      if retval:
>          bb.fatal("file copy failed with exit code %s (cmd was %s)%s" % (retval, cmd, ":\n%s" % output if output else ""))
> diff --git a/meta/classes/populate_sdk_deb.bbclass b/meta/classes/populate_sdk_deb.bbclass
> index ec116ab..ebb842b 100644
> --- a/meta/classes/populate_sdk_deb.bbclass
> +++ b/meta/classes/populate_sdk_deb.bbclass
> @@ -13,7 +13,7 @@ populate_sdk_post_deb () {
>  	local target_rootfs=$1
>  
>  	mkdir -p ${target_rootfs}/etc
> -	tar -cf - -C ${STAGING_ETCDIR_NATIVE} -ps apt | tar -xf - -C ${target_rootfs}/etc
> +	tar -cf - -C ${STAGING_ETCDIR_NATIVE} -p apt | tar -xf - -C ${target_rootfs}/etc
>  }
>  
>  populate_sdk_deb () {
> diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
> index ac9028c..814f7bc 100644
> --- a/meta/classes/staging.bbclass
> +++ b/meta/classes/staging.bbclass
> @@ -13,7 +13,7 @@ sysroot_stage_dir() {
>  	# However we always want to stage a $src itself, even if it's empty
>  	mkdir -p "$dest"
>  	if [ -d "$src" ]; then
> -		tar -cf - -C "$src" -ps . | tar -xf - -C "$dest"
> +		tar -cf - -C "$src" -p . | tar -xf - -C "$dest"
>  	fi
>  }
>  
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



