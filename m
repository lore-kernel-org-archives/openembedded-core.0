Return-Path: <mac@mcrowe.com>
Received: from avasout02.plus.net (avasout02.plus.net [212.159.14.17])
	by mail.openembedded.org (Postfix) with ESMTP id 0DF526D749
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2019 16:28:00 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by smtp with ESMTP
	id mLNfgWm6tx6b6mLNggygLv; Wed, 23 Jan 2019 16:28:01 +0000
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=T4GiscCQ c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=kj9zAlcOel0A:10 a=3JhidrIBZZsA:10 a=nrM2YBz5V73l1kFWv0UA:9
	a=CjuIK1q_8ugA:10
Received: from mac by deneb with local (Exim 4.89)
	(envelope-from <mac@mcrowe.com>)
	id 1gmLNf-0005qG-Ok; Wed, 23 Jan 2019 16:27:59 +0000
Date: Wed, 23 Jan 2019 16:27:59 +0000
From: Mike Crowe <mac@mcrowe.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20190123162759.yjdev2mpx24zwbaf@mcrowe.com>
References: <20190111164951.8329-1-mac@mcrowe.com>
	<47731964b9ae52ac23e67b92bbfd1a1ad3e2acc0.camel@linuxfoundation.org>
	<20190111165944.gussrefs6j5o6ffq@mcrowe.com>
MIME-Version: 1.0
In-Reply-To: <20190111165944.gussrefs6j5o6ffq@mcrowe.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CMAE-Envelope: MS4wfKWV9STeR+osX4aoQJHy1StVkBoQlhEFP8kbhRu7OeKhmoZ9DaawvZ0KYBsoFjUYp3dsTYTAv1x6J3W21aIzHS0Zy91K/fHtZAInPrABSNze8opOjY0y
	s64hiSEkHvRV99cCz1JufsDc2xLUHN9rCkWhaMO70E3gxkFCH3Rn05L2
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2] glibc: Separate out AArch64 multilib loader symlink creation
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
X-List-Received-Date: Wed, 23 Jan 2019 16:28:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Friday 11 January 2019 at 16:59:44 +0000, Mike Crowe wrote:
> On Friday 11 January 2019 at 16:53:47 +0000, Richard Purdie wrote:
> > On Fri, 2019-01-11 at 16:49 +0000, Mike Crowe wrote:
> > > Until now, glibc was responsible for creating an AArch64 dynamic
> > > loader symlink if required for ABI compatibility.
> > > 
> > > Unfortunately, using multilib with AArch64 caused the rmdir in
> > > glibc-package.inc:do_poststash_install_cleanup to fail because that
> > > task did not expect to find the dynamic loader symlink in /lib.
> > > 
> > > Also, although glibc-package.inc:do_install_append_aarch64 made use
> > > of ${nonarch_base_libdir} to create the dynamic loader symlink in a
> > > way that was compatible with usrmerge, it unfortunately explicitly
> > > added only /lib to libc_baselibs, so the symlink was not packaged
> > > correctly when using usrmerge.
> > > 
> > > Attempting to fix both of these problems within glibc-package.inc in
> > > various ways created a bit of a mess. It seemed much simpler to
> > > invent a new package for the symlink and have glibc RDEPEND on that
> > > package if required.
> > > 
> > > Richard Purdie suggested[1] that ${nonarch_base_libdir} should not be
> > > used in this way. I've switched to using ${root_prefix}/lib which
> > > continues to work both with and without usrmerge.
> > > 
> > > Unfortunately, it appears not to be possible to specify the name of
> > > the loader via a variable with an override, since the _aarch64
> > > override is applied even for _aarch64-be.
> > 
> > I wish there was a simpler way to do this. How ugly is the patch to fix
> > this without adding the new recipe? Adding new recipes which are arch
> > specific like this is a pain for world builds and I think this patch
> > will have problems with those :(.
> 
> This is how far I got before deciding that it was too ugly. This patch
> needs some cleaning up, and similar hackery to the separate-recipe patch
> because the aarch64-be override doesn't work. :(
> 
> I tried to make both patches at least slightly generic in case some other
> architecture needs something similar in the future. That's why the code has
> moved into a plain do_install_append. This isn't required though, and
> perhaps it would be clearer if the variable were actually
> AARCH64_DYNAMIC_LOADER anyway.
> 
> Thanks.
> 
> Mike.
> 
> diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
> index a98ae1a29c..0181aa7b32 100644
> --- a/meta/recipes-core/glibc/glibc-package.inc
> +++ b/meta/recipes-core/glibc/glibc-package.inc
> @@ -15,7 +15,13 @@ RPROVIDES_glibc-thread-db = "eglibc-thread-db"
>  RPROVIDES_${PN}-pcprofile = "eglibc-pcprofile"
>  RPROVIDES_${PN}-dbg = "eglibc-dbg"
>  libc_baselibs = "${base_libdir}/libc.so.* ${base_libdir}/libc-*.so ${base_libdir}/libm*.so.* ${base_libdir}/libm-*.so ${base_libdir}/libmvec-*.so ${base_libdir}/ld*.so.* ${base_libdir}/ld-*.so ${base_libdir}/libpthread*.so.* ${base_libdir}/libpthread-*.so ${base_libdir}/libresolv*.so.* ${base_libdir}/libresolv-*.so ${base_libdir}/librt*.so.* ${base_libdir}/librt-*.so ${base_libdir}/libutil*.so.* ${base_libdir}/libutil-*.so ${base_libdir}/libnsl*.so.* ${base_libdir}/libnsl-*.so ${base_libdir}/libnss_files*.so.* ${base_libdir}/libnss_files-*.so ${base_libdir}/libnss_compat*.so.* ${base_libdir}/libnss_compat-*.so ${base_libdir}/libnss_dns*.so.* ${base_libdir}/libnss_dns-*.so ${base_libdir}/libdl*.so.* ${base_libdir}/libdl-*.so ${base_libdir}/libanl*.so.* ${base_libdir}/libanl-*.so ${base_libdir}/libBrokenLocale*.so.* ${base_libdir}/libBrokenLocale-*.so"
> -libc_baselibs_append_aarch64 = " /lib/ld-linux-aarch64*.so.1"
> +ARCH_DYNAMIC_LOADER = ""
> +# The aarch64 ABI says the dynamic linker -must- be
> +# /lib/ld-linux-aarch64[_be].so.1. With usrmerge, that may mean that
> +# we need to install it in /usr/lib.
> +ARCH_DYNAMIC_LOADER_aarch64 = "ld-linux-aarch64.so.1"
> +ARCH_DYNAMIC_LOADER_aarch64_be = "ld-linux-aarch64_be.so.1"
> +libc_baselibs_append = " ${@oe.utils.conditional('ARCH_DYNAMIC_LOADER', '', '', '${root_prefix}/lib/${ARCH_DYNAMIC_LOADER}', d)}"
>  INSANE_SKIP_${PN}_append_aarch64 = " libdir"
> 
>  FILES_${PN} = "${libc_baselibs} ${libexecdir}/* ${base_sbindir}/ldconfig ${sysconfdir}/ld.so.conf"
> @@ -112,20 +118,20 @@ do_install_append () {
>  		echo "d root root 0755 /var/run/nscd none" \
>  			> ${D}${sysconfdir}/default/volatiles/98_nscd
>  	fi
> +
> +	# The dynamic loader will have been installed into
> +	# ${base_libdir}. However, if that isn't going to end up being
> +	# available in the ABI-mandated location, then a symlink must
> +        # be created.
> +
> +	if [ -n "${ARCH_DYNAMIC_LOADER}" -a ! -e "${D}${root_prefix}/lib/${ARCH_DYNAMIC_LOADER}" ]; then
> +		install -d ${D}${root_prefix}/lib
> +		ln -s ${@oe.path.relative('${root_prefix}/lib', '${base_libdir}')}/${ARCH_DYNAMIC_LOADER} \
> +				${D}${root_prefix}/lib/${ARCH_DYNAMIC_LOADER}
> +	fi
>  }
> 
>  do_install_append_aarch64 () {
> -	if [ "${base_libdir}" != "${nonarch_base_libdir}" ]; then
> -		# The aarch64 ABI says the dynamic linker -must- be /lib/ld-linux-aarch64[_be].so.1
> -		install -d ${D}${nonarch_base_libdir}
> -		if [ -e ${D}${base_libdir}/ld-linux-aarch64.so.1 ]; then
> -			ln -s ${@oe.path.relative('${nonarch_base_libdir}', '${base_libdir}')}/ld-linux-aarch64.so.1 \
> -				${D}${nonarch_base_libdir}/ld-linux-aarch64.so.1
> -		elif [ -e ${D}${base_libdir}/ld-linux-aarch64_be.so.1 ]; then
> -			ln -s ${@oe.path.relative('${nonarch_base_libdir}', '${base_libdir}')}/ld-linux-aarch64_be.so.1 \
> -				${D}${nonarch_base_libdir}/ld-linux-aarch64_be.so.1
> -		fi
> -	fi
>  	do_install_armmultilib
>  }
> 
> @@ -207,7 +213,7 @@ do_poststash_install_cleanup () {
>  	rm -rf ${D}/${localedir}
>  	rm -rf ${D}${datadir}/locale
>  	if [ "${libdir}" != "${exec_prefix}/lib" ]; then
> -		if [ -d ${D}${exec_prefix}/lib ]; then
> +		if [ -d ${D}${exec_prefix}/lib -a ! -e "${D}${exec_prefix}/lib/${ARCH_DYNAMIC_LOADER}" ]; then
>  			# error out if directory isn't empty
>  			# this dir should only contain locale dir
>  			# which has been deleted in the previous step

Hi Richard (and anyone else),

Does the lack of response mean that both approaches are horrendous? If so,
do you have any better ideas?

Thanks.

Mike.

