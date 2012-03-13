Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S7UfV-0003Yv-LE
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 17:33:49 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 13 Mar 2012 09:23:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="77004573"
Received: from unknown (HELO [10.255.15.137]) ([10.255.15.137])
	by AZSMGA002.ch.intel.com with ESMTP; 13 Mar 2012 09:23:04 -0700
Message-ID: <4F5F7468.902@linux.intel.com>
Date: Tue, 13 Mar 2012 09:23:04 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1331152588-27456-1-git-send-email-obi@opendreambox.org>
In-Reply-To: <1331152588-27456-1-git-send-email-obi@opendreambox.org>
Subject: Re: [PATCH] qt4: fix deps in libQtWebkit.la and QtWebKit.pc
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
X-List-Received-Date: Tue, 13 Mar 2012 16:33:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/07/2012 12:36 PM, Andreas Oberritter wrote:
> * Both files contain -L../../WebCore/release -L../../JavaScriptCore/release -lwebcore -ljscore
> * These paths and libs don't get installed.
> * When building a shared lib with libtool, that links
>    with libQtWebKit, libtool adds these unneeded parameters
>    to the linker command-line, thus linking fails.
>
> Signed-off-by: Andreas Oberritter<obi@opendreambox.org>
> ---
>   meta/recipes-qt/qt4/qt4-embedded.inc |    2 +-
>   meta/recipes-qt/qt4/qt4-x11-free.inc |    2 +-
>   meta/recipes-qt/qt4/qt4.inc          |    1 +
>   3 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-qt/qt4/qt4-embedded.inc b/meta/recipes-qt/qt4/qt4-embedded.inc
> index 80948f3..0e57e5a 100644
> --- a/meta/recipes-qt/qt4/qt4-embedded.inc
> +++ b/meta/recipes-qt/qt4/qt4-embedded.inc
> @@ -2,7 +2,7 @@ DESCRIPTION = "Qt is a versatile cross-platform application framework -- this is
>   SECTION = "libs"
>   HOMEPAGE = "http://qt.nokia.com"
>   DEPENDS += "directfb tslib"
> -INC_PR = "r41"
> +INC_PR = "r42"
>
>   QT_BASE_LIB  ?= "libqt-embedded"
>
> diff --git a/meta/recipes-qt/qt4/qt4-x11-free.inc b/meta/recipes-qt/qt4/qt4-x11-free.inc
> index 75487f7..56f349a 100644
> --- a/meta/recipes-qt/qt4/qt4-x11-free.inc
> +++ b/meta/recipes-qt/qt4/qt4-x11-free.inc
> @@ -5,7 +5,7 @@ HOMEPAGE = "http://qt.nokia.com"
>   SECTION = "x11/libs"
>   DEPENDS += "virtual/libgl virtual/libx11 fontconfig libxft libxext libxrender libxrandr libxcursor"
>
> -INC_PR = "r38"
> +INC_PR = "r39"
>
>   QT_GLFLAGS ?= "${@base_contains('DISTRO_FEATURES', 'opengl', '-opengl', '-no-opengl', d)} "
>   QT_GLFLAGS_qemux86 = "-opengl"
> diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
> index 2e70bd9..77fb06f 100644
> --- a/meta/recipes-qt/qt4/qt4.inc
> +++ b/meta/recipes-qt/qt4/qt4.inc
> @@ -328,6 +328,7 @@ do_install() {
>   			-e 's#" -Wl,-rpath-link,${S}/lib/\?"##g' \
>   			-e 's#" -Wl,-rpath-link,${libdir}/\?"##g' \
>   			-e 's#Iin#I${in#g' \
> +			-e 's#-L\.\./\.\./WebCore/release\s\+-L\.\./\.\./JavaScriptCore/release\s\+-lwebcore\s\+-ljscore##g' \
>   			${D}${libdir}/*.la ${D}${libdir}/*.prl ${D}${libdir}/pkgconfig/*.pc
>
>   	sed -i -e s#" -Wl,-rpath-link,${S}/lib"##g \


Merged into OE-Core

Thanks
	Sau!


