Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QlOMb-0001C2-ML
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 18:50:41 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 25 Jul 2011 09:32:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,263,1309762800"; d="scan'208";a="31702875"
Received: from unknown (HELO [10.255.14.61]) ([10.255.14.61])
	by orsmga001.jf.intel.com with ESMTP; 25 Jul 2011 09:32:16 -0700
Message-ID: <4E2D9A90.6070309@linux.intel.com>
Date: Mon, 25 Jul 2011 09:32:16 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1311603506-14101-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
In-Reply-To: <1311603506-14101-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: Re: [PATCH] ncurses: enforce creation of pkg-config files
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
X-List-Received-Date: Mon, 25 Jul 2011 16:50:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/25/2011 07:18 AM, Enrico Scholz wrote:
> ncurses does not create its .pc files when the /usr/lib/pkg-config
> directory does not exist in the sysroot.  Because ncurses will be built
> very early, this directory might be missing and .pc files will not be
> installed.
>
> Signed-off-by: Enrico Scholz<enrico.scholz@sigma-chemnitz.de>
> ---
>   .../ncurses/ncurses-5.9/pkgconfig-initial.patch    |   30 ++++++++++++++++++++
>   meta/recipes-core/ncurses/ncurses_5.9.bb           |    3 +-
>   2 files changed, 32 insertions(+), 1 deletions(-)
>   create mode 100644 meta/recipes-core/ncurses/ncurses-5.9/pkgconfig-initial.patch
>
> diff --git a/meta/recipes-core/ncurses/ncurses-5.9/pkgconfig-initial.patch b/meta/recipes-core/ncurses/ncurses-5.9/pkgconfig-initial.patch
> new file mode 100644
> index 0000000..e0cc9b0
> --- /dev/null
> +++ b/meta/recipes-core/ncurses/ncurses-5.9/pkgconfig-initial.patch
> @@ -0,0 +1,30 @@
> +Do not check for the existence of /usr/lib/pkg-config directory
> +
> +directory might not exist yet when building oe from scratch.
> +
Enrico,

Please add a Signed-off-by line and also review the Patch guidelines:

http://wiki.openembedded.org/index.php/Commit_Patch_Message_Guidelines

If possible, please also add the optional Upstream-Status: info.

Thanks
	Sau!


> +Index: ncurses-5.9/configure
> +===================================================================
> +--- ncurses-5.9.orig/configure
> ++++ ncurses-5.9/configure
> +@@ -3626,7 +3626,7 @@ echo $ECHO_N "checking if we should inst
> +		PKG_CONFIG_LIBDIR=`echo "$PKG_CONFIG" | sed -e 's,/[^/]*/[^/]*$,,'`/lib/pkgconfig
> +	fi
> +	PKG_CONFIG_LIBDIR=`echo "$PKG_CONFIG_LIBDIR" | sed -e 's/^://' -e 's/:.*//'`
> +-	if test -n "$PKG_CONFIG_LIBDIR"&&  test -d "$PKG_CONFIG_LIBDIR" ; then
> ++	if test -n "$PKG_CONFIG_LIBDIR" ; then
> +
> + # Check whether --enable-pc-files or --disable-pc-files was given.
> + if test "${enable_pc_files+set}" = set; then
> +Index: ncurses-5.9/configure.in
> +===================================================================
> +--- ncurses-5.9.orig/configure.in
> ++++ ncurses-5.9/configure.in
> +@@ -177,7 +177,7 @@ if test "$PKG_CONFIG" != no ; then
> +		PKG_CONFIG_LIBDIR=`echo "$PKG_CONFIG" | sed -e 's,/[[^/]]*/[[^/]]*$,,'`/lib/pkgconfig
> +	fi
> +	PKG_CONFIG_LIBDIR=`echo "$PKG_CONFIG_LIBDIR" | sed -e 's/^://' -e 's/:.*//'`
> +-	if test -n "$PKG_CONFIG_LIBDIR"&&  test -d "$PKG_CONFIG_LIBDIR" ; then
> ++	if test -n "$PKG_CONFIG_LIBDIR" ; then
> +		AC_ARG_ENABLE(pc-files,
> +			[  --enable-pc-files       generate and install .pc files for pkg-config],
> +			[enable_pc_files=$enableval],
> diff --git a/meta/recipes-core/ncurses/ncurses_5.9.bb b/meta/recipes-core/ncurses/ncurses_5.9.bb
> index 6d23c0c..c980b73 100644
> --- a/meta/recipes-core/ncurses/ncurses_5.9.bb
> +++ b/meta/recipes-core/ncurses/ncurses_5.9.bb
> @@ -1,9 +1,10 @@
>   require ncurses.inc
>
> -PR = "${INC_PR}.1"
> +PR = "${INC_PR}.2"
>
>   SRC_URI += "file://tic-hang.patch \
>               file://config.cache \
> +            file://pkgconfig-initial.patch \
>   "
>
>   SRC_URI[md5sum] = "8cb9c412e5f2d96bc6f459aa8c6282a1"


