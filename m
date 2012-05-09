Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SSGWq-0002sG-90
	for openembedded-core@lists.openembedded.org;
	Thu, 10 May 2012 01:42:44 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 09 May 2012 16:32:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="141125103"
Received: from unknown (HELO [10.255.12.218]) ([10.255.12.218])
	by azsmga001.ch.intel.com with ESMTP; 09 May 2012 16:32:49 -0700
Message-ID: <4FAAFEA1.8060907@linux.intel.com>
Date: Wed, 09 May 2012 16:32:49 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120424 Thunderbird/12.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1335920401-23586-1-git-send-email-otavio@ossystems.com.br>
In-Reply-To: <1335920401-23586-1-git-send-email-otavio@ossystems.com.br>
Subject: Re: [PATCH] qt4-graphics-system: set graphic system in profile instead of X11 session
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
X-List-Received-Date: Wed, 09 May 2012 23:42:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/01/2012 06:00 PM, Otavio Salvador wrote:
> To allow the use of Qt applications started manually to use the
> configured graphics system the setting needs to be available in user
> environment. This moves the setting to /etc/profile.d ensuring it is
> set and available. This allow the removal of x11-common as dependency.
>
> Signed-off-by: Otavio Salvador<otavio@ossystems.com.br>
> ---
>   .../qt4-graphics-system/qt4-graphics-system_1.0.bb |   12 +++++-------
>   1 files changed, 5 insertions(+), 7 deletions(-)
>
> diff --git a/meta/recipes-qt/qt4-graphics-system/qt4-graphics-system_1.0.bb b/meta/recipes-qt/qt4-graphics-system/qt4-graphics-system_1.0.bb
> index bae0340..e816a90 100644
> --- a/meta/recipes-qt/qt4-graphics-system/qt4-graphics-system_1.0.bb
> +++ b/meta/recipes-qt/qt4-graphics-system/qt4-graphics-system_1.0.bb
> @@ -3,10 +3,9 @@ SECTION = "x11/base"
>   LICENSE = "MIT-X"
>   LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
>
> -QT_GRAPHICS_SYSTEM ?= "raster"
> +PR = "r1"
>
> -# xserver-common, x11-common
> -VIRTUAL-RUNTIME_xserver_common ?= "x11-common"
> +QT_GRAPHICS_SYSTEM ?= "raster"
>
>   def _get_extra_rdepends(d):
>       gs = d.getVar('QT_GRAPHICS_SYSTEM', True)
> @@ -16,12 +15,11 @@ def _get_extra_rdepends(d):
>       return ""
>
>   do_install () {
> -	install -d ${D}/${sysconfdir}/X11/Xsession.d/
> -	cfg_file=${D}/${sysconfdir}/X11/Xsession.d/85xqt-graphicssystem
> +	install -d ${D}/${sysconfdir}/profile.d/
> +	cfg_file=${D}/${sysconfdir}/profile.d/qt-graphicssystem
>   	echo "export QT_GRAPHICSSYSTEM=${QT_GRAPHICS_SYSTEM}">  $cfg_file
> -	chmod +x $cfg_file
>   }
>
> -RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_xserver_common} ${@_get_extra_rdepends(d)}"
> +RDEPENDS_${PN} = "${@_get_extra_rdepends(d)}"
>
>   PACKAGE_ARCH = "${MACHINE_ARCH}"

Merged into OE-Core

Thanks
	Sau!


