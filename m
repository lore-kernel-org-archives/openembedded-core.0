Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qr80j-000842-Pt for openembedded-core@lists.openembedded.org;
	Wed, 10 Aug 2011 14:35:49 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7ACVJfP021508
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2011 13:31:19 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20864-05 for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2011 13:31:15 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7ACVA5P021502
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2011 13:31:11 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <b58224cc88baa6cfea83da19e0315d1f4307df5b.1312878559.git.xiaofeng.yan@windriver.com>
References: <cover.1312878559.git.xiaofeng.yan@windriver.com>
	<b58224cc88baa6cfea83da19e0315d1f4307df5b.1312878559.git.xiaofeng.yan@windriver.com>
Date: Wed, 10 Aug 2011 13:30:36 +0100
Message-ID: <1312979436.14274.365.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] qt3: Solve the failure to compile qt3 on platform arm
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
X-List-Received-Date: Wed, 10 Aug 2011 12:35:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-08-09 at 16:50 +0800, Xiaofeng Yan wrote:
> From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> 
> [YOCTO #1348]
> The variable "TARGET_OS" has different value when building qt-x11-free-native and \
> qt-x11-free.
> The different cause failure to compile qt3.
> $ bitbake qt-x11-free-native -e | grep ^TARGET_OS
> TARGET_OS="linux"
> $ bitbake qt-x11-free -e | grep ^TARGET_OS
> TARGET_OS="linux-gnueabi"
> 
> Use "TARGETOS = linux${LIBCEXTENSION}${ABIEXTENSION}" in place of TARGET_OS \
> for solving this bug.

This doesn't look right.

-native packages shouldn't have *any* target system dependencies, they
should build once and be suitable for all targets.

This sounds like we're encoding target specific information into native
recipes which we can't do.

It sounds like we need to look for linux-oe-g++ even in the qemuarm case
so its the target recipe which needs fixing to always use "linux"
instead of "linux-gnueabi" in the arm case.

Cheers,

Richard

> 
> Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> ---
>  recipes-qt3/qt3/qt-x11-free-native_3.3.5.bb |    7 ++++---
>  1 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-qt3/qt3/qt-x11-free-native_3.3.5.bb b/recipes-qt3/qt3/qt-x11-free-native_3.3.5.bb
> index e64256f..fe04a4a 100644
> --- a/recipes-qt3/qt3/qt-x11-free-native_3.3.5.bb
> +++ b/recipes-qt3/qt3/qt-x11-free-native_3.3.5.bb
> @@ -4,10 +4,11 @@ PRIORITY = "optional"
>  LICENSE = "GPL | QPL"
>  DEPENDS = "xmu-native"
>  HOMEPAGE = "http://www.trolltech.com"
> -PR = "r0"
> +PR = "r1"
>  
>  PROVIDES += "qt-x11-free-native"
>  FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/qt-x11-free"
> +TARGETOS = linux${LIBCEXTENSION}${ABIEXTENSION}
>  
>  LIC_FILES_CHKSUM = "file://LICENSE.GPL;md5=629178675a7d49c9fa19dfe9f43ea256 \
>                      file://LICENSE.QPL;md5=fff372435cb41647bc0b3cb940ea5c51"
> @@ -26,7 +27,7 @@ export QTDIR = "${S}"
>  export SYSCONF_CXX = "${CCACHE} g++"
>  export SYSCONF_CC  = "${CCACHE} gcc"
>  export SYSCONF_LINK  = "${CCACHE} g++"
> -THIS_QMAKESPEC = "${STAGING_DATADIR}/qmake/${TARGET_OS}-oe-g++"
> +THIS_QMAKESPEC = "${STAGING_DATADIR}/qmake/${TARGETOS}-oe-g++"
>  export QMAKESPEC = ""
>  ARCH_i686 = "x86"
>  
> @@ -57,7 +58,7 @@ do_install() {
>   
>      install -d ${D}${datadir}/qt3/
>      cp -PfR mkspecs ${D}${datadir}/qt3/
> -    ln -sf linux-g++ ${D}${datadir}/qt3/mkspecs/${TARGET_OS}-oe-g++
> +    ln -sf linux-g++ ${D}${datadir}/qt3/mkspecs/${TARGETOS}-oe-g++
>      ln -s ${D}${datadir}/qt3/mkspecs/ ${D}${datadir}/qmake
>      install -d ${D}${libdir}/
>      oe_soinstall lib/libqt-mt.so.${PV} ${D}${libdir}/




