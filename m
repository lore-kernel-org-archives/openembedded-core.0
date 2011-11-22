Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RSvWE-0000VF-DV
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Nov 2011 19:56:34 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 22 Nov 2011 10:50:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="78909778"
Received: from unknown (HELO [10.255.12.15]) ([10.255.12.15])
	by orsmga002.jf.intel.com with ESMTP; 22 Nov 2011 10:50:02 -0800
Message-ID: <4ECBEED9.5070409@linux.intel.com>
Date: Tue, 22 Nov 2011 10:50:01 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1321528387.git.xiaofeng.yan@windriver.com>
	<ad4d06cb79983b6a1a06b5cdd83e565af031b05f.1321528387.git.xiaofeng.yan@windriver.com>
In-Reply-To: <ad4d06cb79983b6a1a06b5cdd83e565af031b05f.1321528387.git.xiaofeng.yan@windriver.com>
Subject: Re: [PATCH 1/1] gtk+: Have gtk+ pick up ${NM} from the environment
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
X-List-Received-Date: Tue, 22 Nov 2011 18:56:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/17/2011 03:16 AM, Xiaofeng Yan wrote:
> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>
> hen gtk+ configures, it should pick up ${NM} from the environment \
> if it is defined, instead of just looking for "nm".
>
> Signed-off-by: Xiaofeng Yan<xiaofeng.yan@windriver.com>
> ---
>   .../gtk+/gtk+-2.24.6/configure-nm.patch            |   14 ++++++++++++++
>   meta/recipes-gnome/gtk+/gtk+_2.24.6.bb             |    3 ++-
>   2 files changed, 16 insertions(+), 1 deletions(-)
>   create mode 100644 meta/recipes-gnome/gtk+/gtk+-2.24.6/configure-nm.patch
>
> diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.6/configure-nm.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.6/configure-nm.patch
> new file mode 100644
> index 0000000..5aeef50
> --- /dev/null
> +++ b/meta/recipes-gnome/gtk+/gtk+-2.24.6/configure-nm.patch
> @@ -0,0 +1,14 @@
> +Upstream-Status: Inappropriate [configuration]
I am not sure I would agree here, I think that the upstream might be 
interested in having a cross-compilation fix.

Sau!

> +Signed-Off-By: Xiaofeng Yan<xiaofeng.yan@windriver.com>
> +# Pick up ${NM} from the environment
> +--- a/configure.in
> ++++ b/configure.in
> +@@ -190,7 +190,7 @@
> + AC_SYS_LARGEFILE
> +
> + AM_PROG_AS
> +-AC_PATH_PROG(NM, nm, nm)
> ++AC_CHECK_TOOLS(NM, [$NM nm], nm)
> +
> + dnl Initialize maintainer mode
> + AM_MAINTAINER_MODE
> diff --git a/meta/recipes-gnome/gtk+/gtk+_2.24.6.bb b/meta/recipes-gnome/gtk+/gtk+_2.24.6.bb
> index cd5c8cb..ade0a2d 100644
> --- a/meta/recipes-gnome/gtk+/gtk+_2.24.6.bb
> +++ b/meta/recipes-gnome/gtk+/gtk+_2.24.6.bb
> @@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
>   SRC_URI = "http://download.gnome.org/sources/gtk+/2.24/gtk+-${PV}.tar.bz2 \
>              file://xsettings.patch \
>              file://run-iconcache.patch \
> +           file://configure-nm.patch \
>              file://hardcoded_libtool.patch \
>              file://no-demos.patch \
>              file://cellrenderer-cairo.patch;striplevel=0 \
> @@ -26,7 +27,7 @@ SRC_URI = "http://download.gnome.org/sources/gtk+/2.24/gtk+-${PV}.tar.bz2 \
>   #        file://combo-arrow-size.patch;striplevel=0
>   #            file://configurefix.patch
>
> -PR = "r1"
> +PR = "r2"
>
>   SRC_URI[md5sum] = "421100f6597e613234f8dead6091a9fe"
>   SRC_URI[sha256sum] = "6f45bdbf9ea27eb3b5f977d7ee2365dede0d0ce454985680c26e5210163bbf37"


