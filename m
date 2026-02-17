Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D055E909AF
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 14:24:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13051.1771338282891542665
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Feb 2026 06:24:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=UMaz8H+s;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6508241ff4=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HBowAD3358400
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 06:24:42 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=UJZ27WCd0MMA1EQPP/Hebz
	w3Z6eglNUI7OX9Pj/pdC0=; b=UMaz8H+sMw1krQSxtvzw5ulV7DJhw/PQrg/z1g
	M4KyjZc8K/4lNgxqFNIxEtf7J09q6UDefIOgGwu51c2WTITg3fm+6/2UgsI78MnT
	sMd2Hpx5PyobprLkcFUbxwjrZyPgM9dQsXqPbMFX8rxuhutITwxbUtf4esdq+dGn
	BW9OT9PoxyJdTcDtR4L9cibZRnCqjyCsCroM8JRmJEXZWmMbGYdScgigyUmI7orE
	Hw1+DBV7XEW22jOwfevunYK2lnvKOzGJcurjO278qT4esNxu1/HKWXyuTdk7Tbec
	5KzJh/UM9FcWjSN3UThGMLoUhETT0y/Q3O91UTkgHMGvqjJg==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013040.outbound.protection.outlook.com [40.93.201.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ccbam0kxt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 06:24:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c5f0MSKLO3EeJIiV9T9p/g/YoEezEwanUQ+12ZBjevon3Bi938+gBussnrJ5T7VqtP66j+UWvzuN774P0N2MXRvC6BuCGgMNRqA8fNufe5A11KhCzlSUnBQDeHnAHMzymr5snqWhv3vhmYuXo9ZrxQrQGfVI2PAz4atQWxbHz/58SG0tG7aOPkqhj4m1rPJx2fGujRkQpearAFzAViqRgSEbA0zO5hAGOa4lP3fn8Cl+fwDPzEBGDPQTDCL3i4fGRZ5XLm2zW1O0k6OWxiT2sKlovMjDv/3WXEvEvDuozTfkzyZOrVyLKINfxO6PCcU6fEXgwxQ3Ym/8k9fWoqeuGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UJZ27WCd0MMA1EQPP/Hebzw3Z6eglNUI7OX9Pj/pdC0=;
 b=QFlsM3ibGgitwY3iOCXQoBuYgSF2M/UozqD5fIkb0ntrnMOAX1Odh98wreX06IOkPoLR/DaIT53VP1C1TOUK6DaAb0WoryTmS19a2IQ030pmmTyxr7r8WRVnx8XI50G6AEdti5rzXUhtEUhXvn68NifffIzxGB5rBVP2OSU0SNkeQTR7ZexNGduwHRNgaeXB+vOLQP/RvZ7plju6/6mudTECLX/NY2F3O5dGUffiiS4NqW/oC/vGELpgJsno4MmKfJeaCSoB4IywQ83Xvxh79QL90y2UZP5JP/iaFolYmWOBhuGmg5ea0eBLiXmqlyHPnJSVIRRSos2c1uJ8lsfNmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by LV8PR11MB8559.namprd11.prod.outlook.com (2603:10b6:408:1e6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 14:24:39 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%6]) with mapi id 15.20.9611.013; Tue, 17 Feb 2026
 14:24:38 +0000
Content-Type: multipart/alternative;
 boundary="------------Fk0v10H8qQJjP3zmOoNEckDu"
Message-ID: <5f3097df-5e24-41f8-9293-db01248e383c@windriver.com>
Date: Tue, 17 Feb 2026 09:24:36 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] rust: Enable dynamic linking with llvm
To: SunilKumar.Dora@windriver.com, openembedded-core@lists.openembedded.org
References: <20260212165035.1806068-1-sunilkumar.dora@windriver.com>
 <D0F37E52-3E1F-4477-932A-02BEDB07AE2A@arm.com>
 <675892.1771012298240808740@lists.openembedded.org>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <675892.1771012298240808740@lists.openembedded.org>
X-ClientProxiedBy: BY5PR16CA0036.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::49) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|LV8PR11MB8559:EE_
X-MS-Office365-Filtering-Correlation-Id: 88683146-676a-4f18-e079-08de6e304872
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|1800799024|376014|366016|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YmNYeFVxemoyMXNXa3REQlhlMElaaTJiYk1odjgzRUJUdnUzYWVLRDRFNFZN?=
 =?utf-8?B?UGdoWWFza0VtT2JZU3B0M0M0dE9TQnZVdUttc3pFVzNaem1CTHU1cllIUDdj?=
 =?utf-8?B?YkF5OXpNVzdTV3pER09LMW8zQmVYUzQrVUZFWWxiRnd3Z0RzSE40MFNyRkNi?=
 =?utf-8?B?TE5idElScFBCdDZJZjFYSlozNkpTcFBXdytnYmZ6aVVlZGpDWEMrVldZNTVC?=
 =?utf-8?B?a0FzTm5jVjg1NHovYURWcWdxeDRBaFRPRXZvTHBXTmtLZDViZEZWeVpuZzlu?=
 =?utf-8?B?N1NSTEI5TnBvMVhrYzg3NXdhQy9GRTBHMDVaL1RPWkt2VHJKY3ZmRmE3V1ZO?=
 =?utf-8?B?Q0Y5U3BycmlsbmRJYUtXT1BWNTNQemxpTy9zV3k2TGN5ZW5CQTI0WTNRbG5G?=
 =?utf-8?B?NkIvMUluSnJ5UGZTZ0VYeDFQb1NlcGJPMjVXWDN6UUlZYlhrTm80SW13OVVO?=
 =?utf-8?B?Q1NsUFRrQm4vYzdiSk9FTjR6aCtFRjJlTllpazhoWHhEdjIzSmRaM00zRUFw?=
 =?utf-8?B?TVROVjNZK1V6TTBxZFZCeFh0dzE2RVU1R3JobUppRnRVd2VyUFE0ZGZ1Lzdr?=
 =?utf-8?B?N2NrS3RhQXVlVFh2RTZHVFc2N2dFS1FTRHZJNnBSVGgvWEZYTUE5NG1sVzhZ?=
 =?utf-8?B?RVNpWTdRbXljaWZ5MDVMRU9YVzFoZWFBSkkwMmsybUswSXdjR1FVd3hwaXFi?=
 =?utf-8?B?VVI5NWhla0IzVGZnSGdnS1JDWjlHeFJRNzdjUkRrZXp3NVBPT3g1ZkNibWxh?=
 =?utf-8?B?MUlMK2ZTZ2dmcEJncmtMWk0ybW8xNmdIUWtpRFFHcTFkT0kwTGhUVUZjWEZO?=
 =?utf-8?B?ZW1NUnhyNytFRDdmK0VkbFh6Wi80Q25WOTY0UjdPY3BjSUp3YjE4TW1ucTFF?=
 =?utf-8?B?NmovTEdPMHNQTVlmTW9EcWFVeTFvUzB0QUttWFpqek1HS2FlYkl1VCsrVm5O?=
 =?utf-8?B?MDkrV3RGOXMvaS9SOE9VVlFrSmsrTnVQNnFVM1RyYzJtdU9sWkpzY2xMdWxC?=
 =?utf-8?B?eWIvM2N3TlhDTXlQR0hNSTNlUmgwU2MrSFF3YXlLb1VHSDBXY3RoTFhtc0dt?=
 =?utf-8?B?OXFWWFRzaDN2VTROenBpSCtyZUhYc05kTWRHRVc3VXFNdGhnbms3aXJpVG9i?=
 =?utf-8?B?RFY3U3lvU2NjYkI1V1dSdHRNSEIrdXRmYVlkRVFFVHRwREkwNWozejVlakFs?=
 =?utf-8?B?ZGh0a3JQbWNEUnhNOWwrT0pWTUJoaWFlZ2phMHdsRG1KU2Y0enBockdWM0pZ?=
 =?utf-8?B?VlUwUkIrOVczZjNzQzhXMFlzRXdnUmowV09wM0Q4UHJYS2hoVk1WTmQzbGtu?=
 =?utf-8?B?cmcra3RHMmYrRmdNTDFOcU1IVXlTaVhoMWFjc09JQjMyWXJlVWpGTjU2cXNG?=
 =?utf-8?B?enpDbENSMmJzaHhkL25XODYyd2plM3lkRThuSmlzT1Z0UzdlRjUzZ1hGbmVv?=
 =?utf-8?B?NVZDVXZ6ZXN0ck1heC9BWU1YeUJkMkpYTU1KaTJ4SVF3SzZvdDJYc1hOSVFK?=
 =?utf-8?B?Q0d1VTh0Tm1rV2FGQ0hRdTJTcG1wbXF6aHRHTmRJQ0J2NGFVVnVVekZjK0th?=
 =?utf-8?B?RDBRaVk2N1kweDM5aUpOaVA2cXRXMjZwTi9kU0x2TXZuZm5ORzhvLzkrTUdx?=
 =?utf-8?B?L3IxbkZvZ0IxdTFrR1J1N1JBZnZuU3RSRSsyUlV4V1hHM0JwamRucWFMTk1t?=
 =?utf-8?B?a2s0cmN0bXYzRml0MXhzaTVqZmNxM1VkQmlka3VWSTVuMCtLMjR5eU9WWUpJ?=
 =?utf-8?B?ZmhxOGluV1hvWVlZSzVrTmZwR0ZOZFFFMkZEQlFQZldXcWNIbGpwVmQ3dllx?=
 =?utf-8?B?dXBsUkFaT1RXM2s1aHNST1NEdU9sVDlZa3BUTGg1MGxqTGpyYlozUFoxRlNr?=
 =?utf-8?B?aXRkN3RmVXFBcjV1ay9XTlV0ZDduMTFzY0I0OHZsR2FKM0VMQmJjdHViS1BK?=
 =?utf-8?B?aUp4MCtMN1J5YWRZdC9HOXhySU1WQXl1RjNGaHd2dldnSXlJSFRiVkxlM3FX?=
 =?utf-8?B?Y3lDamJLb2MrcW9FcGcvcGZ1S2JVM1dBMHpRL2JKU3lxNzU1aGg0TGViVnNy?=
 =?utf-8?Q?qqmH6r?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(376014)(366016)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MDY2WUhTbTlWZm90YkIwUEM5ajMwbG10dk05WFRzaGF4bXFMOXB2TC9vM3My?=
 =?utf-8?B?dEdrMXZzSEJTZkNETG5TZHIyWnNrbmVNSEhrNFJXRy9wcmNtK0pkT0xMZG04?=
 =?utf-8?B?d1g2dGZzOU56WXh3R2gwRVk2ai9GOVhMMWYzek94eER1OEQ0RnkwL1dTcVdt?=
 =?utf-8?B?cGtJWmlxa3oyS21mTFpjemNVVW5ZTVlOcjN2ekNyemkweUVGemJrSUxUZ1I1?=
 =?utf-8?B?TWZ5REhsc3hhaGw0RFhpYUNDbXZ1RFl2Z3hLZDFQTmlSdkhJOVpLNXlFWk9L?=
 =?utf-8?B?ZXE2azdKMzlrTFFzM0NnamJJeWFESDNneHREbzRGVnVKYXd6dTRmemxiSk4x?=
 =?utf-8?B?U0RZNDhMdy80UUNNUCtIZEVYTWltTDk5bDFzQWFOck1uLzhHbGFYSUI1VWdn?=
 =?utf-8?B?UVpsRG5sR1ptU01WQUxKVjQzdzBSUStvOWdxQS9pS0g4VVpUekMvVU5aV2hh?=
 =?utf-8?B?elJod3NIdmtMenRoOTQrU2RKNmdvRXQxbk5YV0JMaTY2UXVhTkpMMCtHa3Rk?=
 =?utf-8?B?Z00rYjVKUUJsV3gwT3BRa2lobE1iVDV0SHlvSWk4dGNhRnIzSVM2N2d0QUZ6?=
 =?utf-8?B?UGlTdTFaVzdjRWU1bWRobzFDdkMzbnNyazVJRXI4eDBsczhDaE1WUW1sVGxn?=
 =?utf-8?B?eGthQW1ZcGlSbXRTNU9BOFoyQ2lPbTNiRXBUZDFlMUtRVllSVkNzN3dBajhO?=
 =?utf-8?B?ZVAwMlhMRXdqZTJOSHFYbDhCSXhnQ0Z6Z1Qzbk1hTnpzcGo0TkdVQzhRT3NO?=
 =?utf-8?B?WnlHcXRBVVRSSHE1bHMxM0xtUUEraGdGR2JVbFV3VWIrNThXZGQrWGVNaGhm?=
 =?utf-8?B?OHAvaU5RME9JNEhVWGRlSWpiZXZUZ1hPZFpzL0Z3VGs0d0xxN1pJRytJazJL?=
 =?utf-8?B?S2tYVnlNTmh4WTFZeHBKWFg2UEVjMWNtcCtZNnFsOHh3UWU5Vis1T01najJ0?=
 =?utf-8?B?VUEvREpaZkQ2RDh5WkpTWG5Lc3lVK2lkeDdMVVgyUXowdlQ0d2U0SGx6ZDVl?=
 =?utf-8?B?VXhoeUJ2cnoxdEg5d2ZPbmY3S3BiNzNCNDdvMThKakp6MnFvZG13NzRtSlhM?=
 =?utf-8?B?bnRhc0VwVHN3U2tKVG5QTDdCbW1WUmx6OU5jdWVJMFliM2p6RllCYXdpQk5I?=
 =?utf-8?B?aTJaM2VKZ1g0T05PdWZNQytVMGN6d2dUN3h5Ullkc3k2VUt1MzFKZEQwTFFJ?=
 =?utf-8?B?NEw5NXdkOG1neTd2Vk1JMGs4UTEvOUI5Y3A0bmdlVXo4VEl4eDVyc2ZHOUk4?=
 =?utf-8?B?cXlNMlEwRkN3TURzaGNNZU8vY0xJeTRSczhteGVWU241aENRMUtHZ1pTTFdh?=
 =?utf-8?B?QVlBK3B4Tm41bVVaWU02MHZBcVFEV2Jvdi9GeXBqRXhZVE1lcnlVZFF3Qmpj?=
 =?utf-8?B?ZU1IS0MyTDlmZkxFcFgzTFY4L2FKY1EwU2FPNmt6RUQ0aSt2TXI4d3dtV01r?=
 =?utf-8?B?ZmVWd3JLOTZiTCtidXc0R3dGKzFJN0tNRDhpK2RLdDYyWFFYNUJFTzF6N0FJ?=
 =?utf-8?B?Z3R6ZW5pVUZ0SkdGUHJvMVMzVDZ6WG5ORVJpN1hzRjU3dm5xbHpZM3lPdDM1?=
 =?utf-8?B?cnlNazNvK1ZNNW0rVjNxZVRqQUUxdVpYNHV3VmdGMlB2bHpwNnpCN0F6dHZ2?=
 =?utf-8?B?cUpTMnhGYTFveXZoVXIzeStWeFFGRjNPbUErQm1DNDE4WDdTdlMvZDV2dTRF?=
 =?utf-8?B?TDB5ZkRzc2pKWmd2dXlvRWFWclRaSExOS1NNZnlib2dLUWlXd3BzQ09DRkFk?=
 =?utf-8?B?ZFY3bGFzRDB3cXNEeDlJdCtFbXkxM2lZaFRYR1k3K2ZLZThMTGxmODBsL28w?=
 =?utf-8?B?b29mdlVDOGJyaUFiZUUxbjRMWjZoZjN5NU8veVA2T3BPOEhDdXRIQk1sUzg2?=
 =?utf-8?B?bVF6Z2RCWElJckRRN2Rwb1I4T3pWc05Tdnl0azJHMzN4byswb2tzUEk3MFRt?=
 =?utf-8?B?cE5KeTdzUTFTM2hXV09ON3lLZ2c1b1lDc3pDWmVrUDdrb3BHQTU5V1FTY1cz?=
 =?utf-8?B?V1I5em52cWNKN2xkYkFkZWxCckVBdmErenpHRENnQlRrM2lPOWIrY3V6OS8r?=
 =?utf-8?B?RE95WVpqTnlCTGc0ejlWVFZ0YzlybnVHTzM0T0JzOHo0dkFQUGtxb2cxVVp0?=
 =?utf-8?B?dUEvY1ZOZWNQZVY0MW9FTXpTYXV0azBJNEJpTHZRai9FMVRXQTljM3ZCT0NO?=
 =?utf-8?B?NGlSb2lhZmN6UkgyVEJEK3pwYzB6UHlkckVYajgvSjBzNEJueGoyZmlxeDMv?=
 =?utf-8?B?UnJVMUdJUjhYWXFMV09aYU5XRWdzcDlJZ0dlUm5oK21aYmxJM21EQ0dianRD?=
 =?utf-8?B?SFNRWWVaSnV3NTV5Z25BRzV3WFFWNkJhQWQ2UExqSTM1Mm5IaVVnQS9BMG8w?=
 =?utf-8?Q?Ia/neuFfi7cDqDVE=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88683146-676a-4f18-e079-08de6e304872
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 14:24:38.7769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ftw29cmvrTUt1JVDrNsICZ4RP7eStW9B2znjCQ992VPC9RITGS8Cz9jzlvk9EusRZ2qTlZs/Y/aaxAjB/utLKW4VPiSeHQy1WwzeJr1O0jI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8559
X-Authority-Analysis: v=2.4 cv=JauxbEKV c=1 sm=1 tr=0 ts=69947a2a cx=c_pps
 a=5XLVA79qUcMA6Bnn+7FYtQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=GRp3fRZRe9pCZssmsxwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=UUBQlyFAtrJFM-R4rckA:9 a=c6c-H2mvf8u_e68X:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDExNSBTYWx0ZWRfX2fqNnJYx6PK6
 f0LHrDfO94+ZdBNZYKRTZkZ2EkQEvKKLjmWpcE6XSSo86el/a3dYI2zWBrL9SMNH1mQuvPSg+Gj
 9SM34PMphj3pLSPNYHGOKbM+WlOal1pobHNBHw2K1zMyI5/5eMBg8kPFaW89KOj6CjoYIIKN7U6
 Bxuf4z8RvEls1x1HoNUSjFcOa09YMgEuZk7rufknxxfjLoGu13A9UDXn4bzsh2BBsFzSNJNL5aK
 WNr4y2fv/29xRJQrwajdVSxcyGBf+15SEyG+EQ535c0iw5KyH9HIbiQ8gPxA3ESuANQ9r1cnzLK
 yOnOMDE6CmWN10t+mB++Ljj1VBhxUgLN1uaQOPL30YwPpT0o2Xwvf0J35/ds9W6v81/Lvxq35oE
 bCFinH9tImShomn0zIZ9VLJd9mV5cG0ka0K4eeeQWFk8jPszUcrr8fAvEktK+T2+B/pTY9zmD8J
 RFfM8TjDbtqSbPodYrQ==
X-Proofpoint-GUID: M8D41RGz_MpNytDnls0Zqna3YFjS5BjX
X-Proofpoint-ORIG-GUID: M8D41RGz_MpNytDnls0Zqna3YFjS5BjX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602170115
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 14:24:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231258

--------------Fk0v10H8qQJjP3zmOoNEckDu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 61HBowAD3358400

On 2026-02-13 2:51 p.m., Dora, Sunil Kumar via lists.openembedded.org wro=
te:
> On Thu, Feb 12, 2026 at 10:36 PM, Ross Burton wrote:
>
>     What=E2=80=99s the impact on the native sysroot and target packages=
 when
>     we link rust against all of libLLVM.so dynamically vs statically
>     linking the pieces that are used?
>
> Hi Ross,
>
> Below are the observed impacts when linking Rust against shared=20
> libLLVM.so versus
> statically linking LLVM components.
>
> On Native:
> **********
> All required LLVM-related libraries were already present in=20
> recipe-sysroot-native before switching
> Rust to dynamic LLVM. Dynamic linking does not introduce any new=20
> native dependencies.
> Existing llvm-native artifacts are reused.
>
> Static:
> -rw-r--r-- 1 xxx users 213M Feb 13 00:29=20
> librustc_driver-4b6f2c2478f9ef2c.so
> Dynamic:
> -rw-r--r-- 1 xxx users 132M Feb 13 00:52=20
> librustc_driver-4b6f2c2478f9ef2c.so
>
> So on native we see ~81 MB reduction in librustc_driver, with no=20
> additional sysroot growth.
>
> On Target:
> **********
> librustc_driver shrinks from 144.8 MB to 84.2 MB (~60 MB reduction).
> However, dynamic linking introduces shared libLLVM.so plus a few=20
> runtime dependencies.
>
> Static:
> root@qemux86-64:~# ls -lh /usr/lib/librustc_driver-*.so
> -rw-r--r-- =C2=A0 =C2=A01 root =C2=A0 =C2=A0 root =C2=A0 =C2=A0 =C2=A01=
44.8M Apr =C2=A05 =C2=A02011=20
> /usr/lib/librustc_driver-151eed90355bbdac.so
>
> Dynamic:
> root@qemux86-64:~# ls -lh /usr/lib/librustc_driver-*.so
> -rw-r--r-- =C2=A0 =C2=A01 root =C2=A0 =C2=A0 root =C2=A0 =C2=A0 =C2=A0 =
84.2M Apr =C2=A05 =C2=A02011=20
> /usr/lib/librustc_driver-151eed90355bbdac.so
>
> New dynamic dependencies:
> root@qemux86-64:~# ldd /usr/lib/librustc_driver-*.so
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 libLLVM.so.21.1 libffi.so.8 libxml2.so.16
>
> Size contribution on target:
> =C2=A0- libLLVM.so.21.1 =E2=89=88 75.5 MB
> =C2=A0- libxml2.so.16 =E2=89=88 1.2 MB
> =C2=A0- libffi.so.8 =E2=89=88 42.5 KB
>
> When LLVM is only used by Rust, this results in a net image increase=20
> of approximately 15=E2=80=9316 MB.


Good, that's annoying but acceptable increase: ~7% to work-around this bu=
g.

I'm still a bit uncomfortable with changing the way that target Rust is=20
built to deal with
a Rust-native problem. Also there's the question about dynamic linking=20
increasing runtime
by a small amount. Finally, I worry that few people/distros change the=20
default linking to by dynamic.

So I won't object to this work-around especially if we can easily limit=20
it to -native. Have you tried that?
In a few years, we won't have this mix of toolchain versions and can=20
drop this change

so if this gets merged please open a tracking bug so that we don't forget.

../Randy



>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#231138):https://lists.openembedded.org/g/openembedd=
ed-core/message/231138
> Mute This Topic:https://lists.openembedded.org/mt/117777483/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [r=
andy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------Fk0v10H8qQJjP3zmOoNEckDu
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 61HBowAD3358400

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2026-02-13 2:51 p.m., Dora, Sunil
      Kumar via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:675892.1771012298240808740@list=
s.openembedded.org">
     =20
      <div>On Thu, Feb 12, 2026 at 10:36 PM, Ross Burton wrote:</div>
      <div>
        <blockquote>What=E2=80=99s the impact on the native sysroot and t=
arget
          packages when we link rust against all of libLLVM.so
          dynamically vs statically linking the pieces that are used?</bl=
ockquote>
        Hi Ross,<br>
        <br>
        <div>Below are the observed impacts when linking Rust against
          shared libLLVM.so versus&nbsp;<br>
          statically linking LLVM components.</div>
        <div><br>
          On Native:<br>
          **********<br>
          All required LLVM-related libraries were already present in
          recipe-sysroot-native before switching&nbsp;<br>
          Rust to dynamic LLVM. Dynamic linking does not introduce any
          new native dependencies.&nbsp;<br>
          Existing llvm-native artifacts are reused.<br>
          <br>
        </div>
        <div>Static:<br>
          -rw-r--r-- 1 xxx users 213M Feb 13 00:29
          librustc_driver-4b6f2c2478f9ef2c.so</div>
        <div>Dynamic:<br>
          -rw-r--r-- 1 xxx users 132M Feb 13 00:52
          librustc_driver-4b6f2c2478f9ef2c.so<br>
          <br>
        </div>
        <div>So on native we see ~81 MB reduction in librustc_driver,
          with no additional sysroot growth.</div>
        <br>
        <div>On Target:<br>
          **********<br>
          librustc_driver shrinks from 144.8 MB to 84.2 MB (~60 MB
          reduction).<br>
          However, dynamic linking introduces shared libLLVM.so plus a
          few runtime dependencies.<br>
          <br>
        </div>
        <div>Static:<br>
          root@qemux86-64:~# ls -lh /usr/lib/librustc_driver-*.so<br>
          -rw-r--r-- &nbsp; &nbsp;1 root &nbsp; &nbsp; root &nbsp; &nbsp;=
 &nbsp;144.8M Apr &nbsp;5 &nbsp;2011
          /usr/lib/librustc_driver-151eed90355bbdac.so<br>
          <br>
        </div>
        <div>Dynamic:<br>
          root@qemux86-64:~# ls -lh /usr/lib/librustc_driver-*.so<br>
          -rw-r--r-- &nbsp; &nbsp;1 root &nbsp; &nbsp; root &nbsp; &nbsp;=
 &nbsp; 84.2M Apr &nbsp;5 &nbsp;2011
          /usr/lib/librustc_driver-151eed90355bbdac.so<br>
          <br>
        </div>
        <div>New dynamic dependencies:<br>
          root@qemux86-64:~# ldd /usr/lib/librustc_driver-*.so<br>
          &nbsp; &nbsp; &nbsp; &nbsp; libLLVM.so.21.1 libffi.so.8 libxml2=
.so.16<br>
          <br>
        </div>
        <div>Size contribution on target:<br>
          &nbsp;- libLLVM.so.21.1 =E2=89=88 75.5 MB<br>
          &nbsp;- libxml2.so.16 =E2=89=88 1.2 MB<br>
          &nbsp;- libffi.so.8 =E2=89=88 42.5 KB<br>
          <br>
        </div>
        <div>When LLVM is only used by Rust, this results in a net image
          increase of approximately 15=E2=80=9316 MB.</div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>Good, that's annoying but acceptable increase: ~7% to work-around
      this bug.</p>
    I'm still a bit uncomfortable with changing the way that target Rust
    is built to deal with<br>
    a Rust-native problem. Also there's the question about dynamic
    linking increasing runtime<br>
    by a small amount. Finally, I worry that few people/distros change
    the default linking to by dynamic.<br>
    <br>
    So I won't object to this work-around especially if we can easily
    limit it to -native. Have you tried that?<br>
    In a few years, we won't have this mix of toolchain versions and can
    drop this change<br>
    <p>so if this gets merged please open a tracking bug so that we
      don't forget.</p>
    <p>../Randy</p>
    <p><br>
    </p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:675892.1771012298240808740@list=
s.openembedded.org">
      <div>
      </div>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre wrap=3D"" class=3D"moz-quote-pre">-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#231138): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/231138">https:/=
/lists.openembedded.org/g/openembedded-core/message/231138</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/117777483/3616765">https://lists.openembedded.org/mt=
/117777483/3616765</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------Fk0v10H8qQJjP3zmOoNEckDu--

