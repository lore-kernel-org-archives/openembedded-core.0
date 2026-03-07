Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFB15FCB602
	for <webhook@archiver.kernel.org>; Sat,  7 Mar 2026 15:22:37 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10789.1772896952644072696
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Mar 2026 07:22:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=CONsBkUq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=752655555d=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 627FKslQ2482755
	for <openembedded-core@lists.openembedded.org>; Sat, 7 Mar 2026 15:22:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=6F1dOYRm93EiKv8abhfZ1yHHHQcW0NOLiSbplxiaCd0=; b=
	CONsBkUqZnWtBCqdUV7Nb1zGR9USKI1mEnYyMBPiv0rQvTUMj6b9pHmN0AM8Yhqf
	Orzv/CA/rztZMvfV5Hy/kIIDst0dhcA4piVYayYO4nB+GJEOmS1FCHKmaNBo2mBg
	HMicStdaluqj9I86RgdbsUtKXz2hq7LSGy1mrMUuNdA2237mLxzNMxikn+pq+DQB
	ydACFEzUrP1caInYa36iPT1qfS4foVfhWRY7MKzj94V/JI3O0dv7KG/uiaq9hXdg
	h/ZfCMNYPru7kBkZIVBTP9Mw/zu8SwC6E+CJANLFstmskpBkD60qRgYsYSPkTUsQ
	kCJuIg6Io0WQnaGLmN6R/A==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013059.outbound.protection.outlook.com [40.107.201.59])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cr97v8fwe-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 07 Mar 2026 15:22:31 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rWEFlIcfmk3oKJWm6Fg4oG7p+O+3XS0ImQQ9YdrfP7yIGLJ0+CVR233vTYrjmwEMfxjUhxsCqTX2gfQVSsVoC2OxBVXo2POYf35UFOCdjcm0knvrjq7EQDYAgZWrswA2zWMg/zi5eHcyGrOXmMe1Vp/+Sh5hpHJQRxbi4e7ecqWDiypVDu6IiIhjRMTY19zmM2W/5i4EHzub1Yh60qLaqFaEqINiknWzkUoZVD219dMsRwphc2RHnQa//Gs0Qg6KIRmbGt1Q5/WAUnjddYm8yLn7H9U2UQfhcpsH7TVtP9GpKCJFjy7HV0CPufGH7A1EOzPvsV3SNO0Jk1WS/Ukn1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6F1dOYRm93EiKv8abhfZ1yHHHQcW0NOLiSbplxiaCd0=;
 b=IatcRUMjv/PiyK5eSE35WE8pSFOqZl1VVk9+eKeJ6Lh7oygRR1LslzlKgzx0Ctcyp6+SEOfcfvh8E/0qYYwjZr6Qy5IU1hyMpGeiKqCApQgtU6W4fb7PUukXg1h5kqfPZzL8Jh8aoIap4tV4nVWKxdfTjvA1bpj78nX/aEWF0wG5qpbk+6f3lnG7Xnjh4GprvcD4MvQVjTCcfB1sAC5cv6xTlOuXAKqnlOXow13Rpz6CTuf0sFMlt8/UyfwAAnLA4PMCQLzPFd3l3kKvWHaQSa65s0CF0fO0EYHDNuU8WH1wuSlNJdz+la33Ajfkb4tpEzxsJLoyt7JH5aUv1cOuFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB8527.namprd11.prod.outlook.com (2603:10b6:510:2ff::9)
 by SA2PR11MB4892.namprd11.prod.outlook.com (2603:10b6:806:f9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.6; Sat, 7 Mar
 2026 15:22:28 +0000
Received: from PH7PR11MB8527.namprd11.prod.outlook.com
 ([fe80::43b7:b38f:e039:a5ee]) by PH7PR11MB8527.namprd11.prod.outlook.com
 ([fe80::43b7:b38f:e039:a5ee%4]) with mapi id 15.20.9700.003; Sat, 7 Mar 2026
 15:22:28 +0000
Message-ID: <e85b7909-392f-4fb1-a463-46a09484060e@windriver.com>
Date: Sat, 7 Mar 2026 23:22:19 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v7 1/7] package_rpm.bbclass: Drop external
 dependency generator to support rpm 6
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: alex.kanavin@gmail.com, Ross Burton <ross.burton@arm.com>,
        openembedded-core@lists.openembedded.org
References: <cover.1772367692.git.liezhi.yang@windriver.com>
 <8e2bf6e0befe331a0f834687317a3dcd2d735b92.1772367692.git.liezhi.yang@windriver.com>
 <2bbd3ebdc7f525fc5fdb5848ec6d80c70dbb9e22.camel@linuxfoundation.org>
 <86d3c351-16e9-44bd-8b38-b8c6ed75aa0a@windriver.com>
 <e4bed048-61eb-425a-a3bf-a3906145938d@windriver.com>
 <DGU6U0PB5R0J.2FMV5TJUWPZJV@bootlin.com>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <DGU6U0PB5R0J.2FMV5TJUWPZJV@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-ClientProxiedBy: SI1PR02CA0021.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::14) To PH7PR11MB8527.namprd11.prod.outlook.com
 (2603:10b6:510:2ff::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8527:EE_|SA2PR11MB4892:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d24210f-023d-471a-6e46-08de7c5d57c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	YCUcxJBv58UgChtv89OD09NcWvMzwY+1DH5XxokiWbEuAGbU1fby3zR1d+ygZp9bD/5DNyP0MJf3DSa6QVuula/5JYTv9sRZKf2eRKfSNXCMAOkdYRJQqNUH5ogp2Yc2Z+2X8BjicnJs3JIz4HdSt/WW1bu3JLw9M3u+UIkfD6FEC/fR+SeDf1Eyf3R53nEZTc9E2hd7zz1QD5PbDgI3xHOOa/O132Y2SkEAnDBR96kVlntmilH8OxdA26Tvxd06qRuXU4nUgsY5Uzj6oCYhgPc6C3NcXcA8YYYgFq3HWN7A5POyY0lHlZ4ha64c6UIuplxwnl7AkHCC127jm4DA8sgclKUULWsWej7OCdv9Y947Sa36MWhggJZMddiqZOVRdSGuZuogtbXApBNkWSkGVg7wWF4VadPvA/PUwSJ727xupOKiyELS8IjKmVn5dN3/tVopv2wtvxGrTOa9jHyE+E25tJMH7C503JrEWrZbohERQ2a6s+/vHkg8xM/loVOwX3NsMQZORsIBO/2dJgbnIVdH+oQfuXUYAbm2hW95vj/IwKYUG1Ig6nYolrNPf8dCs4eDqERwku18fIpMPmrkxzrSoOqhz6fJ2fCGqphio9RztzSbTbJJYFWkJDN2SpMH/ht2hWgQ+KKWZL9tZLO3N2ks5VkONRTaSiDq6ulkCdVte+dQfUbaLDIMX6/kPrQ3
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB8527.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?T0FYa3pjSGJqVUFJcU9JUFIxeTJZcEZrc1NERkEwQm9JQTR2R28vcFlqU1FQ?=
 =?utf-8?B?N3BKWFhFdzZ5RXdyRm9hZ01sNkJUcjZtWk1KRHk2cTZMVFdiR2QrOHlySFV4?=
 =?utf-8?B?dEdiamJCN1h6Wmd2MGd1SVl0cEM0RGlLWTYrUG9TR0xIK3p3WVpjWENlTmxK?=
 =?utf-8?B?K2U2SUxCenYvcTZhNU9qKy81c1l2Zk5QOExvWlFQcHZMWUhFcCtPbW9KYzBl?=
 =?utf-8?B?V3FUNk9kNW15VEl4aS9FVmpPbFIyeCs5N0NDcjRjaGpEVHFuNDZIR3psdHli?=
 =?utf-8?B?S0dnYkVjeDFCbFFCZTBYbGxmZGo2U3pRbk5aRHpyYmpZZmpGVW5tamNzQ04r?=
 =?utf-8?B?K1Y1cWZ2UzBvSzRBUFlvOVBzY29CZFpQQXE2TFR4dmJBWjB4RGV3RGNydDJa?=
 =?utf-8?B?bWVHb3VJVHRjRENuT21sTS9IYXBGMWEyZkE1blNWTmp4bmJTQk1TYzNWUWZl?=
 =?utf-8?B?dU9JV21lbmZsdmhFeGYzei9naXBjdE5BU2xkWlo1aTU5T25vYm9XSU1MVnBo?=
 =?utf-8?B?cndmb2pWUFVIMVB4aExVdHRmTUU5cldDZU8yMW9ySWUxSlgxa2pVNE5aOTA3?=
 =?utf-8?B?TWJkUUNJQzRvUWF3TGJCc05GUURmelgxTWtTMkw0c04zWTBmbXpuV1pCMHJI?=
 =?utf-8?B?TlpsTnlkVFNTbzN3eVZkb1N4OFowbjlRcFF0RjUyTUVzQ2VkWS81SXZQYW9n?=
 =?utf-8?B?WkZVb3hGYUVMZTg4cVIzM0lObjI0TTd0cDU3azBQSjZJb1lFVVpaZGlJU1M3?=
 =?utf-8?B?N2dlcVE5MEJoUmVxVEg4RjlOczVCN2gvbU9meHZ0S0pHU3ZUWG12NmVVUVJk?=
 =?utf-8?B?YVJxa1N0b2c3UHQvVDExN3cxdWF3Q1kxZlA1ZEpqR3ZGSWp1Ni9kcEtYSWhW?=
 =?utf-8?B?UUxGNFpHKzF0ZEVQb1FNWFFtWWF2Mi9xdnVVaUkySGpuVk1VQ0FVamp6SXVG?=
 =?utf-8?B?VkRwL0tCQ2M4T3d3NXJmYVBYS0o3NS9UaisrNkpsSUFoK2hra3hmTHRaTFNC?=
 =?utf-8?B?YzBBcW52Q0VHTlJRWFAzTWQ4bHpOU0hjOGRoRWJpajQxT2k5dDNyMnpCM3Zp?=
 =?utf-8?B?QzBiMExOZjdqV2kwYVdjdDNoWFlibitmcldXOUxEbnliSDZhWG9zVVhIcWFQ?=
 =?utf-8?B?ZG5nRXFWZ3NwWGFjay8rd3Z6dlJydGI3YVJxRU5LRUtvWEFPS09CdW51eDJJ?=
 =?utf-8?B?Qk54Y0g3L09qYzNuRGlzTXJsaGdncU5pTllra2xlbzBkWVZ1SkxLcXpsdVZk?=
 =?utf-8?B?ODBoT3JQRUMvV1puM0hBVFE5b1BhdWxEajNyclM0YzRCS3NtTE8zb1lIdnhF?=
 =?utf-8?B?b0FtNVg2cThDZlBKb1RRZ2dkbG40SnA4aitFa0dLZ1BGQzV4ODgvcy9OOXBa?=
 =?utf-8?B?WGw1V3JTKzAzYktlcWczYW9wN3RxK0daS3lEellMOGUxM0RKclM1VWViUnBo?=
 =?utf-8?B?SWdxb2k0VmM2amRHTzdjL1dhbytLUVlya2ZnT0dYSndPT0YwNzE1U0hlSWRt?=
 =?utf-8?B?dmh0amU2NTVKckUreE1ONENwOGUvQzlSdnoxR1ZsbEFaalIyVFdMVG9PWk1y?=
 =?utf-8?B?ckZDYUVQZCs1Y2x6WW5Vb2tIalRHSGNPRnF5M1d5akcvOFhMbmUrV2ZJWjRH?=
 =?utf-8?B?RlI1U0JFMUFsTC9QZWx4bjU4NFhaVElyaFB3TTZRNnJzU1VRdm5HdVhqZEJx?=
 =?utf-8?B?bStDRXBCTm1ScTZWV1JreWpMaEUxSC9HRGFHSTRuampjVSt1eW5XZ2l4bndI?=
 =?utf-8?B?ZTNoaHRSRVFjdHVYRDBrSlJHYTVhRDNzTzlEUVlVdHpOWjNKVUU5Uk9XWms3?=
 =?utf-8?B?aGUrQ2k2dHlJVzR1SmlXUTVTN0lQK3ZqK1phbG1jWmpwTWN5dVBSaUVLSUJy?=
 =?utf-8?B?ZlI3UEpBTW5yTnNIWGg1VDhhRDBDQmk4ZDNJb094ZW5sOXkxL21yam42S3hT?=
 =?utf-8?B?ZXZMVmt3QTlQTHBtWUFvcDQ4SDFWOVdkWEt4dklMTHY3Q3RxL2l5d3NaRXUw?=
 =?utf-8?B?aFpub2NMMFU1dTVDcHNKb3l6SXNOelVNWTVMYU5WUklwTm9YVkFvU2hUL0tv?=
 =?utf-8?B?RDlZZm9hZU9GZFBVZmVCeVVrM0hIdXRVeUVJSExsNU4waEZ5cm0wdzFZaTB3?=
 =?utf-8?B?OWJkYWUzSWdPc2IzTVMxa2cxM3ZwNWd2enJyNkVyL2syWW91c2JDaENDU09z?=
 =?utf-8?B?T2ZHdUdwditYNVNXZmxWc3RlUVp6VC9KcEZrMXFBU2pLZVg0S3ZVeXU2anlx?=
 =?utf-8?B?N0hES0JMSVk4VVdjQVB3TW5SeDhmUlJhbGlXQW5jVU9RSmhhb21zVXVaM3Np?=
 =?utf-8?B?L2ZQNHdjeE03c2xxZjUzNDlVTmVvRVpYV0JKTXQ0L0Y2U2hoc1RnaVl0Y3ht?=
 =?utf-8?Q?ge4oCA5KroBgKOuk=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d24210f-023d-471a-6e46-08de7c5d57c6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8527.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2026 15:22:28.4950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tdI3N4812UlY1WGrM2fFjcbTBCzD/TbmrUppSxKnO6ZdR1IyY3+4wpaiaOktdv2V1HjolnoeZvNxQXsRXofBn2FvGx+UlYWYNqkRCBK9mWs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4892
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: YLSCu7lXJ6Wm9d6zDL4kjUAq3Plb_G5p
X-Authority-Analysis: v=2.4 cv=B9a0EetM c=1 sm=1 tr=0 ts=69ac42b7 cx=c_pps
 a=xAoCywwWBQ/pNZbveyboNg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=NEAV23lmAAAA:8 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=jIDReb6bpf2bOWrqRMYA:9
 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA3MDE0NSBTYWx0ZWRfXz/JRq9+JtSNB
 /P/7YwNpX9MPneTyv1ii1zfeNcGvlys2jpAbVNZ1L/iYptQNM2yuRpBNF+zJLn7z0hu0kFKcgw9
 RGEovt9xSJwXyv8U/eTX0oinkEQpMt0zr8UUiR6mffEfkMzn4DwckCs2cTpCLqvf2zaYldTeCQv
 DtCLwmVggUBUiKKGeuXBCe6MYWCbxAJME7RekkTihI4NGaSvAO6VVaMlCol92m89ObGSX2yGDBt
 S4jf7GmJELAaIRKD7ICCo4uDcFNF251u2YBQ+qVZNzp1DL0orniQ1ez3ceLz1EJHuwzcIcAQznH
 lM2XMvYE2ra8TQONNJVODUx721TTInY44gEo6rckHHFDVyGPBigpfb28lQ6kByiYLTXDicOr25O
 J3w3EDqLmlX1wMZc5mkaNZsbBkMERUm6ozAcf0wTo/asRAGujmrx7kb02ZLxZlhFBXpmUDAihx1
 IfAphcHBiCZ6wp9/3Ng==
X-Proofpoint-GUID: j7QSdP6pLThFnXJIyUn0j4c3kgZuYSAd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-07_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603070145
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Mar 2026 15:22:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232615

SGkgTWF0aGlldSwNCg0KT24gMy81LzI2IDAxOjUyLCBNYXRoaWV1IER1Ym9pcy1CcmlhbmQgd3Jv
dGU6DQo+IE9uIFR1ZSBNYXIgMywgMjAyNiBhdCAxOjAxIFBNIENFVCwgUm9iZXJ0IFlhbmcgdmlh
IGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgd3JvdGU6DQo+PiBJJ3ZlIHVwZGF0ZWQgaXQgaW4gdGhl
IHB1bGwgKHBhdGNoIDcpLiBATWF0aGlldSwgd291bGQgeW91IHBsZWFzZSBoZWxwIHRvDQo+PiBy
ZS10ZXN0IGl0IGlmIFJQIGhhcyBubyBvYmplY3Rpb25zIG9uIHRoZSBleHRlcm5hbCBnZW5lcmF0
b3I/DQo+Pg0KPj4gICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9yb2JlcnRsaW51eC95b2N0byByYnQv
cnBtDQo+PiAgICAgaHR0cHM6Ly9naXRodWIuY29tL3JvYmVydGxpbnV4L3lvY3RvL3RyZWUvcmJ0
L3JwbQ0KPj4NCj4+IGZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byBmOGZhMzA5MDE5NmJh
ZTNlMTJhZDc2ZjEyZjEwMTcyMmQ4NGNhMjBhOg0KPj4NCj4+ICAgICBycG06IDQuMjAuMSAtPiA2
LjAuMSAoMjAyNi0wMy0wMyAxMToyOTowNyArMDAwMCkNCj4+DQo+PiAtLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+Pg0KPj4g
Um9iZXJ0IFlhbmcgKDcpOg0KPj4gICAgIHBhY2thZ2VfcnBtLmJiY2xhc3M6IERyb3AgZXh0ZXJu
YWwgZGVwZW5kZW5jeSBnZW5lcmF0b3IgdG8gc3VwcG9ydCBycG0NCj4+ICAgICAgIDYNCj4+ICAg
ICBwYWNrYWdlX3JwbS5iYmNsYXNzOiBEZWZpbmUgX2xpYiBhbmQgX2xpYmRpciBmb3IgcnBtYnVp
bGQNCj4+ICAgICBsaWIvb2UvcGFja2FnZS5weTogRG9uJ3QgYWRkIGxkY29uZmlnX3Bvc3RpbnN0
X2ZyYWdtZW50IGZvciBnbGliYyBvcg0KPj4gICAgICAgbXVzbA0KPj4gICAgIGdsaWIvcHl0aG9u
My9hY2w6IEFkZCBwa2djb25maWcgdG8gUkRFUEVORFMNCj4+ICAgICBsaWIvb2UvcGFja2FnZS5w
eTogRG9uJ3QgcmVkaXJlY3Qgc3RkZXJyDQo+PiAgICAgdGFyZ2V0LXNkay1wcm92aWRlcy1kdW1t
eTogQWRkIHBrZy1jb25maWcgdG8gRFVNTVlQUk9WSURFUw0KPj4gICAgIHJwbTogNC4yMC4xIC0+
IDYuMC4xDQo+Pg0KPj4gLy8gUm9iZXJ0DQo+IA0KPiBIaSBSb2JlcnQsDQo+IA0KPiBJIGRpZCBw
aWNrIHRoZXNlIGNvbW1pdHMuDQoNClRoYW5rIHlvdSB2ZXJ5IG11Y2ggZm9yIHlvdXIgZ3JlYXQg
cGF0aWVuY2UuDQoNCj4gDQo+IFdlIGhhdmUgc29tZSBkaWZmZXJlbnQgZXJyb3JzIG5vdy4NCj4g
DQo+IEVSUk9SOiBjb3JlLWltYWdlLXNhdG8tMS4wLXIwIGRvX3Jvb3RmczogQ291bGQgbm90IGlu
dm9rZSBkbmYuIENvbW1hbmQgJy9zcnYvcG9reWJ1aWxkL3lvY3RvLXdvcmtlci9xYS1leHRyYXMy
L2J1aWxkL2J1aWxkL3RtcC93b3JrL3FlbXV4ODZfNjQtcG9reS1saW51eC9jb3JlLWltYWdlLXNh
dG8vMS4wL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvYmluL2RuZiAtdiAtLXJwbXZlcmJvc2l0
eT1pbmZvIC15IC1jIC9zcnYvcG9reWJ1aWxkL3lvY3RvLXdvcmtlci9xYS1leHRyYXMyL2J1aWxk
L2J1aWxkL3RtcC93b3JrL3FlbXV4ODZfNjQtcG9reS1saW51eC9jb3JlLWltYWdlLXNhdG8vMS4w
L3Jvb3Rmcy9ldGMvZG5mL2RuZi5jb25mIC0tc2V0b3B0PXJlcG9zZGlyPS9zcnYvcG9reWJ1aWxk
L3lvY3RvLXdvcmtlci9xYS1leHRyYXMyL2J1aWxkL2J1aWxkL3RtcC93b3JrL3FlbXV4ODZfNjQt
cG9reS1saW51eC9jb3JlLWltYWdlLXNhdG8vMS4wL3Jvb3Rmcy9ldGMveXVtLnJlcG9zLmQgLS1p
bnN0YWxscm9vdD0vc3J2L3Bva3lidWlsZC95b2N0by13b3JrZXIvcWEtZXh0cmFzMi9idWlsZC9i
dWlsZC90bXAvd29yay9xZW11eDg2XzY0LXBva3ktbGludXgvY29yZS1pbWFnZS1zYXRvLzEuMC9y
b290ZnMgLS1zZXRvcHQ9bG9nZGlyPS9zcnYvcG9reWJ1aWxkL3lvY3RvLXdvcmtlci9xYS1leHRy
YXMyL2J1aWxkL2J1aWxkL3RtcC93b3JrL3FlbXV4ODZfNjQtcG9reS1saW51eC9jb3JlLWltYWdl
LXNhdG8vMS4wL3RlbXAgLS1yZXBvZnJvbXBhdGg9b2UtcmVwbywvc3J2L3Bva3lidWlsZC95b2N0
by13b3JrZXIvcWEtZXh0cmFzMi9idWlsZC9idWlsZC90bXAvd29yay9xZW11eDg2XzY0LXBva3kt
bGludXgvY29yZS1pbWFnZS1zYXRvLzEuMC9vZS1yb290ZnMtcmVwbyAtLW5vZ3BnY2hlY2sgaW5z
dGFsbCBkbmYgcGFja2FnZWdyb3VwLWJhc2UtZXh0ZW5kZWQgcGFja2FnZWdyb3VwLWNvcmUtYm9v
dCBwYWNrYWdlZ3JvdXAtY29yZS1zc2gtZHJvcGJlYXIgcGFja2FnZWdyb3VwLWNvcmUteDExLWJh
c2UgcGFja2FnZWdyb3VwLWNvcmUteDExLXNhdG8gcHNwbGFzaCBycG0gcnVuLXBvc3RpbnN0cyBs
b2NhbGUtYmFzZS1jIGxvY2FsZS1iYXNlLWVuLXVzIGxvY2FsZS1iYXNlLWVuLWdiJyByZXR1cm5l
ZCAxOg0KDQpJdCBsb29rcyB0aGF0IHNvbWV0aGluZyBpcyB3cm9uZyB3aXRoIHRoZSBzdG9yYWdl
Lg0KDQo+IC4uLg0KPiArKyB0ciAtZCAnWzpzcGFjZTpdJw0KPiAvdmFyL3RtcC9ycG0tdG1wLlU0
aWFKWDogbGluZSA5ODogdHI6IGNvbW1hbmQgbm90IGZvdW5kDQo+ICsgdGVzdCB4ICchPScgeA0K
PiArKyBlY2hvIC0tc3lzdGVtIC0taG9tZSAvdmFyL2xpYi9kYnVzIC0tbm8tY3JlYXRlLWhvbWUg
LS1zaGVsbCAvYmluL2ZhbHNlIC0tdXNlci1ncm91cCBtZXNzYWdlYnVzDQo+ICsrIHRyIC1kICdb
OnNwYWNlOl0nDQo+IC92YXIvdG1wL3JwbS10bXAuVTRpYUpYOiBsaW5lIDExNDogdHI6IGNvbW1h
bmQgbm90IGZvdW5kDQo+ICsgdGVzdCB4ICchPScgeA0KPiArKyBlY2hvDQo+ICsrIHRyIC1kICdb
OnNwYWNlOl0nDQo+IC92YXIvdG1wL3JwbS10bXAuVTRpYUpYOiBsaW5lIDEzMDogdHI6IGNvbW1h
bmQgbm90IGZvdW5kDQo+IC4uLg0KPiANCj4gICAgSW5zdGFsbGluZyAgICAgICA6IGRidXMtY29t
bW9uLTEuMTYuMi1yMC54ODZfNjRfdjMgICAgICAgICAgICAgICAgICAgIDY4Mi83OTBFcnJvcjog
Q2Fubm90IG9wZW4gZmlsZSAvc3J2L3Bva3lidWlsZC95b2N0by13b3JrZXIvcWEtZXh0cmFzMi9i
dWlsZC9idWlsZC90bXAvd29yay9xZW11eDg2XzY0LXBva3ktbGludXgvY29yZS1pbWFnZS1zYXRv
LzEuMC9vZS1yb290ZnMtcmVwby9ycG0veDg2XzY0X3YzL2RidXMtMS0xLjE2LjItcjAueDg2XzY0
X3YzLnJwbTogW0Vycm5vIDJdIE5vIHN1Y2ggZmlsZSBvciBkaXJlY3Rvcnk6ICcvc3J2L3Bva3li
dWlsZC95b2N0by13b3JrZXIvcWEtZXh0cmFzMi9idWlsZC9idWlsZC90bXAvd29yay9xZW11eDg2
XzY0LXBva3ktbGludXgvY29yZS1pbWFnZS1zYXRvLzEuMC9vZS1yb290ZnMtcmVwby9ycG0veDg2
XzY0X3YzL2RidXMtMS0xLjE2LjItcjAueDg2XzY0X3YzLnJwbScNCj4gVHlwZUVycm9yOiAnTm9u
ZVR5cGUnIG9iamVjdCBjYW5ub3QgYmUgaW50ZXJwcmV0ZWQgYXMgYW4gaW50ZWdlcg0KPiBGQVRB
TCBFUlJPUjogcHl0aG9uIGNhbGxiYWNrID8/PyBmYWlsZWQsIGFib3J0aW5nIQ0KPiANCj4gaHR0
cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3ZhbGt5cmllLyMvYnVpbGRlcnMvMjYv
YnVpbGRzLzMyNzENCj4gaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3ZhbGt5
cmllLyMvYnVpbGRlcnMvNDAvYnVpbGRzLzMyNzYNCj4gDQo+IEknbSBhIGJpdCBzdXJwcmlzZSBi
eSB0ciBlcnJvcnMgaGVyZSwgYXMgaXQgbG9va3MgYSBiaXQgdW5yZWxhdGVkLiBUaGVyZQ0KPiBp
cyBhIHNtYWxsIHByb2JhYmlsaXR5IGl0J3MgcmVsYXRlZCB0byBzb21ldGhpbmcgZWxzZSBpbiBt
eSBicmFuY2gsIGJ1dA0KPiB0aGlzIHNlcmllcyBpcyBjbGVhcmx5IHRoZSBiZXN0IGNhbmRpZGF0
ZS4gSSB3aWxsIGtlZXAgeW91IHVwZGF0ZWQgaWYgaXQNCj4gZmluYWxseSBsb29rcyByZWxhdGVk
IHRvIHNvbWV0aGluZyBlbHNlLg0KPiANCj4gSSBhbHNvIGdvdCBzb21lIG1vcmUgdHJhZGl0aW9u
YWwgIm5vdGhpbmcgcHJvdmlkZXMiIGVycm9yczoNCj4gDQo+IGh0dHBzOi8vYXV0b2J1aWxkZXIu
eW9jdG9wcm9qZWN0Lm9yZy92YWxreXJpZS8jL2J1aWxkZXJzLzc4L2J1aWxkcy8zMzE3DQo+IGh0
dHBzOi8vYXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9yZy92YWxreXJpZS8jL2J1aWxkZXJzLzgv
YnVpbGRzLzMzMjENCiA+ID4gQ2FuIHlvdSBoYXZlIGEgbG9vayBhdCB0aGVzZT8NCg0KRm9yIHRo
ZSBhYm92ZSB0d28gZXJyb3JzLCBpdCBpcyBiZWNhdXNlIHRoZSBzc3RhdGUgY2FjaGUgaGFkIGJl
ZW4gcG9sbHV0ZWQuIEkNCm1vdmVkIHBrZ2NvbmZpZy1uYXRpdmUgZnJvbSBkb19wYWNrYWdlIHRv
IGRvX3BhY2thZ2Vfd3JpdGVfcnBtLCB0aGUNCmRvX3BhY2thZ2Vfd3JpdGVfcnBtIHN0aWxsIGNh
biBiZSBtaXJyb3JlZCBmcm9tIHRoZSBvbGQgKGJ1dCBiYWQpIHNzdGF0ZS1jYWNoZS4NCkl0IHdv
dWRsIHdvcmsgd2hlbiB0aGUgb2xkIHNzdGF0ZSBjYWNoZSBhcmUgaW52YWxpZC4gU28gSSd2ZSBz
ZW50IGENCmdldHRleHQgdXBkYXRlIHBhdGNoOg0KDQpbT0UtY29yZV0gW1BBVENIIDAvMV0gZ2V0
dGV4dDogMC4yNiAtPiAxLjANCg0KSXQgd291bGQgbWFrZSBuZWFybHkgYWxsIHRoZSBzc3RhdGUg
Y2FjaGUgaW52YWxpZCwgYW5kIHJlLWJ1aWx0IGZyb20gc291cmNlcywNCnRoZW4gdGhpcyBzaG91
bGQgYmUgZml4ZWQuDQoNCldoYXQgSSdtIHdvcnJpZWQgYWJvdXQgaXMgdGhhdCBnZXR0ZXh0IGlz
IHZlcnkgYmFzaWMgcGFja2FnZSwgSSBob3BlIGl0IHdvbid0DQpjYXVzZSBtb3JlIHRyb3VibGVz
LiBJJ3ZlIGRvbmUgd29ybGQgYnVpbGQgb24gcWVtdXg4Ni02NCBhbmQgcWVtdWFybTY0Lg0KDQpP
dGhlciByZWlwZXMnIHVwZ3JhZGluZyBtYXkgYWxzbyBjYW4gbWFrZSB0aGUgc3N0YXRlIGNhY2hl
IGludmFsaWQuDQoNCi8vIFJvYmVydA0KDQo+IA0KPiBUaGFua3MsDQo+IE1hdGhpZXUNCj4gDQoN
Cg==

