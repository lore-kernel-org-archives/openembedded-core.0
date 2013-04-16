Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1USDhd-0008LZ-81 for openembedded-core@lists.openembedded.org;
	Tue, 16 Apr 2013 23:46:26 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3GLT3cc022327; Tue, 16 Apr 2013 22:29:03 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id xUSWht9c1cDf; Tue, 16 Apr 2013 22:29:03 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3GLSv3M022314
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 16 Apr 2013 22:28:59 +0100
Message-ID: <1366147707.8670.110.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 16 Apr 2013 22:28:27 +0100
In-Reply-To: <1366115411-15270-1-git-send-email-Martin.Jansa@gmail.com>
References: <1366115411-15270-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: use AC_CHECK_TOOL instead of AC_PATH_TOOL when checking objcopy, strings, gperf
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
X-List-Received-Date: Tue, 16 Apr 2013 21:46:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-04-16 at 14:30 +0200, Martin Jansa wrote:
> * with external toolchain I have different HOST_PREFIX and HOST_SYS
>   AC_PATH_TOOL is using HOST_SYS as prefix and fails to find objcopy
>   then it tries objcopy without prefix which is found on host, but
>   that objcopy does not work for arm libs
> * with internal toolchain gperf is not prefixed with HOST_PREFIX, but
>   fallback to "gperf" only finds the one in native sysroot first
> * based on http://lists.linuxtogo.org/pipermail/openembedded-core/2013-April/037985.html
>   Khem suggested to export strings and gperf from bitbake.conf instead
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/conf/bitbake.conf                             |  2 ++
>  ...se-AC_CHECK_TOOL-for-objcopy-strings-and-.patch | 41 ++++++++++++++++++++++
>  meta/recipes-core/systemd/systemd_199.bb           |  1 +
>  3 files changed, 44 insertions(+)
>  create mode 100644 meta/recipes-core/systemd/systemd/0001-configure-use-AC_CHECK_TOOL-for-objcopy-strings-and-.patch
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index cd5d61e..a84ae38 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -455,6 +455,8 @@ export RANLIB = "${HOST_PREFIX}ranlib"
>  export STRIP = "${HOST_PREFIX}strip"
>  export OBJCOPY = "${HOST_PREFIX}objcopy"
>  export OBJDUMP = "${HOST_PREFIX}objdump"
> +export STRINGS = "${HOST_PREFIX}strings"
> +export GPERF = "${HOST_PREFIX}gperf"
>  export NM = "${HOST_PREFIX}nm"
>  PYTHON = "${@sys.executable}"

At this point in the release cycle I'm not adding new global exports to
ever piece of software in the system. I appreciate in theory nothing bad
should happen however the reality is sometimes different :/. I'm taking
a *lot* of risks in including as many changes as I have, I don't want to
add this one too.

I'm also not sure its a good idea in general to build up more exports in
bitbake.conf if we haven't yet needed them.

I'll take a version of this which does this in the systemd recipe.

Cheers,

Richard

> diff --git a/meta/recipes-core/systemd/systemd/0001-configure-use-AC_CHECK_TOOL-for-objcopy-strings-and-.patch b/meta/recipes-core/systemd/systemd/0001-configure-use-AC_CHECK_TOOL-for-objcopy-strings-and-.patch
> new file mode 100644
> index 0000000..d847bbc
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0001-configure-use-AC_CHECK_TOOL-for-objcopy-strings-and-.patch
> @@ -0,0 +1,41 @@
> +From d6f92bcbbae9a577adb9588c7b2783a5d0bf343d Mon Sep 17 00:00:00 2001
> +From: Martin Jansa <Martin.Jansa@gmail.com>
> +Date: Tue, 16 Apr 2013 14:20:41 +0200
> +Subject: [PATCH] configure: use AC_CHECK_TOOL for objcopy, strings and gperf
> +
> +* using AC_PATH_TOOL does not allow to override it from shell environment
> +  which is useful when cross-compiling
> +* with external toolchain I have different HOST_PREFIX and HOST_SYS
> +  AC_PATH_TOOL is using HOST_SYS as prefix and fails to find objcopy
> +  which is available only as ${TARGET_PREFIX}objcopy then it tries
> +  objcopy without prefix which is found on host, but that objcopy
> +  does not work for !host (e.g. arm when building on x86) libs
> +
> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> +Upstream-Status: Submitted
> +http://lists.freedesktop.org/archives/systemd-devel/2013-April/010468.html
> +
> +---
> + configure.ac | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 33b0ca9..519f1a9 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -86,9 +86,9 @@ GOBJECT_INTROSPECTION_CHECK([1.31.1])
> +    AM_CONDITIONAL([HAVE_INTROSPECTION], [false])
> +    enable_introspection=no])
> + 
> +-AC_PATH_TOOL(OBJCOPY, objcopy)
> +-AC_PATH_TOOL(STRINGS, strings)
> +-AC_PATH_TOOL(GPERF, gperf)
> ++AC_CHECK_TOOL(OBJCOPY, objcopy)
> ++AC_CHECK_TOOL(STRINGS, strings)
> ++AC_CHECK_TOOL(GPERF, gperf)
> + if test -z "$GPERF" ; then
> +         AC_MSG_ERROR([*** gperf not found])
> + fi
> +-- 
> +1.8.1.5
> +
> diff --git a/meta/recipes-core/systemd/systemd_199.bb b/meta/recipes-core/systemd/systemd_199.bb
> index d22df12..e8ad8f5 100644
> --- a/meta/recipes-core/systemd/systemd_199.bb
> +++ b/meta/recipes-core/systemd/systemd_199.bb
> @@ -27,6 +27,7 @@ SRC_URI = "http://www.freedesktop.org/software/systemd/systemd-${PV}.tar.xz \
>             file://0002-readahead-chunk-on-spinning-media.patch \
>             file://0003-readahead-cleanups.patch \
>             file://0013-systemd-sysctl-Handle-missing-etc-sysctl.conf-proper.patch \
> +           file://0001-configure-use-AC_CHECK_TOOL-for-objcopy-strings-and-.patch \
>             file://199-firmware.patch \
>             file://init \
>            "




