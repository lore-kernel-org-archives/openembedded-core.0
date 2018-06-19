Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A6F8E76050
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 20:02:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w5JK1Njq026108
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 19 Jun 2018 13:01:44 -0700
Received: from [172.25.44.2] (172.25.44.2) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Tue, 19 Jun 2018 13:01:18 -0700
To: Khem Raj <raj.khem@gmail.com>, "Burton, Ross" <ross.burton@intel.com>
References: <20180504123244.43049-1-alexander.kanavin@linux.intel.com>
	<20180504123244.43049-12-alexander.kanavin@linux.intel.com>
	<32602a82-f07d-3c69-2305-3f0f17f4c9dc@windriver.com>
	<CAJTo0La2eicsFUCAPOktYs110iFdOrFWNzLXC+EeeRrDzBHtNQ@mail.gmail.com>
	<282aab6b-9e7c-1d85-8e1e-443d1156c1fa@gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <b536b753-8e56-bb37-5a7a-1f66092e9c02@windriver.com>
Date: Tue, 19 Jun 2018 16:01:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <282aab6b-9e7c-1d85-8e1e-443d1156c1fa@gmail.com>
X-Originating-IP: [172.25.44.2]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 12/14] meson: update to 0.46.0 -- broke systemd on qemuppc
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
X-List-Received-Date: Tue, 19 Jun 2018 20:02:25 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Alex wrote:
> The order of arguments to compiler and linker matters. I remember that
> when converting recipes from autotools to meson, I had to fix the
> order to be exactly same, or some weird, arch-specific issues arose.
> Can you check the precise command line in both working and broken
> case, and what has changed there?
> 
> Alex

I did two builds with a local change to compile using
ninja -v to get the actual compiler/linker lines.

after:  a6b62ef9ae meson: update to 0.46.0 - BAD
before: 26fba81701 webkitgtk: update to 2.20.1 - good

The list of compiler arguments (when building boot-timestamps.c)
is identical aside from an odd path change but the order
changes across the meson 0.46.0 update:

The odd path change is:

before:
    'src/shared/            systemd-shared-237@sta/acpi-fpdt.c.o'
after:
    'src/shared/src@shared@@systemd-shared-237@sta/acpi-fpdt.c.o'
This looks odd to me but I'm ignoring it since the files are
clearly found by the build.

The compiler flag order difference is too large for a civilized
email so it's here:
diff -Naur: https://pastebin.com/pWSzDm5W
sdiff -t  : https://pastebin.com/5BX8QvNs


When linking libsystemd-shared-237.so the location of the:
    -Wl,--end-group
option changes:

before:

-lrt
-L/.../qppc-sd/tmp/work/ppc7400-poky-linux/systemd/1_237-r0/recipe-sysroot/usr//lib
-lcap
-lacl
-llzma
-lblkid
-Wl,--end-group <-----
-lrt

after:

-lrt
-Wl,--end-group <-----
-L/.../qppc-sd/tmp/work/ppc7400-poky-linux/systemd/1_237-r0/recipe-sysroot/usr//lib
-lcap
-lacl
-llzma
-lblkid
-lrt


and some _apparently_ redundant libraries and lib paths were dropped:

both:
-L/.../qppc-sd/tmp/work/ppc7400-poky-linux/systemd/1_237-r0/recipe-sysroot/usr//lib
-lcap
-lblkid
-lrt

only before:
-L/.../qppc-sd/tmp/work/ppc7400-poky-linux/systemd/1_237-r0/recipe-sysroot/usr//lib
-lcap
-lblkid


On 06/19/2018 12:00 PM, Khem Raj wrote:
> 
> 
> On 6/19/18 2:59 AM, Burton, Ross wrote:
>> On 19 June 2018 at 06:03, Randy MacLeod <randy.macleod@windriver.com> 
>> wrote:
>>> It seems that this meson update broke systemd on qemuppc.
>>> I'll look into it a more tomorrow but below is what I know so far.
>>> It looks like the libsystemd-shared.so size increased by 18% despite
>>> the build flags being the same!
>>>
>>> Despite my IRC handle, I'm a meson newbie so any tips will
>>> be appreciated. I'll work on getting meson/ninja to be more
>>> verbose tomorrow to track down what really changed.
>>>
>>>
>>> I recently started testing qemuppc by booting
>>> core-image-minimal with systemd as init. It fails with:
>>>
>>>     /sbin/init: error while loading shared libraries:
>>>        /lib/systemd/libsystemd-shared-237.so: R_PPC_REL24 relocation at
>>> 0x0054574c for symbol `strlen' out of range
> 
> This would also indicate that libsystemd is probably missing -fPIC 
> during compile, can you check the compiler cmdline passed when building 
> on of .o files that gets includes in libsystemd.

fPIC is used in both cases:

$ grep fPIC temp-good/log.do_compile.boot-timestamp \
             temp-bad/log.do_compile.boot-timestamp
temp-good/log.do_compile.boot-timestamp:-fPIC
temp-bad/log.do_compile.boot-timestamp:-fPIC


I don't have any more time for this today so I'm sending this
update. My next step is to examine the libsystemd-shared-237.so
file itself using readelf and/or objdump to see why the file size
increased ... unless someone has a better idea.

../Randy

> 
>>>
>>> or in some cases:
>>>
>>>    systemd[1]: \
>>>       unhandled signal 11 at b804b784 nip 0070d184 lr 008ee1ac code 1
>>>    Kernel panic - not syncing: \
>>>       Attempted to kill init! exitcode=0x0000000b
>>> when running:
>>>      runqemu slirp nographic qemuppc ext4
>>>
>>> The error only appears when using the distro poky-lsb
>>> or a security template in the WR builds.
>>
>> Khem suggests that this is due to the new gcc and PIE on PPC being
>> bust, but even after passing no-pie this is still happening for me.
>>
>> Ross
>>


-- 
# Randy MacLeod
# Wind River Linux

