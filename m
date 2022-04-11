Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF2ABC48BE8
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:17:59 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.44])
 by mx.groups.io with SMTP id smtpd.web12.26627.1649661451359498025
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Apr 2022 00:17:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=Iz4kWrFK;
 spf=pass (domain: weidmueller.com, ip: 40.107.22.44,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cif9fF8itk+BZ/n7ZG5ZxD7XxcZqiFOC5BVpBMCMF7OHg9xA/DUKRQh3lpKKHCusERlCp9ndCCSYULPGfEyXwhApKN45udIK/QTO6USE+M5t6nRWIidTH+dw2VIBBnj41u5KEqenPD/FmmhAWU0IpLRnPa7e5Cdahr/ilsEd/2Q/z9Bo6iANH6eoigt/33938DsW0VRoHhBpSra0ggZ8YPh6PW3+tPqIs97rTrUL5LbWDIXEGtjJl+ERjNYIlGPz5iM8whHTSndGKWWRXLdj0QLogmHE+J3mThIPH9U+fr4RNeaM4yyK0fcPvnkgLiR2GXwYxNg30lwwg0l1IvGNnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6hMCEOdocUMZptefmrlLkV82uAXp+43NkJjzc1GC+8M=;
 b=F9hyXbRPWbm565NflWfp1sdWsJJHLAEuS0A5sn1LmqJWIe0VaWvnx8TXGGWYwfvmZxigQg+VTJvYv3uWeAA0mWdj1vjXLWTxjBYNM5M4NywjsL8Eodup8oV/guOK6R2BV+C/w7TxJNF931veCrW2mqoZiazO0oi9yHcOukoW6pZrz8baOFteh1k6xwadSr/1y9yajkfUtJfB7W1mTiU1T+0ZFUKeAn5ITa6PyIhgnoL4Y6OPdgmIDAlJFDVTkCG/ir0/cZ0XKKwI1L0ZQceA3RRdaFS1+/dh+uLsisVOnsVvNSGf2iOgxVBiED+CCG3Y1G8h/kiif/k7uzpTayiIIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6hMCEOdocUMZptefmrlLkV82uAXp+43NkJjzc1GC+8M=;
 b=Iz4kWrFKI/eiScd1fVSLPjlWyyAQaIENbgear2CGU4VJ31IP4pkEJJ+oZvN9GXVRJSnv6An9qTjoAR4C42tvvlkDAn3v9o79s3pjGgcScmgwcp7UC3Yne/MO5dtcd23visKhvMNQvBFFxaE7/ieHkd2WMGV7oTDfC1qS6SjcIaA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by VE1PR08MB4909.eurprd08.prod.outlook.com (2603:10a6:802:a8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 07:17:27 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::454:7133:dd03:d8e]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::454:7133:dd03:d8e%4]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 07:17:27 +0000
Message-ID: <95815113-5c58-63e2-feb8-03e80d7a2e66@weidmueller.com>
Date: Mon, 11 Apr 2022 09:17:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [OE-core] [PATCH] bluez5: install /var/lib/bluetooth directory
Content-Language: en-US
To: f_l_k@t-online.de, openembedded-core@lists.openembedded.org
References: <20220408081533.1705128-1-yi.zhao@windriver.com>
 <348e8577-31f3-3ed6-393a-ebe511cb2186@weidmueller.com>
 <111d0c91-aaff-966f-6425-f4da193c29e2@windriver.com>
 <8c740cc8-8c84-9e34-ff12-8c1d5721d302@weidmueller.com>
 <bf017503-5365-98c2-3546-96b4cc4313c4@windriver.com>
 <0e14a9c4-2692-4f2e-b707-b9532706bab1@t-online.de>
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: <0e14a9c4-2692-4f2e-b707-b9532706bab1@t-online.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR10CA0030.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:89::43) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf13ade1-3b53-4917-0948-08da1b8b551e
X-MS-TrafficTypeDiagnostic: VE1PR08MB4909:EE_
X-Microsoft-Antispam-PRVS: 
	<VE1PR08MB4909C4F7FC5CE6ACBC41ED40D7EA9@VE1PR08MB4909.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	N+5rm/Nx/ceYVSiHkr4bC7sEu84GwEw612e7uDR6tjx1OZu6rmHmVC1ZRCrfCyH/8c+908+E+xU+tZoH11yOcaGBai6zI5YKe8YBmWQJJClJnNHjOAlVesmNfbeDNZQ3/DwYy/my+2r/kmhMBFg0QER+SRCvGBtdoaGXGrCpwPNzndtaYb1whBMZVL4whhPkLlrMb1u1rxsM3+0+37deKP4yCN0hfEcf6VuNjeK//OgvfDPIKGlmBIET/HwLpUKp5N5lBSDRWzojWm2qfxfxynyYeKydasqGbKc5MRjnEo3Bx7daOGHgUKfqQ41M9FG23IMHpZjs7Dnd9C4UNiCitgu8AQ5ijqRnWqzOb/I3LNENH889QOBtuD9JnM+Qxl7zoBT0buaMtlOWPUioYfYQhQguKSgNqVK47VXXcq0JBRBEqo1/sYBHB7qLSbZxZZcYlgKgBe9wA+XBT07GtJSeKI8i+5zcUsAy+T4RyNld20il5LvEehyNYay0lbdUH+EfnHUhr/zk3O0DLC4m7Swbwn6GpmcM5oHK7N0wckFY/bDaaE/gfKqAa8wyyDulG57b59eskCVwm1ltm6FP0zxB8fhqKnLwWFSggcaElPEaFy0cWM0QMwBQ9n9PqyCCYR8TQmZPyhczxiePRmbEaoMAQBrXTw9/82a8nJ2adTT9XsVEXXMnA7nfKNXKAEv3htxSFtsX0zKYw3dagEIBB3gmA7VSvDKy8LLDTBADj71xRzz5Efud/HfHZCGKpWsEqJAO/aOQYcpOTFRPt+aoO160UXGHtzFvujyCmTJ8Vbh11HH2oxi8uEtHNHSNrBPsoqPZB7IW3GXLL/Gz7WMIBfOrVxKwcB/s5ILwiMYUXv8DM24=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(38100700002)(508600001)(316002)(38350700002)(6486002)(8676002)(66556008)(66476007)(6512007)(966005)(66946007)(5660300002)(8936002)(31696002)(52116002)(53546011)(6506007)(31686004)(2906002)(26005)(186003)(83380400001)(86362001)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pJ16+29MbMGWmRyOHLQTOd7iUCKb7ehMmDKJy7UOqdDwi/1nrMQdo8nYc3Qp?=
 =?us-ascii?Q?MpRwPspup8d7iNT9WyqQ1DUebSV6wkHpdWhZcpQmYEuoYhkov+i9u2L7Fa83?=
 =?us-ascii?Q?1ehbMfsKKwXBUfcdc9fiLCAfCwS9/hCz9aIh8Gc+KQaxjaybPo3zL9TfXEMk?=
 =?us-ascii?Q?D3xf9XIYgioGyH8z16/oLf2eldYIi7b/MZMAA2rnCqASs46wMWRfJ25cFpan?=
 =?us-ascii?Q?pZrtCk4w6StIL1YlI61Ba5x5ARak+0jopaIIX1fw9F7m1ISsm0OXXHY1PWOw?=
 =?us-ascii?Q?YdlSlqSmfVzgBd0Z8fHZP7HufffFm+Q64Tr7soyT/lQkIs09cDMgvabPj+rr?=
 =?us-ascii?Q?eKTr3jdoX5V0qQHF6Mr8fy3D6+/jposHT3Vlh/6BTbRolSNDrXbE592BkBl8?=
 =?us-ascii?Q?bz+xZ4j9gHx773GN3ioT3/9Yb7dxAY+Ejpxf3ivdFYgRb0X/bKSFCGRKFEmQ?=
 =?us-ascii?Q?r67C7AqibviMPji7UVzi5/GjSAhTDMbcAEjMJaQztI2hG0kS8PdICwuwiYLj?=
 =?us-ascii?Q?EL+kCFWJUCU5qVIlfpuDrE9CCy6M0fDZfxHlS+D9g+xMNKx+Dq6w0KYqzvu8?=
 =?us-ascii?Q?gPN6LUFuhZ/gM3yrzuWDp/0drjIkJbpPIlVPZYS+DpeNye7zoI1x0zn00Tp1?=
 =?us-ascii?Q?kc1JnXBwOE0Ek1N8xwi4gSvWTOhOyON/HC0N8araAUhPKJKTPkNsYVi5gAe3?=
 =?us-ascii?Q?W1cvBqFL+io0S6j5AQGoT+Ha/gdrR6AVsQaRKrvRwjy1mpH9laI6fuzUcU4X?=
 =?us-ascii?Q?3C2/G00432bKkjge6X0BUl5jt0YeRVJ9Nm5JVRLekCwUkFul0jBzM8cWLFPw?=
 =?us-ascii?Q?tpqLJKiTCTPL3aEpyytuLle2DydkIHmU9gmLY0BKZxIMHpiYR5emNREKRGQy?=
 =?us-ascii?Q?4g9ptOJ/D2TamPRjDHIOCmkVoIYIExpPOOcgWeSuOE1duCJqjVseVi39tAak?=
 =?us-ascii?Q?tFtYSmujixHJYYlnxhT9w1qctcDajwJAW0E2BhqHCNSiH2cJdM6NKvKQca1i?=
 =?us-ascii?Q?A4mnLl5r2p8rgQrG/7PPkt5lllNEWnII4QxWCn8qUnY5+nFgAcmZxcbVzB4F?=
 =?us-ascii?Q?4TUinoWc/6hnA20AGGAAGgO5KIMFjzyKDk28D/JJQQ+sp1QZv+QrNn7bZS7f?=
 =?us-ascii?Q?TGXUQWorHKWA8HrtXueihaD0HGFQZ92i1MTwjLaa7yEsfEfSKYV8kuje9Zji?=
 =?us-ascii?Q?5iTWbCcgo7OQCFYu9Idd2tuTXUgDPvg3rXjZHViv1rGeKj0gUQ4dRYd4CnCQ?=
 =?us-ascii?Q?SxqQ9khHRS0YI7RRoeENg9OZFqLNmcMLUJ9Fw7TpAW4njiUu48dkVOVoMdMv?=
 =?us-ascii?Q?TbRLb7iyWL5IkM0Seh5Xnb8pfLWJgJQm5zEbaleW+5ABYduYW/yWmAevTpnJ?=
 =?us-ascii?Q?hXoyB5OsLEUDMYApkmV+uug5UfeEQSnjLij4SxyVMQA9RpCTZsWXkg2vCPwD?=
 =?us-ascii?Q?ZKm5kELzMWQghao7ahdXWCqZNiwll+3a6pcIFEGjyRwrfxyHNJa31tB/U9qt?=
 =?us-ascii?Q?uKzVqD0xHYk90wbvO6CwceANAVdM16AQ++uo6ubQaLs8eA+g/zav+tsjra4A?=
 =?us-ascii?Q?QxNbaOQY3C+7LnEbN0GkYyZPSEi1f5dx+hlzAozaUTZi++JJqEW0oCjdePoU?=
 =?us-ascii?Q?GrEFZfnl6+/DJY7CeQ1hi2pWVbOyO9rwnoafjDFXP2kc09ulwWTwJtUQixLk?=
 =?us-ascii?Q?leZX6sPK1qlNxVjDuJVNfWD3/8zk383YXI7XwsjhwJxuyk+pRkVM8PEHIckU?=
 =?us-ascii?Q?I31d8NWS/aPfC2/fpQ1O/XGdG/VJPU4=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bf13ade1-3b53-4917-0948-08da1b8b551e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 07:17:26.9876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 dT7zpYIF01bfjMhHYsDxVbE02Ns2SygD6C3lTzsFzcKlojuXEdKPKrWk8hYUQtkAuSEQq74EcZCvsWfPUbW9Hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4909
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Apr 2022 17:17:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164217

Am 08.04.2022 um 22:03 schrieb Markus Volk via lists.openembedded.org:
> also had this issue and found out, that the bluetooth service did come=20
> up, once bluetooth was enabled
>=20
> My fix was to edit like this
>=20
> ReadWritePaths=3D:/var/lib/bluetooth
>=20
> The colon ensures that the service won't fail if the directory doesn't=20
> exist

Regarding the documentation the ReadOnlyPaths and ReadWritePaths makes=20
not sense because ProtectSystem=3Dfull mounts /usr, boot loader and /etc=20
directories read-only.

Have somebody report the problem to the bluez project?

Regards
   Stefan


>=20
>=20
> Am 08.04.22 um 13:01 schrieb Yi Zhao:
>>
>> On 4/8/22 18:51, Stefan Herbrechtsmeier wrote:
>>> Am 08.04.2022 um 11:23 schrieb Yi Zhao:
>>>>
>>>> On 4/8/22 16:34, Stefan Herbrechtsmeier wrote:
>>>>> Am 08.04.2022 um 10:15 schrieb Yi Zhao via lists.openembedded.org:
>>>>>> There is a bluetooth service startup failure:
>>>>>> bluetooth.service: Failed at step NAMESPACE spawning=20
>>>>>> /usr/libexec/bluetooth/bluetoothd: No such file or directory
>>>>>> bluetooth.service: Failed to set up mount namespacing:=20
>>>>>> /run/systemd/unit-root/var/lib/bluetooth: No such file or directory
>>>>>>
>>>>>> This is because the directory /var/lib/bluetooth has been listed in
>>>>>> ReadWritePaths=3D in the service unit file but does not exist. We=20
>>>>>> need to
>>>>>> create it before service startup.
>>>>>>
>>>>>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>>>>>> ---
>>>>>> =C2=A0 meta/recipes-connectivity/bluez5/bluez5.inc | 2 ++
>>>>>> =C2=A0 1 file changed, 2 insertions(+)
>>>>>>
>>>>>> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc=20
>>>>>> b/meta/recipes-connectivity/bluez5/bluez5.inc
>>>>>> index 79d4645ca8..ee2cdbcc59 100644
>>>>>> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
>>>>>> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
>>>>>> @@ -102,6 +102,8 @@ do_install:append() {
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Patch python tools to use Python 3;=
 they should be source=20
>>>>>> compatible, but
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # still refer to Python 2 in the sheb=
ang
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sed -i -e '1s,#!.*python.*,#!${bindir=
}/python3,'=20
>>>>>> ${D}${libdir}/bluez/test/*
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0 install -d ${D}${localstatedir}/lib/bluetooth
>>>>>
>>>>> Please use systemd StateDirectory=3D [1]. Maybe it is reasonable to=20
>>>>> replace the ReadWritePaths=3D with StateDirectory=3D.
>>>>>
>>>>> [1]=20
>>>>> https://www.freedesktop.org/software/systemd/man/systemd.exec.html#Ru=
ntimeDirectory=3D=20
>>>>>
>>>>
>>>>
>>>> Thanks Stefank, but the ReadWritePaths=3D is set by bluez:
>>>>
>>>> https://github.com/bluez/bluez/commit/442d211b5f30f00d5ddd69b43385a03c=
1428ac45=20
>>>>
>>>
>>> And who creates the directory before the patch?
>>
>> There is no need this directory before the patch. The service can=20
>> startup without this directory.
>>
>>
>>>
>>> The systemd solution to create a state directory is StateDirectory=3D=20
>>> (or tmpfiles.d for older versions of systemd). Systemd supports=20
>>> stateless system [1] and therefore every service must work with an=20
>>> empty /var/lib.
>>
>>
>> I'll try adding StateDirecotry to service unit file to=C2=A0 see if this=
=20
>> can solve the problem.=C2=A0 Thanks.
>>
>>
>> //Yi
>>
>>>
>>> This patch hide a bug in bluez and the problem should be fixed in bluez=
.
>>>
>>> [1] https://0pointer.net/blog/projects/stateless.html
>>
>>
>>
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164177): https://lists.openembedded.org/g/openembedde=
d-core/message/164177
> Mute This Topic: https://lists.openembedded.org/mt/90331367/6374899
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
efan.herbrechtsmeier-oss@weidmueller.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

