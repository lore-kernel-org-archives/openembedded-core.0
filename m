Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Yao.Zhao@windriver.com>) id 1SzAoy-0003FK-K4
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Aug 2012 20:17:29 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q78I5d1l027387
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Aug 2012 11:05:39 -0700 (PDT)
Received: from [128.224.147.210] (128.224.147.210) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.309.2;
	Wed, 8 Aug 2012 11:05:39 -0700
Message-ID: <5022AA70.5020001@windriver.com>
Date: Wed, 8 Aug 2012 14:05:36 -0400
From: Yao Zhao <yao.zhao@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1344448856-20706-1-git-send-email-yao.zhao@windriver.com>
In-Reply-To: <1344448856-20706-1-git-send-email-yao.zhao@windriver.com>
X-Originating-IP: [128.224.147.210]
Subject: Re: [PATCH V2] cracklib, zlib, perl: install libz, libcrack to /lib instead of /usr/libxx
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
X-List-Received-Date: Wed, 08 Aug 2012 18:17:29 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12-08-08 02:00 PM, Yao Zhao wrote:
> In order to fix the QA Issue for libpam which installed to /lib but
> reference /usr/libxx/libz and libcrack, install libz and libcrack
> to /lib.
>
> Modify perl recipe to add STAGING_BASELIBDIR to library search path, original
> recipe only has STAGING_LIBDIR, /lib, /usr/lib, which can't find the libz.
>
> Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
> ---
>   meta/recipes-core/zlib/zlib_1.2.7.bb              |   11 +++++++++--
>   meta/recipes-devtools/perl/perl_5.14.2.bb         |    4 ++--
>   meta/recipes-extended/cracklib/cracklib_2.8.19.bb |    4 +++-
>   3 files changed, 14 insertions(+), 5 deletions(-)
>
> diff --git a/meta/recipes-core/zlib/zlib_1.2.7.bb b/meta/recipes-core/zlib/zlib_1.2.7.bb
> index 803fec3..0d8b6bd 100644
> --- a/meta/recipes-core/zlib/zlib_1.2.7.bb
> +++ b/meta/recipes-core/zlib/zlib_1.2.7.bb
> @@ -12,8 +12,11 @@ SRC_URI = "http://www.zlib.net/${BPN}-${PV}.tar.bz2 \
>   SRC_URI[md5sum] = "2ab442d169156f34c379c968f3f482dd"
>   SRC_URI[sha256sum] = "49e2e9658dfb036900da6ea0267a737fa3c4eee6666776d378c79d52e9334934"
>   
> +PR = "r1"
> +
>   do_configure (){
> -	./configure --prefix=${prefix} --shared --libdir=${libdir}
> +	#sharedlibdir sets to {libdir} if not set
> +	./configure --prefix=${prefix} --shared --libdir="${base_libdir}"
>   }
>   
>   do_compile (){
> @@ -21,7 +24,11 @@ do_compile (){
>   }
>   
>   do_install() {
> -	oe_runmake DESTDIR=${D} install
> +	#install libz.so.1.2.7 libz.a to /lib
> +	#libz.a installs to libdir, overwrite the env libdir
> +	#install pkgconfig to env libdir/pkgconfig
> +	oe_runmake DESTDIR=${D} pkgconfigdir="${libdir}/pkgconfig" \
> +		   libdir="${base_libdir}" install
>   }
>   
>   BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta/recipes-devtools/perl/perl_5.14.2.bb b/meta/recipes-devtools/perl/perl_5.14.2.bb
> index 561b30e..40dbc80 100644
> --- a/meta/recipes-devtools/perl/perl_5.14.2.bb
> +++ b/meta/recipes-devtools/perl/perl_5.14.2.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
>   # We need gnugrep (for -I)
>   DEPENDS = "virtual/db grep-native"
>   DEPENDS += "gdbm zlib"
> -PR = "r8"
> +PR = "r9"
>   
>   # 5.10.1 has Module::Build built-in
>   PROVIDES += "libmodule-build-perl"
> @@ -180,7 +180,7 @@ do_compile() {
>           sed -i -e "s|\([ \"\']\+\)/usr/include|\1${STAGING_INCDIR}|g" ext/Errno/Errno_pm.PL
>           sed -i -e "s|\([ \"\']\+\)/usr/include|\1${STAGING_INCDIR}|g" cpan/Compress-Raw-Zlib/config.in
>           sed -i -e 's|/usr/lib|""|g' cpan/Compress-Raw-Zlib/config.in
> -        sed -i -e 's|SYSROOTLIB|${STAGING_LIBDIR}|g' cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm
> +        sed -i -e 's|"SYSROOTLIB"|("${STAGING_BASELIBDIR}", "${STAGING_LIBDIR}")|g' cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm
>   
>           cd Cross
>           oe_runmake perl LD="${CCLD}"
> diff --git a/meta/recipes-extended/cracklib/cracklib_2.8.19.bb b/meta/recipes-extended/cracklib/cracklib_2.8.19.bb
> index 2951396..e36703e 100644
> --- a/meta/recipes-extended/cracklib/cracklib_2.8.19.bb
> +++ b/meta/recipes-extended/cracklib/cracklib_2.8.19.bb
> @@ -5,7 +5,7 @@ LICENSE = "LGPLv2.1+"
>   LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=e3eda01d9815f8d24aae2dbd89b68b06"
>   
>   DEPENDS = "zlib"
> -PR ="r0"
> +PR ="r1"
>   
>   EXTRA_OECONF = "--without-python"
>   
> @@ -15,3 +15,5 @@ SRC_URI[md5sum] = "ca0ec168d9c6466612204e8dfb2df8a9"
>   SRC_URI[sha256sum] = "7086b0ca23f875c9cd9ea2a993c262384b274dba9c4ea1da845ec8ac290748a9"
>   
>   inherit autotools gettext
> +
> +libdir = "${base_libdir}"
buildhistory-diff tmp/buildhistory/ HEAD^^^^^^ HEAD

packages/ppc603e-poky-linux/zlib/zlib-dev: FILELIST: removed 
"/usr/lib/libz.so" added "/lib/libz.so"
   * PR changed from "r0" to "r1"
packages/ppc603e-poky-linux/zlib/zlib-staticdev: FILELIST: removed 
"/usr/lib/libz.a" added "/lib/libz.a"
   * PR changed from "r0" to "r1"
packages/ppc603e-poky-linux/zlib/zlib: FILELIST: removed 
"/usr/lib/libz.so.1 /usr/lib/libz.so.1.2.7" added "/lib/libz.so.1.2.7 
/lib/libz.so.1"
   * PR changed from "r0" to "r1"

buildhistory-diff tmp/buildhistory/ HEAD^^^^ HEAD
packages/ppc603e-poky-linux/perl/perl-dbg: RRECOMMENDS: added "zlib-dbg"
   * PR changed from "r8" to "r9"
packages/ppc603e-poky-linux/perl/perl-module-compress: RDEPENDS: added 
"zlib (>= 1.2.7)"
   * PR changed from "r8" to "r9"

not sure why cracklib didn't show up here, but in the build I did see 
(from r0 to r1)
NOTE: package cracklib-2.8.19-r1: task do_package: Started
NOTE: package cracklib-2.8.19-r1: task do_populate_sysroot: Started
NOTE: package cracklib-2.8.19-r1: task do_populate_sysroot: Succeeded
NOTE: Running task 888 of 903 (ID: 5, 
/home/yzhao2/src/poky/meta/recipes-extended/pam/libpam_1.1.5.bb, 
do_configure)
NOTE: package libpam-1.1.5-r6: task do_configure: Started
NOTE: package cracklib-2.8.19-r1: task do_package: Succeeded
NOTE: Running task 889 of 903 (ID: 232, 
/home/yzhao2/src/poky/meta/recipes-extended/cracklib/cracklib_2.8.19.bb, 
do_package_write_rpm)
NOTE: package cracklib-2.8.19-r1: task do_package_write_rpm: Started
NOTE: package cracklib-2.8.19-r1: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 890 of 903 (ID: 229, 
/home/yzhao2/src/poky/meta/recipes-extended/cracklib/cracklib_2.8.19.bb, 
do_package_write)
NOTE: package libpam-1.1.5-r6: task do_configure: Succeeded
NOTE: Running task 891 of 903 (ID: 6, 
/home/yzhao2/src/poky/meta/recipes-extended/pam/libpam_1.1.5.bb, do_compile)
NOTE: package libpam-1.1.5-r6: task do_compile: Started
NOTE: package libpam-1.1.5-r6: task do_compile: Succeeded
NOTE: Running task 892 of 903 (ID: 2, 
/home/yzhao2/src/poky/meta/recipes-extended/pam/libpam_1.1.5.bb, do_install)
NOTE: package libpam-1.1.5-r6: task do_install: Started
NOTE: package libpam-1.1.5-r6: task do_install: Succeeded

yao


