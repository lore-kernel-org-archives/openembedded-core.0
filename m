Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D8F2C282C5
	for <webhook@archiver.kernel.org>; Mon,  3 Mar 2025 07:15:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.48154.1740986139381448675
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Mar 2025 23:15:39 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=51577121b9=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52369BN7004754
	for <openembedded-core@lists.openembedded.org>; Mon, 3 Mar 2025 07:15:38 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 453s789tvy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 03 Mar 2025 07:15:38 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5237Fb6H004280;
	Mon, 3 Mar 2025 07:15:37 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2171.outbound.protection.outlook.com [104.47.58.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 453s789tvx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Mar 2025 07:15:37 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zJ5b1UU9D2HgMjmpFIcIM0MFCWLYnwuJbHs4mwfntcq5dwLrB6dpySIFLewSguyDF8KBq3RJLNqImaxUmNbVPK8h3siXvZ6hPVMB/6Ub9KUgLyQs8StEz3LJdOp75ETzmnXtqfJONs8ZAeIxmmKb2DlwSCAXBYUGf4z8lk/QJ6tceCJbCg03IJr9RY9NkRYLjYeB/14OokqVNrGdlpwVGil4MfWHmve8mU1cCX+uInYd0pRusmK3Vfv8c30ougTZ49m9f8SNphS+Gw+S+ZyxTi7AG7b3RkTcem74tkMbEd7n5whfqoQOb1vh/BOpTQ/u+BJXMmPWlABoHGygu2YHUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ijFBrMML1OtV2/RXwHAIz97uMTgKK5eYTF8RbFIPWXY=;
 b=et/q1ZZl3kmUfmXIcQJ/HN6ZRyQLFaLL59jmGcI8VZAUOgzwSZtzhPCZAlJaMSVQSAKn/cSz+fMWA6iIkUeReHLvvnqcQjcbsxp7n4Nt4QM9pu9p//I5n88foHBVcLq9vArno2NC6Q2KpSOsCc96qNaPI9xFzHSASiBCpS6x4LLTMjIV2sApUAhkdjd/SIlH+O7FNCJzahQJw6zIL0JS7YbdV/bGC4+zM7TUxBskD0T/m/zNb7QRCTMyo3j8RzaMtVf4c13tD8Wc4vM832DnOzVjmNTs6KkA0U5UWJjGwVeaGCWdwh8H9VFaJZ51yMY04AcAVgOBCzsBHJjyzsPc0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by MN0PR11MB6183.namprd11.prod.outlook.com (2603:10b6:208:3c5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Mon, 3 Mar
 2025 07:15:33 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e%7]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 07:15:33 +0000
Content-Type: multipart/alternative;
 boundary="------------YganunMqUsQclD4HBQ5nGV3X"
Message-ID: <c5142f29-b85a-4cb4-81d2-2ef6aeb0fdf7@windriver.com>
Date: Mon, 3 Mar 2025 15:15:27 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] tcmode-default: bump GOVERSION to 1.24.0
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        hongxu.jia@eng.windriver.com, openembedded-core@lists.openembedded.org
References: <20250302045339.3836626-1-hongxu.jia@windriver.com>
 <D86FPT8WQCK5.1JY6070V2BEXW@bootlin.com>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <D86FPT8WQCK5.1JY6070V2BEXW@bootlin.com>
X-ClientProxiedBy: SI2PR02CA0015.apcprd02.prod.outlook.com
 (2603:1096:4:194::16) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|MN0PR11MB6183:EE_
X-MS-Office365-Filtering-Correlation-Id: efa8a2d6-aae3-4bd4-c596-08dd5a232fbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|69100299015|376014|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dStIRS9GNG53cC9SaFF6S05sckRjeDZVVW01VFVnUXZaUW5WRko5R0ZwNjdk?=
 =?utf-8?B?T1p4RFpBbldRSnBudXpLV3FaSFREUUtmZkQxM1lUWXVPWkNpdHBtRGNzaGdO?=
 =?utf-8?B?VDBFcElGc2VEaUhnYTNaWU8xWWpRM0hkUi91cFowbVMwQVpOLzlqLzNzL2JB?=
 =?utf-8?B?b1cwRm1CYUNkTGh1NE5BKzd6dUcxU1JGUWEzTEhrZmJHWTd1ckRINzl3ZTlq?=
 =?utf-8?B?M0o3YlFLeFI3SmdQT0o3MUdzV0g0cWMvS2dZdTg3QmE4TjFIQm5DTDdQT24y?=
 =?utf-8?B?TGY5UExQaWJxWWRtRmw4MFMwdVdUNWJvRGkxYytwS0tMZlAxUDQ4MHJQby9N?=
 =?utf-8?B?N2dVa2lvb0JORFZMb0cveGhlNUZNY3hVRzZmeTI1NDRRR1JSVEltUGY4TGdq?=
 =?utf-8?B?U1pNSDY0L0tRRFNlanFHUURhZmhCV0ZkdkJmNlkySVBDSXUvZjBVT1ZEMUMw?=
 =?utf-8?B?UWdtMkxoMUlXRXJydmhCS1pKRUE1RlZRVlhEbXQ2d2JJWkZjc1lPeXFPVkw5?=
 =?utf-8?B?Y1kwMkNDbGNJM0JzTzAyOU44T2l6czUzOGpUNU5aNjdIakgwMDdoMWI1eFVs?=
 =?utf-8?B?MElkTVp3VzRid2IzUUhsdGVMalpIRGJ0UndIc0hTRzhkanh0WVdmakxKMG1S?=
 =?utf-8?B?RmFHWk81Q2dOeEJGczZUR25RNitNVlVNeG5kWWxMdjdMWkFzNXpGQlJnQzI0?=
 =?utf-8?B?UU15Y0xzRmtDTFlXOTRLTkNHM0tIY1B4REpmVjZTNFo1U29wZERHakFFdksz?=
 =?utf-8?B?dWJzekpiV2ZlZS82NlBKUzVjbkZhT0oyNHlTU2VES2g4dGxRY1FWRzJhYmtz?=
 =?utf-8?B?NDRJbHY1bmdsWWxCRGZCdDE0MCtBZWU3Q0JXSUVkdkZJQlgzVk5NVVVLZUNS?=
 =?utf-8?B?dWFrbFpsczh4VU9Xc1FiT2ZFUnFESnpDbm82aE9ZdG5nRU50SFhXNGtiYVEw?=
 =?utf-8?B?NDE0OWlpZzQ5OG1sT1drWTlzTitkTk9kSG10VnpFeGh5clZyT1ZRY0JpYTdS?=
 =?utf-8?B?VkZCZGNKdDkycS9MN1RxUlExWnhXVVc3MERrQ2hCdTNmbDAra05ZRkNsQm1P?=
 =?utf-8?B?RnhGUng0Z24rVE5VcHREa2pGaXE0aERySWhZWjhNTld2M1hiZ2twQ3pXT1Iv?=
 =?utf-8?B?UG4xRElrWDZmNEZZTERJWVlWaUJhYmhuRkZjb1BKNzY2UjhuWkYrMllzbllo?=
 =?utf-8?B?bFhKcEtySWRuVXAxZU1tUnZyY0xwOEIrdmZqSFd5Q0tFNGlPano1Mllod3I3?=
 =?utf-8?B?eW83TFJNMS9walFXQmVjQjk3MlRnTklKdXJDZUs4L3hNKytwaFV1azRJdWxl?=
 =?utf-8?B?TUR3VHlnUHFTWm1qVnVhQ2tDSzFqdDZsMXRZTmxhRFliN1ovK0V0aXJnalJu?=
 =?utf-8?B?Z05aSFcvY0ZoajdLU1p1L3VEYy9vVTRNTThrL0RxMkdFaSt2WmdsL2NaR3dR?=
 =?utf-8?B?RjRsUmNpQUlxUGJXcXQxM2wrL0RUdnhkSlpCMFhBZTJOUXhBd1ROaHlqZlFY?=
 =?utf-8?B?b2ZMQUxNanJVaDNGMEVlN0xzd3poSkRTQmdxeHU4RWNlenpZM1lmVEdxZ2Ra?=
 =?utf-8?B?KzlyV1VTdzYxSlV3SUpDZHNVN2pDRjFXcC9tNzJnY2JOU2loK1pXb2hCeG5I?=
 =?utf-8?B?RkFZTnNiNTR2aEhYNEVGc0tzSjdMYzNiVXBGeVBsa3dFS0pZeUZadkFQckFm?=
 =?utf-8?B?K2k3YURNSEw3MCtCazltcUJxVGprUnVYQlNuUmJGRTBjZlptaVZEQ0ZPMlZv?=
 =?utf-8?B?YzZObFNhRW8yUzlLQjJTblVybHNnMGFNMDVBOUw1VEh3MEdwa3J3Mk9scGFT?=
 =?utf-8?B?WEJmR1NWaDRERGdDQmNRUT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(69100299015)(376014)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QlR0MUJ1VkI0Sm5iZEZya0wrUGJZN1RjK1JMeXAvV0V2KytKbElYZHlDOVNG?=
 =?utf-8?B?a1VxSnJmRUVrSmFUd2ZSdllIdkFaZys2VWJMZUlNSUZLRzZkNFh1bnVtSGNk?=
 =?utf-8?B?RTRZL3VlRFNpOGRxYVFOZmpCWnJDcElnVTlxMzEvamNQZ1JnSTJYK2JQN2gx?=
 =?utf-8?B?UTAvKzh6NGJPc2VYbG14M3lNeEFZaHBGQllCK2R3QjRIbVplUWNCUExMTzB0?=
 =?utf-8?B?Ty9MQzR6c3RUdWkzNVJ3S2RkbFQybGJhazJoUUxDeHlVaERJYWlGeXlXQllk?=
 =?utf-8?B?ZGI3Um5LQkZsUmRXVVdLNm9QaHFKdFpUUHk5TzRSYm5WbWFSTlBVcFoyNVY0?=
 =?utf-8?B?cGlyVGYxVlJCMnJNMFZqRVdSL1U4QkNBME9BWmNGL1JzQnFUWW1aSW9rM1N3?=
 =?utf-8?B?Rk9JNkpUK25BZ1RWa0VqanhXeG90UTlJRG1HbTFuVElLZnZlRHFubExIa1hL?=
 =?utf-8?B?eWNoMVkxUW9JMVB4Z09EaUdZWjl2OHovOGJjN1UyVm1sNHY2YjNwVVFBa2o3?=
 =?utf-8?B?c0dJaDljTjFhSmdUcWtEN093Vk1Xekx1QXR1OEdRdk9UbElzdTlNV3lMMjNU?=
 =?utf-8?B?ZFJ6cnByTk96Vk0yRzVwZENZNkNRdUphSGtFSUxpRHc1RkpWSjlvVkNDYWs3?=
 =?utf-8?B?MFVoN2plR3ptcGlvbWtFdm1Hdi90RGZVTWd2eWs4M0pZSG9JL05ua2JsTjVx?=
 =?utf-8?B?VXVwQ0lwVWlmaExrMXZNY20rcEFDbHVVTnBlTlF0OUMzRkFDRm5KQTEvaHV4?=
 =?utf-8?B?ck83eW5nSnhxU0NnWVk3YjdDQTRuTGN0M1hoYzJnOGEwVEkrbDIyRGFkeWt2?=
 =?utf-8?B?S05HdHA1RXk5dHR1TTdJaDd3UzRzWWo3ZEhJUlNkYVQxYlpqNENNenJYN3pG?=
 =?utf-8?B?Q2VvSHMvTk5nSEZ4bWJuclhmekowNWloWUE0UldHQk1lRkFvZVVWOHNIRlFP?=
 =?utf-8?B?bjMwTHJkak13RDBVcGRGT292M1o0YUd0UUhIU0ljY0lZb3prZ092VS9UaUVR?=
 =?utf-8?B?bElVNHBscmlHV2xvUHkySzdEaFIyTyttQS9VdzBTc1V6TVVxNzZaM2xXOTdV?=
 =?utf-8?B?dEhGRUVxWk9YZnJPd0VMS3pETkxIKzZBVERKQ0VJTFdXeE1vdFdPdkowWVMy?=
 =?utf-8?B?c0VhRmtsWDJCZWxDMWFpV0hqUVdTbFEzNlZsRzI4aGgrSnJMZFdIT0JhVUpy?=
 =?utf-8?B?c253dWxVS3FnNU5vQ2FjVkNoM010TU82R0dpN0xtM2pCdXh6T0Z3aktnandq?=
 =?utf-8?B?OG82NXg2UmZjSTdrKy9vU2wzRGx5TnJaYllTZFc0QzcxVFc1MHRwZVpiVlk4?=
 =?utf-8?B?c3NZM3VtQ3pienJoemxrcTNqeCtCL2lsaHM2bkVIdGlmdGZvYUs3NFBDMXFi?=
 =?utf-8?B?VGJBM0dVdVMwekNYUE5mZko5ZjFaZ0E1UTF1RGgwYTJWNDk2ZGdpVmQ0N0pP?=
 =?utf-8?B?ZnJzdzVld2RJRTJiL28zZ2JhRkY5NGI2TWJ2V0VERzlmaXo1L3J2bUxRdDVH?=
 =?utf-8?B?a29rUkp5YUFDdWNyTXNmVk9CZmRzVFZSOTJXaXhRa3I3cWVJeis4MEN0ZTNU?=
 =?utf-8?B?ZG9KWTBJNmxKTHFqb1l6M2tmRVNiSmV2V1Q0RUNPMFZEZUhRZTRWYzhVZXVZ?=
 =?utf-8?B?ZCtKNU5RUFIxL0s5ZjBOTEY5ZUEwV1YrOWZ4VHo3a21TYmd1alhmNVFIOHlx?=
 =?utf-8?B?ZEc4b3JwN2VrVXRCY2E3c0lzSDEyOWNRMk1NckE3czk3ODMvSmc3T3FXekZS?=
 =?utf-8?B?R2pJSjBNdWNhZ3ZaY0FoQUkrVDlKR3FUWllPaUQraHFzYTRkdzJtc0VqQnNL?=
 =?utf-8?B?MGNYU0p3WHpLZmdnblg5Rzk4bTBGV3g1TGJjZlNqd2VvMndjR3UvMEt5OGVO?=
 =?utf-8?B?OUY5NWxZNTdBQXdYbG5uVGZTVHJmRnpnUkk5Q0xIamFzSFN6NzNYUEFQZVFw?=
 =?utf-8?B?TDZrQ1RDdHR1U3Q0dDN5SlBzT0ZzVFduaEcxcldjNCtZeWd4VlZvL2NXdUxD?=
 =?utf-8?B?YWNHVmppQkRTNE5HSTJ0N0c1Uld5M05KSm9UdmNZanZMaXVxTkxBV2Fycys0?=
 =?utf-8?B?L3YrakZ5eVJMS042SENqMGZtUTJOell4UDJOa2RGczBvYVlZNU4vcHRQeDRV?=
 =?utf-8?B?SER2ckIrRHFBRnlpcnpobjl3MmJzZUNhb0VzNDVodzlJbFNlUzV6QUttN25R?=
 =?utf-8?B?Vmc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efa8a2d6-aae3-4bd4-c596-08dd5a232fbc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 07:15:33.1129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Ed2s7ywk3pXOioRyzDKIjZtigmcV8bAmyJAb3GmnGUddFCDgYqXCLdQyshgNITLNOj+NxKzvKh8+vNQbwMyS0whMxJYQD7rg5oeLPk9xJk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6183
X-Proofpoint-GUID: p_zyUg8LCqlh_BagtGKQqyUY-uoQ9vyh
X-Proofpoint-ORIG-GUID: TEIffnn-3cRL_xLEp6TGEDTjLpf2bBZY
X-Authority-Analysis: v=2.4 cv=cfwormDM c=1 sm=1 tr=0 ts=67c5571a cx=c_pps a=b6GhQBMDPEYsGtK7UrBDFg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=P-IC7800AAAA:8 a=t7CeM3EgAAAA:8 a=w4PMHXzg8n0CyPg1xegA:9 a=QEXdDO2ut3YA:10 a=NbAbuYFOAAAA:8 a=yj-aMKAYKbz0kkd27lYA:9 a=E4pn3k9bqIzK311q:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=d3PnA9EDa4IxuAV0gXij:22 a=FdTzh2GWekK77mhwV6Dw:22 a=2ZxJuTErD_oPjdv7hDNT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-03_02,2025-03-03_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 lowpriorityscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 spamscore=0 adultscore=0
 clxscore=1015 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2503030054
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Mar 2025 07:15:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212199

--------------YganunMqUsQclD4HBQ5nGV3X
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/3/25 14:58, Mathieu Dubois-Briand wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Sun Mar 2, 2025 at 5:53 AM CET, hongxu via lists.openembedded.org wrote:
>> Due to we have upgraded go to 1.24.0, we should also bump GOVERSION
>> to fix preferred version warning
>> ...
>> WARNING: preferred version 1.22% of go not available (for item go)
>> WARNING: versions of go available: 1.24.0
>> ...
>>
>> Signed-off-by: Hongxu Jia<hongxu.jia@windriver.com>
>> ---
> Hi,
>
> Thanks for your patch.
>
> It looks like we got some warnings because of the Go preferred versions:
>
> stdio: WARNING: preferred version 1.24% of go-cross-core2-64 not available (for item go-cross-core2-64)
> stdio: WARNING: versions of go-cross-core2-64 available: 1.22.12
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1109/steps/13/logs/stdio
>
> Can you have a look at this issue please?

This patch is based on original patch `go: upgrade 1.22.12 -> 1.24.0' 
which has been added to master-next branch [1] by RP

The series contains 4 patches in master-next [2]

23 hours 	tcmode-default: bump GOVERSION to 1.24.0 
<https://git.openembedded.org/openembedded-core/commit/?h=master-next&id=23897853d750e493aa1461b622eed1ac956d9f96> 
	hongxu
23 hours 	go: remove support for GOROOT_FINAL 
<https://git.openembedded.org/openembedded-core/commit/?h=master-next&id=c9f9ade2a6d63d024ece10b9226a930afca7bf97> 
	Hongxu Jia
23 hours 	go: fix buildpath issue for go-runtime 
<https://git.openembedded.org/openembedded-core/commit/?h=master-next&id=f4563bc67d2b0eacdbce3cbcc92a1fe124f105cf> 
	Hongxu Jia
23 hours 	go: upgrade 1.22.12 -> 1.24.0 
<https://git.openembedded.org/openembedded-core/commit/?h=master-next&id=a983d5ccd208ef75d0e53135f0eaae766df5015a> 
	Hongxu Jia

[1] 
https://git.openembedded.org/openembedded-core/commit/?h=master-next&id=a983d5ccd208ef75d0e53135f0eaae766df5015a

[2] https://git.openembedded.org/openembedded-core/log/?h=master-next

//Hongxu

> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

--------------YganunMqUsQclD4HBQ5nGV3X
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 3/3/25 14:58, Mathieu Dubois-Briand
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:D86FPT8WQCK5.1JY6070V2BEXW@bootlin.com">
      <pre class="moz-quote-pre" wrap="">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On Sun Mar 2, 2025 at 5:53 AM CET, hongxu via lists.openembedded.org wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Due to we have upgraded go to 1.24.0, we should also bump GOVERSION
to fix preferred version warning
...
WARNING: preferred version 1.22% of go not available (for item go)
WARNING: versions of go available: 1.24.0
...

Signed-off-by: Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
---
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Hi,

Thanks for your patch.

It looks like we got some warnings because of the Go preferred versions:

stdio: WARNING: preferred version 1.24% of go-cross-core2-64 not available (for item go-cross-core2-64)
stdio: WARNING: versions of go-cross-core2-64 available: 1.22.12

<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1109/steps/13/logs/stdio">https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1109/steps/13/logs/stdio</a>

Can you have a look at this issue please?
</pre>
    </blockquote>
    <p>This patch is based on original patch `go: upgrade 1.22.12 -&gt;
      1.24.0' which has been added to master-next branch [1] by RP</p>
    <p>The series contains 4 patches in master-next [2]<br>
    </p>
    <table class="list nowrap">
      <tbody>
        <tr>
          <td><span class="age-hours" data-ut="1740903776" title="2025-03-02 08:22:56 +0000">23 hours</span></td>
          <td><a href="https://git.openembedded.org/openembedded-core/commit/?h=master-next&amp;id=23897853d750e493aa1461b622eed1ac956d9f96">tcmode-default:
              bump GOVERSION to 1.24.0</a></td>
          <td><span class="libravatar"><img class="inline" src="https://seccdn.libravatar.org/avatar/c25f1c0edc360509e2998f7098c66a22?s=13&amp;d=retro"></span>hongxu</td>
        </tr>
        <tr>
          <td><span class="age-hours" data-ut="1740903776" title="2025-03-02 08:22:56 +0000">23 hours</span></td>
          <td><a href="https://git.openembedded.org/openembedded-core/commit/?h=master-next&amp;id=c9f9ade2a6d63d024ece10b9226a930afca7bf97">go:
              remove support for GOROOT_FINAL</a></td>
          <td><span class="libravatar"><img class="inline" src="https://seccdn.libravatar.org/avatar/38c5febb2091cc266867bcae15e25d02?s=13&amp;d=retro"></span>Hongxu
            Jia</td>
        </tr>
        <tr>
          <td><span class="age-hours" data-ut="1740903776" title="2025-03-02 08:22:56 +0000">23 hours</span></td>
          <td><a href="https://git.openembedded.org/openembedded-core/commit/?h=master-next&amp;id=f4563bc67d2b0eacdbce3cbcc92a1fe124f105cf">go:
              fix buildpath issue for go-runtime</a></td>
          <td><span class="libravatar"><img class="inline" src="https://seccdn.libravatar.org/avatar/38c5febb2091cc266867bcae15e25d02?s=13&amp;d=retro"></span>Hongxu
            Jia</td>
        </tr>
        <tr>
          <td><span class="age-hours" data-ut="1740903776" title="2025-03-02 08:22:56 +0000">23 hours</span></td>
          <td><a href="https://git.openembedded.org/openembedded-core/commit/?h=master-next&amp;id=a983d5ccd208ef75d0e53135f0eaae766df5015a">go:
              upgrade 1.22.12 -&gt; 1.24.0</a></td>
          <td><span class="libravatar"><img class="inline" src="https://seccdn.libravatar.org/avatar/38c5febb2091cc266867bcae15e25d02?s=13&amp;d=retro"></span>Hongxu
            Jia</td>
        </tr>
      </tbody>
    </table>
    <p>[1]
<a class="moz-txt-link-freetext" href="https://git.openembedded.org/openembedded-core/commit/?h=master-next&amp;id=a983d5ccd208ef75d0e53135f0eaae766df5015a">https://git.openembedded.org/openembedded-core/commit/?h=master-next&amp;id=a983d5ccd208ef75d0e53135f0eaae766df5015a</a></p>
    <p>[2]
      <a class="moz-txt-link-freetext" href="https://git.openembedded.org/openembedded-core/log/?h=master-next">https://git.openembedded.org/openembedded-core/log/?h=master-next</a><br>
    </p>
    <p>//Hongxu<br>
    </p>
    <blockquote type="cite" cite="mid:D86FPT8WQCK5.1JY6070V2BEXW@bootlin.com">
      <pre class="moz-quote-pre" wrap="">
--
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
<a class="moz-txt-link-freetext" href="https://bootlin.com">https://bootlin.com</a>

</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------YganunMqUsQclD4HBQ5nGV3X--

