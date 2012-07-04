Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SmHpO-0001ou-Ov
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jul 2012 07:08:39 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 03 Jul 2012 21:57:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="161222608"
Received: from unknown (HELO [10.255.12.176]) ([10.255.12.176])
	by orsmga001.jf.intel.com with ESMTP; 03 Jul 2012 21:57:35 -0700
Message-ID: <4FF3CD3E.8030101@linux.intel.com>
Date: Tue, 03 Jul 2012 21:57:34 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1341343267-32355-1-git-send-email-msm@freescale.com>
In-Reply-To: <1341343267-32355-1-git-send-email-msm@freescale.com>
Cc: Matthew McClintock <msm@freescale.com>
Subject: Re: [PATCH] libxml-parser-perl_2.41.bb: fix MakeMaker issues with using wrong CC/LD/etc
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
X-List-Received-Date: Wed, 04 Jul 2012 05:08:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/03/2012 12:21 PM, Matthew McClintock wrote:
> MakeMaker has a bug where it does not propagate CC/LD/etc information
> down to subproject it generates Makefiles for... this recipe has has an
> Expat subproject which has issues building if we are using sstate-cache
> and it will reference the old sysroots and be unable to build properly.
> There is an upstream MakeMaker bug for this issue but we can work around
> it by fixing up the Makefiles for now
>
> See:
> https://rt.cpan.org/Public/Bug/Display.html?id=28632
>
> Signed-off-by: Matthew McClintock<msm@freescale.com>
> ---
>   meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb |   11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb b/meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb
> index be41578..fff29ac 100644
> --- a/meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb
> +++ b/meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=2;endline=6;md5=c8767d7516229f07b26e
>
>   DEPENDS += "expat expat-native"
>
> -PR = "r2"
> +PR = "r3"
>
>   SRC_URI = "http://www.cpan.org/modules/by-module/XML/XML-Parser-${PV}.tar.gz"
>   SRC_URI[md5sum] = "c320d2ffa459e6cdc6f9f59c1185855e"
> @@ -13,10 +13,17 @@ SRC_URI[sha256sum] = "b48197cd2265a26c5f016489f11a7b450d8833cb8b3d6a46ee15975740
>
>   S = "${WORKDIR}/XML-Parser-${PV}"
>
> -EXTRA_CPANFLAGS = "EXPATLIBPATH=${STAGING_LIBDIR} EXPATINCPATH=${STAGING_INCDIR}"
> +EXTRA_CPANFLAGS = "EXPATLIBPATH=${STAGING_LIBDIR} EXPATINCPATH=${STAGING_INCDIR} CC=${CC} LD=${LD} FULL_AR=${AR}"
>
>   inherit cpan
>
> +# fix up sub MakeMaker project as arguments don't get propagated though
> +# see https://rt.cpan.org/Public/Bug/Display.html?id=28632
> +do_configure_append() {
> +	sed 's/--sysroot=.*\(\s\|$\)/--sysroot=${STAGING_DIR_TARGET} /g' -i Makefile Expat/Makefile
> +	sed 's/^FULL_AR = .*/FULL_AR = ${AR}/g' Expat/Makefile
> +}
> +
This seems to have caused the following error:
> ERROR: Function failed: do_configure (see /srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/work/i586-poky-linux/libxml-parser-perl-2.41-r3/temp/log.do_configure.77756 for further information)
> NOTE: Running task 6659 of 10967 (ID: 4264, /srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-world/build/meta/recipes-graphics/xorg-lib/libxfontcache_1.0.5.bb, do_configure)
> ERROR: Logfile of failure stored in: /srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/work/i586-poky-linux/libxml-parser-perl-2.41-r3/temp/log.do_configure.77756
> Log data follows:
> | DEBUG: Executing python function sysroot_cleansstate
> | DEBUG: Python function sysroot_cleansstate finished
> | DEBUG: Executing shell function do_configure
> | *** Module name IN: /srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/lib/perl/5.14.2/Cwd.pm
> | *** p1: /srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/lib/  p3: perl/5.14.2/  p5: Cwd.pm
> | *** Module name OUT: /srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/x86_64-linux/usr/lib/perl-native/perl/5.14.2/Cwd.pm
> | *** Module name IN: /srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/lib/perl/5.14.2/Fcntl.pm
> | *** p1: /srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/lib/  p3: perl/5.14.2/  p5: Fcntl.pm
> | *** Module name OUT: /srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/x86_64-linux/usr/lib/perl-native/perl/5.14.2/Fcntl.pm
> | *** Module name IN: /srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/lib/perl/5.14.2/IO.pm
> | *** p1: /srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/lib/  p3: perl/5.14.2/  p5: IO.pm
> | *** Module name OUT: /srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/x86_64-linux/usr/lib/perl-native/perl/5.14.2/IO.pm
> | *** Module name IN: /srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/lib/perl/5.14.2/List/Util.pm
> | *** p1: /srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/lib/  p3: perl/5.14.2/  p5: List/Util.pm
> | *** Module name OUT: /srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/x86_64-linux/usr/lib/perl-native/perl/5.14.2/List/Util.pm
> | Warning: prerequisite LWP 0 not found.
> | Checking if your kit is complete...
> | Looks good
> | '--SYSROOT' is not a known MakeMaker parameter name.
> | '-MARCH' is not a known MakeMaker parameter name.
> | *** Module name IN: /srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/x86_64-linux/usr/lib/perl-native/perl/5.14.2/Tie/Hash/NamedCapture.pm
> | *** p1: /srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/x86_64-linux/usr/lib/  p3:   p5: perl-native/perl/5.14.2/Tie/Hash/NamedCapture.pm
> | *** Module name OUT: /srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/x86_64-linux/usr/lib/perl-native/perl/5.14.2/perl-native/perl/5.14.2/Tie/Hash/NamedCapture.pm
> | Writing Makefile for XML::Parser::Expat
> | Writing MYMETA.yml
> | Writing Makefile for XML::Parser
> | Writing MYMETA.yml
> | *** Module name IN: /srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/lib/perl/5.14.2/POSIX.pm
> | *** p1: /srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/lib/  p3: perl/5.14.2/  p5: POSIX.pm
> | *** Module name OUT: /srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/x86_64-linux/usr/lib/perl-native/perl/5.14.2/POSIX.pm
> | sed: -e expression #1, char 36: unknown option to `s'
> | ERROR: Function failed: do_configure (see /srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/work/i586-poky-linux/libxml-parser-perl-2.41-r3/temp/log.do_configure.77756 for further information)
> NOTE: package libxml-parser-perl-2.41-r3: task do_configure: Failed


Please review this patch.

Thanks
	Sau!



>   do_compile() {
>   	export LIBC="$(find ${STAGING_DIR_TARGET}/${base_libdir}/ -name 'libc-*.so')"
>   	cpan_do_compile


