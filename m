Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9347860B60
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2013 12:14:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9VCEv3u019669
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 31 Oct 2013 05:14:57 -0700 (PDT)
Received: from [128.224.162.168] (128.224.162.168) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Thu, 31 Oct 2013 05:14:57 -0700
Message-ID: <527249C1.8070304@windriver.com>
Date: Thu, 31 Oct 2013 20:14:57 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1383181191-17015-1-git-send-email-rongqing.li@windriver.com>
	<20131031081225.GD32015@jama>
In-Reply-To: <20131031081225.GD32015@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bluez: declaration of virtual/bluez
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
X-List-Received-Date: Thu, 31 Oct 2013 12:14:57 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 10/31/2013 04:12 PM, Martin Jansa wrote:
> On Thu, Oct 31, 2013 at 08:59:51AM +0800, rongqing.li@windriver.com wrote:
>> From: Roy Li <rongqing.li@windriver.com>
>>
>> We have two version bluez, declare virtual/bluez to switch them easily,
>> and set the preferred provider for bluez as bluez4
>
> virtual/bluez and PREFERRED_PROVIDERS doesn't work for runtime
> dependencies, you need to use VIRTUAL_RUNTIME_bluez for runtime deps and
> virtual/bluez only for build time.
>

Thanks

-Roy

>>
>> Signed-off-by: Roy Li <rongqing.li@windriver.com>
>> ---
>>   meta/conf/distro/include/default-providers.inc                    |    4 +---
>>   meta/recipes-connectivity/bluez/bluez4.inc                        |    2 ++
>>   meta/recipes-connectivity/bluez5/bluez5.inc                       |    2 ++
>>   meta/recipes-connectivity/connman/connman.inc                     |    4 ++--
>>   meta/recipes-connectivity/libpcap/libpcap.inc                     |    2 +-
>>   meta/recipes-connectivity/neard/neard.inc                         |    2 +-
>>   meta/recipes-connectivity/ofono/ofono.inc                         |    2 +-
>>   meta/recipes-core/packagegroups/packagegroup-base.bb              |    2 +-
>>   meta/recipes-gnome/packagegroups/packagegroup-sdk-gmae.inc        |    2 +-
>>   meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb |    2 +-
>>   meta/recipes-multimedia/pulseaudio/pulseaudio.inc                 |    2 +-
>>   meta/recipes-qt/qt4/qt-mobility_1.2.0.inc                         |    2 +-
>>   12 files changed, 15 insertions(+), 13 deletions(-)
>>
>> diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
>> index d4b9db0..9dc0310 100644
>> --- a/meta/conf/distro/include/default-providers.inc
>> +++ b/meta/conf/distro/include/default-providers.inc
>> @@ -14,6 +14,7 @@ PREFERRED_PROVIDER_virtual/update-alternatives ?= "opkg"
>>   PREFERRED_PROVIDER_virtual/update-alternatives-native ?= "opkg-native"
>>   PREFERRED_PROVIDER_virtual/libx11 ?= "libx11"
>>   PREFERRED_PROVIDER_xf86-video-intel ?= "xf86-video-intel"
>> +PREFERRED_PROVIDER_virtual/bluez ?= "bluez4"
>>
>>   #
>>   # Default virtual runtime providers
>> @@ -40,6 +41,3 @@ PREFERRED_PROVIDER_console-tools ?= "kbd"
>>   PREFERRED_PROVIDER_gzip-native ?= "pigz-native"
>>   PREFERRED_PROVIDER_make ?= "make"
>>   PREFERRED_PROVIDER_udev ?= "${@base_contains('DISTRO_FEATURES','systemd','systemd','udev',d)}"
>> -# There are issues with runtime packages and PREFERRED_PROVIDER, see YOCTO #5044 for details
>> -# on this rather strange entry.
>> -PREFERRED_PROVIDER_bluez4 ?= "bluez4"
>> diff --git a/meta/recipes-connectivity/bluez/bluez4.inc b/meta/recipes-connectivity/bluez/bluez4.inc
>> index e4f6834..8ef1d2b 100644
>> --- a/meta/recipes-connectivity/bluez/bluez4.inc
>> +++ b/meta/recipes-connectivity/bluez/bluez4.inc
>> @@ -9,6 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
>>                       file://sbc/sbc.c;beginline=1;endline=25;md5=1a40781ed30d50d8639323a184aeb191"
>>   DEPENDS = "udev libusb dbus-glib glib-2.0 libcheck readline"
>>   RDEPENDS_${PN}-dev = "bluez-hcidump"
>> +PROVIDES += "virtual/bluez"
>> +RPROVIDES_${PN} = "virtual/bluez"
>>
>>   PACKAGECONFIG ??= "\
>>       ${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}\
>> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
>> index 2e25d86..d21c8a2 100644
>> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
>> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
>> @@ -7,6 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
>>                       file://COPYING.LIB;md5=fb504b67c50331fc78734fed90fb0e09 \
>>                       file://src/main.c;beginline=1;endline=24;md5=9bc54b93cd7e17bf03f52513f39f926e"
>>   DEPENDS = "udev libusb dbus-glib glib-2.0 libcheck readline"
>> +PROVIDES += "virtual/bluez"
>> +RPROVIDES_${PN} = "virtual/bluez"
>>
>>   RCONFLICTS_${PN} = "bluez4"
>>
>> diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
>> index 12f3edd..a66c524 100644
>> --- a/meta/recipes-connectivity/connman/connman.inc
>> +++ b/meta/recipes-connectivity/connman/connman.inc
>> @@ -41,7 +41,7 @@ PACKAGECONFIG ??= "wispr \
>>   # PACKAGECONFIG_append_pn-connman = " openvpn vpnc l2tp pptp"
>>
>>   PACKAGECONFIG[wifi] = "--enable-wifi, --disable-wifi, wpa-supplicant"
>> -PACKAGECONFIG[bluetooth] = "--enable-bluetooth, --disable-bluetooth, bluez4"
>> +PACKAGECONFIG[bluetooth] = "--enable-bluetooth, --disable-bluetooth, virtual/bluez"
>>   PACKAGECONFIG[3g] = "--enable-ofono, --disable-ofono, ofono"
>>   PACKAGECONFIG[tist] = "--enable-tist,--disable-tist,"
>>   PACKAGECONFIG[openvpn] = "--enable-openvpn --with-openvpn=${sbindir}/openvpn,--disable-openvpn,,openvpn"
>> @@ -114,7 +114,7 @@ RPROVIDES_${PN} = "\
>>
>>   RDEPENDS_${PN} = "\
>>   	dbus \
>> -	${@base_contains('PACKAGECONFIG', 'bluetooth', 'bluez4', '', d)} \
>> +	${@base_contains('PACKAGECONFIG', 'bluetooth', 'virtual/bluez', '', d)} \
>>   	${@base_contains('PACKAGECONFIG', 'wifi','wpa-supplicant', '', d)} \
>>   	${@base_contains('PACKAGECONFIG', '3g','ofono', '', d)} \
>>   	xuser-account \
>> diff --git a/meta/recipes-connectivity/libpcap/libpcap.inc b/meta/recipes-connectivity/libpcap/libpcap.inc
>> index 3a08afe..3a67ecc 100644
>> --- a/meta/recipes-connectivity/libpcap/libpcap.inc
>> +++ b/meta/recipes-connectivity/libpcap/libpcap.inc
>> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1d4b0366557951c84a94fabe3529f867 \
>>   DEPENDS = "flex-native bison-native libnl"
>>
>>   PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'bluetooth', 'bluetooth', '', d)}"
>> -PACKAGECONFIG[bluetooth] = "--enable-bluetooth,--disable-bluetooth,bluez4"
>> +PACKAGECONFIG[bluetooth] = "--enable-bluetooth,--disable-bluetooth,virtual/bluez"
>>   PACKAGECONFIG[canusb] = "--enable-canusb,--enable-canusb=no,libusb"
>>
>>   INC_PR = "r5"
>> diff --git a/meta/recipes-connectivity/neard/neard.inc b/meta/recipes-connectivity/neard/neard.inc
>> index 7cccbdc..1d27c10 100644
>> --- a/meta/recipes-connectivity/neard/neard.inc
>> +++ b/meta/recipes-connectivity/neard/neard.inc
>> @@ -47,7 +47,7 @@ RDEPENDS_${PN} = "dbus python python-dbus python-pygobject"
>>
>>   # Bluez & Wifi are not mandatory except for handover
>>   RRECOMMENDS_${PN} = "\
>> -                     ${@base_contains('DISTRO_FEATURES', 'bluetooth', 'bluez4', '', d)} \
>> +                     ${@base_contains('DISTRO_FEATURES', 'bluetooth', 'virtual/bluez', '', d)} \
>>                        ${@base_contains('DISTRO_FEATURES', 'wifi','wpa-supplicant', '', d)} \
>>                       "
>>
>> diff --git a/meta/recipes-connectivity/ofono/ofono.inc b/meta/recipes-connectivity/ofono/ofono.inc
>> index 3972e06..ff34265 100644
>> --- a/meta/recipes-connectivity/ofono/ofono.inc
>> +++ b/meta/recipes-connectivity/ofono/ofono.inc
>> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
>>
>>   inherit autotools pkgconfig update-rc.d systemd
>>
>> -DEPENDS  = "dbus glib-2.0 udev mobile-broadband-provider-info ${@base_contains('DISTRO_FEATURES', 'bluetooth','bluez4', '', d)}"
>> +DEPENDS  = "dbus glib-2.0 udev mobile-broadband-provider-info ${@base_contains('DISTRO_FEATURES', 'bluetooth','virtual/bluez', '', d)}"
>>
>>   INITSCRIPT_NAME = "ofono"
>>   INITSCRIPT_PARAMS = "defaults 22"
>> diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
>> index eee8bd9..e9e46f4 100644
>> --- a/meta/recipes-core/packagegroups/packagegroup-base.bb
>> +++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
>> @@ -210,7 +210,7 @@ RRECOMMENDS_packagegroup-base-pcmcia = "\
>>
>>   SUMMARY_packagegroup-base-bluetooth = "Bluetooth support"
>>   RDEPENDS_packagegroup-base-bluetooth = "\
>> -    bluez4 \
>> +    virtual/bluez \
>>       ${@base_contains('COMBINED_FEATURES', 'alsa', 'libasound-module-bluez', '',d)} \
>>       "
>>
>> diff --git a/meta/recipes-gnome/packagegroups/packagegroup-sdk-gmae.inc b/meta/recipes-gnome/packagegroups/packagegroup-sdk-gmae.inc
>> index 416e05d..e1a520a 100644
>> --- a/meta/recipes-gnome/packagegroups/packagegroup-sdk-gmae.inc
>> +++ b/meta/recipes-gnome/packagegroups/packagegroup-sdk-gmae.inc
>> @@ -3,7 +3,7 @@ SDK-GMAE = " \
>>       dbus-glib-dev \
>>       gtk+-dev \
>>       gstreamer-dev \
>> -    bluez4-dev \
>> +    virtual/bluez-dev \
>>       gconf-dev \
>>       avahi-dev \
>>       telepathy-glib-dev \
>> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
>> index e1a5904..8f37be8 100644
>> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
>> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
>> @@ -11,7 +11,7 @@ S = "${WORKDIR}/git"
>>
>>   SRCREV = "6e5db57d2446a753aaa76bee268e1f95600b14ce"
>>
>> -PACKAGECONFIG[bluez] = "--enable-bluez,--disable-bluez,bluez4"
>> +PACKAGECONFIG[bluez] = "--enable-bluez,--disable-bluez,virtual/bluez"
>>   PACKAGECONFIG[sbc] = "--enable-sbc,--disable-sbc,sbc"
>>   PACKAGECONFIG[hls] = "--enable-hls,--disable-hls,gnutls"
>>
>> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
>> index bb13f4b..e4e058f 100644
>> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
>> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
>> @@ -36,7 +36,7 @@ PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '',
>>                      ${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
>>                      ${@base_contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)} \
>>                      ${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
>> -PACKAGECONFIG[bluez] = "--enable-bluez,--disable-bluez,bluez4 sbc"
>> +PACKAGECONFIG[bluez] = "--enable-bluez,--disable-bluez,virtual/bluez sbc"
>>   PACKAGECONFIG[gtk] = "--enable-gtk3,--disable-gtk3,gtk+3"
>>   PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
>>   PACKAGECONFIG[x11] = "--enable-x11,--disable-x11,virtual/libx11 libxtst libice libsm libxcb"
>> diff --git a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
>> index 062702f..ef3f08d 100644
>> --- a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
>> +++ b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
>> @@ -3,7 +3,7 @@ DEPENDS = "gstreamer util-linux"
>>
>>   PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)} \
>>                      ${@base_contains('DISTRO_FEATURES', 'bluetooth', 'bluetooth', '', d)}"
>> -PACKAGECONFIG[bluetooth] = ",,bluez4"
>> +PACKAGECONFIG[bluetooth] = ",,virtual/bluez"
>>   PACKAGECONFIG[pulseaudio] = ",,pulseaudio"
>>
>>   LICENSE = "LGPLv2.1"
>> --
>> 1.7.10.4
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

-- 
Best Reagrds,
Roy | RongQing Li

