Return-Path: <xiao.zhang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF3C0D730A9
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 06:22:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5918.1775197328478942301
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2026 23:22:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=JeTclRnS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=855370a557=xiao.zhang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63354xnl2284264
	for <openembedded-core@lists.openembedded.org>; Thu, 2 Apr 2026 23:22:08 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=bOa116he5aAh+f9lc0yGcd7Q0IDBj6iYzpQmS7Ha6n0=; b=JeTclRnSJHz8
	2dCUAzdg55vPj0kPW/R8WiHkfr+/8+5H7TxCkEsCso6Q9sqhYBr5slHZf1pPe9sW
	30SF6HRPx5eExpmuId+/eGRTYyo7zWRJzNBOoxIKAInY7VvRkxFl65sGkGARLnVS
	M6WQ9lcWMuz1Pod1Z1vqJQ1QB4l0SGKJuiWsfNaIvdD3igOiLz1619w/LIRg854d
	F8pDYTQiqc8mJPm+WrU58r2SRJFJlS3iJBHe7FygvM6GFlXpZKplyIyqJsSWeVNY
	CGIZkwvF2MRn3Y7XzeEO8enZ03+O/iVyv3JwwW7M06PPQr9QWQT+MXj0kgVp3qIz
	xGJdL9lOMA==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011021.outbound.protection.outlook.com [52.101.62.21])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d6egc0p89-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 02 Apr 2026 23:22:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oMX5pdX8Vc76sIOAbU36YG/y89D2ZswrUD9sKwxvyN3VbLYlp27zBk2sAaLnh/dGnCkEnsS91ZVG9h+4cUq1vaGPmCDmZ18O1wd67daWnEtqzD82z+fLJmluHlnKHd9Q2uxdBZ+55f+UURvIHNTsOTrLvl0QWDkd2v9swTn0C5WfvQcU3VSndhYg7ZKKCPTQA97XYR+7zBqr7RpQmcLYAHyf5T5nDu+I2k3JuRLDa8iC6cHUwv96BnrRfEuoGALCBidSwl2sQghsaRgJqrauUVmom5HSJVhKyL07kzq8WJU6qBXcBynm0PP7xI+uTNzqeNcroxewitp3b6sN6PSVKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bOa116he5aAh+f9lc0yGcd7Q0IDBj6iYzpQmS7Ha6n0=;
 b=fL305WXDleVp0Vjg2PkbwkTuxUeHqz6my0fBbJwq/hFQ+cAW332DyKiEsB8qdKqNaJUlpmTVCnziDddGr12jDe8KSbiTWEp3mqapk0oyuWDs0z8yvZe0TL2mq2K279BNhBMFW9cuoY2pEM+nUlrI4sI5oGNnLtd/aXQM4Dr7BMnsoGVGTKB2DdXBzkStxOuFwZYLoYF3rUyUBpr7QVFw9hcw14mqKiA4t8L7MvwVb5peRzZyifgjIR1MpuKOMPf767m373xLjUicfomsEVq2yCl6dBF6UiEBAkFXsTM+lSp/vl37iM5EQzHpDEGMIceRB98EXt16HUFOWVQpcGJGlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB6080.namprd11.prod.outlook.com (2603:10b6:8:84::8) by
 SA0PR11MB4670.namprd11.prod.outlook.com (2603:10b6:806:9a::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.19; Fri, 3 Apr 2026 06:22:05 +0000
Received: from DS7PR11MB6080.namprd11.prod.outlook.com
 ([fe80::675d:2fe5:276a:f11d]) by DS7PR11MB6080.namprd11.prod.outlook.com
 ([fe80::675d:2fe5:276a:f11d%5]) with mapi id 15.20.9769.016; Fri, 3 Apr 2026
 06:22:05 +0000
Message-ID: <12ffee1a-0ce2-4e8d-9cd0-64fbeeba37bc@windriver.com>
Date: Fri, 3 Apr 2026 14:21:59 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe-core][PATCH] iptables: Use update alternatives for "ebtables"
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        openembedded-core@lists.openembedded.org
References: <20260402134959.2559444-1-xiao.zhang@windriver.com>
 <DHIUPHZ23X2B.3QKIWJ5KM2Y92@bootlin.com>
Content-Language: en-US
From: "Zhang, Xiao" <xiao.zhang@windriver.com>
In-Reply-To: <DHIUPHZ23X2B.3QKIWJ5KM2Y92@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCPR01CA0031.jpnprd01.prod.outlook.com
 (2603:1096:405:1::19) To DS7PR11MB6080.namprd11.prod.outlook.com
 (2603:10b6:8:84::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6080:EE_|SA0PR11MB4670:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bebee58-f228-49b0-3505-08de91495393
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	i+HYzGPUxrg1GjJ8u8uM14XUUDnacZTDFzneiXStmwFpr1/VyqOXdf6ziyQGhnsZ7kcXSkZMbovjU+IHV4dBdk6jdBnY5B40iCjv9WGsmmPiXAirFsybq31xEqQMDg0Ury5uKsH3F+jmvn1B+kXMYVpyc6IRFSeDtmIj6K7n+gUtvMvyBmtOcK5uQcfYMLW564fy1/dR/ETJ/GXzHyH59N3ArQHrf/JCBUPXX9Tv4mIHYHRRhhKnnBrAjmGCQfMODjdw3aTe1S+vqjeKvVVqByQNNzZkEXc0G5bPLY66Ss/312CvncE4zzG0qptJD1lTqQT3dWBUqvT7HoiqgTiDkHI5ubvlEwguTmAlzQOk4NI6pWihJJte/tG25rpVfdc4YNdfAzZG1EzygUxF7/e16ggZ+Kv2Xqk9AXnwmYwHpx4vVeyv6S79AugMhnyJRdkgPZhJbGf7fk1VykFyG6NeCvL8HvrZVpBFtnT8J4VcAN5O7wv7vmbuYd6ihy29mJ1e/YmfHJyWDxRsgH0KxcOonToEzXzWK/GyvDx/V1aJPx5hDWC0UkiD1j/1aIlO7GpC4hfy4GEvp7TFvgltN4qVZpZX9vRBPUtPzO1t/yX36Zsg71FnDzg4FeRN4jeXnYEu1cPHGTw7dzvsrmGjAE3YJegm54l59bNnxQ0uSO2a0CCLhyqyXk9whfURZ1aoKEPm
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6080.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZnVtOWZFQ1czaHNEL2ltR0h2NWtLSDAyTzRsNkY2NG9lWGFsRnQyTklvRTdE?=
 =?utf-8?B?WHhIbllLOW5USnpJSHREeDdrVkNQOEdTem9xUHhTMGhvSEd4UzR5NnBKY1lv?=
 =?utf-8?B?QVZGYWlLQ2l2TTdMcmczNng4UjlmV25lS1RiZlZwbk5HL2txeVJ5KzlDSnh5?=
 =?utf-8?B?bThvM0FqRlcxSFExcUFXcWdzaSsreTZvWnhoUXVOVHZhdlBGNVVyMUNIMHh4?=
 =?utf-8?B?VWdLT0FZVm1yMDJWbVQzVHBtV01GR1pvaW8yc2FKSWtUNUJiYUFxdnd5dldO?=
 =?utf-8?B?ajZHek1scHI2STNqTTYwcjYrdk03cVRmeVJ3cVo2Q0E3Y0FaaDFSdEpRb3Qv?=
 =?utf-8?B?MjR1ZTRDZU1BMW5UMzlGR25pSndDd1ducTFucGI2UE5QUFNmUC90bStZL21u?=
 =?utf-8?B?RlRqWm5vQ0JIVko0Skhlb21xNGNINXYvYm0wd3c4L3hqS0pkaldxNVlMejdI?=
 =?utf-8?B?U3JsdmVtcUcrTE9WRWtEL2E5WG9GTlprQ2ZNYTUzRHdVNkRESnNyM3J3NCtU?=
 =?utf-8?B?c1FGMGNNMzZvalJTd1Fabnc2dFJVMkxGaHVoaG9HMlpaVDNqS2VwT0xTZmtv?=
 =?utf-8?B?VmxUTEtHem56azQxcFl5cmdPa1RkQzQ3ek85aGd0ekg5VTJTcUVscHBtZkZh?=
 =?utf-8?B?OS9Pa211VnordzA1RVE1QTFJcXpqMXNDdzhZT25Fem5Oa0VRV2Zyb1hVR015?=
 =?utf-8?B?bFlRSUpJZ2V0UnJTNFkzMS9xaWNkcmVoR2pQUHpjcXNGSnBZY1J3U3I5SEVp?=
 =?utf-8?B?eUJzdElETzZCak1TQ09RL1c1TXNhSWNlcEVERlk5ejZ2RGZ1TGljOVJjZVgw?=
 =?utf-8?B?V2xmV00wMXZudlhVcHpCQ0pXZjRSNnJhNlFxaE1iS1hKTzBPTE90dW9ud3FK?=
 =?utf-8?B?eURLU2JmRXN4LzhpNHR4N0ZraDM5RGloYWkrbGx4UFI1U0h1a3BVOUFwR1dq?=
 =?utf-8?B?aE10VXRBbEU4OEUvblZHTitIbUx2NEpOWGZPODl3dkttWGY5MStRRWZ4US82?=
 =?utf-8?B?MDF3dzZ4cHVJVEQ5OUdhbXQ5ZlcweGl5T2hVS3dLamQzb29ES2tJVWE3Q1I2?=
 =?utf-8?B?L0F4QVA4UHhvUmNGL3JZUndSK3kzcG9iYkIvcG5oeXUxa0Jacm9NVWRzNVNQ?=
 =?utf-8?B?a0crZ0RWVDA4MFZMczlMUnpocDhHMEJ2NG5QR2VpdlFnR1U0SGhVKzVRMUNI?=
 =?utf-8?B?cHhBZzhKOWpQMTJLUU9IWTBzUFNuZjcrN3JNVHlLRzQzQTM2dGhKL2xzcG13?=
 =?utf-8?B?aVhvSmwvOW05ZlY1QlBzM2tobVFIN2ZtYW1HUnp3Qy9mZ2hkdjNsbkg4Uzlq?=
 =?utf-8?B?L2JwM3RmTU1LRldzRzJCWXJPV3FqbmR3TCtsa2twQm9WM2lxQytteW9WVFRv?=
 =?utf-8?B?dXhJTjEySXl3R3U1RndDVmt4dStwOWFzS05kdUpUQW5hYlZNQ3NDc0lKR0FF?=
 =?utf-8?B?OXlTNGJQeHRaQjhQbk5Yb1E5a1YrWXJIUzFQbDd5TmVleTlXSnErVDdkK1dH?=
 =?utf-8?B?VmRncEFZR1BOeFVwcStlTDFkVCtwRGp2aGZwRVF6RHN4ZU91K25xQThpZ294?=
 =?utf-8?B?N0pZU1lQSy9naDZMUWU5cDllYzYxV2t1UXhwUnZXRTZFS2hJaytIdDEvLzRp?=
 =?utf-8?B?MnhlbW1aem9WeU1qT1FGMFdTMzQ3OGxqS0xPalpORWsvcWRsU3oycnpRcHRG?=
 =?utf-8?B?dHVhM2JJb0c5cEU2Z21JR05sYndxN0txZjNRMHZja29IM0NCa3FBbCtGZURt?=
 =?utf-8?B?VHBGOWNrOWZFaFdlQzFaMnduOFJDcDJXL1llMnZSbVJOME5IM004TGdwSVgv?=
 =?utf-8?B?Unp1ZWJVUjIyNTdWYndyZTFzOHN2WXJ2MVZad1NSKzlYTDN0SmJjb0N4OVZx?=
 =?utf-8?B?endFTzNsakM5aEhMa0RGaXc0VDlmS0VIN2QwS0FQV0xmbHJGNDIybEo4UlVl?=
 =?utf-8?B?dXB0ZVpBakxraXNId2tsc29QK2ZPWW9vcldYckUwcXp6eThPcU9kZWU2SkJX?=
 =?utf-8?B?M2xZb0ZmdVluQk1FaVFjaE5tNGw2SS91VDE0aGNtQVo3V3ZiQnJna3JNamNy?=
 =?utf-8?B?VlAvZ1BWNCs5cmd4eExZeDRzWks5TlVlYVhGREhsamxoRlNrT0s3cXQwaGth?=
 =?utf-8?B?NGpidzdneHlteWJkU1ZtWnVjUE9BOE5GRnU5U2I1TU9QNFlaK2ozU2ZLZ0t0?=
 =?utf-8?B?eEtXOTQ3Tno4ZW53MEtNV2Npa2JZU2QwVnArRmtWWWZBVEdvbHJHM3dGOFRr?=
 =?utf-8?B?by9aUHIxQVltdURaUWVPM2dKK21lcEhManNRaW1pcHNxeUk1TytsU0plYkFr?=
 =?utf-8?B?amRwNi9vaE5qZ2gwNGJGeXpwZiswK2lUdHV2WXpHOEdjam44bTRKZDVyMld1?=
 =?utf-8?Q?ToV0NKmTI6AgG4uo=3D?=
X-Exchange-RoutingPolicyChecked: 
	jGEk+fk1f+bsL3Fw0/tavIH7rxq3KmIRQWlXM4S+JoJ2PZTpuv0tpgfJ3FGjvcukzus+vzTbg1iXsUIJaUSFfJFWhUzeD2Ew87kH/+RvEMmH9H/zfxfhyh4YjB3KCzHbdcd4vKLmp53Thx98GID5jDQfWdAcdVlsx2u0l+dMcL3IWzXVsRJfPyu1+m6hgV/BBsRqelbgy4JbsqK5VacBCDaICYNqW6u3jLtaZVxSrK9PGFu7e1KC6FQE7h4Rg/LHiTXhVamIil30mvgbHNZ4v92lkxlqT/BCY7piHGWvF69CnLfV0KoHVjlt8FXKe8eAwzIby57q1SoBiZk1CdhUQw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bebee58-f228-49b0-3505-08de91495393
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6080.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 06:22:05.5111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M1hY3BxLCAJV8tdPzR7OBEYuJhw68XhSls9yBZvBYab7F4BEPhDbwrdM8L0/mrcHSHDSCk7beiPwsO0ecq1zYvqu4XMRGxTIlY85IsVMy0g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4670
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDA1NSBTYWx0ZWRfX3l4N5e5sMKr3
 Ofk6rdvdG2qTr3Fja0iDKA79A+WDraw908MoycL7hvqr0hU2iyCM4jd9NuE68A1VXnD7tPAhRI7
 FRqxklI6OA8vLD+ZaKg3azT79JyfYvJp7rZOrIFVY9N1dMbSXIf4ZNt0yHY19BX5ik5Izc6bgBh
 AEJm6C57Q64pOs7t0srJb6twFBdF5Mb37JFJfwFNZ6EC82s0pE8TklrLF/BomJImVR9ihmj5y54
 inECpORFOVDT29YW7grSMAqeidUUUZNoMCL0Ux7bG2zFwAHY+yisFqvJb5VZG6kSqlYu7q7eDUH
 kY2yYlYKbAjR0Gg7EKtQ6E5scCtzpFbvdZxuBh+k+8YC27S4Ev1iT0AQkNd3kGripzcdzRBv/8f
 tAiZPwDcCsBqAediyfDGzSCbM/g+bmZZFy0s19EZSHH+U/ujqGijX4vfzvEJGzGHCAtwNdgeM83
 Q8Df6gq/pZTzA8+a6Zw==
X-Proofpoint-ORIG-GUID: HHfXf_p8OsUOs59Brol7oFDpjAJP0sat
X-Proofpoint-GUID: nYIpBYXGmSFLIVwn5xcsS922qgT4yMie
X-Authority-Analysis: v=2.4 cv=fvrRpV4f c=1 sm=1 tr=0 ts=69cf5c8f cx=c_pps
 a=k+Wq2vL5ZRQmlAOTCyP+eQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=_3ePMINjFawIIbp2OVoA:9
 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030055
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 06:22:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234557


On 4/3/2026 1:39 AM, Mathieu Dubois-Briand wrote:
> On Thu Apr 2, 2026 at 3:49 PM CEST, ZhangXiao via lists.openembedded.org wrote:
>> The ebtables utility can be provided by both ebtables and iptables
>> packages. Set higher priority for the version provided by iptables
>> to prefer it.
>>
>> Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
>> ---
> Hi Zhang,
>
> Thanks for your patch.
>
> We can see this warning on the autobuilder:
>
> WARNING: iptables-1.8.13-r0 do_package: iptables: alternative target (/usr/sbin/ebtables or /usr/sbin/ebtables.iptables) does not exist, skipping...
> ...
> WARNING: iptables-1.8.13-r0 do_package: iptables: NOT adding alternative provide /usr/sbin/ebtables: /usr/sbin/ebtables.iptables does not exist
> WARNING: iptables-1.8.13-r0 do_package: iptables: alt_link == alt_target: /usr/sbin/ebtables == /usr/sbin/ebtables
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/11/builds/3484
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/50/builds/3548
>
> Can you have a look at the issue?

Patch V2 sent, thank you for your kindly remind!


Thanks

Xiao

> Thanks,
> Mathieu
>

