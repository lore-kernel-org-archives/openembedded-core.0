Return-Path: <artur@madrzak.eu>
Received: from s20.linuxpl.com (s20.linuxpl.com [78.46.68.78])
	by mail.openembedded.org (Postfix) with ESMTP id 2892D606CB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Nov 2017 10:01:05 +0000 (UTC)
Received: from user-94-254-229-11.play-internet.pl ([94.254.229.11]:7440
	helo=[192.168.43.120]) by s20.linuxpl.com with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.88)
	(envelope-from <artur@madrzak.eu>)
	id 1eACJ8-0003Yi-81; Thu, 02 Nov 2017 11:01:06 +0100
To: ed.bartosh@linux.intel.com, Nicolas Dechesne <nicolas.dechesne@linaro.org>
References: <123c3e3f-4ba4-43f6-957f-530a69e81712@madrzak.eu>
	<20171031133324.5hdzhtu7kop7um4b@linux.intel.com>
	<CAP71WjxBNTEfCAN18T86fDY9nu=B50Sta69vwEsh85Fi1OPMDA@mail.gmail.com>
	<20171101124808.2gc5nswcombvrcuf@linux.intel.com>
From: =?UTF-8?Q?Artur_M=c4=85drzak?= <artur@madrzak.eu>
Message-ID: <aeb0b30f-3399-6a67-51fa-7cdc21db84bb@madrzak.eu>
Date: Thu, 2 Nov 2017 11:01:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171101124808.2gc5nswcombvrcuf@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wic: add 'part-name' argument for naming GPT partitions
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
X-List-Received-Date: Thu, 02 Nov 2017 10:01:06 -0000
X-Groupsio-MsgNum: 104466
Content-Type: multipart/mixed; boundary="------------6B6A6C118B970DEA1B6EF18E"
Content-Language: en-US

--------------6B6A6C118B970DEA1B6EF18E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi again,

May I ask you to merge attached patch? I'm sorry I'm not sending it 
according to the guide, but I don't know why list doesn't accept my 
emails sent via git send-email(can receive emails if send to my 
different e-mail address). If I place patch manually, then patchwork 
complain. The patch is on top of openembedded-core 3b413a8057 (head of 
master).


Thanks and sorry for inconvenience.
Artur Mądrzak

W dniu 01.11.2017 o 13:48, Ed Bartosh pisze:
> On Tue, Oct 31, 2017 at 04:08:58PM +0100, Nicolas Dechesne wrote:
>> On Tue, Oct 31, 2017 at 2:33 PM, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
>>>
>>> On Mon, Oct 30, 2017 at 08:53:09PM +0100, Artur Mądrzak wrote:
>>>> The WIC's 'part' can now give a name for GPT partition in WKS file.
>>>> It's similar to '--label', but is naming partitions instead file systems.
>>>> It's required by some bootloaders to partitions have specified names.
>>>>
>>>
>>> Thank you for the patch!
>>>
>>> +1
>>
>> Yes, +1 from me as well. The context of this patch is for the Qualcomm
>> SoC based board that have *interesting* bootloaders requirements, one
>> of them being to look for partition by their names.
>>
>> Patchwork complained about the patch, so Artur, please address these
>> comments and resend the patch.
>>
>> Ed: do you think this can be backported to previous release branches?
>> The lack of --part-name on previous releases make WIC unusable for us.
>> The backport is not trivial since many changes have happened, but
>> Artur has a equivalent patch for morty at least.
>>
> 
> Yes, I think it can be backported. It shouldn't be hard to do especially
> if there is a patch for morty. Just go ahead and send it for review. It
> would be a good first step in this direction.
> 
>>
>>>
>>>
>>>> Signed-off-by: Artur Mądrzak <artur@madrzak.eu>
>>>> ---
>>>>   scripts/lib/wic/help.py                  |  2 ++
>>>>   scripts/lib/wic/ksparser.py              |  1 +
>>>>   scripts/lib/wic/partition.py             |  1 +
>>>>   scripts/lib/wic/plugins/imager/direct.py | 11 +++++++++++
>>>>   4 files changed, 15 insertions(+)
>>>>
>>>> diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
>>>> index bd9c62e2e8..2ac45e052e 100644
>>>> --- a/scripts/lib/wic/help.py
>>>> +++ b/scripts/lib/wic/help.py
>>>> @@ -970,6 +970,8 @@ DESCRIPTION
>>>>                               This option cannot be used with --fixed-size
>>>>                               option.
>>>>
>>>> +         --part-name: This option is specific to wic. It specifies name for
>>>> GPT partitions.
>>>> +
>>>>            --part-type: This option is specific to wic. It specifies
>>>> partition
>>>>                         type GUID for GPT partitions.
>>>>                         List of partition type GUIDS can be found here:
>>>> diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
>>>> index 99b66eebc5..7850e81d2f 100644
>>>> --- a/scripts/lib/wic/ksparser.py
>>>> +++ b/scripts/lib/wic/ksparser.py
>>>> @@ -144,6 +144,7 @@ class KickStart():
>>>>           part.add_argument('--no-table', action='store_true')
>>>>           part.add_argument('--ondisk', '--ondrive', dest='disk',
>>>> default='sda')
>>>>           part.add_argument("--overhead-factor", type=overheadtype)
>>>> +        part.add_argument('--part-name')
>>>>           part.add_argument('--part-type')
>>>>           part.add_argument('--rootfs-dir')
>>>>
>>>> diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
>>>> index b623bb9e6d..66e61ba70c 100644
>>>> --- a/scripts/lib/wic/partition.py
>>>> +++ b/scripts/lib/wic/partition.py
>>>> @@ -51,6 +51,7 @@ class Partition():
>>>>           self.no_table = args.no_table
>>>>           self.num = None
>>>>           self.overhead_factor = args.overhead_factor
>>>> +        self.part_name = args.part_name
>>>>           self.part_type = args.part_type
>>>>           self.rootfs_dir = args.rootfs_dir
>>>>           self.size = args.size
>>>> diff --git a/scripts/lib/wic/plugins/imager/direct.py
>>>> b/scripts/lib/wic/plugins/imager/direct.py
>>>> index 60317eed22..bdb8385620 100644
>>>> --- a/scripts/lib/wic/plugins/imager/direct.py
>>>> +++ b/scripts/lib/wic/plugins/imager/direct.py
>>>> @@ -366,6 +366,10 @@ class PartitionedImage():
>>>>           for num in range(len(self.partitions)):
>>>>               part = self.partitions[num]
>>>>
>>>> +            if self.ptable_format == 'msdos' and part.part_name:
>>>> +                raise WicError("setting custom partition name is not " \
>>>> +                               "implemented for msdos partitions")
>>>> +
>>>>               if self.ptable_format == 'msdos' and part.part_type:
>>>>                   # The --part-type can also be implemented for MBR
>>>> partitions,
>>>>                   # in which case it would map to the 1-byte "partition type"
>>>> @@ -519,6 +523,13 @@ class PartitionedImage():
>>>>               self._create_partition(self.path, part.type,
>>>>                                      parted_fs_type, part.start,
>>>> part.size_sec)
>>>>
>>>> +            if part.part_name:
>>>> +                logger.debug("partition %d: set name to %s",
>>>> +                             part.num, part.part_name)
>>>> +                exec_native_cmd("sgdisk --change-name=%d:%s %s" % \
>>>> +                                         (part.num, part.part_name,
>>>> +                                          self.path), self.native_sysroot)
>>>> +
>>>>               if part.part_type:
>>>>                   logger.debug("partition %d: set type UID to %s",
>>>>                                part.num, part.part_type)
>>>> --
>>>> 2.13.6
>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>>> --
>>> --
>>> Regards,
>>> Ed
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 
> --
> Regards,
> Ed
> 

--------------6B6A6C118B970DEA1B6EF18E
Content-Type: text/x-patch;
 name="0001-wic-add-part-name-argument-for-naming-GPT-partitions.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment;
 filename*0="0001-wic-add-part-name-argument-for-naming-GPT-partitions.pa";
 filename*1="tch"

From 5b433666df434f2284508169783796b69c68a46b Mon Sep 17 00:00:00 2001
From: =?UTF-8?q?Artur=20M=C4=85drzak?= <artur@madrzak.eu>
Date: Sun, 29 Oct 2017 22:35:41 +0100
Subject: [OE-core][PATCH v2] wic: add 'part-name' argument for naming GPT
 partitions
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The WIC's 'part' can now give a name for GPT partition in WKS file.
It's similar to '--label', but is naming partintions instead file systems.
It's required by some bootloaders to partitions have specified names.

Signed-off-by: Artur Mądrzak <artur@madrzak.eu>
---
 scripts/lib/wic/help.py                  |  2 ++
 scripts/lib/wic/ksparser.py              |  1 +
 scripts/lib/wic/partition.py             |  1 +
 scripts/lib/wic/plugins/imager/direct.py | 11 +++++++++++
 4 files changed, 15 insertions(+)

diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index bd9c62e2e8..2ac45e052e 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -970,6 +970,8 @@ DESCRIPTION
                             This option cannot be used with --fixed-size
                             option.
 
+         --part-name: This option is specific to wic. It specifies name for GPT partitions.
+
          --part-type: This option is specific to wic. It specifies partition
                       type GUID for GPT partitions.
                       List of partition type GUIDS can be found here:
diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index 99b66eebc5..7850e81d2f 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -144,6 +144,7 @@ class KickStart():
         part.add_argument('--no-table', action='store_true')
         part.add_argument('--ondisk', '--ondrive', dest='disk', default='sda')
         part.add_argument("--overhead-factor", type=overheadtype)
+        part.add_argument('--part-name')
         part.add_argument('--part-type')
         part.add_argument('--rootfs-dir')
 
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index b623bb9e6d..66e61ba70c 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -51,6 +51,7 @@ class Partition():
         self.no_table = args.no_table
         self.num = None
         self.overhead_factor = args.overhead_factor
+        self.part_name = args.part_name
         self.part_type = args.part_type
         self.rootfs_dir = args.rootfs_dir
         self.size = args.size
diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 60317eed22..bdb8385620 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -366,6 +366,10 @@ class PartitionedImage():
         for num in range(len(self.partitions)):
             part = self.partitions[num]
 
+            if self.ptable_format == 'msdos' and part.part_name:
+                raise WicError("setting custom partition name is not " \
+                               "implemented for msdos partitions")
+
             if self.ptable_format == 'msdos' and part.part_type:
                 # The --part-type can also be implemented for MBR partitions,
                 # in which case it would map to the 1-byte "partition type"
@@ -519,6 +523,13 @@ class PartitionedImage():
             self._create_partition(self.path, part.type,
                                    parted_fs_type, part.start, part.size_sec)
 
+            if part.part_name:
+                logger.debug("partition %d: set name to %s",
+                             part.num, part.part_name)
+                exec_native_cmd("sgdisk --change-name=%d:%s %s" % \
+                                         (part.num, part.part_name,
+                                          self.path), self.native_sysroot)
+
             if part.part_type:
                 logger.debug("partition %d: set type UID to %s",
                              part.num, part.part_type)
-- 
2.13.6


--------------6B6A6C118B970DEA1B6EF18E--
