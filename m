Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92778FF885A
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 13:30:14 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13481.1777383010515708951
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Apr 2026 06:30:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=N8olDChl;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=95783696db=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SA1xow1769342
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 06:30:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=dTlIf8zY+Yu2R+Uy2EjWvG
	RqsmXnWrkaC7J613M4nN0=; b=N8olDChlTtS+lCjZdxUCCFJ89Ha8B1zGJk29Ce
	eM3HcfMRDYOJ7l1wPO13JpCSsbqgyDidK6GSk20mmO16JYvTHVqcv9qbYjEojm3Z
	7UDqqVr9/2sQtkR/8PkdeNQVIV/WZt++Rzwmd1tLPBOGW60E7QoMi2iDy5LATi9w
	iE9RC8RVGPnRySBYC8BjRu/D0gSAEIAgqDqbcG4AJBxSon/97x0bapp77ykGm38s
	HbjwVtAtjaIv5VPVzYWZMaoJUg11chtP6JC7bLiVuDRtLx9Q6/5je4k49zs8QHJ3
	KFVwK2Vt0TSNrSmaxHblldoz+C4eUbL7zVubkyAncfA+NsEA==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012067.outbound.protection.outlook.com [40.107.209.67])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4drrw2u9pe-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 06:30:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=abdghYzfCMn+pTxdrsXNmkcZqb+tNDioPJiNWSjfcUqybaskBG4tSe3rgsjJOSuF+112y9lkBmODjvj8YXZ0jj07BGY3GsubTLVDMAKQ514cBD/aXjIC6leEXa1xA1e1OkiKfQ8k/s+3Pn4X9JccCL+k+F4GkfbVY3eUKnRJUXotRYy3Gq309LVXx7iH0X96u95gDHBKGCnnpZAJmovZTMCA1yidwXdb10jcrd5UNO2pdGFGnatxESLyY6tXhJbMnsvmQ/oDI6csM/RFXX6rzH3yqXz4IB0CC/GK0hhpMs3zYHTpYd1xqYWf3GsdvryvfmTCWAjzUuPDdNaBPrMISw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dTlIf8zY+Yu2R+Uy2EjWvGRqsmXnWrkaC7J613M4nN0=;
 b=aWSCQYNZTmTOqknTuOMoDSfZ+k13/LVDeLk2yn0etEFpW7nPd/B1Bv7TAPsqlMRA7794OVApzX8Z13KjzwpEKke+5E0SAe4CZQfDr5gHe9QON3SBbVZHhG385IQYoaOM8AqodL14oUv3e0aSWdrdQfMm7zpk2DEp5O07G6ph/0uKJqw2Z8buGbR5DVPNLZ0YRr1OJtQt4VDkjwp7p5b4vgJchSXrE7k13ITBg6tUrsvryDV61pUxrDIrbQ22z34RvLZKjVLQ/Mw8NY/t794arWQX53XBcnow8y0gvK3aC1BHMNp1C/Ir5mznNa9F6BtHazYV/4rAWExv3wOWClODVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by DM3PPF74831EF4B.namprd11.prod.outlook.com (2603:10b6:f:fc00::f2e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Tue, 28 Apr
 2026 13:30:06 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%4]) with mapi id 15.20.9870.016; Tue, 28 Apr 2026
 13:30:05 +0000
Content-Type: multipart/alternative;
 boundary="------------QBYkgfhkgn2f8S0jtX9A05Am"
Message-ID: <9a602ba5-4b01-4c18-8424-f5e62d565dc6@windriver.com>
Date: Tue, 28 Apr 2026 09:30:04 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] cups: fix CVE-2026-27447
To: abhishek.bachiphale@windriver.com,
        openembedded-core@lists.openembedded.org
References: <20260428114053.3136319-1-Abhishek.Bachiphale@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20260428114053.3136319-1-Abhishek.Bachiphale@windriver.com>
X-ClientProxiedBy: YT4PR01CA0285.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:109::23) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|DM3PPF74831EF4B:EE_
X-MS-Office365-Filtering-Correlation-Id: cacd370b-1387-4bf5-a43c-08dea52a426f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|376014|1800799024|366016|22082099003|18002099003|56012099003|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	cmH3Hu1Ej349HXwNAZKxtjNsDgpcEmn1avtGorsO1izWYJ6cOV26zvuC8hfFvasXlE/nTDCC9DtZwQPks/ygBi3s/jobyLQB0By2gxEELkDg7wvIZcJ+yl7t+ieWpW/4xAPop046pfqaDAnUft/qRMeqVeP2IXQ0MhlrQm5z5FY67qdnXvIJaJKH3I/D3V4tLv8NQgBYUKM3U8ESqYoifn2MyJtmjoRWGhsWFQsjliMOE5EYaMJWGBsMF6PFqoVJCHVHmmIBE+PXzid13MpIseH+kJ6VAGI0x/p2KSiYNktXYkWiXZiUW3IqrQg91HBXedXQObyCYA+SdZ1U+nciLqqW8lQqoPiMwLZjEn6ymfv6T9qgs9bI16tCAqIQ+9T4O49Obd2BNHU0DvhJ3fYMyuJsv5KyUwck46CnDONa4DI9qliXoK8T8lb0AZyzZL5UoSxSBaVzUxPSAHC/v40PcPhcs+ccNAErgf5oMewC5M2QYfglZ0mDrm9EQTEubCP9ECSMs+n1T+8MzVU1ck13BEwH+Dm6hO+45arwRiLVN0rM1+7XahCbWR9+kvWuLgBgZrRscFmG7PXHqDMMmAUATo7I03+keNPG7AY2O23nOEhmho0hgs/6kVGKigcCNYyx8XmPd3AMSr3IB0rjGQw/qajbJiynGhU4sLzCMaBYNUix+sxaTREqO9FVlHDo1xik+Ax02i5NrqJbpoCShPfnCw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099003)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cTNORkNVQ0twWWMvTmUyRlQ3RHNLd2pMMHpEVDdMWlhLTEx1THVqZHltb09K?=
 =?utf-8?B?Vlh6QTZHQlBqQXRZWmtkYmdCVHVUZlRzSkRwUzM2Q0RYaEtUNG4wRzFuRlFJ?=
 =?utf-8?B?dnpESmlQbEh5dEo0TE9Gb0NCaWZNdFExNEZvRWpNMVRoUFZyc0o2dkMzQmxS?=
 =?utf-8?B?K1cvTVNRcmZhcGJTdldoeXpxYkFPbFc3dmpUSXU4VlUvSUJIaVdPNkxIOUNM?=
 =?utf-8?B?K3FLZGZOWHNTdVJ0elQvS25xZkpTZXZBd0Q1bFZyT2RaN2J6RFdVaUo2cGp0?=
 =?utf-8?B?dzV1WVNFc0FmbmpyMnRGTW9uRUNyY0Yvbi9RQ3pxeTdPZTc3THNCSlZockw2?=
 =?utf-8?B?ZFdxUjdySXZvelVqNzFuZ2lwa0hVejhBbmdnMEJhMVozaHZNMkpLWUh1Rld5?=
 =?utf-8?B?U3VMaGdNUHBoT3g1Z3ptMXB3MWh1NzVmQ3dpQXRsT0hLRE9tNEpneUV4V3RG?=
 =?utf-8?B?MUoyZ3puMmgycWYySVZka1FJSktGYkl6RU9HMVVQWXlBQjVGTEw0QkRRZTEy?=
 =?utf-8?B?cXUxZVI3YWc0eU1WaEpSVStWaUI4WlRFK1pOYnd5QnVwZDBpN0tQZjBJbExY?=
 =?utf-8?B?TkJ6d0ZyamU4S1NqcmdFWVhCTGZaQS9WckhlQkxaNUp6T2UwcFAyYjVmUHF6?=
 =?utf-8?B?WGJXR2xWY0FoU211b0NGV3lydzdqZkVYSmdZU0syZXRLbUxIM0thSklQaVNX?=
 =?utf-8?B?bWNPak1kRzRtVUNZMEREcWRjUUphOHdFU2Z4YWFlNStmTGtPWlc1bnJZR1Iw?=
 =?utf-8?B?YmtETzVZaGxxbVMyUG9id2Erc0gzVjhueTk5ekthaCtyTnNYVDJXUEgxRktu?=
 =?utf-8?B?eWRWcEJHK2oweUM1Qm1aK3ZkcEZBOTVnOU1MWlc3Zll1Z25zOG1RUVpxSlRN?=
 =?utf-8?B?Umd3Wk9QMmFvSzBiN0JXeDc0eUxDVDU4YlFnQ2JOUHJaUEJZV215YTVmWXJw?=
 =?utf-8?B?ZHFZVEQ4dVExdnpyZy8wbjNPclJnb2RqdjV3Zy9qekxNMUlyRjlvNzRGRzBk?=
 =?utf-8?B?dVlnZTZWTlh3bEVyWGViMUN5TjhKZTZGRE5WZG1naG92ZnFmYklMV3ZvNDlK?=
 =?utf-8?B?QzdmOVdCUHBrQ3pRVjJyK2RBNWFiMTBkTkZXOFpTbVZKY3R6UUI3MnRHaWVp?=
 =?utf-8?B?YzFac3c5cGlWcEdtaE9xZUpmYjBLUWE0ZW01NWdpZnoxeFZBbU5wYjNCRmkr?=
 =?utf-8?B?OHp4YWpIc3FsY1ViaHVPVGVtOTJsRnlHbUIyK1pTeXJTNjNCYTdWRFdmM3BB?=
 =?utf-8?B?QUN2NVFscHphK1F6eWVBVEl4bnhtelpEeU1aOGhBc3ZNdjZQYnJDT3BMeXRz?=
 =?utf-8?B?YUc4dTRYQlBtMXJqeE5rV3g2WkhaUjVnUldtV0l2YVkyWTlzeUVRYkxsa0k2?=
 =?utf-8?B?TDFJNDV0VWs4bjZLeEFXZzZnSEdRSVB5bHB0ekpIeVNBT1NsUm9FaG9PM2Fm?=
 =?utf-8?B?QU02a2FZU1NYaUNFeHZvTUNrMzdrUzdtRFFlZE9UckdNRElUTmNJK2NuTCtV?=
 =?utf-8?B?dzZ3RDZsVkE0SFlwaC92VENHR3BpdHVvZ1RPTGxFeDBpMHpKdlJGVjMwa3FC?=
 =?utf-8?B?bnBCcGY4ODZyZ2xPakF1TmJHZ1BaTzBDVDVuazZlMmMzOCtIekZDZzRzNFpY?=
 =?utf-8?B?L1U1TWxPUngzbWdBMEFmdHpqaXBxRDQ5MEVlUDZzQ0RocWl2L1hzWTZSM2tk?=
 =?utf-8?B?NVFyNzJhcFV2WEpIc2RmcmV4bzF0OTV5UzU3K2FwOUYrY3BOdXozM0dhblFD?=
 =?utf-8?B?aXZKTWJVbmJGRmhCbXBaUUhNSXM0TkpSMDFYRldxUVJHc2hkb1ZSekR0NEp1?=
 =?utf-8?B?a0UyWDlNSUwzT3R1MUhaaFpXTnJsNE1CbUVVRjVTUTVHU0V0MkhkQ3NUNnlk?=
 =?utf-8?B?Ykx2YTJBWDk1aHpneTZyY3BQbHppcGZaejFGcWRJMk93RWFna1pjaklBSnFv?=
 =?utf-8?B?RlJJRWtwK1pOUEExRWw5bEFkLzh6UUhXYm40TjJuK25zSnBZWUpSVnRUK0tv?=
 =?utf-8?B?VnRBTFdoVjhHYTdyTVc5RnJIaVZ4am81ZVBqU21KTmFhanljYTdqb05rVUxW?=
 =?utf-8?B?UXZkUC8vWWhHb0ZUVUpPQjNiODZML2lQWENsU24wWnYvK0RZN01NWGxCL25y?=
 =?utf-8?B?REdxNzFGQWtaeWpBOXZKcnZlcTVkWmJCSHovUkV4SHJyTlNvZ2QvRkV3bGhZ?=
 =?utf-8?B?WlFibU5tdWdVakxuV0pQLzNHV1F6ZStpZXlrdEQ0dlNrRCtic3dIZnVPMFZM?=
 =?utf-8?B?OTMxS2NLd1JCZGtQeHpTT0ZyRVR6SXJQZ1l4aGZkc3pKUmxnamZmTUN5dTRy?=
 =?utf-8?B?bUJjSkg4WDNWRFZKdlVYLzNmcHJkTSsvMmFwbzczTmNWL3dhcU4xaHpXbHQ3?=
 =?utf-8?Q?e8Z42I9BYAFxwHbU=3D?=
X-Exchange-RoutingPolicyChecked: 
	maDKNj0yzgtN9ekQzRis8Sa/seHQqoF4NvKcNgR+oVmH79JJ4MGjz/7wFFOJmFLasgDX3P+5tjYDkZ5zLdDUeaWiiYRV2gMdAv3ldgySpMHvQ4mm9KCMbzHyiXbjrn6t9lilr6gaQlAGp9zyaOHhJMsKVoTs3AiW0QV9Vq/1AehWdoYObxCljSV1o63z7XyXRHOZt43PrjnYapUqQg3Y569Jc8DgFtt6UVDC8W3W81wHDCHdYfUSnR0ll3SGY4KVrm1F083FTEmffA6gKCipZZnEOLKc65NVdV6sZiLGaaeJwVBkXwa8EtcZlloRMxLukFOE+ClT3YYvcBLKHJNv+Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cacd370b-1387-4bf5-a43c-08dea52a426f
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 13:30:05.6525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ERz9gjo7bfG8eWZzVQsoNelFovkuZ2Sv4XYqO+1YoMIFpNZoHc7O2wtUwxjYCaYlt6SZsjWoPIeGHsStk/4lgOgeetIDmPXvbcQNQwsDn5U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF74831EF4B
X-Proofpoint-GUID: 493ToCLkvLTT4e5-nkznnozqBn8Nxl_B
X-Proofpoint-ORIG-GUID: 493ToCLkvLTT4e5-nkznnozqBn8Nxl_B
X-Authority-Analysis: v=2.4 cv=Pu+jqQM3 c=1 sm=1 tr=0 ts=69f0b661 cx=c_pps
 a=nfJ3K52CLbhVQgIdADXVOg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=PYnjg3YJAAAA:8
 a=NEAV23lmAAAA:8 a=F_ubicZDAAAA:20 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=Z07mG_qPLiWaa6-zcZkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=HmwRRRhgUPrKKVTBemsA:9 a=SXXaxkvPU_F9O6rw:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEyNiBTYWx0ZWRfX/CrT1UYICYH0
 hQL8lbZxjQ2BEXdSTN1BUWDY7nsx+VfugQAH0/dlVf+ZVCun38MHSfl0bHLmpjkRWt7NFLwwIev
 an84y8teoUqykgnctUQtMB1lZHm77Uj+BdfE5YNpCv1GrZu+c0Dv+FKwQPPv5z3DvtILuEla2g5
 3/y84E1VOiC4AgxVveonPreKMRxMMSFsZ4C3VhTher3xtXQXvRfKSjHJbjB3nGJmnCsga+vg+ka
 62WEG3RD0Wc6+b349S8hzlKaCWPUV0L0Q9u4AdbiQgrdUqH7PgboNarsifvOLhUO7EB6pyRzm7/
 mdhklZtyxh6EKii8LvwMCrSmuElmz/yB0SJWtMdmawDORMfQCKbfVbKilWMhFAkhtzlx25sntlW
 zVGjDigDDxg6qMHZFHRdwhP78/LmiMHf9L2FKIzZexUPMVJtp2q7062EykZCG0aF6jehDPKD7sw
 6wnW42XtxOVbr617mxw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280126
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 13:30:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236063

--------------QBYkgfhkgn2f8S0jtX9A05Am
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 63SA1xow1769342

On 2026-04-28 07:40, Abhishek Bachiphale via lists.openembedded.org wrote=
:
> In versions 2.4.16 and prior, CUPS daemon (cupsd) contains an authoriza=
tion bypass
> vulnerability due to case-insensitive username comparison during author=
ization checks.
> The vulnerability allows an unprivileged user to gain unauthorized acce=
ss to
> restricted operations by using a user with a username that differs only
> in case from an authorized user.


We looked at the diff between git commit in cups' git repo and
you patch and you changed a few things. Please always mentioned
in the commit log, if and why you changed the upstream patch.

You can even comment about adjust the patch offset line numbers.

You changed:


Some whitespace. Those can be ignored but it's better to eliminate those=20
differences, IMO.


-- * Copyright =C2=A9 2020-2025 by OpenPrinting.
+- * Copyright =C2=A9 2020-2024 by OpenPrinting.

It's in a comment so while it's harmless, it's not good practice
since you have not made enough of a change in the patch to change the
copyright year and you do no represent OpenPrinting.


-=C2=A0 =C2=A0 =C2=A0 =C2=A0return (HTTP_STATUS_OK);
+=C2=A0 =C2=A0 =C2=A0return (HTTP_OK);

so you should explain why you changed that. Are those #defines and do=20
they have the
same value and meaning to developers.

Also there's an update to 2.4.19 and you patch does apply on top of that.

Please send a v2.


../Randy

>
> Reference:
> [https://nvd.nist.gov/vuln/detail/CVE-2026-27447 ]
> [https://github.com/OpenPrinting/cups/security/advisories/GHSA-v987-m8h=
p-phj9 ]
>
> Upstream-Status: Backport
> [https://github.com/OpenPrinting/cups/commit/88516bf6d9e34cef7a64a704b8=
56b837f70cd220 ]
>
> Signed-off-by: Abhishek Bachiphale<Abhishek.Bachiphale@windriver.com>
> ---
>   meta/recipes-extended/cups/cups.inc           |   1 +
>   .../cups/cups/CVE-2026-27447.patch            | 102 +++++++++++++++++=
+
>   2 files changed, 103 insertions(+)
>   create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-27447.pat=
ch
>
> diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extende=
d/cups/cups.inc
> index 2724ce72fb..e3562c10dd 100644
> --- a/meta/recipes-extended/cups/cups.inc
> +++ b/meta/recipes-extended/cups/cups.inc
> @@ -15,6 +15,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/cups-=
${PV}-source.tar.gz \
>              file://0004-cups-fix-multilib-install-file-conflicts.patch=
 \
>              file://volatiles.99_cups \
>              file://cups-volatiles.conf \
> +file://CVE-2026-27447.patch \
>              "
>  =20
>   GITHUB_BASE_URI =3D"https://github.com/OpenPrinting/cups/releases"
> diff --git a/meta/recipes-extended/cups/cups/CVE-2026-27447.patch b/met=
a/recipes-extended/cups/cups/CVE-2026-27447.patch
> new file mode 100644
> index 0000000000..a4d444078b
> --- /dev/null
> +++ b/meta/recipes-extended/cups/cups/CVE-2026-27447.patch
> @@ -0,0 +1,102 @@
> +From 99750490becf1ce88a280451e056d09fe765c5c3 Mon Sep 17 00:00:00 2001
> +From: Abhishek Bachiphale<Abhishek.Bachiphale@windriver.com>
> +Date: Fri, 24 Apr 2026 11:22:22 +0000
> +Subject: [PATCH] CVE-2026-27447: The scheduler treated local user and =
group
> + names as case-insensitive.
> +
> +CVE: CVE-2026-27447
> +
> +Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit=
/88516bf6d9e34cef7a64a704b856b837f70cd220 ]
> +
> +Signed-off-by: Abhishek Bachiphale<Abhishek.Bachiphale@windriver.com>
> +---
> + scheduler/auth.c | 33 ++++++++++++++++-----------------
> + 1 file changed, 16 insertions(+), 17 deletions(-)
> +
> +diff --git a/scheduler/auth.c b/scheduler/auth.c
> +index bd0d28a..c05b1b8 100644
> +--- a/scheduler/auth.c
> ++++ b/scheduler/auth.c
> +@@ -1,7 +1,7 @@
> + /*
> +  * Authorization routines for the CUPS scheduler.
> +  *
> +- * Copyright =C2=A9 2020-2024 by OpenPrinting.
> ++ * Copyright =C2=A9 2020-2026 by OpenPrinting.
> +  * Copyright =C2=A9 2007-2019 by Apple Inc.
> +  * Copyright =C2=A9 1997-2007 by Easy Software Products, all rights r=
eserved.
> +  *
> +@@ -1184,7 +1184,7 @@ cupsdCheckGroup(
> +   group =3D getgrnam(groupname);
> +   endgrent();
> +
> +-  if (group !=3D NULL)
> ++  if (user && group)
> +   {
> +    /*
> +     * Group exists, check it...
> +@@ -1198,7 +1198,7 @@ cupsdCheckGroup(
> +       * User appears in the group membership...
> +       */
> +
> +-      if (!_cups_strcasecmp(username, group->gr_mem[i]))
> ++      if (!strcmp(user->pw_name, group->gr_mem[i]))
> + 	return (1);
> +     }
> +
> +@@ -1209,25 +1209,24 @@ cupsdCheckGroup(
> +     * belongs to...
> +     */
> +
> +-    if (user)
> +-    {
> +-      int	ngroups;		/* Number of groups */
> ++    int		ngroups;		/* Number of groups */
> + #  ifdef __APPLE__
> +-      int	groups[2048];		/* Groups that user belongs to */
> ++    int		groups[2048];		/* Groups that user belongs to */
> + #  else
> +-      gid_t	groups[2048];		/* Groups that user belongs to */
> ++    gid_t		groups[2048];		/* Groups that user belongs to */
> + #  endif /* __APPLE__ */
> +
> +-      ngroups =3D (int)(sizeof(groups) / sizeof(groups[0]));
> ++    ngroups =3D (int)(sizeof(groups) / sizeof(groups[0]));
> + #  ifdef __APPLE__
> +-      getgrouplist(username, (int)user->pw_gid, groups, &ngroups);
> ++    getgrouplist(user->pw_name, (int)user->pw_gid, groups, &ngroups);
> + #  else
> +-      getgrouplist(username, user->pw_gid, groups, &ngroups);
> ++    getgrouplist(user->pw_name, user->pw_gid, groups, &ngroups);
> + #endif /* __APPLE__ */
> +
> +-      for (i =3D 0; i < ngroups; i ++)
> +-        if ((int)groupid =3D=3D (int)groups[i])
> +-	  return (1);
> ++    for (i =3D 0; i < ngroups; i ++)
> ++    {
> ++      if ((int)groupid =3D=3D (int)groups[i])
> ++       return (1);
> +     }
> + #endif /* HAVE_GETGROUPLIST */
> +   }
> +@@ -1836,8 +1835,8 @@ cupsdIsAuthorized(cupsd_client_t *con,	/* I - Co=
nnection */
> + 	 name;
> + 	 name =3D (char *)cupsArrayNext(best->names))
> +     {
> +-      if (!_cups_strcasecmp(name, "@OWNER") && owner &&
> +-          !_cups_strcasecmp(username, ownername))
> ++      if (!_cups_strcasecmp(name, "@OWNER") && owner && pw &&
> ++           !strcmp(pw->pw_name, ownername))
> + 	return (HTTP_OK);
> +       else if (!_cups_strcasecmp(name, "@SYSTEM"))
> +       {
> +@@ -1849,7 +1848,7 @@ cupsdIsAuthorized(cupsd_client_t *con,	/* I - Co=
nnection */
> +         if (cupsdCheckGroup(username, pw, name + 1))
> +           return (HTTP_OK);
> +       }
> +-      else if (!_cups_strcasecmp(username, name))
> ++      else if (pw && !strcmp(pw->pw_name, name))
> +         return (HTTP_OK);
> +     }
> +
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#236055):https://lists.openembedded.org/g/openembedd=
ed-core/message/236055
> Mute This Topic:https://lists.openembedded.org/mt/119046261/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [r=
andy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------QBYkgfhkgn2f8S0jtX9A05Am
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 63SA1xow1769342

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <head>

   =20
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2026-04-28 07:40, Abhishek
      Bachiphale via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:20260428114053.3136319-1-Abhish=
ek.Bachiphale@windriver.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">In versions 2.4.16 and prior=
, CUPS daemon (cupsd) contains an authorization bypass
vulnerability due to case-insensitive username comparison during authoriz=
ation checks.
The vulnerability allows an unprivileged user to gain unauthorized access=
 to
restricted operations by using a user with a username that differs only
in case from an authorized user.</pre>
    </blockquote>
    <p><br>
    </p>
    <p>We looked at the diff between git commit in cups' git repo and&nbs=
p;<br>
      you patch and you changed a few things. Please always mentioned&nbs=
p;<br>
      in the commit log, if and why you changed the upstream patch.<br>
      <br>
      You can even comment about adjust the patch offset line numbers.<br=
>
      <br>
      You changed:</p>
    <p><br>
      Some whitespace. Those can be ignored but it's better to eliminate
      those differences, IMO.</p>
    <p><br>
    </p>
    <p>-- * Copyright =C2=A9 2020-2025 by OpenPrinting.<br>
      +- * Copyright =C2=A9 2020-2024 by OpenPrinting.</p>
    <p>It's in a comment so while it's harmless, it's not good practice<b=
r>
      since you have not made enough of a change in the patch to change
      the<br>
      copyright year and you do no represent OpenPrinting.</p>
    <p><br>
    </p>
    <p>-&nbsp; &nbsp; &nbsp; &nbsp;return (HTTP_STATUS_OK);<br>
      +&nbsp; &nbsp; &nbsp;return (HTTP_OK);</p>
    <p>so you should explain why you changed that. Are those #defines
      and do they have the&nbsp;<br>
      same value and meaning to developers.&nbsp;<br>
      <br>
      Also there's an update to 2.4.19 and you patch does apply on top
      of that.<br>
      <br>
      Please send a v2.<br>
      <br>
      <br>
      ../Randy</p>
    <blockquote type=3D"cite" cite=3D"mid:20260428114053.3136319-1-Abhish=
ek.Bachiphale@windriver.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">

Reference:
[ <a class=3D"moz-txt-link-freetext" href=3D"https://nvd.nist.gov/vuln/de=
tail/CVE-2026-27447">https://nvd.nist.gov/vuln/detail/CVE-2026-27447</a> =
]
[ <a class=3D"moz-txt-link-freetext" href=3D"https://github.com/OpenPrint=
ing/cups/security/advisories/GHSA-v987-m8hp-phj9">https://github.com/Open=
Printing/cups/security/advisories/GHSA-v987-m8hp-phj9</a> ]

Upstream-Status: Backport
[ <a class=3D"moz-txt-link-freetext" href=3D"https://github.com/OpenPrint=
ing/cups/commit/88516bf6d9e34cef7a64a704b856b837f70cd220">https://github.=
com/OpenPrinting/cups/commit/88516bf6d9e34cef7a64a704b856b837f70cd220</a>=
 ]

Signed-off-by: Abhishek Bachiphale <a class=3D"moz-txt-link-rfc2396E" hre=
f=3D"mailto:Abhishek.Bachiphale@windriver.com">&lt;Abhishek.Bachiphale@wi=
ndriver.com&gt;</a>
---
 meta/recipes-extended/cups/cups.inc           |   1 +
 .../cups/cups/CVE-2026-27447.patch            | 102 ++++++++++++++++++
 2 files changed, 103 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-27447.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/=
cups/cups.inc
index 2724ce72fb..e3562c10dd 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -15,6 +15,7 @@ SRC_URI =3D &quot;${GITHUB_BASE_URI}/download/v${PV}/cu=
ps-${PV}-source.tar.gz \
            <a class=3D"moz-txt-link-freetext" href=3D"file://0004-cups-f=
ix-multilib-install-file-conflicts.patch">file://0004-cups-fix-multilib-i=
nstall-file-conflicts.patch</a> \
            <a class=3D"moz-txt-link-freetext" href=3D"file://volatiles.9=
9_cups">file://volatiles.99_cups</a> \
            <a class=3D"moz-txt-link-freetext" href=3D"file://cups-volati=
les.conf">file://cups-volatiles.conf</a> \
+           <a class=3D"moz-txt-link-freetext" href=3D"file://CVE-2026-27=
447.patch">file://CVE-2026-27447.patch</a> \
            &quot;
=20
 GITHUB_BASE_URI =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"https://g=
ithub.com/OpenPrinting/cups/releases">&quot;https://github.com/OpenPrinti=
ng/cups/releases&quot;</a>
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-27447.patch b/meta/=
recipes-extended/cups/cups/CVE-2026-27447.patch
new file mode 100644
index 0000000000..a4d444078b
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-27447.patch
@@ -0,0 +1,102 @@
+From 99750490becf1ce88a280451e056d09fe765c5c3 Mon Sep 17 00:00:00 2001
+From: Abhishek Bachiphale <a class=3D"moz-txt-link-rfc2396E" href=3D"mai=
lto:Abhishek.Bachiphale@windriver.com">&lt;Abhishek.Bachiphale@windriver.=
com&gt;</a>
+Date: Fri, 24 Apr 2026 11:22:22 +0000
+Subject: [PATCH] CVE-2026-27447: The scheduler treated local user and gr=
oup
+ names as case-insensitive.
+
+CVE: CVE-2026-27447
+
+Upstream-Status: Backport [ <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://github.com/OpenPrinting/cups/commit/88516bf6d9e34cef7a64a704b856b8=
37f70cd220">https://github.com/OpenPrinting/cups/commit/88516bf6d9e34cef7=
a64a704b856b837f70cd220</a> ]
+
+Signed-off-by: Abhishek Bachiphale <a class=3D"moz-txt-link-rfc2396E" hr=
ef=3D"mailto:Abhishek.Bachiphale@windriver.com">&lt;Abhishek.Bachiphale@w=
indriver.com&gt;</a>
+---
+ scheduler/auth.c | 33 ++++++++++++++++-----------------
+ 1 file changed, 16 insertions(+), 17 deletions(-)
+
+diff --git a/scheduler/auth.c b/scheduler/auth.c
+index bd0d28a..c05b1b8 100644
+--- a/scheduler/auth.c
++++ b/scheduler/auth.c
+@@ -1,7 +1,7 @@
+ /*
+  * Authorization routines for the CUPS scheduler.
+  *
+- * Copyright =C2=A9 2020-2024 by OpenPrinting.
++ * Copyright =C2=A9 2020-2026 by OpenPrinting.
+  * Copyright =C2=A9 2007-2019 by Apple Inc.
+  * Copyright =C2=A9 1997-2007 by Easy Software Products, all rights res=
erved.
+  *
+@@ -1184,7 +1184,7 @@ cupsdCheckGroup(
+   group =3D getgrnam(groupname);
+   endgrent();
+=20
+-  if (group !=3D NULL)
++  if (user &amp;&amp; group)
+   {
+    /*
+     * Group exists, check it...
+@@ -1198,7 +1198,7 @@ cupsdCheckGroup(
+       * User appears in the group membership...
+       */
+=20
+-      if (!_cups_strcasecmp(username, group-&gt;gr_mem[i]))
++      if (!strcmp(user-&gt;pw_name, group-&gt;gr_mem[i]))
+ 	return (1);
+     }
+=20
+@@ -1209,25 +1209,24 @@ cupsdCheckGroup(
+     * belongs to...
+     */
+=20
+-    if (user)
+-    {
+-      int	ngroups;		/* Number of groups */
++    int		ngroups;		/* Number of groups */
+ #  ifdef __APPLE__
+-      int	groups[2048];		/* Groups that user belongs to */
++    int		groups[2048];		/* Groups that user belongs to */
+ #  else
+-      gid_t	groups[2048];		/* Groups that user belongs to */
++    gid_t		groups[2048];		/* Groups that user belongs to */
+ #  endif /* __APPLE__ */
+=20
+-      ngroups =3D (int)(sizeof(groups) / sizeof(groups[0]));
++    ngroups =3D (int)(sizeof(groups) / sizeof(groups[0]));
+ #  ifdef __APPLE__
+-      getgrouplist(username, (int)user-&gt;pw_gid, groups, &amp;ngroups=
);
++    getgrouplist(user-&gt;pw_name, (int)user-&gt;pw_gid, groups, &amp;n=
groups);
+ #  else
+-      getgrouplist(username, user-&gt;pw_gid, groups, &amp;ngroups);
++    getgrouplist(user-&gt;pw_name, user-&gt;pw_gid, groups, &amp;ngroup=
s);
+ #endif /* __APPLE__ */
+=20
+-      for (i =3D 0; i &lt; ngroups; i ++)
+-        if ((int)groupid =3D=3D (int)groups[i])
+-	  return (1);
++    for (i =3D 0; i &lt; ngroups; i ++)
++    {
++      if ((int)groupid =3D=3D (int)groups[i])
++       return (1);
+     }
+ #endif /* HAVE_GETGROUPLIST */
+   }
+@@ -1836,8 +1835,8 @@ cupsdIsAuthorized(cupsd_client_t *con,	/* I - Conn=
ection */
+ 	 name;
+ 	 name =3D (char *)cupsArrayNext(best-&gt;names))
+     {
+-      if (!_cups_strcasecmp(name, &quot;@OWNER&quot;) &amp;&amp; owner =
&amp;&amp;
+-          !_cups_strcasecmp(username, ownername))
++      if (!_cups_strcasecmp(name, &quot;@OWNER&quot;) &amp;&amp; owner =
&amp;&amp; pw &amp;&amp;
++           !strcmp(pw-&gt;pw_name, ownername))
+ 	return (HTTP_OK);
+       else if (!_cups_strcasecmp(name, &quot;@SYSTEM&quot;))
+       {
+@@ -1849,7 +1848,7 @@ cupsdIsAuthorized(cupsd_client_t *con,	/* I - Conn=
ection */
+         if (cupsdCheckGroup(username, pw, name + 1))
+           return (HTTP_OK);
+       }
+-      else if (!_cups_strcasecmp(username, name))
++      else if (pw &amp;&amp; !strcmp(pw-&gt;pw_name, name))
+         return (HTTP_OK);
+     }
+=20
</pre>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre wrap=3D"" class=3D"moz-quote-pre">-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#236055): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/236055">https:/=
/lists.openembedded.org/g/openembedded-core/message/236055</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/119046261/3616765">https://lists.openembedded.org/mt=
/119046261/3616765</a>
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

--------------QBYkgfhkgn2f8S0jtX9A05Am--

