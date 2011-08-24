Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QwN4f-0007lo-2u
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Aug 2011 01:41:33 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 24 Aug 2011 16:36:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,278,1312182000"; d="scan'208";a="44118904"
Received: from unknown (HELO [10.255.14.203]) ([10.255.14.203])
	by fmsmga002.fm.intel.com with ESMTP; 24 Aug 2011 16:36:45 -0700
Message-ID: <4E558B0D.1080307@linux.intel.com>
Date: Wed, 24 Aug 2011 16:36:45 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110707 Thunderbird/5.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1314166867.git.xiaofeng.yan@windriver.com>
	<e62894baf8e79baa7e19901b7ec8c515dddb2537.1314166867.git.xiaofeng.yan@windriver.com>
In-Reply-To: <e62894baf8e79baa7e19901b7ec8c515dddb2537.1314166867.git.xiaofeng.yan@windriver.com>
Subject: Re: [PATCH 1/1] qt4e-demo-image: Fix bug 999
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
X-List-Received-Date: Wed, 24 Aug 2011 23:41:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/23/2011 11:34 PM, Xiaofeng Yan wrote:
> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>
> [YOCTO #999]
> Copy metadata of qt4e-demo-image from OE for easy testing qt4embeded on embedded platform.
> This image was tested on qemuarm and can run program "qtdemoE".
>
> Signed-off-by: Xiaofeng Yan<xiaofeng.yan@windriver.com>
> ---
>   meta/recipes-qt/images/qt4e-base-image.bb        |   14 ++++++
>   meta/recipes-qt/images/qt4e-demo-image.bb        |   12 +++++
>   meta/recipes-qt/qt-demo/qt-demo-init/qtdemo-init |   55 ++++++++++++++++++++++
>   meta/recipes-qt/qt-demo/qt-demo-init_0.1.bb      |   19 ++++++++
>   meta/recipes-qt/tasks/task-qt4e.bb               |   48 +++++++++++++++++++
>   5 files changed, 148 insertions(+), 0 deletions(-)
>   create mode 100644 meta/recipes-qt/images/qt4e-base-image.bb
>   create mode 100644 meta/recipes-qt/images/qt4e-demo-image.bb
>   create mode 100644 meta/recipes-qt/qt-demo/qt-demo-init/qtdemo-init
>   create mode 100644 meta/recipes-qt/qt-demo/qt-demo-init_0.1.bb
>   create mode 100644 meta/recipes-qt/tasks/task-qt4e.bb
>
> diff --git a/meta/recipes-qt/images/qt4e-base-image.bb b/meta/recipes-qt/images/qt4e-base-image.bb
> new file mode 100644
> index 0000000..395c069
> --- /dev/null
> +++ b/meta/recipes-qt/images/qt4e-base-image.bb
> @@ -0,0 +1,14 @@
> +inherit core-image
> +
> +TOUCH = ' ${@base_contains("MACHINE_FEATURES", "touchscreen", "tslib tslib-calibrate tslib-tests", "",d)}'
> +
> +DEPENDS += "task-qt4e"
> +
> +RDEPENDS_${PN} += " \
> +	task-qt4e-base \
> +	"
> +
> +IMAGE_INSTALL += "\
> +	task-qt4e-base \
> +	${TOUCH} \
> +"
> diff --git a/meta/recipes-qt/images/qt4e-demo-image.bb b/meta/recipes-qt/images/qt4e-demo-image.bb
> new file mode 100644
> index 0000000..cf3e6fb
> --- /dev/null
> +++ b/meta/recipes-qt/images/qt4e-demo-image.bb
> @@ -0,0 +1,12 @@
> +require qt4e-base-image.bb
> +
Why do we need the qt4e-base-image and this demo-image?  Do we expect to 
have multiple images?  This creates yet another image that needs to be 
built and tested?  Can this really just be added to the sato-sdk or 
lsb-sdk images instead?

Sau!

> +LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
> +                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> +
> +
> +IMAGE_INSTALL += "\
> +        qt4-embedded-demos \
> +        qt4-embedded-examples \
> +        qt-demo-init \
> +        qt4-embedded-assistant \
> +"
> diff --git a/meta/recipes-qt/qt-demo/qt-demo-init/qtdemo-init b/meta/recipes-qt/qt-demo/qt-demo-init/qtdemo-init
> new file mode 100644
> index 0000000..affb958
> --- /dev/null
> +++ b/meta/recipes-qt/qt-demo/qt-demo-init/qtdemo-init
> @@ -0,0 +1,55 @@
> +#!/bin/sh
> +
> +set -e
> +
> +if [ -f /usr/bin/qtdemo ]; then
> +	QTDEMO="qtdemo>  /var/log/Xsession.log 2>  &1"
> +else
> +	QTDEMO="qtdemoE -qws"
> +fi
> +
> +case "$1" in
> +  start)
> +	echo "Starting qtdemo"
> +	if [ -f /etc/profile.d/tslib.sh ]; then
> +		source /etc/profile.d/tslib.sh
> +	fi
> +	if [ -e $TSLIB_TSDEVICE ]; then
> +		if [ ! -f /etc/pointercal ]; then
> +			/usr/bin/ts_calibrate
> +		fi
> +		if [ $QTDEMO == qtdemo ]; then
> +			Xorg&
> +			export DISPLAY=:0
> +			$QTDEMO&
> +		else
> +			QWS_MOUSE_PROTO=tslib:$TSLIB_TSDEVICE $QTDEMO&
> +		fi
> +	else
> +		if [ $QTDEMO == qtdemo ]; then
> +			Xorg&
> +			export DISPLAY=:0
> +		fi
> +		$QTDEMO&
> +	fi
> +	;;
> +  stop)
> +	echo "Stopping qtdemo"
> +	if [ $QTDEMO == qtdemo ]; then
> +		killall Xorg
> +		killall qtdemo
> +	else
> +		killall qtdemoE
> +	fi
> +	;;
> +  restart)
> +	$0 stop
> +	$0 start
> +	;;
> +  *)
> +	echo "usage: $0 { start | stop | restart }">&2
> +	exit 1
> +	;;
> +esac
> +
> +exit 0
> diff --git a/meta/recipes-qt/qt-demo/qt-demo-init_0.1.bb b/meta/recipes-qt/qt-demo/qt-demo-init_0.1.bb
> new file mode 100644
> index 0000000..3d7cdfc
> --- /dev/null
> +++ b/meta/recipes-qt/qt-demo/qt-demo-init_0.1.bb
> @@ -0,0 +1,19 @@
> +DESCRIPTION = "Init script for qtdemo"
> +LICENSE = "MIT"
> +SRC_URI = "file://qtdemo-init"
> +PR = "r2"
> +LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
> +                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> +
> +
> +PACKAGE_ARCH = "all"
> +
> +do_install() {
> +	install -d ${D}${sysconfdir}/init.d/
> +	install -m 0755 ${WORKDIR}/qtdemo-init ${D}${sysconfdir}/init.d/qtdemo
> +}
> +
> +inherit update-rc.d
> +
> +INITSCRIPT_NAME = "qtdemo"
> +INITSCRIPT_PARAMS = "start 99 5 2 . stop 19 0 1 6 ."
> diff --git a/meta/recipes-qt/tasks/task-qt4e.bb b/meta/recipes-qt/tasks/task-qt4e.bb
> new file mode 100644
> index 0000000..5b181bb
> --- /dev/null
> +++ b/meta/recipes-qt/tasks/task-qt4e.bb
> @@ -0,0 +1,48 @@
> +DESCRIPTION = "QT4 Embedded base Image Feed"
> +PR = "r0"
> +LICENSE = "MIT"
> +
> +LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
> +                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> +
> +inherit task
> +
> +PACKAGES += " \
> +	${PN}-base \
> +"
> +
> +RDEPENDS_${PN}-base = " \
> +	qt4-embedded \
> +	libqt-embedded3support4 \
> +	libqt-embeddedclucene4 \
> +	libqt-embeddedcore4 \
> +	libqt-embeddeddbus4 \
> +	libqt-embeddedgui4 \
> +	libqt-embeddedhelp4 \
> +	libqt-embeddedmultimedia4 \
> +	libqt-embeddednetwork4 \
> +	libqt-embeddedscript4 \
> +	libqt-embeddedscripttools4 \
> +	libqt-embeddedsql4 \
> +	libqt-embeddedsvg4 \
> +	libqt-embeddedtest4 \
> +	libqt-embeddedwebkit4 \
> +	libqt-embeddedxml4 \
> +	qt4-embedded-fonts-ttf-dejavu \
> +	qt4-embedded-fonts-ttf-vera \
> +	qt4-embedded-plugin-iconengine-svgicon \
> +	qt4-embedded-plugin-imageformat-gif \
> +	qt4-embedded-plugin-imageformat-ico \
> +	qt4-embedded-plugin-imageformat-jpeg \
> +	qt4-embedded-plugin-imageformat-mng \
> +	qt4-embedded-plugin-imageformat-svg \
> +	qt4-embedded-plugin-imageformat-tiff \
> +	qt4-embedded-plugin-mousedriver-tslib \
> +	qt4-embedded-plugin-phonon-backend-gstreamer \
> +	qt4-embedded-plugin-script-dbus \
> +	qt4-embedded-plugin-sqldriver-sqlite \
> +"
> +
> +RRECOMMENDS_${PN}-base = " \
> +	libqt-embeddedxmlpatterns4 \
> +"


