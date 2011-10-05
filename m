Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RBJ9f-0001sk-QD
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Oct 2011 06:32:28 +0200
Received: from mail-bw0-f52.google.com ([209.85.214.52])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 04 Oct 2011 21:26:50 -0700
Received: by bke5 with SMTP id 5so1478356bke.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Oct 2011 21:26:49 -0700 (PDT)
Received: by 10.223.35.18 with SMTP id n18mr574766fad.105.1317788808732;
	Tue, 04 Oct 2011 21:26:48 -0700 (PDT)
Received: from [10.6.18.233] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id b10sm556475fam.1.2011.10.04.21.26.45
	(version=SSLv3 cipher=OTHER); Tue, 04 Oct 2011 21:26:47 -0700 (PDT)
Message-ID: <4E8BDC84.4090809@intel.com>
Date: Tue, 04 Oct 2011 21:26:44 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.2) Gecko/20110906 Thunderbird/6.0.2
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1317591971-22553-1-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1317591971-22553-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: Re: [PATCH 1/2] qt4: Fix translation support
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
X-List-Received-Date: Wed, 05 Oct 2011 04:32:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/02/2011 02:46 PM, Dmitry Eremin-Solenikov wrote:
> From: Otavio Salvador<otavio@ossystems.com.br>
>
> The translation support was disable in build. The
> fix-translation.patch was imported from OpenEmbedded to fix a linking
> issue in phonon translation support.
>
> [Dmitry Eremin-Solenikov: ported to apply to qt 4.7.4 build, bumped PR]
>
> Signed-off-by: Otavio Salvador<otavio@ossystems.com.br>
> Signed-off-by: Dmitry Eremin-Solenikov<dbaryshkov@gmail.com>
> ---
>   meta/recipes-qt/qt4/qt-4.7.4.inc                   |    9 ++---
>   .../recipes-qt/qt4/qt-4.7.4/fix-translations.patch |   32 ++++++++++++++++++++
>   meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb          |    2 +-
>   meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb          |    2 +-
>   4 files changed, 38 insertions(+), 7 deletions(-)
>   create mode 100644 meta/recipes-qt/qt4/qt-4.7.4/fix-translations.patch
>
> diff --git a/meta/recipes-qt/qt4/qt-4.7.4.inc b/meta/recipes-qt/qt4/qt-4.7.4.inc
> index 5c06bbe..bc33b6b 100644
> --- a/meta/recipes-qt/qt4/qt-4.7.4.inc
> +++ b/meta/recipes-qt/qt4/qt-4.7.4.inc
> @@ -13,6 +13,7 @@ SRC_URI = "http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.
>              file://0009-support-2bpp.patch \
>              file://0001-Added-Openembedded-crossarch-option.patch \
>              file://blacklist-diginotar-certs.diff \
> +           file://fix-translations.patch \
>              file://g++.conf \
>              file://linux.conf \
>              file://fix-qtbug-20925.patch \
> @@ -27,7 +28,9 @@ FILES_${QT_BASE_NAME}-tools                += "${bindir}/qml"
>
>   do_configure_prepend() {
>       for pro in $(find ${S} -name "*.pro") ; do
> -        sed -i 's:$$QT_BUILD_TREE/bin/lrelease:${OE_QMAKE_LRELEASE}:g' $pro
> +        sed -i \
> +            -e 's:$$QT_BUILD_TREE/bin/lrelease:${OE_QMAKE_LRELEASE}:g' \
> +            -e 's:qtPrepareTool(LRELEASE, lrelease):LRELEASE = ${OE_QMAKE_LRELEASE}:g' $pro
>       done
>
>       sed -i s:SEDME:${S}: ${WORKDIR}/linux.conf
> @@ -39,10 +42,6 @@ do_configure_prepend() {
>       ${S}/configure
>   }
>
> -do_configure_append() {
> -    sed -e '/QMAKE_TARGET /d' -e '/TARGET /d' -i ${S}/translations/Makefile
> -}
> -
>   QT_GLFLAGS ?= ""
>   QT_CONFIG_FLAGS += " -xmlpatterns -no-rpath -qt3support -reduce-relocations -silent ${QT_GLFLAGS}"
>
> diff --git a/meta/recipes-qt/qt4/qt-4.7.4/fix-translations.patch b/meta/recipes-qt/qt4/qt-4.7.4/fix-translations.patch
> new file mode 100644
> index 0000000..906d4e3
> --- /dev/null
> +++ b/meta/recipes-qt/qt4/qt-4.7.4/fix-translations.patch
> @@ -0,0 +1,32 @@
> +fix phony translation linking error
> +
> +  | .../usr/lib/crt1.o: In function `_start':
> +  | .../../sysdeps/i386/elf/start.S:115: undefined reference to `main'
> +  | collect2: ld returned 1 exit status
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Otavio Salvador<otavio@ossystems.com.br>
> +
> +diff --git a/translations/translations.pro b/translations/translations.pro
> +index cdaf04a..24fa668 100644
> +--- a/translations/translations.pro
> ++++ b/translations/translations.pro
> +@@ -20,7 +20,7 @@ updateqm.name = LRELEASE ${QMAKE_FILE_IN}
> + updateqm.CONFIG += no_link
> + QMAKE_EXTRA_COMPILERS += updateqm
> +
> +-isEmpty(vcproj) {
> ++!isEmpty(vcproj) {
> +     QMAKE_LINK = @: IGNORE THIS LINE
> +     OBJECTS_DIR =
> +     win32:CONFIG -= embed_manifest_exe
> +@@ -30,7 +30,7 @@ isEmpty(vcproj) {
> +     phony_src.input = PHONY_DEPS
> +     phony_src.output = phony.c
> +     phony_src.variable_out = GENERATED_SOURCES
> +-    phony_src.commands = echo int main() { return 0; }>  phony.c
> ++    phony_src.commands = echo \"int main() { return 0; }\">  phony.c
> +     phony_src.name = CREATE phony.c
> +     phony_src.CONFIG += combine
> +     QMAKE_EXTRA_COMPILERS += phony_src
> diff --git a/meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb b/meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb
> index 9d893f9..34061cb 100644
> --- a/meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb
> +++ b/meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb
> @@ -1,7 +1,7 @@
>   require qt-${PV}.inc
>   require qt4-embedded.inc
>
> -PR = "${INC_PR}.2"
> +PR = "${INC_PR}.3"
>
>   QT_CONFIG_FLAGS_append_armv6-vfp = " -no-neon "
>
> diff --git a/meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb b/meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb
> index 2f39ec0..0290313 100644
> --- a/meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb
> +++ b/meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb
> @@ -1,7 +1,7 @@
>   require qt4-x11-free.inc
>   require qt-${PV}.inc
>
> -PR = "${INC_PR}.2"
> +PR = "${INC_PR}.3"
>
>   QT_CONFIG_FLAGS_append_armv6-vfp = " -no-neon "
>

The 2 patches were merged to OE-Core

Thanks
	Sau!


