Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S0CbW-0001Y4-A2 for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 14:51:34 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1MDhFai028634
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 13:43:15 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28484-02 for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 13:43:10 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1MDh79X028628
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 13:43:08 GMT
Message-ID: <1329918187.20261.146.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 22 Feb 2012 13:43:07 +0000
In-Reply-To: <44285a7a69f45582670350ca63e1fa8996dac890.1329892604.git.nitin.a.kamble@intel.com>
References: <cover.1329892604.git.nitin.a.kamble@intel.com>
	<44285a7a69f45582670350ca63e1fa8996dac890.1329892604.git.nitin.a.kamble@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 10/10] libgcc: get the gcc header files working
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
X-List-Received-Date: Wed, 22 Feb 2012 13:51:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-02-21 at 22:37 -0800, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
> 
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> ---
>  meta/recipes-devtools/gcc/libgcc_4.6.bb |   53 +++++++++++++++++++++++++++++++
>  1 files changed, 53 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/recipes-devtools/gcc/libgcc_4.6.bb b/meta/recipes-devtools/gcc/libgcc_4.6.bb
> index 076cf37..6d93341 100644
> --- a/meta/recipes-devtools/gcc/libgcc_4.6.bb
> +++ b/meta/recipes-devtools/gcc/libgcc_4.6.bb
> @@ -14,6 +14,9 @@ FILES_${PN} = "${base_libdir}/libgcc*.so.*"
>  FILES_${PN}-dev = " \
>    ${base_libdir}/libgcc*.so \
>    ${libdir}/${TARGET_SYS}/${BINV}/crt* \
> +  ${libdir}/${TARGET_SYS}/${BINV}/32 \
> +  ${libdir}/${TARGET_SYS}/${BINV}/x32 \
> +  ${libdir}/${TARGET_SYS}/${BINV}/n32 \
>    ${libdir}/${TARGET_SYS}/${BINV}/libgcc*"
>  FILES_libgcov-dev = " \
>    ${libdir}/${TARGET_SYS}/${BINV}/libgcov.a "
> @@ -51,3 +54,53 @@ BBCLASSEXTEND = "nativesdk"
>  INSANE_SKIP_libgcc-dev = "staticdev"
>  INSANE_SKIP_libgcov-dev = "staticdev"
>  
> +addtask multilib_install after do_install before do_package
> +
> +
> +# this makes multilib gcc files findable for target gcc
> +# like this directory is made findable 
> +#    /usr/lib/i586-pokymllib32-linux/4.6.3/
> +# by creating this symlink to it
> +#    /usr/lib64/x86_64-poky-linux/4.6.3/32

This might be one case where moving the files is actually the right
thing to do. The "pokymllib32" is an artefact of the way we do multilib
builds and likely shouldn't be exposed on the target. I'm not sure how
relocatable these files are though.

> +python do_multilib_install() {
> +        import re
> +        # do this only for multilib extended recipe
> +        if d.getVar('PN', 1) != 'libgcc':
> +                return
> +
> +        tune_arch = d.getVar('TUNE_ARCH', 1) or ''
> +        defaulttune = d.getVar('DEFAULTTUNE', 1) or ''
> +        multilibs = d.getVar('MULTILIB_VARIANTS', 1) or ''
> +        if multilibs == '':
> +                return
> +
> +	tunes_32 = ['x86', 'core2', 'i586', 'mips', 'mipsel', 'mips-nf', 'mipsel-nf', 'powerpc', 'powerpc-nf']
> +        tunes_64 = ['x86-64', 'core2-64', 'mips64', 'mips64el', 'mips64-nf', 'mips64el-nf', 'powerpc64']
> +        tunes_x32 = ['x86-64-x32', 'core2-64-x32']
> +        tunes_n32 = ['mips64-n32', 'mips64el-n32', 'mips64-nf-n32', 'mips64el-nf-n32']

Just for reference, duplicating these lists over two files is an
extremely bad idea...

I'm hoping we can clean some of this up with the comments in my reply to
the other patch too.

Cheers,

Richard




