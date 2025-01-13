Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E34EC02180
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 22:02:39 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.30765.1736805751223423945
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jan 2025 14:02:31 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=31083bb6c0=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50D7MoHG026701
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 14:02:31 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 443s1pj0mx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 14:02:30 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50DM2U5L022476;
	Mon, 13 Jan 2025 14:02:30 -0800
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 443s1pj0mw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 14:02:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cB/8ckz47OGvW33X1ODtlQmhkU+Gct7OMg0lgpuJuyyWwrczizFh+IP+LnjFGDaRcwmMtvT5e72k6ttKMVOSvs8XDhohAPcN40yl9UxY/f2afUY8UYyTSPH/CIgm9X367JMjq7xAwn/x2tg0uUwvv2+ezKix4bOmnkAREr87r8y71HiNjh1L1tlU+WK4XVVIs/G6aqkXzIgeNHU8NM7nlqCVBepfVGYsrZVz3PKNcbP+8TyWyRZaOiZnTcQ9Rbqwi6W09Rk6tprOSbSB9uOo64y2TFlAQpL4DDq9cABYyREsZpk7OWSz6T4G302WdEFj0OaWdNbT13SzH1coo2ONNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yWG6fTUknP3fWG1CLT+vvqiRfE+WvcgbPUfxaol1o50=;
 b=wKZMNEa+YJtIH7aSG9+Np6K/tb3fZ3S8Wbp5iFKP4JiILS7sqaBk76UMezvvHIjXuNLfQUQMPj0RFX3GGFDSGkzHfKiymo1Tzom4138Rrbu8jh6cp8u0+8BLf3Mamzoz++zg0Pj2laz+IffDGUWMPirFKeC+YIfWcA5Q6nX+ZP2JtTF01Ti7zAn2Yjmmqv1BD32AfRPMrYw+HdEDxPvmHxn2pXarZjS8Iz5MYKG47+AeYBW8cBU2qGf0kStmYQgVhea7Plj+twQaDzutw4S1/OBS1+GV6Cx58eXqVcmv5xFxeazAmS43pvg1nV5p0iV0gf/dQSnrPlWX2pE2yCCNGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by MW4PR11MB6738.namprd11.prod.outlook.com (2603:10b6:303:20c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 22:02:24 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%4]) with mapi id 15.20.8335.015; Mon, 13 Jan 2025
 22:02:24 +0000
Content-Type: multipart/alternative;
 boundary="------------tMkD9SU7xVy07o9G5b4mEZ9a"
Message-ID: <1a75199a-d831-42f1-b6d8-45edddbd2ad4@windriver.com>
Date: Mon, 13 Jan 2025 17:02:21 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [meta-oe][PATCH] Sanity test for cpp toolchain
To: gavrosc@yahoo.com, openembedded-core@lists.openembedded.org
References: <20250113204447.14948-1-gavrosc.ref@yahoo.com>
 <20250113204447.14948-1-gavrosc@yahoo.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
Cc: antonin.godard@bootlin.com
In-Reply-To: <20250113204447.14948-1-gavrosc@yahoo.com>
X-ClientProxiedBy: BYAPR06CA0023.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::36) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|MW4PR11MB6738:EE_
X-MS-Office365-Filtering-Correlation-Id: f88711dc-eca3-41aa-fa4f-08dd341df626
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|4022899009|376014|8096899003|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SHJUNUFIS1UraDk0bGc4ZDZBSlZLcjNWNnNMbjBuK21MVUtjbEY0U1d5Lzhl?=
 =?utf-8?B?VFcySUN5S0dnemh2Q2JQRlNVNlNTZ00veXRucS9LSGJ2VXBuRERwU2Y2UHdn?=
 =?utf-8?B?NTVnajlOMFJnRTV3Zzl4UVh5dUhoeHEzd1orbGNPWThKOHlnTFdRYlVLU0Ni?=
 =?utf-8?B?T041YTdMaWxCM3R1TGs3M1F6TVlxdU16b0pLS0xZdzd6U3lIWVQwcWZ4czhq?=
 =?utf-8?B?dFBoU3Y0OWI1aisyNmRleitjK3FYRGJzZzQvdFVtYTVQbEdTWU14OXBGektS?=
 =?utf-8?B?U2FPUFY4SnE5eFZNZmdydkdrelZkNmFWQjN3dzdxdUxMcVNHekpYZ0hwTDR3?=
 =?utf-8?B?MGhYYStBbUNRa3k4dG5sdVA5N1ZDM21aamhaajFoejFRSDM3Tmc1aTRXWHRL?=
 =?utf-8?B?cDAyZDVEb05JWU9QMjVCcGhKcTN1NjZ3a1RLTGVkeG1uVzN4WDdQdjF6V2ls?=
 =?utf-8?B?K0xJMWo1YXM0QUVFK2NaUS95Yk1mc251UGF3dCtqN1dYMGFBcys4MHg0SGh2?=
 =?utf-8?B?TzlWQmp5SndrS05IQ1N2TkIydWtaNDVXaEFFYzJLcWZFYVE1SEVvbmI4WHcw?=
 =?utf-8?B?S2JYUGF2UklENWJmUXVGWXFtSXc2ZENVVnFSU2ZaSWtOc3RIZ1ZnNkNVdmFZ?=
 =?utf-8?B?ZStUSk9iMU9mUEJGcWpBZTB5QTc5d1o4RDFHZUNzMmYyYVc2TzBmZzJuNUM4?=
 =?utf-8?B?WjZqVDVreEZ3QnVNb0t6TXczT2RTUEpkWFlrdG5UQko3Y3RUamxXN0owQ0ZQ?=
 =?utf-8?B?YXNEbm5GQ3IrMHkwVzhQcm8xL01rclVOZXQ3VkExYmhvVWZKd0lVUnJQRTd4?=
 =?utf-8?B?TVlTaSt1TElLWllLbm9XaENlZE1pdm5tS3ZZekRZSW8zeXhoSjJkV1VxQ2x0?=
 =?utf-8?B?Um1YK2hRZE91c1lWUzBRbXl5Ykd0V1VkZnNpOHovMnIwNmxZS2dFT0grMEdH?=
 =?utf-8?B?WFhYQ2owWEdScno3dDBFY3B2K2pvSE9IcWk0KzJIQmV6NHRXV2lRSUh3Qzlr?=
 =?utf-8?B?d2pqK0ZCVW1JS0JXT1diNWtVN0VNUVhtWWxFcjI3b1ZhNjkreTJQd0pySE8z?=
 =?utf-8?B?aFduaXVDODl3Q25EWitrazlzN2dXQkRvK2c2UDlEZlpXaDAzaEJwRHZlYUxW?=
 =?utf-8?B?NnIybUlvU0p5eDg4RHVCZC85QlppVmV5a3dFakZmeXZTK20xTE1aU2dpWnZ5?=
 =?utf-8?B?dDJqT2EzUXBrWjhMTVFFT0RWQyt0dStHeGhRMzR1MEtieHhSd1JIWjZvMlhU?=
 =?utf-8?B?WUJOTWRjRTEvU2Q2QmRSc2V3YlR3NUl1TDBDRll3L3UzMDdEQW9oeU5NcGdk?=
 =?utf-8?B?QnQ5bnZtSXFSaG1pcXpRcjZwdVR4ZHhvZk15ZzdCRzI0WnA2aFVhNlVscExi?=
 =?utf-8?B?eGYzMVdWZWtMZkFOcnFBUjdJMkE0dDk2SUJEV1R3Nm5BdkJQbktFM1ZtNjNk?=
 =?utf-8?B?M2l3cWdkSjBDZDVNbXR2MTlCalcxYjFhdTN3TlE3bzM5NlB1UVF5aTVYTXRp?=
 =?utf-8?B?YWRxZUNvSkdnM2J4bUlWTDhCc0IxeDBYZXdSSDR5QjFNc2lTUERaSE1TOG5B?=
 =?utf-8?B?aVlXL2NaWGR6SnRrdURqOG4xQnVmR1NhZE04T2hub0VoeEYxN25LMkNWeGF1?=
 =?utf-8?B?Q1Z2OXZMSWR5cTVWd1FlZjg2Zk1paThuSkR6blhmYWdYM0pyV016cU5wMWZt?=
 =?utf-8?B?TlIva2kyL2RERUx0TEtjYUpXUWFobkZ2b1FLNlFGZitHbkp0MllmTERDenBr?=
 =?utf-8?B?Q3ZmeVBzdk1zeGlpNXBOeUl4MVp6QVUvdmV6UGhyVTRtVElwaDBjNHF2OG15?=
 =?utf-8?B?VUlFcjc4bkFleFNKVTR1UT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(4022899009)(376014)(8096899003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QjUxMGlVa3RES1E1SkdOMFJUYzVyUFlIaVZjSmdWU1VvbXFiTGUxaWx1amNH?=
 =?utf-8?B?NjlMRjdIUGMrRXRUSEE1bFBQbHFETW9mOUNKSzUyK1ZaMmlGM21DekZPQkM2?=
 =?utf-8?B?SkwzN2k2ME1xY1BPdFBMTnFDSEZWZ1pIV3pJenJvbm8rV1JTRU9zVVh0UC9T?=
 =?utf-8?B?REIwNE93QXpTM1RSeXo3eEFtSFVLZE9iY3VGN0FSblZZVzR5ejRzQzArdEln?=
 =?utf-8?B?ODl2Uk9TdndmNWVUQkF1TytQTW5UQkwzdFhXY0lwYUtyQXo1T0J0YkxMb1Yz?=
 =?utf-8?B?UGUvODNJdG9PMW1tUnlxdnNzZXA3OFhhdEJHa0ZYTjJyN3NlRldIUm9DZ0V3?=
 =?utf-8?B?ZlZreHpmVjFVZmw2VkxtWDBvUk9taU1sUEVmOXJyYUtPd3E1ZStnSkNuVjlP?=
 =?utf-8?B?SFUvNTRZblhySFZNYUtJZ3VyL3V4SnNHWHEzTUdmWG92THM5eVVJeVppZ0dB?=
 =?utf-8?B?ZXZRNUhQVlR2YkE1azU2Sm9aUlo0dW5hNVRVbFA1RnpGMXJoOEtZdjBlaEFl?=
 =?utf-8?B?U1JML29DM3JyMEhsZG5yL3BsTnlnWkdJeStHQVBwbkZFWnE5U21ybUczOE8r?=
 =?utf-8?B?REp0ajk2c1h1Q2kxbUl4WDVXTm9YWDBCbWFiV0lGTVpJcFRFSUkzNGVFMWlq?=
 =?utf-8?B?N2pXUzlIb2ZSaTJhNURFZmg2eUF2WFE0YWVCbjI2bFpYZUl6NTZMMEQ3aWI0?=
 =?utf-8?B?Mm96WUFiYW9aamkwTnQxek5mQzZ0dXhWQmlSUjZiN3ZWTHNsY2hFaTB3czVj?=
 =?utf-8?B?ZnJSZ2JlZUhRQ3hyVmhmbzJDUi92TFZQMVpGRkNTVndJaFE4NjhBN0FUQkhY?=
 =?utf-8?B?aUtuQ05pK0dVZE9tMWYyenlSOEJ5OVF2dGp3Y2MzMDBCeDBlTEozUGpDZ0ZU?=
 =?utf-8?B?QkkrejBYYXVoaXhVVGpwY0hoWW9zR0hsb2Rta0RCZGlBWEJDQUh2aG9qeGJo?=
 =?utf-8?B?QVZTdzR3NjhycU5oTWVUbmhoVDZ3Vzk1cHF2ZVBValFoRjhvM0VNbEpCNDFF?=
 =?utf-8?B?UUg2R25DcUYySjFXKzU3Tnk3dlNqV21JblgvRkJpdlkyMEh3cklNdlRwaWgv?=
 =?utf-8?B?MGc3bjNaZzBCekN3ZjcvcS9YWnFZVGpMUStaYmlta1FhWGJZUGpmWWRFemhl?=
 =?utf-8?B?dHVQOVFtOUJuREU5YkdLdWxldUtEVG5MLytHV2lRWnl1NElaeU40bXVucmNC?=
 =?utf-8?B?Q1RpRk92UjA2TlN2a2I5NGRGR2VSdXQ2cmNXSWJ4b201Ym9rby9RUWdXU3RF?=
 =?utf-8?B?WGpIOEM0MkZKZTlqNG5SclRCMXVIY2orMFF0MzVzVHZLSGYyL0dZYUd0WkFZ?=
 =?utf-8?B?ZWFnbVZlYk9WMkVuemFMd2Y0RjNhVUFQVklkdjh3azB2QmdpVEVkekdTdVhJ?=
 =?utf-8?B?WG9DMm93WUYrOTJBWUMzMzFZNDRMWmVTdzFpeHFTT0tnTEV6dVVxNm01VWgv?=
 =?utf-8?B?VUREK0FHU1NNckJBUHBseUdib2h1MTIyNzVoWUMvSWhaN0ZpZkFhQTFJamJL?=
 =?utf-8?B?b3oyQmcvaDR2NGY5VXRJdUF1eUNGaU0vT0szNERtNXFHTnVIL3h6SlhYcWh0?=
 =?utf-8?B?ZEV1LzNXY3AxY3BhQUJsMktFeE5tRVZhUVpnOTBuN2JLV1MrYytZY29nWWZn?=
 =?utf-8?B?TURzSDdiaHJEZUw2RTd6RWVnVGNBV0dNQ0tzV01LdkI0T2Vta21VNTRGcmo4?=
 =?utf-8?B?NGJXeWJjS1oraWFCWEJhRmxmRmxrZUZJUkRDZHZ5VzlXUWxRMlNHWW1iVGZm?=
 =?utf-8?B?OUx3Ni9ZQUxRNXplaEZWYTVpeW11TUFtQ2REZkxaWUIwRExLVVVXemI3M1Jn?=
 =?utf-8?B?VXZmQTFjb1g4TVk5Rnc2a2sxa3hlaFFOQzl6a2V0SCtPSjhBTVQ2Z21SQ21W?=
 =?utf-8?B?dkxyeGdCUEJGVkFZNzVUSW4yVWdKWFRGZG5LdEZMQ2lKb2FXTVBCUDUxZkZZ?=
 =?utf-8?B?VXh6S0ZlZXZTbEg0QXVPQnFnWUhyNWlSS09yMG1TTU9KdXlSY3EvREF1dWts?=
 =?utf-8?B?VVBodXpsdUkyKzhEcTVKMkQzYnpYNjNPV2pMZ3lONzR0bjVlZ3BwVDFIWGVJ?=
 =?utf-8?B?R3pEUzliY2xnNjVPMzAxVFdTUUw5ajFkbkIzeHFnTStPNVR5c2RGZjI0K3M4?=
 =?utf-8?B?cDlhTUxrL2FtVktESDlOUWlkQnlyUjZpQXZXcUN4Q3RVYys5Zkh5MnRQbWRm?=
 =?utf-8?B?NGc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f88711dc-eca3-41aa-fa4f-08dd341df626
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 22:02:24.6250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hAfXdo1ouECI7O1gglijIsB6X9Qn7KArKIV4/iiMhEOk9h0b67Yks3g2l3JT+r5+0zCOveQQf5teTDWDGDk5dz97+t+Zm+dMiHnqPMZHbc8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6738
X-Authority-Analysis: v=2.4 cv=DdLtqutW c=1 sm=1 tr=0 ts=67858d76 cx=c_pps a=oQ/SuO94mqEoePT5f2hFBg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=iGHA9ds3AAAA:8
 a=Q4-j1AaZAAAA:8 a=CjxXgO3LAAAA:8 a=t7CeM3EgAAAA:8 a=Ne-CZQTWt3hNvC8B28AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=jowTuj6vh6sA:10 a=SL86bAkrOMIOif6uAPIA:9 a=E0hDMgUxiyIqpjjl:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: tJz2-bHHJYX0EGhKlUKACLy3EgLTJNPB
X-Proofpoint-ORIG-GUID: Gax9fam4VGK8ttNvCqKIFrfoLuQ_cpZ4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-13_08,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2411120000 definitions=main-2501130173
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 22:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209764

--------------tMkD9SU7xVy07o9G5b4mEZ9a
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 50D7MoHG026701

On 2025-01-13 3:44 p.m., Christos Gavros via lists.openembedded.org wrote=
:
> Some users have reported issues which were caused because they were mis=
sing the right libstdc++-version-dev in their system.
> A new function with the name 'check_cpp_toolchain'  was added in sanity=
.bbclass in order to verify that the host system can compile and link suc=
cessfully a 'hello world' c++ code.
> In case the test fails , the build will abort
> Fixes [YOCTO #bug-15712]

Thanks for the patch. It's a good start!

Repeating what I said on IRC about the patchtest errors:

Maybe shortlog: sanity: test for cpp toolchain

Drop the meta-oe prefix, this is oe-core and your email will=20
automagically get an oe-core prefix as you can see above.

YP BZ # is optional but patchtest documented the expected format.

>
> Signed-off-by: Christos Gavros<gavrosc@yahoo.com>
> ---
>   meta/classes-global/sanity.bbclass | 40 +++++++++++++++++++++++++++++=
+
>   1 file changed, 40 insertions(+)
>
> diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/s=
anity.bbclass
> index 7b8a497d5a..ca7f8117d6 100644
> --- a/meta/classes-global/sanity.bbclass
> +++ b/meta/classes-global/sanity.bbclass
> @@ -780,6 +780,44 @@ def sanity_check_locale(d):
>       except locale.Error:
>           raise_sanity_error("Your system needs to support the en_US.UT=
F-8 locale.", d)
>  =20
> +def check_cpp_toolchain():
> +    # it checks if the c++ compiling and linking works properly in the=
 native system
The bug talks about testing, "linking to libstdc++" so best to mention th=
at
rather than have it implied.
> +    import os
> +    import subprocess
> +    from tempfile import NamedTemporaryFile
> +
> +    try:
> +        with NamedTemporaryFile(delete=3DFalse, suffix=3D".cpp") as cp=
p_file:
> +            cpp_code =3D """
> +            #include <iostream>
> +            int main() {
> +                std::cout << "Hello, World!" << std::endl;
> +                return 0;
> +            }
> +            """
> +            cpp_file.write(cpp_code.encode('utf-8'))
> +            cpp_file_name =3D cpp_file.name
> +
> +        output_binary =3D cpp_file_name + ".out"
> +        compile_command =3D ['g++', '-std=3Dc++17', cpp_file_name, '-o=
', output_binary]

Maybe use BUILD_CC here?

Oddly, that variable isn't in the docs but BUILD_CC_ARCH is:
https://docs.yoctoproject.org/ref-manual/variables.html#term-BUILD_CC_ARC=
H

CC-ing Antonin to see if that's a bug.


Yocto/OE supports=C2=A0 or would like support more than just GCC mostly f=
or=20
target
but it would be nice to use the compiler that BUILD_CC points to so that=20
there isn't
too much gcc hard-coded.


> +        result =3D subprocess.run(compile_command, stdout=3Dsubprocess=
.PIPE, stderr=3Dsubprocess.PIPE)
> +
> +        if result.returncode =3D=3D 0:
> +            #os.remove(cpp_file_name)
> +            #os.remove(output_binary)

Did you mean to leave these two lines commented out?
If so why? Add a comment explaining why if needed.

../Randy

> +            return False
> +        else:
> +            bb.fatal(f"C++ toolchain check failed during compilation o=
r linking. Error:\n{result.stderr.decode()}")
> +            return True
> +    except Exception as e:
> +        bb.fatal(f"An unexpected issue occured during the C++ toolchai=
n check {str(e)}")
> +        return True
> +    finally:
> +        if cpp_file_name and os.path.exists(cpp_file_name):
> +            os.remove(cpp_file_name)
> +        if output_binary and os.path.exists(output_binary):
> +            os.remove(output_binary)
> +
>   def check_sanity_everybuild(status, d):
>       import os, stat
>       # Sanity tests which test the users environment so need to run at=
 each build (or are so cheap
> @@ -975,6 +1013,8 @@ def check_sanity_everybuild(status, d):
>           # forms, such as /bin/dash, bin/bash, /bin/bash.bash ...
>           if '/dash' not in real_sh and '/bash' not in real_sh:
>               status.addresult("Error, /bin/sh links to %s, must be das=
h or bash\n" % real_sh)
> +
> +    check_cpp_toolchain()
>  =20
>   def check_sanity(sanity_data):
>       class SanityStatus(object):
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#209743):https://lists.openembedded.org/g/openembedd=
ed-core/message/209743
> Mute This Topic:https://lists.openembedded.org/mt/110595436/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [r=
andy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------tMkD9SU7xVy07o9G5b4mEZ9a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2025-01-13 3:44 p.m., Christos
      Gavros via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250113204447.14948-1-gavrosc@yahoo.com">
      <pre wrap="" class="moz-quote-pre">Some users have reported issues which were caused because they were missing the right libstdc++-version-dev in their system.
A new function with the name 'check_cpp_toolchain'  was added in sanity.bbclass in order to verify that the host system can compile and link successfully a 'hello world' c++ code.
In case the test fails , the build will abort
Fixes [YOCTO #bug-15712]</pre>
    </blockquote>
    <p>Thanks for the patch. It's a good start!</p>
    <p>Repeating what I said on IRC about the patchtest errors:<br>
      <br>
      Maybe shortlog: sanity: test for cpp toolchain<br>
    </p>
    <p>Drop the meta-oe prefix, this is oe-core and your email will
      automagically get an oe-core prefix as you can see above.<br>
    </p>
    <p>YP BZ # is optional but patchtest documented the expected format.
      <br>
    </p>
    <blockquote type="cite" cite="mid:20250113204447.14948-1-gavrosc@yahoo.com">
      <pre wrap="" class="moz-quote-pre">

Signed-off-by: Christos Gavros <a class="moz-txt-link-rfc2396E" href="mailto:gavrosc@yahoo.com">&lt;gavrosc@yahoo.com&gt;</a>
---
 meta/classes-global/sanity.bbclass | 40 ++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
index 7b8a497d5a..ca7f8117d6 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -780,6 +780,44 @@ def sanity_check_locale(d):
     except locale.Error:
         raise_sanity_error(&quot;Your system needs to support the en_US.UTF-8 locale.&quot;, d)
 
+def check_cpp_toolchain():
+    # it checks if the c++ compiling and linking works properly in the native system</pre>
    </blockquote>
    The bug talks about testing, &quot;linking to libstdc++&quot; so best to
    mention that<br>
    rather than have it implied.<br>
    <blockquote type="cite" cite="mid:20250113204447.14948-1-gavrosc@yahoo.com">
      <pre wrap="" class="moz-quote-pre">
+    import os
+    import subprocess
+    from tempfile import NamedTemporaryFile
+
+    try:
+        with NamedTemporaryFile(delete=False, suffix=&quot;.cpp&quot;) as cpp_file:
+            cpp_code = &quot;&quot;&quot;
+            #include &lt;iostream&gt;
+            int main() {
+                std::cout &lt;&lt; &quot;Hello, World!&quot; &lt;&lt; std::endl;
+                return 0;
+            }
+            &quot;&quot;&quot;
+            cpp_file.write(cpp_code.encode('utf-8'))
+            cpp_file_name = cpp_file.name
+
+        output_binary = cpp_file_name + &quot;.out&quot;
+        compile_command = ['g++', '-std=c++17', cpp_file_name, '-o', output_binary]</pre>
    </blockquote>
    <p>Maybe use BUILD_CC here?</p>
    <p>Oddly, that variable isn't in the docs but BUILD_CC_ARCH is:<br>
      &nbsp;
<a class="moz-txt-link-freetext" href="https://docs.yoctoproject.org/ref-manual/variables.html#term-BUILD_CC_ARCH">https://docs.yoctoproject.org/ref-manual/variables.html#term-BUILD_CC_ARCH</a></p>
    <p>CC-ing Antonin to see if that's a bug.</p>
    <p><br>
    </p>
    <p>Yocto/OE supports&nbsp; or would like support more than just GCC
      mostly for target<br>
      but it would be nice to use the compiler that BUILD_CC points to
      so that there isn't<br>
      too much gcc hard-coded.<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20250113204447.14948-1-gavrosc@yahoo.com">
      <pre wrap="" class="moz-quote-pre">
+        result = subprocess.run(compile_command, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
+
+        if result.returncode == 0:
+            #os.remove(cpp_file_name)  
+            #os.remove(output_binary)</pre>
    </blockquote>
    <p>Did you mean to leave these two lines commented out?<br>
      If so why? Add a comment explaining why if needed.<br>
    </p>
    <p>../Randy<br>
    </p>
    <blockquote type="cite" cite="mid:20250113204447.14948-1-gavrosc@yahoo.com">
      <pre wrap="" class="moz-quote-pre">
+            return False
+        else:
+            bb.fatal(f&quot;C++ toolchain check failed during compilation or linking. Error:\n{result.stderr.decode()}&quot;)
+            return True
+    except Exception as e:
+        bb.fatal(f&quot;An unexpected issue occured during the C++ toolchain check {str(e)}&quot;)
+        return True
+    finally:
+        if cpp_file_name and os.path.exists(cpp_file_name):
+            os.remove(cpp_file_name)
+        if output_binary and os.path.exists(output_binary):
+            os.remove(output_binary)
+
 def check_sanity_everybuild(status, d):
     import os, stat
     # Sanity tests which test the users environment so need to run at each build (or are so cheap
@@ -975,6 +1013,8 @@ def check_sanity_everybuild(status, d):
         # forms, such as /bin/dash, bin/bash, /bin/bash.bash ...
         if '/dash' not in real_sh and '/bash' not in real_sh:
             status.addresult(&quot;Error, /bin/sh links to %s, must be dash or bash\n&quot; % real_sh)
+    
+    check_cpp_toolchain()
 
 def check_sanity(sanity_data):
     class SanityStatus(object):
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#209743): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/209743">https://lists.openembedded.org/g/openembedded-core/message/209743</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/110595436/3616765">https://lists.openembedded.org/mt/110595436/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------tMkD9SU7xVy07o9G5b4mEZ9a--

