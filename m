Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE7EDC4707F
	for <webhook@archiver.kernel.org>; Fri,  8 Apr 2022 20:12:14 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web11.1614.1649448260557039279
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Apr 2022 13:04:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.17,
 mailfrom: f_l_k@t-online.de)
Received: from fwd76.dcpf.telekom.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout02.t-online.de (Postfix) with SMTP id 2C531518B
	for <openembedded-core@lists.openembedded.org>;
 Fri,  8 Apr 2022 22:03:21 +0200 (CEST)
Received: from [192.168.178.83] ([84.163.46.48]) by fwd76.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1ncup5-36b6np0; Fri, 8 Apr 2022 22:03:11 +0200
Message-ID: <0e14a9c4-2692-4f2e-b707-b9532706bab1@t-online.de>
Date: Fri, 8 Apr 2022 22:03:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [OE-core] [PATCH] bluez5: install /var/lib/bluetooth directory
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <20220408081533.1705128-1-yi.zhao@windriver.com>
 <348e8577-31f3-3ed6-393a-ebe511cb2186@weidmueller.com>
 <111d0c91-aaff-966f-6425-f4da193c29e2@windriver.com>
 <8c740cc8-8c84-9e34-ff12-8c1d5721d302@weidmueller.com>
 <bf017503-5365-98c2-3546-96b4cc4313c4@windriver.com>
From: Markus Volk <f_l_k@t-online.de>
In-Reply-To: <bf017503-5365-98c2-3546-96b4cc4313c4@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TOI-EXPURGATEID: 150726::1649448191-0001619A-0FC6FCC4/0/0 CLEAN NORMAL
X-TOI-MSGID: 5261df3d-f687-4ec6-958f-3cd67b6bce52
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Apr 2022 20:12:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164177

also had this issue and found out, that the bluetooth service did come=20
up, once bluetooth was enabled

My fix was to edit like this

ReadWritePaths=3D:/var/lib/bluetooth

The colon ensures that the service won't fail if the directory doesn't ex=
ist


Am 08.04.22 um 13:01 schrieb Yi Zhao:
>
> On 4/8/22 18:51, Stefan Herbrechtsmeier wrote:
>> Am 08.04.2022 um 11:23 schrieb Yi Zhao:
>>>
>>> On 4/8/22 16:34, Stefan Herbrechtsmeier wrote:
>>>> Am 08.04.2022 um 10:15 schrieb Yi Zhao via lists.openembedded.org:
>>>>> There is a bluetooth service startup failure:
>>>>> bluetooth.service: Failed at step NAMESPACE spawning=20
>>>>> /usr/libexec/bluetooth/bluetoothd: No such file or directory
>>>>> bluetooth.service: Failed to set up mount namespacing:=20
>>>>> /run/systemd/unit-root/var/lib/bluetooth: No such file or directory
>>>>>
>>>>> This is because the directory /var/lib/bluetooth has been listed in
>>>>> ReadWritePaths=3D in the service unit file but does not exist. We=20
>>>>> need to
>>>>> create it before service startup.
>>>>>
>>>>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>>>>> ---
>>>>> =C2=A0 meta/recipes-connectivity/bluez5/bluez5.inc | 2 ++
>>>>> =C2=A0 1 file changed, 2 insertions(+)
>>>>>
>>>>> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc=20
>>>>> b/meta/recipes-connectivity/bluez5/bluez5.inc
>>>>> index 79d4645ca8..ee2cdbcc59 100644
>>>>> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
>>>>> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
>>>>> @@ -102,6 +102,8 @@ do_install:append() {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Patch python tools to use Python 3=
; they should be source=20
>>>>> compatible, but
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # still refer to Python 2 in the she=
bang
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sed -i -e '1s,#!.*python.*,#!${bindi=
r}/python3,'=20
>>>>> ${D}${libdir}/bluez/test/*
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 install -d ${D}${localstatedir}/lib/bluetooth
>>>>
>>>> Please use systemd StateDirectory=3D [1]. Maybe it is reasonable to=20
>>>> replace the ReadWritePaths=3D with StateDirectory=3D.
>>>>
>>>> [1]=20
>>>> https://www.freedesktop.org/software/systemd/man/systemd.exec.html#R=
untimeDirectory=3D=20
>>>>
>>>
>>>
>>> Thanks Stefank, but the ReadWritePaths=3D is set by bluez:
>>>
>>> https://github.com/bluez/bluez/commit/442d211b5f30f00d5ddd69b43385a03=
c1428ac45=20
>>>
>>
>> And who creates the directory before the patch?
>
> There is no need this directory before the patch. The service can=20
> startup without this directory.
>
>
>>
>> The systemd solution to create a state directory is StateDirectory=3D=20
>> (or tmpfiles.d for older versions of systemd). Systemd supports=20
>> stateless system [1] and therefore every service must work with an=20
>> empty /var/lib.
>
>
> I'll try adding StateDirecotry to service unit file to=C2=A0 see if thi=
s=20
> can solve the problem.=C2=A0 Thanks.
>
>
> //Yi
>
>>
>> This patch hide a bug in bluez and the problem should be fixed in blue=
z.
>>
>> [1] https://0pointer.net/blog/projects/stateless.html
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164159): https://lists.openembedded.org/g/openembed=
ded-core/message/164159
> Mute This Topic: https://lists.openembedded.org/mt/90331367/3618223
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
f_l_k@t-online.de]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

