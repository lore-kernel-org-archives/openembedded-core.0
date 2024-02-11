Return-Path: <baruch@tkos.co.il>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0770C4829A
	for <webhook@archiver.kernel.org>; Sun, 11 Feb 2024 13:39:48 +0000 (UTC)
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
 by mx.groups.io with SMTP id smtpd.web11.36998.1707658785666779438
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Feb 2024 05:39:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@tkos.co.il header.s=default header.b=iKEUzVST;
 spf=pass (domain: tkos.co.il, ip: 84.110.109.230, mailfrom: baruch@tkos.co.il)
Received: from localhost (unknown [10.0.8.2])
	by mail.tkos.co.il (Postfix) with ESMTP id 0765144053D;
	Sun, 11 Feb 2024 15:39:08 +0200 (IST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
	s=default; t=1707658748;
	bh=+ERFzgNojAdvram11XNgIKMWMs72AERWzoGhpArYIRc=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:From;
	b=iKEUzVSTxIIraGKgFV3fdutmqPjNl5vKxsPkoGI7p/oSJcPpCv/0UpBTHZdeMjOIt
	 eW01avzzfgjcYHEZ71RaXhepoZUVvtATEubWp5nPfFzSjKqELJ7ijhdw1ol1hMmZvO
	 dIjs+McURO1311+8GTfOyoZgMxFzlydiUgek71YMC1ZSu+6hEzjKhOHjSbaLIZyi+q
	 m5d1uYvlgVP64t4yGIq/xS4a1KGYqxxmVhkDxRFQLE73Xkdr/bffkv3qGcnNSaRRNk
	 Nu/U5Dy5pGVJKn927mxb/d+nEenRTeNMOCIfTeWMO2h+cenWdz50JX7s+NOl0hh20W
	 Izr0e+TEoDUQA==
References: <391a7b90f3cb6a7b276904b69a2251bf0d3849c9.1707376966.git.baruch@tkos.co.il>
 <5066577e-7447-4f4f-8212-7729a3ada8ba@gmail.com>
User-agent: mu4e 1.10.8; emacs 29.1
From: Baruch Siach <baruch@tkos.co.il>
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] overlayfs-etc: take read-only-rootfs into account
Date: Sun, 11 Feb 2024 15:23:55 +0200
In-reply-to: <5066577e-7447-4f4f-8212-7729a3ada8ba@gmail.com>
Message-ID: <87cyt35dcy.fsf@tarshish>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Feb 2024 13:39:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195292

Hi Slava,

On Thu, Feb 08 2024, Vyacheslav Yurkov wrote:
> On 08.02.2024 08:22, Baruch Siach wrote:
>> Don't remount rootfs read-write when read-only-rootfs feature is
>> enabled. Assume that all mount points are in place for the read-only
>> case.
>>
>> Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
>> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>> ---
>>   meta/classes-recipe/overlayfs-etc.bbclass |  4 +++-
>>   meta/files/overlayfs-etc-preinit.sh.in    | 16 +++++++++-------
>>   2 files changed, 12 insertions(+), 8 deletions(-)
>>
>> diff --git a/meta/classes-recipe/overlayfs-etc.bbclass b/meta/classes-re=
cipe/overlayfs-etc.bbclass
>> index 0c7834d01f43..e695ebdcf843 100644
>> --- a/meta/classes-recipe/overlayfs-etc.bbclass
>> +++ b/meta/classes-recipe/overlayfs-etc.bbclass
>> @@ -69,7 +69,9 @@ python create_overlayfs_etc_preinit() {
>>           'OVERLAYFS_ETC_FSTYPE': overlayEtcFsType,
>>           'OVERLAYFS_ETC_DEVICE': overlayEtcDevice,
>>           'SBIN_INIT_NAME': initBaseName + origInitNameSuffix if useOrig=
Init else initBaseName,
>> -        'OVERLAYFS_ETC_EXPOSE_LOWER': "true" if exposeLower else "false"
>> +        'OVERLAYFS_ETC_EXPOSE_LOWER': "true" if exposeLower else "false=
",
>> +        'READ_ONLY_ROOTFS': bb.utils.contains("IMAGE_FEATURES", "read-o=
nly-rootfs",
>> +                                              "true", "false", d)
>>       }
>>         if useOrigInit:
>> diff --git a/meta/files/overlayfs-etc-preinit.sh.in b/meta/files/overlay=
fs-etc-preinit.sh.in
>> index 8db076f4ba65..79cecf8ac97d 100644
>> --- a/meta/files/overlayfs-etc-preinit.sh.in
>> +++ b/meta/files/overlayfs-etc-preinit.sh.in
>> @@ -3,12 +3,15 @@
>>   echo "PREINIT: Start"
>>     PATH=3D/sbin:/bin:/usr/sbin:/usr/bin
>> -mount -o remount,rw /
>> -
>> -mkdir -p /proc
>> -mkdir -p /sys
>> -mkdir -p /run
>> -mkdir -p /var/run
>> +if ! {READ_ONLY_ROOTFS}; then
>> +    mount -o remount,rw /
>> +
>> +    mkdir -p /proc
>> +    mkdir -p /sys
>> +    mkdir -p /run
>> +    mkdir -p /var/run
>> +    mkdir -p {OVERLAYFS_ETC_MOUNT_POINT}
>> +fi
>
> I don't think this would be a correct approach. You probably should only
> remount to ro after all mount points are created.

As I understand, the point of read-only-rootfs feature is to keep rootfs
intact. Filesystems like squashfs or erofs don't support rw mount at
all. How can we support this use case?

> With this patch overlayfs.OverlayFSEtcRunTimeTests.test_sbin_init_preinit
> fails:
>
> 2024-02-08 21:12:40,616 - oe-selftest - INFO - Traceback (most recent call
> last):
> =C2=A0 File
> "/home/uvv/projects/upstream/poky/meta/lib/oeqa/core/decorator/__init__.p=
y",
> line 35, in wrapped_f
> =C2=A0=C2=A0=C2=A0 return func(*args, **kwargs)
> =C2=A0 File
> "/home/uvv/projects/upstream/poky/meta/lib/oeqa/selftest/cases/overlayfs.=
py",
> line 370, in test_sbin_init_preinit
> =C2=A0=C2=A0=C2=A0 self.run_sbin_init(False)
> =C2=A0 File
> "/home/uvv/projects/upstream/poky/meta/lib/oeqa/selftest/cases/overlayfs.=
py",
> line 399, in run_sbin_init
> =C2=A0=C2=A0=C2=A0 self.assertTrue("/data" in output, msg=3Doutput)
> AssertionError: False is not true : /dev/sda2 on / type ext4 (ro,relatime)

Where is this /dev/sda2 coming from? I have also seen it in my
/etc/fstab once I enabled the overlayfs-etc feature. I see no mention of
sda2 in meta/lib/oeqa/selftest/cases/overlayfs.py.

> The test is not really explicit, but it looks like overlay is not mounted=
. We
> could also add a generic test to search for "PREINIT" done/failed.

How can I run this test?

Thanks,
baruch

>
>>   mount -t proc proc /proc
>>   mount -t sysfs sysfs /sys
>> @@ -20,7 +23,6 @@ UPPER_DIR=3D$BASE_OVERLAY_ETC_DIR/upper
>>   WORK_DIR=3D$BASE_OVERLAY_ETC_DIR/work
>>   LOWER_DIR=3D$BASE_OVERLAY_ETC_DIR/lower
>>   -mkdir -p {OVERLAYFS_ETC_MOUNT_POINT}
>>   if mount -n -t {OVERLAYFS_ETC_FSTYPE} \
>>       -o {OVERLAYFS_ETC_MOUNT_OPTIONS} \
>>       {OVERLAYFS_ETC_DEVICE} {OVERLAYFS_ETC_MOUNT_POINT}
>
> Thanks,
> Slava


--=20
                                                     ~. .~   Tk Open Systems
=3D}------------------------------------------------ooO--U--Ooo------------=
{=3D
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -

