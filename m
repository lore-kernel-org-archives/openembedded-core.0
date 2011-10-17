Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RFmTB-0005Py-MV for openembedded-core@lists.openembedded.org;
	Mon, 17 Oct 2011 14:39:05 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9HCe188008094 for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2011 13:40:01 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id YTnbF9W+DwLp
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2011 13:40:00 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9HCdvfI008083
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2011 13:39:59 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 17 Oct 2011 13:33:11 +0100
In-Reply-To: <d8bdf3a41a8a090bccb7ffdbe937d9a586876a59.1318796061.git.sgw@linux.intel.com>
References: <cover.1318796061.git.sgw@linux.intel.com>
	<d8bdf3a41a8a090bccb7ffdbe937d9a586876a59.1318796061.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1318854800.21775.4.camel@ted>
Mime-Version: 1.0
Subject: Re: [v2 -CONSOLIDATED PULL 09/14] qmmp: Fix QA Packaging Errors
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
X-List-Received-Date: Mon, 17 Oct 2011 12:39:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2011-10-16 at 13:17 -0700, Saul Wold wrote:
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/recipes-qt/qt-apps/qmmp_0.5.1.bb |   36 +++++++++++++++++++++++++++-----
>  1 files changed, 30 insertions(+), 6 deletions(-)
> 
> diff --git a/meta/recipes-qt/qt-apps/qmmp_0.5.1.bb b/meta/recipes-qt/qt-apps/qmmp_0.5.1.bb
> index 948c32a..3f710f5 100644
> --- a/meta/recipes-qt/qt-apps/qmmp_0.5.1.bb
> +++ b/meta/recipes-qt/qt-apps/qmmp_0.5.1.bb
> @@ -4,7 +4,7 @@ LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
>  SECTION = "multimedia"
>  
> -PR = "r0"
> +PR = "r1"
>  
>  DEPENDS = "qt4-x11-free taglib libmad libvorbis libogg alsa-lib"
>  RDEPENDS_${PN} += "taglib alsa-lib curl"
> @@ -29,16 +29,40 @@ export EXTRA_OECMAKE = "-DQT_QMAKE_EXECUTABLE=${OE_QMAKE_QMAKE} \
>                          -DQT_QTCORE_INCLUDE_DIR=${OE_QMAKE_INCDIR_QT}/QtCore \
>                          "
>  
> -FILES_${PN} = "${bindir}/qmmp ${libdir}/*.so* \ 
> -               ${libdir}/qmmp/PlaylistFormats/*.so \
> -               ${libdir}/qmmp/Output/libalsa.so \
> -               ${libdir}/qmmp/Transports/libhttp.so \
> -               ${libdir}/qmmp/Visual/libanalyzer.so \
> +FILES_${PN} = "${bindir}/qmmp ${libdir}/*${SOLIBS} \ 
> +               ${libdir}/qmmp/PlaylistFormats/*${SOLIBS} \
> +               ${libdir}/qmmp/Output/libalsa${SOLIBS} \
> +               ${libdir}/qmmp/Transports/libhttp${SOLIBS} \
> +               ${libdir}/qmmp/Visual/libanalyzer${SOLIBS} \
>                 ${datadir}/icons/* \
>                 ${datadir}/qmmp/images/* \
>                 ${datadir}/applications/qmmp.desktop \
>                 "
>  
> +FILES_${PN}-dev += "${libdir}/qmmp/PlaylistFormats/*${SOLIBSDEV} \
> +               ${libdir}/qmmp/Output/libalsa${SOLIBSDEV} \
> +               ${libdir}/qmmp/Transports/libhttp${SOLIBSDEV} \
> +               ${libdir}/qmmp/Visual/libanalyzer${SOLIBSDEV} \
> +               "
> +
> +FILES_${PN}-dbg += "${libdir}/qmmp/PlaylistFormats/.debug \
> +               ${libdir}/qmmp/Output/.debug/libalsa* \
> +               ${libdir}/qmmp/Transports/.debug/libhttp* \
> +               ${libdir}/qmmp/Visual/.debug/libanalyzer* \
> +               "
> +
> +FILES_${PN}-others-dbg = "${libdir}/qmmp/PlaylistFormats/.debug \
> +               ${libdir}/qmmp/General/.debug \
> +               ${libdir}/qmmp/Input/.debug \
> +               ${libdir}/qmmp/Output/.debug \
> +               ${libdir}/qmmp/Effect/.debug \
> +               ${libdir}/qmmp/Engines/.debug \
> +               ${libdir}/qmmp/FileDialogs/.debug \
> +               ${libdir}/qmmp/Transports/.debug \
> +               ${libdir}/qmmp/Visual/.debug \
> +               ${libdir}/qmmp/CommandLineOptions/.debug \
> +               "

What is FILES_${PN}-others-dbg? Shouldn't these be in the -dbg package?
Is this package listed in PACKAGES?

Cheers,

Richard



