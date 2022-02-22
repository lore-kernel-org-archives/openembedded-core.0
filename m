Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0DD5C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 13:26:28 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.67])
 by mx.groups.io with SMTP id smtpd.web09.12674.1645536384598069309
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 05:26:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=T8AVI9Uh;
 spf=pass (domain: weidmueller.com, ip: 40.107.6.67,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ICcENwtJwrPb2AYTh2cmizzeINSUBL1JxavnH5Rogz5x+OlCtd6cGc6fGOuK9ULKcA3e6TcWvV4EhiHtpBtb02MNnd0A7zNpSuW+T8c+QjT9MkQibaLhIknX8oHBUeg0KgHj4WFQ7wnYUPSLR065lbZPl9qv31cCvyZuf45/5J/MEgctosakoPcq6Xu9tU76OOPW0mHn9tH7sST9PmqMMEOzladzOicow+4aL61EdLsJ4Vhe009sbycf2ijCxVJlFlhv5KyxG8OY2cWukmuNU0F8Ucqo+uCC+5KA4CCCIZSpaUiwVNRN5i/cGPNhmwOE+bnsL1RpYNpeYe/RPLYuHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QHYcfdrhQ8Seycl2NGcqlu6YczMLKmMgLWfUhgnqlng=;
 b=nOur2I+KHHPfv7RkkiLVJp47PDjF58GSrVSoZj6co30m2zoLEl+9oxuodnRIuvAJAq7mrJLAEh425q7fTxINkoeTMH8F+WSBVfGs7sk6Fs3t5QFuo3kot3EqGqjwWunF58OtyJQTnVWEScMGUbMt67yUXQmKty1ndeajhnqyN3xCw4XJLGPAEu6jZwAna9wNISPrefbH+SiDEOOnu2Do1Eucxo9jpi1+pLEgBCJJubJX9UbJPlKXbsXyZ3ofuEHINuITQv8qh1nkZn8XXAGMcP8atjTX/Aj++SkyeP0kBN3T9Z7G4ucaxUKbPiOksrPSjGZaO5qTsHFD7xl9Uxi5Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QHYcfdrhQ8Seycl2NGcqlu6YczMLKmMgLWfUhgnqlng=;
 b=T8AVI9UhgdIrV31tx+4U8qPwbaVBOr4ySSu7ihh/hNS31K7I8qyr2W0khkHGpqBeGzTHrBpBVXuu4Xcs8IpwAuXDL+Cvy+3j/0lIyRnkCSSXG8vN1w28WdVbYSumw9HUqrB9cPipwGnhLjVj4TQT7CKx1HzRCCJ8G/5xuTbt1Lw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by VI1PR08MB3616.eurprd08.prod.outlook.com (2603:10a6:803:7f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.24; Tue, 22 Feb
 2022 13:26:19 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2%4]) with mapi id 15.20.4995.027; Tue, 22 Feb 2022
 13:26:19 +0000
Message-ID: <7764a230-888e-f92e-538c-dcd536e300d3@weidmueller.com>
Date: Tue, 22 Feb 2022 14:26:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
Subject: Re: [OE-core] [PATCH v2 3/3] systemd: Minimize udev package size if
 DISTRO_FEATURES contains systemd
To: "Yu, Mingli" <mingli.yu@windriver.com>,
 openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
References: <20220202073525.3413-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20220202073525.3413-3-stefan.herbrechtsmeier-oss@weidmueller.com>
 <7b788487-cfaf-7d47-2697-6ac692cb7b5e@windriver.com>
Content-Language: en-US
In-Reply-To: <7b788487-cfaf-7d47-2697-6ac692cb7b5e@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P195CA0034.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:81::47) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a84d2bf-8b9f-44d2-368f-08d9f606e959
X-MS-TrafficTypeDiagnostic: VI1PR08MB3616:EE_
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB3616C4059C7EAE8BAC71FA65D73B9@VI1PR08MB3616.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	a1A2nvpviYsACVM6qc5eccRSmCWnV1zfajf0DDKVbzWtjVv6oU+6aJo2B41BmpEIzhGtnDm3nSX2jguVH1kgHD6ISB+gQ//xm6H84/+fGCekddaP1eBjBqOYBfNvrJP+ENwhZlM7Ql6k8KzYmA29QUuc6qOvp58w6qOKTYdgu1FvXSgJHusRqTCcbIxCuiTBfjWjlcypyt60ysoGxXwMdD6wzd8Qsjt1B4nsTx/KyVbJiDUVM2exITbEe4c0AC4tqIWfiUb67QuUnK5AENBDNRFFMBV+Z1zCSolfBiPFAkFSFnV9Qh+vh+kN6TICoseL76SPmldMUynqT7C+kJ75Zt1pMHfNih8n3/Nd/u3MQhktd2IXErWD4nuvkAvV52zT4bpsh+PbSfv+tHPTY6qhcrdGSamgxL14xjwWbjXl2VP4J8Cdmpeg4+SS+ROo/BNIJvaEvixC3iMyTbwjSwwIHQYtU9AhdkexTZHB4HKjkJeyP+UiYpu4IDMVlZW/jM2fz3bjdTfM4lf3nEuu3fcogms9emQ8iiWTfwCn3guD8RBKdhtj0ZBSYdrMaiu21CPXDIsJQh9R1vGMm8UGM8651+e5h8cWzfWHiB8UNxF2G6Rjt/opjKwHveFMeXRVbq+Pj6wQTM0vLem/sE3E9qkquWatLS1ow10WaYr4QkUTmGMrgNHQAqvOXsnDKwle8r6/BqXVjWxi8p0eicHy4yqcZIVeql6pV4KeOCHzWIuOBJM5MGfAWBRItgl5U+AbNZX3
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8676002)(4326008)(66476007)(66556008)(2616005)(6486002)(107886003)(26005)(186003)(316002)(66946007)(508600001)(38350700002)(6512007)(38100700002)(86362001)(31696002)(2906002)(83380400001)(8936002)(31686004)(53546011)(36756003)(6506007)(52116002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rGeHtE14PH0LfyxXR4f4L9MaoQkWEEeU0yV7A8Q0yz4S5PROurw+ckK3vm0X?=
 =?us-ascii?Q?qzDkFfBUcdAvqyVI9HmW+XpQ7y5QrbMV8qMp8laBL5agAw8l771tAFnCz8G5?=
 =?us-ascii?Q?/V+vNsgGXqyaE/btJgtA1HSBrGr+6hBM3EoqxDyBlnfKQ8yaKKuKQ0dan+hk?=
 =?us-ascii?Q?Rv8zdWyPXDn1AK2xyLcRN/jykJ27R2wMDKrniSe1FCCDk5Gi6/fI96zI+OCj?=
 =?us-ascii?Q?W4yH0ruOxlDdSoKG1agLM/CXlMBt0SBSx2w8pyMwPfKEnWJVMDtBZj+bHTuW?=
 =?us-ascii?Q?xe8NfXAGpbqUx20qeWIxz3uHzdLXtv+zw+7NgodScho6IPJvGV4XVaMKvZHP?=
 =?us-ascii?Q?v2DiQyN1Hv3Wrx2F1G0oXEqXG6FIrt3D7nfedLzDgW2NEAJRcYLOLJN8J7cs?=
 =?us-ascii?Q?5rs/6luFDQqsTmd9slcSq6sw6mHDzzbF+g7+29R9BYiMeUgil+A61VIWl8d+?=
 =?us-ascii?Q?HZt8PhVc8dqR5sSemg7qy+EO/GqzSlDzKLfdO0nTja9rMG8HOi/liFYaYLPP?=
 =?us-ascii?Q?sSav1QfiBr6SQj8ge47/U5mIzvcq/Lkg2Azf6Mw09Kg7RrXBAXVkaaaRLmJh?=
 =?us-ascii?Q?v2EMYXi1CQclAOUm6jkGBacb9AkDzHmFWRJNf5qbSZCwUdA5J1H2bgNYjfFz?=
 =?us-ascii?Q?Pu3GGUNRij8tL+Jo7++UDV5DlUtJKKP48yiARCvaKgL1Txl9UVr7ev1fBXWr?=
 =?us-ascii?Q?zqXhHwvHsPLsz3xN/pYXv78nAISrc8MxS+533WhxIhokHwVVjfom/eQ4FqUr?=
 =?us-ascii?Q?6hCAcLYFr78F3dv7mCnpEcX5GaPpDmJejmuDgfCpdsSO+aUqBfFELAEhLd7F?=
 =?us-ascii?Q?j5Ysft05VkwVNZkaRig4Q7XV3QqlAyaphRh9eRm9WkYk81KIS/H1ybyehVe0?=
 =?us-ascii?Q?dPFFBPRKx/ls0KcLRaGqi1/HV4hWjaDX2mZotWIhZkiolNZfDkuNMfkZNFpo?=
 =?us-ascii?Q?nB1Q2YAjX+R/7jGbvoKawSfPx1ooFseUEOzd2FiK0GaCBRjK5Enh7dEWLKgL?=
 =?us-ascii?Q?3IOz5RUOBWs1RChjc6QRFLzYR2w1QXH4hBVB3vdrTxNHzTKPoXT0YR2/TfgP?=
 =?us-ascii?Q?+giMXnojAdexUxs3Cu0wSfOSfAY5Va5IKNW4o0H4+D4ncmi2FRv7Hsf4MNBl?=
 =?us-ascii?Q?HaC8IgwwUt+xldxxSo/9zr1vuvYEkesPcqP6quHZjWCta0NdvS+tfvxpa51B?=
 =?us-ascii?Q?A0MNBVoe9rY92hYjstCPDJwvoPHoVs2n7CBFbRBP00cJCkptMDFDBcNBdhnR?=
 =?us-ascii?Q?rWc4sA1ymapttPWfAqgqfE+JFrMSXyL2O6+8kT0jIHRfKWzBNiPNieQZG8h/?=
 =?us-ascii?Q?7yWpayJS3AKfPCwFXhTmuFfqrSqr7a2myd+4ywcOqQ6EgW7RYRE2Ow3Ye6Xf?=
 =?us-ascii?Q?VDt9Clwgm8IZfvqlK9PKcJiuk2McxO54tro9eZwj3omk4II/UjlpYXpa/mVk?=
 =?us-ascii?Q?y+gOTMVGif6ykCf1hXxLVbHkZUPF7Bm72k1vZDfCwo0O1bC10fBYh9d4eh23?=
 =?us-ascii?Q?2jdptxarefq5flUwF1iMB7MvGldNZBui0TYTBSTWu562zboMMatgoegnLjs0?=
 =?us-ascii?Q?YCcSUDvhSF1fO/h3cX8GMQYY/NaFpEy7C+6Dh98HxdZicZsr81avB065T7nH?=
 =?us-ascii?Q?exDNoI9PHEA0DCejAdUL7HY=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1a84d2bf-8b9f-44d2-368f-08d9f606e959
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 13:26:19.7635
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 N4JtCemvUncXRcvBo5/0XUN5bktDtl/FVGCT+PCyoEK1hvM7LST4Ok0KhXcmsBzxZHstRzWy9MT6/JmJEYvucQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3616
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 13:26:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162132

Hi,

Am 22.02.2022 um 10:20 schrieb Yu, Mingli:
> Hi,
>=20
> On 2/2/22 3:35 PM, Stefan Herbrechtsmeier wrote:
>> [Please note: This e-mail is from an EXTERNAL e-mail address]
>>
>> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>>
>> Link udev shared with systemd helper to minimize the udev package size
>> if DISTRO_FEATURES contains systemd.
>>
>> It is only usefull to link udev static with systemd helper if udev
>> should be installed without systemd.
>>
>> Signed-off-by: Stefan Herbrechtsmeier=20
>> <stefan.herbrechtsmeier@weidmueller.com>
>>
>> ---
>>
>> (no changes since v1)
>>
>> =C2=A0 meta/recipes-core/systemd/systemd_249.7.bb | 1 +
>> =C2=A0 1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-core/systemd/systemd_249.7.bb=20
>> b/meta/recipes-core/systemd/systemd_249.7.bb
>> index 739f3aae86..431781e6c7 100644
>> --- a/meta/recipes-core/systemd/systemd_249.7.bb
>> +++ b/meta/recipes-core/systemd/systemd_249.7.bb
>> @@ -66,6 +66,7 @@ PACKAGECONFIG ??=3D " \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.filter('DISTRO_FEATURES', 'ac=
l audit efi ldconfig=20
>> pam selinux smack usrmerge polkit seccomp', d)} \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES', '=
wifi', 'rfkill', '', d)} \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES', '=
x11', 'xkbcommon', '',=20
>> d)} \
>> +=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES', 'systemd',=20
>> 'link-udev-shared', '', d)} \
>=20
> After this change, the iso image failed to boot with below error:
> Cannot find rootfs.img file in /run/media/*, dropping to a shell
>=20
> And more detailed about the error as the attached.
>=20
> Steps to reproduce:
> 1, update conf/local.conf to use systemd as the default init manager
> DISTRO_FEATURES:append =3D " systemd"
> DISTRO_FEATURES_BACKFILL_CONSIDERED +=3D "sysvinit"
> VIRTUAL-RUNTIME_init_manager =3D "systemd"
> VIRTUAL-RUNTIME_initscripts =3D "systemd-compat-units"
> KERNEL_FEATURES:append =3D " cfg/systemd.scc"
You have to set the INIT_MANAGER variable instead or set the=20
VIRTUAL-RUNTIME_dev_manager variable to systemd.

> 2, bitbake core-image-minimal
>=20
> 3, runqemu qemux86-64=C2=A0 core-image-minimal=C2=A0 iso

A revert of the commit solve your problem?

Regards
   Stefan

