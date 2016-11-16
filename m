Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 857F765CBA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 20:18:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1D91E209E0;
	Wed, 16 Nov 2016 20:18:38 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id VA1pOZWe19gv; Wed, 16 Nov 2016 20:18:38 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EB721204AF;
	Wed, 16 Nov 2016 20:18:36 +0000 (UTC)
Received: by gandalf.denix.org (Postfix, from userid 1000)
	id 3AB851621A4; Wed, 16 Nov 2016 15:18:36 -0500 (EST)
Date: Wed, 16 Nov 2016 15:18:36 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
Message-ID: <20161116201836.GA26131@denix.org>
References: <20160817152538.14181-1-git@andred.net>
	<20160818075626.15973-1-git@andred.net>
	<20160818075626.15973-2-git@andred.net>
MIME-Version: 1.0
In-Reply-To: <20160818075626.15973-2-git@andred.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/3] module.bbclass: use Module.symvers for dependants
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
X-List-Received-Date: Wed, 16 Nov 2016 20:18:38 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Aug 18, 2016 at 08:56:24AM +0100, André Draszik wrote:
> When compiling multiple external kernel modules, where one
> depends on the other, there are two problems at the
> moment:
> 1) we get compile time warnings from the kernel build
>    system due to missing symbols (from modpost).
> 2) Any modules generated are missing dependency
>    information (in the .modinfo elf section) for any
>    dependencies outside the current source tree and
>    outside the kernel itself.
> 
> This is expected, but the kernel build system has a way to
> deal with this - the dependent module is expected to
> specify KBUILD_EXTRA_SYMBOLS (as a space-separated list)
> to point to any and all Module.symvers of kernel modules
> that are dependencies.
> 
> While 1) by itself is not really a big issue, 2) prevents
> the packaging process from generating cross-source tree
> package dependencies.
> 
> As a first step to solve the missing dependencies in
> packages created, we:
> 1) install Module.symvers of all external kernel module
>    builds (into a location that is automatically packaged
>    into the -dev package)
> 2) make use of KBUILD_EXTRA_SYMBOLS and pass the location
>    of all Module.symvers of all kernel-module-* packages
>    we depend on
> 
> This solves both problems mentioned above.
> 
> Signed-off-by: André Draszik <git@andred.net>
> ---
>  meta/classes/module.bbclass | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
> index 01c9309..68e3d34 100644
> --- a/meta/classes/module.bbclass
> +++ b/meta/classes/module.bbclass
> @@ -8,6 +8,15 @@ EXTRA_OEMAKE += "KERNEL_SRC=${STAGING_KERNEL_DIR}"
>  
>  MODULES_INSTALL_TARGET ?= "modules_install"
>  
> +python __anonymous () {
> +    depends = d.getVar('DEPENDS', True)
> +    extra_symbols = []
> +    for dep in depends.split():
> +        if dep.startswith("kernel-module-"):
> +            extra_symbols.append("${STAGING_INCDIR}/" + dep + "/Module.symvers")
> +    d.setVar('KBUILD_EXTRA_SYMBOLS', " ".join(extra_symbols))
> +}
> +
>  module_do_compile() {
>  	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
>  	oe_runmake KERNEL_PATH=${STAGING_KERNEL_DIR}   \
> @@ -15,6 +24,7 @@ module_do_compile() {
>  		   CC="${KERNEL_CC}" LD="${KERNEL_LD}" \
>  		   AR="${KERNEL_AR}" \
>  	           O=${STAGING_KERNEL_BUILDDIR} \
> +		   KBUILD_EXTRA_SYMBOLS="${KBUILD_EXTRA_SYMBOLS}" \
>  		   ${MAKE_TARGETS}
>  }
>  
> @@ -24,6 +34,11 @@ module_do_install() {
>  	           CC="${KERNEL_CC}" LD="${KERNEL_LD}" \
>  	           O=${STAGING_KERNEL_BUILDDIR} \
>  	           ${MODULES_INSTALL_TARGET}
> +
> +	install -d -m0755 ${D}${includedir}/${BPN}
> +	cp -a --no-preserve=ownership ${B}/Module.symvers ${D}${includedir}/${BPN}

Hmm, why is Module.symvers expected to be in the root of ${B}? This seems like 
a very artificial assumption/requirement!

I have some out-of-tree modules with complicated hierarchies and it worked 
fine so far until this change, because there were only 2 well defined 
interfaces - make ${MAKE_TARGETS} and make ${MODULES_INSTALL_TARGET} - and 
both of them know where the resulting module .ko resides deep inside ${B} 
hierarchy.

I wonder if this should have been rolled into ${MODULES_INSTALL_TARGET} 
step...

-- 
Denys


> +	# it doesn't actually seem to matter which path is specified here
> +	sed -e 's:${B}/::g' -i ${D}${includedir}/${BPN}/Module.symvers
>  }
>  
>  EXPORT_FUNCTIONS do_compile do_install
> -- 
> 2.9.3
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

