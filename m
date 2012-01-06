Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1RjBiq-0008He-HL
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 16:28:56 +0100
Received: by eeit10 with SMTP id t10so987569eei.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jan 2012 07:21:20 -0800 (PST)
Received: by 10.213.20.218 with SMTP id g26mr1355462ebb.1.1325863278994;
	Fri, 06 Jan 2012 07:21:18 -0800 (PST)
Received: from [128.224.170.134] ([89.121.200.106])
	by mx.google.com with ESMTPS id e12sm98073462eea.5.2012.01.06.07.21.17
	(version=SSLv3 cipher=OTHER); Fri, 06 Jan 2012 07:21:18 -0800 (PST)
Message-ID: <4F07116E.6080805@gherzan.ro>
Date: Fri, 06 Jan 2012 17:21:18 +0200
From: Andrei Gherzan <andrei@gherzan.ro>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:8.0) Gecko/20111124 Thunderbird/8.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1325799041-3640-1-git-send-email-andrei@gherzan.ro>
	<4F06A6FB.30105@linux.intel.com>
In-Reply-To: <4F06A6FB.30105@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wpa-supplicant: Compile without CONFIG_GNUTLS_EXTRA
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
X-List-Received-Date: Fri, 06 Jan 2012 15:28:56 -0000
Content-Type: multipart/alternative;
	boundary="------------000802040206090601020903"

--------------000802040206090601020903
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Yes it does. I will commit make another commit with pr changed as well. 
Thank you Sau.

On 01/06/2012 09:47 AM, Saul Wold wrote:
> On 01/05/2012 01:30 PM, Andrei Gherzan wrote:
>> From: Andrei Gherzan<andrei.gherzan@windriver.com>
>>
>> CONFIG_GNUTLS_EXTRA is needed as support for TLS/IA which was 
>> designed to be used
>> in the EAP-TTLSv1. As we don't see any requirement for that protocol 
>> today we decided
>> to remove it from wpa-supplicant .config file.
>>
>> [YOCTO #1845]
>>
>> Signed-off-by: Andrei Gherzan<andrei@gherzan.ro>
>> ---
>>   .../wpa-supplicant/defconfig.inc                   |    4 -
>>   .../wpa-supplicant-0.7.3/defconfig-gnutls          |    2 +-
>>   .../wpa-supplicant-0.7.3/defconfig-gnutls-nogplv3  |  409 
>> --------------------
>>   .../wpa-supplicant/wpa-supplicant-0.7.inc          |    7 +-
>>   4 files changed, 3 insertions(+), 419 deletions(-)
>>   delete mode 100644 
>> meta/recipes-connectivity/wpa-supplicant/defconfig.inc
>>   delete mode 100644 
>> meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/defconfig-gnutls-nogplv3
>>
> Is this missing a PR Bump?
>
> Sau!
>
>> diff --git a/meta/recipes-connectivity/wpa-supplicant/defconfig.inc 
>> b/meta/recipes-connectivity/wpa-supplicant/defconfig.inc
>> deleted file mode 100644
>> index fdcbb43..0000000
>> --- a/meta/recipes-connectivity/wpa-supplicant/defconfig.inc
>> +++ /dev/null
>> @@ -1,4 +0,0 @@
>> -def get_defconfig(bb, d):
>> -    if d.getVar('INCOMPATIBLE_LICENSE', 1) in [ 'GPLv3' ]:
>> -        return "-nogplv3"
>> -    return ""
>> diff --git 
>> a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/defconfig-gnutls 
>> b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/defconfig-gnutls 
>>
>> index c679e00..e03338f 100644
>> --- 
>> a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/defconfig-gnutls
>> +++ 
>> b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/defconfig-gnutls
>> @@ -404,6 +404,6 @@ CONFIG_PEERKEY=y
>>   #LIBS_p += -lbfd -liberty -lz
>>   #LIBS_c += -lbfd -liberty -lz
>>   CONFIG_TLS = gnutls
>> -CONFIG_GNUTLS_EXTRA=y
>> +#CONFIG_GNUTLS_EXTRA=y
>>   CONFIG_CTRL_IFACE_DBUS=y
>>   CONFIG_CTRL_IFACE_DBUS_NEW=y
>> diff --git 
>> a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/defconfig-gnutls-nogplv3 
>> b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/defconfig-gnutls-nogplv3 
>>
>> deleted file mode 100644
>> index e03338f..0000000
>> --- 
>> a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/defconfig-gnutls-nogplv3
>> +++ /dev/null
>> @@ -1,409 +0,0 @@
>> -# Example wpa_supplicant build time configuration
>> -#
>> -# This file lists the configuration options that are used when 
>> building the
>> -# hostapd binary. All lines starting with # are ignored. 
>> Configuration option
>> -# lines must be commented out complete, if they are not to be 
>> included, i.e.,
>> -# just setting VARIABLE=n is not disabling that variable.
>> -#
>> -# This file is included in Makefile, so variables like CFLAGS and 
>> LIBS can also
>> -# be modified from here. In most cases, these lines should use += in 
>> order not
>> -# to override previous values of the variables.
>> -
>> -
>> -# Uncomment following two lines and fix the paths if you have 
>> installed OpenSSL
>> -# or GnuTLS in non-default location
>> -#CFLAGS += -I/usr/local/openssl/include
>> -#LIBS += -L/usr/local/openssl/lib
>> -
>> -# Some Red Hat versions seem to include kerberos header files from 
>> OpenSSL, but
>> -# the kerberos files are not in the default include path. Following 
>> line can be
>> -# used to fix build issues on such systems (krb5.h not found).
>> -#CFLAGS += -I/usr/include/kerberos
>> -
>> -# Example configuration for various cross-compilation platforms
>> -
>> -#### sveasoft (e.g., for Linksys WRT54G) 
>> ######################################
>> -#CC=mipsel-uclibc-gcc
>> -#CC=/opt/brcm/hndtools-mipsel-uclibc/bin/mipsel-uclibc-gcc
>> -#CFLAGS += -Os
>> -#CPPFLAGS += -I../src/include -I../../src/router/openssl/include
>> -#LIBS += -L/opt/brcm/hndtools-mipsel-uclibc-0.9.19/lib -lssl
>> -############################################################################### 
>>
>> -
>> -#### openwrt (e.g., for Linksys WRT54G) 
>> #######################################
>> -#CC=mipsel-uclibc-gcc
>> -#CC=/opt/brcm/hndtools-mipsel-uclibc/bin/mipsel-uclibc-gcc
>> -#CFLAGS += -Os
>> -#CPPFLAGS=-I../src/include -I../openssl-0.9.7d/include \
>> -#    -I../WRT54GS/release/src/include
>> -#LIBS = -lssl
>> -############################################################################### 
>>
>> -
>> -
>> -# Driver interface for Host AP driver
>> -CONFIG_DRIVER_HOSTAP=y
>> -
>> -# Driver interface for Agere driver
>> -#CONFIG_DRIVER_HERMES=y
>> -# Change include directories to match with the local setup
>> -#CFLAGS += -I../../hcf -I../../include -I../../include/hcf
>> -#CFLAGS += -I../../include/wireless
>> -
>> -# Driver interface for madwifi driver
>> -# Deprecated; use CONFIG_DRIVER_WEXT=y instead.
>> -#CONFIG_DRIVER_MADWIFI=y
>> -# Set include directory to the madwifi source tree
>> -#CFLAGS += -I../../madwifi
>> -
>> -# Driver interface for ndiswrapper
>> -# Deprecated; use CONFIG_DRIVER_WEXT=y instead.
>> -#CONFIG_DRIVER_NDISWRAPPER=y
>> -
>> -# Driver interface for Atmel driver
>> -# CONFIG_DRIVER_ATMEL=y
>> -
>> -# Driver interface for old Broadcom driver
>> -# Please note that the newer Broadcom driver ("hybrid Linux driver") 
>> supports
>> -# Linux wireless extensions and does not need (or even work) with 
>> the old
>> -# driver wrapper. Use CONFIG_DRIVER_WEXT=y with that driver.
>> -#CONFIG_DRIVER_BROADCOM=y
>> -# Example path for wlioctl.h; change to match your configuration
>> -#CFLAGS += -I/opt/WRT54GS/release/src/include
>> -
>> -# Driver interface for Intel ipw2100/2200 driver
>> -# Deprecated; use CONFIG_DRIVER_WEXT=y instead.
>> -#CONFIG_DRIVER_IPW=y
>> -
>> -# Driver interface for Ralink driver
>> -#CONFIG_DRIVER_RALINK=y
>> -
>> -# Driver interface for generic Linux wireless extensions
>> -CONFIG_DRIVER_WEXT=y
>> -
>> -# Driver interface for Linux drivers using the nl80211 kernel interface
>> -CONFIG_LIBNL20=y
>> -CONFIG_DRIVER_NL80211=y
>> -
>> -# Driver interface for FreeBSD net80211 layer (e.g., Atheros driver)
>> -#CONFIG_DRIVER_BSD=y
>> -#CFLAGS += -I/usr/local/include
>> -#LIBS += -L/usr/local/lib
>> -#LIBS_p += -L/usr/local/lib
>> -#LIBS_c += -L/usr/local/lib
>> -
>> -# Driver interface for Windows NDIS
>> -#CONFIG_DRIVER_NDIS=y
>> -#CFLAGS += -I/usr/include/w32api/ddk
>> -#LIBS += -L/usr/local/lib
>> -# For native build using mingw
>> -#CONFIG_NATIVE_WINDOWS=y
>> -# Additional directories for cross-compilation on Linux host for 
>> mingw target
>> -#CFLAGS += -I/opt/mingw/mingw32/include/ddk
>> -#LIBS += -L/opt/mingw/mingw32/lib
>> -#CC=mingw32-gcc
>> -# By default, driver_ndis uses WinPcap for low-level operations. 
>> This can be
>> -# replaced with the following option which replaces WinPcap calls 
>> with NDISUIO.
>> -# However, this requires that WZC is disabled (net stop wzcsvc) 
>> before starting
>> -# wpa_supplicant.
>> -# CONFIG_USE_NDISUIO=y
>> -
>> -# Driver interface for development testing
>> -#CONFIG_DRIVER_TEST=y
>> -
>> -# Include client MLME (management frame processing) for test driver
>> -# This can be used to test MLME operations in hostapd with the test 
>> interface.
>> -# space.
>> -#CONFIG_CLIENT_MLME=y
>> -
>> -# Driver interface for wired Ethernet drivers
>> -CONFIG_DRIVER_WIRED=y
>> -
>> -# Driver interface for the Broadcom RoboSwitch family
>> -#CONFIG_DRIVER_ROBOSWITCH=y
>> -
>> -# Driver interface for no driver (e.g., WPS ER only)
>> -#CONFIG_DRIVER_NONE=y
>> -
>> -# Enable IEEE 802.1X Supplicant (automatically included if any EAP 
>> method is
>> -# included)
>> -CONFIG_IEEE8021X_EAPOL=y
>> -
>> -# EAP-MD5
>> -CONFIG_EAP_MD5=y
>> -
>> -# EAP-MSCHAPv2
>> -CONFIG_EAP_MSCHAPV2=y
>> -
>> -# EAP-TLS
>> -CONFIG_EAP_TLS=y
>> -
>> -# EAL-PEAP
>> -CONFIG_EAP_PEAP=y
>> -
>> -# EAP-TTLS
>> -CONFIG_EAP_TTLS=y
>> -
>> -# EAP-FAST
>> -# Note: Default OpenSSL package does not include support for all the
>> -# functionality needed for EAP-FAST. If EAP-FAST is enabled with 
>> OpenSSL,
>> -# the OpenSSL library must be patched 
>> (openssl-0.9.8d-tls-extensions.patch)
>> -# to add the needed functions.
>> -#CONFIG_EAP_FAST=y
>> -
>> -# EAP-GTC
>> -CONFIG_EAP_GTC=y
>> -
>> -# EAP-OTP
>> -CONFIG_EAP_OTP=y
>> -
>> -# EAP-SIM (enable CONFIG_PCSC, if EAP-SIM is used)
>> -#CONFIG_EAP_SIM=y
>> -
>> -# EAP-PSK (experimental; this is _not_ needed for WPA-PSK)
>> -#CONFIG_EAP_PSK=y
>> -
>> -# EAP-PAX
>> -#CONFIG_EAP_PAX=y
>> -
>> -# LEAP
>> -CONFIG_EAP_LEAP=y
>> -
>> -# EAP-AKA (enable CONFIG_PCSC, if EAP-AKA is used)
>> -#CONFIG_EAP_AKA=y
>> -
>> -# EAP-AKA' (enable CONFIG_PCSC, if EAP-AKA' is used).
>> -# This requires CONFIG_EAP_AKA to be enabled, too.
>> -#CONFIG_EAP_AKA_PRIME=y
>> -
>> -# Enable USIM simulator (Milenage) for EAP-AKA
>> -#CONFIG_USIM_SIMULATOR=y
>> -
>> -# EAP-SAKE
>> -#CONFIG_EAP_SAKE=y
>> -
>> -# EAP-GPSK
>> -#CONFIG_EAP_GPSK=y
>> -# Include support for optional SHA256 cipher suite in EAP-GPSK
>> -#CONFIG_EAP_GPSK_SHA256=y
>> -
>> -# EAP-TNC and related Trusted Network Connect support (experimental)
>> -#CONFIG_EAP_TNC=y
>> -
>> -# Wi-Fi Protected Setup (WPS)
>> -#CONFIG_WPS=y
>> -
>> -# EAP-IKEv2
>> -#CONFIG_EAP_IKEV2=y
>> -
>> -# PKCS#12 (PFX) support (used to read private key and certificate 
>> file from
>> -# a file that usually has extension .p12 or .pfx)
>> -CONFIG_PKCS12=y
>> -
>> -# Smartcard support (i.e., private key on a smartcard), e.g., with 
>> openssl
>> -# engine.
>> -CONFIG_SMARTCARD=y
>> -
>> -# PC/SC interface for smartcards (USIM, GSM SIM)
>> -# Enable this if EAP-SIM or EAP-AKA is included
>> -#CONFIG_PCSC=y
>> -
>> -# Development testing
>> -#CONFIG_EAPOL_TEST=y
>> -
>> -# Select control interface backend for external programs, e.g, wpa_cli:
>> -# unix = UNIX domain sockets (default for Linux/*BSD)
>> -# udp = UDP sockets using localhost (127.0.0.1)
>> -# named_pipe = Windows Named Pipe (default for Windows)
>> -# y = use default (backwards compatibility)
>> -# If this option is commented out, control interface is not included 
>> in the
>> -# build.
>> -CONFIG_CTRL_IFACE=y
>> -
>> -# Include support for GNU Readline and History Libraries in wpa_cli.
>> -# When building a wpa_cli binary for distribution, please note that 
>> these
>> -# libraries are licensed under GPL and as such, BSD license may not 
>> apply for
>> -# the resulting binary.
>> -#CONFIG_READLINE=y
>> -
>> -# Remove debugging code that is printing out debug message to stdout.
>> -# This can be used to reduce the size of the wpa_supplicant 
>> considerably
>> -# if debugging code is not needed. The size reduction can be around 35%
>> -# (e.g., 90 kB).
>> -#CONFIG_NO_STDOUT_DEBUG=y
>> -
>> -# Remove WPA support, e.g., for wired-only IEEE 802.1X supplicant, 
>> to save
>> -# 35-50 kB in code size.
>> -#CONFIG_NO_WPA=y
>> -
>> -# Remove WPA2 support. This allows WPA to be used, but removes WPA2 
>> code to
>> -# save about 1 kB in code size when building only WPA-Personal (no 
>> EAP support)
>> -# or 6 kB if building for WPA-Enterprise.
>> -#CONFIG_NO_WPA2=y
>> -
>> -# Remove IEEE 802.11i/WPA-Personal ASCII passphrase support
>> -# This option can be used to reduce code size by removing support for
>> -# converting ASCII passphrases into PSK. If this functionality is 
>> removed, the
>> -# PSK can only be configured as the 64-octet hexstring (e.g., from
>> -# wpa_passphrase). This saves about 0.5 kB in code size.
>> -#CONFIG_NO_WPA_PASSPHRASE=y
>> -
>> -# Disable scan result processing (ap_mode=1) to save code size by 
>> about 1 kB.
>> -# This can be used if ap_scan=1 mode is never enabled.
>> -#CONFIG_NO_SCAN_PROCESSING=y
>> -
>> -# Select configuration backend:
>> -# file = text file (e.g., wpa_supplicant.conf; note: the 
>> configuration file
>> -#    path is given on command line, not here; this option is just 
>> used to
>> -#    select the backend that allows configuration files to be used)
>> -# winreg = Windows registry (see win_example.reg for an example)
>> -CONFIG_BACKEND=file
>> -
>> -# Remove configuration write functionality (i.e., to allow the 
>> configuration
>> -# file to be updated based on runtime configuration changes). The 
>> runtime
>> -# configuration can still be changed, the changes are just not going 
>> to be
>> -# persistent over restarts. This option can be used to reduce code 
>> size by
>> -# about 3.5 kB.
>> -#CONFIG_NO_CONFIG_WRITE=y
>> -
>> -# Remove support for configuration blobs to reduce code size by 
>> about 1.5 kB.
>> -#CONFIG_NO_CONFIG_BLOBS=y
>> -
>> -# Select program entry point implementation:
>> -# main = UNIX/POSIX like main() function (default)
>> -# main_winsvc = Windows service (read parameters from registry)
>> -# main_none = Very basic example (development use only)
>> -#CONFIG_MAIN=main
>> -
>> -# Select wrapper for operatins system and C library specific functions
>> -# unix = UNIX/POSIX like systems (default)
>> -# win32 = Windows systems
>> -# none = Empty template
>> -#CONFIG_OS=unix
>> -
>> -# Select event loop implementation
>> -# eloop = select() loop (default)
>> -# eloop_win = Windows events and WaitForMultipleObject() loop
>> -# eloop_none = Empty template
>> -#CONFIG_ELOOP=eloop
>> -
>> -# Select layer 2 packet implementation
>> -# linux = Linux packet socket (default)
>> -# pcap = libpcap/libdnet/WinPcap
>> -# freebsd = FreeBSD libpcap
>> -# winpcap = WinPcap with receive thread
>> -# ndis = Windows NDISUIO (note: requires CONFIG_USE_NDISUIO=y)
>> -# none = Empty template
>> -#CONFIG_L2_PACKET=linux
>> -
>> -# PeerKey handshake for Station to Station Link (IEEE 802.11e DLS)
>> -CONFIG_PEERKEY=y
>> -
>> -# IEEE 802.11w (management frame protection)
>> -# This version is an experimental implementation based on IEEE 
>> 802.11w/D1.0
>> -# draft and is subject to change since the standard has not yet been 
>> finalized.
>> -# Driver support is also needed for IEEE 802.11w.
>> -#CONFIG_IEEE80211W=y
>> -
>> -# Select TLS implementation
>> -# openssl = OpenSSL (default)
>> -# gnutls = GnuTLS (needed for TLS/IA, see also CONFIG_GNUTLS_EXTRA)
>> -# internal = Internal TLSv1 implementation (experimental)
>> -# none = Empty template
>> -#CONFIG_TLS=openssl
>> -
>> -# Whether to enable TLS/IA support, which is required for EAP-TTLSv1.
>> -# You need CONFIG_TLS=gnutls for this to have any effect. Please 
>> note that
>> -# even though the core GnuTLS library is released under LGPL, this 
>> extra
>> -# library uses GPL and as such, the terms of GPL apply to the 
>> combination
>> -# of wpa_supplicant and GnuTLS if this option is enabled. BSD 
>> license may not
>> -# apply for distribution of the resulting binary.
>> -#CONFIG_GNUTLS_EXTRA=y
>> -
>> -# If CONFIG_TLS=internal is used, additional library and include 
>> paths are
>> -# needed for LibTomMath. Alternatively, an integrated, minimal 
>> version of
>> -# LibTomMath can be used. See beginning of libtommath.c for details 
>> on benefits
>> -# and drawbacks of this option.
>> -#CONFIG_INTERNAL_LIBTOMMATH=y
>> -#ifndef CONFIG_INTERNAL_LIBTOMMATH
>> -#LTM_PATH=/usr/src/libtommath-0.39
>> -#CFLAGS += -I$(LTM_PATH)
>> -#LIBS += -L$(LTM_PATH)
>> -#LIBS_p += -L$(LTM_PATH)
>> -#endif
>> -# At the cost of about 4 kB of additional binary size, the internal 
>> LibTomMath
>> -# can be configured to include faster routines for exptmod, sqr, and 
>> div to
>> -# speed up DH and RSA calculation considerably
>> -#CONFIG_INTERNAL_LIBTOMMATH_FAST=y
>> -
>> -# Include NDIS event processing through WMI into wpa_supplicant/wpasvc.
>> -# This is only for Windows builds and requires WMI-related header 
>> files and
>> -# WbemUuid.Lib from Platform SDK even when building with MinGW.
>> -#CONFIG_NDIS_EVENTS_INTEGRATED=y
>> -#PLATFORMSDKLIB="/opt/Program Files/Microsoft Platform SDK/Lib"
>> -
>> -# Add support for old DBus control interface
>> -# (fi.epitest.hostap.WPASupplicant)
>> -#CONFIG_CTRL_IFACE_DBUS=y
>> -
>> -# Add support for new DBus control interface
>> -# (fi.w1.hostap.wpa_supplicant1)
>> -#CONFIG_CTRL_IFACE_DBUS_NEW=y
>> -
>> -# Add introspection support for new DBus control interface
>> -#CONFIG_CTRL_IFACE_DBUS_INTRO=y
>> -
>> -# Add support for loading EAP methods dynamically as shared libraries.
>> -# When this option is enabled, each EAP method can be either included
>> -# statically (CONFIG_EAP_<method>=y) or dynamically 
>> (CONFIG_EAP_<method>=dyn).
>> -# Dynamic EAP methods are build as shared objects (eap_*.so) and 
>> they need to
>> -# be loaded in the beginning of the wpa_supplicant configuration file
>> -# (see load_dynamic_eap parameter in the example file) before being 
>> used in
>> -# the network blocks.
>> -#
>> -# Note that some shared parts of EAP methods are included in the 
>> main program
>> -# and in order to be able to use dynamic EAP methods using these 
>> parts, the
>> -# main program must have been build with the EAP method enabled (=y 
>> or =dyn).
>> -# This means that EAP-TLS/PEAP/TTLS/FAST cannot be added as dynamic 
>> libraries
>> -# unless at least one of them was included in the main build to 
>> force inclusion
>> -# of the shared code. Similarly, at least one of EAP-SIM/AKA must be 
>> included
>> -# in the main build to be able to load these methods dynamically.
>> -#
>> -# Please also note that using dynamic libraries will increase the 
>> total binary
>> -# size. Thus, it may not be the best option for targets that have 
>> limited
>> -# amount of memory/flash.
>> -#CONFIG_DYNAMIC_EAP_METHODS=y
>> -
>> -# IEEE Std 802.11r-2008 (Fast BSS Transition)
>> -#CONFIG_IEEE80211R=y
>> -
>> -# Add support for writing debug log to a file 
>> (/tmp/wpa_supplicant-log-#.txt)
>> -#CONFIG_DEBUG_FILE=y
>> -
>> -# Enable privilege separation (see README 'Privilege separation' for 
>> details)
>> -#CONFIG_PRIVSEP=y
>> -
>> -# Enable mitigation against certain attacks against TKIP by delaying 
>> Michael
>> -# MIC error reports by a random amount of time between 0 and 60 seconds
>> -#CONFIG_DELAYED_MIC_ERROR_REPORT=y
>> -
>> -# Enable tracing code for developer debugging
>> -# This tracks use of memory allocations and other registrations and 
>> reports
>> -# incorrect use with a backtrace of call (or allocation) location.
>> -#CONFIG_WPA_TRACE=y
>> -# For BSD, comment out these.
>> -#LIBS += -lexecinfo
>> -#LIBS_p += -lexecinfo
>> -#LIBS_c += -lexecinfo
>> -
>> -# Use libbfd to get more details for developer debugging
>> -# This enables use of libbfd to get more detailed symbols for the 
>> backtraces
>> -# generated by CONFIG_WPA_TRACE=y.
>> -#CONFIG_WPA_TRACE_BFD=y
>> -# For BSD, comment out these.
>> -#LIBS += -lbfd -liberty -lz
>> -#LIBS_p += -lbfd -liberty -lz
>> -#LIBS_c += -lbfd -liberty -lz
>> -CONFIG_TLS = gnutls
>> -#CONFIG_GNUTLS_EXTRA=y
>> -CONFIG_CTRL_IFACE_DBUS=y
>> -CONFIG_CTRL_IFACE_DBUS_NEW=y
>> diff --git 
>> a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc 
>> b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc
>> index c2e3294..ccdc4c3 100644
>> --- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc
>> +++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc
>> @@ -9,11 +9,8 @@ LIC_FILES_CHKSUM = 
>> "file://../COPYING;md5=c54ce9345727175ff66d17b67ff51f58 \
>>   DEPENDS = "gnutls dbus libnl"
>>   RRECOMMENDS_${PN} = "wpa-supplicant-passphrase wpa-supplicant-cli"
>>
>> -# Check if GPLv3 build and select the correct file in configure
>> -require defconfig.inc
>> -
>>   SRC_URI = 
>> "http://hostap.epitest.fi/releases/wpa_supplicant-${PV}.tar.gz \
>> -           file://defconfig-gnutls${@get_defconfig(bb, d)} \
>> +           file://defconfig-gnutls \
>>              file://defaults-sane \
>>              file://wpa-supplicant.sh \
>>              file://wpa_supplicant.conf \
>> @@ -28,7 +25,7 @@ FILES_wpa-supplicant-cli = "${sbindir}/wpa_cli"
>>   FILES_${PN} += " ${datadir}/dbus-1/system-services/*
>>
>>   do_configure () {
>> -    install -m 0755 ${WORKDIR}/defconfig-gnutls${@get_defconfig(bb, 
>> d)} .config
>> +    install -m 0755 ${WORKDIR}/defconfig-gnutls .config
>>   }
>>
>>   export EXTRA_CFLAGS = "${CFLAGS}"


-- 
*Andrei Gherzan*
mobile +40.744.478.414  fax +40.031.816.28.12
Email: andrei@gherzan.ro

--------------000802040206090601020903
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    Yes it does. I will commit make another commit with pr changed as
    well. Thank you Sau.<br>
    <br>
    On 01/06/2012 09:47 AM, Saul Wold wrote:
    <blockquote cite="mid:4F06A6FB.30105@linux.intel.com" type="cite">On
      01/05/2012 01:30 PM, Andrei Gherzan wrote:
      <br>
      <blockquote type="cite">From: Andrei
        Gherzan<a class="moz-txt-link-rfc2396E" href="mailto:andrei.gherzan@windriver.com">&lt;andrei.gherzan@windriver.com&gt;</a>
        <br>
        <br>
        CONFIG_GNUTLS_EXTRA is needed as support for TLS/IA which was
        designed to be used
        <br>
        in the EAP-TTLSv1. As we don't see any requirement for that
        protocol today we decided
        <br>
        to remove it from wpa-supplicant .config file.
        <br>
        <br>
        [YOCTO #1845]
        <br>
        <br>
        Signed-off-by: Andrei Gherzan<a class="moz-txt-link-rfc2396E" href="mailto:andrei@gherzan.ro">&lt;andrei@gherzan.ro&gt;</a>
        <br>
        ---
        <br>
        &nbsp; .../wpa-supplicant/defconfig.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp; 4 -
        <br>
        &nbsp; .../wpa-supplicant-0.7.3/defconfig-gnutls&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp; 2 +-
        <br>
        &nbsp; .../wpa-supplicant-0.7.3/defconfig-gnutls-nogplv3&nbsp; |&nbsp; 409
        --------------------
        <br>
        &nbsp; .../wpa-supplicant/wpa-supplicant-0.7.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp; 7 +-
        <br>
        &nbsp; 4 files changed, 3 insertions(+), 419 deletions(-)
        <br>
        &nbsp; delete mode 100644
        meta/recipes-connectivity/wpa-supplicant/defconfig.inc
        <br>
        &nbsp; delete mode 100644
meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/defconfig-gnutls-nogplv3<br>
        <br>
      </blockquote>
      Is this missing a PR Bump?
      <br>
      <br>
      Sau!
      <br>
      <br>
      <blockquote type="cite">diff --git
        a/meta/recipes-connectivity/wpa-supplicant/defconfig.inc
        b/meta/recipes-connectivity/wpa-supplicant/defconfig.inc
        <br>
        deleted file mode 100644
        <br>
        index fdcbb43..0000000
        <br>
        --- a/meta/recipes-connectivity/wpa-supplicant/defconfig.inc
        <br>
        +++ /dev/null
        <br>
        @@ -1,4 +0,0 @@
        <br>
        -def get_defconfig(bb, d):
        <br>
        -&nbsp;&nbsp;&nbsp; if d.getVar('INCOMPATIBLE_LICENSE', 1) in [ 'GPLv3' ]:
        <br>
        -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return "-nogplv3"
        <br>
        -&nbsp;&nbsp;&nbsp; return ""
        <br>
        diff --git
        a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/defconfig-gnutls
b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/defconfig-gnutls
        <br>
        index c679e00..e03338f 100644
        <br>
        ---
a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/defconfig-gnutls<br>
        +++
b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/defconfig-gnutls<br>
        @@ -404,6 +404,6 @@ CONFIG_PEERKEY=y
        <br>
        &nbsp; #LIBS_p += -lbfd -liberty -lz
        <br>
        &nbsp; #LIBS_c += -lbfd -liberty -lz
        <br>
        &nbsp; CONFIG_TLS = gnutls
        <br>
        -CONFIG_GNUTLS_EXTRA=y
        <br>
        +#CONFIG_GNUTLS_EXTRA=y
        <br>
        &nbsp; CONFIG_CTRL_IFACE_DBUS=y
        <br>
        &nbsp; CONFIG_CTRL_IFACE_DBUS_NEW=y
        <br>
        diff --git
        a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/defconfig-gnutls-nogplv3
b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/defconfig-gnutls-nogplv3
        <br>
        deleted file mode 100644
        <br>
        index e03338f..0000000
        <br>
        ---
a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/defconfig-gnutls-nogplv3<br>
        +++ /dev/null
        <br>
        @@ -1,409 +0,0 @@
        <br>
        -# Example wpa_supplicant build time configuration
        <br>
        -#
        <br>
        -# This file lists the configuration options that are used when
        building the
        <br>
        -# hostapd binary. All lines starting with # are ignored.
        Configuration option
        <br>
        -# lines must be commented out complete, if they are not to be
        included, i.e.,
        <br>
        -# just setting VARIABLE=n is not disabling that variable.
        <br>
        -#
        <br>
        -# This file is included in Makefile, so variables like CFLAGS
        and LIBS can also
        <br>
        -# be modified from here. In most cases, these lines should use
        += in order not
        <br>
        -# to override previous values of the variables.
        <br>
        -
        <br>
        -
        <br>
        -# Uncomment following two lines and fix the paths if you have
        installed OpenSSL
        <br>
        -# or GnuTLS in non-default location
        <br>
        -#CFLAGS += -I/usr/local/openssl/include
        <br>
        -#LIBS += -L/usr/local/openssl/lib
        <br>
        -
        <br>
        -# Some Red Hat versions seem to include kerberos header files
        from OpenSSL, but
        <br>
        -# the kerberos files are not in the default include path.
        Following line can be
        <br>
        -# used to fix build issues on such systems (krb5.h not found).
        <br>
        -#CFLAGS += -I/usr/include/kerberos
        <br>
        -
        <br>
        -# Example configuration for various cross-compilation platforms
        <br>
        -
        <br>
        -#### sveasoft (e.g., for Linksys WRT54G)
        ######################################
        <br>
        -#CC=mipsel-uclibc-gcc
        <br>
        -#CC=/opt/brcm/hndtools-mipsel-uclibc/bin/mipsel-uclibc-gcc
        <br>
        -#CFLAGS += -Os
        <br>
        -#CPPFLAGS += -I../src/include
        -I../../src/router/openssl/include
        <br>
        -#LIBS += -L/opt/brcm/hndtools-mipsel-uclibc-0.9.19/lib -lssl
        <br>
-###############################################################################
        <br>
        -
        <br>
        -#### openwrt (e.g., for Linksys WRT54G)
        #######################################
        <br>
        -#CC=mipsel-uclibc-gcc
        <br>
        -#CC=/opt/brcm/hndtools-mipsel-uclibc/bin/mipsel-uclibc-gcc
        <br>
        -#CFLAGS += -Os
        <br>
        -#CPPFLAGS=-I../src/include -I../openssl-0.9.7d/include \
        <br>
        -#&nbsp;&nbsp;&nbsp; -I../WRT54GS/release/src/include
        <br>
        -#LIBS = -lssl
        <br>
-###############################################################################
        <br>
        -
        <br>
        -
        <br>
        -# Driver interface for Host AP driver
        <br>
        -CONFIG_DRIVER_HOSTAP=y
        <br>
        -
        <br>
        -# Driver interface for Agere driver
        <br>
        -#CONFIG_DRIVER_HERMES=y
        <br>
        -# Change include directories to match with the local setup
        <br>
        -#CFLAGS += -I../../hcf -I../../include -I../../include/hcf
        <br>
        -#CFLAGS += -I../../include/wireless
        <br>
        -
        <br>
        -# Driver interface for madwifi driver
        <br>
        -# Deprecated; use CONFIG_DRIVER_WEXT=y instead.
        <br>
        -#CONFIG_DRIVER_MADWIFI=y
        <br>
        -# Set include directory to the madwifi source tree
        <br>
        -#CFLAGS += -I../../madwifi
        <br>
        -
        <br>
        -# Driver interface for ndiswrapper
        <br>
        -# Deprecated; use CONFIG_DRIVER_WEXT=y instead.
        <br>
        -#CONFIG_DRIVER_NDISWRAPPER=y
        <br>
        -
        <br>
        -# Driver interface for Atmel driver
        <br>
        -# CONFIG_DRIVER_ATMEL=y
        <br>
        -
        <br>
        -# Driver interface for old Broadcom driver
        <br>
        -# Please note that the newer Broadcom driver ("hybrid Linux
        driver") supports
        <br>
        -# Linux wireless extensions and does not need (or even work)
        with the old
        <br>
        -# driver wrapper. Use CONFIG_DRIVER_WEXT=y with that driver.
        <br>
        -#CONFIG_DRIVER_BROADCOM=y
        <br>
        -# Example path for wlioctl.h; change to match your
        configuration
        <br>
        -#CFLAGS += -I/opt/WRT54GS/release/src/include
        <br>
        -
        <br>
        -# Driver interface for Intel ipw2100/2200 driver
        <br>
        -# Deprecated; use CONFIG_DRIVER_WEXT=y instead.
        <br>
        -#CONFIG_DRIVER_IPW=y
        <br>
        -
        <br>
        -# Driver interface for Ralink driver
        <br>
        -#CONFIG_DRIVER_RALINK=y
        <br>
        -
        <br>
        -# Driver interface for generic Linux wireless extensions
        <br>
        -CONFIG_DRIVER_WEXT=y
        <br>
        -
        <br>
        -# Driver interface for Linux drivers using the nl80211 kernel
        interface
        <br>
        -CONFIG_LIBNL20=y
        <br>
        -CONFIG_DRIVER_NL80211=y
        <br>
        -
        <br>
        -# Driver interface for FreeBSD net80211 layer (e.g., Atheros
        driver)
        <br>
        -#CONFIG_DRIVER_BSD=y
        <br>
        -#CFLAGS += -I/usr/local/include
        <br>
        -#LIBS += -L/usr/local/lib
        <br>
        -#LIBS_p += -L/usr/local/lib
        <br>
        -#LIBS_c += -L/usr/local/lib
        <br>
        -
        <br>
        -# Driver interface for Windows NDIS
        <br>
        -#CONFIG_DRIVER_NDIS=y
        <br>
        -#CFLAGS += -I/usr/include/w32api/ddk
        <br>
        -#LIBS += -L/usr/local/lib
        <br>
        -# For native build using mingw
        <br>
        -#CONFIG_NATIVE_WINDOWS=y
        <br>
        -# Additional directories for cross-compilation on Linux host
        for mingw target
        <br>
        -#CFLAGS += -I/opt/mingw/mingw32/include/ddk
        <br>
        -#LIBS += -L/opt/mingw/mingw32/lib
        <br>
        -#CC=mingw32-gcc
        <br>
        -# By default, driver_ndis uses WinPcap for low-level
        operations. This can be
        <br>
        -# replaced with the following option which replaces WinPcap
        calls with NDISUIO.
        <br>
        -# However, this requires that WZC is disabled (net stop wzcsvc)
        before starting
        <br>
        -# wpa_supplicant.
        <br>
        -# CONFIG_USE_NDISUIO=y
        <br>
        -
        <br>
        -# Driver interface for development testing
        <br>
        -#CONFIG_DRIVER_TEST=y
        <br>
        -
        <br>
        -# Include client MLME (management frame processing) for test
        driver
        <br>
        -# This can be used to test MLME operations in hostapd with the
        test interface.
        <br>
        -# space.
        <br>
        -#CONFIG_CLIENT_MLME=y
        <br>
        -
        <br>
        -# Driver interface for wired Ethernet drivers
        <br>
        -CONFIG_DRIVER_WIRED=y
        <br>
        -
        <br>
        -# Driver interface for the Broadcom RoboSwitch family
        <br>
        -#CONFIG_DRIVER_ROBOSWITCH=y
        <br>
        -
        <br>
        -# Driver interface for no driver (e.g., WPS ER only)
        <br>
        -#CONFIG_DRIVER_NONE=y
        <br>
        -
        <br>
        -# Enable IEEE 802.1X Supplicant (automatically included if any
        EAP method is
        <br>
        -# included)
        <br>
        -CONFIG_IEEE8021X_EAPOL=y
        <br>
        -
        <br>
        -# EAP-MD5
        <br>
        -CONFIG_EAP_MD5=y
        <br>
        -
        <br>
        -# EAP-MSCHAPv2
        <br>
        -CONFIG_EAP_MSCHAPV2=y
        <br>
        -
        <br>
        -# EAP-TLS
        <br>
        -CONFIG_EAP_TLS=y
        <br>
        -
        <br>
        -# EAL-PEAP
        <br>
        -CONFIG_EAP_PEAP=y
        <br>
        -
        <br>
        -# EAP-TTLS
        <br>
        -CONFIG_EAP_TTLS=y
        <br>
        -
        <br>
        -# EAP-FAST
        <br>
        -# Note: Default OpenSSL package does not include support for
        all the
        <br>
        -# functionality needed for EAP-FAST. If EAP-FAST is enabled
        with OpenSSL,
        <br>
        -# the OpenSSL library must be patched
        (openssl-0.9.8d-tls-extensions.patch)
        <br>
        -# to add the needed functions.
        <br>
        -#CONFIG_EAP_FAST=y
        <br>
        -
        <br>
        -# EAP-GTC
        <br>
        -CONFIG_EAP_GTC=y
        <br>
        -
        <br>
        -# EAP-OTP
        <br>
        -CONFIG_EAP_OTP=y
        <br>
        -
        <br>
        -# EAP-SIM (enable CONFIG_PCSC, if EAP-SIM is used)
        <br>
        -#CONFIG_EAP_SIM=y
        <br>
        -
        <br>
        -# EAP-PSK (experimental; this is _not_ needed for WPA-PSK)
        <br>
        -#CONFIG_EAP_PSK=y
        <br>
        -
        <br>
        -# EAP-PAX
        <br>
        -#CONFIG_EAP_PAX=y
        <br>
        -
        <br>
        -# LEAP
        <br>
        -CONFIG_EAP_LEAP=y
        <br>
        -
        <br>
        -# EAP-AKA (enable CONFIG_PCSC, if EAP-AKA is used)
        <br>
        -#CONFIG_EAP_AKA=y
        <br>
        -
        <br>
        -# EAP-AKA' (enable CONFIG_PCSC, if EAP-AKA' is used).
        <br>
        -# This requires CONFIG_EAP_AKA to be enabled, too.
        <br>
        -#CONFIG_EAP_AKA_PRIME=y
        <br>
        -
        <br>
        -# Enable USIM simulator (Milenage) for EAP-AKA
        <br>
        -#CONFIG_USIM_SIMULATOR=y
        <br>
        -
        <br>
        -# EAP-SAKE
        <br>
        -#CONFIG_EAP_SAKE=y
        <br>
        -
        <br>
        -# EAP-GPSK
        <br>
        -#CONFIG_EAP_GPSK=y
        <br>
        -# Include support for optional SHA256 cipher suite in EAP-GPSK
        <br>
        -#CONFIG_EAP_GPSK_SHA256=y
        <br>
        -
        <br>
        -# EAP-TNC and related Trusted Network Connect support
        (experimental)
        <br>
        -#CONFIG_EAP_TNC=y
        <br>
        -
        <br>
        -# Wi-Fi Protected Setup (WPS)
        <br>
        -#CONFIG_WPS=y
        <br>
        -
        <br>
        -# EAP-IKEv2
        <br>
        -#CONFIG_EAP_IKEV2=y
        <br>
        -
        <br>
        -# PKCS#12 (PFX) support (used to read private key and
        certificate file from
        <br>
        -# a file that usually has extension .p12 or .pfx)
        <br>
        -CONFIG_PKCS12=y
        <br>
        -
        <br>
        -# Smartcard support (i.e., private key on a smartcard), e.g.,
        with openssl
        <br>
        -# engine.
        <br>
        -CONFIG_SMARTCARD=y
        <br>
        -
        <br>
        -# PC/SC interface for smartcards (USIM, GSM SIM)
        <br>
        -# Enable this if EAP-SIM or EAP-AKA is included
        <br>
        -#CONFIG_PCSC=y
        <br>
        -
        <br>
        -# Development testing
        <br>
        -#CONFIG_EAPOL_TEST=y
        <br>
        -
        <br>
        -# Select control interface backend for external programs, e.g,
        wpa_cli:
        <br>
        -# unix = UNIX domain sockets (default for Linux/*BSD)
        <br>
        -# udp = UDP sockets using localhost (127.0.0.1)
        <br>
        -# named_pipe = Windows Named Pipe (default for Windows)
        <br>
        -# y = use default (backwards compatibility)
        <br>
        -# If this option is commented out, control interface is not
        included in the
        <br>
        -# build.
        <br>
        -CONFIG_CTRL_IFACE=y
        <br>
        -
        <br>
        -# Include support for GNU Readline and History Libraries in
        wpa_cli.
        <br>
        -# When building a wpa_cli binary for distribution, please note
        that these
        <br>
        -# libraries are licensed under GPL and as such, BSD license may
        not apply for
        <br>
        -# the resulting binary.
        <br>
        -#CONFIG_READLINE=y
        <br>
        -
        <br>
        -# Remove debugging code that is printing out debug message to
        stdout.
        <br>
        -# This can be used to reduce the size of the wpa_supplicant
        considerably
        <br>
        -# if debugging code is not needed. The size reduction can be
        around 35%
        <br>
        -# (e.g., 90 kB).
        <br>
        -#CONFIG_NO_STDOUT_DEBUG=y
        <br>
        -
        <br>
        -# Remove WPA support, e.g., for wired-only IEEE 802.1X
        supplicant, to save
        <br>
        -# 35-50 kB in code size.
        <br>
        -#CONFIG_NO_WPA=y
        <br>
        -
        <br>
        -# Remove WPA2 support. This allows WPA to be used, but removes
        WPA2 code to
        <br>
        -# save about 1 kB in code size when building only WPA-Personal
        (no EAP support)
        <br>
        -# or 6 kB if building for WPA-Enterprise.
        <br>
        -#CONFIG_NO_WPA2=y
        <br>
        -
        <br>
        -# Remove IEEE 802.11i/WPA-Personal ASCII passphrase support
        <br>
        -# This option can be used to reduce code size by removing
        support for
        <br>
        -# converting ASCII passphrases into PSK. If this functionality
        is removed, the
        <br>
        -# PSK can only be configured as the 64-octet hexstring (e.g.,
        from
        <br>
        -# wpa_passphrase). This saves about 0.5 kB in code size.
        <br>
        -#CONFIG_NO_WPA_PASSPHRASE=y
        <br>
        -
        <br>
        -# Disable scan result processing (ap_mode=1) to save code size
        by about 1 kB.
        <br>
        -# This can be used if ap_scan=1 mode is never enabled.
        <br>
        -#CONFIG_NO_SCAN_PROCESSING=y
        <br>
        -
        <br>
        -# Select configuration backend:
        <br>
        -# file = text file (e.g., wpa_supplicant.conf; note: the
        configuration file
        <br>
        -#&nbsp;&nbsp;&nbsp; path is given on command line, not here; this option is
        just used to
        <br>
        -#&nbsp;&nbsp;&nbsp; select the backend that allows configuration files to be
        used)
        <br>
        -# winreg = Windows registry (see win_example.reg for an
        example)
        <br>
        -CONFIG_BACKEND=file
        <br>
        -
        <br>
        -# Remove configuration write functionality (i.e., to allow the
        configuration
        <br>
        -# file to be updated based on runtime configuration changes).
        The runtime
        <br>
        -# configuration can still be changed, the changes are just not
        going to be
        <br>
        -# persistent over restarts. This option can be used to reduce
        code size by
        <br>
        -# about 3.5 kB.
        <br>
        -#CONFIG_NO_CONFIG_WRITE=y
        <br>
        -
        <br>
        -# Remove support for configuration blobs to reduce code size by
        about 1.5 kB.
        <br>
        -#CONFIG_NO_CONFIG_BLOBS=y
        <br>
        -
        <br>
        -# Select program entry point implementation:
        <br>
        -# main = UNIX/POSIX like main() function (default)
        <br>
        -# main_winsvc = Windows service (read parameters from registry)
        <br>
        -# main_none = Very basic example (development use only)
        <br>
        -#CONFIG_MAIN=main
        <br>
        -
        <br>
        -# Select wrapper for operatins system and C library specific
        functions
        <br>
        -# unix = UNIX/POSIX like systems (default)
        <br>
        -# win32 = Windows systems
        <br>
        -# none = Empty template
        <br>
        -#CONFIG_OS=unix
        <br>
        -
        <br>
        -# Select event loop implementation
        <br>
        -# eloop = select() loop (default)
        <br>
        -# eloop_win = Windows events and WaitForMultipleObject() loop
        <br>
        -# eloop_none = Empty template
        <br>
        -#CONFIG_ELOOP=eloop
        <br>
        -
        <br>
        -# Select layer 2 packet implementation
        <br>
        -# linux = Linux packet socket (default)
        <br>
        -# pcap = libpcap/libdnet/WinPcap
        <br>
        -# freebsd = FreeBSD libpcap
        <br>
        -# winpcap = WinPcap with receive thread
        <br>
        -# ndis = Windows NDISUIO (note: requires CONFIG_USE_NDISUIO=y)
        <br>
        -# none = Empty template
        <br>
        -#CONFIG_L2_PACKET=linux
        <br>
        -
        <br>
        -# PeerKey handshake for Station to Station Link (IEEE 802.11e
        DLS)
        <br>
        -CONFIG_PEERKEY=y
        <br>
        -
        <br>
        -# IEEE 802.11w (management frame protection)
        <br>
        -# This version is an experimental implementation based on IEEE
        802.11w/D1.0
        <br>
        -# draft and is subject to change since the standard has not yet
        been finalized.
        <br>
        -# Driver support is also needed for IEEE 802.11w.
        <br>
        -#CONFIG_IEEE80211W=y
        <br>
        -
        <br>
        -# Select TLS implementation
        <br>
        -# openssl = OpenSSL (default)
        <br>
        -# gnutls = GnuTLS (needed for TLS/IA, see also
        CONFIG_GNUTLS_EXTRA)
        <br>
        -# internal = Internal TLSv1 implementation (experimental)
        <br>
        -# none = Empty template
        <br>
        -#CONFIG_TLS=openssl
        <br>
        -
        <br>
        -# Whether to enable TLS/IA support, which is required for
        EAP-TTLSv1.
        <br>
        -# You need CONFIG_TLS=gnutls for this to have any effect.
        Please note that
        <br>
        -# even though the core GnuTLS library is released under LGPL,
        this extra
        <br>
        -# library uses GPL and as such, the terms of GPL apply to the
        combination
        <br>
        -# of wpa_supplicant and GnuTLS if this option is enabled. BSD
        license may not
        <br>
        -# apply for distribution of the resulting binary.
        <br>
        -#CONFIG_GNUTLS_EXTRA=y
        <br>
        -
        <br>
        -# If CONFIG_TLS=internal is used, additional library and
        include paths are
        <br>
        -# needed for LibTomMath. Alternatively, an integrated, minimal
        version of
        <br>
        -# LibTomMath can be used. See beginning of libtommath.c for
        details on benefits
        <br>
        -# and drawbacks of this option.
        <br>
        -#CONFIG_INTERNAL_LIBTOMMATH=y
        <br>
        -#ifndef CONFIG_INTERNAL_LIBTOMMATH
        <br>
        -#LTM_PATH=/usr/src/libtommath-0.39
        <br>
        -#CFLAGS += -I$(LTM_PATH)
        <br>
        -#LIBS += -L$(LTM_PATH)
        <br>
        -#LIBS_p += -L$(LTM_PATH)
        <br>
        -#endif
        <br>
        -# At the cost of about 4 kB of additional binary size, the
        internal LibTomMath
        <br>
        -# can be configured to include faster routines for exptmod,
        sqr, and div to
        <br>
        -# speed up DH and RSA calculation considerably
        <br>
        -#CONFIG_INTERNAL_LIBTOMMATH_FAST=y
        <br>
        -
        <br>
        -# Include NDIS event processing through WMI into
        wpa_supplicant/wpasvc.
        <br>
        -# This is only for Windows builds and requires WMI-related
        header files and
        <br>
        -# WbemUuid.Lib from Platform SDK even when building with MinGW.
        <br>
        -#CONFIG_NDIS_EVENTS_INTEGRATED=y
        <br>
        -#PLATFORMSDKLIB="/opt/Program Files/Microsoft Platform SDK/Lib"
        <br>
        -
        <br>
        -# Add support for old DBus control interface
        <br>
        -# (fi.epitest.hostap.WPASupplicant)
        <br>
        -#CONFIG_CTRL_IFACE_DBUS=y
        <br>
        -
        <br>
        -# Add support for new DBus control interface
        <br>
        -# (fi.w1.hostap.wpa_supplicant1)
        <br>
        -#CONFIG_CTRL_IFACE_DBUS_NEW=y
        <br>
        -
        <br>
        -# Add introspection support for new DBus control interface
        <br>
        -#CONFIG_CTRL_IFACE_DBUS_INTRO=y
        <br>
        -
        <br>
        -# Add support for loading EAP methods dynamically as shared
        libraries.
        <br>
        -# When this option is enabled, each EAP method can be either
        included
        <br>
        -# statically (CONFIG_EAP_&lt;method&gt;=y) or dynamically
        (CONFIG_EAP_&lt;method&gt;=dyn).
        <br>
        -# Dynamic EAP methods are build as shared objects (eap_*.so)
        and they need to
        <br>
        -# be loaded in the beginning of the wpa_supplicant
        configuration file
        <br>
        -# (see load_dynamic_eap parameter in the example file) before
        being used in
        <br>
        -# the network blocks.
        <br>
        -#
        <br>
        -# Note that some shared parts of EAP methods are included in
        the main program
        <br>
        -# and in order to be able to use dynamic EAP methods using
        these parts, the
        <br>
        -# main program must have been build with the EAP method enabled
        (=y or =dyn).
        <br>
        -# This means that EAP-TLS/PEAP/TTLS/FAST cannot be added as
        dynamic libraries
        <br>
        -# unless at least one of them was included in the main build to
        force inclusion
        <br>
        -# of the shared code. Similarly, at least one of EAP-SIM/AKA
        must be included
        <br>
        -# in the main build to be able to load these methods
        dynamically.
        <br>
        -#
        <br>
        -# Please also note that using dynamic libraries will increase
        the total binary
        <br>
        -# size. Thus, it may not be the best option for targets that
        have limited
        <br>
        -# amount of memory/flash.
        <br>
        -#CONFIG_DYNAMIC_EAP_METHODS=y
        <br>
        -
        <br>
        -# IEEE Std 802.11r-2008 (Fast BSS Transition)
        <br>
        -#CONFIG_IEEE80211R=y
        <br>
        -
        <br>
        -# Add support for writing debug log to a file
        (/tmp/wpa_supplicant-log-#.txt)
        <br>
        -#CONFIG_DEBUG_FILE=y
        <br>
        -
        <br>
        -# Enable privilege separation (see README 'Privilege
        separation' for details)
        <br>
        -#CONFIG_PRIVSEP=y
        <br>
        -
        <br>
        -# Enable mitigation against certain attacks against TKIP by
        delaying Michael
        <br>
        -# MIC error reports by a random amount of time between 0 and 60
        seconds
        <br>
        -#CONFIG_DELAYED_MIC_ERROR_REPORT=y
        <br>
        -
        <br>
        -# Enable tracing code for developer debugging
        <br>
        -# This tracks use of memory allocations and other registrations
        and reports
        <br>
        -# incorrect use with a backtrace of call (or allocation)
        location.
        <br>
        -#CONFIG_WPA_TRACE=y
        <br>
        -# For BSD, comment out these.
        <br>
        -#LIBS += -lexecinfo
        <br>
        -#LIBS_p += -lexecinfo
        <br>
        -#LIBS_c += -lexecinfo
        <br>
        -
        <br>
        -# Use libbfd to get more details for developer debugging
        <br>
        -# This enables use of libbfd to get more detailed symbols for
        the backtraces
        <br>
        -# generated by CONFIG_WPA_TRACE=y.
        <br>
        -#CONFIG_WPA_TRACE_BFD=y
        <br>
        -# For BSD, comment out these.
        <br>
        -#LIBS += -lbfd -liberty -lz
        <br>
        -#LIBS_p += -lbfd -liberty -lz
        <br>
        -#LIBS_c += -lbfd -liberty -lz
        <br>
        -CONFIG_TLS = gnutls
        <br>
        -#CONFIG_GNUTLS_EXTRA=y
        <br>
        -CONFIG_CTRL_IFACE_DBUS=y
        <br>
        -CONFIG_CTRL_IFACE_DBUS_NEW=y
        <br>
        diff --git
        a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc
b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc
        <br>
        index c2e3294..ccdc4c3 100644
        <br>
        ---
        a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc
        <br>
        +++
        b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc
        <br>
        @@ -9,11 +9,8 @@ LIC_FILES_CHKSUM =
        "<a class="moz-txt-link-freetext" href="file://../COPYING;md5=c54ce9345727175ff66d17b67ff51f58">file://../COPYING;md5=c54ce9345727175ff66d17b67ff51f58</a> \
        <br>
        &nbsp; DEPENDS = "gnutls dbus libnl"
        <br>
        &nbsp; RRECOMMENDS_${PN} = "wpa-supplicant-passphrase
        wpa-supplicant-cli"
        <br>
        <br>
        -# Check if GPLv3 build and select the correct file in configure
        <br>
        -require defconfig.inc
        <br>
        -
        <br>
        &nbsp; SRC_URI =
        "<a class="moz-txt-link-freetext" href="http://hostap.epitest.fi/releases/wpa_supplicant-$">http://hostap.epitest.fi/releases/wpa_supplicant-$</a>{PV}.tar.gz \
        <br>
        -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a class="moz-txt-link-freetext" href="file://defconfig-gnutls$">file://defconfig-gnutls$</a>{@get_defconfig(bb, d)} \
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a class="moz-txt-link-freetext" href="file://defconfig-gnutls">file://defconfig-gnutls</a> \
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a class="moz-txt-link-freetext" href="file://defaults-sane">file://defaults-sane</a> \
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a class="moz-txt-link-freetext" href="file://wpa-supplicant.sh">file://wpa-supplicant.sh</a> \
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a class="moz-txt-link-freetext" href="file://wpa_supplicant.conf">file://wpa_supplicant.conf</a> \
        <br>
        @@ -28,7 +25,7 @@ FILES_wpa-supplicant-cli =
        "${sbindir}/wpa_cli"
        <br>
        &nbsp; FILES_${PN} += " ${datadir}/dbus-1/system-services/*
        <br>
        <br>
        &nbsp; do_configure () {
        <br>
        -&nbsp;&nbsp;&nbsp; install -m 0755
        ${WORKDIR}/defconfig-gnutls${@get_defconfig(bb, d)} .config
        <br>
        +&nbsp;&nbsp;&nbsp; install -m 0755 ${WORKDIR}/defconfig-gnutls .config
        <br>
        &nbsp; }
        <br>
        <br>
        &nbsp; export EXTRA_CFLAGS = "${CFLAGS}"
        <br>
      </blockquote>
    </blockquote>
    <br>
    <br>
    <div class="moz-signature">-- <br>
      <title>work Signature</title>
      <meta http-equiv="Content-Type" content="text/html;
        charset=ISO-8859-1">
      <meta content="MSHTML 6.00.5730.11" name="GENERATOR">
      <style type="text/css">
<!--
a {
	font-family: Arial, Helvetica, sans-serif;
	color: #cc0000;
	text-decoration: none;
}
-->
</style>
      <div vertical-align="middle" align="left"><font color="#333333"
          face="Arial" size="-1"> <strong>Andrei Gherzan</strong></font><br>
        <font color="#333333" face="Arial" size="-1"> mobile
          +40.744.478.414&nbsp;&nbsp;fax +40.031.816.28.12</font><br>
        <font color="#333333" face="Arial" size="-1"> Email:
          <a class="moz-txt-link-abbreviated" href="mailto:andrei@gherzan.ro">andrei@gherzan.ro</a></font><br>
      </div>
    </div>
  </body>
</html>

--------------000802040206090601020903--
