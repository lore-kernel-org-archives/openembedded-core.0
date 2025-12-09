Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18370D3B7E2
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 02:37:50 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10545.1765247869092639942
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Dec 2025 18:37:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=Oj3Cy+Wf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4438aff1f5=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B90ai5H3209943
	for <openembedded-core@lists.openembedded.org>; Mon, 8 Dec 2025 18:37:48 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=APjD9t0Qxxs6UwRtsqiECm
	pr1ewJ3/oaIbUY/5UBQXQ=; b=Oj3Cy+WfcpfSYg9SFXoYmw9u+L0XUH+/oKmQjp
	BtUL+rrxI5LYXFb+7zzh3JhNYoAPJkoDUeva2U0yhzWeJgBNcaUhqqQCHRnu8lak
	t0OX4WdKjJNp8KkCOaFBFJkpqWCFn6K77oMnpgsS2JeKocH0gsZij4sgGZiM5Pe0
	1XxkuQxFtolCzLaeHtohHCDYD5C9G0To8P3ir/Oxyls0VpBNFyeyK8A1hq98U6vL
	QI402QZVlTL1Ai13JFOeiR6XQVcybdxwHz4qoSO/zsTT6XCRr6ssO7AwDVyZLeG2
	cIab7RAeroBwrirR/gcmm7o0NSWuUENwLqE6WCykAurXwkgw==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011036.outbound.protection.outlook.com [52.101.52.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4avgn5jacp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 08 Dec 2025 18:37:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j8uZQtz0S9HeFX/m8fsMfWx/nHMWtJcq1UqL51xq6rhg+zDaCljCxH2mtoMc9GuX3BMZ33A4kwIVS7R5WukF3Vfz9L/WBZRKch4NxFPQU+cZVFxA/FEtstT3SFRkUntkYr5Ur+zNtPEo9RqF90f6Wd0fPbAEnXQRpYcP51RB5F5akuuf7wTxap/jSBml+oKOTVq4WlXS88F1IjIuIYq0b0ZKfcgoTDhajvNP4Qum2ZbnOVndR9EJb0rK2q5rLKMOB+YT9dHAWRxEbFgnUvwDulxsevYOUY75iaWV/ZwmgFEwSnwuDyr9IkKapazQysxYz1VcvUktApehCMzMnyWn5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=APjD9t0Qxxs6UwRtsqiECmpr1ewJ3/oaIbUY/5UBQXQ=;
 b=H5jHUINYV/qPBO6SfVfJ+9POtdyY13rIYzV8vrcv9pBjahetYgrl4+rVfvXfkpCmDH10LU2vWJJloNwEjkDaMXEpGl8EAOpIEApSSvhReS5grxQX1OdVg+mN4SA65gm8SmsafAypkF9XCb9WkV/WF4q4HsJPpZCS0nE8j4DSqe6pwC1SKf8ub37aHLuBphWDxLNHxEehwNIhmYsUQt6JqQJr6j4pnKJudrn3bcSQhSquvoSA0QBRQTfc8EOkm8ErrywXUOOtJjpItALcXF7jx185Obnj0tJSbB66Hqg2UvSK4hjtvmzKL3D9TXmnujJ53eF0vuYBMQ922XnoHkGxeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by CH3PR11MB8140.namprd11.prod.outlook.com (2603:10b6:610:15b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 02:37:41 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%4]) with mapi id 15.20.9388.012; Tue, 9 Dec 2025
 02:37:41 +0000
Content-Type: multipart/alternative;
 boundary="------------FqYsgX3MA7LS53MxuENikwnW"
Message-ID: <47201384-ce8d-4188-be45-4bbde9a27601@windriver.com>
Date: Tue, 9 Dec 2025 10:37:35 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/2] go.bbclass: change GOTMPDIR to improve
 reproducibility
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20251208091148.368769-1-changqing.li@windriver.com>
 <CANNYZj8TPT+Y0-ni63tyGPWZHZ4zweaAm7nKdMM_KA40AOkwGg@mail.gmail.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <CANNYZj8TPT+Y0-ni63tyGPWZHZ4zweaAm7nKdMM_KA40AOkwGg@mail.gmail.com>
X-ClientProxiedBy: SG2PR02CA0103.apcprd02.prod.outlook.com
 (2603:1096:4:92::19) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|CH3PR11MB8140:EE_
X-MS-Office365-Filtering-Correlation-Id: 81d137f0-dd7b-454b-e6ae-08de36cbecc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?a2ZacVd5cU4xZjFwQkI2bjIvdTNaS3F0OG9JcmgzbVNJcmtySG50aDV5cUpN?=
 =?utf-8?B?bE9ObFlBVWJFTFFGZ0pQb1U2cTdpTTJjaTF1Rnd5SnB6SjlISmRzK3BQK2ZS?=
 =?utf-8?B?L2FOUVlHUmVOL05LQWZqSUpiY1lEOXcrYlRtZkI4VU1TWHdmd1pjcE4weUpC?=
 =?utf-8?B?STFUeW82VVZkWCs0YXVTZGtiZGpHaldmL1RhTVhNN0ppd2VGUFF2cUNVUVlJ?=
 =?utf-8?B?eW9VZkZlSDhHYWV0WXVkSWw2Mzl1MXlndXp5ZTJMcGlxL2ZDYi9acTBtQWp1?=
 =?utf-8?B?R0VySTRlbmNjaEN6QjVhcUlyRUNIR3JOdzlDaWRxSHFYWm8vakl3MFhVS3Mv?=
 =?utf-8?B?d24zeU9TcE95eUc5VzZLVkhVWVVPQ091ZStSdFFubEhzM2hCNDREV1pGRjd4?=
 =?utf-8?B?KzRJdjczdFE1alZWMHpOZDhsbmJtSUp5Y29IaERjNWtsUlBXeXUwTTYyMUJN?=
 =?utf-8?B?NUw1RmJaUno0RUFHTmNUZWdUdXgwcm9zUGFpSkJUcEMySlFoVFZXN3A3cE5l?=
 =?utf-8?B?NXhCbE82VHRadEhlNjRFM3pmR1k0YTluQzZncHBoTkRNam56ZktwZzlHTkNa?=
 =?utf-8?B?b2Z0R1VOMWQrNzBIcUZna05IWEVKWHVXdXI2TkdHTE5QSkJ6L2U0S0swMWhm?=
 =?utf-8?B?Z0tTOWdmOExUNm53c210ZExUckMyTUhnM3g0Zkw0U0FzN0ZZTHRrTkRmcDUv?=
 =?utf-8?B?cXk0alhubG5wQlk0RU8wakhxL2VaL1BWbHBXT3hpZ21wODFVSUs5RGs2LzJF?=
 =?utf-8?B?NVZ4KzRIQnhlTHBQSGJNbkZpSEdSWDNtRHdJazR1Z2NkTlBkTXVQbzM2ZUZC?=
 =?utf-8?B?TjcybXh4US9Xd3R5a3lBSWdyTTRrR2ZqQm1Edk1VazZURllKK0lzTVRJTWRZ?=
 =?utf-8?B?U09vemlGNlZJeWJMWEhRbHZYV25YWHJZZHpIU2lhOStBRzZtam9zVDFIQm5P?=
 =?utf-8?B?UHQvZXZWRXhWT1lMS0RldVh0OWNLbXNYTmp0cnNPbkFONnM0UHl3V0RZd0lC?=
 =?utf-8?B?WUU5R2xKQ0VjaTFjQkE2ZDM3WGtBYTkyQzBkN1BuWndVbCtUMmw1YXlrWEIv?=
 =?utf-8?B?WTVXdE9ad20rZWhVeHQ1aFB3am5HUkNRVDJaSWgreDlXdWRxMmt1Um1GNUFD?=
 =?utf-8?B?U3ltOTVjUFNpYzVENmwvbEVWMHdUeHl3VlRCNXdtWDh1NmptT29qVHpkQ0dE?=
 =?utf-8?B?ZG5yRWlDVFh1ODhtclVMNHJDT1A3US9adFFHNUNOL0ZpR09Vb3NHWDROOTlI?=
 =?utf-8?B?UlozRVB3YkdOSVdIQ0VLeE5LUjcrM1JQRThmRWw2M2hLMVA2VFMvUUpYb1h2?=
 =?utf-8?B?RGZYd0ZoZmlhNTJoS1Z3a0FtV0s5R2YzbjRjU2xoSitJT1lOdnVEN2dXaUk2?=
 =?utf-8?B?MTQzSzNCbG9YSnlrdHpHbjRpMWwrRE14RGN3UmpvSUpGS0lXWFcvTTJSSnlp?=
 =?utf-8?B?YVNYRytlZ0pJaWlKbUowTEpJTnpWaTlVeUpDaXc2U0ZDcThHRFBXcXVMcThP?=
 =?utf-8?B?SUQ1UnFqVlVYYU9xQXJLWm9KOER5SG5Jbm4rTVFEdkxYczZ1MEJkMTBnWWRH?=
 =?utf-8?B?YlNicGR1KzVTd3dLVk11c2pta04rY0I4TUNKOHJUYWg0dWp6U3p6ZnUrcUV5?=
 =?utf-8?B?L1FScndPZGFrdlhsamJVWmwrQ2pwODNOWUtWV2FRdFdoVnF4QVdMM2dmK3V2?=
 =?utf-8?B?RU14T0x4NnVSRE9FenFrVHJ1YVB4bUJIcHBtbGVLWXdkSDQxTlExa2trQVd5?=
 =?utf-8?B?SGhLbU0yR0FZcllMVmxSbjd2a0dxRXlUYlJ6WGcyVnFCVUpHQXBzNlhTb05r?=
 =?utf-8?B?a2g1aUkzMWdHNjZremEydytDdlNERFhBeFlaaVVGSGgyY1RoYlV4eFRUZEcr?=
 =?utf-8?B?OTBFcVVHcmR3QnpCZUpFcEpDNC9tQTZTMnVGNEs3S3EvZ0t6V3VMcmkyWWV2?=
 =?utf-8?Q?G0V/DTKIpix3Wazo5lcy41EAE9Y5FgZc?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bjY2YmIxSWZuTXpZTnV6UEhtN285TWExN040dXJpTU9vOEsrN3YzWldTL1do?=
 =?utf-8?B?Skp5VTFFTlFNTGFpaEg2aUcwRTZTQWlOczJzWlRaREtHZ1c5R0Z6aGg1N3Zm?=
 =?utf-8?B?TVFhTllUUzZyR0djNEJXWS9ncXByMTlIbFViY05nTTFUSE9wOWFEbjN0dTda?=
 =?utf-8?B?TVRBTzhkV0pielZJL1R6NWczSW51TGJxa0FJZ3VTdG0rWlE1SEwrOG5YYjB1?=
 =?utf-8?B?b2EreG1zYllrRXgrWjZNSDVSVW5xMTdBcXFRNU9CcDRlUGdIamtWK1hsT0dy?=
 =?utf-8?B?bFM1UlNVSEl0Ky9zK1hxVzBySXozQVdTb3paNnlPRWMyVVArRkk1WkdaNUEx?=
 =?utf-8?B?R3FaOWNDenRpRnpjejYwMmxPMmFmNThlNGhOYUI0U3UxUUN2Z3VGWUNxRFdO?=
 =?utf-8?B?ZDJyc1pwRXkzdnBOQTQ4YmZwVytxbzFEMTExRUZJRDlSYm1vb2JKN3JQSDlS?=
 =?utf-8?B?QnpQbkhGaFFlQlhJTVU4SDV5VzYvaFB0ay9icStnUFZVUXdyM1BWNlRMK3dK?=
 =?utf-8?B?U0hhbi9lZnNpREx3QXJTTHRxNHV5bXY5c2NPdlp0R3VFNlpXSXdFdDU5VDlv?=
 =?utf-8?B?aGVEeXU2d3hkRHBhQkdNc092a1FZanBvbEFOZFVNdm9LQmdLTXhpaGg5M2l6?=
 =?utf-8?B?LzdVd3ZTNjV3V3NkR3dqTXZCcFFZcHlpMUluWk5MVHVoeHpwWnpaeDFrcS9H?=
 =?utf-8?B?WFJHbG91cE96dTJTVDBHN0tMdW00R3JWZFhmY0dEZllHemwyK0ZqeGtJRGlO?=
 =?utf-8?B?Z2JXeUk2MmsrMTRERHVnZ05qY2YraWg4SWlYSnpxYzBDU2hIdVlycTVvazNY?=
 =?utf-8?B?OFhVczEzK2tRdmlZZnJwbkVKQ1dFNkcxalRLRnpwdXFKc21wVXVKeUVvS0RF?=
 =?utf-8?B?angyMWYzU2cvdTJySC9kSEJNZnVTUGZZVTdNVWZtSnVYQmxCSWVlM2F0WERj?=
 =?utf-8?B?OXo5NThYSGVLRS95dDc2azJveVFrWkRZdkpHYTZUa3BjVXpSYkZpTEF1QnNR?=
 =?utf-8?B?S0Zkb0J1UFhseWpKVEhoaGVJZmRpMFFtcUszSU1zdkVaUHdYUjlFaklTTE1x?=
 =?utf-8?B?bHIxZXNiK3ZjQmhkemJtRzJBU2k2K3FXVWFJb2dyL3NmU0lZZVRkRmtuaDZD?=
 =?utf-8?B?Y1FwdTAra2p2c3prOWRmYU9MMkJvdG90bDU3R3lkbDFRRFlHMUgvM201dEcz?=
 =?utf-8?B?bWROMytiS3dldVo0amVkcmRrMG55d0J2WXhOWUNZczQzb29XcFkyVjcveEdz?=
 =?utf-8?B?bU1MWFJwY28yT3Q3eGg4dGhqTVlVeFVrQUx4dVlyRENHTWs2WHE1dDU4UnBl?=
 =?utf-8?B?ZDBUSlp6U1grdlhoU0l0anp5QWIwWnUvWlBOUk04L2IvYVhjK0RiVjFoMDh5?=
 =?utf-8?B?SzR6VzR3TUY3R01tTXlRMTFrcnNhQ3BLbG5HQVVmUW5GbnpVK3VWME9uYlpv?=
 =?utf-8?B?NFZNbVFZM1BOelhBTXRDdkMzRXlvaXlEdnQ4SnJPUWdzaTR6R0c4bWhodmR5?=
 =?utf-8?B?b3hKZGgrZ2JmQzdoOTFEak9XR1BnK3JMYVhRUGRsb1RWaExpV3J0Z0xHSDVW?=
 =?utf-8?B?blloNmxKMjNEblZTU29VNENQdHpNUVBtL1lUK2VERTRqUVlsYTdjNUZ0U3l6?=
 =?utf-8?B?dEpRTUNGVzk4N2FQTXFZbVRCS3Z5cXZNMldmUmpUWWI1a0FoS0ZsZHRJck00?=
 =?utf-8?B?WnJLUWhQUGl4RXM4dlUwRkhBQzBCMXYrOFRKNXhlNjVrajdpR2JWall1ckNP?=
 =?utf-8?B?TW0rRDg5dkhOOTF2K3Q3V2Q0RVpFWTF4SHJNTXg0ZjRNZHhTUmlxSmZESVk2?=
 =?utf-8?B?b1BmTDdpdHZPcUp2ejFYMG8vQXRBUHNQMktsNDFud1YyQjhRalRNd2RyVDc3?=
 =?utf-8?B?a2JlYjd6R0NIVURUYkpFbFFHMlZaSWdVUG1YVzdjSVF2ZmpyaXVhQ0taWG1R?=
 =?utf-8?B?U0FvRmEzRk5vZjVvTFVpRi9Jc1BoVTZCR2IrclQ0Y25iSmIwZmEzb1l6L044?=
 =?utf-8?B?TEZudlZtVWhXb1ZNTWxoODhRK3lEWlN1S1pSK3hTVHM2Rm9YN0ZzOWhRYjFa?=
 =?utf-8?B?dlV4YksyZ1RScGhlNmNwR2NZZjRTc3djYUVFbk5ueUdaQjFtcWhQMXhHYjdZ?=
 =?utf-8?B?ZE9lak9NTmxsMWFFQ0UzbzViOEFwVlh1Q1BzNWpBVW1ZNFpaSkYwZU1QelM5?=
 =?utf-8?B?K2c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81d137f0-dd7b-454b-e6ae-08de36cbecc8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 02:37:41.5235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lAmlg3ZtQPwb25DsDGc8Uzmwic0TfBOQLjzDRtWqN1PhSDWGAvgxh+4TiWqAzqTggh7Q5g/hPImms3sFUhGVycoxvHn7QGFIZ5m+4Gqxqbg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8140
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: o7PGmYCsg5pewiK0SCbSeNnIhbjxlY1f
X-Authority-Analysis: v=2.4 cv=MtJfKmae c=1 sm=1 tr=0 ts=69378b7c cx=c_pps
 a=VYnc1ZjkwFV8r4Zgssgzxg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Q4-j1AaZAAAA:8 a=xS8pIiRQ-qf2PX0N_gcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pGLkceISAAAA:8 a=wvPkM9v7g1_ikmSEda4A:9 a=3_tVXwlE9Po0EL3_:21
 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDAxOCBTYWx0ZWRfXwOQdF8REKCbV
 XxDLg6AU96MjOXoIX4FK/JS3mSykYF6nxKus3otYL67dQdRkZv+Yf1CFaDiIAROUouX0E+Ak4PQ
 f6gcPzx2qL3wB3SKpsCvpEt11bqoXh+5zBimUkNKlA95hv/SI7r7VKc62ppS3yvLfOTJdyH/g7s
 +OB6qeGhr7uChy8wh6khZjl5DOQLucBULUN7vPDHG36q6lokUile8YR5ze8KvubnyXGOAn4FcQK
 0Lno0boj+IUwDHBd6vR/1tnMBf4denAVsZ8Fqm2T7xD4FoKTHdTP6YaAZdCwzBEzQ97sMKvp4lc
 e7u6vSG0+POumUHCCkG2qFFNQJg0vpZ5in/eeaeYoB+x08LyQMqS/swXs/LGSLPeYGzOhRQZCV7
 6wcZ0BT3yzxMVsESTUS05J5OW0A3xw==
X-Proofpoint-ORIG-GUID: TjDvbC8zLKQyDc-TXnl6KMSnz-HymiGh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-08_07,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 phishscore=0 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090018
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 02:37:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227414

--------------FqYsgX3MA7LS53MxuENikwnW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5B90ai5H3209943


On 12/8/25 18:41, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Mon, 8 Dec 2025 at 10:11, Changqing Li via lists.openembedded.org
> <changqing.li=3Dwindriver.com@lists.openembedded.org> wrote:
>
>> This patch changes GOTMPDIR from ${WORKDIR}/build-tmp to
>> ${WORKDIR}/go-build-tmp so that the path no longer matches ${B}. This
>> prevents unintended replacements by OE's DEBUG_PREFIX_MAP and
>> restores reproducibility.
> Wait. Go does not have reproducibility problems right now: it is a
> part of reproducibility test, and not in the exclusion list. So how
> can the issues that this patch set aims to fix be observed?

I checked autobuilder configs,=C2=A0 although we have reproducible test, =
but=20
only test with openembeded-core

and layers under meta-openembeded,=C2=A0=C2=A0 and there is no recipe inh=
erit=20
go.bbclass(except etcd under meta-oe,=C2=A0 but already skipped)

So actually,=C2=A0 we don't have reproducible test for recipes that compi=
le=20
with go.

And I tested with this step:

on a host,=C2=A0 with build path ra,=C2=A0 and another build path rb-exte=
nd,=20
bitbake buildah under both project,

the rpm of ra, and rb-extend is different,=C2=A0=C2=A0 and with these 2 p=
atches,=C2=A0=20
the rpm will be the same.

//Changqing

>
> Alex
--------------FqYsgX3MA7LS53MxuENikwnW
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#cceed0">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 12/8/25 18:41, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CANNYZj8TPT+Y0-ni63tyGPWZHZ4zweaAm7nKdMM_KA40AOkwGg@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On Mon, 8 Dec 2025 at 10:11, Changqing Li via lists.openembedded.org
<a class="moz-txt-link-rfc2396E" href="mailto:changqing.li=windriver.com@lists.openembedded.org">&lt;changqing.li=windriver.com@lists.openembedded.org&gt;</a> wrote:

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">This patch changes GOTMPDIR from ${WORKDIR}/build-tmp to
${WORKDIR}/go-build-tmp so that the path no longer matches ${B}. This
prevents unintended replacements by OE's DEBUG_PREFIX_MAP and
restores reproducibility.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Wait. Go does not have reproducibility problems right now: it is a
part of reproducibility test, and not in the exclusion list. So how
can the issues that this patch set aims to fix be observed?</pre>
    </blockquote>
    <p>I checked autobuilder configs,&nbsp; although we have reproducible
      test, but only test with openembeded-core</p>
    <p>and layers under meta-openembeded,&nbsp;&nbsp; and there is no recipe
      inherit go.bbclass(except etcd under meta-oe,&nbsp; but already
      skipped)</p>
    <p>So actually,&nbsp; we don't have reproducible test for recipes that
      compile with go.&nbsp; <br>
    </p>
    <p>And I tested with this step:</p>
    <p>on a host,&nbsp; with build path ra,&nbsp; and another build path
      rb-extend, bitbake buildah under both project, <br>
    </p>
    <p>the rpm of ra, and rb-extend is different,&nbsp;&nbsp; and with these 2
      patches,&nbsp; the rpm will be the same.</p>
    <p>//Changqing<br>
    </p>
    <blockquote type="cite" cite="mid:CANNYZj8TPT+Y0-ni63tyGPWZHZ4zweaAm7nKdMM_KA40AOkwGg@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">

Alex
</pre>
    </blockquote>
  </body>
</html>

--------------FqYsgX3MA7LS53MxuENikwnW--

