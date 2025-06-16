Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F8F1C7115E
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 12:18:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.28963.1750076330036125399
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 05:18:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=826277e072=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55GAe9Wv023842
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 12:18:49 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02on2060.outbound.protection.outlook.com [40.107.96.60])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4790281s6u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 12:18:48 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qUciNdm5/3U9TdN5dQrc/xTGUJxPwfuuOmAA0L+ljTpfLUKt9sMNkPeOJ6JVeGpP+MIs4GTxgaC0//dqkBIXb6Qb3Q5I7JPWG/lqe38ac4yDnTTMtTgalRYC7j14FdYql+KgBY1Hp33u+kNfOQctwH4Vt3Ay7PFb/Pp31G7FJr10K7r5HVcYQBBxFYj6Vie/xFDNpAnaqpza6PmGtcvV4bg1Fy8AfhyMSposcYkizkYcilh4oAHMf7ojRdD9YWzcaVeRliEBCmHRaynpNocy9Zo9TZNAPiXP4kxcTHHe7QLKgJGHogXSHs4/nT2ZkFNgD5ikxezOKN/t1su/tZTiOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zb+FdBwXY2zo4YVj4s9PyXr7n+1jKqFnK5yeFZRB+JI=;
 b=mFWG1uvWTlxzmQRLeAt6FTXif66xWW8xKLThxCy9xjD+rf9Tf60uzBa3aAPVpC6RLLJjgqrAWoXgGxwlS/G+ljxduSE019X74/kH+qnOFHAO4zOgpyDgkwUk/3YQ12y+layZETPXvBsKKpQzk/d8Wle/y2AK11iazV3oCrjEkd6GM4mUstPJ6p4mLF1GufZZ+8awjS7I1TjwLVdEYAWAb3FdthaWoMLgz6QDGx8/3gYtjpvfwG9ro4bVamE/2eRnhY/eT3wZqw/a3CDb7hPKS3dlD3I8e2uZVSxbR0BwfeKyA8Fqgn/NpMv2mo5edAjiVYmhvPMguXknM5YROT3dmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by DM4PR11MB7301.namprd11.prod.outlook.com (2603:10b6:8:10a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.27; Mon, 16 Jun
 2025 12:18:45 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%3]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 12:18:45 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [scarthgap][PATCH] gcc: Upgrade to GCC 13.4
Date: Mon, 16 Jun 2025 05:18:21 -0700
Message-ID: <20250616121821.347717-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: CH0PR08CA0013.namprd08.prod.outlook.com
 (2603:10b6:610:33::18) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|DM4PR11MB7301:EE_
X-MS-Office365-Filtering-Correlation-Id: 5aab3de2-5bda-4788-2b83-08ddaccff07f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?V1FSUFZRZFpGeEVBMEQvV2FjcFArOGExTFJlaEdZS05ZbkN6Y2s0ZUZZakRi?=
 =?utf-8?B?VThIb0FkZWhQbFc3Zk1tM1ltbkJ0Sk1xaUM5ejJmcU5ocStBNExCRDkwK1I3?=
 =?utf-8?B?SkRLb3E2ekdxUEp6NmtLRlRCSU95SWwwYUdPcnI5anNtL0JrZ2NrYWRzeVdQ?=
 =?utf-8?B?VCtMdFdPeDZCR2J0ZU1ldnlKdnhXS2lzeGRGamM4TVRLQThGSTFSL0dBQkVt?=
 =?utf-8?B?bjNUQTRGc3RFNTVqcXpQM1VmNzZLaXM0bVFtTHFKdW1yT3lNRzc3L1VyUlBk?=
 =?utf-8?B?NW9FUzJEdGtodEFFRzB2TkE5cVFNNWRWWGpuYU5CY1RvVHB1Snh6ZExITFA0?=
 =?utf-8?B?eUwwM1ppSmFtS3U4ZjA0Z0xGT0RicGNrK3l4KzhDRldjNHV6OTdzTGlUam16?=
 =?utf-8?B?NU0vSUJSazFObHhGUnFmcnJVVmJxQ1MrdFU4d3JSeFNFZ3gzaSsxY2tHaWJy?=
 =?utf-8?B?Nmh2ZHUzYy91b3JnWFlwSVJ1eW00RW42Qm1GTjcxSDNpUE5teEhHajNOSEVi?=
 =?utf-8?B?V2dLbzJ0Q01EUGJ0azlTMldhVm5kOXk1UmhsNXpad3NKR05scFUySmJJTkpk?=
 =?utf-8?B?RjhuQ0EyMmU3Nzh6RDBsMEdBVVpxT2F5a2xsQXVyNEQwYk9TZExCbk5XQ3Vw?=
 =?utf-8?B?aHNjNjRzM3pRaTNRbHEzZU1MM285akFMcTFha0VsS2ZBVGNoRjZEb0gveFBC?=
 =?utf-8?B?T05QVDNqSis2dTZ6MmVMQy8xSjk1aWhocTdYVSt3WDB1SWFDNkRLbzRNTG9J?=
 =?utf-8?B?U0xHZU9hR3ZpYSsrSVR6cUlpMDd2K3BQOWk0dXNjWkZyNUxheUUxWWZkNzZ6?=
 =?utf-8?B?aGlVM0x5T0l0SkE3Y21yTW9vM2dvV2dOQWN0ZXppb0tIM3VJb2d2MTZwYUg1?=
 =?utf-8?B?N1RLRURTN0FVc3cyS3QzemZxSkRQT2tlME0rRnBEbVRXR2RLZXFnaHRUZ1Js?=
 =?utf-8?B?QitWdXI4L0VDaFBJQjJsN21YSDUyZ1cyRUVGN09kYW5GOWdqWi9Pb04xQ0Jo?=
 =?utf-8?B?NmR6Tnp6cFg0NnNkcWtkeUllb00wMXhoUldVVGRrcVp2RjRVOWphdExnb2xx?=
 =?utf-8?B?SEV6bWdTYld0cTREanZXYW1RcGFqZnZESUY0d1ZOSG04Z2gxV1RlUXU4amdP?=
 =?utf-8?B?ZmhPUDVLSjNpL2w4QnJaOG1SK3lNeGt3WWZwZVVMaWpRUUorYU8yRVp5Y25k?=
 =?utf-8?B?c1dpU2tYa2Ewci91TWI1UFhSeTgvOGx0N2FvMENRVHdYVHM3TEpCQXdXKzRK?=
 =?utf-8?B?SWJHcEQzK2lSbmFyekl1djZ1M3d5N2RXVGdoYnA0dk5aTFlhZTR5Y1JWSms2?=
 =?utf-8?B?VTA3a1J5K0hJRUp5Nkd4VFRaVy9mTjA4NVZnTFFreEV6UDU1akdtRVh2RmtU?=
 =?utf-8?B?cUI3L0xBaWU4K0g2cFhWcW03SEp4R3ZuRzNNUGNTY1BTRnBlWjZLQW9RcjlD?=
 =?utf-8?B?cGpIWFdSK04wblhHWnErMkpyVzFKWW1FUTBKaWUxekZudEkvSUc0Q2dhei90?=
 =?utf-8?B?ZTl1UysxaktsTzJ6cWRnRFZkMUVQcDVneGVPSWpYRzUrL1lFSVNuWGFhT0lN?=
 =?utf-8?B?TExUd20zRlZOWVRZRVZiWFlTbnBFZnBRemczc28zdTlxY01Uem52SGhKNFhQ?=
 =?utf-8?B?UDlMUnoxWjE2UHlxZVNlZ1hNZ2VWdVRiNWhRcklJV1FOYTA0aCtiMHNDbEVh?=
 =?utf-8?B?UTZUZHU0M1lyV0Yrc1N0Y2ErZ1Fodi9BOFZLM21QanNTVDNPczhSckFpS1Ft?=
 =?utf-8?B?ZmxBMWFRT1ltRTJNQjI0aTZEdUluMTVPK3BMVDhnejhWUUwxVUZvUm01Unp3?=
 =?utf-8?B?eGhGYTdKdVpiUTBhL0h2dkVubWRsTUFONjR0TDRNdlJDN1RoNXZtL1dKak4r?=
 =?utf-8?B?QVZ4aXJsSEhpK2RqeVAzN292M2NKT3E5cDlzb21tNzFXNVpiSEFwVWdIb2Vy?=
 =?utf-8?Q?Xas94Jr+Rire0qxlKKdhczQgUUdd1nyf?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aHZQU0hXdEZoZHU5bmJDV2ErQkJKelZZZG41Q0xtUzBuUDM2SGJZRHZqYWhx?=
 =?utf-8?B?bnZ4bjlyOS9HNXR3UXlkUXZRbGRPdmwxVWVlZi9rMTQ0M3RuQm01Z1FnZGJm?=
 =?utf-8?B?Umk4N3h2MUdoYzZmUGpzc0U1UUJ4YmdBdnVxbTcveTc4MGhXZjRURFNiNXJF?=
 =?utf-8?B?K0dnNE9oSE90NlVZanZWSVZHZit5Y08wTExLUS94aW1Jb1B5ZGpiME13MlVF?=
 =?utf-8?B?R2pPM2lvUENuSVhLck9odzZpVFc0YVdVWGNqOVFWVVpPSGEzcE5WUVk3UE9V?=
 =?utf-8?B?ZmRUWGZHbndNR3dMN2dEVUw1eTN5d2o1U2tQdVkrdEl5bnlTeUozWmFNMkRi?=
 =?utf-8?B?K2NWNStPeFFiNjFkM0NGUGdjWC9qQ3pMSHozeFN2QTBaUnBLSVhkNTZEVDZG?=
 =?utf-8?B?SDZhK0tlWklRQU41RklVbUlqQXNSSkNMWm9BZ0prWkRXVWwwaStFQytLK3hG?=
 =?utf-8?B?SWZuaFpMUFBkbHUyRmZFOEtUMVl5bkdIQlFvTVVrd051ekV4UnNlZ0VrcENj?=
 =?utf-8?B?RTFKdyt2L3hKcG0valF5ZTRIMjl3OWpyMWYwSmMrT2tQall2bmRyNnRsbHp4?=
 =?utf-8?B?TXZqc3hPdE8ycjhOb2YxemhjVFBPc1lUaDdsNEQxZmE3dmhlbHQ3Skl6S0xq?=
 =?utf-8?B?N21TMVloWi9hcDA3a2JKYk1jNTJLK3hoVmcyWHd3SmZjc0hpSVdwNXFEbmJY?=
 =?utf-8?B?VW0zVkZ5ZEVIeTVZUURVNDBLODA1NHdZWTYvbmlQZDN4R3NwTXJ3Mkd5YjRy?=
 =?utf-8?B?Y2VGU2xpS0RYbU9XV25BS2hJRk9SVFFwbDYyWitoUlppVy82NlQ2aWlqZFVa?=
 =?utf-8?B?OHorcEk2cVhzc21yemdjSis1a3QvSnExT0cvcit6N3dWaFB3cVhJNXZNc0hE?=
 =?utf-8?B?aERydy9wenBZQTJ1UWFYMnJBMWtvWTZ1SWora2lnRkJqc0d0UDU4a1VwTklm?=
 =?utf-8?B?SVo4RTVIN1didTJCdDdsSTFRbzRXaHRSbWZOOStrQ1R3UDhaSkNqU2dOanAz?=
 =?utf-8?B?Rms2VG50d3VKcSt6Qis3Y0JwQlRaN2NPWUgrMEVCNHhjUk5FdWg1Tkh2VHNS?=
 =?utf-8?B?d01UV3NQelFYb2RxZVdKUXd0NXdpaGRhRUFHUWVUakpMQWp3S2V1MUd4NVY2?=
 =?utf-8?B?U2FXcDNSeURHQUdheGl5akdhajdFRi8xb3N4WEd2R1p6cFhNeXlCZmRFK1Vt?=
 =?utf-8?B?dkNHdkYzd3JMNFRtd3FwRVR1MlJYd3RncVFramN5U21ycXFmR3VFckRRRkxr?=
 =?utf-8?B?RGQyd1FZUzFJbUUvNmhXeFBYVFlsMmhtaURzZG1pb01FT2RxSE1BNGVQbVJn?=
 =?utf-8?B?NzdsSUxLa25kRDBUT0tGOFhXNUl5VkRMVHdHQytYS3FlNUdGT3JCZ01oUlo1?=
 =?utf-8?B?TW9TclY5OWZqMzFWODNpbGFnaWNpclh6Z210WFlmV3lnWTNNUFR3TEhZMGRB?=
 =?utf-8?B?OVN6WGdiU25sV3IwQXk2SkN3enVFdHh3NWJKalUwOXhxcDdrYXg2RENHbE5x?=
 =?utf-8?B?ZG00ZnB5M0liT3VmUXpiVURmN3NRZHRUeFFSaVR0KzM0UmlScm1yYlorMHlU?=
 =?utf-8?B?Y0hkbTJGRUFQOWpaT1llVkd0MlE4d1NQZlFDRFgzYmVpTE1ROGhZQmNnM0ZL?=
 =?utf-8?B?cG9NWjFxanlDRlhCZVdjSlVyL2FZejNEQjd0SndOd2ZhZllSS3RQUURZc01W?=
 =?utf-8?B?ZEhJdGg5eEtFOVduaEhLUG9tMXk4Q1dQeTQ2UXUrRndDM1NnK29qS3p1UkZF?=
 =?utf-8?B?bWdiSk5oZmVYZDVGbys0UlNwcTA5dnM3WFVITVE2YnVHcWdZMnR5MlQ1YlBU?=
 =?utf-8?B?eXF3cDRMOG1nTmlqaXFjNnNJN3lDL281NHRlaUxvWWpLbG1HdGdvUEFuZE5z?=
 =?utf-8?B?WkMxSVhKcHRWUUk1M0VxQW1PVTlZdDBkRlhGNllSNXVRNXZ1NUtMd3dmK0R6?=
 =?utf-8?B?QnU2UHEyUkoyRC90Y2NDcGxGQ2FKMFhicFpnazh4MktIQmhiWGlITnIrUk9n?=
 =?utf-8?B?d1dDZWNuZ1N5MEYyb2NSQU9TblpyN0xUOEdNV3JYeWdHTDgzUmVBUWc0K1A3?=
 =?utf-8?B?Njd1Vmh4OUNFM1pVbG56Q0wyRGdnTTdOWC95MEdIdE8wVjUrczZFVE1sZ2RE?=
 =?utf-8?B?a1BraFJTS1V4YUgrUkY3YXJkd0YxZVFzWjJmR0NncCt6ZkpyMENReURCbkNU?=
 =?utf-8?Q?ACJAAGrVQwHpxRxQa3vnMzU=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aab3de2-5bda-4788-2b83-08ddaccff07f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 12:18:45.3151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c23e/Kq7TwnQ/rsulOe/bvWJbbaeT7PsRZKyRfVa2B+n3GFT3+38lG3WcJDykIGdyt/OPS7VYVDiqsoHm5CwqJJY6g3oIHnAk6tEjANcaECsTy8uOSwSW10zvVQshphW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7301
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA3NiBTYWx0ZWRfX8UX30aLbKtYb ypC53lwy3vz8Ju9ajQ5B/9FtTZ0Bj5y9zYU6qOMNC3rDdjmpFa+T9qCHAgLxju7GIywKZRMCqqT uaVALH7wPFiPpANexhBekF/t4XOuuEKxIainmoaKHS3JiZBBC72N1+Qy+TIrngvJZZis81qaRBK
 HjPtdabtW8Dqf4Yp5bQ+Dwfmd76HsYyVIaOxsiZGRWMQw+M99UstAEoCADkMZ1clHqvLresRQxb 19Qe86Gi2gCDDLpjTshoZyQqPQM885c6GoRlO83WCepn2nTifKxjiqS0mhERwPLv6rvbfDG7R6D FpZi5xUvRENqY903Et8CQkwT5Atq/DGOnJBNaVgongzs6AglLhGOfVQZshMJDBck37l3bEhmLXO
 XFTjSLfhHpA3tY2dpwiqVAiHmaD+0xmMdcHOq3Z7+IlYQxKXaFGbtmfr6A7HOXoeX7lxf25w
X-Proofpoint-GUID: Hxr5OH2cC2a8JdvNCGLlRM9zPpfTCPuC
X-Authority-Analysis: v=2.4 cv=ar2yCTZV c=1 sm=1 tr=0 ts=68500ba8 cx=c_pps a=o1VJN3YqdCgxIxsX0dn2eg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=mDV3o1hIAAAA:8 a=NEAV23lmAAAA:8 a=m9shYIPOAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=7CQSdrXTAAAA:8 a=20KFwNOVAAAA:8 a=RkZnTFZfyHrYY7ms5YIA:9 a=nPWvBAr5p45noifJ:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OK5ky32wnfMA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: Hxr5OH2cC2a8JdvNCGLlRM9zPpfTCPuC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_05,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 mlxscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 mlxlogscore=999 impostorscore=0 clxscore=1015 bulkscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506160076
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 55GAe9Wv023842
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 12:18:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218820

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

This is a bugfix release in GCC13 release series
100+ bugfixes

https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=3DRESOLVED&resolution=
=3DFIXED&target_milestone=3D13.4

Dropped the following patches:

0028-gcc-Fix-c-tweak-for-Wrange-loop-construct.patch
https://github.com/gcc-mirror/gcc/commit/179dc0f0fe01012675c1b430591b9891=
ce96c26e

gcc.git-ab884fffe3fc82a710bea66ad651720d71c938b8.patch
https://github.com/gcc-mirror/gcc/commit/5ceea2ac106d6dd1aa8175670b15a801=
316cf1c9

                                 #GCC 13.3      #GCC 13.4       #Diff

No. of expected passes=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 148863         149440          +577
No. of unexpected failures=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 14  =
           14              0
No. of expected failures=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 1415           1414            -1
No. of unresolved testcases=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 25384    =
      25660           +276
No. of unsupported tests=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 2692           2689            -3

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/conf/distro/include/maintainers.inc      |   2 +-
 .../gcc/{gcc-13.3.inc =3D> gcc-13.4.inc}        |   8 +-
 ...ian_13.3.bb =3D> gcc-cross-canadian_13.4.bb} |   0
 .../{gcc-cross_13.3.bb =3D> gcc-cross_13.4.bb}  |   0
 ...-crosssdk_13.3.bb =3D> gcc-crosssdk_13.4.bb} |   0
 ...cc-runtime_13.3.bb =3D> gcc-runtime_13.4.bb} |   0
 ...itizers_13.3.bb =3D> gcc-sanitizers_13.4.bb} |   0
 ...{gcc-source_13.3.bb =3D> gcc-source_13.4.bb} |   0
 ...ix-c-tweak-for-Wrange-loop-construct.patch | 113 ----
 ...4fffe3fc82a710bea66ad651720d71c938b8.patch | 549 ------------------
 .../gcc/{gcc_13.3.bb =3D> gcc_13.4.bb}          |   0
 ...initial_13.3.bb =3D> libgcc-initial_13.4.bb} |   0
 .../gcc/{libgcc_13.3.bb =3D> libgcc_13.4.bb}    |   0
 ...ibgfortran_13.3.bb =3D> libgfortran_13.4.bb} |   0
 14 files changed, 4 insertions(+), 668 deletions(-)
 rename meta/recipes-devtools/gcc/{gcc-13.3.inc =3D> gcc-13.4.inc} (94%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_13.3.bb =3D> gcc-cr=
oss-canadian_13.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_13.3.bb =3D> gcc-cross_13.4.=
bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_13.3.bb =3D> gcc-crosssdk=
_13.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_13.3.bb =3D> gcc-runtime_1=
3.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_13.3.bb =3D> gcc-saniti=
zers_13.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_13.3.bb =3D> gcc-source_13.=
4.bb} (100%)
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0028-gcc-Fix-c-tweak-fo=
r-Wrange-loop-construct.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/gcc.git-ab884fffe3fc82a=
710bea66ad651720d71c938b8.patch
 rename meta/recipes-devtools/gcc/{gcc_13.3.bb =3D> gcc_13.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_13.3.bb =3D> libgcc-ini=
tial_13.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_13.3.bb =3D> libgcc_13.4.bb} (1=
00%)
 rename meta/recipes-devtools/gcc/{libgfortran_13.3.bb =3D> libgfortran_1=
3.4.bb} (100%)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index 9548fcd258..3a51ad2139 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -190,7 +190,7 @@ RECIPE_MAINTAINER:pn-gcc-cross-canadian-${TRANSLATED_=
TARGET_ARCH} =3D "Khem Raj <r
 RECIPE_MAINTAINER:pn-gcc-crosssdk-${SDK_SYS} =3D "Khem Raj <raj.khem@gma=
il.com>"
 RECIPE_MAINTAINER:pn-gcc-runtime =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gcc-sanitizers =3D "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-gcc-source-13.3.0 =3D "Khem Raj <raj.khem@gmail.com=
>"
+RECIPE_MAINTAINER:pn-gcc-source-13.4.0 =3D "Khem Raj <raj.khem@gmail.com=
>"
 RECIPE_MAINTAINER:pn-gconf =3D "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-gcr =3D "Alexander Kanavin <alex.kanavin@gmail.com>=
"
 RECIPE_MAINTAINER:pn-gdb =3D "Khem Raj <raj.khem@gmail.com>"
diff --git a/meta/recipes-devtools/gcc/gcc-13.3.inc b/meta/recipes-devtoo=
ls/gcc/gcc-13.4.inc
similarity index 94%
rename from meta/recipes-devtools/gcc/gcc-13.3.inc
rename to meta/recipes-devtools/gcc/gcc-13.4.inc
index 8b6c2a5938..eefae13530 100644
--- a/meta/recipes-devtools/gcc/gcc-13.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-13.4.inc
@@ -2,11 +2,11 @@ require gcc-common.inc
=20
 # Third digit in PV should be incremented after a minor release
=20
-PV =3D "13.3.0"
+PV =3D "13.4.0"
=20
 # BINV should be incremented to a revision after a minor gcc release
=20
-BINV =3D "13.3.0"
+BINV =3D "13.4.0"
=20
 FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/backport:"
=20
@@ -66,10 +66,8 @@ SRC_URI =3D "${BASEURI} \
            file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch=
 \
            file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
            file://0027-Fix-gcc-vect-module-testcases.patch \
-	   file://0028-gcc-Fix-c-tweak-for-Wrange-loop-construct.patch \
-           file://gcc.git-ab884fffe3fc82a710bea66ad651720d71c938b8.patch=
 \
 "
-SRC_URI[sha256sum] =3D "0845e9621c9543a13f484e94584a49ffc0129970e9914624=
235fc1d061a0c083"
+SRC_URI[sha256sum] =3D "9c4ce6dbb040568fdc545588ac03c5cbc95a8dbf0c7aa490=
170843afb59ca8f5"
=20
 S =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/${SOURCEDIR}"
 B =3D "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_13.3.bb b/meta/=
recipes-devtools/gcc/gcc-cross-canadian_13.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross-canadian_13.3.bb
rename to meta/recipes-devtools/gcc/gcc-cross-canadian_13.4.bb
diff --git a/meta/recipes-devtools/gcc/gcc-cross_13.3.bb b/meta/recipes-d=
evtools/gcc/gcc-cross_13.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross_13.3.bb
rename to meta/recipes-devtools/gcc/gcc-cross_13.4.bb
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_13.3.bb b/meta/recipe=
s-devtools/gcc/gcc-crosssdk_13.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-crosssdk_13.3.bb
rename to meta/recipes-devtools/gcc/gcc-crosssdk_13.4.bb
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_13.3.bb b/meta/recipes=
-devtools/gcc/gcc-runtime_13.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-runtime_13.3.bb
rename to meta/recipes-devtools/gcc/gcc-runtime_13.4.bb
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_13.3.bb b/meta/reci=
pes-devtools/gcc/gcc-sanitizers_13.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-sanitizers_13.3.bb
rename to meta/recipes-devtools/gcc/gcc-sanitizers_13.4.bb
diff --git a/meta/recipes-devtools/gcc/gcc-source_13.3.bb b/meta/recipes-=
devtools/gcc/gcc-source_13.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-source_13.3.bb
rename to meta/recipes-devtools/gcc/gcc-source_13.4.bb
diff --git a/meta/recipes-devtools/gcc/gcc/0028-gcc-Fix-c-tweak-for-Wrang=
e-loop-construct.patch b/meta/recipes-devtools/gcc/gcc/0028-gcc-Fix-c-twe=
ak-for-Wrange-loop-construct.patch
deleted file mode 100644
index 745b38f7f1..0000000000
--- a/meta/recipes-devtools/gcc/gcc/0028-gcc-Fix-c-tweak-for-Wrange-loop-=
construct.patch
+++ /dev/null
@@ -1,113 +0,0 @@
-From 66aa69e2add2b8641a652768b0eac30f00427145 Mon Sep 17 00:00:00 2001
-From: Sunil Dora <sunilkumar.dora@windriver.com>
-Date: Wed, 11 Dec 2024 09:48:16 -0800
-Subject: [PATCH] gcc: Fix c++: tweak for Wrange-loop-construct
-
-This commit updates the warning to use a check for "trivially constructi=
ble" instead of
-"trivially copyable." The original check was incorrect, as "trivially co=
pyable" only applies
-to types that can be copied trivially, whereas "trivially constructible"=
 is the correct check
-for types that can be trivially default-constructed.
-
-This change ensures the warning is more accurate and aligns with the pro=
per type traits.
-
-LLVM accepted a similar fix:
-https://github.com/llvm/llvm-project/issues/47355
-
-PR c++/116731 [https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D116731]
-
-Upstream-Status: Backport [https://gcc.gnu.org/g:179dc0f0fe01012675c1b43=
0591b9891ce96c26e]
-
-Signed-off-by: Marek Polacek <polacek@redhat.com>
-Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
----
- gcc/cp/parser.cc                              |  7 ++-
- .../g++.dg/warn/Wrange-loop-construct3.C      | 57 +++++++++++++++++++
- 2 files changed, 61 insertions(+), 3 deletions(-)
- create mode 100644 gcc/testsuite/g++.dg/warn/Wrange-loop-construct3.C
-
-diff --git a/gcc/cp/parser.cc b/gcc/cp/parser.cc
-index 4e67da6ff..5dd94357d 100644
---- a/gcc/cp/parser.cc
-+++ b/gcc/cp/parser.cc
-@@ -13854,11 +13854,12 @@ warn_for_range_copy (tree decl, tree expr)
-   else if (!CP_TYPE_CONST_P (type))
-     return;
-=20
--  /* Since small trivially copyable types are cheap to copy, we suppres=
s the
--     warning for them.  64B is a common size of a cache line.  */
-+  /* Since small trivially constructible types are cheap to construct, =
we
-+     suppress the warning for them.  64B is a common size of a cache li=
ne.  */
-+  tree list =3D build_tree_list (NULL_TREE, TREE_TYPE (expr));
-   if (TREE_CODE (TYPE_SIZE_UNIT (type)) !=3D INTEGER_CST
-       || (tree_to_uhwi (TYPE_SIZE_UNIT (type)) <=3D 64
--	  && trivially_copyable_p (type)))
-+	  && is_trivially_xible (INIT_EXPR, type, list)))
-     return;
-=20
-   /* If we can initialize a reference directly, suggest that to avoid t=
he
-diff --git a/gcc/testsuite/g++.dg/warn/Wrange-loop-construct3.C b/gcc/te=
stsuite/g++.dg/warn/Wrange-loop-construct3.C
-new file mode 100644
-index 000000000..3d9d0c908
---- /dev/null
-+++ b/gcc/testsuite/g++.dg/warn/Wrange-loop-construct3.C
-@@ -0,0 +1,57 @@
-+// PR c++/116731
-+// { dg-do compile { target c++11 } }
-+// { dg-options "-Wrange-loop-construct" }
-+
-+void
-+f0 ()
-+{
-+  struct S {
-+    char a[64];
-+    S& operator=3D(const S&) { return *this; };
-+  };
-+
-+  S arr[8];
-+  for (const auto r : arr)
-+    (void) r;
-+}
-+
-+void
-+f1 ()
-+{
-+  struct S {
-+    char a[65];
-+    S& operator=3D(const S&) { return *this; };
-+  };
-+
-+  S arr[8];
-+  for (const auto r : arr) // { dg-warning "creates a copy" }
-+    (void) r;
-+}
-+
-+void
-+f2 ()
-+{
-+  struct S {
-+    char a[64];
-+    S& operator=3D(const S&) { return *this; };
-+    ~S() { }
-+  };
-+
-+  S arr[8];
-+  for (const auto r : arr) // { dg-warning "creates a copy" }
-+    (void) r;
-+}
-+
-+void
-+f3 ()
-+{
-+  struct S {
-+    char a[65];
-+    S& operator=3D(const S&) { return *this; };
-+    ~S() { }
-+  };
-+
-+  S arr[8];
-+  for (const auto r : arr) // { dg-warning "creates a copy" }
-+    (void) r;
-+}
---=20
-2.43.0
-
diff --git a/meta/recipes-devtools/gcc/gcc/gcc.git-ab884fffe3fc82a710bea6=
6ad651720d71c938b8.patch b/meta/recipes-devtools/gcc/gcc/gcc.git-ab884fff=
e3fc82a710bea66ad651720d71c938b8.patch
deleted file mode 100644
index e5abdcc703..0000000000
--- a/meta/recipes-devtools/gcc/gcc/gcc.git-ab884fffe3fc82a710bea66ad6517=
20d71c938b8.patch
+++ /dev/null
@@ -1,549 +0,0 @@
-From ab884fffe3fc82a710bea66ad651720d71c938b8 Mon Sep 17 00:00:00 2001
-From: Jonathan Wakely <jwakely@redhat.com>
-Date: Tue, 30 Apr 2024 09:52:13 +0100
-Subject: [PATCH] libstdc++: Fix std::chrono::tzdb to work with vanguard =
format
-
-I found some issues in the std::chrono::tzdb parser by testing the
-tzdata "vanguard" format, which uses new features that aren't enabled in
-the "main" and "rearguard" data formats.
-
-Since 2024a the keyword "minimum" is no longer valid for the FROM and TO
-fields in a Rule line, which means that "m" is now a valid abbreviation
-for "maximum". Previously we expected either "mi" or "ma". For backwards
-compatibility, a FROM field beginning with "mi" is still supported and
-is treated as 1900. The "maximum" keyword is only allowed in TO now,
-because it makes no sense in FROM. To support these changes the
-minmax_year and minmax_year2 classes for parsing FROM and TO are
-replaced with a single years_from_to class that reads both fields.
-
-The vanguard format makes use of %z in Zone FORMAT fields, which caused
-an exception to be thrown from ZoneInfo::set_abbrev because no % or /
-characters were expected when a Zone doesn't use a named Rule. The
-ZoneInfo::to(sys_info&) function now uses format_abbrev_str to replace
-any %z with the current offset. Although format_abbrev_str also checks
-for %s and STD/DST formats, those only make sense when a named Rule is
-in effect, so won't occur when ZoneInfo::to(sys_info&) is used.
-
-Since making this change on trunk, the tzdata-2024b release started
-using %z in the main format, not just vanguard. This makes a backport to
-release branches necessary (see PR 116657).
-
-This change also implements a feature that has always been missing from
-time_zone::_M_get_sys_info: finding the Rule that is active before the
-specified time point, so that we can correctly handle %s in the FORMAT
-for the first new sys_info that gets created. This requires implementing
-a poorly documented feature of zic, to get the LETTERS field from a
-later transition, as described at
-https://mm.icann.org/pipermail/tz/2024-April/058891.html
-In order for this to work we need to be able to distinguish an empty
-letters field (as used by CE%sT where the variable part is either empty
-or "S") from "the letters field is not known for this transition". The
-tzdata file uses "-" for an empty letters field, which libstdc++ was
-previously replacing with "" when the Rule was parsed. Instead, we now
-preserve the "-" in the Rule object, so that "" can be used for the case
-where we don't know the letters (and so need to decide it).
-
-(cherry picked from commit 0ca8d56f2085715f27ee536c6c344bc47af49cdd)
-
-Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=3Dgcc.gi=
t;h=3D5ceea2ac106d6dd1aa8175670b15a801316cf1c9]
-
-Signed-off-by: Markus Volk <f_l_k@t-online.de>
----
- libstdc++-v3/src/c++20/tzdb.cc                | 265 +++++++++++-------
- .../std/time/time_zone/sys_info_abbrev.cc     | 106 +++++++
- libstdc++-v3/testsuite/std/time/tzdb/1.cc     |   6 +-
- 3 files changed, 274 insertions(+), 103 deletions(-)
- create mode 100644 libstdc++-v3/testsuite/std/time/time_zone/sys_info_a=
bbrev.cc
-
-diff --git a/libstdc++-v3/src/c++20/tzdb.cc b/libstdc++-v3/src/c++20/tzd=
b.cc
-index c7c7cc9deee6..7e8cce7ce8cf 100644
---- a/libstdc++-v3/src/c++20/tzdb.cc
-+++ b/libstdc++-v3/src/c++20/tzdb.cc
-@@ -342,51 +342,103 @@ namespace std::chrono
-       friend istream& operator>>(istream&, on_day&);
-     };
-=20
--    // Wrapper for chrono::year that reads a year, or one of the keywor=
ds
--    // "minimum" or "maximum", or an unambiguous prefix of a keyword.
--    struct minmax_year
-+    // Wrapper for two chrono::year values, which reads the FROM and TO
-+    // fields of a Rule line. The FROM field is a year and TO is a year=
 or
-+    // one of the keywords "maximum" or "only" (or an abbreviation of t=
hose).
-+    // For backwards compatibility, the keyword "minimum" is recognized
-+    // for FROM and interpreted as 1900.
-+    struct years_from_to
-     {
--      year& y;
-+      year& from;
-+      year& to;
-=20
--      friend istream& operator>>(istream& in, minmax_year&& y)
-+      friend istream& operator>>(istream& in, years_from_to&& yy)
-       {
--	if (ws(in).peek() =3D=3D 'm') // keywords "minimum" or "maximum"
-+	string s;
-+	auto c =3D ws(in).peek();
-+	if (c =3D=3D 'm') [[unlikely]] // keyword "minimum"
- 	  {
--	    string s;
--	    in >> s; // extract the rest of the word, but only look at s[1]
--	    if (s[1] =3D=3D 'a')
--	      y.y =3D year::max();
--	    else if (s[1] =3D=3D 'i')
--	      y.y =3D year::min();
--	    else
--	      in.setstate(ios::failbit);
-+	    in >> s; // extract the rest of the word
-+	    yy.from =3D year(1900);
-+	  }
-+	else if (int num =3D 0; in >> num) [[likely]]
-+	  yy.from =3D year{num};
-+
-+	c =3D ws(in).peek();
-+	if (c =3D=3D 'm') // keyword "maximum"
-+	  {
-+	    in >> s; // extract the rest of the word
-+	    yy.to =3D year::max();
-+	  }
-+	else if (c =3D=3D 'o') // keyword "only"
-+	  {
-+	    in >> s; // extract the rest of the word
-+	    yy.to =3D yy.from;
- 	  }
- 	else if (int num =3D 0; in >> num)
--	  y.y =3D year{num};
-+	  yy.to =3D year{num};
-+
- 	return in;
-       }
-     };
-=20
--    // As above for minmax_year, but also supports the keyword "only",
--    // meaning that the TO year is the same as the FROM year.
--    struct minmax_year2
-+    bool
-+    select_std_or_dst_abbrev(string& abbrev, minutes save)
-     {
--      minmax_year to;
--      year from;
-+      if (size_t pos =3D abbrev.find('/'); pos !=3D string::npos)
-+	{
-+	  // Select one of "STD/DST" for standard or daylight.
-+	  if (save =3D=3D 0min)
-+	    abbrev.erase(pos);
-+	  else
-+	    abbrev.erase(0, pos + 1);
-+	  return true;
-+	}
-+      return false;
-+    }
-=20
--      friend istream& operator>>(istream& in, minmax_year2&& y)
--      {
--	if (ws(in).peek() =3D=3D 'o') // keyword "only"
--	  {
--	    string s;
--	    in >> s; // extract the whole keyword
--	    y.to.y =3D y.from;
--	  }
--	else
--	  in >> std::move(y.to);
--	return in;
--      }
--    };
-+    // Set the sys_info::abbrev string by expanding any placeholders.
-+    void
-+    format_abbrev_str(sys_info& info, string_view letters =3D {})
-+    {
-+      if (size_t pos =3D info.abbrev.find('%'); pos !=3D string::npos)
-+	{
-+	  if (info.abbrev[pos + 1] =3D=3D 's')
-+	    {
-+	      // Expand "%s" to the variable part, given by Rule::letters.
-+	      if (letters =3D=3D "-")
-+		info.abbrev.erase(pos, 2);
-+	      else
-+		info.abbrev.replace(pos, 2, letters);
-+	    }
-+	  else if (info.abbrev[pos + 1] =3D=3D 'z')
-+	    {
-+	      // Expand "%z" to the UT offset as +/-hh, +/-hhmm, or +/-hhmmss.
-+	      hh_mm_ss<seconds> t(info.offset);
-+	      string z(1, "+-"[t.is_negative()]);
-+	      long val =3D t.hours().count();
-+	      int digits =3D 2;
-+	      if (int m =3D t.minutes().count())
-+		{
-+		  digits =3D 4;
-+		  val *=3D 100;
-+		  val +=3D m;
-+		  if (int s =3D t.seconds().count())
-+		    {
-+		      digits =3D 6;
-+		      val *=3D 100;
-+		      val +=3D s;
-+		    }
-+		}
-+	      auto sval =3D std::to_string(val);
-+	      z +=3D string(digits - sval.size(), '0');
-+	      z +=3D sval;
-+	      info.abbrev.replace(pos, 2, z);
-+	    }
-+	}
-+      else
-+	select_std_or_dst_abbrev(info.abbrev, info.save);
-+    }
-=20
-     // A time zone information record.
-     // Zone  NAME        STDOFF  RULES   FORMAT  [UNTIL]
-@@ -462,6 +514,7 @@ namespace std::chrono
- 	info.offset =3D offset();
- 	info.save =3D minutes(m_save);
- 	info.abbrev =3D format();
-+	format_abbrev_str(info); // expand %z
- 	return true;
-       }
-=20
-@@ -469,12 +522,9 @@ namespace std::chrono
-       friend class time_zone;
-=20
-       void
--      set_abbrev(const string& abbrev)
-+      set_abbrev(string abbrev)
-       {
--	// In practice, the FORMAT field never needs expanding here.
--	if (abbrev.find_first_of("/%") !=3D abbrev.npos)
--	  __throw_runtime_error("std::chrono::time_zone: invalid data");
--	m_buf =3D abbrev;
-+	m_buf =3D std::move(abbrev);
- 	m_pos =3D 0;
- 	m_expanded =3D true;
-       }
-@@ -544,9 +594,7 @@ namespace std::chrono
-=20
- 	// Rule  NAME  FROM  TO  TYPE  IN  ON  AT  SAVE  LETTER/S
-=20
--	in >> quoted(rule.name)
--	   >> minmax_year{rule.from}
--	   >> minmax_year2{rule.to, rule.from};
-+	in >> quoted(rule.name) >> years_from_to{rule.from, rule.to};
-=20
- 	if (char type; in >> type && type !=3D '-')
- 	  in.setstate(ios::failbit);
-@@ -557,7 +605,7 @@ namespace std::chrono
- 	if (save_time.indicator !=3D at_time::Wall)
- 	  {
- 	    // We don't actually store the save_time.indicator, because we
--	    // assume that it's always deducable from the actual offset value.
-+	    // assume that it's always deducible from the offset value.
- 	    auto expected =3D save_time.time =3D=3D 0s
- 			      ? at_time::Standard
- 			      : at_time::Daylight;
-@@ -567,8 +615,6 @@ namespace std::chrono
- 	rule.save =3D save_time.time;
-=20
- 	in >> rule.letters;
--	if (rule.letters =3D=3D "-")
--	  rule.letters.clear();
- 	return in;
-       }
-=20
-@@ -719,58 +765,6 @@ namespace std::chrono
- #endif // TZDB_DISABLED
-   };
-=20
--#ifndef TZDB_DISABLED
--  namespace
--  {
--    bool
--    select_std_or_dst_abbrev(string& abbrev, minutes save)
--    {
--      if (size_t pos =3D abbrev.find('/'); pos !=3D string::npos)
--	{
--	  // Select one of "STD/DST" for standard or daylight.
--	  if (save =3D=3D 0min)
--	    abbrev.erase(pos);
--	  else
--	    abbrev.erase(0, pos + 1);
--	  return true;
--	}
--      return false;
--    }
--
--    // Set the sys_info::abbrev string by expanding any placeholders.
--    void
--    format_abbrev_str(sys_info& info, string_view letters =3D {})
--    {
--      if (size_t pos =3D info.abbrev.find("%s"); pos !=3D string::npos)
--	{
--	  // Expand "%s" to the variable part, given by Rule::letters.
--	  info.abbrev.replace(pos, 2, letters);
--	}
--      else if (size_t pos =3D info.abbrev.find("%z"); pos !=3D string::=
npos)
--	{
--	  // Expand "%z" to the UT offset as +/-hh, +/-hhmm, or +/-hhmmss.
--	  hh_mm_ss<seconds> t(info.offset);
--	  string z(1, "+-"[t.is_negative()]);
--	  long val =3D t.hours().count();
--	  if (minutes m =3D t.minutes(); m !=3D m.zero())
--	    {
--	      val *=3D 100;
--	      val +=3D m.count();
--	      if (seconds s =3D t.seconds(); s !=3D s.zero())
--		{
--		  val *=3D 100;
--		  val +=3D s.count();
--		}
--	    }
--	  z +=3D std::to_string(val);
--	  info.abbrev.replace(pos, 2, z);
--	}
--      else
--	select_std_or_dst_abbrev(info.abbrev, info.save);
--    }
--  }
--#endif // TZDB_DISABLED
--
-   // Implementation of std::chrono::time_zone::get_info(const sys_time<=
D>&)
-   sys_info
-   time_zone::_M_get_sys_info(sys_seconds tp) const
-@@ -839,12 +833,72 @@ namespace std::chrono
-     info.abbrev =3D ri.format();
-=20
-     string_view letters;
--    if (i !=3D infos.begin())
-+    if (i !=3D infos.begin() && i[-1].expanded())
-+      letters =3D i[-1].next_letters();
-+
-+    if (letters.empty())
-       {
--	if (i[-1].expanded())
--	  letters =3D i[-1].next_letters();
--	// XXX else need to find Rule active before this time and use it
--	// to know the initial offset, save, and letters.
-+	sys_seconds t =3D info.begin - seconds(1);
-+	const year_month_day date(chrono::floor<days>(t));
-+
-+	// Try to find a Rule active before this time, to get initial
-+	// SAVE and LETTERS values. There may not be a Rule for the period
-+	// before the first DST transition, so find the earliest DST->STD
-+	// transition and use the LETTERS from that.
-+	const Rule* active_rule =3D nullptr;
-+	sys_seconds active_rule_start =3D sys_seconds::min();
-+	const Rule* first_std =3D nullptr;
-+	for (const auto& rule : rules)
-+	  {
-+	    if (rule.save =3D=3D minutes(0))
-+	      {
-+		if (!first_std)
-+		  first_std =3D &rule;
-+		else if (rule.from < first_std->from)
-+		  first_std =3D &rule;
-+		else if (rule.from =3D=3D first_std->from)
-+		  {
-+		    if (rule.start_time(rule.from, {})
-+			  < first_std->start_time(first_std->from, {}))
-+		      first_std =3D &rule;
-+		  }
-+	      }
-+
-+	    year y =3D date.year();
-+
-+	    if (y > rule.to) // rule no longer applies at time t
-+	      continue;
-+	    if (y < rule.from) // rule doesn't apply yet at time t
-+	      continue;
-+
-+	    sys_seconds rule_start;
-+
-+	    seconds offset{}; // appropriate for at_time::Universal
-+	    if (rule.when.indicator =3D=3D at_time::Wall)
-+	      offset =3D info.offset;
-+	    else if (rule.when.indicator =3D=3D at_time::Standard)
-+	      offset =3D ri.offset();
-+
-+	    // Time the rule takes effect this year:
-+	    rule_start =3D rule.start_time(y, offset);
-+
-+	    if (rule_start >=3D t && rule.from < y)
-+	      {
-+		// Try this rule in the previous year.
-+		rule_start =3D rule.start_time(--y, offset);
-+	      }
-+
-+	    if (active_rule_start < rule_start && rule_start < t)
-+	      {
-+		active_rule_start =3D rule_start;
-+		active_rule =3D &rule;
-+	      }
-+	  }
-+
-+	if (active_rule)
-+	  letters =3D active_rule->letters;
-+	else if (first_std)
-+	  letters =3D first_std->letters;
-       }
-=20
-     const Rule* curr_rule =3D nullptr;
-@@ -2069,9 +2123,11 @@ namespace std::chrono
- 	      istringstream in2(std::move(rules));
- 	      in2 >> rules_time;
- 	      inf.m_save =3D duration_cast<minutes>(rules_time.time);
-+	      // If the FORMAT is "STD/DST" then we can choose the right one
-+	      // now, so that we store a shorter string.
- 	      select_std_or_dst_abbrev(fmt, inf.m_save);
- 	    }
--	  inf.set_abbrev(fmt);
-+	  inf.set_abbrev(std::move(fmt));
- 	}
-=20
-       // YEAR [MONTH [DAY [TIME]]]
-@@ -2082,7 +2138,12 @@ namespace std::chrono
- 	  abbrev_month m{January};
- 	  int d =3D 1;
- 	  at_time t{};
-+	  // XXX DAY should support ON format, e.g. lastSun or Sun>=3D8
- 	  in >> m >> d >> t;
-+	  // XXX UNTIL field should be interpreted
-+	  // "using the rules in effect just before the transition"
-+	  // so might need to store as year_month_day and hh_mm_ss and only
-+	  // convert to a sys_time once we know the offset in effect.
- 	  inf.m_until =3D sys_days(year(y)/m.m/day(d)) + seconds(t.time);
- 	}
-       else
-diff --git a/libstdc++-v3/testsuite/std/time/time_zone/sys_info_abbrev.c=
c b/libstdc++-v3/testsuite/std/time/time_zone/sys_info_abbrev.cc
-new file mode 100644
-index 000000000000..f1a8fff02f58
---- /dev/null
-+++ b/libstdc++-v3/testsuite/std/time/time_zone/sys_info_abbrev.cc
-@@ -0,0 +1,106 @@
-+// { dg-do run { target c++20 } }
-+// { dg-require-effective-target tzdb }
-+// { dg-require-effective-target cxx11_abi }
-+// { dg-xfail-run-if "no weak override on AIX" { powerpc-ibm-aix* } }
-+
-+#include <chrono>
-+#include <fstream>
-+#include <testsuite_hooks.h>
-+
-+static bool override_used =3D false;
-+
-+namespace __gnu_cxx
-+{
-+  const char* zoneinfo_dir_override() {
-+    override_used =3D true;
-+    return "./";
-+  }
-+}
-+
-+using namespace std::chrono;
-+
-+void
-+test_format()
-+{
-+  std::ofstream("tzdata.zi") << R"(# version test_1
-+Zone Africa/Bissau -1:2:20 - LMT 1912 Ja 1 1u
-+                   -1      - %z  1975
-+                   0       - GMT
-+Zon Some/Zone 1:2:3   - %z 1900
-+              1:23:45 - %z 1950
-+Zo Another/Zone 1:2:3 -     AZ0     1901
-+                1     Roolz A%sZ    2000
-+                1     Roolz SAZ/DAZ 2005
-+                1     Roolz %z
-+Rule Roolz 1950 max - April 1 2 1 D
-+Rul  Roolz 1950 max - Oct   1 1 0 S
-+Z Strange/Zone 1       - X%sX    1980
-+               1       - FOO/BAR 1990
-+               2:00    - %zzz    1995
-+               0:9     - %zzz    1996
-+               0:8:7   - %zzz    1997
-+               0:6:5.5 - %zzz    1998
-+)";
-+
-+  const auto& db =3D reload_tzdb();
-+  VERIFY( override_used ); // If this fails then XFAIL for the target.
-+  VERIFY( db.version =3D=3D "test_1" );
-+
-+  // Test formatting %z as
-+  auto tz =3D locate_zone("Africa/Bissau");
-+  auto inf =3D tz->get_info(sys_days(1974y/1/1));
-+  VERIFY( inf.abbrev =3D=3D "-01" );
-+
-+  tz =3D locate_zone("Some/Zone");
-+  inf =3D tz->get_info(sys_days(1899y/1/1));
-+  VERIFY( inf.abbrev =3D=3D "+010203" );
-+  inf =3D tz->get_info(sys_days(1955y/1/1));
-+  VERIFY( inf.abbrev =3D=3D "+012345" );
-+
-+  tz =3D locate_zone("Another/Zone");
-+  // Test formatting %s as the LETTER/S field from the active Rule.
-+  inf =3D tz->get_info(sys_days(1910y/January/1));
-+  VERIFY( inf.abbrev =3D=3D "ASZ" );
-+  inf =3D tz->get_info(sys_days(1950y/January/1));
-+  VERIFY( inf.abbrev =3D=3D "ASZ" );
-+  inf =3D tz->get_info(sys_days(1950y/June/1));
-+  VERIFY( inf.abbrev =3D=3D "ADZ" );
-+  inf =3D tz->get_info(sys_days(1999y/January/1));
-+  VERIFY( inf.abbrev =3D=3D "ASZ" );
-+  inf =3D tz->get_info(sys_days(1999y/July/1));
-+  VERIFY( inf.abbrev =3D=3D "ADZ" );
-+  // Test formatting STD/DST according to the active Rule.
-+  inf =3D tz->get_info(sys_days(2000y/January/2));
-+  VERIFY( inf.abbrev =3D=3D "SAZ" );
-+  inf =3D tz->get_info(sys_days(2001y/January/1));
-+  VERIFY( inf.abbrev =3D=3D "SAZ" );
-+  inf =3D tz->get_info(sys_days(2001y/July/1));
-+  VERIFY( inf.abbrev =3D=3D "DAZ" );
-+  // Test formatting %z as the offset determined by the active Rule.
-+  inf =3D tz->get_info(sys_days(2005y/January/2));
-+  VERIFY( inf.abbrev =3D=3D "+01" );
-+  inf =3D tz->get_info(sys_days(2006y/January/1));
-+  VERIFY( inf.abbrev =3D=3D "+01" );
-+  inf =3D tz->get_info(sys_days(2006y/July/1));
-+  VERIFY( inf.abbrev =3D=3D "+02" );
-+
-+  // Test formatting %z, %s and S/D for a Zone with no associated Rules.
-+  tz =3D locate_zone("Strange/Zone");
-+  inf =3D tz->get_info(sys_days(1979y/January/1));
-+  VERIFY( inf.abbrev =3D=3D "XX" ); // No Rule means nothing to use for=
 %s.
-+  inf =3D tz->get_info(sys_days(1981y/July/1));
-+  VERIFY( inf.abbrev =3D=3D "FOO" ); // Always standard time means firs=
t string.
-+  inf =3D tz->get_info(sys_days(1994y/July/1));
-+  VERIFY( inf.abbrev =3D=3D "+02zz" );
-+  inf =3D tz->get_info(sys_days(1995y/July/1));
-+  VERIFY( inf.abbrev =3D=3D "+0009zz" );
-+  inf =3D tz->get_info(sys_days(1996y/July/1));
-+  VERIFY( inf.abbrev =3D=3D "+000807zz" );
-+  inf =3D tz->get_info(sys_days(1997y/July/1));
-+  VERIFY( inf.abbrev =3D=3D "+000606zz" );
-+}
-+
-+int main()
-+{
-+  test_format();
-+}
-diff --git a/libstdc++-v3/testsuite/std/time/tzdb/1.cc b/libstdc++-v3/te=
stsuite/std/time/tzdb/1.cc
-index 796f3a8b4256..7a31c1c20ba7 100644
---- a/libstdc++-v3/testsuite/std/time/tzdb/1.cc
-+++ b/libstdc++-v3/testsuite/std/time/tzdb/1.cc
-@@ -39,11 +39,15 @@ test_locate()
-   const tzdb& db =3D get_tzdb();
-   const time_zone* tz =3D db.locate_zone("GMT");
-   VERIFY( tz !=3D nullptr );
--  VERIFY( tz->name() =3D=3D "Etc/GMT" );
-   VERIFY( tz =3D=3D std::chrono::locate_zone("GMT") );
-   VERIFY( tz =3D=3D db.locate_zone("Etc/GMT") );
-   VERIFY( tz =3D=3D db.locate_zone("Etc/GMT+0") );
-=20
-+  // Since 2022f GMT is now a Zone and Etc/GMT a link instead of vice v=
ersa,
-+  // but only when using the vanguard format. As of 2024a, the main and
-+  // rearguard formats still have Etc/GMT as a Zone and GMT as a link.
-+  VERIFY( tz->name() =3D=3D "GMT" || tz->name() =3D=3D "Etc/GMT" );
-+
-   VERIFY( db.locate_zone(db.current_zone()->name()) =3D=3D db.current_z=
one() );
- }
-=20
---=20
-2.43.5
-
diff --git a/meta/recipes-devtools/gcc/gcc_13.3.bb b/meta/recipes-devtool=
s/gcc/gcc_13.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc_13.3.bb
rename to meta/recipes-devtools/gcc/gcc_13.4.bb
diff --git a/meta/recipes-devtools/gcc/libgcc-initial_13.3.bb b/meta/reci=
pes-devtools/gcc/libgcc-initial_13.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc-initial_13.3.bb
rename to meta/recipes-devtools/gcc/libgcc-initial_13.4.bb
diff --git a/meta/recipes-devtools/gcc/libgcc_13.3.bb b/meta/recipes-devt=
ools/gcc/libgcc_13.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc_13.3.bb
rename to meta/recipes-devtools/gcc/libgcc_13.4.bb
diff --git a/meta/recipes-devtools/gcc/libgfortran_13.3.bb b/meta/recipes=
-devtools/gcc/libgfortran_13.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgfortran_13.3.bb
rename to meta/recipes-devtools/gcc/libgfortran_13.4.bb
--=20
2.49.0


