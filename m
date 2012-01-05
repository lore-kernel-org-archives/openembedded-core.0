Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RivWA-0004Bf-Hi
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 23:10:39 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 05 Jan 2012 14:03:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="94952185"
Received: from unknown (HELO [10.255.13.127]) ([10.255.13.127])
	by orsmga002.jf.intel.com with ESMTP; 05 Jan 2012 14:03:14 -0800
Message-ID: <4F061E22.6030506@linux.intel.com>
Date: Thu, 05 Jan 2012 14:03:14 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1325792209.git.otavio@ossystems.com.br>
	<268ead6ebfc8fbfdb9f6bf55352103b984bdf341.1325792209.git.otavio@ossystems.com.br>
In-Reply-To: <268ead6ebfc8fbfdb9f6bf55352103b984bdf341.1325792209.git.otavio@ossystems.com.br>
Subject: Re: [PATCH 01/10] qt4-graphics-system: add
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
X-List-Received-Date: Thu, 05 Jan 2012 22:10:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/05/2012 11:37 AM, Otavio Salvador wrote:
> Allow setting default runtime graphics system engine for Qt4
> applications per machine.
>
> Depending on the GPU and Xorg driver, this can boost and impact
> significantly the drawing performance. The default setting is to
> 'raster' as this offer best performance for most machines GPUs.
>
> Signed-off-by: Otavio Salvador<otavio@ossystems.com.br>
> ---
>   .../qt4-graphics-system/qt4-graphics-system_1.0.bb |   27 ++++++++++++++++++++
>   1 files changed, 27 insertions(+), 0 deletions(-)
>   create mode 100644 meta/recipes-qt/qt4-graphics-system/qt4-graphics-system_1.0.bb
>
> diff --git a/meta/recipes-qt/qt4-graphics-system/qt4-graphics-system_1.0.bb b/meta/recipes-qt/qt4-graphics-system/qt4-graphics-system_1.0.bb
> new file mode 100644
> index 0000000..b3aa1e5
> --- /dev/null
> +++ b/meta/recipes-qt/qt4-graphics-system/qt4-graphics-system_1.0.bb
> @@ -0,0 +1,27 @@
> +DESCRIPTION = "Set default Qt4 Graphics System to ${QT_GRAPHICS_SYSTEM}"
> +SECTION = "x11/base"
> +LICENSE = "MIT-X"
> +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> +
> +QT_GRAPHICS_SYSTEM ?= "raster"
> +
> +# xserver-common, x11-common
> +VIRTUAL-RUNTIME_xserver_common ?= "x11-common"
> +
Should the be initialized here or in one of the Qt tasks?

> +def _get_extra_rdepends(d):
> +    gs = d.getVar('QT_GRAPHICS_SYSTEM', 1)
> +    if gs == "opengl":
> +        return "qt4-plugin-graphicssystems-glgraphicssystem"
> +
Is this package available in OE-Core?

> +    return ""
> +
> +do_install () {
> +	install -d ${D}/${sysconfdir}/X11/Xsession.d/
> +	cfg_file=${D}/${sysconfdir}/X11/Xsession.d/85xqt-graphicssystem
> +	echo "export QT_GRAPHICSSYSTEM=${QT_GRAPHICS_SYSTEM}">  $cfg_file
> +	chmod +x $cfg_file
> +}
> +
> +RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_xserver_common} ${@_get_extra_rdepends(d)}"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"


