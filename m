Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30949E77188
	for <webhook@archiver.kernel.org>; Sun, 22 Dec 2024 20:28:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.1452.1734899298283457972
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Dec 2024 12:28:18 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2086a60a45=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BMKSIt9007146;
	Sun, 22 Dec 2024 12:28:18 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43nx2p8vf5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 22 Dec 2024 12:28:17 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BMKSGoQ007140;
	Sun, 22 Dec 2024 12:28:16 -0800
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43nx2p8vf4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 22 Dec 2024 12:28:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SiBu7QPF4cHajf9gCvZdBsFz5fAKPfA9m7qbHVov1Zk3m6slH6VnJT64EiKWrkMtZQhn3C4EjDsT763rO6+1D1QMPQSo7mraTFFNkVO/lfgNjbG1zMbVGnpZrQTkbnVuOoErr12c/+TmAZ6W4iaXZPlxRuuR3QT6hWIfioZ/xxS4UhpvDjIKhv43AfjwSfXUdaK/TaYsNbkATZbGvrC9EFL8zEdu9ibepABnTyuVyYhbl1yvDE2KGWwRvwKHUMw1XMwxpfzXGyF380mQEp8Ebo3EOC4ljebHdf5R7ssgR72hCk3Fp+pQ0XZjaZe1xURNTLuX4MuMXPDKJz0f7njHiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xJYDzolj3J0j76k67CUKIxGXgLH5JqyqRvouaj44drM=;
 b=yA7Da2PkufZqoA1KjdSw/S81yY23AZZlyFyqk7eFsRXIRMijxPBs67eVK8ovhgQKNt7GYNSw7HC1F+YEW5zMbZiqy1g+D75tGCBLu9RVg8YUJpkD/iImdvU7upmRZXeUkODFUZyosaWuxHHFVyy9j3TKFjuYjARt7ojNuGqxWbOGfzrLVyTe631OIRcdolUUyWlt/ypnWODK1uCRK+8YZReGY+cx1AamWDNNHLobdCpzoW+0IQp6thBDqUppF8GP4iLBqqZeCI0Zc4xq+1ZevpxI20aXwumQOdLnA2xGgBlI8y7K7su39Y1SPrH3H+KFXPBjqFIDobIoLIIc7ProFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8505.namprd11.prod.outlook.com (2603:10b6:408:1b7::21)
 by SJ0PR11MB6816.namprd11.prod.outlook.com (2603:10b6:a03:485::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.19; Sun, 22 Dec
 2024 20:28:10 +0000
Received: from LV3PR11MB8505.namprd11.prod.outlook.com
 ([fe80::e59d:2e70:4371:48cf]) by LV3PR11MB8505.namprd11.prod.outlook.com
 ([fe80::e59d:2e70:4371:48cf%4]) with mapi id 15.20.8272.013; Sun, 22 Dec 2024
 20:28:09 +0000
Content-Type: multipart/alternative;
 boundary="------------gvT0AgDfJds3rKxhRzGE4mwy"
Message-ID: <b459926f-9486-4c05-adeb-a4e0ca74a569@windriver.com>
Date: Sun, 22 Dec 2024 15:28:06 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 4/4] weston: Add xcb-util-cursor dependency
To: tom.hochstein@oss.nxp.com, openembedded-core@lists.openembedded.org
References: <20241219222120.1188742-1-tom.hochstein@oss.nxp.com>
 <20241219222120.1188742-4-tom.hochstein@oss.nxp.com>
 <CANNYZj-9Jdf6eeW=SdVPnSd8vVq3m+bhO=m9SZF5KKggcfKGvA@mail.gmail.com>
 <f1df3290-445e-4525-a3e5-7d156c5a45a5@oss.nxp.com>
 <CANNYZj_V5sxoaN=FpvpaFxfKSRNrrarR1Mcv9nuxKAADtbYXGQ@mail.gmail.com>
 <28220675-1c81-4e19-a935-0b001150ab9a@oss.nxp.com>
 <CAMKF1soxnjO=PaP92265dSfX7G9zjoeRu2hfrHV0c_8Mg19cfQ@mail.gmail.com>
 <5cd9d111-17f4-4e12-9c3c-91cfbd1454cc@oss.nxp.com>
 <CAMKF1sos+HS7jikyMUGwMGoXXyft71dZWTgB0pZma22jOStdPA@mail.gmail.com>
 <35266fcb-3a20-40b1-8004-433e8489477b@oss.nxp.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <35266fcb-3a20-40b1-8004-433e8489477b@oss.nxp.com>
X-ClientProxiedBy: SJ0PR03CA0121.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::6) To LV3PR11MB8505.namprd11.prod.outlook.com
 (2603:10b6:408:1b7::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8505:EE_|SJ0PR11MB6816:EE_
X-MS-Office365-Filtering-Correlation-Id: a9a2720b-8d98-40b3-7354-08dd22c7264b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|1800799024|376014|366016|8096899003|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eks4cEVuOStFWnoySFVJKzlRRlV3KzlHYXJOOGFGUUNtTzBlVE5SdzRzNnBZ?=
 =?utf-8?B?blFuY245RTBGM2pxMWREMnZZV2F1bm95RWQzSTJwVmpxdUYrbGpoM0I2RDNq?=
 =?utf-8?B?MSswaWxWRitxV3loNk0zT3crcTlpMHhRaFNWN3h3eURpVmRHdEdGekltR2J3?=
 =?utf-8?B?bVlqRVB3ZkJqVjN0b2cyR0ZIcHl0THRocGlqcUpKTlFLcC9LMXN5SUlIc0kr?=
 =?utf-8?B?M3J5a29lRkJVYkVUdlNiREg0bzQ3VjZuUUVXSGNkc2h1Ukl5VGRlcDcybUk0?=
 =?utf-8?B?bFBmUWpxdHd2MVdQK1V1UU5qVTlONG04ZlFzWWFEb1JKck9hM1IrbHlZMHlK?=
 =?utf-8?B?OCtrU1JpRVhWdWhjVGRjSnZFY1l5NG9JZnhuRjRQa0hiWkZvZzQxQ0IzWEFG?=
 =?utf-8?B?TFRnMFJ0Vzc1cENDVXduSzB4cG0xVmExWEVsZC9CSUtLb2hOR2tLOU5ETjFs?=
 =?utf-8?B?NzFSQXYzUnhyL1NvOWpjV1BGNUFESkYrTi9GaXdQMWJiMlg1TUZrUHlrMi8z?=
 =?utf-8?B?MHkreUFpbTlXL1pqTmlob2IwVWZNNnpsVW9YSUZCUHlXeHp0akpXTnByNW1G?=
 =?utf-8?B?M2ZjTFJhcnFsZWZSdFpMOGtweEQ1MmRuNDV2S2VqVTVIT2xFOHhjNFRIS1hR?=
 =?utf-8?B?VHBTTUJNWms4ckVzL2xwS3JJb2J5MlpWRmRuNnlwWGhiVzYzQyswSitFNHZB?=
 =?utf-8?B?SytOeWpvVmkzQ1lkMlRDZGVlS1VNNmJQM0hBdXBpcHJEbEVXdHg5TWVZUDRx?=
 =?utf-8?B?UGNYNlVjazNibE5pcU4xb3UxTVZhaEM2VVNJNVB3bU5YWnY4cXVhZkhUbWJM?=
 =?utf-8?B?SVJ6TE02NHdoMU9rUXB5SHE5Q0wvRzYyUkRvOGhLYmxBOU9jaDhSZGcyOUFB?=
 =?utf-8?B?Qm83OXFpL1V4RzBOVm5VaW9XR21vdWRjM2tpTXRNQW9WR1lFeC9QZXNZRGpv?=
 =?utf-8?B?MDZLanBNSlpaVlJPTklBblF6Z2wwNVhCenBXUEJXTUdMMWl2SXdROXR2cHpH?=
 =?utf-8?B?RlMxS0c2R3EycFdaZ2VUTkpNNE50YkdLQkhMVkZ5dzRRQWZNaGcyN0JBVmlG?=
 =?utf-8?B?VEJSU3VMeXVmR3ExREJPNE4yak5CMlNldlRwT0RkUjNwNENIODYybzYxQ2V5?=
 =?utf-8?B?d25IREtEelNNNURHS2hTUnZHbmorVm5uRy92Z083WFozSDh6ZzZIVEg0MFZ6?=
 =?utf-8?B?QXQ1ZFdENFdYajFkSk5qNmhCb21Vc2RGblZ1VGlNZFczRWZOTTl3OFI3TnNN?=
 =?utf-8?B?NVpVVmFwV1RmMTNoejlwaUs5Uit5VVU3TXhpYXg5UGJFYkdjR0x3NkkvT1N0?=
 =?utf-8?B?cldBMnVBWWFUdkdKZ0NGTWczOUh6UE9tejdRWDhyMU9PYVloayt3SmpsVGVu?=
 =?utf-8?B?ZUNMOFVhMWtnZFVmTG1XaHNGWTE0OG5YdkcrYklVK092dkJweXVoM3RSMUZi?=
 =?utf-8?B?eW1waUxPMUpvYmVPS3BsUmtlUXFCV1U0dzhQZnpwVE04azNBOGtUanZqbG5M?=
 =?utf-8?B?blBWWnMvbjNCUlVsS1hCN3Q3S2w3bisvTnl0dHdXaGk0VGM2Qk9iU21WVU80?=
 =?utf-8?B?b2hla1BjQk5OVWl2OGJaeStyc1JXd3RSRHlvdGlMczZ3OXl6L1RGNVhCZVBp?=
 =?utf-8?B?ZEV2eHQrRWNyV2p0RlJjZlN0UzRIbkNVVG5nb2ZFek9VVm5xVm5RdERVV1hZ?=
 =?utf-8?B?bW4xcWV0R1IzOGlqK0h0OWVNTjg1K3YrL2ljK1J1VUQwdDhIRDhNY3NvVnZS?=
 =?utf-8?B?VTZiMWRLbTlWcHdpeXFPQTljSDZQcVljc2U2RFlwRlM4RXAzY0xVdElFQkRw?=
 =?utf-8?B?TlJIT2luME9KQU1OZUJBV0x5WFFLOUJWK3VQM1ArRHBudk5oajBtTVRsZlBT?=
 =?utf-8?Q?DkpM2I5+eciHk?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8505.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(376014)(366016)(8096899003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aGtWVlpBQkhOZFVmaFhIeWdTa3RWZVdQeWhFcWdUNDVVYmNYZ1BNMkN3am9T?=
 =?utf-8?B?aUtoV3J4Rm9pQ0F4V2RZelU2RXBmRXFCclhNQWlCZzhhQ3hoNU44ZXk3SlM3?=
 =?utf-8?B?Sit1S2RhTHZES0wyUGpNamY3ZCtvVGJGYXFtZzlIb2hMZVBJOUJwNlMwdVNv?=
 =?utf-8?B?U0hRTkMySE9BS0N0emZ6VnJjcHNFam5tbkg2VnptcHh4MFpLSTFTWWRuUUJJ?=
 =?utf-8?B?ZlpVUTM0ZmF4dmEwVzNxRHA5M1l0YStEVTVBeWpHSVNnUU40MG4yaFRqWGNv?=
 =?utf-8?B?ckFKU0k2VW1KazVKL21NRXBjYlUrdlZlRTNiUnMrNVJVUGppWU9SV3lHaVo1?=
 =?utf-8?B?Um5tcnE3M2JFMlo3RnVuZnN3QllNaUNnWnJaQ2E1K28ybmt3YzE3eGNTSkRm?=
 =?utf-8?B?YnVOd1hrRlNhOThLMVNFemV1M2wzUGs3cy80WnRNcFUyQnYvbUViN2dJZ0Ux?=
 =?utf-8?B?aDAwUGlxS3U2VXZsTTREdmZ2b1g0SlRReE1RazIvZ2N3WEc3dkMvdFU0dXpt?=
 =?utf-8?B?ajE0SzRmR2s3Q3g3V0JtM2sxZFVBcTlRNEUrWDUvMTZpZFhiMzhjSzZ6cWRa?=
 =?utf-8?B?RmZzaGdnckw2bHAyOXRmSG9jYXZQM3pxUlNnUFc4bm91YVdYN2xrcEg0c0dK?=
 =?utf-8?B?N0NhdzlGVGRWeTJraHhhR1dvL1ZQSlFZeUpjcTNacjlXZ3lLejRraDdEOXJC?=
 =?utf-8?B?NmRjM28xNVE2YkFBYW9KcERvOVBQRDhrRzVKZXlUK0ZpbGdKR2xiWE80cTIr?=
 =?utf-8?B?cVlWZUR3bWt2ZFRzKzFBc3pISy9LSlhYYmt1K1gzWW00Zm9WMWNtM2ZkZGJM?=
 =?utf-8?B?N0w2TFYzejlNdGx6UldUc1dObHBXd0ViTzVLVU9NNXViOVZnMmx6YXZRdUdw?=
 =?utf-8?B?cktUclRpOGNTVlp5TVdBRmY2ci9BOVIvOUhqYjdUQ2RSTUhHTmx2bFRIcVZG?=
 =?utf-8?B?eitjQjRRek1hSDJMRHVBcXYwY3ROc2ZUWVNZVVJ1ZTRZb0lsV01ac0VxZW5z?=
 =?utf-8?B?d1crVkJOU2ZVR2NqQU9VODJsUHVRSG92Vys3UEtUbzd0UnZiRzBZNU5ld2R6?=
 =?utf-8?B?TDg2aWRpWXpBSytQRDRmdk9BMGhWQ1pHZ1BJNW1JeC9YeWE3VTBWUHBFVlZu?=
 =?utf-8?B?VlRndEY1emNxR2JOQlhncDZScGN6OW1ERjYzenFJTWRLVUtRdFl0ZkxYdEdU?=
 =?utf-8?B?c3NmZ3JDVkRXZmdobmc3b2t3Rm5tamt1OEV1MmY4UmZhWHMyWWppcXBLU3ZG?=
 =?utf-8?B?Mmw4dXN5Q3ZXMEpOUk82NUh2dlBPc20yZERUUHZSSFVFdmpLWWtaOVJYai9v?=
 =?utf-8?B?QWU5dTk2V1dLeURnWGxWaSs3WUs2RjE3TENQOHFWQ3NsR0tGeVM4VHFXZ2Fo?=
 =?utf-8?B?SHoyakJDNVlEcDdDQ0FoUVArZjZpS2gvb1l3dU5oV3FKZEhCU1RKbXNjMktG?=
 =?utf-8?B?a0VTNXRPMndmV3Qwc1NsL051TWk0UmZIakRGSy9HdmphREpIVEVrZ0M1a3A0?=
 =?utf-8?B?cjArKzRRMEJYVy9oM1VkalRGVWlvaXlwdGJLVkJEazVQWks0NlcwaVBxRWpi?=
 =?utf-8?B?Z3BZaTVlMFZWUUJYaVN4UXVwQms4QnMwaUJGYy9Ia2FueDRzUnFnR0U4S0I0?=
 =?utf-8?B?NWd4NGxBSlY4dkhMRmF6MG5KK1pZbVFic2hiNTJIaGdQT3JnVU9IZlBlTmJ5?=
 =?utf-8?B?bEgzMHZ5SnkyaTExTVhyczJqMUNNT0ZNSjdRSVZyQ0lMK0dPRzVUR1F3SXJD?=
 =?utf-8?B?SDlMYjdVYTJqb1IwdGFmZjhldXZoNVVsVXc5ZURZUHlEb0VlYUNRMnUwcDk3?=
 =?utf-8?B?L1EzMTF5Q1I2TlJ3aVQrNnpveGs1V09acVAvenFQWnVYaFZwWTM2SlZoUksz?=
 =?utf-8?B?T1BibGZOQVA3ZkpBTUpCelhCZDYrdThDYUxIOWxkWGNUdU0rOVN5M3pDNzht?=
 =?utf-8?B?bHg1U0tPOU1xa0k1NDF0MTNsQkZ2OHBScjBLWkVJYjc3ZFN0YXBINDFTNDdU?=
 =?utf-8?B?Yk9lVEYwSjFSSlhRZGNYUFBvY3gyRnhqdy9mVHFhMW1wa29KTFllOWM5aVlh?=
 =?utf-8?B?Nm94UGROUTdFKzJWS1BndmJsQnY3cUxuSUF4S0ZGOC9zcUwrQ2VvSlJFVmV0?=
 =?utf-8?B?bkk2MHltWnc4TGk3L1VTM2NGaFNJVnZHc3pUZ3l2MDYyd1BzaitBbWV0SVFD?=
 =?utf-8?B?M0E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9a2720b-8d98-40b3-7354-08dd22c7264b
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8505.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2024 20:28:09.9343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nfuD+ByK226Lj1uWuq4vRP5Gqiitrh7wcMGFDJlLCQjyCMAFiXFT4PoaDAxQcAC/zzgVoEB9/d42InS0pJouKJOeTiuedbYEiH2jdAlpoyM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6816
X-Proofpoint-ORIG-GUID: MTb909Q7bUlatiqNZmgQbBPaWuaPQdZo
X-Authority-Analysis: v=2.4 cv=LtNoymdc c=1 sm=1 tr=0 ts=67687661 cx=c_pps a=1OKfMEbEQU8cdntNuaz5dg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8
 a=8AirrxEcAAAA:8 a=t7CeM3EgAAAA:8 a=DXhV4K-V6YGC1aoetyAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=SMILBeIW3eWr3F3-cLYA:9 a=hlmlpENk1yWFtH9t:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=ST-jHhOKWsTCqRlWije3:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: BtIZGeQmthCpMo2KKI5c5wvh_IQN-mo-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-22_09,2024-12-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412220189
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Dec 2024 20:28:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209013

--------------gvT0AgDfJds3rKxhRzGE4mwy
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4BMKSIt9007146

On 2024-12-21 7:13 p.m., Tom Hochstein via lists.openembedded.org wrote:
> On 12/21/2024 4:33 PM, Khem Raj via lists.openembedded.org wrote:
>>
>>
>> On Sat, Dec 21, 2024 at 1:45=E2=80=AFPM Tom Hochstein=20
>> <tom.hochstein@oss.nxp.com <mailto:tom.hochstein@oss.nxp.com>> wrote:
>>
>> =C2=A0=C2=A0=C2=A0 On 12/21/2024 2:10 PM, Khem Raj wrote:
>> =C2=A0=C2=A0=C2=A0=C2=A0 >
>> =C2=A0=C2=A0=C2=A0=C2=A0 > Tests sometimes do require additional packa=
ges and at times
>> =C2=A0=C2=A0=C2=A0=C2=A0 > development headers and libs
>> =C2=A0=C2=A0=C2=A0=C2=A0 > on target for different reasons and these d=
ependencies may not be
>> =C2=A0=C2=A0=C2=A0=C2=A0 > needed for normal
>> =C2=A0=C2=A0=C2=A0=C2=A0 > functioning of the package. I would suggest=
 to add them into=20
>> image as
>> =C2=A0=C2=A0=C2=A0=C2=A0 > rdeps (if they are needed)
>> =C2=A0=C2=A0=C2=A0=C2=A0 > conditional upon ptests being enabled.
>> =C2=A0=C2=A0=C2=A0=C2=A0 >
>>
>> =C2=A0=C2=A0=C2=A0 I don't see that weston references ptests. Is your =
comment a=20
>> mistake,
>> =C2=A0=C2=A0=C2=A0 or do I misunderstand?
>>
>>
>> No you did not misunderstand. I am trying to help you
>>
>>
>> Hmm. Is there is meson option to disable/enable tests in Weston ? If=20
>> so then you can disable the tests by default. Since the error seems=20
>> to be showing a test configuration failure
>>
>
> Aha, we've gotten to the root now. We're building the tests folder but
> not installing it. Will send a v2 that disables the unused tests build.


Better still is to install the tests along with dependencies only for=20
the ptests as is done in many recipes,
for example wayland:

 =C2=A0 install:
https://git.openembedded.org/openembedded-core/tree/meta/recipes-graphics=
/wayland/wayland_1.23.1.bb?h=3Dmaster#n40

 =C2=A0 ptest dependencies:
https://git.openembedded.org/openembedded-core/tree/meta/recipes-graphics=
/wayland/wayland_1.23.1.bb?h=3Dmaster#n61

I don't know anything about the weston tests but hopefully it's not too=20
complicated.

Ah, I see you've already sent a v3...

Would you have time to add ptest support as a follow-up commit?


../Randy


>
> Tom
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#208994):https://lists.openembedded.org/g/openembedd=
ed-core/message/208994
> Mute This Topic:https://lists.openembedded.org/mt/110206258/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [r=
andy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------gvT0AgDfJds3rKxhRzGE4mwy
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4BMKSIt9007146

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2024-12-21 7:13 p.m., Tom Hochstein
      via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:35266fcb-3a20-40b1-8004-433e848=
9477b@oss.nxp.com">On
      12/21/2024 4:33 PM, Khem Raj via lists.openembedded.org wrote:
      <br>
      <blockquote type=3D"cite">
        <br>
        <br>
        On Sat, Dec 21, 2024 at 1:45=E2=80=AFPM Tom Hochstein
        &lt;<a class=3D"moz-txt-link-abbreviated" href=3D"mailto:tom.hoch=
stein@oss.nxp.com">tom.hochstein@oss.nxp.com</a>
        <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:tom.hochstein@o=
ss.nxp.com">&lt;mailto:tom.hochstein@oss.nxp.com&gt;</a>&gt; wrote:
        <br>
        <br>
        &nbsp;&nbsp;&nbsp; On 12/21/2024 2:10 PM, Khem Raj wrote:
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; &gt;
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; &gt; Tests sometimes do require addition=
al packages and at
        times
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; &gt; development headers and libs
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; &gt; on target for different reasons and=
 these dependencies
        may not be
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; &gt; needed for normal
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; &gt; functioning of the package. I would=
 suggest to add
        them into image as
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; &gt; rdeps (if they are needed)
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; &gt; conditional upon ptests being enabl=
ed.
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; &gt;
        <br>
        <br>
        &nbsp;&nbsp;&nbsp; I don't see that weston references ptests. Is =
your comment a
        mistake,
        <br>
        &nbsp;&nbsp;&nbsp; or do I misunderstand?
        <br>
        <br>
        <br>
        No you did not misunderstand. I am trying to help you
        <br>
        <br>
        <br>
        Hmm. Is there is meson option to disable/enable tests in Weston
        ? If so then you can disable the tests by default. Since the
        error seems to be showing a test configuration failure
        <br>
        <br>
      </blockquote>
      <br>
      Aha, we've gotten to the root now. We're building the tests folder
      but
      <br>
      not installing it. Will send a v2 that disables the unused tests
      build.
      <br>
    </blockquote>
    <p><br>
    </p>
    <p>Better still is to install the tests along with dependencies only
      for the ptests as is done in many recipes, <br>
      for example wayland:<br>
      <br>
      &nbsp; install:<br>
      &nbsp;&nbsp;
<a class=3D"moz-txt-link-freetext" href=3D"https://git.openembedded.org/o=
penembedded-core/tree/meta/recipes-graphics/wayland/wayland_1.23.1.bb?h=3D=
master#n40">https://git.openembedded.org/openembedded-core/tree/meta/reci=
pes-graphics/wayland/wayland_1.23.1.bb?h=3Dmaster#n40</a></p>
    <p>&nbsp; ptest dependencies:<br>
      &nbsp;&nbsp;
<a class=3D"moz-txt-link-freetext" href=3D"https://git.openembedded.org/o=
penembedded-core/tree/meta/recipes-graphics/wayland/wayland_1.23.1.bb?h=3D=
master#n61">https://git.openembedded.org/openembedded-core/tree/meta/reci=
pes-graphics/wayland/wayland_1.23.1.bb?h=3Dmaster#n61</a><br>
    </p>
    <p>I don't know anything about the weston tests but hopefully it's
      not too complicated. <br>
      <br>
      Ah, I see you've already sent a v3...&nbsp; <br>
    </p>
    <p>Would you have time to add ptest support as a follow-up commit?</p=
>
    <p><br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:35266fcb-3a20-40b1-8004-433e848=
9477b@oss.nxp.com">
      <br>
      Tom
      <br>
      <br>
      <br>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre wrap=3D"" class=3D"moz-quote-pre">-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#208994): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/208994">https:/=
/lists.openembedded.org/g/openembedded-core/message/208994</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/110206258/3616765">https://lists.openembedded.org/mt=
/110206258/3616765</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------gvT0AgDfJds3rKxhRzGE4mwy--

