Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42C12D35669
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 02:47:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4836.1769568443093603215
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jan 2026 18:47:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=WHuuYwXm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=54885fa4cd=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RBpuvH880612
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jan 2026 18:47:22 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=vmsvat746uVW7mCTKHFiSwsEAy3Vvp1K44QGF1BgiOo=; b=WHuuYwXmtyMI
	9aKxj1+mPddlnVuGGLZOHYs/EYId/nkTmFO45GIBwHzB+K36jmXAMgUfDtN4J8Q3
	sJo4WnjpwSeQr8SdOzQ3BTHv6kbF/a1mxIsHV4fx72pPE5B6RpHIf7WtBIoaFaF/
	iIXrKWJdMOTjpjRQhUNaBj8h3eRwRE/T48LHJfSYFqthsZIzRn9W4Si/9mPvCSXm
	QSKmOXmSL3XZx5FW2VRZW2SvepqGeXJ6zatscH455J2GLAbs6tRTYdvhL3VJdBDn
	vtOCor7aBEyPYhO4geOyWXDlp0Zp6OA/tgGU68vbreDYFGz4WwpRMiBxiugfpSsj
	8orBqGfDtA==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012028.outbound.protection.outlook.com [52.101.53.28])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bvxfm42ys-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 27 Jan 2026 18:47:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ow+JpcoxUHLaPcUPmePBIgwkC1mBOg6YiPWx248MmD2LJ7sbpLdDdnK/xvv0S19bA1/+NaQVxxvMOeIwfonCpyn8EvE9tjdSiskcOcBdSWLsqMyEaLCAHP76k2yjiRoseuGqqOKZyAC1Y7/7GNhk/zblWaGAAfznyfu0/O2osXmRheKIj/en9vFetwF1f9spbUsmjOXmXXK4dirvxapUqfjDr5QoqJ3t2PLAgdLcA2AqzDwyP++jWmyJtYmI8325CGh//GFaDPtlUG6D4ToNtUBLdTNZTHsG7+SqQCou5KIICXP+ODciQnTVgI9bj7IKXB2GPiTytlLtxML+kNipTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vmsvat746uVW7mCTKHFiSwsEAy3Vvp1K44QGF1BgiOo=;
 b=mANnrC3O+Czt8vByDr8G8auQjDq53VK9nLzxm+I19776sg0nd5Iw2dVfbkmiXhIHzeOBr9R2gUwykJ4Q/D8EOtKFLhkmcg+q8n/V6VmeFgSHPTQVaFQiMQ/TJv1I/W2NF4rnG9z1CzCZkcjkeKj8WSJZinbmUfLAmxgxs4AXW62wqJr1lljY8XtHT7f6+DASg1v8vX+wV50cVBrUJ+Ug1zLSJMl9orRwv4JCnk+RJiaa7k7AiDuSU14lvft82n7Ul8OfPnYqgCWLCLNbgYQ1vY2MkxLzGzAuWycIV3JaqvTQVH6AL4mR1rs6QbpJTjlD3zXfws5kRGYyKans+srKjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA2PR11MB5210.namprd11.prod.outlook.com (2603:10b6:806:fa::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.9; Wed, 28 Jan
 2026 02:47:19 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9542.015; Wed, 28 Jan 2026
 02:47:19 +0000
Message-ID: <cd8d7975-9631-4cce-b3d4-b9644e968606@windriver.com>
Date: Wed, 28 Jan 2026 10:47:14 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH 2/2] systemd: add shell-profile-dropins
 PACKAGECONFIG
To: Paul Barker <paul@pbarker.dev>, openembedded-core@lists.openembedded.org
References: <20260115021918.1926514-1-Qi.Chen@windriver.com>
 <20260115021918.1926514-2-Qi.Chen@windriver.com>
 <12dbcfbdc5d0cc4831e08c35abc8f1fe1456557a.camel@pbarker.dev>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <12dbcfbdc5d0cc4831e08c35abc8f1fe1456557a.camel@pbarker.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0003.APCP153.PROD.OUTLOOK.COM (2603:1096::13) To
 CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA2PR11MB5210:EE_
X-MS-Office365-Filtering-Correlation-Id: 487e9a44-0103-49b5-c7b2-08de5e178dd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SFRBRys0QUVObGwvbzJjN0ZPNWJEaVAwTE9hYzR6ZWxTQnhQRG1hL1d5RlRG?=
 =?utf-8?B?UXFjN21vQWU3Z09uTWFYejZCQnVtU3FDSFJIN2JPaG5kVmY3bFRCUk4vd0w3?=
 =?utf-8?B?MFVxVU9sT2pVWkFMank5RXlEcXpZZE9VWjZPSHliTnZabzczYk1EUGJ2S2F1?=
 =?utf-8?B?eVc0U2xrSDZqWTUxTUlvYk1MYlJ4YWdvRjBNY0IyOWR5Sy8vd2thS0VQS3JN?=
 =?utf-8?B?U1o3RGx1U0F4SDBKUkFCSEtIQUxzMGcvTmIvK21oQUliNXRON1FmY2IrZ1RI?=
 =?utf-8?B?YzltbGI5aHBzcmNrL1A5ODFzcnZsV0F4TGlmclY3dkRhOFhqSXFHTUYzTG1H?=
 =?utf-8?B?cVc3allQRldGWklYc1ZHeFRoeU1SRm10NmxCYUlFSTNXdjFTQnQxb3VKZTB4?=
 =?utf-8?B?Zk1DWnQzUlVwTE0xRXhDMXNJOElsbGlrd0Y5U1B6MXRrWmlPQm9peWhDQnpt?=
 =?utf-8?B?bE44QlAwL2J3U3NCc0VVVktObWpWT2pFV05nTjZkSFhqNFdoS21KaEJLcnFo?=
 =?utf-8?B?d1ZHRUNuNmpQd2tUNUxqU29uSFhjRzRLcXluOXNHM01SeC9EVEpWR2h2S2dl?=
 =?utf-8?B?enJSMnhHQStGZ2tiaVBhcHZXVGJSTmROMHhqTFdud2xBMVpxOXJ5OFlaVlpI?=
 =?utf-8?B?RkZ6LzFhVmlYUnhOelcwY2lPV1FyYzYyQnJEWENHMlVQVDFpZ2k2TERsRHRR?=
 =?utf-8?B?akc1VXk3ZEUyRW9yZUk4dlVORXNFejdwWWdxZnEvZmFJbUJIdE03UWxDK0pz?=
 =?utf-8?B?VmNaV0ErNGdEaWRrdHprUjdJOXhwdjBRMWdjb3YyZ0U3bEVvVU5yeHFuTXUr?=
 =?utf-8?B?SFBpcTVoZXlqTzAvVFpyMVRLbHlySkpyL1lSVXJ4UEFIV0JlTGRxdUlNZ3A3?=
 =?utf-8?B?cEdrZnhOWXhJUFh6VnNveU9zWGFPcWRieGF1S29Mc29XTHpoWVV1b0l3QTJk?=
 =?utf-8?B?VzJkbG5QWnBleWVaSWczQnlSQTBLNXgxbnlTd0FRN1p0TmJQTmZHL2l3UUc4?=
 =?utf-8?B?bEI3aEQ2c2tpYXJHajdpZFdXaUxDWnR3L2diSElwU3JNSmN1UFhtSFpkYk1L?=
 =?utf-8?B?OGlEOFR3WVpOZEFudG02R0xLM05YTDdwUm9TWXdIVTdzMXpzZ21PSGZyR1h0?=
 =?utf-8?B?TWprQUhjcTczaDNoQ2w2N1hQQnZUS09KbzdoSUg1YTdVUm43TGZGZ0RzK0JP?=
 =?utf-8?B?OVZKSHo5eTIxOWVvTHByTmhXV0hyMHAwR2xTYkUrTitJcTc4eWtCL2Z1TFB3?=
 =?utf-8?B?WjZGRXBQaXA3VEtNNG1RWlk5d3ZYcHRVUVRNRnZjWlpqd2NidFB0SElDc2hl?=
 =?utf-8?B?NWxBOVRFTGlQYVFtWTliR0hqL3lSdkVFdGpPYzl6YUxySFEzb1cyNHo5Mit4?=
 =?utf-8?B?NGhBSkRuSGoyN3hrOXlUSHlFaVdwR09DcEV6Mm5aMG11dmwrZ0R1K2UwTXlx?=
 =?utf-8?B?LzZGcXVFYlVLREwrMVR6T1VjMnZlVFFsa3RsRGJ5ZGFuNWQ3OHI0clBmN2pX?=
 =?utf-8?B?YXBqWWJHTXBYN1BTUU13bUFuQURMeW5OWmsxSUNzTTg2djIwNlNYNHM1Zlpt?=
 =?utf-8?B?VllBRWk3aE5FeW1RYVltMXYwdGJhSjNNdXhiQWJydEo5ZGRUOTc2QWg1Nm9B?=
 =?utf-8?B?VEY4L2dWV2szQzltZktPWWl3cVJlZU1oQUR2VTZibUZJeE8zbkVpOHJpNHFz?=
 =?utf-8?B?RFE4K1Q1aGFOdGVWZkNQa3JYUkZTdFdveHN6aWdzQXdQWjV6TzZ5eEhQUkwv?=
 =?utf-8?B?Nm0vNXVJbFV3cWdRUEtBb1NDdnc3VVYycTY2WXZNamNhcXdxeE9aWUhTd1hU?=
 =?utf-8?B?d2JmMUptcmxRSnEzL1hqZHdtd1dDbTR5TmwzSC8wSmFWaUdPK3lia3VHbWRT?=
 =?utf-8?B?NCtrMSt2NlVPWE5tcVFDdS85R2NmMTVFc29zTmg0YkMvOWEvRjdDTllLeEpq?=
 =?utf-8?B?a2FyZEdYTFF3QVhFWTF4UFlZVUN0aTBFSUZrc0I1ZWFNNSs0MWhYOS9GbG83?=
 =?utf-8?B?VEloUys2a3NjU3V2THVKekdBazcrRnlHbE90MFZUMTdvNVB6OW1Jd3h3UjdD?=
 =?utf-8?Q?DYtoiD?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eHJPYk5Kb3lDTjNZaDJjUUhKd3piMGs3ZzhvTnZHeERDRDlWY2JZc0txcVpV?=
 =?utf-8?B?b2FiTktJTGJCMDJXM2dVcXRmMlh6WDcxVnl5UDR3WXhaWTlrekMxMGZ6KzN5?=
 =?utf-8?B?OEw5VHJvTUdkWk1oK1JvMGQ1TlVyNWJoVjVLWWtLNU1tVjlKWnRyOG5VdSta?=
 =?utf-8?B?bkw5bnBSOXZ4QWhKYnVOMldYanBvdVFFaVhjY0FXbDZ6d0lGTTE2L0hxSUpw?=
 =?utf-8?B?S0JYdGh3T0dES3pIbVFnSVR5cHpDdjc1NmFqL0k0MENuSDFlUkhSbnk2V2ZW?=
 =?utf-8?B?eDA1Z2RFZFV3LytNUHMxQ3R1NnNhN25OOS9iZXkwdVZpb2lzUDIyLzZZNmxP?=
 =?utf-8?B?cTM5ZUZGOUg0UFBnSTQ2bEZkczA3YlpmNHpKTXBQQ2NlbEVJU0U2bDFmV05W?=
 =?utf-8?B?ZDJkREQxL1F4akRrYmxuVzRhbHpLWVpMblZVSG5yOUUzODljQk1oYThKVlpZ?=
 =?utf-8?B?dzBsOWd4K1YyaFY0V0FxVTRQbUhYZmMvTzNNMHZSa0R0U1dRbE1TWWp6UU1G?=
 =?utf-8?B?cmg3L0NQNTRnY1dPL2pwUlUxSVFJSnJDQlhxVmxrc25IeUZDZTVSRytnd3dC?=
 =?utf-8?B?dHFpRGFvRnlOaGlrVnZyRFEwL1VRZko4Si84bW9vL2xtSVd0b0lkUHY1NDA5?=
 =?utf-8?B?Qys4VDg0c0RqeUs4bU4xNkJ5YUlKazY4Y0c0VjEzZXFibU5lUlVZN2hkbXly?=
 =?utf-8?B?WS9pNTcySGxtOG9LRERyTGFURHJ2NFkrU0ZlRjRyYWRKcHBOTitSdEFkLzRl?=
 =?utf-8?B?LzRaMis2eVVnL2l5SjhCQ1hIWkVaak1zRHR4MFlxWXZDeWljamRNdXN4dTNz?=
 =?utf-8?B?M1lRZmFvYnUzWEl1MkowWTVBeGpnZWY2WDJManc2TDQrZlM0K2EwWUpHMGpr?=
 =?utf-8?B?YWZpRWR0NVRvdVdzaEI5ZHVmM3FxTHYzK0JOZy8xekZCK084UWRIakJMbDVk?=
 =?utf-8?B?SVBBeW1DSUp6MUxuWHhYaWtoN1lTVzZjaEtmVEtibDJjOUM4cEFBTTVxRTM2?=
 =?utf-8?B?bW8zY2dVUUdFTWlhSzdQRE1TRmIwNWVvN0xZQ1gvUUhwSkFIVllDWSsrR0Z6?=
 =?utf-8?B?bjRUZkpQZm04cGQ3ZytsRms2OTBKODZXT0E0YjZpNFhZamVUL3RQRFZlQ1VC?=
 =?utf-8?B?di9jbzg2ZkQvSk5YeEJYZGg2cHBHbTJqdGRKNTZXNk9ONHNNdm5SM1BRUTlh?=
 =?utf-8?B?K0FaNWlia3oya2h1UUE3ZHlhM1hGbFRzNDlub0U1bTFzdkIvWFVTZk1SRVNL?=
 =?utf-8?B?ZjFUaTBLb1l6Q3FLTER6NGdXajIzTGgwWHdvVEtOWllSWnNNaFBQV0F4SW9s?=
 =?utf-8?B?dVpaN1BMb0ZvcEdTV1Q0eStobW5aQWI5VjdJQ3dBNCs3N0ZNSHE2YzhMaVRL?=
 =?utf-8?B?UFVOOWt3LzRYM201KzZlKzAyZ2t3a29lQWwxT05BbUd2Qkd0VUV4YVgyWmlB?=
 =?utf-8?B?NnFXSmhPY2l3c2lhd3F0dHpCUGpOWTFlTGFCWUwrbDRTNFJhR3cwcjBmdXJ5?=
 =?utf-8?B?dGJWU2Noa3lxTkhEZldRTFpXcVlTODlGQ3lMY3FuQll5U29OaHB5eENPaVdD?=
 =?utf-8?B?cGFJcGlqZTBzTU1aQS93enh5MWhzSUdMdyt6Nmo3Q3I4dUhmMHR3bWwyL3pt?=
 =?utf-8?B?aTZaUUZjd293QjZadEduRFgzNTl4b0VRenFYLzd5aEV6US9xTVA2UXpGeCtV?=
 =?utf-8?B?Y2tBUkF4dmdQYWhXdzhjODVCUU9uaUgvRlgrSmdLeW1Gby9XR3JCU2UvMWRN?=
 =?utf-8?B?Qm8zcUM1L0l5YUErUU11amJoZHN1R29WY3JYb25rOGovSEV4S2lQak9WMWhO?=
 =?utf-8?B?d2tINFJSN1VEcEZ3OC9PME90bi9yMVhmc1ZmQlkwNUJOdTdiRHhJRHE0NGFC?=
 =?utf-8?B?ZGd3ck1TbkdMZWQ4NXptVEdFUExEZDR4VUFzRkNWVmxFTmRGdlZTS1plSHc5?=
 =?utf-8?B?cUphNnViNHRQb0hQMW1QaUlFTHovenYra3RUNUJOYWdMOFA3Z1NObnNZY0Vn?=
 =?utf-8?B?dUVvS1o5SHdMN2pyRjBIY1ZGSk1ENjNWYjA3ODl3SWRySytwcndNMzJiWFZS?=
 =?utf-8?B?ajA0Q0kzT1dScDhWZ0N1aS8zUzBQTXo0cUg5VzBIN2hLQURkSm50T2FzWkFP?=
 =?utf-8?B?QzBMZFdGWWdnSmVrZkNiWHJXVmkwOTM3ZEFTL3l0WHpqOFR0SVIvUlRvNFFM?=
 =?utf-8?B?WEJzY0djeG5BOEdjRE9COE1XM1dNWVk4UTV2TVd0bWFvdXlEc2N3c2NOTnk1?=
 =?utf-8?B?L2JHVGNMUlJ1c1NUNXJUczB3bkxrUXJROTBjTDlZNE1aN1NIZnFMWG1GaVlp?=
 =?utf-8?B?R0lyVDBKeUloQVB0VGczekFSd0pLZExZY0JaQnVFNlFTM2ZpNWZtZz09?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 487e9a44-0103-49b5-c7b2-08de5e178dd9
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 02:47:19.1724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oLbjUU4ET6rK5c8feE/u//SWzUcXeO2JwUM/nMDqHecu0xI5DEOkn1mX1m7PYj7iib/fDBV1kjO+Gh/Px8uopg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5210
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: OYq-t_zFmGA0SuaR0oCMD7IAXaikbm1W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDAxOSBTYWx0ZWRfX/yPgiSHMo8rI
 EGAsdMjykx6WlQu8Y3VRAFduDjP8E3HbK3AqaDO9mkScfC7oY8W0Z/eHlMy+kHR1r1Pip+rwvJB
 G7yHKI92QwCg2um3Im4V22tOUJjUEN7+kib+yWze02QEtv9k+DSyvEfl+NvC1t/m5RR5tPpWitN
 4VmUIzQUa8VYDXltZklxfzSkk8RCA0a/k5mTjUYfWktO2g+gF6dka92ay967E+Q6UWnBi6Lr/B4
 O86TzniYu0t7TRFegktSaYBPNOTVB3LOdCFD+qykC+0oWCXczaVtA6GI9svBVLMF/cJxHRfR51g
 df452xbnTHAvw6zy9d8HUweee4dU/N1jyMZJtEo592HfjqAQb6MMU9RCnEykWVj5G/uYYA6i6At
 NP1PuaxWNR27J0Z4hkplO9UxS9hS16hHndK5HbTgvmGTzn14mU8PYOL4Dt6sm4vNof3FlMThhvG
 Ftzy3gZ/VTDrkVcRmaQ==
X-Authority-Analysis: v=2.4 cv=Lo+fC3dc c=1 sm=1 tr=0 ts=697978ba cx=c_pps
 a=B83JijZ7EzXLHUDiN273XA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=nv23E9fyAAAA:8 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=vI-RqGJxBYBRq6-NdsgA:9 a=QEXdDO2ut3YA:10
 a=ehkDpipTsgk7cDPTKqUC:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: X1xEj_T0SFAxhHDPWybzkqBEj9RRP2wD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_05,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280019
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jan 2026 02:47:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230070

On 1/23/26 21:06, Paul Barker wrote:
> On Thu, 2026-01-15 at 10:19 +0800, Chen Qi via lists.openembedded.org
> wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> New version of systemd introduces dropins in /etc/profile.d. This
>> is usually OK for most cases. But in case of using minicom to connect
>> to the machine, there will be unnecessary output every time you type
>> a command.
>>
>> This is because the /etc/profile.d/80-systemd-osc-context.sh[1] is setting
>> PS0 with OSC 3008 standard[2]. If a terminal (e.g., minicom) cannot
>> deal with this OSC 3008 standard, it will just output the whole contents.
>> This is quite annoying.
>>
>> So add a new PACKAGECONFIG, shell-profile-dropins, to allow users a choice
>> to disable such behavior.
>>
>> [1] https://github.com/systemd/systemd/commit/dadbb34919abd3fefeb5b8ccc9794da9398a2503
>> [2] https://uapi-group.org/specifications/specs/osc_context/
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> Qi,
>
> There may be other files in profile.d as well as
> 80-systemd-osc-context.sh. In systemd 258.x, I also see
> 70-systemd-shell-extra.sh. I don't think we should offer the option of
> disabling install of all systemd profile.d files in order to fix
> incompatibility with just one of them.
>
> There have been changes to 80-systemd-osc-context.sh in systemd 259. We
> could try backporting 705e2ef19418 ("profile/osc-context: move and
> extend check for TERM=dumb") if we're not ready to update to 259 yet and
> see if that resolves the issue. We may also need dd20ba74e3b4
> ("profile/systemd-osc-context: fix overriding of PROMPT_COMMAND") and
> 97ad10c9aab1 ("profile: skip setting PS0 when PROMPT_COMMAND= is
> cleared"), I'm not sure.
>
> Best regards, i
>
Hi Paul,

Thanks for checking upstream status.

I think you're right. The commits you mentioned above are likely to fix 
the issue.

I'll double check when upgrading systemd to 259.x.

Regards,
Qi


