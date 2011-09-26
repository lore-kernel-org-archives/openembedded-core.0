Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R8Kjq-0001Wt-MO
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Sep 2011 01:37:31 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 26 Sep 2011 16:32:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,446,1312182000"; d="scan'208";a="20913584"
Received: from unknown (HELO [10.255.14.215]) ([10.255.14.215])
	by AZSMGA002.ch.intel.com with ESMTP; 26 Sep 2011 16:32:04 -0700
Message-ID: <4E810B74.7010001@linux.intel.com>
Date: Mon, 26 Sep 2011 16:32:04 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); en-US;
	rv:1.9.2.22) Gecko/20110902 Thunderbird/3.1.14
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <f63c9c5991312f05bffee750086a0c7398770f8a>
	<1316787194-17442-1-git-send-email-dima_ch@emcraft.com>
In-Reply-To: <1316787194-17442-1-git-send-email-dima_ch@emcraft.com>
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
X-List-Received-Date: Mon, 26 Sep 2011 23:37:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/23/2011 07:13 AM, Dmitry Cherukhin wrote:
> This patch is indented to add new functionality,
> specifically, the patch adds support for
> the QtMobility 1.2 package.
>
> Added two recipes:
> 1) qt-mobility-x11 builds the QtMobility 1.2 package
>     on the basis of qt4-x11-free;
> 2) qt-mobility-embedded builds the QtMobility 1.2 package
>     on the basis of qt4-embedded.
>
> Signed-off-by: Dmitry Cherukhin<dima_ch@emcraft.com>
> ---
>   meta/recipes-qt/qt4/files/qtm_qtmobility_pro.patch |   28 +++++++++++
>   meta/recipes-qt/qt4/files/qtme_gstreamer_pro.patch |   16 ++++++
>   meta/recipes-qt/qt4/qt-mobility-embedded_1.2.0.bb  |   13 +++++
>   meta/recipes-qt/qt4/qt-mobility-x11_1.2.0.bb       |   11 ++++
>   meta/recipes-qt/qt4/qt-mobility_1.2.0.inc          |   51 ++++++++++++++++++++
>   5 files changed, 119 insertions(+), 0 deletions(-)
>   create mode 100644 meta/recipes-qt/qt4/files/qtm_qtmobility_pro.patch
>   create mode 100644 meta/recipes-qt/qt4/files/qtme_gstreamer_pro.patch
>   create mode 100644 meta/recipes-qt/qt4/qt-mobility-embedded_1.2.0.bb
>   create mode 100644 meta/recipes-qt/qt4/qt-mobility-x11_1.2.0.bb
>   create mode 100644 meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
>
> diff --git a/meta/recipes-qt/qt4/files/qtm_qtmobility_pro.patch b/meta/recipes-qt/qt4/files/qtm_qtmobility_pro.patch
> new file mode 100644
> index 0000000..689c224
> --- /dev/null
> +++ b/meta/recipes-qt/qt4/files/qtm_qtmobility_pro.patch
> @@ -0,0 +1,28 @@
> +This patch fixes the following issue at the configure stage:
> +   Project ERROR: Qt Mobility requires Qt 4.6 or higher. Qt was found.
> +The version of Qt is already 4.7.3, so this is misconfiguration problem.
> +
> +The origin of this patch is:
> +   http://neophysis.git.sourceforge.net/git/gitweb.cgi?p=neophysis/openembedded;
> +   a=blob;f=recipes/neophysis/qt-mobility-1.0.0/qtmobility_pro.patch;
> +   h=fc5e1691aed47bc50d87e5c33497354182cacda4;hb=refs/heads/neophysis-testing-0.3
> +Upstream-Status: not-appropriate

Please refer to wiki page on www.openembedded.org for the corrcet 
formating of the Upstream-Status field.  You are also missing a 
Signed-off-by: line for each patch file.

(I would give the exact page, but the site appears to be having problems)

Thanks
	Sau!

> +--- qt-mobility-opensource-src-1.0.0/qtmobility.pro.orig	2010-05-21 14:20:19.547363661 +0200
> ++++ qt-mobility-opensource-src-1.0.0/qtmobility.pro	2010-05-21 14:22:01.967353682 +0200
> +@@ -53,15 +53,6 @@ win32:!contains(CONFIG_WIN32,build_all)
> +    }
> + }
> +
> +-lessThan(QT_MAJOR_VERSION, 4) {
> +-    error(Qt Mobility requires Qt 4.6 or higher. Qt $${QT_VERSION} was found.);
> +-}
> +-
> +-contains(QT_MAJOR_VERSION, 4):lessThan(QT_MINOR_VERSION, 6) {
> +-    error(Qt Mobility requires Qt 4.6 or higher. Qt $${QT_VERSION} was found.);
> +-}
> +-
> +-
> + # MCL builds for Symbian do not run configure and require some manual setup steps.
> + # This test permits SD builds to skip installation of mobility.prf from within qmake.
> + # It is installed in a separate step. MCL builds for SD must set the
> +
> diff --git a/meta/recipes-qt/qt4/files/qtme_gstreamer_pro.patch b/meta/recipes-qt/qt4/files/qtme_gstreamer_pro.patch
> new file mode 100644
> index 0000000..0cba1d6
> --- /dev/null
> +++ b/meta/recipes-qt/qt4/files/qtme_gstreamer_pro.patch
> @@ -0,0 +1,16 @@
> +This patch disables the section of the Qt project file which depends on X11.
> +The patch is applied for the qt-mobility-embedded package only.
> +This section is already disabled for the embedded platform so we do what should be done.
> +
> +Upstream-Status: not-appropriate
> +--- qt-mobility-opensource-src-1.2.0/plugins/multimedia/gstreamer/gstreamer.pro.orig	2011-09-13 09:19:05.000000000 +0200
> ++++ qt-mobility-opensource-src-1.2.0/plugins/multimedia/gstreamer/gstreamer.pro	2011-09-13 09:37:58.609252481 +0200
> +@@ -81,7 +81,7 @@
> +     qgstutils.cpp
> +
> +
> +-!win32:!embedded:!mac:!symbian:!simulator:!contains(QT_CONFIG, qpa) {
> ++!win32:!embedded:!mac:!symbian:!simulator:!contains(QT_CONFIG, qpa):!contains(qt_embedded,yes) {
> +     LIBS += -lXv -lX11 -lXext
> +
> +     HEADERS += \
> diff --git a/meta/recipes-qt/qt4/qt-mobility-embedded_1.2.0.bb b/meta/recipes-qt/qt4/qt-mobility-embedded_1.2.0.bb
> new file mode 100644
> index 0000000..c31b1d2
> --- /dev/null
> +++ b/meta/recipes-qt/qt4/qt-mobility-embedded_1.2.0.bb
> @@ -0,0 +1,13 @@
> +DESCRIPTION = "Qt Mobility 1.2.0 - version for Qt/Embedded"
> +DEPENDS = "qt4-embedded"
> +SECTION = "libs"
> +qtm_embedded := "yes"
> +qtm_libinfix := "E"
> +qtm_dir = "qtopia"
> +qtm_glflags := "-=opengl"
> +qtm_extra_config := "gstreamer-photography_enabled = no"
> +
> +inherit qt4e
> +require qt-mobility_${PV}.inc
> +
> +SRC_URI += "file://qtme_gstreamer_pro.patch;patch=1"
> diff --git a/meta/recipes-qt/qt4/qt-mobility-x11_1.2.0.bb b/meta/recipes-qt/qt4/qt-mobility-x11_1.2.0.bb
> new file mode 100644
> index 0000000..3020953
> --- /dev/null
> +++ b/meta/recipes-qt/qt4/qt-mobility-x11_1.2.0.bb
> @@ -0,0 +1,11 @@
> +DESCRIPTION = "Qt Mobility 1.2.0 - version for Qt/X11"
> +DEPENDS = "qt4-x11-free"
> +SECTION = "x11/libs"
> +qtm_embedded := "no"
> +qtm_libinfix := ""
> +qtm_dir = "qt4"
> +qtm_glflags := "${@base_contains('DISTRO_FEATURES', 'opengl', '+=opengl', '-=opengl', d)} "
> +qtm_extra_config := ""
> +
> +inherit qt4x11
> +require qt-mobility_${PV}.inc
> diff --git a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
> new file mode 100644
> index 0000000..5a423d7
> --- /dev/null
> +++ b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
> @@ -0,0 +1,51 @@
> +HOMEPAGE = "http://qt.nokia.com"
> +DEPENDS += "pulseaudio bluez4"
> +
> +LICENSE = "LGPLv2.1"
> +LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=fbc093901857fcd118f065f900982c24 \
> +		    file://LGPL_EXCEPTION.txt;md5=411080a56ff917a5a1aa08c98acae354"
> +
> +SRC_URI = "http://get.qt.nokia.com/qt/add-ons/qt-mobility-opensource-src-${PV}.tar.gz \
> +		    file://qtm_qtmobility_pro.patch;patch=1 "
> +
> +SRC_URI[md5sum]="ea5db5a8d3dd4709c2926dceda646bd8"
> +SRC_URI[sha256sum]="ee3c88975e04139ac9589f76d4be646d44fcbc4c8c1cf2db621abc154cf0ba44"
> +
> +S = "${WORKDIR}/qt-mobility-opensource-src-${PV}"
> +
> +qtm_bin := "/usr/bin/${qtm_dir}"
> +qtm_lib := "/usr/lib"
> +qtm_include := "/usr/include/${qtm_dir}"
> +qtm_examples := "/usr/bin/${qtm_dir}/examples/qtmobility"
> +qtm_demos := "/usr/bin/${qtm_dir}/demos/qtmobility"
> +qtm_plugins := "/usr/lib/${qtm_dir}/plugins/qtmobility"
> +
> +do_configure_prepend() {
> +	./configure -qmake-exec qmake2 -prefix /usr -examples -demos
> +	echo QT_MOBILITY_BIN = ${qtm_bin}>>./config.pri
> +	echo QT_MOBILITY_LIB = ${qtm_lib}>>./config.pri
> +	echo QT_MOBILITY_INCLUDE = ${qtm_include}>>./config.pri
> +	echo QT_MOBILITY_PLUGINS = ${qtm_plugins}>>./config.pri
> +	echo QT_MOBILITY_EXAMPLES = ${qtm_examples}>>./config.pri
> +	echo QT_MOBILITY_DEMOS = ${qtm_demos}>>./config.pri
> +	echo QT_CONFIG += dbus>>./config.pri
> +	echo QT_CONFIG ${qtm_glflags}>>./config.pri
> +	echo QT_LIBINFIX = ${qtm_libinfix}>>./config.pri
> +	echo qt_embedded = ${qtm_embedded}>>./config.pri
> +	echo bluez_enabled = yes>>./config.pri
> +	echo ${qtm_extra_config}>>./config.pri
> +}
> +
> +do_install() {
> +	oe_runmake install INSTALL_ROOT=${D}
> +	for NAME in */*.prf
> +	do
> +	    install -m 644 -D -T $NAME ${D}/usr/share/${qtm_dir}/mkspecs/features/`basename $NAME`
> +	done
> +}
> +
> +PACKAGES = "${PN}-dbg ${PN} ${PN}-dev"
> +
> +FILES_${PN}-dbg = "${qtm_bin}/.debug ${qtm_examples}/.debug ${qtm_demos}/.debug ${qtm_lib}/.debug ${qtm_plugins}/*/.debug /usr/src/debug"
> +FILES_${PN} = "${qtm_bin} ${qtm_examples} ${qtm_demos} ${qtm_lib}/*.so.1* ${qtm_plugins}"
> +FILES_${PN}-dev = "/usr"


