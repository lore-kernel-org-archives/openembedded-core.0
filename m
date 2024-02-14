Return-Path: <baruch@tkos.co.il>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5785FC4829F
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 07:02:40 +0000 (UTC)
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
 by mx.groups.io with SMTP id smtpd.web11.36799.1707894158817976887
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 23:02:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@tkos.co.il header.s=default header.b=i6dG2IkA;
 spf=pass (domain: tkos.co.il, ip: 84.110.109.230, mailfrom: baruch@tkos.co.il)
Received: from localhost (unknown [10.0.8.2])
	by mail.tkos.co.il (Postfix) with ESMTP id 4ACA444053D;
	Wed, 14 Feb 2024 09:01:58 +0200 (IST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
	s=default; t=1707894118;
	bh=YnQJrrQ1luPKdj93szvru25FMKUfxzdx7X0sajbOrMg=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:From;
	b=i6dG2IkAPXQmUFCkolpAH4m9qEJIUG/6CIF1RZ/49dxzNLU2ps7OauzgmLXFigtmA
	 VlAEMFd6GB+2YlXwnP+1qc4EXG5LsRH4YhIFlciFk7CXPqvMXNVXftLHrnu/NMzA+F
	 +ymHj6+oJROTQ9jHROIvJfmdadm+NTIBZoa1HWXnzDvCYzl+6/trh/qghjcC0yfKTP
	 qX1cjJafXm98i4M69YEooS8L1cNLkFJj0Ve9aPO8v0RrlyHHRFMXGSm/Y4ZRC3vbqB
	 7YF6fhmFR2rk8wgfd64Kquc7L//lgnSWGBQ4U659oidxoZjrKS5PrtE9YiRBaRJONm
	 9tyFoFw5Ji96A==
References: <ed5d6a8c842319c81026bb4aab7e2a9de3c13189.1707762606.git.baruch@tkos.co.il>
 <8f1c6048-235b-4786-811c-50e79c806da4@gmail.com>
User-agent: mu4e 1.10.8; emacs 29.1
From: Baruch Siach <baruch@tkos.co.il>
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] overlayfs-etc: add option to skip creation of mount
 dirs
Date: Wed, 14 Feb 2024 08:54:47 +0200
In-reply-to: <8f1c6048-235b-4786-811c-50e79c806da4@gmail.com>
Message-ID: <8734tv34vo.fsf@tarshish>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 07:02:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195454

Hi Slava,

On Mon, Feb 12 2024, Vyacheslav Yurkov wrote:
> On 12.02.2024 19:30, Baruch Siach wrote:
>> The 'preinit' script can't create mount directories when rootfs is
>> read-only. Add an option to skip this step. The user must make sure that
>> all required directories are already in the rootfs directory layout.
>>
>> Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
>> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>> ---
>> v2: Add a user selectable option. Don't skip mkdir automatically when
>>      read-only-rootfs feature is enabled.
>> ---
>>   meta/classes-recipe/overlayfs-etc.bbclass |  5 ++++-
>>   meta/files/overlayfs-etc-preinit.sh.in    | 16 +++++++++-------
>>   2 files changed, 13 insertions(+), 8 deletions(-)
>>
>> diff --git a/meta/classes-recipe/overlayfs-etc.bbclass b/meta/classes-recipe/overlayfs-etc.bbclass
>> index 0c7834d01f43..d339fbbeee9f 100644
>> --- a/meta/classes-recipe/overlayfs-etc.bbclass
>> +++ b/meta/classes-recipe/overlayfs-etc.bbclass
>> @@ -41,6 +41,7 @@ OVERLAYFS_ETC_USE_ORIG_INIT_NAME ??= "1"
>>   OVERLAYFS_ETC_MOUNT_OPTIONS ??= "defaults"
>>   OVERLAYFS_ETC_INIT_TEMPLATE ??= "${COREBASE}/meta/files/overlayfs-etc-preinit.sh.in"
>>   OVERLAYFS_ETC_EXPOSE_LOWER ??= "0"
>> +OVERLAYFS_ETC_CREATE_MOUNT_DIRS ??= "1"
>>     python create_overlayfs_etc_preinit() {
>>       overlayEtcMountPoint = d.getVar("OVERLAYFS_ETC_MOUNT_POINT")
>> @@ -62,6 +63,7 @@ python create_overlayfs_etc_preinit() {
>>       initBaseName = oe.path.join(d.getVar("base_sbindir"), "init")
>>       origInitNameSuffix = ".orig"
>>       exposeLower = oe.types.boolean(d.getVar('OVERLAYFS_ETC_EXPOSE_LOWER'))
>> +    createMoundDirs = oe.types.boolean(d.getVar('OVERLAYFS_ETC_CREATE_MOUNT_DIRS'))
>>         args = {
>>           'OVERLAYFS_ETC_MOUNT_POINT': overlayEtcMountPoint,
>> @@ -69,7 +71,8 @@ python create_overlayfs_etc_preinit() {
>>           'OVERLAYFS_ETC_FSTYPE': overlayEtcFsType,
>>           'OVERLAYFS_ETC_DEVICE': overlayEtcDevice,
>>           'SBIN_INIT_NAME': initBaseName + origInitNameSuffix if useOrigInit else initBaseName,
>> -        'OVERLAYFS_ETC_EXPOSE_LOWER': "true" if exposeLower else "false"
>> +        'OVERLAYFS_ETC_EXPOSE_LOWER': "true" if exposeLower else "false",
>> +        'CREATE_MOUNT_DIRS': "true" if createMoundDirs else "false"
>>       }
>>         if useOrigInit:
>> diff --git a/meta/files/overlayfs-etc-preinit.sh.in b/meta/files/overlayfs-etc-preinit.sh.in
>> index 8db076f4ba65..b05e3957a382 100644
>> --- a/meta/files/overlayfs-etc-preinit.sh.in
>> +++ b/meta/files/overlayfs-etc-preinit.sh.in
>> @@ -3,12 +3,15 @@
>>   echo "PREINIT: Start"
>>     PATH=/sbin:/bin:/usr/sbin:/usr/bin
>> -mount -o remount,rw /
>> -
>> -mkdir -p /proc
>> -mkdir -p /sys
>> -mkdir -p /run
>> -mkdir -p /var/run
>> +if {CREATE_MOUNT_DIRS}; then
>> +    mount -o remount,rw /
>> +
>> +    mkdir -p /proc
>> +    mkdir -p /sys
>> +    mkdir -p /run
>> +    mkdir -p /var/run
>> +    mkdir -p {OVERLAYFS_ETC_MOUNT_POINT}
>> +fi
>>     mount -t proc proc /proc
>>   mount -t sysfs sysfs /sys
>> @@ -20,7 +23,6 @@ UPPER_DIR=$BASE_OVERLAY_ETC_DIR/upper
>>   WORK_DIR=$BASE_OVERLAY_ETC_DIR/work
>>   LOWER_DIR=$BASE_OVERLAY_ETC_DIR/lower
>>   -mkdir -p {OVERLAYFS_ETC_MOUNT_POINT}
>>   if mount -n -t {OVERLAYFS_ETC_FSTYPE} \
>>       -o {OVERLAYFS_ETC_MOUNT_OPTIONS} \
>>       {OVERLAYFS_ETC_DEVICE} {OVERLAYFS_ETC_MOUNT_POINT}
>
> Hi Baruch,
> Thanks for the v2. Looks good now. Could you please also add a test case to
> cover the new option?
>
> You saw from the test that mount output is parsed to confirm whether overlay
> is actually mounted. sda3 is a 3rd partition from
> https://git.openembedded.org/openembedded-core/tree/meta-selftest/wic/overlayfs_etc.wks.in
> . We could change rootfs (2nd partition) in the file to substitute the fs type
> (ext4/squashfs) from the test and then check that everything is mounted
> correctly. Does it make sense?

Makes sense.

I added mkdirhier of OVERLAYFS_ETC_MOUNT_POINT for the case of
OVERLAYFS_ETC_CREATE_MOUNT_DIRS == 0. Let me know if there is a better
solution for read-only filesystems.

The trouble with testing is that I could not find any existing feature
in yocto-kernel-cache that enables either CONFIG_SQUASHFS or
CONFIG_EROFS_FS. Is there another way to enable kernel features for the
test?

Thanks,
baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -

