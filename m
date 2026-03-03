Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52692EC0480
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 09:42:07 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14596.1772530915501652291
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 01:41:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=AECLZvT3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=75228a3b20=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6234VbiF3902896
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Mar 2026 01:41:55 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=lAsPZbpT6pBOa/wkUTE2aztpw4P4Uhy2S2bZAHzbh1Q=; b=
	AECLZvT3wTftzwLa/R8VHvAh6ey8ruBuyLRPzwedzJKaMpybWgErK5kM5Shte1Yd
	BDPQxfk9Da95IrZrOqlhD/i9Bi2kVFbRb7aRg+zefNdKJeY1eWT2DMs06cdvLU/+
	2tyf3BvQZHm7XblPo8aAGENF7BgmIY2/6hEuZd+JAsQszvMcVC1VP34ZT9AeMUPg
	XKF0Fd/3U7nhtmkNUuENcltnYMCWzQBmf4HA/kAcI8+C0KsL3tBoiU+OIADQSY8Y
	H8i5mMAi7fE+GhfJxqT3sLSlkESnW49UIdn0IpMK7yTUScNEbQgZKKepAiaoYdt5
	vMVs5IFukjE2wmhojclF/g==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013063.outbound.protection.outlook.com [40.107.201.63])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cm0rgk0nh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 03 Mar 2026 01:41:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nxGauIMlclo9QaYkLbVJJK8wxFKZ/7wWmcV7bFea7ZMq9Ya/3D7F8d+jBiWbBESKBAid7RYDukfdf22rGnjVoCXlK0QLUoTOgpUzygFBl++PgXoMnwoTAy8JTlwnlr1MsMlQpGYx9bZj38b7CechfVLPktN9TjlrEQiud9MxDqTng86ud6n2JikPB856LaVZTzXd2IVm3iaqN4bZkvsKM4t+rNeCer7sRypHG0f2zUj0iXYdKvMNBAPZTz7gFO+GeMfNkgsQ29dGgS6k2SOTvGBhuedghsGdIAM4jrUABgqgy0UpEhiZWuWfb27djo8xPP/SJ2g9dFXY/VdCWBOZYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lAsPZbpT6pBOa/wkUTE2aztpw4P4Uhy2S2bZAHzbh1Q=;
 b=eaoIBlEnGLK294HKJxAOV1JE7X5HmW6vJ1A3bfk07DXcZM701d4XckNOlsmNbKmqa/LSneCsrNxeT6+2b7K4viq/rywvv/tQv+sQayo+HIV/aTZ3CovjY7O94wxkw8ujT1fDYJDsc4MfGr4De25ALEki6TXRhcgnilWn7KHYP+Nebl1c8JBeAJNT4DMcmpyh92q6denIlNgMpZb8MxlablxD28WywwpW3eLZDwD/k38pYbmshi9eQ6L0sLqaoh6TpgbNsQmz/CK6UD4cUseKJrJZBOBlraBeKo9e8UszloCKzpikhz/z7K4gBhfS/OwZnLapnyevPQZ9pT9eeGnyzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by PH7PR11MB5983.namprd11.prod.outlook.com (2603:10b6:510:1e2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Tue, 3 Mar
 2026 09:41:50 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::f908:c07a:c64d:67a3]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::f908:c07a:c64d:67a3%6]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 09:41:50 +0000
Message-ID: <86d3c351-16e9-44bd-8b38-b8c6ed75aa0a@windriver.com>
Date: Tue, 3 Mar 2026 17:41:43 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v7 1/7] package_rpm.bbclass: Drop external
 dependency generator to support rpm 6
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        "Burton, Ross" <ross.burton@intel.com>
References: <cover.1772367692.git.liezhi.yang@windriver.com>
 <8e2bf6e0befe331a0f834687317a3dcd2d735b92.1772367692.git.liezhi.yang@windriver.com>
 <2bbd3ebdc7f525fc5fdb5848ec6d80c70dbb9e22.camel@linuxfoundation.org>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <2bbd3ebdc7f525fc5fdb5848ec6d80c70dbb9e22.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCPR01CA0182.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::6) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|PH7PR11MB5983:EE_
X-MS-Office365-Filtering-Correlation-Id: f36974d7-4931-406c-43ed-08de79091865
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	q+Vc6wX+3SailiJX7ZvYntPY7pzidEkkj1xjsnqzkSpTILrIjqarf/VH4CdwQzp8nY4MX8yzBsHJmFcWp5lYZFGlQSR48IYTGD/4aoIPKxMNmB3iiX0aaGr6yFsUAFyZCWKEgKuYRDdeAfMnqCQBZsu3HmJbDt7ddUXlqI6csEzuDTy/DW6I9j0MXNyK/1KLSxS7q9KHvwVjURpuIw4Xd2GmJ/EtOaDP5wYJF62hi1crXFhhPEd2cEGAeULXppuTtIyy2vHgsq3tTLurRSc5F1a/jcDq1UoIB4JH8l6KYa85BpmCLXnYhKH7yW2pOJPlDBt2oJS95fADF8IH4KhTgPlaUsxLtC2z7g4qsl54WV5msjoNDGdVw1u8Zww26vAMUFjkoi0141FJyBa7Yoc+3XbV6pvXXRAg36VlK3SdEY+7kqRuXbtWNmmfxrzXDn79MRNByse/2sCsbuEDQn4SBZC3myVa6nnSpxNjhk9pMPpD4LDCn1K6mYcIgrxpH/vJBXAhNlXlGHx7NSOAN1e4w+Mt5DuMQ8z0l5khLjeJdPP1cpxxxteX90rEL6+hcpb6GW5EnVDwDKeqA7E0BPoC6WpquhtbbqgVI+DbdRkztohfKUKX+7hOu/K/hUOpYehYWqJEKh07uJWEVtwveC7rZv1POWBIFjoqwmDKKUS9fs+jrPeGGhU3rrvZi33Pfod65tOhg64y7Nshd5HadALpVyBbrlmTcteFhGyRZIbIBPQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?L0xzemFHQUFNVythd2VwMk8rRXcrdUc5YWFKMzhKeHlVUGZFVWxuTGJER01F?=
 =?utf-8?B?TEtzcFlkV3Y0alZZZXFBcTdKSDVHalBSODRsTzdkUU5qOVloT0pFRjlBdW5W?=
 =?utf-8?B?WnZrMjN5M2ltT2ZkWlZqcDBuc3JpMTJDQTJVeUNuSjF6eTRGQXZjYlNiQmdw?=
 =?utf-8?B?Z0dQU3pMeGxwSWI1elRNMDJ4VTRyVE13dVkxSEdvb1oybEorYnE4YVVrb0Mv?=
 =?utf-8?B?ZjZKS0xSdnF5UEIzYzFpUzc2OGFaUG1CLy8yR29VanlmRFJGVXZza2tDK0Vh?=
 =?utf-8?B?WEE1MHpDY1JIZWtGaUNTbWxoUXFVRDU3OG1JU1hDL0QxQjBSWlVOQUJaR0ti?=
 =?utf-8?B?anB0Q1EvUm5IODUwcTVKeS80OUp0Ri9ML29xN3o5YTJzaGZ5emxzODR0YmdK?=
 =?utf-8?B?OXhNVnduOWMrYnJJSDUyaVRYNmN2bTVnLzN2SXU1Z3dTamt3ZUpGeXhLcG1F?=
 =?utf-8?B?Z05abE5iTkM0NXBRTW0zVWxnM1pEblJGZXI3K3B0Q2xRWVd0VEFSYWlJa01i?=
 =?utf-8?B?MGxHVWNhSTRDbm9kekNoWlE2Kzh0YTY4VEtrNnc4aVdaMWgrY0NXVGt1cStB?=
 =?utf-8?B?S2JsQ2ZlaFBHY250eUJmZGVLTWpOV0ZRT3dWeEM2WHVkOCtpRnhvcGpYdzdH?=
 =?utf-8?B?dTI0aGwvK0JZV2RPbWxrU1h2MGI2RmVqSGhKYWlxS3JGL2twQXZ1YTRBWnNM?=
 =?utf-8?B?OVlWR2hNWlJYTDBLU3YvclVrbjJOMWFoRW9aK3AvaGo4MXhGb1p4bXkyWlZZ?=
 =?utf-8?B?SFZ5eW1XUjZyazVpMlFXaGFLNDZwRlY4WVF3YnNmOStsb2tKc0lsalcrV2VC?=
 =?utf-8?B?ejEycnZNVWp2THZ4cUkzVzJ2dEUvTlhtWkhvZ0VWQlZuKzhTekVnNFR3SkZy?=
 =?utf-8?B?Rm5JR3Qrczh0MVdIOU5iLzFxQjBQMGM2Mm52aXFZOVVIeGRPWkw5My9YVlcw?=
 =?utf-8?B?MnBKSytrRjJxRWtaVUUwQWE2akZaL2ZMWEVvdFBuLy85RDRQQURMM1V6SnZY?=
 =?utf-8?B?eEJVUmdQanRiWkVEcVNLY1pkVFF1SGZRR0JxZDBrRzhqczZGeForSjhsdzRo?=
 =?utf-8?B?WHJ0a0VZSVV6TTYrQlQxN1lyQzNsZ2t0a2xsSXhYK3pHQlp4Wm5OZzFENUxV?=
 =?utf-8?B?SVhYZU5hS2VrYk5haFZvcTdiaDRRTmlFREFQS1J0TEM2d2VtaWF4eEFzanp0?=
 =?utf-8?B?SGc5U0pHNUlFZjJrZVBXNzFlV1dNdEpvSU5jU2l2QUhDN3hCRlN2STd1Uytw?=
 =?utf-8?B?SEJPOWZ3eE9IOE5maURvaEIxWVlUSFNNNGxmSVUybWkxbEtHVDNCcFFZejJj?=
 =?utf-8?B?Qys3dkpwMUROZWtoallNSmY4M21Yc0xpVVJSTXdsMVdEYWZiSGl4eS9kNFZv?=
 =?utf-8?B?ekVZWERieWtWZER2RlNRakpRSnhKcGYwRVN5OUFoS25id24zV3ErWWNrdVJz?=
 =?utf-8?B?dUZoRkN1WGlaNjhzU01Hdm90eW5Pd0c5akwraEFvLzZzTExTT1UvVVkvME9G?=
 =?utf-8?B?MndvTnllZnJDMEFGZEMwUVRKeEhrbGZTWWtoeGFLaUpOTWYwRGJnSC90cXg0?=
 =?utf-8?B?VnN3Nk9LTGNGcEovRFo5M1A2aHJXUlhIaGNqVG1GL0VtbDhNUnpjaTFlZnNw?=
 =?utf-8?B?Umh4WGVlVEdzM1V2TldKSDhLMjk0M2xTeUpmMDRMTlV3THVZcEdld3IwTnBV?=
 =?utf-8?B?L004Vjh1Z3VIZlFxTmRHTU9HK1d0dEN2VE9QekNmODlYelBmM0xSZlRFQ2lG?=
 =?utf-8?B?R3RNU09kQnFlZjRvM1JucjFKRXlTdDIreEM5aXYzTTl1MjVxZFJBTjF3V1Bh?=
 =?utf-8?B?MFNYaFQ1S1FTVTVMSWIxSHp6U3psRFNRRjh4OEJ1QjZqVTdpTVozOTIrZEk3?=
 =?utf-8?B?UFA4SEYzV2l6V1U0UmFONHdiUEVvQ0paUVU5bkFXTDZqTGtUUzBmMTJkZjJu?=
 =?utf-8?B?eXRyUVpIWXg4VFQydkdaV0hOZUowL3Y3V0JGUmVFMjlwT1RPQ1VHNzNZMTZN?=
 =?utf-8?B?Y2NEVXpyUUVvaDBvU1c4VnJwQ0phMWMxNlhYcTJOdER6cCtJcTBiNmJHUGtI?=
 =?utf-8?B?V3FDRXZPbU9qSTBUMG0rREM3VEZKMkhiTnFoVm1ROEVPRkRNY3Jsekp4eXlB?=
 =?utf-8?B?VTduR2RweEpsUzMvWE1tYWtEZm5pSm9La28zQzMyWTFHeVovZ2Z5QmlLR3Vu?=
 =?utf-8?B?dDVvQnFUdThLMWJFQzdQeWkzc0hUYUZFWkxkdGFQRGtid0xKd3RDcCtjQk1m?=
 =?utf-8?B?NmVXN3V5aERMZkxQd0x6bWVUUnRONlZsSENhTjVXa0RTTktpUCtEd2lYOUM4?=
 =?utf-8?B?YUtEbFJWaElYVFRBSjJKSitHaEZneUorNFVFS2JIczFqN3M0cWFoUXRoN0hK?=
 =?utf-8?Q?MTVcREIGO5sw+SYk=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f36974d7-4931-406c-43ed-08de79091865
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 09:41:50.6187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TLgbLJYniFHIsr/iYLktliSCru2mjmThmp6PlfZKauyPvBb/eS9Cx/v325NN83NQtd1hUspKjSbPV4gmzvtw/4l/YVTfXu2vxKFRP3zQWsM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5983
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: GCpZE5G-dsGlyq_B3S1ke1NzuhxjJ_I5
X-Authority-Analysis: v=2.4 cv=Of+VzxTY c=1 sm=1 tr=0 ts=69a6ace2 cx=c_pps
 a=42Ag0VRmng1YD8CjqzuPTQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=UMACq_wkDR_A01oR5XcA:9 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 5L1_UHCXMIuCHVcd65VkW6j043n-Q9xO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA3MyBTYWx0ZWRfX64jgyyX2tCyL
 X4u96lPmRyPB+JP1x3vBOjRsVhXETqsiav3yrE+XiCaj1vPlstLRI+MIcb/M2tnGUQTHbwcIyzg
 OUH9eJrCZwbxPisBmcaRmm+Mg3RPGAu2dD8CKP7okkmJoD1HHPtSFnG9sJzDE8sn3P34tUQXPPN
 OTcfUoCzXUNIVAHW06taKvMi4V96SAnGmlTGccC50pOiXPks2EcoFpm+5jHalHOcoZbHsfgZJrq
 GRj/HR0VDn0Db1VJXGNh9MidirmE7OtQdIkzQhWYWTNDvhPlR+IzLawY8VrfPgJAJbU1vv4LQtx
 rmwke1XWDugT3A5aVxEASkeiXPNAWaDiw0cVyn1Pdm+txGBKylrR8xm1zZh9b+eHPA5SPx8KzBg
 s/Ra1f4sKCejzoj5IJJ3Gh1MPEwznBxNojSXl3/oMukbxC/ItleOXQJuaMhNpcHtBKw8KnRozPQ
 GWW5alAysDlUzIrEZXQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030073
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 09:42:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232270

Hi RP,

Thanks for the comments.

On 3/2/26 18:57, Richard Purdie wrote:
> On Sun, 2026-03-01 at 04:25 -0800, Robert Yang via lists.openembedded.org wrote:
>> From: Robert Yang <liezhi.yang@windriver.com>
>>
>> The rpm 6 doesn't support external dependency generator. Oe-core used it for
>> per file dependency which was saved into pn.requires and pn.provides, but that
>> hasn't been used any more since 2012 (rev:
>> be40f6d0bb80274366af00461112af65687a4de8), and there were no complains or
>> updates in the past 13 years, so just drop it to support rpm 6.
> 
> This commit message is confusing. I think we need to be clear about the
> following:
> 
> Is this file dependency information written into the existing rpms with
> rpm 5?

I think you mean rpm 4 here, no, it isn't:
* You disabled it by default since 2012 (rev: 
be40f6d0bb80274366af00461112af65687a4de8), and said:

     Since few people use the per file dependency information, this patch
     goes for the faster approach. It can be enabled if anyone needs it although
     I'd mention that its being used to us as this code may well go away in
     the future if nobody complains.

* And even if we enable it manually, these info are just used by rpmbuild, 
others shouldn't use it?

> 
> After the changes, do we still have the file dependency information or
> is this being removed?

Yes, we will still have the file dependency information generated by rpmbuild,
here are related code from rpm:

     /* If new-fangled dependency generation is disabled ... */
     if (!rpmExpandNumeric("%{?_use_internal_dependency_generator}")) {
     if (fc->rpmformat < 6) {
         /* ... then generate dependencies using %{__find_requires} et al. */
         rpmlog(RPMLOG_WARNING,
         _("Deprecated external dependency generator is used!\n"));
         rc = rpmfcApplyExternal(fc);
     } else {
         rpmlog(RPMLOG_ERR,
         _("External dependency generator is incompatible with v6 packages\n"));
         rc = RPMRC_FAIL;
     }
     } else {
     /* ... otherwise generate per-file dependencies */
     rc = rpmfcApplyInternal(fc);
     }

> 
> I think you're saying there were no external users after 2012 but I'm
> not even 100% sure about that.

These info are for rpmbuild, there shouldn't be external users? And we must drop
it to support rpm 6.

And now I can't reproduce the build errors from autobuilder, I suspect it is
because of host contamination issues, I tried to reproduce it on ubuntu
25.04 and debian v12, but can't reproduce them, it looks to me that cairo.pc's
provides (pkgconfig(cairo) = 1.18.4) wasn't generate in autobuilder, but I don't
  know why.

We didn't get such issues in rpm4 was because rpm/scripts/pkgconfigdeps.sh 
didn't work in Yocto in the past, now rpm6 makes it work, so we got so many
corner case issues, I've tried do as many tests I can, but still failed.

// Robert

 > > Cheers,
> 
> Richard


