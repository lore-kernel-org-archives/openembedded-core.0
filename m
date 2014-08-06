Return-Path: <Yasir_Khan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 3082C65D53
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Aug 2014 12:51:47 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1XF0h1-0000cj-0q from Yasir_Khan@mentor.com ;
	Wed, 06 Aug 2014 05:51:47 -0700
Received: from SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 6 Aug 2014 05:51:46 -0700
Received: from EU-MBX-02.mgc.mentorg.com ([169.254.3.180]) by
	SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) with mapi id
	14.02.0247.003; Wed, 6 Aug 2014 13:51:45 +0100
From: "Khan, Yasir" <Yasir_Khan@mentor.com>
To: Andreas Oberritter <obi@opendreambox.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v2] wpa-supplicant: use PACKAGECONFIG for ssl
	selection
Thread-Index: AQHPsOTIsEVGg1wlHk6lEDP+01kgfZvDXqcAgAAnemA=
Date: Wed, 6 Aug 2014 12:51:45 +0000
Message-ID: <428317DA8188854B9B82598D29DA15E24E0D30A3@EU-MBX-02.mgc.mentorg.com>
References: <1407267450-64536-1-git-send-email-yasir_khan@mentor.com>,
	<53E20FC8.8090300@opendreambox.org>
In-Reply-To: <53E20FC8.8090300@opendreambox.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.68]
MIME-Version: 1.0
X-OriginalArrivalTime: 06 Aug 2014 12:51:46.0879 (UTC)
	FILETIME=[2EA37CF0:01CFB175]
Subject: Re: [PATCH v2] wpa-supplicant: use PACKAGECONFIG for ssl selection
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Aug 2014 12:51:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Andreas,=0A=
=0A=
>> +PACKAGECONFIG ??=3D "gnutls"=0A=
>> +PACKAGECONFIG[gnutls] =3D ",,gnutls"=0A=
> I think libgcrypt should be added here and removed above. At least it=0A=
> doesn't appear to be a runtime dependency when building with openssl, so=
=0A=
> I suppose it's a gnutls thing.=0A=
=0A=
As per commit 1fe8f631f, gnutls doesn't depend on libgcrypt anymore but wpa=
-supplicant does. So I guess it should be in the DEPENDS. =0A=
I've made other changes as you've pointed out. I will be sending another pa=
tch shortly.=0A=
=0A=
Regards =0A=
________________________________________=0A=
From: openembedded-core-bounces@lists.openembedded.org [openembedded-core-b=
ounces@lists.openembedded.org] on behalf of Andreas Oberritter [obi@opendre=
ambox.org]=0A=
Sent: Wednesday, August 06, 2014 4:21 PM=0A=
To: openembedded-core@lists.openembedded.org=0A=
Subject: Re: [OE-core] [PATCH v2] wpa-supplicant: use PACKAGECONFIG for ssl=
 selection=0A=
=0A=
Hello Yasir,=0A=
=0A=
On 05.08.2014 21:37, Yasir Khan wrote:=0A=
> From: Yasir-Khan <yasir_khan@mentor.com>=0A=
>=0A=
> Select between openssl or gnutls as ssl implementation via=0A=
> PACKAGECONFIG instead of explicitly adding both via DEPENDS.=0A=
>=0A=
> Signed-off-by: Yasir-Khan <yasir_khan@mentor.com>=0A=
> ---=0A=
>  .../wpa-supplicant/wpa-supplicant.inc              |   20 +-=0A=
>  .../wpa-supplicant/wpa-supplicant/defconfig-gnutls |  552 --------------=
------=0A=
>  .../wpa-supplicant/defconfig-hostapd               |  552 ++++++++++++++=
++++++=0A=
>  3 files changed, 569 insertions(+), 555 deletions(-)=0A=
>  delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt/defconfig-gnutls=0A=
>  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt/defconfig-hostapd=0A=
>=0A=
> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc =
b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc=0A=
> index d9c6532..a7e1a16 100644=0A=
> --- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc=0A=
> +++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc=0A=
> @@ -6,16 +6,20 @@ LICENSE =3D "BSD"=0A=
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dab87f20cd7e8c0d0a6539b34d3791=
d0e \=0A=
>                      file://README;beginline=3D1;endline=3D56;md5=3Da0725=
0b28e857455336bb59fc31cb845 \=0A=
>                      file://wpa_supplicant/wpa_supplicant.c;beginline=3D1=
;endline=3D12;md5=3De8e021e30f3a6ab7c341b66b86626a5a"=0A=
> -DEPENDS =3D "gnutls dbus libnl openssl libgcrypt"=0A=
> +DEPENDS =3D "dbus libnl libgcrypt"=0A=
>  RRECOMMENDS_${PN} =3D "wpa-supplicant-passphrase wpa-supplicant-cli"=0A=
>=0A=
> +PACKAGECONFIG ??=3D "gnutls"=0A=
> +PACKAGECONFIG[gnutls] =3D ",,gnutls"=0A=
=0A=
I think libgcrypt should be added here and removed above. At least it=0A=
doesn't appear to be a runtime dependency when building with openssl, so=0A=
I suppose it's a gnutls thing.=0A=
=0A=
> +PACKAGECONFIG[ssl] =3D ",,openssl"=0A=
=0A=
Please use openssl instead of ssl, which seems ambiguous.=0A=
=0A=
> +=0A=
>  inherit systemd=0A=
>=0A=
>  SYSTEMD_SERVICE_${PN} =3D "wpa_supplicant.service wpa_supplicant-nl80211=
@.service wpa_supplicant-wired@.service"=0A=
>  SYSTEMD_AUTO_ENABLE =3D "disable"=0A=
>=0A=
>  SRC_URI =3D "http://hostap.epitest.fi/releases/wpa_supplicant-${PV}.tar.=
gz \=0A=
> -           file://defconfig-gnutls \=0A=
> +           file://defconfig-hostapd \=0A=
=0A=
How about calling it just "defconfig" in order to avoid confusion?=0A=
=0A=
Regards,=0A=
Andreas=0A=
=0A=
>             file://wpa-supplicant.sh \=0A=
>             file://wpa_supplicant.conf \=0A=
>             file://wpa_supplicant.conf-sane \=0A=
> @@ -34,8 +38,18 @@ FILES_${PN} +=3D "${datadir}/dbus-1/system-services/*"=
=0A=
>  CONFFILES_${PN} +=3D "${sysconfdir}/wpa_supplicant.conf"=0A=
>=0A=
>  do_configure () {=0A=
> -     install -m 0755 ${WORKDIR}/defconfig-gnutls wpa_supplicant/.config=
=0A=
> +     install -m 0755 ${WORKDIR}/defconfig-hostapd wpa_supplicant/.config=
=0A=
>       echo "CFLAGS +=3D\"-I${STAGING_INCDIR}/libnl3\"" >> wpa_supplicant/=
.config=0A=
> +=0A=
> +     if echo "${PACKAGECONFIG}" | grep -qw "ssl"; then=0A=
> +             ssl=3Dopenssl=0A=
> +     elif echo "${PACKAGECONFIG}" | grep -qw "gnutls"; then=0A=
> +             ssl=3Dgnutls=0A=
> +     fi=0A=
> +     if [ -n "$ssl" ]; then=0A=
> +             sed -i "s/%ssl%/$ssl/" wpa_supplicant/.config=0A=
> +     fi=0A=
> +=0A=
>  }=0A=
>=0A=
>  export EXTRA_CFLAGS =3D "${CFLAGS}"=0A=
> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defc=
onfig-gnutls b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defc=
onfig-gnutls=0A=
> deleted file mode 100644=0A=
> index 92ef823..0000000=0A=
> --- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig-g=
nutls=0A=
> +++ /dev/null=0A=
> @@ -1,552 +0,0 @@=0A=
> -# Example wpa_supplicant build time configuration=0A=
> -#=0A=
> -# This file lists the configuration options that are used when building =
the=0A=
> -# hostapd binary. All lines starting with # are ignored. Configuration o=
ption=0A=
> -# lines must be commented out complete, if they are not to be included, =
i.e.,=0A=
> -# just setting VARIABLE=3Dn is not disabling that variable.=0A=
> -#=0A=
> -# This file is included in Makefile, so variables like CFLAGS and LIBS c=
an also=0A=
> -# be modified from here. In most cases, these lines should use +=3D in o=
rder not=0A=
> -# to override previous values of the variables.=0A=
> -=0A=
> -=0A=
> -# Uncomment following two lines and fix the paths if you have installed =
OpenSSL=0A=
> -# or GnuTLS in non-default location=0A=
> -#CFLAGS +=3D -I/usr/local/openssl/include=0A=
> -#LIBS +=3D -L/usr/local/openssl/lib=0A=
> -=0A=
> -# Some Red Hat versions seem to include kerberos header files from OpenS=
SL, but=0A=
> -# the kerberos files are not in the default include path. Following line=
 can be=0A=
> -# used to fix build issues on such systems (krb5.h not found).=0A=
> -#CFLAGS +=3D -I/usr/include/kerberos=0A=
> -=0A=
> -# Example configuration for various cross-compilation platforms=0A=
> -=0A=
> -#### sveasoft (e.g., for Linksys WRT54G) ###############################=
#######=0A=
> -#CC=3Dmipsel-uclibc-gcc=0A=
> -#CC=3D/opt/brcm/hndtools-mipsel-uclibc/bin/mipsel-uclibc-gcc=0A=
> -#CFLAGS +=3D -Os=0A=
> -#CPPFLAGS +=3D -I../src/include -I../../src/router/openssl/include=0A=
> -#LIBS +=3D -L/opt/brcm/hndtools-mipsel-uclibc-0.9.19/lib -lssl=0A=
> -########################################################################=
#######=0A=
> -=0A=
> -#### openwrt (e.g., for Linksys WRT54G) ################################=
#######=0A=
> -#CC=3Dmipsel-uclibc-gcc=0A=
> -#CC=3D/opt/brcm/hndtools-mipsel-uclibc/bin/mipsel-uclibc-gcc=0A=
> -#CFLAGS +=3D -Os=0A=
> -#CPPFLAGS=3D-I../src/include -I../openssl-0.9.7d/include \=0A=
> -#    -I../WRT54GS/release/src/include=0A=
> -#LIBS =3D -lssl=0A=
> -########################################################################=
#######=0A=
> -=0A=
> -=0A=
> -# Driver interface for Host AP driver=0A=
> -CONFIG_DRIVER_HOSTAP=3Dy=0A=
> -=0A=
> -# Driver interface for Agere driver=0A=
> -#CONFIG_DRIVER_HERMES=3Dy=0A=
> -# Change include directories to match with the local setup=0A=
> -#CFLAGS +=3D -I../../hcf -I../../include -I../../include/hcf=0A=
> -#CFLAGS +=3D -I../../include/wireless=0A=
> -=0A=
> -# Driver interface for madwifi driver=0A=
> -# Deprecated; use CONFIG_DRIVER_WEXT=3Dy instead.=0A=
> -#CONFIG_DRIVER_MADWIFI=3Dy=0A=
> -# Set include directory to the madwifi source tree=0A=
> -#CFLAGS +=3D -I../../madwifi=0A=
> -=0A=
> -# Driver interface for ndiswrapper=0A=
> -# Deprecated; use CONFIG_DRIVER_WEXT=3Dy instead.=0A=
> -#CONFIG_DRIVER_NDISWRAPPER=3Dy=0A=
> -=0A=
> -# Driver interface for Atmel driver=0A=
> -# CONFIG_DRIVER_ATMEL=3Dy=0A=
> -=0A=
> -# Driver interface for old Broadcom driver=0A=
> -# Please note that the newer Broadcom driver ("hybrid Linux driver") sup=
ports=0A=
> -# Linux wireless extensions and does not need (or even work) with the ol=
d=0A=
> -# driver wrapper. Use CONFIG_DRIVER_WEXT=3Dy with that driver.=0A=
> -#CONFIG_DRIVER_BROADCOM=3Dy=0A=
> -# Example path for wlioctl.h; change to match your configuration=0A=
> -#CFLAGS +=3D -I/opt/WRT54GS/release/src/include=0A=
> -=0A=
> -# Driver interface for Intel ipw2100/2200 driver=0A=
> -# Deprecated; use CONFIG_DRIVER_WEXT=3Dy instead.=0A=
> -#CONFIG_DRIVER_IPW=3Dy=0A=
> -=0A=
> -# Driver interface for Ralink driver=0A=
> -#CONFIG_DRIVER_RALINK=3Dy=0A=
> -=0A=
> -# Driver interface for generic Linux wireless extensions=0A=
> -# Note: WEXT is deprecated in the current Linux kernel version and no ne=
w=0A=
> -# functionality is added to it. nl80211-based interface is the new=0A=
> -# replacement for WEXT and its use allows wpa_supplicant to properly con=
trol=0A=
> -# the driver to improve existing functionality like roaming and to suppo=
rt new=0A=
> -# functionality.=0A=
> -CONFIG_DRIVER_WEXT=3Dy=0A=
> -=0A=
> -# Driver interface for Linux drivers using the nl80211 kernel interface=
=0A=
> -CONFIG_DRIVER_NL80211=3Dy=0A=
> -=0A=
> -# driver_nl80211.c requires libnl. If you are compiling it yourself=0A=
> -# you may need to point hostapd to your version of libnl.=0A=
> -#=0A=
> -#CFLAGS +=3D -I$<path to libnl include files>=0A=
> -#LIBS +=3D -L$<path to libnl library files>=0A=
> -=0A=
> -# Use libnl v2.0 (or 3.0) libraries.=0A=
> -#CONFIG_LIBNL20=3Dy=0A=
> -=0A=
> -# Use libnl 3.2 libraries (if this is selected, CONFIG_LIBNL20 is ignore=
d)=0A=
> -CONFIG_LIBNL32=3Dy=0A=
> -=0A=
> -=0A=
> -# Driver interface for FreeBSD net80211 layer (e.g., Atheros driver)=0A=
> -#CONFIG_DRIVER_BSD=3Dy=0A=
> -#CFLAGS +=3D -I/usr/local/include=0A=
> -#LIBS +=3D -L/usr/local/lib=0A=
> -#LIBS_p +=3D -L/usr/local/lib=0A=
> -#LIBS_c +=3D -L/usr/local/lib=0A=
> -=0A=
> -# Driver interface for Windows NDIS=0A=
> -#CONFIG_DRIVER_NDIS=3Dy=0A=
> -#CFLAGS +=3D -I/usr/include/w32api/ddk=0A=
> -#LIBS +=3D -L/usr/local/lib=0A=
> -# For native build using mingw=0A=
> -#CONFIG_NATIVE_WINDOWS=3Dy=0A=
> -# Additional directories for cross-compilation on Linux host for mingw t=
arget=0A=
> -#CFLAGS +=3D -I/opt/mingw/mingw32/include/ddk=0A=
> -#LIBS +=3D -L/opt/mingw/mingw32/lib=0A=
> -#CC=3Dmingw32-gcc=0A=
> -# By default, driver_ndis uses WinPcap for low-level operations. This ca=
n be=0A=
> -# replaced with the following option which replaces WinPcap calls with N=
DISUIO.=0A=
> -# However, this requires that WZC is disabled (net stop wzcsvc) before s=
tarting=0A=
> -# wpa_supplicant.=0A=
> -# CONFIG_USE_NDISUIO=3Dy=0A=
> -=0A=
> -# Driver interface for development testing=0A=
> -#CONFIG_DRIVER_TEST=3Dy=0A=
> -=0A=
> -# Driver interface for wired Ethernet drivers=0A=
> -CONFIG_DRIVER_WIRED=3Dy=0A=
> -=0A=
> -# Driver interface for the Broadcom RoboSwitch family=0A=
> -#CONFIG_DRIVER_ROBOSWITCH=3Dy=0A=
> -=0A=
> -# Driver interface for no driver (e.g., WPS ER only)=0A=
> -#CONFIG_DRIVER_NONE=3Dy=0A=
> -=0A=
> -# Enable IEEE 802.1X Supplicant (automatically included if any EAP metho=
d is=0A=
> -# included)=0A=
> -CONFIG_IEEE8021X_EAPOL=3Dy=0A=
> -=0A=
> -# EAP-MD5=0A=
> -CONFIG_EAP_MD5=3Dy=0A=
> -=0A=
> -# EAP-MSCHAPv2=0A=
> -CONFIG_EAP_MSCHAPV2=3Dy=0A=
> -=0A=
> -# EAP-TLS=0A=
> -CONFIG_EAP_TLS=3Dy=0A=
> -=0A=
> -# EAL-PEAP=0A=
> -CONFIG_EAP_PEAP=3Dy=0A=
> -=0A=
> -# EAP-TTLS=0A=
> -CONFIG_EAP_TTLS=3Dy=0A=
> -=0A=
> -# EAP-FAST=0A=
> -# Note: If OpenSSL is used as the TLS library, OpenSSL 1.0 or newer is n=
eeded=0A=
> -# for EAP-FAST support. Older OpenSSL releases would need to be patched,=
 e.g.,=0A=
> -# with openssl-0.9.8x-tls-extensions.patch, to add the needed functions.=
=0A=
> -#CONFIG_EAP_FAST=3Dy=0A=
> -=0A=
> -# EAP-GTC=0A=
> -CONFIG_EAP_GTC=3Dy=0A=
> -=0A=
> -# EAP-OTP=0A=
> -CONFIG_EAP_OTP=3Dy=0A=
> -=0A=
> -# EAP-SIM (enable CONFIG_PCSC, if EAP-SIM is used)=0A=
> -#CONFIG_EAP_SIM=3Dy=0A=
> -=0A=
> -# EAP-PSK (experimental; this is _not_ needed for WPA-PSK)=0A=
> -#CONFIG_EAP_PSK=3Dy=0A=
> -=0A=
> -# EAP-pwd (secure authentication using only a password)=0A=
> -#CONFIG_EAP_PWD=3Dy=0A=
> -=0A=
> -# EAP-PAX=0A=
> -#CONFIG_EAP_PAX=3Dy=0A=
> -=0A=
> -# LEAP=0A=
> -CONFIG_EAP_LEAP=3Dy=0A=
> -=0A=
> -# EAP-AKA (enable CONFIG_PCSC, if EAP-AKA is used)=0A=
> -#CONFIG_EAP_AKA=3Dy=0A=
> -=0A=
> -# EAP-AKA' (enable CONFIG_PCSC, if EAP-AKA' is used).=0A=
> -# This requires CONFIG_EAP_AKA to be enabled, too.=0A=
> -#CONFIG_EAP_AKA_PRIME=3Dy=0A=
> -=0A=
> -# Enable USIM simulator (Milenage) for EAP-AKA=0A=
> -#CONFIG_USIM_SIMULATOR=3Dy=0A=
> -=0A=
> -# EAP-SAKE=0A=
> -#CONFIG_EAP_SAKE=3Dy=0A=
> -=0A=
> -# EAP-GPSK=0A=
> -#CONFIG_EAP_GPSK=3Dy=0A=
> -# Include support for optional SHA256 cipher suite in EAP-GPSK=0A=
> -#CONFIG_EAP_GPSK_SHA256=3Dy=0A=
> -=0A=
> -# EAP-TNC and related Trusted Network Connect support (experimental)=0A=
> -#CONFIG_EAP_TNC=3Dy=0A=
> -=0A=
> -# Wi-Fi Protected Setup (WPS)=0A=
> -CONFIG_WPS=3Dy=0A=
> -# Enable WSC 2.0 support=0A=
> -#CONFIG_WPS2=3Dy=0A=
> -# Enable WPS external registrar functionality=0A=
> -#CONFIG_WPS_ER=3Dy=0A=
> -# Disable credentials for an open network by default when acting as a WP=
S=0A=
> -# registrar.=0A=
> -#CONFIG_WPS_REG_DISABLE_OPEN=3Dy=0A=
> -# Enable WPS support with NFC config method=0A=
> -#CONFIG_WPS_NFC=3Dy=0A=
> -=0A=
> -# EAP-IKEv2=0A=
> -#CONFIG_EAP_IKEV2=3Dy=0A=
> -=0A=
> -# EAP-EKE=0A=
> -#CONFIG_EAP_EKE=3Dy=0A=
> -=0A=
> -# PKCS#12 (PFX) support (used to read private key and certificate file f=
rom=0A=
> -# a file that usually has extension .p12 or .pfx)=0A=
> -CONFIG_PKCS12=3Dy=0A=
> -=0A=
> -# Smartcard support (i.e., private key on a smartcard), e.g., with opens=
sl=0A=
> -# engine.=0A=
> -CONFIG_SMARTCARD=3Dy=0A=
> -=0A=
> -# PC/SC interface for smartcards (USIM, GSM SIM)=0A=
> -# Enable this if EAP-SIM or EAP-AKA is included=0A=
> -#CONFIG_PCSC=3Dy=0A=
> -=0A=
> -# Support HT overrides (disable HT/HT40, mask MCS rates, etc.)=0A=
> -#CONFIG_HT_OVERRIDES=3Dy=0A=
> -=0A=
> -# Support VHT overrides (disable VHT, mask MCS rates, etc.)=0A=
> -#CONFIG_VHT_OVERRIDES=3Dy=0A=
> -=0A=
> -# Development testing=0A=
> -#CONFIG_EAPOL_TEST=3Dy=0A=
> -=0A=
> -# Select control interface backend for external programs, e.g, wpa_cli:=
=0A=
> -# unix =3D UNIX domain sockets (default for Linux/*BSD)=0A=
> -# udp =3D UDP sockets using localhost (127.0.0.1)=0A=
> -# named_pipe =3D Windows Named Pipe (default for Windows)=0A=
> -# udp-remote =3D UDP sockets with remote access (only for tests systems/=
purpose)=0A=
> -# y =3D use default (backwards compatibility)=0A=
> -# If this option is commented out, control interface is not included in =
the=0A=
> -# build.=0A=
> -CONFIG_CTRL_IFACE=3Dy=0A=
> -=0A=
> -# Include support for GNU Readline and History Libraries in wpa_cli.=0A=
> -# When building a wpa_cli binary for distribution, please note that thes=
e=0A=
> -# libraries are licensed under GPL and as such, BSD license may not appl=
y for=0A=
> -# the resulting binary.=0A=
> -#CONFIG_READLINE=3Dy=0A=
> -=0A=
> -# Include internal line edit mode in wpa_cli. This can be used as a repl=
acement=0A=
> -# for GNU Readline to provide limited command line editing and history s=
upport.=0A=
> -#CONFIG_WPA_CLI_EDIT=3Dy=0A=
> -=0A=
> -# Remove debugging code that is printing out debug message to stdout.=0A=
> -# This can be used to reduce the size of the wpa_supplicant considerably=
=0A=
> -# if debugging code is not needed. The size reduction can be around 35%=
=0A=
> -# (e.g., 90 kB).=0A=
> -#CONFIG_NO_STDOUT_DEBUG=3Dy=0A=
> -=0A=
> -# Remove WPA support, e.g., for wired-only IEEE 802.1X supplicant, to sa=
ve=0A=
> -# 35-50 kB in code size.=0A=
> -#CONFIG_NO_WPA=3Dy=0A=
> -=0A=
> -# Remove IEEE 802.11i/WPA-Personal ASCII passphrase support=0A=
> -# This option can be used to reduce code size by removing support for=0A=
> -# converting ASCII passphrases into PSK. If this functionality is remove=
d, the=0A=
> -# PSK can only be configured as the 64-octet hexstring (e.g., from=0A=
> -# wpa_passphrase). This saves about 0.5 kB in code size.=0A=
> -#CONFIG_NO_WPA_PASSPHRASE=3Dy=0A=
> -=0A=
> -# Disable scan result processing (ap_mode=3D1) to save code size by abou=
t 1 kB.=0A=
> -# This can be used if ap_scan=3D1 mode is never enabled.=0A=
> -#CONFIG_NO_SCAN_PROCESSING=3Dy=0A=
> -=0A=
> -# Select configuration backend:=0A=
> -# file =3D text file (e.g., wpa_supplicant.conf; note: the configuration=
 file=0A=
> -#    path is given on command line, not here; this option is just used t=
o=0A=
> -#    select the backend that allows configuration files to be used)=0A=
> -# winreg =3D Windows registry (see win_example.reg for an example)=0A=
> -CONFIG_BACKEND=3Dfile=0A=
> -=0A=
> -# Remove configuration write functionality (i.e., to allow the configura=
tion=0A=
> -# file to be updated based on runtime configuration changes). The runtim=
e=0A=
> -# configuration can still be changed, the changes are just not going to =
be=0A=
> -# persistent over restarts. This option can be used to reduce code size =
by=0A=
> -# about 3.5 kB.=0A=
> -#CONFIG_NO_CONFIG_WRITE=3Dy=0A=
> -=0A=
> -# Remove support for configuration blobs to reduce code size by about 1.=
5 kB.=0A=
> -#CONFIG_NO_CONFIG_BLOBS=3Dy=0A=
> -=0A=
> -# Select program entry point implementation:=0A=
> -# main =3D UNIX/POSIX like main() function (default)=0A=
> -# main_winsvc =3D Windows service (read parameters from registry)=0A=
> -# main_none =3D Very basic example (development use only)=0A=
> -#CONFIG_MAIN=3Dmain=0A=
> -=0A=
> -# Select wrapper for operatins system and C library specific functions=
=0A=
> -# unix =3D UNIX/POSIX like systems (default)=0A=
> -# win32 =3D Windows systems=0A=
> -# none =3D Empty template=0A=
> -#CONFIG_OS=3Dunix=0A=
> -=0A=
> -# Select event loop implementation=0A=
> -# eloop =3D select() loop (default)=0A=
> -# eloop_win =3D Windows events and WaitForMultipleObject() loop=0A=
> -#CONFIG_ELOOP=3Deloop=0A=
> -=0A=
> -# Should we use poll instead of select? Select is used by default.=0A=
> -#CONFIG_ELOOP_POLL=3Dy=0A=
> -=0A=
> -# Select layer 2 packet implementation=0A=
> -# linux =3D Linux packet socket (default)=0A=
> -# pcap =3D libpcap/libdnet/WinPcap=0A=
> -# freebsd =3D FreeBSD libpcap=0A=
> -# winpcap =3D WinPcap with receive thread=0A=
> -# ndis =3D Windows NDISUIO (note: requires CONFIG_USE_NDISUIO=3Dy)=0A=
> -# none =3D Empty template=0A=
> -#CONFIG_L2_PACKET=3Dlinux=0A=
> -=0A=
> -# PeerKey handshake for Station to Station Link (IEEE 802.11e DLS)=0A=
> -CONFIG_PEERKEY=3Dy=0A=
> -=0A=
> -# IEEE 802.11w (management frame protection), also known as PMF=0A=
> -# Driver support is also needed for IEEE 802.11w.=0A=
> -#CONFIG_IEEE80211W=3Dy=0A=
> -=0A=
> -# Select TLS implementation=0A=
> -# openssl =3D OpenSSL (default)=0A=
> -# gnutls =3D GnuTLS=0A=
> -# internal =3D Internal TLSv1 implementation (experimental)=0A=
> -# none =3D Empty template=0A=
> -#CONFIG_TLS=3Dopenssl=0A=
> -=0A=
> -# TLS-based EAP methods require at least TLS v1.0. Newer version of TLS =
(v1.1)=0A=
> -# can be enabled to get a stronger construction of messages when block c=
iphers=0A=
> -# are used. It should be noted that some existing TLS v1.0 -based=0A=
> -# implementation may not be compatible with TLS v1.1 message (ClientHell=
o is=0A=
> -# sent prior to negotiating which version will be used)=0A=
> -#CONFIG_TLSV11=3Dy=0A=
> -=0A=
> -# TLS-based EAP methods require at least TLS v1.0. Newer version of TLS =
(v1.2)=0A=
> -# can be enabled to enable use of stronger crypto algorithms. It should =
be=0A=
> -# noted that some existing TLS v1.0 -based implementation may not be com=
patible=0A=
> -# with TLS v1.2 message (ClientHello is sent prior to negotiating which =
version=0A=
> -# will be used)=0A=
> -#CONFIG_TLSV12=3Dy=0A=
> -=0A=
> -# If CONFIG_TLS=3Dinternal is used, additional library and include paths=
 are=0A=
> -# needed for LibTomMath. Alternatively, an integrated, minimal version o=
f=0A=
> -# LibTomMath can be used. See beginning of libtommath.c for details on b=
enefits=0A=
> -# and drawbacks of this option.=0A=
> -#CONFIG_INTERNAL_LIBTOMMATH=3Dy=0A=
> -#ifndef CONFIG_INTERNAL_LIBTOMMATH=0A=
> -#LTM_PATH=3D/usr/src/libtommath-0.39=0A=
> -#CFLAGS +=3D -I$(LTM_PATH)=0A=
> -#LIBS +=3D -L$(LTM_PATH)=0A=
> -#LIBS_p +=3D -L$(LTM_PATH)=0A=
> -#endif=0A=
> -# At the cost of about 4 kB of additional binary size, the internal LibT=
omMath=0A=
> -# can be configured to include faster routines for exptmod, sqr, and div=
 to=0A=
> -# speed up DH and RSA calculation considerably=0A=
> -#CONFIG_INTERNAL_LIBTOMMATH_FAST=3Dy=0A=
> -=0A=
> -# Include NDIS event processing through WMI into wpa_supplicant/wpasvc.=
=0A=
> -# This is only for Windows builds and requires WMI-related header files =
and=0A=
> -# WbemUuid.Lib from Platform SDK even when building with MinGW.=0A=
> -#CONFIG_NDIS_EVENTS_INTEGRATED=3Dy=0A=
> -#PLATFORMSDKLIB=3D"/opt/Program Files/Microsoft Platform SDK/Lib"=0A=
> -=0A=
> -# Add support for old DBus control interface=0A=
> -# (fi.epitest.hostap.WPASupplicant)=0A=
> -#CONFIG_CTRL_IFACE_DBUS=3Dy=0A=
> -=0A=
> -# Add support for new DBus control interface=0A=
> -# (fi.w1.hostap.wpa_supplicant1)=0A=
> -CONFIG_CTRL_IFACE_DBUS_NEW=3Dy=0A=
> -=0A=
> -# Add introspection support for new DBus control interface=0A=
> -#CONFIG_CTRL_IFACE_DBUS_INTRO=3Dy=0A=
> -=0A=
> -# Add support for loading EAP methods dynamically as shared libraries.=
=0A=
> -# When this option is enabled, each EAP method can be either included=0A=
> -# statically (CONFIG_EAP_<method>=3Dy) or dynamically (CONFIG_EAP_<metho=
d>=3Ddyn).=0A=
> -# Dynamic EAP methods are build as shared objects (eap_*.so) and they ne=
ed to=0A=
> -# be loaded in the beginning of the wpa_supplicant configuration file=0A=
> -# (see load_dynamic_eap parameter in the example file) before being used=
 in=0A=
> -# the network blocks.=0A=
> -#=0A=
> -# Note that some shared parts of EAP methods are included in the main pr=
ogram=0A=
> -# and in order to be able to use dynamic EAP methods using these parts, =
the=0A=
> -# main program must have been build with the EAP method enabled (=3Dy or=
 =3Ddyn).=0A=
> -# This means that EAP-TLS/PEAP/TTLS/FAST cannot be added as dynamic libr=
aries=0A=
> -# unless at least one of them was included in the main build to force in=
clusion=0A=
> -# of the shared code. Similarly, at least one of EAP-SIM/AKA must be inc=
luded=0A=
> -# in the main build to be able to load these methods dynamically.=0A=
> -#=0A=
> -# Please also note that using dynamic libraries will increase the total =
binary=0A=
> -# size. Thus, it may not be the best option for targets that have limite=
d=0A=
> -# amount of memory/flash.=0A=
> -#CONFIG_DYNAMIC_EAP_METHODS=3Dy=0A=
> -=0A=
> -# IEEE Std 802.11r-2008 (Fast BSS Transition)=0A=
> -#CONFIG_IEEE80211R=3Dy=0A=
> -=0A=
> -# Add support for writing debug log to a file (/tmp/wpa_supplicant-log-#=
.txt)=0A=
> -#CONFIG_DEBUG_FILE=3Dy=0A=
> -=0A=
> -# Send debug messages to syslog instead of stdout=0A=
> -#CONFIG_DEBUG_SYSLOG=3Dy=0A=
> -# Set syslog facility for debug messages=0A=
> -#CONFIG_DEBUG_SYSLOG_FACILITY=3DLOG_DAEMON=0A=
> -=0A=
> -# Add support for sending all debug messages (regardless of debug verbos=
ity)=0A=
> -# to the Linux kernel tracing facility. This helps debug the entire stac=
k by=0A=
> -# making it easy to record everything happening from the driver up into =
the=0A=
> -# same file, e.g., using trace-cmd.=0A=
> -#CONFIG_DEBUG_LINUX_TRACING=3Dy=0A=
> -=0A=
> -# Enable privilege separation (see README 'Privilege separation' for det=
ails)=0A=
> -#CONFIG_PRIVSEP=3Dy=0A=
> -=0A=
> -# Enable mitigation against certain attacks against TKIP by delaying Mic=
hael=0A=
> -# MIC error reports by a random amount of time between 0 and 60 seconds=
=0A=
> -#CONFIG_DELAYED_MIC_ERROR_REPORT=3Dy=0A=
> -=0A=
> -# Enable tracing code for developer debugging=0A=
> -# This tracks use of memory allocations and other registrations and repo=
rts=0A=
> -# incorrect use with a backtrace of call (or allocation) location.=0A=
> -#CONFIG_WPA_TRACE=3Dy=0A=
> -# For BSD, uncomment these.=0A=
> -#LIBS +=3D -lexecinfo=0A=
> -#LIBS_p +=3D -lexecinfo=0A=
> -#LIBS_c +=3D -lexecinfo=0A=
> -=0A=
> -# Use libbfd to get more details for developer debugging=0A=
> -# This enables use of libbfd to get more detailed symbols for the backtr=
aces=0A=
> -# generated by CONFIG_WPA_TRACE=3Dy.=0A=
> -#CONFIG_WPA_TRACE_BFD=3Dy=0A=
> -# For BSD, uncomment these.=0A=
> -#LIBS +=3D -lbfd -liberty -lz=0A=
> -#LIBS_p +=3D -lbfd -liberty -lz=0A=
> -#LIBS_c +=3D -lbfd -liberty -lz=0A=
> -=0A=
> -CONFIG_TLS =3D gnutls=0A=
> -CONFIG_CTRL_IFACE_DBUS=3Dy=0A=
> -CONFIG_CTRL_IFACE_DBUS_NEW=3Dy=0A=
> -=0A=
> -# wpa_supplicant depends on strong random number generation being availa=
ble=0A=
> -# from the operating system. os_get_random() function is used to fetch r=
andom=0A=
> -# data when needed, e.g., for key generation. On Linux and BSD systems, =
this=0A=
> -# works by reading /dev/urandom. It should be noted that the OS entropy =
pool=0A=
> -# needs to be properly initialized before wpa_supplicant is started. Thi=
s is=0A=
> -# important especially on embedded devices that do not have a hardware r=
andom=0A=
> -# number generator and may by default start up with minimal entropy avai=
lable=0A=
> -# for random number generation.=0A=
> -#=0A=
> -# As a safety net, wpa_supplicant is by default trying to internally col=
lect=0A=
> -# additional entropy for generating random data to mix in with the data =
fetched=0A=
> -# from the OS. This by itself is not considered to be very strong, but i=
t may=0A=
> -# help in cases where the system pool is not initialized properly. Howev=
er, it=0A=
> -# is very strongly recommended that the system pool is initialized with =
enough=0A=
> -# entropy either by using hardware assisted random number generator or b=
y=0A=
> -# storing state over device reboots.=0A=
> -#=0A=
> -# wpa_supplicant can be configured to maintain its own entropy store ove=
r=0A=
> -# restarts to enhance random number generation. This is not perfect, but=
 it is=0A=
> -# much more secure than using the same sequence of random numbers after =
every=0A=
> -# reboot. This can be enabled with -e<entropy file> command line option.=
 The=0A=
> -# specified file needs to be readable and writable by wpa_supplicant.=0A=
> -#=0A=
> -# If the os_get_random() is known to provide strong random data (e.g., o=
n=0A=
> -# Linux/BSD, the board in question is known to have reliable source of r=
andom=0A=
> -# data from /dev/urandom), the internal wpa_supplicant random pool can b=
e=0A=
> -# disabled. This will save some in binary size and CPU use. However, thi=
s=0A=
> -# should only be considered for builds that are known to be used on devi=
ces=0A=
> -# that meet the requirements described above.=0A=
> -#CONFIG_NO_RANDOM_POOL=3Dy=0A=
> -=0A=
> -# IEEE 802.11n (High Throughput) support (mainly for AP mode)=0A=
> -#CONFIG_IEEE80211N=3Dy=0A=
> -=0A=
> -# IEEE 802.11ac (Very High Throughput) support (mainly for AP mode)=0A=
> -# (depends on CONFIG_IEEE80211N)=0A=
> -#CONFIG_IEEE80211AC=3Dy=0A=
> -=0A=
> -# Wireless Network Management (IEEE Std 802.11v-2011)=0A=
> -# Note: This is experimental and not complete implementation.=0A=
> -#CONFIG_WNM=3Dy=0A=
> -=0A=
> -# Interworking (IEEE 802.11u)=0A=
> -# This can be used to enable functionality to improve interworking with=
=0A=
> -# external networks (GAS/ANQP to learn more about the networks and netwo=
rk=0A=
> -# selection based on available credentials).=0A=
> -#CONFIG_INTERWORKING=3Dy=0A=
> -=0A=
> -# Hotspot 2.0=0A=
> -#CONFIG_HS20=3Dy=0A=
> -=0A=
> -# Disable roaming in wpa_supplicant=0A=
> -#CONFIG_NO_ROAMING=3Dy=0A=
> -=0A=
> -# AP mode operations with wpa_supplicant=0A=
> -# This can be used for controlling AP mode operations with wpa_supplican=
t. It=0A=
> -# should be noted that this is mainly aimed at simple cases like=0A=
> -# WPA2-Personal while more complex configurations like WPA2-Enterprise w=
ith an=0A=
> -# external RADIUS server can be supported with hostapd.=0A=
> -CONFIG_AP=3Dy=0A=
> -=0A=
> -CONFIG_BGSCAN_SIMPLE=3Dy=0A=
> -=0A=
> -# P2P (Wi-Fi Direct)=0A=
> -# This can be used to enable P2P support in wpa_supplicant. See README-P=
2P for=0A=
> -# more information on P2P operations.=0A=
> -#CONFIG_P2P=3Dy=0A=
> -=0A=
> -# Enable TDLS support=0A=
> -#CONFIG_TDLS=3Dy=0A=
> -=0A=
> -# Wi-Fi Direct=0A=
> -# This can be used to enable Wi-Fi Direct extensions for P2P using an ex=
ternal=0A=
> -# program to control the additional information exchanges in the message=
s.=0A=
> -#CONFIG_WIFI_DISPLAY=3Dy=0A=
> -=0A=
> -# Autoscan=0A=
> -# This can be used to enable automatic scan support in wpa_supplicant.=
=0A=
> -# See wpa_supplicant.conf for more information on autoscan usage.=0A=
> -#=0A=
> -# Enabling directly a module will enable autoscan support.=0A=
> -# For exponential module:=0A=
> -CONFIG_AUTOSCAN_EXPONENTIAL=3Dy=0A=
> -# For periodic module:=0A=
> -#CONFIG_AUTOSCAN_PERIODIC=3Dy=0A=
> -=0A=
> -# Password (and passphrase, etc.) backend for external storage=0A=
> -# These optional mechanisms can be used to add support for storing passw=
ords=0A=
> -# and other secrets in external (to wpa_supplicant) location. This allow=
s, for=0A=
> -# example, operating system specific key storage to be used=0A=
> -#=0A=
> -# External password backend for testing purposes (developer use)=0A=
> -#CONFIG_EXT_PASSWORD_TEST=3Dy=0A=
> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defc=
onfig-hostapd b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/def=
config-hostapd=0A=
> new file mode 100644=0A=
> index 0000000..f04e398=0A=
> --- /dev/null=0A=
> +++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig-h=
ostapd=0A=
> @@ -0,0 +1,552 @@=0A=
> +# Example wpa_supplicant build time configuration=0A=
> +#=0A=
> +# This file lists the configuration options that are used when building =
the=0A=
> +# hostapd binary. All lines starting with # are ignored. Configuration o=
ption=0A=
> +# lines must be commented out complete, if they are not to be included, =
i.e.,=0A=
> +# just setting VARIABLE=3Dn is not disabling that variable.=0A=
> +#=0A=
> +# This file is included in Makefile, so variables like CFLAGS and LIBS c=
an also=0A=
> +# be modified from here. In most cases, these lines should use +=3D in o=
rder not=0A=
> +# to override previous values of the variables.=0A=
> +=0A=
> +=0A=
> +# Uncomment following two lines and fix the paths if you have installed =
OpenSSL=0A=
> +# or GnuTLS in non-default location=0A=
> +#CFLAGS +=3D -I/usr/local/openssl/include=0A=
> +#LIBS +=3D -L/usr/local/openssl/lib=0A=
> +=0A=
> +# Some Red Hat versions seem to include kerberos header files from OpenS=
SL, but=0A=
> +# the kerberos files are not in the default include path. Following line=
 can be=0A=
> +# used to fix build issues on such systems (krb5.h not found).=0A=
> +#CFLAGS +=3D -I/usr/include/kerberos=0A=
> +=0A=
> +# Example configuration for various cross-compilation platforms=0A=
> +=0A=
> +#### sveasoft (e.g., for Linksys WRT54G) ###############################=
#######=0A=
> +#CC=3Dmipsel-uclibc-gcc=0A=
> +#CC=3D/opt/brcm/hndtools-mipsel-uclibc/bin/mipsel-uclibc-gcc=0A=
> +#CFLAGS +=3D -Os=0A=
> +#CPPFLAGS +=3D -I../src/include -I../../src/router/openssl/include=0A=
> +#LIBS +=3D -L/opt/brcm/hndtools-mipsel-uclibc-0.9.19/lib -lssl=0A=
> +########################################################################=
#######=0A=
> +=0A=
> +#### openwrt (e.g., for Linksys WRT54G) ################################=
#######=0A=
> +#CC=3Dmipsel-uclibc-gcc=0A=
> +#CC=3D/opt/brcm/hndtools-mipsel-uclibc/bin/mipsel-uclibc-gcc=0A=
> +#CFLAGS +=3D -Os=0A=
> +#CPPFLAGS=3D-I../src/include -I../openssl-0.9.7d/include \=0A=
> +#    -I../WRT54GS/release/src/include=0A=
> +#LIBS =3D -lssl=0A=
> +########################################################################=
#######=0A=
> +=0A=
> +=0A=
> +# Driver interface for Host AP driver=0A=
> +CONFIG_DRIVER_HOSTAP=3Dy=0A=
> +=0A=
> +# Driver interface for Agere driver=0A=
> +#CONFIG_DRIVER_HERMES=3Dy=0A=
> +# Change include directories to match with the local setup=0A=
> +#CFLAGS +=3D -I../../hcf -I../../include -I../../include/hcf=0A=
> +#CFLAGS +=3D -I../../include/wireless=0A=
> +=0A=
> +# Driver interface for madwifi driver=0A=
> +# Deprecated; use CONFIG_DRIVER_WEXT=3Dy instead.=0A=
> +#CONFIG_DRIVER_MADWIFI=3Dy=0A=
> +# Set include directory to the madwifi source tree=0A=
> +#CFLAGS +=3D -I../../madwifi=0A=
> +=0A=
> +# Driver interface for ndiswrapper=0A=
> +# Deprecated; use CONFIG_DRIVER_WEXT=3Dy instead.=0A=
> +#CONFIG_DRIVER_NDISWRAPPER=3Dy=0A=
> +=0A=
> +# Driver interface for Atmel driver=0A=
> +# CONFIG_DRIVER_ATMEL=3Dy=0A=
> +=0A=
> +# Driver interface for old Broadcom driver=0A=
> +# Please note that the newer Broadcom driver ("hybrid Linux driver") sup=
ports=0A=
> +# Linux wireless extensions and does not need (or even work) with the ol=
d=0A=
> +# driver wrapper. Use CONFIG_DRIVER_WEXT=3Dy with that driver.=0A=
> +#CONFIG_DRIVER_BROADCOM=3Dy=0A=
> +# Example path for wlioctl.h; change to match your configuration=0A=
> +#CFLAGS +=3D -I/opt/WRT54GS/release/src/include=0A=
> +=0A=
> +# Driver interface for Intel ipw2100/2200 driver=0A=
> +# Deprecated; use CONFIG_DRIVER_WEXT=3Dy instead.=0A=
> +#CONFIG_DRIVER_IPW=3Dy=0A=
> +=0A=
> +# Driver interface for Ralink driver=0A=
> +#CONFIG_DRIVER_RALINK=3Dy=0A=
> +=0A=
> +# Driver interface for generic Linux wireless extensions=0A=
> +# Note: WEXT is deprecated in the current Linux kernel version and no ne=
w=0A=
> +# functionality is added to it. nl80211-based interface is the new=0A=
> +# replacement for WEXT and its use allows wpa_supplicant to properly con=
trol=0A=
> +# the driver to improve existing functionality like roaming and to suppo=
rt new=0A=
> +# functionality.=0A=
> +CONFIG_DRIVER_WEXT=3Dy=0A=
> +=0A=
> +# Driver interface for Linux drivers using the nl80211 kernel interface=
=0A=
> +CONFIG_DRIVER_NL80211=3Dy=0A=
> +=0A=
> +# driver_nl80211.c requires libnl. If you are compiling it yourself=0A=
> +# you may need to point hostapd to your version of libnl.=0A=
> +#=0A=
> +#CFLAGS +=3D -I$<path to libnl include files>=0A=
> +#LIBS +=3D -L$<path to libnl library files>=0A=
> +=0A=
> +# Use libnl v2.0 (or 3.0) libraries.=0A=
> +#CONFIG_LIBNL20=3Dy=0A=
> +=0A=
> +# Use libnl 3.2 libraries (if this is selected, CONFIG_LIBNL20 is ignore=
d)=0A=
> +CONFIG_LIBNL32=3Dy=0A=
> +=0A=
> +=0A=
> +# Driver interface for FreeBSD net80211 layer (e.g., Atheros driver)=0A=
> +#CONFIG_DRIVER_BSD=3Dy=0A=
> +#CFLAGS +=3D -I/usr/local/include=0A=
> +#LIBS +=3D -L/usr/local/lib=0A=
> +#LIBS_p +=3D -L/usr/local/lib=0A=
> +#LIBS_c +=3D -L/usr/local/lib=0A=
> +=0A=
> +# Driver interface for Windows NDIS=0A=
> +#CONFIG_DRIVER_NDIS=3Dy=0A=
> +#CFLAGS +=3D -I/usr/include/w32api/ddk=0A=
> +#LIBS +=3D -L/usr/local/lib=0A=
> +# For native build using mingw=0A=
> +#CONFIG_NATIVE_WINDOWS=3Dy=0A=
> +# Additional directories for cross-compilation on Linux host for mingw t=
arget=0A=
> +#CFLAGS +=3D -I/opt/mingw/mingw32/include/ddk=0A=
> +#LIBS +=3D -L/opt/mingw/mingw32/lib=0A=
> +#CC=3Dmingw32-gcc=0A=
> +# By default, driver_ndis uses WinPcap for low-level operations. This ca=
n be=0A=
> +# replaced with the following option which replaces WinPcap calls with N=
DISUIO.=0A=
> +# However, this requires that WZC is disabled (net stop wzcsvc) before s=
tarting=0A=
> +# wpa_supplicant.=0A=
> +# CONFIG_USE_NDISUIO=3Dy=0A=
> +=0A=
> +# Driver interface for development testing=0A=
> +#CONFIG_DRIVER_TEST=3Dy=0A=
> +=0A=
> +# Driver interface for wired Ethernet drivers=0A=
> +CONFIG_DRIVER_WIRED=3Dy=0A=
> +=0A=
> +# Driver interface for the Broadcom RoboSwitch family=0A=
> +#CONFIG_DRIVER_ROBOSWITCH=3Dy=0A=
> +=0A=
> +# Driver interface for no driver (e.g., WPS ER only)=0A=
> +#CONFIG_DRIVER_NONE=3Dy=0A=
> +=0A=
> +# Enable IEEE 802.1X Supplicant (automatically included if any EAP metho=
d is=0A=
> +# included)=0A=
> +CONFIG_IEEE8021X_EAPOL=3Dy=0A=
> +=0A=
> +# EAP-MD5=0A=
> +CONFIG_EAP_MD5=3Dy=0A=
> +=0A=
> +# EAP-MSCHAPv2=0A=
> +CONFIG_EAP_MSCHAPV2=3Dy=0A=
> +=0A=
> +# EAP-TLS=0A=
> +CONFIG_EAP_TLS=3Dy=0A=
> +=0A=
> +# EAL-PEAP=0A=
> +CONFIG_EAP_PEAP=3Dy=0A=
> +=0A=
> +# EAP-TTLS=0A=
> +CONFIG_EAP_TTLS=3Dy=0A=
> +=0A=
> +# EAP-FAST=0A=
> +# Note: If OpenSSL is used as the TLS library, OpenSSL 1.0 or newer is n=
eeded=0A=
> +# for EAP-FAST support. Older OpenSSL releases would need to be patched,=
 e.g.,=0A=
> +# with openssl-0.9.8x-tls-extensions.patch, to add the needed functions.=
=0A=
> +#CONFIG_EAP_FAST=3Dy=0A=
> +=0A=
> +# EAP-GTC=0A=
> +CONFIG_EAP_GTC=3Dy=0A=
> +=0A=
> +# EAP-OTP=0A=
> +CONFIG_EAP_OTP=3Dy=0A=
> +=0A=
> +# EAP-SIM (enable CONFIG_PCSC, if EAP-SIM is used)=0A=
> +#CONFIG_EAP_SIM=3Dy=0A=
> +=0A=
> +# EAP-PSK (experimental; this is _not_ needed for WPA-PSK)=0A=
> +#CONFIG_EAP_PSK=3Dy=0A=
> +=0A=
> +# EAP-pwd (secure authentication using only a password)=0A=
> +#CONFIG_EAP_PWD=3Dy=0A=
> +=0A=
> +# EAP-PAX=0A=
> +#CONFIG_EAP_PAX=3Dy=0A=
> +=0A=
> +# LEAP=0A=
> +CONFIG_EAP_LEAP=3Dy=0A=
> +=0A=
> +# EAP-AKA (enable CONFIG_PCSC, if EAP-AKA is used)=0A=
> +#CONFIG_EAP_AKA=3Dy=0A=
> +=0A=
> +# EAP-AKA' (enable CONFIG_PCSC, if EAP-AKA' is used).=0A=
> +# This requires CONFIG_EAP_AKA to be enabled, too.=0A=
> +#CONFIG_EAP_AKA_PRIME=3Dy=0A=
> +=0A=
> +# Enable USIM simulator (Milenage) for EAP-AKA=0A=
> +#CONFIG_USIM_SIMULATOR=3Dy=0A=
> +=0A=
> +# EAP-SAKE=0A=
> +#CONFIG_EAP_SAKE=3Dy=0A=
> +=0A=
> +# EAP-GPSK=0A=
> +#CONFIG_EAP_GPSK=3Dy=0A=
> +# Include support for optional SHA256 cipher suite in EAP-GPSK=0A=
> +#CONFIG_EAP_GPSK_SHA256=3Dy=0A=
> +=0A=
> +# EAP-TNC and related Trusted Network Connect support (experimental)=0A=
> +#CONFIG_EAP_TNC=3Dy=0A=
> +=0A=
> +# Wi-Fi Protected Setup (WPS)=0A=
> +CONFIG_WPS=3Dy=0A=
> +# Enable WSC 2.0 support=0A=
> +#CONFIG_WPS2=3Dy=0A=
> +# Enable WPS external registrar functionality=0A=
> +#CONFIG_WPS_ER=3Dy=0A=
> +# Disable credentials for an open network by default when acting as a WP=
S=0A=
> +# registrar.=0A=
> +#CONFIG_WPS_REG_DISABLE_OPEN=3Dy=0A=
> +# Enable WPS support with NFC config method=0A=
> +#CONFIG_WPS_NFC=3Dy=0A=
> +=0A=
> +# EAP-IKEv2=0A=
> +#CONFIG_EAP_IKEV2=3Dy=0A=
> +=0A=
> +# EAP-EKE=0A=
> +#CONFIG_EAP_EKE=3Dy=0A=
> +=0A=
> +# PKCS#12 (PFX) support (used to read private key and certificate file f=
rom=0A=
> +# a file that usually has extension .p12 or .pfx)=0A=
> +CONFIG_PKCS12=3Dy=0A=
> +=0A=
> +# Smartcard support (i.e., private key on a smartcard), e.g., with opens=
sl=0A=
> +# engine.=0A=
> +CONFIG_SMARTCARD=3Dy=0A=
> +=0A=
> +# PC/SC interface for smartcards (USIM, GSM SIM)=0A=
> +# Enable this if EAP-SIM or EAP-AKA is included=0A=
> +#CONFIG_PCSC=3Dy=0A=
> +=0A=
> +# Support HT overrides (disable HT/HT40, mask MCS rates, etc.)=0A=
> +#CONFIG_HT_OVERRIDES=3Dy=0A=
> +=0A=
> +# Support VHT overrides (disable VHT, mask MCS rates, etc.)=0A=
> +#CONFIG_VHT_OVERRIDES=3Dy=0A=
> +=0A=
> +# Development testing=0A=
> +#CONFIG_EAPOL_TEST=3Dy=0A=
> +=0A=
> +# Select control interface backend for external programs, e.g, wpa_cli:=
=0A=
> +# unix =3D UNIX domain sockets (default for Linux/*BSD)=0A=
> +# udp =3D UDP sockets using localhost (127.0.0.1)=0A=
> +# named_pipe =3D Windows Named Pipe (default for Windows)=0A=
> +# udp-remote =3D UDP sockets with remote access (only for tests systems/=
purpose)=0A=
> +# y =3D use default (backwards compatibility)=0A=
> +# If this option is commented out, control interface is not included in =
the=0A=
> +# build.=0A=
> +CONFIG_CTRL_IFACE=3Dy=0A=
> +=0A=
> +# Include support for GNU Readline and History Libraries in wpa_cli.=0A=
> +# When building a wpa_cli binary for distribution, please note that thes=
e=0A=
> +# libraries are licensed under GPL and as such, BSD license may not appl=
y for=0A=
> +# the resulting binary.=0A=
> +#CONFIG_READLINE=3Dy=0A=
> +=0A=
> +# Include internal line edit mode in wpa_cli. This can be used as a repl=
acement=0A=
> +# for GNU Readline to provide limited command line editing and history s=
upport.=0A=
> +#CONFIG_WPA_CLI_EDIT=3Dy=0A=
> +=0A=
> +# Remove debugging code that is printing out debug message to stdout.=0A=
> +# This can be used to reduce the size of the wpa_supplicant considerably=
=0A=
> +# if debugging code is not needed. The size reduction can be around 35%=
=0A=
> +# (e.g., 90 kB).=0A=
> +#CONFIG_NO_STDOUT_DEBUG=3Dy=0A=
> +=0A=
> +# Remove WPA support, e.g., for wired-only IEEE 802.1X supplicant, to sa=
ve=0A=
> +# 35-50 kB in code size.=0A=
> +#CONFIG_NO_WPA=3Dy=0A=
> +=0A=
> +# Remove IEEE 802.11i/WPA-Personal ASCII passphrase support=0A=
> +# This option can be used to reduce code size by removing support for=0A=
> +# converting ASCII passphrases into PSK. If this functionality is remove=
d, the=0A=
> +# PSK can only be configured as the 64-octet hexstring (e.g., from=0A=
> +# wpa_passphrase). This saves about 0.5 kB in code size.=0A=
> +#CONFIG_NO_WPA_PASSPHRASE=3Dy=0A=
> +=0A=
> +# Disable scan result processing (ap_mode=3D1) to save code size by abou=
t 1 kB.=0A=
> +# This can be used if ap_scan=3D1 mode is never enabled.=0A=
> +#CONFIG_NO_SCAN_PROCESSING=3Dy=0A=
> +=0A=
> +# Select configuration backend:=0A=
> +# file =3D text file (e.g., wpa_supplicant.conf; note: the configuration=
 file=0A=
> +#    path is given on command line, not here; this option is just used t=
o=0A=
> +#    select the backend that allows configuration files to be used)=0A=
> +# winreg =3D Windows registry (see win_example.reg for an example)=0A=
> +CONFIG_BACKEND=3Dfile=0A=
> +=0A=
> +# Remove configuration write functionality (i.e., to allow the configura=
tion=0A=
> +# file to be updated based on runtime configuration changes). The runtim=
e=0A=
> +# configuration can still be changed, the changes are just not going to =
be=0A=
> +# persistent over restarts. This option can be used to reduce code size =
by=0A=
> +# about 3.5 kB.=0A=
> +#CONFIG_NO_CONFIG_WRITE=3Dy=0A=
> +=0A=
> +# Remove support for configuration blobs to reduce code size by about 1.=
5 kB.=0A=
> +#CONFIG_NO_CONFIG_BLOBS=3Dy=0A=
> +=0A=
> +# Select program entry point implementation:=0A=
> +# main =3D UNIX/POSIX like main() function (default)=0A=
> +# main_winsvc =3D Windows service (read parameters from registry)=0A=
> +# main_none =3D Very basic example (development use only)=0A=
> +#CONFIG_MAIN=3Dmain=0A=
> +=0A=
> +# Select wrapper for operatins system and C library specific functions=
=0A=
> +# unix =3D UNIX/POSIX like systems (default)=0A=
> +# win32 =3D Windows systems=0A=
> +# none =3D Empty template=0A=
> +#CONFIG_OS=3Dunix=0A=
> +=0A=
> +# Select event loop implementation=0A=
> +# eloop =3D select() loop (default)=0A=
> +# eloop_win =3D Windows events and WaitForMultipleObject() loop=0A=
> +#CONFIG_ELOOP=3Deloop=0A=
> +=0A=
> +# Should we use poll instead of select? Select is used by default.=0A=
> +#CONFIG_ELOOP_POLL=3Dy=0A=
> +=0A=
> +# Select layer 2 packet implementation=0A=
> +# linux =3D Linux packet socket (default)=0A=
> +# pcap =3D libpcap/libdnet/WinPcap=0A=
> +# freebsd =3D FreeBSD libpcap=0A=
> +# winpcap =3D WinPcap with receive thread=0A=
> +# ndis =3D Windows NDISUIO (note: requires CONFIG_USE_NDISUIO=3Dy)=0A=
> +# none =3D Empty template=0A=
> +#CONFIG_L2_PACKET=3Dlinux=0A=
> +=0A=
> +# PeerKey handshake for Station to Station Link (IEEE 802.11e DLS)=0A=
> +CONFIG_PEERKEY=3Dy=0A=
> +=0A=
> +# IEEE 802.11w (management frame protection), also known as PMF=0A=
> +# Driver support is also needed for IEEE 802.11w.=0A=
> +#CONFIG_IEEE80211W=3Dy=0A=
> +=0A=
> +# Select TLS implementation=0A=
> +# openssl =3D OpenSSL (default)=0A=
> +# gnutls =3D GnuTLS=0A=
> +# internal =3D Internal TLSv1 implementation (experimental)=0A=
> +# none =3D Empty template=0A=
> +#CONFIG_TLS=3Dopenssl=0A=
> +=0A=
> +# TLS-based EAP methods require at least TLS v1.0. Newer version of TLS =
(v1.1)=0A=
> +# can be enabled to get a stronger construction of messages when block c=
iphers=0A=
> +# are used. It should be noted that some existing TLS v1.0 -based=0A=
> +# implementation may not be compatible with TLS v1.1 message (ClientHell=
o is=0A=
> +# sent prior to negotiating which version will be used)=0A=
> +#CONFIG_TLSV11=3Dy=0A=
> +=0A=
> +# TLS-based EAP methods require at least TLS v1.0. Newer version of TLS =
(v1.2)=0A=
> +# can be enabled to enable use of stronger crypto algorithms. It should =
be=0A=
> +# noted that some existing TLS v1.0 -based implementation may not be com=
patible=0A=
> +# with TLS v1.2 message (ClientHello is sent prior to negotiating which =
version=0A=
> +# will be used)=0A=
> +#CONFIG_TLSV12=3Dy=0A=
> +=0A=
> +# If CONFIG_TLS=3Dinternal is used, additional library and include paths=
 are=0A=
> +# needed for LibTomMath. Alternatively, an integrated, minimal version o=
f=0A=
> +# LibTomMath can be used. See beginning of libtommath.c for details on b=
enefits=0A=
> +# and drawbacks of this option.=0A=
> +#CONFIG_INTERNAL_LIBTOMMATH=3Dy=0A=
> +#ifndef CONFIG_INTERNAL_LIBTOMMATH=0A=
> +#LTM_PATH=3D/usr/src/libtommath-0.39=0A=
> +#CFLAGS +=3D -I$(LTM_PATH)=0A=
> +#LIBS +=3D -L$(LTM_PATH)=0A=
> +#LIBS_p +=3D -L$(LTM_PATH)=0A=
> +#endif=0A=
> +# At the cost of about 4 kB of additional binary size, the internal LibT=
omMath=0A=
> +# can be configured to include faster routines for exptmod, sqr, and div=
 to=0A=
> +# speed up DH and RSA calculation considerably=0A=
> +#CONFIG_INTERNAL_LIBTOMMATH_FAST=3Dy=0A=
> +=0A=
> +# Include NDIS event processing through WMI into wpa_supplicant/wpasvc.=
=0A=
> +# This is only for Windows builds and requires WMI-related header files =
and=0A=
> +# WbemUuid.Lib from Platform SDK even when building with MinGW.=0A=
> +#CONFIG_NDIS_EVENTS_INTEGRATED=3Dy=0A=
> +#PLATFORMSDKLIB=3D"/opt/Program Files/Microsoft Platform SDK/Lib"=0A=
> +=0A=
> +# Add support for old DBus control interface=0A=
> +# (fi.epitest.hostap.WPASupplicant)=0A=
> +#CONFIG_CTRL_IFACE_DBUS=3Dy=0A=
> +=0A=
> +# Add support for new DBus control interface=0A=
> +# (fi.w1.hostap.wpa_supplicant1)=0A=
> +CONFIG_CTRL_IFACE_DBUS_NEW=3Dy=0A=
> +=0A=
> +# Add introspection support for new DBus control interface=0A=
> +#CONFIG_CTRL_IFACE_DBUS_INTRO=3Dy=0A=
> +=0A=
> +# Add support for loading EAP methods dynamically as shared libraries.=
=0A=
> +# When this option is enabled, each EAP method can be either included=0A=
> +# statically (CONFIG_EAP_<method>=3Dy) or dynamically (CONFIG_EAP_<metho=
d>=3Ddyn).=0A=
> +# Dynamic EAP methods are build as shared objects (eap_*.so) and they ne=
ed to=0A=
> +# be loaded in the beginning of the wpa_supplicant configuration file=0A=
> +# (see load_dynamic_eap parameter in the example file) before being used=
 in=0A=
> +# the network blocks.=0A=
> +#=0A=
> +# Note that some shared parts of EAP methods are included in the main pr=
ogram=0A=
> +# and in order to be able to use dynamic EAP methods using these parts, =
the=0A=
> +# main program must have been build with the EAP method enabled (=3Dy or=
 =3Ddyn).=0A=
> +# This means that EAP-TLS/PEAP/TTLS/FAST cannot be added as dynamic libr=
aries=0A=
> +# unless at least one of them was included in the main build to force in=
clusion=0A=
> +# of the shared code. Similarly, at least one of EAP-SIM/AKA must be inc=
luded=0A=
> +# in the main build to be able to load these methods dynamically.=0A=
> +#=0A=
> +# Please also note that using dynamic libraries will increase the total =
binary=0A=
> +# size. Thus, it may not be the best option for targets that have limite=
d=0A=
> +# amount of memory/flash.=0A=
> +#CONFIG_DYNAMIC_EAP_METHODS=3Dy=0A=
> +=0A=
> +# IEEE Std 802.11r-2008 (Fast BSS Transition)=0A=
> +#CONFIG_IEEE80211R=3Dy=0A=
> +=0A=
> +# Add support for writing debug log to a file (/tmp/wpa_supplicant-log-#=
.txt)=0A=
> +#CONFIG_DEBUG_FILE=3Dy=0A=
> +=0A=
> +# Send debug messages to syslog instead of stdout=0A=
> +#CONFIG_DEBUG_SYSLOG=3Dy=0A=
> +# Set syslog facility for debug messages=0A=
> +#CONFIG_DEBUG_SYSLOG_FACILITY=3DLOG_DAEMON=0A=
> +=0A=
> +# Add support for sending all debug messages (regardless of debug verbos=
ity)=0A=
> +# to the Linux kernel tracing facility. This helps debug the entire stac=
k by=0A=
> +# making it easy to record everything happening from the driver up into =
the=0A=
> +# same file, e.g., using trace-cmd.=0A=
> +#CONFIG_DEBUG_LINUX_TRACING=3Dy=0A=
> +=0A=
> +# Enable privilege separation (see README 'Privilege separation' for det=
ails)=0A=
> +#CONFIG_PRIVSEP=3Dy=0A=
> +=0A=
> +# Enable mitigation against certain attacks against TKIP by delaying Mic=
hael=0A=
> +# MIC error reports by a random amount of time between 0 and 60 seconds=
=0A=
> +#CONFIG_DELAYED_MIC_ERROR_REPORT=3Dy=0A=
> +=0A=
> +# Enable tracing code for developer debugging=0A=
> +# This tracks use of memory allocations and other registrations and repo=
rts=0A=
> +# incorrect use with a backtrace of call (or allocation) location.=0A=
> +#CONFIG_WPA_TRACE=3Dy=0A=
> +# For BSD, uncomment these.=0A=
> +#LIBS +=3D -lexecinfo=0A=
> +#LIBS_p +=3D -lexecinfo=0A=
> +#LIBS_c +=3D -lexecinfo=0A=
> +=0A=
> +# Use libbfd to get more details for developer debugging=0A=
> +# This enables use of libbfd to get more detailed symbols for the backtr=
aces=0A=
> +# generated by CONFIG_WPA_TRACE=3Dy.=0A=
> +#CONFIG_WPA_TRACE_BFD=3Dy=0A=
> +# For BSD, uncomment these.=0A=
> +#LIBS +=3D -lbfd -liberty -lz=0A=
> +#LIBS_p +=3D -lbfd -liberty -lz=0A=
> +#LIBS_c +=3D -lbfd -liberty -lz=0A=
> +=0A=
> +CONFIG_TLS =3D %ssl%=0A=
> +CONFIG_CTRL_IFACE_DBUS=3Dy=0A=
> +CONFIG_CTRL_IFACE_DBUS_NEW=3Dy=0A=
> +=0A=
> +# wpa_supplicant depends on strong random number generation being availa=
ble=0A=
> +# from the operating system. os_get_random() function is used to fetch r=
andom=0A=
> +# data when needed, e.g., for key generation. On Linux and BSD systems, =
this=0A=
> +# works by reading /dev/urandom. It should be noted that the OS entropy =
pool=0A=
> +# needs to be properly initialized before wpa_supplicant is started. Thi=
s is=0A=
> +# important especially on embedded devices that do not have a hardware r=
andom=0A=
> +# number generator and may by default start up with minimal entropy avai=
lable=0A=
> +# for random number generation.=0A=
> +#=0A=
> +# As a safety net, wpa_supplicant is by default trying to internally col=
lect=0A=
> +# additional entropy for generating random data to mix in with the data =
fetched=0A=
> +# from the OS. This by itself is not considered to be very strong, but i=
t may=0A=
> +# help in cases where the system pool is not initialized properly. Howev=
er, it=0A=
> +# is very strongly recommended that the system pool is initialized with =
enough=0A=
> +# entropy either by using hardware assisted random number generator or b=
y=0A=
> +# storing state over device reboots.=0A=
> +#=0A=
> +# wpa_supplicant can be configured to maintain its own entropy store ove=
r=0A=
> +# restarts to enhance random number generation. This is not perfect, but=
 it is=0A=
> +# much more secure than using the same sequence of random numbers after =
every=0A=
> +# reboot. This can be enabled with -e<entropy file> command line option.=
 The=0A=
> +# specified file needs to be readable and writable by wpa_supplicant.=0A=
> +#=0A=
> +# If the os_get_random() is known to provide strong random data (e.g., o=
n=0A=
> +# Linux/BSD, the board in question is known to have reliable source of r=
andom=0A=
> +# data from /dev/urandom), the internal wpa_supplicant random pool can b=
e=0A=
> +# disabled. This will save some in binary size and CPU use. However, thi=
s=0A=
> +# should only be considered for builds that are known to be used on devi=
ces=0A=
> +# that meet the requirements described above.=0A=
> +#CONFIG_NO_RANDOM_POOL=3Dy=0A=
> +=0A=
> +# IEEE 802.11n (High Throughput) support (mainly for AP mode)=0A=
> +#CONFIG_IEEE80211N=3Dy=0A=
> +=0A=
> +# IEEE 802.11ac (Very High Throughput) support (mainly for AP mode)=0A=
> +# (depends on CONFIG_IEEE80211N)=0A=
> +#CONFIG_IEEE80211AC=3Dy=0A=
> +=0A=
> +# Wireless Network Management (IEEE Std 802.11v-2011)=0A=
> +# Note: This is experimental and not complete implementation.=0A=
> +#CONFIG_WNM=3Dy=0A=
> +=0A=
> +# Interworking (IEEE 802.11u)=0A=
> +# This can be used to enable functionality to improve interworking with=
=0A=
> +# external networks (GAS/ANQP to learn more about the networks and netwo=
rk=0A=
> +# selection based on available credentials).=0A=
> +#CONFIG_INTERWORKING=3Dy=0A=
> +=0A=
> +# Hotspot 2.0=0A=
> +#CONFIG_HS20=3Dy=0A=
> +=0A=
> +# Disable roaming in wpa_supplicant=0A=
> +#CONFIG_NO_ROAMING=3Dy=0A=
> +=0A=
> +# AP mode operations with wpa_supplicant=0A=
> +# This can be used for controlling AP mode operations with wpa_supplican=
t. It=0A=
> +# should be noted that this is mainly aimed at simple cases like=0A=
> +# WPA2-Personal while more complex configurations like WPA2-Enterprise w=
ith an=0A=
> +# external RADIUS server can be supported with hostapd.=0A=
> +CONFIG_AP=3Dy=0A=
> +=0A=
> +CONFIG_BGSCAN_SIMPLE=3Dy=0A=
> +=0A=
> +# P2P (Wi-Fi Direct)=0A=
> +# This can be used to enable P2P support in wpa_supplicant. See README-P=
2P for=0A=
> +# more information on P2P operations.=0A=
> +#CONFIG_P2P=3Dy=0A=
> +=0A=
> +# Enable TDLS support=0A=
> +#CONFIG_TDLS=3Dy=0A=
> +=0A=
> +# Wi-Fi Direct=0A=
> +# This can be used to enable Wi-Fi Direct extensions for P2P using an ex=
ternal=0A=
> +# program to control the additional information exchanges in the message=
s.=0A=
> +#CONFIG_WIFI_DISPLAY=3Dy=0A=
> +=0A=
> +# Autoscan=0A=
> +# This can be used to enable automatic scan support in wpa_supplicant.=
=0A=
> +# See wpa_supplicant.conf for more information on autoscan usage.=0A=
> +#=0A=
> +# Enabling directly a module will enable autoscan support.=0A=
> +# For exponential module:=0A=
> +CONFIG_AUTOSCAN_EXPONENTIAL=3Dy=0A=
> +# For periodic module:=0A=
> +#CONFIG_AUTOSCAN_PERIODIC=3Dy=0A=
> +=0A=
> +# Password (and passphrase, etc.) backend for external storage=0A=
> +# These optional mechanisms can be used to add support for storing passw=
ords=0A=
> +# and other secrets in external (to wpa_supplicant) location. This allow=
s, for=0A=
> +# example, operating system specific key storage to be used=0A=
> +#=0A=
> +# External password backend for testing purposes (developer use)=0A=
> +#CONFIG_EXT_PASSWORD_TEST=3Dy=0A=
>=0A=
=0A=
=0A=
--=0A=
_______________________________________________=0A=
Openembedded-core mailing list=0A=
Openembedded-core@lists.openembedded.org=0A=
http://lists.openembedded.org/mailman/listinfo/openembedded-core=0A=

