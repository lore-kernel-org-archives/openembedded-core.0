Return-Path: <abhishek.bachiphale@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19EA8CD6E60
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 20:00:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8353.1780343997044313468
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 12:59:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=oPVzbbej;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=06123b62e6=abhishek.bachiphale@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651GtJkk3879996
	for <openembedded-core@lists.openembedded.org>; Mon, 1 Jun 2026 12:59:56 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=ajql4n2Dx4gODWONbxlwzJsXQX0czmzOoCZlFChQIo4=; b=oPVzbbej/NvK
	PEe0BQgUxdO4tHkiwdks6DpREwV7zblPfWYaskfjrFPc0e9Ry0V4/1bOKjGPkwyO
	JV1Po3Dw/bdXLGICxALmtaO/zyu0jmp2SHGisa/t1PRouiRyuFxgfAzxWMaP4ESc
	4oujz2IBwFd3YYyMADTyUKSDTS4Czc+Gr+9hO6a74UM07r0AteFzvuIPiySfjR1o
	vpaRTlYoIPT4E0dgkyvWa3WPGu7FZpY0vHmD0QCP8n4rTtBeXlGRSdo1jUFVWBCy
	1VaDCjPPid85LaccQxp5kTsEuID9Mra9UP301wS1a/KtJwPM+7k8d/5uhCcz1IWB
	9Fi6+wuJwA==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010001.outbound.protection.outlook.com [52.101.46.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4efydeb9m7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 12:59:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Or8oOVIgKzbl1fI3AzrwtvVzsqkb3Ddceyt12H0czp4faosrZWDequy67WLsgBqKS19nhMB54N2iutf8ZQDQEVax76uHH+0pKhRx6KfKK8FPCGyUrjodgvdCBSMIqBNXuzocMEuL5er8pUXMOxjmB/GkTgQ4PXlJL95VqIckWyB60TxaK9iARaPFFg9pz9YLzxbv2XHT0w9PkvpA8NK6tnscf8qeCf6Q6t3j2/9oklAQx9RWyW7CJWUEn4XzNa5YTf2nkcYa/RLHrMnJUUorys3NlVjXMEN2paia+zACjZxHUDXQfZf32RZrXgxaKevL48vYuJBSeKaIQehE0UrLbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ajql4n2Dx4gODWONbxlwzJsXQX0czmzOoCZlFChQIo4=;
 b=WC5fJsMZJelWpwjWdidQ92tXjdHwBT6n2uakp18KFO8GERnr33gl8ZIdqukx+3G75MYItODmxOXwXVw01t414AJg/BVXN0942ieusta71LYRdadGFTXfkwFxoAv35xBk6hWAJsR3BSm6TLXar6zMKxKEv0KXUREGsILL97Thr/BE85Dprj8ST+jiIOG8Ikz7yzTsisZeYb96P5ySQwEGthCvjwj7iMrMq2G+JSydvPplbWusUmzMXexvq7ybbOMgumV7sxINwnaN85bl1Oiqk+cdxLCRYoAC0d1qRnfSFsEe08J/zvj9H+fSsbIqRJAUhZa2G+b8AUwBORM1KA79Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA0PR11MB8399.namprd11.prod.outlook.com (2603:10b6:208:48d::9)
 by SJ5PPF8F93806F5.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::845) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Mon, 1 Jun 2026
 19:59:54 +0000
Received: from IA0PR11MB8399.namprd11.prod.outlook.com
 ([fe80::ea10:3d10:93bf:f83c]) by IA0PR11MB8399.namprd11.prod.outlook.com
 ([fe80::ea10:3d10:93bf:f83c%6]) with mapi id 15.21.0071.010; Mon, 1 Jun 2026
 19:59:54 +0000
From: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/6][wrynose] cups: fix CVE-2026-34990
Date: Tue,  2 Jun 2026 01:27:59 +0530
Message-Id: <20260601195801.4008899-5-Abhishek.Bachiphale@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20260601195801.4008899-1-Abhishek.Bachiphale@windriver.com>
References: <20260601195801.4008899-1-Abhishek.Bachiphale@windriver.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: TY4PR01CA0094.jpnprd01.prod.outlook.com
 (2603:1096:405:37d::18) To IA0PR11MB8399.namprd11.prod.outlook.com
 (2603:10b6:208:48d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB8399:EE_|SJ5PPF8F93806F5:EE_
X-MS-Office365-Filtering-Correlation-Id: b9e7d534-3148-4c4a-5aec-08dec018595c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014|11063799006|3023799007|6133799003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	HcVWX2HW6DRLdumye3foknfrWEDwHLXlTQHbH6AMhEiYW474HCIi7MR3/cY2xR2lp5nKY7TZXJ1nmBwKFoLOIX2eLY7ng4Difw7WmlPrZLqjef3qtJ+2EAXSTvi2U5Lq/FgIBcfuWuoRkDJan1oyjxw3NbRqgRx2PVfPPGWZbHcR4WUKkYEfVu/YdV1gD/PgQzYtyrvubYgiQRcoAc7QjWQSIRRfINE5jZgWy0qPol/gku+oXlcq0xIBZ1G+XQasn8PAmPs6bgW6gkrxKlMzjwltdFXqoBr6hUnw6cGdIEmRVggRM24kw/UeTug4RU2palF2R0wndZoEwIdytnsK6NC0T9VeRd1fufT4XYn/WAhdFgarK4IDEDjPvpMMoBI1PEtpsjwGie6zr/OfTg6ryOUrjkLqbd18X02YxR/Ff5DiZuy+Sy57/DhblsToj7HBFS+E3TGJNIv2kP6zQ+5VftBbCfpshNvNxSzt4V95olfmmGKhB/evW7nwpOgqVIm1H7z8nmgcxGK+xFwb225kH4uH4pdjLt45hg1b8q9qfBZE7p/1ZN8qW/zorOBApapbghZqnWU+LMpURNg6GoUeYzK1u+oGg4WEHDtHiVMdmO6GpNjqu+dKt31smEUcfdoF8f9RvZAkyZPE/8NoSpGME8e46IsWp6Xk7Jxcahmfbbc5dFAGZuDuZaMCJ9geVpMyXJZASsDuMiUfUEV09CM/L/iGLorITvoUNIoktOiHYWHxX0Vb2yIFMhs9xL0vIE4O
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB8399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014)(11063799006)(3023799007)(6133799003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?a1BIcmo0MFNWa1RGaGd3UVRnQWlpeDlzYUV6djlEbjZxaHI1bTVldFE1WDZw?=
 =?utf-8?B?YkJDWG9OZUlQL1VwWjVnR0tnczJrYkRzTDh3dllyMFRiTVR2TmdOSTVXZkU5?=
 =?utf-8?B?Y2t5VTNyU2h0cE5DdU9hZ2p3S3lYTml4WFQwREpUeW85aWNYMWtDeWp0ZjFj?=
 =?utf-8?B?a1RCenhjRXFtK0NTQXpIdGpGUEwvMDFqU241WE1MVThJOGZLN21xOXc2ay9V?=
 =?utf-8?B?bmxkdWhiNCt4TXBMV2RWWlE0U1d6YzFkYTRIZXNFM0FDQ1RnVzNJamd3U2Vy?=
 =?utf-8?B?MDd3L1hOTlRwYXpsYnd0dGJUVW1ETDlWQThoY2YxcnhqRGtza2s0eEpFaTl3?=
 =?utf-8?B?NDZxaTlJckRvNzJJM3lOWHh5Vk9KazZyUC9QYWZSQlc3QUdDeCs2V2puWktk?=
 =?utf-8?B?ZWQrRTJsd0FDbTRCakRmWWVlTFBPYStZQS8rY2J6eS82Rkk0UDEvWHVML0JL?=
 =?utf-8?B?OGxHckhUTGk0dklWa25tcWIrQ3Jnci9tYllxVlhKUXgzYjZpSk5TWkNESVM0?=
 =?utf-8?B?VnNSQldod01NVTNna0JIOEVYS1BVOHBtcGtIOVBHd1NydXlZRlZPWGFmcmVy?=
 =?utf-8?B?M1lKbmY1c3RyTmd0K3Y5S3c0c2ZlbUcwWGxDc0I2cWVEOTAxbE1aelVMSG5R?=
 =?utf-8?B?NlduM2ZiTWdpSTRON3VLODNIYkNaYmVMUEF3RThnTUcrYXc3ZVBuaitOQ0h4?=
 =?utf-8?B?V0FFeGhnQ2d2Ly9lQks3R2p5OFBjcEwvaHVoclZ1RkRaMkg4ZE8vc1UxbG96?=
 =?utf-8?B?R0xpWHcvNkZhVzBidkpxSDRxb3VDTmZsNllUTnVtNFJyZGNkOUpWZ2RvY0s1?=
 =?utf-8?B?VzhkcmFGNWVja0lzZncybVlISWRrcHdwM3RjR1RvbnJ4dnlOc1B4ZjgreE1n?=
 =?utf-8?B?VVFWVVVsL0hSSC8wbEoyeXptRWErdTlPcEcybitkb3BMVS9kTy9VK2RZVDFq?=
 =?utf-8?B?NnF0VmtKVUFNeERHWXVwSkN6Q0VvV25NcTFpM2lXL3ZPU2NUTEQ0blVIUHpk?=
 =?utf-8?B?ZlhXc1lSNk4zNk4xVXRJWUFXdkIvNjlJWk9ERmtpSDBkNmFJNHZ4VEhUZkxO?=
 =?utf-8?B?d2l3a3pxRFRJL0kyYmVqR2lDdUZtaXYzSU1SSm13Vi9TRkpiU0xGRVRwa1dh?=
 =?utf-8?B?cEswVHB5YkJqRExQd0haZVZwQXZEY3R1cFpEcHVudXNRTHhPNElwK2tsNDZL?=
 =?utf-8?B?ZVBlNytBRXNvMmExT0lTeDFxYkxCWEZqQ2dpZmcyamNZdENwYXJCcFVQVlgx?=
 =?utf-8?B?RHU1YUZ2bWVnV28zanhxQkhwWVpMY1lFYTF4aTRqaHdlVUZvL2xNbFJUVmha?=
 =?utf-8?B?ZGFqbDFyVTVoRHQwOXZjMDVsWDNDdnVYUitFczZ2Vm5lQU5RTm5zdGJDajVM?=
 =?utf-8?B?MmdpTktQODZ0VFBVRWxQdE1TNEd2cElHTjhsdDhLb1N3TkZqcmFDbXowaGZI?=
 =?utf-8?B?VzJEcmZXTTRIZmtlYWt3eU5Nd1V1MTV4YXNZZkd5UjFBbmVma20xQUFkVTQ2?=
 =?utf-8?B?VE9Kblp3dzhNMWE2OE9XVkVPZ1dHa01VSytSQ2hRcXh0RnVoazJUcGc5dGdx?=
 =?utf-8?B?Z0FNdDRMdGhLSGF1QklXeVVzanMyd2JCKzBMcVdWNWZnRUtvVXY5S1hHZUFQ?=
 =?utf-8?B?S3ZjZnN1cXF4c2YyWkV0UkxYL2pGYnRweWVJQVRTaHRTWHgvMEFPVG0wLzBE?=
 =?utf-8?B?dGliWlhsMzZoM21PQlByVkRTTURpR0tYZEp3WUtRWHJmOG4zcHFwY0Z3U2hF?=
 =?utf-8?B?NHFHcGhGQXN5QzRxSmJxTVdLbWVVRjRvaXpCS0JNZ0hHeTl2ajJTM2hBYU9h?=
 =?utf-8?B?NjRTcDBSSit1OFVLTlRRSFYvYWhJM253REJ4SnlOcER1ZnFNQVpQQUs1cis1?=
 =?utf-8?B?aWZFVHRQWHA0UUZ1TkhKSG9Lazd2ZVRPZm93V3NUN3cyL2MrZFdKemQwWkNj?=
 =?utf-8?B?MG1rRnEwUE9NeHRGelo4MmQzc2s3UVhkRVNxbVMrbGJiWXlpcjV3MDFqNVhE?=
 =?utf-8?B?bzlzYmhhMkhSWmZxa2gwODJOUGhqMDd6RnFzWUl3UE5nSVZBVVdGNm5VSFRY?=
 =?utf-8?B?eGt6SlBXYUtrTVpzdThNemw1aVdKV3lGOHVSWDRaU3NLbDNzUDZrU0htZmtz?=
 =?utf-8?B?YmhJSmwrdE14RzJ5VFVVSGhGajkrd1hkd2xHd0NZT1hEdlhZaTN3c2dhMHow?=
 =?utf-8?B?TUdIT2E3Q3Z3SFU1cVhMRXZud3c5bk04UDBkOXRrV2JaaVFOOFZKSXdUSzdS?=
 =?utf-8?B?a2p6VmNtSzQybElSWmRZek1FV3VLM3VBNzc2dlJFOVBSK2o4VWVzSEpYMjQy?=
 =?utf-8?B?cnMwNG1nVWJUd0pCU29jZFltaHcyRDBiRlN2TmJKOURPcmhlcDJYNkU0Tlht?=
 =?utf-8?Q?0meGDzR7pgUU3V5kWlP2r0jmdh+KhSJYO3xMd?=
X-Exchange-RoutingPolicyChecked: 
	QBocvO17WAwF/dAQqoiDMhJboxLo/fpD3gW/qNX48JTIy1Ff9QWlq6zwVRtExJ809sTBFzZ6i1DGGlQp0XAZ0w2qGN1RllVoL4H9r2ZhFZOilAUGfLvvtCn410CylHwHqjdNGm6B/KoA8r4QBg1FDB+rzbi13KLBfi4/X3Fkj6E4iu9jib0xn/Qx4O0bwcvjR6HIxkuJ0K8OQ7XpgmPlN5FZq0LoQRhY0A4lrCXOJ6ZaqGWnt1XghyYn9npSqmw60anH1O8o1FWvXsiw4Lqdt+k3c/r0qEHZJVHDFJujQ1MhRwd2dN7Xiq6ajzuvv3gpa5EDq3w3w/LmGyILy7Re8A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9e7d534-3148-4c4a-5aec-08dec018595c
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB8399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 19:59:54.6103
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eKzYvB7uthNue+t3JOx0Kabsd5nIU7+slVJBODw88gs4O4uBskyZrGhUZyhcdnG4vWsLbYB/yCQhDobEFVX2k/KWp0PUJ3fyGQkokIIcvWZ4Pd/D0ELn0N269tWH44mh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF8F93806F5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE5NSBTYWx0ZWRfX2cGAKZrZqDXJ
 qVfvdPBM5sepFDveH/PWccN+T5upTRd2Ok9kbtMvTLznaEbsqHVQ3zg77ozpe94LHZc5q+npO/r
 hQtQfPJNjJOCHUsmcVEmy5vALtLv/4yOKk3sCKpzWuTVEAJFdGcncNstBgb4YTYI6yBjlYmoaHQ
 5izmynTtE5vWxyzVJixMwIKP2thJK4Jbfo2MAEj5e4ATEXgrbEqEgXIrQmUNxDDS7U/Luy1jFs9
 EFh69x0RQseZ+dFufBtCyc03us6ESNwEu+RLl6qAyidj7igILvIW+1pNkkEH8c37O+p6zpP53Q8
 ZzCH+2MJO+qU2veLI9+9a3+5uUtQOmTJQALw+SE1jCmx8I2uzqZj+gAsrxCkeVpzp/Sle+L/dZe
 mHUO/x8wbywYcWhFybZXyoXxepLYS2oTK6QuVunROBDSELjr7EjLbQ7tkqC5exC28SZy/R3ap8p
 DR1AnT+KLmIYiPpGVXg==
X-Proofpoint-GUID: cbTxc-ZXAeHkr-pX1MFJwrbOc3i4SQpD
X-Authority-Analysis: v=2.4 cv=Iq0utr/g c=1 sm=1 tr=0 ts=6a1de4bc cx=c_pps
 a=tLhGFq4bAmKo+yvJBjszOw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=F_ubicZDAAAA:20 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=aTVoPYTGAAAA:8
 a=aG43QcXWUSGWee62vf0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22 a=rKT3Ez47ESLuxQAP_tCa:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: cbTxc-ZXAeHkr-pX1MFJwrbOc3i4SQpD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010195
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 651GtJkk3879996
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 20:00:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237992

In CUPS versions 2.4.16 and prior, a local unprivileged
user can coerce cupsd into authenticating to an attacker-
controlled localhost IPP service with a reusable
Authorization: Local token. That token is sufficient to
drive /admin/ requests on localhost. By combining
CUPS-Create-Local-Printer with printer-is-shared=3Dtrue,
an attacker can persist a file:///... queue even though
the normal FileDevice policy rejects such URIs. Printing
to that queue allows arbitrary root file overwrite. A
proof-of-concept demonstrates dropping a sudoers fragment
to achieve root command execution.

Apply upstream fix to prevent misuse of Local authorization
tokens and block unauthorized file:/// queues.

Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
---
 meta/recipes-extended/cups/cups.inc           |   1 +
 .../cups/cups/CVE-2026-34990.patch            | 348 ++++++++++++++++++
 2 files changed, 349 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-34990.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/=
cups/cups.inc
index f23411f44b..42107774e4 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -18,6 +18,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/cups-${=
PV}-source.tar.gz \
            file://CVE-2026-34978.patch \
            file://CVE-2026-34979.patch \
            file://CVE-2026-34980.patch \
+           file://CVE-2026-34990.patch \
            "
=20
 GITHUB_BASE_URI =3D "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-34990.patch b/meta/=
recipes-extended/cups/cups/CVE-2026-34990.patch
new file mode 100644
index 0000000000..3f7781c19e
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-34990.patch
@@ -0,0 +1,348 @@
+From e052dc44da9d12adfbebc51de4975fbadb2ce356 Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <msweet@msweet.org>
+Date: Tue, 31 Mar 2026 15:55:50 -0400
+Subject: [PATCH] Don't allow local certificates over the loopback interf=
ace,
+ drop support for writing to plain files.
+
+OpenPrinting CUPS is an open source printing system for Linux and other
+Unix-like operating systems. In versions 2.4.16 and prior, a local
+unprivileged user can coerce cupsd into authenticating to an
+attacker-controlled localhost IPP service with a reusable Authorization:
+Local ... token. That token is enough to drive /admin/ requests on
+localhost, and the attacker can combine CUPS-Create-Local-Printer with
+printer-is-shared=3Dtrue to persist a file: ///... queue even though the
+normal FileDevice policy rejects such URIs. Printing to that queue gives
+an arbitrary root file overwrite; the PoC below uses that primitive to
+drop a sudoers fragment and demonstrate root command execution.
+
+CVE: CVE-2026-34990
+
+Upstream-Status: Backport [ https://github.com/OpenPrinting/cups/commit/=
e052dc44da9d12adfbebc51de4975fbadb2ce356 ]
+
+Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
+---
+ cups/auth.c                    | 30 ++++++----------------
+ scheduler/auth.c               |  6 ++---
+ scheduler/client.c             |  4 +--
+ scheduler/ipp.c                |  6 ++---
+ scheduler/job.c                | 46 ++++++++++++++++++----------------
+ test/4.2-cups-printer-ops.test |  6 ++---
+ test/5.1-lpadmin.sh            | 14 +++++------
+ 7 files changed, 52 insertions(+), 62 deletions(-)
+
+diff --git a/cups/auth.c b/cups/auth.c
+index 5cb419458f..14661c7bef 100644
+--- a/cups/auth.c
++++ b/cups/auth.c
+@@ -1,7 +1,7 @@
+ /*
+  * Authentication functions for CUPS.
+  *
+- * Copyright =C2=A9=C2=A02020-2024 by OpenPrinting.
++ * Copyright =C2=A9=C2=A02020-2026 by OpenPrinting.
+  * Copyright =C2=A9=C2=A02007-2019 by Apple Inc.
+  * Copyright =C2=A9=C2=A01997-2007 by Easy Software Products.
+  *
+@@ -92,7 +92,6 @@ static void	cups_gss_printf(OM_uint32 major_status, OM=
_uint32 minor_status,
+ #    define	cups_gss_printf(major, minor, message)
+ #  endif /* DEBUG */
+ #endif /* HAVE_GSSAPI */
+-static int	cups_is_local_connection(http_t *http);
+ static int	cups_local_auth(http_t *http);
+=20
+=20
+@@ -948,14 +947,6 @@ cups_gss_printf(OM_uint32  major_status,/* I - Majo=
r status code */
+ #  endif /* DEBUG */
+ #endif /* HAVE_GSSAPI */
+=20
+-static int				/* O - 0 if not a local connection */
+-					/*     1  if local connection */
+-cups_is_local_connection(http_t *http)	/* I - HTTP connection to server=
 */
+-{
+-  if (!httpAddrLocalhost(http->hostaddr) && _cups_strcasecmp(http->host=
name, "localhost") !=3D 0)
+-    return 0;
+-  return 1;
+-}
+=20
+ /*
+  * 'cups_local_auth()' - Get the local authorization certificate if
+@@ -967,13 +958,7 @@ static int				/* O - 0 if available */
+ 					/*    -1 error */
+ cups_local_auth(http_t *http)		/* I - HTTP connection to server */
+ {
+-#if defined(_WIN32) || defined(__EMX__)
+- /*
+-  * Currently _WIN32 and OS-2 do not support the CUPS server...
+-  */
+-
+-  return (1);
+-#else
++#if !_WIN32 && !__EMX__ && defined(AF_LOCAL)
+   int			pid;		/* Current process ID */
+   FILE			*fp;		/* Certificate file */
+   char			trc[16],	/* Try Root Certificate parameter */
+@@ -998,7 +983,7 @@ cups_local_auth(http_t *http)		/* I - HTTP connectio=
n to server */
+   * See if we are accessing localhost...
+   */
+=20
+-  if (!cups_is_local_connection(http))
++  if (httpAddrFamily(httpGetAddress(http)) !=3D AF_LOCAL)
+   {
+     DEBUG_puts("8cups_local_auth: Not a local connection!");
+     return (1);
+@@ -1072,15 +1057,14 @@ cups_local_auth(http_t *http)		/* I - HTTP conne=
ction to server */
+   }
+ #  endif /* HAVE_AUTHORIZATION_H */
+=20
+-#  if defined(SO_PEERCRED) && defined(AF_LOCAL)
++#  ifdef SO_PEERCRED
+  /*
+   * See if we can authenticate using the peer credentials provided over=
 a
+   * domain socket; if so, specify "PeerCred username" as the authentica=
tion
+   * information...
+   */
+=20
+-  if (http->hostaddr->addr.sa_family =3D=3D AF_LOCAL &&
+-      !getenv("GATEWAY_INTERFACE") &&	/* Not via CGI programs... */
++  if (!getenv("GATEWAY_INTERFACE") &&	/* Not via CGI programs... */
+       cups_auth_find(www_auth, "PeerCred"))
+   {
+    /*
+@@ -1104,7 +1088,7 @@ cups_local_auth(http_t *http)		/* I - HTTP connect=
ion to server */
+       return (0);
+     }
+   }
+-#  endif /* SO_PEERCRED && AF_LOCAL */
++#  endif /* SO_PEERCRED */
+=20
+   if ((schemedata =3D cups_auth_find(www_auth, "Local")) =3D=3D NULL)
+     return (1);
+@@ -1164,7 +1148,7 @@ cups_local_auth(http_t *http)		/* I - HTTP connect=
ion to server */
+       return (0);
+     }
+   }
++#endif /* !_WIN32 && !__EMX__ && AF_LOCAL */
+=20
+   return (1);
+-#endif /* _WIN32 || __EMX__ */
+ }
+diff --git a/scheduler/auth.c b/scheduler/auth.c
+index 471de0492f..3e7041e220 100644
+--- a/scheduler/auth.c
++++ b/scheduler/auth.c
+@@ -318,7 +318,7 @@ cupsdAuthorize(cupsd_client_t *con)	/* I - Client co=
nnection */
+   }
+ #ifdef HAVE_AUTHORIZATION_H
+   else if (!strncmp(authorization, "AuthRef ", 8) &&
+-           httpAddrLocalhost(httpGetAddress(con->http)))
++           httpAddrFamily(httpGetAddress(con->http)) =3D=3D AF_LOCAL)
+   {
+     OSStatus		status;		/* Status */
+     char		authdata[HTTP_MAX_VALUE];
+@@ -399,7 +399,7 @@ cupsdAuthorize(cupsd_client_t *con)	/* I - Client co=
nnection */
+ #endif /* HAVE_AUTHORIZATION_H */
+ #if defined(SO_PEERCRED) && defined(AF_LOCAL)
+   else if (PeerCred !=3D CUPSD_PEERCRED_OFF && !strncmp(authorization, =
"PeerCred ", 9) &&
+-           con->http->hostaddr->addr.sa_family =3D=3D AF_LOCAL && con->=
best)
++           httpAddrFamily(httpGetAddress(con->http)) =3D=3D AF_LOCAL &&=
 con->best)
+   {
+    /*
+     * Use peer credentials from domain socket connection...
+@@ -489,7 +489,7 @@ cupsdAuthorize(cupsd_client_t *con)	/* I - Client co=
nnection */
+   }
+ #endif /* SO_PEERCRED && AF_LOCAL */
+   else if (!strncmp(authorization, "Local", 5) &&
+-	   httpAddrLocalhost(httpGetAddress(con->http)))
++	   httpAddrFamily(httpGetAddress(con->http)) =3D=3D AF_LOCAL)
+   {
+    /*
+     * Get Local certificate authentication data...
+diff --git a/scheduler/client.c b/scheduler/client.c
+index 51be34f448..ab35bb7566 100644
+--- a/scheduler/client.c
++++ b/scheduler/client.c
+@@ -2188,7 +2188,7 @@ cupsdSendHeader(
+       strlcpy(auth_str, "Negotiate", sizeof(auth_str));
+     }
+=20
+-    if (con->best && !con->is_browser && !_cups_strcasecmp(httpGetHostn=
ame(con->http, NULL, 0), "localhost"))
++    if (con->best && !con->is_browser && httpAddrFamily(httpGetAddress(=
con->http)) =3D=3D AF_LOCAL)
+     {
+      /*
+       * Add a "trc" (try root certification) parameter for local
+@@ -2208,7 +2208,7 @@ cupsdSendHeader(
+       auth_size =3D sizeof(auth_str) - (size_t)(auth_key - auth_str);
+=20
+ #if defined(SO_PEERCRED) && defined(AF_LOCAL)
+-      if (PeerCred !=3D CUPSD_PEERCRED_OFF && httpAddrFamily(httpGetAdd=
ress(con->http)) =3D=3D AF_LOCAL)
++      if (PeerCred !=3D CUPSD_PEERCRED_OFF)
+       {
+         strlcpy(auth_key, ", PeerCred", auth_size);
+         auth_key +=3D 10;
+diff --git a/scheduler/ipp.c b/scheduler/ipp.c
+index cb228b87c8..9a280e7525 100644
+--- a/scheduler/ipp.c
++++ b/scheduler/ipp.c
+@@ -5625,7 +5625,7 @@ create_local_printer(
+   * Require local access to create a local printer...
+   */
+=20
+-  if (!httpAddrLocalhost(httpGetAddress(con->http)))
++  if (httpAddrFamily(httpGetAddress(con->http)) !=3D AF_LOCAL)
+   {
+     send_ipp_status(con, IPP_STATUS_ERROR_FORBIDDEN, _("Only local user=
s can create a local printer."));
+     return;
+@@ -5685,9 +5685,9 @@ create_local_printer(
+=20
+   ptr =3D ippGetString(device_uri, 0, NULL);
+=20
+-  if (!ptr || !ptr[0])
++  if (!ptr || !ptr[0] || (strncmp(ptr, "ipp://", 6) && strncmp(ptr, "ip=
ps://", 7)))
+   {
+-    send_ipp_status(con, IPP_STATUS_ERROR_BAD_REQUEST, _("Attribute \"%=
s\" has empty value."), "device-uri");
++    send_ipp_status(con, IPP_STATUS_ERROR_NOT_POSSIBLE, _("Bad device-u=
ri \"%s\"."), ptr);
+=20
+     return;
+   }
+diff --git a/scheduler/job.c b/scheduler/job.c
+index 0494d7196d..6599bfcf48 100644
+--- a/scheduler/job.c
++++ b/scheduler/job.c
+@@ -1163,35 +1163,39 @@ cupsdContinueJob(cupsd_job_t *job)	/* I - Job */
+ 	}
+ 	else
+ 	{
++	  char	scheme[32],		/* URI scheme */
++		userpass[32],		/* URI username:password */
++		host[256],		/* URI hostname */
++		resource[1024];		/* URI resource path (filename) */
++	  int	port;			/* URI port number */
++
++          httpSeparateURI(HTTP_URI_CODING_ALL, job->printer->device_uri=
, scheme, sizeof(scheme), userpass, sizeof(userpass), host, sizeof(host),=
 &port, resource, sizeof(resource));
++
+ 	  job->print_pipes[0] =3D -1;
+-	  if (!strcmp(job->printer->device_uri, "file:/dev/null") ||
+-	      !strcmp(job->printer->device_uri, "file:///dev/null"))
+-	    job->print_pipes[1] =3D -1;
+-	  else
++	  job->print_pipes[1] =3D -1;
++
++	  if (strcmp(resource, "/dev/null"))
+ 	  {
+-	    if (!strncmp(job->printer->device_uri, "file:/dev/", 10))
+-	      job->print_pipes[1] =3D open(job->printer->device_uri + 5,
+-	                        	 O_WRONLY | O_EXCL);
+-	    else if (!strncmp(job->printer->device_uri, "file:///dev/", 12))
+-	      job->print_pipes[1] =3D open(job->printer->device_uri + 7,
+-	                        	 O_WRONLY | O_EXCL);
+-	    else if (!strncmp(job->printer->device_uri, "file:///", 8))
+-	      job->print_pipes[1] =3D open(job->printer->device_uri + 7,
+-	                        	 O_WRONLY | O_CREAT | O_TRUNC, 0600);
+-	    else
+-	      job->print_pipes[1] =3D open(job->printer->device_uri + 5,
+-	                        	 O_WRONLY | O_CREAT | O_TRUNC, 0600);
++	    if (!FileDevice)
++	    {
++	      abort_message =3D "Stopping job because file: output is disabled=
.";
+=20
+-	    if (job->print_pipes[1] < 0)
++              goto abort_job;
++	    }
++	    else if ((job->print_pipes[1] =3D open(resource, O_WRONLY | O_EXCL=
)) < 0)
+ 	    {
+-	      abort_message =3D "Stopping job because the scheduler could not =
"
+-	                      "open the output file.";
++	      abort_message =3D "Stopping job because the scheduler could not =
open the output file.";
+=20
+               goto abort_job;
+ 	    }
++	    else
++	    {
++	     /*
++	      * Close this file on execute...
++	      */
+=20
+-	    fcntl(job->print_pipes[1], F_SETFD,
+-        	  fcntl(job->print_pipes[1], F_GETFD) | FD_CLOEXEC);
++	      fcntl(job->print_pipes[1], F_SETFD, fcntl(job->print_pipes[1], F=
_GETFD) | FD_CLOEXEC);
++	    }
+           }
+ 	}
+       }
+diff --git a/test/4.2-cups-printer-ops.test b/test/4.2-cups-printer-ops.=
test
+index 1a011e011a..945a9bbd71 100644
+--- a/test/4.2-cups-printer-ops.test
++++ b/test/4.2-cups-printer-ops.test
+@@ -1,7 +1,7 @@
+ #
+ # Verify that the CUPS printer operations work.
+ #
+-# Copyright =C2=A9=C2=A02020-2024 by OpenPrinting.
++# Copyright =C2=A9=C2=A02020-2026 by OpenPrinting.
+ # Copyright =C2=A9=C2=A02007-2019 by Apple Inc.
+ # Copyright =C2=A9=C2=A02001-2006 by Easy Software Products. All rights=
 reserved.
+ #
+@@ -180,7 +180,7 @@
+ 	ATTR uri printer-uri $method://$hostname:$port/printers/Test2
+=20
+ 	GROUP printer
+-	ATTR uri device-uri file:/tmp/Test2
++	ATTR uri device-uri file:///dev/null
+ 	ATTR enum printer-state 3
+ 	ATTR boolean printer-is-accepting-jobs true
+=20
+@@ -206,7 +206,7 @@
+ 	ATTR uri printer-uri $method://$hostname:$port/printers/Test1
+=20
+ 	GROUP printer
+-	ATTR uri device-uri file:/tmp/Test1
++	ATTR uri device-uri file:///dev/null
+ 	ATTR enum printer-state 3
+ 	ATTR boolean printer-is-accepting-jobs true
+ 	ATTR text printer-info "Test Printer 1"
+diff --git a/test/5.1-lpadmin.sh b/test/5.1-lpadmin.sh
+index aa398000a1..36f2822275 100644
+--- a/test/5.1-lpadmin.sh
++++ b/test/5.1-lpadmin.sh
+@@ -2,7 +2,7 @@
+ #
+ # Test the lpadmin command.
+ #
+-# Copyright =C2=A9=C2=A02020-2024 by OpenPrinting.
++# Copyright =C2=A9=C2=A02020-2026 by OpenPrinting.
+ # Copyright =C2=A9=C2=A02007-2018 by Apple Inc.
+ # Copyright =C2=A9=C2=A01997-2005 by Easy Software Products, all rights=
 reserved.
+ #
+@@ -12,8 +12,8 @@
+=20
+ echo "Add Printer Test"
+ echo ""
+-echo "    lpadmin -p Test3 -v file:/dev/null -E -m drv:///sample.drv/de=
skjet.ppd"
+-$runcups $VALGRIND ../systemv/lpadmin -p Test3 -v file:/dev/null -E -m =
drv:///sample.drv/deskjet.ppd 2>&1
++echo "    lpadmin -p Test3 -v file:///dev/null -E -m drv:///sample.drv/=
deskjet.ppd"
++$runcups $VALGRIND ../systemv/lpadmin -p Test3 -v file:///dev/null -E -=
m drv:///sample.drv/deskjet.ppd 2>&1
+ if test $? !=3D 0; then
+ 	echo "    FAILED"
+ 	exit 1
+@@ -29,8 +29,8 @@ echo ""
+=20
+ echo "Modify Printer Test"
+ echo ""
+-echo "    lpadmin -p Test3 -v file:/tmp/Test3 -o PageSize=3DA4"
+-$runcups $VALGRIND ../systemv/lpadmin -p Test3 -v file:/tmp/Test3 -o Pa=
geSize=3DA4 2>&1
++echo "    lpadmin -p Test3 -v file:///dev/null -o PageSize=3DA4"
++$runcups $VALGRIND ../systemv/lpadmin -p Test3 -v file:///dev/null -o P=
ageSize=3DA4 2>&1
+ if test $? !=3D 0; then
+ 	echo "    FAILED"
+ 	exit 1
+@@ -65,8 +65,8 @@ echo ""
+=20
+ echo "Add a printer for cupSNMP/IPPSupplies test"
+ echo ""
+-echo "    lpadmin -p Test4 -E -v file:/dev/null -m drv:///sample.drv/ze=
bra.ppd"
+-$runcups $VALGRIND ../systemv/lpadmin -p Test4 -E -v file:/dev/null -m =
drv:///sample.drv/zebra.ppd 2>&1
++echo "    lpadmin -p Test4 -E -v file:///dev/null -m drv:///sample.drv/=
zebra.ppd"
++$runcups $VALGRIND ../systemv/lpadmin -p Test4 -E -v file:///dev/null -=
m drv:///sample.drv/zebra.ppd 2>&1
+ if test $? !=3D 0; then
+ 	echo "    FAILED"
+ 	exit 1
--=20
2.40.0


