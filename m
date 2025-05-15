Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3188EC2D0CD
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 14:38:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.14293.1747319910664028303
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 07:38:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7230aed9a6=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54F589A8029252
	for <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 14:38:29 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46mbcjtukm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 14:38:29 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZLDEczlRALZhlr65+eQnKLxne2hP2JDNd0LzwLoM4JBY+LAVmKLNUUac89ZbIl5ottHVyhlHZ3wouiVxxcoZ8pfBgWiJmNb+XmxrcRZ3kUSrmYP4or9O7RtF7Ckpal8M+ebyHsiUdkysOzhiN9MUKGdbJTm9r/r4RkYXjIw9W0b/CHnGmgHm3DSBGLY4uldxTdPjwTQj5MNC+ps+LB6FR7GDNwVYOcHzO+0OUUveeVVmm5DiRjGI7ol1MgaFHBTwkGxDd7LyzFCrTzO8xHKnKM9ewjQKdinyWtaLIbtERnrb892j2lNk5SpxtWG78lY0y7TFYjeBE/rKjXrlv3gPzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S74WXfinFOyVMws+lc3GXa0CxWa6Zl86W+8pmfyCfkI=;
 b=O4CgpRU+0sxhtWfynDdy6aCie9xr0aPB170r0p6wGKTh2UdfhTggHwaYFDSrfif0Q4c4XQnGSiWkazao1p4kCF728b4SPPcBExJyXroYBLHVDMOCINdMpuTP0YJMCyL9ux+On0N+emfrB9+CkIyAkZirgFA/zzrptHSZ8qfui7+oSXdnu4MjJLahRXNim+NFDnFn7Led16nrjzAuaBpDw8VZ4BINM68lDU/pBMt7/RjhgoJiT2yk0mEHzxeWyYw8s05hrkCKhnbNuf7fe0g75HSs5kI0dkXY/501XPyQ0wtMxIl/vEIHkEJ6DraGvmQdoRIU6SV3ALROLeOQMwS0iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB6402.namprd11.prod.outlook.com (2603:10b6:510:1fa::15)
 by SJ0PR11MB5021.namprd11.prod.outlook.com (2603:10b6:a03:2dc::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Thu, 15 May
 2025 14:38:25 +0000
Received: from PH7PR11MB6402.namprd11.prod.outlook.com
 ([fe80::f501:9450:5790:7e8f]) by PH7PR11MB6402.namprd11.prod.outlook.com
 ([fe80::f501:9450:5790:7e8f%5]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 14:38:25 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [walnascar][PATCH] makedumpfile: upgrade 1.7.6 -> 1.7.7
Date: Thu, 15 May 2025 22:38:08 +0800
Message-Id: <20250515143808.3891494-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: TYWPR01CA0023.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::10) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6402:EE_|SJ0PR11MB5021:EE_
X-MS-Office365-Filtering-Correlation-Id: 302b0d1d-d904-4878-6745-08dd93be256f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WDRBUWl0QklwSk5WcHBMYmVFdXpXOXpBdjB3dnR4ZVFCSVl2RU43anQ4bW9T?=
 =?utf-8?B?blpIK3NpUVBTQ2hEcDNLa2tJakkwNXJkR25IRzlaT3hJajU0bE14VTV5UHZW?=
 =?utf-8?B?NHNjRDhZbmo0UkR0dWZhbUVZdjVFT3ZuOVB4bS9samFuVllJU1RaSnJWTTdm?=
 =?utf-8?B?NHlZUnZhL1IwOWZmTVUvemtVNTJweU03K0NXNlVDV1pJaWVSR2RsYTkrdlVo?=
 =?utf-8?B?L0pJTlRyOS90T1JNVkxmOGtXY3M1cVpRekJZQklubUkwdkUzVk1JcDVMV29O?=
 =?utf-8?B?blRpUlNUdFNOc3FYSGtpUWl6WHBoNGFPRU1SVnV3ZDZtUVZHZTFzNUpLQUpl?=
 =?utf-8?B?SUtqUmVQQVJzeEhIWm1COEo4OUo5S3ErVlJMWTI4WWxvZVZhd0x3d1BIeUJr?=
 =?utf-8?B?aUw4T0tSZHFBU1VJRVVPOTZSZkJEZTR5bVppR0ZIVjhLNEs0cDVPdUNuaXJE?=
 =?utf-8?B?VkFpVkovYTFud3dMRG0xbmR3dzMwcTdpOHYrZnU2WjZrZnZiUmpORW94UXhw?=
 =?utf-8?B?aDZKU2pQS01pbDBqQUdWUHR6a01BcEhscXNOTzVrY2h3cmxiL0w4K2FWanli?=
 =?utf-8?B?dHNkcEJvZmFoSTBFTGwwNU52MldkU3N4eGJaUkExRFUxSFVyTzUzWlJON3JO?=
 =?utf-8?B?Qm9mTXJLTmswbnVGQVRQOVJraldEZ2ZQaWhnck5nZVorMzhIT2c0RTNTWjdN?=
 =?utf-8?B?UzFxbzhHOTA3TVhrUGMvTWlGMFo3bjFJWkc1VEVlTmphOTBOeE8zM2Q4N0d5?=
 =?utf-8?B?c1ZXcFA4N3pqU0pERGpoZEc1OXVyWThpZlNrK2g1UzdHcm9IMXg1YzYrTlN3?=
 =?utf-8?B?NVRLWWJ2c0l4TGg5S09nb01PWTZqd3BWYytTR1AvRmsrbFdFZXl4RWNObGNj?=
 =?utf-8?B?OEc2b09KUnl1cnhQSlBlbnRQamJnbWZ4ZlFoZWM4K25wUWdGNmdBWGtTeXRY?=
 =?utf-8?B?c1oyZVNRbTk4dDBrOFFFOHZ2amNCUlFtbkg2Z2JzTHVzYjdGUlJ1WExhM3Y1?=
 =?utf-8?B?UUNRbmtCaU5lVmhQZWd3TG1GeCtIWWFnVFVDSlBJcklCbzJjdFZaNTVOWEc0?=
 =?utf-8?B?TkFGU3Z2dHRJcWZKYjF3SDZydmo1OGNFeXByb0JXSDFyVG4zcGpTQlI5VSs5?=
 =?utf-8?B?bWsvTzN4TUMwYkZyeHBzY3NxMmJEdDFMSG9VREZlWmhXeFdGQjFhcG9uRity?=
 =?utf-8?B?NUUvQWl3MWlZL2lLRjFsU1djL3NOWnlidm1GQXRNM0dFVjk3REp1OU4xdHlB?=
 =?utf-8?B?VHliTDN6bjl4akhFMTdET1pVWm02bmM5MmpkbFYwYmFiMlFjZlNuRm12S3VU?=
 =?utf-8?B?aVV2cnBSaWpMZWFyQktUVkx5RFhHamhMaUZQZXNrcW0wVS81Tm5PUFFYL2JM?=
 =?utf-8?B?S3k2Mk1yWkE5S3pmNmdqMDRNYWRFWGJRdVNhRHNTdlBsUHVPajVWc1IzRWVk?=
 =?utf-8?B?cTQvNE9vMWh0RllyTjJmL1RYUWlkdlYxOFhPVVF5dVBudnA2cmw5TWx3NEhZ?=
 =?utf-8?B?eGNOT3NJL0lGRUVxUU0xTFdadG9pYVltYkhyWWRiaEM2QU5HUVo1Qno3ZFZu?=
 =?utf-8?B?d0tNalNNeW5vNFVuZHlWWjB6VERnUkZPT3VQK1pKZndFTGs4eVk5aTVuSUZr?=
 =?utf-8?B?L3RTRU1ROGxLR2RwSWJhZTJiNi92UGpvb1NFSlJ6VVI0NDE5RnZnMVVpeFhD?=
 =?utf-8?B?aG5rSTA4QVRUZ0M0YVR1Zmx6eGMzZjU0YldBRnpiVWVWSGRxWXV5VG1wdGFx?=
 =?utf-8?B?a3RzV2VWWjRuek9aWitoNVNKSTcxU00xUGdYZi9nZzJMakxXb0swTTRDYytB?=
 =?utf-8?B?VTI2N1lwakJMMzJrMmphZ2p0WGxLejVDTFBEMFlSaW1OdDJjWFlkMHY4Y0Vx?=
 =?utf-8?B?TEdyWGg1Tm0vdjA3T25HTzZSZC9yQXl4aUVhbE9tVnBJZ3VBNDdORjI4Tll1?=
 =?utf-8?Q?taj/UWc3GOI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6402.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WStyUDZ5U1BiemRHelRTYzI2Z05MY2NzR0E3STE2MUxnWU9GRzlMWGtwRHBz?=
 =?utf-8?B?Y2l0Njc0aVk5blJINTA1UzRWVUFSdVdpdWVob1h1WkNpdmFDc3JQelZGbmpZ?=
 =?utf-8?B?K2N2RFc2ZUdpUVpndHVySWpsd1RCMDlYZUxUM1dZcGdsR3pIak9KbHlxWlZa?=
 =?utf-8?B?MG9Ed0hFMlYyR1VtaUEvZ0RzSklQK1dOOENpU01IaWNmQXIzendCK0NSbWFE?=
 =?utf-8?B?OHpRV1oxVlordzY3QjUrYnM5R091WDNGeG5xVnQ5YUZ4ZFlSNjhsSG1IWnps?=
 =?utf-8?B?T1J6V0ZkMUN4SXkwL1VNSDlSU3Byell6MFU4d0VnV2l4L3FiVzNVTXNQcHZz?=
 =?utf-8?B?QXNBcGdITVpSUGloTlZoSGQxMUwwNnRVNEVpYUk0QitsRHhjN0xndzBjSU9s?=
 =?utf-8?B?QTFPTmlvMitHSEMwTGJFU1ZUVitKZFpJeVRadjQxL2JyU3FlaFdZTkpLSStz?=
 =?utf-8?B?MmlVS1VlSVZvNExucUpVR3VxYWFXeTFuRGdDWnJiT1BPK3J0RUhvMWtVTkJK?=
 =?utf-8?B?LzcxZmlBM25kRVM4ZUpLWjdRU1lQaFJSVnMzbHUyWGVMZXBUcmRjb0VlMmd1?=
 =?utf-8?B?SWhFMi9ucXdKOVVtYmFhTkpqenpoSzVlM3YzbC91Y3hHL3NzK1A2eG91Wjd2?=
 =?utf-8?B?ZGFJMGE1cCs4N2ZPRExKNmlMMzVSVDUwYUFFY05LbFZrU09YcTJYeTFjRzhG?=
 =?utf-8?B?RXRDdGVEaUpzUzNBRjRoRmV1eUZIVjk2N0lKK1lVMVF5dGt0YWRiR2FHUEZM?=
 =?utf-8?B?NE9PSVRoYXNrM3ZLbHFON2NwZ2lvaFYwWTgyWExWcWFCQ0dyN3BJS1BwMi8v?=
 =?utf-8?B?RG9xQXFBNTB5NlhPcFVRVjhkZGVOeUk5dHdmUGtMTkx6VDErWHkzZjQzVTdt?=
 =?utf-8?B?cmtOaitBdFpCbEl4S0sxaXk1L29VY0Q5NWJIYzR0RlhobWt1YzcrY2toQjdh?=
 =?utf-8?B?YVQ1YjZUdEVjblNOTDFIS2l6ZlpXdnRYd3hodTVRb0Y5SkVJNGZDTiswbjZo?=
 =?utf-8?B?R2tUTCtDRitJbi82Q25ERXJpUnFVSmZMS3Q1SUgycWtwOHhzVVoyUmxCSTFt?=
 =?utf-8?B?akMvckxySmxmcnF6V1piVkZsdytHS2hjQVBINURYYi90WGU4M0ZSYXFUY2R6?=
 =?utf-8?B?a3RuR0ZZUXJhbkZySlZFRFJtZ2Vld2VDcUhFeklGdEY5RGp4N2VsYTFGK1Bo?=
 =?utf-8?B?QnRNRnZsRGV2UXBQMlhQNHpGekpVY1IzajZlY3Y5eVNHVnVqNTFTODJhUlda?=
 =?utf-8?B?ZFBEMEpYVWtMZEljYXhpOUpvS3RxbTB1K3RvVEU3QTVUcUtqb1Ywb0MvanBv?=
 =?utf-8?B?QWN6MVBFQzN5VWhtTCtzR0dMYjU0Zk5BUjRva1NKS0pYMlUxWUo1NWZLS0xG?=
 =?utf-8?B?RTU5TnVVU0VzbkNBMzVYeGFTVEVZMFZDbjlqQnJac252UC9vSURWNmtRRkht?=
 =?utf-8?B?M0I4ZDAvNWhqM0dWbUNPWjhrWUxiYitTK05ObXNONzRoVjE0eWhsdHRKYmw2?=
 =?utf-8?B?SmgwdW9SZ2ZqRVROVWxuTG00QzdTaEcyOHg5cFd6S04rTW8rUkZoTTh1UGdu?=
 =?utf-8?B?YkxBQ3BvNVlTZVdzTUFORmFGYnNqWjNEN2FFWG1NZGM2U3c4Umc4RkttbG50?=
 =?utf-8?B?OWhRVHcxS1k2QWZ6K25MVzY4MDZWb0FvNU5XQldjcjRvTTd3R3c5YmZyZStt?=
 =?utf-8?B?RkdlSkMvbmxrSXJqRnZFTXo3QzlkeG9SbXU1NDZKVkZEZ3JPUThRdFJpL0NG?=
 =?utf-8?B?RFp2enladTk4L3JPczhOelhKZDBOejVOWW9RRnczY2JXdmFkSjI2RnBkZFdP?=
 =?utf-8?B?d21EMkw3Rkk3TWc4aVEraTJnRlJIbnpFNlFFQ005bHNUS2ZzVVVkSThmaVg4?=
 =?utf-8?B?MHQ2SStMZ3VFQ3EvK1pkaGxVb0VTTVVsbDZmS24rNHZISXloNlR4czcrVDQ5?=
 =?utf-8?B?Z3pGbG1MMWZ6WUtzandTdjVMRFovZXltaE0rVlluNUw5bFJtQjZyanhNc1hD?=
 =?utf-8?B?cmZnZk5OMUtSR21TSTBFTWhZR05sZWdTalFKRk1vSzV2RzV3RzhpM2l0RkFy?=
 =?utf-8?B?THdXYzlSUlFTcEVEWEFla0hmek54bk1DcXhDZ3laTys1a1EzVU1LNHNHZmdo?=
 =?utf-8?Q?HwYs67xHZrXr9Vsb/BbCyoYL4?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 302b0d1d-d904-4878-6745-08dd93be256f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 14:38:24.9832
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 691cGVm2Ckym0NZIoXFKDhhhbzHl3NFTf8kJ8i4+TY1DTezCJpCgOmv6BCwQ74JDUSndxVII9nwdENoaxtrjLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5021
X-Proofpoint-GUID: 4RU8uWoN5zGcNWErM_8d-4NTPpH3udw8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE0MyBTYWx0ZWRfX8bPnpUj4bmeC 6HBW15Yf8+AMJhiIJX8tiB3ELiR8nTErxt7weg6rtw7X0ZAqrhfH6/53wJr789o73t61bv6cdSe HZEOPL3YcF4fflaIJo+v2XM/sKQrXto7b3Et6o1dA7NC9cfaN+UyT7ofqzEPa3DrVqw/brq1h3A
 iuTCyJImfinOaisjYU0EiyL1kdihR0vEMAYAxVpCKCEfdtRLkRD995xFPj0JJcRGFMIYwAB1yay hnjH6XKCT4WW+iw+5OPZbHBItdeVl0OTvzDUPAu+C/Gh160Z5t0LgnCW0+rzGRa01JGII2H3L8h +0oC4OSUeOecWCs0OTaTeI+72lW3BSWV6m5Tv014ohegclopkzVIZGxlcMhK2Zs/eo/prPsOlW0
 1OFMX6Xo0+7i8iiJZP+FO2XUBmjzFTOw0OusnsdMBELQqhvMVdk0Hjk5tuouoQEXbNhu5Zs6
X-Authority-Analysis: v=2.4 cv=dYuA3WXe c=1 sm=1 tr=0 ts=6825fc65 cx=c_pps a=rPWB9DPlu1VaKM/QD/CSBg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=NEAV23lmAAAA:8 a=20KFwNOVAAAA:8 a=t7CeM3EgAAAA:8 a=P-IC7800AAAA:8 a=ag1SF4gXAAAA:8 a=pGLkceISAAAA:8 a=xxtYkN68ehKtVhB3oKQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-ORIG-GUID: 4RU8uWoN5zGcNWErM_8d-4NTPpH3udw8
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_06,2025-05-14_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 clxscore=1015 mlxscore=0 spamscore=0 phishscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505070000
 definitions=main-2505150143
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 54F589A8029252
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 14:38:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216688

ChangeLog:
https://github.com/makedumpfile/makedumpfile/releases/tag/1.7.7

This version supports the following new kernels:
  - 6.12, 6.13, 6.14

Drop backport patch.

(From OE-Core rev: 364e15aadcbb3ac754c2c484f7920420b4cb3138)

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...-compiling-error-too-many-arguments-.patch | 43 -------------------
 ...umpfile_1.7.6.bb =3D> makedumpfile_1.7.7.bb} |  3 +-
 2 files changed, 1 insertion(+), 45 deletions(-)
 delete mode 100644 meta/recipes-kernel/makedumpfile/makedumpfile/0001-PA=
TCH-fix-gcc-15-compiling-error-too-many-arguments-.patch
 rename meta/recipes-kernel/makedumpfile/{makedumpfile_1.7.6.bb =3D> make=
dumpfile_1.7.7.bb} (92%)

diff --git a/meta/recipes-kernel/makedumpfile/makedumpfile/0001-PATCH-fix=
-gcc-15-compiling-error-too-many-arguments-.patch b/meta/recipes-kernel/m=
akedumpfile/makedumpfile/0001-PATCH-fix-gcc-15-compiling-error-too-many-a=
rguments-.patch
deleted file mode 100644
index 90f1b4038b..0000000000
--- a/meta/recipes-kernel/makedumpfile/makedumpfile/0001-PATCH-fix-gcc-15=
-compiling-error-too-many-arguments-.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 73e62a08022bf8e5edad250f8c1452f0be3771a3 Mon Sep 17 00:00:00 2001
-From: Coiby Xu <coxu@redhat.com>
-Date: Thu, 23 Jan 2025 17:47:10 +0800
-Subject: [PATCH] [PATCH] fix gcc-15 compiling error: too many arguments =
to function eppic_init
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=3D2340813
-
-When building makekdumpfile against gcc-15, the following error is
-shown,
-
-    erase_info.c: In function =E2=80=98process_eppic_file=E2=80=99:
-    erase_info.c:2226:13: error: too many arguments to function =E2=80=98=
eppic_init=E2=80=99; expected 0, have 1
-     2226 |         if (eppic_init(&eppic_cb)) {
-          |             ^~~~~~~~~~ ~~~~~~~~~
-    make: *** [Makefile:109: erase_info.o] Error 1
-
-Upstream-Status: Backport [https://github.com/makedumpfile/makedumpfile/=
commit/73e62a08022bf8e5edad250f8c1452f0be3771a3]
-
-Signed-off-by: Coiby Xu <coxu@redhat.com>
-Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
----
- erase_info.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/erase_info.c b/erase_info.c
-index cbe1681..af6bfae 100644
---- a/erase_info.c
-+++ b/erase_info.c
-@@ -2192,7 +2192,7 @@ process_eppic_file(char *name_config)
- {
- 	void *handle;
- 	void (*eppic_load)(char *), (*eppic_unload)(char *);
--	int (*eppic_init)();
-+	int (*eppic_init)(struct call_back *);
-=20
- 	/*
- 	 * Dynamically load the eppic_makedumpfile.so library.
---=20
-2.48.1
-
diff --git a/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.6.bb b/met=
a/recipes-kernel/makedumpfile/makedumpfile_1.7.7.bb
similarity index 92%
rename from meta/recipes-kernel/makedumpfile/makedumpfile_1.7.6.bb
rename to meta/recipes-kernel/makedumpfile/makedumpfile_1.7.7.bb
index 46be13e7d0..23fcef9569 100644
--- a/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.6.bb
+++ b/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.7.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa9=
54499f7abaabaa882bbe"
 LICENSE =3D "GPL-2.0-only"
=20
 SRCBRANCH ?=3D "master"
-SRCREV =3D "97a89484e2c960dd64933e1cea7a7248138f8a76"
+SRCREV =3D "e4ae6b5ee04edeeb03db89bee372904157e3378d"
=20
 DEPENDS =3D "bzip2 zlib elfutils xz"
 RDEPENDS:${PN}-tools =3D "perl ${PN}"
@@ -26,7 +26,6 @@ FILES:${PN}-tools =3D "${bindir}/*.pl"
 SRC_URI =3D "\
     git://github.com/makedumpfile/makedumpfile;branch=3D${SRCBRANCH};pro=
tocol=3Dhttps \
     file://0001-makedumpfile-replace-hardcode-CFLAGS.patch \
-    file://0001-PATCH-fix-gcc-15-compiling-error-too-many-arguments-.pat=
ch \
 "
=20
 S =3D "${WORKDIR}/git"
--=20
2.34.1


