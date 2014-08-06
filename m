Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id D264E65D5F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Aug 2014 08:23:10 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id n3so9082671wiv.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Aug 2014 01:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=dySwq9TbnUcH9Ab5g7PCVcouTVV0OcGuLYcddZZFqQc=;
	b=glcuDtHomF8/5ikCFn1EPLaFXe1JEmjEot9K3IPx6Kdh6I2qP9UCB6/rpkEsqxVQRx
	dQMYek97TNNtAaqM4t0jANsq9/M9Cw7Un4RSvZE03ohF1sjFqJE0n0SU59T6lbd/zrIZ
	ilMTynloP9t4/1k7fby/twTeFkP9aKrpf3Id70N+nbVBevLjGGDZokWcjZn3uJKii49s
	SMft2wZlUlROIR4x0l54h4TWvyrO8L8NV/XLqZIwyhJLF6ZJH0opRUUdVGl8BIkXTteu
	hLdy/3OcETGVV2IyPB2/zFVm8meN1V5swjFFXYPfUnO1YYrc9kQ5I458Wz+N2t92Aazi
	8Lkg==
X-Received: by 10.180.149.163 with SMTP id ub3mr48065343wib.67.1407313391463; 
	Wed, 06 Aug 2014 01:23:11 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fs17sm745766wjc.6.2014.08.06.01.23.10 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Aug 2014 01:23:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 6 Aug 2014 10:23:40 +0200
To: Yasir Khan <yasir_khan@mentor.com>
Message-ID: <20140806082340.GC14848@jama>
References: <1407267450-64536-1-git-send-email-yasir_khan@mentor.com>
MIME-Version: 1.0
In-Reply-To: <1407267450-64536-1-git-send-email-yasir_khan@mentor.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Wed, 06 Aug 2014 08:23:15 -0000
X-Groupsio-MsgNum: 56036
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iFRdW5/EC4oqxDHL"
Content-Disposition: inline

--iFRdW5/EC4oqxDHL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 06, 2014 at 12:37:30AM +0500, Yasir Khan wrote:
> From: Yasir-Khan <yasir_khan@mentor.com>
>=20
> Select between openssl or gnutls as ssl implementation via
> PACKAGECONFIG instead of explicitly adding both via DEPENDS.
>=20
> Signed-off-by: Yasir-Khan <yasir_khan@mentor.com>
> ---
>  .../wpa-supplicant/wpa-supplicant.inc              |   20 +-
>  .../wpa-supplicant/wpa-supplicant/defconfig-gnutls |  552 --------------=
------
>  .../wpa-supplicant/defconfig-hostapd               |  552 ++++++++++++++=
++++++

Can you please resend with -M so that we can see what was changed in
defconfig?

>  3 files changed, 569 insertions(+), 555 deletions(-)
>  delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt/defconfig-gnutls
>  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt/defconfig-hostapd
>=20
> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc =
b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
> index d9c6532..a7e1a16 100644
> --- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
> +++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
> @@ -6,16 +6,20 @@ LICENSE =3D "BSD"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dab87f20cd7e8c0d0a6539b34d3791=
d0e \
>                      file://README;beginline=3D1;endline=3D56;md5=3Da0725=
0b28e857455336bb59fc31cb845 \
>                      file://wpa_supplicant/wpa_supplicant.c;beginline=3D1=
;endline=3D12;md5=3De8e021e30f3a6ab7c341b66b86626a5a"
> -DEPENDS =3D "gnutls dbus libnl openssl libgcrypt"
> +DEPENDS =3D "dbus libnl libgcrypt"
>  RRECOMMENDS_${PN} =3D "wpa-supplicant-passphrase wpa-supplicant-cli"
> =20
> +PACKAGECONFIG ??=3D "gnutls"
> +PACKAGECONFIG[gnutls] =3D ",,gnutls"
> +PACKAGECONFIG[ssl] =3D ",,openssl"
> +
>  inherit systemd
> =20
>  SYSTEMD_SERVICE_${PN} =3D "wpa_supplicant.service wpa_supplicant-nl80211=
@.service wpa_supplicant-wired@.service"
>  SYSTEMD_AUTO_ENABLE =3D "disable"
> =20
>  SRC_URI =3D "http://hostap.epitest.fi/releases/wpa_supplicant-${PV}.tar.=
gz \
> -           file://defconfig-gnutls \
> +           file://defconfig-hostapd \
>             file://wpa-supplicant.sh \
>             file://wpa_supplicant.conf \
>             file://wpa_supplicant.conf-sane \
> @@ -34,8 +38,18 @@ FILES_${PN} +=3D "${datadir}/dbus-1/system-services/*"
>  CONFFILES_${PN} +=3D "${sysconfdir}/wpa_supplicant.conf"
> =20
>  do_configure () {
> -	install -m 0755 ${WORKDIR}/defconfig-gnutls wpa_supplicant/.config
> +	install -m 0755 ${WORKDIR}/defconfig-hostapd wpa_supplicant/.config
>  	echo "CFLAGS +=3D\"-I${STAGING_INCDIR}/libnl3\"" >> wpa_supplicant/.con=
fig
> +=09
> +	if echo "${PACKAGECONFIG}" | grep -qw "ssl"; then
> +        	ssl=3Dopenssl
> +	elif echo "${PACKAGECONFIG}" | grep -qw "gnutls"; then
> +        	ssl=3Dgnutls
> +	fi
> +	if [ -n "$ssl" ]; then
> +        	sed -i "s/%ssl%/$ssl/" wpa_supplicant/.config
> +	fi
> +
>  }
> =20
>  export EXTRA_CFLAGS =3D "${CFLAGS}"
> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defc=
onfig-gnutls b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defc=
onfig-gnutls
> deleted file mode 100644
> index 92ef823..0000000
> --- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig-g=
nutls
> +++ /dev/null
> @@ -1,552 +0,0 @@
> -# Example wpa_supplicant build time configuration
> -#
> -# This file lists the configuration options that are used when building =
the
> -# hostapd binary. All lines starting with # are ignored. Configuration o=
ption
> -# lines must be commented out complete, if they are not to be included, =
i.e.,
> -# just setting VARIABLE=3Dn is not disabling that variable.
> -#
> -# This file is included in Makefile, so variables like CFLAGS and LIBS c=
an also
> -# be modified from here. In most cases, these lines should use +=3D in o=
rder not
> -# to override previous values of the variables.
> -
> -
> -# Uncomment following two lines and fix the paths if you have installed =
OpenSSL
> -# or GnuTLS in non-default location
> -#CFLAGS +=3D -I/usr/local/openssl/include
> -#LIBS +=3D -L/usr/local/openssl/lib
> -
> -# Some Red Hat versions seem to include kerberos header files from OpenS=
SL, but
> -# the kerberos files are not in the default include path. Following line=
 can be
> -# used to fix build issues on such systems (krb5.h not found).
> -#CFLAGS +=3D -I/usr/include/kerberos
> -
> -# Example configuration for various cross-compilation platforms
> -
> -#### sveasoft (e.g., for Linksys WRT54G) ###############################=
#######
> -#CC=3Dmipsel-uclibc-gcc
> -#CC=3D/opt/brcm/hndtools-mipsel-uclibc/bin/mipsel-uclibc-gcc
> -#CFLAGS +=3D -Os
> -#CPPFLAGS +=3D -I../src/include -I../../src/router/openssl/include
> -#LIBS +=3D -L/opt/brcm/hndtools-mipsel-uclibc-0.9.19/lib -lssl
> -########################################################################=
#######
> -
> -#### openwrt (e.g., for Linksys WRT54G) ################################=
#######
> -#CC=3Dmipsel-uclibc-gcc
> -#CC=3D/opt/brcm/hndtools-mipsel-uclibc/bin/mipsel-uclibc-gcc
> -#CFLAGS +=3D -Os
> -#CPPFLAGS=3D-I../src/include -I../openssl-0.9.7d/include \
> -#	-I../WRT54GS/release/src/include
> -#LIBS =3D -lssl
> -########################################################################=
#######
> -
> -
> -# Driver interface for Host AP driver
> -CONFIG_DRIVER_HOSTAP=3Dy
> -
> -# Driver interface for Agere driver
> -#CONFIG_DRIVER_HERMES=3Dy
> -# Change include directories to match with the local setup
> -#CFLAGS +=3D -I../../hcf -I../../include -I../../include/hcf
> -#CFLAGS +=3D -I../../include/wireless
> -
> -# Driver interface for madwifi driver
> -# Deprecated; use CONFIG_DRIVER_WEXT=3Dy instead.
> -#CONFIG_DRIVER_MADWIFI=3Dy
> -# Set include directory to the madwifi source tree
> -#CFLAGS +=3D -I../../madwifi
> -
> -# Driver interface for ndiswrapper
> -# Deprecated; use CONFIG_DRIVER_WEXT=3Dy instead.
> -#CONFIG_DRIVER_NDISWRAPPER=3Dy
> -
> -# Driver interface for Atmel driver
> -# CONFIG_DRIVER_ATMEL=3Dy
> -
> -# Driver interface for old Broadcom driver
> -# Please note that the newer Broadcom driver ("hybrid Linux driver") sup=
ports
> -# Linux wireless extensions and does not need (or even work) with the old
> -# driver wrapper. Use CONFIG_DRIVER_WEXT=3Dy with that driver.
> -#CONFIG_DRIVER_BROADCOM=3Dy
> -# Example path for wlioctl.h; change to match your configuration
> -#CFLAGS +=3D -I/opt/WRT54GS/release/src/include
> -
> -# Driver interface for Intel ipw2100/2200 driver
> -# Deprecated; use CONFIG_DRIVER_WEXT=3Dy instead.
> -#CONFIG_DRIVER_IPW=3Dy
> -
> -# Driver interface for Ralink driver
> -#CONFIG_DRIVER_RALINK=3Dy
> -
> -# Driver interface for generic Linux wireless extensions
> -# Note: WEXT is deprecated in the current Linux kernel version and no new
> -# functionality is added to it. nl80211-based interface is the new
> -# replacement for WEXT and its use allows wpa_supplicant to properly con=
trol
> -# the driver to improve existing functionality like roaming and to suppo=
rt new
> -# functionality.
> -CONFIG_DRIVER_WEXT=3Dy
> -
> -# Driver interface for Linux drivers using the nl80211 kernel interface
> -CONFIG_DRIVER_NL80211=3Dy
> -
> -# driver_nl80211.c requires libnl. If you are compiling it yourself
> -# you may need to point hostapd to your version of libnl.
> -#
> -#CFLAGS +=3D -I$<path to libnl include files>
> -#LIBS +=3D -L$<path to libnl library files>
> -
> -# Use libnl v2.0 (or 3.0) libraries.
> -#CONFIG_LIBNL20=3Dy
> -
> -# Use libnl 3.2 libraries (if this is selected, CONFIG_LIBNL20 is ignore=
d)
> -CONFIG_LIBNL32=3Dy
> -
> -
> -# Driver interface for FreeBSD net80211 layer (e.g., Atheros driver)
> -#CONFIG_DRIVER_BSD=3Dy
> -#CFLAGS +=3D -I/usr/local/include
> -#LIBS +=3D -L/usr/local/lib
> -#LIBS_p +=3D -L/usr/local/lib
> -#LIBS_c +=3D -L/usr/local/lib
> -
> -# Driver interface for Windows NDIS
> -#CONFIG_DRIVER_NDIS=3Dy
> -#CFLAGS +=3D -I/usr/include/w32api/ddk
> -#LIBS +=3D -L/usr/local/lib
> -# For native build using mingw
> -#CONFIG_NATIVE_WINDOWS=3Dy
> -# Additional directories for cross-compilation on Linux host for mingw t=
arget
> -#CFLAGS +=3D -I/opt/mingw/mingw32/include/ddk
> -#LIBS +=3D -L/opt/mingw/mingw32/lib
> -#CC=3Dmingw32-gcc
> -# By default, driver_ndis uses WinPcap for low-level operations. This ca=
n be
> -# replaced with the following option which replaces WinPcap calls with N=
DISUIO.
> -# However, this requires that WZC is disabled (net stop wzcsvc) before s=
tarting
> -# wpa_supplicant.
> -# CONFIG_USE_NDISUIO=3Dy
> -
> -# Driver interface for development testing
> -#CONFIG_DRIVER_TEST=3Dy
> -
> -# Driver interface for wired Ethernet drivers
> -CONFIG_DRIVER_WIRED=3Dy
> -
> -# Driver interface for the Broadcom RoboSwitch family
> -#CONFIG_DRIVER_ROBOSWITCH=3Dy
> -
> -# Driver interface for no driver (e.g., WPS ER only)
> -#CONFIG_DRIVER_NONE=3Dy
> -
> -# Enable IEEE 802.1X Supplicant (automatically included if any EAP metho=
d is
> -# included)
> -CONFIG_IEEE8021X_EAPOL=3Dy
> -
> -# EAP-MD5
> -CONFIG_EAP_MD5=3Dy
> -
> -# EAP-MSCHAPv2
> -CONFIG_EAP_MSCHAPV2=3Dy
> -
> -# EAP-TLS
> -CONFIG_EAP_TLS=3Dy
> -
> -# EAL-PEAP
> -CONFIG_EAP_PEAP=3Dy
> -
> -# EAP-TTLS
> -CONFIG_EAP_TTLS=3Dy
> -
> -# EAP-FAST
> -# Note: If OpenSSL is used as the TLS library, OpenSSL 1.0 or newer is n=
eeded
> -# for EAP-FAST support. Older OpenSSL releases would need to be patched,=
 e.g.,
> -# with openssl-0.9.8x-tls-extensions.patch, to add the needed functions.
> -#CONFIG_EAP_FAST=3Dy
> -
> -# EAP-GTC
> -CONFIG_EAP_GTC=3Dy
> -
> -# EAP-OTP
> -CONFIG_EAP_OTP=3Dy
> -
> -# EAP-SIM (enable CONFIG_PCSC, if EAP-SIM is used)
> -#CONFIG_EAP_SIM=3Dy
> -
> -# EAP-PSK (experimental; this is _not_ needed for WPA-PSK)
> -#CONFIG_EAP_PSK=3Dy
> -
> -# EAP-pwd (secure authentication using only a password)
> -#CONFIG_EAP_PWD=3Dy
> -
> -# EAP-PAX
> -#CONFIG_EAP_PAX=3Dy
> -
> -# LEAP
> -CONFIG_EAP_LEAP=3Dy
> -
> -# EAP-AKA (enable CONFIG_PCSC, if EAP-AKA is used)
> -#CONFIG_EAP_AKA=3Dy
> -
> -# EAP-AKA' (enable CONFIG_PCSC, if EAP-AKA' is used).
> -# This requires CONFIG_EAP_AKA to be enabled, too.
> -#CONFIG_EAP_AKA_PRIME=3Dy
> -
> -# Enable USIM simulator (Milenage) for EAP-AKA
> -#CONFIG_USIM_SIMULATOR=3Dy
> -
> -# EAP-SAKE
> -#CONFIG_EAP_SAKE=3Dy
> -
> -# EAP-GPSK
> -#CONFIG_EAP_GPSK=3Dy
> -# Include support for optional SHA256 cipher suite in EAP-GPSK
> -#CONFIG_EAP_GPSK_SHA256=3Dy
> -
> -# EAP-TNC and related Trusted Network Connect support (experimental)
> -#CONFIG_EAP_TNC=3Dy
> -
> -# Wi-Fi Protected Setup (WPS)
> -CONFIG_WPS=3Dy
> -# Enable WSC 2.0 support
> -#CONFIG_WPS2=3Dy
> -# Enable WPS external registrar functionality
> -#CONFIG_WPS_ER=3Dy
> -# Disable credentials for an open network by default when acting as a WPS
> -# registrar.
> -#CONFIG_WPS_REG_DISABLE_OPEN=3Dy
> -# Enable WPS support with NFC config method
> -#CONFIG_WPS_NFC=3Dy
> -
> -# EAP-IKEv2
> -#CONFIG_EAP_IKEV2=3Dy
> -
> -# EAP-EKE
> -#CONFIG_EAP_EKE=3Dy
> -
> -# PKCS#12 (PFX) support (used to read private key and certificate file f=
rom
> -# a file that usually has extension .p12 or .pfx)
> -CONFIG_PKCS12=3Dy
> -
> -# Smartcard support (i.e., private key on a smartcard), e.g., with opens=
sl
> -# engine.
> -CONFIG_SMARTCARD=3Dy
> -
> -# PC/SC interface for smartcards (USIM, GSM SIM)
> -# Enable this if EAP-SIM or EAP-AKA is included
> -#CONFIG_PCSC=3Dy
> -
> -# Support HT overrides (disable HT/HT40, mask MCS rates, etc.)
> -#CONFIG_HT_OVERRIDES=3Dy
> -
> -# Support VHT overrides (disable VHT, mask MCS rates, etc.)
> -#CONFIG_VHT_OVERRIDES=3Dy
> -
> -# Development testing
> -#CONFIG_EAPOL_TEST=3Dy
> -
> -# Select control interface backend for external programs, e.g, wpa_cli:
> -# unix =3D UNIX domain sockets (default for Linux/*BSD)
> -# udp =3D UDP sockets using localhost (127.0.0.1)
> -# named_pipe =3D Windows Named Pipe (default for Windows)
> -# udp-remote =3D UDP sockets with remote access (only for tests systems/=
purpose)
> -# y =3D use default (backwards compatibility)
> -# If this option is commented out, control interface is not included in =
the
> -# build.
> -CONFIG_CTRL_IFACE=3Dy
> -
> -# Include support for GNU Readline and History Libraries in wpa_cli.
> -# When building a wpa_cli binary for distribution, please note that these
> -# libraries are licensed under GPL and as such, BSD license may not appl=
y for
> -# the resulting binary.
> -#CONFIG_READLINE=3Dy
> -
> -# Include internal line edit mode in wpa_cli. This can be used as a repl=
acement
> -# for GNU Readline to provide limited command line editing and history s=
upport.
> -#CONFIG_WPA_CLI_EDIT=3Dy
> -
> -# Remove debugging code that is printing out debug message to stdout.
> -# This can be used to reduce the size of the wpa_supplicant considerably
> -# if debugging code is not needed. The size reduction can be around 35%
> -# (e.g., 90 kB).
> -#CONFIG_NO_STDOUT_DEBUG=3Dy
> -
> -# Remove WPA support, e.g., for wired-only IEEE 802.1X supplicant, to sa=
ve
> -# 35-50 kB in code size.
> -#CONFIG_NO_WPA=3Dy
> -
> -# Remove IEEE 802.11i/WPA-Personal ASCII passphrase support
> -# This option can be used to reduce code size by removing support for
> -# converting ASCII passphrases into PSK. If this functionality is remove=
d, the
> -# PSK can only be configured as the 64-octet hexstring (e.g., from
> -# wpa_passphrase). This saves about 0.5 kB in code size.
> -#CONFIG_NO_WPA_PASSPHRASE=3Dy
> -
> -# Disable scan result processing (ap_mode=3D1) to save code size by abou=
t 1 kB.
> -# This can be used if ap_scan=3D1 mode is never enabled.
> -#CONFIG_NO_SCAN_PROCESSING=3Dy
> -
> -# Select configuration backend:
> -# file =3D text file (e.g., wpa_supplicant.conf; note: the configuration=
 file
> -#	path is given on command line, not here; this option is just used to
> -#	select the backend that allows configuration files to be used)
> -# winreg =3D Windows registry (see win_example.reg for an example)
> -CONFIG_BACKEND=3Dfile
> -
> -# Remove configuration write functionality (i.e., to allow the configura=
tion
> -# file to be updated based on runtime configuration changes). The runtime
> -# configuration can still be changed, the changes are just not going to =
be
> -# persistent over restarts. This option can be used to reduce code size =
by
> -# about 3.5 kB.
> -#CONFIG_NO_CONFIG_WRITE=3Dy
> -
> -# Remove support for configuration blobs to reduce code size by about 1.=
5 kB.
> -#CONFIG_NO_CONFIG_BLOBS=3Dy
> -
> -# Select program entry point implementation:
> -# main =3D UNIX/POSIX like main() function (default)
> -# main_winsvc =3D Windows service (read parameters from registry)
> -# main_none =3D Very basic example (development use only)
> -#CONFIG_MAIN=3Dmain
> -
> -# Select wrapper for operatins system and C library specific functions
> -# unix =3D UNIX/POSIX like systems (default)
> -# win32 =3D Windows systems
> -# none =3D Empty template
> -#CONFIG_OS=3Dunix
> -
> -# Select event loop implementation
> -# eloop =3D select() loop (default)
> -# eloop_win =3D Windows events and WaitForMultipleObject() loop
> -#CONFIG_ELOOP=3Deloop
> -
> -# Should we use poll instead of select? Select is used by default.
> -#CONFIG_ELOOP_POLL=3Dy
> -
> -# Select layer 2 packet implementation
> -# linux =3D Linux packet socket (default)
> -# pcap =3D libpcap/libdnet/WinPcap
> -# freebsd =3D FreeBSD libpcap
> -# winpcap =3D WinPcap with receive thread
> -# ndis =3D Windows NDISUIO (note: requires CONFIG_USE_NDISUIO=3Dy)
> -# none =3D Empty template
> -#CONFIG_L2_PACKET=3Dlinux
> -
> -# PeerKey handshake for Station to Station Link (IEEE 802.11e DLS)
> -CONFIG_PEERKEY=3Dy
> -
> -# IEEE 802.11w (management frame protection), also known as PMF
> -# Driver support is also needed for IEEE 802.11w.
> -#CONFIG_IEEE80211W=3Dy
> -
> -# Select TLS implementation
> -# openssl =3D OpenSSL (default)
> -# gnutls =3D GnuTLS
> -# internal =3D Internal TLSv1 implementation (experimental)
> -# none =3D Empty template
> -#CONFIG_TLS=3Dopenssl
> -
> -# TLS-based EAP methods require at least TLS v1.0. Newer version of TLS =
(v1.1)
> -# can be enabled to get a stronger construction of messages when block c=
iphers
> -# are used. It should be noted that some existing TLS v1.0 -based
> -# implementation may not be compatible with TLS v1.1 message (ClientHell=
o is
> -# sent prior to negotiating which version will be used)
> -#CONFIG_TLSV11=3Dy
> -
> -# TLS-based EAP methods require at least TLS v1.0. Newer version of TLS =
(v1.2)
> -# can be enabled to enable use of stronger crypto algorithms. It should =
be
> -# noted that some existing TLS v1.0 -based implementation may not be com=
patible
> -# with TLS v1.2 message (ClientHello is sent prior to negotiating which =
version
> -# will be used)
> -#CONFIG_TLSV12=3Dy
> -
> -# If CONFIG_TLS=3Dinternal is used, additional library and include paths=
 are
> -# needed for LibTomMath. Alternatively, an integrated, minimal version of
> -# LibTomMath can be used. See beginning of libtommath.c for details on b=
enefits
> -# and drawbacks of this option.
> -#CONFIG_INTERNAL_LIBTOMMATH=3Dy
> -#ifndef CONFIG_INTERNAL_LIBTOMMATH
> -#LTM_PATH=3D/usr/src/libtommath-0.39
> -#CFLAGS +=3D -I$(LTM_PATH)
> -#LIBS +=3D -L$(LTM_PATH)
> -#LIBS_p +=3D -L$(LTM_PATH)
> -#endif
> -# At the cost of about 4 kB of additional binary size, the internal LibT=
omMath
> -# can be configured to include faster routines for exptmod, sqr, and div=
 to
> -# speed up DH and RSA calculation considerably
> -#CONFIG_INTERNAL_LIBTOMMATH_FAST=3Dy
> -
> -# Include NDIS event processing through WMI into wpa_supplicant/wpasvc.
> -# This is only for Windows builds and requires WMI-related header files =
and
> -# WbemUuid.Lib from Platform SDK even when building with MinGW.
> -#CONFIG_NDIS_EVENTS_INTEGRATED=3Dy
> -#PLATFORMSDKLIB=3D"/opt/Program Files/Microsoft Platform SDK/Lib"
> -
> -# Add support for old DBus control interface
> -# (fi.epitest.hostap.WPASupplicant)
> -#CONFIG_CTRL_IFACE_DBUS=3Dy
> -
> -# Add support for new DBus control interface
> -# (fi.w1.hostap.wpa_supplicant1)
> -CONFIG_CTRL_IFACE_DBUS_NEW=3Dy
> -
> -# Add introspection support for new DBus control interface
> -#CONFIG_CTRL_IFACE_DBUS_INTRO=3Dy
> -
> -# Add support for loading EAP methods dynamically as shared libraries.
> -# When this option is enabled, each EAP method can be either included
> -# statically (CONFIG_EAP_<method>=3Dy) or dynamically (CONFIG_EAP_<metho=
d>=3Ddyn).
> -# Dynamic EAP methods are build as shared objects (eap_*.so) and they ne=
ed to
> -# be loaded in the beginning of the wpa_supplicant configuration file
> -# (see load_dynamic_eap parameter in the example file) before being used=
 in
> -# the network blocks.
> -#
> -# Note that some shared parts of EAP methods are included in the main pr=
ogram
> -# and in order to be able to use dynamic EAP methods using these parts, =
the
> -# main program must have been build with the EAP method enabled (=3Dy or=
 =3Ddyn).
> -# This means that EAP-TLS/PEAP/TTLS/FAST cannot be added as dynamic libr=
aries
> -# unless at least one of them was included in the main build to force in=
clusion
> -# of the shared code. Similarly, at least one of EAP-SIM/AKA must be inc=
luded
> -# in the main build to be able to load these methods dynamically.
> -#
> -# Please also note that using dynamic libraries will increase the total =
binary
> -# size. Thus, it may not be the best option for targets that have limited
> -# amount of memory/flash.
> -#CONFIG_DYNAMIC_EAP_METHODS=3Dy
> -
> -# IEEE Std 802.11r-2008 (Fast BSS Transition)
> -#CONFIG_IEEE80211R=3Dy
> -
> -# Add support for writing debug log to a file (/tmp/wpa_supplicant-log-#=
=2Etxt)
> -#CONFIG_DEBUG_FILE=3Dy
> -
> -# Send debug messages to syslog instead of stdout
> -#CONFIG_DEBUG_SYSLOG=3Dy
> -# Set syslog facility for debug messages
> -#CONFIG_DEBUG_SYSLOG_FACILITY=3DLOG_DAEMON
> -
> -# Add support for sending all debug messages (regardless of debug verbos=
ity)
> -# to the Linux kernel tracing facility. This helps debug the entire stac=
k by
> -# making it easy to record everything happening from the driver up into =
the
> -# same file, e.g., using trace-cmd.
> -#CONFIG_DEBUG_LINUX_TRACING=3Dy
> -
> -# Enable privilege separation (see README 'Privilege separation' for det=
ails)
> -#CONFIG_PRIVSEP=3Dy
> -
> -# Enable mitigation against certain attacks against TKIP by delaying Mic=
hael
> -# MIC error reports by a random amount of time between 0 and 60 seconds
> -#CONFIG_DELAYED_MIC_ERROR_REPORT=3Dy
> -
> -# Enable tracing code for developer debugging
> -# This tracks use of memory allocations and other registrations and repo=
rts
> -# incorrect use with a backtrace of call (or allocation) location.
> -#CONFIG_WPA_TRACE=3Dy
> -# For BSD, uncomment these.
> -#LIBS +=3D -lexecinfo
> -#LIBS_p +=3D -lexecinfo
> -#LIBS_c +=3D -lexecinfo
> -
> -# Use libbfd to get more details for developer debugging
> -# This enables use of libbfd to get more detailed symbols for the backtr=
aces
> -# generated by CONFIG_WPA_TRACE=3Dy.
> -#CONFIG_WPA_TRACE_BFD=3Dy
> -# For BSD, uncomment these.
> -#LIBS +=3D -lbfd -liberty -lz
> -#LIBS_p +=3D -lbfd -liberty -lz
> -#LIBS_c +=3D -lbfd -liberty -lz
> -
> -CONFIG_TLS =3D gnutls
> -CONFIG_CTRL_IFACE_DBUS=3Dy
> -CONFIG_CTRL_IFACE_DBUS_NEW=3Dy
> -
> -# wpa_supplicant depends on strong random number generation being availa=
ble
> -# from the operating system. os_get_random() function is used to fetch r=
andom
> -# data when needed, e.g., for key generation. On Linux and BSD systems, =
this
> -# works by reading /dev/urandom. It should be noted that the OS entropy =
pool
> -# needs to be properly initialized before wpa_supplicant is started. Thi=
s is
> -# important especially on embedded devices that do not have a hardware r=
andom
> -# number generator and may by default start up with minimal entropy avai=
lable
> -# for random number generation.
> -#
> -# As a safety net, wpa_supplicant is by default trying to internally col=
lect
> -# additional entropy for generating random data to mix in with the data =
fetched
> -# from the OS. This by itself is not considered to be very strong, but i=
t may
> -# help in cases where the system pool is not initialized properly. Howev=
er, it
> -# is very strongly recommended that the system pool is initialized with =
enough
> -# entropy either by using hardware assisted random number generator or by
> -# storing state over device reboots.
> -#
> -# wpa_supplicant can be configured to maintain its own entropy store over
> -# restarts to enhance random number generation. This is not perfect, but=
 it is
> -# much more secure than using the same sequence of random numbers after =
every
> -# reboot. This can be enabled with -e<entropy file> command line option.=
 The
> -# specified file needs to be readable and writable by wpa_supplicant.
> -#
> -# If the os_get_random() is known to provide strong random data (e.g., on
> -# Linux/BSD, the board in question is known to have reliable source of r=
andom
> -# data from /dev/urandom), the internal wpa_supplicant random pool can be
> -# disabled. This will save some in binary size and CPU use. However, this
> -# should only be considered for builds that are known to be used on devi=
ces
> -# that meet the requirements described above.
> -#CONFIG_NO_RANDOM_POOL=3Dy
> -
> -# IEEE 802.11n (High Throughput) support (mainly for AP mode)
> -#CONFIG_IEEE80211N=3Dy
> -
> -# IEEE 802.11ac (Very High Throughput) support (mainly for AP mode)
> -# (depends on CONFIG_IEEE80211N)
> -#CONFIG_IEEE80211AC=3Dy
> -
> -# Wireless Network Management (IEEE Std 802.11v-2011)
> -# Note: This is experimental and not complete implementation.
> -#CONFIG_WNM=3Dy
> -
> -# Interworking (IEEE 802.11u)
> -# This can be used to enable functionality to improve interworking with
> -# external networks (GAS/ANQP to learn more about the networks and netwo=
rk
> -# selection based on available credentials).
> -#CONFIG_INTERWORKING=3Dy
> -
> -# Hotspot 2.0
> -#CONFIG_HS20=3Dy
> -
> -# Disable roaming in wpa_supplicant
> -#CONFIG_NO_ROAMING=3Dy
> -
> -# AP mode operations with wpa_supplicant
> -# This can be used for controlling AP mode operations with wpa_supplican=
t. It
> -# should be noted that this is mainly aimed at simple cases like
> -# WPA2-Personal while more complex configurations like WPA2-Enterprise w=
ith an
> -# external RADIUS server can be supported with hostapd.
> -CONFIG_AP=3Dy
> -
> -CONFIG_BGSCAN_SIMPLE=3Dy
> -
> -# P2P (Wi-Fi Direct)
> -# This can be used to enable P2P support in wpa_supplicant. See README-P=
2P for
> -# more information on P2P operations.
> -#CONFIG_P2P=3Dy
> -
> -# Enable TDLS support
> -#CONFIG_TDLS=3Dy
> -
> -# Wi-Fi Direct
> -# This can be used to enable Wi-Fi Direct extensions for P2P using an ex=
ternal
> -# program to control the additional information exchanges in the message=
s.
> -#CONFIG_WIFI_DISPLAY=3Dy
> -
> -# Autoscan
> -# This can be used to enable automatic scan support in wpa_supplicant.
> -# See wpa_supplicant.conf for more information on autoscan usage.
> -#
> -# Enabling directly a module will enable autoscan support.
> -# For exponential module:
> -CONFIG_AUTOSCAN_EXPONENTIAL=3Dy
> -# For periodic module:
> -#CONFIG_AUTOSCAN_PERIODIC=3Dy
> -
> -# Password (and passphrase, etc.) backend for external storage
> -# These optional mechanisms can be used to add support for storing passw=
ords
> -# and other secrets in external (to wpa_supplicant) location. This allow=
s, for
> -# example, operating system specific key storage to be used
> -#
> -# External password backend for testing purposes (developer use)
> -#CONFIG_EXT_PASSWORD_TEST=3Dy
> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defc=
onfig-hostapd b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/def=
config-hostapd
> new file mode 100644
> index 0000000..f04e398
> --- /dev/null
> +++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig-h=
ostapd
> @@ -0,0 +1,552 @@
> +# Example wpa_supplicant build time configuration
> +#
> +# This file lists the configuration options that are used when building =
the
> +# hostapd binary. All lines starting with # are ignored. Configuration o=
ption
> +# lines must be commented out complete, if they are not to be included, =
i.e.,
> +# just setting VARIABLE=3Dn is not disabling that variable.
> +#
> +# This file is included in Makefile, so variables like CFLAGS and LIBS c=
an also
> +# be modified from here. In most cases, these lines should use +=3D in o=
rder not
> +# to override previous values of the variables.
> +
> +
> +# Uncomment following two lines and fix the paths if you have installed =
OpenSSL
> +# or GnuTLS in non-default location
> +#CFLAGS +=3D -I/usr/local/openssl/include
> +#LIBS +=3D -L/usr/local/openssl/lib
> +
> +# Some Red Hat versions seem to include kerberos header files from OpenS=
SL, but
> +# the kerberos files are not in the default include path. Following line=
 can be
> +# used to fix build issues on such systems (krb5.h not found).
> +#CFLAGS +=3D -I/usr/include/kerberos
> +
> +# Example configuration for various cross-compilation platforms
> +
> +#### sveasoft (e.g., for Linksys WRT54G) ###############################=
#######
> +#CC=3Dmipsel-uclibc-gcc
> +#CC=3D/opt/brcm/hndtools-mipsel-uclibc/bin/mipsel-uclibc-gcc
> +#CFLAGS +=3D -Os
> +#CPPFLAGS +=3D -I../src/include -I../../src/router/openssl/include
> +#LIBS +=3D -L/opt/brcm/hndtools-mipsel-uclibc-0.9.19/lib -lssl
> +########################################################################=
#######
> +
> +#### openwrt (e.g., for Linksys WRT54G) ################################=
#######
> +#CC=3Dmipsel-uclibc-gcc
> +#CC=3D/opt/brcm/hndtools-mipsel-uclibc/bin/mipsel-uclibc-gcc
> +#CFLAGS +=3D -Os
> +#CPPFLAGS=3D-I../src/include -I../openssl-0.9.7d/include \
> +#	-I../WRT54GS/release/src/include
> +#LIBS =3D -lssl
> +########################################################################=
#######
> +
> +
> +# Driver interface for Host AP driver
> +CONFIG_DRIVER_HOSTAP=3Dy
> +
> +# Driver interface for Agere driver
> +#CONFIG_DRIVER_HERMES=3Dy
> +# Change include directories to match with the local setup
> +#CFLAGS +=3D -I../../hcf -I../../include -I../../include/hcf
> +#CFLAGS +=3D -I../../include/wireless
> +
> +# Driver interface for madwifi driver
> +# Deprecated; use CONFIG_DRIVER_WEXT=3Dy instead.
> +#CONFIG_DRIVER_MADWIFI=3Dy
> +# Set include directory to the madwifi source tree
> +#CFLAGS +=3D -I../../madwifi
> +
> +# Driver interface for ndiswrapper
> +# Deprecated; use CONFIG_DRIVER_WEXT=3Dy instead.
> +#CONFIG_DRIVER_NDISWRAPPER=3Dy
> +
> +# Driver interface for Atmel driver
> +# CONFIG_DRIVER_ATMEL=3Dy
> +
> +# Driver interface for old Broadcom driver
> +# Please note that the newer Broadcom driver ("hybrid Linux driver") sup=
ports
> +# Linux wireless extensions and does not need (or even work) with the old
> +# driver wrapper. Use CONFIG_DRIVER_WEXT=3Dy with that driver.
> +#CONFIG_DRIVER_BROADCOM=3Dy
> +# Example path for wlioctl.h; change to match your configuration
> +#CFLAGS +=3D -I/opt/WRT54GS/release/src/include
> +
> +# Driver interface for Intel ipw2100/2200 driver
> +# Deprecated; use CONFIG_DRIVER_WEXT=3Dy instead.
> +#CONFIG_DRIVER_IPW=3Dy
> +
> +# Driver interface for Ralink driver
> +#CONFIG_DRIVER_RALINK=3Dy
> +
> +# Driver interface for generic Linux wireless extensions
> +# Note: WEXT is deprecated in the current Linux kernel version and no new
> +# functionality is added to it. nl80211-based interface is the new
> +# replacement for WEXT and its use allows wpa_supplicant to properly con=
trol
> +# the driver to improve existing functionality like roaming and to suppo=
rt new
> +# functionality.
> +CONFIG_DRIVER_WEXT=3Dy
> +
> +# Driver interface for Linux drivers using the nl80211 kernel interface
> +CONFIG_DRIVER_NL80211=3Dy
> +
> +# driver_nl80211.c requires libnl. If you are compiling it yourself
> +# you may need to point hostapd to your version of libnl.
> +#
> +#CFLAGS +=3D -I$<path to libnl include files>
> +#LIBS +=3D -L$<path to libnl library files>
> +
> +# Use libnl v2.0 (or 3.0) libraries.
> +#CONFIG_LIBNL20=3Dy
> +
> +# Use libnl 3.2 libraries (if this is selected, CONFIG_LIBNL20 is ignore=
d)
> +CONFIG_LIBNL32=3Dy
> +
> +
> +# Driver interface for FreeBSD net80211 layer (e.g., Atheros driver)
> +#CONFIG_DRIVER_BSD=3Dy
> +#CFLAGS +=3D -I/usr/local/include
> +#LIBS +=3D -L/usr/local/lib
> +#LIBS_p +=3D -L/usr/local/lib
> +#LIBS_c +=3D -L/usr/local/lib
> +
> +# Driver interface for Windows NDIS
> +#CONFIG_DRIVER_NDIS=3Dy
> +#CFLAGS +=3D -I/usr/include/w32api/ddk
> +#LIBS +=3D -L/usr/local/lib
> +# For native build using mingw
> +#CONFIG_NATIVE_WINDOWS=3Dy
> +# Additional directories for cross-compilation on Linux host for mingw t=
arget
> +#CFLAGS +=3D -I/opt/mingw/mingw32/include/ddk
> +#LIBS +=3D -L/opt/mingw/mingw32/lib
> +#CC=3Dmingw32-gcc
> +# By default, driver_ndis uses WinPcap for low-level operations. This ca=
n be
> +# replaced with the following option which replaces WinPcap calls with N=
DISUIO.
> +# However, this requires that WZC is disabled (net stop wzcsvc) before s=
tarting
> +# wpa_supplicant.
> +# CONFIG_USE_NDISUIO=3Dy
> +
> +# Driver interface for development testing
> +#CONFIG_DRIVER_TEST=3Dy
> +
> +# Driver interface for wired Ethernet drivers
> +CONFIG_DRIVER_WIRED=3Dy
> +
> +# Driver interface for the Broadcom RoboSwitch family
> +#CONFIG_DRIVER_ROBOSWITCH=3Dy
> +
> +# Driver interface for no driver (e.g., WPS ER only)
> +#CONFIG_DRIVER_NONE=3Dy
> +
> +# Enable IEEE 802.1X Supplicant (automatically included if any EAP metho=
d is
> +# included)
> +CONFIG_IEEE8021X_EAPOL=3Dy
> +
> +# EAP-MD5
> +CONFIG_EAP_MD5=3Dy
> +
> +# EAP-MSCHAPv2
> +CONFIG_EAP_MSCHAPV2=3Dy
> +
> +# EAP-TLS
> +CONFIG_EAP_TLS=3Dy
> +
> +# EAL-PEAP
> +CONFIG_EAP_PEAP=3Dy
> +
> +# EAP-TTLS
> +CONFIG_EAP_TTLS=3Dy
> +
> +# EAP-FAST
> +# Note: If OpenSSL is used as the TLS library, OpenSSL 1.0 or newer is n=
eeded
> +# for EAP-FAST support. Older OpenSSL releases would need to be patched,=
 e.g.,
> +# with openssl-0.9.8x-tls-extensions.patch, to add the needed functions.
> +#CONFIG_EAP_FAST=3Dy
> +
> +# EAP-GTC
> +CONFIG_EAP_GTC=3Dy
> +
> +# EAP-OTP
> +CONFIG_EAP_OTP=3Dy
> +
> +# EAP-SIM (enable CONFIG_PCSC, if EAP-SIM is used)
> +#CONFIG_EAP_SIM=3Dy
> +
> +# EAP-PSK (experimental; this is _not_ needed for WPA-PSK)
> +#CONFIG_EAP_PSK=3Dy
> +
> +# EAP-pwd (secure authentication using only a password)
> +#CONFIG_EAP_PWD=3Dy
> +
> +# EAP-PAX
> +#CONFIG_EAP_PAX=3Dy
> +
> +# LEAP
> +CONFIG_EAP_LEAP=3Dy
> +
> +# EAP-AKA (enable CONFIG_PCSC, if EAP-AKA is used)
> +#CONFIG_EAP_AKA=3Dy
> +
> +# EAP-AKA' (enable CONFIG_PCSC, if EAP-AKA' is used).
> +# This requires CONFIG_EAP_AKA to be enabled, too.
> +#CONFIG_EAP_AKA_PRIME=3Dy
> +
> +# Enable USIM simulator (Milenage) for EAP-AKA
> +#CONFIG_USIM_SIMULATOR=3Dy
> +
> +# EAP-SAKE
> +#CONFIG_EAP_SAKE=3Dy
> +
> +# EAP-GPSK
> +#CONFIG_EAP_GPSK=3Dy
> +# Include support for optional SHA256 cipher suite in EAP-GPSK
> +#CONFIG_EAP_GPSK_SHA256=3Dy
> +
> +# EAP-TNC and related Trusted Network Connect support (experimental)
> +#CONFIG_EAP_TNC=3Dy
> +
> +# Wi-Fi Protected Setup (WPS)
> +CONFIG_WPS=3Dy
> +# Enable WSC 2.0 support
> +#CONFIG_WPS2=3Dy
> +# Enable WPS external registrar functionality
> +#CONFIG_WPS_ER=3Dy
> +# Disable credentials for an open network by default when acting as a WPS
> +# registrar.
> +#CONFIG_WPS_REG_DISABLE_OPEN=3Dy
> +# Enable WPS support with NFC config method
> +#CONFIG_WPS_NFC=3Dy
> +
> +# EAP-IKEv2
> +#CONFIG_EAP_IKEV2=3Dy
> +
> +# EAP-EKE
> +#CONFIG_EAP_EKE=3Dy
> +
> +# PKCS#12 (PFX) support (used to read private key and certificate file f=
rom
> +# a file that usually has extension .p12 or .pfx)
> +CONFIG_PKCS12=3Dy
> +
> +# Smartcard support (i.e., private key on a smartcard), e.g., with opens=
sl
> +# engine.
> +CONFIG_SMARTCARD=3Dy
> +
> +# PC/SC interface for smartcards (USIM, GSM SIM)
> +# Enable this if EAP-SIM or EAP-AKA is included
> +#CONFIG_PCSC=3Dy
> +
> +# Support HT overrides (disable HT/HT40, mask MCS rates, etc.)
> +#CONFIG_HT_OVERRIDES=3Dy
> +
> +# Support VHT overrides (disable VHT, mask MCS rates, etc.)
> +#CONFIG_VHT_OVERRIDES=3Dy
> +
> +# Development testing
> +#CONFIG_EAPOL_TEST=3Dy
> +
> +# Select control interface backend for external programs, e.g, wpa_cli:
> +# unix =3D UNIX domain sockets (default for Linux/*BSD)
> +# udp =3D UDP sockets using localhost (127.0.0.1)
> +# named_pipe =3D Windows Named Pipe (default for Windows)
> +# udp-remote =3D UDP sockets with remote access (only for tests systems/=
purpose)
> +# y =3D use default (backwards compatibility)
> +# If this option is commented out, control interface is not included in =
the
> +# build.
> +CONFIG_CTRL_IFACE=3Dy
> +
> +# Include support for GNU Readline and History Libraries in wpa_cli.
> +# When building a wpa_cli binary for distribution, please note that these
> +# libraries are licensed under GPL and as such, BSD license may not appl=
y for
> +# the resulting binary.
> +#CONFIG_READLINE=3Dy
> +
> +# Include internal line edit mode in wpa_cli. This can be used as a repl=
acement
> +# for GNU Readline to provide limited command line editing and history s=
upport.
> +#CONFIG_WPA_CLI_EDIT=3Dy
> +
> +# Remove debugging code that is printing out debug message to stdout.
> +# This can be used to reduce the size of the wpa_supplicant considerably
> +# if debugging code is not needed. The size reduction can be around 35%
> +# (e.g., 90 kB).
> +#CONFIG_NO_STDOUT_DEBUG=3Dy
> +
> +# Remove WPA support, e.g., for wired-only IEEE 802.1X supplicant, to sa=
ve
> +# 35-50 kB in code size.
> +#CONFIG_NO_WPA=3Dy
> +
> +# Remove IEEE 802.11i/WPA-Personal ASCII passphrase support
> +# This option can be used to reduce code size by removing support for
> +# converting ASCII passphrases into PSK. If this functionality is remove=
d, the
> +# PSK can only be configured as the 64-octet hexstring (e.g., from
> +# wpa_passphrase). This saves about 0.5 kB in code size.
> +#CONFIG_NO_WPA_PASSPHRASE=3Dy
> +
> +# Disable scan result processing (ap_mode=3D1) to save code size by abou=
t 1 kB.
> +# This can be used if ap_scan=3D1 mode is never enabled.
> +#CONFIG_NO_SCAN_PROCESSING=3Dy
> +
> +# Select configuration backend:
> +# file =3D text file (e.g., wpa_supplicant.conf; note: the configuration=
 file
> +#	path is given on command line, not here; this option is just used to
> +#	select the backend that allows configuration files to be used)
> +# winreg =3D Windows registry (see win_example.reg for an example)
> +CONFIG_BACKEND=3Dfile
> +
> +# Remove configuration write functionality (i.e., to allow the configura=
tion
> +# file to be updated based on runtime configuration changes). The runtime
> +# configuration can still be changed, the changes are just not going to =
be
> +# persistent over restarts. This option can be used to reduce code size =
by
> +# about 3.5 kB.
> +#CONFIG_NO_CONFIG_WRITE=3Dy
> +
> +# Remove support for configuration blobs to reduce code size by about 1.=
5 kB.
> +#CONFIG_NO_CONFIG_BLOBS=3Dy
> +
> +# Select program entry point implementation:
> +# main =3D UNIX/POSIX like main() function (default)
> +# main_winsvc =3D Windows service (read parameters from registry)
> +# main_none =3D Very basic example (development use only)
> +#CONFIG_MAIN=3Dmain
> +
> +# Select wrapper for operatins system and C library specific functions
> +# unix =3D UNIX/POSIX like systems (default)
> +# win32 =3D Windows systems
> +# none =3D Empty template
> +#CONFIG_OS=3Dunix
> +
> +# Select event loop implementation
> +# eloop =3D select() loop (default)
> +# eloop_win =3D Windows events and WaitForMultipleObject() loop
> +#CONFIG_ELOOP=3Deloop
> +
> +# Should we use poll instead of select? Select is used by default.
> +#CONFIG_ELOOP_POLL=3Dy
> +
> +# Select layer 2 packet implementation
> +# linux =3D Linux packet socket (default)
> +# pcap =3D libpcap/libdnet/WinPcap
> +# freebsd =3D FreeBSD libpcap
> +# winpcap =3D WinPcap with receive thread
> +# ndis =3D Windows NDISUIO (note: requires CONFIG_USE_NDISUIO=3Dy)
> +# none =3D Empty template
> +#CONFIG_L2_PACKET=3Dlinux
> +
> +# PeerKey handshake for Station to Station Link (IEEE 802.11e DLS)
> +CONFIG_PEERKEY=3Dy
> +
> +# IEEE 802.11w (management frame protection), also known as PMF
> +# Driver support is also needed for IEEE 802.11w.
> +#CONFIG_IEEE80211W=3Dy
> +
> +# Select TLS implementation
> +# openssl =3D OpenSSL (default)
> +# gnutls =3D GnuTLS
> +# internal =3D Internal TLSv1 implementation (experimental)
> +# none =3D Empty template
> +#CONFIG_TLS=3Dopenssl
> +
> +# TLS-based EAP methods require at least TLS v1.0. Newer version of TLS =
(v1.1)
> +# can be enabled to get a stronger construction of messages when block c=
iphers
> +# are used. It should be noted that some existing TLS v1.0 -based
> +# implementation may not be compatible with TLS v1.1 message (ClientHell=
o is
> +# sent prior to negotiating which version will be used)
> +#CONFIG_TLSV11=3Dy
> +
> +# TLS-based EAP methods require at least TLS v1.0. Newer version of TLS =
(v1.2)
> +# can be enabled to enable use of stronger crypto algorithms. It should =
be
> +# noted that some existing TLS v1.0 -based implementation may not be com=
patible
> +# with TLS v1.2 message (ClientHello is sent prior to negotiating which =
version
> +# will be used)
> +#CONFIG_TLSV12=3Dy
> +
> +# If CONFIG_TLS=3Dinternal is used, additional library and include paths=
 are
> +# needed for LibTomMath. Alternatively, an integrated, minimal version of
> +# LibTomMath can be used. See beginning of libtommath.c for details on b=
enefits
> +# and drawbacks of this option.
> +#CONFIG_INTERNAL_LIBTOMMATH=3Dy
> +#ifndef CONFIG_INTERNAL_LIBTOMMATH
> +#LTM_PATH=3D/usr/src/libtommath-0.39
> +#CFLAGS +=3D -I$(LTM_PATH)
> +#LIBS +=3D -L$(LTM_PATH)
> +#LIBS_p +=3D -L$(LTM_PATH)
> +#endif
> +# At the cost of about 4 kB of additional binary size, the internal LibT=
omMath
> +# can be configured to include faster routines for exptmod, sqr, and div=
 to
> +# speed up DH and RSA calculation considerably
> +#CONFIG_INTERNAL_LIBTOMMATH_FAST=3Dy
> +
> +# Include NDIS event processing through WMI into wpa_supplicant/wpasvc.
> +# This is only for Windows builds and requires WMI-related header files =
and
> +# WbemUuid.Lib from Platform SDK even when building with MinGW.
> +#CONFIG_NDIS_EVENTS_INTEGRATED=3Dy
> +#PLATFORMSDKLIB=3D"/opt/Program Files/Microsoft Platform SDK/Lib"
> +
> +# Add support for old DBus control interface
> +# (fi.epitest.hostap.WPASupplicant)
> +#CONFIG_CTRL_IFACE_DBUS=3Dy
> +
> +# Add support for new DBus control interface
> +# (fi.w1.hostap.wpa_supplicant1)
> +CONFIG_CTRL_IFACE_DBUS_NEW=3Dy
> +
> +# Add introspection support for new DBus control interface
> +#CONFIG_CTRL_IFACE_DBUS_INTRO=3Dy
> +
> +# Add support for loading EAP methods dynamically as shared libraries.
> +# When this option is enabled, each EAP method can be either included
> +# statically (CONFIG_EAP_<method>=3Dy) or dynamically (CONFIG_EAP_<metho=
d>=3Ddyn).
> +# Dynamic EAP methods are build as shared objects (eap_*.so) and they ne=
ed to
> +# be loaded in the beginning of the wpa_supplicant configuration file
> +# (see load_dynamic_eap parameter in the example file) before being used=
 in
> +# the network blocks.
> +#
> +# Note that some shared parts of EAP methods are included in the main pr=
ogram
> +# and in order to be able to use dynamic EAP methods using these parts, =
the
> +# main program must have been build with the EAP method enabled (=3Dy or=
 =3Ddyn).
> +# This means that EAP-TLS/PEAP/TTLS/FAST cannot be added as dynamic libr=
aries
> +# unless at least one of them was included in the main build to force in=
clusion
> +# of the shared code. Similarly, at least one of EAP-SIM/AKA must be inc=
luded
> +# in the main build to be able to load these methods dynamically.
> +#
> +# Please also note that using dynamic libraries will increase the total =
binary
> +# size. Thus, it may not be the best option for targets that have limited
> +# amount of memory/flash.
> +#CONFIG_DYNAMIC_EAP_METHODS=3Dy
> +
> +# IEEE Std 802.11r-2008 (Fast BSS Transition)
> +#CONFIG_IEEE80211R=3Dy
> +
> +# Add support for writing debug log to a file (/tmp/wpa_supplicant-log-#=
=2Etxt)
> +#CONFIG_DEBUG_FILE=3Dy
> +
> +# Send debug messages to syslog instead of stdout
> +#CONFIG_DEBUG_SYSLOG=3Dy
> +# Set syslog facility for debug messages
> +#CONFIG_DEBUG_SYSLOG_FACILITY=3DLOG_DAEMON
> +
> +# Add support for sending all debug messages (regardless of debug verbos=
ity)
> +# to the Linux kernel tracing facility. This helps debug the entire stac=
k by
> +# making it easy to record everything happening from the driver up into =
the
> +# same file, e.g., using trace-cmd.
> +#CONFIG_DEBUG_LINUX_TRACING=3Dy
> +
> +# Enable privilege separation (see README 'Privilege separation' for det=
ails)
> +#CONFIG_PRIVSEP=3Dy
> +
> +# Enable mitigation against certain attacks against TKIP by delaying Mic=
hael
> +# MIC error reports by a random amount of time between 0 and 60 seconds
> +#CONFIG_DELAYED_MIC_ERROR_REPORT=3Dy
> +
> +# Enable tracing code for developer debugging
> +# This tracks use of memory allocations and other registrations and repo=
rts
> +# incorrect use with a backtrace of call (or allocation) location.
> +#CONFIG_WPA_TRACE=3Dy
> +# For BSD, uncomment these.
> +#LIBS +=3D -lexecinfo
> +#LIBS_p +=3D -lexecinfo
> +#LIBS_c +=3D -lexecinfo
> +
> +# Use libbfd to get more details for developer debugging
> +# This enables use of libbfd to get more detailed symbols for the backtr=
aces
> +# generated by CONFIG_WPA_TRACE=3Dy.
> +#CONFIG_WPA_TRACE_BFD=3Dy
> +# For BSD, uncomment these.
> +#LIBS +=3D -lbfd -liberty -lz
> +#LIBS_p +=3D -lbfd -liberty -lz
> +#LIBS_c +=3D -lbfd -liberty -lz
> +
> +CONFIG_TLS =3D %ssl%
> +CONFIG_CTRL_IFACE_DBUS=3Dy
> +CONFIG_CTRL_IFACE_DBUS_NEW=3Dy
> +
> +# wpa_supplicant depends on strong random number generation being availa=
ble
> +# from the operating system. os_get_random() function is used to fetch r=
andom
> +# data when needed, e.g., for key generation. On Linux and BSD systems, =
this
> +# works by reading /dev/urandom. It should be noted that the OS entropy =
pool
> +# needs to be properly initialized before wpa_supplicant is started. Thi=
s is
> +# important especially on embedded devices that do not have a hardware r=
andom
> +# number generator and may by default start up with minimal entropy avai=
lable
> +# for random number generation.
> +#
> +# As a safety net, wpa_supplicant is by default trying to internally col=
lect
> +# additional entropy for generating random data to mix in with the data =
fetched
> +# from the OS. This by itself is not considered to be very strong, but i=
t may
> +# help in cases where the system pool is not initialized properly. Howev=
er, it
> +# is very strongly recommended that the system pool is initialized with =
enough
> +# entropy either by using hardware assisted random number generator or by
> +# storing state over device reboots.
> +#
> +# wpa_supplicant can be configured to maintain its own entropy store over
> +# restarts to enhance random number generation. This is not perfect, but=
 it is
> +# much more secure than using the same sequence of random numbers after =
every
> +# reboot. This can be enabled with -e<entropy file> command line option.=
 The
> +# specified file needs to be readable and writable by wpa_supplicant.
> +#
> +# If the os_get_random() is known to provide strong random data (e.g., on
> +# Linux/BSD, the board in question is known to have reliable source of r=
andom
> +# data from /dev/urandom), the internal wpa_supplicant random pool can be
> +# disabled. This will save some in binary size and CPU use. However, this
> +# should only be considered for builds that are known to be used on devi=
ces
> +# that meet the requirements described above.
> +#CONFIG_NO_RANDOM_POOL=3Dy
> +
> +# IEEE 802.11n (High Throughput) support (mainly for AP mode)
> +#CONFIG_IEEE80211N=3Dy
> +
> +# IEEE 802.11ac (Very High Throughput) support (mainly for AP mode)
> +# (depends on CONFIG_IEEE80211N)
> +#CONFIG_IEEE80211AC=3Dy
> +
> +# Wireless Network Management (IEEE Std 802.11v-2011)
> +# Note: This is experimental and not complete implementation.
> +#CONFIG_WNM=3Dy
> +
> +# Interworking (IEEE 802.11u)
> +# This can be used to enable functionality to improve interworking with
> +# external networks (GAS/ANQP to learn more about the networks and netwo=
rk
> +# selection based on available credentials).
> +#CONFIG_INTERWORKING=3Dy
> +
> +# Hotspot 2.0
> +#CONFIG_HS20=3Dy
> +
> +# Disable roaming in wpa_supplicant
> +#CONFIG_NO_ROAMING=3Dy
> +
> +# AP mode operations with wpa_supplicant
> +# This can be used for controlling AP mode operations with wpa_supplican=
t. It
> +# should be noted that this is mainly aimed at simple cases like
> +# WPA2-Personal while more complex configurations like WPA2-Enterprise w=
ith an
> +# external RADIUS server can be supported with hostapd.
> +CONFIG_AP=3Dy
> +
> +CONFIG_BGSCAN_SIMPLE=3Dy
> +
> +# P2P (Wi-Fi Direct)
> +# This can be used to enable P2P support in wpa_supplicant. See README-P=
2P for
> +# more information on P2P operations.
> +#CONFIG_P2P=3Dy
> +
> +# Enable TDLS support
> +#CONFIG_TDLS=3Dy
> +
> +# Wi-Fi Direct
> +# This can be used to enable Wi-Fi Direct extensions for P2P using an ex=
ternal
> +# program to control the additional information exchanges in the message=
s.
> +#CONFIG_WIFI_DISPLAY=3Dy
> +
> +# Autoscan
> +# This can be used to enable automatic scan support in wpa_supplicant.
> +# See wpa_supplicant.conf for more information on autoscan usage.
> +#
> +# Enabling directly a module will enable autoscan support.
> +# For exponential module:
> +CONFIG_AUTOSCAN_EXPONENTIAL=3Dy
> +# For periodic module:
> +#CONFIG_AUTOSCAN_PERIODIC=3Dy
> +
> +# Password (and passphrase, etc.) backend for external storage
> +# These optional mechanisms can be used to add support for storing passw=
ords
> +# and other secrets in external (to wpa_supplicant) location. This allow=
s, for
> +# example, operating system specific key storage to be used
> +#
> +# External password backend for testing purposes (developer use)
> +#CONFIG_EXT_PASSWORD_TEST=3Dy
> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--iFRdW5/EC4oqxDHL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPh5gwACgkQN1Ujt2V2gByJ6gCfb8PwJFhH4FvG94Ry70ZMxeft
SOIAnj7U63PaqByOpdW10JeuxO9GJ1H8
=NhTk
-----END PGP SIGNATURE-----

--iFRdW5/EC4oqxDHL--
