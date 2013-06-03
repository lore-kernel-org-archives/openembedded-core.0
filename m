Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 03AD061EBD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2013 20:39:36 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 03 Jun 2013 13:39:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,795,1363158000"; d="scan'208";a="311727502"
Received: from unknown (HELO [10.255.12.158]) ([10.255.12.158])
	by azsmga001.ch.intel.com with ESMTP; 03 Jun 2013 13:39:32 -0700
Message-ID: <51ACFF04.80101@linux.intel.com>
Date: Mon, 03 Jun 2013 13:39:32 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>
References: <cover.1370012689.git.ross.burton@intel.com>
	<5bed792688d848b38d1565e2705b1f9dca7a17d5.1370012689.git.ross.burton@intel.com>
In-Reply-To: <5bed792688d848b38d1565e2705b1f9dca7a17d5.1370012689.git.ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 02/11] at-spi2: add -core and -atk, for GTK+ 3.8
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Jun 2013 20:39:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/31/2013 08:05 AM, Ross Burton wrote:
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/recipes-support/atk/at-spi2-atk_2.8.1.bb  |   19 +++++++++++++++++++
>   meta/recipes-support/atk/at-spi2-core_2.8.0.bb |   17 +++++++++++++++++
>   2 files changed, 36 insertions(+)
>   create mode 100644 meta/recipes-support/atk/at-spi2-atk_2.8.1.bb
>   create mode 100644 meta/recipes-support/atk/at-spi2-core_2.8.0.bb
>

Ross,

I ran into a do_configure issue with this new recipe, the at-spi2-core 
failed to configure on my local test machine.

Possibly this is the reason:
> configure:13783: checking alignment of char
> configure:13819: result: 0
> configure:13822: error: Failed to find alignment. Check config.log for details.

Sau!



> diff --git a/meta/recipes-support/atk/at-spi2-atk_2.8.1.bb b/meta/recipes-support/atk/at-spi2-atk_2.8.1.bb
> new file mode 100644
> index 0000000..32cbe3b
> --- /dev/null
> +++ b/meta/recipes-support/atk/at-spi2-atk_2.8.1.bb
> @@ -0,0 +1,19 @@
> +SUMMARY = "AT-SPI 2 Toolkit Bridge"
> +LICENSE = "LGPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=e9f288ba982d60518f375b5898283886"
> +
> +MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
> +
> +SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
> +SRC_URI[md5sum] = "854e36a2538bea50bc08d33aa9499bb2"
> +SRC_URI[sha256sum] = "eb659b94fde6dc0a2f584c9121a5e6d39a4c8aa297d21d8f9032f7a8a775fd06"
> +
> +DEPENDS = "dbus glib-2.0 atk at-spi2-core"
> +
> +inherit autotools
> +
> +PACKAGES =+ "${PN}-gnome ${PN}-gtk2"
> +
> +FILES_${PN}-gnome = "${libdir}/gnome-settings-daemon-3.0/gtk-modules"
> +FILES_${PN}-gtk2 = "${libdir}/gtk-2.0/modules/libatk-bridge.*"
> +FILES_${PN}-dbg += "${libdir}/gtk-2.0/modules/.debug"
> diff --git a/meta/recipes-support/atk/at-spi2-core_2.8.0.bb b/meta/recipes-support/atk/at-spi2-core_2.8.0.bb
> new file mode 100644
> index 0000000..29851bb
> --- /dev/null
> +++ b/meta/recipes-support/atk/at-spi2-core_2.8.0.bb
> @@ -0,0 +1,17 @@
> +SUMMARY = "Assistive Technology Service Provider Interface (dbus core)"
> +LICENSE = "LGPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=e9f288ba982d60518f375b5898283886"
> +
> +MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
> +
> +SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
> +SRC_URI[md5sum] = "93b57d5d56d15d1222ddf2386e2f869f"
> +SRC_URI[sha256sum] = "1861a30fc7f583d5a567a0ba547db67ce9bd294f0d1c9f7403c96a10a481c458"
> +
> +DEPENDS = "dbus glib-2.0 virtual/libx11 libxi"
> +
> +inherit autotools gtk-doc
> +
> +EXTRA_OECONF = "--disable-introspection --disable-xevie"
> +
> +FILES_${PN} += "${datadir}/dbus-1/services/*.service"
>

