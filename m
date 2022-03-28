Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5472C433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Mar 2022 08:17:31 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.70])
 by mx.groups.io with SMTP id smtpd.web12.8515.1648455448221306340
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 01:17:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=0Q5Q6n7o;
 spf=pass (domain: weidmueller.com, ip: 40.107.8.70,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fGdjbEabL8kXdkYGt29l2LkFV6pAj72feJjKTDz48WyqggwMTtzb3oAb+7aefuob6wlAeE0juEc+DLMsgeHylvRe85HXfGu1f3GaDYRfcfXbxHDk78YNYXnT/almtPfnic5j+mNlRNV9H8Gxw3d7e/nzMX3DfUP+Nz7yd23kDA4wp5VaiB8/6zk1ydIf1WyxwE8RlHzVyuyqKVGfBCABBPjD8uMLYEbH00ISHWxF6O/XRij6z12i8CZJ2VF9pD43FgEzM1DtxAooWhFiMvInfAV48qoTSsapzlDWJ92WEun2kvs56auPPJzmsjzUy7z6bd9LRUwF8x6yA+0npRwU9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GFpapspxcHmSFMKfhV7f00jfYSknQA6/IY+qwEblluM=;
 b=OuWs7drDPfQrRV8H8238Uqy0UVJr9q36xxYdVpBU1eYZn6EwLKZBpPm6k+S2QIAHyiwe43FoRR2ftV3aAeIGnWgAXPAk3RM7isGx/Sx5MG5U7MqrDft7Z6hABfoUG8clpCoVrr5kkmdGVjKJR63HPyzH6wdUDg9UMs87GAZ4KVlPQP08I81Dzsda3sbUeuNXGDf/v3hgXJTHXQvrAytq5rRQ/C9WlMX9PQIQcc4FBQy6IZyo9TJgj55Y1gZafyDJjiEy6pJKnOh7o2LZ+YNmqmAi8E2MqDfSnym7xs7yvfXJ1kxh1kilEwxD8dXV1ZaRdQsw0Wh7nxN+QDICyBp0hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GFpapspxcHmSFMKfhV7f00jfYSknQA6/IY+qwEblluM=;
 b=0Q5Q6n7oZj6RsbRikRK7rssBsSL76uBjwxhEL5r3Wouv4ntzeK+6neuTknrNRIdDysO5Lh+QPAdqsJ6c9RtZ6x/2ckO+hUPBlzhHYCtrwISe3O7Tc/TdeHjyMnmdQkZfkWinOtXGsIKrTVMLPt7NPsauJRo1LxROJcg40/rvFfo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by HE1PR0802MB2347.eurprd08.prod.outlook.com (2603:10a6:3:c8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.19; Mon, 28 Mar
 2022 08:17:23 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::21c3:3ec0:a144:68ba]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::21c3:3ec0:a144:68ba%7]) with mapi id 15.20.5102.022; Mon, 28 Mar 2022
 08:17:22 +0000
Message-ID: <b7b8f6a3-8627-3e05-d689-8d0b485e2ec2@weidmueller.com>
Date: Mon, 28 Mar 2022 10:17:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [OE-core] [PATCH v2] zstd: add zstd-bin package
Content-Language: en-US
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org,
 Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
 Alexander Kanavin <alex.kanavin@gmail.com>
References: <20220325122950.1148-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <Yj4RXR9b4ufCt+t4@piout.net>
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: <Yj4RXR9b4ufCt+t4@piout.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0295.eurprd06.prod.outlook.com
 (2603:10a6:20b:45a::12) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca109733-e014-4a13-f738-08da109362a3
X-MS-TrafficTypeDiagnostic: HE1PR0802MB2347:EE_
X-Microsoft-Antispam-PRVS: 
	<HE1PR0802MB2347074C817372267FF5FC39D71D9@HE1PR0802MB2347.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eh8s1aNAPHGcV9YjWVCYXnonL0d8MvwjPVJK95UG8uSTSf+HSKZvsVj70pBoG4ctGmmCTPGOfB6LxKqOTog8hdB24k+T+34ryul+ifySEAzVxweqPeCh/FaZVZkwUqOxOlgVT+XLVmpwajUEkHtTF2+QgKFTqfnhN16tTSe9IeqSE6aI0Uo6ZD1hEnLcsypuBuwUvW4L8UBmyEx062c73fqV/23C/IwOKRginHZ5DxHN2dsRcDnLVBfpLJVed+3OGGQXlJrZDrLH7c8gyYf3+jwRZoGbkcQ9QAkqPkLrwws63FtONP4MxaJ5lhKVfCDdSbIdWHobf4u5/eSLgH7vDE9tCq2vTLu1YssuaMYF4U/v7OH/+5lfE50RKsD7a412umv3ahhNzhKUpPDW5dZfHGBiDi9SD7lvDPokxzDRItktLwYx4UQgWa6hfcZXemekIEE1VSX/JtTV2O86Qe0cGM45QSidW6QZxYdGwfNF/b9yavW8iQL2uE+Pbw+jsPil0Mlb8PSpAu2AuPiisToOss/NcdXJ9zdydR5Dy3TIgkHowtpw6Rm66nSwaxUdosK4LVxlSiZqMrnMWzycIdhuFtfIekQWhPfQuRG+BPpVp5gj4WAmdusfzqSn+gY1sBxwRIoyzqzTXdVqg4i6wuFUyak8KWBR7Dj9AFOrKKdglKxJZGc9wrD61PTt/X4C0TEuuaDGgJv50Y+JVgWsROd96rcv4OVtd2r1ViSXam1mCuLNYE7p5OKidKMnb06kruSZIyachXzIl+E95vVpms3YMEwexgTPdnONqYH357R8Np/T+hQrxEdMoWgVU7QDmSOxXYZt7Rz0gWZQoWrmCPiyrw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(31696002)(508600001)(54906003)(6486002)(4744005)(31686004)(6506007)(2906002)(6916009)(5660300002)(66946007)(86362001)(966005)(4326008)(36756003)(6512007)(26005)(186003)(8676002)(66476007)(8936002)(66556008)(2616005)(38350700002)(316002)(52116002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UVpkaEdENlg1K3dmcXRONUxBaGJLN0lrU3lxMS9rU2JDaXBKYmhTdWhnSE9z?=
 =?utf-8?B?NUhDbzNMQjRaM29WQmgzWkFxeTdETnJaamwwaDhjdWdQMC80N1k2cEIrZFV2?=
 =?utf-8?B?cm4vWHJkNjc0djZORTJnRUM5QWk2OEFRWURybDhVN2RwTk0vc2R2dDA1VGFk?=
 =?utf-8?B?SU54NURFaVpjUkJZM3F6akdUcUtWdWdnaURPWjI5RnBDWjMwYVNkb0tKYXM1?=
 =?utf-8?B?aXRGcDAxSUtDZXJoTGcwTk1sdnREcmxFQzVtRVllekwvQWtabE9yRmcwbzZm?=
 =?utf-8?B?ajFYRUxZMndXNndvb0dBMnZFQmI1THd3cHB1SEk2UmJ1d1dFL3I3NGdFSDVX?=
 =?utf-8?B?aGoyRmVCVXJqaEU1YkZzT3N2NFNxSDlsaXRDUnlXelJvQUZqUEdaT1FzOEJF?=
 =?utf-8?B?M1A1eW9rZDJlMXFFYXVJVXptUjJIYUdTQnhaMXZ3dzhNT29Rdm1BMUtodDZR?=
 =?utf-8?B?Zml5SU5xZW1heWlmdGQ5MlhIdWc5bDdSN2o1anRJcEIwQTRuSUI3YXc0S0dr?=
 =?utf-8?B?UWF6anJkTVRmWGJtN2ZFUnNiTEJqY25QVVc3dVFGWU1XSnQrelk3MjA3VXJN?=
 =?utf-8?B?aGRXTEVyYkpFVE54N0NYeHJEdFhPY2NwK1l2bXM1WHRRb0lKRUR3ZHpBN28w?=
 =?utf-8?B?U1Vya3poYkhkWjF0aGM2Z0V5K251SFZ5c2gzVHpQd0FpZmRZMHk5QWRNVFRZ?=
 =?utf-8?B?eUNHNnlQWktTQ05QL0hwL0pXQ0RWaVBCOFlRU3JUNHI4M0pPUG9OSVBSUFo4?=
 =?utf-8?B?Zlk3ZDAwN3FNOEQySkliRlpUTW5qclVUSUppT0dMWTk3TVNMVGwrUEtqMDF3?=
 =?utf-8?B?a1BoNDlJOWEyL1NsZ21jYitTL0JqcHpzNXZ4SC9QMEpxaDc2T3ZuY1F2OWZ3?=
 =?utf-8?B?TDd0U09pMnhzQ0Y4Sy95Zk5hVzJaZzlBRjRIc3IrMlEvTE4xaFc2K3dzbHB2?=
 =?utf-8?B?QWNoZVBWTHFqK3kwZGROcDVnNlpkejAwYzhheXg0dFpJaGEvWVAwWThHeVJU?=
 =?utf-8?B?NFhyRUtwL3M3WThLMTJsVkMwQ015dk0ybm5CNkREOGsvOEhiczRXb0JMNnA0?=
 =?utf-8?B?OHFRVldlRXZaSTYzT3hlUSs0ZHlET2tPRFFSa2RCcmtnSkszOVdmSllySVIv?=
 =?utf-8?B?enExVmlIT28wSTVXL0tQQkRLTThsWDZnTS9reGhMVVNLdVgvWVkxWHRUZDY4?=
 =?utf-8?B?aFJ0YUhyaUpzMG4yMmF2d2lFbFIwMjdtSytXRndZd3lMOTFFWjFDeVFMTFRL?=
 =?utf-8?B?WDlaV0tNRjcvNTN6WlJqRlJZUDhpVUZLU1lhWmtRdm5HMWltS2svVHdvbFM0?=
 =?utf-8?B?R25rRHZkcWRiYm9iVEgxdkQzeWpXNTd1NnN6L1B2UmZQVmx1NG9MRGlTeTEz?=
 =?utf-8?B?M2FEdzh4dmpqd1JpUGJHQ2RFakdRZDd1WXBXRDUzSEduNTAvM3FLeGJ1MnZJ?=
 =?utf-8?B?VmRoZjhGR3ZoU2RaejdoaC9GZFZmRDB0U3VFbEc5VXBYSDlBYmlzekRCdE4v?=
 =?utf-8?B?VndwVTY3UGkzYkNQRTk2ODJnNG9iRnM3NUdXNzJxWVMyWEZDVnNTdXIxYUlO?=
 =?utf-8?B?RGt1YjhsK0JsWVM0a2ttK3ZwTC9SU2wzZXpIZUVmN0tqRjJIRG83SnZ5Mm4w?=
 =?utf-8?B?V040VHF2VGhRZkdqTUhWYnEzUzJReW5TQ0RzMlF3SDdvVUtKNGtLM1N0U2RG?=
 =?utf-8?B?VURQRGRqUmkrOTUzUU1ra0Z4Y1JjQktQM3RuaEtSdDlydjdsRjBmOFhIdTBU?=
 =?utf-8?B?cVdkbEFuajFvZkhxellYQjA3UFlHZUxqQ2h0MitrLzNmZ1hDdnRJSVFLTWp1?=
 =?utf-8?B?b0NMaFVKdzkwZkpFS3A3Y05zQktvZUZVcmJtY21ScGxodndoMU9PQXYrQk1v?=
 =?utf-8?B?RGlJSmpPSkFGU05UeDBZdmN0aUxxTDludXpkNm5DNERhZ2M4K3l2cG5zNUFP?=
 =?utf-8?B?MlF2Q1RSNEU0NHEzdHBWUXJ6VWJqWm1YbmZvWi9uTFNtdThYUmM5Y1VsV0lq?=
 =?utf-8?B?NUFoSDV5a0Fld2tQWEQ5a3ZYWTBtTWR1SHcxOHdDWTZuZ3RYaS9KTE8yRlV4?=
 =?utf-8?B?ZGI2NnBRa0MwQlRYWmtkV3JuUDhQa1VRUFBDZDZ2dXoxOEQzbjM0RzlaQUdn?=
 =?utf-8?B?UU9QeWg3NDhoNEJraXlKamRURGJaZVVyL2pGY1hhRHJBT3kzVU1rbjhUS0lo?=
 =?utf-8?B?eHVSdXhtbWxrcHliZHFsZjc1WUx0VmtZNFRlTmQ3TytXM3k4TnU4aUU3dEJH?=
 =?utf-8?B?Q0dCdEI2eTFDd0h0WVdQUXZwRGpuN1RjNXVpQzRlWGFWWkl6a2hzalFOTmxL?=
 =?utf-8?B?eGhsNUxjRFpMTTU5b01nek84OUZkY2I0R0lQc2Y3OVc2Tzg0RWkvSlRid3pD?=
 =?utf-8?Q?YUEULJ2/A7LUDNug=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ca109733-e014-4a13-f738-08da109362a3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2022 08:17:22.8746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 FuAUoowTSSZD9H+9GmUbuTCZ+ikVbGpDt53ae6NZUvpAkUsqa4rFjcEIa33ErjGVswkT0jWIveevkS824gkRRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2347
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Mar 2022 08:17:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163685

Hi,

Am 25.03.2022 um 20:00 schrieb Alexandre Belloni:
> On 25/03/2022 13:29:50+0100, Stefan Herbrechtsmeier wrote:
>> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>>
>> Add a zstd-bin package to remove libstdc++ runtime dependency from
>> library users and reduce the dependencies and size of the library
>> package.
>>
>> Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>>
> 
> I believe this is the cause of:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/50/builds/4954/steps/11/logs/stdio
> 
> Can you check?

The debian.bbclass renames the packages to libzstd-*. What is the 
correct way to handle this?

Should I rename nativesdk-zstd to nativesdk-libzstd-bin in 
buildtools-tarball.bb or should we take the first patch version which 
add a libzstd package only.

Regards
   Stefan

