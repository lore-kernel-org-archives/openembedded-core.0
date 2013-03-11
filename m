Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UFCeA-0005Y4-2j
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 01:00:51 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 11 Mar 2013 16:44:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,825,1355126400"; d="scan'208";a="268877430"
Received: from unknown (HELO [10.255.13.68]) ([10.255.13.68])
	by azsmga001.ch.intel.com with ESMTP; 11 Mar 2013 16:44:06 -0700
Message-ID: <513E6C46.2010909@linux.intel.com>
Date: Mon, 11 Mar 2013 16:44:06 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
References: <1362674233-7210-1-git-send-email-stefan@herbrechtsmeier.net>
In-Reply-To: <1362674233-7210-1-git-send-email-stefan@herbrechtsmeier.net>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] boost: Split out bjam build tool and add real native support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Mar 2013 00:00:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/07/2013 08:37 AM, Stefan Herbrechtsmeier wrote:
> The current boost recipe only creates the bjam build tool during
> a native run and thereby is not usable for other native programs
> that depend on a boost library. Split out the build tool into its
> own bjam recipe and add real native support to the boost recipe.
> This allows recipes to depend on native boost libraries without
> increase of the build time for other use cases.
>
> Native compilation of bzip2 isn't working and therefore disabled.
>
> Signed-off-by: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
> ---
>   meta/recipes-support/boost/bjam_1.53.0.bb   |   21 +++++++++++
>   meta/recipes-support/boost/boost-1.53.0.inc |   21 +++++++++++
>   meta/recipes-support/boost/boost.inc        |   49 ++-------------------------
>   meta/recipes-support/boost/boost_1.53.0.bb  |    6 +--
>   4 files changed, 47 insertions(+), 50 deletions(-)
>   create mode 100644 meta/recipes-support/boost/bjam_1.53.0.bb
>   create mode 100644 meta/recipes-support/boost/boost-1.53.0.inc
>
This change seems to have caused a failure on my test build:

> Log data follows:
> | DEBUG: Executing shell function do_compile
> | + cd /srv/hdd/builds/world/tmp/work/armv5te-poky-linux-gnueabi/bjam/1.53.0-r0/boost_1_53_0/tools/build/v2/engine
> | + rm -rf bin.*
> | + ./build.sh gcc
> | ###
> | ### Using 'gcc' toolset.
> | ###
> | rm -rf bootstrap
> | mkdir bootstrap
> | gcc -o bootstrap/jam0 command.c compile.c constants.c debug.c function.c glob.c hash.c hdrmacro.c headers.c jam.c jambase.c jamgram.c lists.c make.c make1.c object.c option.c output.c parse.c pathunix.c regexp.c rules.c scan.c search.c subst.c timestamp.c variable.c modules.c strings.c filesys.c builtins.c pwd.c class.c native.c md5.c w32_getreg.c modules/set.c modules/path.c modules/regex.c modules/property-set.c modules/sequence.c modules/order.c execunix.c fileunix.c
> | function.c: In function 'argument_list_print':
> | function.c:3109:17: warning: format '%s' expects argument of type 'char *', but argument 2 has type 'struct OBJECT *' [-Wformat]
> | ./bootstrap/jam0 -f build.jam --toolset=gcc --toolset-root= clean
> | build.jam:185: in module scope
> | *** argument error
> | * rule toolset ( name command .type ? : opt.out + : opt.define * : flags * : linklibs * )
> | * called with: ( cc arm-poky-linux-gnueabi-gcc -march=armv5te -marm -mthumb-interwork --sysroot=/srv/hdd/builds/world/tmp/sysroots/qemuarm : -o  : -D : -O2 -pipe -g -feliminate-unused-debug-types -s -O :  )
> | * extra argument -marm
> | build.jam:149:see definition of rule 'toolset' being called
> | ERROR: Function failed: do_compile (see /srv/hdd/builds/world/tmp/work/armv5te-poky-linux-gnueabi/bjam/1.53.0-r0/temp/log.do_compile.18164 for further information)
> ERROR: Task 123 (/srv/hdd/poky/meta/recipes-support/boost/bjam_1.53.0.bb, do_compile) failed with exit code '1'


Can you please verify that it builds correctly.

Thanks
	Sau!

> diff --git a/meta/recipes-support/boost/bjam_1.53.0.bb b/meta/recipes-support/boost/bjam_1.53.0.bb
> new file mode 100644
> index 0000000..d97d550
> --- /dev/null
> +++ b/meta/recipes-support/boost/bjam_1.53.0.bb
> @@ -0,0 +1,21 @@
> +include boost-${PV}.inc
> +
> +DESCRIPTION = "Portable build tool for boost"
> +SECTION = "devel"
> +
> +do_compile() {
> +	set -ex
> +	cd ${S}/tools/build/v2/engine
> +	rm -rf bin.*
> +	./build.sh gcc
> +}
> +
> +# This is too terrible - the build script doesn't give any good
> +# way I can see to find out where the binaries are placed, so
> +# rely on only one bin.foo directory being created.
> +do_install() {
> +	set -ex
> +	cd ${S}/tools/build/v2/engine
> +	install -d ${D}${bindir}/
> +	install -c -m 755 bin.*/bjam ${D}${bindir}/
> +}
> diff --git a/meta/recipes-support/boost/boost-1.53.0.inc b/meta/recipes-support/boost/boost-1.53.0.inc
> new file mode 100644
> index 0000000..19152a7
> --- /dev/null
> +++ b/meta/recipes-support/boost/boost-1.53.0.inc
> @@ -0,0 +1,21 @@
> +# The Boost web site provides free peer-reviewed portable
> +# C++ source libraries. The emphasis is on libraries which
> +# work well with the C++ Standard Library. The libraries are
> +# intended to be widely useful, and are in regular use by
> +# thousands of programmers across a broad spectrum of applications.
> +HOMEPAGE = "http://www.boost.org/"
> +LICENSE = "BSL-1.0 & MIT & Python-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE_1_0.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
> +
> +BOOST_VER = "${@"_".join(d.getVar("PV",1).split("."))}"
> +BOOST_MAJ = "${@"_".join(d.getVar("PV",1).split(".")[0:2])}"
> +BOOST_P = "boost_${BOOST_VER}"
> +
> +SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BOOST_P}.tar.bz2"
> +
> +SRC_URI[md5sum] = "a00d22605d5dbcfb4c9936a9b35bc4c2"
> +SRC_URI[sha256sum] = "f88a041b01882b0c9c5c05b39603ec8383fb881f772f6f9e6e6fd0e0cddb9196"
> +
> +S = "${WORKDIR}/${BOOST_P}"
> +
> +BBCLASSEXTEND = "native"
> diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
> index 1266666..328676d 100644
> --- a/meta/recipes-support/boost/boost.inc
> +++ b/meta/recipes-support/boost/boost.inc
> @@ -1,25 +1,9 @@
> -# The Boost web site provides free peer-reviewed portable
> -# C++ source libraries. The emphasis is on libraries which
> -# work well with the C++ Standard Library. The libraries are
> -# intended to be widely useful, and are in regular use by
> -# thousands of programmers across a broad spectrum of applications.
>   DESCRIPTION = "Free peer-reviewed portable C++ source libraries"
> -HOMEPAGE = "http://www.boost.org/"
>   SECTION = "libs"
> -DEPENDS = "boost-native zlib bzip2"
> -DEPENDS_class-native = ""
> -LICENSE = "BSL-1.0 & MIT & Python-2.0"
> +DEPENDS = "bjam-native zlib bzip2"
>
>   ARM_INSTRUCTION_SET = "arm"
>
> -BOOST_VER = "${@"_".join(d.getVar("PV",1).split("."))}"
> -BOOST_MAJ = "${@"_".join(d.getVar("PV",1).split(".")[0:2])}"
> -BOOST_P = "boost_${BOOST_VER}"
> -
> -SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BOOST_P}.tar.bz2"
> -
> -S = "${WORKDIR}/${BOOST_P}"
> -
>   BOOST_LIBS = "\
>   	date_time \
>   	filesystem \
> @@ -126,6 +110,8 @@ BJAM_OPTS    = '${PARALLEL_MAKE} \
>   		--disable-icu \
>   		${BJAM_EXTRA}'
>
> +# Native compilation of bzip2 isn't working
> +BJAM_OPTS_append_class-native = ' -sNO_BZIP2=1'
>
>   do_boostconfig() {
>   	cp -f boost/config/platform/linux.hpp boost/config/platform/linux-gnueabi.hpp
> @@ -168,32 +154,3 @@ do_install() {
>   	done
>
>   }
> -
> -BBCLASSEXTEND = "native"
> -
> -do_configure_class-native() {
> -	:
> -}
> -
> -do_boostconfig_class-native() {
> -	:
> -}
> -
> -do_compile_class-native() {
> -	set -ex
> -	cd ${S}/tools/build/v2/engine
> -	rm -rf bin.*
> -	./build.sh gcc
> -}
> -
> -# This is too terrible - the build script doesn't give any good
> -# way I can see to find out where the binaries are placed, so
> -# rely on only one bin.foo directory being created.
> -do_install_class-native () {
> -	set -ex
> -	cd ${S}/tools/build/v2/engine
> -	install -d ${D}${bindir}/
> -	install -c -m 755 bin.*/bjam ${D}${bindir}/
> -}
> -
> -
> diff --git a/meta/recipes-support/boost/boost_1.53.0.bb b/meta/recipes-support/boost/boost_1.53.0.bb
> index de721c5..407ce92 100644
> --- a/meta/recipes-support/boost/boost_1.53.0.bb
> +++ b/meta/recipes-support/boost/boost_1.53.0.bb
> @@ -1,9 +1,7 @@
> +include boost-${PV}.inc
>   include boost.inc
>
> -LIC_FILES_CHKSUM = "file://LICENSE_1_0.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
> -
>   SRC_URI += "file://arm-intrinsics.patch \
>              "
>
> -SRC_URI[md5sum] = "a00d22605d5dbcfb4c9936a9b35bc4c2"
> -SRC_URI[sha256sum] = "f88a041b01882b0c9c5c05b39603ec8383fb881f772f6f9e6e6fd0e0cddb9196"
> +PR = "r1"
>


