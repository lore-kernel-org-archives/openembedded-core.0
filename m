Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 114476011A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2016 02:43:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u4K2huAZ025759
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 19 May 2016 19:43:57 -0700
Received: from [128.224.162.214] (128.224.162.214) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 19 May 2016 19:43:55 -0700
To: Nathan Rossi <nathan@nathanrossi.com>
References: <cover.1462867278.git.liezhi.yang@windriver.com>
	<CA+aJhH1hOeD=oj7guxX8_Wm9gU6OS6W=r32WJFgGuLzAjTcw2g@mail.gmail.com>
	<573E770E.9010503@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <573E79EA.1090005@windriver.com>
Date: Fri, 20 May 2016 10:43:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <573E770E.9010503@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 0/8] [WIP] runqemu/runqemu-internal: refactor it
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
X-List-Received-Date: Fri, 20 May 2016 02:44:00 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 05/20/2016 10:31 AM, Robert Yang wrote:
> Hi Nathan,
>
> Thanks, but I'm sorry to say that this is only a RFC, we may change
> it a lot, I will talk with RP, and let you when we have progresses.

Oonce we change it a lot, for example, change runqemu to use python
rather than shell script, your current work based on these patches
may not work:-(, I will let you know once we have final decisions.

// Robert

>
> // Robert
>
> On 05/19/2016 10:57 PM, Nathan Rossi wrote:
>> On Tue, May 10, 2016 at 6:13 PM, Robert Yang <liezhi.yang@windriver.com> wrote:
>>> Hello,
>>>
>>> This is still WIP, I send this out to make sure that I won't walk on
>>> wrong way too far. Please feel free to give any comments.
>>
>> Hi Robert,
>>
>> This is great! So I went ahead and tested out converting the
>> qemumicroblaze and qemuzynq machines to work with these changes, as
>> well as some additional machines. Here is a meta-xilinx branch
>> (https://github.com/nathanrossi/meta-xilinx/tree/nrossi/runqemu-rfc)
>> with these changes for anyone who is curious.
>>
>> Everything seems to work well, I was able to boot all the meta-xilinx
>> QEMU machines. Although there were a couple of things that I noticed
>> when getting these machines going:
>>
>> QEMU_DTB, should probably be named QEMU_DTB_OPTIONS or alternatively
>> can just be included as part of QEMU_OPTIONS from within the bitbake
>> environment. But it would be nice to be able to just define the name
>> of the DTB and the runqemu scripts do the finding (like for kernel and
>> rootfs).
>>
>> The "-s" and the "-n" runqemu options add "console=ttyS0" to the
>> kernel options regardless of target. For qemuzynq you might have
>> noticed the sed expression that overrides it previously
>> (http://git.openembedded.org/openembedded-core/tree/scripts/runqemu-internal#n494).
>>
>> It is probably worth pulling in serial kernel options from a bitbake
>> variable.
>>
>> Regards,
>> Nathan
>>
>>>
>>> TODO:
>>> * Update the one which uses runqemu, such as oeqa
>>> * Boot EFI image
>>> * Boot multilib image such as lib32-foo
>>> * Change the vars name such as QEMU_SYSTEM_OPTIONS and
>>>    QEMU_SECOND_SERIAL_OPT
>>> * More testing
>>>
>>>
>>> === Taken from patch 8/8's commit message:
>>> * Why refactor
>>>    The old runqemu had hardcoded machine knowledge, which limited its
>>>    usage, for example, qemu-system-foo can boot the target, but runqemu
>>>    can't, and we need edit runqemu/runqemu-internal a lot to support boot
>>>    it.
>>>
>>> * Brief introduction on implemention
>>>    The basic thought is that, machine/bsp developer knows clearly on
>>>    whether qemu can boot the target or not (QEMU_BOOT_SUPPORTED = "1" or
>>>    "0"), and how to boot it, so we leave these settings in the machine's
>>>    configuration.
>>>    - qemu-boot.bbclass will write machine's info to
>>>      ${DEPLOY_DIR_IMAGE}/qemu-boot, and runqemu will invoke it.
>>>    - We need use "runqemu -m <machine>" rather than "runqemu <machine>"
>>>      since the scripts knows nothing about machine any more, and the
>>>      similar to other old options, this is good for future's extension.
>>>    - I have updated all the machine's configuration except qemush4, since
>>>      I can't find this machine anywhere.
>>>    - Several machines such as genericx86 and genericx86-64 can be boot by
>>>      new runqemu without any changes.
>>>    - Added help info for supported options such as slirp and audio.
>>>
>>> * Usage
>>> Usage: runqemu <options>
>>>      -m <machine>, specify machine
>>>      -k <kernel>, specify kernel
>>>      -r <rootfs>, specify disk image, rootfs or nfs dir
>>>      -t <fstype>, specify fstypes, supported types:
>>>                   ext[234], jffs2, btrfs, cpio.gz(ramfs), cpio, hddimg,
>>>                   hdddirect, vmdk, wic, qcow2, vdi
>>>      -n, nographic, disables video console
>>>      -K, enable KVM when running x86 and x86-64 (VT-capable CPU required)
>>>      -V, enables KVM with VHOST support when running x86 and x86-64
>>> (VT-capable CPU required)
>>>      -v, publicvnc - enable a VNC server open to all hosts
>>>      -u, slirp mode, use user mode networking (no root privilege is required)
>>>      -a, support audio
>>>      -s, enable a serial console on /dev/ttyS0
>>>      -q <qemuparams> - specify custom parameters to QEMU
>>>      -b <bootparams> - specify custom kernel parameters during boot
>>>      -p <portnum>, tcp serial port number
>>>      -B <biosdir>, bios directory
>>>      -F <biosfilename>, bios filename.
>>>
>>>      Examples:
>>>        runqemu -m qemuarm -n
>>>        runqemu -m qemuarm -t ext4
>>>        runqemu -m qemux86-64 -r core-image-sato -t ext4
>>>        runqemu -m qemux86 -r path/to/nfsrootdir/
>>>        runqemu -r path/to/deploy/dir/image/file.vmdk
>>>        runqemu -m qemumips -q "-m 256"
>>>        runqemu -m qemuppc -b "psplash=false"
>>>
>>> // Robert
>>>
>>> The following changes since commit ece101be5158beee709cdfbb85ecdbdc8d9fb864:
>>>
>>>    test-empty-image: Fix LIC_FILES_CHKSUM typo (2016-05-06 10:47:59 +0100)
>>>
>>> are available in the git repository at:
>>>
>>>    git://git.openembedded.org/openembedded-core-contrib rbt/runqemu
>>>
>>> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/runqemu
>>>
>>>
>>> Robert Yang (8):
>>>    qemu-boot.bbclass: add it for runqemu
>>>    qemu.inc: set QEMU_BOOT_SUPPORTED to 1
>>>    qemuarm.conf: set vars for runqemu
>>>    arch-arm64.inc: set vars for runqemu
>>>    arch-x86.inc: set vars for runqemu
>>>    arch-mips.inc: set vars for runqemu
>>>    arch-powerpc.inc: set vars for runqemu
>>>    runqemu/runqemu-internal: refactor it
>>>
>>>   meta/classes/image.bbclass                         |   3 +
>>>   meta/classes/qemu-boot.bbclass                     |  39 ++
>>>   meta/conf/bitbake.conf                             |   3 +
>>>   meta/conf/machine/include/arm/arch-arm64.inc       |   7 +
>>>   meta/conf/machine/include/arm/arch-armv6.inc       |   2 +
>>>   meta/conf/machine/include/mips/arch-mips.inc       |   5 +
>>>   meta/conf/machine/include/powerpc/arch-powerpc.inc |   5 +
>>>   meta/conf/machine/include/qemu.inc                 |   2 +
>>>   meta/conf/machine/include/tune-cortexa8.inc        |   2 +
>>>   meta/conf/machine/include/x86/arch-x86.inc         |   6 +
>>>   meta/conf/machine/qemuarm.conf                     |   3 +
>>>   scripts/runqemu                                    | 603 +++++++-----------
>>>   scripts/runqemu-internal                           | 678 +++++++--------------
>>>   13 files changed, 505 insertions(+), 853 deletions(-)
>>>   create mode 100644 meta/classes/qemu-boot.bbclass
>>>
>>> --
>>> 2.7.4
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>

