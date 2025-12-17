Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0363BD65559
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 13:01:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14351.1765976486195854582
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 05:01:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=fPO+X5j2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=444662dbf6=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH98Ctq2856112
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 13:01:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=gR/qqb/cHlgnKkzD1IE4BlI/9BFYRBGb1ixEA3yqcd0=; b=
	fPO+X5j2VBGX3bObWa9sO1xXzUXQOMhhrjdumJMDJyibK59XVZKSRFdnIyJndsdz
	7eSqD/c+l4vKzrij/VjKq8MKaIHXKAOKgS9US0Cp+Z0lT70SOg8ELX6s6CsT4clO
	OCGfz+/ka2GLIaAyav9M/18xCX6BMaKTnvMlGb/9YSVoL7LCleMGMo96EFhJMaxz
	S3INid6nw9LI2tXrfpLP3h7v7Ox6F5wKsGiBIM8kppyJNXhsKlOMRDugMWpN88p5
	rXxcgcx8PDNJFy+9rCqC5ZBHMBxhS1ystRPXw0GYfSvzcEhElsawnVi4vGnPYtYY
	19LRu1TyrlERgj6if1lrIg==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011044.outbound.protection.outlook.com [52.101.62.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b3k0brjpe-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 17 Dec 2025 13:01:24 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S6mpBHJvddokNDrTDVyznAcU1e6uHLVDzVbyXUKtluEYbV4iZL2VaY6E1XIA1Q2tB316y7/e6XqBXLpzard7vNphERtyrgSIAGN/z3tZJ+RPoGKXaYdhUwvHoRJj0/LCDhnb88GdhyqWyZym0nQ240KYTMoeoyB8ldF9S2xLrvg02IES3DKDOZqviJI/vKV48OVMTCQogm5AtK6IYhJzYZFv3RwWGSlAzhyK1G5UE2XR3WO2ZPowBz8lptF/LAjOBzKEvEI8Tex9bL9moE1fFNObLDEftRKeOktCG6ajuI6V1JCb1/eSPMjYEaLHJzeWvc4IUEt7PF0GGycWF9I6AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gR/qqb/cHlgnKkzD1IE4BlI/9BFYRBGb1ixEA3yqcd0=;
 b=O32WGA5DXBKSfstLxVreo11NeSc/YVo011Tlx4Ks3Z4rVHovMD9sTaoP5i7+hGkOn8EpAlvLgsFqIz7BM5AS4sJ2yE2/TnLALzKDCfd/5L4ZPW0LR88vkubqhXG/39hWa91B8liETgqBwOilbVZQ48GKwiIyXTOflepcwKz2+FJKThEgKDAZlwmMGXHZLj3QAzuTohNjBqeiMKci4bjhAe2VqZZN+BC8ydN5zS2eJAj+9Vz1mL4BItZYMkn88jZjWDylBZ9zDxjsLvG32g3KBJ75r/FyRdiWgXXnCnC0Yf1Dsh2pQWkb67elOOJp0Im0iqbdEueOnK8qhdnuNQnI7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by IA0PR11MB7862.namprd11.prod.outlook.com (2603:10b6:208:3dc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 13:01:20 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 13:01:20 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH V2] insane.bbclass: avoid unnecessary rerun of
 do_patch
Thread-Topic: [OE-core][PATCH V2] insane.bbclass: avoid unnecessary rerun of
 do_patch
Thread-Index: AQHcbzo8YYdvuXiO9kud+BpBZOattbUlqriAgAAhOmA=
Date: Wed, 17 Dec 2025 13:01:20 +0000
Message-ID: 
 <CO6PR11MB5602BADFA4CF17BD81F28539EDABA@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20251217094747.3217558-1-Qi.Chen@windriver.com>
 <CANNYZj8zzUB-Q7LyhsD=MaCZPc7BYhb2cEbYDciOCxz8UaGidQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8zzUB-Q7LyhsD=MaCZPc7BYhb2cEbYDciOCxz8UaGidQ@mail.gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ActionId=5ec85a76-9806-40c5-92d5-76dd0ba58bb3;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=0;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=true;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2025-12-17T13:01:04Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Tag=10,
 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|IA0PR11MB7862:EE_
x-ms-office365-filtering-correlation-id: d1f0b6d5-c445-480d-5656-08de3d6c5fb7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?NU8yZ2Z1aytEMGdYNi9IbDFQTVFzVm1DcU1JZ3J2aE9jemVzU090Vkpzd3ha?=
 =?utf-8?B?Uko5bGZ6VkcxWm5CdFFhOGNLRjVKeWlQV3ZpbEFXSHNxVE96VDIxeUwrbHZO?=
 =?utf-8?B?K1N0QWxVNTFybFgzdmJwZ3c3Mm92Q1FITWs1R09Ed0MvWGNFNi9ZSEZLTVhG?=
 =?utf-8?B?TS95WFg5UnVPQ3lQR09ZY0ZLZEw4NDlyR2Z0dlZRZWR3WjdETG5hRTZQZkVh?=
 =?utf-8?B?bVo3ZDV0OTFWV29keER1UHpnVU9ZQ1FUWnhtaW9kSkx6SWNGeXdvaC9HMGlE?=
 =?utf-8?B?OEtCRUtNYmdiWTRhNlRudnVIRnFveFYydjZxRGF5UDJwOXI2NktFKzJ4TUMy?=
 =?utf-8?B?RXMyL1FudVhjbWJKWlU2OFNtZ2p2NFhhNHR0RHY1VGJHbXY0SGpPd2UzUjN0?=
 =?utf-8?B?c0ZmYUVCWFBvL1lVazZoTXVLVlgwWTlIZWg3alRUTC9sWHdhamtLR1dHcU5t?=
 =?utf-8?B?eUphNmw2azRLM1I1WlJaMTJUcW96eTE5Zms2ZHpCWTFqMWMyRjdVWjhnTW1D?=
 =?utf-8?B?M3ExMHJuMnBHRzlGb01WUW5qZDdGenpYU1lVQTRnaTB2SjlwQ1VRTUJYczcw?=
 =?utf-8?B?b1ozditRMXhRYWV3SWJuWmp1UWwxcW8rRkppNEFYbWY0dnJQSGNGVUVjZUxM?=
 =?utf-8?B?NzBNaXZmcnFCNXlzS2RNTFkyTGM0TnFiN2Z0b1lMaDFzdEZyMWNDbE9pZmE1?=
 =?utf-8?B?bnVHQUNvd3hJYjEzSGI1YzlaSWREWlU2U0FiU3pvYXJMZDcwZE02REplYUhV?=
 =?utf-8?B?YXJtdURUdjlCY09DWlVMbUdKd1Baa2IwL1dBbmhzWi9DVFR3ZTVwNFQxb2pX?=
 =?utf-8?B?YWd2VFJtREtqekxpbHJ1aytnTHpmeEJLSmY1RHFncis3YzloNGNoQ1pJYkV3?=
 =?utf-8?B?ODJSdGlXcHlBMnN1UHQ4dCtmWlVWTy9Sb0c0cnluQzRKQVlOSFhNTm9IZkkw?=
 =?utf-8?B?WnpVclE0R1Y3VFdBVVo3Qy9BWXRuNG9mbFVZQkZMZmJJcGRnZWsvdzBTSE8x?=
 =?utf-8?B?NktlR2hIUjlBTENBZkNaelNxaWhQMXFnUWk2dXJ6NnV2bXo5c04xdDF6ekZX?=
 =?utf-8?B?MGEyRlZKQ041dWhqSFdjdTVWVHFiNjhJNEM2RG1xYzRlblVFMWd4MGE0Skt3?=
 =?utf-8?B?R2tkWWpNakpHZUZTVFpBT1dkTlNvbWNKRFBaazREaWo1T29lTjhtbXFYVVJo?=
 =?utf-8?B?NjQyMjRlazdlTE1xZnpGRGUySHZweU5CampzY1U4TTMwV2RWNkJBZ3c2cjFk?=
 =?utf-8?B?dnJFWTlDbEs2dUlXMkJLd1FjTnhnYk5hV2RSNVZUcDlRakxRTGVYdFFRbWZM?=
 =?utf-8?B?Q1p4Uk1pczR3YnBtYjZ0a0dvcnp1VG9TcXhrTTM5M1VyZkZaL2o0YzIxa1p5?=
 =?utf-8?B?TCsrem1lWFRFUTFlNTZCbHBKTmZlTGtmV2xrZnZNUGxMby9YN0Y1NmFyRzZm?=
 =?utf-8?B?VzZOMnlHZmNJZ2E4VmpqMHVJVDVUWFlhcXNvZmd1OW1HMWE2N1NpNWJqeDlq?=
 =?utf-8?B?WGpwK3Jtb09aRUdHeGRlQXNIVSsrUXEyUGZsdnhGQzdkczM5VC9rOC9TOXg4?=
 =?utf-8?B?UitsVzhvYnNQdWZkNHFPNUw0cURKKzIyWXJTNTEwa0RlQWFBQWJqR3VNL25H?=
 =?utf-8?B?QUVydUtVcURFQUVOOU1tNjdXUDdMbGxBaTFBcUp6dHBVTjNJQjA5RVY1U1V0?=
 =?utf-8?B?dGZHTi9tRVZaSGFFa1pHSmFuZ1RwZmdXOGZVb0w5QVdUSFQ3NHpxbFUwM3FU?=
 =?utf-8?B?UTVGaERiOG8vRENqZFR0M2tUYzlZUjNxUTIyOEE0QW1jWVFxclBqRnlMRUV5?=
 =?utf-8?B?dThOVXhVTTQ4RS9iTUpCUEwzWGRpRW02N2JVSjg1ZWxvcVBPT1lJeEZQMnZ3?=
 =?utf-8?B?S0kyRWJTVXlhMFdrZXV4a1lwUjdKQ0pwSG5SOWJCQ1VZL3g5K3h6NnZCQkhk?=
 =?utf-8?B?UmYxdWhDNUhETzlyNWZDM1l6R2gwTlBBN1M3TGFnWHhVY1lta0o1MzF0NU1E?=
 =?utf-8?B?UlM4ZGt1djZHaC96N25CNXJpTENyVGJzZ3V3UWtiMDQ2dnZiSTVXaEQ4RWxI?=
 =?utf-8?Q?EJmmeQ?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VWhlVysvRnBISUpyY25kVDJWRWU2dlFqVnhMKzh2LzkvUnNRdXNtZE9zNVM0?=
 =?utf-8?B?RVk5aUpaZFRtbEJ1Ri85N25mVnJaRFppZ1dLV2FuT2ZBdHduWXpSOUxzQ3Ft?=
 =?utf-8?B?WUdWRjJITXBHbnpQSCtWR0tSaXlLaUJCaDBjNjRCMmxiQkNjZms4SjNVS1RG?=
 =?utf-8?B?UWJIUkUweU1aQnpsUFZyVHIyaFpjcGY3NUVGU3JLZUZiNkx5cjU1dnlBM0Iy?=
 =?utf-8?B?YXhhMStRTVhCTWNEVy9BUGFaR2lZeUliQXduRzQzVnErRDZGaFNUenZsMUh2?=
 =?utf-8?B?bkNncERsT1hlMXI3VXJTazNZMjZpaTcrTTBZZnpabkExM05Wa0x2a1NMam5W?=
 =?utf-8?B?VFRSNE42VFNCaFp6K2R6eTFzOXFNcHc3NlJlcjlRQzlaZzNXR09pNWdjOHZ1?=
 =?utf-8?B?REtDK3IrZFVPRGF2MkY4bmIzMVFSd2dEa1BVN3k0RVk1NHE0OU9peCtmQk4y?=
 =?utf-8?B?RmpZVlgrQjY2YmkyUmtjMGFwMzRIbGxxNit0TXFPOU1OVVlrVlA5eEFTNURE?=
 =?utf-8?B?Q2xsdzJpSWJhZzd0bVNMeXBFTmVoVnNITDF3VzVqWTdUYWo2LzJ3bkp2WjBi?=
 =?utf-8?B?SzR6M3BFdU5EaE9xKzN0YTJPSmxRdFMvUVVRdGVPWEV0aXIzdFJackdDM3NZ?=
 =?utf-8?B?NklUNlBqREtGRk5iV1BDM2lVbHBwNjAycjA1SlJ1bmdkZnd3aDZkejB2TGJ1?=
 =?utf-8?B?Y2pwVG9LYy91R0tadENiT0o2VW9zMWUxdDNRWDkwYW91NzlZLzRBTXVIMTdS?=
 =?utf-8?B?MDAwZUxsL2cyZEFwZzJBVGIxZnRJZ0ZmTy9XSS9UTjRCRW9GbVlKVmE4MEpI?=
 =?utf-8?B?TUNlUkVXdExzZ2hieFpYdXRFNmhSbURGVU05YjVIZjJPUDBVYkR4dHlIVm83?=
 =?utf-8?B?Q2dqT2xnT2ozV3hmdHd4Z1VrL0lrSVRHN1hlRnhEREJhdllJbFdkQVcxUFZD?=
 =?utf-8?B?SGtyeW1Cak9qOFB6aW5GR3Z5eVJ1a1p3UnRXUE0vWnFiNkFTbFo0bWlMMmhG?=
 =?utf-8?B?YXB0THNuRnNRK1JqVkpZSlJkWlVhTktuRy9jVzNUV1hFNUYxa1dRMHRzMUk3?=
 =?utf-8?B?NzUyZUNIUVpad3YwdHNpdXBXVG50dmpvMHo1L3dSc0tBM0VxbWZrZXY4Y01W?=
 =?utf-8?B?YUdQTWFrdUxramZPbTJUZFlrcG9iemdnb3FQUVA2amVKQUZ3RXhrN2M3QkF5?=
 =?utf-8?B?aE1ORHYza2I3Sk84djB0S1BDSXVSdlJjT0Y5NE1raXNDR3hvV2ppd2QvM1hu?=
 =?utf-8?B?b1dMWHdDdUZYaGU3OFFOQmw5dU1LdmhmYWJOVkdrZzZoQ2lyQVZ4NGJ1dG9n?=
 =?utf-8?B?RitML2I4SzZhNzNEZEthVGJKSkYwOUQvWXdoZTNIUG1uTEc0SXdxekdBc3U2?=
 =?utf-8?B?aE9meEhhM1BrZ1E2aEZOTFFDY21iTnVxMlVpSVEwTzhOT1RhV05vL1M1bWE2?=
 =?utf-8?B?ZlNvU2ZOTktIU3kvbDUzdFNrN3BXWFRwOENmQlVOYWFSVlNra3g5cW5uYXlE?=
 =?utf-8?B?UzJGQWpFQ3BSWWFPSWw3N0pUQ0szRWhIWjIyNDV0SFB4SmZNL0lhL0RjNm9E?=
 =?utf-8?B?c2FyaTFNQlFIOGNVU3A0bENXUmtsTlRYZEN0RXdINERGYjRiN0ZKZTRld21F?=
 =?utf-8?B?eWlWcFlka1hvNFFWMEtJemUxWUdpeGtpS0Fvc3ZUSHhzd1M5eFNZUGNHcVVr?=
 =?utf-8?B?YUUvNkl4d1hscGVRcVdVYS9maG1tWGRWUXhWNERZNDloSHczQUFhOXZXMk9B?=
 =?utf-8?B?ZVhPNWtoRkg1Yi9JM1poL0hHWmx1Z09PdFBvbFp3SnYrOFJyTFRLZmwvNWt2?=
 =?utf-8?B?R09QM3QyejU2SWVWRHozVm1GVy9wblNFUkdiTit2enFLQlBNYVRqNGhoRzNu?=
 =?utf-8?B?Wjh6ajFYTEpqMGg2aEU0NEVZbFUxVDB4SUVXWEhZM1BEZmhDSHozekxBQzNa?=
 =?utf-8?B?Yy9wcjJCZDU1T1JLakt0T3BYRkdHd3Y0TXhkS0oxWnFmdFpLdWZETlN6cm9Z?=
 =?utf-8?B?WGx2RiszU3VoTGVFNk4xUDNBcmUxZ0lvTmR5TkRvQnZyUHZCZlRYK1lrekpG?=
 =?utf-8?B?QlA3S0FtdUg1U0QyUjdweDBhSEtDaE9jRXRGZWV2MmZyaW1NMkNjaVV3Z0dH?=
 =?utf-8?B?cVZjY09wajBGd0ZRNnNUNnRoTkF2UytacEJzNW8xbW5oTjh0NXQ5cWYvYUxY?=
 =?utf-8?Q?bh4bRbZkHCVED1Iiy8oOjcrLzIRtU84/XJB47YxUP8Th?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1f0b6d5-c445-480d-5656-08de3d6c5fb7
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2025 13:01:20.4114
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e8cqQnYEAqHOgcSr77YFv/m3ti5hIa4u97SWbCUNp6Iqw/c5LjvRV/J2nfIf2dGG4bFtnVJcbHA+0JBA9sWfPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7862
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEwMCBTYWx0ZWRfX9EpZjnhnsz2Q
 jrZH1LgMZeTzDxrRf4eKrQf5W8/XuLh2nXPrefiU70hY6S36hOhwwt8Kq6m6vdOIKblSOz85tPu
 WWON1mMOkua+Z6BrOJkKecFBimobaU2xx8HBVNS9BsdhpdMJZJeLmUWiRGwOS3K5l2SEvW7TgGD
 I1reMoWZBRPrABK+xfq18a0Dn/gVmI/H+ZSxQ9Cy+08AMFGlJGAkQcePaBfTC/pZlB8rfghMdD5
 X23S7HmMg+qbmF2C3abZ4Ir7+NuXf5Ohgn0UifRtmydRiZAX05WmWXESYwIi+r/1N+XhYd2+JZI
 1tJJKI9v2KUF+rt5bnyadyZ292LXZhW0pTcNWOS27DGR3/DBtbrrnyzoxXDvvSbwP1BYwzamdX1
 AkICaY7/7rb+s5AfdVPyHP93BUCX+Q==
X-Proofpoint-ORIG-GUID: o6y6_I3lBn3fEN5yTvTvMje-A4nIPR6O
X-Proofpoint-GUID: sC4yITQ5SOsUGr6TMWd3UWSeobR-4JaS
X-Authority-Analysis: v=2.4 cv=C+HkCAP+ c=1 sm=1 tr=0 ts=6942a9a5 cx=c_pps
 a=Z1Yvi+W4mc/VVWckEa0YUw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8
 a=Q4-j1AaZAAAA:8 a=AnihJmds2KsieQDtY8AA:9 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 suspectscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512170100
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 13:01:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228038

SSBhZ3JlZS4gSSdsbCBzZW5kIG91dCBWMy4NCg0KUmVnYXJkcywNClFpDQoNCi0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdt
YWlsLmNvbT4gDQpTZW50OiBXZWRuZXNkYXksIERlY2VtYmVyIDE3LCAyMDI1IDc6MDIgUE0NClRv
OiBDaGVuLCBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29tPg0KQ2M6IG9wZW5lbWJlZGRlZC1jb3Jl
QGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNClN1YmplY3Q6IFJlOiBbT0UtY29yZV1bUEFUQ0ggVjJd
IGluc2FuZS5iYmNsYXNzOiBhdm9pZCB1bm5lY2Vzc2FyeSByZXJ1biBvZiBkb19wYXRjaA0KDQpP
biBXZWQsIDE3IERlYyAyMDI1IGF0IDEwOjQ4LCBDaGVuIFFpIHZpYSBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnIDxRaS5DaGVuPXdpbmRyaXZlci5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3Jv
dGU6DQo+IFdoZW4gdG9nZ2xpbmcgcHRlc3QgZm9yIERJU1RST19GRUFUVVJFUywgdGhlIGRvX3Bh
dGNoIGZ1bmN0aW9uIGdldHMgDQo+IHJlcnVuLg0KPg0KPiBUaGUgZGVwZW5kZW5jeSBjaGFpbiBp
czoNCj4gZG9fcGF0Y2ggLT4gZG9fcWFfcGF0Y2ggLT4gRElTVFJPX0ZFQVRVUkVTe3B0ZXN0fQ0K
Pg0KPiBTdWNoIHJlcnVuIGlzIG5vdCBuZWNlc3NhcnkuIEFuZCBpdCdzIGtpbmQgb2YgYW5ub3lp
bmcgYmVjYXVzZSANCj4gZXZlcnl0aGluZyBnZXRzIHJlYnVpbHQsIGluY2x1ZGluZyBjcm9zcyB0
b29sY2hhaW4gYW5kIHJlY2lwZXMgbm90IHVzaW5nIHB0ZXN0Lg0KPg0KPiBUaGUgRVJST1JfUUEg
YW5kIFdBUk5fUUEgc2hvdWxkIGJlIGVub3VnaCB0byB0cmlnZ2VyIHRoZSByZS1ydW4gaWYgDQo+
IHVuaW1wbGVtZW50ZWQtcHRlc3QgaXMgYWRkZWQgdG8gb25lIG9mIHRoZW0uDQouLi4NCj4gK2Rv
X3FhX3BhdGNoW3ZhcmRlcHNleGNsdWRlXSA9ICJESVNUUk9fRkVBVFVSRVMiDQoNClRoZSBvZmZl
bmRpbmcgY29kZSBpcyB0aGlzOg0KDQogICAgaWYgbm90IGJiLnV0aWxzLmNvbnRhaW5zKCdESVNU
Uk9fRkVBVFVSRVMnLCAncHRlc3QnLCBUcnVlLCBGYWxzZSwgZCk6DQogICAgICAgIHBhc3MNCiAg
ICBlbGlmDQooZ2lnYW50aWMgbGlzdCBvZiBlbGlmIGNoZWNrcyBmb2xsb3dzKQ0KDQpJIHdvbmRl
ciBpZiB3ZSBzaG91bGQgcmF0aGVyIGRyb3AgdGhpcyBmaXJzdCBjaGVjayBmb3IgRElTVFJPX0ZF
QVRVUkVTIGluc3RlYWQuIFRoZXNlIGFyZSByZWNpcGUtbGV2ZWwgY2hlY2tzLCBhbmQgdGhlIGlz
c3VlcyByZXBvcnRlZCBhcmUgdmFsaWQgcmVnYXJkbGVzcyBvZiB3aGV0aGVyIHB0ZXN0IGlzIGlu
IHNvbWVvbmUncyBESVNUUk9fRkVBVFVSRVMgb3Igbm90Lg0KDQpVc2luZyB2YXJkZXBzZXhjbHVk
ZSBpcyBwcm9ibGVtYXRpYyBiZWNhdXNlIGRvX3FhX3BhdGNoIG1heSBoYXZlIG90aGVyIHVzZXMg
b2YgRElTVFJPX0ZFQVRVUkVTIGluIHRoZSBmdXR1cmUsIGFuZCB0aGUgc2FtZSByZWFzb25pbmcg
bWF5IG5vdCBhcHBseSB0byB0aGVtLg0KDQpBbGV4DQo=

