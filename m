Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SMnnz-0004FV-LT
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Apr 2012 00:01:51 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 24 Apr 2012 14:52:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="145459292"
Received: from unknown (HELO [10.255.12.125]) ([10.255.12.125])
	by fmsmga001.fm.intel.com with ESMTP; 24 Apr 2012 14:52:15 -0700
Message-ID: <4F97208F.3090304@linux.intel.com>
Date: Tue, 24 Apr 2012 14:52:15 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1335047323-12316-1-git-send-email-cheepeero@gmx.net>
In-Reply-To: <1335047323-12316-1-git-send-email-cheepeero@gmx.net>
Subject: Re: [oe] Fix bad linkage towards host qt-mobility sensors module
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
X-List-Received-Date: Tue, 24 Apr 2012 22:01:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/21/2012 03:28 PM, Ciprian Ciubotariu wrote:
> Prevent qmake from using mobilityconfig.prf from host system when build webkit.
> ---
>   meta/recipes-qt/qt4/qt-4.8.0.inc                  |    1 +
>   meta/recipes-qt/qt4/qt-4.8.0/no-qt-mobility.patch |   52 +++++++++++++++++++++
>   meta/recipes-qt/qt4/qt4-x11-free_4.8.0.bb         |    2 +-
>   3 files changed, 54 insertions(+), 1 deletions(-)
>   create mode 100644 meta/recipes-qt/qt4/qt-4.8.0/no-qt-mobility.patch
>

Could you please check if this is an issue in master which is using 
4.8.1, if it still is then rebase this against master.
	Sau!

> diff --git a/meta/recipes-qt/qt4/qt-4.8.0.inc b/meta/recipes-qt/qt4/qt-4.8.0.inc
> index c0d90cd..af8db2a 100644
> --- a/meta/recipes-qt/qt4/qt-4.8.0.inc
> +++ b/meta/recipes-qt/qt4/qt-4.8.0.inc
> @@ -20,6 +20,7 @@ SRC_URI = "http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.
>              file://pulseaudio-config.patch \
>              file://g++.conf \
>              file://linux.conf \
> +           file://no-qt-mobility.patch \
>              "
>
>   SRC_URI[md5sum] = "e8a5fdbeba2927c948d9f477a6abe904"
> diff --git a/meta/recipes-qt/qt4/qt-4.8.0/no-qt-mobility.patch b/meta/recipes-qt/qt4/qt-4.8.0/no-qt-mobility.patch
> new file mode 100644
> index 0000000..ed66509
> --- /dev/null
> +++ b/meta/recipes-qt/qt4/qt-4.8.0/no-qt-mobility.patch
> @@ -0,0 +1,52 @@
> +diff --git a/src/3rdparty/webkit/Source/WebCore/features.pri b/src/3rdparty/webkit/Source/WebCore/features.pri
> +index f04d0b4..aac0482 100644
> +--- a/src/3rdparty/webkit/Source/WebCore/features.pri
> ++++ b/src/3rdparty/webkit/Source/WebCore/features.pri
> +@@ -14,7 +14,7 @@ meegotouch {
> + }
> +
> + ## load mobilityconfig if mobility is available
> +-load(mobilityconfig, true)
> ++#load(mobilityconfig, true)
> +
> + ## Define default features macros for optional components
> + ## (look for defs in config.h and included files!)
> +diff --git a/src/3rdparty/webkit/Source/WebKit/qt/examples/platformplugin/platformplugin.pro b/src/3rdparty/webkit/Source/WebKit/qt/examples/platformplugin/platformplugin.pro
> +index 80cecb3..856351a 100644
> +--- a/src/3rdparty/webkit/Source/WebKit/qt/examples/platformplugin/platformplugin.pro
> ++++ b/src/3rdparty/webkit/Source/WebKit/qt/examples/platformplugin/platformplugin.pro
> +@@ -4,7 +4,7 @@ TEMPLATE = lib
> + CONFIG += plugin
> +
> + ## load mobilityconfig if mobility is available
> +-load(mobilityconfig, true)
> ++#load(mobilityconfig, true)
> +
> + # HTML5 Media Support
> + # We require QtMultimedia
> +diff --git a/src/3rdparty/webkit/Source/WebKit/qt/symbian/platformplugin/platformplugin.pro b/src/3rdparty/webkit/Source/WebKit/qt/symbian/platformplugin/platformplugin.pro
> +index fd31e1e..52f1b46 100644
> +--- a/src/3rdparty/webkit/Source/WebKit/qt/symbian/platformplugin/platformplugin.pro
> ++++ b/src/3rdparty/webkit/Source/WebKit/qt/symbian/platformplugin/platformplugin.pro
> +@@ -11,7 +11,7 @@ QT       += core gui \
> +             xml
> +
> + ## load mobilityconfig if mobility is available
> +-load(mobilityconfig, true)
> ++#load(mobilityconfig, true)
> +
> + isEmpty(OUTPUT_DIR): OUTPUT_DIR = ../../../..
> +
> +diff --git a/src/3rdparty/webkit/Source/WebKit/qt/tests/tests.pri b/src/3rdparty/webkit/Source/WebKit/qt/tests/tests.pri
> +index 812fe93..ccbc5a0 100644
> +--- a/src/3rdparty/webkit/Source/WebKit/qt/tests/tests.pri
> ++++ b/src/3rdparty/webkit/Source/WebKit/qt/tests/tests.pri
> +@@ -7,7 +7,7 @@ CONFIG(QTDIR_build) { load(qttest_p4) }
> + ELSE { TARGET = tst_$$TARGET }
> +
> + # Load mobilityconfig if Qt Mobility is available
> +-load(mobilityconfig, true)
> ++#load(mobilityconfig, true)
> + contains(MOBILITY_CONFIG, multimedia) {
> +     # This define is used by tests depending on Qt Multimedia
> +     DEFINES -= WTF_USE_QT_MULTIMEDIA=0
> diff --git a/meta/recipes-qt/qt4/qt4-x11-free_4.8.0.bb b/meta/recipes-qt/qt4/qt4-x11-free_4.8.0.bb
> index 6a0b0b8..63a3769 100644
> --- a/meta/recipes-qt/qt4/qt4-x11-free_4.8.0.bb
> +++ b/meta/recipes-qt/qt4/qt4-x11-free_4.8.0.bb
> @@ -1,7 +1,7 @@
>   require qt4-x11-free.inc
>   require qt-${PV}.inc
>
> -PR = "${INC_PR}.1"
> +PR = "${INC_PR}.2"
>
>   DEFAULT_PREFERENCE = "-1"
>


