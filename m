Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 850CDCCD183
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 01:34:26 +0000 (UTC)
Received: from esa3.fujitsucc.c3s2.iphmx.com (esa3.fujitsucc.c3s2.iphmx.com [68.232.151.212])
 by mx.groups.io with SMTP id smtpd.web11.6206.1760664864117687759
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Oct 2025 18:34:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=uZ1Z9nEJ;
 dkim=pass header.i=@fujitsu.com header.s=selector1 header.b=IRxMnTjU;
 spf=pass (domain: fujitsu.com, ip: 68.232.151.212, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1760664864; x=1792200864;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=buGzZ83gfBA3yo7s3pqCyyh+czlTzOxDb80HJVAQGpI=;
  b=uZ1Z9nEJ8+2kcr4T0bjVEJDLCiV6lbfHoEUJgITduPzgiD9P0kWsk3JF
   vRDTULV662I87cMsGZSP9y4wm4za5Y5L9IsC8j2nA7e+He1r4eu/Obdzg
   sG7cRoF8ipmfnIQxzBAURkuAqUhZ6Z9fq83ZqwLc1HlD+GIjzyys4jfSo
   CtOyzLZ7f8CpagvqTIOKGdzVINJZGTG5kxNcS6IccGqiIhU6IP8Emcg2T
   qoVsSlqwVbLV5hTAC47V2LZG6SOg8D24ftj6JyzJ5rniFqhfXNf9WqZmJ
   OzY8RjprlOvx2uuHzy7pvyQmsyQGtM7YP/XS6hVLbZsNHQtLIEe23csbR
   w==;
X-CSE-ConnectionGUID: aQT4yQ6lSxm4EXn4e5Gu9Q==
X-CSE-MsgGUID: BjZmXKyyRYmlOlnKubGedw==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="82448262"
X-IronPort-AV: E=Sophos;i="6.19,234,1754924400"; 
   d="scan'208,217";a="82448262"
Received: from mail-japanwestazon11011012.outbound.protection.outlook.com (HELO OS0P286CU010.outbound.protection.outlook.com) ([40.107.74.12])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2025 10:34:21 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d89/1wM0yN+MYezLI0Y0ZwMKeLUSeSPam8YfSetqVy3deyQrFUTHY1yJvT62B4Bi1uCDUoucQLaSZfejms8PklN0yUp9nWMZLjSvafKhz5z5X4HkFuxmQj4SQA8Ts2cua06/M+GTTl33iOEhkfazHSEzrcnFNzrAGFuHWJ1PRm8l0fst7ARYGZNILPfdRAMR7+wpUBGoHhT7pHV54jOpUqfCYBwZSu2aOKW/J4vU2XU44Vj/+u+Pv9Ho2d+lI0Ch2GILXQJtK+Prd3KUhzRHeXozdcSwxpBm/ePRMTyHlVW1X/o+zrg8jF6PKWpa9jqEVOvq1s9i8c4god3uA7bCMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=buGzZ83gfBA3yo7s3pqCyyh+czlTzOxDb80HJVAQGpI=;
 b=r6/3JdcUvnAECD8qHV3oj5NfCvqflFH5fGrh+Wly4e8ADCzCJTdbaf7rdG5mSzumQMRL2SLCkZrjKIbmTLGMXn42/hEyfzvSVnR5WHX8bOkNOAAcmpz3LfuNlNxpyGfqkOkXEu9dkabz+clG/L/ITrgJMKlqF0LE1G9nsR3d61tj38+MiN0cLza6RCFhn/bBy5N3mAbPzi3/GxqX22X6UQ4HS5OL8OAGlyKAESxA2umkKFHGlpVgY9qPuKfbIu5oP4yQdHBG1QQ1xkvNFf+bXkkl/vHr88kBHtFzNxzraMqDkOMg2qVmy8pcgApCHTG2OyES2ugYhD+U625iV+3mog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=buGzZ83gfBA3yo7s3pqCyyh+czlTzOxDb80HJVAQGpI=;
 b=IRxMnTjURYLzX6UbZdOHPUYRVEQjFp95zUhOOt7VPcKw8UFqAbGnOGILohCpyHXhoGOk4RHO9TyxrfslzRXMyVPDLjT4QFTXzEPRvOf55E7K4JGwHmm8/eC3K16YsAKpKYPvlu98vitGQwTVJHyeZ2yccul4u8cPotGzhLVGKWWJYPl08OA7ef6Y1Lo5cbwFlg0TL1+rgrp4o+Hl7g9g6PzLzy3Ofq8xFwM/nAeFFxNk31SCjsSUMrh5dVGLhRa88O2GtTOoCjESaTo4R5lsCMazEd2zxg3v41IGQ6/2z2ra/uGPI5pwjSdDW/aoLW1n9yqCAmCDv1/XezsmuKHqng==
Received: from OS7PR01MB11602.jpnprd01.prod.outlook.com (2603:1096:604:246::8)
 by TYCPR01MB7703.jpnprd01.prod.outlook.com (2603:1096:400:180::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.6; Fri, 17 Oct
 2025 01:34:17 +0000
Received: from OS7PR01MB11602.jpnprd01.prod.outlook.com
 ([fe80::68a8:ca7b:386f:33be]) by OS7PR01MB11602.jpnprd01.prod.outlook.com
 ([fe80::68a8:ca7b:386f:33be%5]) with mapi id 15.20.9228.012; Fri, 17 Oct 2025
 01:34:17 +0000
From: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: 
 =?gb2312?B?u9i4tDogW09FLWNvcmVdW1BBVENIXSBrZWE6IGZpeCBpbnN0YWxsYXRpb24g?=
 =?gb2312?Q?umask_to_0022_of_meson.?=
Thread-Topic: [OE-core][PATCH] kea: fix installation umask to 0022 of meson.
Thread-Index: AQHcPs+/xYg0x9lwtkCQstpk4YGyq7TFjbpM
Date: Fri, 17 Oct 2025 01:34:17 +0000
Message-ID: 
 <OS7PR01MB11602988912E7F400C417E6409BF6A@OS7PR01MB11602.jpnprd01.prod.outlook.com>
References: <20251015081156.11738-1-liuyd.fnst@fujitsu.com>
 <CANNYZj-A_jSagKfHmL=_V5B3K+GzjJo5mYizTWQre2hZ7B52ZA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-A_jSagKfHmL=_V5B3K+GzjJo5mYizTWQre2hZ7B52ZA@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2025-10-17T01:34:16.931Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=1;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS7PR01MB11602:EE_|TYCPR01MB7703:EE_
x-ms-office365-filtering-correlation-id: e736e62b-8db3-4e15-c4fe-08de0d1d49ce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|7053199007|1580799027|8096899003|13003099007;
x-microsoft-antispam-message-info: 
 =?gb2312?B?NXJtdnNFY25yTnRHNHIrY3puOGVteGxUajBKRnpneGF5MzcyS3B5TGNramFI?=
 =?gb2312?B?d01rWW93SHFYVE4xWTZYZm5HWWJnTzIyNXBubStLbEdCc0ZhWExKYyt3bTJy?=
 =?gb2312?B?R1JIaklaZUNxUFR0M2V2anNWRkxLcDlMbCs5ZXdRaHNwS2NsekpHc1NKQWFG?=
 =?gb2312?B?dERSNnhLUlpweW9kRDJyNkxEdFZmYUdtSGRNNi9tM3o1R25hellWVGtNdUVX?=
 =?gb2312?B?NUt5NGMrc09UVlBXTFFOaGQ4MUpXK3JtdXFJMHp2Z2lXMGFTVndzQmNkeENz?=
 =?gb2312?B?OHVnVnlvUEZid3pGeSt6SDFnWEFUNCtEeE9PVUNzdmJnNWg4ODdKUUw2YnRm?=
 =?gb2312?B?TFkzWHN4YnBnMFdCQm1NOG40WERoTCtvbVgweWNtUi9NZUlGQStyeSs3dlJH?=
 =?gb2312?B?R2VpOS8xL1BCQ3ZaNUxHTm5wcUJuRC9ZQ0I4L1pYNisrS1dBYkh1RGd6aVYw?=
 =?gb2312?B?U2YvZlVtNWxVa0xJdUcvR0ZlMGNOTWlmT1RWdklSSENZdS9ON1ZzcVUwazBS?=
 =?gb2312?B?amRRTDNPVUh4citmV0VnTldQYzJJT2FGUkZBL0tnck5uTDNTb0VRNWFWME9w?=
 =?gb2312?B?OEhsdStvcDNCREJvY2JqYW5zVm83VVpNanMzdGJHZENiT3RJRVhkVUNwQS9T?=
 =?gb2312?B?U0sxLzg2K3VsU2dNVnNjZ1VzallRM3BKRDNsMXhSajNEZGJkMDZUUEVWeXFm?=
 =?gb2312?B?Vm8ySkFzQzVYazRmV3FYRVRHcnl2aGhQZ3RibmpRVmFzeGg3NTMvOEt0N1Bn?=
 =?gb2312?B?QWRWYU56bWhUWUllVmFQcnVVNFdrNjgyeHMxTVBMWkIxS0hvYkp1NUJYV2hu?=
 =?gb2312?B?VXp4d25NT29Ja05hN2RIY2NQM2pJbVhMZEFLWExqZStFai9DWE9JQTZSRUJr?=
 =?gb2312?B?NkFIVWRJR21naEFJcTEzdW9kWG5Bd1ZOTDV6YUdhV1JhdkNhc1dSRW4rRWZR?=
 =?gb2312?B?Y2FydEFBdEVPYzNJRnNJMGl1L1RiUU0wQ0EvWGVQZ1RER2tvRldnSXZyb1R0?=
 =?gb2312?B?dW00cmh4T0FrZ0h6amthRVhCYkl1bTJ4cGpHV2V4SS9tS2NwYjN3QXhEdTNG?=
 =?gb2312?B?ejlLdE1PMUdIRjlISWFHZ25uMFZsOHN1bmJ2aHFFdTdKSlh5TFgvUHZ0ZlR4?=
 =?gb2312?B?amJtNFkvMi8zd0RqSTVxai9kTGNtTWNZdGszczRZbzcyMk54WHpmM0x5Nk9N?=
 =?gb2312?B?elNoV3hjRnIwcEdZZ2NyMlZWTndybC9uWWgva2tCcDBMR1JjVkU3OVdBRnIy?=
 =?gb2312?B?ZnFzZk50Q0IvcjFoVVpRS0JXMVRZSFFjdlFLdzd2b3VwdENycG1ZVDRwM016?=
 =?gb2312?B?L3R2T0FmYjdSRDdQQVRYSnhOVlZmZUJ0bFFGNjNORW94Qm1Jbkl5ZFlMNExn?=
 =?gb2312?B?dndNVWE3OXFocHpDdExKQUFjZEIveGZ1cE1PMWFRZ3E4K08rU0ozSHU0b3Za?=
 =?gb2312?B?ZmpJbHIyWkphTnd0TG9tQXBJVnJTeUp2aHdSMkx5NFhlNnNtdTVyNWwwNlIv?=
 =?gb2312?B?a3JlaHBlVXdraUs2YkdMU1ZCOEZOQ0pFVWVWR3JkRWExOUkwTDROQXhGV0pF?=
 =?gb2312?B?aWtTMmg0YXI5VG5qNk9lRkJuYnJGRkpVU0RQSGVOc0E0b1RBRk9DaG9veW4r?=
 =?gb2312?B?YmJIaEJ5NGxvYXI4NWc1NTcreFpsKzkrL0tmWWczc3NiRmxMRjlYS3AxSzRw?=
 =?gb2312?B?RjR1amNRdVd3NSsyNUdOK0F2UnVQUDV1NHYxZTR3YTZoelpJdmZUVUtGRDI3?=
 =?gb2312?B?cWtLRU1jd0s2SForOTNra01kWHlDRXRCS1BoT3IwUnZxL29McytIaGdFN1ZO?=
 =?gb2312?B?Yjk2VnJ1Uk95NWlZZFAwcU5LcWEwQVZ1Y1BHSU5CVm84cFFUd2VabTkrSGhp?=
 =?gb2312?B?ZkY2aWE1b2I4YzY1MDdQay9tU21xTXFhd0FNTnIydDVybFk3b0J5eCs5U0N5?=
 =?gb2312?B?b2thZGVuY0Z2Wk9QcE51WnRyM1pZSTZBbkk4K0M2Z3ZqQ3Q0aExhZjNMMGNM?=
 =?gb2312?B?bWpNZm1aMlZiOCtxWDJkK3ZySUxKM0NuWFQvWEw3L01icmUzcUlZNkU4L1hw?=
 =?gb2312?B?WmNsKzlnamVoQ1M1aUx3K2w1TDhvTi95WTJrUT09?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS7PR01MB11602.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(7053199007)(1580799027)(8096899003)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?YzdXa3N6VitTNUNXQm92UTNQWjloK2I4K3c3VHNCS05wQnVZQVJ1b1NOb0ds?=
 =?gb2312?B?enNDU2lmM3A5QjVVc2pXVmF5T0xjZXZvWTRId3ZWUmRwcVg5a1FIVW1lWm0z?=
 =?gb2312?B?UWdOR2Y2T1Q5RDVmblVxRjlNdGJtYUVYWDV2Q1lTOFpGa0wzTFg0MGFkMkhF?=
 =?gb2312?B?bmIvTzZXaWxucFJtOFpJZUNxWEI1ZG54RUVIWlpiOE9DZkNpd3E3a1Y0MkF2?=
 =?gb2312?B?YXNxcUd2bndlOFVmeVV1ZUxCN3BEdEwrS1E4eTA0THFPQ3RmcjJZQ2h0Rzg2?=
 =?gb2312?B?Rllia1YrSDJYKzV3TVdIcDdPd3F1T3ZNNWVWQUk1Q0VpRTh4Q0FBV09WSHUv?=
 =?gb2312?B?TW1WZVU5QVFsREV6ZWExcXErWGF6ZVMvLzE1Y2IrZHpEWE8wWXY0VjZrcTF4?=
 =?gb2312?B?STYvenkvNWNxR1lLRmpnVGcyZnBhT1QxN2J0UzFBbjIxZVUrd3RmTHVOeWxO?=
 =?gb2312?B?NXdjQnBUd05QMTBJcCtuUG9QVE1hclNmem1sbHI4TmNGTXZKbUo2a3UzcHJX?=
 =?gb2312?B?WHRPMjhsZWJvNy9BTmxNZTFTSjlGZDZuMEdnWnU1cVVwTzBFbXpzSlcwYklR?=
 =?gb2312?B?Y0RDM0IzSmlycTdmVkNsb2FRRXFCWWpOd2w3ZEJqbWhqRDJHeDAwY0ZlVXds?=
 =?gb2312?B?Rm8xakxrR1RaeGhtSUtpWVFIMEFWdGUrY3J5ZDVBZFBvOXZLYlAzYkJLaTAx?=
 =?gb2312?B?Z3RvQytkbnVHR1RQREd2NlhsampDRk1rS2ducGsrRGRCMnR3cXFIUHd5Uzd2?=
 =?gb2312?B?WlNDZXhrUmgrK05qM0NMU0ZEZGZ4VCtLaFYwT3lIVCsxSDVkM0dXZm4rTnpH?=
 =?gb2312?B?UUN3eFpVbUhRcU9LakVqdHoxNnIvaFN1SjQ3RnhLZUw0OFZ1UWJYM0d2NHNU?=
 =?gb2312?B?bmFUak5oK2VFOGlteHJXMWhpYldjeWpwYUtrRVNmOWg2UGNtWjEvRUFWblVD?=
 =?gb2312?B?dk9BZHlQRHZSZ2hGSHh6d2M3Wmh5UkREcVdUNHVmeTBvb3I3T25TTmx3ekhZ?=
 =?gb2312?B?REw0STA5WHFSTXVJclBmY2xoRkwxYlV3cU1FUFJQTzZIWThoYWVsN3U2YVYw?=
 =?gb2312?B?cmZId29sSFFBeVMrVUtKVGd5SlJaWkl1Y3ZWRlBZMy85Yks5b0FBRG42N2JG?=
 =?gb2312?B?eUY1REY2cnFnSG1mSGlob1lmRXNxekJzbE9vYkRsUnAwYjFwdUlVSHlwN1lP?=
 =?gb2312?B?N29ERjFlcjBRVnVFNGM1V2lrd0JxdCtreTR6SDdFWnExcW8wYXZFeGNRU0M0?=
 =?gb2312?B?V2VmYkFCSnpzZjJlcUsrclhzaEplYUgxeDhER2RyZTRNTUxzNXdwa0l2Vlo2?=
 =?gb2312?B?UUg5OTNmRURVNFZyTStvRTcvaVc2M0NNVHlkY3huTFBpUC9FMzR1WGl5b0k0?=
 =?gb2312?B?TUgyWDNUOUdnYUxtTVRuTWw1RUdxcjhzcWFCSENVK3piaG94bWM2NGhYTmE4?=
 =?gb2312?B?VVFrUUhSN1VGM0VSNWowTVFMM3RyYi8rV1lFdjZORFp1ZnpNdDJuczFnTzR0?=
 =?gb2312?B?cDN0M2ViRTJWaVFGY2xzOEpmU0FUdnRXNUQvMDZOT3BFSkpXbnVCcW5HTXNt?=
 =?gb2312?B?Y25LSldDQmtWSmxHbE5SWHcyd3FzbmV5WWVxVXhmT3FER3RQdWZjVjlIZXRL?=
 =?gb2312?B?Y290VVNWd1V2MnRzMys2YzZGa1ErYzJYR1RlcUtXRld1V3kxRW1IdHloWDN1?=
 =?gb2312?B?cWl5VlZvSW5OZElkU2ZJbjFRNytpMGM4U2VHcFFJdDBmWUlVMzhpMk9hWVN6?=
 =?gb2312?B?eElQdnFZanlMN01ENFBrd0E0WlczSjJ0M0trTVRub28vaFl1Z280QmpJOXV5?=
 =?gb2312?B?T3ZkS3dVT3BsVzdPbU4vak1aZ1pHL2owcFdyaFRqZTUwMG5SZmNSemgvTU94?=
 =?gb2312?B?SHg4NVRzaVp3SkVNSWxSYzVjbUVKV3dlYm5xakt0K1lHZlR6Nmw3SCtDYnFj?=
 =?gb2312?B?SlRJZUd3M0EzNGxEakVsWnJtZU1SUDg1ZU0ySDZXeExmU2hxNFQvTnBxdGpy?=
 =?gb2312?B?YjdnZU1ZZ3NwcjhjbnEzUVlzSnRORXpKNS9mekRFUE4zUjBOK0xqM2pSN2Y0?=
 =?gb2312?B?WFlNRSs0SGZhMnAzRThMNWFKOUJoV085ZG4yWmU1VEl3S2dEK0NrVmtLMlR0?=
 =?gb2312?Q?vhXaKA5iMJqgn6tTQFwXayZyJ?=
Content-Type: multipart/alternative;
	boundary="_000_OS7PR01MB11602988912E7F400C417E6409BF6AOS7PR01MB11602jp_"
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	YO8tpTHjMp04NUv+qw1W2A4aSab0cWmDVLTsVszRMiKlSI0BorZggyFOkRPvfja3BZ/BZbZSmQ2r5PH0/i3RS38CHiGGEnlbvyCBglEWTbYOkxApHsioyOGWteAnEKgQfNQ6OsFecvGZ4+BzyxG1QYhLOJlYQYRqbSTgbRotfzXKrbdzPuoSlp0I5pDjmkYqVjj+3QzEXqKng9te+o8o0hZ+GTLNqamuUE0z5pFc2QlZegjWUpWhZGLdHhaVVGRCmw5oaV77rK9RP5LG0jNM5uZoYyWQWmrW0pO/sDhffa65/Wdz3+6QGWx20MLFNEhdgYiqoJmBfaP/5Gwvx0/l/I0ZzMrhaoJ6cylSUrrxrxa9QM5qJO+2gVfbzQmCjaB8NxJJ1B2BUPA3vJHv1NgQd5SX2d633z+YTrJN+2I6f+1pHVPiYSKP0IFozkfAGu3xsVTfKkSbZVqVmmroLjifi3R82k/EkQ9fAxFKPE/yKEPMYN9CgsWp3a2uYyrvF27ic4L/kw+HTD3EYcREfww8sGfHCgeC0KmZCS9x3s/FC4WwqBehQ3LAPXjEg28GHygjdI5WZptyNNimDF/RTJoiLof5BA/hAnGrcCkJ2R1wyMCKIri4aUmR9qkkjdCE9mFX
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS7PR01MB11602.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e736e62b-8db3-4e15-c4fe-08de0d1d49ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2025 01:34:17.6666
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zmhQYSnpkCrk9roNZAufa9E5k8MbjxdaTB1HixwYY0APifa2TS5pZevNc+y51HGLysTqY8D6p3u8JM4nnulncg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7703
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 01:34:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224986

--_000_OS7PR01MB11602988912E7F400C417E6409BF6AOS7PR01MB11602jp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkgQWxleA0KDQpJJ20gdHJ5aW5nIHRvIG1ha2UgYSBwdWxsIHJlcXVlc3QgYnV0IEkgZG9uJ3Qg
aGF2ZSBwZXJtaXNzaW9uIHRvIGZvcmsgS2VhLg0KU28gSSBzdWJtaXQgYW4gaXNzdWUgZmlyc3Qu
DQpBZnRlciBJIGhhdmUgdGhlIHBlcm1pc3Npb24sIEkgd2lsbCBtYWtlIGEgcHVsbCByZXF1ZXN0
Lg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCreivP7IyzogQWxleGFuZGVyIEth
bmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+DQq3osvNyrG85DogMjAyNcTqMTDUwjE3yNUg
MDM6MDQNCsrVvP7IyzogTGl1LCBZaWRpbmcvwfUg0tK2oSA8bGl1eWQuZm5zdEBmdWppdHN1LmNv
bT4NCrOty806IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPG9wZW5l
bWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQrW98ziOiBSZTogW09FLWNvcmVd
W1BBVENIXSBrZWE6IGZpeCBpbnN0YWxsYXRpb24gdW1hc2sgdG8gMDAyMiBvZiBtZXNvbi4NCg0K
T24gV2VkLCAxNSBPY3QgMjAyNSBhdCAxMDoxMiwgWWlkaW5nIExpdSAoRnVqaXRzdSkgdmlhDQps
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxsaXV5ZC5mbnN0PWZ1aml0c3UuY29tQGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmc+DQp3cm90ZToNCj4gK1Vwc3RyZWFtLVN0YXR1czogU3VibWl0dGVkIGh0dHBz
Oi8vZ2l0bGFiLmlzYy5vcmcvaXNjLXByb2plY3RzL2tlYS8tL2lzc3Vlcy80MTcxDQoNClNob3Vs
ZCB0aGlzIGJlIHN1Ym1pdHRlZCBkaXJlY3RseSBhcyBhIHB1bGwgcmVxdWVzdD8gSXMgdGhlcmUg
YSByZWFzb24NCndoeSBpdCBpc24ndD8NCg0KQWxleA0K

--_000_OS7PR01MB11602988912E7F400C417E6409BF6AOS7PR01MB11602jp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Hi Alex<br>
<br>
I'm trying to make a pull request but I don't have permission to fork Kea.<=
br>
So I submit an issue first.<br>
After I have the permission, I will make a pull request.</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>=B7=A2=BC=FE=C8=CB:</b> Alexand=
er Kanavin &lt;alex.kanavin@gmail.com&gt;<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> 2025=C4=EA10=D4=C217=C8=D5 03:04<br>
<b>=CA=D5=BC=FE=C8=CB:</b> Liu, Yiding/=C1=F5 =D2=D2=B6=A1 &lt;liuyd.fnst@f=
ujitsu.com&gt;<br>
<b>=B3=AD=CB=CD:</b> openembedded-core@lists.openembedded.org &lt;openembed=
ded-core@lists.openembedded.org&gt;<br>
<b>=D6=F7=CC=E2:</b> Re: [OE-core][PATCH] kea: fix installation umask to 00=
22 of meson.</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Wed, 15 Oct 2025 at 10:12, Yiding Liu (Fujitsu)=
 via<br>
lists.openembedded.org &lt;liuyd.fnst=3Dfujitsu.com@lists.openembedded.org&=
gt;<br>
wrote:<br>
&gt; +Upstream-Status: Submitted <a href=3D"https://gitlab.isc.org/isc-proj=
ects/kea/-/issues/4171">
https://gitlab.isc.org/isc-projects/kea/-/issues/4171</a><br>
<br>
Should this be submitted directly as a pull request? Is there a reason<br>
why it isn't?<br>
<br>
Alex<br>
</div>
</span></font></div>
</body>
</html>

--_000_OS7PR01MB11602988912E7F400C417E6409BF6AOS7PR01MB11602jp_--

