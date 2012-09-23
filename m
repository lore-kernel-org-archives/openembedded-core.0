Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TFvYa-0001AJ-8R
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 01:25:48 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 23 Sep 2012 16:12:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,471,1344236400"; d="scan'208";a="148166943"
Received: from unknown (HELO [10.255.14.15]) ([10.255.14.15])
	by AZSMGA002.ch.intel.com with ESMTP; 23 Sep 2012 16:12:59 -0700
Message-ID: <505F977A.7000206@linux.intel.com>
Date: Sun, 23 Sep 2012 16:12:58 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Phil Blundell <philb@gnu.org>
References: <1348331093.4444.218.camel@x121e.pbcl.net>
In-Reply-To: <1348331093.4444.218.camel@x121e.pbcl.net>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] util-linux: Ensure that ${sbindir} is respected
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
X-List-Received-Date: Sun, 23 Sep 2012 23:25:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/22/2012 09:24 AM, Phil Blundell wrote:
> The configure script uses a hard-coded value for ${usrsbin_execdir},
> which is the path that we know as ${sbindir}.  Adjust configure to take
> this from the environment if it's set there, and have do_configure()
> pass it in.
>
> Signed-off-by: Phil Blundell <pb@pbcl.net>
> ---
>   meta/recipes-core/util-linux/util-linux.inc        |    4 +++-
>   .../util-linux/util-linux/configure-sbindir.patch  |   13 +++++++++++++
>   meta/recipes-core/util-linux/util-linux_2.21.2.bb  |    3 ++-
>   3 files changed, 18 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
>
> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
> index 79e0608..2c5267f 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -38,7 +38,9 @@ EXTRA_OECONF = "--libdir=${base_libdir} --disable-use-tty-group \
>                   --enable-kill --enable-last --enable-mesg --enable-partx \
>                   --enable-raw --enable-rdev --enable-reset --disable-login-utils \
>                   --enable-write --enable-arch --enable-mount --with-fsprobe=builtin \
> -                --enable-libuuid --enable-libblkid --enable-fsck --without-udev"
> +                --enable-libuuid --enable-libblkid --enable-fsck --without-udev \
> +		usrsbin_execdir='${sbindir}' \
> +"
>
>   FILES_${PN}-doc += "${datadir}/getopt/getopt-*.*"
>
> diff --git a/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch b/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
> new file mode 100644
> index 0000000..5d0a59b
> --- /dev/null
> +++ b/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
> @@ -0,0 +1,13 @@

No Patch Header, Upstream-Status: and Signed-off-by:

Sau!


> +--- util-linux-2.21.2/configure.ac~	2012-09-22 09:29:12.354215377 +0100
> ++++ util-linux-2.21.2/configure.ac	2012-09-22 16:47:14.713628946 +0100
> +@@ -67,7 +67,9 @@
> + usrbin_execdir='${exec_prefix}/bin'
> + AC_SUBST([usrbin_execdir])
> +
> +-usrsbin_execdir='${exec_prefix}/sbin'
> ++if [ -z "$usrsbin_execdir" ]; then
> ++   usrsbin_execdir='${exec_prefix}/sbin'
> ++fi
> + AC_SUBST([usrsbin_execdir])
> +
> + usrlib_execdir='${exec_prefix}/'$libdirname
> diff --git a/meta/recipes-core/util-linux/util-linux_2.21.2.bb b/meta/recipes-core/util-linux/util-linux_2.21.2.bb
> index 6ef3163..e8f00fc 100644
> --- a/meta/recipes-core/util-linux/util-linux_2.21.2.bb
> +++ b/meta/recipes-core/util-linux/util-linux_2.21.2.bb
> @@ -1,5 +1,5 @@
>   MAJOR_VERSION = "2.21"
> -PR = "r2"
> +PR = "r3"
>   require util-linux.inc
>
>   # note that `lscpu' is under GPLv3+
> @@ -8,6 +8,7 @@ LICENSE_${PN}-lscpu = "GPLv3+"
>   SRC_URI += "file://util-linux-ng-replace-siginterrupt.patch \
>               file://util-linux-ng-2.16-mount_lock_path.patch \
>               file://uclibc-__progname-conflict.patch \
> +	    file://configure-sbindir.patch \
>   "
>
>   SRC_URI[md5sum] = "b75b3cfecb943f74338382fde693c2c3"
>


