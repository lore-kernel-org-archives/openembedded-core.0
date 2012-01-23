Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RpMlJ-0004Wi-Km
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jan 2012 17:28:54 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 23 Jan 2012 08:21:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="99636919"
Received: from unknown (HELO [10.255.14.82]) ([10.255.14.82])
	by orsmga001.jf.intel.com with ESMTP; 23 Jan 2012 08:21:07 -0800
Message-ID: <4F1D88F3.7040004@linux.intel.com>
Date: Mon, 23 Jan 2012 08:21:07 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1327123057.git.sgw@linux.intel.com>
	<4706547a51fe461a875c5f4e6c3006c583f16e83.1327123057.git.sgw@linux.intel.com>
	<CAP9ODKrBmJkZs62UxskxwyS3i7LEa_aAv+xEnHvfMUiEW+CO9w@mail.gmail.com>
In-Reply-To: <CAP9ODKrBmJkZs62UxskxwyS3i7LEa_aAv+xEnHvfMUiEW+CO9w@mail.gmail.com>
Subject: Re: [PATCH 16/20] opkg: move common code & metadata into opkg.inc to reduce code duplication
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
X-List-Received-Date: Mon, 23 Jan 2012 16:28:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/20/2012 10:13 PM, Otavio Salvador wrote:
> Seems to have a confusion between: PR_INC and INC_PR.
>
Already fixed in the actual branch, noticed this right after I sent this 
request.

Sau!

> On Sat, Jan 21, 2012 at 03:18, Saul Wold <sgw@linux.intel.com
> <mailto:sgw@linux.intel.com>> wrote:
>
>     Signed-off-by: Saul Wold <sgw@linux.intel.com
>     <mailto:sgw@linux.intel.com>>
>     ---
>       meta/recipes-devtools/opkg/opkg.inc      |   43
>     +++++++++++++++++++++++++++-
>       meta/recipes-devtools/opkg/opkg_0.1.8.bb <http://opkg_0.1.8.bb> |
>        44 +----------------------------
>       meta/recipes-devtools/opkg/opkg_svn.bb <http://opkg_svn.bb>   |
>     42 +---------------------------
>       3 files changed, 44 insertions(+), 85 deletions(-)
>
>     diff --git a/meta/recipes-devtools/opkg/opkg.inc
>     b/meta/recipes-devtools/opkg/opkg.inc
>     index 3e350e8..b03eaf7 100644
>     --- a/meta/recipes-devtools/opkg/opkg.inc
>     +++ b/meta/recipes-devtools/opkg/opkg.inc
>     @@ -11,6 +11,7 @@ DEPENDS_virtclass-native = "curl-native"
>       DEPENDS_virtclass-nativesdk = "curl-nativesdk"
>
>       PE = "1"
>     +PR_INC = "r6"
>
>       FILESDIR = "${@os.path.dirname(d.getVar('FILE',1))}/opkg"
>
>     @@ -31,8 +32,46 @@ EXTRA_OECONF +=
>     "--with-opkglibdir=${localstatedir}/lib"
>       EXTRA_OECONF_virtclass-native =
>     "--with-opkglibdir=${target_localstatedir}/lib --disable-gpg
>     --disable-curl --disable-openssl"
>       EXTRA_OECONF_virtclass-nativesdk =
>     "--with-opkglibdir=${target_localstatedir}/lib --disable-gpg
>     --disable-curl --disable-openssl"
>
>     -#PROVIDES_append_virtclass-native =
>     "virtual/update-alternatives-native"
>     -#RPROVIDES_${PN} += "update-alternatives-native"
>     +PROVIDES += "virtual/update-alternatives"
>     +RPROVIDES_update-alternatives-cworth += "update-alternatives"
>     +RCONFLICTS_update-alternatives-cworth = "update-alternatives-dpkg"
>     +RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives}
>     opkg-config-base"
>     +RDEPENDS_${PN}_virtclass-native = ""
>     +RDEPENDS_${PN}_virtclass-nativesdk = ""
>     +PACKAGE_ARCH_update-alternatives-cworth = "all"
>     +RREPLACES_${PN} = "opkg-nogpg"
>     +
>     +PACKAGES =+ "libopkg${PKGSUFFIX}-dev libopkg${PKGSUFFIX}
>     update-alternatives-cworth${PKGSUFFIX}"
>     +
>     +FILES_update-alternatives-cworth${PKGSUFFIX} =
>     "${bindir}/update-alternatives"
>     +FILES_libopkg${PKGSUFFIX}-dev = "${libdir}/*.a ${libdir}/*.la
>     ${libdir}/*.so"
>     +FILES_libopkg${PKGSUFFIX} = "${libdir}/*.so.*
>     ${localstatedir}/lib/opkg/"
>     +
>     +# We need to create the lock directory
>     +do_install_append() {
>     +       install -d ${D}${localstatedir}/lib/opkg
>     +}
>     +
>     +pkg_postinst_${PN} () {
>     +#!/bin/sh
>     +if [ "x$D" != "x" ]; then
>     +       install -d $D${sysconfdir}/rcS.d
>     +       # this happens at S98 where our good 'ole packages script
>     used to run
>     +       echo "#!/bin/sh
>     +opkg-cl configure
>     +rm -f /${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}configure
>     +" > $D${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}configure
>     +       chmod 0755
>     $D${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}configure
>     +fi
>     +
>     +update-alternatives --install ${bindir}/opkg opkg ${bindir}/opkg-cl 100
>     +}
>     +
>     +pkg_postrm_${PN} () {
>     +#!/bin/sh
>     +update-alternatives --remove opkg ${bindir}/opkg-cl
>     +}
>     +
>
>       BBCLASSEXTEND = "native nativesdk"
>
>     diff --git a/meta/recipes-devtools/opkg/opkg_0.1.8.bb
>     <http://opkg_0.1.8.bb> b/meta/recipes-devtools/opkg/opkg_0.1.8.bb
>     <http://opkg_0.1.8.bb>
>     index 18cf042..c206b37 100644
>     --- a/meta/recipes-devtools/opkg/opkg_0.1.8.bb <http://opkg_0.1.8.bb>
>     +++ b/meta/recipes-devtools/opkg/opkg_0.1.8.bb <http://opkg_0.1.8.bb>
>     @@ -1,48 +1,8 @@
>       require opkg.inc
>
>     -PROVIDES += "virtual/update-alternatives"
>     -RPROVIDES_update-alternatives-cworth += "update-alternatives"
>     -RCONFLICTS_update-alternatives-cworth = "update-alternatives-dpkg"
>     -RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives}
>     opkg-config-base"
>     -RDEPENDS_${PN}_virtclass-native = ""
>     -RDEPENDS_${PN}_virtclass-nativesdk = ""
>     -PACKAGE_ARCH_update-alternatives-cworth = "all"
>     -
>       SRC_URI = "http://opkg.googlecode.com/files/opkg-${PV}.tar.gz \
>                 file://add_vercmp.patch \
>                 file://headerfix.patch \
>     -"
>     -
>     -PR = "r4"
>     -
>     -PACKAGES =+ "libopkg${PKGSUFFIX}-dev libopkg${PKGSUFFIX}
>     update-alternatives-cworth${PKGSUFFIX}"
>     -
>     -FILES_update-alternatives-cworth${PKGSUFFIX} =
>     "${bindir}/update-alternatives"
>     -FILES_libopkg${PKGSUFFIX}-dev = "${libdir}/*.a ${libdir}/*.la
>     ${libdir}/*.so"
>     -FILES_libopkg${PKGSUFFIX} = "${libdir}/*.so.*
>     ${localstatedir}/lib/opkg/"
>     -
>     -# We need to create the lock directory
>     -do_install_append() {
>     -       install -d ${D}${localstatedir}/lib/opkg
>     -}
>     -
>     -pkg_postinst_${PN} () {
>     -#!/bin/sh
>     -if [ "x$D" != "x" ]; then
>     -       install -d ${IMAGE_ROOTFS}/${sysconfdir}/rcS.d
>     -       # this happens at S98 where our good 'ole packages script
>     used to run
>     -       echo "#!/bin/sh
>     -opkg-cl configure
>     -rm -f /${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}configure
>     -" > $D${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}configure
>     -       chmod 0755
>     $D${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}configure
>     -fi
>     -
>     -update-alternatives --install ${bindir}/opkg opkg ${bindir}/opkg-cl 100
>     -}
>     -
>     -pkg_postrm_${PN} () {
>     -#!/bin/sh
>     -update-alternatives --remove opkg ${bindir}/opkg-cl
>     -}
>     + "
>
>     +PR = "${INC_PR}.0"
>     diff --git a/meta/recipes-devtools/opkg/opkg_svn.bb
>     <http://opkg_svn.bb> b/meta/recipes-devtools/opkg/opkg_svn.bb
>     <http://opkg_svn.bb>
>     index f5f540d..c07d393 100644
>     --- a/meta/recipes-devtools/opkg/opkg_svn.bb <http://opkg_svn.bb>
>     +++ b/meta/recipes-devtools/opkg/opkg_svn.bb <http://opkg_svn.bb>
>     @@ -1,14 +1,5 @@
>       require opkg.inc
>
>     -PROVIDES += "virtual/update-alternatives"
>     -RPROVIDES_update-alternatives-cworth += "update-alternatives"
>     -RCONFLICTS_update-alternatives-cworth = "update-alternatives-dpkg"
>     -RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives}
>     opkg-config-base"
>     -RDEPENDS_${PN}_virtclass-native = ""
>     -RDEPENDS_${PN}_virtclass-nativesdk = ""
>     -PACKAGE_ARCH_update-alternatives-cworth = "all"
>     -RREPLACES_${PN} = "opkg-nogpg"
>     -
>       SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;proto=http
>     <http://opkg.googlecode.com/svn;module=trunk;proto=http> \
>                 file://add_vercmp.patch \
>                 file://add_uname_support.patch \
>     @@ -21,36 +12,5 @@ S = "${WORKDIR}/trunk"
>
>       SRCREV = "633"
>       PV = "0.1.8+svnr${SRCPV}"
>     -PR = "r5"
>     -
>     -PACKAGES =+ "libopkg${PKGSUFFIX}-dev libopkg${PKGSUFFIX}
>     update-alternatives-cworth${PKGSUFFIX}"
>     -
>     -FILES_update-alternatives-cworth${PKGSUFFIX} =
>     "${bindir}/update-alternatives"
>     -FILES_libopkg${PKGSUFFIX}-dev = "${libdir}/*.a ${libdir}/*.la
>     ${libdir}/*.so"
>     -FILES_libopkg${PKGSUFFIX} = "${libdir}/*.so.*
>     ${localstatedir}/lib/opkg/"
>     -
>     -# We need to create the lock directory
>     -do_install_append() {
>     -       install -d ${D}${localstatedir}/lib/opkg
>     -}
>     -
>     -pkg_postinst_${PN} () {
>     -#!/bin/sh
>     -if [ "x$D" != "x" ]; then
>     -       install -d $D${sysconfdir}/rcS.d
>     -       # this happens at S98 where our good 'ole packages script
>     used to run
>     -       echo "#!/bin/sh
>     -opkg-cl configure
>     -rm -f /${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}configure
>     -" > $D${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}configure
>     -       chmod 0755
>     $D${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}configure
>     -fi
>     -
>     -update-alternatives --install ${bindir}/opkg opkg ${bindir}/opkg-cl 100
>     -}
>     -
>     -pkg_postrm_${PN} () {
>     -#!/bin/sh
>     -update-alternatives --remove opkg ${bindir}/opkg-cl
>     -}
>
>     +PR = "${INC_PR}.0"
>     --
>     1.7.6.5
>
>
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
>
>
> --
> Otavio Salvador                             O.S. Systems
> E-mail: otavio@ossystems.com.br <mailto:otavio@ossystems.com.br>
> http://www.ossystems.com.br
> Mobile: +55 53 9981-7854 http://projetos.ossystems.com.br
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


