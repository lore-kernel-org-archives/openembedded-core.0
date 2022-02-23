Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 732B1C433F5
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 08:14:06 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.86])
 by mx.groups.io with SMTP id smtpd.web12.4952.1645604043638057295
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 00:14:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=yq8Kc1EQ;
 spf=pass (domain: weidmueller.com, ip: 40.107.5.86,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z6eTWZTcP+Yv0cvcnFRU4oXAUEsSsKhNNOcEQBPNNM0DD6egsHiV7d3x+nmzi435Q3CPRPK4JS0xtHFlrLmIEcN7iCrDQ4kBFt/TfAfoSsudhibSDfOIUsCHj50SQ7qptVADSOm5KFTP2m25SS7gYJgPGRqjKREg5e80AHjpRzbDApt5CML8m2YDuTFiXUiZAeIy+FTWsvJSx/SmDSgcGaXfV4VcyRHVkXye10UDA4j4pWlnddr06LyJjuN8jC3iQN5A/gQQSVKbbNtiwxnMUJscdC8NAYRKtZndK7xykW9ZRIPPD4ZHbN4eesL/nNtq5G8NJfZbEBewBrAwZsywqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bq8Fi7SkQ7KrR/kpRWGCAa2QKRiDQWuLueYL/Yx1cHI=;
 b=goY2y3dHx0ZjZF4Lbn109ywUDbhCHDs+0JHLUglnlXhW2ebe4P0QLVfdMxRbEJf3Y3uZ753qwcFt+YdsP+Ez3OJ8TYOI/QZxfGTKjqL8ABGLhS4JzLtQ0TWxgIzMYFTzoA2tQ1wg9jN5pPJrRTM5dMKXfU+nKL8hdWPECQEtp2JGeA+K2ffiVV1wM7uaI1MMVf73sVGKjx6pA1BCVBlu/50C8rKhomz7PBo85Ia0cwlpZBuEBN2Wl37eK9pdJn5rjdjWD7Sqai4znFcAAoU+UVGUH1enrd4S3uYUHbY4CsAQncHKsXrUt0CYjZOTxdirH+trivQWsADaQm7fmt3v0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bq8Fi7SkQ7KrR/kpRWGCAa2QKRiDQWuLueYL/Yx1cHI=;
 b=yq8Kc1EQNEaPKY+T3Fjxtot6inhoVP3shmKki5ysOMCRTzF8G6ZNn658F4RJQbjoYNeT23oj3LqOHlJdXEfW9yr0gRrqMn0rFoLhM89n64opHH+EflxzN76TPFWBVag1oxWtq44WJ8XRDU9gy26Sn26QTVe54KTGcnxThrUow/k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by VI1PR08MB3742.eurprd08.prod.outlook.com (2603:10a6:803:c3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Wed, 23 Feb
 2022 08:13:59 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2%4]) with mapi id 15.20.4995.027; Wed, 23 Feb 2022
 08:13:59 +0000
Message-ID: <f7edf748-fbf3-ac39-69ec-69c9aebc79ae@weidmueller.com>
Date: Wed, 23 Feb 2022 09:13:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [OE-core] [PATCH v2 3/3] systemd: Minimize udev package size if
 DISTRO_FEATURES contains systemd
Content-Language: en-US
To: "Yu, Mingli" <mingli.yu@windriver.com>,
 openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
References: <20220202073525.3413-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20220202073525.3413-3-stefan.herbrechtsmeier-oss@weidmueller.com>
 <7b788487-cfaf-7d47-2697-6ac692cb7b5e@windriver.com>
 <7764a230-888e-f92e-538c-dcd536e300d3@weidmueller.com>
 <2e481fb7-360c-890d-b651-4a83af7b11c6@windriver.com>
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: <2e481fb7-360c-890d-b651-4a83af7b11c6@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0027.eurprd04.prod.outlook.com
 (2603:10a6:20b:310::32) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f6acb0f-f795-435a-5fb2-08d9f6a4717f
X-MS-TrafficTypeDiagnostic: VI1PR08MB3742:EE_
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB3742D9BC60356B7D7ECAEA5AD73C9@VI1PR08MB3742.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vF7JC8ljWlLqjjF1hf/5CftLrW8OvB6ZxdNHYyhrCEinMXxPDX5ukrk74Onp+uuY+TKspu457m4rsWpk+l7nhtLxZRUcHj11Z0IKCGfg9yBfJVwyAiLEhexrkjb9B7JJ9/bpOhNfPfy8tGROuFweUH2H73+jvotFj9PcGEloQHEBqoNJXvradZP17qp9a1G100zEImPqDXlMBb7I8hy6lLGAn8VScyTAl++5vtToQDGQdwjtmBqrEMcxBykzdB3rxys2PfBEppH7i+h+3XmpgnMB5Ymv4oD95kjiP9VWi7jBu+/TtuEh+GYG2ROLxbnDuT9OvBfHAnPvq8rxyMuE5yv8+DPSInFLbM6+CrxoqDpUhwxVjBcanS40NfAmD32CUan0Zbv/aWd82CUSAeL4xhgCX1qXZttAX71QrZDuMKOuTEzIY6Gn5zQPC31f5pOq7M5xWc3I1UICB3M9OfmCIPdnBqqSx/ZN/HwlWpgfxMU/CJNU3g5X6i+pKqfYl9zRxiFa0eRTFpXhZ9sy3DD90/mx4AiHS4I+CfCQbcueJM13l9yzhh652VSeg6JVd3GG1f1hqLGVSsFL3r1T49hCtC4r6PIi3HcNjdAXtEbh7JRwxpzDvuzl4g1L/WWuK+1vv1JX/9Q2Hn4rcpBCrypIqGFYjaHmF+wk/+3/5IqROluZl17C9hhyioJiydguUlijM3d2i0WpqcsATRir0AIq0o7os5vWbsyW1sgCKzvWRZbFGpO+JsvxnDQ3FbrwCkH7
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66556008)(66476007)(26005)(8936002)(66946007)(4326008)(5660300002)(186003)(83380400001)(8676002)(31696002)(316002)(86362001)(6486002)(2616005)(52116002)(36756003)(107886003)(6506007)(31686004)(2906002)(38350700002)(38100700002)(53546011)(6512007)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2lqLtm8JuVCCGbIpJ8eJtTddGQRgSnITD86ovB5apxU5c+qGxQWv5KOiUx62?=
 =?us-ascii?Q?Q3JDL9RlGi3zI196Y6vyGF//M/mkbzOV/ITtXRJPXYrgTifoXI8T960mMdb7?=
 =?us-ascii?Q?MNm7r0p7ozzK645dSVcIjZBcHEkPXFYQOlXaIKqYgD+xNeoxABjFjE+L3hBx?=
 =?us-ascii?Q?qe9hMPksAqiZ+QH4SjTioz4gHSAUfksgeWVt+koLzauH4sulyqG84ODec9h/?=
 =?us-ascii?Q?QSIAZWh1UbDub0F3fHgfrmbNXZZHF/8Mta/E3nCHFnLVQTI4PJuSR+nd3ebK?=
 =?us-ascii?Q?+b0WKXouEG2ocOXtdyABp9zyzqOa/tDGIh1nSAG4g7xRcE5MjQLR4J5ud6OC?=
 =?us-ascii?Q?Wa1MeQDoc80EbPw+2VIdYgIA+DbLx5njzAibQfz7vF+RjnFyXWwps8Np+Tfh?=
 =?us-ascii?Q?1SmMU4KPTfXCOb+7hTuZF1oRhbnUsA+Z6R+Smc5EYqTJV/C6sgZWwDOsw6ut?=
 =?us-ascii?Q?gvi88TJsutA1z85nOrFC/g565HVmw1B5ZeG7HZXqtGyDDX1WfAVVbezITXnU?=
 =?us-ascii?Q?98rPkkQ6OxCmks7B473ylAkji+WokIXcB8Y64yRM4QM7wUQMi3xxFE3QZypP?=
 =?us-ascii?Q?koAX/GV0p+qUNJktm95RtQr5TjH3zDr8rtcrC2/AiW2VMOCL6hw4F3rX561/?=
 =?us-ascii?Q?3Nq+I0Z8EtIkcVqhMjPfryr601S33238Fb8zsPGEEks23qkVoVPe/wmO2cwy?=
 =?us-ascii?Q?2kt4/otWqJv+3WMegBVO2WIzg1HwK8eFgyfymcOnRhQbYHwO2v0h42Ng3Iqh?=
 =?us-ascii?Q?qccSbuSnpl7+i8vNWziY53+9oXb0oNSGyg90+poXlMmjpqHlEf29+UPR9gNr?=
 =?us-ascii?Q?SBioYNUIw5T10tSISaf5CdHhpijXeVxIJrerm/4rMHbPvCv51S6keTzKFtjO?=
 =?us-ascii?Q?ful/6i6daCObNT32kHnL8rv2wwVSzOqKVzTAkHUrc+lwWNKrgPEk8XrB+1JR?=
 =?us-ascii?Q?NbSQudD0i7Pq5sYH99oClsg7iEc657aZt/k8mz4ehaQSNJbdrPpgfKR4k/uw?=
 =?us-ascii?Q?tJDgLuhE9oX6eixRrb1DwZbdWl5Q5Nu1huvMVPTR1hiySZcSJWkOr03b9K6s?=
 =?us-ascii?Q?RatamYu13a1WQe/mqlf8wtOZPadJWzoHOlw2JpflgpBHDiAoNYq2AFMQc6pu?=
 =?us-ascii?Q?DXXtFwpl18eebQRv7GD6Ab8Ofp/RR0u4xJMgG0iGlh5/YpWQft/fz1dOsTbp?=
 =?us-ascii?Q?jtBcN2fnuf56d/QWvEc1W/vlD22SchgvxBmsnEt3oV/nNQpe/oDdfBNE3ypm?=
 =?us-ascii?Q?luW2M2YONJA7dHTj5z5qXZsmhehrZnFfPi1dRMOmpI3GvlsUpIxNMHWs9B5k?=
 =?us-ascii?Q?4NHqHG1Gd8nCojcVw9pgT6jm2NgGSgA538dt+OZAjQEo+2CVXK1YTVmhZqLh?=
 =?us-ascii?Q?CbtqKQ51sv1ebOWG03W4p6FeHnbAsEZSd0MP2EKKn6sr/No6czWOlF37WqqI?=
 =?us-ascii?Q?wXsEc7PFSv1bZvYL1Ht5TWEsYPnYvImmDcTzzIuOkQywJF4+etPrfh3x9all?=
 =?us-ascii?Q?MEVyb5edJ9RiINN7ltG7lC0Ex241b1yySQnG/gOYFubNgrJ1rmLInvI3qX1Y?=
 =?us-ascii?Q?rCAgLimV0bs/Uu8R+0rHvuSx8B/51SCMIUWrS3UqwtLqhtKIEt5H/yuOCYAE?=
 =?us-ascii?Q?koqXjOZuc9/dR8B1TSlwOG0=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2f6acb0f-f795-435a-5fb2-08d9f6a4717f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 08:13:59.0752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 hDJOdBy0wP3zMuetDdPRwi88WpuvoKIhpdnJndprEicchkhbVIfrwNAIwObekdfmFfWLOEsXt96W4SutW9osNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3742
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Feb 2022 08:14:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162246

Hi,

Am 23.02.2022 um 02:49 schrieb Yu, Mingli:
>=20
>=20
> On 2/22/22 9:26 PM, Stefan Herbrechtsmeier wrote:
>> [Please note: This e-mail is from an EXTERNAL e-mail address]
>>
>> Hi,
>>
>> Am 22.02.2022 um 10:20 schrieb Yu, Mingli:
>>> Hi,
>>>
>>> On 2/2/22 3:35 PM, Stefan Herbrechtsmeier wrote:
>>>> [Please note: This e-mail is from an EXTERNAL e-mail address]
>>>>
>>>> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>>>>
>>>> Link udev shared with systemd helper to minimize the udev package size
>>>> if DISTRO_FEATURES contains systemd.
>>>>
>>>> It is only usefull to link udev static with systemd helper if udev
>>>> should be installed without systemd.
>>>>
>>>> Signed-off-by: Stefan Herbrechtsmeier
>>>> <stefan.herbrechtsmeier@weidmueller.com>
>>>>
>>>> ---
>>>>
>>>> (no changes since v1)
>>>>
>>>> =C2=A0 meta/recipes-core/systemd/systemd_249.7.bb | 1 +
>>>> =C2=A0 1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/meta/recipes-core/systemd/systemd_249.7.bb
>>>> b/meta/recipes-core/systemd/systemd_249.7.bb
>>>> index 739f3aae86..431781e6c7 100644
>>>> --- a/meta/recipes-core/systemd/systemd_249.7.bb
>>>> +++ b/meta/recipes-core/systemd/systemd_249.7.bb
>>>> @@ -66,6 +66,7 @@ PACKAGECONFIG ??=3D " \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.filter('DISTRO_FEATURES', '=
acl audit efi ldconfig
>>>> pam selinux smack usrmerge polkit seccomp', d)} \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES',=
 'wifi', 'rfkill', '',=20
>>>> d)} \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES',=
 'x11', 'xkbcommon', '',
>>>> d)} \
>>>> +=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES', 'systemd',
>>>> 'link-udev-shared', '', d)} \
>>>
>>> After this change, the iso image failed to boot with below error:
>>> Cannot find rootfs.img file in /run/media/*, dropping to a shell
>>>
>>> And more detailed about the error as the attached.
>>>
>>> Steps to reproduce:
>>> 1, update conf/local.conf to use systemd as the default init manager
>>> DISTRO_FEATURES:append =3D " systemd"
>>> DISTRO_FEATURES_BACKFILL_CONSIDERED +=3D "sysvinit"
>>> VIRTUAL-RUNTIME_init_manager =3D "systemd"
>>> VIRTUAL-RUNTIME_initscripts =3D "systemd-compat-units"
>>> KERNEL_FEATURES:append =3D " cfg/systemd.scc"
>> You have to set the INIT_MANAGER variable instead or set the
>> VIRTUAL-RUNTIME_dev_manager variable to systemd.
>>
>>> 2, bitbake core-image-minimal
>>>
>>> 3, runqemu qemux86-64=C2=A0 core-image-minimal=C2=A0 iso
>>
>> A revert of the commit solve your problem?
>=20
> Yes, the issue is gone after revert the commit.

It looks like a loot of packages have a direct runtime dependency to=20
udev and after this patch udev have a runtime dependency to systemd. We=20
could revert this patch or move libsystemd-shared.so to its own package=20
to remove the dependency to systemd itself.

Regards
   Stefan

