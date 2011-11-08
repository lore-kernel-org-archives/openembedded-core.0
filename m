Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RNqI4-00085Q-6q
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 19:20:56 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 08 Nov 2011 10:14:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,477,1315206000"; d="scan'208";a="71930810"
Received: from unknown (HELO [10.255.12.14]) ([10.255.12.14])
	by azsmga001.ch.intel.com with ESMTP; 08 Nov 2011 10:14:40 -0800
Message-ID: <4EB97190.1060107@linux.intel.com>
Date: Tue, 08 Nov 2011 10:14:40 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <135de91f015deb0c4e3c3d01d83963fc20ecc5f7>
	<1320758932-4181-1-git-send-email-dima_ch@emcraft.com>
In-Reply-To: <1320758932-4181-1-git-send-email-dima_ch@emcraft.com>
Subject: Re: [PATCH] qt-mobility: qa_configure stage failed
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
X-List-Received-Date: Tue, 08 Nov 2011 18:20:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/08/2011 05:28 AM, Dmitry Cherukhin wrote:
> The catalogue /usr/lib removed from Makefiles used for building configure tests.
>
Even with this patch, I am still seeing Host Contamination issue with 
all the QtMobility recipes.

Sau!

> Signed-off-by: Dmitry Cherukhin<dima_ch@emcraft.com>
> ---
>   .../qt4/files/qt-mobility-configure.patch          |   17 +++++++++++++++++
>   meta/recipes-qt/qt4/qt-mobility_1.2.0.inc          |    3 ++-
>   2 files changed, 19 insertions(+), 1 deletions(-)
>   create mode 100644 meta/recipes-qt/qt4/files/qt-mobility-configure.patch
>
> diff --git a/meta/recipes-qt/qt4/files/qt-mobility-configure.patch b/meta/recipes-qt/qt4/files/qt-mobility-configure.patch
> new file mode 100644
> index 0000000..d61ec03
> --- /dev/null
> +++ b/meta/recipes-qt/qt4/files/qt-mobility-configure.patch
> @@ -0,0 +1,17 @@
> +When building qt-mobility, the qa_configure stage failed because the catalogue /usr/lib
> +is used in some Makefiles within configure tests. We manually removed this catalogue.
> +
> +Upstream-Status: Inappropriate [embedded]
> +Signed-off-by: Dmitry Cherukhin<dima_ch@emcraft.com>
> +
> +--- qt-mobility-opensource-src-1.2.0/configure.orig	2011-05-10 10:06:01.000000000 +0200
> ++++ qt-mobility-opensource-src-1.2.0/configure	2011-11-08 12:34:56.347645968 +0100
> +@@ -583,6 +583,8 @@
> +     fi
> +
> +     $QMAKE_EXEC $QMKSPEC "$relpath/config.tests/$2/$2.pro" 2>>  "$CONFIG_LOG">>  "$CONFIG_LOG"
> ++    cp Makefile Makefile.old
> ++    sed -e 's@-L/usr/lib@@'<Makefile.old>Makefile
> +     printf  " ."
> +     "$MAKE" clean>>  "$CONFIG_LOG"
> +     printf "."
> diff --git a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
> index f665e64..11aad8b 100644
> --- a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
> +++ b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
> @@ -5,7 +5,8 @@ LICENSE = "LGPLv2.1"
>   LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=fbc093901857fcd118f065f900982c24 \
>   		    file://LGPL_EXCEPTION.txt;md5=411080a56ff917a5a1aa08c98acae354"
>
> -SRC_URI = "http://get.qt.nokia.com/qt/add-ons/qt-mobility-opensource-src-${PV}.tar.gz "
> +SRC_URI = "http://get.qt.nokia.com/qt/add-ons/qt-mobility-opensource-src-${PV}.tar.gz \
> +	   file://qt-mobility-configure.patch "
>
>   SRC_URI[md5sum]="ea5db5a8d3dd4709c2926dceda646bd8"
>   SRC_URI[sha256sum]="ee3c88975e04139ac9589f76d4be646d44fcbc4c8c1cf2db621abc154cf0ba44"


