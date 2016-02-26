Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 8B2C87740F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 15:44:09 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 26 Feb 2016 07:44:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,498,1449561600"; d="scan'208";a="753809466"
Received: from unknown (HELO [10.219.25.111]) ([10.219.25.111])
	by orsmga003.jf.intel.com with ESMTP; 26 Feb 2016 07:44:09 -0800
To: Andre McCurdy <armccurdy@gmail.com>
References: <cover.1456442768.git.alejandro.hernandez@linux.intel.com>
	<CAJ86T=WM=9YKka3w9qQtRDRnJFDXc+uSS213NFN2aNUEwTdF8A@mail.gmail.com>
	<56D071D5.5030507@linux.intel.com>
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Message-ID: <56D07311.1040600@linux.intel.com>
Date: Fri, 26 Feb 2016 09:45:21 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <56D071D5.5030507@linux.intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Replaces udev with eudev for compatibility when using sysvinit on newer kernels
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
X-List-Received-Date: Fri, 26 Feb 2016 15:44:10 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 02/26/2016 09:40 AM, Alejandro Hernandez wrote:
>
>
> On 02/26/2016 02:24 AM, Andre McCurdy wrote:
>> On Thu, Feb 25, 2016 at 3:34 PM, Alejandro Hernandez
>> <alejandro.hernandez@linux.intel.com> wrote:
>>> udev has started to fail on new kernels (4.4), due to being 
>>> deprecated in favor
>>> of systemd's udev implementation. To maintain a sysvinit alternative 
>>> we also
>>> need to provide an alternative to udev. Eudev is a fork of systemds 
>>> udev,
>>> this new eudev recipe provides upstream udev 220 funcitonality.
>> Builds OK but results in the network no longer being started
>> automatically at boot up - due to "eth0" now becoming "enp0s3".
>>
>> Adding an entry for enp0s3 to the init-ifupdown interfaces file is a
>> solution. Running "touch /etc/udev/rules.d/80-net-name-slot.rules" as
>> suggested by the eudev Wiki (to force the interface name back eth0)
>> seems to work too.
>
> I didn't have the same issue, but thanks for pointing that out, 
> sending a v2 later.
>>
>>    https://wiki.gentoo.org/wiki/Eudev
>>
>> Is there a recommended migration path so that the primary ethernet
>> interface is brought up automatically, as it was before?
>
> Not as far as I'm concerned, its matter of deciding if we should go 
> with the old naming scheme or the new one, unless it was already 
> decided before, I'm assuming it would be the latter.

Sorry, now I understand what you meant, and I see the issue, since, we 
would need to create our own naming scheme at build time, instead of runtime
>>
>>> - libgudev is not provided by eudev as it was with udev before
>>> - We can now drop usbutils_007 since usbutils_008 is now compatible
>>>    also with eudev, and not only with systemd's udev
>>> - Adds new eudev package to maintainers.inc
>>>
>>> The following changes since commit 
>>> 23056103c949b498c23b47579e8dd57ce78e6ed9:
>>>
>>>    uclibc: Do not use immediate expansion operator (2016-02-22 
>>> 20:42:48 +0000)
>>>
>>> are available in the git repository at:
>>>
>>>    git://git.yoctoproject.org/poky-contrib hsalejandro/eudev
>>> http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=hsalejandro/eudev
>>>
>>> Alejandro Hernandez (4):
>>>    eudev: Replaces udev with eudev for compatibility when sysvinit on
>>>      newer kernels
>>>    libgudev: Fix for new eudev implementation
>>>    usbutils: Fix for new eudev implementation
>>>    maintainers.inc: Add new eudev package and change maintainership 
>>> fore
>>>      udev
>>>
>>>   meta-yocto/conf/distro/include/maintainers.inc     |   2 +-
>>>   meta/conf/distro/include/default-providers.inc     |   2 +-
>>>   meta/recipes-bsp/usbutils/usbutils-008/iconv.patch |  41 --------
>>>   meta/recipes-bsp/usbutils/usbutils/iconv.patch     |  29 +++---
>>>   meta/recipes-bsp/usbutils/usbutils_007.bb          |  31 ------
>>>   meta/recipes-bsp/usbutils/usbutils_008.bb          |   5 +-
>>>   .../udev/{udev => eudev}/devfs-udev.rules          |   0
>>>   meta/recipes-core/udev/{udev => eudev}/init        |   0
>>>   meta/recipes-core/udev/{udev => eudev}/links.conf  |   0
>>>   meta/recipes-core/udev/{udev => eudev}/local.rules |   0
>>>   .../udev/{udev => eudev}/permissions.rules         |   0
>>>   meta/recipes-core/udev/{udev => eudev}/run.rules   |   0
>>>   meta/recipes-core/udev/{udev => eudev}/udev-cache  |   0
>>>   .../udev/{udev => eudev}/udev-cache.default        |   0
>>>   meta/recipes-core/udev/{udev => eudev}/udev.rules  |   0
>>>   meta/recipes-core/udev/eudev_3.1.5.bb              |  83 
>>> +++++++++++++++
>>>   meta/recipes-core/udev/udev.inc                    | 112 
>>> ---------------------
>>>   ...yboard_force_release.sh-shell-script-path.patch |  35 -------
>>>   ...-Add-stdint.h-as-it-was-removed-from-mtd-.patch |  29 ------
>>>   ...c-Makefile.am-Check-for-input.h-and-input.patch |  52 ----------
>>>   .../recipes-core/udev/udev/add-install-ptest.patch |  86 
>>> ----------------
>>>   .../udev/udev/avoid-mouse-autosuspend.patch        |  25 -----
>>>   .../udev/udev/fix_rule-syntax-regex-ptest.patch    |  58 -----------
>>>   meta/recipes-core/udev/udev/run-ptest              |   5 -
>>>   meta/recipes-core/udev/udev_182.bb                 |   9 --
>>>   meta/recipes-gnome/libgudev/libgudev_230.bb        |   3 +-
>>>   26 files changed, 102 insertions(+), 505 deletions(-)
>>>   delete mode 100644 meta/recipes-bsp/usbutils/usbutils-008/iconv.patch
>>>   delete mode 100644 meta/recipes-bsp/usbutils/usbutils_007.bb
>>>   rename meta/recipes-core/udev/{udev => eudev}/devfs-udev.rules (100%)
>>>   rename meta/recipes-core/udev/{udev => eudev}/init (100%)
>>>   rename meta/recipes-core/udev/{udev => eudev}/links.conf (100%)
>>>   rename meta/recipes-core/udev/{udev => eudev}/local.rules (100%)
>>>   rename meta/recipes-core/udev/{udev => eudev}/permissions.rules 
>>> (100%)
>>>   rename meta/recipes-core/udev/{udev => eudev}/run.rules (100%)
>>>   rename meta/recipes-core/udev/{udev => eudev}/udev-cache (100%)
>>>   rename meta/recipes-core/udev/{udev => eudev}/udev-cache.default 
>>> (100%)
>>>   rename meta/recipes-core/udev/{udev => eudev}/udev.rules (100%)
>>>   create mode 100644 meta/recipes-core/udev/eudev_3.1.5.bb
>>>   delete mode 100644 meta/recipes-core/udev/udev.inc
>>>   delete mode 100644 
>>> meta/recipes-core/udev/udev/0001-Fixing-keyboard_force_release.sh-shell-script-path.patch
>>>   delete mode 100644 
>>> meta/recipes-core/udev/udev/0001-mtd_probe.h-Add-stdint.h-as-it-was-removed-from-mtd-.patch
>>>   delete mode 100644 
>>> meta/recipes-core/udev/udev/0002-configure.ac-Makefile.am-Check-for-input.h-and-input.patch
>>>   delete mode 100644 
>>> meta/recipes-core/udev/udev/add-install-ptest.patch
>>>   delete mode 100644 
>>> meta/recipes-core/udev/udev/avoid-mouse-autosuspend.patch
>>>   delete mode 100644 
>>> meta/recipes-core/udev/udev/fix_rule-syntax-regex-ptest.patch
>>>   delete mode 100644 meta/recipes-core/udev/udev/run-ptest
>>>   delete mode 100644 meta/recipes-core/udev/udev_182.bb
>>>
>>> -- 
>>> 2.6.2
>>>
>>> -- 
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


