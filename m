Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RFpaV-0000HB-7W
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Oct 2011 17:58:51 +0200
Received: from mail-ww0-f42.google.com ([74.125.82.42])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 17 Oct 2011 08:53:01 -0700
Received: by wwn22 with SMTP id 22so3699828wwn.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2011 08:52:59 -0700 (PDT)
Received: by 10.227.136.197 with SMTP id s5mr2050648wbt.39.1318866779677;
	Mon, 17 Oct 2011 08:52:59 -0700 (PDT)
Received: from [10.6.18.230] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117]) by mx.google.com with ESMTPS id
	fy13sm31793239wbb.18.2011.10.17.08.52.56
	(version=SSLv3 cipher=OTHER); Mon, 17 Oct 2011 08:52:58 -0700 (PDT)
Message-ID: <4E9C4F57.8060500@intel.com>
Date: Mon, 17 Oct 2011 08:52:55 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <18ec3fbf0667f2780460bad2d4d100849c1239ca>
	<1317909379-25683-1-git-send-email-dima_ch@emcraft.com>
In-Reply-To: <1317909379-25683-1-git-send-email-dima_ch@emcraft.com>
Subject: Re: [PATCH] qt4: Added support for QtMobility 1.2
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
X-List-Received-Date: Mon, 17 Oct 2011 15:58:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/06/2011 06:56 AM, Dmitry Cherukhin wrote:
> The QtMobility is a Qt add-on which allows to include standard mobile
> functionality to Qt applications. For details, see
>      http://qt.nokia.com/products/qt-addons/mobility/
> The patch is intended to add support for the QtMobility 1.2 package to OE.
>
> Added two recipes:
> 1) qt-mobility-x11 builds the QtMobility 1.2 package
>     on the basis of Qt/X11 using the qt4-x11-free package;
> 2) qt-mobility-embedded builds the QtMobility 1.2 package
>     on the basis of Qt/Embedded using the qt4-embedded package.
>
> Signed-off-by: Dmitry Cherukhin<dima_ch@emcraft.com>
> ---
>   meta/recipes-qt/qt4/qt-mobility-embedded_1.2.0.bb |   11 ++++
>   meta/recipes-qt/qt4/qt-mobility-x11_1.2.0.bb      |   10 +++
>   meta/recipes-qt/qt4/qt-mobility_1.2.0.inc         |   62 +++++++++++++++++++++
>   3 files changed, 83 insertions(+), 0 deletions(-)
>   create mode 100644 meta/recipes-qt/qt4/qt-mobility-embedded_1.2.0.bb
>   create mode 100644 meta/recipes-qt/qt4/qt-mobility-x11_1.2.0.bb
>   create mode 100644 meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
>
> diff --git a/meta/recipes-qt/qt4/qt-mobility-embedded_1.2.0.bb b/meta/recipes-qt/qt4/qt-mobility-embedded_1.2.0.bb
> new file mode 100644
> index 0000000..0c30e5f
> --- /dev/null
> +++ b/meta/recipes-qt/qt4/qt-mobility-embedded_1.2.0.bb
> @@ -0,0 +1,11 @@
> +DESCRIPTION = "Qt Mobility 1.2.0 - version for Qt/Embedded"
> +DEPENDS = "qt4-embedded"
> +SECTION = "libs"
> +qtm_embedded := "embedded"
> +qtm_dir = "qtopia"
> +qtm_glflags := "-=opengl"
> +qtm_extra_config := "gstreamer-photography_enabled = no"
> +
> +inherit qt4e
> +require qt-mobility_${PV}.inc
> +
> diff --git a/meta/recipes-qt/qt4/qt-mobility-x11_1.2.0.bb b/meta/recipes-qt/qt4/qt-mobility-x11_1.2.0.bb
> new file mode 100644
> index 0000000..cd7d5b5
> --- /dev/null
> +++ b/meta/recipes-qt/qt4/qt-mobility-x11_1.2.0.bb
> @@ -0,0 +1,10 @@
> +DESCRIPTION = "Qt Mobility 1.2.0 - version for Qt/X11"
> +DEPENDS = "qt4-x11-free"
> +SECTION = "x11/libs"
> +qtm_embedded := ""
> +qtm_dir = "qt4"
> +qtm_glflags := "${@base_contains('DISTRO_FEATURES', 'opengl', '+=opengl', '-=opengl', d)} "
> +qtm_extra_config := ""
> +
> +inherit qt4x11
> +require qt-mobility_${PV}.inc
> diff --git a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
> new file mode 100644
> index 0000000..f665e64
> --- /dev/null
> +++ b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
> @@ -0,0 +1,62 @@
> +HOMEPAGE = "http://qt.nokia.com"
> +DEPENDS += "pulseaudio bluez4"
> +
> +LICENSE = "LGPLv2.1"
> +LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=fbc093901857fcd118f065f900982c24 \
> +		    file://LGPL_EXCEPTION.txt;md5=411080a56ff917a5a1aa08c98acae354"
> +
> +SRC_URI = "http://get.qt.nokia.com/qt/add-ons/qt-mobility-opensource-src-${PV}.tar.gz "
> +
> +SRC_URI[md5sum]="ea5db5a8d3dd4709c2926dceda646bd8"
> +SRC_URI[sha256sum]="ee3c88975e04139ac9589f76d4be646d44fcbc4c8c1cf2db621abc154cf0ba44"
> +
> +S = "${WORKDIR}/qt-mobility-opensource-src-${PV}"
> +
> +qtm_bin		:= "/usr/bin/${qtm_dir}"
> +qtm_lib		:= "/usr/lib"
> +qtm_include	:= "/usr/include/${qtm_dir}"
> +qtm_examples	:= "/usr/bin/${qtm_dir}/examples/QtMobility"
> +qtm_demos	:= "/usr/bin/${qtm_dir}/demos/QtMobility"
> +qtm_plugins	:= "/usr/lib/${qtm_dir}/plugins/QtMobility"
> +qtm_data	:= "/usr/share/${qtm_dir}"
> +qtm_imports	:= "/usr/lib/${qtm_dir}/imports"
> +
> +do_configure_prepend() {
> +	cp qtmobility.pro qtmobility.pro.old
> +	sed -e 's@...QT_INSTALL_DATA.@${qtm_data}@'<qtmobility.pro.old>qtmobility.pro
> +	for NAME in plugins/declarative/*/*.pro
> +	do
> +	    cp $NAME $NAME.old
> +	    sed -e 's@...QT_INSTALL_IMPORTS.@${qtm_imports}@'<$NAME.old>$NAME
> +	done
> +	cp staticconfig.pri staticconfig.pri.old
> +	echo "include(${STAGING_DATADIR}/${qtm_dir}/mkspecs/qconfig.pri)">staticconfig.pri
> +	cat staticconfig.pri.old>>staticconfig.pri
> +	./configure -qmake-exec qmake2 -prefix /usr -examples -demos
> +	echo QT_MOBILITY_BIN = ${qtm_bin}>>./config.pri
> +	echo QT_MOBILITY_LIB = ${qtm_lib}>>./config.pri
> +	echo QT_MOBILITY_INCLUDE = ${qtm_include}>>./config.pri
> +	echo QT_MOBILITY_PLUGINS = ${qtm_plugins}>>./config.pri
> +	echo QT_MOBILITY_EXAMPLES = ${qtm_examples}>>./config.pri
> +	echo QT_MOBILITY_DEMOS = ${qtm_demos}>>./config.pri
> +	echo QT_CONFIG ${qtm_glflags}>>./config.pri
> +	echo bluez_enabled = yes>>./config.pri
> +	echo ${qtm_extra_config}>>./config.pri
> +	echo CONFIG += ${qtm_embedded}>>./config.pri
> +}
> +
> +do_install() {
> +	for NAME in */*.prf
> +	do
> +	    cp $NAME $NAME.old
> +	    sed -e 's@/usr@${STAGING_BINDIR}/..@'<$NAME.old>$NAME
> +	done
> +	oe_runmake install INSTALL_ROOT=${D}
> +}
> +
> +PACKAGES = "${PN}-dbg ${PN} ${PN}-dev"
> +
> +FILES_${PN}-dbg = "${qtm_bin}/.debug ${qtm_examples}/.debug ${qtm_demos}/.debug ${qtm_lib}/.debug ${qtm_plugins}/*/.debug \
> +		${qtm_imports}/*/.debug ${qtm_imports}/*/*/.debug /usr/src/debug"
> +FILES_${PN} = "${qtm_bin} ${qtm_examples} ${qtm_demos} ${qtm_lib}/*.so.1* ${qtm_plugins} ${qtm_imports}"
> +FILES_${PN}-dev = "/usr"

Merged into OE-Core

Thanks
	Sau!



