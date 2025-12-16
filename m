Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3012ED5CC85
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 09:08:54 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18310.1765876133712650695
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 01:08:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=YXxuvWlA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=44450448cf=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BG0om391195622
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 09:08:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=zPFB9J2cSPWm6cOvFe+1RbRkfuSjaecZA76Cs4dXBXY=; b=YXxuvWlAdmSC
	wrL7L5+0sFwPOYPWbTZ4O1WAFxQEFtR3kJAXBiqw90QGL1yN0btEtfx+FHZAfxLe
	5SpsKGItZudZkPk0lXW20le0Mz7i49cAQJpuNdEk3RTGjpbD4Tj7gzh77TUPSzmK
	q+HmxSDZKFJ9LzCsXeY48TStfmIXlIr34Mx9taWeEd0CRktN0Y8oQn2ezOCEObMN
	xz78uaqhMxLIq+uHNiW0Vb49DfNiJ1bG+HTw74aD56fEaVbSqSkuSoO+K2ntq/gv
	vebMZC0FPTQotSBJBz81gdeVjktwOpcBZJeaMhVA1DQgS5xKfeVSnLfCDQ44uhqV
	AUHKGQsdOg==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010023.outbound.protection.outlook.com [52.101.46.23])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b0wc0jy94-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 16 Dec 2025 09:08:52 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bmNcOoTpzU88GdtM2LZQOgl66ippXsBhigoW5YmoD9614MEHWgSzl5cBclv3RS2WUnsTIqeAGXSB+L0t408izXOt5JhxyTgmvgW75e89Nl3AYGkrOFWm4FqtQYjmnHb9XO2wDG1smUDb3gWC1VYMP1ubcuwlxaLONQD2AOY+f1aTcImZuN5U31hb/9qjlLyM53JeEWjzr1LjGkDPSvfxz63EvJVC6+7MaZ9X1ovzXJCDAiZV+srR37/Xq+yqOIf9doYF8LiuibZFU2ImMVUJa+dj0Eras6KVxMsOQAPH2jJGSRjGdy3DbkzVsDUM+VuxYdE79AcKKqOxs77N6zN3jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zPFB9J2cSPWm6cOvFe+1RbRkfuSjaecZA76Cs4dXBXY=;
 b=Q54iE+bICALp3sSecKbZQLDDyPbpiNVcGy/B9U2MMKjaKHqIMv3Phmm9p/xzrPJ3WzTcAQ2n4pdJso3wgxSDqqxdbx21u6pvdDXwAnkiFm17N2M7GDWh1eVPs/XANxoZKiIodLt9evRzdp7wSTmU+z3ySSeb0HwhM/qhF1BWFL70ZEE7y6ZZ+h/E2pBVqhLL2y8sBaM4DhaXymwbjSNL7OsUwNKeRnEhzX0SR5Eq/OWD8qx3FMioVqWGhgzcTlAGy+5jSIcoCZyek6KJhOGGl2059fDIpOiXJ98kIcD7gklha5jy/PjCxWMY14LIcnNRToaNtuufWC7/cYIAqisR4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by DS7PR11MB7808.namprd11.prod.outlook.com (2603:10b6:8:ee::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6; Tue, 16 Dec 2025 09:08:50 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::c84c:d2c3:1102:cf45]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::c84c:d2c3:1102:cf45%3]) with mapi id 15.20.9412.005; Tue, 16 Dec 2025
 09:08:50 +0000
Message-ID: <02f6320b-096e-4a0e-a575-74adb1d6bd89@windriver.com>
Date: Tue, 16 Dec 2025 17:08:44 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v5 5/5] debug_build.inc: override BUILD_MODE and
 BUILD_DIR for cargo.bbclass
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        hongxu.jia@eng.windriver.com, peter.kjellerstedt@axis.com,
        randy.macleod@windriver.com, raj.khem@gmail.com,
        openembedded-core@lists.openembedded.org,
        mathieu.dubois-briand@bootlin.com
References: <20251010075258.2161972-1-hongxu.jia@windriver.com>
 <20251010075258.2161972-5-hongxu.jia@windriver.com>
 <dea01c60d20fe6523604b02ecc81c20d7f9c9e59.camel@linuxfoundation.org>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <dea01c60d20fe6523604b02ecc81c20d7f9c9e59.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0358.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::9) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|DS7PR11MB7808:EE_
X-MS-Office365-Filtering-Correlation-Id: fe2c7a10-ddeb-4424-5110-08de3c82ba13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VmhuWTlKZXFnSTY1Mlo3RmdmemQ4RzllcFY2UjFMeVpMa1BYckVKUlB1L0ZT?=
 =?utf-8?B?aXljdVZtOE9DazFkbnpaeHJoYkY5WUozT2FUSVlVSnhOMGY2cy93U1M1MUc0?=
 =?utf-8?B?OURGYlJkQldMcXhUdG1ZSW9BWXBWQUVjNElSa1U0SGZGS1RWRVNhanZNYm8v?=
 =?utf-8?B?SUdKbk4rYlJpUVpxSyt0K0dqcms0TitSQU50UHBwMGtJYjJMZEtwU2JWUHMz?=
 =?utf-8?B?UUFDTkhLdDlWUzVmQVEyTldCcUw2NTRHUmlLdUg2VmpFWndSTHFLbTRSaUZt?=
 =?utf-8?B?a01jQzVkUUtON1RQNE11UldlY0JYd0VOcVFQYzhVTSt0dTdRbzZCSEgycy9K?=
 =?utf-8?B?VWZBUlRudE9OUGFZUkdYbnV1eVZ5b0lnanBpaC9TVFZHZHVacFlLdSs3eWQ3?=
 =?utf-8?B?eGVYSm8xUzVTM2REWTJOYTlubzZZdXkrYzNPSzdwVml5NjZHV2dDUTJ0aWw1?=
 =?utf-8?B?RGt2RWErNVRpNzZ4d2pDcVloZGpvUzI5Zndkdjk5bTZPY0hZN1BLK1M4Tk16?=
 =?utf-8?B?cHdnSWZRMUd4K1NwWTVESjFZWHNmRm10RHY0RHA0STlSdjJUQ2NvV0FhY2dD?=
 =?utf-8?B?MmFzY3VQMlByVWpKTHVwUWZQdnM2cS9Od0U3MUVEWkRVbEI3RlNrNFRWbC9B?=
 =?utf-8?B?OUJzOUZQMmlyR2p5c1VQU2ZRZCtHdHVRdE5lY3JtYkxJZ04zVi9UeW9Pa3Q2?=
 =?utf-8?B?YXZmS3R1Y0lGbXdkdXlsemhERnVDb2F3SVVsNHJIRTRFbjBSY1NDdlFlRmlx?=
 =?utf-8?B?VXR0L2F5TlhpcUxzNm5PRTJWSThOczRTT2QwY1Y0a056SUNuTURwczdrUFVm?=
 =?utf-8?B?aERzdk1WbGpzZVN5cG5NTXlNaVlWM2FrckFRMU9QSGg0QTBmbEFjclhvVEZ5?=
 =?utf-8?B?WkJoVHp1UnFqdTJPMGoyU2lMN0VWSzdEZUlGSUJPUW03czc5SjVKa3ZKVzlU?=
 =?utf-8?B?WkRxSjRWRlhqVlVaUHd1ZDNrVkZjYXY2Ni9qbjgzVDdKL1ZqcHJVdERuYisr?=
 =?utf-8?B?ZEh4dW5YbUl3d0cxV2pZOFhoM1ltRnlaSmlQSGFiWVJPMjJselZUTVZ3UFZh?=
 =?utf-8?B?WkxJREY1T3lYbkEzZTJKQ1pBeG9ZYXlKQUlqT0dYQ3lhQUdsSGJ4L1pmTGNX?=
 =?utf-8?B?WVFQRVFyQTNKa3FLSEQxWC9rd1FOWWg5QjFlSzdzamt0NHNmbmRLc2lPcDVU?=
 =?utf-8?B?dkpqdEp4bnNrTENrbVVPY011SEpYaFhkVFpNazJlOUh1TC9kRFd3dlJmSjhT?=
 =?utf-8?B?OFRMOW8weEwrOWVzVVhDKzdqYkxHNTVrUlVZSGJNN0lMdThWeldMai8wWXB2?=
 =?utf-8?B?Nko0b3p6U1hxeEQ5VkpyUUJWSTRQNWU4cDJRS2pETjFkQWpuRExuOEJaOFNk?=
 =?utf-8?B?NnJXNm8wdldPTHNmTjJyRWJVb29IS3loYUlaV0kwb09sT3RSN0FvazJmOXRW?=
 =?utf-8?B?T1VyTkxQTE1sa1NsblBac2JLRVM0TkRFU2RTNFZCZWpoUnNvRjlXVGtzY2ZL?=
 =?utf-8?B?WXVpeVBhKzhUZFpzQXVrVjFDaWZFN2NnWUlLbHkwMnc4Q0JzcSttNUEvTHp3?=
 =?utf-8?B?dGQvS0dCdTg1NHN0Q3l3d01ldkJIeFgwcWEvS2h3WHFyL1dybnJLbFZEcnFz?=
 =?utf-8?B?dlA5UjVncnNGZ2R0eVZlUmZuZHlmNlI5dld3Y053VGhRcnROYUFpUnZpZTV5?=
 =?utf-8?B?WURQK0RvempxaGFCd2FYNHRTNUxoVWFtVkROMU1LK1NsVFFNTkczWWVWVDdC?=
 =?utf-8?B?VjZ6NTlzamhKbWkvT1BKVFZUSXdValNxcnZvV2J5ZE1CcTNKSGxaRCsrbFBJ?=
 =?utf-8?B?amlvWmxYV0RSVEo1aWtLVXVmUGg2MUtUSjhneUNTcFpvNlI0Mjl4YkR5Rkox?=
 =?utf-8?B?b25HNjJsV1Rpd3JuQzN3QXVWSkhzU2ozdVQ4SjZZMXFNdjlJbDFRSE1MeVgw?=
 =?utf-8?Q?HkccFZ2vTx8/wzVHxiFsRclMy4o5R1t5?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?R0p5QTFpOGJBZDRGY1pJM3Y3UXpNWXBtRVZjbHR0Y1F5bXVaRi9sV3A4MkRR?=
 =?utf-8?B?Q0dQSFp4OVEzdW43RmhyR1Jyd0xZMzFQV3pRcWhoNWVuTGdDNVpuUjdBUkVs?=
 =?utf-8?B?cVRWb0YrMVpLeDhyd0NzRDZ3MFZrcHZDRHlxSk44OEg1cFBUYklhNlAvU2sx?=
 =?utf-8?B?MUY4VXVGU2VUVFowSzlCZi9oaUNhbWNSaXZyVnowTTRQT2RBQTVLdW9vWXI4?=
 =?utf-8?B?bjZGODdVUlhNVmhPRWhYZWt1VlBzZ041UlB1a2pFdmJEajROd2dxK3B4WHZw?=
 =?utf-8?B?VXhLSnZLb3FJRDJOZldUZUhiWEhNZWJrbWNyNmxVTkRXcTlsZU1VQTR2c2Zk?=
 =?utf-8?B?T21TUWh3eGdVa0F2TVlnMi9reHA5WVdxM0U4VDlRVW9pV2V3RXVuSC8xdU1Q?=
 =?utf-8?B?QVFXMDJnS0tPd0x2WXJmUXBMZGVKWWFPVDIybHRlbkkyMlJyTms4K3BHVHB0?=
 =?utf-8?B?OFlnYk1iZzQxTXZmajFtdmRJbWk3ZC9NVk1laVpTaUpMSndBNkVRcDkySXMr?=
 =?utf-8?B?RGRrUmRqcURnMTVWQW9KUTBRME9kQzh1OFBYdlI0QTdUUC9VaFdjNW91Q0NI?=
 =?utf-8?B?SllPRlEvdjRXZ1EzcjJpUVZpQjRXZXR6QzFhT1EzMXBYcUtNVmtRWmRCZkRa?=
 =?utf-8?B?NEI5YkdtOUpDSnE4bEI4cWh6b29jck00a0xvamhCNGRCdjFSMDhwV3NlM3dh?=
 =?utf-8?B?d0p3K216aUNEUENOQzVYbHlwVXlzZFBvMzZQL1c0ekpGVlFOMk1TaEMrTFpL?=
 =?utf-8?B?SWJZaUcyMElIMzZ3UHhEa1VzUThBQnJ3QlgwN1daMXgwS25XVDBHa1lsMEdv?=
 =?utf-8?B?OGcwL2U2ZlZEazZxSm1lV2ljNXZDQW1ZZEZaQkJhQW0wbTI4dDVsanRCYXpp?=
 =?utf-8?B?MWZjZG9VVHdtNHNGVG5uazBRN1pnTnFhRVNudm1ZbXFaSmJKTXlyblU0cFkz?=
 =?utf-8?B?UGZCalBuRTlNdyt1bkFrSlpkNlkwZmRrbG14eUt2R1NjajJlSm9DUVJSZEZj?=
 =?utf-8?B?emhOa3JURUdvU01peVFBc3pZbTJ4akNJbjJ2OE1IejVGTm1yWUJKYktCdFhH?=
 =?utf-8?B?UEJKQlZaakxNQnl5ZWNlWDZCVjN6T3lXaEY1TWJoUzFORWdScjB5SGVObmxm?=
 =?utf-8?B?Kyt3WGZUTEpzaWlKN1VwTHdxZTdRSGtGakhlOFZ3RUdRNHQ0OU95TVg2MXB4?=
 =?utf-8?B?a2FabjhGRkNqdUpxYVc3d210YkFNQWZ1MWdvd3N6RXptQjZQSHVta3MvZVZX?=
 =?utf-8?B?YXVhamdYcmxsWGhpUThUSWgrcTNrNVB6S0oxQUowZ2F5OFdHYkxuYUxzc0ty?=
 =?utf-8?B?V1JmV3FxTUxNOVhaaTkzcE1RTk5BK2Y0M3llY0dkSVZYQ0daZExBUCtidFRt?=
 =?utf-8?B?K3lxNG1aazhPNU1OL0F3bGRZNnlRNFNaWlBnaGlpY1JORFk3akN3b2daeis1?=
 =?utf-8?B?eENQUGdqaTBjL0JXR0NCaWdMQnIybTJleVEvejRPOUhvYTFmOEtra0p0STlX?=
 =?utf-8?B?bUNxTXFhaEdGTVJjbVlzQnBLeWJhaDRyVmxNZERFMmFzOFNjVFZ3MXZBakF5?=
 =?utf-8?B?RFF0MEFnTStGdTlTaEtzK1p3Wk42bGxpV1NFK2VWLy9tSEkvdUx1ZHhDKzNP?=
 =?utf-8?B?WkRlU0ZDWEl5UWRzaVJVaDRrVCsyRmQybnBlRTdaeFV2MHAzQm51TXFGZGtt?=
 =?utf-8?B?TGJFT3l0WWFuQ0tCOXE5N1ZhS1k1WWRUR0I1SnhUMldOVGVaUnZ6TlY0UEtZ?=
 =?utf-8?B?QTJzeFZlY2RySSswLzBwNHVDTzB0U05lcmsrUU5xRU9rN1FpTGQwNlJ6UlYv?=
 =?utf-8?B?dXpIRVhXZklLK2hDNm1OUVVmTkl4Q0JZaDIwMmJRd0dQRExlVDZVa2htcDR4?=
 =?utf-8?B?bTZ5L1duanpsNE1vZUJGZFVSYUQ3TEM4Y3lDZjkvSnI0RGpjMjk5bTdGREli?=
 =?utf-8?B?dEErTzU4Z2ZCMjRFWTkzL2g4SjdTZmIrTkN1ajFnaW13VW9zcFZDeU1SZTFO?=
 =?utf-8?B?c21lTm50SHZrbTRMMHUvM2E3clltbjk5bVpHTWxJUEZwUFl2SjNNcFRKR1Bm?=
 =?utf-8?B?d0lBVDhib2xxQitxRVRPamEvdGptV0lPanMrSEZ5SlBXc2VnRDRKQzhIbVhD?=
 =?utf-8?B?QUhzOGMxNnJVMzVKZ3doN0g0SlZGcFhubVRRcmdrcUE3bmtiSVhlbGRQckgw?=
 =?utf-8?B?cWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe2c7a10-ddeb-4424-5110-08de3c82ba13
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 09:08:50.1685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AVVHkBJilB9ZB8CVg2Gk0t4c4O8F0DgqPjRHeapxYVW3e1O8EvgR7Z0gt8+W1nTdwyktk4Ayn6FISV2QKF7u6nIVIx1QxE2YEwntpsi13xE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7808
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDA3NiBTYWx0ZWRfX12nG0HHZ91y6
 SLELfnAVTslsVS0LJr/3wZiJN086BMk4I0EuR3GzsWVvrWCuH7yk1z91RTVRUO7uGpF5EfvsNaE
 BeLITJ+vfu15xQFns9dsJgr0OB4PkuKiG0q7TIzLU0bO0ecbX9hNkjq6opDmCgYRGX3lLD1d95H
 rSgFB5SAszE9Kun37S3aBe5UffefTsgLajlsmg14tuoCPCp0AeNvpAYVbMn79rmqtwEaLj5ruY9
 TF7frN+uZF/GJ10UQz68DphPnLgkLmJxYKPYTL+6ZDmlNtoZy1f0I0RhQ9sq/P//l+LhmnmmWZj
 aGpMdiPB+6lU5H05EEMQ+IcNtOhoMYzqLDOiki89fSnEk2A8Hwr3TQwr9Ndc8z6gE3zGywyCW6V
 R89VD2DV8yLGeIJDCYSiu7WPadJNwA==
X-Proofpoint-GUID: feEZEHBgVBn3nEkdabOeIm_2dJTGtc4C
X-Proofpoint-ORIG-GUID: cmmsOnVsJvXY9wtfY4wirFUB1AJNe9jj
X-Authority-Analysis: v=2.4 cv=B/60EetM c=1 sm=1 tr=0 ts=694121a4 cx=c_pps
 a=f30+ahQCdjj2/zPB7vFTLg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=IA4xdaxstyKIia3CV5QA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_01,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160076
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 09:08:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227930

On 12/15/25 20:04, Richard Purdie wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Fri, 2025-10-10 at 15:52 +0800, hongxu via lists.openembedded.org wrote:
>> The debug_build.inc is used to collect debug build configuration,
>> override BUILD_MODE and BUILD_DIR for cargo.bbclass when DEBUG_BUILD is enabled
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>   meta/classes-recipe/cargo.bbclass        | 4 ++--
>>   meta/conf/distro/include/debug_build.inc | 4 ++++
>>   2 files changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/classes-recipe/cargo.bbclass b/meta/classes-recipe/cargo.bbclass
>> index 2dd28e95d3..c90b8c18f0 100644
>> --- a/meta/classes-recipe/cargo.bbclass
>> +++ b/meta/classes-recipe/cargo.bbclass
>> @@ -31,7 +31,7 @@ B = "${WORKDIR}/build"
>>   export RUST_BACKTRACE = "1"
>>
>>   RUSTFLAGS ??= ""
>> -BUILD_MODE = "${@['--release', ''][d.getVar('DEBUG_BUILD') == '1']}"
>> +BUILD_MODE ??= "--release"
>>   # --frozen flag will prevent network access (which is required since only
>>   # the do_fetch step is authorized to access network)
>>   # and will require an up to date Cargo.lock file.
>> @@ -41,7 +41,7 @@ CARGO_BUILD_FLAGS = "-v --frozen --target ${RUST_HOST_SYS} ${BUILD_MODE} --manif
>>
>>   # This is based on the content of CARGO_BUILD_FLAGS and generally will need to
>>   # change if CARGO_BUILD_FLAGS changes.
>> -BUILD_DIR = "${@['release', 'debug'][d.getVar('DEBUG_BUILD') == '1']}"
>> +BUILD_DIR ??= "release"
>>   CARGO_TARGET_SUBDIR = "${RUST_HOST_SYS}/${BUILD_DIR}"
>>   oe_cargo_build () {
>>        export RUSTFLAGS="${RUSTFLAGS}"
>> diff --git a/meta/conf/distro/include/debug_build.inc b/meta/conf/distro/include/debug_build.inc
>> index c8e2cf90cf..1b399b6f65 100644
>> --- a/meta/conf/distro/include/debug_build.inc
>> +++ b/meta/conf/distro/include/debug_build.inc
>> @@ -47,3 +47,7 @@ INHIBIT_SYSROOT_STRIP:class-native ?= "1"
>>
>>   # For meson.bbclass
>>   MESON_BUILDTYPE ?= "debug"
>> +
>> +# For cargo.bbclass
>> +BUILD_MODE ?= ""
>> +BUILD_DIR ?= "debug"
> These worry me as they are generic names not specific to cargo. I'd
> really like to see a more cargo specific name if we're going to call
> this from generic code so we may need to do some renaming.

Copy, and do it for target only

//Hongxu

> Cheers,
>
> Richard



