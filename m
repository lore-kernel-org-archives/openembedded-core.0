Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SFznp-0007Bh-9J
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Apr 2012 05:25:33 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 05 Apr 2012 20:16:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="125862530"
Received: from unknown (HELO [10.255.12.141]) ([10.255.12.141])
	by orsmga001.jf.intel.com with ESMTP; 05 Apr 2012 20:16:19 -0700
Message-ID: <4F7E6003.1090905@linux.intel.com>
Date: Thu, 05 Apr 2012 20:16:19 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1333578516-25609-1-git-send-email-obi@opendreambox.org>
In-Reply-To: <1333578516-25609-1-git-send-email-obi@opendreambox.org>
Subject: Re: [PATCH] gst-plugins-base: fix build of subparse plugin
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
X-List-Received-Date: Fri, 06 Apr 2012 03:25:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/04/2012 03:28 PM, Andreas Oberritter wrote:
> * Fixes the following configure error by prefixing
>    PKG_CONFIG_SYSROOT_DIR:
>
> | grep: /usr/include/gstreamer-0.10/gst/gstconfig.h: No such file or directory
>
> Signed-off-by: Andreas Oberritter<obi@opendreambox.org>
> ---
>   .../configure.ac-fix-subparse-plugin.patch         |   27 ++++++++++++++++++++
>   .../gstreamer/gst-plugins-base_0.10.36.bb          |    5 ++-
>   2 files changed, 30 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-multimedia/gstreamer/gst-plugins-base-0.10.36/configure.ac-fix-subparse-plugin.patch
>
> diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-base-0.10.36/configure.ac-fix-subparse-plugin.patch b/meta/recipes-multimedia/gstreamer/gst-plugins-base-0.10.36/configure.ac-fix-subparse-plugin.patch
> new file mode 100644
> index 0000000..b8602c8
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gst-plugins-base-0.10.36/configure.ac-fix-subparse-plugin.patch
> @@ -0,0 +1,27 @@
> +Upstream-Status: Submitted [similar patch by other author, bugzilla]
> +Bugtracker-URL: https://bugzilla.gnome.org/show_bug.cgi?id=663600
> +
> +Prepend PKG_CONFIG_SYSROOT to includedir, so configure doesn't
> +search for gstconfig.h in /usr/include.
> +
> +Signed-off-by: Andreas Oberritter<obi@opendreambox.org>
> +---
> + configure.ac |    2 +-
> + 1 files changed, 1 insertions(+), 1 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 1901bcf..460fb0a 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -435,7 +435,7 @@ AG_GST_CHECK_PLUGIN(volume)
> + dnl check for gstreamer core features (subsystems)
> + dnl FIXME: this assumes srcdir == builddir for uninstalled setups
> + GST_CONFIGPATH=`$PKG_CONFIG --variable=includedir gstreamer-0.10`"/gst/gstconfig.h"
> +-AG_GST_PARSE_SUBSYSTEM_DISABLES($GST_CONFIGPATH)
> ++AG_GST_PARSE_SUBSYSTEM_DISABLES($PKG_CONFIG_SYSROOT_DIR$GST_CONFIGPATH)
> + AM_CONDITIONAL(USE_XML, test $GST_DISABLE_XML != "1")
> +
> + dnl disable plug-ins that require libxml2's HTML support if it is not available
> +--
> +1.7.5.4
> +
> diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb
> index 5499829..da4a726 100644
> --- a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb
> +++ b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb
> @@ -9,12 +9,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
>   DEPENDS += "${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxv', '', d)}"
>   DEPENDS += "alsa-lib freetype liboil libogg libvorbis libtheora avahi util-linux tremor"
>
> -SRC_URI += " file://gst-plugins-base-tremor.patch"
> +SRC_URI += "file://gst-plugins-base-tremor.patch \
> +            file://configure.ac-fix-subparse-plugin.patch"
>
>   SRC_URI[md5sum] = "776c73883e567f67b9c4a2847d8d041a"
>   SRC_URI[sha256sum] = "2cd3b0fa8e9b595db8f514ef7c2bdbcd639a0d63d154c00f8c9b609321f49976"
>
> -PR = "r2"
> +PR = "r3"
>
>   inherit gettext
>

Merged into OE-Core

Thanks
	Sau!



