Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8839F6D8A7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 15:06:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id rACF6TW7000240
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 07:06:29 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.228) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Tue, 12 Nov 2013 07:06:29 -0800
Message-ID: <528243F6.5040201@windriver.com>
Date: Tue, 12 Nov 2013 09:06:30 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1383293368-23915-1-git-send-email-rongqing.li@windriver.com>	<20131101093436.GN32015@jama>	<969F26A8BAB325438E7EB80D3C3134FB16CB39CA@IRSMSX105.ger.corp.intel.com>	<528176B2.4080507@windriver.com>
	<528184DB.2060403@linux.intel.com> <20131112084943.GA3663@jama>
In-Reply-To: <20131112084943.GA3663@jama>
Subject: Re: [PATCH v2] bluez: declaration of virtual/bluez and VIRTUAL-RUNTIME_bluez
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
X-List-Received-Date: Tue, 12 Nov 2013 15:06:28 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/12/13, 2:49 AM, Martin Jansa wrote:
> On Mon, Nov 11, 2013 at 05:31:07PM -0800, Saul Wold wrote:
>> On 11/11/2013 04:30 PM, Rongqing Li wrote:
>>>
>>>
>>> On 11/11/2013 05:59 PM, Iorga, Cristian wrote:
>>>> Hi all,
>>>>
>>>> As far as I have experimented, there is no upgrade path available at
>>>> the moment, due to extensive changes into the programming model for
>>>> BlueZ5 vs BlueZ4.
>>>> At the moment, the last single component that is not officially ready
>>>> for BlueZ5 is PulseAudio.
>>>> As have asked around, and PA5.0 will* support BlueZ5.
>>>> PA5.0 should* be released before EoY2013.
>>>> Judging by PA git log, there are extensive changes/updates in order to
>>>> support BZ5.
>>>>
>>>> Regards,
>>>> Cristian
>>>
>>> Thanks.
>>>
>>> Saul: Do you think it is ready for merge, our release needs it, thanks.
>>>
>>
>> At this point, I do not think this is an approporate patch, we can't
>> switch between bluez4 and bluez5 as Cristian points out above, they are
>> just not compatible.  This is a case where we need 2 distinct versions
>> and once the recipes/upstreams for the things that rely on bluez4 are
>> updated to bluez5, we will cut over and then likely move the bluez4
>> stack out of oe-core into meta-oe.
>
> I disagree a bit here, if some distribution is using only
> packagegroup-base -> bluez dependency, then this patch is useful to
> allow to switch to bluez5 already with just VIRTUAL_RUNTIME change
> instead of a lot longer .bbappend for packagegroup-base just to replace
> bluez4 with bluez5.
>
> If bluez4 is moved to meta-oe then there would be the same problem for
> people who can need bluez4-only images where bluez4 should be pulled by
> packagegroup-base.

My current expectation moving forward is that there will be a distro flag that 
selects bluez4 or bluez5 API.  Then the recipes should be selecting behavior 
based on that flag.

The VIRTUAL-RUNTIME_... is designed for cases where the same API is used, but 
different things could provide the functionality.  Such as a syslog daemon. 
Since the APIs are different, it's not appropriate in this case.

--Mark

>>
>> Sau!
>>
>>>
>>> -Roy
>>>
>>>>
>>>> -----Original Message-----
>>>> From: openembedded-core-bounces@lists.openembedded.org
>>>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>>>> Martin Jansa
>>>> Sent: Friday, November 1, 2013 11:35 AM
>>>> To: rongqing.li@windriver.com
>>>> Cc: openembedded-core@lists.openembedded.org
>>>> Subject: Re: [OE-core] [PATCH v2] bluez: declaration of virtual/bluez
>>>> and VIRTUAL-RUNTIME_bluez
>>>>
>>>> On Fri, Nov 01, 2013 at 04:09:28PM +0800, rongqing.li@windriver.com
>>>> wrote:
>>>>> From: Roy Li <rongqing.li@windriver.com>
>>>>>
>>>>> We have two version bluez, declare virtual/bluez and
>>>>> VIRTUAL-RUNTIME_bluez to switch them easily, and set the preferred
>>>>> provider for bluez as bluez4
>>>>
>>>> +1
>>>>
>>>> I agree that some apps aren't compatible with both versions now, but
>>>> this gives easy way to switch between them for DISTRO which cares only
>>>> about apps which are compatible with bluez5 already.
>>>>
>>>> BTW: Have someone tried upgrade path on target from bluez4 to bluez5?
>>>> I know we discussed it at lengths before bluez5 was merged, but don't
>>>> know if someone really tested it.
>>>>
>>>>> Signed-off-by: Roy Li <rongqing.li@windriver.com>
>>>>> ---
>>>>>    meta/conf/distro/include/default-providers.inc
>>>>> |    5 ++---
>>>>>    meta/recipes-connectivity/bluez/bluez4.inc
>>>>> |    1 +
>>>>>    meta/recipes-connectivity/bluez5/bluez5.inc
>>>>> |    1 +
>>>>>    meta/recipes-connectivity/connman/connman.inc
>>>>> |    4 ++--
>>>>>    meta/recipes-connectivity/libpcap/libpcap.inc
>>>>> |    2 +-
>>>>>    meta/recipes-connectivity/neard/neard.inc
>>>>> |    2 +-
>>>>>    meta/recipes-connectivity/ofono/ofono.inc
>>>>> |    2 +-
>>>>>    meta/recipes-core/packagegroups/packagegroup-base.bb
>>>>> |    2 +-
>>>>>    meta/recipes-gnome/packagegroups/packagegroup-sdk-gmae.inc
>>>>> |    2 +-
>>>>>    meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
>>>>> |    2 +-
>>>>>    meta/recipes-multimedia/pulseaudio/pulseaudio.inc
>>>>> |    2 +-
>>>>>    meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
>>>>> |    2 +-
>>>>>    12 files changed, 14 insertions(+), 13 deletions(-)
>>>>>
>>>>> diff --git a/meta/conf/distro/include/default-providers.inc
>>>>> b/meta/conf/distro/include/default-providers.inc
>>>>> index d4b9db0..0ec4cd9 100644
>>>>> --- a/meta/conf/distro/include/default-providers.inc
>>>>> +++ b/meta/conf/distro/include/default-providers.inc
>>>>> @@ -14,6 +14,7 @@ PREFERRED_PROVIDER_virtual/update-alternatives ?=
>>>>> "opkg"
>>>>>    PREFERRED_PROVIDER_virtual/update-alternatives-native ?= "opkg-native"
>>>>>    PREFERRED_PROVIDER_virtual/libx11 ?= "libx11"
>>>>>    PREFERRED_PROVIDER_xf86-video-intel ?= "xf86-video-intel"
>>>>> +PREFERRED_PROVIDER_virtual/bluez ?= "bluez4"
>>>>>
>>>>>    #
>>>>>    # Default virtual runtime providers
>>>>> @@ -21,6 +22,7 @@ PREFERRED_PROVIDER_xf86-video-intel ?=
>>>>> "xf86-video-intel"
>>>>>    VIRTUAL-RUNTIME_update-alternatives ?= "update-alternatives-cworth"
>>>>>    VIRTUAL-RUNTIME_apm ?= "apm"
>>>>>    VIRTUAL-RUNTIME_alsa-state ?= "alsa-state"
>>>>> +VIRTUAL-RUNTIME_bluez ?= "bluez4"
>>>>>
>>>>>    #
>>>>>    # Default recipe providers
>>>>> @@ -40,6 +42,3 @@ PREFERRED_PROVIDER_console-tools ?= "kbd"
>>>>>    PREFERRED_PROVIDER_gzip-native ?= "pigz-native"
>>>>>    PREFERRED_PROVIDER_make ?= "make"
>>>>>    PREFERRED_PROVIDER_udev ?=
>>>>> "${@base_contains('DISTRO_FEATURES','systemd','systemd','udev',d)}"
>>>>> -# There are issues with runtime packages and PREFERRED_PROVIDER, see
>>>>> YOCTO #5044 for details -# on this rather strange entry.
>>>>> -PREFERRED_PROVIDER_bluez4 ?= "bluez4"
>>>>> diff --git a/meta/recipes-connectivity/bluez/bluez4.inc
>>>>> b/meta/recipes-connectivity/bluez/bluez4.inc
>>>>> index e4f6834..c0babc6 100644
>>>>> --- a/meta/recipes-connectivity/bluez/bluez4.inc
>>>>> +++ b/meta/recipes-connectivity/bluez/bluez4.inc
>>>>> @@ -9,6 +9,7 @@ LIC_FILES_CHKSUM =
>>>>> "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
>>>>>
>>>>> file://sbc/sbc.c;beginline=1;endline=25;md5=1a40781ed30d50d8639323a184aeb191"
>>>>>
>>>>>    DEPENDS = "udev libusb dbus-glib glib-2.0 libcheck readline"
>>>>>    RDEPENDS_${PN}-dev = "bluez-hcidump"
>>>>> +PROVIDES += "virtual/bluez"
>>>>>
>>>>>    PACKAGECONFIG ??= "\
>>>>>        ${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}\ diff
>>>>> --git a/meta/recipes-connectivity/bluez5/bluez5.inc
>>>>> b/meta/recipes-connectivity/bluez5/bluez5.inc
>>>>> index 2e25d86..b3ab131 100644
>>>>> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
>>>>> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
>>>>> @@ -7,6 +7,7 @@ LIC_FILES_CHKSUM =
>>>>> "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
>>>>>
>>>>> file://COPYING.LIB;md5=fb504b67c50331fc78734fed90fb0e09 \
>>>>>
>>>>> file://src/main.c;beginline=1;endline=24;md5=9bc54b93cd7e17bf03f52513f39f926e"
>>>>>
>>>>>    DEPENDS = "udev libusb dbus-glib glib-2.0 libcheck readline"
>>>>> +PROVIDES += "virtual/bluez"
>>>>>
>>>>>    RCONFLICTS_${PN} = "bluez4"
>>>>>
>>>>> diff --git a/meta/recipes-connectivity/connman/connman.inc
>>>>> b/meta/recipes-connectivity/connman/connman.inc
>>>>> index c2d71e0..8641415 100644
>>>>> --- a/meta/recipes-connectivity/connman/connman.inc
>>>>> +++ b/meta/recipes-connectivity/connman/connman.inc
>>>>> @@ -41,7 +41,7 @@ PACKAGECONFIG ??= "wispr \  #
>>>>> PACKAGECONFIG_append_pn-connman = " openvpn vpnc l2tp pptp"
>>>>>
>>>>>    PACKAGECONFIG[wifi] = "--enable-wifi, --disable-wifi, wpa-supplicant"
>>>>> -PACKAGECONFIG[bluetooth] = "--enable-bluetooth, --disable-bluetooth,
>>>>> bluez4"
>>>>> +PACKAGECONFIG[bluetooth] = "--enable-bluetooth, --disable-bluetooth,
>>>>> virtual/bluez"
>>>>>    PACKAGECONFIG[3g] = "--enable-ofono, --disable-ofono, ofono"
>>>>>    PACKAGECONFIG[tist] = "--enable-tist,--disable-tist,"
>>>>>    PACKAGECONFIG[openvpn] = "--enable-openvpn
>>>>> --with-openvpn=${sbindir}/openvpn,--disable-openvpn,,openvpn"
>>>>> @@ -118,7 +118,7 @@ RPROVIDES_${PN} = "\
>>>>>
>>>>>    RDEPENDS_${PN} = "\
>>>>>        dbus \
>>>>> -    ${@base_contains('PACKAGECONFIG', 'bluetooth', 'bluez4', '', d)} \
>>>>> +    ${@base_contains('PACKAGECONFIG', 'bluetooth',
>>>>> +'${VIRTUAL-RUNTIME_bluez}', '', d)} \
>>>>>        ${@base_contains('PACKAGECONFIG', 'wifi','wpa-supplicant', '',
>>>>> d)} \
>>>>>        ${@base_contains('PACKAGECONFIG', '3g','ofono', '', d)} \
>>>>>        xuser-account \
>>>>> diff --git a/meta/recipes-connectivity/libpcap/libpcap.inc
>>>>> b/meta/recipes-connectivity/libpcap/libpcap.inc
>>>>> index 3a08afe..3a67ecc 100644
>>>>> --- a/meta/recipes-connectivity/libpcap/libpcap.inc
>>>>> +++ b/meta/recipes-connectivity/libpcap/libpcap.inc
>>>>> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =
>>>>> "file://LICENSE;md5=1d4b0366557951c84a94fabe3529f867 \  DEPENDS =
>>>>> "flex-native bison-native libnl"
>>>>>
>>>>>    PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'bluetooth',
>>>>> 'bluetooth', '', d)}"
>>>>> -PACKAGECONFIG[bluetooth] =
>>>>> "--enable-bluetooth,--disable-bluetooth,bluez4"
>>>>> +PACKAGECONFIG[bluetooth] =
>>>>> "--enable-bluetooth,--disable-bluetooth,virtual/bluez"
>>>>>    PACKAGECONFIG[canusb] = "--enable-canusb,--enable-canusb=no,libusb"
>>>>>
>>>>>    INC_PR = "r5"
>>>>> diff --git a/meta/recipes-connectivity/neard/neard.inc
>>>>> b/meta/recipes-connectivity/neard/neard.inc
>>>>> index 7cccbdc..1d27c10 100644
>>>>> --- a/meta/recipes-connectivity/neard/neard.inc
>>>>> +++ b/meta/recipes-connectivity/neard/neard.inc
>>>>> @@ -47,7 +47,7 @@ RDEPENDS_${PN} = "dbus python python-dbus
>>>>> python-pygobject"
>>>>>
>>>>>    # Bluez & Wifi are not mandatory except for handover
>>>>> RRECOMMENDS_${PN} = "\
>>>>> -                     ${@base_contains('DISTRO_FEATURES',
>>>>> 'bluetooth', 'bluez4', '', d)} \
>>>>> +                     ${@base_contains('DISTRO_FEATURES', 'bluetooth',
>>>>> + 'virtual/bluez', '', d)} \
>>>>>                         ${@base_contains('DISTRO_FEATURES',
>>>>> 'wifi','wpa-supplicant', '', d)} \
>>>>>                        "
>>>>>
>>>>> diff --git a/meta/recipes-connectivity/ofono/ofono.inc
>>>>> b/meta/recipes-connectivity/ofono/ofono.inc
>>>>> index 3972e06..ff34265 100644
>>>>> --- a/meta/recipes-connectivity/ofono/ofono.inc
>>>>> +++ b/meta/recipes-connectivity/ofono/ofono.inc
>>>>> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =
>>>>> "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
>>>>>
>>>>>    inherit autotools pkgconfig update-rc.d systemd
>>>>>
>>>>> -DEPENDS  = "dbus glib-2.0 udev mobile-broadband-provider-info
>>>>> ${@base_contains('DISTRO_FEATURES', 'bluetooth','bluez4', '', d)}"
>>>>> +DEPENDS  = "dbus glib-2.0 udev mobile-broadband-provider-info
>>>>> ${@base_contains('DISTRO_FEATURES', 'bluetooth','virtual/bluez', '',
>>>>> d)}"
>>>>>
>>>>>    INITSCRIPT_NAME = "ofono"
>>>>>    INITSCRIPT_PARAMS = "defaults 22"
>>>>> diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb
>>>>> b/meta/recipes-core/packagegroups/packagegroup-base.bb
>>>>> index eee8bd9..a63ce73 100644
>>>>> --- a/meta/recipes-core/packagegroups/packagegroup-base.bb
>>>>> +++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
>>>>> @@ -210,7 +210,7 @@ RRECOMMENDS_packagegroup-base-pcmcia = "\
>>>>>
>>>>>    SUMMARY_packagegroup-base-bluetooth = "Bluetooth support"
>>>>>    RDEPENDS_packagegroup-base-bluetooth = "\
>>>>> -    bluez4 \
>>>>> +    ${VIRTUAL-RUNTIME_bluez} \
>>>>>        ${@base_contains('COMBINED_FEATURES', 'alsa',
>>>>> 'libasound-module-bluez', '',d)} \
>>>>>        "
>>>>>
>>>>> diff --git
>>>>> a/meta/recipes-gnome/packagegroups/packagegroup-sdk-gmae.inc
>>>>> b/meta/recipes-gnome/packagegroups/packagegroup-sdk-gmae.inc
>>>>> index 416e05d..75c92e2 100644
>>>>> --- a/meta/recipes-gnome/packagegroups/packagegroup-sdk-gmae.inc
>>>>> +++ b/meta/recipes-gnome/packagegroups/packagegroup-sdk-gmae.inc
>>>>> @@ -3,7 +3,7 @@ SDK-GMAE = " \
>>>>>        dbus-glib-dev \
>>>>>        gtk+-dev \
>>>>>        gstreamer-dev \
>>>>> -    bluez4-dev \
>>>>> +    ${VIRTUAL-RUNTIME_bluez}-dev \
>>>>>        gconf-dev \
>>>>>        avahi-dev \
>>>>>        telepathy-glib-dev \
>>>>> diff --git
>>>>> a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
>>>>> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
>>>>> index e1a5904..8f37be8 100644
>>>>> ---
>>>>> a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
>>>>> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.b
>>>>> +++ b
>>>>> @@ -11,7 +11,7 @@ S = "${WORKDIR}/git"
>>>>>
>>>>>    SRCREV = "6e5db57d2446a753aaa76bee268e1f95600b14ce"
>>>>>
>>>>> -PACKAGECONFIG[bluez] = "--enable-bluez,--disable-bluez,bluez4"
>>>>> +PACKAGECONFIG[bluez] = "--enable-bluez,--disable-bluez,virtual/bluez"
>>>>>    PACKAGECONFIG[sbc] = "--enable-sbc,--disable-sbc,sbc"
>>>>>    PACKAGECONFIG[hls] = "--enable-hls,--disable-hls,gnutls"
>>>>>
>>>>> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
>>>>> b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
>>>>> index bb13f4b..e4e058f 100644
>>>>> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
>>>>> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
>>>>> @@ -36,7 +36,7 @@ PACKAGECONFIG ??=
>>>>> "${@base_contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '',
>>>>>                       ${@base_contains('DISTRO_FEATURES', 'systemd',
>>>>> 'systemd', '', d)} \
>>>>>                       ${@base_contains('DISTRO_FEATURES', 'zeroconf',
>>>>> 'avahi', '', d)} \
>>>>>                       ${@base_contains('DISTRO_FEATURES', 'x11',
>>>>> 'x11', '', d)}"
>>>>> -PACKAGECONFIG[bluez] = "--enable-bluez,--disable-bluez,bluez4 sbc"
>>>>> +PACKAGECONFIG[bluez] = "--enable-bluez,--disable-bluez,virtual/bluez
>>>>> sbc"
>>>>>    PACKAGECONFIG[gtk] = "--enable-gtk3,--disable-gtk3,gtk+3"
>>>>>    PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
>>>>>    PACKAGECONFIG[x11] = "--enable-x11,--disable-x11,virtual/libx11
>>>>> libxtst libice libsm libxcb"
>>>>> diff --git a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
>>>>> b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
>>>>> index 062702f..ef3f08d 100644
>>>>> --- a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
>>>>> +++ b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
>>>>> @@ -3,7 +3,7 @@ DEPENDS = "gstreamer util-linux"
>>>>>
>>>>>    PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES',
>>>>> 'pulseaudio', 'pulseaudio', '', d)} \
>>>>>                       ${@base_contains('DISTRO_FEATURES', 'bluetooth',
>>>>> 'bluetooth', '', d)}"
>>>>> -PACKAGECONFIG[bluetooth] = ",,bluez4"
>>>>> +PACKAGECONFIG[bluetooth] = ",,virtual/bluez"
>>>>>    PACKAGECONFIG[pulseaudio] = ",,pulseaudio"
>>>>>
>>>>>    LICENSE = "LGPLv2.1"
>>>>> --
>>>>> 1.7.10.4
>>>>>
>>>>> _______________________________________________
>>>>> Openembedded-core mailing list
>>>>> Openembedded-core@lists.openembedded.org
>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>>
>>>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


