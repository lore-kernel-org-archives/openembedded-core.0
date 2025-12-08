Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDE8BD3ABEF
	for <webhook@archiver.kernel.org>; Mon,  8 Dec 2025 09:18:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4501.1765185505558543535
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Dec 2025 01:18:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=kMKsfydO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4437ee5a93=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B85cElF792372
	for <openembedded-core@lists.openembedded.org>; Mon, 8 Dec 2025 01:18:25 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=2R9e8RATLhRIEX2pKpq94J
	d1PO0/TnNpU6cV3vd/1Os=; b=kMKsfydOfZh2Q1kKHwcnpC0BreeNDib2Y0dswv
	Rx3rVwzS9fLO7Xv8dTTNo8MQQzev05mByuR0F2z7cK4r4UEV1SpmCODli1YspsRu
	9kMCF8ZpYb3RoE8JttPKGII6ByKxyEM4UFR6PhpatKbdsNMnUCwyRGPxxKlT0aNp
	iyCsVitj6R0/vUTy+VaXyBds42xApfzHQxH0xoVhJqMYe9gt9s670PvoYe136kFF
	dZTZtDzqI6HAeAZSmIoO2t+J3xdHySPGze71n4nHceuekucutOf6QIuoP5HgqyM+
	ga3FDXTrVeDB/NhLRgJz96L6YTlWgEWuKpO+/dQPNKnGuhLg==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010011.outbound.protection.outlook.com [52.101.56.11])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4avmvh96gk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 08 Dec 2025 01:18:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uLVTJpOZxvVs3g3u5TH96OwIclOk1IitHxLXysMbfNewshvByZHGha+w7pT5xOg3jpDbnA3qxm9tY1Uwgjxf2/BBd34a3H6r81Xa9tYUcR+dZ+eaL0hVp+tNPf0Jcpxi4E4nkvq4Vsihfo+X3LxbJLJgnHIDQTswdo/edI+rLuXD4sRctoJlJrdqQn3aVjnm889breT8QVywh8R1w/13c/evePo87j6PCbXH9wjKkHZleMhx4FDuREKaRs3ocNsl8BZOyJ1ykux1jarT3m8hMsghGAKTNvg38mfeK2I7QdHf0xS5ttmPNPn22FENDF417TxhBOVgWxBskzhn5bXUJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2R9e8RATLhRIEX2pKpq94Jd1PO0/TnNpU6cV3vd/1Os=;
 b=B8CwZjX0WldR36RMzoHV0USnxM7Y3FOQEknuNVp6ACYxH6ajA3ubPYBps3sWQDLE54RwyybrIYCdTSl5eWkn6RaWd8uLPMjfK39hH8A1OoBh8NeBHFuY/Vkr+kbuFsRQNQp7vdiys24qvQvw9d7zuLVVgwYn0RtofPzH4kV6o1SrBIh8ABn2k6KFqXdKFd41AKZyOvt4rzVwDAhoIFoYRJDQzsLXSlrn5ttUfhYKXoPZINzLw8tQOIfZmdBGlpLi0z6iE8vU/cGwxF3C/M7nJR51akFb8NMwjv3P2GAzhmh5z3//Dt5pCTTTYFwgCY61dlNlQlubCmHCC4wzU9AZgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 09:18:22 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%4]) with mapi id 15.20.9388.011; Mon, 8 Dec 2025
 09:18:22 +0000
Content-Type: multipart/alternative;
 boundary="------------Gg9XaErQ3CCj1Mm5ZoLHzp06"
Message-ID: <a9ad5699-2bfb-431c-84b5-a72907ba4bb5@windriver.com>
Date: Mon, 8 Dec 2025 17:18:15 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/2] go.bbclass: change GOTMPDIR to improve
 reproducibility
To: alex@linutronix.de
References: <187F32821D48D4AA.919836@lists.openembedded.org>
Content-Language: en-US
Cc: OE-core <openembedded-core@lists.openembedded.org>
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <187F32821D48D4AA.919836@lists.openembedded.org>
X-ClientProxiedBy: SG3P274CA0021.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::33)
 To DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|DM4PR11MB5309:EE_
X-MS-Office365-Filtering-Correlation-Id: 117a0cb8-b99b-4d69-f39d-08de363abb92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|4022899009|376014|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cXNMV21qS1pzMFBaZDQrM2JSemFocElvN3BiWnRDSGdVaThtOEZLbFVQTWI5?=
 =?utf-8?B?Zk9MenNzS3U4d1RQS1paTUlMK0llRFdXNmJ2MVArR1U1V1hsOGFaSUYxb0lX?=
 =?utf-8?B?ekdMVHBWZ1J3OHZKaEVxK0JiREVCRDAzQ0tjU3dGUldXRWNXcW1kOUhNUlh3?=
 =?utf-8?B?L1l2UCtxQWk4WmlJcjBnT1hJYmVSeVF3d3VTYWxCL1hVZVB3amRHTWMyWnI3?=
 =?utf-8?B?K04vYVZjTXBKWUFLb0NhSVNnWXdGM0VqTkZjUFpidEFEdXVvMG50aTBaZHdp?=
 =?utf-8?B?bVZYVm9wZWZybjVDdmxsaEM5YkFRRDlsaTlvV2RYd1hGRVV4bWUrbUdNQzBv?=
 =?utf-8?B?d2hTUTJUdmw1eWdaVks3SEpIeTNMZkJpdGJvS2NiOFpVcFFQU0NTN1htNnBG?=
 =?utf-8?B?MzZ3Tmh3NjZWWnJLdWRjeXhoVHB0bzdZdTNVbElnNytQK05NMFBYTGZFN2k4?=
 =?utf-8?B?L0lINjc3dUJ6NWJQRU4xdmx1N1V1OHBZeWt2V2c2VUx2L3ZmUE1vbVRTOWtu?=
 =?utf-8?B?MzZHQTFiS1RFQ1ByYUZQaHpkS3hoVzJSWEtxUy82dGo3QUJMSjNMWTd3VEsx?=
 =?utf-8?B?dFROOE14RUo5SmN1bmlDb3pJWjVxbG5NY1hickxteTFncXpSUDF0WHVmL0RU?=
 =?utf-8?B?Q3AyVCtPMHJuSVFpNFQzTjhKdlFBZmY3ZCt5NXVKa29mZnE2dmVrdWNVOHJU?=
 =?utf-8?B?ZFFJaWlLSng5SlU2eEl2VXFpdmZZcUo3dWErQUV1SW56aWhoZXJmWDZWNnhV?=
 =?utf-8?B?UFVMRU5NTWMySlhLSW93MFBOalk1UEIvUndEYWZENUFYMVhnNlNyWXlZdmhK?=
 =?utf-8?B?K1NPNVVyS2c3em1lM3VvTllqZUdaSDh5WVhtZS9NNzZUWXZjZGlwN3lwOGht?=
 =?utf-8?B?N1NWSHNRRSswanBkSGo1c3NYTGRaU21uTmdrWDhiTC83Q1hXS3RFcWVRbUx0?=
 =?utf-8?B?elZORXpnbWlxcC9VSDY1RjhkUmNZaHpYZ21pS3Y3TnNHOThrYnZuVlVacGxQ?=
 =?utf-8?B?ekRhN1RoWGJSZk9rMVdZTjZKM1JXNkNqZEp6NWpDNkNYOFFmcUg5dkZXbW5m?=
 =?utf-8?B?S01NNjgzQ3FEcnRuSlN1bG1reG5JSWs3NGJDOWpCUUNOREh3UDJaWjdFY3Nn?=
 =?utf-8?B?WjFEQjFyUVY1NXBUQ0JqQXF0MmFGck1CWG4rcWswR1hneks4S09UenJGVHRJ?=
 =?utf-8?B?bHFlendLZjMxMUliVnErdGtab1ZyYVdIbmdqbTI1SEYwcDJLdmR0T3R3QmNa?=
 =?utf-8?B?RzVTSG9ZaHdkM2E2bGVwamVnZ0MrbWhEdlE5RVlZeDhpVTF6Zzg5YS83eU4z?=
 =?utf-8?B?elM1SytadW1OVEZhMytaMVdjUk1vMFZQNTdLSjFpQXNMMlVxRlBLT1YxUVhr?=
 =?utf-8?B?bmM3d2pqQVphR253SVJOenVqN1RSSUQvL0k0cXJDOE02Z2VvWnpaRFN3emlF?=
 =?utf-8?B?a3FIN1dRNnZDaVFiNjJvYXJlNjl6czdGUVgycnFuWHl6aUdTVk5rVUdGaDgy?=
 =?utf-8?B?cUg4aXE1S1E1ZlZhMFJSK3haOXpCMnlKaWNxbjdyYmE5US9pcFN0SUhDQVF1?=
 =?utf-8?B?ZGVzSnVyN1NKeWFtb2xIcGdTVmtYU0FWeDVpcXlRc0toNWIwWDdpMmI1MkVr?=
 =?utf-8?B?WSsyR0dCWWd3V2lDYnAxZXZJRVdKVGZXbk1HNWd5eDlEdFVpMDNjY2hvZmNH?=
 =?utf-8?B?YXZreFJhNGtOa3NkQVZlaFpHdURVZ0RRaG0vcEVINzRhVWx6SHhtS2xMQVJl?=
 =?utf-8?B?eGNFOEpuU2FUbWUrai9YK21hejFiU0QyM0ZDN2xtb1pNc1Jsak1OMDBsYmxM?=
 =?utf-8?B?cXpidHNJQk9aTEU3QkJ2Wm5YcENqVkRKemRzYUR6S3hEL0pVQzVlTTI3Tndj?=
 =?utf-8?B?V1gvUVhQQnpFN3lPVWtJWFhyMWZtdEErQ3V2Z3pPeW9oTGc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(4022899009)(376014)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cnFNT2dlWG5jWlJjWG14aXNyS0kzc2hIVDhRTGZvMllUZjVXR1MwcmdXZFBz?=
 =?utf-8?B?MlRnK0tQcUFhWUZyTWVzdkZFMjRqY0tpSUxHOGFUUVNLekgzdzh0Tlo5SVZh?=
 =?utf-8?B?M29OUE4reG9uTmxFR3lyQnlPT2Z6dnh5K0FNQlhKZWtCS00rSW8rNjhDUEpC?=
 =?utf-8?B?Zkl4TVg0TG5FWEw0RDZ0ckYrYlVkMTZRU1VvUno4cWtHMk9Yd1A5b2ZWbkxH?=
 =?utf-8?B?cW84ZEhNV2NaK2hBMzB2aG8vOVBwZWdoTUMxTHl0RENVVXdCMlQvcmJGM05R?=
 =?utf-8?B?dUdBQVRMN2VRRVBhSDJRSnBxeHhnQjNyUnhteDNNa29mWi9mSXo0OTMxejRj?=
 =?utf-8?B?NXVVeXFKN25QcW9IVmtDai94ek1ldTJDT2twM3NKL0hscXlkeXRsWmRSNUVk?=
 =?utf-8?B?Rmk0WGsyTStJQ2FMeklNWE03S2FnR2c4UmRlekxlOW9zM2J6cWFDMnFucDc3?=
 =?utf-8?B?Z2IyTHBpVUFBdENqbWo0QlFJbjlTa2VKU3c1RDNDcHhPQnorS01obmlwZWtD?=
 =?utf-8?B?N0FNRzNpQ1NiUStNK3RzUzhhaEJqRERZSXhkMExXNXQ3eURDUzFsUHZKaFIy?=
 =?utf-8?B?cmFlOVRMckVPVDVaOHd4YldGNk1UMGxYd3djejd5VlJaSkZlK2x2V0dQaGph?=
 =?utf-8?B?QzJBTUVtVW9mZ01WUW5vanllajdqUkdrbFpESDBHVit2YVFzTThNZjUxSFhM?=
 =?utf-8?B?Mi9DV0JMcm8wQ05CTjdMK2RGR0tLR2hDMS9wUjFvaW1nVFJTdGoxbkpMdGY3?=
 =?utf-8?B?YWVWaFNvSjN2ZUFtQ2lxS0FMU0xPSURXQnlPek42bEl4bERvWk1pcG1IaFph?=
 =?utf-8?B?RzFPakJBYjFwdWN5aTZUZ1VwNzI0NHFzQTNCWDFuMXlScmtXR1RsampkZWtC?=
 =?utf-8?B?WFB1NktxN1BTSVA3a2RZUGxhTGRKRTJLenVrZTVqd0lOV2NkRGJBN1VnMnZO?=
 =?utf-8?B?cmFqU1kvYlJzeGJmY3dYaUNROWMxRy9Uei9iQThQMVNraXVWVSs4K0ZKN3Nk?=
 =?utf-8?B?Y2ZERm0waWQ2N3R6RFFETE40NEtDay80a3Z2SlV5cFhFUEsvbEFGNnlUTktj?=
 =?utf-8?B?Q2RodDlHNC85OGJHcnVoT2lKa1o1ZklXbkttMVdJU24wc1BEQkR5MUsvaEZr?=
 =?utf-8?B?OHZZRzZESlFwY2pHQzlwNWZoNFFaWlFxUVFiaUt6b2lDaWlPQnZFQVYrV3cw?=
 =?utf-8?B?RE5XV0JMYUdvaXZTVU14blNTcHk5V3F5Ny9XdDJ5aDdjWEU3WE5QRndKeEk5?=
 =?utf-8?B?YldWQmw2NW1NRVJ0ZjJVdERST3ZoZUlnV1hRSWRWSmgrb0RHVUtGSTRNQ1VZ?=
 =?utf-8?B?K1VEZTNBT3JYSkFPQVBpU1ZGVFVNbVdWZWR4WldzT1BHNGQ4WEVGNVB3RFVO?=
 =?utf-8?B?U0JTTE9mWVFUVUJkUUpDUmlGdkVvK25Qb0VqNFhicXRGaS8vblRNTjdkUTd6?=
 =?utf-8?B?OURpWXBFaGYzUmlPK09Id2orYlZlYWNEaEJ3amJ6V0V5a05iUjJUUjNCY0Fu?=
 =?utf-8?B?aTlhbXQxTDJMaEJ4bDNaU01ld1FacFJGN0xidXlnL1RabXNMQ2VXdXNzVS9M?=
 =?utf-8?B?UXowWVpZZUdHYVFadEx2TWxlWWhNVUw5RU81K05HQk5KRTJVcXFZMENhVFJZ?=
 =?utf-8?B?aDkrK2VHM0NYc291Zk13VXBxVlRKSFlhU052WUNUelNUSHIxcGIxRktmclk1?=
 =?utf-8?B?R2g1czhobUY0T3JEem95Kzdkc1ZucFN5LytIaDlnS0crY3J2a1JONTRwVW8w?=
 =?utf-8?B?RUJxd0V4N25tcXpoMDJ3QWh0aHNUbXRnN1FwbUU4bFVDS0tBdzNCQ2NmS05Y?=
 =?utf-8?B?WWFsWWo1SjBPcDVaUFJhV3Q3MGRvaHhxUUNnYStURUxXT1NrOStzL3pwa1gv?=
 =?utf-8?B?OG5XZzQ3TGVoS1ZWbzdoWThIb1BMM0xNbExpL2lZSXhPN21qOGVyakNUVzRZ?=
 =?utf-8?B?V2lkSlNpb2ZaNzBvYzNIRDFZdTIzWmRuSWpOY1phYkIvSVlDalp2U0lNT3Vm?=
 =?utf-8?B?TThaVC9yNnBlNFRrMnBhandleXE5Y01RTkM5cExFSlpWaUg2RlJkdTRROHdQ?=
 =?utf-8?B?QUYyeTRKTUJlNUQ4N0RVcmpqb1owc1BVOER0RDhEL2FmS0NxWGNMREQ3TnU3?=
 =?utf-8?B?YXNZdC9zNUN4NVhFUGZ4a0RKV01DdmRJSHhkeVlVTWlqRURZcFpRaWlxT01u?=
 =?utf-8?B?Rnc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 117a0cb8-b99b-4d69-f39d-08de363abb92
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 09:18:21.9512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SeYkhnALloErWYuk08M9/osg5d4BlXb274QRmHbr1tl8sW/idHDjOpF1rXlWjukpjFrwav2djHtI5Bod/+0nB/ysEZMZocmRukUlFom60C0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5309
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: M0qsTn84UNIpf_NmG55_Sv2d2L8AP9sl
X-Authority-Analysis: v=2.4 cv=be9mkePB c=1 sm=1 tr=0 ts=693697e1 cx=c_pps
 a=zclsoE7mv10+eI8hWvbpiQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pM9yUfARAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8
 a=6T74uEjOK7lLwLut3uYA:9 a=QEXdDO2ut3YA:10 a=UKID7sPLcjWTqBYMaugA:9
 a=cYO_nTj6ZmjPvxVM:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=YH-7kEGJnRg4CV3apUU-:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: A0f-VvwgelzVHou2Wo-mQ1lTruRQQaRN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDA3OCBTYWx0ZWRfX3loaR48MClxS
 E4BMrtJ/tDMrIqcSuMGiMCwJ8/MZ9lOeVOo5NXYEsvldZNYC0+j5I8P6IGUDsQ3C/K6P4zlt06E
 KEDGjWJY+89RxyI01bcSRfCF+lJgv1NSVvuP5tjn8EIrMhiFp2f/wHxT335ODx9ABJANzSFbPOw
 ohY7Hfwngcrr5xWZXcKcjnqb1VBS9DMt4wo8xzs6IXOwG+ruCxFKSPJHfWQ9aHBMFasuxq/4Zc9
 xub0Ghigm0nRqCg9eg0VtLB0pHKGhEDFtE2nkaCD+EjZeGQ/xbQsueBxklrH/nJ0SarYiZVtu85
 hTr+YXHP579NP6HC+rgzngoPle121CLas1aT3fXiWtBilRJWovgBxXKpCGUy78IbVsOE2EeEWK/
 Tp5kBuxsTdzThXNbdcXuKza7Ux9slA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0 impostorscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512080078
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Dec 2025 09:18:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227382

--------------Gg9XaErQ3CCj1Mm5ZoLHzp06
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQpPbiAxMi84LzI1IDE3OjExLCBDaGFuZ3FpbmcgTGkgdmlhIGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcgd3JvdGU6DQo+IEZyb206IENoYW5ncWluZyBMaTxjaGFuZ3FpbmcubGlAd2luZHJp
dmVyLmNvbT4NCj4NCj4gVGhlIEdvIHRvb2xjaGFpbiB3cml0ZXMgdGVtcG9yYXJ5IHNvdXJj
ZSBmaWxlcyB1bmRlciBHT1RNUERJUiBhbmQNCj4gY29tcGlsZXMgdGhlbSB0aGVyZS4gVG8g
c3VwcG9ydCByZXByb2R1Y2liaWxpdHksIEdvIHBhc3NlcyBvcHRpb25zIHN1Y2gNCj4gYXMg
LWZmaWxlLXByZWZpeC1tYXA9JFdPUksvYjM4Nz0vdG1wL2dvLWJ1aWxkIHRvIHRoZSBHQ0Mg
aW5zdGFuY2UgaXQNCj4gaW52b2tlcy4gVGhlIHZhcmlhYmxlIFdPUksgaXMgYSB0ZW1wb3Jh
cnkgZGlyZWN0b3J5IGNyZWF0ZWQgdW5kZXINCj4gR09UTVBESVIsIHJlZmVyIHRoaXMgZXhh
bXBsZToNCj4NCj4gV09SSz0vYnVpbGQvdG1wL3dvcmsveDg2LTY0LXYzLXdycy1saW51eC9i
dWlsZGFoLzEuNDEuNS9idWlsZC10bXAvZ28tYnVpbGQzNzczMjE3NTENCj4gY2QgJFdPUksv
YjM4Nw0KPiBURVJNPSdkdW1iJyB4ODZfNjQtd3JzLWxpbnV4LWdjYyAtbTY0IC1tYXJjaD14
ODYtNjQtdjMgLWZzdGFjay1wcm90ZWN0b3Itc3Ryb25nIC1PMiAtRF9GT1JUSUZZX1NPVVJD
RT0yIC1XZm9ybWF0IC1XZm9ybWF0LXNlY3VyaXR5IC1XZXJyb3I9Zm9ybWF0LXNlY3VyaXR5
IC0tc3lzcm9vdD0vdG1wL3dvcmsveDg2LTY0LXYzLXdycy1saW51eC9idWlsZGFoLzEuNDEu
NS9yZWNpcGUtc3lzcm9vdCAtSSAvdG1wL3dvcmsveDg2LTY0LXYzLXdycy1saW51eC9idWls
ZGFoLzEuNDEuNS9zb3VyY2VzL2J1aWxkYWgtMS40MS41L3NyYy9naXRodWIuY29tL2NvbnRh
aW5lcnMvYnVpbGRhaC92ZW5kb3IvZ2l0aHViLmNvbS9wcm9nbG90dGlzL2dwZ21lIC1mUElD
IC1tNjQgLXB0aHJlYWQgLVdsLC0tbm8tZ2Mtc2VjdGlvbnMgLWZtZXNzYWdlLWxlbmd0aD0w
IC1mZmlsZS1wcmVmaXgtbWFwPSRXT1JLL2IzODc9L3RtcC9nby1idWlsZCAtZ25vLXJlY29y
ZC1nY2Mtc3dpdGNoZXMgLXYgLURfRklMRV9PRkZTRVRfQklUUz02NCAtSSAkV09SSy9iMzg3
LyAtTzIgLWcgLWZmaWxlLXByZWZpeC1tYXA9L3RtcC93b3JrL3g4Ni02NC12My13cnMtbGlu
dXgvYnVpbGRhaC8xLjQxLjUvc291cmNlcy9idWlsZGFoLTEuNDEuNT0vdXNyL3NyYy9kZWJ1
Zy9idWlsZGFoLzEuNDEuNSAtZmZpbGUtcHJlZml4LW1hcD0vdG1wL3dvcmsveDg2LTY0LXYz
LXdycy1saW51eC9idWlsZGFoLzEuNDEuNS9idWlsZD0vdXNyL3NyYy9kZWJ1Zy9idWlsZGFo
LzEuNDEuNSAtZmZpbGUtcHJlZml4LW1hcD0vdG1wL3dvcmsveDg2LTY0LXYzLXdycy1saW51
eC9idWlsZGFoLzEuNDEuNS9yZWNpcGUtc3lzcm9vdD0gLWZmaWxlLXByZWZpeC1tYXA9L3Rt
cC93b3JrL3g4Ni02NC12My13cnMtbGludXgvYnVpbGRhaC8xLjQxLjUvcmVjaXBlLXN5c3Jv
b3QtbmF0aXZlPSAtcGlwZSAtdiAtZmZpbGUtcHJlZml4LW1hcD0vdG1wL3dvcmsveDg2LTY0
LXYzLXdycy1saW51eC9idWlsZGFoLzEuNDEuNS9zb3VyY2VzL2J1aWxkYWgtMS40MS41L3Ny
Yy9naXRodWIuY29tL2NvbnRhaW5lcnMvYnVpbGRhaC92ZW5kb3I9L18vdmVuZG9yIC1mcmFu
ZG9tLXNlZWQ9VFprU1BWU0JVdkRNamc0d0tqV1MgLW8gJFdPUksvYjM4Ny9feDAwNC5vIC1j
IHVuc2V0X2FnZW50X2luZm8uY2dvMi5jDQo+DQo+IE9FIGFsc28gcGFzc2VzIGl0cyBvd24g
REVCVUdfUFJFRklYX01BUCB0byBHQ0MoZmluYWxseSBieSBDR09fQ0ZMQUdTKSwNCj4gaW5j
bHVkaW5nIC1mZmlsZS1wcmVmaXgtbWFwPSR7Qn09JHtUQVJHRVRfREJHU1JDX0RJUn0sIHdo
ZXJlIEIgaXMNCj4gJHtXT1JLRElSfS9idWlsZC4gQmVjYXVzZSBHT1RNUERJUiBkZWZhdWx0
cyB0byAke1dPUktESVJ9L2J1aWxkLXRtcCwgdGhlDQo+IEdvIHRlbXBvcmFyeSBkaXJlY3Rv
cnkgbG9va3MgbGlrZSAke1dPUktESVJ9L2J1aWxkLXRtcC9nby1idWlsZFhZWi4gSXRzDQo+
IHByZWZpeCB0aGVyZWZvcmUgYmVnaW5zIHdpdGggJHtXT1JLRElSfS9idWlsZCwgc28gR0ND
IG1hdGNoZXMgdGhlDQo+IERFQlVHX1BSRUZJWF9NQVAgZW50cnkgZm9yICR7Qn0gZmlyc3Qu
DQo+DQo+IEFzIGEgcmVzdWx0LCBhIHBhdGggc3VjaCBhcyAke1dPUktESVJ9L2J1aWxkLXRt
cC9nby1idWlsZFhZWiBpcw0KPiByZXdyaXR0ZW4gdG8gJHtUQVJHRVRfREJHU1JDX0RJUn0t
dG1wL2dvLWJ1aWxkWFlaLiBUaGlzIGJyZWFrcyB0aGUNCj4gLWZmaWxlLXByZWZpeC1tYXAg
b3B0aW9uIHRoYXQgR28gaXRzZWxmIGFkZHMsIGJlY2F1c2UgdGhlIG9yaWdpbmFsIFdPUksN
Cj4gcGF0aCBubyBsb25nZXIgbWF0Y2hlcyB0aGUgdmFsdWUgR28gZXhwZWN0cy4gU2luY2Ug
R28gY3JlYXRlcw0KPiBnby1idWlsZFhZWiBkaXJlY3RvcmllcyByYW5kb21seSBhbmQgaW50
ZXJuYWxseSwgdGhpcyBjYXVzZXMgdGhlIGJ1aWxkDQo+IG5vbi1yZXByb2R1Y2libGUuDQo+
DQo+IFRoaXMgcGF0Y2ggY2hhbmdlcyBHT1RNUERJUiBmcm9tICR7V09SS0RJUn0vYnVpbGQt
dG1wIHRvDQo+ICR7V09SS0RJUn0vZ28tYnVpbGQtdG1wIHNvIHRoYXQgdGhlIHBhdGggbm8g
bG9uZ2VyIG1hdGNoZXMgJHtCfS4gVGhpcw0KPiBwcmV2ZW50cyB1bmludGVuZGVkIHJlcGxh
Y2VtZW50cyBieSBPRSdzIERFQlVHX1BSRUZJWF9NQVAgYW5kDQo+IHJlc3RvcmVzIHJlcHJv
ZHVjaWJpbGl0eS4NCj4NCj4gU2lnbmVkLW9mZi1ieTogQ2hhbmdxaW5nIExpPGNoYW5ncWlu
Zy5saUB3aW5kcml2ZXIuY29tPg0KPiAtLS0NCj4gICBtZXRhL2NsYXNzZXMtcmVjaXBlL2dv
LmJiY2xhc3MgfCAyICstDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9tZXRhL2NsYXNzZXMtcmVjaXBlL2dv
LmJiY2xhc3MgYi9tZXRhL2NsYXNzZXMtcmVjaXBlL2dvLmJiY2xhc3MNCj4gaW5kZXggZTBm
NjY3MzczZS4uZWQ5ODZmZjVkNCAxMDA2NDQNCj4gLS0tIGEvbWV0YS9jbGFzc2VzLXJlY2lw
ZS9nby5iYmNsYXNzDQo+ICsrKyBiL21ldGEvY2xhc3Nlcy1yZWNpcGUvZ28uYmJjbGFzcw0K
PiBAQCAtNzksNyArNzksNyBAQCBCID0gIiR7V09SS0RJUn0vYnVpbGQiDQo+ICAgZXhwb3J0
IEdPUEFUSCA9ICIke0J9Ig0KPiAgIGV4cG9ydCBHT0VOViA9ICJvZmYiDQo+ICAgZXhwb3J0
IEdPUFJPWFkgPz89Imh0dHBzOi8vcHJveHkuZ29sYW5nLm9yZyxkaXJlY3QiDQo+IC1leHBv
cnQgR09UTVBESVIgPz0gIiR7V09SS0RJUn0vYnVpbGQtdG1wIg0KPiArZXhwb3J0IEdPVE1Q
RElSID89ICIke1dPUktESVJ9L2dvLWJ1aWxkLXRtcCINCg0KSGksIEFsZXgNCg0KSW4gdGhl
IGZvbGxvd2luZyBwYXRjaCwgeW91IHNhaWQgIkFkZGl0aW9uYWxseSwgdGhlIHRvcCBsZXZl
bCBidWlsZCANCmRpcmVjdG9yeSBjYW5ub3QgYmUgbmFtZWQgJ2dvLXNvbWV0aGluZycuIg0K
DQpodHRwczovL2dpdC5vcGVuZW1iZWRkZWQub3JnL29wZW5lbWJlZGRlZC1jb3JlL2NvbW1p
dC8/aWQ9OTk4NWIxN2EzMGJiOWI5ZjFiYzgyYTQ0NjYyNjg3ZGI1Y2VhZDY2ZQ0KDQpDYW4g
eW91IGhlbHAgdG8gZXhwbGFpbiB3aHkgaXQgY2Fubm90IGJlIG5hbWVkICdnby1zb21ldGhp
bmcnP8KgIA0KImdvLWJ1aWxkLXRtcCIgd29ya3Mgd2VsbCBpbiBteSBlbnYuwqAgaWYgaXQg
Y2Fubm90IGJlIG5hbWVkDQoNCmFzICJnby1zb21ldGhpbmciLMKgIGhvdyBhYm91dCAiZ29i
dWlsZC10bXAiPw0KDQpUaGFua3MNCg0KQ2hhbmdxaW5nDQoNCj4gICBHT1RNUERJUlt2YXJk
ZXB2YWx1ZV0gPSAiIg0KPiAgIA0KPiAgIEdPX1NSQ1VSSV9ERVNUU1VGRklYID0iJHtAb3Mu
cGF0aC5qb2luKG9zLnBhdGguYmFzZW5hbWUoZC5nZXRWYXIoJ1MnKSksICdzcmMnLCANCj4g
ZC5nZXRWYXIoJ0dPX0lNUE9SVCcpKSArICcvJ30iDQo+DQo+IC09LT0tPS09LT0tPS09LT0t
PS09LT0tDQo+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlz
IGdyb3VwLg0KPiBWaWV3L1JlcGx5IE9ubGluZSAoIzIyNzM4MCk6aHR0cHM6Ly9saXN0cy5v
cGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvbWVzc2FnZS8yMjczODANCj4g
TXV0ZSBUaGlzIFRvcGljOmh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tdC8xMTY2
NzMwNjYvMzYxNjg3Mw0KPiBHcm91cCBPd25lcjpvcGVuZW1iZWRkZWQtY29yZStvd25lckBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFVuc3Vic2NyaWJlOmh0dHBzOi8vbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL3Vuc3ViIFtjaGFuZ3FpbmcubGlA
d2luZHJpdmVyLmNvbV0NCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4NCg==
--------------Gg9XaErQ3CCj1Mm5ZoLHzp06
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#cceed0">
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 12/8/25 17:11, Changqing Li via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:187F32821D48D4AA.919836@lists.ope=
nembedded.org">
      <pre wrap=3D"" class=3D"moz-quote-pre">From: Changqing Li <a class=3D=
"moz-txt-link-rfc2396E" href=3D"mailto:changqing.li@windriver.com">&lt;chan=
gqing.li@windriver.com&gt;</a>

The Go toolchain writes temporary source files under GOTMPDIR and
compiles them there. To support reproducibility, Go passes options such
as -ffile-prefix-map=3D$WORK/b387=3D/tmp/go-build to the GCC instance it
invokes. The variable WORK is a temporary directory created under
GOTMPDIR, refer this example:

WORK=3D/build/tmp/work/x86-64-v3-wrs-linux/buildah/1.41.5/build-tmp/go-buil=
d377321751
cd $WORK/b387
TERM=3D'dumb' x86_64-wrs-linux-gcc -m64 -march=3Dx86-64-v3 -fstack-protecto=
r-strong -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dfor=
mat-security --sysroot=3D/tmp/work/x86-64-v3-wrs-linux/buildah/1.41.5/recip=
e-sysroot -I /tmp/work/x86-64-v3-wrs-linux/buildah/1.41.5/sources/buildah-1=
.41.5/src/github.com/containers/buildah/vendor/github.com/proglottis/gpgme =
-fPIC -m64 -pthread -Wl,--no-gc-sections -fmessage-length=3D0 -ffile-prefix=
-map=3D$WORK/b387=3D/tmp/go-build -gno-record-gcc-switches -v -D_FILE_OFFSE=
T_BITS=3D64 -I $WORK/b387/ -O2 -g -ffile-prefix-map=3D/tmp/work/x86-64-v3-w=
rs-linux/buildah/1.41.5/sources/buildah-1.41.5=3D/usr/src/debug/buildah/1.4=
1.5 -ffile-prefix-map=3D/tmp/work/x86-64-v3-wrs-linux/buildah/1.41.5/build=
=3D/usr/src/debug/buildah/1.41.5 -ffile-prefix-map=3D/tmp/work/x86-64-v3-wr=
s-linux/buildah/1.41.5/recipe-sysroot=3D -ffile-prefix-map=3D/tmp/work/x86-=
64-v3-wrs-linux/buildah/1.41.5/recipe-sysroot-native=3D -pipe -v -ffile-pre=
fix-map=3D/tmp/work/x86-64-v3-wrs-linux/buildah/1.41.5/sources/buildah-1.41=
.5/src/github.com/containers/buildah/vendor=3D/_/vendor -frandom-seed=3DTZk=
SPVSBUvDMjg4wKjWS -o $WORK/b387/_x004.o -c unset_agent_info.cgo2.c

OE also passes its own DEBUG_PREFIX_MAP to GCC(finally by CGO_CFLAGS),
including -ffile-prefix-map=3D${B}=3D${TARGET_DBGSRC_DIR}, where B is
${WORKDIR}/build. Because GOTMPDIR defaults to ${WORKDIR}/build-tmp, the
Go temporary directory looks like ${WORKDIR}/build-tmp/go-buildXYZ. Its
prefix therefore begins with ${WORKDIR}/build, so GCC matches the
DEBUG_PREFIX_MAP entry for ${B} first.

As a result, a path such as ${WORKDIR}/build-tmp/go-buildXYZ is
rewritten to ${TARGET_DBGSRC_DIR}-tmp/go-buildXYZ. This breaks the
-ffile-prefix-map option that Go itself adds, because the original WORK
path no longer matches the value Go expects. Since Go creates
go-buildXYZ directories randomly and internally, this causes the build
non-reproducible.

This patch changes GOTMPDIR from ${WORKDIR}/build-tmp to
${WORKDIR}/go-build-tmp so that the path no longer matches ${B}. This
prevents unintended replacements by OE's DEBUG_PREFIX_MAP and
restores reproducibility.

Signed-off-by: Changqing Li <a class=3D"moz-txt-link-rfc2396E" href=3D"mail=
to:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 meta/classes-recipe/go.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/go.bbclass b/meta/classes-recipe/go.bbclas=
s
index e0f667373e..ed986ff5d4 100644
--- a/meta/classes-recipe/go.bbclass
+++ b/meta/classes-recipe/go.bbclass
@@ -79,7 +79,7 @@ B =3D &quot;${WORKDIR}/build&quot;
 export GOPATH =3D &quot;${B}&quot;
 export GOENV =3D &quot;off&quot;
 export GOPROXY ??=3D <a class=3D"moz-txt-link-rfc2396E" href=3D"https://pr=
oxy.golang.org,direct">&quot;https://proxy.golang.org,direct&quot;</a>
-export GOTMPDIR ?=3D &quot;${WORKDIR}/build-tmp&quot;
+export GOTMPDIR ?=3D &quot;${WORKDIR}/go-build-tmp&quot;</pre>
    </blockquote>
    <p>Hi, Alex</p>
    <p>In the following patch, you said &quot;Additionally, the top level
      build directory cannot be named 'go-something'.&quot;<br>
    </p>
    <p><a class=3D"moz-txt-link-freetext" href=3D"https://git.openembedded.=
org/openembedded-core/commit/?id=3D9985b17a30bb9b9f1bc82a44662687db5cead66e=
">https://git.openembedded.org/openembedded-core/commit/?id=3D9985b17a30bb9=
b9f1bc82a44662687db5cead66e</a></p>
    <p>Can you help to explain why it cannot be named 'go-something'?&nbsp;=
 &quot;<span style=3D"white-space: pre-wrap">go-build-tmp</span>&quot; work=
s well in
      my env.&nbsp; if it cannot be named</p>
    <p>as &quot;go-something&quot;,&nbsp; how about &quot;gobuild-tmp&quot;=
? <br>
    </p>
    <p>Thanks</p>
    <p>Changqing<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:187F32821D48D4AA.919836@lists.ope=
nembedded.org">
      <pre wrap=3D"" class=3D"moz-quote-pre">
 GOTMPDIR[vardepvalue] =3D &quot;&quot;
=20
 GO_SRCURI_DESTSUFFIX =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto=
:${@os.path.join(os.path.basename(d.getVar('S')),'src',d.getVar('GO_IMPORT'=
))+'/'}">&quot;${@os.path.join(os.path.basename(d.getVar('S')), 'src', d.ge=
tVar('GO_IMPORT')) + '/'}&quot;</a>
</pre>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre wrap=3D"" class=3D"moz-quote-pre">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#227380): <a class=3D"moz-txt-link-freetext" href=3D"htt=
ps://lists.openembedded.org/g/openembedded-core/message/227380">https://lis=
ts.openembedded.org/g/openembedded-core/message/227380</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.o=
penembedded.org/mt/116673066/3616873">https://lists.openembedded.org/mt/116=
673066/3616873</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openembed=
ded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openem=
bedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.opene=
mbedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/ope=
nembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D"mai=
lto:changqing.li@windriver.com">changqing.li@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
  </body>
</html>

--------------Gg9XaErQ3CCj1Mm5ZoLHzp06--

