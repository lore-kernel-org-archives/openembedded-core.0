Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa09-02.prod.phx3.secureserver.net
	(p3plsmtpa09-02.prod.phx3.secureserver.net [173.201.193.231])
	by mail.openembedded.org (Postfix) with ESMTP id 68CEA65C75
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Feb 2015 12:32:00 +0000 (UTC)
Received: from [192.168.65.10] ([75.72.225.8])
	by p3plsmtpa09-02.prod.phx3.secureserver.net with 
	id p0Y01p00B0BVjqb010Y095; Fri, 06 Feb 2015 05:32:01 -0700
Message-ID: <54D4B448.5040707@pabigot.com>
Date: Fri, 06 Feb 2015 06:32:08 -0600
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <20150206114251.GB2007@gmail.com>
In-Reply-To: <20150206114251.GB2007@gmail.com>
Subject: Re: add bluetooth-bluez5 distro feature
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
X-List-Received-Date: Fri, 06 Feb 2015 12:32:09 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 02/06/2015 05:42 AM, Sylvestre Gallon wrote:
> Hi,
>
> Here is an attempt to add the bluetooth-bluez5 distro feature. This feature
> will allow to generate an image using bluez5 instead of bluez4.

There's a patch set that's still awaiting review since November for this 
that some folks have been using.  It does need a minor rebase, which 
I'll try to push to the contrib area this weekend.

http://lists.openembedded.org/pipermail/openembedded-core/2014-November/099312.html

Peter
>
> You will find the diff inlined.
>
> Cheers,
>
>
>  From f804bcc19d29e43f38067ef92a65e9be7de160ee Mon Sep 17 00:00:00 2001
> From: Sylvestre Gallon <ccna.syl@gmail.com>
> Date: Fri, 6 Feb 2015 13:10:24 +0100
> Subject: [PATCH] add bluetooth-bluez5 DISTRO_FEATURES to use bluez5 instead of
>   bluez4
>
> ---
>   meta/recipes-connectivity/connman/connman.inc                | 12 ++++++++----
>   meta/recipes-connectivity/libpcap/libpcap.inc                |  6 ++++--
>   meta/recipes-connectivity/neard/neard.inc                    |  1 +
>   meta/recipes-connectivity/ofono/ofono.inc                    |  6 ++++--
>   meta/recipes-core/busybox/busybox.inc                        |  1 +
>   meta/recipes-core/packagegroups/packagegroup-base.bb         |  2 ++
>   .../gstreamer/gstreamer1.0-plugins-bad.inc                   |  6 ++++--
>   meta/recipes-multimedia/pulseaudio/pulseaudio.inc            |  1 +
>   8 files changed, 25 insertions(+), 10 deletions(-)
>
> diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
> index 736b324..30751f0 100644
> --- a/meta/recipes-connectivity/connman/connman.inc
> +++ b/meta/recipes-connectivity/connman/connman.inc
> @@ -32,7 +32,8 @@ EXTRA_OECONF += "\
>   PACKAGECONFIG ??= "wispr \
>                      ${@bb.utils.contains('DISTRO_FEATURES', 'systemd','systemd', '', d)} \
>                      ${@bb.utils.contains('DISTRO_FEATURES', 'wifi','wifi', '', d)} \
> -                   ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth','bluetooth', '', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth','bluez4', '', d)} \
> +		   ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth-bluez5', 'bluez5', d)} \
>                      ${@bb.utils.contains('DISTRO_FEATURES', '3g','3g', '', d)} \
>   "
>   
> @@ -42,7 +43,8 @@ PACKAGECONFIG ??= "wispr \
>   
>   PACKAGECONFIG[systemd] = "--with-systemdunitdir=${systemd_unitdir}/system/,--with-systemdunitdir="
>   PACKAGECONFIG[wifi] = "--enable-wifi, --disable-wifi, wpa-supplicant"
> -PACKAGECONFIG[bluetooth] = "--enable-bluetooth, --disable-bluetooth, bluez4"
> +PACKAGECONFIG[bluez4] = "--enable-bluetooth, --disable-bluetooth, bluez4"
> +PACKAGECONFIG[bluez5] = "--enable-bluetooth, --disable-bluetooth, bluez5"
>   PACKAGECONFIG[3g] = "--enable-ofono, --disable-ofono, ofono"
>   PACKAGECONFIG[tist] = "--enable-tist,--disable-tist,"
>   PACKAGECONFIG[openvpn] = "--enable-openvpn --with-openvpn=${sbindir}/openvpn,--disable-openvpn,,openvpn"
> @@ -107,14 +109,16 @@ do_install_append() {
>   RPROVIDES_${PN} = "\
>   	connman-plugin-loopback \
>   	connman-plugin-ethernet \
> -	${@bb.utils.contains('PACKAGECONFIG', 'bluetooth','connman-plugin-bluetooth', '', d)} \
> +	${@bb.utils.contains('PACKAGECONFIG', 'bluez4','connman-plugin-bluetooth', '', d)} \
> +	${@bb.utils.contains('PACKAGECONFIG', 'bluez5','connman-plugin-bluetooth', '', d)} \
>   	${@bb.utils.contains('PACKAGECONFIG', 'wifi','connman-plugin-wifi', '', d)} \
>   	${@bb.utils.contains('PACKAGECONFIG', '3g','connman-plugin-ofono', '', d)} \
>   	"
>   
>   RDEPENDS_${PN} = "\
>   	dbus \
> -	${@bb.utils.contains('PACKAGECONFIG', 'bluetooth', 'bluez4', '', d)} \
> +	${@bb.utils.contains('PACKAGECONFIG', 'bluez4', 'bluez4', '', d)} \
> +	${@bb.utils.contains('PACKAGECONFIG', 'bluez5', 'bluez5', '', d)} \
>   	${@bb.utils.contains('PACKAGECONFIG', 'wifi','wpa-supplicant', '', d)} \
>   	${@bb.utils.contains('PACKAGECONFIG', '3g','ofono', '', d)} \
>   	xuser-account \
> diff --git a/meta/recipes-connectivity/libpcap/libpcap.inc b/meta/recipes-connectivity/libpcap/libpcap.inc
> index a12eb16..ad88a42 100644
> --- a/meta/recipes-connectivity/libpcap/libpcap.inc
> +++ b/meta/recipes-connectivity/libpcap/libpcap.inc
> @@ -10,8 +10,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1d4b0366557951c84a94fabe3529f867 \
>                       file://pcap.h;beginline=1;endline=32;md5=39af3510e011f34b8872f120b1dc31d2"
>   DEPENDS = "flex-native bison-native"
>   
> -PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluetooth', '', d)}"
> -PACKAGECONFIG[bluetooth] = "--enable-bluetooth,--disable-bluetooth,bluez4"
> +PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez4', '', d)}"
> +PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth-bluez5', 'bluez5', '', d)}"
> +PACKAGECONFIG[bluez4] = "--enable-bluetooth,--disable-bluetooth,bluez4"
> +PACKAGECONFIG[bluez5] = "--enable-bluetooth,--disable-bluetooth,bluez5"
>   PACKAGECONFIG[canusb] = "--enable-canusb,--enable-canusb=no,libusb"
>   PACKAGECONFIG[libnl] = "--with-libnl,--without-libnl,libnl"
>   
> diff --git a/meta/recipes-connectivity/neard/neard.inc b/meta/recipes-connectivity/neard/neard.inc
> index 76640d8..a553bd5 100644
> --- a/meta/recipes-connectivity/neard/neard.inc
> +++ b/meta/recipes-connectivity/neard/neard.inc
> @@ -48,6 +48,7 @@ RDEPENDS_${PN} = "dbus python python-dbus python-pygobject"
>   # Bluez & Wifi are not mandatory except for handover
>   RRECOMMENDS_${PN} = "\
>                        ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez4', '', d)} \
> +                     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth-bluez5', 'bluez5', '', d)} \
>                        ${@bb.utils.contains('DISTRO_FEATURES', 'wifi','wpa-supplicant', '', d)} \
>                       "
>   
> diff --git a/meta/recipes-connectivity/ofono/ofono.inc b/meta/recipes-connectivity/ofono/ofono.inc
> index bf44fca..ff03d54 100644
> --- a/meta/recipes-connectivity/ofono/ofono.inc
> +++ b/meta/recipes-connectivity/ofono/ofono.inc
> @@ -14,10 +14,12 @@ INITSCRIPT_PARAMS = "defaults 22"
>   
>   PACKAGECONFIG ??= "\
>       ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
> -    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth','bluetooth', '', d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth','bluez4', '', d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth-bluez5','bluez5', '', d)} \
>       "
>   PACKAGECONFIG[systemd] = "--with-systemdunitdir=${systemd_unitdir}/system/,--with-systemdunitdir="
> -PACKAGECONFIG[bluetooth] = "--enable-bluetooth,--disable-bluetooth,bluez4"
> +PACKAGECONFIG[bluez4] = "--enable-bluetooth,--disable-bluetooth,bluez4"
> +PACKAGECONFIG[bluez5] = "--enable-bluetooth,--disable-bluetooth,bluez5"
>   
>   EXTRA_OECONF += "--enable-test"
>   
> diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
> index 0769d92..870b5b0 100644
> --- a/meta/recipes-core/busybox/busybox.inc
> +++ b/meta/recipes-core/busybox/busybox.inc
> @@ -68,6 +68,7 @@ def features_to_busybox_settings(d):
>   	busybox_cfg(bb.utils.contains('DISTRO_FEATURES', 'ipv6', True, False, d), 'CONFIG_FEATURE_IFUPDOWN_IPV6', cnf, rem)
>   	busybox_cfg(bb.utils.contains('DISTRO_FEATURES', 'wifi', True, False, d), 'CONFIG_RFKILL', cnf, rem)
>   	busybox_cfg(bb.utils.contains('DISTRO_FEATURES', 'bluetooth', True, False, d), 'CONFIG_RFKILL', cnf, rem)
> +	busybox_cfg(bb.utils.contains('DISTRO_FEATURES', 'bluetooth-bluez5', True, False, d), 'CONFIG_RFKILL', cnf, rem)
>   	return "\n".join(cnf), "\n".join(rem)
>   
>   # X, Y = ${@features_to_uclibc_settings(d)}
> diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
> index f4b2cd5..d9fead8 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-base.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
> @@ -31,6 +31,7 @@ PACKAGES = ' \
>               ${@bb.utils.contains("MACHINE_FEATURES", "usbhost", "packagegroup-base-usbhost", "", d)} \
>               \
>               ${@bb.utils.contains("DISTRO_FEATURES", "bluetooth", "packagegroup-base-bluetooth", "", d)} \
> +            ${@bb.utils.contains("DISTRO_FEATURES", "bluetooth-bluez5", "packagegroup-base-bluetooth", "", d)} \
>               ${@bb.utils.contains("DISTRO_FEATURES", "wifi", "packagegroup-base-wifi", "", d)} \
>               ${@bb.utils.contains("DISTRO_FEATURES", "3g", "packagegroup-base-3g", "", d)} \
>               ${@bb.utils.contains("DISTRO_FEATURES", "nfc", "packagegroup-base-nfc", "", d)} \
> @@ -70,6 +71,7 @@ RDEPENDS_packagegroup-base = "\
>       ${@bb.utils.contains('COMBINED_FEATURES', 'usbgadget', 'packagegroup-base-usbgadget', '',d)} \
>       ${@bb.utils.contains('COMBINED_FEATURES', 'usbhost', 'packagegroup-base-usbhost', '',d)} \
>       ${@bb.utils.contains('COMBINED_FEATURES', 'bluetooth', 'packagegroup-base-bluetooth', '',d)} \
> +    ${@bb.utils.contains('COMBINED_FEATURES', 'bluetooth-bluez5', 'packagegroup-base-bluetooth', '',d)} \
>       ${@bb.utils.contains('COMBINED_FEATURES', 'wifi', 'packagegroup-base-wifi', '',d)} \
>       ${@bb.utils.contains('COMBINED_FEATURES', '3g', 'packagegroup-base-3g', '',d)} \
>       ${@bb.utils.contains('COMBINED_FEATURES', 'nfc', 'packagegroup-base-nfc', '',d)} \
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
> index 9c15f2b..f2c7af9 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
> @@ -18,7 +18,8 @@ PACKAGECONFIG_GL ?= "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gles2',
>   PACKAGECONFIG ??= " \
>       ${PACKAGECONFIG_GL} \
>       ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)} \
> -    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez4', '', d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth-bluez5', 'bluez5', '', d)} \
>       ${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)} \
>       orc curl uvch264 neon sndfile \
>       hls sbc dash bz2 smoothstreaming \
> @@ -49,7 +50,8 @@ PACKAGECONFIG[bz2]             = "--enable-bz2,--disable-bz2,bzip2"
>   PACKAGECONFIG[fluidsynth]      = "--enable-fluidsynth,--disable-fluidsynth,fluidsynth"
>   PACKAGECONFIG[schroedinger]    = "--enable-schro,--disable-schro,schroedinger"
>   PACKAGECONFIG[smoothstreaming] = "--enable-smoothstreaming,--disable-smoothstreaming,libxml2"
> -PACKAGECONFIG[bluez]           = "--enable-bluez,--disable-bluez,bluez4"
> +PACKAGECONFIG[bluez4]          = "--enable-bluez,--disable-bluez,bluez4"
> +PACKAGECONFIG[bluez5]          = "--enable-bluez,--disable-bluez,bluez5"
>   PACKAGECONFIG[rsvg]            = "--enable-rsvg,--disable-rsvg,librsvg"
>   PACKAGECONFIG[sndfile]         = "--enable-sndfile,--disable-sndfile,libsndfile1"
>   PACKAGECONFIG[webp]            = "--enable-webp,--disable-webp,libwebp"
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> index 99cad76..d5a0f6d 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> @@ -32,6 +32,7 @@ EXTRA_OECONF = "\
>   "
>   
>   PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez4', '', d)} \
> +		   ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth-bluez5', 'bluez5', '', d)} \
>                      ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
>                      ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)} \
>                      ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"


