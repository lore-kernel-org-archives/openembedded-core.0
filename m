Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id B38306FFCE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 10:40:47 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id E2FCE68A01B; Thu, 24 Mar 2016 10:40:47 +0000 (GMT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=ALL_TRUSTED,BAYES_50,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 4B39A68A019;
	Thu, 24 Mar 2016 10:40:47 +0000 (GMT)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id CCEC66740554;
	Thu, 24 Mar 2016 11:40:46 +0100 (CET)
To: "Burton, Ross" <ross.burton@intel.com>
References: <56F3B739.3030108@mlbassoc.com>
	<CAJTo0LZWmp7iqE22miPiq2Sp+oNUYzGtU-YR=7ZGiA3QjDaRbg@mail.gmail.com>
	<56F3C11E.5000204@mlbassoc.com>
	<CAJTo0LaS8jvkQ-ANsmyeVGNDR8rbfsti-oEXuO2LN6gM+PUj3Q@mail.gmail.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <56F3C42E.6060703@mlbassoc.com>
Date: Thu, 24 Mar 2016 11:40:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaS8jvkQ-ANsmyeVGNDR8rbfsti-oEXuO2LN6gM+PUj3Q@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Change in udev
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
X-List-Received-Date: Thu, 24 Mar 2016 10:40:48 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-03-24 11:30, Burton, Ross wrote:
>
> On 24 March 2016 at 10:27, Gary Thomas <gary@mlbassoc.com <mailto:gary@mlbassoc.com>> wrote:
>
>     More recent than poky:2df514bfe4a911c0dca8828038dd94e6265f50ca?
>
>
> In that case the file should have been generated at build time (please file a bug with logs if it wasn't) and is in a
> separate package so if you don't need it (its basically the USB and PCI ID tables) then you can remove it.
>
> As you say, eudev is new, so there's bound to be small configuration issues to work out before release.

Ah, interesting.  The file is in my rootfs, but it doesn't belong
to any package?

This is from my build:

$ ls -l tmp/work/teton_p0382-amltd-linux-gnueabi/amanda-server-image/1.0-r0/rootfs/etc/udev/
total 6532
-rw-r--r-- 1 gthomas gthomas       0 Mar 24 07:41 cache.data
-r--r--r-- 1 gthomas gthomas 6660476 Mar 24 09:21 hwdb.bin
drwxr-xr-x 2 gthomas gthomas    4096 Mar 24 07:42 hwdb.d
-rw-r--r-- 1 gthomas gthomas      51 Mar 24 08:51 mount.blacklist
drwxr-xr-x 2 gthomas gthomas    4096 Mar 24 08:51 mount.blacklist.d
drwxr-xr-x 2 gthomas gthomas    4096 Mar 24 09:21 rules.d
drwxr-xr-x 2 gthomas gthomas    4096 Mar 24 08:51 scripts
-rw-r--r-- 1 gthomas gthomas      49 Mar 24 07:41 udev.conf

On my target:

root@teton-p0382:~# opkg search /etc/udev/hwdb.bin
root@teton-p0382:~#

I seem to have gotten the hwdb, but not packaged correctly.  Again, on the target:

root@teton-p0382:~# opkg list-installed *udev*
eudev - 3.1.5-r0.2
eudev-hwdb - 3.1.5-r0.2
libudev1 - 3.1.5-r0.2
udev-cache - 3.1.5-r0.2
udev-extraconf - 1.1-r0.6
udev-rules-imx - 1.0-r0.6
root@teton-p0382:~# opkg files eudev-hwdb
Package eudev-hwdb (3.1.5-r0.2) is installed on root and has the following files:
/etc/udev/hwdb.d/20-pci-classes.hwdb
/etc/udev/hwdb.d/70-pointingstick.hwdb
/etc/udev/hwdb.d/70-mouse.hwdb
/etc/udev/hwdb.d/
/etc/udev/hwdb.d/20-acpi-vendor.hwdb
/etc/udev/hwdb.d/20-usb-vendor-model.hwdb
/etc/udev/hwdb.d/20-sdio-vendor-model.hwdb
/etc/udev/hwdb.d/60-keyboard.hwdb
/etc/udev/hwdb.d/20-net-ifname.hwdb
/etc/udev/hwdb.d/20-usb-classes.hwdb
/etc/udev/hwdb.d/20-bluetooth-vendor-product.hwdb
/etc/udev/hwdb.d/60-evdev.hwdb
/etc/udev/hwdb.d/20-pci-vendor-model.hwdb
/etc/udev/hwdb.d/20-sdio-classes.hwdb
/etc/udev/hwdb.d/20-OUI.hwdb

So /etc/udev/hwdb.bin is somehow unpackaged (an orphan)?

Also, how will I prevent eudev-hwdb from being sucked in if I
only depend [RDEPENDS/RRECOMMENDS] on 'udev'?

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

