Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 07E0B771D7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 08:59:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v3D8xUfG019689
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 13 Apr 2017 01:59:31 -0700 (PDT)
Received: from [128.224.162.160] (128.224.162.160) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 13 Apr 2017 01:59:29 -0700
To: Patrick Ohly <patrick.ohly@intel.com>
References: <cover.1491902179.git.liezhi.yang@windriver.com>
	<902f18e3b4520021f20feaf3522ba6a52cbc9031.1491902179.git.liezhi.yang@windriver.com>
	<1492073188.27604.46.camel@intel.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <9b2b9be1-26a3-0002-2ff0-8dfd91abaec8@windriver.com>
Date: Thu, 13 Apr 2017 16:59:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1492073188.27604.46.camel@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/7] runqemu: do not rely on grepping images
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
X-List-Received-Date: Thu, 13 Apr 2017 08:59:32 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Patrick,

On 04/13/2017 04:46 PM, Patrick Ohly wrote:
> On Tue, 2017-04-11 at 02:21 -0700, Robert Yang wrote:
>> Fixed when the image is large and not enough memory:
>>   grep: memory exhausted
>>   Aborted
>>
>> [YOCTO #11073]
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>  meta/classes/qemuboot.bbclass |  3 +++
>>  scripts/runqemu               | 19 +++++++++++--------
>>  2 files changed, 14 insertions(+), 8 deletions(-)
>>
>> diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
>> index 3ca97cad4c..2870388dfb 100644
>> --- a/meta/classes/qemuboot.bbclass
>> +++ b/meta/classes/qemuboot.bbclass
>> @@ -64,6 +64,9 @@ QB_DEFAULT_FSTYPE ?= "ext4"
>>  QB_OPT_APPEND ?= "-show-cursor"
>>  QB_NETWORK_DEVICE ?= "-device virtio-net-pci,netdev=net0,mac=@MAC@"
>>
>> +# This should be kept align with ROOT_VM
>> +QB_DRIVE_TYPE ?= "/dev/sd"
>
> Now that I am faced with the problem of selecting virtio I'm starting to
> wonder how to do that.
>
> Our refkit image doesn't expect the image on a particular drive, using
> PARTUUID instead to find it. But when running under qemu, it would be
> nice to use virtio for performance reasons... if the kernel supports it.
> But that's not something that the image recipe or even the distro should
> make assumptions about.
>
> It seems safer to let the machine configuration which chooses the kernel
> also set QB_DRIVE_TYPE, but with ?= so that it can still be changed
> elsewhere. In that case, we would need:
>
> qemuboot.bbclass: QB_DRIVE_TYPE ??= "/dev/sd"
> qemuboot-intel.inc (from meta-intel): QB_DRIVE_TYPE ?= "/dev/vd"
> distro, local or image (optional): QB_DRIVE_TYPE = "/dev/..."

The "??=" is not needed, just "?=" in qemuboot.bbclass is OK, we have
"?=" in other bbclass, too, and they can be overrided as expected.
For example:

qemuboot-intel.inc (from meta-intel): QB_DRIVE_TYPE ?= "/dev/vd"

Then it would be vd, and if you set = /dev/hd in local.conf, the it would
be /dev/hd.

// Robert

>
>> +                elif self.get('QB_DRIVE_TYPE'):
>> +                    drive_type = self.get('QB_DRIVE_TYPE')
>> +                    if drive_type.startswith("/dev/sd"):
>>                          logger.info('Using scsi drive')
>>                          vm_drive = '-drive if=none,id=hd,file=%s,format=%s -device virtio-scsi-pci,id=scsi -device scsi-hd,drive=hd' \
>>                                         % (self.rootfs, rootfs_format)
>> -                    elif subprocess.call(cmd2, shell=True) == 0:
>> +                    elif drive_type.startswith("/dev/hd"):
>>                          logger.info('Using ide drive')
>>                          vm_drive = "%s,format=%s" % (self.rootfs, rootfs_format)
>>                      else:
>> -                        logger.warn("Can't detect drive type %s" % self.rootfs)
>> -                        logger.warn('Trying to use virtio block drive')
>> -                        vm_drive = '-drive if=virtio,file=%s,format=%s' % (self.rootfs, rootfs_format)
>> +                        logger.warn("Unknown QB_DRIVE_TYPE: %s" % drive_type)
>> +
>> +                if not vm_drive:
>> +                    logger.warn("Failed to figure out drive type, consider define or fix QB_DRIVE_TYPE")
>> +                    logger.warn('Trying to use virtio block drive')
>> +                    vm_drive = '-drive if=virtio,file=%s,format=%s' % (self.rootfs, rootfs_format)
>
> Here "/dev/sd" should be treated as an explicit selection of virtio,
> without triggering warnings.

Did you mean /dev/vd ? If yes, I'm fine with that.

// Robert

>
> I'll send a patch for both if there are no objections.
>

