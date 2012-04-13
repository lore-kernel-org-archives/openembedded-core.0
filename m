Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SIiKk-0003hD-G3
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Apr 2012 17:22:46 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 13 Apr 2012 08:13:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="141361446"
Received: from unknown (HELO [10.255.12.25]) ([10.255.12.25])
	by fmsmga001.fm.intel.com with ESMTP; 13 Apr 2012 08:13:24 -0700
Message-ID: <4F884293.6000101@linux.intel.com>
Date: Fri, 13 Apr 2012 08:13:23 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1334265557.git.mark.hatle@windriver.com>
	<3d06ef85d583f8ef824cb7ca91ff070dcddd0e8b.1334265557.git.mark.hatle@windriver.com>
In-Reply-To: <3d06ef85d583f8ef824cb7ca91ff070dcddd0e8b.1334265557.git.mark.hatle@windriver.com>
Subject: Re: [PATCH 1/2] pseudo: Tell pseudo to avoid specifying an RPATH
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
X-List-Received-Date: Fri, 13 Apr 2012 15:22:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/12/2012 02:21 PM, Mark Hatle wrote:
> [Yocto #2251]
>
> Add --without-rpath to avoid embedding rpaths into the pseudo
> components.
>
> Signed-off-by: Mark Hatle<mark.hatle@windriver.com>
> ---
>   meta/recipes-devtools/pseudo/pseudo.inc    |    8 ++++----
>   meta/recipes-devtools/pseudo/pseudo_1.3.bb |    2 +-
>   meta/recipes-devtools/pseudo/pseudo_git.bb |    2 +-
>   3 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devtools/pseudo/pseudo.inc
> index 664a9b5..d5c33df 100644
> --- a/meta/recipes-devtools/pseudo/pseudo.inc
> +++ b/meta/recipes-devtools/pseudo/pseudo.inc
> @@ -29,9 +29,9 @@ NO32LIBS ??= "0"
>   # Compile for the local machine arch...
>   do_compile () {
>   	if [ "${SITEINFO_BITS}" == "64" ]; then
> -	  ${S}/configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib${SITEINFO_BITS} --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --bits=${SITEINFO_BITS} --enable-static-sqlite
> +	  ${S}/configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib${SITEINFO_BITS} --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --bits=${SITEINFO_BITS} --enable-static-sqlite --without-rpath
>   	else
> -	  ${S}/configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --bits=${SITEINFO_BITS} --enable-static-sqlite
> +	  ${S}/configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --bits=${SITEINFO_BITS} --enable-static-sqlite --without-rpath
>   	fi
>   	oe_runmake ${MAKEOPTS}
>   }
> @@ -42,7 +42,7 @@ do_compile () {
>   do_compile_prepend_virtclass-native () {
>   	if [ "${SITEINFO_BITS}" == "64" -a -e "/usr/include/gnu/stubs-32.h" -a "${PN}" == "pseudo-native" -a "${NO32LIBS}" != "1" ]; then
>   		# We need the 32-bit libpseudo on a 64-bit machine...
> -		./configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --bits=32
> +		./configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --bits=32 --without-rpath
>   		oe_runmake ${MAKEOPTS} libpseudo
>   		# prevent it from removing the lib, but remove everything else
>   		make 'LIB=foo' ${MAKEOPTS} distclean
> @@ -52,7 +52,7 @@ do_compile_prepend_virtclass-native () {
>   do_compile_prepend_virtclass-nativesdk () {
>   	if [ "${SITEINFO_BITS}" == "64" -a -e "/usr/include/gnu/stubs-32.h" -a "${PN}" == "pseudo-native" -a "${NO32LIBS}" != "1" ]; then
>   		# We need the 32-bit libpseudo on a 64-bit machine...
> -		./configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --bits=32
> +		./configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --bits=32 --without-rpath
We might still need this rpath or something similar since the nativesdk 
now breaks not finding the correct version of the included libc.so.6

/opt/poky/1.2/sysroots/x86_64-pokysdk-linux/usr/bin/pseudo -P 
/opt/poky/1.2/sysroots/x86_64-pokysdk-linux/usr tar -C "/tmp/opt" -xjf 
"/intel/home/sgw/Downloads/core-image-minimal-qemux86-64.tar.bz2"
tar: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.14' not found 
(required by 
/opt/poky/1.2/sysroots/x86_64-pokysdk-linux/usr/lib/pseudo/lib64/libpseudo.so)

See also bug 1968

I do have a libc.so.6.

/opt/poky/1.2/sysroots/x86_64-pokysdk-linux/lib/libc.so.6 -> libc-2.15.so

Sau!

>   		oe_runmake ${MAKEOPTS} libpseudo
>   		# prevent it from removing the lib, but remove everything else
>   		make 'LIB=foo' ${MAKEOPTS} distclean
> diff --git a/meta/recipes-devtools/pseudo/pseudo_1.3.bb b/meta/recipes-devtools/pseudo/pseudo_1.3.bb
> index e7a329c..080b739 100644
> --- a/meta/recipes-devtools/pseudo/pseudo_1.3.bb
> +++ b/meta/recipes-devtools/pseudo/pseudo_1.3.bb
> @@ -1,6 +1,6 @@
>   require pseudo.inc
>
> -PR = "r7"
> +PR = "r8"
>
>   SRC_URI = "http://www.yoctoproject.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2"
>
> diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
> index 9414c79..7857275 100644
> --- a/meta/recipes-devtools/pseudo/pseudo_git.bb
> +++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
> @@ -2,7 +2,7 @@ require pseudo.inc
>
>   SRCREV = "f0375c9aaefbccfd41aebbf6d332bb4d9e8f980c"
>   PV = "1.3+git${SRCPV}"
> -PR = "r22"
> +PR = "r23"
>
>   DEFAULT_PREFERENCE = "-1"
>


