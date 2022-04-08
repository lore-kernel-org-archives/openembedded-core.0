Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B28B6C47089
	for <webhook@archiver.kernel.org>; Fri,  8 Apr 2022 17:09:36 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.74])
 by mx.groups.io with SMTP id smtpd.web09.4347.1649415110809603588
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Apr 2022 03:51:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=i/H6nckP;
 spf=pass (domain: weidmueller.com, ip: 40.107.0.74,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YUu8GBIlpltKZZOjxsr0BMVpmwpTwseAmRUWkF7BinOKNRgm+8b4R6c769t4+Zpnpp6qrPHXqwaEBNPUeFjP0+miQZx3OCw7YBfzjpSxTHcO/gLXAjfyz0bFax2Ts3sajHPdy3cYLrMnT12zOM8EO1QR3xmTl2kshxlo7H+et1efy+fj3jUHdwgfenWGG05sw50H8Qy9h2SaVJDlJuhbGwgEfyUAJmV1/p3ZmbXy8d2jsGC3U8KdHoHob0wwGp74RG1u7rB1DXndu2vdGBHnToQ7qnDY1OkpPDcQ1c2lAgrGWd98TZXKN6plKsYP3a+OGe8QcSrwwa7f8085YmiikA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FxzT6EnSDczW0NLuNkR7dsSCmbsROJVA8oKgKWMFOYo=;
 b=PM9Cn6BQ0YqNksg9Ip8iqDFgHaFw+npZmwz1dkxG9YP7KvR4Jc2UWlBTxxiXaM1GCvnBEsUzlKOTqY6KMYZzKFlvIa0NM22BkVMednJcndT1+ZZSpnisKzqMtcpaQgr7ObbnL0gk27VJQvDSau6e1oebT6Q/+OY9tNgUWpzympGvSifq1+1NMVY4LdVbfT4hOlw6ulFymisQ3WFuBGY+aI8blBrjIFMl1ipA5A4odhp09rgfhivfvvO6tkrNVqos2UbHKYXNKamwp4R/uJJteijgOvs3ldpqkCOxciuo6dxEHBoyVGfqJUJXcq79dZwEvtmxAUNhXM+YDhEDmHUc5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FxzT6EnSDczW0NLuNkR7dsSCmbsROJVA8oKgKWMFOYo=;
 b=i/H6nckP1jaAfC3TRWS8D9eLb+VciqrDFlI/Nt+fHtRR9o+XPVQhwOEcbh0q6nOOXeO/2EvZDTZgOMWQLOO+URvBb96L+GsWQGVNE2Tuee0Au0HYEAux42BVoVj26WUhG8q+gQN3+7nRgYWHtdCLwxmI2v6Tsmc+izr6pI1/sx4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by DB8PR08MB3946.eurprd08.prod.outlook.com (2603:10a6:10:b2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.19; Fri, 8 Apr
 2022 10:51:45 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::c53d:64fa:866b:b512]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::c53d:64fa:866b:b512%7]) with mapi id 15.20.5144.022; Fri, 8 Apr 2022
 10:51:45 +0000
Message-ID: <8c740cc8-8c84-9e34-ff12-8c1d5721d302@weidmueller.com>
Date: Fri, 8 Apr 2022 12:51:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [OE-core] [PATCH] bluez5: install /var/lib/bluetooth directory
Content-Language: en-US
To: Yi Zhao <yi.zhao@windriver.com>
CC: openembedded-core@lists.openembedded.org
References: <20220408081533.1705128-1-yi.zhao@windriver.com>
 <348e8577-31f3-3ed6-393a-ebe511cb2186@weidmueller.com>
 <111d0c91-aaff-966f-6425-f4da193c29e2@windriver.com>
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: <111d0c91-aaff-966f-6425-f4da193c29e2@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR04CA0075.eurprd04.prod.outlook.com
 (2603:10a6:20b:48b::24) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99aaecfc-20e2-4dc8-0035-08da194dc601
X-MS-TrafficTypeDiagnostic: DB8PR08MB3946:EE_
X-Microsoft-Antispam-PRVS: 
	<DB8PR08MB3946DC05B63B59FE5AB21C59D7E99@DB8PR08MB3946.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	M0Is873sbFPvgHomeMm52ZEVTokuwdsM0JkF0NkILi8WdfX1gtr+SOIQQR6+lzAyh1p8iIjR/uFufzn1gUXHhqi26ktytA55ie+wGVdzq1g1GTNGC/ukkSUIZCaRSEByyou4QNfUeinHKeyKqaZ24MUG9wJ3PccjrhVxYCKwGjU5qHSRRgmvnuc9sB3vuI7jJR/hIkeYv5KJmfNnPyQgYkAWZqNsEWCS562ik0R9Q0GicBtMUKvQpD/wshCNQIfLcoJWcBUdabdOkvL7vFHjbyM/aa9/RZL8j1aVNUq1OtQuP0xZ05QTmwvK526CLD6xkZ9fj58AA7lyQ+yBXFHENVvIkeDFMGpBvtHUtQjlC4PMi1nHBRaN1O/VUAwOGoLlC2Her6Xwh4AXOlKvlAT8VaqrY7zuBMz6POkeJt6TYhLm9lV5FGH38dSSTBSlrZ2YQ/m/jciEBGfqNKVknWdzglS3YpBGeVJRwYR/azYVBE/spwC5+1hwYGXTgQw1WHDL4u6m83yWBleJrd4PZB4sdSDCkRLGZq7feCIXHOMGO9rs0yaCygLIgWB1kMRiVanKXnuNkGcBJacjfTvdhW+WQbKjOxYH7Fra1nYaASlQts31a5Mww+qndBJ2+cs8AZpTFb1YHErhTHZ9gw308hSW/4IYU81T0KhVOiC44HClWArFOcsYpytWd39wAxaDfx2nCXMIM57BWzcX9R0ohWSQpaBQiBFzW3O1hoky4RF8k45SZHacEdKbCP8RhInTb7XNiD05sbLmW+Ssl/5HhMliEl3MiqAO+ro3d3YMJIsj9a0KzVl/TyGePJbmYi9H/BUPBhxaUJTxc6cPzeC/H+BTOZX9Tybly62j6ALjdts7f/c=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(31696002)(6512007)(8936002)(508600001)(38100700002)(6916009)(38350700002)(6486002)(966005)(316002)(83380400001)(53546011)(2616005)(86362001)(66556008)(31686004)(52116002)(2906002)(36756003)(186003)(6506007)(8676002)(66476007)(26005)(66946007)(5660300002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?msbC1dPKKEatYzj6qOjBxejO/KGdzJ4kw4NQ5waZQC1qqqrI3rAzrtcWL6Lh?=
 =?us-ascii?Q?Z1yRC7mmMixDaUpbKf92Vu9aHyBZQZYa/QNQ+p3xkoCoe5/zvCvtiRI/gF+W?=
 =?us-ascii?Q?1pQZ3SFdOAR3KYACpW+dxFaQKw/3UKUBVUL+GXoCSfS+INhxaZgQU3xAhWRt?=
 =?us-ascii?Q?8KESxoWvIyc4LHZGGBxHK8uJ41gBeijYIyxif9CQgOB1AwV31HU/QFnSAolT?=
 =?us-ascii?Q?8wcHbiFVFRtGwjC6aP36/c8a5+CzUk0vXKqRj7XOQPu/2GU5qsDVZz6o/TMA?=
 =?us-ascii?Q?SkR//oQxHJJxF5z5nHK3z4JYmSLCRGwlCmtgVmOcihJ3QOamOVQEhL7uJp2C?=
 =?us-ascii?Q?OZcuGawETn2V4Y3ZeZeBP1VdemzfPJGSbtnQ3Oh/Iqzh3NcCAbSj2PPB1sJC?=
 =?us-ascii?Q?omWhfFZkuj7CPMRdhHRlvMczY+LFYI3gpQnOvp4+dJrm+CcgLtR24PXn2WRA?=
 =?us-ascii?Q?8rNr1LQvLclcqb5hYJOt9uu2VE+UG1a9suo/tW1Zkzub0o4rOJRZtvCDqkeY?=
 =?us-ascii?Q?j/8ZdfqJK/s3XcACmPJaYi9WH8xkHfan12eZdQyn0l7DhJ1cMDLq/eA94qzw?=
 =?us-ascii?Q?w2BpwZ2RCtW2Oqd315KlyTulI/JkAh9ooLVw8nAU/VwJ2W6hsX6KJm1E1npl?=
 =?us-ascii?Q?KQevRToFk0n4SFa00VoEa27GeSA8ET5mr/TFv+S2lr9ymE+aFAmRH6ceRTmD?=
 =?us-ascii?Q?vzpPqy1/psQ7BwuiClxJQSHCtYElqpgHNZr9Bx9I/+ewbfbuTh8f+dDtGrw5?=
 =?us-ascii?Q?bkzf1If9b7A9eoB/CBxCaZJg/Lrd7n2jwPCAwTY36B8xCkZu5d0GbujyxfIj?=
 =?us-ascii?Q?7+xXdqbFpeLE8kA7cGQAf03K3lm7cZvhxsLm4Mq3DNpUbJxP6ZLfHb26YrNE?=
 =?us-ascii?Q?Q2//qRZ/AksaQu11hsZAOcobZLAtuobzPgHlRpo9kAvZFUi97SKrbVm0LBHd?=
 =?us-ascii?Q?g4eAbG98pqRTv91qaqcHyQJ8RvWwnjNZ743SRdUFmwVHiLhEFqAwYB6FTRnk?=
 =?us-ascii?Q?vObELFREPATeWtz81bsZYmKpb6nL51dRVSjbag3YgjR4tAcEXhd/SdCj+raw?=
 =?us-ascii?Q?7fpxPsoMuXMLyYohTVQcs0CA/FWB4yI54HUPtSbytxPCTv9NZ35/QhwVMwv6?=
 =?us-ascii?Q?tkzSrnRXjyefSwiAO4pFv20+i1zOLZuAK0p+7rNlpsfkOkHbroqQj0CoxRxi?=
 =?us-ascii?Q?cWZhSIhfFmw38VXUneoB8vwgi+dGjUPMQ0fXvTrlZ/ZsrrOwN6fUyQOEoTJP?=
 =?us-ascii?Q?b1rVNfz+jqqi3a5lpPrqbR94vQJCgzvErQx3IeqWdRKpvleQLfu9rCMlzRbn?=
 =?us-ascii?Q?5wjc8Qiob2X9u+NGP7uDOtNHDV++DhQXpPThbgpAyn44FS/NwomkGy+aZHMT?=
 =?us-ascii?Q?O+S7BomdLS7KwId9G2wXzVzGYlXXw5dUpN12o6Db67iIoFt9r1RO5eFl7mpj?=
 =?us-ascii?Q?SPbr5NOjmcPuNh95gigEmEaqEAE98P7jzsVypxiakatca7VL4LKrjIHSiN8b?=
 =?us-ascii?Q?Q4Gyv42rJo/x1GE+rZE0CWK81XzciIeejAz6yTMzVWjtCQJzR4NXmlZ9RpE1?=
 =?us-ascii?Q?diX3wVBtlXhUYhrvfZVxqKmPtYx/gUhYIcufClgltG6ADwmRqW59Dsot1oz9?=
 =?us-ascii?Q?Vc9HBu3jyUNIbxcLH41NGu8DGbe7OMLu35BoMUBVnSXG12a2WU3qLb+KVZEm?=
 =?us-ascii?Q?mf5FmqrqjRR+OV7p+Zuwu43fN6gvmXcsv7V44lqC83GFEK5yARHA63PlHy/V?=
 =?us-ascii?Q?mH9MYZn1kSKA27vqgzNtWvI2vqNOH2w=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 99aaecfc-20e2-4dc8-0035-08da194dc601
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 10:51:45.3351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 iRhgb9wnXrHeQQ4PLrmE/rDbrZFjJom+X75HkbdZB8GGEWe2zl09j3P4XuLxJ3PK6ww8qxi7pyBjzGPkeeAvTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB3946
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Apr 2022 17:09:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164158

Am 08.04.2022 um 11:23 schrieb Yi Zhao:
>=20
> On 4/8/22 16:34, Stefan Herbrechtsmeier wrote:
>> Am 08.04.2022 um 10:15 schrieb Yi Zhao via lists.openembedded.org:
>>> There is a bluetooth service startup failure:
>>> bluetooth.service: Failed at step NAMESPACE spawning=20
>>> /usr/libexec/bluetooth/bluetoothd: No such file or directory
>>> bluetooth.service: Failed to set up mount namespacing:=20
>>> /run/systemd/unit-root/var/lib/bluetooth: No such file or directory
>>>
>>> This is because the directory /var/lib/bluetooth has been listed in
>>> ReadWritePaths=3D in the service unit file but does not exist. We need =
to
>>> create it before service startup.
>>>
>>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>>> ---
>>> =C2=A0 meta/recipes-connectivity/bluez5/bluez5.inc | 2 ++
>>> =C2=A0 1 file changed, 2 insertions(+)
>>>
>>> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc=20
>>> b/meta/recipes-connectivity/bluez5/bluez5.inc
>>> index 79d4645ca8..ee2cdbcc59 100644
>>> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
>>> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
>>> @@ -102,6 +102,8 @@ do_install:append() {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Patch python tools to use Python 3; th=
ey should be source=20
>>> compatible, but
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # still refer to Python 2 in the shebang
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sed -i -e '1s,#!.*python.*,#!${bindir}/p=
ython3,'=20
>>> ${D}${libdir}/bluez/test/*
>>> +
>>> +=C2=A0=C2=A0=C2=A0 install -d ${D}${localstatedir}/lib/bluetooth
>>
>> Please use systemd StateDirectory=3D [1]. Maybe it is reasonable to=20
>> replace the ReadWritePaths=3D with StateDirectory=3D.
>>
>> [1]=20
>> https://www.freedesktop.org/software/systemd/man/systemd.exec.html#Runti=
meDirectory=3D=20
>>
>=20
>=20
> Thanks Stefank, but the ReadWritePaths=3D is set by bluez:
>=20
> https://github.com/bluez/bluez/commit/442d211b5f30f00d5ddd69b43385a03c142=
8ac45

And who creates the directory before the patch?

The systemd solution to create a state directory is StateDirectory=3D (or=20
tmpfiles.d for older versions of systemd). Systemd supports stateless=20
system [1] and therefore every service must work with an empty /var/lib.

This patch hide a bug in bluez and the problem should be fixed in bluez.

[1] https://0pointer.net/blog/projects/stateless.html

