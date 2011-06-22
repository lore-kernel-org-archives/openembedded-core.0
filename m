Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QZPno-00048g-Vc for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 17:57:17 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5MFrh2m005455
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 16:53:43 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05275-04 for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 16:53:39 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5MFrcYQ005449
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 16:53:38 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1a80a4e3bd1868367784ed77e7912935eb30748b.1308302102.git.wenzong.fan@windriver.com>
References: <cover.1308302102.git.wenzong.fan@windriver.com>
	<1a80a4e3bd1868367784ed77e7912935eb30748b.1308302102.git.wenzong.fan@windriver.com>
Date: Wed, 22 Jun 2011 16:53:20 +0100
Message-ID: <1308758000.20015.77.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] ccache: Integrate ccache-native
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
X-List-Received-Date: Wed, 22 Jun 2011 15:57:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-06-17 at 17:19 +0800, wenzong.fan@windriver.com wrote:
> From: Wenzong Fan <wenzong.fan@windriver.com>
> 
> 1) Add ccache as a native tool, for getting it built automatically make
> it as the dependency of bzip2; Also, the ccache will be included by SDK
> images;
> 
> 2) Set CCACHE on a per recipe basis and add task 'mkccachedir' to create
> the CCACHE_DIR while start a package building;
> 
> 3) Remove the duplicate 'ccache.inc' from 'meta/class/'.
> 
> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> ---
>  meta/classes/base.bbclass                    |    1 +
>  meta/classes/ccache.bbclass                  |   21 +++++++++++++++++++++
>  meta/classes/ccache.inc                      |   11 -----------
>  meta/conf/bitbake.conf                       |    1 +
>  meta/recipes-core/tasks/task-core-sdk.bb     |    1 +
>  meta/recipes-devtools/ccache/ccache.inc      |   16 ++++++++++++++++
>  meta/recipes-devtools/ccache/ccache_3.1.5.bb |    8 ++++++++
>  meta/recipes-extended/bzip2/bzip2_1.0.6.bb   |    2 ++
>  8 files changed, 50 insertions(+), 11 deletions(-)
>  create mode 100644 meta/classes/ccache.bbclass
>  delete mode 100644 meta/classes/ccache.inc
>  create mode 100644 meta/recipes-devtools/ccache/ccache.inc
>  create mode 100644 meta/recipes-devtools/ccache/ccache_3.1.5.bb
> 
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index 119b052..a329b4e 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -2,6 +2,7 @@ BB_DEFAULT_TASK ?= "build"
>  
>  inherit patch
>  inherit staging
> +inherit ccache
>  
>  inherit mirrors
>  inherit utils
> diff --git a/meta/classes/ccache.bbclass b/meta/classes/ccache.bbclass
> new file mode 100644
> index 0000000..be37c18
> --- /dev/null
> +++ b/meta/classes/ccache.bbclass
> @@ -0,0 +1,21 @@
> +# Make ${CCACHE_DIR} if it is not existing
> +
> +python ccache_do_mkccachedir(){
> +	import os
> +
> +	ccache = bb.data.getVar('CCACHE', d, True)
> +	ccache_dir = bb.data.getVar('CCACHE_DIR', d, True)
> +	if len(ccache) == 0 or len(ccache_dir) == 0:
> +		return
> +
> +	try:
> +		if not os.path.isdir(ccache_dir):
> +			bb.note("Creating " + ccache_dir)
> +			os.makedirs(ccache_dir)
> +	except bb.fetch2.BBFetchException, e:
> +		raise bb.build.FuncFailed(e)
> +}
> +
> +addtask mkccachedir before do_configure
> +
> +EXPORT_FUNCTIONS do_mkccachedir

You can do this in a much simpler way by just adding:

do_configure[dirs] += "${CCACHE_DIR}"


> diff --git a/meta/classes/ccache.inc b/meta/classes/ccache.inc
> deleted file mode 100644
> index d830a1b..0000000
> --- a/meta/classes/ccache.inc
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -# Make ccache use a TMPDIR specific ccache directory if using the crosscompiler,
> -# since it isn't likely to be useful with any other toolchain than the one we just
> -# built, and would otherwise push more useful things out of the default cache.
> -
> -CCACHE_DIR_TARGET = "${TMPDIR}/ccache"
> -
> -python () {
> -    if not bb.data.inherits_class('native', d) and not bb.data.inherits_class('cross', d):
> -        bb.data.setVar('CCACHE_DIR', '${CCACHE_DIR_TARGET}', d)
> -        bb.data.setVarFlag('CCACHE_DIR', 'export', '1', d)
> -}
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 6d8a674..64b3651 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -391,6 +391,7 @@ export PATH
>  CCACHE = "${@bb.which(bb.data.getVar('PATH', d, 1), 'ccache') and 'ccache '}"
>  TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_TARGET}"
>  
> +export CCACHE_DIR = "${TMPDIR}/ccache/${TARGET_SYS}/${PN}"

Should this be HOST_SYS instead of TARGET_SYS?

>  export CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
>  export CXX = "${CCACHE}${HOST_PREFIX}g++ ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
>  export F77 = "${CCACHE}${HOST_PREFIX}g77 ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
> diff --git a/meta/recipes-core/tasks/task-core-sdk.bb b/meta/recipes-core/tasks/task-core-sdk.bb
> index 4aee0c2..52fdd75 100644
> --- a/meta/recipes-core/tasks/task-core-sdk.bb
> +++ b/meta/recipes-core/tasks/task-core-sdk.bb
> @@ -25,6 +25,7 @@ RDEPENDS_task-core-sdk = "\
>      coreutils \
>      cpp \
>      cpp-symlinks \
> +    ccache \
>      diffutils \
>      gcc \
>      gcc-symlinks \
> diff --git a/meta/recipes-devtools/ccache/ccache.inc b/meta/recipes-devtools/ccache/ccache.inc
> new file mode 100644
> index 0000000..e9f7344
> --- /dev/null
> +++ b/meta/recipes-devtools/ccache/ccache.inc
> @@ -0,0 +1,16 @@
> +SUMMARY = "a fast C/C++ compiler cache"
> +DESCRIPTION = "ccache is a compiler cache. It speeds up recompilation \
> +by caching the result of previous compilations and detecting when the \
> +same compilation is being done again. Supported languages are C, C\+\+, \
> +Objective-C and Objective-C++."
> +HOMEPAGE = "http://ccache.samba.org"
> +SECTION = "devel"
> +LICENSE = "GPLv3+"
> +
> +SRC_URI = "http://samba.org/ftp/ccache/ccache-${PV}.tar.gz"
> +
> +inherit autotools
> +
> +BBCLASSEXTEND = "native"
> +
> +TARGET_CC_ARCH += "${LDFLAGS}"
> diff --git a/meta/recipes-devtools/ccache/ccache_3.1.5.bb b/meta/recipes-devtools/ccache/ccache_3.1.5.bb
> new file mode 100644
> index 0000000..9a967b2
> --- /dev/null
> +++ b/meta/recipes-devtools/ccache/ccache_3.1.5.bb
> @@ -0,0 +1,8 @@
> +require ccache.inc
> +
> +PR = "r0"
> +LICENSE = "GPLv3+"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=80e92ec45d4fca91f127864fb9e5d932"
> +
> +SRC_URI[md5sum] = "b1a9684828eae68382d6afc98ce80d24"
> +SRC_URI[sha256sum] = "54afc35c672ce451e04a478cfc0eb74c1ba184e27ef24881206602aa0eb94d63"
> diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
> index f5b9ac1..4d445a5 100644

Please split this patch into a couple of changes, one of which just adds
the ccache-native recipe.

> --- a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
> +++ b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
> @@ -6,6 +6,8 @@ HOMEPAGE = "http://www.bzip.org/"
>  SECTION = "console/utils"
>  LICENSE = "bzip2"
>  LIC_FILES_CHKSUM = "file://LICENSE;beginline=8;endline=37;md5=40d9d1eb05736d1bfc86cfdd9106e6b2"
> +
> +DEPENDS = "ccache-native"
>  PR = "r3"
>  
>  SRC_URI = "http://www.bzip.org/${PV}/${BPN}-${PV}.tar.gz \

I'm not sure how we're going to trigger the generation of ccache-native
and I can understand the attraction of doing this but it isn't
acceptable unfortunately. Lets just drop this component of the patch for
now.

Cheers,

Richard





