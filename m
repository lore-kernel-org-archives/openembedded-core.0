Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8F0DC2D0CD
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 14:58:32 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.53])
 by mx.groups.io with SMTP id smtpd.web11.957.1747839502926483940
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 May 2025 07:58:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=aYT/gRQe;
 spf=pass (domain: cherry.de, ip: 40.107.22.53, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JDTD8+e3xfPs/l0CNad6M8J8VjbHkffkN4O8O/3Zx2LqvCiy4upcJxKKgRtywFL3+oj+T5lQGyJe8HEgDYtBO9u4jV2blG+At4/BG7fqg/o8i8dw5gV9VqtHcqvQqvsrc/FxLp7743DAlHlXC4i5qpudgtT4QNFMXRqVTJPygMXZ9gxGnRco49DYoZWEJWABRPBsJXeOpWndixWgMr2ZL6E9GJoMWSTYDT7vThmlek6gveYofVXmFnvvzchawDle1FFuw1x4AYa207525ezRqG4MbYulL0WyBmatdg3mnfhEbbdk89WMIXUp0BWHDQ80OosWnmAz6PYhLWNqJVNAvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EtogfH73FcAaNQf1vpQWwNoI25ujh7uCOhXsoBdUqik=;
 b=HzVcVoP3FAFOLePyO/27rpEkAWu8lZol0doRZPgLnTl6rwwyiJYhPrmvjWWD3cHhIzTAzP5qVDfuFFjOKw6whUdcRP4JaelLpIC7viukWMFz+8FH2m/w/joT62IhYZYr9OsZ+B1kHs0bIL9zX4E3GW/f7vAjZSauumVxx4Gq3P8feA9FqoO7gqi7lnmXZ0OB9z178SKK4KR7su+RWiXXKfJI4Itf91ZLc9BeKaZX0a9EBhBr085LUQCgaJoqadg7pnv8Bkyao8HU0yXhDEPGcheBiFw6I4UidcRQ5wGNoELIyM0Fa78FJXZABeEgZ6aQGZh5SDcFxTo75GDSIpq3SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EtogfH73FcAaNQf1vpQWwNoI25ujh7uCOhXsoBdUqik=;
 b=aYT/gRQeW27vJx6h1k1FLG7Ufuril9g4XOM0PMxpjcSsPYaa7Z2Lr+hLJH9IGZLiAP4MKtwFhUJPkejPnaf+DIH3yTdb1f2Vo8yTOOLD/NZcoNMlXgTMCguF1bnQaZcErEWCRZwWCpLj9gkTSELn1EH6ISBHVdNfXygQriqHDPE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VI2PR04MB11073.eurprd04.prod.outlook.com (2603:10a6:800:26e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.19; Wed, 21 May
 2025 14:58:18 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%4]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 14:58:17 +0000
Message-ID: <fae0ed00-df42-4abe-bb28-8722595825fd@cherry.de>
Date: Wed, 21 May 2025 16:58:16 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] u-boot: disable CONFIG_BLOBLIST on aarch64
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>
References: <20250521135136.166390-1-mikko.rapeli@linaro.org>
 <b85c6a6c-250c-4b87-b9cc-92ed5fd51d19@cherry.de> <aC3ovAPrRnwhogik@nuoska>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <aC3ovAPrRnwhogik@nuoska>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0374.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f8::6) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VI2PR04MB11073:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d7d8054-f647-4ae3-2a0f-08dd9877eb66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?U0VMSFd4d3QyR2RzR1YrUGtkdm1yY2psWlBXWG1TQWMrbGV1NDFSd3pjMTZC?=
 =?utf-8?B?R0h1TGxCSVJ3T3FnNDZQenRNay9sbHJrLy84U0w0V2ZMS3FXT0xka2huTjd2?=
 =?utf-8?B?eHdlMVJDMzdKYVFvcEtJeVFuWjQxYjV1NGJKNUozN1NJbEhqTTErWjVndU9B?=
 =?utf-8?B?amg4SEsrS3ZpL2E1QU5QMmxGK0ZXT3crM3NqeXYvMkFURDFKdFVWdm91SEhC?=
 =?utf-8?B?enJYUjB3SS96TUxnQ1JEek90K0VQaXlhb2NjZmZLcTA5aEl4NXdqdENPTHph?=
 =?utf-8?B?VFB2cHZkWmRmOTQ2cTNUUmhwSnZIVzRReWVnb1hhT0pBeTVBOTdDVDhsejBC?=
 =?utf-8?B?L0krSU1GRmZCY1NZU1FyWVdHQ0hrb2gyZlJsNFVyMTZBTUxyWldFbGtSZnVY?=
 =?utf-8?B?MDd5RlhEcWxBS1owUTlQWWFpei9zM3BGOWFBTGdTZksyUWkxRk55eEdFUnVT?=
 =?utf-8?B?SWM4dUZlL0FTaDd0VWJXOExTUyt3UVZsRkM1VUoxT2MrdW9iaTN4UWV1T3B2?=
 =?utf-8?B?N3VZSHR1Mzh6LzZwS05nUkRBbG1yQ0FITFRpc0FSR0V2MjRZNUkweUUxQmth?=
 =?utf-8?B?eDFySkFMVE5wLytiQTE0dXhqcmJ4a3NyZDdMWDFSbURhbU5vV2lvOW1UcERv?=
 =?utf-8?B?SlBYWnhEaXU0M1hESjdPWmpIR1p2d2E2VE1hMERMNWZ3NVE0RHRoMURwcU5X?=
 =?utf-8?B?VDhMM0Qwak9PMXlQWHlFYjBwRmg3Y2NBTkFhUEg1dkN2NzdoWDFHODFIakpP?=
 =?utf-8?B?bnM3cm14dHEvUHkrVlBQVVZWK28yM2k2UzNYM2hkMExrWXE2NGNJdWtSbEJN?=
 =?utf-8?B?M3EwRzdWOHRyN01pVU9wUGNkcmpTQU9qWjlOUVp1bm92endVZkF2M1E4MFR3?=
 =?utf-8?B?TE9OUjFGbGEzRnFOMUk5NmdpOGYwWGE1dHQrSkdmOGNvVUdQb1dqRG04UzRU?=
 =?utf-8?B?cnJpRGdDK1RKeDJlVGFrRGVDRlpuL3NieklydWozZHl1Y1hUTThFWGtwNjRJ?=
 =?utf-8?B?eGh4Q2RWQ3pJZHMwNG4zMFpoVHhaeHBENzFhNjg5bU9lUytzYXlJSklUNk9v?=
 =?utf-8?B?N3RLQjR6T3ViSjRqSEM3d2UrREQwcFBEZVV4eXJXU25ta1FVUnJpazlQcEF2?=
 =?utf-8?B?L0U0bURtcll5S1dPTTRKQkhqMzhIbWwxTkJXSzFiYXcwRDZhSk5Ubi9Eanhr?=
 =?utf-8?B?WTZmaEVFeERtcG5UZ1ZZRG8xbjhDS21Ea0RyZE9qVWpnYkVGNkFSRnF3T1ky?=
 =?utf-8?B?WlFybVVaN0VwSlJLV250RnVvZXAyK1F0MW94Nkk3YlRsTjZNc0JaRldMTFE4?=
 =?utf-8?B?cHNyWVFyMmI5MXZMcFZlSmdoeWpqWkpFREZMMHllbW5rRDh5OHdpUWZhUndN?=
 =?utf-8?B?MW1JN0kwZlhVQy9NdFFzaDY5WGVhV05CYzFXTkxMUEVBOWE4WDlzeVVoaHJN?=
 =?utf-8?B?ZDNzNWI3OEwzakdFNkM1S2t1SkRaWEh0cmFQS0xRQ1B1Q05ST2h5S0dvL2ZB?=
 =?utf-8?B?VU5VVDdSUm9FNzdnNVY0WkgwWFpRTmdrbG5SS3ZLeEdEMVJWdm9TS0pBcmMw?=
 =?utf-8?B?VmJGclppWUQza0FxVnBZRlZ1cC9zWTNJVnVhQXp4aDdOVkMrWlpyclltazhw?=
 =?utf-8?B?Nlo3K0U1c2RUbVhZMTlHU250QnQyK2xZZVpsTTE4cWZNQzJJdXdOZG9PMks2?=
 =?utf-8?B?ZnFLenJEaEgvQXZvdzloT21mdnJ2V2R4L28reDNhTm9Pc2pFNFJkK09ET0tl?=
 =?utf-8?B?OG1hUjBVOUtLUGJLYWJLeGRock5ndWphbnoxdXQwMlI2N1lyVjB6cmF1cUJC?=
 =?utf-8?B?RWJIT01mdFhKQm92QkpvaHlKNE8wVHBuYVZSU1dvUWxUamV4SmxkYktVSWdR?=
 =?utf-8?B?My9HZVYrZWIrUGZ6dUlvWCtUMUlZcmF2ZEpKczdEMlhvYXF3bjh6ZU9ZQ0l0?=
 =?utf-8?Q?rCVmbCnlzyc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Y2s4QWZVVTFoRVYyc0dEV1VySjVJd1RNeXBoc3ZONXZkRzdvcExsdzZkeUJP?=
 =?utf-8?B?WE8vUHZBRGtwVTgvYTFCTXBZMEFLbXBycnZta0RIQm1FMUtFRVJvczFXWnZB?=
 =?utf-8?B?RCtqY2dhQzRRWGdmQ2RZaTFLc3l0bzF6ME8yelRvTlgzRFpiWkhJNGJFWmRL?=
 =?utf-8?B?UW1XMEF2elA3dXdnR2hwYkRSRld3RFZFU3FiaitWaVBxU1c3VUNwNkswTnow?=
 =?utf-8?B?ZUNZZDdEYUZQZVVYRjJzU3RQcDg5VEV3a3ZDM2lvWmdFNld3UlYwMSszN2NP?=
 =?utf-8?B?K2hQME42R1ZiWStqN1p1YWVuQ3FpV1ZIWVUwcC8ySkgxdk56bnpjSnMzQTB3?=
 =?utf-8?B?NlhlN2xVeHhzdnF3KzE4eUZWUFpMMStzenZpclJmM2VidFY0L0tOYlhrczdy?=
 =?utf-8?B?bFhUVC85cEtQRUljUm5JQzM3SkpiS2pMMXdUbHI2RWRRc3lGem1UYklXUjVa?=
 =?utf-8?B?VFNvMU5ONFdXSk80TWt4TWd4eWFBeFpxRWxRYWVOMjZRN0pQdk1vZk5TNmpl?=
 =?utf-8?B?UUNHRGVlb0lDT3hZOGFDeEoxSTg4YWV5N2RSUzRJNDRWVlBxZmNmOUhzay9p?=
 =?utf-8?B?NjRjTTdUbjJkRUVKY3c1RTJCc3pKY2FGOHhWSXRKa05zbm5IaXp6djVRN3B6?=
 =?utf-8?B?Z3NrSktCTDg5MjF2ZVg4ZFNRNGFlZXFUNXZBNHhjNWl6VlV3ellGcUpCM283?=
 =?utf-8?B?TW9aTnB6dDZNNVJFcW9YY3BJTkV3eUYyOG5SaVhFZnZHcmdjSWNxelFiUjU4?=
 =?utf-8?B?Ly9aWUNXdVBxckdOMFRlVzUxTVdCR0oya3lLc0lhL01DZjlIZGpHTkFaSzNK?=
 =?utf-8?B?QXZXNEU1dC8rYXk2aEU4bndxQjdZM1p5NWpDb1pRWU1KTzFNQmpuUEg1MFF4?=
 =?utf-8?B?QjlUazVjeThWWG5oanh3WVFsSUpUWDZBMWdabHA2cVhBdk5lS21ZUDA5SWxQ?=
 =?utf-8?B?eE1CcUpzeDdockliRHc0VzAxSmxCVnZtNTNIVkNFaG5rNnNiNWxSRTRiWjZa?=
 =?utf-8?B?c0UwbFVxQi9yUEdNdDVtWTlQN1JvSE0vOUJqcTN1bXdTdm45TnZpc0ZNTkM2?=
 =?utf-8?B?SXBFM3N4d09aMFRtaUs3Nk5UT2hrbFo3Q2hiRGgyeEF3ZCs0M3F3ZHFiMlRx?=
 =?utf-8?B?NVJsQy85eENGeU1pdG1rVE1SQ045YzhVL0lqOGNIMVFyMVlGVGJpWnhickhI?=
 =?utf-8?B?c1VCRUxSTXYra1BCTDc0bGRkSUhOSk43dFg4R0IwZTM1Sm5pMEVUQ0k0TVJt?=
 =?utf-8?B?V29XejVTZ0I5K2RyMVJrK0hDR1BaeFlxTU1UQm1Ta1RGOWMxd0g3TGl3VTdC?=
 =?utf-8?B?OGYxMlBobE5LY1pXTGgvS3dzTHFSMXRXQUhGSENaVnM4MmxmYXArQThrY25w?=
 =?utf-8?B?Z3BBWkF1TXBWZlVIdUtPT1oyS054UmRlbmI4QUFpK2dwanplQXdUQUNENUdD?=
 =?utf-8?B?RHNDWEdXZDNISGpDN20rWGx5UXFRV3lVZnF2S3ZGKzdiQjdtUGpscnFkVjhG?=
 =?utf-8?B?ZEpZZ0syNEhBZUhjUk1xM1dZSnNVTTFJWVZSdWtEVEtxcXh2SWgvajI1RVds?=
 =?utf-8?B?ajJ4cTRjdERHbHJGakZnQlduU21MYXNLaEREQ3VaUUtzUVdSaFk5Q0RNbnpi?=
 =?utf-8?B?K09rSkRMdml1dCttaEovdWdqenEveGxhekUwZ2kzRFFjek9ObFhiYmt3WjhZ?=
 =?utf-8?B?OVdiMkM1NU9XdXcwWFc3TGtjVXVqQllVMHJ6Nm5SQVU2VytrYXBKdFdHMlhX?=
 =?utf-8?B?ajJFRXgrYkVPU1dSNFduVDBiTCtlaWN4SWdqa09zZi9XdFlpSmRGaUkzV1Jw?=
 =?utf-8?B?clpzK2J5NEVwR1lIVEREOU9QaXpCVFdIMmkxSyttZURIM0J2TEUvOTAvancz?=
 =?utf-8?B?VllvTk1KTkgrNDdhOG12ZU42MHhtUEV4WUNWOUtUMXdTc3RJcDU1Yk1FZzRt?=
 =?utf-8?B?S1VMODI1dkdFSmV3NVBKd1RoZE4rOU95YTltTUp3MXBpRSszaVM3aGRWTnBu?=
 =?utf-8?B?WENvaG44QlNlMEJVaVJTRHZSLyt2RkN5ZXpTL2dqZGJpN3BvUDRvcTF5d3BN?=
 =?utf-8?B?TEZEbmdxUVNRQk5EWWRSRjBtZ1RyNnE0b1NyMXgyT0c5NDBOUENBZHZTTTky?=
 =?utf-8?B?VFBxSDUvR2hxSEk5ZW5GT1poRkJ2QjFiNlVCdWQ2OXZaemxNd0JjaE5mc1VF?=
 =?utf-8?B?TVE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d7d8054-f647-4ae3-2a0f-08dd9877eb66
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 14:58:17.5685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s1mVAMQ1bm86OgIDBVpBgIF3tDHiYpW6hgfXWMaQHL6RoT7LXzxnbcrxBRQ2SHmzOUwtvdh/vxw4UfAUpoRqMybejhpHbR/f5PYkIyn9AvY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11073
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 14:58:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217035

Hi Mikko,

On 5/21/25 4:52 PM, Mikko Rapeli wrote:
> Hi,
> 
> On Wed, May 21, 2025 at 04:14:04PM +0200, Quentin Schulz wrote:
>> Hi Mikko,
>>
>> On 5/21/25 3:51 PM, Mikko Rapeli via lists.openembedded.org wrote:
>>> Booting on qemu with kvm is currently hanging on aarch64.
>>> Root cause is in u-boot and CONFIG_BLOBLIST can be disabled
>>> as a workaround.
>>>
>>> To reproduce, build on kvm enabled host where "kvm-ok"
>>> succeeds. For example genericarm64 machine and core-image-base
>>> should then boot with:
>>>
>>> $ runqemu slirp nographic novga snapshot kvm
>>>
>>> Without this config workaround, the boot hangs without
>>> any messages in qemu output but ctrl-a-c to qemu console
>>> can shutdown the emulated machine.
>>>
>>> This seems to have regressed after u-boot 2025.04 update.
>>> KVM boot can be detected from speed, for example genericarm64
>>> boots in 550 ms with KVM and without in over 5 seconds.
>>>
>>> Fixes: [YOCTO #15872]
>>>
>>> Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
>>> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
>>> ---
>>>    meta/recipes-bsp/u-boot/files/disable-CONFIG_BLOBLIST.cfg | 1 +
>>>    meta/recipes-bsp/u-boot/u-boot-common.inc                 | 3 +++
>>>    2 files changed, 4 insertions(+)
>>>    create mode 100644 meta/recipes-bsp/u-boot/files/disable-CONFIG_BLOBLIST.cfg
>>>
>>> diff --git a/meta/recipes-bsp/u-boot/files/disable-CONFIG_BLOBLIST.cfg b/meta/recipes-bsp/u-boot/files/disable-CONFIG_BLOBLIST.cfg
>>> new file mode 100644
>>> index 0000000000..d01d3d12d8
>>> --- /dev/null
>>> +++ b/meta/recipes-bsp/u-boot/files/disable-CONFIG_BLOBLIST.cfg
>>> @@ -0,0 +1 @@
>>> +# CONFIG_BLOBLIST is not set
>>> diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
>>> index fd1eab5cdd..d8c70da782 100644
>>> --- a/meta/recipes-bsp/u-boot/u-boot-common.inc
>>> +++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
>>> @@ -16,6 +16,9 @@ SRCREV = "34820924edbc4ec7803eb89d9852f4b870fa760a"
>>>    SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master;tag=v${PV}"
>>> +# workaround for aarch64 kvm qemu boot regression
>>> +SRC_URI:append:aarch64 = " file://disable-CONFIG_BLOBLIST.cfg"
>>> +
>>
>> Can you make this qemu specific? I don't think we want every aarch64 board
>> to have bloblist disabled?
> 
> True, at least qemu and genericarm64 need this. Or should this be tied
> to some machine/distro feature or something else?
> 
> I guess KVM support is not a machine feature atm.
> 

I assume this is about running U-Boot from within KVM? Not sure there 
are many machines operating within that scenario?

Also, I assume this is going to be a short-lived work-around with a 
proper fix in U-Boot? I'm not sure we need to go through the hassle of 
adding a machine feature (and documenting it and all) if it's unused 
"soon". But I also understand that short-lived work-arounds also 
sometimes stay for a very long time :)

Cheers,
Quentin

