Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QEO5N-0001jq-B2
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Apr 2011 17:52:29 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 25 Apr 2011 08:49:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,265,1301900400"; d="scan'208";a="683653757"
Received: from unknown (HELO [10.255.12.237]) ([10.255.12.237])
	by fmsmga002.fm.intel.com with ESMTP; 25 Apr 2011 08:49:38 -0700
Message-ID: <4DB59811.5040109@linux.intel.com>
Date: Mon, 25 Apr 2011 08:49:37 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.10) Gecko/20100621 Fedora/3.0.5-1.fc13 Lightning/1.0b2pre
	Thunderbird/3.0.5
MIME-Version: 1.0
To: Gary Thomas <gary@mlbassoc.com>
References: <cover.1303539961.git.sgw@linux.intel.com>
	<a0629aa0dc55829565b7ab1725875eac065ab2f1.1303539961.git.sgw@linux.intel.com>
	<4DB562CF.1020100@mlbassoc.com>
In-Reply-To: <4DB562CF.1020100@mlbassoc.com>
X-Mailman-Approved-At: Mon, 25 Apr 2011 18:34:36 +0200
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org, Kang Kai <kai.kang@windriver.com>
Subject: Re: [PATCH 07/37] modutils-initscripts: fix wrong order of module loading happening in udev
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
X-List-Received-Date: Mon, 25 Apr 2011 15:52:29 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 04/25/2011 05:02 AM, Gary Thomas wrote:
> On 04/23/2011 12:28 AM, Saul Wold wrote:
>> From: =?UTF-8?q?Petr=20=C5=A0tetiar?=<ynezz@true.cz>
>>
>> In the current state, udev init script is loaded as 3rd and
>> modutils.sh as
>> 20th, so udevadm called in udev init script loads all kernel modules
>> in some
>> unpredictable order, not honoring in any way specified order of
>> modules in
>> /etc/modules. This causes some troubles mainly in the first boot. So
>> to fix
>> this we now move loading of the kernel modules just before we exec
>> udev init
>> script. Example of the current state:
>>
>> Starting udev
>> rtc-m48t86 rtc-m48t86: rtc core: registered m48t86 as rtc0
>> rtc-m48t86 rtc-m48t86: battery ok
>> ep93xx-rtc ep93xx-rtc: rtc core: registered ep93xx-rtc as rtc1
>>
>> root@ts72xx:~# cat /etc/modules
>> rtc-ep93xx
>> ohci-hcd
>> ts72xx_sbcinfo
>> rtc-m48t86
>>
>> As you can guess, this is really wrong behaviour, because I've rtc1 as
>> the
>> main time source for my system.
>>
>> root@ts72xx:~# cat /etc/default/hwclock
>> HWCLOCKACCESS=yes
>> HWCLOCKDEVICE=/dev/rtc1
>>
>> Expected behaviour with this patch applied:
>>
>> Please wait: booting...
>> ep93xx-rtc ep93xx-rtc: rtc core: registered ep93xx-rtc as rtc0
>> usbcore: registered new device driver usb
>> ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
>> ...
>> rtc-m48t86 rtc-m48t86: rtc core: registered m48t86 as rtc1
>> rtc-m48t86 rtc-m48t86: battery ok
>> Starting udev
>>
>> Signed-off-by: Petr Štetiar<ynezz@true.cz>
>>
>> (based on http://patches.openembedded.org/patch/1917/)
>> Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
>> Signed-off-by: Saul Wold<sgw@linux.intel.com>
>> ---
>> .../modutils/modutils-initscripts.bb | 4 ++--
>> 1 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-kernel/modutils/modutils-initscripts.bb
>> b/meta/recipes-kernel/modutils/modutils-initscripts.bb
>> index 1665955..5ae34b4 100644
>> --- a/meta/recipes-kernel/modutils/modutils-initscripts.bb
>> +++ b/meta/recipes-kernel/modutils/modutils-initscripts.bb
>> @@ -4,10 +4,10 @@ LICENSE = "PD"
>> LIC_FILES_CHKSUM = "file://LICENSE;md5=7bf87fc37976e93ec66ad84fac58c098"
>> SRC_URI = "file://modutils.sh \
>> file://PD.patch"
>> -PR = "r4"
>> +PR = "r5"
>>
>> INITSCRIPT_NAME = "modutils.sh"
>> -INITSCRIPT_PARAMS = "start 20 S ."
>> +INITSCRIPT_PARAMS = "start 2 S ."
>>
>> inherit update-rc.d
>>
>
> Should there not be a corresponding change to modutils_2.4.27.bb? It's
> not clear to me
> where there are these two separate recipes, but they should at least be
> kept in sync.
>
Gary,

Could you please resend this as a proper patch with Signed-off-by and 
commit info.

Thanks
	Sau!

> diff --git a/meta/recipes-kernel/modutils/modutils_2.4.27.bb
> b/meta/recipes-kernel/modutils/modutils_2.4.27.bb
> index 1ebc90c..2944201 100644
> --- a/meta/recipes-kernel/modutils/modutils_2.4.27.bb
> +++ b/meta/recipes-kernel/modutils/modutils_2.4.27.bb
> @@ -5,7 +5,7 @@ manageable for all users, administrators and
> distribution maintainers."
> LICENSE = "GPLv2"
> LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
> DEPENDS = "bison-native"
> -PR = "r9"
> +PR = "r10"
>
> SRC_URI =
> "${KERNELORG_MIRROR}/linux/utils/kernel/modutils/v2.4/modutils-${PV}.tar.bz2
> \
> file://lex.l.diff;patch=1 \
> @@ -51,7 +51,7 @@ if test -n "$D"; then
> done
> fi
> fi
> -update-rc.d $D modutils.sh start 20 S .
> +update-rc.d $D modutils.sh start 2 S .
> }
>
> pkg_prerm_modutils () {
>


