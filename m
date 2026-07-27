Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11C1EC53209
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 23:07:23 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43962.1785193640707061174
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 16:07:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=EtZSmIYJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1668b11650=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RMagx71615328
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 23:07:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-id:content-transfer-encoding:content-type:date
	:from:in-reply-to:message-id:mime-version:references:subject:to;
	 s=PPS06212021; bh=/FeQa3Ove4SSnfFY2VX7G7b+SeJam8ugI7zYikBourw=; b=
	EtZSmIYJexKv7HSIpChdoFwiZ49X6fLH66fVHUDplWMoRCR81T0IhzI32e/D7/uD
	Xt8RBkRDS0F0k473vgJvZyMW8GahwPkjNnjgu6gC2/tRaQ+uduxrfOXZN4yMBIoc
	MayIFkUKVJ99zRNkWY/5SpQ8Kz6D60Rv2EToOTYoARUORoqnBxow5wJ1gfkCBTma
	8Mb2XCXzPSkHdsSqNajenJB4rWjvZqLQ3HJID53loU1hg7OnKF3e/P3gRvPNeSxd
	wj7PSKJajkyvPqxLjLX13FUA1MDljsZSOgY5bHpkNLPjHQxB2FQUoc2oNyfVy3Ix
	RPW7nxC3EJaIhLcTUKokTg==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012032.outbound.protection.outlook.com [52.101.48.32])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fmm43u2hj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 27 Jul 2026 23:07:18 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SpmiiEVPxe6WYV68zuZd5DDDqWiMjpZSCieJKlFeoMEsQqz3o4si0cGQJd2GKRPycqhBEc9FD/Neej0/psepz5qc2OqfA2N9Xy/UUkXPmV/nSuUFwm0CnMI++dxywRZIWiD8rv6vBN2ns1/8m6VYtGPgf0ALjBidiuUFGiiZwEK3cOP/Riyo/gb+VIiFyBKDC5kgilrQiNqVn9dAM4vI3CFn+Nwb6VzMpX5r7+eWivKiESRXG6B6UV9SNjIcxWnwi36ELwcvUlr5XiTatRG/1v//1kHAeEymi2iYq3sOsa2uEBMShDLw04w2rjMOu3pIc0LhAyrAziKYREzw9tsTvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/FeQa3Ove4SSnfFY2VX7G7b+SeJam8ugI7zYikBourw=;
 b=Atk68+yS9FcPrLCrT4huBEr1T1TooxwhlNdvcYslEwIGL41UyPcM4ZtNdeNuPjgh4aYtBEPDQdQZxJkM4YAJPIF3fJG4DwRl/Dc6obyDkhY7a14WR2hW2lgjJPt9MvDBeISso5Y2e2M08bv2UDLt76uUvBU09PB5nCsIIEDtR/eKeXRXUuXT0f84EL9xCsUGTHykpomvsHq2S29PBYNyLCCMBVSy73A8fp8C6Nm5egwWFRxKhOsKoIazZ0eeJEP62ql0LDPv4dYM+L1jtut6J9P+83Mwq2avh7K1nuz5KTfwN+uBBMCjRKHQCqEcyQoAwBf9mWO71aqsgvEZPMWAPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by CY5PR11MB6511.namprd11.prod.outlook.com (2603:10b6:930:41::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 23:07:15 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 23:07:15 +0000
From: "Gavini, Sumanth" <sumanth.gavini@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "alex.kanavin@gmail.com"
	<alex.kanavin@gmail.com>
CC: "esparlin@cisco.com" <esparlin@cisco.com>,
        "mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>,
        "mattware@cisco.com" <mattware@cisco.com>,
        "peter.marko@siemens.com"
	<peter.marko@siemens.com>,
        "MacLeod, Randy" <Randy.MacLeod@windriver.com>
Subject: Re: [OE-core] [PATCH v9 0/8] rpm: 4.20.1 -> 6.0.2
Thread-Topic: [OE-core] [PATCH v9 0/8] rpm: 4.20.1 -> 6.0.2
Thread-Index: AQHdG6enZtkcyfb/8kevf5UeGAyW97Z/3xwAgAIi6IA=
Date: Mon, 27 Jul 2026 23:07:15 +0000
Message-ID: <bb92560c-11aa-43e9-ac8a-18453333a3fa@windriver.com>
References: 
 <CANNYZj-hrPf-CVJwTaEJ6dgUuWnipYKKiPZ3r_t1_HPYhCKvYg@mail.gmail.com>
 <20260724200424.954199-1-sumanth.gavini@windriver.com>
 <795cb8804b9aaed451b12b6691c2f0d584e9bb62.camel@linuxfoundation.org>
In-Reply-To: 
 <795cb8804b9aaed451b12b6691c2f0d584e9bb62.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9256:EE_|CY5PR11MB6511:EE_
x-ms-office365-filtering-correlation-id: ac30e1c1-9d64-4294-22be-08deec33ccb4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|11063799006|56012099006|10067099003|18002099003|22082099003|4143699003|38070700021;
x-microsoft-antispam-message-info: 
 3fSmUhoYFYIkutMML+NtBqvNSvLgiG0nXejSY7GzkppPTjlqccJN/eZoupr7IPbrTE7bO6VR7NeP3Ju6jyqu64mrPMpL0yRxosPVzKZdAnwoScNvj/B6mBxTBcf81QdDh+BMLTX6OwHYJcDww6CMu9yBuyN3vgO5As7gdxiL7zBTC81te0zZVcdEJMRCzPMCv7hDYANW8D4wSVsJhCi4wYwFtbEagsZ9zb52q9v4QRUsckWX/IGvHnjQXJ91DLjPy7KE59xThYNe2864BF/4lFsIxsVsNaZlrZwaGMtaqIlFWdtr3ynUBWI0E1joHO2JTY1ipgUXM10cum0p+QZsu/6uVKlUCFBCuCrNiCaJi+F7NsCMYboXpes4JwXGiTfbUX/x4Fl0RMqbERjiebHOZePX5oIbCmQyLgylFs0hiVvGOPtEMa4ZjaXS93lOz+318M0NpKYJEu1rK7/y6GD14yHEXSYHNTi3RuhedzBBZ2cNyOipyIBQddKba+SgNoaGEWSj0PWyg3ffAAgrO8Um/dtOf6qeHHITSYrshW7dYLX9t70WG9SmLPGHGd/co3/SkM7z9QpGKtpUDea0J8APuy+V5g7RVAjlgVn4rcsZ7VxkVcQlQsIU05nP5bJ4WfcbBe9r/jrKlgzUpOF3TjPXNN84r1Jyu5qlcz9KtAJxl0g=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003)(4143699003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cjJQRkw1bHV2WVhtWVdEeVh5czZqUHFKY0lubWNFcTF6RmE5OUF6YXgzc3M4?=
 =?utf-8?B?ZjNZcmlQeENPbkFBakxpNXdqMTJjYnBkS2JHOCtIZ0ZOaDhUeXNMQzNaeVFR?=
 =?utf-8?B?cGRPV3lQdzVDeGNIME5Dcm13RnZXVXBhZllmZDBndGNIb094RmswLzlsV1g1?=
 =?utf-8?B?M3VKWlhQNnFRU1BjZFhWYldIMlZ0L0ZoNldTdzhuaG1ic0RWeE9HSjd4S2xs?=
 =?utf-8?B?SGp6KzBWK3V6azN4Um1TVU5Mc1kwOUFXWEFnWTZKczJMWUVTTXJ6b2xCd2Fk?=
 =?utf-8?B?TGgxbk05RXFzS2Rod2xVRS81LzE3U1ZKMkxwa3NBa2pva3JlMm0wOFowd1BI?=
 =?utf-8?B?cGI1VURjTXBsNjk1d3FrbEYyVGtUYURPOHUvUG0rK1F0ZzAwd3RPVUJuOGI5?=
 =?utf-8?B?MktRNTJVMFVwUitSN1hMNDdlYUo1bTJvUlI3aWNFdVVNWlVYUHJQYnMwMlhM?=
 =?utf-8?B?MzVjMTRTcDB0UHF4WENxLzhWaktOcnRrR3ZPUlNCZnJ3b25zMUpBOXNORit6?=
 =?utf-8?B?ZEpwK0N2VVRKWURCZHRmR2huZENOOFBnRGNDMm50ZHVJTTR4Y0ZVbThBZXhx?=
 =?utf-8?B?Mm1FZmVMa2EyVjhoMy9jVW9jb0tUU2tUYk82MTRLbHlmdHNWRTR6ZXo1L2VV?=
 =?utf-8?B?RytsYkh5NUVGcVlvWTBIYmFGYjkyY2pmbC82MWZVU090SXl5MkFGRWV0b3pp?=
 =?utf-8?B?bGFEM1JJUEtiNit2YVpEcWxucjY2WmRqbXNBUEgvQVJrMTRMYU5ISnpwUjJU?=
 =?utf-8?B?dEF5TlE1cEkzbERocnBSc3NmYTQ5eFErNkN3QTYyWXUzQWdUY25iWVdUeE1S?=
 =?utf-8?B?dHJKVERXa05HUWdGSU9WcWhYZ0xOZ0pNMGJDY3h4V28ySkFsNEs2SWlZeU13?=
 =?utf-8?B?OU4zcE9YclllcTdRNGN5SWJJL3p0S0dmVGY2cW1BMTFPSi80YjRNWXF1TVBy?=
 =?utf-8?B?SUZjY1h4RFRNeWJVVjRhcC9UZXdiekNSbzBFOFdIMmR0cHdOZHIyUE1EQVBt?=
 =?utf-8?B?czByQjFBNVp6bXlNVjhKV3BraXZhNkI1Nms2eVU3RWRtUEZ2YTdzbVlQRXpy?=
 =?utf-8?B?TkJzbVlrb1A4Vk16YWYvSjQvYXovaWNLQUc0UGo3KzlyU1lCMWMwZk5PWFRy?=
 =?utf-8?B?V3NQUjE5eUlDU2dZREVaSXY3cFVlSDRrQ0ROSlkrRDJHYktxcC9yTUp1bGVl?=
 =?utf-8?B?cWdkcU92WWpBd3ArMG9rSTFEVkMwL3UxemcvVFcrNHp0Uk9QM3VEMUtBaGhP?=
 =?utf-8?B?eVhJVmgwZWVuenAwTm1Ha01BQnNiZVNKMG8xTlFZeDh4b2VjM3A2blJFaVp5?=
 =?utf-8?B?eTJzeHdhM3A4dStsdWNUdGxackpGYlg5akM2M3NZb3VBRWZRZ3gybWZJNHdq?=
 =?utf-8?B?MzI2ZWlpNTZieWNyQ2NRVnhDcCs3cnRrSGN6aUJrRFVyMkdpZ1VnM0pia3Jt?=
 =?utf-8?B?Njlvb1VpUUtUMEMyS0E3VWdKMVRhTThlM0JVSS9vUytIVjlZL3BZY3kyV29E?=
 =?utf-8?B?NWlBQXh0ME9mQldIWE55YmQ4R08zZ1pERDlrcGs3eGd2ZVI2SlpZTHVXQjhs?=
 =?utf-8?B?S2pzZzhYamVMeEErUDhRMzZSNnV3bmt3bG43bXBtK0EvNDR6V1NMSzk0NTN3?=
 =?utf-8?B?VS95ZDAxNmd3V1h1MmR6cGwwTTNyc01pMHpHT0d3MkdVR29ZSkNha1NyTEVR?=
 =?utf-8?B?alZUV0xWU3NDQUFVZlB6YU56K3FXa1ZJU3gzNCtta1liTG5IUlkrbE5BMlJO?=
 =?utf-8?B?VTc0emVvbEJJVlhqQ0VxSy9ZWlk1K2VMWlBvOWR2cTE2UmZhS2ZldjRQOXpl?=
 =?utf-8?B?dTRreGRpQUpxSklBTmg1ZDdFeDd0eTM3cXlFQjI3NTFHbkpuSUZ3c29WWFo0?=
 =?utf-8?B?Q2llMWtkcWc1ck1qNzZjb0F6NG9ldnFtbmlaTWpMWStkOGpmN0s4Y2lVcGpQ?=
 =?utf-8?B?NURQQnY1TzRjditYcUpjZ1FmUjRpNWJjMWJ5RUJGTGthRjRzRGNZQkhITTJ6?=
 =?utf-8?B?NTZWMS95T0VQREZyeUpPTHIyTytOdWhrdXhJM1NDbllTOWZhL01nSVYvb01M?=
 =?utf-8?B?d3k3WEwwcnFlN3p3RUpWeFZKbXRMeUpETUo0ZzVuWU4reDBwcmJRVEdkRXZB?=
 =?utf-8?B?clZORWZIdk1wQjFITHNCSHV2Qzk0dFliOXd2ZGxHUENGSnJFakJEMCttZnQ0?=
 =?utf-8?B?UzA3ZkFCSWVvS0Q5bHpkWXc5NEMwRmxQQmZPOTA2bTBYSjJRTFhwRjIvTzN1?=
 =?utf-8?B?S1BtL2I5ZnpzM0tFYUV2clgzR0x4VEdwOHh3MEJMYnF0aUlWTzdwVmNvVVVo?=
 =?utf-8?B?eFp6Uk9LNi9aUFBzOUIwV01CU3dNQVVURGY1M3g3K0hqUkNzVlJWY21RRkI3?=
 =?utf-8?Q?lg/UJj8acIGOytiQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4050539954068D4F8DABB349CFFBE715@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	o89RLg1lmn8eWVo/G5ar4TQ5KN9ZUK2iuwBBDxN5bJ+bazz4mN6+ojcB4mIEhG7qdL7bMhzrS/75hgPaTUnAGM8Q8WYPDTkY/+o1VbMjJs2D9FvRCY2DHsId7d0VUPntAwbnSfxGq8HG7jXQ2RVknaS+AVCbTGtoTTKahQ96hc0PavX1eZ84A+4zrD3ZMF+IzN1XYasODPSNIDbLyWSpWeTpfSNme8d81sERB7a+HQp61iQWEbSgYSARBMzioSm+4KOpSfkvOKv8vY+GY/EA7LJ3BaWMSQhdW/B3h9E4Dp8v10HMINOEFTPN1hrWNHCSgn0COXcuXo9k5KmajNdaDQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac30e1c1-9d64-4294-22be-08deec33ccb4
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2026 23:07:15.4515
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cCzDDnCZLP8Da6Vj90tCX+UC07jk2cVBrvnImCW+VFs8sFLbTs2WDdCq42UGwpuDhyJvhPNKFbBx/+5AhhvT+jJC7PaTGgnK5gWgpurwYds=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6511
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=I/JVgtgg c=1 sm=1 tr=0 ts=6a67e4a7 cx=c_pps
 a=NeHo0b9PnFRHZsaa1SN7PQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8
 a=HSGGmyHZbMZctkrEnfUA:9 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: aATSsS_Mg3RDUpKHZpj8S9C8e8CZUZHa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDIwOSBTYWx0ZWRfX6tIlmMuxIZB4
 rrEtjT1CCSvPITw/mXwFnjDHq6+vu79uQMur3bA7nqzB+5U4lvDMtpTjTqwaUohyDtBuNSTh5Lx
 5ImZI2A+Y8iBm2eTUvOKCCsv/fOkdcNF6DEgXyk4A0a5ETEA5DFwpxoFIa7WAgzT69QyVX8zQ6D
 tIpegTaPDtsJZhlFINuapZORFmw9B2QwqZjSt7w/gjljD91b1+IhUWHfOiEy9b7rxHb6mLPUf2N
 EjY6JZ2Qp+5jT5r0853mjW7HivTS2pCYSH6+8gqccyV3p3FHTlZga26YBLQPwzNqfUgnF/dgxVq
 T486Hm96NLaEe3neoAMhwxTUuISpR3yfnvidwiGgVDdq3/RR+ilmgWaOY13GiZA2B3cKkY/+alL
 mT20iLilFu+PUeSWgtiLTLnyKn9dqTOCiYfdraE8B09NJH3PZ9sx0B1C1GwUGlEA3VGSTK26Hfd
 R2ZIziqH1QThNR+0fFA==
X-Proofpoint-ORIG-GUID: GPK53R4ZdkjYytEogqqRiurnWG5Asj0Q
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDIwOSBTYWx0ZWRfX7jmLyIbYDWN9
 bplxDq2bDXIL+4ejy14g1pjMArvGXCAbqa+NOiyqv93orl6Cyeb/147wNQ/PGFIxAe/sgfDv8cQ
 7Bl3npfckfxxmNOJbabr3GBYFvv3y8ozQvTqXYNTw6+0n1am+6Xl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_06,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 phishscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270209
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 23:07:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242154

T24gNy8yNi8yMDI2IDk6MjkgQU0sIFJpY2hhcmQgUHVyZGllIHdyb3RlOg0KPiBDQVVUSU9OOiBU
aGlzIGVtYWlsIGNvbWVzIGZyb20gYSBub24gV2luZCBSaXZlciBlbWFpbCBhY2NvdW50IQ0KPiBE
byBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IHJlY29nbml6
ZSB0aGUgc2VuZGVyIGFuZCBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUuDQo+IA0KPiBPbiBGcmks
IDIwMjYtMDctMjQgYXQgMTM6MDQgLTA3MDAsIFN1bWFudGggR2F2aW5pIHZpYSBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnIHdyb3RlOg0KPj4gKiBWOToNCj4+ICAgIC0gVXBkYXRlZCBTUkNSRVYgdG8g
dGhlIDYuMC4yIHRhZy4NCj4+ICAgIC0gSW5jb3Jwb3JhdGVkIGFsbCBWOCBjaGFuZ2VzIGFuZCB1
cGRhdGVkIHRoZW0gYXMgbmVlZGVkIGZvciA2LjAuMi4NCj4+ICAgIC0gRHJvcHBlZA0KPj4gICAg
ICAwMDAxLXNjcmlwdHMtcGtnY29uZmlnZGVwcy5zaC1Vc2UtcGtnLWNvbmZpZy1mcm9tLVBBVEgu
cGF0Y2gNCj4+ICAgICAgZnJvbSBWOCwgYXMgaXQgaXMgbm8gbG9uZ2VyIG5lZWRlZC4gQWZ0ZXIg
ZmlsdGVyaW5nIG91dCB0aGUNCj4+ICAgICAgL3Vzci9iaW4vcGtnLWNvbmZpZyBmaWxlIGRlcGVu
ZGVuY3ksICJiaXRiYWtlIGNvcmUtaW1hZ2Utc2F0byAtYw0KPj4gICAgICBwb3B1bGF0ZV9zZGsi
IGNvbXBsZXRlcyBzdWNjZXNzZnVsbHkgd2l0aG91dCB0aGUgcGF0Y2guDQo+PiAgICAtIEZpeGVk
IHRoZSBmaWx0ZXJpbmcgb2YgdGhlIC91c3IvYmluL3BrZy1jb25maWcgZmlsZSBkZXBlbmRlbmN5
Lg0KPj4gICAgICBwa2ctY29uZmlnIGlzIGEgYnVpbGQtdGltZSB0b29sLCBub3QgYSBydW50aW1l
IGRlcGVuZGVuY3kuIEZpbHRlcmVkDQo+PiAgICAgIHRoZSAvdXNyL2Jpbi9wa2ctY29uZmlnIGRl
cGVuZGVuY3kgYXV0b21hdGljYWxseSBkZXRlY3RlZCBieQ0KPj4gICAgICBwa2djb25maWcuYXR0
ciBmb3IgcGFja2FnZXMgY29udGFpbmluZyAucGMgZmlsZXMsIHByZXZlbnRpbmcNCj4+ICAgICAg
dW5uZWNlc3NhcnkgaGFyZCBydW50aW1lIGRlcGVuZGVuY2llcyBpbiAtZGV2IHBhY2thZ2VzLg0K
Pj4gICAgLSBSZW1vdmVkIHY4IGxpYmFyY2hpdmUtcmVsYXRlZCBjaGFuZ2VzIHNpbmNlIHRoZSBs
YXRlc3QgdmVyc2lvbg0KPj4gICAgICgzLjguOCkgYWxyZWFkeSBpbmNsdWRlcyB0aGUgcmVxdWly
ZWQgdXBkYXRlcy4NCj4+ICAgIC0gRml4ZWQgdGhlICJvZS1zZWxmdGVzdCAtciBkZWJ1Z2luZm9k
LkRlYnVnaW5mb2QudGVzdF9kZWJ1Z2luZm9kX25hdGl2ZSINCj4+ICAgICAgZmFpbHVyZSBvYnNl
cnZlZCBhZnRlciB1cGdyYWRpbmcgdG8gNi4wLjIuDQo+PiAgICAtIFZlcmlmaWVkIHRoYXQgcHJl
dmlvdXNseSByZXBvcnRlZCBBdXRvYnVpbGRlciBpc3N1ZXMgYXJlIG5vIGxvbmdlciBvYnNlcnZl
ZC4NCj4+ICAgICAgVGhlIGZvbGxvd2luZyBidWlsZHMvdGVzdHMgd2VyZSBzdWNjZXNzZnVsbHkg
Y29tcGxldGVkOg0KPj4gICAgICAgImJpdGJha2UgY29yZS1pbWFnZS1taW5pbWFsIg0KPj4gICAg
ICAgImJpdGJha2UgY29yZS1pbWFnZS1mdWxsLWNtZGxpbmUiDQo+PiAgICAgICAiYml0YmFrZSBj
b3JlLWltYWdlLXNhdG8iDQo+PiAgICAgICAiYml0YmFrZSBjb3JlLWltYWdlLXNhdG8gd29ybGQi
DQo+PiAgICAgICAiYml0YmFrZSBjb3JlLWltYWdlLWZ1bGwtY21kbGluZTpkb190ZXN0aW1hZ2Ui
DQo+PiAgICAgICAiYml0YmFrZSBjb3JlLWltYWdlLW1pbmltYWw6ZG9fcm9vdGZzIg0KPj4gICAg
ICAgImJpdGJha2UgY29yZS1pbWFnZS1zYXRvIC1jIHBvcHVsYXRlX3NkayINCj4gDQo+IEkgdGhp
bmsgdGhpcyBzZXJpZXMgbWF5IGJlIGNhdXNpbmcgYSBmYWlsdXJlIGluIGxpYmFyY2hpdmUgcHRl
c3QgYnVpbGRpbmc6DQo+IA0KPiBodHRwczovL2F1dG9idWlsZGVyLnlvY3RvcHJvamVjdC5vcmcv
dmFsa3lyaWUvIy9idWlsZGVycy81MC9idWlsZHMvNDI0MQ0KPiANCj4gQ2hlZXJzLA0KPiANCj4g
UmljaGFyZA0KDQpUaGUgQVJDSElWRV9GSUxURVJfUlBNIG1hY3JvIHdhcyBjb21tZW50ZWQgb3V0
IGluIGEgcHJldmlvdXMgbGliYXJjaGl2ZSANCmNoYW5nZSwgUmVzdG9yZSB0aGUgbWFjcm8gZGVm
aW5pdGlvbi4gVGhlIHB0ZXN0IG5vdyBjb21waWxlcyBhbmQgcGFzc2VzDQpzdWNjZXNzZnVsbHku
DQoNCkkgaGF2ZSBzZW50IHRoZSB2MTAgcGF0Y2ggd2l0aCB0aGVzZSBjaGFuZ2VzDQoNCi0tDQoj
IFN1bWFudGggR2F2aW5pDQojIFdpbmQgUml2ZXIgTGludXgNCg0K

