Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8049C36011
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 15:37:47 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.45])
 by mx.groups.io with SMTP id smtpd.web10.14398.1743176265610600158
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Mar 2025 08:37:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=VL/dftnj;
 spf=pass (domain: oss.nxp.com, ip: 40.107.22.45, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SpRFHZrJP5ueEeOCQ/NFTTl7Yv6HT50Sj1BILXIfJDEnKkI/tXLBzOqFTgZQTIQW1twiT4/RTaO8/Bm8fdIdX+cwiVn4t8nJn+I5unSVWtB3XD/PPk8Jqmgcq3D5lbbWKewd72jOfbPUJ4RcLUQJBBXG75I1s8KXIB6dtZAgClGXhltT9sz3ekCENCfibH75o8d74BofJO0GuGA7Rp9c9FVbNyvCZgihP7DSVqFqHHnGFsg/M/X5lJNJttpe1uA5vkO5klD9qqAdeO+O7KHx6LTdLWrVx+R8jTzzHcmzRw1Vtp/yulGu+tyO+zFBKIyCctZI9KSvgL8Pr/HvesQNuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pAQ+ZGj+zxKqnk1n3WeC9JekgIeiLrearBKkMz0HMMs=;
 b=hdb6Kel1tJmTFBjr2WNhKKIpm6tcPNeP5fysC0pfSbudhRdgQnTg9YCr0PsCkceA7DH9mLXb4rD/BTNZiw62/R/kLVweHMr8wNwhSRgIIAyxOPFCl1f5D77sjrSXfCFhZrQ+4DQOga3UaLOrgVfmoUbcCtNy+2OEQ3ziWxy0zBwLH0y1nj8idVC+uFUevNLQ3szHLnT9hsYim7JFh8A6upFGYDmLaZY3IvYuIJLWCrpaf7l94VqE2CXWSa007OMlx0MzzL6aVprZsemdjTqtkxfbs7rH2feWUMxJ9dNuF78rvhECtYO91bwM7AyCf72PcuLphRXIeeXFayr5cblnnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pAQ+ZGj+zxKqnk1n3WeC9JekgIeiLrearBKkMz0HMMs=;
 b=VL/dftnjadfJqIA3G+IzALNkkSZZtOHGHYIeIibtfscKx1q0lezPT1qV3F/FbivlogL2KL7R4FlsFxOJZ0VRQAgxuwI5wLR5F0meQoD1w1WSnbGYt06H3tFHXrdd7gUh34mKCUzImyEPpaejWCsH57LggFc4TzdMc0ut3EU01D/BIijc/EbwQfz4luRi8pdcxHnKK1JcJ7+FXN4lbIrj0HzUKL6lrSBCNz6Q1DIZIYB3C9QN6kY0qIoJIE5bgQNjFqrup5UbKvsD2PImPFUs1jJ463UFnZw8meIdGvMAO5fm8M1MYEumT2Wlsp4d8P2ojIpsvwHfdeshGQyTUhAwSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9444.eurprd04.prod.outlook.com (2603:10a6:10:35c::5)
 by VI2PR04MB10220.eurprd04.prod.outlook.com (2603:10a6:800:229::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 15:37:38 +0000
Received: from DU0PR04MB9444.eurprd04.prod.outlook.com
 ([fe80::70d2:fa8e:4d48:2ba3]) by DU0PR04MB9444.eurprd04.prod.outlook.com
 ([fe80::70d2:fa8e:4d48:2ba3%6]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 15:37:38 +0000
Message-ID: <ddad656e-e68d-4bfa-adf4-64d771eff475@oss.nxp.com>
Date: Fri, 28 Mar 2025 10:36:53 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/2] meson: Fix host_machine setting for native
 cross-file
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20250327225959.3611495-1-tom.hochstein@oss.nxp.com>
 <20250327225959.3611495-2-tom.hochstein@oss.nxp.com>
 <CANNYZj_KZjgk3DnoKwYHgDa95q4fVwP-c-5ZL8oHw+WZckGaTA@mail.gmail.com>
Content-Language: en-US
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
In-Reply-To: <CANNYZj_KZjgk3DnoKwYHgDa95q4fVwP-c-5ZL8oHw+WZckGaTA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0191.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::16) To AS1PR04MB9453.eurprd04.prod.outlook.com
 (2603:10a6:20b:4da::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9444:EE_|VI2PR04MB10220:EE_
X-MS-Office365-Filtering-Correlation-Id: 21314e3c-3c3a-4857-221d-08dd6e0e77d9
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?V29kVCtJU25KNkswc2I1RkV3cGhTbm1BNC9rRWNna1FGcDJZeU9BaDcrWXlH?=
 =?utf-8?B?T0lURHZRdy90bGpDUTR4QnZTbmtRem5GV0ZpWndyaGlMa2dkQnhlWUN2Zk1N?=
 =?utf-8?B?SUtpNGtvaUVMQWJmZmxzREgxSnp5dndNTllPR1dxelpqRUNWdlN4YVRPVSs4?=
 =?utf-8?B?YmJhTXJWUG11QUpINTRMWEtmc21tcmljMk40Z2pHVGJYRUMzK21qU0pWczl2?=
 =?utf-8?B?L3dnSCt2azJManJGMG1YN3JWdTdNSXhTL3N6bHJ4dnZ0b2kwS0NqV1cvM0FG?=
 =?utf-8?B?eGRpTks3WmdIWGd1dlBpV0hKVHdmUzZrVTg5UEVOcG9abHFlbzJCZHZONDlQ?=
 =?utf-8?B?b1JWNm1jdkVva28rTzBFTTF2ZDR0elQwRVpjbnhmOXpVa29iaG8vemdpMGFL?=
 =?utf-8?B?NEJsakdrM2ZNUUEvanNNaThuN0lWR0hNZ3VMVXhNWDZxNkxEK1J5WEg1MktV?=
 =?utf-8?B?eUFnSDQ1ZGpyZDdqWVNWRlU1eU5jblJESGRFbEFGL2o1L3hrSHhEZHNNYW1T?=
 =?utf-8?B?K0t1ZWFxdmtXSUVBcEZ2Q210NjgzY0YrYUIxZWwydGNLREN6MWZFNnpmQk0r?=
 =?utf-8?B?YjhSanJVYzZuOElWUFdadUpISDZvak5QZm85MkFzT0FQZW9EWlJmOXV1TUkw?=
 =?utf-8?B?QkdtMTJQbnllUDVSc0NyeXZOQUJ2UUl2MjdjOU8zQ1FBVkFmcUs1eHJqdlY3?=
 =?utf-8?B?b1RFL0VIVzhUSVRPclpaTG9vcENKckt2bGk4eS9SWkxtSk9WY1FQNTUwVU9T?=
 =?utf-8?B?WmhxMWhUc094OGxxOEhrTy94akllcXdYbm9Ka01kZ3ltNktXS0lsOUNxWUZy?=
 =?utf-8?B?VUNGNllFZmd5dUNHdHhRanFBUm5qckhvZ0tKUythWGpPOTlyd1BlRlppcGk4?=
 =?utf-8?B?MER5amZyNEhlM2xmemI5aHp3M0I3aFdVblRPbTJLcVJTcktzYlExK2NQbWxi?=
 =?utf-8?B?aFhxbUxuUkRCL0hzb1pJa1ZxK2NTcVhBY2tIVktKNTluTUhVYVVZYnZUWXJ4?=
 =?utf-8?B?S3BUbDBaS3RDbW9kK3M2VEdXTzBQbkZYN0JoRmFMUTloOTRPTzA4ZW1teSs3?=
 =?utf-8?B?NUxmcmZNU2M1cUd2eFQwcFA5RTVEc2hpWFJLRkRGL01jSjVuMEg2aytadGx6?=
 =?utf-8?B?bFRBUmJFaW0zNHdDbDM1VGgrREJCZTZNUFk1anN0RVY5M0JUTjZKNGFrOGJP?=
 =?utf-8?B?Qk9RRUFNSTA1RE4rREN6ZlR1cVN5UUZnd1lpMFRESTRsU2JES1M3T1VVMllM?=
 =?utf-8?B?ZGxEbHpIc1Q2R2NKUVNXcVNPRWJlMWk0S000dFJPRHJ0TTlSNGtncG9QRGE0?=
 =?utf-8?B?MlQwYWI5SlR4cTNBZm5XVFdocHRYYmNDeVppeEJMRzdZaHBTWE9WT1MvTHo2?=
 =?utf-8?B?YVRWMXBSN2NKQzhhaG04ZCtqQ3AyVXBSL01GaHFpZ2xSbUR0Q2NsalJKblkw?=
 =?utf-8?B?ZldQR0x6c3VzYTYyYVNCQzhUQ1F0MDVPdStGS1NsbjZkTit6ajN0enJVSGF3?=
 =?utf-8?B?N2tHbDRDT0Q3c05mdlF0eSs4bzJ0RGwwQ0ZLc0J3NWRCc0dYMVZtRHU1T240?=
 =?utf-8?B?VXRhQ00wOUVUUFpER25UWFhJbm54c1RSVmF3bjdNU1JkY0lTZFU4SzhYK1R6?=
 =?utf-8?B?dVFGQ05reTJMbitLc1RBZ2ZROUNuRVY0OHI0cG4zbWpOVkNVaCtBMmplRUVx?=
 =?utf-8?B?akt2WU9tUjBrczI5UjNXUEFKaHFKdnN1Y3EzRXNGbzF3UmR3MXJLV3EzM3Ez?=
 =?utf-8?B?ckY1RW50MFRBYXRNemhGd1grMTlVYW1Sc3o2cFpqczhHT0p3M0Z0QjczNmlD?=
 =?utf-8?Q?/6g8EgaJpFkrEtn8MkKX4fKw2COllGjsL0Pm0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9444.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aUJrTkJJMDVJUGdNTytKUnQ1Z2tEZGlWUlkyQllDRHdySEFrUzN2emhEa29p?=
 =?utf-8?B?d0FOQmdWdFJTVWlKRDhKa29aQ0tLZ0Z3aTNSYm1kT0hsS05kZHFQdVBHWmZ1?=
 =?utf-8?B?bCtHS0tRSEZCNjFRYzE3VXdpdlJFSDBZUUxibDBLQVcwRHBVUmNPUWprcGE4?=
 =?utf-8?B?K2c1dzc2NTRhcU13QVJlbEFWMFZNQm9SNGdxd0hmU2kyS21IeloxbHhSMkpa?=
 =?utf-8?B?azduem10aGw5RVRENi84TWFRMUhHdVJncldUWU1rNTFQUGR6cGhXdUk4U01l?=
 =?utf-8?B?N2ptKzJDOGlCemJtOVJkSWV3NVY5eElPaGJTaWkva3E1ajQ3QWZQbzN1UlY1?=
 =?utf-8?B?S0RubzF3ZVZYd2xpYldXVlN5REVBQWR2NjN3anUxRDVjWFNDS3NSclRCcU5w?=
 =?utf-8?B?ZjNoeDErRzhmZ3VmTUNnT29WdzcwK0xSNlBnZmd3ZVFlVHd6SjUvMGlReklS?=
 =?utf-8?B?ekE1L0NITWJuYXo0bjBKNjZWNWtDMzVNdW1lTDFEM2U2U3JsUElTVVZqenJa?=
 =?utf-8?B?WGtpanVxUWJhbEFqVmxOZEZxem1WSEt5NDQ2Y0pKOTBmcXgwVlQvRGlxTjFS?=
 =?utf-8?B?Mnk2WThaenV4SWxMcW9UcHkzT0UxVmF2QjQ3SFd6SWVLMGVIcFFDYTlWeTRa?=
 =?utf-8?B?OHgwc21sODZTK2laNHV4SmVtOURQN0xSZ1N5dUhJTVF3V2E1RWdSbGRVRGpG?=
 =?utf-8?B?djZpWmdseTBCZTdJUmdKZmVhMVU5cEF3UUY4M2pwQmNMQmlwaXZVZzJtV00y?=
 =?utf-8?B?R0JvcnEvSTJBeGJyU0FBM0VkSXBwRzc1L3hhOG5XNEtjL1VCc2U5b2FkdXo1?=
 =?utf-8?B?QUpUN2VlRm8rdVNwREl2ODVwUXlWMjJLWStyaHB4K3VVMUhuWGhqTUpPUExv?=
 =?utf-8?B?MGFDM2ZyTmVaZ3k5VzZxcVorZ2Jrd2pVZWNZQ2VidURCbCtxa2I2M0dVK1Z3?=
 =?utf-8?B?dy9HektlUDFDWTdKK2E3MVVoNXVja0ZiQitrWTRieHBvWCtjR3lHOWZhOGta?=
 =?utf-8?B?WEhBTGZ5Vlg4d1VrTXdvMi90SXZ5MTdVZlVqTURPemZWS3ZtazRSc1p1ZEhO?=
 =?utf-8?B?RGFQT05NQW8zTUNmdDQvRkV4d1VZOUFFWk1vOEcwaXVDZ01SSGlhb0xNaVBU?=
 =?utf-8?B?T1pHL2l4QzNrdFFnZnNNMkxXbjFIaVdTUVNSOE85b1MxandQa2JNbENIanpW?=
 =?utf-8?B?d3cvSUVjRGlvSzFkeTFjM1NVSzA3cDlSMnVMSHdsOXg1a2trYnNsazZVVm1O?=
 =?utf-8?B?bU80aVdYV0dkMklFU2U4S2owSzlRUVEvWS9jWi9oV01rUE1lamNhR1JqcEpm?=
 =?utf-8?B?UmpKbng0aDRrcjlBWXlwYTdLVUtiUHJQVTY1RG9YTkJiN2dYOW83bWdQclk2?=
 =?utf-8?B?OC9tUjE3MndwM3hVdENwZElBYmZZN09oNjZnVHVMb1NOd2xrQ1U5VXNnaEoz?=
 =?utf-8?B?MVlLem56Yzl4NG1mOXZBTlVYOENtbUZOd1ArMHFSSkJId01jQ28rZnlmU1ph?=
 =?utf-8?B?ejRhOXpmcDhid0poMHowUEFFa3gvVmlsZ2ZLWFdkcTRobzJoVWo4NlpIaTlF?=
 =?utf-8?B?SUxYSDBGREhGU1MwUjlKM0E1dHAxYktoV0VyakptYXN3UnVjZjdTMzg0dEJW?=
 =?utf-8?B?clRBd0k2U1ZYVlVRRmNzRFJoMTBsbUdqZWZKb1VaRU1xWjZUUFZoQ3dDajVa?=
 =?utf-8?B?SFlDQlh6amJKWGNxZkxLcmg0WnY4bXh3U1BnVWN2eWlwN2piVmxhVGpjRUoz?=
 =?utf-8?B?cnN3R3NvWVN0RHBmZyswTGo4cEdxcE52bGQ3VlpNK0NBU3YyeHZBUFlneG5y?=
 =?utf-8?B?YzJQKzRGbU5NRkwxdXVSMzA1NTZxUHRGRm9WQm01VFZsTk5ZQlRGdkloUHJp?=
 =?utf-8?B?TDIzd24xMUNhL0dtSTkzYkRkdE5rdmJIeC9YVVFXclIrT1RRT2NubmliK0Zt?=
 =?utf-8?B?RHYrNnh2WWdhTWQwMStYSVowUWltSFBFTVlHRHltMER5REkyNmNqb3RuRW1Z?=
 =?utf-8?B?NVFqRVRENS8wTUp2REdQTkVJNkFDczluZnVWVGI5MGt5WlFxVVV3cVF3ZmZR?=
 =?utf-8?B?c3Jzb1dHTTR4K295TzJtR0RvRGg4eFZtaUFrV2Vod3R5TjV1bFpydE5mQnpY?=
 =?utf-8?B?YkhjZGwxYTNMUmExM1doS2c0K2YvMFJJWGdJWUI0aFI5b0ZPTy9kSVRKaHl0?=
 =?utf-8?B?K1E9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21314e3c-3c3a-4857-221d-08dd6e0e77d9
X-MS-Exchange-CrossTenant-AuthSource: AS1PR04MB9453.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 15:37:38.4145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VDajVAE0xk/r6bp80ob2HVwLpsCUwF7/KezpKMpHp5USNDve0Maz2YnctzlzomzVBVIDSAGtk74oB7FUwceWlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10220
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 15:37:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213853

On 3/28/2025 5:08 AM, Alexander Kanavin wrote:
> On Fri, 28 Mar 2025 at 00:00, Tom Hochstein via 
> lists.openembedded.org 
> <tom.hochstein=oss.nxp.com@lists.openembedded.org> wrote:
> 
>> For native and nativesdk, the meson cross-file settings for 
>> `host_machine` are incorrectly set for the build machine, not the 
>> "machine on which the compiled binary will run". See 
>> https://mesonbuild.com/Cross-compilation.html.
> ...
>> [host_machine] -system = '$host_system' -cpu_family = 
>> '$host_cpu_family' -cpu = '$host_cpu' -endian = '$host_endian' 
>> +system = @OECORE_TARGET_OS +cpu_family = @OECORE_TARGET_ARCH +cpu 
>> = @OECORE_TARGET_ARCH +endian = @OECORE_TARGET_ENDIAN EOF }
>> 
>> do_install:append:class-nativesdk() { -    host_system=${SDK_OS} - 
>> host_cpu_family=${@meson_cpu_family("SDK_ARCH", d)} - 
>> host_cpu=${SDK_ARCH} -    host_endian=${@meson_endian("SDK", d)} 
>> install_templates
>> 
>> install -d ${D}${SDKPATHNATIVE}/post-relocate-setup.d @@ -143,10 
>> +139,6 @@ do_install:append:class-nativesdk() { 
>> FILES:${PN}:append:class-nativesdk = "${datadir}/meson 
>> ${SDKPATHNATIVE}"
>> 
>> do_install:append:class-native() { -    host_system=${HOST_OS} - 
>> host_cpu_family=${@meson_cpu_family("HOST_ARCH", d)} - 
>> host_cpu=${HOST_ARCH} -    host_endian=${@meson_endian("HOST", d)}
>>  install_templates
> 
> I'm struggling to see how the existing code ends up with incorrect 
> values in both native and nativesdk cases. Can you provide specific 
> example values and a way to see them?
> 
> Alex

Yes, it does seem surprising. I'm guessing that the use case for using
these files is not common.

One way to see the problem is to check an installed SDK. For example,
for an i.MX SDK, check the file:

sysroots/x86_64-pokysdk-linux/usr/share/meson/aarch64-poky-linux-meson.cross

You'll see:

[host_machine]
system = 'linux'
cpu_family = 'x86_64'
cpu = 'x86_64'
endian = 'little'

These values are hard-coded in the template here:

sysroots/x86_64-pokysdk-linux/usr/share/meson/meson.cross.template

For the native case, you can build meson-native and check the file:

${D}/.../build/tmp/work/x86_64-linux/meson-native/1.7.0/recipe-sysroot-native/usr/share/meson/meson.cross.template

You'll see the same content.

Tom


