Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id F30BC6AE86
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 15:16:14 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 24 Jul 2013 08:13:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,736,1367996400"; d="scan'208";a="375703920"
Received: from unknown (HELO [10.255.14.43]) ([10.255.14.43])
	by orsmga002.jf.intel.com with ESMTP; 24 Jul 2013 08:16:14 -0700
Message-ID: <51EFEFBE.1020808@linux.intel.com>
Date: Wed, 24 Jul 2013 08:16:14 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: "Iorga, Cristian" <cristian.iorga@intel.com>
References: <20130718201834.CB5765038D@opal> <20130724113311.GE4136@jama>
	<969F26A8BAB325438E7EB80D3C3134FB16C0DB50@IRSMSX105.ger.corp.intel.com>
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB16C0DB50@IRSMSX105.ger.corp.intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] Cristian Iorga : bluez5: new package for v5.7
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
X-List-Received-Date: Wed, 24 Jul 2013 15:16:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/24/2013 05:47 AM, Iorga, Cristian wrote:
> I will, this week I guess.
>
I mentioned this issue last week and I have a fix for it in my MUT 
branch already, just not published yet.  I will likely have it later 
today, juggling too many things.


Sau!

> -----Original Message-----
> From: Martin Jansa [mailto:martin.jansa@gmail.com]
> Sent: Wednesday, July 24, 2013 2:33 PM
> To: Iorga, Cristian; openembedded-core@lists.openembedded.org
> Cc: openembedded-commits@lists.openembedded.org
> Subject: Re: [oe-commits] Cristian Iorga : bluez5: new package for v5.7
>
> On Thu, Jul 18, 2013 at 08:18:34PM +0000, git@git.openembedded.org wrote:
>> Module: openembedded-core.git
>> Branch: master
>> Commit: 5d55498be84a6a8725794f75f4d12336048cdc34
>> URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=5d55498be84a6a8725794f75f4d12336048cdc34
>>
>> Author: Cristian Iorga <cristian.iorga@intel.com>
>> Date:   Tue Jul 16 18:26:01 2013 +0300
>>
>> bluez5: new package for v5.7
>>
>> - bluez5 does not replace bluez4
>> - bluez5 is integrated with systemd
>> - RCONFLICTS bluez4
>> - add readline dependency
>
> They are providing the same package for runtime:
> NOTE: multiple providers are available for runtime libasound-module-bluez (bluez4, bluez5)
> NOTE: consider defining a PREFERRED_PROVIDER entry to match libasound-module-bluez
>
> Please fix that.
>
>>
>> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>>
>> ---
>>
>>   .../bluez5/bluez5-5.7/bluetooth.conf               |   16 +++++
>>   meta/recipes-connectivity/bluez5/bluez5.inc        |   68 ++++++++++++++++++++
>>   meta/recipes-connectivity/bluez5/bluez5_5.7.bb     |    5 ++
>>   3 files changed, 89 insertions(+), 0 deletions(-)
>>
>> diff --git
>> a/meta/recipes-connectivity/bluez5/bluez5-5.7/bluetooth.conf
>> b/meta/recipes-connectivity/bluez5/bluez5-5.7/bluetooth.conf
>> new file mode 100644
>> index 0000000..ca5e9e4
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/bluez5/bluez5-5.7/bluetooth.conf
>> @@ -0,0 +1,16 @@
>> +<!-- This configuration file specifies the required security policies
>> +     for Bluetooth core daemon to work. -->
>> +
>> +<!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-BUS Bus Configuration 1.0//EN"
>> + "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
>> +<busconfig>
>> +
>> +  <!-- ../system.conf have denied everything, so we just punch some
>> + holes -->
>> +
>> +  <policy context="default">
>> +    <allow own="org.bluez"/>
>> +    <allow send_destination="org.bluez"/>
>> +    <allow send_interface="org.bluez.Agent"/>
>> +  </policy>
>> +
>> +</busconfig>
>> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc
>> b/meta/recipes-connectivity/bluez5/bluez5.inc
>> new file mode 100644
>> index 0000000..fc78900
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
>> @@ -0,0 +1,68 @@
>> +SUMMARY = "Linux Bluetooth Stack Userland V5"
>> +DESCRIPTION = "Linux Bluetooth stack V5 userland components.  These include a system configurations, daemons, tools and system libraries."
>> +HOMEPAGE = "http://www.bluez.org"
>> +SECTION = "libs"
>> +LICENSE = "GPLv2+ & LGPLv2.1+"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
>> +                    file://COPYING.LIB;md5=fb504b67c50331fc78734fed90fb0e09 \
>> +                    file://src/main.c;beginline=1;endline=24;md5=9bc54b93cd7e17bf03f52513f39f926e"
>> +DEPENDS = "udev libusb dbus-glib glib-2.0 libcheck libical readline"
>> +
>> +RCONFLICTS_${PN} = "bluez4"
>> +
>> +PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}"
>> +PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib"
>> +
>> +SRC_URI = "\
>> +    ${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.gz \
>> +    file://bluetooth.conf \
>> +"
>> +S = "${WORKDIR}/bluez-${PV}"
>> +
>> +inherit autotools pkgconfig systemd
>> +
>> +EXTRA_OECONF = "\
>> +  --disable-gstreamer \
>> +  --enable-usb \
>> +  --enable-tools \
>> +  --enable-bccmd \
>> +  --enable-hid2hci \
>> +  --enable-dfutool \
>> +  --disable-hidd \
>> +  --disable-pand \
>> +  --disable-dund \
>> +  --disable-cups \
>> +  --enable-test \
>> +  --enable-datafiles \
>> +  ${@base_contains('DISTRO_FEATURES', 'systemd',
>> +'--with-systemdunitdir=${systemd_unitdir}/system/', '--disable-systemd', d)} \ "
>> +
>> +do_install_append() {
>> +	install -d ${D}${sysconfdir}/bluetooth/
>> +	install -m 0644 ${S}/profiles/audio/audio.conf ${D}/${sysconfdir}/bluetooth/
>> +	install -m 0644 ${S}/profiles/network/network.conf ${D}/${sysconfdir}/bluetooth/
>> +	install -m 0644 ${S}/profiles/input/input.conf ${D}/${sysconfdir}/bluetooth/
>> +	# at_console doesn't really work with the current state of OE, so punch some more holes so people can actually use BT
>> +	install -m 0644 ${WORKDIR}/bluetooth.conf
>> +${D}/${sysconfdir}/dbus-1/system.d/
>> +}
>> +
>> +ALLOW_EMPTY_libasound-module-bluez = "1"
>> +PACKAGES =+ "libasound-module-bluez ${PN}-test"
>> +
>> +FILES_libasound-module-bluez = "${libdir}/alsa-lib/lib*.so ${datadir}/alsa"
>> +FILES_${PN} += "${libdir}/bluetooth/plugins ${libdir}/bluetooth/plugins/*.so ${base_libdir}/udev/ ${nonarch_base_libdir}/udev/ ${systemd_unitdir}/ ${datadir}/dbus-1"
>> +FILES_${PN}-dev += "\
>> +  ${libdir}/bluetooth/plugins/*.la \
>> +  ${libdir}/alsa-lib/*.la \
>> +"
>> +
>> +FILES_${PN}-test = "${libdir}/bluez/test/*"
>> +
>> +FILES_${PN}-dbg += "\
>> +  ${libdir}/${BPN}/bluetooth/.debug \
>> +  ${libdir}/bluetooth/plugins/.debug \
>> +  ${libdir}/*/.debug \
>> +  */udev/.debug \
>> +  "
>> +
>> +SYSTEMD_SERVICE_${PN} = "bluetooth.service"
>> diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.7.bb
>> b/meta/recipes-connectivity/bluez5/bluez5_5.7.bb
>> new file mode 100644
>> index 0000000..6e2850d
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/bluez5/bluez5_5.7.bb
>> @@ -0,0 +1,5 @@
>> +require bluez5.inc
>> +
>> +SRC_URI[md5sum] = "ce0ef43938e8bfc230f3f06d6ad02d7e"
>> +SRC_URI[sha256sum] = "902299204b7139c913765603c7054a604570aea9e9fddb30454bd1b5e5997860"
>> +
>>
>> _______________________________________________
>> Openembedded-commits mailing list
>> Openembedded-commits@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>

