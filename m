Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F123FE77188
	for <webhook@archiver.kernel.org>; Thu,  9 Jan 2025 02:17:55 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.38759.1736389074820841814
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 18:17:54 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3104150da8=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50919Z8i006009
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Jan 2025 18:17:54 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 441fkp99yv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 18:17:54 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5092Hrox007324;
	Wed, 8 Jan 2025 18:17:53 -0800
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2047.outbound.protection.outlook.com [104.47.74.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 441fkp99yr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 18:17:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KCQCL7agB+fUX+xrN5vITSrGxD1LsDE/9ifcuzDW1GE0vBKZ7cbhtiS14PpXIT3ewdCDuBoyBHWwbzmS/LlenIPZ0PubjU31OvwKDIXjn05lIhtf/PbohQb+B4uogrwmkTIZnEM3eqBFmO7uQwECVG4dh1YEi3IgHNvDy1hIXnkj08zjkNsXCo6ZUj0/I/xRDoH/gU5x2Ger6r0kEqVH8e+33dsg5lweFSLQ2MyGaeyNL8wsdRuhe9bPOmtX/8a2Cgbd5eofX2bZfM5yOIRotmedBF+Lou3e6PHZG1CMXE3yJow8UtdBJgWFatL5V8RWLbEq4zJjq6CdfIWYoK/gqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3A28+HlL688hlxhfqbjfYn/48fB50bj6TueACkWz1VE=;
 b=gv2880IPilW0TagEJDpu/mVd4PmWIfpqbNp6jKzSPj3kxqtEBymX4AIurQ52BeSL11uJWqGXyl6ys3PL8MAwdRnYOiSoFxiLd0c7kXBoYIzqMSeRMvxmPEqU8SioCd4RcVKzrT8qPe40PC3naE6v81Vg9vH63tZZ/rjqFKulZ5WzLnQcDCZROL7wI00mK5Jrm37r9Vo4b1s0WD35DGben8PJO28qtZ4/Wrpa8cEvmyj5PMyzSrJxzpjPtB348WhCU6ebdCHHNxxqcz17nLdrcTfFZweaLdZ6x21yCfvrhYA5hKaGbfsIo3O9if1+SarCz2dtJBUi4wYVfKcfxoX6DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by IA1PR11MB7245.namprd11.prod.outlook.com (2603:10b6:208:42f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Thu, 9 Jan
 2025 02:17:35 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a%5]) with mapi id 15.20.8335.011; Thu, 9 Jan 2025
 02:17:34 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH] oe-pkgdata-util: avoid glibc-locale being mapped
 out by glibc packages
Thread-Topic: [OE-core][PATCH] oe-pkgdata-util: avoid glibc-locale being
 mapped out by glibc packages
Thread-Index: AQHbUferNn+U3hi8g0WcYgj5T0G1JbMM7GYAgADjJMA=
Date: Thu, 9 Jan 2025 02:17:34 +0000
Message-ID: 
 <PH0PR11MB5611F2E7A0B97861D193A60AED132@PH0PR11MB5611.namprd11.prod.outlook.com>
References: <20241219092319.3800319-1-Qi.Chen@windriver.com>
 <BF492DEF-AC1E-4E49-AAE7-3C3D7E9E142F@arm.com>
In-Reply-To: <BF492DEF-AC1E-4E49-AAE7-3C3D7E9E142F@arm.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5611:EE_|IA1PR11MB7245:EE_
x-ms-office365-filtering-correlation-id: 2f7b7411-d91d-48c1-f42d-08dd3053c7d1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?ZzZxbWlaT1pkb0JIa2pOUU5ad3huYkZUdU9wakZUanlQRlVFVld5MlpGQTBM?=
 =?utf-8?B?dElPMnJmd2NLUlFDMlZGT00rYjRsWTg1S3BmRmsxZzNnb1pDZnhjTzNnRnpq?=
 =?utf-8?B?SmpsaE5scWFqa2oyWlhYQU5td3RCaUIzQU5sYUkrWnE1NjNrVFl4QnVmNDE2?=
 =?utf-8?B?enhVUDNSU2Z2S0NaRWU1Rkk5U04wN2NsMFh1T0JJMTNhUWhHV3ZiQkZWRnVr?=
 =?utf-8?B?SlZOM0QvMXlJV3pHZWcySFRjSFRqTFlkTUV2TWhkNFBudVU2THRDREgyQUlK?=
 =?utf-8?B?eXF5WFoxWCtETnE1TFdDOVh5NTlmQkRNbUIzaGFoVTdVU3lOWFlIdzNYNkM2?=
 =?utf-8?B?S3o2WVY5QU1aVVkyaEg4VSt3VmlSWmRkM0UrajR4ZFVhcEVvZUFDQ3lYTmUr?=
 =?utf-8?B?MnpsSzdQTkNvcERlSEhJTWZrWEViOGtqMUJtUU9BZ29sbkhGbXZYSklFTC9k?=
 =?utf-8?B?RWxDV0hLV2JLeS9pZVJlMFdSVUJQOW1ka2I0YVNockpVU3N0ZWFnVWVOeW1q?=
 =?utf-8?B?RTJYQmF2SERmZlVpMnU4a21TajJ5OUdDZkJYOGlGZ0JQc1cySFhYd1VSM2JO?=
 =?utf-8?B?b3JBbWlEUytNbURZQkhOc3c3bEsySmdXVlNud2U0YWJLZmpCbVJ0eVNQMUw2?=
 =?utf-8?B?bnh1V042UkpkZ1hrcThDTy8zVVNsMlRKNDhOaWZZY1Y2dzl1a0FvM0dCdVds?=
 =?utf-8?B?L3BXQURqY0FSZnlOMGowcC9UbC9iaENzejlPK3ExcDFxc1ZMTTR2Q3VzdDlD?=
 =?utf-8?B?NGpQTUQ5ZTNZUERKeW12b1hGMjM0S3VwRTdKSjlxVDJnd1VodlQrb2JUeU0w?=
 =?utf-8?B?bjdjaEpuZ1Vua3lGNkw3alVscGZ3NWZsVjZlZHFtenhDbGtJM0lrRklQbDZ5?=
 =?utf-8?B?NlhPRFF0VnF2SnRZaDdDWis0R3IxYUZYVGtJUXVnMEV6cS9oLzlVVC90T2Uy?=
 =?utf-8?B?cjBxazNBSE9FZURFdkZCeFRwYnVpcFA5ZDlMdEtnOEtyM0lMZlc1MVdNTzk3?=
 =?utf-8?B?YTlxMlEwaXEyejF2QTk4TnJLOHdscithZ2NMVlNTVjhaaVRRc2xaeWhjR25N?=
 =?utf-8?B?OWdqcEhPWEF5ZUp4T1FkVFJRUndzcEF0Q2YrYUVIYUpmMFE1djByNFVqUi9x?=
 =?utf-8?B?WmU5Nk1vM0tVWnZ0aTlISW81U3haRDZMU1FGRnZVMG9JRGl3SWY0WTBuNTQ4?=
 =?utf-8?B?YXhRb1ZEWHVZT2FTWW12a0xxVXVXcTc4cEkvOUlZWk9jZC93dE9PMCtZV2JK?=
 =?utf-8?B?azdNWGlJeWdTYkxwZkh3TTNIUEZ5UllrQVRSanlHQ3ZXWXB2dDc3d2V2RlIw?=
 =?utf-8?B?d1lJZ1E0bW5icVJDQ1p4WjA4dTM1SndrdHVLVVBGVFpaS3hpWFVkRFYzTHhD?=
 =?utf-8?B?WmVubHp4UHlZV1d3N3ljSUFtQWFJNWlqOGl5R0Y5clZKcjIrUkdiUEJUemJI?=
 =?utf-8?B?ak1JUkt1WUduckVYV0hHRU5oZEdUZWkybTlkcDlyR0FhL1JFODkzend2ekJl?=
 =?utf-8?B?OE5LZnpydmRMcUJVT3prMFdGMFdlU2Z4NE95QWdkZlZGRnljU2xwWlZMVlFw?=
 =?utf-8?B?SkQ5N0FqL2VaMVpwOU5VRmFObWlzWXRjaTZNUlZMNWhUZ0E1Um40OHlMckxp?=
 =?utf-8?B?TC9rOFJPakVnZW01dldqb1gxQ1B0OHc1bnBvVWlSSXFHUHl0OG9aVkxQTW5U?=
 =?utf-8?B?a01sYXJ3Kzg0UHN6UnZHZXNoVHIxM21MQUhONW5IRmtGMFRhMlY1K3lRMWo5?=
 =?utf-8?B?dmd3c1UyVDhPQ1VqTDdBUEs5TThjdU9oS2c3ZTFTM1RkTk9xMjlCYjFmekVV?=
 =?utf-8?B?aEY4WmE0N1E4aytrWmpkZzJibEJvTUhFa1BENmhNQ3ZYZk1wY2Q4S0tuMERo?=
 =?utf-8?B?K2l1eGQ2YzZiUkxiSDhtMmMrNVhTeEVxQWZHM0l3aStsTTZFTFcvVFlnOS9x?=
 =?utf-8?Q?esU2VoqM0TUFSMPro5K73Xx6toY+pJRN?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?M1YzekNTVDRJL1NhbTcvY2RRNVJWbkM5T0syQ0hzeStWSHJ1MUlnTHgxU3Rl?=
 =?utf-8?B?dXd2Q3ZpRW5KU3pjK3FNall1eGVOaGV6dkw0MFBBSlJiNDdQcUhGd2dZUVJ4?=
 =?utf-8?B?N0tsKzhpaGtIdENuOXF5Z0JnZGx1ZkRpNzkzYWRGV3BtN3hyNjQwMFUwa2tt?=
 =?utf-8?B?WGhKejJxVW9obGkrOHJrTFVnVC90OHhGWXo1YXJqQjhxb1drN2tLUk5xSXlx?=
 =?utf-8?B?YmZiT1NyZlQ2K040V0tVMjIvYWcrS1FTY3l2MHRzVm5rNG4wZ3kxaDRSeFR1?=
 =?utf-8?B?eW5EQms5RHJ3THBnL3ZkODJUd2lLWVN4aVVIT3BrcTB1ZXZoUHpZRFF1UWQ0?=
 =?utf-8?B?U2NVWjBXdzBkcDZXdS85ZExRZEd6Mi81UWlkTytGRHdPdmVwazU0OU1ETTVP?=
 =?utf-8?B?VG40Nk9jQ1BIbzRqUUJBQTRteEcrcGRwVW10SzY2Y1JaTE9meVZoLzc4cFJo?=
 =?utf-8?B?bHdUUm5Jbm85Q1BaaGx0cXYyaFdETytOQlFRUzhqQm5maTlDWERLQzRvNmxs?=
 =?utf-8?B?YlRRaElRejk3QnZiMFoyZEg1UFFBaG5VZVQrUndKRUZzeHJ1YXh6NTBtRFFJ?=
 =?utf-8?B?U0djaW42OCtEZUJuNVRROC8zVlZYT2g4QjdVVnlHK3dSWVVhd2xPME96Zmtk?=
 =?utf-8?B?SVBGTWFGVFFYYUkwUTlRVUk1cDBhM1pFZGQvTi9jL3RoVGxiQkN6NTU0aWg5?=
 =?utf-8?B?QWJVc3hsWnh5V1U3UlhTek9FdnR4Q0VDQlhTbWszWStMZmVmeTdVczdNLytv?=
 =?utf-8?B?YUZwdGRwV2xEWG5OSDJSQU4rZnNFWHpmVmcvZzNJcEJHZGtlSWpmUFY0cGpt?=
 =?utf-8?B?ZTNXelREYjhxcDNxYTlVOW45bDRUdFVxcWVMSGt4SjJaK3VoWEViN0dYWHJR?=
 =?utf-8?B?SDhZUyt1OXhrNGZVNkc0bjFac0pMZm9FaW5rSVk3OW9xZk5tNmpIUXczWTdS?=
 =?utf-8?B?RFI3MnNPWXJjRlJhYWgvQ3dTMzNZZ1Fpb3N6aEU4R3p0UzgvS1UxUGZKYjh3?=
 =?utf-8?B?ZVF4K04rVmd6TDJEbVltUk96T3R3Q2ZIV0s0dzBOQXViQ29LRGY3NDRIV1Vo?=
 =?utf-8?B?YmlJeFVncHozcm5oRXA3dkJncEw3ZUNaMUluSmJRVVhkZVM3MCs5eTdqWGF3?=
 =?utf-8?B?d1ZlS2RSYzV3Q3N1Q3Rrb0t3Rmc4bnZKZVNxNDBWSTBjTHhlZHBLbXRQelI1?=
 =?utf-8?B?WE83dXVPTVZLeFhwRzRvdWxtMmYzZUlFMXhidG5Gc2sxTU5mSU8wQmloSEZ0?=
 =?utf-8?B?QlROSUI5alVVZkZxcDFLNVRLUkNjZ3NrcThXUlZRWVdaaFBUT0R5Nm5uUjhk?=
 =?utf-8?B?aTZDSG1pa3NoaGVkY0Yxd3dESmJLME9tWTFDdlNCRUp4Q1BaRzB5dlpZRjdM?=
 =?utf-8?B?U21henlCaTVyWFp3Q2htSTFKT0FPTmNmbkxraURoWXoxZHlWSytjekVBQkhL?=
 =?utf-8?B?VHZSUHpjdlhxeEh0Tm1DcEw5MWwyTkk1VjJheWZkQWI0VTAwK012Q2MwVWFk?=
 =?utf-8?B?YlhIMHE4blJYY1hlZStpN2kvdUNZWlR2REIzc0IrMkgvRWwrSGVUdjJEaG5P?=
 =?utf-8?B?Z25QenZQS3pCUXZCdkR1ZCt1cVJyR2c4V1FBajdacVA0b2lIYnVveEVHYnRU?=
 =?utf-8?B?UmRjNHZlTlJCbWZGdjdlR3E3UVZhZGVqTmpWcDVPa29VT1pNZE0xUjlJelA2?=
 =?utf-8?B?Vm1kMjg2OVNUNVBnR2dQV2tQMXFWeGZEOEw2UWswZW8wYzk1dTRpb2QwWDdz?=
 =?utf-8?B?T1h0dyszdFhzKzdUSWluQStuZEFiMU9ocDNKQkpISjlUUTVIQm5GUnZJampN?=
 =?utf-8?B?dmJ5RHJad0M5ZjlpbnFZcmdjamZwaFVFWTRuM2RPdDltMXVBT3BMVGhmNnp4?=
 =?utf-8?B?UWtKeWtMUElhSjF6M1Vac0JtUWh5dnhzYjBvaG9uYnBGV3MzY1VMbnM3bkt1?=
 =?utf-8?B?amFwR3FoWk5vazZIc2J5RVMrelBPcXBWckV2bFZTaGhZSlJhbnNTaW9Fd0Yr?=
 =?utf-8?B?d25vWWVGWktWbjJDQ3Q5R3J5S1VkbUkzOTFPWVM4bnhMNkZKMDZoNDhUaTZz?=
 =?utf-8?B?elBZakJ2am1rTHRQdUZkZGNZMlY3UzdsYzlkRTNmckdZUjlhRjdmeDNUd3d6?=
 =?utf-8?Q?EsGCzrdk9aJ+PR6CknZXtHAW+?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f7b7411-d91d-48c1-f42d-08dd3053c7d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2025 02:17:34.8748
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Us7tp1lcCbpF29EWsvtCtUsabIoybgM4aOiWqIhAJc/JzMRRU6RnYTcBxP2EP70iAana3mPOczMpjxryaVygFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7245
X-Authority-Analysis: v=2.4 cv=XZxzzJ55 c=1 sm=1 tr=0 ts=677f31d2 cx=c_pps a=tpf30LWoD3GURU9dwhXxZQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10
 a=7CQSdrXTAAAA:8 a=t7CeM3EgAAAA:8 a=Q4-j1AaZAAAA:8 a=Jj6vURhFB8wibWIyhkEA:9 a=QEXdDO2ut3YA:10 a=a-qgeE7W1pNrGK8U0ZQC:22 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: VZdW-OuoJocTC8bAktJcFv3XUBB5QyWT
X-Proofpoint-GUID: EXSrd7BUvzyDM9iBkuUhnyeiHnE5zpBC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-08_08,2025-01-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 spamscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501090016
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jan 2025 02:17:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209611

SGkgUm9zcywNCg0KVGhlIHByb2JsZW0gaXMgdGhhdCB1bmxpa2Ugb3RoZXIgcGFja2FnZXMsIGds
aWJjLWxvY2FsZSBhbmQgZ2xpYmMgYXJlIHR3byByZWNpcGVzLCBhbmQgZ2xpYmMtbG9jYWxlIGlz
IHNwZWNpYWxseSBoYW5kbGVkIHZpYSBJTUFHRV9MSU5HVUFTLg0KDQpSZWdhcmRpbmcgdGhpcyBn
bGliYy1sb2NhbGUgaXNzdWUsIHRoZSByb290ZnMgZ2VuZXJhdGlvbiBsb2dpYyBpcyBjb3JyZWN0
LiBVc2UgdGhlIGNhc2UgSSBtZW50aW9uZWQgaW4gY29tbWl0IG1lc3NhZ2UgYXMgYW4gZXhhbXBs
ZSwgbGliMzItZ2xpYmMtbG9jYWxlIHNob3VsZCBub3QgYmUgaW5zdGFsbGVkLiBUaGUgcm9vdGZz
IGxvZ2ljIGVuc3VyZXMgdGhhdCBhbmQgaXMgY29ycmVjdC4gU28gbWF5YmUgdGhlIGdsb2IgY29t
bWFuZCdzIGxvZ2ljIGlzIGNvcnJlY3QgYWNjb3JkaW5nIHRvIGl0cyBvcmlnaW5hbCBkZXNpZ24s
IGJ1dCBpdCBuZWVkcyB0byBiZSBhZGp1c3RlZCBhIGxpdHRsZSBiaXQgdG8gZml0IHRoZSByb290
ZnMgZ2VuZXJhdGlvbi4gR2xpYmMtbG9jYWxlIGlzIHRoZSBzcGVjaWFsIGNhc2UgdG8gaGFuZGxl
Lg0KDQpJJ20gbm90IHN1cmUgaWYgdXNlcnMgd2lsbCB1c2UgdGhpcyBnbG9iIGNvbW1hbmQgbWFu
dWFsbHksIGJlY2F1c2UgdGhleSdsbCBoYXZlIHRvIGZpcnN0IGNvbnN0cnVjdCBhIGZpbGUgdG8g
c2VydmUgYXMgYW4gaW5wdXQuIEFuZCB0aGF0IGZpbGUgaXMgZXhwZWN0ZWQgdG8gY29udGFpbiBh
Y3R1YWwgcGFja2FnZSBuYW1lcy4gSWYgdGhleSBkb24ndCBoYXZlIHNvbWUgc2NyaXB0IHRvIGRv
IHRoYXQsIHRoZXknbGwgbmVlZCB0byBsb29rIGF0IHRoZSBkZXBsb3kvcnBtIGRpcmVjdG9yeSB0
byBjb25zdHJ1Y3QgdGhlIGlucHV0IGZpbGUgY29ycmVjdGx5Lg0KDQpJJ20gT0sgd2l0aCBhbnkg
YWx0ZXJuYXRpdmUgc29sdXRpb24uIA0KDQpSZWdhcmRzLA0KUWkNCg0KLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCkZyb206IFJvc3MgQnVydG9uIDxSb3NzLkJ1cnRvbkBhcm0uY29tPiANClNl
bnQ6IFdlZG5lc2RheSwgSmFudWFyeSA4LCAyMDI1IDg6MjQgUE0NClRvOiBDaGVuLCBRaSA8UWku
Q2hlbkB3aW5kcml2ZXIuY29tPg0KQ2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcNClN1YmplY3Q6IFJlOiBbT0UtY29yZV1bUEFUQ0hdIG9lLXBrZ2RhdGEtdXRpbDog
YXZvaWQgZ2xpYmMtbG9jYWxlIGJlaW5nIG1hcHBlZCBvdXQgYnkgZ2xpYmMgcGFja2FnZXMNCg0K
T24gMTkgRGVjIDIwMjQsIGF0IDA5OjIzLCBDaGVuIFFpIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnIDxRaS5DaGVuPXdpbmRyaXZlci5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6
DQo+IA0KPiBGcm9tOiBDaGVuIFFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+DQo+IA0KPiBvZS1w
a2dkYXRhLXV0aWwncyBnbG9iIGNvbW1hbmQgd2lsbCBvdXRwdXQgZGlmZmVyZW50IHJlc3VsdHMg
ZGVwZW5kaW5nIA0KPiBvbiB3aGV0aGVyIGdsaWJjLWxvY2FsZSBpcyBidWlsdCBvciBub3QuIFRo
aXMgaW4gdHVybiByZXN1bHRzIGluIA0KPiBkb19yb290ZnMgZXJyb3Igd2hlbiBtdWx0aWxpYiBp
cyBlbmFibGVkLg0KDQpUaGUgZ2xvYiBjb21tYW5kIGlzIGdlbmVyaWNhbGx5IHVzZWZ1bCBhbmQg
bm90IGFuIGltcGxlbWVudGF0aW9uIGRldGFpbCBvZiB0aGUgcm9vdGZzIGdlbmVyYXRpb24sIHNv
IGl0IHNob3VsZG7igJl0IGJlIGZpbHRlcmluZyB0aGUgbGlzdCBvZiBwYWNrYWdlcy4gIEnigJlk
IGFic29sdXRlbHkgZXhwZWN0IHRoZSBvdXRwdXQgdG8gY2hhbmdlIGRlcGVuZGluZyBvbiB3aGF0
IHBhY2thZ2VzIHdlcmUgYnVpbHQsIGFuZCBpZiB0aGlzIGlzIGJyZWFraW5nIHJvb3RmcyBnZW5l
cmF0aW9uIHRoZW4gdGhlIHJvb3RmcyBnZW5lcmF0aW9uIGxvZ2ljIG5lZWRzIHRvIGhhbmRsZSB0
aGlzIGNhc2UuDQoNClJvc3MgDQo=

