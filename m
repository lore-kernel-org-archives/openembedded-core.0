Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F133C28B20
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 05:14:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.991.1743570896322103870
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 22:14:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6187e20249=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5322jlrL007939
	for <openembedded-core@lists.openembedded.org>; Tue, 1 Apr 2025 22:14:56 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45rtc9r97y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 22:14:55 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5325Et9M030147;
	Tue, 1 Apr 2025 22:14:55 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45rtc9r97x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Apr 2025 22:14:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZC/QUy7ycxKn7+c5ay3r0Y47ZQgX5B4s1uSQjs8vs8IHqTV70fUBUXEIqnSZ4ptY0H9TDE9zospL/oW5j6gQ20S44+tpsWobUT9gG5X8Du/hi7hrNfgq5s1E8z0ZIxcWSRVJGea7zmEqf3HuERoap+nWyJtVrKikxoJQ+ZLRt6EIKl0OtJElD7fyeLahV6tbJC9NH3oXZt7L+Ik7NeaC3tzD9uc0ZliH35h7f27Jz9+N3XoJ8pSf3o9zcOYgjCBmL5WM0xu/RKsjw5f3kzs5s/1cOBz2qIy/CeT4/QBgGX1cJxy/5N4zjja1zJAjrm7RtWGji0vLEADQgdlkYkaHuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FNtEXhritxlKMT1pAh3V7YuUcRtOUEnbGAvYF3v/eEE=;
 b=WmJMS8sPR2r+9a7U1bBE2d0cuc1do9Rd0EZPkaRR+DUxWcpxARAFg6eibRrMm0X9UkYb6lm2Jny4G18MFQED9ePCsfim9iw7Nyh7CoBVaUj2VDT2EleMO42InrErZRby5Hl6KKzIO5CcCsoPS8FDooxMmZBljfR9I+uf9/kxK05FyrHSg+g3mS1TH4TyUsc/4edy50Sg5rgCJiRAM1k7Xk7CI0pFcnuUWFdNLiONy9+wRl3xyoBHGmUSRBzdIzOfWftmVu5/eOGh/clNOKFQhTrQ+DmLFcsJ1KJGMP8MwkQ8hVADIS+VK97yira/D2fcOBUlqJNHIvl6A4ZgHhByGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA1PR11MB8596.namprd11.prod.outlook.com (2603:10b6:806:3b5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 2 Apr
 2025 05:14:52 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%7]) with mapi id 15.20.8534.043; Wed, 2 Apr 2025
 05:14:51 +0000
Message-ID: <d2c0ab1c-379b-446c-a76f-518020dcdc72@windriver.com>
Date: Wed, 2 Apr 2025 13:14:46 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH V2] systemd: do not delete
 systemd-getty-generator
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20250319064016.1119702-1-Qi.Chen@windriver.com>
 <D766D201-766B-42FE-9474-9D09522C00D5@arm.com>
 <18303ADA6731991F.6378@lists.openembedded.org>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <18303ADA6731991F.6378@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYAPR01CA0136.jpnprd01.prod.outlook.com
 (2603:1096:404:2d::28) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA1PR11MB8596:EE_
X-MS-Office365-Filtering-Correlation-Id: 9db23547-46e6-4001-7798-08dd71a54bad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|4022899009|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?am5jbjcrNWJhSHNvQlhQSXEvUTdzL3AvSXFUWDZLMytiRnIxalZ2UkVjS0pB?=
 =?utf-8?B?aWJGZEZLR0Nlc0hPWDVKd0RjNkEzTjFEVURiamFVK01zd3ZoOEhoU1hDR1VL?=
 =?utf-8?B?TDcxN3E2Q3pFVWpEUy8zSjVVZmZKdlFNdGV5RE0zVEgzZnFINnRQVWdOQnRB?=
 =?utf-8?B?aS9sVldUa0ROMyswVGRLNjZxcGt6MlhBUHloeS9BcDJqaFE0ZjJrVDZXUUps?=
 =?utf-8?B?ZW5QYUh0RjJuY3FuQkt1WjJhNFdxQzlZWktKd2IzSE4zWURsVXV4ZjIweHlM?=
 =?utf-8?B?amMrem9Na3FZZEprdDN3a0dTWGVFdDVGTUVuNDFPQ0JPZ0VMNE5RQm1jTmFD?=
 =?utf-8?B?L2w0VVdHQTlZbjRNbVdKSEtubC8xZ2pzK1NpRVliQWRpdzBWTmROTUVyQ2FY?=
 =?utf-8?B?NDc3dE5YVkJhZmplM3BsaTYxMkQ0dEN1dHhSdFRpdUpMUWNNUkU3Q0pEV1Z2?=
 =?utf-8?B?VEh2SWh1UmdKR29OYTdtb2tPUDZONm5adjUwR1hFenBPeWM1UXRiU3VjOERr?=
 =?utf-8?B?RGU1ZktJV0lLdVFKTktjdkd3Zk5qZTdIL0NFVG96OEkwZXZzblNtdGdiWjRH?=
 =?utf-8?B?UmJEeHpQVnB1dXhlV2NJMmZFQmtUUGllS1pTc0xtdXFLUEh4QzdobkVnd1Bh?=
 =?utf-8?B?KzFVNHA5Z01Oc2JCUUN5eHM1K1o0UWRVUVV2QmtlSTI1bHFuUFJDWXJleUJk?=
 =?utf-8?B?bFFzU3pqNzdac096dE5GNEVMY3lpRXlRZExpaUM0UG96SEIvOWF1Z3MrK1R3?=
 =?utf-8?B?dFRTL0VGY0Q4dFhaVFB4ZVcvWlZqN25OV2RTQWx5WVg3TWI2MWdiZW14Nkph?=
 =?utf-8?B?STFRSmRjUHRKcDhIZGUrTVJtTHVPZlNVblhLVEJQMEI2K0lUcUpsT1lmSFdx?=
 =?utf-8?B?cWd3Qkx6L25EdkdTSUFNamErVEZxSmw2M0l2RjRCenpaa1RqU0oyMnpWRW5l?=
 =?utf-8?B?dzdTV3F1TklueU1JSWw2ckduL1pUeFBIRmk5VU10UkRFR2dIVURiYVR1S0VD?=
 =?utf-8?B?THZ6UVk4TllDdXo2YUs5MEt4RXhqayt6cmUzQlJkZ0x1UzdxZUFGdldWUDh4?=
 =?utf-8?B?NGJubXczYU5VbnNyTTFWVGczSlBLSjdyY0tXTHVZVGhXYjNpbnhJM0lTS2VV?=
 =?utf-8?B?NHh0WnRUN3dFRWF1dlRRaWlpcStxamNuUklILzE2UTkrRVRUajZNK2hTQW5k?=
 =?utf-8?B?RUsrRnJMdzZEMlhWbWswNWpweGdLL2VCMXZkY1hpWXdhUlhURzk4MVQraDZY?=
 =?utf-8?B?KzNXcHg4dTNQenkrdWZRdDJmTmNDanhHSndYWU1aRm9XYlVmMHlNM1RRVkI3?=
 =?utf-8?B?eDhqQ2o4TFdNZmVjVDZDZDhPRjBlNUVzNnYxdWR6aXpERmNkNEtNUHN6d0xx?=
 =?utf-8?B?Q0QzcWhSU3FxQTlYTFJuVzJhYTdiNXBHSDFGbHUydDRjb09hL29GZWV3RjIr?=
 =?utf-8?B?SytUY0o5aTJDUUQzL1lRclBpK3I1SkdKb1FSRlZ6NnY4S0thRVdTdmgwTWNs?=
 =?utf-8?B?MkJFa3RLR1lXaTFtVmg0OXJ6MHZ6ME1BZWlOdlh2REh5cjdZMFdFRFVlVWJ4?=
 =?utf-8?B?NlNFTEpBRlVwYXh5aEIvV2ZKRHJ3TEozR0Jsc0w2NEpHTlVlaVJBM3ZDWHZX?=
 =?utf-8?B?MUtrTGwwT2RncmdnVS9LbmlVSlN2bCtpK1ZPZitFK2tHVGVsalJvdlJIdVIw?=
 =?utf-8?B?QmVlR2h2Szg1ZU1TYkZVcVdCNzNKVDliMnQzOGtUSGQwa2FwZFI2NDBKSXA3?=
 =?utf-8?B?OCtGZ0ZFMXl5UCtJSU5GWW10ajljSXVWeXBVTkNVd0pXSTdOM2hYaHFuQWVY?=
 =?utf-8?B?VzNML1ZINml6cFdiVGwwU2psNlhUaFZLUGZJckx4T2lyM2U4eFFqRXRoUUYy?=
 =?utf-8?Q?slg2M/e4jvfo1?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(4022899009)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Q0RFTVovNXhnZXpya3B1L1htSGhSR2drQW4vWVpGUzFaOWVjbzlBT0RlQkE5?=
 =?utf-8?B?eWo3d1oyZU51d3NwS1hINTVHNXFiUVBJRGxUMnVlcFcrbVgzVUJ6cG4yTU9q?=
 =?utf-8?B?SFFNKzJnRFo5eCt6Z1hlRkhKSGVTbmhOMkp1RHMyd0RPK1hVVlBFQWdmS3Nx?=
 =?utf-8?B?TmJHdlUyMUU2S0xPYVVVQTZUdGh3d2JuSFpYL2pUMEtvdllrdTl4QllIaTVj?=
 =?utf-8?B?akF5eGt2YnlSeTh6R291YXRFWFE3WS9QcFpDUU1CRVhRWFRNeVQzVEsrajMx?=
 =?utf-8?B?WGVnREFZTmlvRGNURDV5MDNOcWh2NmxibnBVYmdsVmp2cFNZN2NWSDQzU3ZQ?=
 =?utf-8?B?alM1SlNKMlpWcXdwcXVzamhlSHBWWFZNa3h3LzF2cmpXZ2pKdzNGbjN6UGoz?=
 =?utf-8?B?VEdqeTN4Q0NoaENTRUM0N29SSHhtV2dPVkJVajNKWUJNQS9hSWlmOEtkVnVT?=
 =?utf-8?B?QTF3M1VyOGtzZ2VIdWF6dmZnNGdPQzdPQ0dEVmVzRm9wRGRKTFF5eExMZXhY?=
 =?utf-8?B?T0JwSktDcXl4NmQ4M3drdVBxK2ZSanRLMHlRdm5rWk9MbFZMbmhhS0h0MVJC?=
 =?utf-8?B?RzZwL1NFeFpqd3dBMFFSUjdUcDlGOWVXb1BOMldKUTJpRk5VdHpKa2JockVu?=
 =?utf-8?B?R1djWEJzUWcvNloyKzE3akUxR1BSVlphOEpHQ3NzWStIRXg3VVJBZjJQakJ4?=
 =?utf-8?B?UG1LTDI4enJQaGZ2Y0xPaGdUdERsbmtWaHlTMUZqYVoxdER0VDhkeFYvTytu?=
 =?utf-8?B?ZlVrcUFLaTREcnZRSC9yWER3bGRoY0tFclR0OE03dWpEU21aUG1qVXQ3Z3FD?=
 =?utf-8?B?cUJPeFRwSHB6cXNuVWRESE1tVW5Vb054K3FhaytTbFNVc1NkditIS2xDdW1E?=
 =?utf-8?B?eWlYZDNPamhjODZJS0FUdnNQaUhsT0kzY0pGOXFyemhDeFFHYy9NZndvYnNk?=
 =?utf-8?B?aUNLRFA4UWZFTmhQNnZ4Mk84aUJvWXk3QTZWL1g1YzZuaFZsYzZrakFkN3V5?=
 =?utf-8?B?RjdDbTNIaE5qLzJpOXcwN2cyN016OUJ4UUZ0bGtPdGMxdGk3ek92dnNrWE9B?=
 =?utf-8?B?eGd6SDh4UkpGWGd0T3FvanRlNi91TjZ6cmdxNzgwZEtWVjZMd3dUS01TdER1?=
 =?utf-8?B?SkxjY0RRNHVNUUtHb1EyTDNUZVBicDBKY2tMcUpkbGxtUVo2TlNOempScC9v?=
 =?utf-8?B?VzBCQ01nNGhQQzIxYkp3Rm1qOHhrdndhQ2ZFT0JmeHhnZVgxdWhIdWFmVnFw?=
 =?utf-8?B?bWdQcXFhbHhPaE1YOHQrdmM2S3JhNTdhUUlhd1htVkdnRlhWMG1wRTlPV3Rk?=
 =?utf-8?B?cUZrR0xIdUFUKzRpM3ZMUmt5YWRPSk5ML1NaeGd2TlRYUFZIOFFBbnVqOWho?=
 =?utf-8?B?QUhNcGN1ekJ3ampTWEZQUjBLNCsySXY2MXUyOVNaSWVBVG8zWmluQ1ZKUC9X?=
 =?utf-8?B?L3RORVNLUE0rWEFYSnJKcFd4Tzh6aFVuTzRYWlN6R1FNa01mSmpGci9yUHJ0?=
 =?utf-8?B?ZURzajg1bnBzOVhuQVVsSE81U1YrUjcrSEZDb0YzcDJHWDVnbmw5em1naHE2?=
 =?utf-8?B?Q0d5bDQzVkVVaE93RlJPSDBvYkREL3VKLzFuTXd6cjRXQ3NLTU51VWFWYzNm?=
 =?utf-8?B?S3I0bWpGbVN0c240U0pYZjBSTjhuUmttNFREd1BXcXl4M2oxdXJmSjVGdkVn?=
 =?utf-8?B?RElXYzNBTmx3NWpSWGI4MDlwRlp2Zkpwcm9jVU9WMUdlcUJ0YStDLzVZb2Mx?=
 =?utf-8?B?clFCQW02N1VyRzM2cHdhTEJFcWkvNUFiV0xmaXlpWCtNbmtkZFZMK1JPbkw2?=
 =?utf-8?B?dDFhUkI1T1dMekR1OFNUaldIN3oxdGJodWxhK2ZZZzdaaC9zeVdLUkpGaEFl?=
 =?utf-8?B?b20vaUd0VGtTZGpmUXVDaTkvenNMS2IwUGxIQW93VGhiMXpMbHIzZE81WW83?=
 =?utf-8?B?amRpUnZueTFMc2lmRjVLcHBvUjZFdzRjM2tCMnRzSEZldnVXTXU3SGZkUmU3?=
 =?utf-8?B?ZHdxbTVabHpIVnFOY1VZUmVScVRiUzdzS29ZdkF6UTU4L2xGYUozc0ZlMGpt?=
 =?utf-8?B?RnNPVEdjOStoUERIK1BGdW1GL2o5R2pGSVhaT05lNE00TDhTNURhNENnd1px?=
 =?utf-8?Q?YRhVoTGT5LI0uouYI04bLLzE9?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9db23547-46e6-4001-7798-08dd71a54bad
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 05:14:51.5746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LbyTepxVOxQAZ9pP87OA26w/LYU11WWp1bE/cu1uz3ubn8yAgLDT7oEFRfPRTRjNVz8rGZ5/IX6yudwQWbTc1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8596
X-Proofpoint-ORIG-GUID: 4TPwsYMnu1pDeM9KSi9eUFXbSbD3s95h
X-Authority-Analysis: v=2.4 cv=Tb2WtQQh c=1 sm=1 tr=0 ts=67ecc7cf cx=c_pps a=hHPfuxNGWHHq0fQgDGst2w==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=H5OGdu5hBBwA:10 a=xNf9USuDAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=xSHZapmnmeBH-LKFWAcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=U2jM8kB9BCcA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: eSrZFE7t5-vYGYAjy2iukYrAkjUYdG5L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_02,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=801 adultscore=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504020031
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5322jlrL007939
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 05:14:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214169

kindly ping

Could we consider merging this patch into both master and walnascar=20
branches?

I think this is a correct fix because of the following two reasons:
1) It will fix a potential regression on machines that don't set=20
SERIAL_CONSOLES.
2) It will not cause any problem. Because /etc/ takes higher priority=20
than /run/systemd/generator/.
 =C2=A0=C2=A0=C2=A0 See=20
https://manpages.debian.org/testing/systemd/systemd.generator.7.en.html.
 =C2=A0=C2=A0=C2=A0 """
 =C2=A0=C2=A0=C2=A0 Directory paths for generator output differ by priori=
ty:=20
.../generator.early has priority higher than
 =C2=A0 =C2=A0 the admin configuration in /etc/, while .../generator has =
lower=20
priority than /etc/ but higher than
 =C2=A0 =C2=A0 vendor configuration in /usr/, and .../generator.late has =
priority=20
lower than all other configuration.
 =C2=A0=C2=A0=C2=A0 """

Regards,
Qi

On 3/26/25 10:55, Chen Qi via lists.openembedded.org wrote:
> On 3/26/25 01:50, Ross Burton wrote:
>> On 19 Mar 2025, at 06:40, Qi.Chen@windriver.com wrote:
>>> Some BSPs don't set SERIAL_CONSOLES. They need=20
>>> systemd-getty-generator[1]
>>> be there to work. This generator has been there for a few previous
>>> releases, we don't see any problem it brings up. So let's keep it.
>> This is a wonderfully convoluted and not-by-design situation. Looking=20
>> at eg, styhead.=C2=A0 The getty generator isn=E2=80=99t enabled by def=
ault:
>>
>> $ bitbake-getvar --value -r systemd PACKAGECONFIG|grep getty || echo=20
>> not found
>> not found
>>
>> In styhead if the getty generator isn=E2=80=99t enabled then we delete=
 the=20
>> serial-getty units that the generator would create symlinks to, so=20
>> the generator can=E2=80=99t work.
>>
>> if ${@bb.utils.contains('PACKAGECONFIG', 'serial-getty-generator',=20
>> 'false', 'true', d)}; then
>> =C2=A0=C2=A0=C2=A0=C2=A0 # Provided by a separate recipe
>> =C2=A0=C2=A0=C2=A0=C2=A0 rm ${D}${systemd_system_unitdir}/serial-getty=
* -f
>> fi
>>
>> If the generator is disabled then systemd depends on the=20
>> systemd-serialgetty recipe which creates explicit links for the=20
>> consoles in SERIAL_CONSOLES.=C2=A0 This recipe in styhead also ships a=
=20
>> serial-getty@.service unit template, but the package should be empty=20
>> if SERIAL_CONSOLES isn=E2=80=99t set.=C2=A0 However, the recipe itself=
 has a=20
>> default value (SERIAL_CONSOLES ?=3D "115200;ttyS0=E2=80=9D) which prov=
ides a=20
>> value if the BSP doesn=E2=80=99t set it, so the unit files do get inst=
alled=20
>> after all.
>>
>> I think that your setup potentially doesn=E2=80=99t actually use the g=
etty=20
>> generator at all, but the bad default of ttyS0 from the=20
>> systemd-serialgetty recipe.=C2=A0 This no longer exists as the recipe=20
>> doesn=E2=80=99t set its own default anymore (as, I believe, is correct=
).
>>
>> Can you have a look at your actual use case?=C2=A0 I wouldn=E2=80=99t =
be surprised=20
>> if it=E2=80=99s actually just using ttyS0 from the configuration, and =
the BSP=20
>> could just set that.
>
> The BSP is using the generator. See output below:
>
> root@xilinx-zynqmp:~# ls -l /run/systemd/generator/getty.target.wants/*
> lrwxrwxrwx 1 root root 41 Mar 28 01:00=20
> /run/systemd/generator/getty.target.wants/serial-getty@ttyPS0.service=20
> -> /lib/systemd/system/serial-getty@.service
> root@xilinx-zynqmp:~#
>
> I think the generator took effect for previous releases because, as=20
> you said, the systemd-serialgetty@.service template was always=20
> installed (by a lucky mistake that you've now fixed) and the=20
> systemd-getty-generator was always installed.
>
> Now, in master branch, this template is always installed too. But=20
> we'll also need the systemd-getty-generator to be there to do=20
> autodetection for some BSPs.
>
> Regards,
> Qi
>
>>
>> In the medium term I really do want to propose switching from=20
>> SERIAL_CONSOLES to auto-detection by default, but this involves=20
>> making the same thing idea on sysvinit which is more involved. I=20
>> _almost_ have it working, but it didn=E2=80=99t get working in time fo=
r M3.
>>
>> Ross
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#213624): https://lists.openembedded.org/g/openembed=
ded-core/message/213624
> Mute This Topic: https://lists.openembedded.org/mt/111784889/3618072
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
Qi.Chen@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


