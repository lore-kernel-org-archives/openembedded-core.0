Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TgbXq-0000LD-MO
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Dec 2012 14:31:18 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 06 Dec 2012 05:16:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,230,1355126400"; d="scan'208";a="259900925"
Received: from unknown (HELO helios.localnet) ([10.252.123.5])
	by fmsmga002.fm.intel.com with ESMTP; 06 Dec 2012 05:16:51 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Mark Hatle <mark.hatle@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 06 Dec 2012 13:16:50 +0000
Message-ID: <3714964.orMXZYbTye@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.3 (Linux/3.5.0-19-generic; KDE/4.9.3; i686; ; )
In-Reply-To: <0d97e14c48d2368ad4801994416eba990654254d.1354641032.git.mark.hatle@windriver.com>
References: <cover.1354641032.git.mark.hatle@windriver.com>
	<0d97e14c48d2368ad4801994416eba990654254d.1354641032.git.mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: Re: [PATCH 20/22] pkgconfig: Add a manual dependency of pkgconfig(pkg-config)
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
X-List-Received-Date: Thu, 06 Dec 2012 13:31:19 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 04 December 2012 11:14:52 Mark Hatle wrote:
> The libtelepathy-glib-dev package contains a .pc file that has a requires
> of pkgconfig(pkg-config) > 0.21 in it.  In order to satisfy this requirement
> we add a manual RPROVIDE to the pkgconfig package.
> 
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  meta/recipes-devtools/pkgconfig/pkgconfig.inc     |    5 +++++
>  meta/recipes-devtools/pkgconfig/pkgconfig_0.25.bb |    2 +-
>  meta/recipes-devtools/pkgconfig/pkgconfig_git.bb  |    1 +
>  3 files changed, 7 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig.inc
> b/meta/recipes-devtools/pkgconfig/pkgconfig.inc index 83a9cdf..27d4071
> 100644
> --- a/meta/recipes-devtools/pkgconfig/pkgconfig.inc
> +++ b/meta/recipes-devtools/pkgconfig/pkgconfig.inc
> @@ -37,3 +37,8 @@ BBCLASSEXTEND = "native nativesdk"
>  # files.
>  FILES_${PN}-dev = ""
>  FILES_${PN} += "${datadir}/aclocal/pkg.m4"
> +
> +# When using the RPM generated automatic package dependencies, some
> packages +# will end up requiring 'pkgconfig(pkg-config)'.  Allow this
> behavior by +# specifying an appropriate provide.
> +RPROVIDES_${PN} += "pkgconfig(pkg-config) (= ${PV})"
> diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig_0.25.bb
> b/meta/recipes-devtools/pkgconfig/pkgconfig_0.25.bb index 1e60c54..d0a2b1f
> 100644
> --- a/meta/recipes-devtools/pkgconfig/pkgconfig_0.25.bb
> +++ b/meta/recipes-devtools/pkgconfig/pkgconfig_0.25.bb
> @@ -1,6 +1,6 @@
>  require pkgconfig.inc
> 
> -PR = "r5"
> +PR = "r6"
> 
>  SRC_URI[md5sum] = "a3270bab3f4b69b7dc6dbdacbcae9745"
>  SRC_URI[sha256sum] =
> "3ba691ee2431f32ccb8efa131e59bf23e37f122dc66791309023ca6dcefcd10e" diff
> --git a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
> b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb index 6271992..d5ec8fc
> 100644
> --- a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
> +++ b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
> @@ -8,6 +8,7 @@ S = "${WORKDIR}/git/"
> 
>  SRCREV = "66d49f1375fec838bcd301bb4ca2ef76cee0e47c"
>  PV = "0.23+git${SRCPV}"
> +PR = "r1"
> 
>  DEFAULT_PREFERENCE = "-1"

Because this tends to come in via file dependencies generated during
do_package, a package for pkgconfig won't be forced to be built; so if nothing
else depends upon pkgconfig then you can get a failure during do_rootfs (as I
have here building core-image-lsb with DISTRO = "poky-lsb" from scratch with
these changes on top of master):

| Note: to be installed:  psplash@i586 packagegroup-core-basic@all
| packagegroup-core-ssh-openssh@all packagegroup-core-lsb@all
| packagegroup-base-extended@qemux86 packagegroup-core-boot@qemux86
| locale-base-en-us@i586 locale-base-en-gb@i586
| Loading cache...
| Updating cache...               ######################################## 
[100%]
| 
| Computing transaction...error: Can't install libz-dev-1.2.7-r0@i586: 
| no package provides pkgconfig

I'm not quite sure what the best fix for that is though.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


