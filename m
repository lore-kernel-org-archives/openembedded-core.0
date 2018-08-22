Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5E8A774572
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 15:56:41 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w7MFufrs031015
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Wed, 22 Aug 2018 16:56:42 +0100
Message-ID: <6f2c8337c703580fe1e993d160a8d72c6dd7f6fd.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jens Rehsack <sno@netbsd.org>, openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 16:56:41 +0100
In-Reply-To: <20180822090424.14573-2-sno@netbsd.org>
References: <20180822090424.14573-1-sno@netbsd.org>
	<20180822090424.14573-2-sno@netbsd.org>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 2/2] libxml-parser-perl: fix "...contains bad RPATH"
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
X-List-Received-Date: Wed, 22 Aug 2018 15:56:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-08-22 at 11:04 +0200, Jens Rehsack wrote:
> The perl distribution "XML-Parser" relies for configuration
> on the tooling of Devel::CheckLib - which is not aware of
> sysroot locations nor of reasonable compiler/link definitions
> from outside.
> 
> This causes
> 
>     ERROR: libxml-parser-perl-2.44-r0 do_package_qa: QA Issue:
> package libxml-parser-perl contains bad RPATH
> ${BUILDDIR}/tmp/work/core2-64-poky-linux/libxml-parser-perl/2.44-
> r0/recipe-sysroot/usr/lib in file ${BUILDDIR}/tmp/work/core2-64-poky-
> linux/libxml-parser-perl/2.44-r0/packages-split/libxml-parser-
> perl/usr/lib/perl/vendor_perl/5.24.4/auto/XML/Parser/Expat/Expat.so
>     package libxml-parser-perl contains bad RPATH
> ${BUILDDIR}/tmp/work/core2-64-poky-linux/libxml-parser-perl/2.44-
> r0/recipe-sysroot/usr/lib in file ${BUILDDIR}/tmp/work/core2-64-poky-
> linux/libxml-parser-perl/2.44-r0/packages-split/libxml-parser-
> perl/usr/lib/perl/vendor_perl/5.24.4/auto/XML/Parser/Expat/Expat.so
> [rpaths]
>     ERROR: libxml-parser-perl-2.44-r0 do_package_qa: QA run found
> fatal errors. Please consider fixing them.
>     ERROR: libxml-parser-perl-2.44-r0 do_package_qa: Function failed:
> do_package_qa
> 
> It's strongly encouraged to the maintainer @toddr to rework the
> toolchain for up to date environments.
> 
> Signed-off-by: Jens Rehsack <sno@netbsd.org>
> ---
>  meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb | 10
> +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb
> b/meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb
> index c5e0ae6769..4494e2286c 100644
> --- a/meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb
> +++ b/meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb
> @@ -18,8 +18,16 @@ inherit cpan ptest-perl
>  
>  # fix up sub MakeMaker project as arguments don't get propagated
> though
>  # see https://rt.cpan.org/Public/Bug/Display.html?id=28632
> +do_configure_append_class-target() {
> +	sed -E \
> +	    -e 's:-L${STAGING_LIBDIR}::g' -e 's:-
> I${STAGING_INCDIR}::g' \
> +	    -e 's:LD_RUN_PATH ?= ?"?[^"]*"?::g' \
> +	    -i Makefile Expat/Makefile
> +}
> +
>  do_configure_append() {
> -	sed 's:--sysroot=.*\(\s\|$\):--sysroot=${STAGING_DIR_TARGET}
> :g' -i Makefile Expat/Makefile
> +	sed -e 's:--sysroot=.*\(\s\|$\):
> --sysroot=${STAGING_DIR_TARGET} :g' \
> +	    -i Makefile Expat/Makefile
>  	sed 's:^FULL_AR = .*:FULL_AR = ${AR}:g' -i Expat/Makefile
>  	# make sure these two do not build in parallel
>  	sed 's!^$(INST_DYNAMIC):!$(INST_DYNAMIC): $(BOOTSTRAP)!' -i
> Expat/Makefile

Sorry, this fails to build the nativesdk version:

https://autobuilder.yocto.io/builders/nightly-x86/builds/1261/steps/Building%20Toolchain%20Images/logs/stdio

I suspect you need to strip the RPATH in the nativesdk case...

Cheers,

Richard



