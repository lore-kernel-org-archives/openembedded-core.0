Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S9ev6-0001Dc-7M
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Mar 2012 16:54:52 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Mar 2012 08:46:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="119153632"
Received: from unknown (HELO [10.255.15.160]) ([10.255.15.160])
	by orsmga001.jf.intel.com with ESMTP; 19 Mar 2012 08:45:59 -0700
Message-ID: <4F6754B7.4070701@linux.intel.com>
Date: Mon, 19 Mar 2012 08:45:59 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1331913268.git.paul.eggleton@linux.intel.com>
	<a2e9044ed2b89b5fdbdb28cc6929797e49e8a009.1331913268.git.paul.eggleton@linux.intel.com>
In-Reply-To: <a2e9044ed2b89b5fdbdb28cc6929797e49e8a009.1331913268.git.paul.eggleton@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 1/1] qt-mobility: fix QA warnings
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
X-List-Received-Date: Mon, 19 Mar 2012 15:54:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/16/2012 08:55 AM, Paul Eggleton wrote:
> Fix the following warnings:
>
> WARNING: QA Issue: package qt-mobility-x11 contains bad RPATH /home/user/qt/lib:/home/user/qt/lib${WORKDIR}/qt-mobility-opensource-src-1.2.0/lib:/home/user/qt/lib/media/large/tmp/sysroots/qemux86/usr/lib:/home/user/qt/lib/usr/lib in file ${WORKDIR}/packages-split/qt-mobility-x11/usr/bin/qt4/examples/QtMobility/qml_device
> WARNING: QA Issue: package qt-mobility-x11 contains bad RPATH /home/user/qt/lib:/home/user/qt/lib${WORKDIR}/qt-mobility-opensource-src-1.2.0/lib:/home/user/qt/lib/media/large/tmp/sysroots/qemux86/usr/lib:/home/user/qt/lib/usr/lib in file ${WORKDIR}/packages-split/qt-mobility-x11/usr/bin/qt4/examples/QtMobility/qml_device
>
> Signed-off-by: Paul Eggleton<paul.eggleton@linux.intel.com>
> ---
>   ...nnecessary-rpaths-from-qml_device-example.patch |   28 ++++++++++++++++++++
>   meta/recipes-qt/qt4/qt-mobility_1.2.0.inc          |    5 ++-
>   2 files changed, 31 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-qt/qt4/files/0002-Remove-unnecessary-rpaths-from-qml_device-example.patch
>
> diff --git a/meta/recipes-qt/qt4/files/0002-Remove-unnecessary-rpaths-from-qml_device-example.patch b/meta/recipes-qt/qt4/files/0002-Remove-unnecessary-rpaths-from-qml_device-example.patch
> new file mode 100644
> index 0000000..a411640
> --- /dev/null
> +++ b/meta/recipes-qt/qt4/files/0002-Remove-unnecessary-rpaths-from-qml_device-example.patch
> @@ -0,0 +1,28 @@
> +From 92e0c611f4969c716616d64df64831387e5b1632 Mon Sep 17 00:00:00 2001
> +From: Paul Eggleton<paul.eggleton@linux.intel.com>
> +Date: Fri, 16 Mar 2012 10:24:00 +0000
> +Subject: [PATCH] Remove unnecessary rpaths from qml_device example
> +
> +These can't be valid in any case.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Paul Eggleton<paul.eggleton@linux.intel.com>
> +---
> + examples/declarative-systeminfo/device/device.pro |    3 ---
> + 1 files changed, 0 insertions(+), 3 deletions(-)
> +
> +diff --git a/examples/declarative-systeminfo/device/device.pro b/examples/declarative-systeminfo/device/device.pro
> +index 698e5fb..05be9b7 100644
> +--- a/examples/declarative-systeminfo/device/device.pro
> ++++ b/examples/declarative-systeminfo/device/device.pro
> +@@ -17,6 +17,3 @@ symbian {
> + }
> + RESOURCES += device.qrc
> +
> +-QMAKE_LFLAGS_DEBUG += "-Wl,-rpath,/home/user/qt/lib"
> +-QMAKE_LFLAGS_RPATH += "-Wl,-rpath,/home/user/qt/lib"
> +-QMAKE_LFLAGS_RELEASE += "-Wl,-rpath,/home/user/qt/lib"
> +--
> +1.7.5.4
> +
> diff --git a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
> index 593cbd6..1c4611d 100644
> --- a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
> +++ b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
> @@ -7,12 +7,13 @@ LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=fbc093901857fcd118f065f900982c24 \
>
>   SRC_URI = "http://get.qt.nokia.com/qt/add-ons/qt-mobility-opensource-src-${PV}.tar.gz \
>              file://qt-mobility-configure.patch \
> -           file://0001-gstvideoconnector-fixed-buffers-allocation.patch"
> +           file://0001-gstvideoconnector-fixed-buffers-allocation.patch \
> +           file://0002-Remove-unnecessary-rpaths-from-qml_device-example.patch"
>
>   SRC_URI[md5sum]="ea5db5a8d3dd4709c2926dceda646bd8"
>   SRC_URI[sha256sum]="ee3c88975e04139ac9589f76d4be646d44fcbc4c8c1cf2db621abc154cf0ba44"
>
> -PR = "r2"
> +PR = "r3"
>
>   S = "${WORKDIR}/qt-mobility-opensource-src-${PV}"
>

Merged into OE-Core

Thanks
	Sau!


