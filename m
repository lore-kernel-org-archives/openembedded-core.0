Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77197C19F32
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 12:45:33 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.12260.1741178730043828006
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Mar 2025 04:45:30 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5159f55f0d=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5254vTdr025604
	for <openembedded-core@lists.openembedded.org>; Wed, 5 Mar 2025 04:45:29 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 456cs7rn3u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 04:45:29 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 525CjSHG030091;
	Wed, 5 Mar 2025 04:45:29 -0800
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 456cs7rn3t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 04:45:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NbZV5HUs4p5WV5WoPWXzIKBlT8DM7tuK5Z7wcj5ej5/CF3KgDL6zseJpVq0C1/NpbMVbf+l4vAcjsBEBKEARHj7ia6tIBjRBdQT5eeG0MSq02QG0hox39JJqffUVb0RHBDRIH0mId1XPb1grq2ngEIdzT158Rin4w06Y5sZPaOIDfgMwcybkzk5xiYLRmkOyX+KeU0Xxf6t+bH210B6wZO4q2I3ymG2Mn1+ekowzVXuMlBsh7nvXvdFMRrouxuj2xrOtT0DW6DS2oh4DXOXyMxmya8EQiit4NV/Y4MikIwd5VVNSzALc4z3JPK61hjv7CrA59y+8fsiv9Ro6B5XEBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8NRpeP/tqdDOKw+6iHvk+VRyPS0t7QLQgQHscw/6mKU=;
 b=jPf+KwuH/rSSA/2tyMgx0xIriE+k6/QfHlPYWbVlnAp92Beuz5Nd59eujruc/jg1mfpPgDBFmb2qu6H9NnJLHtWMg7STHXhoofUo0BiT8TTYn9H4u3QBsq9T+73lyI7bxQIGNi3RKP7krYyCoeptVbiXOpzLSIiYGaKhkVCL0UtIVzs2ijMGlXQsmcJkdziZzT5tsD6DM8cT8q1C9LmehA4RiTzoUMknj22jIly710VpYBBC0w8mZkwnGObbYY27fbTmbGhkYYycZk3Vrk5ftMFP67uS4NHfNyPteiSEsvGMsv/6ELbz48Xzx1r21dIPI/k9ZR7IVsDho7nL0dY3Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by SJ0PR11MB4909.namprd11.prod.outlook.com (2603:10b6:a03:2af::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.30; Wed, 5 Mar
 2025 12:45:24 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%6]) with mapi id 15.20.8511.017; Wed, 5 Mar 2025
 12:45:23 +0000
Message-ID: <1517635c-3700-4e36-b9ed-f1cc84d0246f@windriver.com>
Date: Wed, 5 Mar 2025 18:15:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH V3 2/3] rust: Fix build break because of
 download-ci-llvm
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
        Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com
References: <20250305060202.2477305-1-Deepesh.Varatharajan@windriver.com>
 <20250305060202.2477305-2-Deepesh.Varatharajan@windriver.com>
 <CANNYZj_F8LKutEXB1UpDPd8y6qKTYKaPwEefYJ+L3RdWrG4HMA@mail.gmail.com>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <CANNYZj_F8LKutEXB1UpDPd8y6qKTYKaPwEefYJ+L3RdWrG4HMA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0168.namprd03.prod.outlook.com
 (2603:10b6:a03:338::23) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|SJ0PR11MB4909:EE_
X-MS-Office365-Filtering-Correlation-Id: d09f2691-b5fe-470e-bb67-08dd5be398c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cHdBMEdQeXJJZXE4Tit4TnFLWTBLRC9pS3V5VEY0U2lBY2pFeTBTazlHQitG?=
 =?utf-8?B?WDZMa21hWWZGaHpvelFEbjNheDl6OXZZTW5LbnNsTmJMOWZpVzY5eG5obTRU?=
 =?utf-8?B?YU1YUGtBOWJyOWYxV2MxRzhscnY3bE5NR3R0RkRjMTRLRzVFTEdXdVRRT1RI?=
 =?utf-8?B?SDBpN2U1VjAzbGZBSEpkV2xvUkphOWJMNm1idTY5NG5DMUpkN0NMK2NlRVBa?=
 =?utf-8?B?V085SmZtbXM2ckFxMnVFaU5zeHc5Mld2WkE4UHlsYVRXcGVDd2RPeWNWYzVh?=
 =?utf-8?B?ZFBSTzBzYksvdGRQa28vQWdIRDg0ajQ1bjRyVFZHWWtWMW1vQ0NLdWRMYnly?=
 =?utf-8?B?VDJjVjY4VFRGd0UwTEFBdmVZN1daSHhTR3hwSk9wcHRYOUd0ejJ1aVFPNVEv?=
 =?utf-8?B?L3dGaDZxV3RNbXlpbXlaclErdjg3bXh5bEFWOHJ1RE5manNEbTNTZHFFUW15?=
 =?utf-8?B?UVNpblVyRE9FanhTOVEybm4xYTd2UXJ5Qy9aeDRaVzExSDd0bHlXMDBqNW9x?=
 =?utf-8?B?R2xCdTVyTzJKekE3dEF4YXJnck5XQzdJYWVvNEFwMUJkdmFpcSszdUF1VEN4?=
 =?utf-8?B?UFU3NUdjekdWd1dMeWhPUjJuTzFHNTNONXdiUXNPOVRuSkZaMlNWdmxZR2lp?=
 =?utf-8?B?L29pbm5IektlVEwxKytFRFZJK3JXM0ZsazE3LzVGQ0tsTmJuL0ZTYmprYTNO?=
 =?utf-8?B?OGh5VnhQRlZmYkdxWkJvb0hJSk1ndThoK3p1OFBpNFZzUnVOVk5tYkUvNWJt?=
 =?utf-8?B?UjY2QVgvRVNRQ2xVYVhQRVVPUktkcy9lUGdtWWdVdkZlaDB5bi9PWm13V0ZN?=
 =?utf-8?B?dWo4b29oSzhWN2RMWVgyeE9odjlNRXVFampjU3lkVXFjSFRMZGVETUp3S2VX?=
 =?utf-8?B?MXZ3V1l2aEZMOHNyTFVuZFFxc1JhNThBc05LZEFrUk1mcHZmNnM1dHBlc2NL?=
 =?utf-8?B?eFVNcFhNaE5tS1lEQWk0TU5oaWM1NWt2clIzL0o3RmFBQ3NMMHRqMzhHUzJO?=
 =?utf-8?B?Wk1MUWoyb1M2OFJGaktjTGQzY1JXakZFRks4eTg5b0ZmUnY3UUdTdDNIVWZK?=
 =?utf-8?B?MVNmTVVRRS9GRjl5aEVzdzVuV2F5K0owVVdKenZCejcrNWlpNkhWTlRISHpE?=
 =?utf-8?B?ZXZrQzZrYmRrN3ZFSmZSVGhmNW82R1E3Qzltd3NZL3NVZjd6d2xPTVY4aVJD?=
 =?utf-8?B?N3JHOTVRWFVsaEhPWGpHQTRPMTZQWkZ0Tm9PQzQxUWlqMng4ajQyZHZFSVM5?=
 =?utf-8?B?MStlYWhpNTAzT01rVlgraTQrUG0zNzByczhwbHB0azRUWEdDRzlHajVERnVI?=
 =?utf-8?B?OTQreWlRM3RGdDkremRzWFFQa1hBZmMxUmw1NTFFdXF0RjUzNnc4SnFud2Rj?=
 =?utf-8?B?eHJhNE1SL0pmcnd0WVJUUWpNN1dKc1E5WUQ2WU1RMEd1TDNaaENUc0RZZUtW?=
 =?utf-8?B?eXloUk14UWZnTGpHQldsTHZLRWxKaXNSUW14ci9aRXF0cTFkNXFJY1FlS1BT?=
 =?utf-8?B?VmdQZ1NhbUhkZVBSTitnbC9kZjU1RXBqeVgyejVLQ0dFUEMzcWlwa2RVMEtx?=
 =?utf-8?B?Vm1GQ211RkprQlpIeVZsMGJZSW16Mit6SmQxS2tyV2s0YysvS2lGNUw1VUds?=
 =?utf-8?B?R0JhbFdoS3dack5IVEtEc2RoWEdQbktlVVJxRTczelNEQ3cycEVzUlBOdlI2?=
 =?utf-8?B?Mnp0bEFnc3I1Smd0dWczSGtSNDdUS3UxUmRTU0k0ZE1VakRtM0t5NHRjUWNY?=
 =?utf-8?B?NXJGTWRRK3c2U0ErNVhhRzk1STNjUjhSUmhnQUNPZE56TGRRQ0g2SnlTWTBC?=
 =?utf-8?B?UWdVdEdFb01iL1RQQi93UER4YkxaamNpNllQeWFqa1QrYnluaWV4QkFNZUY0?=
 =?utf-8?Q?R0Mbp/6433351?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VEI0YmtDRDBSUnRqWWxIdXE3eGdmN1h2V3czaldZMzc5bkFTSW1nRXcrZkta?=
 =?utf-8?B?WDYrMzNnM1d0Wk9WandNbnZIMndHUWdWajk3WnZCY1FCdHU0VlRVT0V2NkUr?=
 =?utf-8?B?OU5VN0hDVTFJWnhoU0Qzc2t4eU5GNU1rM0JTMERkOEZQV3ZMMUQ2R1Q5WUd1?=
 =?utf-8?B?ZWZvdUw4U0NuQ2x5Z21pdjhSRzdzUlNPbTZ2WFo4dzJmOVNyKzBWanBiVlI3?=
 =?utf-8?B?b0FOTWQ0eWo4aDVQUCs2RmNKaThKRlJOSVJtK052Wnphcjk0SFZPckJBRXR2?=
 =?utf-8?B?WVdkVjVNbE10ekpJRXd5K01sRVM4aTVJVnpwY2FwOGZaZ0ZTaHYwWHZPZVBi?=
 =?utf-8?B?dGtLQSsvMlNhcTdXUnFiSHV5OTJFQUdOb1IyNXV3UHE2WHR5RS8xQWl0dDlt?=
 =?utf-8?B?OVJYTG9VQWlZb0k4L0lRWVNrdEJla2YvWnlDeWJDR0xEbzhzSlRRcU13ZVEx?=
 =?utf-8?B?bE16YmJNcFp1Uy9EQ1hEbHpMcWpzQ2oxcmZsZ0drS0ZUaXhtbWQyYms1cWc4?=
 =?utf-8?B?OW1IdndHL29zT0UyRm8rdU16RkJTQVZsblNSb1FvREtRb3RacktnbnpzY0lN?=
 =?utf-8?B?dWxINDgvREY3aHcxN3FUNWlTSWdrakprMXd1RnlmM2NnK0ZlUmFzcnBhVW1U?=
 =?utf-8?B?djhYWlNuZUs3QXRMcGx6a2NSeGR0ZUIzYUR2ZElTRk9rTGhkRFY2bTAzLzZh?=
 =?utf-8?B?RHNFenVjdEt0dWJVeU83Q2ZIUE03ays2M3c2NUNKbXRndE04ektvU2Q5OEhx?=
 =?utf-8?B?Ukg3eDhJYmcwZmQ5VFNMMHo1dXA0T2RFMDhueWphY3FDS3N2OVdLd0FiV25z?=
 =?utf-8?B?c0xXS0NUVVVKdlhvZkpwODJ6Vm1nQ0I0RUNsREtIZFdzRXlJTlBOSDVrMFUv?=
 =?utf-8?B?L1c2REJYdVI1T0V1dUNIQ2xmZGNwRVFnM1JTdEZabDByemhOUnlJQ2Zsb3VG?=
 =?utf-8?B?M3FkQUoyb1ZLZURRa1hsZDFEdGViSkNFU1h5dXFkNkV0UTVzQmEveHgwZWZE?=
 =?utf-8?B?R3N3MlVPZ0JHdnVEajBxTXhXdjZPSkp6akE2MHdEZmdnTFZoendJUkVrd21j?=
 =?utf-8?B?T3pJVUhKUkJhYW80TytlSjBDLzR5VlNLN0JjOE9aUVpML01BYXBKa0JQWE85?=
 =?utf-8?B?cGhrYXRNNVdIeXVnM3pyQXp2a09CM1AxNHM5MWJMaUxYbXp1Z3ZjVEZQRlhM?=
 =?utf-8?B?K3pOMzZVRGt4SXVSSHloTHRHRE04UitWRnVIM0JBQS9hc1pzYnUrNW4rQUZh?=
 =?utf-8?B?ejBCR1VTTml0aDBiS0xjOXpuMzlSc3JWMXdvZlRDL1NEVGxKLzFnUWJNRUVD?=
 =?utf-8?B?bTV0bDRudDBJazRZbWcyeHc5bzZNUis0ZFM2bWhUTnpTcnFZaHdva2hmRk83?=
 =?utf-8?B?UUF0ME4xL0pIQ0RPY1Rab0hhbmp2NE95RVFTbTNTVjZqVmQyVFd6aTVOMzA5?=
 =?utf-8?B?UElnSGNzTjV0dkhLZDQ1RWR0aWJaK3NBdVhMMmVwUHpxQVZ4dWFKNFpGREZz?=
 =?utf-8?B?Z05YWCs4bHR6QWt0aHhSWnRhU1ZOeldZdlhBN2pIRGozSzNnZ3hvOHlKL05T?=
 =?utf-8?B?OGI1c1RjTUdSUi9JR2ErbkJveE5VeGJPS0NEcXBxcDNZT1JLcUU2emdseXky?=
 =?utf-8?B?NzRLWHdvWFFHZSttaklvL3pqWWd5czQ4K1VUcUxKYnNVNUlEK1U1WlA4Kyt6?=
 =?utf-8?B?dFVPN3FXOXhOcW9uU0E4NC91NXl0eVFDZHI5L3V5S3NCa0RYckYvKzI1QVJL?=
 =?utf-8?B?RFh2c3FsVzJEVWpzNzVRVmN1QzhrRHhxWnhYTHY2MWxxaFI2b21rRTJhRkxJ?=
 =?utf-8?B?NEdUT1BrOFFoS0FLTG9tQ2hsZTF4bDNsSXNaSjBpQWRFaElkamtkQW1xUHlP?=
 =?utf-8?B?dldOY3hTenVMbnZpcDZtcGEweUVyRERDdmIwSXFKSUpmbUhKdVJ0YlNKUzBD?=
 =?utf-8?B?c3JIN3MyWEd0R1oxUzk2UWh3ZGlrbkVPM3R2R211YjJCdEF3UmhWUlhIZlhY?=
 =?utf-8?B?NFBEWCtIT09YSWlXejhmQTkzOU12dDBJa083MkxYbTIwNWlldG1mck1ES2t3?=
 =?utf-8?B?eFJXeXhOKy8zNXBOdFZvWFZuSWpNYkhVUG0vRWZzUmt6cWJ5Vm4yVmZEWm1p?=
 =?utf-8?B?eG9WSnpQYmcxMVQ1V05wNzBrOG96Vi9jcVlVL2FLdDh0TXpSeFpxcnpxYVQ0?=
 =?utf-8?Q?EE71BEsP6XXBje6oHU/HGqc=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d09f2691-b5fe-470e-bb67-08dd5be398c8
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 12:45:23.7188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vRBK6ZaVLUeGMAdX88BimpFn2Rxq9LtpBQg6hN+w4XGbmq3Ml+ueRAyVSzpH1RpvTZBHqQD3uWfw2kmp3yL55rGzEI5V4Px+UBnJY7J0Okzx7hGIyLDWf+rsZk4FHaeD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4909
X-Authority-Analysis: v=2.4 cv=DfbtqutW c=1 sm=1 tr=0 ts=67c84769 cx=c_pps a=kqCqMoaEgQjRYYKBKtAp1Q==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=3aLSISN8kjDvXGXELL0A:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 1my3tU8Zf3iVia6OLy_5DFtbHuxCVtZ6
X-Proofpoint-ORIG-GUID: aFcjJfzYpiAkMm2I0_sQ0x8TmjtEglaS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_05,2025-03-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 mlxlogscore=999 suspectscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2503050100
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 12:45:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212306


On 05-03-2025 16:07, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Wed, 5 Mar 2025 at 07:02, Varatharajan, Deepesh via
> lists.openembedded.org
> <deepesh.varatharajan=windriver.com@lists.openembedded.org> wrote:
>> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>>
>> Previously, download-ci-llvm was set to false. However, with the following commit:
>> https://github.com/rust-lang/rust/commit/7d579046c80d3de3143dcb8b2db5640f95b5383c ,
>> which has been present from rust_1.83, it was changed to true. As a result, after
>> updating to rust_1.83, we encountered the following error during the build:
>>
>> -------------------------------------------------------------------------------
>> | thread 'main' panicked at src/core/config/config.rs:2047:13:
>> | setting build-target.llvm-config is incompatible with download-ci-llvm.
>> | note: run with `RUST_BACKTRACE=1` environment variable to display a backtrace
>> -------------------------------------------------------------------------------
>>
>> To resolve this issue, we are setting download-ci-llvm back to false.
>>
>> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>> ---
>>   meta/recipes-devtools/rust/rust_1.83.0.bb | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-devtools/rust/rust_1.83.0.bb b/meta/recipes-devtools/rust/rust_1.83.0.bb
>> index c4f8ee7108..cd470b1883 100644
>> --- a/meta/recipes-devtools/rust/rust_1.83.0.bb
>> +++ b/meta/recipes-devtools/rust/rust_1.83.0.bb
>> @@ -129,6 +129,7 @@ python do_configure() {
>>       # [llvm]
>>       config.add_section("llvm")
>>       config.set("llvm", "static-libstdcpp", e(False))
>> +    config.set("llvm", "download-ci-llvm", e(False))
>>       if "llvm" in (d.getVar('TC_CXX_RUNTIME') or ""):
>>           config.set("llvm", "use-libcxx", e(True))
> The fix and the explanation is fine, but the ordering of commits isn't
> - if you place it after the version update, then anyone bisecting the
> build and landing on the update commit will see this breakage. It's
> better to make this the first commit, or to squash it into the update
> (preserving the explanation).
>
> Alex

Sure, I will send a V4 with the suggested order .

Regards,
Deepesh


