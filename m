Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TOwml-00060B-MD
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Oct 2012 22:33:43 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 18 Oct 2012 13:20:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,609,1344236400"; d="scan'208";a="237146310"
Received: from unknown (HELO [10.255.13.210]) ([10.255.13.210])
	by fmsmga002.fm.intel.com with ESMTP; 18 Oct 2012 13:20:22 -0700
Message-ID: <50806486.3030601@linux.intel.com>
Date: Thu, 18 Oct 2012 13:20:22 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1350038890-8985-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1350038890-8985-1-git-send-email-Martin.Jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] qt4: use extra variable for more QT_CONFIG_FLAGS fragments
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
X-List-Received-Date: Thu, 18 Oct 2012 20:33:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/12/2012 03:48 AM, Martin Jansa wrote:
> * qt4-embedded was forcing -DQT_KEYPAD_NAVIGATION which depends on feature-completer
> * separate variable makes it easier to not enable QT_KEYPAD_NAVIGATION in some upper layer where we have disabled feature-completer
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>   meta/recipes-qt/qt4/qt4-embedded.inc | 10 ++++++++--
>   meta/recipes-qt/qt4/qt4-x11-free.inc |  6 ++++--
>   2 files changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-qt/qt4/qt4-embedded.inc b/meta/recipes-qt/qt4/qt4-embedded.inc
> index 4a146f7..afca7f8 100644
> --- a/meta/recipes-qt/qt4/qt4-embedded.inc
> +++ b/meta/recipes-qt/qt4/qt4-embedded.inc
> @@ -10,14 +10,20 @@ QT_BASE_LIB  ?= "libqt-embedded"
>   # Set necessary variables in the profile
>   SRC_URI += "file://qte.sh"
>
> -QT_CONFIG_FLAGS += " \
> +QT_EMBEDDED_FLAGS ?= " \
>       -embedded $QT_ARCH \
>       -qtlibinfix ${QT_LIBINFIX} \
> +"
> +QT_EMBEDDED_EXTRA_FLAGS ?= " \
>       -plugin-gfx-transformed -plugin-gfx-qvfb -plugin-gfx-vnc -plugin-gfx-directfb \
>       -plugin-mouse-tslib -qt-mouse-pc -qt-mouse-qvfb -qt-mouse-linuxinput \
>       -qt-kbd-tty \
> +"
> +QT_EMBEDDED_KEYPAD_FLAGS ?= " \
>       -DQT_KEYPAD_NAVIGATION \
> -    "
> +"
> +
> +QT_CONFIG_FLAGS += "${QT_EMBEDDED_FLAGS} ${QT_EMBEDDED_EXTRA_FLAGS} ${QT_EMBEDDED_KEYPAD_FLAGS}"
>
>   require qt4.inc
>
> diff --git a/meta/recipes-qt/qt4/qt4-x11-free.inc b/meta/recipes-qt/qt4/qt4-x11-free.inc
> index 404d8b8..20ad30c 100644
> --- a/meta/recipes-qt/qt4/qt4-x11-free.inc
> +++ b/meta/recipes-qt/qt4/qt4-x11-free.inc
> @@ -12,11 +12,13 @@ INC_PR = "r47"
>   QT_GLFLAGS ?= "${@base_contains('DISTRO_FEATURES', 'opengl', '-opengl', '-no-opengl', d)} "
>   QT_GLFLAGS_qemux86 = "-opengl"
>   QT_GLFLAGS_qemuppc = "-opengl"
> -QT_CONFIG_FLAGS += "-no-xinerama -no-xkb"
> +QT_X11_FLAGS ?= "-no-xinerama -no-xkb"
> +QT_CONFIG_FLAGS += "${QT_X11_FLAGS}"
>   QT_BASE_LIB  ?= "libqt"
>
>   # required by kdelibs4
> -QT_DISTRO_FLAGS = "-accessibility -sm"
> +QT_KDE_FLAGS ?= "-accessibility -sm"
> +QT_DISTRO_FLAGS ?= "${QT_KDE_FLAGS}"
>
>   inherit qt4x11
>
>

Merged into OE-Core

Thanks
	Sau!



