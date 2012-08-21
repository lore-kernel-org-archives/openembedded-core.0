Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T3uJR-0000n0-Nc
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 21:40:30 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 21 Aug 2012 12:28:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,803,1336374000"; d="scan'208";a="211842932"
Received: from unknown (HELO [10.255.13.49]) ([10.255.13.49])
	by fmsmga002.fm.intel.com with ESMTP; 21 Aug 2012 12:28:11 -0700
Message-ID: <5033E14B.4020003@linux.intel.com>
Date: Tue, 21 Aug 2012 12:28:11 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Tom Rini <tom.rini@gmail.com>
References: <1345222136-24839-1-git-send-email-trini@ti.com>
	<1345222136-24839-2-git-send-email-trini@ti.com>
	<502F01FB.1020303@linux.intel.com>
	<20120820175702.GA9706@bill-the-cat>
In-Reply-To: <20120820175702.GA9706@bill-the-cat>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] u-boot-fw-utils: Correct EXTRA_OEMAKE
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
X-List-Received-Date: Tue, 21 Aug 2012 19:40:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/20/2012 10:57 AM, Tom Rini wrote:
> On Fri, Aug 17, 2012 at 07:46:19PM -0700, Saul Wold wrote:
>> On 08/17/2012 09:48 AM, Tom Rini wrote:
>>> - HOSTCFLAGS / HOSTLDFLAGS have been valid for a long time for tools/env
>>> - HOSTSTRIP will be needed in the future, does no harm to be correct
>>>    now.
>>>
>>> Signed-off-by: Tom Rini <trini@ti.com>
>>> ---
>>>   meta/recipes-bsp/u-boot/u-boot-fw-utils_2011.06.bb |    4 ++--
>>>   .../u-boot/u-boot-fw-utils_2012.04.01.bb           |    4 +++-
>>>   2 files changed, 5 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2011.06.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2011.06.bb
>>> index 7c4df1a..99eef15 100644
>>> --- a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2011.06.bb
>>> +++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2011.06.bb
>>> @@ -6,7 +6,7 @@ SECTION = "bootloader"
>>>
>>>   DEPENDS = "mtd-utils"
>>>
>>> -PR = "r1"
>>> +PR = "r2"
>>>
>>>   SRC_URI = "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2"
>>>
>>> @@ -15,7 +15,7 @@ SRC_URI[sha256sum] = "362ddb935885da98cf461eba08f31e3e59d0c4ada6cb2fa15596f43af3
>>>
>>>   S = "${WORKDIR}/u-boot-${PV}"
>>>
>>> -EXTRA_OEMAKE = 'HOSTCC="${CC}"'
>>> +EXTRA_OEMAKE = 'HOSTCC="${CC}" HOSTCFLAGS="${CFLAGS} HOSTLDFLAGS="${LDFLAGS}" HOSTSTRIP=true'

Ah, finally here it is ----------------------------------^

Missing a "!

Sau!

>>>
>>>   do_compile () {
>>>     oe_runmake env
>>> diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2012.04.01.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2012.04.01.bb
>>> index fe3422a..364f8a5 100644
>>> --- a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2012.04.01.bb
>>> +++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2012.04.01.bb
>>> @@ -5,6 +5,8 @@ SECTION = "bootloader"
>>>
>>>   DEPENDS = "mtd-utils"
>>>
>>> +PR = "r1"
>>> +
>>>   # This is needs to be validated among supported BSP's before we can
>>>   # make it default
>>>   DEFAULT_PREFERENCE = "-1"
>>> @@ -20,7 +22,7 @@ SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
>>>
>>>   S = "${WORKDIR}/git"
>>>
>>> -EXTRA_OEMAKE = 'HOSTCC="${CC}"'
>>> +EXTRA_OEMAKE = 'HOSTCC="${CC}" HOSTCFLAGS="${CFLAGS} HOSTLDFLAGS="${LDFLAGS}" HOSTSTRIP=true'
>>>
>>>   do_compile () {
>>>     oe_runmake env
>>>
>>
>>
>> This had a failure also:
>>
>>> ERROR: Function failed: do_install (see /srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/work/i586-poky-linux/u-boot-fw-utils-2011.06-r2/temp/log.do_install.69452 for further information)
>>> ERROR: Logfile of failure stored in: /srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/work/i586-poky-linux/u-boot-fw-utils-2011.06-r2/temp/log.do_install.69452
>>> Log data follows:
>>> | DEBUG: Executing shell function do_install
>>> | install: cannot stat `/srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/work/i586-poky-linux/u-boot-fw-utils-2011.06-r2/u-boot-2011.06/tools/env/fw_printenv': No such file or directory
>>> | ERROR: Function failed: do_install (see /srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/work/i586-poky-linux/u-boot-fw-utils-2011.06-r2/temp/log.do_install.69452 for further information)
>>> NOTE: package u-boot-fw-utils-2011.06-r2: task do_install: Failed
>>> ERROR: Task 2755 (/srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-world/build/meta/recipes-bsp/u-boot/u-boot-fw-utils_2011.06.bb, do_install) failed with exit code '1'
>
> I have to admit that since these were trivial changes I didn't try and
> build them.  But oe-core doesn't build anymore.  Doing:
> git pull
> git reset --hard origin/master
> rm -rf build/conf build/tmp*
> . oe-init-build-env
> bitbake core-image-sato
>
> Fails and can't give me a log.  Can you pastebin the compile logs?

Finally the compile log, sorry had other fires I was fighting, seems the 
make is doing nothing!

> DEBUG: Executing shell function do_compile
> NOTE: make -j 6 HOSTCC=arm-poky-linux-gnueabi-gcc  -march=armv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8 --sysroot=/intel/poky/builds/world/tmp/sysroots/beagleboard HOSTCFLAGS= -O2 -pipe -g -feliminate-unused-debug-types HOSTLDFLAGS=-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed HOSTSTRIP=true tools
> 	make -j 6 HOSTCC=arm-poky-linux-gnueabi-gcc -march=armv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8 --sysroot=/intel/poky/builds/world/tmp/sysroots/beagleboard HOSTCFLAGS= -O2 -pipe -g -feliminate-unused-debug-types HOSTLDFLAGS=-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed HOSTSTRIP=true tools
> DEBUG: Shell function do_compile finished


> Thanks!
>


