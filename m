Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1R8wlD-0000xx-0s
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 18:13:27 +0200
Received: from mail-iy0-f180.google.com ([209.85.210.180])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 28 Sep 2011 09:06:35 -0700
Received: by iahk25 with SMTP id k25so8644198iah.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2011 09:06:34 -0700 (PDT)
Received: by 10.68.23.163 with SMTP id n3mr44675777pbf.89.1317225994374;
	Wed, 28 Sep 2011 09:06:34 -0700 (PDT)
Received: from [10.6.18.230] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id h5sm8908354pbq.11.2011.09.28.09.06.33
	(version=SSLv3 cipher=OTHER); Wed, 28 Sep 2011 09:06:33 -0700 (PDT)
Message-ID: <4E834605.8070202@intel.com>
Date: Wed, 28 Sep 2011 09:06:29 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.2) Gecko/20110906 Thunderbird/6.0.2
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1316955464-19997-1-git-send-email-morphis@gravedo.de>
In-Reply-To: <1316955464-19997-1-git-send-email-morphis@gravedo.de>
Subject: Re: [PATCH 1/2] meta: qt4: fix postprocessing of pkg-config files
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
X-List-Received-Date: Wed, 28 Sep 2011 16:13:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/25/2011 05:57 AM, Simon Busch wrote:
> When building qt4-embedded the generated and cleaned pkg-config files for qt are wrong.
> The Cflags variable contains something like ${includedir}/qtopia/QtCore where
> ${includedir} is already /usr/include/qtopia/QtCore.
>
> This patch reverts the fix up of the Cflags variable implemented in do_install.
>
> Signed-off-by: Simon Busch<morphis@gravedo.de>
> ---
>   meta/recipes-qt/qt4/qt4-embedded.inc |    2 +-
>   meta/recipes-qt/qt4/qt4-x11-free.inc |    2 +-
>   meta/recipes-qt/qt4/qt4.inc          |    4 +---
>   3 files changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/meta/recipes-qt/qt4/qt4-embedded.inc b/meta/recipes-qt/qt4/qt4-embedded.inc
> index 9914c61..1ede922 100644
> --- a/meta/recipes-qt/qt4/qt4-embedded.inc
> +++ b/meta/recipes-qt/qt4/qt4-embedded.inc
> @@ -3,7 +3,7 @@ SECTION = "libs"
>   LICENSE = "LGPLv2.1 | GPLv3"
>   HOMEPAGE = "http://qt.nokia.com"
>   DEPENDS += "directfb tslib"
> -INC_PR = "r30"
> +INC_PR = "r31"
>
>   QT_BASE_NAME ?= "qt4-embedded"
>   QT_BASE_LIB  ?= "libqt-embedded"
> diff --git a/meta/recipes-qt/qt4/qt4-x11-free.inc b/meta/recipes-qt/qt4/qt4-x11-free.inc
> index 0a714be..a360ec3 100644
> --- a/meta/recipes-qt/qt4/qt4-x11-free.inc
> +++ b/meta/recipes-qt/qt4/qt4-x11-free.inc
> @@ -5,7 +5,7 @@ HOMEPAGE = "http://qt.nokia.com"
>   SECTION = "x11/libs"
>   DEPENDS += "virtual/libgl virtual/libx11 fontconfig libxft libxext libxrender libxrandr libxcursor"
>
> -INC_PR = "r27"
> +INC_PR = "r28"
>
>   QT_GLFLAGS ?= "${@base_contains('DISTRO_FEATURES', 'opengl', '-opengl', '-no-opengl', d)} "
>   QT_GLFLAGS_qemux86 = "-opengl"
> diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
> index 5545be7..7f3e1a4 100644
> --- a/meta/recipes-qt/qt4/qt4.inc
> +++ b/meta/recipes-qt/qt4/qt4.inc
> @@ -293,7 +293,6 @@ do_install() {
>   			-e s#'$(OE_QMAKE_LIBS_X11)'#"${OE_QMAKE_LIBS_X11}"#g \
>   			-e s#" -Wl,-rpath-link,${S}/lib"##g \
>   			-e s#" -Wl,-rpath-link,${libdir}"##g \
> -			-e 's#I/usr/include#Iincludedir}#g' \
>   			-e 's#Iin#I${in#g' \
>   			${D}${libdir}/*.la ${D}${libdir}/*.prl ${D}${libdir}/pkgconfig/*.pc
>
> @@ -310,8 +309,7 @@ do_install() {
>
>   	# QT abuses $includedir to point to its headers, which breaks pkgconfig sysroot, so manually fix it up here:
>   	for pc in ${D}${libdir}/pkgconfig/*.pc ; do
> -		sed -i -e "s:prefix}include/${QT_BASE_NAME}/$(basename $pc .pc):prefix}/include:" \
> -				-e "s,Cflags: ,Cflags: -IP{includedir}/${QT_BASE_NAME}/$(basename $pc .pc) ," \
> +		sed -i -e "s:prefix}include/${QT_DIR_NAME}/$(basename $pc .pc):prefix}/include:" \
>   				-e 's:IP{:I${:g' $pc
>   	done
>
Merged into OE-Core

Thanks
	Sau!



