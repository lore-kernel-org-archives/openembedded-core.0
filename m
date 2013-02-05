Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1U2oWN-0005BM-Gn
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 20:49:36 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 05 Feb 2013 11:32:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,609,1355126400"; d="scan'208";a="281334283"
Received: from unknown (HELO [10.255.12.90]) ([10.255.12.90])
	by orsmga002.jf.intel.com with ESMTP; 05 Feb 2013 11:33:44 -0800
Message-ID: <51115E97.1080404@linux.intel.com>
Date: Tue, 05 Feb 2013 11:33:43 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: eu@felipetonello.com
References: <1360090154-26766-1-git-send-email-ftonello@cercacor.com>
In-Reply-To: <1360090154-26766-1-git-send-email-ftonello@cercacor.com>
Cc: "Felipe F. Tonello" <ftonello@cercacor.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] connman: added recipe libconnman-qt
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
X-List-Received-Date: Tue, 05 Feb 2013 19:49:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/05/2013 10:49 AM, eu@felipetonello.com wrote:
> From: "Felipe F. Tonello" <ftonello@cercacor.com>
>
> This recipe provides the Qt library and QML plugins for connman.
>
This is a tough call, but maybe this is better off in the meta-qt space.

Sau!

> Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>
> ---
>   ...-to-disable-qml-plugin-and-test-program-t.patch |   35 ++++++++++
>   .../connman/libconnman-qt_0.4.0.bb                 |   68 ++++++++++++++++++++
>   2 files changed, 103 insertions(+)
>   create mode 100644 meta/recipes-connectivity/connman/libconnman-qt/0001-added-flags-to-disable-qml-plugin-and-test-program-t.patch
>   create mode 100644 meta/recipes-connectivity/connman/libconnman-qt_0.4.0.bb
>
> diff --git a/meta/recipes-connectivity/connman/libconnman-qt/0001-added-flags-to-disable-qml-plugin-and-test-program-t.patch b/meta/recipes-connectivity/connman/libconnman-qt/0001-added-flags-to-disable-qml-plugin-and-test-program-t.patch
> new file mode 100644
> index 0000000..74c27e4
> --- /dev/null
> +++ b/meta/recipes-connectivity/connman/libconnman-qt/0001-added-flags-to-disable-qml-plugin-and-test-program-t.patch
> @@ -0,0 +1,35 @@
> +From 3850acef7d914a22e3fc4130ad43b2cc47338d6f Mon Sep 17 00:00:00 2001
> +From: "Felipe F. Tonello" <ftonello@cercacor.com>
> +Date: Mon, 7 Jan 2013 17:13:22 -0800
> +Subject: [PATCH] added flags to disable qml plugin and test program to
> + compile
> +
> +This is usefull when there is no need to compile test program and qml plugin.
> +
> +Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>
> +---
> + connman-qt.pro |   11 ++++++++++-
> + 1 file changed, 10 insertions(+), 1 deletion(-)
> +
> +diff --git a/connman-qt.pro b/connman-qt.pro
> +index 7d9ec99..425c41f 100644
> +--- a/connman-qt.pro
> ++++ b/connman-qt.pro
> +@@ -1,4 +1,13 @@
> + TEMPLATE = subdirs
> +-SUBDIRS += libconnman-qt test plugin
> ++SUBDIRS += libconnman-qt
> + CONFIG += ordered
> +
> ++# CONFIG flag to disable test program
> ++!notest {
> ++    SUBDIRS += test
> ++}
> ++
> ++# CONFIG flag to disable qml plugin
> ++!noplugin {
> ++    SUBDIRS += plugin
> ++}
> +--
> +1.7.9.5
> +
> diff --git a/meta/recipes-connectivity/connman/libconnman-qt_0.4.0.bb b/meta/recipes-connectivity/connman/libconnman-qt_0.4.0.bb
> new file mode 100644
> index 0000000..60c11c3
> --- /dev/null
> +++ b/meta/recipes-connectivity/connman/libconnman-qt_0.4.0.bb
> @@ -0,0 +1,68 @@
> +DESCRIPTION = "Qt Library for ConnMan"
> +HOMEPAGE = "https://github.com/nemomobile/libconnman-qt"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://libconnman-qt/clockmodel.h;endline=8;md5=ea9f724050803f15d2d900ce3c5dac88"
> +
> +SECTION = "qt/lib"
> +
> +PR = "r0"
> +
> +inherit qt4x11 pkgconfig
> +
> +RDEPENDS_${PN} = "connman"
> +RDEPENDS_${PN}-plugin = "${PN}"
> +
> +PROVIDES += "${PN}-plugin"
> +
> +PACKAGES =+ "${PN}-plugin ${PN}-plugin-dbg"
> +RRECOMMENDS_${PN} = "${PN}-plugin"
> +
> +BRANCH = "master"
> +TAG = "${PV}"
> +SRCREV = "${AUTOREV}"
> +
> +SRC_URI = " \
> +  git://github.com/nemomobile/${PN}.git;branch=${BRANCH};tag=${TAG} \
> +  file://0001-added-flags-to-disable-qml-plugin-and-test-program-t.patch \
> +"
> +
> +S = "${WORKDIR}/git"
> +
> +QT_IMPORTS_DIR = "${libdir}/qt4/imports"
> +# the plugin target needs to be the same as 'target.path' and 'qmldir.path' in ${S}/plugin/plugin.pro
> +PLUGINS_TARGET = "${QT_IMPORTS_DIR}/MeeGo/Connman"
> +
> +FILES_${PN} = " \
> +  ${libdir}/libconnman-qt4${SOLIBS} \
> +"
> +
> +FILES_${PN}-dev = " \
> +  ${includedir}/connman-qt/* \
> +  ${libdir}/libconnman-qt4${SOLIBSDEV} \
> +  ${libdir}/libconnman-qt4.prl \
> +  ${libdir}/pkgconfig/connman-qt4.pc \
> +  ${libdir}/connman-qt4.pc \
> +"
> +
> +FILES_${PN}-plugin = " \
> +  ${PLUGINS_TARGET}/qmldir \
> +  ${PLUGINS_TARGET}/lib*.so \
> +"
> +
> +FILES_${PN}-plugin-dbg = " \
> +  ${PLUGINS_TARGET}/.debug \
> +  ${PLUGINS_TARGET}/.debug/* \
> +"
> +
> +EXTRA_QMAKEVARS_PRE = " \
> +  CONFIG+=notest \
> +"
> +
> +do_configure_prepend() {
> +  # Hack *.pro variables
> +  find ${S}/plugin/*.pro -exec sed -i -e 's,$$\[QT_INSTALL_IMPORTS\],${QT_IMPORTS_DIR},g' '{}' ';'
> +}
> +
> +do_install() {
> +  cd ${S} && (INSTALL_ROOT=${D} oe_runmake install)
> +}
>


