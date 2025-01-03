Return-Path: <bin.lan.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C8D3E77188
	for <webhook@archiver.kernel.org>; Fri,  3 Jan 2025 07:32:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.26064.1735889550436178807
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jan 2025 23:32:30 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3098435690=bin.lan.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5037QZZX019566
	for <openembedded-core@lists.openembedded.org>; Fri, 3 Jan 2025 07:32:29 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2046.outbound.protection.outlook.com [104.47.58.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43t6j0my0y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 07:32:29 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j+Ja8kmQJ4w6YbIAIC/FUIYRlG2GZPMksgyOP6IUw9yAwztGRsx90rduknmTKiPdzOiZkQ6S/gpWPxw99F7r73cgDIDu5pxcKVICw1SzyR08dGW2kvPWaTN5AFpxg3LwRITj2ZOjZKseH4lc6p0yqZAWMGt4W5eCmVQSyCnU1X2f/IAhBC2mJPG7DBWpr+DFL9vHtsJ/KhmpRcKs4SxwApVpQXpzIbpVZadaL6AS+1xe6HbE2gkGD02SG9gjjg8gVdTpWDUfp9hG8kAj/7z4QSU/jKBIMLUbAu2wGncx1W/0OOvMOtGf16xmklUMeUFkqTdJ6pH2DG/3YusmigI4aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XQhrVHifeUcO7lZpIRH0FbJywKg6ns0KyNT3IdS2Nwk=;
 b=PM9ylfUT2/7IgLzSqgp4xKu9DgH0Bu5B1MbOS0gG2RQNkb9a974zRmMlyx6I32cC85QnpD1AOdF4J2oMGxQrBiUrDSSULW4Y8V2pl6bIDfT6JsuLf17dBSINDBUTQpGF53ea38go31lUdWNF8mXEQxqd5j8j+DEDacmCXz1THso+mPJPLBHuEbNqOcipsco6dKm/PBWvPdBtVkQcxR6VpCPUwBB+DhXKTcEx6KRjyJrOmr0bUjiWzbMRH844Ng4GaDC+FFsKRqYQhaxc83x0WkArhwtvvh0M/Btvt+8ij+6iAUMQGI8EB5OaxL5Ux/za2uOm5AUkTYWcK88bl/MU2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8701.namprd11.prod.outlook.com (2603:10b6:610:1c8::10)
 by SN7PR11MB7137.namprd11.prod.outlook.com (2603:10b6:806:2a0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.11; Fri, 3 Jan
 2025 07:32:23 +0000
Received: from CH3PR11MB8701.namprd11.prod.outlook.com
 ([fe80::5727:1867:fb60:69d0]) by CH3PR11MB8701.namprd11.prod.outlook.com
 ([fe80::5727:1867:fb60:69d0%4]) with mapi id 15.20.8293.000; Fri, 3 Jan 2025
 07:32:22 +0000
Message-ID: <a32c9b7a-eadd-438c-a494-0b3d9ccde18f@windriver.com>
Date: Fri, 3 Jan 2025 15:32:18 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] package_rpm: set
 clamp_mtime_to_source_date_epoch to 0
To: openembedded-core@lists.openembedded.org
References: <18171B17FD27DA44.21892@lists.openembedded.org>
Content-Language: en-US
From: Bin Lan <bin.lan.cn@windriver.com>
In-Reply-To: <18171B17FD27DA44.21892@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYWPR01CA0044.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::11) To CH3PR11MB8701.namprd11.prod.outlook.com
 (2603:10b6:610:1c8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8701:EE_|SN7PR11MB7137:EE_
X-MS-Office365-Filtering-Correlation-Id: 98611377-1e02-4ad6-3892-08dd2bc8c31d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|4022899009|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MGNRb1Q1dGg1YzJ2K0p3UlJUS0w1VDNMbzdVOFhWWnBHeG1mSkxkbEJDSERI?=
 =?utf-8?B?MnRTQWcrU0lTRjRBVGFyeklvNGtOUWMzWU5SZXRTMWVERlMrSzkrQmU4SHBL?=
 =?utf-8?B?TmJWc0JNVWI5czYzcW53dTA1RU9JcUN1Nk1XSzZjb0xWZ2Vza3ZBTzF2Y2NS?=
 =?utf-8?B?UnowTEREV09hVmNNdWhaM3RZQ1NEcWkxYWJ6TklDYUIrbGdOSnBzOXB5YWgv?=
 =?utf-8?B?ZHlha1g3VlJQQ2JmSk9CZHBtanRrckMvenlhQU5FUjkySWg5dTZQeUZBbTZZ?=
 =?utf-8?B?RTlNR1k5cjdCajZ6NDFYWTdnendXZDgrYSszNHkzQVhDUThOeXJOQld1WUU1?=
 =?utf-8?B?eXlacVBzanVPTTVWRXNKNHJRVklsU3BXSWhDYmNMTFJIdVJUT1EyRm5uakpo?=
 =?utf-8?B?cWhvaTRMYThzdk1lQ21mdjZhVExWcjcwME13NFJpWGkxWFIxbmtnNHdENVFI?=
 =?utf-8?B?UHdQRWxsVVpwekFGTGlXUDllblZzK2R6eDNGNXR0NTlFYXdQSmh3NUZzTkdX?=
 =?utf-8?B?bS8xWnVMWkh1bWh4MTd2Z2RibkhWd0lja0E3WkhCdU1pV21HRFZaTjhVV2M2?=
 =?utf-8?B?WnhYK3NmZDBOcmNTazQzWGNrcTE4Q0lxMGJNY1dpL1g3ZlNxUGVtb2xpVHUz?=
 =?utf-8?B?MTEya1FjcW1qN0JOeTkrZllRL1FMa1FYc1N1MGVrME9YWE96QmU1U0h1bjVv?=
 =?utf-8?B?Wm95bGpaRE5BSDNudFVWVFplKzlQaHQ1c0VkYjZvb0tMRFI2M1o4a2dndXBn?=
 =?utf-8?B?Y3NMa0JPOW13WTU1NGZFWUpjR1VnSXZqNDdvRkVEdE1mMFRrVUEyc1JRYWYw?=
 =?utf-8?B?RFNxRkRlWGQrS3hocVY1S1poRWx5UmZtMEZmT2UyK3JqNnVIdGowek5YYkdK?=
 =?utf-8?B?Y0MxeG9WdkVwSE9ncmY4NXpkUXh0WWVwUUx6MmJidGdRaks2VTByNlFWMlBP?=
 =?utf-8?B?VnZJaTd2THMwdlZKM0RlVmxYOTRjMDUzd2ZhWFdKTlBPTUtXUDlsbUYrNHVH?=
 =?utf-8?B?TEhMUE9yWFNSaTc4T0xYQ2xhbGtpa2VuMEpML2VaUFhnSElwZDlxbit2aGNa?=
 =?utf-8?B?VXdySFFTcTJXcVROdmhkY0JqUWMxRUUzTDY4NWZGZWVXUTBxYVlwZjhXZ3lz?=
 =?utf-8?B?U0xQTHVPWnpkVFZVY2JicGZwbWk2V2RacU9FQXdMRzVVUFlzdGNVVHlPM0FS?=
 =?utf-8?B?UC9IZDZwczZVcTROOU92MXY3ZUdEa0NSdzdoRnd5TWMwLzNyaTJZUXl3S1BF?=
 =?utf-8?B?cEE4bkNWMithQ0NHRFdzdVZ4ZW5PVDVFVXhoRnVFTGtkMHhsdmdBdEhXSnl4?=
 =?utf-8?B?aWcyVlJJYUs2ck9lQ1JUOW10NnJ5czE1cW1OSDRvemhTNXRKZUcxdUx3VTZC?=
 =?utf-8?B?SE5va2piZGM1R1haTDcvOWMxWG5nSkNCd3V2UVozSVZqcndkRG1GbzduQWFL?=
 =?utf-8?B?a0UyUkFvYTFkRlJ2U1Mrb3l1NUlkTGJja3gzbWwxemhOWVRBaXBzd1NIWUsr?=
 =?utf-8?B?MVQvVUpmOEpYODRTb3M1ZzltVEN1NXFSM1RaSVVZb2JKbzZYd0dTSHBNcFVH?=
 =?utf-8?B?ZHlQS2RFTDU5ZXhjSm80NHF5TUkvcWhQd200NkJGMC9LYU1hNXoyRTlObXdw?=
 =?utf-8?B?aHQrSW5lbGtNeTJOcURtWEtKcUZMUG40ekFBRmY4ejZYdWpTUXk4QmJwYkcx?=
 =?utf-8?B?MVZPNWdIcDgxMDlPc25lY3BQV2pIMEFjWjZPVmM5NlNSOHFlMDhlMC9wUnVw?=
 =?utf-8?B?d1FpK2Zqcm9vYnpUZVFqU0xDb2ZHaDk4Mm5Sd01wVGFaalhpd1d5cXU5N3E1?=
 =?utf-8?B?S1BSWWhmZDhUZ2VjVVVqRHJVbFVTUU1SUjNmUy9ZTy8xby9kNnV0SGZoa0dR?=
 =?utf-8?Q?it0QgcCZ1BYT4?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8701.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(4022899009)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?THdRZkJSWXB1RjR0dTBibTNOUGNVVjVWOTVzYTZ3UDZPQXFWa0JjL3I2ZFNa?=
 =?utf-8?B?SnB1QjVnc2FRcTJnQ085MGNkM2ltSi9aUzZnUTlJd1g0QldtY1E3b21oRUlB?=
 =?utf-8?B?WGpzWFNDc3VTOFVSbEpYa01YdUNHOFd0emdyWng4cTBBRjNrZVRrWGthRWIz?=
 =?utf-8?B?ZjYwK2xyR3JTZ0F4NFY1Vy9LZWExVzFoUmkrMWdrYXBsak84NTN1cmF4S0pY?=
 =?utf-8?B?Z2tBK3I5WGRDeHNHYk1JYnhSYWlsRzBVNC8wbUI4OXk5Nnd5Vmxob2FiZE5Z?=
 =?utf-8?B?Zk4wbHhpQloxNDk4YmNMK1FJeUJ0bFlKaUYvRlhUdDRaQ2VkeXV1NW90c3FH?=
 =?utf-8?B?cTBaZ2RoaTlReG5uZHpJd1pBZ2VwNXV1dUhYUFVTM0loN2EzdjF3ZklBMG1M?=
 =?utf-8?B?T0dmMkw5Q3JtbzlaSXpRTEJrRzhzRVI2UCtWRFB0SktnZm1qZ1JWWWJZU0g3?=
 =?utf-8?B?U2l0d0VXRGZpdWJGZGFrUm13UGRjRWs1OC9PY1VYVEdHS2gwSlB6c2htSFc0?=
 =?utf-8?B?ak54b3FxcjFwR1k4Tk9lRlU5a3pEWFBpaFp2eE1XeGdrd0QrTFJFWWt3NmVI?=
 =?utf-8?B?N05wVzFhb1Vaak15WEpyNjhXdTlGMUFLMDcwd3BTTHhCS3Irb1VEK3d5ZUNm?=
 =?utf-8?B?QUZLV0ZUUXdQZThwaEpjOUh6WVpqQjhQbEgzbFgwRUE2dURLL3BqV1FOdFFR?=
 =?utf-8?B?eFNUeDBxRDJUVVNQUFc4N2NCV0FnZmlUbExFeVdxaXRkeVB3TlJOMWVPN0ow?=
 =?utf-8?B?bHYzQVpaWFZKNDdpOUozdzRycW94NERSL3VqZGViTVEvd2U5L2VtdTBtNDRv?=
 =?utf-8?B?MkwxNTFpWWVFVnZBM0k1cnY3NlNjWkRubkFLaDJqSjlZNWxyZ3AzZ1FMVlp5?=
 =?utf-8?B?S3A0YmNlVjVVamlXdkVWRCt2c0JDVW5tSkwwRFhBbFM4RWRnNkJsMHQ2Wk1x?=
 =?utf-8?B?eitzazNHNkdRWGoxckVwVVIrK29CdjF6WmVJRGlvWTFPU2VXaDFxNElGU3BX?=
 =?utf-8?B?QWdVQjNBVzJ2UTlKeVRCV0xyelVOK2JiMC9DMXVOZEhGSU9BTzdURFp5UnUv?=
 =?utf-8?B?b2t4MU9razVCZkJnOTR6UHZKT1pnaGV6MkYybytyMHlCUzhnOWZyY282SUh3?=
 =?utf-8?B?VnVmTkE1a2RJZWtiL1F2MWRuRUJDalhjd01BUXV3RVhVMFdubkZ3RTRxWmJV?=
 =?utf-8?B?V0pXT3QrT2lYL0NEOHc4R0pBM1V4THM4ODUxakJOeEtXQUtmbjRSL09LQjUx?=
 =?utf-8?B?ZUtHcCtDQk5Hem0xR0h1bDhKTjJnT0RwUTBURGJreXgrbHZQM0lNWHU4S2hW?=
 =?utf-8?B?Nkt1LzlRSGFMTUR1K2VjYjZrV0lTNitNcXl5T0ZxUHIwRW9QalBUZ05kME1M?=
 =?utf-8?B?dDlsRkdxWktIVmY0TmF3eStVbmVwVFpTRnVkWExxMFB1b2xCeHZsOTlHQ3E0?=
 =?utf-8?B?SFgvQjFQeHV6bXYrTVZ1U1dibGo2Y2c5Ym9JdXA2eXhqNVJvUGg3Zzlnd0Vk?=
 =?utf-8?B?U3U2b1JGRS9lbDFjRFlNa1pIUVNmSkVWcVJxK1Avd1YvR3JaYXFuR25rT0tQ?=
 =?utf-8?B?T2ZIMVl1eXJXRm53MDF1aHJEcWk1WVlrcWgyd05tTlhzb2dzUjlSZEY4TGYr?=
 =?utf-8?B?b3hYY001bURLaEVnRU5RRWNSbkcvNzAvTXFYSnFyN0Rzd0pzWFR2b0xBSUwv?=
 =?utf-8?B?QjJEZ1c3V2IrVHVaWWZyQmJUS1BtRk5PV0hpcXgxMVRucnVyMnpwZlJhbHRy?=
 =?utf-8?B?TzNraHNUSWRDaWZPaUE3dDZ0TmFic2ovWFhWNmQ3RXFKS1g5d2lkUGI1OEJD?=
 =?utf-8?B?T2lEUUxRWW85K0JZais1a2pyUGdMUFZjK2RrUjV1SEM0SVBmNUZxYmZNWWli?=
 =?utf-8?B?aUhadGg2OHJNUVQ1QkVUM2c3aFgxYTRvYURsTmMwbm1CUGk5aUNkZTRpL09t?=
 =?utf-8?B?bEZpaktqakxvYkJtM2RhMnBaLzc5b29JcXVEQ2RBWVRlajN3bXZSUU5RbFpL?=
 =?utf-8?B?ckVzeGN6MUxBRkQrUHViNUFvdlkzMmRxdVJtMGZqM3dpdEhQUzdOMytseHpL?=
 =?utf-8?B?TGhwdjg3TW1TUEl4dkU1WEhyeDZ3cHZ1SjhXOTVqRm1rWmVTb2xpMUlRc3Qz?=
 =?utf-8?B?ZldUOGMwVEJFN0NFVEM2eWRyblBZSHl3c09ObFdsdW5PMVo4a0szT3RBTytS?=
 =?utf-8?B?N2c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98611377-1e02-4ad6-3892-08dd2bc8c31d
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8701.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2025 07:32:22.6171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j30VFu4dMmmDRxE0tuEMXUtT56grq1Fx2o5ZLamYfLxcHe0zqxL1xYExv1jzmAfy0QYg8y40fDSp5UZ8yi8beROGobA9hG8WbQpTmdY2NyU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7137
X-Authority-Analysis: v=2.4 cv=V7KH0fni c=1 sm=1 tr=0 ts=6777928d cx=c_pps a=ur2hu7Zt/Tb0cWAHmjvzJg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=XOiUi3Og42bUCSo-DpUA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: pCJQMNUtHRGXFoZe8NBzgg8mjsrepJ5J
X-Proofpoint-GUID: pCJQMNUtHRGXFoZe8NBzgg8mjsrepJ5J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-02_03,2025-01-02_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=533 priorityscore=1501 malwarescore=0 bulkscore=0 phishscore=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2411120000 definitions=main-2501030064
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 07:32:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209324


On 1/3/2025 2:32 PM, Bin Lan via lists.openembedded.org wrote:
> There is the following warning when the do_package_write_rpm task is executed
> when bitbake linux-yocto:
>    warning: %clamp_mtime_to_source_date_epoch is deprecated, please use %build_mtime_policy
>
> This change sets clamp_mtime_to_source_date_epoch to 0 in do_package_rpm() to remove the warning.
>
> Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
> ---
>   meta/classes-global/package_rpm.bbclass | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
> index 3579d0d695..d7b57e301b 100644
> --- a/meta/classes-global/package_rpm.bbclass
> +++ b/meta/classes-global/package_rpm.bbclass
> @@ -699,7 +699,7 @@ python do_package_rpm () {
>       cmd = cmd + " --define '_smp_ncpus_max 4'"
>       cmd = cmd + " --define '_source_payload %s'" % rpmbuild_compmode
>       cmd = cmd + " --define '_binary_payload %s'" % rpmbuild_compmode
> -    cmd = cmd + " --define 'clamp_mtime_to_source_date_epoch 1'"
> +    cmd = cmd + " --define 'clamp_mtime_to_source_date_epoch 0'"
>       cmd = cmd + " --define 'use_source_date_epoch_as_buildtime 1'"
>       cmd = cmd + " --define '_buildhost reproducible'"
>       cmd = cmd + " --define '__font_provides %{nil}'"
>
Please ignore this patch. I will investigate it again.

B.R.

Bin Lan

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#209319): https://lists.openembedded.org/g/openembedded-core/message/209319
> Mute This Topic: https://lists.openembedded.org/mt/110402790/8566916
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [bin.lan.cn@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

