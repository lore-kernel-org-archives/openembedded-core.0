Return-Path: <Quan.Sun@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 807A0CD4F5E
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 19:56:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21331.1779307015539622860
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 12:56:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=cfp0Cppn;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=96008878a8=quan.sun@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KFC8dD2800048
	for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 12:56:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=uG+XGJbSbhM1AHSYEdlPQQLF5pXkiSNn6sXr2XZBjjA=; b=cfp0CppnRnaL
	OpCdJD1CkGiJMR7JNhz3sfTSHLNPjJxsEXsG/aidK23JRaRiy+xRTnAb9xCCoe9R
	ev/B4u9Eg0X9AMgqQCXZfoNB0xavtsc2oN83j9LTxUHxu4T86DbPO9BXsyL4/yKa
	EPDYgrn3AZpHiLrO97yB67h+Yh7CCei4iAV5evM3KQvduGD1kK+24oXRBqFyAptf
	aCde5xzlAF1Xzox1a0y+/v9TUluhkoSNcOiEWW+ZDbmfFap+6/WAT1UtzHOKrJ9j
	mlv+B+cWI2TMayH25ir5qWNGZeDW6CeCAKfnPTo1JwM0tz7MNDLHCydKjmQcP9Rf
	Jj0s6WxrjA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013026.outbound.protection.outlook.com [40.93.201.26])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6r3gdwjs-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 20 May 2026 12:56:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F4tN5lL4HrmFlsjspHrNm8pl2pvqAZYW12IVFIhRdOb1SMROPI3Z+zT3iS8SlUx3qN61sXpX7nGbmyaZp/ARRUZQHcO81hCklfbizu7V/FeEAQGe2PUSjkhSWEXfYE+yW25kBv/J636y4B/xnXp150LOSlaYX8bbMlAMqueYKLXPjzfQ2vUB1wrDWb6H8Npb5S40pSKDzsulGeC2TEv0h6pJvHfIEynUxVXGsYEeJzIYM86zL2GOuQTz99sSOBTdIrcPC56ir7XIYqfhvgwlqeiQGHrzERyENgDtYakdzb8wo1/jSh9Bnms1Dd2Xi9ngJyZKVJ8h9IFXQyuVbEovPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uG+XGJbSbhM1AHSYEdlPQQLF5pXkiSNn6sXr2XZBjjA=;
 b=Lmpl8C/NWA4TYysBbaQDfjiF2PuNqp2Sx03LodkcYX6pqyRc2fGkMAvgUmOfyQT6o3tSqIohN5Oshero48QXScqAVAnI/xpKApw/JaulcvQfm5UXlSPsdW4wMycVLCUXTMorByOmBvQKmKLmopdfKZRIk7jZLoupfgnKgRnDG5p0TcXgts1SaC8akwMGB9shVIUIl1NYf85GUTut98gszpustRhBGR2vQE2OXcwl3/yGN5edq/LZdhgreJdoYkVX/aaQUH8IEGJ2tGSB7HI0PSApkEhkWftW8HsTe/Yw/ERJK91ZXEULtX7XMo48bfgrWUgGkkROGrpZ8V+QQnn3kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA0PR11MB7283.namprd11.prod.outlook.com (2603:10b6:208:439::10)
 by DM3PR11MB8671.namprd11.prod.outlook.com (2603:10b6:0:42::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 19:56:51 +0000
Received: from IA0PR11MB7283.namprd11.prod.outlook.com
 ([fe80::6e41:656f:120e:8e8]) by IA0PR11MB7283.namprd11.prod.outlook.com
 ([fe80::6e41:656f:120e:8e8%5]) with mapi id 15.21.0025.023; Wed, 20 May 2026
 19:56:50 +0000
Message-ID: <720dff06-2728-4727-aaf7-c9b64072b5b4@windriver.com>
Date: Wed, 20 May 2026 15:56:48 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] qemu: upgrade 10.2.0 -> 11.0.0
To: Antonin Godard <antonin.godard@bootlin.com>,
        openembedded-core@lists.openembedded.org
References: <20260518180128.3661681-1-Quan.Sun@windriver.com>
 <DINJ544USQ5A.288HMM4BSCZ78@bootlin.com>
Content-Language: en-US
From: Quan Sun <Quan.Sun@windriver.com>
In-Reply-To: <DINJ544USQ5A.288HMM4BSCZ78@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: YQBPR0101CA0136.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:e::9) To IA0PR11MB7283.namprd11.prod.outlook.com
 (2603:10b6:208:439::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7283:EE_|DM3PR11MB8671:EE_
X-MS-Office365-Filtering-Correlation-Id: e33dee88-d15c-4c30-ecd7-08deb6a9ee8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|56012099003|11063799006|22082099003|18002099003|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info: 
	NwH2r72eL0UPWLl3RjZ1Nu0soeUkH4Ju4Vw9wSk1LSEcBgtl26CbMS9yKW5heoMaAhD4FNp6ynB+WSyWHCnFgtQ9WKVFUmZRpyXkJASIfSj6PmGquDUHmR3rm9i1j+w5mNR8vARErA360e+5iF41SJUXEJR3nlstSzwSwS63wPMsuAL8mWlR0cqNjEGVKDYKkSlyAI6mAt0oMQzqkpp/52oQ/msTU34JnJiy5ajgkDna3zAbhmocEe7nUdMUK26CooManFiASDAqT2Zp5YCG8Ot6DhESLNM4wxeHDup0yyUByF6JgPL4KaE4XAAEICk3samm/pPT8dy6hqq2cKGc4jO/U48SDUhZpDYiBhbgsxpXkoinDwdveTbEM0QOfSdaAxGhGJdtY7aVYUCH+76QcDqyC1EA6jDJIHBwf7iV7KifRLqGhSWc88/H3TxZFtjbVPHi9cCNH7xTKc+E2LHiio+06BmT8OwSCX912q4zAcPqn0RwMO40qN5GFEWMp+A/605sK10W3yJKzW4mShZmze+/0QfFG1tvgKwygDcqaTg+CjAlnlWJ9lKev++FwuQ0VXnaErf2zw+4E0NXUOvPOyPysNfJVEdEDrOGnZwtJJLeeOYNhr1YMxIPJkZs7WmrN1I+jlK429G8yjqNKYHfJQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(11063799006)(22082099003)(18002099003)(4143699003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bEl4cks1Nk1ydDRyWlR6elBHbHBMejBMSTEzNWl6R2NZUTBwWjVoQUx4a1hw?=
 =?utf-8?B?U2ZybmdkTUZSWnhiaHlWRVFXZ0xPTVp4N1Q4QTN6alhPaFMxbitZNnd2Qmsv?=
 =?utf-8?B?em9lZGxWY1RTRzZ1MEJodElsb2JNN216VldIUjE3YVNvY3JBYmtWYWdxUjNx?=
 =?utf-8?B?Y1pySUVRV1N4RzIwRmROeXg1MldaRVMvOHZGcHVibVZuQ1pGZTFlTzFJbk4x?=
 =?utf-8?B?Rm05ZWkrZDRIVTRYS0ZGYkkvd2xZd1YwQXc3YVBFYUtBYytReGhnTHJIUkJo?=
 =?utf-8?B?WjR3WFRLRk1aajk0b1VydlduczU4cG9PQmJKMlpqMmxSSVA2NnNrSzgxTTdl?=
 =?utf-8?B?UkhzalpHdXMrVkxPc2ZEazk3MXdTWVI1cUt3WmpEWDM4TE1LOWpJbDAxUDUx?=
 =?utf-8?B?T2NVZW5HRDZacXdPbXBoSWM3NkdYSGowTFFyN0Z4L2NqSmtYQy9RRkxxV1Rn?=
 =?utf-8?B?ajNNcFcxTDZYWVRjTFJDVmtqT3BscGJpUmdXampXbExqQWdvQnZERnZyZU9m?=
 =?utf-8?B?UVdlWWJ4T3BYNW5Wc3ZkRTJrYVYzOTFvOStxbGZqaDhJbDIyZTdjbkJDa0hp?=
 =?utf-8?B?NGVxUTEzM01ZS21GMHVuSUJScThtQzlmWnVMUFBFRFMwbEh5YklvazZ3YnJn?=
 =?utf-8?B?RmdvYU5aZ1hOU3B5cnRXMEtaTk42WHpQYUc3VStCZlo5NURhZ252S3N4WDBz?=
 =?utf-8?B?VzcwbVVpVEFSZ0hoZ3hnL1pSN1d6ZVAwUmRWK2dCVTQ4S3V5WjhDbFA3azcx?=
 =?utf-8?B?SHQ4bXAzUEdLUDZVVVd3RkpTckV5RGUxbW9MdDcwc2l3YjQ1cVVGN09NbVg1?=
 =?utf-8?B?T2dyVENERTdZbE1lcDJBa21lTm14MFBlWUthbU5CeFBnQ0pvRCs5T3R4aFRD?=
 =?utf-8?B?RHJnZmVqUzNlNkUyMUhNbVJIbkQ1a2RTV3JReU5SZTJZZDJWUm9ldjNzTi9q?=
 =?utf-8?B?c2dhSUdvYjhXekp6WmkwS1gyanpPdU1rUU81WFVodW4rOExxS1FtbGlqbC9J?=
 =?utf-8?B?M2orLzduSHVlWnYxZXFGR1dnM0RVWWJiK3doQ1YzR2pPalUxTWdEeHNBeGZB?=
 =?utf-8?B?ZGs5Y0xmRkpsQXdpcG1rdWcvM0ozMDNaT1doRUdZUkJTbTBQbk5yd0phSWY2?=
 =?utf-8?B?YmlWNnNSSWRnRmo5aDNremRLTm5oTnB3d3grdFF0bklqL09JdjRqdmh5TTly?=
 =?utf-8?B?S3Q3cW54OVVJbEc1ME1yRHdaQjcwS1NkbTREK3d4Z3VRM1RkYW9Lam5KdldE?=
 =?utf-8?B?aENOK3dtL1F1ZmVFaW80emsrOGNXUFAvMmFDL2NEOHJFZlFTc1I0M25mR20w?=
 =?utf-8?B?ekt0QXVRRTMwaU4xYkhpdGpGN3dQdW93Mmo1OXc0MkJjNFZDempnSGJERTdj?=
 =?utf-8?B?Z2VaQndlRVI4cEhCQ0ExVFBrdXZ2bHl5UGVyWm15NFQ3akdIYVJ5c05iaEFi?=
 =?utf-8?B?bUUwdzBpYTlub0ZBMHEwWmUvR2RrQXV3QldDNmdrdnVKc1k0aTJTRG45bmhk?=
 =?utf-8?B?RFhEMG16NWx6VTJicFZJQW11OWJsT3oyUCs0dzVUbHptaHdRejBoc3FSMmww?=
 =?utf-8?B?NDdTSjAvWFlYNGxxVXpTb1dOM1BlUW1vOXNLME5zNCs4VXBNM1Y2cHZ6THhw?=
 =?utf-8?B?YVZiTTdiZ2tJNGNFREIwS3RZbVVJcHJ6cTk2NlV4SkpYVnYwWXVvZ3BvWGdx?=
 =?utf-8?B?cU9NdU5jR1hOT2lCSmxxUW1ISjJ3VFhGYzRzT1JkNFVsYkF3VTBlc0NRVkJW?=
 =?utf-8?B?SGpvTDBaWUNVeWt0WEJNdS9aazNhWnd0UDNnUzRPemRhRkZ0eHpHN1FSV2Fv?=
 =?utf-8?B?QlM3SjIrZGVzOW9HREZoZVpkenhqUFdteDJjTVFDVUNhc3gvV1pwSTFjeXJ3?=
 =?utf-8?B?dlc5T3h5TWYrTTJSKzVCUWdyVkpxMWRqb1E1SWRkM0pNeWdUKzMxaFh4OWVx?=
 =?utf-8?B?eFQzRGVQN1BrTzBxNGppM2M4d3dBTlc2NFdMcjVjT0Q1cHVxZ2VYNGNTZkNj?=
 =?utf-8?B?bW95MUw5TWpVNWFrai9POVhIdU9sbjljZVNqVWJEQmpiN3AyQk5TTksvMXlP?=
 =?utf-8?B?VEFpc0pWejROYVZMdy9LSGtnZE9HZkFYMmd1OWxvZTlXUjdCUGwwWlJxNDAy?=
 =?utf-8?B?MFEzLzdYN1J2cmVERXBMR0dobDFaN1dmM0lGdGhxMmNyNHJkU1JqSTllNTZC?=
 =?utf-8?B?YmhJRENJcW1IVjJvOUVpUDJ1aUdyZ3M2d3JKRTlJVTV1Q1hHeW5WOHhaQ3FQ?=
 =?utf-8?B?d1ZnVlJVcUVQcDZ3QnVpYy9VaDVwRnlTMWc1dHB3QzVKQW1LWmNsYUxUUjRE?=
 =?utf-8?B?U0RGTHRTUnhWbGYraUJxQzJlcDIxWXpBaTB2L25oaE41TlNweHQ3dz09?=
X-Exchange-RoutingPolicyChecked: 
	VXIIzG4OdUzEQWrG4v4mbfVB6b6Pfu5UJt/dXXOzdWs/Wq8mZ1/olj+ONrw26gLmb/cdlRqAT9tYiGaPfHjTt4dhy2NGXI+O4ruBp278VkZtFGTuS5SrRupzmPRcrtrgXNMTK7oiASGl65k8KV7YEvSK2oj+dOJNrCrjlO2OXkbWLoJs4xHj1opnKzfcghQQJsPU+YdHWEWgfXOEOIvbS+Y0vl9XGaR32paDObSslFYPe7aEWWOKklZazxoaaxq9LsPnYXsHTVd8oGHrhqQG2yDMzO+27xxHL+xKj1zkez7nx7n+fm7/ssq5JGPH6vLNepzwV1dKu6yYFXwRYYkCfQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e33dee88-d15c-4c30-ecd7-08deb6a9ee8a
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 19:56:50.3476
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +JC6cbJownHoI1vhPYoWpRzYS1vNOIiwqF74bAEH1vuo9czxgxPDGMr6DGGyBltKM3LtsLWIEuYbZHIefvOcew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8671
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: ydQpmsMbmZknC91U0mFS-kU8cGP1TjPO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE5NiBTYWx0ZWRfX/O8uAb1FusPC
 T7yVCTMd2dm0BTtsaYiMRKbrefW6sTnc9e7/k1OFLlHA/5wMje07QhCNCusKZlHX7X8555QmwLv
 yjIXN9osJNhq4l4gJkv2or8wEDUhyXnGO+ufO9c3jGvMUwWU2aJpkwqZrKADWTo32KZt8Swmrsd
 nwzKcZ/46Kd5lvVez6zHED/fL80YTiIjEDmP/oyECWHTRX0GAbzcDMnUSNgOownKqDs+0+vgXQC
 bbedk/tsX8T6607T87HVpCOdewcqgXlVkk+jLCARpTxiIF4Iaj+l9YgrssVzsMyroZieYt5ZFIw
 4RFS5wyGHyD3VU3FqXo4OrZwbRiO9PyjbsTz96FndjYeufHY8t+MaZotPeotJC+hNV56sQweANu
 AozWcEMDVnM6Wwc3pd+X2gZ2mbyegPsGQJEezLqwl14x2RE3l7ehvYySZTwFsWLTNjlkvn3MbxR
 5coveoS/oYecSsU4CwQ==
X-Authority-Analysis: v=2.4 cv=I45Vgtgg c=1 sm=1 tr=0 ts=6a0e1206 cx=c_pps
 a=ThMr3hCQx13Nvzo14U/9jA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=iGHA9ds3AAAA:8 a=s-tpG7NXM6HUFm6zNbgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: f7sciDCmmSEUzO7eFSUevABqx5PRfz-o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200196
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 64KFC8dD2800048
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 19:56:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237466


On 5/20/26 9:14 AM, Antonin Godard wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> Hi,
>
> This update causes quite a few build failures on our test infra as you =
can see here:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3845
>
> Most jobs in red here are failures with building either qemu-system-nat=
ive,
> qemu-native or nativesdk-qemu, in different contexts. Can you have a lo=
ok at
> those issues?
>
> Thankj,
> Antonin

Hi Antonin,

I haven't seen issues in my local builds/tests, but apparently=C2=A0the Q=
EMU=20
upgrade to 11.0.0=C2=A0caused=C2=A0build failures across multiple Yocto=20
autobuilder=C2=A0workers. The failures fall into several categories, all=20
related to QEMU 11.0.0 having=C2=A0stricter requirements on host system=20
libraries and kernel headers than what the=C2=A0autobuilder workers=20
(AlmaLinux 8, Rocky Linux 8, Debian 11 - based on AI) provide.

Although most of the above issues could be dealt with by a modified QEMU=20
recipe, please note the
QEMU 11.0.0 has explicitly dropped 32-bit host support, which will=20
result in meta-virtualization xen-tools failure. The meta-virtualization=20
layer needs to adapt.

Thanks,
Quan






