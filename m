Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1UO5ZP-0007Gu-6Z
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Apr 2013 14:16:40 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 05 Apr 2013 04:59:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,414,1363158000"; d="scan'208";a="281245365"
Received: from dell-desktop.rb.intel.com (HELO [10.237.105.59])
	([10.237.105.59])
	by azsmga001.ch.intel.com with ESMTP; 05 Apr 2013 04:59:23 -0700
Message-ID: <515EBCA1.6000502@intel.com>
Date: Fri, 05 Apr 2013 14:59:29 +0300
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130308 Thunderbird/17.0.4
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1365006329-20964-1-git-send-email-radu.moisan@intel.com>
	<1365006329-20964-3-git-send-email-radu.moisan@intel.com>
	<825B3AFA-0F5B-45F2-B4DE-D359A1E4414B@dominion.thruhere.net>
	<515D75D5.4020204@intel.com>
	<1B3FBA45-5658-4BF8-A854-84058F80DCBF@dominion.thruhere.net>
In-Reply-To: <1B3FBA45-5658-4BF8-A854-84058F80DCBF@dominion.thruhere.net>
Subject: Re: [PATCH 2/2] udev: enable multilib support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Apr 2013 12:16:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


On 04/04/2013 04:03 PM, Koen Kooi wrote:
> Op 4 apr. 2013, om 14:45 heeft Radu Moisan <radu.moisan@intel.com> het volgende geschreven:
>
>> On 04/03/2013 08:58 PM, Koen Kooi wrote:
>>> Op 3 apr. 2013, om 18:25 heeft Radu Moisan <radu.moisan@intel.com> het volgende geschreven:
>>>
>>>> Use base_libdir in place of hardcoded /lib
>>>> Fixes [YOCTO #4096]
>>>>
>>>> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
>>>> ---
>>>> meta/recipes-core/udev/udev.inc |    1 +
>>>> 1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
>>>> index e358d2d..6fd0240 100644
>>>> --- a/meta/recipes-core/udev/udev.inc
>>>> +++ b/meta/recipes-core/udev/udev.inc
>>>> @@ -76,6 +76,7 @@ FILES_udev-utils = "${bindir}/udevadm"
>>>>
>>>> do_install_append () {
>>>> 	install -d ${D}${sysconfdir}/init.d
>>>> +	sed -i 's@/lib/udev@${base_libdir}/udev@g' ${WORKDIR}/init
>>>> 	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/udev
>>>> 	install -m 0755 ${WORKDIR}/udev-cache ${D}${sysconfdir}/init.d/udev-cache
>>> NACK! The udev maintainers have been clear that it is always /lib/udev, even on 64 bit systems, so you're not fixing a problem, you're creating an extra one.
>> Koen, do you agree with this one?
>> http://patches.openembedded.org/patch/41167/
> That patch seems to match what Fedora does:
>
> koen@rrMBP setup-scripts]$ file /lib/udev/*
> /lib/udev/accelerometer:             ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux 2.6.32, BuildID[sha1]=0x600a72599b0896506d2cff430b7126d912370056, not stripped
> /lib/udev/ata_id:                    ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux 2.6.32, BuildID[sha1]=0x84bbaed9b1588de0a405bde9c7f7350f4be6839e, not stripped
> /lib/udev/bluetooth_serial:          POSIX shell script, ASCII text executable
> /lib/udev/cdrom_id:                  ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux 2.6.32, BuildID[sha1]=0x8bdb6f801be7f68939ece42f4661685654699a01, not stripped
> /lib/udev/check-ptp-camera:          Bourne-Again shell script, ASCII text executable
> /lib/udev/collect:                   ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux 2.6.32, BuildID[sha1]=0xab7db8974d08b609e4750750043d8093d4aa3b80, not stripped
> /lib/udev/findkeyboards:             POSIX shell script, ASCII text executable
> /lib/udev/hwdb.d:                    directory
> /lib/udev/ift-load:                  ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux 2.6.32, BuildID[sha1]=0x49f9ba51194518eb078834e8ff5630253e84bfa0, stripped
> /lib/udev/iphone-set-info:           ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux 2.6.32, BuildID[sha1]=0x70bd3a730278aace048187c123d500b63d2e3adb, stripped
> /lib/udev/ipod-set-info:             ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux 2.6.32, BuildID[sha1]=0x52ed540687d1e2806c5c2a836b60141e2f3d8c36, stripped
> /lib/udev/keyboard-force-release.sh: POSIX shell script, ASCII text executable
> /lib/udev/keymap:                    ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux 2.6.32, BuildID[sha1]=0x8b2541255989492410485c979eee55d8237fa85f, not stripped
> /lib/udev/keymaps:                   directory
> /lib/udev/mtd_probe:                 ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux 2.6.32, BuildID[sha1]=0x4bb384bb9a2c32cd7a8c8cd3db15f0a44572d5a1, not stripped
> /lib/udev/mtp-probe:                 ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux 2.6.32, BuildID[sha1]=0x5f6e4b4944c003b08788f0bfe97840da3cfcd29b, stripped
> /lib/udev/pcmcia-check-broken-cis:   ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux 2.6.32, BuildID[sha1]=0x1632f66c648501cf19bb478f50ee689e5caa1590, stripped
> /lib/udev/pcmcia-socket-startup:     ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux 2.6.32, BuildID[sha1]=0x48bf0e8e9461ed430c7173974795f3bd1b0d42a6, stripped
> /lib/udev/rename_device:             ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux 2.6.32, BuildID[sha1]=0x9740fdf52fb7304ddb56ecef2d3b4e157fd208dc, stripped
> /lib/udev/rules.d:                   directory
> /lib/udev/scsi_id:                   ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux 2.6.32, BuildID[sha1]=0x9ca187eac5c28bdcf96b56002329317099870c3b, not stripped
> /lib/udev/tascam_fpga:               POSIX shell script, ASCII text executable
> /lib/udev/tascam_fw:                 POSIX shell script, ASCII text executable
> /lib/udev/udev-add-printer:          Python script, ASCII text executable
> /lib/udev/udev-configure-printer:    ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux 2.6.32, BuildID[sha1]=0xb0ddd749dbefd5abced9b5b64fc5f1280199f2aa, stripped
> /lib/udev/usb_modeswitch:            POSIX shell script, ASCII text executable
> /lib/udev/v4l_id:                    ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux 2.6.32, BuildID[sha1]=0xa8f5533157c207a48ba3876ae61b1c73cb9733fc, not stripped
>
Same thing on my ubuntu.
What I understand from this is that Koen is referring to 64bit binary 
files located in noarch_base_libdir, that is /lib. Please correct me if 
I'm wrong.
Another thing I bumped into... is there any reason why udevd ends up in 
/lib (/lib64) and not in /sbin? On my machine is located in /sbin and 
I'm assuming it is the same for most distributions.

Radu


