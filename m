Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20F50C02183
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 10:29:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.7895.1737109785541977791
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jan 2025 02:29:45 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3112c2805f=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50HARdSF031386
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jan 2025 10:29:44 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 443dv16rmv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jan 2025 10:29:44 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50HATi85001929;
	Fri, 17 Jan 2025 10:29:44 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2040.outbound.protection.outlook.com [104.47.56.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 443dv16rmu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jan 2025 10:29:44 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rFLO98wWaEaBgTRumBeM+aAT6MyttFBooR4biyNBlZ9VCudQO14SftSMSCn06ywrZ4+1tMOOWjqNyP1xltxgk+MAb6JrSQUjYqIyux+eTAIDCJMMMej/gKYfof0LvD9CST23/+zqFMFgsKaoeYQTW/ybf9X60B8X4uOxp6v71dxEk/RN18KiKHtoDj6fYbQloW7Z/hl/KlxMj/jzHcF3HXdL4SoKcy0AlUVvdXyCaoP2QpiWhVTJua+EhVCML8XRcH+omcI+MsnQ2u8nSoA7oa9RO6Gds0y7gZbIUMNwUwR/OvAGBrs7/0RBKDZRsLRp1kmDEJvkr8taYgFoOtyXbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/oqz3VJmsE0ZhvlDuEzFdHFAeXmhfsVvwOCv0Lp08YY=;
 b=yl0FwFGZzW73Duk5L4LyiOzvwwwic8ls3AF/lzBxiFDV//VlnUMtcmDJ25En5rF3hqh9nmVTFFbu+QHQwfQNCf0zcgR0Iml7susX7Pp1dppU/y8vYufaMyWP4vrqw50shhjuxdw9iWGcrITYnc2rUt95IC5Jj59LPUOWQ5ceWsXEOQXPxrWjFUp0QjCx0sc11MX8ekwE2+8IIus/c7d+EcYpSJt9MSbWmpubd+lnWm+rh00tvyp5tFkzWRI8Zfg3CPo6tnPt2jeGFTVMZcYbjaZvRf5AYUV2RvMJ2G3+O2dG+E2DetxBCKlD6QBUKSQ4nqwir/Ew87ECfosG3rJbvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.16; Fri, 17 Jan
 2025 10:29:42 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a%5]) with mapi id 15.20.8356.010; Fri, 17 Jan 2025
 10:29:42 +0000
Message-ID: <cd85c5d1-6d18-4950-a3a5-14823957498e@windriver.com>
Date: Fri, 17 Jan 2025 18:29:35 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/2] base: Add virtual/cross-XXX recipe specific
 provider control handling
To: richard.purdie@linuxfoundation.org,
        openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
References: <20250115204830.4030611-1-richard.purdie@linuxfoundation.org>
 <181AF8C1771E649F.1614@lists.openembedded.org>
 <209dd128aad0eb29fa451e0decf2d74ba2b80d72.camel@linuxfoundation.org>
 <181B733DD5B975A0.1562@lists.openembedded.org>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <181B733DD5B975A0.1562@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG3P274CA0003.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::15)
 To PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|SA0PR11MB4719:EE_
X-MS-Office365-Filtering-Correlation-Id: d2aa1be9-e5bd-4d24-cfc2-08dd36e1da72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|4022899009;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?K0xPL2lsNVhNeVU5K0w1djZPZVQwczNuNEFBcFBVbCsxTVprNTlwV254YTRy?=
 =?utf-8?B?SlBnNUF0SldQTFJmRDV5U2V3a09ZMnlicklmaSt1K0V4RVZodGNDTFJ1SVpZ?=
 =?utf-8?B?M1VOeUtOT2diVUd5MWpEUzVIVkF4aGlWTW42MVhkNDcxdE5HRWdtMXk0d21a?=
 =?utf-8?B?ZjBxNFVDUWdxdmUzNlg1c05zcUdpUTd3N3Y0QnlxZWJYYW1jWk12VzVidExG?=
 =?utf-8?B?ZjdXQjFlSEVvbVl1YzhzeHRSTHNBM0VidlFNWmlidnlWZG5ZeWhSQTlzaHhN?=
 =?utf-8?B?RUNQMS9GL1dRNzA3Z2ZYbEJzMERzem1sMjEzLzdxYis4NXUwY3BnMnJRaGRW?=
 =?utf-8?B?WHlESWhOMm5MRkhlZzlrNXI5OEVqWmZPTHZoRnNnenZpM0hlcVdwZTFoaTBN?=
 =?utf-8?B?TUN3eWRWWjZmM1V5MERJV3ZOYXNzUlNkZkI3azJsK25LRDVMY0ZmTG1rVGhT?=
 =?utf-8?B?M1BHbFk2YVVlazJxTmlFRUpad05NUkVFMzBibTVYQ3crRlFCNXZpUlhlOU8r?=
 =?utf-8?B?YXZUamhpakFJVnhpNE9wR1RIVm9qTk1rWlBDd1NMcVBvaTd3Zmo0SXlSaWVx?=
 =?utf-8?B?NGErcHZ1THFTMmwwMmxPYXAyTS8xeVF5Um1ocmZWRVpzaC9scFFUa3MvSnhX?=
 =?utf-8?B?aThTQWkvMUozWUt0V01VaXpXQlFIZzQ0cWpZajZwbjNGS0RzSGJQUmVaRnJ3?=
 =?utf-8?B?MDA5S3ZCQkplbSt4OS9PWE5XT0UzdStpenRFd1RlNWx1RWNaNHJEbE13Y2RI?=
 =?utf-8?B?WWFMZlJSNk1FUm9LcnlocU1KczMrcTUva3dxQWh2aTZmSDdoRnlEYUI1WXZ3?=
 =?utf-8?B?dHVybldBcElYNEFoWjRXdlExZDZuOExLeGdyTkFGTEhCVFFNV29MZGlUdjRE?=
 =?utf-8?B?NEZYbW5MUjlyc1FRNC9LM280cUpqblhUTVdZM0Jzc0tFTlQxcjhEZmpNTlMz?=
 =?utf-8?B?bXhpNUFmRlJZTmlTYm83SjZSdTdkMitmWFRNOHptOCthRXh6Q3pzRkFIZ1Yv?=
 =?utf-8?B?aGxJeUQzcHNpaXo5SGlTcXBUWTRaTUR2NzZ0YWZ1V3phN0FJcEVudVFGZ2dt?=
 =?utf-8?B?VzJwUnpDbExwejY1T3JiRm5YZ1FFbzZsRHhwdDIwdXdUUUg2TjI2ZnFBVkVi?=
 =?utf-8?B?K2ZhSHFQekRrODRZTEN3c2JpOWFjN2w0Zy9FdllMY2xHTXVuZUZobGlhcE9E?=
 =?utf-8?B?Q3ozR25mZExtdm93R1V3YXVPWjM2ZytsYWROVllKYzBrd2JSN1daMFRzMUNT?=
 =?utf-8?B?djNQSlM5c2FTYVVBZHhGVUU3WE9ROHhkSU1qTlZnSEUveElsVlE1bjdtZThE?=
 =?utf-8?B?OSsrMmp6QUZaMVE5TEJsOWtLbkJZUE9ZRnpHU1NlZXdGYk5pN1N3djFib1hV?=
 =?utf-8?B?SzJwSDhMT21XbVhlUEswL3UvM25DaFhWaWpaOGVod0RGMnRvVkVkUkdHM0Np?=
 =?utf-8?B?ekZrdXJBRElNMGdlM1Y1QTg5K2wrN0tJSm9HcDBwMVR2T0phZmc2UFdrSzgz?=
 =?utf-8?B?d0xZMVo1c1dueVBVajRaeUdGZFpEU1FGcGNuOXkrNS93cG5GTUF1UlVVZ3cz?=
 =?utf-8?B?MzIyaEd6Q0UwT09TcUZYUzUxK3RHMWlTQjFubXZYNUg2TFVFdXAwUTJDVnVV?=
 =?utf-8?B?d2dZQ0swSWZRYkpPU1R6QnF4bWR3VEpiVml2VWJKOE9YeUZvam41THd0aVor?=
 =?utf-8?B?SUxmZFgxYm9yZ1l0UjArOFJjUjBPcXNjQVdtYlBQeGpjcHJwMGVON0YwTnRa?=
 =?utf-8?B?RDlZTittQVc4U3EzVXhKQmtBY2xZc1FvYmJkcjQ5SXZUMnJDbEQzSG1oZjVR?=
 =?utf-8?B?MUlJWDBCMlFQbU1URHFCZz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(4022899009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OHpOR1NvaS9rLzZoMmVwRWpyNk5ZaWtQQ0N2anhYcFVNNWdVNk40SEkwOExr?=
 =?utf-8?B?Rm14czJXV1JENHBsT3VsbUFFNC9sR0d5d3p0TUEyd2JrMzNyMzFqZ3NMYXBI?=
 =?utf-8?B?UVM2SmVKYU1OWjRwaWN0ZVM2WWRqdG16OE8rMDFuTmpwK3lkY0RPVnQyaFBB?=
 =?utf-8?B?T01xWlgrWUJaMEJsRnEveUJ4UVFDU3BtR1FWRmdKUTJyRjFJMGtXeEswWi81?=
 =?utf-8?B?K0ZiemZFczJwOWhhZHRWTEw3MzIvc3VPbnBWRjU5S3RaRFN0OTdHVlFpck1l?=
 =?utf-8?B?eVRjUmV2MVRvQVJ3Y25tam5sd2xnanZCMkljcHM1cUxVQjRtWGdhd1V4bktp?=
 =?utf-8?B?SXhEbzAwSVh5RHJ4b2FYU28ydHphMEwyaEtTempXWGFFdFNMOFllWWUrVlVO?=
 =?utf-8?B?S296QUdRNG9udzgzZGhEVzN3RTRMS1lCaGNTM1BNOEZLNjN2akhGYmt4N0NO?=
 =?utf-8?B?N3c5RjdkRDBpSkplVVNvYnQxOFdOZHB0bmtXRVA5UmJGcnh6ajhUbVFycERQ?=
 =?utf-8?B?WHgzdGNrQ200dW1EWjhSeGluUmRjN3k5eDhxNG4vMVc1ZU83NUNVVExobFd1?=
 =?utf-8?B?cUc2bG5kaE4xVllZZVhFVzBqMGpSTUJvWmRoZUZ0MDBvaTlJSVN0TGY1OGVq?=
 =?utf-8?B?ejB2clgxbEZrdEFDMTBwVnJXUk4ycFNFaHlFZXBQcHAySXJHTjk4aDhVNFJC?=
 =?utf-8?B?TGVFNlRCOXdvbkM5WlhHaXFyRURTL1dNNVZvLy9EYXEvbm96d3JkaDRmRC8z?=
 =?utf-8?B?dHFneUdUNG1pQ1BZV0VxS3BJRVo0a2RudmwramFCWWlyNFF4dllra3V6Y2JK?=
 =?utf-8?B?Z2lkRGZucWk5OThrVHZRVW5ISmx0d1RPaVVER0t3VmxaSmN2cituVUFteVFq?=
 =?utf-8?B?VTE0T2c3bTFacFBaeGl5MnF4K1hHcVZtWUF5YjRKcnp3U01rZ1RFUkd4Qm15?=
 =?utf-8?B?THlESExacmZoN1V1YVI4MkZIOW1KQnRhUkZrQVZNbkoxa3RvTGUzVVkwVk1M?=
 =?utf-8?B?ekVjM0ExUTMzZkd5VlVJQkVvNXQ5dDRXUmR6SkhLeU9CUHNIWW1vVlljalh4?=
 =?utf-8?B?N3lPaStDRnhmNjF0WVZSQnJmRFp3N0lVQjFqQWhJeFNDQUw1UHp2WGo2dmZ2?=
 =?utf-8?B?MktoVHdtTzljR0FZdjU0cHBDRjZORklHSEJIVEhnY3NQNldsME4zemo4eTB3?=
 =?utf-8?B?VzJYTTRKclRzRVNrQVB4OFBwQXN1dVpuQUh1bHVBcm93U1lCdkI0UnE0Zjcw?=
 =?utf-8?B?VDNhdGp4SEkybE1PbzlyUmVOZEFRNHFvM3BPWlpQUHRCczIxRUczcUpFWnBX?=
 =?utf-8?B?VHdOcG1aQlk3QmxOdFVWSlI3WmU4QXpFOWNSK0FHWmlmWGFxNTFSUHp4ek9F?=
 =?utf-8?B?UUlGODcyanpVdFRpdW5kYVVvMm1PUHlsM3dWOGJpQkxqSjU4eGtOSE9XaWpI?=
 =?utf-8?B?ajJpWUhUbFlCcXBnczB5NUJPYkxJZTNrcHlQYnBkWWViaTNJQ0JwbDhxTGo3?=
 =?utf-8?B?TVFoS1RQQmgwZXJOTUhuVFJiWTNTZFR1Qm8zZDI1NzZoajdwaGNCeGhRTnJE?=
 =?utf-8?B?aUxSakE2Z1dZSnVIMkpkSTlpMlJrYTNTaGZ4bzVwWFVyeFU0YWdPNk9ObGlx?=
 =?utf-8?B?a042WGFlc2hjeEQwUDNlZjFFOW9CSDFBV0d4UjFGTndSQ2ZENzlGdzh2MS82?=
 =?utf-8?B?WDUzdTBablRYRXFTbTVWRUZ6T2pOV1I4QXFmMXdZeVd5cDcxREpZRnhCSUJM?=
 =?utf-8?B?S1RRdjZlM01yQmM0NmtNdmlHenRManpRY1VreXNydkUyOTJBb01CbXpjOHAx?=
 =?utf-8?B?WVFTRmNxc1M0MjBlN0ViK29yR2NrcHlneHlGQ2NXYThrb0MyN1pnS3V1Q3p6?=
 =?utf-8?B?YTFiSlpIcmpESGZESjVaZmFveUNtRGFIbWZmT1M1eFdKOTY4T3F4a0ZXa3RF?=
 =?utf-8?B?MXUxa3hoTTRRUlllTWxNK1c2eG9Md2svWi9XUVViUVJJcFVFYjhWYlNmUkVU?=
 =?utf-8?B?cWRIdHl4QmhRRlJGdjY0cjBaMjRzeDFBWmRBTGdzSlZlTFFsd0FZbkkzRW8y?=
 =?utf-8?B?R084aTVUTW0wUzhPVURuWjR1L1BDMUU3Z0w0eVQrRHJjWXZzUFBFbmowcU5C?=
 =?utf-8?Q?1sHzuprVHVgahA9S819KhZIvA?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2aa1be9-e5bd-4d24-cfc2-08dd36e1da72
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2025 10:29:42.0052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yXTYjhGPT49/o2xHmLNIgbQZVb+VMeRgDDktTqzk11dvaq/8OuRGoD+jpkw2Ry4nsdeBsP+Bn+Vth+KWUT6/AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4719
X-Proofpoint-GUID: OwHq0Eo1EZvAfHI6ZwzLi5OL_jNF52Ts
X-Authority-Analysis: v=2.4 cv=N5zTF39B c=1 sm=1 tr=0 ts=678a3118 cx=c_pps a=TWVVkEr8Ytp/jGYVlMgQuQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=PloAqxBbzItdlXWlM0MA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: wD6Tr5GpJyvDFznJnM_a_3rENJOUdFRC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-17_04,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 clxscore=1015
 suspectscore=0 bulkscore=0 mlxscore=0 phishscore=0 spamscore=0
 impostorscore=0 malwarescore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2411120000
 definitions=main-2501170083
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jan 2025 10:29:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209983

Hi Richard,

I adjusted your second patch a little bit and things seem to work well. 
I've sent out the patch.
https://lists.openembedded.org/g/openembedded-core/message/209982

The testing matrix include:
1) bitbake core-image-minimal
2) enable multilib; IMAGE_INSTALL:append = " lib32-sysstat"; bitbake 
core-image-minimal; start qemu
3) bitbake core-image-minimal -c populate_sdk
4) bitbake -n world

Regards,
Qi

On 1/17/25 18:13, Chen Qi via lists.openembedded.org wrote:
> On 1/17/25 00:56, Richard Purdie via lists.openembedded.org wrote:
>> I should perhaps talk about the issues this patch series highlights.
>>
>> My first observation is a conflcit between my choice of "virtual/cross-
>> sdk-cc" and our renaming wanting it to become "virtual/nativesdk-cross-
>> sdk-cc" due to MLPREFIX being needed/added for multilibs. I'm torn on
>> going through another iteration trying to see if "virtual/nativesdk-
>> cross-cc" works better, I suspect it will.
> I just tried. Yes. It works better.
>>
>> My second set of concerns are around the usability. The patch
>> implements DEPENDS remapping but not task[depend] handling so you end
>> up with changes like:
>>
>> -POPULATESYSROOTDEPS:class-target = 
>> "virtual/cross-binutils:do_populate_sysroot"
>> +POPULATESYSROOTDEPS:class-target = 
>> "${PREFERRED_PROVIDER_virtual/cross-binutils}:do_populate_sysroot"
>
> I think if we put the remapping in the bb.event.RecipeTaskPreProcess 
> event handler, we can avoid doing changes like above. The allarch hack 
> is also not needed.
>
> I'm testing a patch locally, no error so far. I'll send out the patch 
> if things work, or just add some more info here if things fail.
>
> Regards,
>
> Qi
>
>>
>> for the 4 cases I found where this is done in core. Not the end of the
>> world but will catch someone out in future (probably me).
>>
>> The need to hack around the problem with allarch due to ordering issues
>> is a bad sign too.
>>
>> I'd note that if we accepted the syntax above more widely, we could do
>> that everywhere and not need the remapping. It is really ugly and
>> unreadable though so I'm thinking that would be the wrong move.
>>
>> One alternative to the second patch's approach could be "filter"
>> implementation for variables (Joshua once had a prototype of it) which
>> would help DEPENDS but not task flags.
>>
>> Another would be to drop this "in metadata" approach and move the
>> remapping to bitbake and make it API. This was going to be my original
>> approach until I realised something was possible in the metadata.
>>
>> Thanks for Joshua for talking through this for a minute, it has
>> encouraged me to write down the issues/questions.
>>
>> There is unfortunately a little bit of deadline pressure too since M2
>> is due on Monday and I'd ideally prefer to get a change like this into
>> M2.
>>
>> Cheers,
>>
>> Richard
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#209981): https://lists.openembedded.org/g/openembedded-core/message/209981
> Mute This Topic: https://lists.openembedded.org/mt/110650523/3618072
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Qi.Chen@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


