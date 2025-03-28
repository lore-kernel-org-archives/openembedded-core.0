Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9731BC3600B
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 02:43:03 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.2789.1743129779298280034
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 19:42:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=51822bc331=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52S2gwbI031951;
	Fri, 28 Mar 2025 02:42:58 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45hje1psq3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 02:42:58 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52S2gvsb031945;
	Fri, 28 Mar 2025 02:42:57 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45hje1psq2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Mar 2025 02:42:57 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LAgvdBi2pLXC47S6yelborCTetR5icRLFnN1nKLszaWIig43sktwRjDNqyi9OBf+R0J4wxDDAACg0Jo5B9QFbGeOourbTQ3Ghmw6288clYH/7YObrOLgyRapNCvf9cgW3IQsQi4iBul3cWcGxDlh1xMiC0TOlsxtUDL3gFJuvhgoew5sw3xdFXvRgKyU1flHehZSxXChCdQaGgHn/CX8Shqm4D8RgciMVkN5fmYDY3uxDpZ0ShvPjHvO3wYMumpa5WGhSK/sVpNKqpdqgJ+gV+qJW6f6sApY/QOgRkgxRLydNsmddmO70G9CuC2w3rxdxmRLta8muiUuL4oYf3Sq0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4lgv8Bxk/QPhvFVZpx8fosMlS4eWvZYG4xcym/cSJVc=;
 b=Hm7Cij5/IMTu6+vmz5/k/o/IWO8Z8W60s0IQbMBRqNe9aRS2U2s3keg/9OYhwLFLrKs9qPXBX8jmiv0JrjMlvPNzeRaLBv1cAHdL9nO7GdO8+fOMlRH4nWjwV2xd4YnkDeKYkz6Y6NNyC4EasbCBNDAmhw3q0sUjMt4R38UaGyYRmk+G+vEbKDb9UqQznmpJFMtqhAfxnLTNlDtD+kqxp13kZQGNTTVIo453l3G6oTh27hOaV72UdoOtssevXmDyXtfz+cDVfMl82PoKAZhe0++pkcmpndw54kmwxyqo/FtMIfvuio/f2peMkLqIzJ9RTQzgXQ89YPip3ANb0fJuxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH7PR11MB6555.namprd11.prod.outlook.com (2603:10b6:510:1a9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 02:42:53 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%7]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 02:42:52 +0000
Message-ID: <c03292ee-b7c3-4452-a812-4e796eb5010a@windriver.com>
Date: Fri, 28 Mar 2025 10:42:46 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC PATCH 1/3] version-check.conf: add mechanism for
 checking version mismatch
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        alex.kanavin@gmail.com
Cc: openembedded-core@lists.openembedded.org, randy.macleod@windriver.com
References: <cover.1743052694.git.Qi.Chen@windriver.com>
 <2ade23315e080afec9b58e7dbb615b5e6d3262aa.1743052694.git.Qi.Chen@windriver.com>
 <CANNYZj-hqZOEcwtvnCdSY-FrVBfR8bZxS3OgjUmWLLQ__+307A@mail.gmail.com>
 <c688ddacdb12fbf3b5ff45b27e6a63f7e8892ccd.camel@linuxfoundation.org>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <c688ddacdb12fbf3b5ff45b27e6a63f7e8892ccd.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0183.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::16) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH7PR11MB6555:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b9fb333-21bc-49c4-5353-08dd6da23c90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MFlLN0hTNkc4VXdWdERoME9GUTZMVUoyMVdXOHpUa0VIMVZhMVhzc2JaM2JR?=
 =?utf-8?B?bWRNYUlVUHc3SjlvQUpwRGRDWmJUbWJDWWVvZStZZ2ZZYmdoYVJ0UlNtQXZm?=
 =?utf-8?B?endmMVBnZS9LUFVNWUF5TVEyckhEWjlyejFJeFBHbzNpeXpDMHZuNUlGY21L?=
 =?utf-8?B?d3ZBNFNoOUtLb1Vzc3pWcmNHQjBTemZ6VE4yTXJhOFZoQzk2cTlVWDJUZUo4?=
 =?utf-8?B?UStZV09FeTRUNy91TEU0SGhjaFozYVNLK3dWbDdpSkRVbFlzcGhvRm8vV1Jv?=
 =?utf-8?B?UHZlS09qajM1L1lRZEFhZXFUc1lZWlZpNjhCbnFzdWwvMWx6R1NRMEs0dk41?=
 =?utf-8?B?TWt2c2gzak5ENmx5eldTN1UrWVU1M1FHdHJ1a3JRa0lLaE8wdHZScWZEanVs?=
 =?utf-8?B?RzlxNm14Z1UrTmlxQTJrdUEvTmQ1N29jMmJCMU9XSkR2ck5xbXZFdU1IUkxE?=
 =?utf-8?B?VzBBU3doSU81ME1xK08vVzVUb3ZML2RGTlFBN0VxVUh5cVJKT0RLVVVnVmU4?=
 =?utf-8?B?bVJtOExkdTR0WDlHYnROZjI2QlVGd3ZSaktqRHl4TURlUmdEdlpGOGlyMEg2?=
 =?utf-8?B?N2haNnJnTGpuRzZ4ZVVpU0VwcXI1U2NhQ25XVnRWazh2WXlCdDBTUVhlcXhv?=
 =?utf-8?B?K3orYmlleGltbk1OdW5MT3NYbzdvMzZiRDJyQ2ZEai9MT2ZkTlJQYy93cE5Q?=
 =?utf-8?B?ejVCeHU4MG5OZE80UUNNZkNSckdTNnpSVW9ZVlVBck1BTnlOTXl5Mld5S0RB?=
 =?utf-8?B?emZYTlhpU0dpTEgrWnBLazF1WEQwVFNwcFYzMFlRZ3Y0ZFI0M1Zvdkk3RW1H?=
 =?utf-8?B?WjFxdVpBbzg3SVM4Z09FYXJqTlNkVysyLzBTMTBqMDk3cGI1UWI0MTFwSmx0?=
 =?utf-8?B?K0ttclpZczM5a0NQeVZ1dTlFV0g4N3U0RVJ3T0R4WjU5b3hzNG91OVQzeFdv?=
 =?utf-8?B?ckRVc3JRQnUzNXlEMnFmaGlEclNESWVIbkllMkJMMERuUjFZZktwcjZEQk4y?=
 =?utf-8?B?WEw1bUlNSy8rUlJPUjYwMDY2WmlPR1JXaGIwNG4veGNxTnJTN0ZoUXVSSytT?=
 =?utf-8?B?Zm9GMy9hbmZkejVndFZiejJPZTVRYU5tTDFmYnQ2ZGxrYzM0U3pMTkhSUEw3?=
 =?utf-8?B?YWtKNWhxWjhGaWhEL2NUa1NhcU9MblFldnQvUFduRGluaDYwd3p2KzZzUXJz?=
 =?utf-8?B?eUdNL2lGWFkwRnJWTWxOVzlrZ3FDYVB2R2tZUWxwSklDa2drN0xtOG8vc3Ju?=
 =?utf-8?B?U2ZhOGdYVE5xQzJLZXVCL3AyUHJnYm5LNlcyZHROVXFWVzYwMS9PeThNMWtU?=
 =?utf-8?B?clp1VVByMFJLejFhdmNnekxvd2gyZ2xubVBsaGU5cEUxRVNhQVZyVVArQnp1?=
 =?utf-8?B?ZGJvdkJYL0hXUndNalBjZGh2ekIrV2hBZXZRODQ2R2ZnTVYybkEwb1lSRXdL?=
 =?utf-8?B?cE94dEsvcFhKYWVhZzNSZ05WMVJ1MVR1cUdPVmtBbmNjZGN2MlpJZnNRTUhI?=
 =?utf-8?B?aGsxSm5ZWWsyKzY0MmNPT1NlNjJlMXF6UGFUNHIva3d2MjEvTXJGeXozSkF0?=
 =?utf-8?B?RXR1NlZoMk9oTXRJU3l1UmVYck5FTi9EQUkwZEFTV1QvTkRIZ2FzZDVWTW1Z?=
 =?utf-8?B?TzdQRlo5Wk1NMTZlSVVILy9xenlvTEc1SUpnR2k1a2JtdVpJVEZMQVp4blhU?=
 =?utf-8?B?WXYvZ0xPcGMzVHErblFaUDh3VFVxOVFBZWhmRTh6UW1QZVYrUlJtajRiQldT?=
 =?utf-8?B?Sm1zUTZQZ04zOWZiQ203SmFiclpESFRUVzgweTNBZ2k1bURsTURlcmZwT29m?=
 =?utf-8?B?WUIxNGMwd2dnZXdVbGEvL1UxajF5bnZaWVp5QUk5TWdNenhQcjBTV2d4T1Rh?=
 =?utf-8?Q?lu0TZ7xYeGdl4?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QXF3d3NHVXpCT0c5RUNsME00UkNFQWoxcEdYQkxzOU5qWno4TDJXN0VKRGc1?=
 =?utf-8?B?cFI3VklFZ2lqNzdCUWd0cU1CTUJjTVRrTWw3NlR3dUlsaW5Sc1NxWTdueXlS?=
 =?utf-8?B?eHEyREtnb3p4R2NsV3NncHA2azBJMmpXUXJxSW45ZVBDVXNjQjhDZHBzUWJO?=
 =?utf-8?B?TGQ0MU4vcE9iVjBqUUNMQm12eGVZZkFRbHk2bEw4YTFtS0Q3dVFXMTdlcWp5?=
 =?utf-8?B?MHRkdXlISVhSNWNlSXM3azlHSDZmR0psaUdsQmp5bVJEczI4T1lDUUhLYzJE?=
 =?utf-8?B?bEdKaFFFREFLb1NpLy9tVHFFTjJLZjBlL2hBTUlBRUlFcFlMeUlDNlE5T0o3?=
 =?utf-8?B?aldKQW9hR2FaMGFYcFVZSHJCSm4wZFU5ZXNEWGcyTnRqVjloa1FUb0hmbDAx?=
 =?utf-8?B?d09pNGJZTU84RVc4ejYxQW43ckZnWHp4VUlLc25qYVdLZ2dRdWErelUxK3RH?=
 =?utf-8?B?Y3ZJZlRLcTFTTXdpVDNUU1c3YVIyRHNEUFJvVU5YQlJuZXlUOCtEbkhXWS9F?=
 =?utf-8?B?MkVrRlVwa1NWVzBidW15YkNYdE9KLzF0Zjhib2dxd3RDTXUrQ0NtQXM4UFBN?=
 =?utf-8?B?TWFScDF1eCtiUzA0NG9WSjZhTjRxOWVMQnZpSXlSYnl4SFprSk9ZcW9NWWhB?=
 =?utf-8?B?T3NSa2llVTU4aTI4bkxXNytjbDlGOHRpRi96aUxNMlRZKy9OWC9USXRtSkVP?=
 =?utf-8?B?RlpIV2sxU0ZhV1Ywejh0MmV1VEtHa2RqQi9BWkQ3N1h3SUtWeTF3a0MrRXlF?=
 =?utf-8?B?N0VlZXhGVy9sVDg3S1lVRWN6TjNoS05ZODZyUVlXd2FJZjdzS3pkbUV1d1Zp?=
 =?utf-8?B?dWRiSU5IQzhWYjVnWW1TZG81VDJJQk5yOTlUeXdORlNCKzgzbkpKY2MwL0lk?=
 =?utf-8?B?Z3ErVlY0RXJBcFErMmJTWTkxWGt0TWRsVkZEYU1kTFJGZW1WVGlHenJDTEZO?=
 =?utf-8?B?ZEVobklkT0lCMTVFdm1FMVU3d1RaZTBFZGt4cURFNUU2M0NPSjJyWmpudHlR?=
 =?utf-8?B?cEwxbkEyNm9VUTJ3YkI5VE1hSWNwd0F6RTZsUzdzMkVmZkwwVEZaNGE1M0R0?=
 =?utf-8?B?WFdrUXpDaFBxTVhVZVpUby9kOHpPYWhBVDRRUkpLRnJlOEhwVnp6emt1b3dL?=
 =?utf-8?B?QzhiS01jVnVvbllTdmJwMHdQcUpoYjlFZm5ISEJCQW1mNWZnNXF6V2haR3FV?=
 =?utf-8?B?YVppcVNPRzFZQy9EWDcrNjJ2LzBPeTgxbzhYck9oOFJvZW5sbnFLdmowSUNX?=
 =?utf-8?B?QU1nNUlBcHNmSTkrays1TEtsODFoOVlHblBQRVVOVlhNTkFUSW5uTEdSMW9p?=
 =?utf-8?B?MTYrQmp3bE9PSVlOWW1OdS9JU1lYUXF3WGR6SzAxbG1ndUJUWHluRDc4eVZX?=
 =?utf-8?B?aW9hbUFnVEZxMkRyNXJMZ21iRTczWHZXMHAzTVVPUldTbXZKNE9wcDd6OHh1?=
 =?utf-8?B?NEczZGJUWFVrM2JEaHFIZ3NiT0tNR0xOLzU0VStJZ0RPZlVsS2FhQ1JMcEYy?=
 =?utf-8?B?NEkwY1ZrcTJDS0FyQWJmVkM5d0hRWUw2SzZyQ05PVVk2Qmw4NTRhblprUE5v?=
 =?utf-8?B?SWFHdXpXVUFtZ2ZBdXYyZDl1QWdWTStwcHBNcHBnNTFpZUpXMEduQkZzNEta?=
 =?utf-8?B?OFFoZ1VvYWxqeHZxZFNlcmJKMmRRN0cyVHF0VDFJMGc0MGF0T0dTay9MVlNJ?=
 =?utf-8?B?UjEwQk0rSkhNbldSa3lweU5lditaUmFHeTlKTm9VRzZjK2Z1QjNqclZidXJF?=
 =?utf-8?B?RVEwTklzNVVabGFGa0pHTDJZN0NkamdVWGJhajhQWW9IODhzTktqZmxsTFBh?=
 =?utf-8?B?ZEZoNGhCejNYeEd5NERSOGlMb0lxZXBMdFJQSEJxbERmZS9OUjAySDEzZklW?=
 =?utf-8?B?MGl3TG5oL3o4N0UrT2lzZDV2VGpHd0NITmFJK2VnRkZPd3dIMEpMVkM5YnRs?=
 =?utf-8?B?a0dwNWdmcFZVOGI4cFVEM3hHVVpjNnFnaEoranRsSjQ2dk1JVDRkZU9VTmpo?=
 =?utf-8?B?N1lMbyt6Nk45YVl3TVN5YWpMNnA2byticWlPZEFMWndUNFRtc3ErY2dQV3Er?=
 =?utf-8?B?dHMveEZyN2NFNXFPUTFMMjYza2g2T1hEczcyUVpMOVdtMzJXWVRSYVJoWGc2?=
 =?utf-8?Q?vt6nXXDbP/0PyydvCM2/SUGYg?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b9fb333-21bc-49c4-5353-08dd6da23c90
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 02:42:52.5898
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n07kUQJWxgPueAcDVKk/BUyoage3puDG0NxeLV/Nl4WcP844k/hQM9LZMvU5Ow4Y0MfPJRGCYRvw0yIJ50hUGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6555
X-Authority-Analysis: v=2.4 cv=KPVaDEFo c=1 sm=1 tr=0 ts=67e60cb2 cx=c_pps a=wMNeujlvNozESTkKEiiyVQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=H5OGdu5hBBwA:10 a=Q4-j1AaZAAAA:8 a=1JMobCSNk5DIXNeIylAA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: 0Yji5HQ2V-1CjqnUuRo-a42gut17DzVE
X-Proofpoint-ORIG-GUID: zG-4fEPgdSv8ldIpqgCJpcqCPhqXvYl6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_01,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 adultscore=0 impostorscore=0 mlxlogscore=922 malwarescore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503280017
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 02:43:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213806

On 3/27/25 19:25, Richard Purdie wrote:
> On Thu, 2025-03-27 at 12:22 +0100, Alexander Kanavin via
> lists.openembedded.org wrote:
>> On Thu, 27 Mar 2025 at 07:22, Chen Qi via lists.openembedded.org
>> <Qi.Chen=windriver.com@lists.openembedded.org> wrote:
>>> The basic idea is to use qemu to run executables at build time,
>>> extract
>>> possible versions, and check if there's a mismatch found.
>> Should this check be in its own layer for now? If it's in core, there
>> should be evidence that it's broadly useful and used (and no one's
>> asked for it before as far as I'm aware), and it should be tested for
>> correct behaviour and against regressions. I don't feel it meets
>> these
>> criteria at the moment.
>>
>> Git fetcher has recently gained the ability to match up source
>> revisions with tags specified in recipes, and will error out if
>> SRCREV
>> is set wrongly. We just need to update recipes to specify tags (with
>> ${PV} in them somewhere, so they remain valid on version updates). So
>> sending in those updates would be most welcome.
> The new SRCREV vs tag code was my first thought when seeing this patch
> too.
>
> It is a nice idea to check the version information and having something
> somewhere to do it is nice but I'm not sure maintaining this in OE-Core
> is the right thing to do for it...
>
> Cheers,
>
> Richard

Got it. I'll maintain it in its own layer.

Patch 2/3 and patch 3/3 are fixes. Please consider merging them. I'll 
send out V2 according to Ross's advice.

I personally think this version check feature is useful for layer 
maintainers because it will detect a few problems I mentioned in the 
cover letter. So if people want this feature in the future and the 
decision is changed at that time, I can send out a new RFC with oeqa 
test cases added.

Regards,
Qi


