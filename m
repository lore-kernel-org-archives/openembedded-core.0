Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFB29CCD197
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 09:59:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.12271.1760522376450453852
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Oct 2025 02:59:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=R96jZ70z;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2383958093=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59F5wHe81952958
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 09:59:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=IQQLQW7ewzXIpE4rdrco8H/NP7xMJAiQgYUf2qfVY3I=; b=
	R96jZ70zFHrfYavxtW3slK7cqS0wj77e9NmjAkHg6hcG8/AfiFiBaQVIhEPl4Rw7
	jd0fzr3t3ySiq3R66+qSEMtTGdWYg9ElDU0EO9pdKBdWRZJcqRYazJ1LnHRxQVmA
	oeFCWtgaFSTNo4ZLCmScs5OcNz8mmoPcmjqpoEx6xyEVLI25nm/TsV1OxA0DXgQX
	zb7u5Sf+UaHoFuh2mIVyGP+FxNvGlPeo0HG7YyqDX+6wL+pbSIkbX1kM1D9kyOPU
	ZP/+65nm9qrugZ0cXiNdPxqdZzbeAjB2gSxER+OxYKAL8rDcL1Mp8x6Di7zd/70O
	uZ/E43bkN5HqYN0PrAy3Lg==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010050.outbound.protection.outlook.com [52.101.46.50])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49qcewmt01-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 09:59:35 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FprRAJhu8u79VloqYpwTQ/7iL1BVWLtSUQdPaUZoGzUs2MaOM1kxtBB6hztsDlNTCRClKzjX5x17GRuvWCUlK3t5K7PQnbtXE47LPH2L60hYPsLJlUnWFc8vo18hK/o6WVtrPZD9Mxg/FJt3m0UKD8sALgVmdyW2Mmjvhtk6hOHZWVcxVarcAeoXQNAEA5Tfcbsx7AaUERcKE1fwM4z97pw2B32rRBqs7CALooxUQMglaSm9HzGV42/GOev1kw21RBPHoBRH4gRksy3q72BLO+eS2XE5CIpFJkgEDdsyzLrTtuYJx0XWdh0i1t8hpkCilWunOLdv0czyL1tyVfqr4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IQQLQW7ewzXIpE4rdrco8H/NP7xMJAiQgYUf2qfVY3I=;
 b=yRHygpBiuRK+XZ6/DfD2kvnY3rxE7EJbrKXdCjoqwLE8OzUtZB/b6herd480fynzYhmYn9aAFSgynv149/SKstBb8IRWvxsUra/W762tSZe6BA5yUZHrzeniyV+XZC/NHZGtjxWGq0Rez+sjrd6oa/GNr3K5leivc3XUa60U1hkIy17AEzqht27V8zT/A2BTqICM3lMl/CE8FQhBw4aZIqJEq5fsNO3Tl9c7+TR6ss+VplGjP6iEMiZ8ZA8LCB36B8ornhQRFVfuJyayl1bdu8eqZIu+QGsIqftCmpp/GiwnQQ04AOTb7FIqEoBwMHHisThNGFAQOQZCYkoeEBnB6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Wed, 15 Oct
 2025 09:59:33 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%5]) with mapi id 15.20.9203.009; Wed, 15 Oct 2025
 09:59:33 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [PATCH V5 3/3] rust: Drop rust-llvm
Date: Wed, 15 Oct 2025 02:59:03 -0700
Message-ID: <20251015095914.2120664-3-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251015095914.2120664-1-Deepesh.Varatharajan@windriver.com>
References: <20251015095914.2120664-1-Deepesh.Varatharajan@windriver.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SJ0PR13CA0046.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::21) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|DS0PR11MB7958:EE_
X-MS-Office365-Filtering-Correlation-Id: 99252653-38ee-40c0-b5dd-08de0bd18a5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UDhiWDlDd1Q1UVk3Q3hYM21aSGF0TS9sdkx2d1A1OVU5RDhNbGtBVjdxdXMz?=
 =?utf-8?B?R3pId1lObTFjVm56WTB0MGw3a3doLzlIMVd6VERrK3lKRjExbzBOZlc4RTY1?=
 =?utf-8?B?R3lueFV6c05lcVNYNFlmNkdMem5sendvTkNkSlJpMEZYZkhFdkNBNFJ1KzRL?=
 =?utf-8?B?M2lCeHdRWVEvNlRuT05KOVc5ekpjSGRYZlZZeVdicjM1RVQ5TFowWldMeDNz?=
 =?utf-8?B?bENqNjZjODFGajBVWUIxSmFPV0xOOWlqOXE3cEtob1JTOWwzbzU3cXlZM3k2?=
 =?utf-8?B?aTEwVE9lTEhkRmlMdk5FREp5UmxCSDMzeER1aU45M0JlejdIOEZ1YkR6K2Ns?=
 =?utf-8?B?SWdwOXQ2OGVQU21zNndrQ1V1aFJoYnVHYjZXZmxXTlMxTExmdC92OEtCMW4z?=
 =?utf-8?B?WkNKRU9KcFdudHc5VzB4TE85TWMvcW1XMlhqMnhWSEFHY0YzZCtiRFdkajNH?=
 =?utf-8?B?S2NJV3FSeDN5VklOam04WjBUVzFONFpiSHRLYndHaDVvUldEbVByTWVsRmVE?=
 =?utf-8?B?TWk4MTNKSHJtdjF3RGZQUjVVdEpjc1VhbUV4K2xGQ1FueEJVN3lXeC81MVpp?=
 =?utf-8?B?NEFabk1PUC9OdW1NZHFCSXhKUzBFdlIyWHRvdHZZOVFYNmJRSlcvM0o5K3d6?=
 =?utf-8?B?UTR6Nlh0L2VDNWRGRVhBeDJUT28wZisvOWdXZi8xSlplbndSS1FhUFBjUnov?=
 =?utf-8?B?L1ExQVhxZVpGdEtWUmRTT3FYNkRQdzU5UlBOSU9OM3pMWm90YVdYdCtQVlVv?=
 =?utf-8?B?bFpxSzBFWkMxV1llcWoxeGk5dndxaEpTd1dUc25iM0loTkFhVFhLMGEzVE1Q?=
 =?utf-8?B?QlhVZVVCR0ZCMDlTWitCcmRoVTdCVlZkTDhCbnZUbXRxV0pQcDdnc0lwYzFF?=
 =?utf-8?B?bVQ0UEZ2bytLR3pxRlA0OVh5cCs5VmlPdGtyTTc1WUx2UGt2bTJNYWtucHN0?=
 =?utf-8?B?T2x2WEpqL3k1Y2xJbnMrVEV5RTNTbHNka3NrcnF4OXJUZkVDcmtaMzJMZXBI?=
 =?utf-8?B?TzRGcWNNL3VjTXVURWtYcUlrUTdnVmNIaG4vL1padU4vRVZYYWd4TUplREJ1?=
 =?utf-8?B?SGUzaU84a3R0c3VnbE4xbUtFbDFNaUNTMW4wcFFHMG5YbkJIN0VsNkhQOTFB?=
 =?utf-8?B?TXBRZi9nRG9XdW5OQUIzSnkyaFl1Ukw5K1loQnA1UWFrMGNlTUNqOFRLakwr?=
 =?utf-8?B?UytHOVlNdFhMZm9VT041eUwxei91em1KaFN5VXhEQlhDRTZqZEJNN3dGODFx?=
 =?utf-8?B?K3RSbStPWC9GbWZ0YkVYVEtxTEZlc2NMRE0yWCt2dy9odkJmWllIcFUxYVdD?=
 =?utf-8?B?aW45UG1sNFhBWWoxZmsvd2tpaWVLZnpWVDJzQ0ZvMzdhbmF5TjZtWWVFbWli?=
 =?utf-8?B?K0MwTHU4L3ZkdW9SRHFtWWlBazI5Rm5pcW1PUGRuRzBRL2ZzUDdIU0JQanY2?=
 =?utf-8?B?bDhyVWIwVUtWYTRkUkF5blUzU001QWp5aDJSVTRQSXpJN1JlSzhYUVZoVGk0?=
 =?utf-8?B?WWxEeDFWTFUyNWhYRDE0bzQrQTI5R21DM3Fub2t4Nllvb0hqaDhrMkpuOE9H?=
 =?utf-8?B?UjdkdUV5eXpaQ1RnQmRyUWZCN3NUaWdJeHFHdDZFTXgzZGt0RGM2N2kveUVK?=
 =?utf-8?B?djZ3QU40TTdzbTU0SUh3eThtWHFEY0hzNllkcTZJRVJMS0xtVDRIS0U4RXY1?=
 =?utf-8?B?alpHMUx3ZTdWZHkzaU1sSnBvNDBxTVR4V1dUNDltNkFNM3RBUGM0c0lvK0Zi?=
 =?utf-8?B?ejMxZTBlSEVaam92UWFkckJxTHlmWDZ5L2pEbG1aM1krQVhySDRmOG5mSFhE?=
 =?utf-8?B?OGswUmQ4K2ZIVUx5dnNFd1hINmJYb1U4RnRvNTE1ZEMxK2dNdDNNYnE0WDI1?=
 =?utf-8?B?UkdmV2tFWm9QUWJhOCsxbjArUGhDM1VjdVRpb2FGb0gvZm1WTEtWWkxIdWRF?=
 =?utf-8?B?cnJkRjBvenpKcktldXhUZmFBVnpEOFpEZEh5ZkppdWtmcUxNanlTL2VBU1Y5?=
 =?utf-8?B?b25GWFJ2V29BPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UlB3bjYzeW0zR2oxa0J5QkhieVd5UGJ1SXBkOWJSWmlKYUVDZFBXc2JiUkVp?=
 =?utf-8?B?UGxQZGJ6OXkwdFo0TUVlUmpETTRwa1ZBRGkyTzc1NHpBRWExTDBIRnpvczFZ?=
 =?utf-8?B?b2g0TTJtRXlVRzNSdU9mK3FMNXJLMmFUcVB1dGl6RTdTaU85clhhbVR4a2xU?=
 =?utf-8?B?a0F0TWJyMVlSMDRoQThQanl4UmIwZTl3TDBsU3dCNzVHYjZ1U3ovMFU3YTEx?=
 =?utf-8?B?aXlPYVhVMmJ3bnFkTU5RWU05NUVUVWxBYTJxMHRLVmlxd1EzWVRDRE9NWXZi?=
 =?utf-8?B?RmhuUVlUVVBKTXRkS2MwNDdnQmxnY3hiYUFvVXpxTTY2dGI3L3k3cGZHenEx?=
 =?utf-8?B?QVdrQkJraDJXb3BBeVRSbWJOampPN0dNZG1hdk5UTGF0ZnBxVlR3d1U5cjlM?=
 =?utf-8?B?eFhuSDlTR21LcDFaR2MvSU1Ha3lML1Qrc29HU2J1NzV4OS9KTnlzYy9yaVR0?=
 =?utf-8?B?ZHVWeGpMMDdLanVwa2dpQ2x5OUI4VC9OSWhrcnJNNlRjbXQzRTF5K3BlTVJk?=
 =?utf-8?B?dTRSb2VrSUtjRThUTkRLMnZMV0hLclZJRWR1ZUJHMFBUWTlZYnJQWnlKaUp6?=
 =?utf-8?B?b2FaL1g3KzBvK3pLL0VsNjZLeE5pcHhoWEhXWHhxdnJkd3BYdTAvYk9EeUsx?=
 =?utf-8?B?N2FIR1FZOHdXNEo5Q2JMSHVaU0xTcVEwZnE3d2JKTDMrNmp0Tm9STnM2Zmpa?=
 =?utf-8?B?QUtLL3N0UzhBeGQyOUMrYlpXTnh6QURrQmVnVXdNd0dBMFRFTG5TVWlRWDF2?=
 =?utf-8?B?WjhaUHEwN0xHS0pmNXN2dHBZV0NEVjcxbzc2VUVwN0sxYi81WDZkcXRkbnIz?=
 =?utf-8?B?Mnh2enRwWVpPc1N4S2VFWFBQS0lSMStWTzdpeHdxQlp0MW1vSW1oU2dqbXNr?=
 =?utf-8?B?TGcyNFFqcDFkclpFR0QrU3RoSDZPUFArbThIdEJCbmVTeHlaMVJmdjFmZWVU?=
 =?utf-8?B?WjNGazRLS0I2WmhiNFZ3d0NTUW9pQ0FaRnp3Slg4ZVYxTzhhNGQvM1g0dFlP?=
 =?utf-8?B?RDZOc0p5U21SNG9pMkRDSjFBNUlLamJ2bVNRZkRCMVJQOFlWUzRlb0hUWDZV?=
 =?utf-8?B?bDdVd3pnSHVTOWRlMnVCY254THBxNlpFaU1adzh6RWk4bFd2WVVTWTllRUFX?=
 =?utf-8?B?MTFjejhuNjlJVXVBQXdzdnduUW51amRkR3lKMEMwLzRua2xuMUN5ZElUSFp3?=
 =?utf-8?B?QUxKenprSU1zOVV5bldGUlE4eU1HNkE5MFFEQzdjbnhuUU9PK05kOVU1eWZH?=
 =?utf-8?B?N1B0UVBOSnBOYTY4T0xwM09id3BrcGFUWURVOTd1M3VlU3JGSXBPd1A0eVVm?=
 =?utf-8?B?ZU40RGxkSnNMUm1GT0llOHZMWUw1TW1mNzVOV0I0NHlQaStZeFJpOGY4enRs?=
 =?utf-8?B?aXZ1cHJ5NXpGSHNodWhBY3lhN2x3OGRQb25VSHdlY2VMdm00QjZvb0Q5TDFB?=
 =?utf-8?B?T3RIZWM3emo5ZVR0ZW0vcGowdGlRbCsxbGN5Q1N3MmFPQ25QUXYrZU04V2kr?=
 =?utf-8?B?alhHUVEwamg2OWkxRU9PWFc5Vk9ENU1MZW5VN1poVE1aMnBZRWRIUkxGa3pZ?=
 =?utf-8?B?Z2tXNzh3Q2lxai95UFNWTzBqVUs1cmhkbTkzcXRudHUzdjhLUEhpdlR0OURj?=
 =?utf-8?B?WldwSTNrMnJYL0FFYzlXQ1g2cnlnSHJWRnRTZTZ4YWt4L2pZV3lkUC9PUytK?=
 =?utf-8?B?OUI2LzA3N1h2M0V0TkFjem4vRHBZb1UyOUNWdWtyMGFsdWZvK1hTYWM4MFAr?=
 =?utf-8?B?T1pxNlpPMHdaQlo3UWh6M2lTd29SRVdzdjd0UGF3K1RDdnZ5SkVGZ3BWTXc5?=
 =?utf-8?B?dzFLaU01TzFWY2QrR0hQWFIwTUdJRWE2SUIvRWxWNVdqbnpKT1VCQXpNTTYz?=
 =?utf-8?B?V1hYc09Vbk9KUVU1WGFvNmQzRGl3em1McDFkNktMVUFLN0tiTlhWeW01Wlhv?=
 =?utf-8?B?czlIM1AvMWl3aGo4MWJ6aDd0N1dpclVwMDZRV1F1VkVjdC94bGM3THpPMHdW?=
 =?utf-8?B?UlRIKzBGbUw3TmswTVpOUTRiL1FpK0hNV0xRdGcrMkRxRGJaTnZ1VjJqZmly?=
 =?utf-8?B?TWhzVTZXOXFqSExWdFNVS3NTRXhOdXFWUkhBWkl3QjJGMnRaZWdQTUdHZ3Nm?=
 =?utf-8?B?SGZickw2VVFZenVwZ3VIeVFTSHhOMHFBS29ubnlOMmkwRjNkb2hOemgwUVZM?=
 =?utf-8?Q?Jsbu06srpHvgcwfC4YW6FMg=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99252653-38ee-40c0-b5dd-08de0bd18a5e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 09:59:33.1621
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CVeUYtIpDJFyseGBnS7/1lSPFdUpfNHj4eLmMuAUgrNwkTTn7zugWfh3STbnGNTqyAPGQXxuMtkhD2ZKG1hrgAik+4Hqjx4zk4NZqxuhcWkVauYtj2EtpggyrpbRpmsm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7958
X-Proofpoint-GUID: NSmwJLpd4c3ZUamYxtxFyr0KIpsQu7aC
X-Proofpoint-ORIG-GUID: NSmwJLpd4c3ZUamYxtxFyr0KIpsQu7aC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE1MDA3NyBTYWx0ZWRfX3aHmj5B606Yo
 ISwaELbHOts6vZs2GqziQDuUwejH1XiJlwSuWoLLX+NDTANnt6O7NovGLRKYpghjxUzUxwaThT2
 /ABOM1Gq5wa1EpjEeQtNcxc020h1D5uDY6LiN2zKEKubkZgYgsefoKw1LVrzgiK9w0s//9RthE8
 n9xAzDJvDafrZyJUbgH43bJeHV2opVOeAPHbCwhiGSf2c9lEZj4GbF0UpaJsGmoHe0krp+nfQnz
 4GJozpNDAaJdn7frdvrq4lnwRuVJUKzCGnyvoNPKGPHtqu+hsY5xakUxiw5WWcEgiMiYrwf2PdP
 2M5UjKAEwOksxSzP+Ug6wlciJGOsaVJKzvQbMVl6qfgFUB7bmuxC5o5A8Hu+CpPsk+h5TX16HjS
 IFG186lKgf1LnJNFszZTWCBUoBeNug==
X-Authority-Analysis: v=2.4 cv=M+xA6iws c=1 sm=1 tr=0 ts=68ef7087 cx=c_pps
 a=MMVmnpyRbxvAcRc6a9dgEg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Twlkf-z8AAAA:8 a=ei4SEBeUAAAA:8 a=t7CeM3EgAAAA:8
 a=7CQSdrXTAAAA:8 a=iGHA9ds3AAAA:8 a=8wEic9LhAAAA:8 a=pGLkceISAAAA:8
 a=IvTj1HvjAAAA:8 a=KWC9iU3rWuwbSrfLZx8A:9 a=El4dKC3-_JfgT4nS:21
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=-74SuR6ZdpOK_LpdRCUo:22
 a=8zIOOLb7Ym0NljyPXbuS:22 a=FdTzh2GWekK77mhwV6Dw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=M9VCcFR7d36vLOFuqMn8:22 a=kmyLcwvAnC_t3PsnBtKb:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510150077
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 59F5wHe81952958
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 09:59:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224889

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Dropping rust-llvm because now rust depends on llvm.

0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
0002-llvm-allow-env-override-of-exe-path.patch
(We have the above two patches in llvm)

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 -
 .../distro/include/rust_security_flags.inc    |  1 -
 meta/conf/distro/include/tcmode-default.inc   |  2 -
 ...r-sort-ClassInfo-lists-by-name-as-we.patch | 31 ------
 ...-llvm-allow-env-override-of-exe-path.patch | 33 -------
 .../recipes-devtools/rust/rust-llvm_1.90.0.bb | 98 -------------------
 6 files changed, 166 deletions(-)
 delete mode 100644 meta/recipes-devtools/rust/rust-llvm/0001-AsmMatcherE=
mitter-sort-ClassInfo-lists-by-name-as-we.patch
 delete mode 100644 meta/recipes-devtools/rust/rust-llvm/0002-llvm-allow-=
env-override-of-exe-path.patch
 delete mode 100644 meta/recipes-devtools/rust/rust-llvm_1.90.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index deac453365..444c7f6521 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -774,7 +774,6 @@ RECIPE_MAINTAINER:pn-ruby =3D "Ross Burton <ross.burt=
on@arm.com>"
 RECIPE_MAINTAINER:pn-run-postinsts =3D "Ross Burton <ross.burton@arm.com=
>"
 RECIPE_MAINTAINER:pn-rust =3D "Randy MacLeod <Randy.MacLeod@windriver.co=
m>"
 RECIPE_MAINTAINER:pn-rust-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "=
Randy MacLeod <Randy.MacLeod@windriver.com>"
-RECIPE_MAINTAINER:pn-rust-llvm =3D "Randy MacLeod <Randy.MacLeod@windriv=
er.com>"
 RECIPE_MAINTAINER:pn-rxvt-unicode =3D "Unassigned <unassigned@yoctoproje=
ct.org>"
 RECIPE_MAINTAINER:pn-sassc =3D "Simone Wei=C3=9F <simone.p.weiss@posteo.=
com>"
 RECIPE_MAINTAINER:pn-sato-screenshot =3D "Ross Burton <ross.burton@arm.c=
om>"
diff --git a/meta/conf/distro/include/rust_security_flags.inc b/meta/conf=
/distro/include/rust_security_flags.inc
index 590bef17a0..f77c851197 100644
--- a/meta/conf/distro/include/rust_security_flags.inc
+++ b/meta/conf/distro/include/rust_security_flags.inc
@@ -2,6 +2,5 @@
 SECURITY_CFLAGS:pn-rust-native =3D "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS:pn-rust-cross-${TARGET_ARCH} =3D "${SECURITY_NO_PIE_CFLA=
GS}"
 SECURITY_CFLAGS:pn-rust =3D "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS:pn-rust-llvm =3D "${SECURITY_NO_PIE_CFLAGS}"
=20
 SECURITY_LDFLAGS:pn-rust-cross-arm =3D " -lssp_nonshared -lssp"
diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/dist=
ro/include/tcmode-default.inc
index 133608a6e7..ff10f14a6b 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -43,7 +43,5 @@ PREFERRED_VERSION_cargo-native ?=3D "${RUSTVERSION}"
 PREFERRED_VERSION_libstd-rs ?=3D "${RUSTVERSION}"
 PREFERRED_VERSION_rust ?=3D "${RUSTVERSION}"
 PREFERRED_VERSION_rust-cross-${TARGET_ARCH} ?=3D "${RUSTVERSION}"
-PREFERRED_VERSION_rust-llvm ?=3D "${RUSTVERSION}"
-PREFERRED_VERSION_rust-llvm-native ?=3D "${RUSTVERSION}"
 PREFERRED_VERSION_rust-native ?=3D "${RUSTVERSION}"
=20
diff --git a/meta/recipes-devtools/rust/rust-llvm/0001-AsmMatcherEmitter-=
sort-ClassInfo-lists-by-name-as-we.patch b/meta/recipes-devtools/rust/rus=
t-llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
deleted file mode 100644
index 48af6fc283..0000000000
--- a/meta/recipes-devtools/rust/rust-llvm/0001-AsmMatcherEmitter-sort-Cl=
assInfo-lists-by-name-as-we.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 86940d87026432683fb6741cd8a34d3b9b18e40d Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 27 Nov 2020 10:11:08 +0000
-Subject: [PATCH] AsmMatcherEmitter: sort ClassInfo lists by name as well
-
-Otherwise, there are instances which are identical in
-every other field and therefore sort non-reproducibly
-(which breaks binary and source reproducibiliy).
-
-Upstream-Status: Submitted [https://reviews.llvm.org/D97477]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- llvm/utils/TableGen/AsmMatcherEmitter.cpp | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/llvm/utils/TableGen/AsmMatcherEmitter.cpp b/llvm/utils/Tabl=
eGen/AsmMatcherEmitter.cpp
-index ccf0959389b..1f801e83b7d 100644
---- a/llvm/utils/TableGen/AsmMatcherEmitter.cpp
-+++ b/llvm/utils/TableGen/AsmMatcherEmitter.cpp
-@@ -359,7 +359,10 @@ public:
-     // name of a class shouldn't be significant. However, some of the b=
ackends
-     // accidentally rely on this behaviour, so it will have to stay lik=
e this
-     // until they are fixed.
--    return ValueName < RHS.ValueName;
-+    if (ValueName !=3D RHS.ValueName)
-+        return ValueName < RHS.ValueName;
-+    // All else being equal, we should sort by name, for source and bin=
ary reproducibility
-+    return Name < RHS.Name;
-   }
- };
-=20
diff --git a/meta/recipes-devtools/rust/rust-llvm/0002-llvm-allow-env-ove=
rride-of-exe-path.patch b/meta/recipes-devtools/rust/rust-llvm/0002-llvm-=
allow-env-override-of-exe-path.patch
deleted file mode 100644
index 9be26677a9..0000000000
--- a/meta/recipes-devtools/rust/rust-llvm/0002-llvm-allow-env-override-o=
f-exe-path.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 7111770e8290082530d920e120995bf81431b0aa Mon Sep 17 00:00:00 2001
-From: Martin Kelly <mkelly@xevo.com>
-Date: Fri, 19 May 2017 00:22:57 -0700
-Subject: [PATCH 12/18] llvm: allow env override of exe path
-
-When using a native llvm-config from inside a sysroot, we need llvm-conf=
ig to
-return the libraries, include directories, etc. from inside the sysroot =
rather
-than from the native sysroot. Thus provide an env override for calling
-llvm-config from a target sysroot.
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Martin Kelly <mkelly@xevo.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- llvm/tools/llvm-config/llvm-config.cpp | 7 +++++++
- 1 file changed, 7 insertions(+)
-
---- a/llvm/tools/llvm-config/llvm-config.cpp
-+++ b/llvm/tools/llvm-config/llvm-config.cpp
-@@ -226,6 +226,13 @@ Typical components:\n\
-=20
- /// Compute the path to the main executable.
- std::string GetExecutablePath(const char *Argv0) {
-+  // Hack for Yocto: we need to override the root path when we are usin=
g
-+  // llvm-config from within a target sysroot.
-+  const char *Sysroot =3D std::getenv("YOCTO_ALTERNATE_EXE_PATH");
-+  if (Sysroot !=3D nullptr) {
-+    return Sysroot;
-+  }
-+
-   // This just needs to be some symbol in the binary; C++ doesn't
-   // allow taking the address of ::main however.
-   void *P =3D (void *)(intptr_t)GetExecutablePath;
diff --git a/meta/recipes-devtools/rust/rust-llvm_1.90.0.bb b/meta/recipe=
s-devtools/rust/rust-llvm_1.90.0.bb
deleted file mode 100644
index 42d4031da1..0000000000
--- a/meta/recipes-devtools/rust/rust-llvm_1.90.0.bb
+++ /dev/null
@@ -1,98 +0,0 @@
-SUMMARY =3D "LLVM compiler framework (packaged with rust)"
-LICENSE ?=3D "Apache-2.0-with-LLVM-exception"
-HOMEPAGE =3D "http://www.rust-lang.org"
-
-# check src/llvm-project/llvm/CMakeLists.txt for llvm version in use
-#
-LLVM_RELEASE =3D "20.1.8"
-
-require rust-source.inc
-
-SRC_URI +=3D "file://0002-llvm-allow-env-override-of-exe-path.patch;stri=
plevel=3D2 \
-            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-a=
s-we.patch;striplevel=3D2 \
-           "
-
-S =3D "${RUSTSRC}/src/llvm-project/llvm"
-
-LIC_FILES_CHKSUM =3D "file://LICENSE.TXT;md5=3D8a15a0759ef07f2682d2ba4b8=
93c9afe"
-
-inherit cmake
-
-DEPENDS +=3D "ninja-native rust-llvm-native"
-
-ARM_INSTRUCTION_SET:armv5 =3D "arm"
-ARM_INSTRUCTION_SET:armv4t =3D "arm"
-
-# rustc_llvm with debug info is not recognized as a valid crate that's
-# generated by rust-llvm-native.
-CFLAGS:remove =3D "-g"
-CXXFLAGS:remove =3D "-g"
-
-LLVM_DIR =3D "llvm${LLVM_RELEASE}"
-
-RUST_LLVM_TARGETS ?=3D "ARM;AArch64;Mips;PowerPC;RISCV;X86"
-
-EXTRA_OECMAKE =3D " \
-    -DCMAKE_BUILD_TYPE=3DRelease \
-    -DLLVM_TARGETS_TO_BUILD=3D'${RUST_LLVM_TARGETS}' \
-    -DLLVM_BUILD_DOCS=3DOFF \
-    -DLLVM_ENABLE_TERMINFO=3DOFF \
-    -DLLVM_ENABLE_ZLIB=3DOFF \
-    -DLLVM_ENABLE_ZSTD=3DOFF \
-    -DLLVM_ENABLE_LIBXML2=3DOFF \
-    -DLLVM_ENABLE_FFI=3DOFF \
-    -DLLVM_ENABLE_LIBEDIT=3DOFF \
-    -DLLVM_INSTALL_UTILS=3DON \
-    -DLLVM_BUILD_EXAMPLES=3DOFF \
-    -DLLVM_BUILD_LLVM_DYLIB=3DON \
-    -DLLVM_LINK_LLVM_DYLIB=3DON \
-    -DLLVM_INCLUDE_EXAMPLES=3DOFF \
-    -DLLVM_BUILD_TESTS=3DOFF \
-    -DLLVM_INCLUDE_TESTS=3DOFF \
-    -DLLVM_INCLUDE_BENCHMARKS=3DOFF \
-    -DLLVM_TARGET_ARCH=3D${TARGET_ARCH} \
-    -DCMAKE_INSTALL_PREFIX:PATH=3D${libdir}/llvm-rust \
-"
-
-# Forcibly disable the detection of these packages as otherwise
-# it will look at the host Python install
-EXTRA_OECMAKE +=3D "\
-    -DPY_PYGMENTS_FOUND=3DOFF \
-    -DPY_PYGMENTS_LEXERS_C_CPP_FOUND=3DOFF \
-    -DPY_YAML_FOUND=3DOFF \
-"
-
-EXTRA_OECMAKE:append:class-target =3D "\
-    -DLLVM_BUILD_TOOLS=3DOFF \
-    -DLLVM_TABLEGEN=3D${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-tblgen=
 \
-    -DLLVM_CONFIG_PATH=3D${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-con=
fig \
-"
-
-EXTRA_OECMAKE:append:class-nativesdk =3D "\
-    -DLLVM_BUILD_TOOLS=3DOFF \
-    -DLLVM_TABLEGEN=3D${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-tblgen=
 \
-    -DLLVM_CONFIG_PATH=3D${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-con=
fig \
-"
-
-# The debug symbols are huge here (>2GB) so suppress them since they
-# provide almost no value. If you really need them then override this
-INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
-
-export YOCTO_ALTERNATE_EXE_PATH =3D "${STAGING_LIBDIR}/llvm-rust/bin/llv=
m-config"
-
-do_install:append () {
-    # we don't need any of this stuff to build Rust
-    rm -rf "${D}/usr/lib/cmake"
-}
-
-PACKAGES =3D+ "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-liblto"
-
-# Add the extra locations to avoid the complaints about unpackaged files
-FILES:${PN}-bugpointpasses =3D "${libdir}/llvm-rust/lib/BugpointPasses.s=
o"
-FILES:${PN}-llvmhello =3D "${libdir}/llvm-rust/lib/LLVMHello.so"
-FILES:${PN}-liblto =3D "${libdir}/llvm-rust/lib/libLTO.so.*"
-FILES:${PN}-staticdev =3D+ "${libdir}/llvm-rust/*/*.a"
-FILES:${PN} +=3D "${libdir}/libLLVM*.so.* ${libdir}/llvm-rust/lib/*.so.*=
 ${libdir}/llvm-rust/bin"
-FILES:${PN}-dev +=3D "${datadir}/llvm ${libdir}/llvm-rust/lib/*.so ${lib=
dir}/llvm-rust/include ${libdir}/llvm-rust/share ${libdir}/llvm-rust/lib/=
cmake"
-
-BBCLASSEXTEND =3D "native nativesdk"
--=20
2.49.0


