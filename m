Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RJACX-00054i-6k
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Oct 2011 22:35:53 +0200
Received: from mail-wy0-f180.google.com ([74.125.82.180])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 26 Oct 2011 13:29:50 -0700
Received: by wyg24 with SMTP id 24so2107147wyg.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2011 13:29:49 -0700 (PDT)
Received: by 10.216.21.74 with SMTP id q52mr121758weq.36.1319660988980;
	Wed, 26 Oct 2011 13:29:48 -0700 (PDT)
Received: from [10.192.3.184] ([85.13.70.251])
	by mx.google.com with ESMTPS id ei16sm5216873wbb.21.2011.10.26.13.29.47
	(version=SSLv3 cipher=OTHER); Wed, 26 Oct 2011 13:29:47 -0700 (PDT)
Message-ID: <4EA86DB9.7000007@intel.com>
Date: Wed, 26 Oct 2011 22:29:45 +0200
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1319427162.git.xiaofeng.yan@windriver.com>
	<3eac60f2d638250e038ad9be06b12fd553b9f0b7.1319427162.git.xiaofeng.yan@windriver.com>
In-Reply-To: <3eac60f2d638250e038ad9be06b12fd553b9f0b7.1319427162.git.xiaofeng.yan@windriver.com>
Subject: Re: [PATCH 1/1] qmmp: update to 0.5.2
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
X-List-Received-Date: Wed, 26 Oct 2011 20:35:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/24/2011 05:37 AM, Xiaofeng Yan wrote:
> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>
> Use do_split_package for each grouping and name them correctly besides updating package.
> The format to name plugins of qmmp:
> qmmp-plugin-<group>-<library>   with the Description: Qmmp<Group>  plugin for %s"
>
This looks correct, but needs to be a git mv from 0.5.1 to 0.5.2, not a 
new recipe.  I will test this patch locally while waiting for your 
correction.

Thanks

Sau!

> Signed-off-by: Xiaofeng Yan<xiaofeng.yan@windriver.com>
> ---
>   meta/recipes-qt/qt-apps/qmmp_0.5.2.bb |   60 +++++++++++++++++++++++++++++++++
>   1 files changed, 60 insertions(+), 0 deletions(-)
>   create mode 100644 meta/recipes-qt/qt-apps/qmmp_0.5.2.bb
>
> diff --git a/meta/recipes-qt/qt-apps/qmmp_0.5.2.bb b/meta/recipes-qt/qt-apps/qmmp_0.5.2.bb
> new file mode 100644
> index 0000000..58dd825
> --- /dev/null
> +++ b/meta/recipes-qt/qt-apps/qmmp_0.5.2.bb
> @@ -0,0 +1,60 @@
> +dESCRIPTION = "Qmmp (Qt-based Multimedia Player) is an audio-player, written with help of Qt library"
> +HOMEPAGE = "http://qmmp.ylsoftware.com"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
> +SECTION = "multimedia"
> +
> +PR = "r4"
> +
> +PROVIDES = "qmmp"
> +DEPENDS = "qt4-x11-free taglib libmad libvorbis libogg alsa-lib"
> +RDEPENDS_${PN} += "taglib alsa-lib libmad curl"
> +
> +SRC_URI = "http://qmmp.ylsoftware.com/files/${BPN}-${PV}.tar.bz2"
> +
> +SRC_URI[md5sum] = "20852f3cce3471bfc5affa9b2e947dc6"
> +SRC_URI[sha256sum] = "6391dec020d2a381d7f4b7890fae6c49eadf88b3c9aef571fe3c5e96140822ec"
> +
> +
> +PARALLEL_MAKE = ""
> +
> +inherit qmake2 cmake package
> +
> +export EXTRA_OECMAKE = "-DQT_QMAKE_EXECUTABLE=${OE_QMAKE_QMAKE} \
> +                        -DQT_LRELEASE_EXECUTABLE=${OE_QMAKE_LRELEASE} \
> +                        -DQT_MOC_EXECUTABLE=${OE_QMAKE_MOC} \
> +                        -DQT_UIC_EXECUTABLE=${OE_QMAKE_UIC} \
> +                        -DQT_RCC_EXECUTABLE=${OE_QMAKE_RCC} \
> +                        -DQT_LIBRARY_DIR=${OE_QMAKE_LIBDIR_QT} \
> +                        -DQT_HEADERS_DIR=${OE_QMAKE_INCDIR_QT} \
> +                        -DQT_QTCORE_INCLUDE_DIR=${OE_QMAKE_INCDIR_QT}/QtCore \
> +                        "
> +PACKAGES_DYNAMIC = "qmmp-plugin-* "
> +
> +
> +python populate_packages_prepend () {
> +	import os
> +	qmmp_libdir = bb.data.expand('${libdir}/qmmp', d)
> +	gd = bb.data.expand('${D}/${libdir}/qmmp', d)
> +	plug_dirs = os.listdir(gd)
> +
> +	for plug_dir in plug_dirs:
> +		g_plug_dir = os.path.join(qmmp_libdir,plug_dir)
> +		do_split_packages(d, g_plug_dir, '^lib(.*)\.so$', 'qmmp-plugin-' + plug_dir + '-%s', 'Qmmp' + plug_dir  + 'plugin for %s')
> +		
> +
> +	
> +}
> +
> +FILES_${PN} = "\
> +		${bindir}/qmmp \
> +                ${libdir}/lib*${SOLIBS} \
> +		${datadir}/icons/* \
> +                ${datadir}/qmmp/images/* \
> +                ${datadir}/applications/* \
> +		"
> +
> +FILES_${PN}-dbg += "\
> +                ${libdir}/qmmp/*/.debug/* \
> +               "
> +



