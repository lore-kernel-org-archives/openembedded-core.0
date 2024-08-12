Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2BB3C52D7C
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 08:20:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.41684.1723450846539774750
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Aug 2024 01:20:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=895429e4d8=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47C80AvG029296
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 08:20:45 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40wy651hs4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 08:20:45 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 47C8Kjv3025388;
	Mon, 12 Aug 2024 08:20:45 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40wy651hs3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Aug 2024 08:20:45 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CPhbLrUqytgdvN0BCjaJEv8hjeJ/k6Gv/v1W0dfmXADLwHSXgu0Ty7CLwCr5kE7FwKy3oLd69OAC4fG7O7DQqwPUpZLt/kxh8kBH/n53IupAUlRgFwIwR6oQKLEEkNFbr/02RCE+84gyX8bVdtDakneO9b1g7xZBCG+pQqor949veNa3KPmWjNrU2Z2XaqPteY5riOmFhNOhtsKt2VJok89IK3ok3xu+Jmw2olXFhzsnQ9baNIbWV1uIuC5cJyx0EWA6tGuAET2f04Bb6kQ8VfFlyPAtNRXe4GBufPAVsWIjTR28Dhpx+h5cOne9TFG43zIvvUc5olUUhkGQGJePDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4YkURPkNYN7jooK/NMhfYl5MgSojAvic2xNnlQttRE8=;
 b=A7CfYCK57DI9aLdA877hg2DxzVxoapkYT6bgPSEVw6EzbzruvXwZZi3euzV4dYobE0kdwyz1CWBoqOtQKgUh39ieXNFSu5fMR5o2jZEiL6WtKbl9AvteaZoz0xO2zjeQbltAoE+p7yAW66Fx0uMVorbT0NBm+a4Ki2M6C43Cf9rLiZkD36V126HxQS/bthRGsVmXN5xAWg+5OBoNWoqFT1BWLFxJinmHGpGDX5FV7QUBqmN+DrM+onJ8PScykW2GUTc+CSkmFRXb/N9VuDThsvtJfhpIsItgbwHqmuwfEBJH92LjVvsQqtLFrE0shDlWDWgSdZpxybcJAXLUXaryhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SJ0PR11MB4878.namprd11.prod.outlook.com (2603:10b6:a03:2d8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.32; Mon, 12 Aug
 2024 08:20:43 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.7828.023; Mon, 12 Aug 2024
 08:20:43 +0000
Message-ID: <494ff818-3e76-9234-f724-dba7724b217f@windriver.com>
Date: Mon, 12 Aug 2024 16:20:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core] [oe]printhello
Content-Language: en-US
To: Andrej Valek <andrej.v@skyrain.eu>,
        openembedded-core@lists.openembedded.org
References: <9d12e616-a06c-4182-95bc-a6bba7f9e422@skyrain.eu>
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <9d12e616-a06c-4182-95bc-a6bba7f9e422@skyrain.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCP286CA0324.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::12) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SJ0PR11MB4878:EE_
X-MS-Office365-Filtering-Correlation-Id: f16d9422-7e94-44d2-cfc6-08dcbaa7a8c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|4022899009|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dXNleXVnMFN5NzlDK2tENjQyYTBDaXZkTmsxZk5acXA2SWZ3a0o5UGRycHI3?=
 =?utf-8?B?dEtlZ0tlaHNUdXFnSWJ0YzE0Vjc2WHFIYkJvb0JGd3puVjcrWmV6WldZVjE1?=
 =?utf-8?B?ZW1xa0JaaE5nd1lMQ2dpZXRJWnVBZ29zWnpXbjNNUDM1TEQxRXFjZVJKT0Np?=
 =?utf-8?B?azlpcHVjSlNNbUt0WHFybHNFTy9hejhxK2FtS2x3eG4rcE5yajFJcDFjeDFo?=
 =?utf-8?B?b3BVV1VnZWRqVGxSUzdaY20waUZRZ1FUem5NOFFoOWc4M2xVOEcxY0NGK2tx?=
 =?utf-8?B?cXpXcEk4SFZNL1h2L3BUZUVPK2hKaUV2ZUp5SzFFSFI5R2FRQnhYTXBLeUpE?=
 =?utf-8?B?Y2grVTR4cVYxQjVnbjJONFg0bldqQnNsMWg5MlZFOUZzTW9LZXJidUVyamVx?=
 =?utf-8?B?OVcwVkdGVVd4L3FyRGN0UmlibnowK2JzVTJWZm1sYlVGblpwdGJMUkpvNWFV?=
 =?utf-8?B?N3orRWk0Z0NBU3BTK1NQdXI0Snlva0Ziekh6VlZTQm8yYmUwcllmMlV3bUth?=
 =?utf-8?B?aVd2WkJyMHNOYVl6RGRUVmR0Q3F4em1oMk5qYkdsNWY4elNHSFFqeDNFaWI4?=
 =?utf-8?B?UHkzSm9FbFBtM3EzMTNXZnJ2WE5OWmJMQUE3QzhKVUQ0S2VCV2NuemZNWVky?=
 =?utf-8?B?TzhiM1ZIeFovN2x2MVBuYlNNb2EvczlubE1SamVNT0hyclU5cUhGRDBMWDdS?=
 =?utf-8?B?YTQyeXRwR2JzWVpoSWxmNlNQcTdoVnZWeS9zL3pnbWtHMmhzWkk2bGlmTjZ5?=
 =?utf-8?B?TFlpQ21xSmVVTUgyejdUM1h3UWNSR3hmVlhFdkwxdmpackJpeXV1aWkreEth?=
 =?utf-8?B?anpraUhCbzdCYVo0RkhQbklGZTloaVpQaXJUUE92NlMzaytNMHdkTUdqc09I?=
 =?utf-8?B?Q29SZDlQTEgzR1RsWGJCYWVGaHNkS3VpOG1hTHVadW1UWko0alUvU2ZGRWp2?=
 =?utf-8?B?dkh4NUliVWQ3V1ppS0NVTUxvUnJqNGM3YWpJd0JWNTRlcXZRb1A3OVdxS1pL?=
 =?utf-8?B?UHg3UCtPeVY2ODIvT1RmL3pmekpDaW1FR1I3K3JsR3pLRHRlMk1vWGtma1p3?=
 =?utf-8?B?VGpCLzNSWWh5b1g3L3haV01ITjkvUEd6RVhJb3gyVUM2LzVZZHBTTzhnQ09K?=
 =?utf-8?B?V3d5ZWVuVFBLbC9oQXVFS2I2bWdJREwwZ21QYjJMKzRmczF6UEJ3bUlHVThP?=
 =?utf-8?B?WGZKYXNWNUU2dWlqSGJCR2gyL0FZOXJ3RGZrdEFiMlExY0lHUXI0VmJmWWFT?=
 =?utf-8?B?S25iQ3A4VFZNTXpDTThGeGU2aEV0QVpSS1R5a1lYUTNiaTlKaWRSZHBFVXlJ?=
 =?utf-8?B?Zm5Hc2czd0tUazR5S2M4Mzc5UWRrTU5nQ3l0SmY2THk4bjBrVm1weGFROW92?=
 =?utf-8?B?VUJ1N0FEVG9VL3dRb0h5T0xnWGhyT1BjZFFRWk9LcCsxeWhZdVpyTWErOXdv?=
 =?utf-8?B?ZGJqWktJMXE2UXRnUFJNOFYzQ3hJRFczVXFhdThQQU1hT0ZlNGFKOHM2V2gr?=
 =?utf-8?B?RGpnMXBpQmpTUXAvNU5DZS91alIvOHR0YVBXQ1hnbFIxazR4Ty9KN2dGNWRy?=
 =?utf-8?B?YmFwTzJsbWloK3JRVWJQekRYUEo0eTJjYWxvSi9QRHhBYnlzZXA1UThEeFRZ?=
 =?utf-8?B?a1N2TktVRW5jYithcWYyaTNNNml4cmtWZkE3WVljbFVxMVhocnpWdHY4ejZY?=
 =?utf-8?B?elBpeitRTkpla2kzSEtHOHpTemh2eDYxUDZZenJtQXlZWUpGWWsxN3pVZCsw?=
 =?utf-8?Q?QtxbVY9N/npVJes5L8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(4022899009)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WUNDZWZySkRXclV6aCs5bUdoaXg0L0hRZWdoTEI5MUJ6eFBWWldJUGRkaEFu?=
 =?utf-8?B?V0NCMFlpOTJUVVpINWdhZW4xTjFXV3NacHovR2Mwd0RXa2ZpOTN5N3dHOC9v?=
 =?utf-8?B?Z24vNk8xOVN5amdhL295TzUzdEVsS1Z2UWdoeCtLYXJEQXNKaUE4MFpQK1Mv?=
 =?utf-8?B?QXZ1TlZyVW92NmpOanoyQU9aSDRzZi9yaEtXQTJhY0VwSVp4NkFibWdZenlB?=
 =?utf-8?B?MitDM1RxL2RGN1NOUCt1YjRJemlpeVBva1lyTnJ6NEhsY28waUVJNk01Z1lR?=
 =?utf-8?B?SDJvUTFCNUtuczNsOEVLTVpGeFlSQkFZSHN1TnlMdmZmYnVsVGxXZXZiaW0x?=
 =?utf-8?B?RlkreWNqeS9kOXQ2Q3VHNUo1aG9EQk4waUdTaTdObU1MVGM2cER1ZUlmUFk3?=
 =?utf-8?B?d2h4U3dzM0dydGpxL0dwYTl1T3F6V0FCSEVKSktmOG5YcUN6WGRyU003TmE0?=
 =?utf-8?B?cGRoaGIyTVVQejhIazNieXZ5NTJyV2dGbkVQZ1RleE9PS3FaMlRIWG5Iams2?=
 =?utf-8?B?bEgrN0RvSTE2Q1VubHVjZUlaRElMMXFTaEFrWmhHOGhoN25ZYUJIbG5GS2x5?=
 =?utf-8?B?Uzc5MUNlbGdObmIvcHBTR09ndllFYzVCS29obU1IZ1E0OG4rd3NiUGc0amlO?=
 =?utf-8?B?cFJMWTlNWmVuWENXeHUwY05oWHBlNE9KNlVnS3lrNjlKK2Z4ZWR4NzJNQTIy?=
 =?utf-8?B?aFgzblRYTjFrVmZubzlhbXdlb29sRzlBUHorT29FVVBjTXRYRGYvM21zMTlD?=
 =?utf-8?B?WlMvVTNjY0ZUbDZ6RUpwYzZOWGZkR3h3bTMwOXN3OXZlTDJPSGJySnUxT2NL?=
 =?utf-8?B?ZFJMZHF4Z2YwSk1nTWtNNS9qREN1VDdMQlhLOTZaNzlhRWxVNW1TbXlicm9V?=
 =?utf-8?B?MkZ1RTFPc1dYVTk0ZEs4TUhqQW1VTDFWSi9xditaQ1Bta28xc1N3YVV2MWNl?=
 =?utf-8?B?clFWNjNqdjFSVU1iS00rc2R1K0tIYXdnZlNuSVpNZ2JTWXdMT1VPMW9nR2JD?=
 =?utf-8?B?R0FXaEE3VmJaSHB1ekxLRGlwaXV1TFVuWHZzd0s4Y2FOR2gyVDNqZW80K05a?=
 =?utf-8?B?S1ErcjZCbVdtYkZUbHBob3JxSmFTYjd4cUdrekZmL3V0UTZ4TUpUMWFxdlM3?=
 =?utf-8?B?M1gxSTlzd3pUTWs3ZHpadU5tT211dnpybDlhZWZnbEpNMHAzU0tUNXEyclZt?=
 =?utf-8?B?MDU3Vi9XaFpkQ1prUndaZnl6ZmhKRk0xTHh1ajBXcVU4WXk4NlN4RkpLUm1C?=
 =?utf-8?B?bzh4Z1ZPVTdrTlByYWlXU1d1aHN6ckVUemRoR0ovWHJXeDhtRlJoWm83UFVG?=
 =?utf-8?B?WERxRGVpYmJEdHZYMnNsNGlMbDhnbm5wUG4zRzZhWmhlT0svaHdvYnMwOUxB?=
 =?utf-8?B?YUxJUm5UTGthOWhzN00yODlVVXpCRVZTdW9WM2sxZTBmayt6OXF3Y0lYcnJV?=
 =?utf-8?B?NklPcTJjZ3BPeWNjbTBRcXZ1SUJ6UGtNMlBuVy9kcW5QamVERS9pdnZyM2Vx?=
 =?utf-8?B?N1hGOGY5UkxySGw1SDd5MnM5RjE4TmtCdjV3ejlnMFFWcG13SURDeUEzVFJB?=
 =?utf-8?B?alFVYXNTVEc5RkhoUUsyVXNoRnMyV1BtQ0VOS0x6K1FzQmhPaktGOXpRVlo4?=
 =?utf-8?B?bjNIMEJmUkV4R3duMGRLVUM4eUUyY2dLeW4yK2NodlEzMmxCaW11eGk1aXMx?=
 =?utf-8?B?NVpvL2tVUjIrcFdvcEgvL3c4N1Y1SGxhSlZYRUxGOGRsZ29WdW5kbmlTMXdJ?=
 =?utf-8?B?UTlPL1k2bloybEVjbVFuakNmb1NwK3p5THhnQmQxeVRaODFXWlNJUUd1Qy9j?=
 =?utf-8?B?Nm5JMTI0UC9yT1A4cWRwSnlCWmlpNDRVcFFWYURQalRhRVM4OFZtdXN1QWVQ?=
 =?utf-8?B?T085eXo4djF3OW9ZWFdiVWs1T1YzclFhTzdyK0pJZ0lTM0owaENUckFjNzk2?=
 =?utf-8?B?N3BjbGFVV1JsaWp3K25SeG1CaU42STJKeVpKaStlaHNFU0diQ1dBN2N5T2Ry?=
 =?utf-8?B?Tlc0SVArNDhPTndpOWdXMDR2MXU5bnNpZ3RHai9qVEZxM2MyNVk3cDdtbW9C?=
 =?utf-8?B?ajZMN3ZHNTFxc1k4WGdDUWV5Syt6Q05KQ3JJblFYa0oveHdDNlJPeWIyQzJv?=
 =?utf-8?Q?uT0LzM5jeRxOilugUOy+CGcyn?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f16d9422-7e94-44d2-cfc6-08dcbaa7a8c2
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 08:20:43.5424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WKh6WN3zZAKWXXsR+5Zb/VShAXAHThctfdl2CX4039jLMAXONW9HBC8r42ZtSQcQ6wZnh0xNRqukDHj1wS4vgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4878
X-Proofpoint-ORIG-GUID: 6Jt6XPYFIfPYor9qmyi-qhkVOEKmTftg
X-Proofpoint-GUID: 7ewSULgnewegoY_Duhf3Tu-be-YSIh12
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-11_25,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 mlxscore=0 priorityscore=1501
 suspectscore=0 mlxlogscore=937 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408120062
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 47C80AvG029296
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 08:20:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203207

I think it's because do_build is not executed.

meta/classes-global/base.bbclass:do_build[noexec] =3D "1"

Regards,
Qi

On 8/9/24 14:41, Andrej Valek wrote:
> Dear community!
>
> I know this could be a funny question, but I wanted to use the=20
> "printhello" recipe as a basic example. But looks like, that is little=20
> bit "out-of-date".
>
> I know, that I can crate a custom recipe, but I wanted to use=20
> something "standard", so I took=20
> poky/bitbake/doc/bitbake-user-manual/bitbake-user-manual-hello.rst and=20
> created an "printhello.bb" out of it. I made some modifications to try=20
> to make it working.
>
> =C2=A0DESCRIPTION =3D "Prints Hello World"
> +LICENSE =3D "CLOSED"
> =C2=A0PN =3D 'printhello'
> =C2=A0PV =3D '1'
>
> + inherit allarch
>
> =C2=A0python do_build() {
> -=C2=A0=C2=A0 bb.plain("********************");
> -=C2=A0=C2=A0 bb.plain("*=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *");
> -=C2=A0=C2=A0 bb.plain("*=C2=A0 Hello, World!=C2=A0=C2=A0 *");
> -=C2=A0=C2=A0 bb.plain("*=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *");
> -=C2=A0=C2=A0 bb.plain("********************");
> +=C2=A0=C2=A0 bb.warn("********************");
> +=C2=A0=C2=A0 bb.warn("*=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *");
> +=C2=A0=C2=A0 bb.warn("*=C2=A0 Hello, World!=C2=A0=C2=A0 *");
> +=C2=A0=C2=A0 bb.warn("*=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *");
> +=C2=A0=C2=A0 bb.warn("********************");
> =C2=A0}
>
> +SSTATE_SKIP_CREATION =3D "1"
>
> Even if I made these modifications nothing has been printed in terminal.
> So the question is how good is the example?
>
> Thank you,
> Andy
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#203156): https://lists.openembedded.org/g/openembed=
ded-core/message/203156
> Mute This Topic: https://lists.openembedded.org/mt/107804007/7304865
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
Qi.Chen@eng.windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


