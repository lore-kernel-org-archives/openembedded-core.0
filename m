Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CE29D6DDEB
	for <webhook@archiver.kernel.org>; Fri, 15 Nov 2024 08:27:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.15790.1731659246959262712
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Nov 2024 00:27:27 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1049103b3d=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AF6P2vb029367
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Nov 2024 08:27:26 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42uwtucvvm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Nov 2024 08:27:25 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4AF8RPXf017418
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Nov 2024 08:27:25 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42uwtucvvj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Nov 2024 08:27:25 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HAOJH96NTdiy2gG6qEjNijW5gCSh6ALw/rCUimuygC+f/cqvkHVrOBONayNaTesARdwuwIuIpJt+wR4ydYYMJUx54V9d2wRWJhpjjz8uaww4jdeUXmSBLd09PEtVfHr+FQKgmZHBg8U3OyPYJrFrDSksGZPb/lc1iOXkC7IU6rtnmFW0/76ULWqiM9a68IwH6rfLSc3eTzkCP3233C6T148nT5CE5t6rqPzUvR8TGH/2Uv9WRUlKBAmAmQg/GFO2Ad0r0CaXUOO4eqqMKAHxKb3tRNVxhdPGZ5/hGxn5xEsTXKqUIXi3IhI9/5zrTvz8CWLHBXeXgKDRhzSfSfu1ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I/Q+qrbKPNUA5m6FDt+lLDNQIBCkuHBc2ATaENuDGxo=;
 b=UQQ2Avdbf5yLDulyzvB/5W5uML7dJhIY6FhrZqNEwaY7maxHP2svdHXEWKCzSHX8k3tolNJxIX9VK9OpN/uHktEvTOnsWV4Nytp0RPu+Ef0t5hnWHZglkqSU3JohPTX0a9OkX9GBVCQVt7+eR3hhqvxYp+iVChSLH5lo6/kkHvOwKlwGacihU5oH8KztRX5rww+yGL0A7anFRIfGPo8LCVpXxxTCuug4CkHP8FRffkyEzKrsx+eX0Sda47IK5meWnFfZrlYYb3tEQztjepZrRCam3Qy/09cgmlCa8GvK7fzBbEJmfdEc7t06BMMlAvv7gVSKV1HEZYE3VMatpHlZSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by BL1PR11MB5269.namprd11.prod.outlook.com (2603:10b6:208:310::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.19; Fri, 15 Nov
 2024 08:27:22 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d%4]) with mapi id 15.20.8158.017; Fri, 15 Nov 2024
 08:27:22 +0000
Message-ID: <91490e5b-ff0f-4d2c-bc04-71e1ea3a7016@windriver.com>
Date: Fri, 15 Nov 2024 16:27:15 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 1/1] bootchart2: Several fixes
To: openembedded-core@lists.openembedded.org, ross.burton@arm.com
References: <cover.1731571498.git.liezhi.yang@windriver.com>
 <cfbc483721d4dc7cd442e8cbc344b0c05160cad8.1731571498.git.liezhi.yang@windriver.com>
 <ZzYlLDUiQgtvN6aa@bootlin-mathieu>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <ZzYlLDUiQgtvN6aa@bootlin-mathieu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY2PR01CA0020.jpnprd01.prod.outlook.com
 (2603:1096:404:a::32) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|BL1PR11MB5269:EE_
X-MS-Office365-Filtering-Correlation-Id: 47dfc6a6-dca5-4159-05cd-08dd054f53ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?THFUcmFyeGtZTTJCcnJEZHZIbVowaXJGWG5oaE0rdWVKVzBaMlJyWFpHRWVH?=
 =?utf-8?B?Ly9nOXpnajJsbVdJVnZ4a3Fwb21CRzYrejRFYk1EWXFxWkNTb3pDdlNGRndi?=
 =?utf-8?B?TmRsdWRnZjNqREJ4Qmc1MWVhUHR1YWRGM3hmZmFWTnQ5aS9OSVNvaXlwQmp1?=
 =?utf-8?B?VTNGS1lKTlBSemtrOWd3MWR3NEx4SXZhQXRZcFUzZU9oam1KbVd3T3JwSkIy?=
 =?utf-8?B?YW5abTNDQ3lOZG9yc1lyWmtUNUVFcW93QlZnSWlXaGdkYkg3dStuV0dxK1ZO?=
 =?utf-8?B?OEZGSjV3SUxJL0R6d2luaGVEQWowTHhJRVYwNXFkSmcvelVvYTlGRytGRkgr?=
 =?utf-8?B?RkZTMzdlZFZiWk5kMDZwY1NvQUZUbmxEdGZQSDZFTkZuUGdZWTBUQnR0bXZJ?=
 =?utf-8?B?bm5XamVETjJxeFg0eDFYRmg2dmtJbFVCSElZTHVCVFNrajFkQWFibzVTUkth?=
 =?utf-8?B?MDRyelpMaWZkMkdodTVsb0dHZ01WSk5OM21xVjFsT2VSZ0xvaDBtT3RwZm9S?=
 =?utf-8?B?eGJzRzBia01xanZYUi95dzBqYUJwOXdjOFVhTUlYWlpDdjlqV3VVTDZsbm1N?=
 =?utf-8?B?SU1UTDBScU92V0JpSkdYN01XRC9neEhQSDZuWGpDWElxSG9wc3lRalJWcDZU?=
 =?utf-8?B?MFIxa2drUjMxd24xSXNaeWR6Mkx6K3JKRytadlZyVmRzWXNRY3VIMnV2cHNu?=
 =?utf-8?B?YXRQenZDdTViUHE1b1k5QTRHaGJMM1FNOUhyS2d5WU9BR3MvUHI4OGkzdUhV?=
 =?utf-8?B?Vm1vbHVkeFVLd1VwUDlFSzRlVXBhajlvOGQrRHBBa29vREhnMVJ3Z202Z2tk?=
 =?utf-8?B?M1FRY3VVUi9yYU85dzg2c1ROd1FOODI2elZvR2t4bWsyUWhQUHVFenJPZUFL?=
 =?utf-8?B?ZXNYTE5FSmRCcCtuT0s2UjdJVU83bWVSTjFMc01mSG0wUDhTTFNZV0JhWm9E?=
 =?utf-8?B?aVB6RTJVMmw3WG9SZzNpeFNlbnI0ZG1rZkhTdnZnRFJPSlF6ZXZxMVE4RHlw?=
 =?utf-8?B?bW1XcUJtS0ZCMytXVkxvSWowVDl2K1dQOTJhVkdydWRWK1M3bTFXcENUSnNu?=
 =?utf-8?B?OUZhVGpzcUxUWEt6NjFFZmpWUWI2eWhiMHNncmRrbTQ2VzdLbUNkS0liMzdD?=
 =?utf-8?B?ZXhqQ3QzbEk4aHc2NWlOcDd2U25EQlJUKzJ2eGtZUFN1a3ZqQXNBazZXSVlF?=
 =?utf-8?B?c2hSZFUzWFBJa3g4dnA2aWRPeFhGdjc0Y1pONnhxL09XMGhYS1hZQ3BiT29G?=
 =?utf-8?B?WTZYdXZGWFZRRW5CRkNkUW1KSGpFdHpkbkNWNFFKaTJCdmR3UlVqdmlvWXU2?=
 =?utf-8?B?bWFsNTVIZXV6b3c3NVFYbGdZK2lMc1c2a0E1YTNMU0lCbjFMcmtlcXFIVzB6?=
 =?utf-8?B?SkllQUZRR3M4VnhncExsMU0yWmhLK2JkUDRmNGhMK3VoZG1MM3VlQWxuTXNE?=
 =?utf-8?B?WjJmejNxYjhzREpQVWN2M3dYTDUyMTNrenkwZGo0aHAxS0U5WDNBMWRMRkcw?=
 =?utf-8?B?eG5jditqcWpWY2FIOFVTZjZoZUszWVFkL2tEY2JRazFJVHp0SWQvMWJ0TlBK?=
 =?utf-8?B?YTBXUGQ1aFlCMXpqUEVtS2VaRGlwWjNKTnF0enhRbTQvVUk1eitEYmNpUlVu?=
 =?utf-8?B?aFZleVVQbFZRakFnT0FrT3o2bnBoay95VlBpY3c0MWdJSXVQRG8rbFgwL05R?=
 =?utf-8?Q?9ek++au36Tg/vGQlRaGO?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RzNFeXlJTkpyUXZYclZqV0RxbU0vUFlrMnFnUU1FN2U4RTd1L0Q2YVhUM0JT?=
 =?utf-8?B?QnFuNzk5QWJhcGFaR2VFVmdaektQMGJlNDBCNGpIU3R5M1p6K2JEZVpkdU9I?=
 =?utf-8?B?dEtTR0pIb0V3cExnalBENDkzOHpLL3RYSW5vMitYWVdLcFF2Ymx2VG9IeDQ5?=
 =?utf-8?B?UFRZcGVzMld4ZElINHZ4R2dBcXZVeVhOVERDVUF2NjhXd0U1LzFSbzAyakZZ?=
 =?utf-8?B?RVNtejZrQ29KRUd3YnF2ZU1abzRINkFUZUJMcnZwN1BGajNvYzBJdDZRaGdJ?=
 =?utf-8?B?enplOU0rOWJ5TUgydUJTNENmMWlqTnl6QjdWeTQ2cC9maW1hR3BIb1ROdng1?=
 =?utf-8?B?UkI3Mm14a0IvcVpzclZBN21Ha3Z1Y09WdjBkS1JIK1VUZE9tNlNDaHc4TWhW?=
 =?utf-8?B?QmptdkZQOEVyTXlBOHVrcFNhWXlQUlBsNEliODhNWUFkdldZRHI4QWdJZTdv?=
 =?utf-8?B?TVRTTXJnYXBsMmdOL1NpSGQrNWsrUHdwTVlmSWI0cnBrREVaVHBSNzRzclZa?=
 =?utf-8?B?ZEloM3R2M2d5RTdwWXRRQk5HTy9na3k0TXpYdnJEZ1RndXR0cVRGdE9obHhJ?=
 =?utf-8?B?MnpWc1d1UGpzcGhYYWdPTGhPUWJmQVd0ZU5QWEFaUlRSMEFwUG1wQi90Rkth?=
 =?utf-8?B?Ym5LTDVXTUpIS3B4YjJZd2Y1aWk2MDBxQjdDc3lFN0l5SmhFQ2Nod0hhL2lG?=
 =?utf-8?B?dDZ3RnhOQWJKK0tjckV3M0RoQnd4RkVYbHZYRkpJVjQvZHpSY3AzUHpoZGY2?=
 =?utf-8?B?ZERvdHRRQVE5SldoQVRwYUlHRDR4R0xPZ1dmbzdCRUxrQ1ovSkROQXphMGlD?=
 =?utf-8?B?SGpFUHV6SDErTW5NUFdBZkp2c21KemZDSXEyeE1FMFh2Vk1rSXhFaHRmNXpy?=
 =?utf-8?B?WHlBY1dqMysvUkdla1lrLzA4QnE4dGttQ0J2K0pzbXFsV200VVlTaW9YSGQx?=
 =?utf-8?B?QXZkV0ovNzV4cUxVczFPdVFjdldUNVBOQ05DaEtWcThmdEJneStjaFlCZFRu?=
 =?utf-8?B?VUx2Q3VwWmZBTFNFM3N5QnhsVUVwU20xZDNXQUdISlJwOW5Jdzl6RTAwc3Nq?=
 =?utf-8?B?QkVQSi9DdVdPa3I4Tnd6TWwwTGVmN3ZOUWUyWTh5LzlTcVM0ekVRbW9xcElS?=
 =?utf-8?B?L0ZZd0dXYXh5Zm4wK08xbFl3YmJac0JZS09XYjZWd3I2RWIraGdsMjFLejNQ?=
 =?utf-8?B?bnBRckZ6aUkyS2laUlB3citNVFNreEdmMDh3ditPK04vWWFSakhSMk9wUjBZ?=
 =?utf-8?B?bVNsV0swbjV3R3BTOTg1UHpiTS9JdmNxelNSNitPd2NZVUZSczFkYjdRQ00x?=
 =?utf-8?B?YlpKaitRM0VZaVZhOHVadG9UNVR5L29qYUprOXZGTEk4UEsrOXpYT2g5ZjlO?=
 =?utf-8?B?UnFSWklSOWhWejFGdWFVQXM0TVVqRzNIa0VIWkRCb2Y5QnR5bGsxWnFhWitL?=
 =?utf-8?B?bkZIa2pmVlBnS0h2VTRDVUc4TWl1ZTRVSFowNGFxb3VuV1JxR2FNSHE0ZWcr?=
 =?utf-8?B?MUhwVjZIZzJxRitDYmFWOHNTMGE2WGQ5bXU5MUVyVGJpT2FHMlh2UDZCR1Nx?=
 =?utf-8?B?OGVHczhFMFZWRTZpUHNKMHVKYWZtb2ZCMmUvTStTbjBhTjcrZWx1Y3k5SnBZ?=
 =?utf-8?B?QW84OEFQaGd3STNMWEoxS28vRzlIMS8wMTRNUGZmM3ZJZDM2TklpcVJDMGg3?=
 =?utf-8?B?ZXA2TDdOcllYZ0huaU9SL2dQbTlnZ0Vvd0RZb3AxeG1XL3RRdFhpRnN3bDRI?=
 =?utf-8?B?ZTZGaGdjbHJZTkdkWXhtRkp2RDdINjRHZUI4eXZLTE1QR1hLYlM5VWI2Z25D?=
 =?utf-8?B?WVkweXpKUm1mclhHRjFpcmFYUnFUMTdBOTRRWEZycmkyNTQrUzYwYklnMDZy?=
 =?utf-8?B?RjB2dlFsR2N6ZUpKdHR2Mmg4YzZUZ3Boa3lVUkc5QjlWU0pDcE1NNlExODN2?=
 =?utf-8?B?d2l1dXJxTWNZaUVObEVDdEtmREhaUnZVdXljUHJPdml5ZUpuN2dabTRaRHBh?=
 =?utf-8?B?dVBVQ2hmb25DUGEzMi9seWpEWDRPaiswWGdVQm5hM05Gd0VDVys5eWU2MCtv?=
 =?utf-8?B?S0kwaVUwUGNVLytOMzhOa0w3NVpUSERHR1FNR29weitldnBMeVk2bysvVER4?=
 =?utf-8?B?dFB1QnFqbE5sOWhlV0ZMYkR4M21rOGFwR3dBYkR4dG5iazF2M1VLK0VUa0wx?=
 =?utf-8?B?ekE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47dfc6a6-dca5-4159-05cd-08dd054f53ba
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 08:27:22.4314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mc4A6bnxhD0m3FfK4KyaHhg1SlLzppx9HNbgrhxME8iD0gIOGYoJuK2AQGxgRtIMZf8Oy9bza88cVaTCreHxKMgEaFRfK+5yh5Hg9Qk6UPE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5269
X-Proofpoint-GUID: 8U2P1Q_nhhjAuQrKeQ_Eb6P_YBE6Cok_
X-Authority-Analysis: v=2.4 cv=BPnhr0QG c=1 sm=1 tr=0 ts=673705ed cx=c_pps a=IYePPuTyj3qIg1BHBNk0GA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10
 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=K--Kt50OwFa87OWldFYA:9 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: ZRI64eRrbbL4R8ycXSjIMRq2bMexbZZ-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-14_05,2024-11-14_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 malwarescore=0 clxscore=1015 mlxscore=0 mlxlogscore=681 bulkscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411150071
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Nov 2024 08:27:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207182



On 11/15/24 00:28, Mathieu Dubois-Briand wrote:
> On Thu, Nov 14, 2024 at 12:25:17AM -0800, Robert Yang via lists.openembedded.org wrote:
>> From: Robert Yang <liezhi.yang@windriver.com>
>>
>> Fixed Ross' comments:
>> * Add -n to gzip to make the resulting files reproducible, so we don't need to
>>    decompress them.
>>
>> * Makefile: Let bootchartd.conf use EARLY_PREFIX, so that bootchartd.conf can
>>    install to correct location.
>>
>> * Set MANDIR and DOCDIR to make the files install to correct location for
>>    bootchart2-native.
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> 
> Hi Robert,
> 
> Thanks for the v2, but I believe this is failing some builds on the
> autobuilder:
> 
> ERROR: bootchart2-0.14.9-r0 do_package: QA Issue: bootchart2:
> Files/directories were installed but not shipped in any package:
>    /usr/etc
>    /usr/etc/bootchartd.conf

Sorry, it will be failed when:
DISTRO_FEATURES:append = " usrmerge"

I will fix it.

// Robert

> 
> https://valkyrie.yoctoproject.org/#/builders/25/builds/432/steps/14/logs/stdio
> 
> Can you look at this issue please ?
> 

