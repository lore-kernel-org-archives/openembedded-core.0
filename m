Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43974CD343F
	for <webhook@archiver.kernel.org>; Sat,  9 May 2026 05:00:10 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6472.1778302805435607005
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 22:00:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=CpPjpCw1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9589ca456d=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6494jIUe2286826
	for <openembedded-core@lists.openembedded.org>; Sat, 9 May 2026 05:00:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=EZD0cKUd2s2oO+xTXu9te/tNFZs3Sw3YdYPeWMCVyfs=; b=CpPjpCw1AI3m
	cCBP4Dmeujewnxmif/BGbs2BWcVwDMGRU/h9O5n5pHHuM9eg8LM9VOBgxrpZzTQu
	z0u7jPyITh+YrVVP8XhGgJcSOpLduRR7lsXGXB6LSCRudgXKFroLLthG1sk0AJZs
	1IycknOWyTcgok3Hb4rTZGoJDocPSZH27+D7IPAdrhOfkWzORIh1UiIqWup1TK4v
	xzj4cUXqqu2ndi6J+tBl2skvieCkFNV+DU8/DSKvcq9wPWoqzOoU2tu0AbzYGw8c
	vB1Ws5Qi+abQYglvlCj0D2w+13MKUuEJPKRRci3LhLk/qRRQw+JP5xhJpcexuVH7
	S2RI+CwZ5A==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012004.outbound.protection.outlook.com [40.107.209.4])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e1uw6g3cd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 09 May 2026 04:59:59 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HBP2gNYtXsD0HtIoJwAYlaA4zrN+tz/iGLnnwTgI2XmuYu+nY+mA83B76WN7NJO2AMaCRoCYLe6d4Tv831lC7U8byaYeYDeYiDdhnwxhPgHrwZB6GyWU5nknobyKL72vC8oG+0AlwOFy/xTALEsgd8q2YpJxDELrVPmYqLM24LOZ720gsmVl2L8XAHfJLthFYUB2WQ0HcSdC6Otimn6maF1vEPCwK2WNJ4wjpk6ak0Cg+rUJhbCqZftTS61Ab2ZXAkaI8w0LzCuHSpIFV2mVRNuMSkfJbTnW+dldViHet5fjb8WDVnFYC8gZWIPco2B+ItZbbGE1F2+wWoVstNbN8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EZD0cKUd2s2oO+xTXu9te/tNFZs3Sw3YdYPeWMCVyfs=;
 b=JQ0fOYSJVgaa0eFZjEWKjkRgQi96JkpSUrim8jBN1J7x9h3GEdfZrzsVfmFATQc35zBlrbXyGaJmoghO/yJCZLRP1qgtX6EUbOq4QC4R9tTnq1DaXuVExVnf3fKBwQxblq7JXyhAVCrsKOMM5XetStTwA+9ubBCdqukFbQB+2VgvbV6+xaX98X3yfZSGtLFPZNBq78Ex6oZJlRbPDMoGQj88SmmXhbFuT/Wz1dATQppy1v7rQ65d5Y3N5zaifMgIdtjKwpZ0yNSbgU5NXwhr3nzfjdy4JGMzA4BAI/4gBRXSNAiQOFx1vgBUF59hm10Mai1F8p+iOEMsyJ3psrm32w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by PH7PR11MB5820.namprd11.prod.outlook.com (2603:10b6:510:133::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Sat, 9 May
 2026 04:59:53 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9891.019; Sat, 9 May 2026
 04:59:53 +0000
Message-ID: <5d1436c0-4b31-4da8-8aee-f2a50e0f9cea@windriver.com>
Date: Sat, 9 May 2026 12:59:46 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [V2][PATCH] gstreamer1.0-plugins-bad: disble vulkan
 when x11/wayland not enabled
To: Quentin Schulz <quentin.schulz@cherry.de>,
        openembedded-core@lists.openembedded.org
References: <20260508022311.3112415-1-changqing.li@windriver.com>
 <4e742cbe-27ca-401f-85a3-05b0193ae1c7@cherry.de>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <4e742cbe-27ca-401f-85a3-05b0193ae1c7@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SGBP274CA0011.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::23)
 To DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|PH7PR11MB5820:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b589ffc-2636-4066-81a5-08dead87cdd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	i8ij5icnLgX3ctGOSEl1q+ZygvXBLZawNBQZARkzIcZX/H7j5tD1pJ9PERP9x8BJze9vvMTkUgb/mzjW/8E1AruG90qBtOVPRPP5Z3FhHAroEmdLHQbLa1IyYTXrdK+4k7HbzsW1q04DqgnRdgWmzwodt8aK0qyuiD6JIlZLktzW1/NQQcIZrHUftQxo2N/JzGVbpK3xxLlbo9w+hfBwAJc42Xz2EnZQuNn5HGfF9+tS8EM1qk68QBWsjQGCadquxYngcIYdbU2muL0+3TOSsn/L+K+/LsOJvcZAuc1rYb9zs3uxlVJ87aFvPUKrxWdXgqMs46zQThCUqb6j0rwv65Q8opmyO00t9O4NmeZNLkUOPGt9QsvXSsNDxHYfXAq8npCxeTEpsYe2zCNgvvygAqkpvwlStpBkZzPuE4JPCmdh+e7Sv+WjddNeX18qhpf2hihkJvEw9DWPgU90YwZbSagKH9AravEL5GqyGex7PgGPTfwsHEJtvEd8C6qlxp+kz5i4584MTiAYn7tKVmyH5IDpk+L8Ga1sKASfa9McaD+Qu5+gdfYHKmtuZ0p5zvrZLzJs6V0RiHZkw6RWP2xrasAuM62G7aSABMzMamt90ir+wMHs+Uw3AZ0o2WscrAgRoaYyz12pkCHAasFMV37FwebAqYyMzyUlbybDDR5ab0gi/YBKnQgtxjq+Ci6cKvax
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UHh4MUZZM2JCQUFkMDZwL0JUUjk5TThDYnBtcGh6ZzZDWVRTV1hxdHgwZVgw?=
 =?utf-8?B?c2xSOUFFM1hrOEJtUlNMTGRqNW1zYm9mZUJqK0M1ZXFvNEdXVVNIdjRPNnRF?=
 =?utf-8?B?aW5Rbk9mMXQ3MEVnbmllUmxyZ3ZkZENyVXZmbDhEMHhDeTJEcStEZW0ra1JY?=
 =?utf-8?B?WFllMGI2RCtCeFh5cTVYaFg0dmlwNGhJd1QzN3pjMlJrQ0tuZDN2WG0xQkxT?=
 =?utf-8?B?aE85NFVwVkRwRldzcHhqK05yL2NsbEtPcm9VQ2NNMjNKeHEwYWVSSFFPMStZ?=
 =?utf-8?B?VHhxaW9sZ3NwMVBmM2lSdGU2UHJPZzlKR1dJd0pxaFpBZTJMaDladmZ2MUZj?=
 =?utf-8?B?V2tIVGptOEp2dXIrcWFwVy9PaEFHNlZRNHJyemlwMGYrV1J0WWNkU3QwZ1c5?=
 =?utf-8?B?WG9ZWiszT2s3WWd0QzR4dy9EcFlpZFFpNVkraG1uTmlNaTdFUnhRUnBqNjA3?=
 =?utf-8?B?WDYzWGlkUVYyVXZwalZCUVNDMWsvd2tGeGpOZ2FXZkdmRm5oS0hRakRoblNL?=
 =?utf-8?B?aWJVa2s3RzkwamlRa3phYTZVeHNYUjFKRzRsc2hpUVE4SjBLZEN5anVZYzgx?=
 =?utf-8?B?MmxkU09JclBUa21Xb3dmVzRmNmRCNnI3RmNGZGh2YnpxRUdHSmkxS1U4bUdB?=
 =?utf-8?B?MERPcnpyODZnOHVCUzZkSWFnS2JYSjRaYUMwblFhYU5iR054MWJMUjBnSTJa?=
 =?utf-8?B?cEh2d1RoN0ZjMkp2d2g3OSszdXNHSitab29yVWxjOUViTVZrQ2tMbVBjeTU0?=
 =?utf-8?B?Tlc4K0FxYXZQaFhxQi96VG9LUTMyRmJocFhNVjg3NlhBVXQvQlZuUDFNMWJ6?=
 =?utf-8?B?YnJUKytEWlM4aXNWNUJ5bU9VOHgvdXVJcXB5aEZndXpUVE1YWG1mT01FL0N6?=
 =?utf-8?B?S3Voenp3RTlEZ1hwU1EzdGlGWDRqSlhld1hLRTBPSVhaWWphaDRDbk9kM1FD?=
 =?utf-8?B?VnZaZGtMbEwramIwNDg1U0tLazVWRnpoWVRJWWJROWFuQ0dxdndOTkJHRloy?=
 =?utf-8?B?MWtWNXJ3czVWbGh5QSs1SW1TTHBLK1daWmVvRE5US1JpZnQxaGdocC9FM1l5?=
 =?utf-8?B?V0lMZk1mK0dkSzlaVmVvN2s1MUZ1dlhXbit0ak0vWmxMdWpna3lKRGd6bktv?=
 =?utf-8?B?aEw2Q01va3lwVTVQQUhuL29LMXR6cjFVVFVaUGlwRWdZTUV3L0dwSUwrZ1ln?=
 =?utf-8?B?NWhrbWtqTXVFQnl1K1U1MWMrVE5iZTNwSW05L3FmNC9zb0NNQzlrU1FBNy8y?=
 =?utf-8?B?YVZoTFJtbXc2TUJYTlR4NkdXVE9LZFZLb2VMSVVDY2tlL2ZpNytpcDJRdGlz?=
 =?utf-8?B?NlVNNkNpTG15ZGk5RFk3ME1oYjl3dVczcTBPSG5lNzh6VEwxd1Y0QXk3Vzl1?=
 =?utf-8?B?Y0hOek5sQmQ3dVF1TGR5UVo4QmhxTy8zb25QSFZvV2tFVHJzRUpKZnQrVTJS?=
 =?utf-8?B?UmtJMjVkUkxYNjdtem9LUDlyckdTZ2VEVmt5QUZkdUd4cjRKdi82b3k2Qkpi?=
 =?utf-8?B?WVhYNk1OSGRYV0liUzl3OTZFek5nWHdmU0lLczJOeHlZWlgvc3I1YXE1ZmNF?=
 =?utf-8?B?SVRmanlrY3VmVGx0MWNLcWprUHlNN2M1NmMxNTQzZnpDaE4xa0ZVYkVkZGhL?=
 =?utf-8?B?Wis2Tm9GZWYxNlRaS2hoS0hhUHBybTI2Ukd1S2xJY1lneUVuQm1DMVhCZ3ZU?=
 =?utf-8?B?WGM5SWpIUHZKWGhXQWZsUmFTZTZsODRSdElkTmFualh1WDhYaGVlWFl4QkFv?=
 =?utf-8?B?UkhqTEpCeGxDSGcwVVRXZHR6RFVFcWFtTHUrOUtETkNKZ3FURmNyaExNc3dO?=
 =?utf-8?B?Yzl0dkFhazA5cVpZVGZ0TXpXelBiQld6VS9xSEJUanJHWTRabjNUa2hPVDZB?=
 =?utf-8?B?Y09NVXZYTFlzdmNmNWJKK0dHVVUyRU5GWTZFOEluNmhtMUR2d1ZGT3ZIbGNX?=
 =?utf-8?B?MHdrSUtNNGkwOHRWS24zTmxCVFRiYjZUZFhCcEh3WW9yL1ZkM1hxVjhZV3E1?=
 =?utf-8?B?V0RhUXNJY1hPUE43NmpaOEsxNTlBZnd2dG9YaW16d21Na1VTSWU4UU5WUXZu?=
 =?utf-8?B?WUQ1Z2REbldVQVJnOURoazNOZGNvZEpvNHBCWTRIcXFsNEFYelFRZ1JnT3p1?=
 =?utf-8?B?R3ZQMW51MGZyakZkUWJYcE1WcXRmK0F4Z21iYUVjNENaL05MdkJNVXE2NEk2?=
 =?utf-8?B?eVkvWm1tWjd2ejN5SEE1bjlEdUxUbzFRajhTdnVGbCtHMWl1RXBhZ2FERkdj?=
 =?utf-8?B?YzVpSjlXSUQ5djFLYkoxOWlLdmtFNWdDT1BhN3ZxbythVjRPVUFlMjlXTXVF?=
 =?utf-8?B?NFFnSHc1eVlEUXFOZ2cxbytBb0huQVhHY2l2SHFMaEROd3BNejBteGFrNVBl?=
 =?utf-8?Q?boLWiwscIBLCqEYs=3D?=
X-Exchange-RoutingPolicyChecked: 
	NbjZgJKuFhnVxxCB515sBB+raAyE9mE/Q4+VxrMmAB+om7W7cWkneQjPH9r+5JAxLOnwpsoM08KFMgOiNxKwIqceSerUfNeSF8L3MGnTjO2MkhvX53eYVWywziIvDnlBOB4vwIiwlMAm3cwoit2w7BAt/FzcJDIL8XorwFbGMw9ASK7MoueCj+Qrm7lA51/pbjvmKfp6BzrEGYzk72V6x8Z0LuLPJftm11+ohjLigJI78e0L6yqwUKJS+uKmpTGMohkZIz+uYpn2bFZRLF1oWN9WyR5ZHTneqeUCilKteSAPVInwOy7PAkOoWIET7wQBfyczUB6p/koXQFH1kefT/Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b589ffc-2636-4066-81a5-08dead87cdd7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2026 04:59:52.2518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x76k/jqlp3rnA8KI4YoxUrFv9Hmhk4RdR5u4R+YuGaR6JgW6a5xlZjxSj0+TsYk3QvU5NtSpRODt5wEHIfP2yOACLmZkicGxUTFwogR4qMY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5820
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA5MDA0OCBTYWx0ZWRfX2ikr+eVs+6fz
 LGOZvAECelBK8KEVEtGF/Yc+cbg4sd1bwLyCbpd7A1lgWSVceYs0PwgGX/9UVOUmupmDDwjDQ+X
 TK30rXHjzo9J6NH0vahaj8NRgSvKcO1gPjx4fFP0N7gk1zECuvaeQKPilXfwcOUuQfM1TbLexKU
 EOiOP7fvyXXCzgsaplweF0/OLpiH/0akaoFnik5I7i9Clz6svsqTq9F9HFF2OKn+OxMNpJBj2to
 z4IpUBS6qYS++Yoq9n5Th/m/5sd04tYrnxMlScjWNWynjXL7mSaFmqiPIJUjYUSb67UGb/Vb11d
 n/SHyxKcsGV1/WvflbYo+2WlKMIC6+pRF9qxE1XFFJZbyYXyil6zHlsQjSNyBEHHvIydrZrWqmM
 goa8jq+jG4xjm5upgUO4ZHyRzgDyIA==
X-Authority-Analysis: v=2.4 cv=d6nFDxjE c=1 sm=1 tr=0 ts=69febf4f cx=c_pps
 a=dAhe3p+MvHJ8ujFi5nYcpA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=_Okcn44-CsPd9Sy-xOYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: YQ5p2osBSBl3XFv4HwLduo6hvIqo-S2v
X-Proofpoint-ORIG-GUID: s8jY5zbkXtlRE41XHPpQ8UvWa-U2c-FV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-09_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0 phishscore=0
 malwarescore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605090048
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6494jIUe2286826
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 May 2026 05:00:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236752


On 5/8/26 22:53, Quentin Schulz wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
>
> Hi Changqing,
>
> On 5/8/26 4:23 AM, Changqing Li via lists.openembedded.org wrote:
>> When vulkan is enabled in DISTRO_FEATURES without x11 or wayland,
>> do_configure will failed with error:
>> gst-libs/gst/vulkan/meson.build:311:4: ERROR: Problem encountered: No=20
>> Windowing system found. vulkansink will not work
>>
>> disable vulkan from PACKAGECONFIG when x11 and wayland is not enabled
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>> =C2=A0 .../gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 5 ++++-
>> =C2=A0 1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git=20
>> a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb=
=20
>> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb
>> index cdf3a20dff..c7f081e25b 100644
>> ---=20
>> a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb
>> +++=20
>> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb
>> @@ -21,10 +21,13 @@ DEPENDS +=3D "gstreamer1.0-plugins-base"
>>
>> =C2=A0 inherit gobject-introspection
>>
>> +PACKAGECONFIG_VULKAN ?=3D "${@bb.utils.filter('DISTRO_FEATURES',=20
>> 'vulkan', d)}"
>> +
>> =C2=A0 PACKAGECONFIG ??=3D " \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${GSTREAMER_ORC} \
>> +=C2=A0=C2=A0=C2=A0 ${@'${PACKAGECONFIG_VULKAN}' if=20
>> (bb.utils.filter('DISTRO_FEATURES', 'x11 wayland', d) !=3D '') else ''=
} \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES',=
 'bluetooth', 'bluez',=20
>> '', d)} \
>> -=C2=A0=C2=A0=C2=A0 ${@bb.utils.filter('DISTRO_FEATURES', 'directfb vu=
lkan x11', d)} \
>> +=C2=A0=C2=A0=C2=A0 ${@bb.utils.filter('DISTRO_FEATURES', 'directfb x1=
1', d)} \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES',=
 'wayland', 'wayland',=20
>> '', d)} \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES',=
 'opengl', 'gl', '', d)} \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bz2 closedcaption curl dash dtls hls op=
enssl sbc smoothstreaming \
>>
>
> Should we really build gstreamer-1.0-plugins-bad without vulkan support
> even if DISTRO_FEATURES contains it? Seems odd to me.
>
> If we can fail the build, then we could probably do:
>
> ANY_OF_DISTRO_FEATURES =3D "${@bb.utils.contains('DISTRO_FEATURES',
> 'vulkan', 'x11 wayland', '', d)}"
>
I did like this in the first version, see subject:=20
[gstreamer1.0-plugins-bad: add ANY_OF_DISTRO_FEATURES]
> Otherwise if this isn't desired, we could go for:
>
> =C2=A0# Vulkan requires a windowing system
> PACKAGECONFIG_VULKAN =3D "${@bb.utils.contains_any('DISTRO_FEATURES', '=
x11
> wayland', 'vulkan', '', d)}"
>
> PACKAGECONFIG ??=3D "\
> =C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES', 'vulkan',
> '${PACKAGECONFIG_VULKAN}', '', d)}"
>
This seems more easy to understand,=C2=A0 =C2=A0change like this in V3

Thanks

//Changqing

> Cheers,
> Quentin

