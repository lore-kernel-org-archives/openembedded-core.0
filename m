Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 215F1C61DE7
	for <webhook@archiver.kernel.org>; Sun, 30 Aug 2026 12:59:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8121.1788094769215516763
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2026 05:59:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=H8ljDlVT;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3702f0b8a2=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67UChLjk1358251
	for <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 05:59:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=7KEqEkd+cl/LBsRMjmfRlUp1xKB1r+RKD8CDKzdHmmA=; b=
	H8ljDlVT2L5h/XDyhKQ6OOZu67/r037hXWXDyzuGFXqs1QOcsqIdLKRxzJwYWEWB
	MU9PZq1C9Tg72Rd4m51iIduoVMhtYassmC0nznfZInqpIwT8YwuaprCV6YuL28oY
	BP3dDlfNRieGayvTcCzebs5SVoBybXrWHIb2wBzvT59th2jD8jyP+U+Kz6LjgN3H
	fU0bT4JY3F/QI4kSw6i1dfeawIkB+BpPV8KKRJ0GrdL+JBk0k/eDhi4eaDvxg02c
	uCMxf5JEDdk1YE51n8QIZNS/0Z1jaGnLDcbwcLl/s+JIYPmWfbYhVONKbHHXFqOM
	QOxCOzD3chGDIXhS9CA+7Q==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021107.outbound.protection.outlook.com [52.101.57.107])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gbxxe8wbs-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 30 Aug 2026 05:59:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=txxPEz5LcupM3SYCNR+Jt29KqAOIgQDmOS4j8LT23jFM+XnKd03ksSsAeg2UUlBULz/UChUumlt7y30HihcCR6vH3FygiYxLwx9xrYefYXzOf91ZDAPXqBYon/4dyGpJT4xEyuGQGmJrOw5NiG8zn3KUcAwVIJAccpjkI/9ZLLckKonY2NJy4eIwujE1E3sX1Yyhc7lvVxoF/r7illFFLV9wQVZL7LTiZdrZ8+hJ1smwDN+ObITLijGi7TVGDEVPPEqghVW9Gs/YCkEPTDhxWg12re9JlfQ2dZ14l1iJv5DnKXcto9qODq+8VWoCR6MNORkZpXgCEOgaY4ep21FVFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7KEqEkd+cl/LBsRMjmfRlUp1xKB1r+RKD8CDKzdHmmA=;
 b=OXgfIKK6qqe69DvFXIrnx2FXkzQAXxaHj2JaSx2l9O0cK7EnUUdhTcEmprlnrHqGBJBOk7x4K8tKy5lCbQqPwQ2hORhD4Adp8JlDVcWEQ9Txr5LHMhXYJUJKifrESYKJjJoLwfn0tKA0/QJuzJSaWoFFikx8+jEJGg+vY3+45wTbdnguu1Z/W7f9MSusPSQycrydue8mBa67IfBuiDOt+smX9PLTAEir7jpoY9DM92Tu0mqtiuxAff1Q39YJzgbp5BJ3uqK1Rnrrqg0634QAdQb9tW+9s8BoXnxxKavI0CcGwyURbaY/xkb8QC24SGF1OE3X9flWtz276QIcvrh+2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 PH7PR11MB7122.namprd11.prod.outlook.com (2603:10b6:510:20d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Sun, 30 Aug
 2026 12:59:20 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%3]) with mapi id 15.21.0360.008; Sun, 30 Aug 2026
 12:59:20 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com, randy.macleod@windriver.com,
        sundeep.kokkonda@windriver.com, deepesh.vatharaj@windriver.com
Subject: [PATCH 01/11] clang/llvm: Upgrade to 23.1.0 release
Date: Sun, 30 Aug 2026 18:28:41 +0530
Message-ID: <20260830125853.1139807-2-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260830125853.1139807-1-sunilkumar.dora@windriver.com>
References: <20260830125853.1139807-1-sunilkumar.dora@windriver.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: PN0PR01CA0032.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4e::22) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|PH7PR11MB7122:EE_
X-MS-Office365-Filtering-Correlation-Id: 7664aec4-ce4f-424a-cc04-08df069681ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|23010399003|10067099003|20046099003|3023799007|21026099003|56012099006|5023799004|11063799006|13003099007|38350700014|5123799003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: 
	0K2dKaUZhT2F0hLailJSr03e+/uGFiiUf7I6FYAmbDGpm7/EnksH/YE5c6e+YTFULVey/E6sl04HIPzw/fMq5np+DpVBdmF++l1IrJ6dgu/V2nv8am4X/S41WtK+q87WUiIQDufylBg1C1g+ew0bus8iNyvLGb31PliQhWjR49RdgPMpKUrKd97Y6rHtHVdB3+HWfO46Bim0QC1NTG5W5zBDR+m9vtO9hHwo6FmPMiRqM8Jiy1VuIDNJ1NGyXeKro7gwClPoMPGm5HLYBiRRNHcB5j1JiFEOgxSwVx/MWCcGtvTemQSwwoJjxtJU9ge8DqSZ0wQRGuKHBRQ5Favpm3GBpXiWVYzu1juN0odVnVE5NEYxT3xJXts0fI4RO8leWx+VDLK79eewPwYXRJkUFpGWTKHMpo8txR95IdZ22a0NmK1uiRDeDJVX/IMUgTY1lP14eQEry5PDxH8gmqrHJbztZcw/8Lehs2f309wmQWy2DwSXkMh8G7ARRQ97h7v7NsrP8ZjDbnB2lsAttxpDrjPa6gLJpWbZqfYUnxDfaOAVn3kND49UomKqhEFcyRaXIOi6hpsCLR8ziFXOeVNFLQkBqR32ZFa0bUCo26lsrNQa1kz8MAovCZlD0mW6yCBM4YlkcRXv4lZLZzdRjb/IXf0YX4fDdxs4zm+73uiLaTY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(23010399003)(10067099003)(20046099003)(3023799007)(21026099003)(56012099006)(5023799004)(11063799006)(13003099007)(38350700014)(5123799003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WDM4Nk9YZUlZNkxCWHF0OXdkTGF6LzhlYzBta3NoNldYNHJVSUc5UWw3eGVl?=
 =?utf-8?B?MXJrVXZyYWVDVHM1bDBKUTZwVzRLSzBSM25EZ0tXbTA5Q0NUcDM4RVJEeXho?=
 =?utf-8?B?OE45NVVVUC9rdVJUc09jYi9YYjROQUVOM00ycy9EKzFKd0dNWk05bG9oK1Vz?=
 =?utf-8?B?bVVCMmdSM1Njc3NBWFl1RzU0QnVtUG1LcmpsdDgrcjJlekJRV2I0dFBRV1R5?=
 =?utf-8?B?b1Axd0pTT0ZXeEZsSzc2VEE3ZTF5VUt3NmRlRUFlZUZDbXBlL1FYU2pOVkVB?=
 =?utf-8?B?WEpiVllCQXI1SGpFTGl4aWNDOHZBNUNzRHc0ZzlnL1RpVkhXSEFyMVBRMEpW?=
 =?utf-8?B?aDd3blFFWUlyODdUMUl2bG9wdG1zVzdtTnkrbDNkcktUcWJ6aGtEd2tBdjdV?=
 =?utf-8?B?KzVUTy9YT3FXdnBkazRGNmIwWnJZRXNhNmpRODJhZTBSWnJ6bGNwWkM5Q09a?=
 =?utf-8?B?L0lCNzl4d2V3S2xNSzVyWDFsZlI4YXI5cDZEdm9EcWZOTGlBS0Z4Sks4eUF6?=
 =?utf-8?B?Z1VzRnMrYVE4ZUh1S1FMd2RrVUsvK0NLS2ZjQXhvT3JiMDJ1SlJpZUh1Z3pH?=
 =?utf-8?B?NjV0VEkxK3lhNCtqelNyK05xVkN5R3ltUW9aa2l3eFdnRlVLRU1nYmo3YS9Y?=
 =?utf-8?B?Nmc5L2kxZmtrdUJ1S0svNm5JSVVnYkNLTXYvNHUxWEhFd0dRL25DUVN1UGJP?=
 =?utf-8?B?MW5HWWtKcWUwL2FlYkFJR2EweFhWVmJVamE5dStadDNMVjFPVmwwYmhyK0lU?=
 =?utf-8?B?ZjJYRVpJWmVmSlB0VWpLN2xvdFVXQ3VmZzBSM3FCdXFTTUc4RWJodzZoU3Fn?=
 =?utf-8?B?aUt3a1M0aDJ3OGxTMUNFRTQyL0M4ZVNURnNsUUxxTkI5Wjg5azQ1L2k4YkR5?=
 =?utf-8?B?RnZ6VnExaTcvSlVYdVN2WUVQaThuSCtUbk5XYk01UDlzQWpvcE1FUVl3bTAz?=
 =?utf-8?B?MU9WN0pmY0hvSXhmT2J4eWlEM0FqUEpiRFRVNkNPVmpjN0pMYjd3UjU3UUgy?=
 =?utf-8?B?L2lJd1VWSHBaYURZU2Z6YkhsQ2I4YkFmYjhhN3lQWDlKTUdRRDFwRW9uWXJx?=
 =?utf-8?B?eHNKOUdxUVpDUGIxVWl3c0llTW43VzJBYWg3L25JV2k2SURNM3hodUVFSkVo?=
 =?utf-8?B?QVVGYk1NaXFCd2J5MGVKekIzTU1RVzhxUWUvL0NTSTNNN25ia1NJS3JqN1E1?=
 =?utf-8?B?dnlVWDgyV0dOYkZtU1gxMnd5ODlxeEFrVEthNkVLUVN1Z0xDMzU4dWxRL0E5?=
 =?utf-8?B?YlNBbVNoNWd5UFZ0U1JKNDc0ZFlBbnk2YW9icXc4SlhrVVlCVlNVdFZFZTdB?=
 =?utf-8?B?YWNvOC9hdjNrZkhBS2VXU0pOOFN2eGpybHlKV3FlOVBpMUJvckcwaDVGQ1lO?=
 =?utf-8?B?bFc0KzJvdmtYZEpjNGRxS3lERGlRaXF4Sy96UzVJVEpsdGplZDQ3SnVncFdo?=
 =?utf-8?B?TlBzaS9QSHhRbUhmMEE5V3E2NUtjWXZ6MUIyMHNwNEh1dXFVVHFsdUJMa3N1?=
 =?utf-8?B?S09YQ2xubWdGOE9uOEdENFc0MFE5a0hOQVVkQ2hSN1I1UHhkRnhQYkJCODZF?=
 =?utf-8?B?MjRqTEl3UU9ldW1yR2Z4VGNGNnlVb3BaSXlEMk13TzhZMDRyRmovNHBRUHdw?=
 =?utf-8?B?SDZ1bkp1VmFFZnZNVENkakFvc0pvWEtHTFZvTGF2UUhObDU4S3Zad1lCTTFC?=
 =?utf-8?B?cUVwQ21zYUgxRmljWWFoTzRUSWtZSEYxMEQ4cmRSU0ljbkhBM3dWT2V6QzBh?=
 =?utf-8?B?amdxbFdTZUhCY1N0VVJrK25aZm9Nam5GWk1sNUs2aDYxY1l2aW9JL1pMaklF?=
 =?utf-8?B?cUFvZ0dRalIzdlRvL0ZrRTZsU0lDZjhCdzNpNElrT0dRMElCZHEvdGdORzJj?=
 =?utf-8?B?VmtVMFpVMmVHVlBSM09XaXdVeDhNS1lZKzlHZFM1VEFESSt5LzljZlFnd2Ir?=
 =?utf-8?B?K1lLUmFEckMwamZ5c0VlWFBqVS9US25nZG1CSmtyWFMxcVNJTEdkWmlLd2JG?=
 =?utf-8?B?UUtZOHNrQzA4UGpmNkpMTlkwRG11bWtSZ05oYTQzNFpMdFVtODcxZlBETFNz?=
 =?utf-8?B?NXNSeW1yaE51V1F6SVN1RUkwRWdNVTdwVVkwb0I3V2J3aXFOUnNpWVdpTi8y?=
 =?utf-8?B?N3licm4yK3J5Tk9IMDRCQlBqcklDSUtwQ0k1ejF1Z2VsMWhITmg1NlNMcDlv?=
 =?utf-8?B?VHlWdG4xNXM3N3N5SjA2SHVMRzJQNXFpbFRQQm45ZGhmTFdUREM0RGoyVUxs?=
 =?utf-8?B?MVduN1Rua0lVdlRxU3JQVys2bGVOWjR1MmUvUE1HTVh4bjRpR2pxcFFXYlhT?=
 =?utf-8?B?R2dsNTRrcG1Wa1lqckJYL0NnTC9QVXBPM3JLS2pCNEJnekpvWXN5WjBXcUVP?=
 =?utf-8?Q?DQKNlhYNg9XJDals=3D?=
X-Exchange-RoutingPolicyChecked: 
	4RP+0mGDQBjJpYixTkIaBSBzb/kI0l2NoxDv6CNDce0mfSg7d2zRV/qLb+cpCsf5uis83Y5Uu29fJL5qV1bXx9SqEyK+cpFYWhcZEPTMpWRH7c6w8ItS6Lc1SOAG9LLriskZtKWSKM5687D3mt4sbPTN9SKVSVCpiGHO4E3MDEjaJ3kmF/C5iNeFm3tX7lOZyCFD8nbdkwNmW2jgxYdTc5oom5pmeNy8efOOUTpaKkFW3nuEM0gTa/oQINYbGSHzoVGvARYprS2oQw6tLFRGjbW6sdNmNZTp3GFsGmn5y8lqA0IexLbaY+noKvDUx5amvCYQHeNP5Km3CzmwUvRMuA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7664aec4-ce4f-424a-cc04-08df069681ca
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2026 12:59:20.7706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gzsjEo7O7IFZ9Ao1b1ZkOfJbR7oZSH4nF+97fuQzJ37iUtSfSym0u1ZOAFV5ieYLQv9hrZQE4vQGT0Yg8Rr2i8VsmH+4RvYitop/Bo4JnrY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7122
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDExMSBTYWx0ZWRfX9vNPPHwwWMKh
 MjgsEdqT1HR79JHuLh5LKK86Wnj5brQB6xMt4x29NP7hLo5f27CFQTZTYdi44lmqIXYWdUJy2Ll
 VGZiExpGxYFRFTamYZrukTDhBjQl33/8fYMDZJZsx1Cd2EQoDL9x8HZG55Ifhv+SvLaKqoa7y8k
 KjEdapyCL6gYtKovhqmzGAVHJfk64U0zgEJALb0vqArRtgacLYDAtSztFJ1llnFoWyYF8zMlaiC
 TBQSMuo0i+Hv0upGVE8ArbTc0WWWLFxXSxiCzEtUleqSdSFgIoi8YTDyTk5lWIKGg7tguWZw0Un
 cKyGIA+olDCZZTDL5pmX5bZCzmclCwAoi6cTbHzw8RKcfXIGsYFZbPUcEHL8tYPeaVCr2XwN4wX
 +ts7sipNxyAkA7VzBcc0kKUUw2vCalG5dzXSwRyWlEq1BReJ/18UDnDPERCwDlqzYmFrcApxItF
 pgG+EYCl9KR5bZHQ8Pg==
X-Authority-Analysis: v=2.4 cv=BJaDalQG c=1 sm=1 tr=0 ts=6a942930 cx=c_pps
 a=AVViaUQ/FgKrFaIAxxVSSQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=NEAV23lmAAAA:8 a=Twlkf-z8AAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=iGHA9ds3AAAA:8 a=IvTj1HvjAAAA:8 a=gWDa-L1wAAAA:8 a=AUd_NHdVAAAA:8
 a=P-IC7800AAAA:8 a=6R7veym_AAAA:8 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8
 a=57SyGIRnAAAA:8 a=Sspos6EWAAAA:8 a=21PQPjsVt0r7gsbS4E8A:9
 a=_rvVTZIaGg-Zj5cT:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=-74SuR6ZdpOK_LpdRCUo:22 a=FdTzh2GWekK77mhwV6Dw:22 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=kmyLcwvAnC_t3PsnBtKb:22 a=vg_HiZM2M4GgzivzK9OA:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=ILCOIF4F_8SzUMnO7jNM:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=gVaf0qAd5Psv6m3K4XZ_:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDExMSBTYWx0ZWRfXwG9NGiBVTlbv
 fZjkyKPr+R/rcZaeJafDPv0Mutc87W3NtqJRNO1r53TXJ7hd4O7NBuQpZuXwmgQlDOnuTxnfBhg
 u2210EG2p0Zw1qy1NROGk3TZqzFjOgpSqcxZlylXAYAODtgVZztD
X-Proofpoint-ORIG-GUID: _lwhiLCywOSL66ZEo6gqmrhQBizohtqI
X-Proofpoint-GUID: tDRVmlw1yYSiyiMxgxXnu32pyyiG3sid
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-30_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608300111
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 67UChLjk1358251
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 12:59:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244643

From: Sunil Dora <sunilkumar.dora@windriver.com>

Rebase the OE patch stack from 22.1.8 onto the 23.x release branch.

Dropped, the fix is already in 23.1.0:
  compiler-rt: do not use backtrace APIs on non-glibc linux
    https://github.com/llvm/llvm-project/commit/252ad2052409
  Rename UNUSED and UNKNOWN elements of OffloadArch enum
    https://github.com/llvm/llvm-project/commit/82f18b02d9fe
  libcxxabi: declare __gnu_unwind_frame in cxa_personality
    https://github.com/llvm/llvm-project/commit/8119f1854948
  LoopUnroll: iterate exit fold candidates in deterministic order
    https://github.com/llvm/llvm-project/commit/965f9d87adb0
  Prevent revisiting block when searching for noreturn
    https://github.com/llvm/llvm-project/commit/330b40e11fd2

Dropped, obsolete:
  libcxxabi: find libunwind headers when LIBCXXABI_LIBUNWIND_INCLUDES
    (cmake's find_path now searches the user-supplied path first)
  compiler-rt: support a new embedded linux target
    (only added files for the long-removed Makefile build system)

Reworked for the TripleName.def triple string tables added in 23:
  llvm/clang: insert anchor for adding OE distro vendor
  clang/llvm: add OE specific ABI triple for N32 ABI

Reworked for the restructured powerpc source lists in compiler-rt:
  compiler-rt: enable __int128 for ppc32

Newly carried, already merged in LLVM main:
  libc: disable float16 on 32-bit x86 without SSE2
    https://github.com/llvm/llvm-project/commit/05da143c63d3

GCC 16 defines __FLT16_MANT_DIG__ when targeting i686 without SSE2,
so the llvm-libc float16 headers that APFloat.cpp now includes fail
to build for 32-bit x86 multilib ("SSE register return with SSE2
disabled") without that last patch.

Release notes: https://releases.llvm.org/23.1.0/docs/ReleaseNotes.html

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 meta/conf/distro/include/maintainers.inc      |   2 +-
 ...ify-cross-compilation.-Don-t-use-na.patch} |   6 +-
 ...ibunwind-headers-when-LIBCXXABI_LIBU.patch |  60 ----
 ...-support-a-new-embedded-linux-target.patch | 309 ------------------
 ...env-override-of-exe-and-libdir-path.patch} |   4 +-
 ...-driver-Check-sysroot-for-ldso-path.patch} |  14 +-
 ...ools.cpp-Add-lssp_nonshared-on-musl.patch} |   6 +-
 ...5-clang-Prepend-trailing-to-sysroot.patch} |  10 +-
 ...fine-releative-gcc-installation-dir.patch} |  10 +-
 ...d-and-ldl-along-with-lunwind-for-st.patch} |  10 +-
 ...-Check-for-atomic-double-intrinsics.patch} |   4 +-
 ...ure-for-packages-using-find_package.patch} |  20 +-
 ...e-dir-location-for-cross-toolchains.patch} |   4 +-
 ...dyld-prefix-when-checking-sysroot-f.patch} |  18 +-
 ...clang-Use-python3-in-python-scripts.patch} |   6 +-
 ...-anchor-for-adding-OE-distro-vendor.patch} |  37 +--
 ...ple-for-non-debian-multiarch-linux-.patch} |   9 +-
 ...ibunwind-Added-unw_backtrace-method.patch} |   8 +-
 ...016-lldb-Link-with-libatomic-on-x86.patch} |   4 +-
 ...ot-use-backtrace-APIs-on-non-glibc-l.patch |  68 ----
 ...mpiler-rt-Enable-__int128-for-ppc32.patch} |  26 +-
 ...t-use-cmake-infra-to-detect-libzstd.patch} |   8 +-
 ...-Fix-stat-struct-s-size-for-O32-ABI.patch} |   6 +-
 ...cpp-ARMLibDirs-search-also-in-lib32.patch} |  10 +-
 ...-OE-specific-ABI-triple-for-N32-ABI.patch} |  63 ++--
 ...nwind.pc.in-and-llvm-config-scripts.patch} |  12 +-
 ...pect-LLVM_LIBDIR_SUFFIX-like-other-.patch} |  17 +-
 ...o-not-pass-target-to-clang-compiler.patch} |   4 +-
 ...-sort-ClassInfo-lists-by-name-as-we.patch} |   4 +-
 ...ve-LLVM_LDFLAGS-from-ldflags-output.patch} |   4 +-
 ...de-sync_fetch_and_-for-any-pre-ARMv.patch} |   6 +-
 ...de-uptr-sptr-typedefs-on-Mips-Linux.patch} |   8 +-
 ...-headers-in-the-debug-info-when-bui.patch} |   6 +-
 ..._HAVE_OPT_VIEWER_MODULES-externally.patch} |   6 +-
 ...ang-tblgen-if-it-is-actually-needed.patch} |   8 +-
 ...ymlink-path-for-libcc-when-LLVM_ENA.patch} |   8 +-
 ...ix-sysroot-based-compiler-rt-search.patch} |  15 +-
 ...> 0034-guard-clang-tools-extra-test.patch} |  47 ++-
 ...ng-block-when-searching-for-noreturn.patch |  41 ---
 ...e-float16-on-32-bit-x86-without-SSE2.patch |  36 ++
 ...UNKNOWN-elements-of-OffloadArch-enum.patch | 274 ----------------
 ...e-__gnu_unwind_frame-in-cxa_personal.patch |  33 --
 ...te-exit-fold-candidates-in-determini.patch |  71 ----
 meta/recipes-devtools/clang/common-clang.inc  |   4 +-
 meta/recipes-devtools/clang/common.inc        |  78 ++---
 45 files changed, 302 insertions(+), 1102 deletions(-)
 rename meta/recipes-devtools/clang/clang/{0003-compiler-rt-Simplify-cros=
s-compilation.-Don-t-use-na.patch =3D> 0001-compiler-rt-Simplify-cross-co=
mpilation.-Don-t-use-na.patch} (90%)
 delete mode 100644 meta/recipes-devtools/clang/clang/0001-libcxxabi-Find=
-libunwind-headers-when-LIBCXXABI_LIBU.patch
 delete mode 100644 meta/recipes-devtools/clang/clang/0002-compiler-rt-su=
pport-a-new-embedded-linux-target.patch
 rename meta/recipes-devtools/clang/clang/{0004-llvm-allow-env-override-o=
f-exe-and-libdir-path.patch =3D> 0002-llvm-allow-env-override-of-exe-and-=
libdir-path.patch} (96%)
 rename meta/recipes-devtools/clang/clang/{0005-clang-driver-Check-sysroo=
t-for-ldso-path.patch =3D> 0003-clang-driver-Check-sysroot-for-ldso-path.=
patch} (87%)
 rename meta/recipes-devtools/clang/clang/{0006-clang-Driver-tools.cpp-Ad=
d-lssp_nonshared-on-musl.patch =3D> 0004-clang-Driver-tools.cpp-Add-lssp_=
nonshared-on-musl.patch} (86%)
 rename meta/recipes-devtools/clang/clang/{0007-clang-Prepend-trailing-to=
-sysroot.patch =3D> 0005-clang-Prepend-trailing-to-sysroot.patch} (81%)
 rename meta/recipes-devtools/clang/clang/{0009-clang-Define-releative-gc=
c-installation-dir.patch =3D> 0006-clang-Define-releative-gcc-installatio=
n-dir.patch} (94%)
 rename meta/recipes-devtools/clang/clang/{0010-clang-Add-lpthread-and-ld=
l-along-with-lunwind-for-st.patch =3D> 0007-clang-Add-lpthread-and-ldl-al=
ong-with-lunwind-for-st.patch} (86%)
 rename meta/recipes-devtools/clang/clang/{0011-Check-for-atomic-double-i=
ntrinsics.patch =3D> 0008-Check-for-atomic-double-intrinsics.patch} (91%)
 rename meta/recipes-devtools/clang/clang/{0012-cmake-Fix-configure-for-p=
ackages-using-find_package.patch =3D> 0009-cmake-Fix-configure-for-packag=
es-using-find_package.patch} (89%)
 rename meta/recipes-devtools/clang/clang/{0013-clang-Fix-resource-dir-lo=
cation-for-cross-toolchains.patch =3D> 0010-clang-Fix-resource-dir-locati=
on-for-cross-toolchains.patch} (95%)
 rename meta/recipes-devtools/clang/clang/{0014-clang-driver-Add-dyld-pre=
fix-when-checking-sysroot-f.patch =3D> 0011-clang-driver-Add-dyld-prefix-=
when-checking-sysroot-f.patch} (88%)
 rename meta/recipes-devtools/clang/clang/{0015-clang-Use-python3-in-pyth=
on-scripts.patch =3D> 0012-clang-Use-python3-in-python-scripts.patch} (90=
%)
 rename meta/recipes-devtools/clang/clang/{0016-llvm-clang-Insert-anchor-=
for-adding-OE-distro-vendor.patch =3D> 0013-llvm-clang-Insert-anchor-for-=
adding-OE-distro-vendor.patch} (91%)
 rename meta/recipes-devtools/clang/clang/{0018-clang-Fix-x86-triple-for-=
non-debian-multiarch-linux-.patch =3D> 0014-clang-Fix-x86-triple-for-non-=
debian-multiarch-linux-.patch} (86%)
 rename meta/recipes-devtools/clang/clang/{0019-libunwind-Added-unw_backt=
race-method.patch =3D> 0015-libunwind-Added-unw_backtrace-method.patch} (=
89%)
 rename meta/recipes-devtools/clang/clang/{0020-lldb-Link-with-libatomic-=
on-x86.patch =3D> 0016-lldb-Link-with-libatomic-on-x86.patch} (92%)
 delete mode 100644 meta/recipes-devtools/clang/clang/0017-compiler-rt-Do=
-not-use-backtrace-APIs-on-non-glibc-l.patch
 rename meta/recipes-devtools/clang/clang/{0021-compiler-rt-Enable-__int1=
28-for-ppc32.patch =3D> 0017-compiler-rt-Enable-__int128-for-ppc32.patch}=
 (77%)
 rename meta/recipes-devtools/clang/clang/{0022-llvm-Do-not-use-cmake-inf=
ra-to-detect-libzstd.patch =3D> 0018-llvm-Do-not-use-cmake-infra-to-detec=
t-libzstd.patch} (91%)
 rename meta/recipes-devtools/clang/clang/{0023-compiler-rt-Fix-stat-stru=
ct-s-size-for-O32-ABI.patch =3D> 0019-compiler-rt-Fix-stat-struct-s-size-=
for-O32-ABI.patch} (91%)
 rename meta/recipes-devtools/clang/clang/{0024-ToolChains-Gnu.cpp-ARMLib=
Dirs-search-also-in-lib32.patch =3D> 0020-ToolChains-Gnu.cpp-ARMLibDirs-s=
earch-also-in-lib32.patch} (98%)
 rename meta/recipes-devtools/clang/clang/{0025-clang-llvm-Add-OE-specifi=
c-ABI-triple-for-N32-ABI.patch =3D> 0021-clang-llvm-Add-OE-specific-ABI-t=
riple-for-N32-ABI.patch} (60%)
 rename meta/recipes-devtools/clang/clang/{0026-llvm-Add-libunwind.pc.in-=
and-llvm-config-scripts.patch =3D> 0022-llvm-Add-libunwind.pc.in-and-llvm=
-config-scripts.patch} (84%)
 rename meta/recipes-devtools/clang/clang/{0027-scan-build-py-respect-LLV=
M_LIBDIR_SUFFIX-like-other-.patch =3D> 0023-scan-build-py-respect-LLVM_LI=
BDIR_SUFFIX-like-other-.patch} (90%)
 rename meta/recipes-devtools/clang/clang/{0028-compiler-rt-Do-not-pass-t=
arget-to-clang-compiler.patch =3D> 0024-compiler-rt-Do-not-pass-target-to=
-clang-compiler.patch} (91%)
 rename meta/recipes-devtools/clang/clang/{0029-AsmMatcherEmitter-sort-Cl=
assInfo-lists-by-name-as-we.patch =3D> 0025-AsmMatcherEmitter-sort-ClassI=
nfo-lists-by-name-as-we.patch} (92%)
 rename meta/recipes-devtools/clang/clang/{0030-llvm-config-remove-LLVM_L=
DFLAGS-from-ldflags-output.patch =3D> 0026-llvm-config-remove-LLVM_LDFLAG=
S-from-ldflags-output.patch} (92%)
 rename meta/recipes-devtools/clang/clang/{0031-compiler-rt-Exclude-sync_=
fetch_and_-for-any-pre-ARMv.patch =3D> 0027-compiler-rt-Exclude-sync_fetc=
h_and_-for-any-pre-ARMv.patch} (95%)
 rename meta/recipes-devtools/clang/clang/{0032-compiler-rt-Hardcode-uptr=
-sptr-typedefs-on-Mips-Linu.patch =3D> 0028-Hardcode-uptr-sptr-typedefs-o=
n-Mips-Linux.patch} (86%)
 rename meta/recipes-devtools/clang/clang/{0034-Revert-libc-Remap-headers=
-in-the-debug-info-when-bui.patch =3D> 0029-Revert-libc-Remap-headers-in-=
the-debug-info-when-bui.patch} (89%)
 rename meta/recipes-devtools/clang/clang/{0036-Don-t-expose-LLVM_HAVE_OP=
T_VIEWER_MODULES-externally.patch =3D> 0030-Don-t-expose-LLVM_HAVE_OPT_VI=
EWER_MODULES-externally.patch} (86%)
 rename meta/recipes-devtools/clang/clang/{0037-clang-Only-build-clang-tb=
lgen-if-it-is-actually-need.patch =3D> 0031-Only-build-clang-tblgen-if-it=
-is-actually-needed.patch} (81%)
 rename meta/recipes-devtools/clang/clang/{0038-llvm-libgcc-Fix-symlink-p=
ath-for-libcc-when-LLVM_ENA.patch =3D> 0032-llvm-libgcc-Fix-symlink-path-=
for-libcc-when-LLVM_ENA.patch} (93%)
 rename meta/recipes-devtools/clang/clang/{0041-Consolidate-and-fix-sysro=
ot-based-compiler-rt-search.patch =3D> 0033-Consolidate-and-fix-sysroot-b=
ased-compiler-rt-search.patch} (91%)
 rename meta/recipes-devtools/clang/clang/{0042-guard-clang-tools-extra-t=
est.patch =3D> 0034-guard-clang-tools-extra-test.patch} (83%)
 delete mode 100644 meta/recipes-devtools/clang/clang/0035-Prevent-revisi=
ting-block-when-searching-for-noreturn.patch
 create mode 100644 meta/recipes-devtools/clang/clang/0035-libc-Disable-f=
loat16-on-32-bit-x86-without-SSE2.patch
 delete mode 100644 meta/recipes-devtools/clang/clang/0039-Rename-UNUSED-=
and-UNKNOWN-elements-of-OffloadArch-enum.patch
 delete mode 100644 meta/recipes-devtools/clang/clang/0040-libcxxabi-decl=
are-__gnu_unwind_frame-in-cxa_personal.patch
 delete mode 100644 meta/recipes-devtools/clang/clang/0043-LoopUnroll-Ite=
rate-exit-fold-candidates-in-determini.patch

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index 2966cddc05..dde6821718 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -482,7 +482,7 @@ RECIPE_MAINTAINER:pn-linux-yocto-tiny =3D "Bruce Ashf=
ield <bruce.ashfield@gmail.co
 RECIPE_MAINTAINER:pn-lld =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-lldb =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-llvm =3D "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-llvm-project-source-22.1.8 =3D "Khem Raj <raj.khem@=
gmail.com>"
+RECIPE_MAINTAINER:pn-llvm-project-source-23.1.0 =3D "Khem Raj <raj.khem@=
gmail.com>"
 RECIPE_MAINTAINER:pn-llvm-tblgen-native =3D "Khem Raj <raj.khem@gmail.co=
m>"
 RECIPE_MAINTAINER:pn-log4cplus =3D "Unassigned <unassigned@yoctoproject.=
org>"
 RECIPE_MAINTAINER:pn-logrotate =3D "Yi Zhao <yi.zhao@windriver.com>"
diff --git a/meta/recipes-devtools/clang/clang/0003-compiler-rt-Simplify-=
cross-compilation.-Don-t-use-na.patch b/meta/recipes-devtools/clang/clang=
/0001-compiler-rt-Simplify-cross-compilation.-Don-t-use-na.patch
similarity index 90%
rename from meta/recipes-devtools/clang/clang/0003-compiler-rt-Simplify-c=
ross-compilation.-Don-t-use-na.patch
rename to meta/recipes-devtools/clang/clang/0001-compiler-rt-Simplify-cro=
ss-compilation.-Don-t-use-na.patch
index 896bbd11aa..4684fff493 100644
--- a/meta/recipes-devtools/clang/clang/0003-compiler-rt-Simplify-cross-c=
ompilation.-Don-t-use-na.patch
+++ b/meta/recipes-devtools/clang/clang/0001-compiler-rt-Simplify-cross-c=
ompilation.-Don-t-use-na.patch
@@ -1,4 +1,4 @@
-From 16b03fccab20cac13065ab99f36a7f0a77a62b92 Mon Sep 17 00:00:00 2001
+From 09798ecb4d4c7f1372e7538666bf9c5199f7ab04 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 19 May 2016 23:11:45 -0700
 Subject: [PATCH] compiler-rt: Simplify cross-compilation. Don't use
@@ -21,10 +21,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 10 insertions(+), 1 deletion(-)
=20
 diff --git a/compiler-rt/CMakeLists.txt b/compiler-rt/CMakeLists.txt
-index a92258ae1244..98c4e9a681d5 100644
+index d720b86..60ac56f 100644
 --- a/compiler-rt/CMakeLists.txt
 +++ b/compiler-rt/CMakeLists.txt
-@@ -109,7 +109,16 @@ if (COMPILER_RT_STANDALONE_BUILD)
+@@ -125,7 +125,16 @@ if (COMPILER_RT_STANDALONE_BUILD)
    set(CMAKE_CXX_EXTENSIONS NO)
 =20
    if (NOT LLVM_RUNTIMES_BUILD)
diff --git a/meta/recipes-devtools/clang/clang/0001-libcxxabi-Find-libunw=
ind-headers-when-LIBCXXABI_LIBU.patch b/meta/recipes-devtools/clang/clang=
/0001-libcxxabi-Find-libunwind-headers-when-LIBCXXABI_LIBU.patch
deleted file mode 100644
index 43221274bf..0000000000
--- a/meta/recipes-devtools/clang/clang/0001-libcxxabi-Find-libunwind-hea=
ders-when-LIBCXXABI_LIBU.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 97247b6a1df63a5f930d090a3952876eb67cf6fb Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 27 Aug 2017 10:37:49 -0700
-Subject: [PATCH] libcxxabi: Find libunwind headers when
- LIBCXXABI_LIBUNWIND_INCLUDES is set
-
-Currently, when LIBCXXABI_LIBUNWIND_INCLUDES is set via CMake arguments
-then it ends up not searching the specified dir and unwind.h is not foun=
d
-especially for ARM targets
-
-This patch makes the searching synthesized directories and then set
-LIBCXXABI_LIBUNWIND_INCLUDES if its there in environment
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- libcxxabi/CMakeLists.txt | 15 ++++++++++-----
- 1 file changed, 10 insertions(+), 5 deletions(-)
-
-diff --git a/libcxxabi/CMakeLists.txt b/libcxxabi/CMakeLists.txt
-index 2b67c5972339..45d84b404b30 100644
---- a/libcxxabi/CMakeLists.txt
-+++ b/libcxxabi/CMakeLists.txt
-@@ -476,7 +476,7 @@ set(LIBCXXABI_LIBUNWIND_PATH "${LIBCXXABI_LIBUNWIND_=
PATH}" CACHE PATH
-     "Specify path to libunwind source." FORCE)
-=20
- if (LIBCXXABI_USE_LLVM_UNWINDER OR LLVM_NATIVE_ARCH MATCHES ARM)
--  find_path(LIBCXXABI_LIBUNWIND_INCLUDES_INTERNAL libunwind.h
-+  find_path(LIBCXXABI_LIBUNWIND_INCLUDES libunwind.h
-     PATHS ${LIBCXXABI_LIBUNWIND_INCLUDES}
-           ${LIBCXXABI_LIBUNWIND_PATH}/include
-           ${CMAKE_BINARY_DIR}/${LIBCXXABI_LIBUNWIND_INCLUDES}
-@@ -487,18 +487,23 @@ if (LIBCXXABI_USE_LLVM_UNWINDER OR LLVM_NATIVE_ARC=
H MATCHES ARM)
-     NO_CMAKE_FIND_ROOT_PATH
-   )
-=20
--  if (LIBCXXABI_LIBUNWIND_INCLUDES_INTERNAL STREQUAL "LIBCXXABI_LIBUNWI=
ND_INCLUDES_INTERNAL-NOTFOUND")
--    set(LIBCXXABI_LIBUNWIND_INCLUDES_INTERNAL "")
-+  if (LIBCXXABI_LIBUNWIND_INCLUDES STREQUAL "LIBCXXABI_LIBUNWIND_INCLUD=
ES-NOTFOUND")
-+    set(LIBCXXABI_LIBUNWIND_INCLUDES "")
-   endif()
- endif()
-=20
--if (NOT "${LIBCXXABI_LIBUNWIND_INCLUDES_INTERNAL}" STREQUAL "")
--  include_directories("${LIBCXXABI_LIBUNWIND_INCLUDES_INTERNAL}")
-+if (NOT "${LIBCXXABI_LIBUNWIND_INCLUDES}" STREQUAL "")
-+  include_directories("${LIBCXXABI_LIBUNWIND_INCLUDES}")
- endif()
-=20
- add_custom_target(cxxabi-test-depends
-   COMMENT "Build dependencies required to run the libc++abi test suite.=
")
-=20
-+set(LIBCXXABI_LIBUNWIND_INCLUDES "${LIBCXXABI_LIBUNWIND_INCLUDES}" CACH=
E PATH
-+    "Specify path to libunwind includes." FORCE)
-+set(LIBCXXABI_LIBUNWIND_PATH "${LIBCXXABI_LIBUNWIND_PATH}" CACHE PATH
-+    "Specify path to libunwind source." FORCE)
-+
- # Add source code. This also contains all of the logic for deciding lin=
ker flags
- # soname, etc...
- add_subdirectory(include)
diff --git a/meta/recipes-devtools/clang/clang/0002-compiler-rt-support-a=
-new-embedded-linux-target.patch b/meta/recipes-devtools/clang/clang/0002=
-compiler-rt-support-a-new-embedded-linux-target.patch
deleted file mode 100644
index 5dcad6b0df..0000000000
--- a/meta/recipes-devtools/clang/clang/0002-compiler-rt-support-a-new-em=
bedded-linux-target.patch
+++ /dev/null
@@ -1,309 +0,0 @@
-From eae63772aacba29de729d9af5c52542cd8a043ee Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 19 Apr 2015 15:16:23 -0700
-Subject: [PATCH] compiler-rt: support a new embedded linux target
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- .../make/platform/clang_linux_embedded.mk     | 286 ++++++++++++++++++
- .../clang_linux_embedded_test_input.c         |   0
- 2 files changed, 286 insertions(+)
- create mode 100644 compiler-rt/make/platform/clang_linux_embedded.mk
- create mode 100644 compiler-rt/make/platform/clang_linux_embedded_test_=
input.c
-
-diff --git a/compiler-rt/make/platform/clang_linux_embedded.mk b/compile=
r-rt/make/platform/clang_linux_embedded.mk
-new file mode 100644
-index 000000000000..d0a890075a1c
---- /dev/null
-+++ b/compiler-rt/make/platform/clang_linux_embedded.mk
-@@ -0,0 +1,286 @@
-+# These are the functions which clang needs when it is targeting a prev=
ious
-+# version of the OS. The issue is that the backend may use functions wh=
ich were
-+# not present in the libgcc that shipped on the platform. In such cases=
, we link
-+# with a version of the library which contains private_extern definitio=
ns of all
-+# the extra functions which might be referenced.
-+
-+Description :=3D Static runtime libraries for embedded clang/Linux
-+
-+# A function that ensures we don't try to build for architectures that =
we
-+# don't have working toolchains for.
-+CheckArches =3D \
-+  $(shell \
-+    result=3D""; \
-+    for arch in $(1); do \
-+      if $(CC) -arch $$arch -c \
-+	  -integrated-as \
-+	  $(ProjSrcRoot)/make/platform/clang_linux_embedded_test_input.c \
-+	  -o /dev/null > /dev/null 2> /dev/null; then \
-+        result=3D"$$result$$arch "; \
-+      else \
-+	printf 1>&2 \
-+	  "warning: clang_linux_embedded.mk: dropping arch '$$arch' from lib '=
$(2)'\n"; \
-+      fi; \
-+    done; \
-+    echo $$result)
-+
-+XCRun =3D \
-+  $(shell \
-+    result=3D`xcrun -find $(1) 2> /dev/null`; \
-+    if [ "$$?" !=3D "0" ]; then result=3D$(1); fi; \
-+    echo $$result)
-+
-+###
-+
-+CC       :=3D $(call XCRun,clang)
-+AR       :=3D $(call XCRun,ar)
-+RANLIB   :=3D $(call XCRun,ranlib)
-+STRIP    :=3D $(call XCRun,strip)
-+LIPO     :=3D $(call XCRun,lipo)
-+DSYMUTIL :=3D $(call XCRun,dsymutil)
-+Configs :=3D
-+UniversalArchs :=3D
-+
-+# Soft-float version of the runtime. No floating-point instructions wil=
l be used
-+# and the ABI (out of necessity) passes floating values in normal regis=
ters:
-+# non-VFP variant of the AAPCS.
-+UniversalArchs.soft_static :=3D $(call CheckArches,arm armv7m armv7em a=
rmv7,soft_static)
-+Configs +=3D $(if $(UniversalArchs.soft_static),soft_static)
-+
-+# Hard-float version of the runtime. On ARM VFP instructions and regist=
ers are
-+# allowed, and floating point values get passed in them. VFP variant of=
 the
-+# AAPCS.
-+UniversalArchs.hard_static :=3D $(call CheckArches,armv7em armv7 i386 x=
86_64,hard_static)
-+Configs +=3D $(if $(UniversalArchs.hard_static),hard_static)
-+
-+UniversalArchs.soft_pic :=3D $(call CheckArches,armv6m armv7m armv7em a=
rmv7,soft_pic)
-+Configs +=3D $(if $(UniversalArchs.soft_pic),soft_pic)
-+
-+UniversalArchs.hard_pic :=3D $(call CheckArches,armv7em armv7 i386 x86_=
64,hard_pic)
-+Configs +=3D $(if $(UniversalArchs.hard_pic),hard_pic)
-+
-+CFLAGS :=3D -Wall -Werror -Oz -fomit-frame-pointer -ffreestanding
-+
-+PIC_CFLAGS :=3D -fPIC
-+STATIC_CFLAGS :=3D -static
-+
-+CFLAGS_SOFT :=3D -mfloat-abi=3Dsoft
-+CFLAGS_HARD :=3D -mfloat-abi=3Dhard
-+
-+CFLAGS_I386  :=3D -march=3Dpentium
-+
-+CFLAGS.soft_static :=3D $(CFLAGS) $(STATIC_CFLAGS) $(CFLAGS_SOFT)
-+CFLAGS.hard_static :=3D $(CFLAGS) $(STATIC_CFLAGS) $(CFLAGS_HARD)
-+CFLAGS.soft_pic    :=3D $(CFLAGS) $(PIC_CFLAGS) $(CFLAGS_SOFT)
-+CFLAGS.hard_pic    :=3D $(CFLAGS) $(PIC_CFLAGS) $(CFLAGS_HARD)
-+
-+CFLAGS.soft_static.armv7 :=3D $(CFLAGS.soft_static) $(CFLAGS_ARMV7)
-+CFLAGS.hard_static.armv7 :=3D $(CFLAGS.hard_static) $(CFLAGS_ARMV7)
-+CFLAGS.soft_pic.armv7    :=3D $(CFLAGS.soft_pic) $(CFLAGS_ARMV7)
-+CFLAGS.hard_pic.armv7    :=3D $(CFLAGS.hard_pic) $(CFLAGS_ARMV7)
-+
-+# x86 platforms ignore -mfloat-abi options and complain about doing so.=
 Despite
-+# this they're hard-float.
-+CFLAGS.hard_static.i386   :=3D $(CFLAGS) $(STATIC_CFLAGS) $(CFLAGS_I386=
)
-+CFLAGS.hard_pic.i386      :=3D $(CFLAGS) $(PIC_CFLAGS) $(CFLAGS_I386)
-+CFLAGS.hard_static.x86_64 :=3D $(CFLAGS) $(STATIC_CFLAGS)
-+CFLAGS.hard_pic.x86_64    :=3D $(CFLAGS) $(PIC_CFLAGS)
-+
-+# Functions not wanted:
-+#   + eprintf is obsolete anyway
-+#   + *vfp: designed for Thumb1 CPUs with VFPv2
-+
-+COMMON_FUNCTIONS :=3D \
-+	absvdi2 \
-+	absvsi2 \
-+	addvdi3 \
-+	addvsi3 \
-+	ashldi3 \
-+	ashrdi3 \
-+	bswapdi2 \
-+	bswapsi2 \
-+	clzdi2 \
-+	clzsi2 \
-+	cmpdi2 \
-+	ctzdi2 \
-+	ctzsi2 \
-+	divdc3 \
-+	divdi3 \
-+	divsc3 \
-+	divmodsi4 \
-+	udivmodsi4 \
-+	do_global_dtors \
-+	ffsdi2 \
-+	fixdfdi \
-+	fixsfdi \
-+	fixunsdfdi \
-+	fixunsdfsi \
-+	fixunssfdi \
-+	fixunssfsi \
-+	floatdidf \
-+	floatdisf \
-+	floatundidf \
-+	floatundisf \
-+	gcc_bcmp \
-+	lshrdi3 \
-+	moddi3 \
-+	muldc3 \
-+	muldi3 \
-+	mulsc3 \
-+	mulvdi3 \
-+	mulvsi3 \
-+	negdi2 \
-+	negvdi2 \
-+	negvsi2 \
-+	paritydi2 \
-+	paritysi2 \
-+	popcountdi2 \
-+	popcountsi2 \
-+	powidf2 \
-+	powisf2 \
-+	subvdi3 \
-+	subvsi3 \
-+	ucmpdi2 \
-+	udiv_w_sdiv \
-+	udivdi3 \
-+	udivmoddi4 \
-+	umoddi3 \
-+	adddf3 \
-+	addsf3 \
-+	cmpdf2 \
-+	cmpsf2 \
-+	div0 \
-+	divdf3 \
-+	divsf3 \
-+	divsi3 \
-+	extendsfdf2 \
-+	ffssi2 \
-+	fixdfsi \
-+	fixsfsi \
-+	floatsidf \
-+	floatsisf \
-+	floatunsidf \
-+	floatunsisf \
-+	comparedf2 \
-+	comparesf2 \
-+	modsi3 \
-+	muldf3 \
-+	mulsf3 \
-+	negdf2 \
-+	negsf2 \
-+	subdf3 \
-+	subsf3 \
-+	truncdfsf2 \
-+	udivsi3 \
-+	umodsi3 \
-+	unorddf2 \
-+	unordsf2
-+
-+ARM_FUNCTIONS :=3D \
-+	aeabi_cdcmpeq \
-+	aeabi_cdrcmple \
-+	aeabi_cfcmpeq \
-+	aeabi_cfrcmple \
-+	aeabi_dcmpeq \
-+	aeabi_dcmpge \
-+	aeabi_dcmpgt \
-+	aeabi_dcmple \
-+	aeabi_dcmplt \
-+	aeabi_drsub \
-+	aeabi_fcmpeq \
-+	aeabi_fcmpge \
-+	aeabi_fcmpgt \
-+	aeabi_fcmple \
-+	aeabi_fcmplt \
-+	aeabi_frsub \
-+	aeabi_idivmod \
-+	aeabi_uidivmod \
-+
-+# ARM Assembly implementation which requires Thumb2 (i.e. won't work on=
 v6M).
-+THUMB2_FUNCTIONS :=3D \
-+	switch16 \
-+	switch32 \
-+	switch8 \
-+	switchu8 \
-+	sync_fetch_and_add_4 \
-+	sync_fetch_and_sub_4 \
-+	sync_fetch_and_and_4 \
-+	sync_fetch_and_or_4 \
-+	sync_fetch_and_xor_4 \
-+	sync_fetch_and_nand_4 \
-+	sync_fetch_and_max_4 \
-+	sync_fetch_and_umax_4 \
-+	sync_fetch_and_min_4 \
-+	sync_fetch_and_umin_4 \
-+	sync_fetch_and_add_8 \
-+	sync_fetch_and_sub_8 \
-+	sync_fetch_and_and_8 \
-+	sync_fetch_and_or_8 \
-+	sync_fetch_and_xor_8 \
-+	sync_fetch_and_nand_8 \
-+	sync_fetch_and_max_8 \
-+	sync_fetch_and_umax_8 \
-+	sync_fetch_and_min_8 \
-+	sync_fetch_and_umin_8
-+
-+I386_FUNCTIONS :=3D  \
-+	i686.get_pc_thunk.eax \
-+	i686.get_pc_thunk.ebp \
-+	i686.get_pc_thunk.ebx \
-+	i686.get_pc_thunk.ecx \
-+	i686.get_pc_thunk.edi \
-+	i686.get_pc_thunk.edx \
-+	i686.get_pc_thunk.esi
-+
-+# FIXME: Currently, compiler-rt is missing implementations for a number=
 of the
-+# functions. Filter them out for now.
-+MISSING_FUNCTIONS :=3D \
-+	cmpdf2 cmpsf2 div0 \
-+	ffssi2 \
-+	udiv_w_sdiv unorddf2 unordsf2 bswapdi2 \
-+	bswapsi2 \
-+	gcc_bcmp \
-+	do_global_dtors \
-+	i686.get_pc_thunk.eax i686.get_pc_thunk.ebp i686.get_pc_thunk.ebx \
-+	i686.get_pc_thunk.ecx i686.get_pc_thunk.edi i686.get_pc_thunk.edx \
-+	i686.get_pc_thunk.esi \
-+	aeabi_cdcmpeq aeabi_cdrcmple aeabi_cfcmpeq aeabi_cfrcmple aeabi_dcmpeq=
 \
-+	aeabi_dcmpge aeabi_dcmpgt aeabi_dcmple aeabi_dcmplt aeabi_drsub \
-+	aeabi_fcmpeq \ aeabi_fcmpge aeabi_fcmpgt aeabi_fcmple aeabi_fcmplt \
-+	aeabi_frsub aeabi_idivmod aeabi_uidivmod
-+
-+FUNCTIONS_ARMV6M  :=3D $(COMMON_FUNCTIONS) $(ARM_FUNCTIONS)
-+FUNCTIONS_ARM_ALL :=3D $(COMMON_FUNCTIONS) $(ARM_FUNCTIONS) $(THUMB2_FU=
NCTIONS)
-+FUNCTIONS_I386    :=3D $(COMMON_FUNCTIONS) $(I386_FUNCTIONS)
-+FUNCTIONS_X86_64  :=3D $(COMMON_FUNCTIONS)
-+
-+FUNCTIONS_ARMV6M :=3D \
-+	$(filter-out $(MISSING_FUNCTIONS),$(FUNCTIONS_ARMV6M))
-+FUNCTIONS_ARM_ALL :=3D \
-+	$(filter-out $(MISSING_FUNCTIONS),$(FUNCTIONS_ARM_ALL))
-+FUNCTIONS_I386 :=3D \
-+	$(filter-out $(MISSING_FUNCTIONS),$(FUNCTIONS_I386))
-+FUNCTIONS_X86_64 :=3D \
-+	$(filter-out $(MISSING_FUNCTIONS),$(FUNCTIONS_X86_64))
-+
-+FUNCTIONS.soft_static.armv6m :=3D $(FUNCTIONS_ARMV6M)
-+FUNCTIONS.soft_pic.armv6m    :=3D $(FUNCTIONS_ARMV6M)
-+
-+FUNCTIONS.soft_static.armv7m :=3D $(FUNCTIONS_ARM_ALL)
-+FUNCTIONS.soft_pic.armv7m    :=3D $(FUNCTIONS_ARM_ALL)
-+
-+FUNCTIONS.soft_static.armv7em :=3D $(FUNCTIONS_ARM_ALL)
-+FUNCTIONS.hard_static.armv7em :=3D $(FUNCTIONS_ARM_ALL)
-+FUNCTIONS.soft_pic.armv7em    :=3D $(FUNCTIONS_ARM_ALL)
-+FUNCTIONS.hard_pic.armv7em    :=3D $(FUNCTIONS_ARM_ALL)
-+
-+FUNCTIONS.soft_static.armv7 :=3D $(FUNCTIONS_ARM_ALL)
-+FUNCTIONS.hard_static.armv7 :=3D $(FUNCTIONS_ARM_ALL)
-+FUNCTIONS.soft_pic.armv7    :=3D $(FUNCTIONS_ARM_ALL)
-+FUNCTIONS.hard_pic.armv7    :=3D $(FUNCTIONS_ARM_ALL)
-+
-+FUNCTIONS.hard_static.i386 :=3D $(FUNCTIONS_I386)
-+FUNCTIONS.hard_pic.i386    :=3D $(FUNCTIONS_I386)
-+
-+FUNCTIONS.hard_static.x86_64 :=3D $(FUNCTIONS_X86_64)
-+FUNCTIONS.hard_pic.x86_64    :=3D $(FUNCTIONS_X86_64)
-diff --git a/compiler-rt/make/platform/clang_linux_embedded_test_input.c=
 b/compiler-rt/make/platform/clang_linux_embedded_test_input.c
-new file mode 100644
-index 000000000000..e69de29bb2d1
diff --git a/meta/recipes-devtools/clang/clang/0004-llvm-allow-env-overri=
de-of-exe-and-libdir-path.patch b/meta/recipes-devtools/clang/clang/0002-=
llvm-allow-env-override-of-exe-and-libdir-path.patch
similarity index 96%
rename from meta/recipes-devtools/clang/clang/0004-llvm-allow-env-overrid=
e-of-exe-and-libdir-path.patch
rename to meta/recipes-devtools/clang/clang/0002-llvm-allow-env-override-=
of-exe-and-libdir-path.patch
index 3c7c274693..583718c6ee 100644
--- a/meta/recipes-devtools/clang/clang/0004-llvm-allow-env-override-of-e=
xe-and-libdir-path.patch
+++ b/meta/recipes-devtools/clang/clang/0002-llvm-allow-env-override-of-e=
xe-and-libdir-path.patch
@@ -1,4 +1,4 @@
-From d13464858866ff3c0026294d6842f74a11a0d625 Mon Sep 17 00:00:00 2001
+From 9aa64eaa942dad120bc6baaf17d6d859049f9de9 Mon Sep 17 00:00:00 2001
 From: Martin Kelly <mkelly@xevo.com>
 Date: Fri, 19 May 2017 00:22:57 -0700
 Subject: [PATCH] llvm: allow env override of exe and libdir path
@@ -19,7 +19,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 19 insertions(+), 6 deletions(-)
=20
 diff --git a/llvm/tools/llvm-config/llvm-config.cpp b/llvm/tools/llvm-co=
nfig/llvm-config.cpp
-index 24ea264419af..0a3f51ae2b83 100644
+index 76aa9f8..64795e9 100644
 --- a/llvm/tools/llvm-config/llvm-config.cpp
 +++ b/llvm/tools/llvm-config/llvm-config.cpp
 @@ -248,6 +248,13 @@ Typical components:\n\
diff --git a/meta/recipes-devtools/clang/clang/0005-clang-driver-Check-sy=
sroot-for-ldso-path.patch b/meta/recipes-devtools/clang/clang/0003-clang-=
driver-Check-sysroot-for-ldso-path.patch
similarity index 87%
rename from meta/recipes-devtools/clang/clang/0005-clang-driver-Check-sys=
root-for-ldso-path.patch
rename to meta/recipes-devtools/clang/clang/0003-clang-driver-Check-sysro=
ot-for-ldso-path.patch
index e4636d30d1..d68dc94b03 100644
--- a/meta/recipes-devtools/clang/clang/0005-clang-driver-Check-sysroot-f=
or-ldso-path.patch
+++ b/meta/recipes-devtools/clang/clang/0003-clang-driver-Check-sysroot-f=
or-ldso-path.patch
@@ -1,4 +1,4 @@
-From 7a12ad3232dd6881ca40d94277ca8064a12d9df6 Mon Sep 17 00:00:00 2001
+From 6d26dbc005701acc1dbbd9e05e8596328a7d58f1 Mon Sep 17 00:00:00 2001
 From: Dan McGregor <dan.mcgregor@usask.ca>
 Date: Wed, 26 Apr 2017 20:29:41 -0600
 Subject: [PATCH] clang: driver: Check sysroot for ldso path
@@ -17,10 +17,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 21 insertions(+), 1 deletion(-)
=20
 diff --git a/clang/lib/Driver/ToolChains/Linux.cpp b/clang/lib/Driver/To=
olChains/Linux.cpp
-index d525b417b4ea..1c31901ade74 100644
+index 8d30a5e..1958c64 100644
 --- a/clang/lib/Driver/ToolChains/Linux.cpp
 +++ b/clang/lib/Driver/ToolChains/Linux.cpp
-@@ -630,8 +630,12 @@ std::string Linux::getDynamicLinker(const ArgList &=
Args) const {
+@@ -645,8 +645,12 @@ std::string Linux::getDynamicLinker(const ArgList &=
Args) const {
          Triple.getEnvironment() =3D=3D llvm::Triple::GNUEABIHFT64 ||
          tools::arm::getARMFloatABI(*this, Args) =3D=3D tools::arm::Floa=
tABI::Hard;
 =20
@@ -34,7 +34,7 @@ index d525b417b4ea..1c31901ade74 100644
      break;
    }
    case llvm::Triple::loongarch32: {
-@@ -685,11 +689,19 @@ std::string Linux::getDynamicLinker(const ArgList =
&Args) const {
+@@ -700,11 +704,19 @@ std::string Linux::getDynamicLinker(const ArgList =
&Args) const {
      LibDir =3D "lib64";
      Loader =3D
          (tools::ppc::hasPPCAbiArg(Args, "elfv2")) ? "ld64.so.2" : "ld64=
.so.1";
@@ -53,8 +53,8 @@ index d525b417b4ea..1c31901ade74 100644
 +    }
      break;
    case llvm::Triple::riscv32:
-   case llvm::Triple::riscv64: {
-@@ -707,6 +719,10 @@ std::string Linux::getDynamicLinker(const ArgList &=
Args) const {
+   case llvm::Triple::riscv64:
+@@ -724,6 +736,10 @@ std::string Linux::getDynamicLinker(const ArgList &=
Args) const {
    case llvm::Triple::sparcv9:
      LibDir =3D "lib64";
      Loader =3D "ld-linux.so.2";
@@ -65,7 +65,7 @@ index d525b417b4ea..1c31901ade74 100644
      break;
    case llvm::Triple::systemz:
      LibDir =3D "lib";
-@@ -721,6 +737,10 @@ std::string Linux::getDynamicLinker(const ArgList &=
Args) const {
+@@ -738,6 +754,10 @@ std::string Linux::getDynamicLinker(const ArgList &=
Args) const {
 =20
      LibDir =3D X32 ? "libx32" : "lib64";
      Loader =3D X32 ? "ld-linux-x32.so.2" : "ld-linux-x86-64.so.2";
diff --git a/meta/recipes-devtools/clang/clang/0006-clang-Driver-tools.cp=
p-Add-lssp_nonshared-on-musl.patch b/meta/recipes-devtools/clang/clang/00=
04-clang-Driver-tools.cpp-Add-lssp_nonshared-on-musl.patch
similarity index 86%
rename from meta/recipes-devtools/clang/clang/0006-clang-Driver-tools.cpp=
-Add-lssp_nonshared-on-musl.patch
rename to meta/recipes-devtools/clang/clang/0004-clang-Driver-tools.cpp-A=
dd-lssp_nonshared-on-musl.patch
index 0269dece67..1ba19bb4cd 100644
--- a/meta/recipes-devtools/clang/clang/0006-clang-Driver-tools.cpp-Add-l=
ssp_nonshared-on-musl.patch
+++ b/meta/recipes-devtools/clang/clang/0004-clang-Driver-tools.cpp-Add-l=
ssp_nonshared-on-musl.patch
@@ -1,4 +1,4 @@
-From 19b8ca2e1aa536e7d7f7eb379fc4e4d6f1efd07a Mon Sep 17 00:00:00 2001
+From 64a5c3e2680fb2a04ecba015af8eb5049c4840e1 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 19 May 2016 21:11:06 -0700
 Subject: [PATCH] clang: Driver/tools.cpp: Add -lssp_nonshared on musl
@@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 6 insertions(+)
=20
 diff --git a/clang/lib/Driver/ToolChains/Gnu.cpp b/clang/lib/Driver/Tool=
Chains/Gnu.cpp
-index cb6a9b242421..8f126474b7d1 100644
+index 24076d8..a7a64fc 100644
 --- a/clang/lib/Driver/ToolChains/Gnu.cpp
 +++ b/clang/lib/Driver/ToolChains/Gnu.cpp
-@@ -539,6 +539,12 @@ void tools::gnutools::Linker::ConstructJob(Compilat=
ion &C, const JobAction &JA,
+@@ -537,6 +537,12 @@ void tools::gnutools::Linker::ConstructJob(Compilat=
ion &C, const JobAction &JA,
        if (IsIAMCU)
          CmdArgs.push_back("-lgloss");
 =20
diff --git a/meta/recipes-devtools/clang/clang/0007-clang-Prepend-trailin=
g-to-sysroot.patch b/meta/recipes-devtools/clang/clang/0005-clang-Prepend=
-trailing-to-sysroot.patch
similarity index 81%
rename from meta/recipes-devtools/clang/clang/0007-clang-Prepend-trailing=
-to-sysroot.patch
rename to meta/recipes-devtools/clang/clang/0005-clang-Prepend-trailing-t=
o-sysroot.patch
index 321de79c78..0de2208a0f 100644
--- a/meta/recipes-devtools/clang/clang/0007-clang-Prepend-trailing-to-sy=
sroot.patch
+++ b/meta/recipes-devtools/clang/clang/0005-clang-Prepend-trailing-to-sy=
sroot.patch
@@ -1,4 +1,4 @@
-From 1746960b385afbc9e8e355a3b7c66b43c946451b Mon Sep 17 00:00:00 2001
+From e6285791435950771c13b442319efdcd6a21d81e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 16 Mar 2017 09:02:13 -0700
 Subject: [PATCH] clang: Prepend trailing '/' to sysroot
@@ -25,12 +25,12 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/clang/lib/Driver/ToolChains/Linux.cpp b/clang/lib/Driver/To=
olChains/Linux.cpp
-index 1c31901ade74..f7f096c1ac0a 100644
+index 1958c64..cb2b227 100644
 --- a/clang/lib/Driver/ToolChains/Linux.cpp
 +++ b/clang/lib/Driver/ToolChains/Linux.cpp
-@@ -235,7 +235,7 @@ Linux::Linux(const Driver &D, const llvm::Triple &Tr=
iple, const ArgList &Args)
-   Multilibs =3D GCCInstallation.getMultilibs();
-   SelectedMultilibs.assign({GCCInstallation.getMultilib()});
+@@ -238,7 +238,7 @@ Linux::Linux(const Driver &D, const llvm::Triple &Tr=
iple, const ArgList &Args)
+   loadMultilibsFromYAML(Args, D);
+=20
    llvm::Triple::ArchType Arch =3D Triple.getArch();
 -  std::string SysRoot =3D computeSysRoot();
 +  std::string SysRoot =3D computeSysRoot() + "/";
diff --git a/meta/recipes-devtools/clang/clang/0009-clang-Define-releativ=
e-gcc-installation-dir.patch b/meta/recipes-devtools/clang/clang/0006-cla=
ng-Define-releative-gcc-installation-dir.patch
similarity index 94%
rename from meta/recipes-devtools/clang/clang/0009-clang-Define-releative=
-gcc-installation-dir.patch
rename to meta/recipes-devtools/clang/clang/0006-clang-Define-releative-g=
cc-installation-dir.patch
index 38470e9834..427842a07a 100644
--- a/meta/recipes-devtools/clang/clang/0009-clang-Define-releative-gcc-i=
nstallation-dir.patch
+++ b/meta/recipes-devtools/clang/clang/0006-clang-Define-releative-gcc-i=
nstallation-dir.patch
@@ -1,4 +1,4 @@
-From bfba4232621e151cfc5dcb16ce5bf661f8c3d8f8 Mon Sep 17 00:00:00 2001
+From 04e0958fea64ebc9c89c0a6c147e8806a87727bd Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 20 Mar 2021 16:09:16 -0700
 Subject: [PATCH] clang: Define / releative gcc installation dir
@@ -61,7 +61,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 14 insertions(+), 8 deletions(-)
=20
 diff --git a/clang/lib/Driver/ToolChains/Gnu.cpp b/clang/lib/Driver/Tool=
Chains/Gnu.cpp
-index 8f126474b7d1..c80980a7fb09 100644
+index a7a64fc..f44663f 100644
 --- a/clang/lib/Driver/ToolChains/Gnu.cpp
 +++ b/clang/lib/Driver/ToolChains/Gnu.cpp
 @@ -18,6 +18,7 @@
@@ -72,7 +72,7 @@ index 8f126474b7d1..c80980a7fb09 100644
  #include "clang/Driver/Driver.h"
  #include "clang/Driver/MultilibBuilder.h"
  #include "clang/Driver/Tool.h"
-@@ -2847,6 +2848,7 @@ void Generic_GCC::GCCInstallationDetector::ScanLib=
DirForGCCTriple(
+@@ -2869,6 +2870,7 @@ void Generic_GCC::GCCInstallationDetector::ScanLib=
DirForGCCTriple(
      const llvm::Triple &TargetTriple, const ArgList &Args,
      const std::string &LibDir, StringRef CandidateTriple,
      bool NeedsBiarchSuffix, bool GCCDirExists, bool GCCCrossDirExists) =
{
@@ -80,7 +80,7 @@ index 8f126474b7d1..c80980a7fb09 100644
    // Locations relative to the system lib directory where GCC's triple-=
specific
    // directories might reside.
    struct GCCLibSuffix {
-@@ -2858,19 +2860,20 @@ void Generic_GCC::GCCInstallationDetector::ScanL=
ibDirForGCCTriple(
+@@ -2880,19 +2882,20 @@ void Generic_GCC::GCCInstallationDetector::ScanL=
ibDirForGCCTriple(
      // Whether this library suffix is relevant for the triple.
      bool Active;
    } Suffixes[] =3D {
@@ -108,7 +108,7 @@ index 8f126474b7d1..c80980a7fb09 100644
 =20
    SmallVector<GCCInstallCandidate, 3> Installations;
    for (auto &Suffix : Suffixes) {
-@@ -3273,8 +3276,11 @@ Generic_GCC::addLibCxxIncludePaths(const llvm::op=
t::ArgList &DriverArgs,
+@@ -3297,8 +3300,11 @@ Generic_GCC::addLibCxxIncludePaths(const llvm::op=
t::ArgList &DriverArgs,
    // incompatible with the NDK libraries.
    SmallString<128> DriverIncludeDir(getDriver().Dir);
    llvm::sys::path::append(DriverIncludeDir, "..", "include");
diff --git a/meta/recipes-devtools/clang/clang/0010-clang-Add-lpthread-an=
d-ldl-along-with-lunwind-for-st.patch b/meta/recipes-devtools/clang/clang=
/0007-clang-Add-lpthread-and-ldl-along-with-lunwind-for-st.patch
similarity index 86%
rename from meta/recipes-devtools/clang/clang/0010-clang-Add-lpthread-and=
-ldl-along-with-lunwind-for-st.patch
rename to meta/recipes-devtools/clang/clang/0007-clang-Add-lpthread-and-l=
dl-along-with-lunwind-for-st.patch
index b338d0f570..e07f004fb4 100644
--- a/meta/recipes-devtools/clang/clang/0010-clang-Add-lpthread-and-ldl-a=
long-with-lunwind-for-st.patch
+++ b/meta/recipes-devtools/clang/clang/0007-clang-Add-lpthread-and-ldl-a=
long-with-lunwind-for-st.patch
@@ -1,8 +1,8 @@
-From 03875620d0172a7c07e3cdc607a6877b06a130e9 Mon Sep 17 00:00:00 2001
+From f64b2adab7e4c515aa1e082054ad4514898e2d5d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 31 Jul 2019 22:51:39 -0700
-Subject: [PATCH] clang: Add -lpthread and -ldl along with -lunwind for s=
tatic
- linking
+Subject: [PATCH] clang: Add -lpthread and -ldl along with -lunwind for
+ static linking
=20
 When doing static liking with --unwindlib=3Dlibunwind -static we encount=
er
 undefined symbols
@@ -21,10 +21,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 2 insertions(+)
=20
 diff --git a/clang/lib/Driver/ToolChains/CommonArgs.cpp b/clang/lib/Driv=
er/ToolChains/CommonArgs.cpp
-index 10a1a412eea0..a217897610c3 100644
+index 08c0695..362e7ca 100644
 --- a/clang/lib/Driver/ToolChains/CommonArgs.cpp
 +++ b/clang/lib/Driver/ToolChains/CommonArgs.cpp
-@@ -2415,6 +2415,8 @@ static void AddUnwindLibrary(const ToolChain &TC, =
const Driver &D,
+@@ -2484,6 +2484,8 @@ static void AddUnwindLibrary(const ToolChain &TC, =
const Driver &D,
          CmdArgs.push_back("-lunwind");
      } else if (LGT =3D=3D LibGccType::StaticLibGcc) {
        CmdArgs.push_back("-l:libunwind.a");
diff --git a/meta/recipes-devtools/clang/clang/0011-Check-for-atomic-doub=
le-intrinsics.patch b/meta/recipes-devtools/clang/clang/0008-Check-for-at=
omic-double-intrinsics.patch
similarity index 91%
rename from meta/recipes-devtools/clang/clang/0011-Check-for-atomic-doubl=
e-intrinsics.patch
rename to meta/recipes-devtools/clang/clang/0008-Check-for-atomic-double-=
intrinsics.patch
index ba6a5c1510..c9764c70e9 100644
--- a/meta/recipes-devtools/clang/clang/0011-Check-for-atomic-double-intr=
insics.patch
+++ b/meta/recipes-devtools/clang/clang/0008-Check-for-atomic-double-intr=
insics.patch
@@ -1,4 +1,4 @@
-From ea4326b11976e48dde6d99605ac24df048cd3b10 Mon Sep 17 00:00:00 2001
+From a4a94de113dce4cf88c05bf0d5628a902ed93ff3 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 18 Nov 2019 17:00:29 -0800
 Subject: [PATCH] Check for atomic<double> intrinsics
@@ -16,7 +16,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
=20
 diff --git a/llvm/cmake/modules/CheckAtomic.cmake b/llvm/cmake/modules/C=
heckAtomic.cmake
-index f11cadf39ff6..80a18a92956a 100644
+index f11cadf..80a18a9 100644
 --- a/llvm/cmake/modules/CheckAtomic.cmake
 +++ b/llvm/cmake/modules/CheckAtomic.cmake
 @@ -30,10 +30,11 @@ function(check_working_cxx_atomics64 varname)
diff --git a/meta/recipes-devtools/clang/clang/0012-cmake-Fix-configure-f=
or-packages-using-find_package.patch b/meta/recipes-devtools/clang/clang/=
0009-cmake-Fix-configure-for-packages-using-find_package.patch
similarity index 89%
rename from meta/recipes-devtools/clang/clang/0012-cmake-Fix-configure-fo=
r-packages-using-find_package.patch
rename to meta/recipes-devtools/clang/clang/0009-cmake-Fix-configure-for-=
packages-using-find_package.patch
index 946eb1661f..2a3744f225 100644
--- a/meta/recipes-devtools/clang/clang/0012-cmake-Fix-configure-for-pack=
ages-using-find_package.patch
+++ b/meta/recipes-devtools/clang/clang/0009-cmake-Fix-configure-for-pack=
ages-using-find_package.patch
@@ -1,4 +1,4 @@
-From dc281691e778a61cc14bca4eb187792d2ffb384c Mon Sep 17 00:00:00 2001
+From d373417d4724071c98f95d17c88cc78e9dc1c241 Mon Sep 17 00:00:00 2001
 From: Ovidiu Panait <ovidiu.panait@windriver.com>
 Date: Fri, 31 Jan 2020 10:56:11 +0200
 Subject: [PATCH] cmake: Fix configure for packages using find_package()
@@ -31,7 +31,7 @@ Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.c=
om>
  3 files changed, 2 insertions(+), 15 deletions(-)
=20
 diff --git a/clang/cmake/modules/AddClang.cmake b/clang/cmake/modules/Ad=
dClang.cmake
-index 4059fc3e986c..44d43aa8f25b 100644
+index e2112d7..f51983d 100644
 --- a/clang/cmake/modules/AddClang.cmake
 +++ b/clang/cmake/modules/AddClang.cmake
 @@ -182,7 +182,6 @@ macro(add_clang_tool name)
@@ -51,10 +51,10 @@ index 4059fc3e986c..44d43aa8f25b 100644
    endif()
    set_target_properties(${name} PROPERTIES XCODE_GENERATE_SCHEME ON)
 diff --git a/llvm/cmake/modules/AddLLVM.cmake b/llvm/cmake/modules/AddLL=
VM.cmake
-index d938214f9d0d..4816f2127e14 100644
+index a267166..09ff2af 100644
 --- a/llvm/cmake/modules/AddLLVM.cmake
 +++ b/llvm/cmake/modules/AddLLVM.cmake
-@@ -1485,7 +1485,6 @@ macro(llvm_add_tool project name)
+@@ -1625,7 +1625,6 @@ macro(llvm_add_tool project name)
        if( LLVM_BUILD_TOOLS )
          get_target_export_arg(${name} ${project} export_to_llvmexports)
          install(TARGETS ${name}
@@ -62,7 +62,7 @@ index d938214f9d0d..4816f2127e14 100644
                  RUNTIME DESTINATION ${${project}_TOOLS_INSTALL_DIR}
                  COMPONENT ${name})
          if (LLVM_ENABLE_PDB)
-@@ -1501,10 +1500,8 @@ macro(llvm_add_tool project name)
+@@ -1641,10 +1640,8 @@ macro(llvm_add_tool project name)
          endif()
        endif()
      endif()
@@ -75,7 +75,7 @@ index d938214f9d0d..4816f2127e14 100644
    endif()
    get_subproject_title(subproject_title)
    set_target_properties(${name} PROPERTIES FOLDER "${subproject_title}/=
Tools")
-@@ -1559,7 +1556,6 @@ macro(add_llvm_utility name)
+@@ -1699,7 +1696,6 @@ macro(add_llvm_utility name)
      if (LLVM_INSTALL_UTILS AND LLVM_BUILD_UTILS)
        get_target_export_arg(${name} LLVM export_to_llvmexports)
        install(TARGETS ${name}
@@ -83,7 +83,7 @@ index d938214f9d0d..4816f2127e14 100644
                RUNTIME DESTINATION ${LLVM_UTILS_INSTALL_DIR}
                COMPONENT ${name})
        if (LLVM_ENABLE_PDB)
-@@ -1573,7 +1569,6 @@ macro(add_llvm_utility name)
+@@ -1713,7 +1709,6 @@ macro(add_llvm_utility name)
                                   DEPENDS ${name}
                                   COMPONENT ${name})
        endif()
@@ -92,10 +92,10 @@ index d938214f9d0d..4816f2127e14 100644
        set_property(GLOBAL APPEND PROPERTY LLVM_EXPORTS_BUILDTREE_ONLY $=
{name})
      endif()
 diff --git a/llvm/cmake/modules/TableGen.cmake b/llvm/cmake/modules/Tabl=
eGen.cmake
-index 84c03cd6432e..72da60ce3ca1 100644
+index 397089a..5240962 100644
 --- a/llvm/cmake/modules/TableGen.cmake
 +++ b/llvm/cmake/modules/TableGen.cmake
-@@ -237,12 +237,7 @@ macro(add_tablegen target project)
+@@ -239,12 +239,7 @@ macro(add_tablegen target project)
 =20
    if (ADD_TABLEGEN_DESTINATION AND NOT LLVM_INSTALL_TOOLCHAIN_ONLY AND
        (LLVM_BUILD_UTILS OR ${target} IN_LIST LLVM_DISTRIBUTION_COMPONEN=
TS))
@@ -108,7 +108,7 @@ index 84c03cd6432e..72da60ce3ca1 100644
              COMPONENT ${target}
              RUNTIME DESTINATION "${ADD_TABLEGEN_DESTINATION}")
      if(NOT LLVM_ENABLE_IDE)
-@@ -253,7 +248,6 @@ macro(add_tablegen target project)
+@@ -255,7 +250,6 @@ macro(add_tablegen target project)
    endif()
    if(ADD_TABLEGEN_EXPORT)
      string(TOUPPER ${ADD_TABLEGEN_EXPORT} export_upper)
diff --git a/meta/recipes-devtools/clang/clang/0013-clang-Fix-resource-di=
r-location-for-cross-toolchains.patch b/meta/recipes-devtools/clang/clang=
/0010-clang-Fix-resource-dir-location-for-cross-toolchains.patch
similarity index 95%
rename from meta/recipes-devtools/clang/clang/0013-clang-Fix-resource-dir=
-location-for-cross-toolchains.patch
rename to meta/recipes-devtools/clang/clang/0010-clang-Fix-resource-dir-l=
ocation-for-cross-toolchains.patch
index 72b989c0a2..df6c44bca1 100644
--- a/meta/recipes-devtools/clang/clang/0013-clang-Fix-resource-dir-locat=
ion-for-cross-toolchains.patch
+++ b/meta/recipes-devtools/clang/clang/0010-clang-Fix-resource-dir-locat=
ion-for-cross-toolchains.patch
@@ -1,4 +1,4 @@
-From 248a51bece02c199d0f84d14fa7e2e2379c592a0 Mon Sep 17 00:00:00 2001
+From d03df63cfd772452b5b7c8ddb587f576f054b004 Mon Sep 17 00:00:00 2001
 From: Jim Broadus <jbroadus@xevo.com>
 Date: Thu, 26 Mar 2020 16:05:53 -0700
 Subject: [PATCH] clang: Fix resource dir location for cross toolchains
@@ -21,7 +21,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 8 insertions(+), 1 deletion(-)
=20
 diff --git a/clang/lib/Options/OptionUtils.cpp b/clang/lib/Options/Optio=
nUtils.cpp
-index e5aefa012f67..7c1b657ce2c1 100644
+index 77f8955..62bb694 100644
 --- a/clang/lib/Options/OptionUtils.cpp
 +++ b/clang/lib/Options/OptionUtils.cpp
 @@ -213,6 +213,7 @@ std::string clang::GetResourcesPath(StringRef Binary=
Path) {
diff --git a/meta/recipes-devtools/clang/clang/0014-clang-driver-Add-dyld=
-prefix-when-checking-sysroot-f.patch b/meta/recipes-devtools/clang/clang=
/0011-clang-driver-Add-dyld-prefix-when-checking-sysroot-f.patch
similarity index 88%
rename from meta/recipes-devtools/clang/clang/0014-clang-driver-Add-dyld-=
prefix-when-checking-sysroot-f.patch
rename to meta/recipes-devtools/clang/clang/0011-clang-driver-Add-dyld-pr=
efix-when-checking-sysroot-f.patch
index 725d10a2a7..29d7a6d6bc 100644
--- a/meta/recipes-devtools/clang/clang/0014-clang-driver-Add-dyld-prefix=
-when-checking-sysroot-f.patch
+++ b/meta/recipes-devtools/clang/clang/0011-clang-driver-Add-dyld-prefix=
-when-checking-sysroot-f.patch
@@ -1,8 +1,8 @@
-From b3eea8bcdb792a7b19b879c76eac64f36d1fe012 Mon Sep 17 00:00:00 2001
+From 75e6420bd7f45f1b60a856d51866e22d83cf55b0 Mon Sep 17 00:00:00 2001
 From: Oleksandr Ocheretnyi <oocheret@cisco.com>
 Date: Wed, 15 Apr 2020 00:08:39 +0300
-Subject: [PATCH] clang: driver: Add dyld-prefix when checking sysroot fo=
r ldso
- path
+Subject: [PATCH] clang: driver: Add dyld-prefix when checking sysroot
+ for ldso path
=20
  * the dyld-prefix shall be taken into account when the default
    path for the dynamic linker has to be checked.
@@ -19,10 +19,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 10 insertions(+), 10 deletions(-)
=20
 diff --git a/clang/lib/Driver/ToolChains/Linux.cpp b/clang/lib/Driver/To=
olChains/Linux.cpp
-index f7f096c1ac0a..7b608a84a66e 100644
+index cb2b227..c2ac9b6 100644
 --- a/clang/lib/Driver/ToolChains/Linux.cpp
 +++ b/clang/lib/Driver/ToolChains/Linux.cpp
-@@ -632,8 +632,8 @@ std::string Linux::getDynamicLinker(const ArgList &A=
rgs) const {
+@@ -647,8 +647,8 @@ std::string Linux::getDynamicLinker(const ArgList &A=
rgs) const {
 =20
      Loader =3D HF ? "ld-linux-armhf.so.3" : "ld-linux.so.3";
      LibDir =3D "lib32";
@@ -33,7 +33,7 @@ index f7f096c1ac0a..7b608a84a66e 100644
          LibDir =3D "lib";
      }
      break;
-@@ -689,8 +689,8 @@ std::string Linux::getDynamicLinker(const ArgList &A=
rgs) const {
+@@ -704,8 +704,8 @@ std::string Linux::getDynamicLinker(const ArgList &A=
rgs) const {
      LibDir =3D "lib64";
      Loader =3D
          (tools::ppc::hasPPCAbiArg(Args, "elfv2")) ? "ld64.so.2" : "ld64=
.so.1";
@@ -44,7 +44,7 @@ index f7f096c1ac0a..7b608a84a66e 100644
          LibDir =3D "lib";
      }
      break;
-@@ -698,8 +698,8 @@ std::string Linux::getDynamicLinker(const ArgList &A=
rgs) const {
+@@ -713,8 +713,8 @@ std::string Linux::getDynamicLinker(const ArgList &A=
rgs) const {
      LibDir =3D "lib64";
      Loader =3D
          (tools::ppc::hasPPCAbiArg(Args, "elfv1")) ? "ld64.so.1" : "ld64=
.so.2";
@@ -55,7 +55,7 @@ index f7f096c1ac0a..7b608a84a66e 100644
          LibDir =3D "lib";
      }
      break;
-@@ -719,8 +719,8 @@ std::string Linux::getDynamicLinker(const ArgList &A=
rgs) const {
+@@ -736,8 +736,8 @@ std::string Linux::getDynamicLinker(const ArgList &A=
rgs) const {
    case llvm::Triple::sparcv9:
      LibDir =3D "lib64";
      Loader =3D "ld-linux.so.2";
@@ -66,7 +66,7 @@ index f7f096c1ac0a..7b608a84a66e 100644
          LibDir =3D "lib";
      }
      break;
-@@ -737,8 +737,8 @@ std::string Linux::getDynamicLinker(const ArgList &A=
rgs) const {
+@@ -754,8 +754,8 @@ std::string Linux::getDynamicLinker(const ArgList &A=
rgs) const {
 =20
      LibDir =3D X32 ? "libx32" : "lib64";
      Loader =3D X32 ? "ld-linux-x32.so.2" : "ld-linux-x86-64.so.2";
diff --git a/meta/recipes-devtools/clang/clang/0015-clang-Use-python3-in-=
python-scripts.patch b/meta/recipes-devtools/clang/clang/0012-clang-Use-p=
ython3-in-python-scripts.patch
similarity index 90%
rename from meta/recipes-devtools/clang/clang/0015-clang-Use-python3-in-p=
ython-scripts.patch
rename to meta/recipes-devtools/clang/clang/0012-clang-Use-python3-in-pyt=
hon-scripts.patch
index e29d23cab2..5b0a0b3431 100644
--- a/meta/recipes-devtools/clang/clang/0015-clang-Use-python3-in-python-=
scripts.patch
+++ b/meta/recipes-devtools/clang/clang/0012-clang-Use-python3-in-python-=
scripts.patch
@@ -1,4 +1,4 @@
-From 17e1af5e12a01296d2c032a768569d4d8b06505b Mon Sep 17 00:00:00 2001
+From bc161f33adb168a0a1614d38eb84190c3f690000 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 14 Oct 2020 22:19:57 -0700
 Subject: [PATCH] clang: Use python3 in python scripts
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 2 insertions(+), 2 deletions(-)
=20
 diff --git a/clang-tools-extra/clang-include-fixer/find-all-symbols/tool=
/run-find-all-symbols.py b/clang-tools-extra/clang-include-fixer/find-all=
-symbols/tool/run-find-all-symbols.py
-index 49a1b1493264..6158876d15f7 100755
+index 49a1b14..6158876 100755
 --- a/clang-tools-extra/clang-include-fixer/find-all-symbols/tool/run-fi=
nd-all-symbols.py
 +++ b/clang-tools-extra/clang-include-fixer/find-all-symbols/tool/run-fi=
nd-all-symbols.py
 @@ -1,4 +1,4 @@
@@ -24,7 +24,7 @@ index 49a1b1493264..6158876d15f7 100755
  # =3D- run-find-all-symbols.py - Parallel find-all-symbols runner -*- p=
ython  -*-=3D#
  #
 diff --git a/clang/tools/scan-view/bin/scan-view b/clang/tools/scan-view=
/bin/scan-view
-index d01aebb4029a..f3375804654d 100755
+index d01aebb..f337580 100755
 --- a/clang/tools/scan-view/bin/scan-view
 +++ b/clang/tools/scan-view/bin/scan-view
 @@ -1,4 +1,4 @@
diff --git a/meta/recipes-devtools/clang/clang/0016-llvm-clang-Insert-anc=
hor-for-adding-OE-distro-vendor.patch b/meta/recipes-devtools/clang/clang=
/0013-llvm-clang-Insert-anchor-for-adding-OE-distro-vendor.patch
similarity index 91%
rename from meta/recipes-devtools/clang/clang/0016-llvm-clang-Insert-anch=
or-for-adding-OE-distro-vendor.patch
rename to meta/recipes-devtools/clang/clang/0013-llvm-clang-Insert-anchor=
-for-adding-OE-distro-vendor.patch
index 674a3b264e..aba7488323 100644
--- a/meta/recipes-devtools/clang/clang/0016-llvm-clang-Insert-anchor-for=
-adding-OE-distro-vendor.patch
+++ b/meta/recipes-devtools/clang/clang/0013-llvm-clang-Insert-anchor-for=
-adding-OE-distro-vendor.patch
@@ -1,7 +1,8 @@
-From 259d8eb2ed82c9248387a3cbb1befee358ecbb8e Mon Sep 17 00:00:00 2001
+From 12fbb32963d7aad6c0d5a0ca5fc0f536f1a9b4fe Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 25 Jan 2021 16:14:35 +0800
-Subject: [PATCH] llvm/clang: Insert anchor for adding OE distro vendor n=
ames
+Subject: [PATCH] llvm/clang: Insert anchor for adding OE distro vendor
+ names
 MIME-Version: 1.0
 Content-Type: text/plain; charset=3DUTF-8
 Content-Transfer-Encoding: 8bit
@@ -99,11 +100,11 @@ Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.co=
sta@bootlin.com>
  clang/lib/Driver/Distro.cpp           | 1 +
  clang/lib/Driver/ToolChains/Gnu.cpp   | 1 +
  clang/lib/Driver/ToolChains/Linux.cpp | 2 ++
- llvm/lib/TargetParser/Triple.cpp      | 2 +-
- 5 files changed, 7 insertions(+), 1 deletion(-)
+ llvm/lib/TargetParser/Triple.cpp      | 1 +
+ 5 files changed, 7 insertions(+)
=20
 diff --git a/clang/include/clang/Driver/Distro.h b/clang/include/clang/D=
river/Distro.h
-index 0e17b30eb..b449a62dc 100644
+index aa4b3e1..2d77a2b 100644
 --- a/clang/include/clang/Driver/Distro.h
 +++ b/clang/include/clang/Driver/Distro.h
 @@ -45,6 +45,7 @@ public:
@@ -114,7 +115,7 @@ index 0e17b30eb..b449a62dc 100644
      OpenSUSE,
      UbuntuQuantal,
      UbuntuRaring,
-@@ -132,6 +133,7 @@ public:
+@@ -133,6 +134,7 @@ public:
 =20
    bool IsGentoo() const { return DistroVal =3D=3D Gentoo; }
 =20
@@ -123,7 +124,7 @@ index 0e17b30eb..b449a62dc 100644
  };
 =20
 diff --git a/clang/lib/Driver/Distro.cpp b/clang/lib/Driver/Distro.cpp
-index df10458d0..61dc127a4 100644
+index 585497e..3b58ac7 100644
 --- a/clang/lib/Driver/Distro.cpp
 +++ b/clang/lib/Driver/Distro.cpp
 @@ -43,6 +43,7 @@ static Distro::DistroType DetectOsRelease(llvm::vfs::F=
ileSystem &VFS) {
@@ -135,10 +136,10 @@ index df10458d0..61dc127a4 100644
    return Version;
  }
 diff --git a/clang/lib/Driver/ToolChains/Gnu.cpp b/clang/lib/Driver/Tool=
Chains/Gnu.cpp
-index c80980a7f..80fd8058b 100644
+index f44663f..73ff1f4 100644
 --- a/clang/lib/Driver/ToolChains/Gnu.cpp
 +++ b/clang/lib/Driver/ToolChains/Gnu.cpp
-@@ -2370,6 +2370,7 @@ void Generic_GCC::GCCInstallationDetector::AddDefa=
ultGCCPrefixes(
+@@ -2371,6 +2371,7 @@ void Generic_GCC::GCCInstallationDetector::AddDefa=
ultGCCPrefixes(
        "x86_64-pc-linux-gnu",    "x86_64-redhat-linux6E",
        "x86_64-redhat-linux",    "x86_64-suse-linux",
        "x86_64-manbo-linux-gnu", "x86_64-slackware-linux",
@@ -147,7 +148,7 @@ index c80980a7f..80fd8058b 100644
    static const char *const X32Triples[] =3D {"x86_64-linux-gnux32",
                                             "x86_64-pc-linux-gnux32"};
 diff --git a/clang/lib/Driver/ToolChains/Linux.cpp b/clang/lib/Driver/To=
olChains/Linux.cpp
-index 7b608a84a..585a86a2d 100644
+index c2ac9b6..3231f36 100644
 --- a/clang/lib/Driver/ToolChains/Linux.cpp
 +++ b/clang/lib/Driver/ToolChains/Linux.cpp
 @@ -45,6 +45,7 @@ std::string Linux::getMultiarchTriple(const Driver &D,
@@ -167,18 +168,14 @@ index 7b608a84a..585a86a2d 100644
    case llvm::Triple::aarch64:
      if (IsAndroid)
 diff --git a/llvm/lib/TargetParser/Triple.cpp b/llvm/lib/TargetParser/Tr=
iple.cpp
-index a4f9dd42c..86b74451e 100644
+index 356782c..883e654 100644
 --- a/llvm/lib/TargetParser/Triple.cpp
 +++ b/llvm/lib/TargetParser/Triple.cpp
-@@ -702,7 +702,7 @@ static Triple::VendorType parseVendor(StringRef Vend=
orName) {
-       .Case("suse", Triple::SUSE)
-       .Case("oe", Triple::OpenEmbedded)
-       .Case("intel", Triple::Intel)
--      .Case("meta", Triple::Meta)
-+      .Case("meta", Triple::Meta) //CLANG_EXTRA_OE_VENDORS_CASES
+@@ -741,6 +741,7 @@ static Triple::VendorType parseVendor(StringRef Vend=
orName) {
+ #define TRIPLE_VENDOR(Enum, Name) .Case(Name, Triple::Enum)
+ #define TRIPLE_VENDOR_ALIAS(Enum, AliasName) .Case(AliasName, Triple::E=
num)
+ #include "llvm/TargetParser/TripleName.def"
++      //CLANG_EXTRA_OE_VENDORS_CASES
        .Default(Triple::UnknownVendor);
  }
 =20
---=20
-2.39.5
-
diff --git a/meta/recipes-devtools/clang/clang/0018-clang-Fix-x86-triple-=
for-non-debian-multiarch-linux-.patch b/meta/recipes-devtools/clang/clang=
/0014-clang-Fix-x86-triple-for-non-debian-multiarch-linux-.patch
similarity index 86%
rename from meta/recipes-devtools/clang/clang/0018-clang-Fix-x86-triple-f=
or-non-debian-multiarch-linux-.patch
rename to meta/recipes-devtools/clang/clang/0014-clang-Fix-x86-triple-for=
-non-debian-multiarch-linux-.patch
index 786ff426d3..d54859c338 100644
--- a/meta/recipes-devtools/clang/clang/0018-clang-Fix-x86-triple-for-non=
-debian-multiarch-linux-.patch
+++ b/meta/recipes-devtools/clang/clang/0014-clang-Fix-x86-triple-for-non=
-debian-multiarch-linux-.patch
@@ -1,7 +1,8 @@
-From 6839ba1413cf09eb14a24eeda44fb02c1c6809e1 Mon Sep 17 00:00:00 2001
+From 0a569622e3ebdb2ebd1a2a4f9553161c1bd188d8 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 19 May 2021 17:56:03 -0700
-Subject: [PATCH] clang: Fix x86 triple for non-debian multiarch linux di=
stros
+Subject: [PATCH] clang: Fix x86 triple for non-debian multiarch linux
+ distros
=20
 OpenEmbedded does not hardcode mutli-arch like debian therefore ensure
 that it still uses the proper tuple
@@ -13,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
=20
 diff --git a/clang/lib/Driver/ToolChains/Linux.cpp b/clang/lib/Driver/To=
olChains/Linux.cpp
-index 4a0adedce09a..9fed904c05c2 100644
+index 3231f36..41e0017 100644
 --- a/clang/lib/Driver/ToolChains/Linux.cpp
 +++ b/clang/lib/Driver/ToolChains/Linux.cpp
-@@ -227,8 +227,9 @@ Linux::Linux(const Driver &D, const llvm::Triple &Tr=
iple, const ArgList &Args)
+@@ -228,8 +228,9 @@ Linux::Linux(const Driver &D, const llvm::Triple &Tr=
iple, const ArgList &Args)
      : Generic_ELF(D, Triple, Args) {
    GCCInstallation.TripleToDebianMultiarch =3D [](const llvm::Triple &T)=
 {
      StringRef TripleStr =3D T.str();
diff --git a/meta/recipes-devtools/clang/clang/0019-libunwind-Added-unw_b=
acktrace-method.patch b/meta/recipes-devtools/clang/clang/0015-libunwind-=
Added-unw_backtrace-method.patch
similarity index 89%
rename from meta/recipes-devtools/clang/clang/0019-libunwind-Added-unw_ba=
cktrace-method.patch
rename to meta/recipes-devtools/clang/clang/0015-libunwind-Added-unw_back=
trace-method.patch
index 0b7966ee57..2beff16173 100644
--- a/meta/recipes-devtools/clang/clang/0019-libunwind-Added-unw_backtrac=
e-method.patch
+++ b/meta/recipes-devtools/clang/clang/0015-libunwind-Added-unw_backtrac=
e-method.patch
@@ -1,4 +1,4 @@
-From bf7c0933d65eb811c993ff32fdc6b65f6befc5af Mon Sep 17 00:00:00 2001
+From 1ab2bd0edf76583f0e430da5ef8a53ca4029455f Mon Sep 17 00:00:00 2001
 From: Maksim Kita <maksim-kita@yandex-team.ru>
 Date: Sun, 23 May 2021 10:27:29 +0000
 Subject: [PATCH] libunwind: Added unw_backtrace method
@@ -12,7 +12,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 21 insertions(+)
=20
 diff --git a/libunwind/include/libunwind.h b/libunwind/include/libunwind=
.h
-index 56ca7110274a..60a27f28100b 100644
+index 6c2dfe5..602cafb 100644
 --- a/libunwind/include/libunwind.h
 +++ b/libunwind/include/libunwind.h
 @@ -235,6 +235,7 @@ extern int unw_is_signal_frame(unw_cursor_t *) LIBUN=
WIND_AVAIL;
@@ -24,10 +24,10 @@ index 56ca7110274a..60a27f28100b 100644
  extern unw_addr_space_t unw_local_addr_space;
 =20
 diff --git a/libunwind/src/libunwind.cpp b/libunwind/src/libunwind.cpp
-index 7ffffc2a30c0..ed0b394cb002 100644
+index 0b9d56e..fbfbd48 100644
 --- a/libunwind/src/libunwind.cpp
 +++ b/libunwind/src/libunwind.cpp
-@@ -531,6 +531,26 @@ int __unw_remove_find_dynamic_unwind_sections(
+@@ -527,6 +527,26 @@ int __unw_remove_find_dynamic_unwind_sections(
 =20
  #endif // __APPLE__
 =20
diff --git a/meta/recipes-devtools/clang/clang/0020-lldb-Link-with-libato=
mic-on-x86.patch b/meta/recipes-devtools/clang/clang/0016-lldb-Link-with-=
libatomic-on-x86.patch
similarity index 92%
rename from meta/recipes-devtools/clang/clang/0020-lldb-Link-with-libatom=
ic-on-x86.patch
rename to meta/recipes-devtools/clang/clang/0016-lldb-Link-with-libatomic=
-on-x86.patch
index b9f7270f62..45a71fc2ab 100644
--- a/meta/recipes-devtools/clang/clang/0020-lldb-Link-with-libatomic-on-=
x86.patch
+++ b/meta/recipes-devtools/clang/clang/0016-lldb-Link-with-libatomic-on-=
x86.patch
@@ -1,4 +1,4 @@
-From 94c6e940ddc44922ee505993549477a0fa7ac50d Mon Sep 17 00:00:00 2001
+From 765a550228a57f9bf88ea2c284a5aec01c4c220e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 8 Feb 2022 01:31:26 -0800
 Subject: [PATCH] lldb: Link with libatomic on x86
@@ -17,7 +17,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 4 insertions(+)
=20
 diff --git a/lldb/source/Utility/CMakeLists.txt b/lldb/source/Utility/CM=
akeLists.txt
-index 04f1692e53b3..da0a48d9da54 100644
+index c0d0a42..463c0d7 100644
 --- a/lldb/source/Utility/CMakeLists.txt
 +++ b/lldb/source/Utility/CMakeLists.txt
 @@ -19,6 +19,10 @@ if (CMAKE_SYSTEM_NAME MATCHES "Windows")
diff --git a/meta/recipes-devtools/clang/clang/0017-compiler-rt-Do-not-us=
e-backtrace-APIs-on-non-glibc-l.patch b/meta/recipes-devtools/clang/clang=
/0017-compiler-rt-Do-not-use-backtrace-APIs-on-non-glibc-l.patch
deleted file mode 100644
index 3fa436d526..0000000000
--- a/meta/recipes-devtools/clang/clang/0017-compiler-rt-Do-not-use-backt=
race-APIs-on-non-glibc-l.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From bc8371eb77cca413ccb4ebf8239c597f7be40006 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 19 May 2021 17:32:13 -0700
-Subject: [PATCH] compiler-rt: Do not use backtrace APIs on non-glibc lin=
ux
-
-musl e.g. does not provide backtrace APIs
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- .../lib/gwp_asan/optional/backtrace_linux_libc.cpp  | 13 ++++++++++++-
- 1 file changed, 12 insertions(+), 1 deletion(-)
-
-diff --git a/compiler-rt/lib/gwp_asan/optional/backtrace_linux_libc.cpp =
b/compiler-rt/lib/gwp_asan/optional/backtrace_linux_libc.cpp
-index ea8e72be287d..0344074dd254 100644
---- a/compiler-rt/lib/gwp_asan/optional/backtrace_linux_libc.cpp
-+++ b/compiler-rt/lib/gwp_asan/optional/backtrace_linux_libc.cpp
-@@ -7,7 +7,9 @@
- //=3D=3D=3D------------------------------------------------------------=
----------=3D=3D=3D//
-=20
- #include <assert.h>
-+#ifdef __GLIBC__
- #include <execinfo.h>
-+#endif
- #include <stddef.h>
- #include <stdint.h>
- #include <stdlib.h>
-@@ -21,8 +23,11 @@
- namespace {
- size_t Backtrace(uintptr_t *TraceBuffer, size_t Size) {
-   static_assert(sizeof(uintptr_t) =3D=3D sizeof(void *), "uintptr_t is =
not void*");
--
-+#ifdef __GLIBC__
-   return backtrace(reinterpret_cast<void **>(TraceBuffer), Size);
-+#else
-+  return -1;
-+#endif
- }
-=20
- // We don't need any custom handling for the Segv backtrace - the libc =
unwinder
-@@ -30,7 +35,11 @@ size_t Backtrace(uintptr_t *TraceBuffer, size_t Size)=
 {
- // to avoid the additional frame.
- GWP_ASAN_ALWAYS_INLINE size_t SegvBacktrace(uintptr_t *TraceBuffer, siz=
e_t Size,
-                                             void * /*Context*/) {
-+#ifdef __GLIBC__
-   return Backtrace(TraceBuffer, Size);
-+#else
-+  return -1;
-+#endif
- }
-=20
- static void PrintBacktrace(uintptr_t *Trace, size_t TraceLength,
-@@ -40,6 +49,7 @@ static void PrintBacktrace(uintptr_t *Trace, size_t Tr=
aceLength,
-     return;
-   }
-=20
-+#ifdef __GLIBC__
-   char **BacktraceSymbols =3D
-       backtrace_symbols(reinterpret_cast<void **>(Trace), TraceLength);
-=20
-@@ -53,6 +63,7 @@ static void PrintBacktrace(uintptr_t *Trace, size_t Tr=
aceLength,
-   Printf("\n");
-   if (BacktraceSymbols)
-     free(BacktraceSymbols);
-+#endif
- }
- } // anonymous namespace
-=20
diff --git a/meta/recipes-devtools/clang/clang/0021-compiler-rt-Enable-__=
int128-for-ppc32.patch b/meta/recipes-devtools/clang/clang/0017-compiler-=
rt-Enable-__int128-for-ppc32.patch
similarity index 77%
rename from meta/recipes-devtools/clang/clang/0021-compiler-rt-Enable-__i=
nt128-for-ppc32.patch
rename to meta/recipes-devtools/clang/clang/0017-compiler-rt-Enable-__int=
128-for-ppc32.patch
index 89b492b877..12749e8f96 100644
--- a/meta/recipes-devtools/clang/clang/0021-compiler-rt-Enable-__int128-=
for-ppc32.patch
+++ b/meta/recipes-devtools/clang/clang/0017-compiler-rt-Enable-__int128-=
for-ppc32.patch
@@ -1,4 +1,4 @@
-From 968515d7aa2d7e4af5f318618c307dbe21538650 Mon Sep 17 00:00:00 2001
+From 3a7b96edc836c0264206f01f5fc7e0cd1bc6c70c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 9 Mar 2022 16:28:16 -0800
 Subject: [PATCH] compiler-rt: Enable __int128 for ppc32
@@ -6,15 +6,15 @@ Subject: [PATCH] compiler-rt: Enable __int128 for ppc32
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- compiler-rt/lib/builtins/CMakeLists.txt | 13 ++++++-------
+ compiler-rt/lib/builtins/CMakeLists.txt | 17 ++++++-----------
  compiler-rt/lib/builtins/int_types.h    |  2 +-
- 2 files changed, 7 insertions(+), 8 deletions(-)
+ 2 files changed, 7 insertions(+), 12 deletions(-)
=20
 diff --git a/compiler-rt/lib/builtins/CMakeLists.txt b/compiler-rt/lib/b=
uiltins/CMakeLists.txt
-index c3dbd65998f1..b3a44ea3c3b3 100644
+index e128fea..eb108d7 100644
 --- a/compiler-rt/lib/builtins/CMakeLists.txt
 +++ b/compiler-rt/lib/builtins/CMakeLists.txt
-@@ -813,11 +813,9 @@ set(mips64el_SOURCES ${GENERIC_TF_SOURCES}
+@@ -916,11 +916,9 @@ set(mips64el_SOURCES ${GENERIC_TF_SOURCES}
 =20
  set(nvptx64_SOURCES ${GENERIC_SOURCES})
 =20
@@ -27,7 +27,7 @@ index c3dbd65998f1..b3a44ea3c3b3 100644
    ppc/divtc3.c
    ppc/fixtfdi.c
    ppc/fixunstfdi.c
-@@ -832,14 +830,15 @@ set(powerpc64_SOURCES
+@@ -935,11 +933,11 @@ set(powerpc64_SOURCES
  )
  # These routines require __int128, which isn't supported on AIX.
  if (NOT OS_NAME MATCHES "AIX")
@@ -40,13 +40,23 @@ index c3dbd65998f1..b3a44ea3c3b3 100644
 +    ${powerpc_SOURCES}
    )
  endif()
+ if (OS_NAME MATCHES "AIX")
+@@ -947,12 +945,9 @@ if (OS_NAME MATCHES "AIX")
+     ppc/init_ifuncs.c
+     ${powerpc_SOURCES}
+   )
+-  set(powerpc64_SOURCES
+-    ppc/init_ifuncs.c
+-    ${powerpc64_SOURCES}
+-  )
+ endif()
 -set(powerpc64le_SOURCES ${powerpc64_SOURCES})
 +set(powerpc64le_SOURCES ${powerpc_SOURCES})
 +set(powerpc64_SOURCES ${powerpc_SOURCES})
 =20
  set(riscv_SOURCES
    cpu_model/riscv.c
-@@ -1014,7 +1013,7 @@ else ()
+@@ -1125,7 +1120,7 @@ else ()
 =20
        # For RISCV32 and 32-bit SPARC, we must force enable int128 for c=
ompiling long
        # double routines.
@@ -56,7 +66,7 @@ index c3dbd65998f1..b3a44ea3c3b3 100644
          list(APPEND BUILTIN_CFLAGS_${arch} -fforce-enable-int128)
        endif()
 diff --git a/compiler-rt/lib/builtins/int_types.h b/compiler-rt/lib/buil=
tins/int_types.h
-index 7c7f8cb64aa9..81386f1b99b0 100644
+index 6411507..754f8ce 100644
 --- a/compiler-rt/lib/builtins/int_types.h
 +++ b/compiler-rt/lib/builtins/int_types.h
 @@ -64,7 +64,7 @@ typedef union {
diff --git a/meta/recipes-devtools/clang/clang/0022-llvm-Do-not-use-cmake=
-infra-to-detect-libzstd.patch b/meta/recipes-devtools/clang/clang/0018-l=
lvm-Do-not-use-cmake-infra-to-detect-libzstd.patch
similarity index 91%
rename from meta/recipes-devtools/clang/clang/0022-llvm-Do-not-use-cmake-=
infra-to-detect-libzstd.patch
rename to meta/recipes-devtools/clang/clang/0018-llvm-Do-not-use-cmake-in=
fra-to-detect-libzstd.patch
index cccb1e9885..167cd12431 100644
--- a/meta/recipes-devtools/clang/clang/0022-llvm-Do-not-use-cmake-infra-=
to-detect-libzstd.patch
+++ b/meta/recipes-devtools/clang/clang/0018-llvm-Do-not-use-cmake-infra-=
to-detect-libzstd.patch
@@ -1,4 +1,4 @@
-From 8c5fc285de0051107aa9b7e2e269aa2667fd16f4 Mon Sep 17 00:00:00 2001
+From f610b9f158e13a40f0e86f7a171be493f8ca64fe Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 12 Aug 2022 11:50:57 -0700
 Subject: [PATCH] llvm: Do not use cmake infra to detect libzstd
@@ -21,7 +21,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 4 insertions(+), 4 deletions(-)
=20
 diff --git a/llvm/lib/Support/CMakeLists.txt b/llvm/lib/Support/CMakeLis=
ts.txt
-index 099b0e55579b..8c35b8a31457 100644
+index 1a3fa39..dd11f9a 100644
 --- a/llvm/lib/Support/CMakeLists.txt
 +++ b/llvm/lib/Support/CMakeLists.txt
 @@ -22,7 +22,7 @@ if (HAS_WERROR_GLOBAL_CTORS)
@@ -42,7 +42,7 @@ index 099b0e55579b..8c35b8a31457 100644
  endif()
 =20
  if( WIN32 )
-@@ -351,7 +351,7 @@ if(LLVM_ENABLE_ZLIB)
+@@ -360,7 +360,7 @@ if(LLVM_ENABLE_ZLIB)
      get_property(zlib_library TARGET ZLIB::ZLIB PROPERTY LOCATION)
    endif()
    get_library_name(${zlib_library} zlib_library)
@@ -51,7 +51,7 @@ index 099b0e55579b..8c35b8a31457 100644
  endif()
 =20
  if(LLVM_ENABLE_ZSTD)
-@@ -365,7 +365,7 @@ if(LLVM_ENABLE_ZSTD)
+@@ -374,7 +374,7 @@ if(LLVM_ENABLE_ZSTD)
    endif()
    if (zstd_target STREQUAL zstd::libzstd_shared)
      get_library_name(${zstd_library} zstd_library)
diff --git a/meta/recipes-devtools/clang/clang/0023-compiler-rt-Fix-stat-=
struct-s-size-for-O32-ABI.patch b/meta/recipes-devtools/clang/clang/0019-=
compiler-rt-Fix-stat-struct-s-size-for-O32-ABI.patch
similarity index 91%
rename from meta/recipes-devtools/clang/clang/0023-compiler-rt-Fix-stat-s=
truct-s-size-for-O32-ABI.patch
rename to meta/recipes-devtools/clang/clang/0019-compiler-rt-Fix-stat-str=
uct-s-size-for-O32-ABI.patch
index a498c36b84..021f622894 100644
--- a/meta/recipes-devtools/clang/clang/0023-compiler-rt-Fix-stat-struct-=
s-size-for-O32-ABI.patch
+++ b/meta/recipes-devtools/clang/clang/0019-compiler-rt-Fix-stat-struct-=
s-size-for-O32-ABI.patch
@@ -1,4 +1,4 @@
-From 4a114f5fcd2ab8870b26ba3df4747fc066933f66 Mon Sep 17 00:00:00 2001
+From 6917a5e0eb77c0134b59c3cb942292bc5c38e87f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 3 Jan 2023 18:44:34 -0800
 Subject: [PATCH] compiler-rt: Fix stat struct's size for O32 ABI
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 13 insertions(+)
=20
 diff --git a/compiler-rt/lib/sanitizer_common/sanitizer_platform_limits_=
posix.h b/compiler-rt/lib/sanitizer_common/sanitizer_platform_limits_posi=
x.h
-index 05ebee49f2ab..89c4dcaf3e3d 100644
+index 73eb958..b0dcbde 100644
 --- a/compiler-rt/lib/sanitizer_common/sanitizer_platform_limits_posix.h
 +++ b/compiler-rt/lib/sanitizer_common/sanitizer_platform_limits_posix.h
 @@ -100,6 +100,18 @@ const unsigned struct_kernel_stat64_sz =3D 104;
@@ -36,7 +36,7 @@ index 05ebee49f2ab..89c4dcaf3e3d 100644
  const unsigned struct_kernel_stat_sz =3D SANITIZER_ANDROID
                                             ? FIRST_32_SECOND_64(104, 12=
8)
  #      if defined(_ABIN32) && _MIPS_SIM =3D=3D _ABIN32
-@@ -110,6 +122,7 @@ const unsigned struct_kernel_stat_sz =3D SANITIZER_A=
NDROID
+@@ -116,6 +128,7 @@ const unsigned struct_kernel_stat_sz =3D SANITIZER_A=
NDROID
                                             : FIRST_32_SECOND_64(160, 21=
6);
  #      endif
  const unsigned struct_kernel_stat64_sz =3D 104;
diff --git a/meta/recipes-devtools/clang/clang/0024-ToolChains-Gnu.cpp-AR=
MLibDirs-search-also-in-lib32.patch b/meta/recipes-devtools/clang/clang/0=
020-ToolChains-Gnu.cpp-ARMLibDirs-search-also-in-lib32.patch
similarity index 98%
rename from meta/recipes-devtools/clang/clang/0024-ToolChains-Gnu.cpp-ARM=
LibDirs-search-also-in-lib32.patch
rename to meta/recipes-devtools/clang/clang/0020-ToolChains-Gnu.cpp-ARMLi=
bDirs-search-also-in-lib32.patch
index 09224af386..19784aef10 100644
--- a/meta/recipes-devtools/clang/clang/0024-ToolChains-Gnu.cpp-ARMLibDir=
s-search-also-in-lib32.patch
+++ b/meta/recipes-devtools/clang/clang/0020-ToolChains-Gnu.cpp-ARMLibDir=
s-search-also-in-lib32.patch
@@ -1,4 +1,4 @@
-From 27e4b9755ddd3bec16a851cce0df48e909ae6438 Mon Sep 17 00:00:00 2001
+From 0d7e696f552b1047e89c5114551b6dc902e6f0f1 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Thu, 31 Aug 2023 18:14:47 +0200
 Subject: [PATCH] ToolChains/Gnu.cpp: ARMLibDirs search also in lib32
@@ -55,10 +55,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  2 files changed, 2 insertions(+), 1 deletion(-)
=20
 diff --git a/clang/lib/Driver/ToolChains/Gnu.cpp b/clang/lib/Driver/Tool=
Chains/Gnu.cpp
-index 80fd8058bd98..37cb6cfdf2da 100644
+index 73ff1f4..6a2b362 100644
 --- a/clang/lib/Driver/ToolChains/Gnu.cpp
 +++ b/clang/lib/Driver/ToolChains/Gnu.cpp
-@@ -2346,7 +2346,7 @@ void Generic_GCC::GCCInstallationDetector::AddDefa=
ultGCCPrefixes(
+@@ -2347,7 +2347,7 @@ void Generic_GCC::GCCInstallationDetector::AddDefa=
ultGCCPrefixes(
    static const char *const AArch64beLibDirs[] =3D {"/lib"};
    static const char *const AArch64beTriples[] =3D {"aarch64_be-none-lin=
ux-gnu"};
 =20
@@ -68,10 +68,10 @@ index 80fd8058bd98..37cb6cfdf2da 100644
    static const char *const ARMHFTriples[] =3D {"arm-linux-gnueabihf",
                                               "armv7hl-redhat-linux-gnue=
abi",
 diff --git a/clang/lib/Driver/ToolChains/Linux.cpp b/clang/lib/Driver/To=
olChains/Linux.cpp
-index 9fed904c05c2..5bb66c9faa1f 100644
+index 41e0017..5f8b7fd 100644
 --- a/clang/lib/Driver/ToolChains/Linux.cpp
 +++ b/clang/lib/Driver/ToolChains/Linux.cpp
-@@ -198,6 +198,7 @@ static StringRef getOSLibDir(const llvm::Triple &Tri=
ple, const ArgList &Args) {
+@@ -199,6 +199,7 @@ static StringRef getOSLibDir(const llvm::Triple &Tri=
ple, const ArgList &Args) {
    // reasoning about oslibdir spellings with the lib dir spellings in t=
he
    // GCCInstallationDetector, but that is a more significant refactorin=
g.
    if (Triple.getArch() =3D=3D llvm::Triple::x86 || Triple.isPPC32() ||
diff --git a/meta/recipes-devtools/clang/clang/0025-clang-llvm-Add-OE-spe=
cific-ABI-triple-for-N32-ABI.patch b/meta/recipes-devtools/clang/clang/00=
21-clang-llvm-Add-OE-specific-ABI-triple-for-N32-ABI.patch
similarity index 60%
rename from meta/recipes-devtools/clang/clang/0025-clang-llvm-Add-OE-spec=
ific-ABI-triple-for-N32-ABI.patch
rename to meta/recipes-devtools/clang/clang/0021-clang-llvm-Add-OE-specif=
ic-ABI-triple-for-N32-ABI.patch
index c93a9ec7e0..6577380978 100644
--- a/meta/recipes-devtools/clang/clang/0025-clang-llvm-Add-OE-specific-A=
BI-triple-for-N32-ABI.patch
+++ b/meta/recipes-devtools/clang/clang/0021-clang-llvm-Add-OE-specific-A=
BI-triple-for-N32-ABI.patch
@@ -1,4 +1,4 @@
-From 7023d17f81a472e72a5739e007b9e7148d105137 Mon Sep 17 00:00:00 2001
+From 33988376d79f9eca5f54000cdcc558c8dc3d89ba Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 3 Feb 2024 16:47:10 -0800
 Subject: [PATCH] clang/llvm: Add OE specific ABI triple for N32 ABI
@@ -8,16 +8,17 @@ Its gnun32 when using OE
 Upstream-Status: Inappropriate [OE-Specific]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- clang/lib/Driver/ToolChains/Gnu.cpp   | 1 +
- clang/lib/Driver/ToolChains/Linux.cpp | 4 ++--
- llvm/lib/TargetParser/Triple.cpp      | 4 +++-
- 3 files changed, 6 insertions(+), 3 deletions(-)
+ clang/lib/Driver/ToolChains/Gnu.cpp           | 1 +
+ clang/lib/Driver/ToolChains/Linux.cpp         | 4 ++--
+ llvm/include/llvm/TargetParser/TripleName.def | 2 +-
+ llvm/lib/TargetParser/Triple.cpp              | 2 ++
+ 4 files changed, 6 insertions(+), 3 deletions(-)
=20
 diff --git a/clang/lib/Driver/ToolChains/Gnu.cpp b/clang/lib/Driver/Tool=
Chains/Gnu.cpp
-index 37cb6cfdf2da..bcd7d345c25a 100644
+index 6a2b362..05d1c44 100644
 --- a/clang/lib/Driver/ToolChains/Gnu.cpp
 +++ b/clang/lib/Driver/ToolChains/Gnu.cpp
-@@ -2415,6 +2415,7 @@ void Generic_GCC::GCCInstallationDetector::AddDefa=
ultGCCPrefixes(
+@@ -2416,6 +2416,7 @@ void Generic_GCC::GCCInstallationDetector::AddDefa=
ultGCCPrefixes(
 =20
    static const char *const MIPSN32LibDirs[] =3D {"/lib32"};
    static const char *const MIPSN32Triples[] =3D {"mips64-linux-gnuabin3=
2",
@@ -26,10 +27,10 @@ index 37cb6cfdf2da..bcd7d345c25a 100644
    static const char *const MIPSN32ELLibDirs[] =3D {"/lib32"};
    static const char *const MIPSN32ELTriples[] =3D {
 diff --git a/clang/lib/Driver/ToolChains/Linux.cpp b/clang/lib/Driver/To=
olChains/Linux.cpp
-index 5bb66c9faa1f..c6d6e20dbc4d 100644
+index 5f8b7fd..ac7bd3a 100644
 --- a/clang/lib/Driver/ToolChains/Linux.cpp
 +++ b/clang/lib/Driver/ToolChains/Linux.cpp
-@@ -138,7 +138,7 @@ std::string Linux::getMultiarchTriple(const Driver &=
D,
+@@ -139,7 +139,7 @@ std::string Linux::getMultiarchTriple(const Driver &=
D,
      return IsMipsR6 ? "mipsisa32r6el-linux-gnu" : "mipsel-linux-gnu";
    case llvm::Triple::mips64: {
      std::string MT =3D std::string(IsMipsR6 ? "mipsisa64r6" : "mips64")=
 +
@@ -38,7 +39,7 @@ index 5bb66c9faa1f..c6d6e20dbc4d 100644
      if (D.getVFS().exists(concat(SysRoot, "/lib", MT)))
        return MT;
      if (D.getVFS().exists(concat(SysRoot, "/lib/mips64-linux-gnu")))
-@@ -147,7 +147,7 @@ std::string Linux::getMultiarchTriple(const Driver &=
D,
+@@ -148,7 +148,7 @@ std::string Linux::getMultiarchTriple(const Driver &=
D,
    }
    case llvm::Triple::mips64el: {
      std::string MT =3D std::string(IsMipsR6 ? "mipsisa64r6el" : "mips64=
el") +
@@ -47,28 +48,32 @@ index 5bb66c9faa1f..c6d6e20dbc4d 100644
      if (D.getVFS().exists(concat(SysRoot, "/lib", MT)))
        return MT;
      if (D.getVFS().exists(concat(SysRoot, "/lib/mips64el-linux-gnu")))
+diff --git a/llvm/include/llvm/TargetParser/TripleName.def b/llvm/includ=
e/llvm/TargetParser/TripleName.def
+index bbc03b3..081d8ff 100644
+--- a/llvm/include/llvm/TargetParser/TripleName.def
++++ b/llvm/include/llvm/TargetParser/TripleName.def
+@@ -102,7 +102,7 @@ TRIPLE_OS(H2, "h2")
+=20
+ TRIPLE_ENV(EABIHF, "eabihf")
+ TRIPLE_ENV(EABI, "eabi")
+-TRIPLE_ENV(GNUABIN32, "gnuabin32")
++TRIPLE_ENV(GNUABIN32, "gnun32")
+ TRIPLE_ENV(GNUABI64, "gnuabi64")
+ TRIPLE_ENV(GNUEABIHFT64, "gnueabihft64")
+ TRIPLE_ENV(GNUEABIHF, "gnueabihf")
 diff --git a/llvm/lib/TargetParser/Triple.cpp b/llvm/lib/TargetParser/Tr=
iple.cpp
-index 86b74451ec0d..d94b7d44d11a 100644
+index 883e654..aa2bb35 100644
 --- a/llvm/lib/TargetParser/Triple.cpp
 +++ b/llvm/lib/TargetParser/Triple.cpp
-@@ -358,7 +358,7 @@ StringRef Triple::getEnvironmentTypeName(Environment=
Type Kind) {
-   case GNU: return "gnu";
-   case GNUT64: return "gnut64";
-   case GNUABI64: return "gnuabi64";
--  case GNUABIN32: return "gnuabin32";
-+  case GNUABIN32: return "gnun32";
-   case GNUEABI: return "gnueabi";
-   case GNUEABIT64: return "gnueabit64";
-   case GNUEABIHF: return "gnueabihf";
-@@ -762,6 +762,7 @@ static Triple::EnvironmentType parseEnvironment(Stri=
ngRef EnvironmentName) {
-       .StartsWith("eabihf", Triple::EABIHF)
-       .StartsWith("eabi", Triple::EABI)
-       .StartsWith("gnuabin32", Triple::GNUABIN32)
-+      .StartsWith("gnun32", Triple::GNUABIN32)
-       .StartsWith("gnuabi64", Triple::GNUABI64)
-       .StartsWith("gnueabihft64", Triple::GNUEABIHFT64)
-       .StartsWith("gnueabihf", Triple::GNUEABIHF)
-@@ -1087,6 +1088,7 @@ Triple::Triple(std::string &&Str) : Data(std::move=
(Str)) {
+@@ -755,6 +755,7 @@ static Triple::OSType parseOS(StringRef OSName) {
+=20
+ static Triple::EnvironmentType parseEnvironment(StringRef EnvironmentNa=
me) {
+   return StringSwitch<Triple::EnvironmentType>(EnvironmentName)
++      .StartsWith("gnuabin32", Triple::GNUABIN32)
+ #define TRIPLE_ENV(Enum, Name) .StartsWith(Name, Triple::Enum)
+ #include "llvm/TargetParser/TripleName.def"
+       .Default(Triple::UnknownEnvironment);
+@@ -1106,6 +1107,7 @@ Triple::Triple(std::string &&Str) : Data(std::move=
(Str)) {
        Environment =3D
            StringSwitch<Triple::EnvironmentType>(Components[0])
                .StartsWith("mipsn32", Triple::GNUABIN32)
diff --git a/meta/recipes-devtools/clang/clang/0026-llvm-Add-libunwind.pc=
.in-and-llvm-config-scripts.patch b/meta/recipes-devtools/clang/clang/002=
2-llvm-Add-libunwind.pc.in-and-llvm-config-scripts.patch
similarity index 84%
rename from meta/recipes-devtools/clang/clang/0026-llvm-Add-libunwind.pc.=
in-and-llvm-config-scripts.patch
rename to meta/recipes-devtools/clang/clang/0022-llvm-Add-libunwind.pc.in=
-and-llvm-config-scripts.patch
index 72ffdc6c1f..34ba534074 100644
--- a/meta/recipes-devtools/clang/clang/0026-llvm-Add-libunwind.pc.in-and=
-llvm-config-scripts.patch
+++ b/meta/recipes-devtools/clang/clang/0022-llvm-Add-libunwind.pc.in-and=
-llvm-config-scripts.patch
@@ -1,4 +1,4 @@
-From 17a1a4919c0ff554fc30bbb85a63b9d2a1164324 Mon Sep 17 00:00:00 2001
+From 9ec97845821ead65ebd8ab26b69d949e10b65338 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 14 May 2024 22:04:43 -0700
 Subject: [PATCH] llvm: Add libunwind.pc.in and llvm-config scripts
@@ -10,15 +10,15 @@ Upstream-Status: Inappropriate [ OE-Specific ]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
 ---
- libunwind/libunwind.pc.in          |  9 ++++++
- llvm/tools/llvm-config/llvm-config | 52 ++++++++++++++++++++++++++++++
- 2 files changed, 61 insertions(+)
+ libunwind/libunwind.pc.in          |  9 +++++++++
+ llvm/tools/llvm-config/llvm-config | 15 +++++++++++++++
+ 2 files changed, 24 insertions(+)
  create mode 100644 libunwind/libunwind.pc.in
  create mode 100644 llvm/tools/llvm-config/llvm-config
=20
 diff --git a/libunwind/libunwind.pc.in b/libunwind/libunwind.pc.in
 new file mode 100644
-index 000000000000..a93d676604f9
+index 0000000..a93d676
 --- /dev/null
 +++ b/libunwind/libunwind.pc.in
 @@ -0,0 +1,9 @@
@@ -33,7 +33,7 @@ index 000000000000..a93d676604f9
 +Libs: -lunwind
 diff --git a/llvm/tools/llvm-config/llvm-config b/llvm/tools/llvm-config=
/llvm-config
 new file mode 100644
-index 000000000000..6a0dd54b8eab
+index 0000000..0578773
 --- /dev/null
 +++ b/llvm/tools/llvm-config/llvm-config
 @@ -0,0 +1,15 @@
diff --git a/meta/recipes-devtools/clang/clang/0027-scan-build-py-respect=
-LLVM_LIBDIR_SUFFIX-like-other-.patch b/meta/recipes-devtools/clang/clang=
/0023-scan-build-py-respect-LLVM_LIBDIR_SUFFIX-like-other-.patch
similarity index 90%
rename from meta/recipes-devtools/clang/clang/0027-scan-build-py-respect-=
LLVM_LIBDIR_SUFFIX-like-other-.patch
rename to meta/recipes-devtools/clang/clang/0023-scan-build-py-respect-LL=
VM_LIBDIR_SUFFIX-like-other-.patch
index 934d5adc50..55ad603b7c 100644
--- a/meta/recipes-devtools/clang/clang/0027-scan-build-py-respect-LLVM_L=
IBDIR_SUFFIX-like-other-.patch
+++ b/meta/recipes-devtools/clang/clang/0023-scan-build-py-respect-LLVM_L=
IBDIR_SUFFIX-like-other-.patch
@@ -1,7 +1,8 @@
-From a2171be64a181e0b263fc8ec31a760193651203c Mon Sep 17 00:00:00 2001
+From b9565c7e6525f3ca20df3171c36698b521a45594 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <martin.jansa@gmail.com>
 Date: Fri, 13 Sep 2024 13:38:08 +0200
-Subject: [PATCH] scan-build-py: respect LLVM_LIBDIR_SUFFIX like other to=
ols do
+Subject: [PATCH] scan-build-py: respect LLVM_LIBDIR_SUFFIX like other
+ tools do
=20
 * other libraries are installed in 'lib64' or 'lib32' based on
   LLVM_LIBDIR_SUFFIX value, but libscanbuild files were always
@@ -11,13 +12,13 @@ Upstream-Status: Submitted [https://github.com/llvm/l=
lvm-project/pull/108549]
=20
 Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
 ---
- clang/tools/scan-build-py/CMakeLists.txt | 26 ++++++++++++------------
- 1 file changed, 13 insertions(+), 13 deletions(-)
+ clang/tools/scan-build-py/CMakeLists.txt | 32 ++++++++++++------------
+ 1 file changed, 16 insertions(+), 16 deletions(-)
=20
-Index: llvm-project-22.1.2.src/clang/tools/scan-build-py/CMakeLists.txt
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- llvm-project-22.1.2.src.orig/clang/tools/scan-build-py/CMakeLists.tx=
t
-+++ llvm-project-22.1.2.src/clang/tools/scan-build-py/CMakeLists.txt
+diff --git a/clang/tools/scan-build-py/CMakeLists.txt b/clang/tools/scan=
-build-py/CMakeLists.txt
+index 84087a9..9647642 100644
+--- a/clang/tools/scan-build-py/CMakeLists.txt
++++ b/clang/tools/scan-build-py/CMakeLists.txt
 @@ -80,52 +80,52 @@ if(CLANG_INSTALL_SCANBUILDPY)
    endforeach()
 =20
diff --git a/meta/recipes-devtools/clang/clang/0028-compiler-rt-Do-not-pa=
ss-target-to-clang-compiler.patch b/meta/recipes-devtools/clang/clang/002=
4-compiler-rt-Do-not-pass-target-to-clang-compiler.patch
similarity index 91%
rename from meta/recipes-devtools/clang/clang/0028-compiler-rt-Do-not-pas=
s-target-to-clang-compiler.patch
rename to meta/recipes-devtools/clang/clang/0024-compiler-rt-Do-not-pass-=
target-to-clang-compiler.patch
index fe24fe051b..b3fb642742 100644
--- a/meta/recipes-devtools/clang/clang/0028-compiler-rt-Do-not-pass-targ=
et-to-clang-compiler.patch
+++ b/meta/recipes-devtools/clang/clang/0024-compiler-rt-Do-not-pass-targ=
et-to-clang-compiler.patch
@@ -1,4 +1,4 @@
-From 6b1f360c66b60c4bb639057590a8b2162d3bcf6b Mon Sep 17 00:00:00 2001
+From f68925e7c31fa4bdd684a4ab44fd1350bb43205b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 13 Mar 2025 00:30:38 -0700
 Subject: [PATCH] compiler-rt: Do not pass --target to clang compiler
@@ -13,7 +13,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 4 deletions(-)
=20
 diff --git a/compiler-rt/lib/fuzzer/CMakeLists.txt b/compiler-rt/lib/fuz=
zer/CMakeLists.txt
-index a57e2fe46245..2928ed2ab6d5 100644
+index 2da488d..9af4410 100644
 --- a/compiler-rt/lib/fuzzer/CMakeLists.txt
 +++ b/compiler-rt/lib/fuzzer/CMakeLists.txt
 @@ -140,10 +140,6 @@ if(OS_NAME MATCHES "Android|Linux|Fuchsia" AND
diff --git a/meta/recipes-devtools/clang/clang/0029-AsmMatcherEmitter-sor=
t-ClassInfo-lists-by-name-as-we.patch b/meta/recipes-devtools/clang/clang=
/0025-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
similarity index 92%
rename from meta/recipes-devtools/clang/clang/0029-AsmMatcherEmitter-sort=
-ClassInfo-lists-by-name-as-we.patch
rename to meta/recipes-devtools/clang/clang/0025-AsmMatcherEmitter-sort-C=
lassInfo-lists-by-name-as-we.patch
index 413bc3f275..28d0567e15 100644
--- a/meta/recipes-devtools/clang/clang/0029-AsmMatcherEmitter-sort-Class=
Info-lists-by-name-as-we.patch
+++ b/meta/recipes-devtools/clang/clang/0025-AsmMatcherEmitter-sort-Class=
Info-lists-by-name-as-we.patch
@@ -1,4 +1,4 @@
-From 281cd05306cbfa5744e4a1f3ebf5c745324efe7a Mon Sep 17 00:00:00 2001
+From bf8a65efcdce65143081785b9ed8759d60be1bd4 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 27 Nov 2020 10:11:08 +0000
 Subject: [PATCH] AsmMatcherEmitter: sort ClassInfo lists by name as well
@@ -14,7 +14,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.co=
m>
  1 file changed, 4 insertions(+), 1 deletion(-)
=20
 diff --git a/llvm/utils/TableGen/AsmMatcherEmitter.cpp b/llvm/utils/Tabl=
eGen/AsmMatcherEmitter.cpp
-index e6085af5aa91..b0180638c754 100644
+index 4af5c85..917aeec 100644
 --- a/llvm/utils/TableGen/AsmMatcherEmitter.cpp
 +++ b/llvm/utils/TableGen/AsmMatcherEmitter.cpp
 @@ -384,7 +384,10 @@ public:
diff --git a/meta/recipes-devtools/clang/clang/0030-llvm-config-remove-LL=
VM_LDFLAGS-from-ldflags-output.patch b/meta/recipes-devtools/clang/clang/=
0026-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch
similarity index 92%
rename from meta/recipes-devtools/clang/clang/0030-llvm-config-remove-LLV=
M_LDFLAGS-from-ldflags-output.patch
rename to meta/recipes-devtools/clang/clang/0026-llvm-config-remove-LLVM_=
LDFLAGS-from-ldflags-output.patch
index e059748873..7724af8009 100644
--- a/meta/recipes-devtools/clang/clang/0030-llvm-config-remove-LLVM_LDFL=
AGS-from-ldflags-output.patch
+++ b/meta/recipes-devtools/clang/clang/0026-llvm-config-remove-LLVM_LDFL=
AGS-from-ldflags-output.patch
@@ -1,4 +1,4 @@
-From cbc2595eed96fa7de77162e4c7b99681579d01ef Mon Sep 17 00:00:00 2001
+From f58186cc6ba2fff4d2e9fb624a904b1c5a4f7733 Mon Sep 17 00:00:00 2001
 From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
 Date: Wed, 2 Apr 2025 17:05:17 +0300
 Subject: [PATCH] llvm-config: remove LLVM_LDFLAGS from --ldflags output
@@ -18,7 +18,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/llvm/tools/llvm-config/llvm-config.cpp b/llvm/tools/llvm-co=
nfig/llvm-config.cpp
-index 0a3f51ae2b83..5c95a1f3ff24 100644
+index 64795e9..3e57005 100644
 --- a/llvm/tools/llvm-config/llvm-config.cpp
 +++ b/llvm/tools/llvm-config/llvm-config.cpp
 @@ -576,7 +576,7 @@ int main(int argc, char **argv) {
diff --git a/meta/recipes-devtools/clang/clang/0031-compiler-rt-Exclude-s=
ync_fetch_and_-for-any-pre-ARMv.patch b/meta/recipes-devtools/clang/clang=
/0027-compiler-rt-Exclude-sync_fetch_and_-for-any-pre-ARMv.patch
similarity index 95%
rename from meta/recipes-devtools/clang/clang/0031-compiler-rt-Exclude-sy=
nc_fetch_and_-for-any-pre-ARMv.patch
rename to meta/recipes-devtools/clang/clang/0027-compiler-rt-Exclude-sync=
_fetch_and_-for-any-pre-ARMv.patch
index 52bdeaf9d5..a1847f99f9 100644
--- a/meta/recipes-devtools/clang/clang/0031-compiler-rt-Exclude-sync_fet=
ch_and_-for-any-pre-ARMv.patch
+++ b/meta/recipes-devtools/clang/clang/0027-compiler-rt-Exclude-sync_fet=
ch_and_-for-any-pre-ARMv.patch
@@ -1,4 +1,4 @@
-From 3a486a17b697c65cdc7d2c17d9e14f2bfc2be911 Mon Sep 17 00:00:00 2001
+From 9046478db7833765487e66d5a3706b7cb67f1ee2 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 10 May 2025 14:03:12 -0700
 Subject: [PATCH] compiler-rt: Exclude sync_fetch_and_* for any pre-ARMv6
@@ -40,10 +40,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 12 insertions(+)
=20
 diff --git a/compiler-rt/lib/builtins/CMakeLists.txt b/compiler-rt/lib/b=
uiltins/CMakeLists.txt
-index b3a44ea3c3b3..4a328ab0ca26 100644
+index eb108d7..4041119 100644
 --- a/compiler-rt/lib/builtins/CMakeLists.txt
 +++ b/compiler-rt/lib/builtins/CMakeLists.txt
-@@ -975,6 +975,18 @@ else ()
+@@ -1082,6 +1082,18 @@ else ()
          ${TARGET_${arch}_CFLAGS})
        list(JOIN CMAKE_REQUIRED_FLAGS " " CMAKE_REQUIRED_FLAGS)
        message(STATUS "Performing additional configure checks with targe=
t flags: ${CMAKE_REQUIRED_FLAGS}")
diff --git a/meta/recipes-devtools/clang/clang/0032-compiler-rt-Hardcode-=
uptr-sptr-typedefs-on-Mips-Linu.patch b/meta/recipes-devtools/clang/clang=
/0028-Hardcode-uptr-sptr-typedefs-on-Mips-Linux.patch
similarity index 86%
rename from meta/recipes-devtools/clang/clang/0032-compiler-rt-Hardcode-u=
ptr-sptr-typedefs-on-Mips-Linu.patch
rename to meta/recipes-devtools/clang/clang/0028-Hardcode-uptr-sptr-typed=
efs-on-Mips-Linux.patch
index b0aae5457a..d3a9a6c308 100644
--- a/meta/recipes-devtools/clang/clang/0032-compiler-rt-Hardcode-uptr-sp=
tr-typedefs-on-Mips-Linu.patch
+++ b/meta/recipes-devtools/clang/clang/0028-Hardcode-uptr-sptr-typedefs-=
on-Mips-Linux.patch
@@ -1,7 +1,7 @@
-From b71c398a1b10b29886c2db2a920f476fec6f7de2 Mon Sep 17 00:00:00 2001
+From aab77dfb9c2e1a118ffb5bd690f34bf93b6f3f36 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 22 May 2025 21:50:45 -0700
-Subject: [PATCH] [compiler-rt] Hardcode uptr/sptr typedefs on Mips/Linux
+Subject: [PATCH] Hardcode uptr/sptr typedefs on Mips/Linux
=20
 Sanitizer build on Mips/Linux faills to build due to assertion errors
 mismatched definitions. This is due to inconsistent definitions of
@@ -21,10 +21,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/compiler-rt/lib/sanitizer_common/sanitizer_internal_defs.h =
b/compiler-rt/lib/sanitizer_common/sanitizer_internal_defs.h
-index c719e2a8ef60..60b997e653c4 100644
+index c694897..08f6d35 100644
 --- a/compiler-rt/lib/sanitizer_common/sanitizer_internal_defs.h
 +++ b/compiler-rt/lib/sanitizer_common/sanitizer_internal_defs.h
-@@ -139,7 +139,7 @@
+@@ -143,7 +143,7 @@
  namespace __sanitizer {
 =20
  #if defined(__UINTPTR_TYPE__)
diff --git a/meta/recipes-devtools/clang/clang/0034-Revert-libc-Remap-hea=
ders-in-the-debug-info-when-bui.patch b/meta/recipes-devtools/clang/clang=
/0029-Revert-libc-Remap-headers-in-the-debug-info-when-bui.patch
similarity index 89%
rename from meta/recipes-devtools/clang/clang/0034-Revert-libc-Remap-head=
ers-in-the-debug-info-when-bui.patch
rename to meta/recipes-devtools/clang/clang/0029-Revert-libc-Remap-header=
s-in-the-debug-info-when-bui.patch
index 57003dcf56..faae71645a 100644
--- a/meta/recipes-devtools/clang/clang/0034-Revert-libc-Remap-headers-in=
-the-debug-info-when-bui.patch
+++ b/meta/recipes-devtools/clang/clang/0029-Revert-libc-Remap-headers-in=
-the-debug-info-when-bui.patch
@@ -1,4 +1,4 @@
-From 9ace97c0c2df52d823c9d5345cca0251bf2ccf16 Mon Sep 17 00:00:00 2001
+From cffcea54bf4605d958407edb233fffdbe730f4af Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 27 Jul 2025 19:12:13 -0700
 Subject: [PATCH] Revert "[libc++] Remap headers in the debug info when
@@ -19,10 +19,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 5 deletions(-)
=20
 diff --git a/libcxx/include/CMakeLists.txt b/libcxx/include/CMakeLists.t=
xt
-index 787cfffa5019..d73bcd852a1e 100644
+index b40f586..7bd7622 100644
 --- a/libcxx/include/CMakeLists.txt
 +++ b/libcxx/include/CMakeLists.txt
-@@ -1718,11 +1718,6 @@ add_dependencies(cxx-headers generate-cxx-headers=
)
+@@ -1728,11 +1728,6 @@ add_dependencies(cxx-headers generate-cxx-headers=
)
  target_include_directories(cxx-headers INTERFACE ${LIBCXX_GENERATED_INC=
LUDE_TARGET_DIR}
                                                   ${LIBCXX_GENERATED_INC=
LUDE_DIR})
 =20
diff --git a/meta/recipes-devtools/clang/clang/0036-Don-t-expose-LLVM_HAV=
E_OPT_VIEWER_MODULES-externally.patch b/meta/recipes-devtools/clang/clang=
/0030-Don-t-expose-LLVM_HAVE_OPT_VIEWER_MODULES-externally.patch
similarity index 86%
rename from meta/recipes-devtools/clang/clang/0036-Don-t-expose-LLVM_HAVE=
_OPT_VIEWER_MODULES-externally.patch
rename to meta/recipes-devtools/clang/clang/0030-Don-t-expose-LLVM_HAVE_O=
PT_VIEWER_MODULES-externally.patch
index 0cdb2ad668..af9564053c 100644
--- a/meta/recipes-devtools/clang/clang/0036-Don-t-expose-LLVM_HAVE_OPT_V=
IEWER_MODULES-externally.patch
+++ b/meta/recipes-devtools/clang/clang/0030-Don-t-expose-LLVM_HAVE_OPT_V=
IEWER_MODULES-externally.patch
@@ -1,4 +1,4 @@
-From 53da129f7986c5bd310f4f4a8236987df7e073c6 Mon Sep 17 00:00:00 2001
+From b6a9ddd0ba2d8bd14871c135157f3878a9d629c1 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Mon, 29 Sep 2025 14:44:05 +0100
 Subject: [PATCH] Don't expose LLVM_HAVE_OPT_VIEWER_MODULES externally
@@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 deletion(-)
=20
 diff --git a/llvm/cmake/modules/LLVMConfig.cmake.in b/llvm/cmake/modules=
/LLVMConfig.cmake.in
-index 70c807abea98..5603c9215332 100644
+index 6f5fcc6..ce07563 100644
 --- a/llvm/cmake/modules/LLVMConfig.cmake.in
 +++ b/llvm/cmake/modules/LLVMConfig.cmake.in
-@@ -137,7 +137,6 @@ set(LLVM_DEFINITIONS "@LLVM_DEFINITIONS@")
+@@ -145,7 +145,6 @@ set(LLVM_DEFINITIONS "@LLVM_DEFINITIONS@")
  set(LLVM_BINARY_DIR "@LLVM_CONFIG_BINARY_DIR@")
  set(LLVM_CMAKE_DIR "@LLVM_CONFIG_CMAKE_DIR@")
  set(LLVM_TOOLS_BINARY_DIR "@LLVM_CONFIG_TOOLS_BINARY_DIR@")
diff --git a/meta/recipes-devtools/clang/clang/0037-clang-Only-build-clan=
g-tblgen-if-it-is-actually-need.patch b/meta/recipes-devtools/clang/clang=
/0031-Only-build-clang-tblgen-if-it-is-actually-needed.patch
similarity index 81%
rename from meta/recipes-devtools/clang/clang/0037-clang-Only-build-clang=
-tblgen-if-it-is-actually-need.patch
rename to meta/recipes-devtools/clang/clang/0031-Only-build-clang-tblgen-=
if-it-is-actually-needed.patch
index 5efe043eaf..690791c5e3 100644
--- a/meta/recipes-devtools/clang/clang/0037-clang-Only-build-clang-tblge=
n-if-it-is-actually-need.patch
+++ b/meta/recipes-devtools/clang/clang/0031-Only-build-clang-tblgen-if-i=
t-is-actually-needed.patch
@@ -1,7 +1,7 @@
-From de58b9bbc8c52299ff22c4f0ab21e3878d411669 Mon Sep 17 00:00:00 2001
+From a55e7674203ffcb42e4e3ee4c8cf7aa964aee086 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Sat, 11 Oct 2025 16:01:50 -0700
-Subject: [PATCH] [clang] Only build clang-tblgen if it is actually neede=
d
+Subject: [PATCH] Only build clang-tblgen if it is actually needed
=20
 It's possible to build clang with an existing clang-tblgen (common when
 cross-compiling, for instance) by setting CLANG_TABLEGEN_EXE.  If this
@@ -16,10 +16,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 3 insertions(+), 1 deletion(-)
=20
 diff --git a/clang/CMakeLists.txt b/clang/CMakeLists.txt
-index e4cb1a359620..b650b3b986f4 100644
+index 89f584c..bd7ebc3 100644
 --- a/clang/CMakeLists.txt
 +++ b/clang/CMakeLists.txt
-@@ -479,7 +479,9 @@ option(CLANG_ENABLE_HLSL "Include HLSL build product=
s" Off)
+@@ -531,7 +531,9 @@ option(CLANG_ENABLE_HLSL "Include HLSL build product=
s" Off)
  # While HLSL support is experimental this should stay hidden.
  mark_as_advanced(CLANG_ENABLE_HLSL)
 =20
diff --git a/meta/recipes-devtools/clang/clang/0038-llvm-libgcc-Fix-symli=
nk-path-for-libcc-when-LLVM_ENA.patch b/meta/recipes-devtools/clang/clang=
/0032-llvm-libgcc-Fix-symlink-path-for-libcc-when-LLVM_ENA.patch
similarity index 93%
rename from meta/recipes-devtools/clang/clang/0038-llvm-libgcc-Fix-symlin=
k-path-for-libcc-when-LLVM_ENA.patch
rename to meta/recipes-devtools/clang/clang/0032-llvm-libgcc-Fix-symlink-=
path-for-libcc-when-LLVM_ENA.patch
index 583e91e497..6081f2d7b4 100644
--- a/meta/recipes-devtools/clang/clang/0038-llvm-libgcc-Fix-symlink-path=
-for-libcc-when-LLVM_ENA.patch
+++ b/meta/recipes-devtools/clang/clang/0032-llvm-libgcc-Fix-symlink-path=
-for-libcc-when-LLVM_ENA.patch
@@ -1,4 +1,4 @@
-From bca77d818187e68989dfa9e386b38632b76a477e Mon Sep 17 00:00:00 2001
+From b383508d002bb41ac979ab356f73fcf0ae97ca00 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 28 Oct 2025 15:44:49 -0700
 Subject: [PATCH] llvm-libgcc: Fix symlink path for libcc when
@@ -33,10 +33,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 13 insertions(+), 3 deletions(-)
=20
 diff --git a/llvm-libgcc/CMakeLists.txt b/llvm-libgcc/CMakeLists.txt
-index 47208fc19869..54009c1104c3 100644
+index a297447..1ae9167 100644
 --- a/llvm-libgcc/CMakeLists.txt
 +++ b/llvm-libgcc/CMakeLists.txt
-@@ -124,11 +124,21 @@ target_link_libraries(unwind_shared PUBLIC
+@@ -133,11 +133,21 @@ target_link_libraries(unwind_shared PUBLIC
  #=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
 =20
  get_compiler_rt_install_dir(${COMPILER_RT_DEFAULT_TARGET_ARCH} install_=
dir_builtins)
@@ -60,7 +60,7 @@ index 47208fc19869..54009c1104c3 100644
    string(PREPEND install_dir_builtins "../")
  endif()
  set(LLVM_LIBGCC_COMPILER_RT ${install_dir_builtins}/libclang_rt.builtin=
s${builtins_suffix}.a)
-@@ -137,7 +147,7 @@ add_custom_target(llvm-libgcc ALL
+@@ -146,7 +156,7 @@ add_custom_target(llvm-libgcc ALL
    DEPENDS unwind_shared unwind_static clang_rt.builtins-${COMPILER_RT_D=
EFAULT_TARGET_ARCH}
    COMMAND ${CMAKE_COMMAND} -E create_symlink ${LLVM_LIBGCC_COMPILER_RT}=
 libgcc.a
    COMMAND ${CMAKE_COMMAND} -E create_symlink libunwind.a libgcc_eh.a
diff --git a/meta/recipes-devtools/clang/clang/0041-Consolidate-and-fix-s=
ysroot-based-compiler-rt-search.patch b/meta/recipes-devtools/clang/clang=
/0033-Consolidate-and-fix-sysroot-based-compiler-rt-search.patch
similarity index 91%
rename from meta/recipes-devtools/clang/clang/0041-Consolidate-and-fix-sy=
sroot-based-compiler-rt-search.patch
rename to meta/recipes-devtools/clang/clang/0033-Consolidate-and-fix-sysr=
oot-based-compiler-rt-search.patch
index a2a7fa80f1..ecaaa738a7 100644
--- a/meta/recipes-devtools/clang/clang/0041-Consolidate-and-fix-sysroot-=
based-compiler-rt-search.patch
+++ b/meta/recipes-devtools/clang/clang/0033-Consolidate-and-fix-sysroot-=
based-compiler-rt-search.patch
@@ -1,7 +1,8 @@
-From b818a92ac171e80e39ad9e99d1f862d23f2bb5b3 Mon Sep 17 00:00:00 2001
+From 7da49a0e48fa77d38548f8f1dedc7cb1bb8dce53 Mon Sep 17 00:00:00 2001
 From: "mark.yang" <mark.yang@lge.com>
 Date: Tue, 14 Apr 2026 16:17:01 +0900
-Subject: [PATCH] Consolidate and fix sysroot-based compiler-rt search pa=
ths
+Subject: [PATCH] Consolidate and fix sysroot-based compiler-rt search
+ paths
=20
 Consolidate patches 0008 and 0033 into a single patch with a fix for
 native builds.
@@ -41,10 +42,10 @@ Signed-off-by: mark.yang <mark.yang@lge.com>
  1 file changed, 28 insertions(+), 3 deletions(-)
=20
 diff --git a/clang/lib/Driver/ToolChain.cpp b/clang/lib/Driver/ToolChain=
.cpp
-index 77a2c73f0..ac28b51c4 100644
+index f894a06..eceada5 100644
 --- a/clang/lib/Driver/ToolChain.cpp
 +++ b/clang/lib/Driver/ToolChain.cpp
-@@ -15,6 +15,7 @@
+@@ -16,6 +16,7 @@
  #include "ToolChains/InterfaceStubs.h"
  #include "clang/Basic/ObjCRuntime.h"
  #include "clang/Basic/Sanitizers.h"
@@ -52,7 +53,7 @@ index 77a2c73f0..ac28b51c4 100644
  #include "clang/Config/config.h"
  #include "clang/Driver/Action.h"
  #include "clang/Driver/CommonArgs.h"
-@@ -723,7 +724,15 @@ StringRef ToolChain::getOSLibName() const {
+@@ -872,7 +873,15 @@ StringRef ToolChain::getOSLibName() const {
  }
 =20
  std::string ToolChain::getCompilerRTPath() const {
@@ -69,7 +70,7 @@ index 77a2c73f0..ac28b51c4 100644
    if (isBareMetal()) {
      llvm::sys::path::append(Path, "lib", getOSLibName());
      if (!SelectedMultilibs.empty()) {
-@@ -1021,7 +1030,15 @@ ToolChain::getTargetSubDirPath(StringRef BaseDir)=
 const {
+@@ -1179,7 +1188,15 @@ std::optional<std::string> ToolChain::getDefaultI=
ntrinsicModuleDir() const {
  }
 =20
  std::optional<std::string> ToolChain::getRuntimePath() const {
@@ -86,7 +87,7 @@ index 77a2c73f0..ac28b51c4 100644
    llvm::sys::path::append(P, "lib");
    if (auto Ret =3D getTargetSubDirPath(P))
      return Ret;
-@@ -1049,7 +1066,15 @@ ToolChain::path_list ToolChain::getArchSpecificLi=
bPaths() const {
+@@ -1207,7 +1224,15 @@ ToolChain::path_list ToolChain::getArchSpecificLi=
bPaths() const {
    path_list Paths;
 =20
    auto AddPath =3D [&](const ArrayRef<StringRef> &SS) {
diff --git a/meta/recipes-devtools/clang/clang/0042-guard-clang-tools-ext=
ra-test.patch b/meta/recipes-devtools/clang/clang/0034-guard-clang-tools-=
extra-test.patch
similarity index 83%
rename from meta/recipes-devtools/clang/clang/0042-guard-clang-tools-extr=
a-test.patch
rename to meta/recipes-devtools/clang/clang/0034-guard-clang-tools-extra-=
test.patch
index 9b4e29ff64..5e53d43944 100644
--- a/meta/recipes-devtools/clang/clang/0042-guard-clang-tools-extra-test=
.patch
+++ b/meta/recipes-devtools/clang/clang/0034-guard-clang-tools-extra-test=
.patch
@@ -1,3 +1,8 @@
+From 9463b5d24fc62372fc2731d4d4665c64c72b55b2 Mon Sep 17 00:00:00 2001
+From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+Date: Wed, 19 Aug 2026 22:46:10 +0530
+Subject: [PATCH] guard clang-tools-extra test
+
 clang-tools-extra tests depend on the llvm-bcanalyzer CMake target, whic=
h
 exists in LLVM's CMake project but is not visible when Clang is built
 separately. To run clang tests, disable clang-tools-extra tests for now.
@@ -22,30 +27,49 @@ Without this patch when CLANG_INCLUDE_TESTS is ON got=
 the following error
 ------------------------------------------------------------------------=
-------
=20
 Upstream-Status: Inappropriate [OE-Specific]
+
 Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+---
+ clang-tools-extra/CMakeLists.txt                 | 4 ++--
+ clang-tools-extra/clangd/CMakeLists.txt          | 2 +-
+ clang-tools-extra/include-cleaner/CMakeLists.txt | 2 +-
+ 3 files changed, 4 insertions(+), 4 deletions(-)
=20
 diff --git a/clang-tools-extra/CMakeLists.txt b/clang-tools-extra/CMakeL=
ists.txt
-index 6b6f2b1..26e4c10 100644
+index 87050db..3824129 100644
 --- a/clang-tools-extra/CMakeLists.txt
 +++ b/clang-tools-extra/CMakeLists.txt
-@@ -8,7 +8,7 @@ include(GNUInstallDirs)
+@@ -8,7 +8,7 @@ option(CLANG_TIDY_ENABLE_STATIC_ANALYZER
  option(CLANG_TIDY_ENABLE_QUERY_BASED_CUSTOM_CHECKS
    "Enable query-based custom checks in clang-tidy" ON)
-
+=20
 -if(CLANG_INCLUDE_TESTS)
 +if(CLANG_TOOLS_EXTRA_INCLUDE_TESTS)
    umbrella_lit_testsuite_begin(check-clang-tools)
-
+=20
    option(CLANG_TOOLS_TEST_USE_VG "Run Clang tools' tests under Valgrind=
" OFF)
 @@ -45,7 +45,7 @@ if (CLANG_ENABLE_CLANGD)
  endif()
-
+=20
  # Add the common testsuite after all the tools.
 -if(CLANG_INCLUDE_TESTS)
 +if(CLANG_TOOLS_EXTRA_INCLUDE_TESTS)
    add_subdirectory(test)
    add_subdirectory(unittests)
    umbrella_lit_testsuite_end(check-clang-tools)
+diff --git a/clang-tools-extra/clangd/CMakeLists.txt b/clang-tools-extra=
/clangd/CMakeLists.txt
+index 890562d..c4d6623 100644
+--- a/clang-tools-extra/clangd/CMakeLists.txt
++++ b/clang-tools-extra/clangd/CMakeLists.txt
+@@ -217,7 +217,7 @@ endif()
+ option(CLANGD_BUILD_DEXP "Build the dexp tool as part of Clangd" ON)
+ llvm_canonicalize_cmake_booleans(CLANGD_BUILD_DEXP)
+=20
+-if(CLANG_INCLUDE_TESTS)
++if(CLANG_TOOLS_EXTRA_INCLUDE_TESTS)
+   add_subdirectory(test)
+   add_subdirectory(unittests)
+ endif()
 diff --git a/clang-tools-extra/include-cleaner/CMakeLists.txt b/clang-to=
ols-extra/include-cleaner/CMakeLists.txt
 index dc147f9..4855577 100644
 --- a/clang-tools-extra/include-cleaner/CMakeLists.txt
@@ -59,16 +83,3 @@ index dc147f9..4855577 100644
    add_subdirectory(test)
    add_subdirectory(unittests)
  endif()
-diff --git a/clang-tools-extra/clangd/CMakeLists.txt b/clang-tools-extra=
/clangd/CMakeLists.txt
-index a1e9da4..94dcb96 100644
---- a/clang-tools-extra/clangd/CMakeLists.txt
-+++ b/clang-tools-extra/clangd/CMakeLists.txt
-@@ -215,7 +215,7 @@ endif()
- option(CLANGD_BUILD_DEXP "Build the dexp tool as part of Clangd" ON)
- llvm_canonicalize_cmake_booleans(CLANGD_BUILD_DEXP)
-
--if(CLANG_INCLUDE_TESTS)
-+if(CLANG_TOOLS_EXTRA_INCLUDE_TESTS)
-   add_subdirectory(test)
-   add_subdirectory(unittests)
- endif()
diff --git a/meta/recipes-devtools/clang/clang/0035-Prevent-revisiting-bl=
ock-when-searching-for-noreturn.patch b/meta/recipes-devtools/clang/clang=
/0035-Prevent-revisiting-block-when-searching-for-noreturn.patch
deleted file mode 100644
index 6021f736ff..0000000000
--- a/meta/recipes-devtools/clang/clang/0035-Prevent-revisiting-block-whe=
n-searching-for-noreturn.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 051b3bfa1e0e5cfed4a02318e330b38b0090cc49 Mon Sep 17 00:00:00 2001
-From: Serge Pavlov <sepavloff@gmail.com>
-Date: Fri, 25 Jul 2025 13:35:19 +0700
-Subject: [PATCH] Prevent revisiting block when searching for noreturn va=
rs
-
-When searching for noreturn variable initializations, do not visit CFG
-blocks that are already visited, it prevents hanging  the analysis.
-
-It must fix https://github.com/llvm/llvm-project/issues/150336.
-
-Upstream-Status: Submitted [https://github.com/llvm/llvm-project/pull/15=
0582]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- clang/test/SemaCXX/noreturn-vars.cpp | 17 +++++++++++++++++
- 1 file changed, 17 insertions(+)
-
-diff --git a/clang/test/SemaCXX/noreturn-vars.cpp b/clang/test/SemaCXX/n=
oreturn-vars.cpp
-index ca65fcf5ca31..1bf074149f04 100644
---- a/clang/test/SemaCXX/noreturn-vars.cpp
-+++ b/clang/test/SemaCXX/noreturn-vars.cpp
-@@ -225,3 +225,20 @@ extern void abc_02(func_type *);
-   abc_02(&func_ptr);
-   func_ptr();
- } // expected-warning {{function declared 'noreturn' should not return}=
}
-+
-+namespace Issue150336 {
-+void free(void *);
-+typedef void (*sel_freefunc)(void *);
-+struct gmx_ana_selmethod_t {
-+  sel_freefunc free;
-+  int nparams;
-+  int *param;
-+};
-+void gmx_selelem_free_method(struct gmx_ana_selmethod_t* method, void* =
mdata) {
-+    sel_freefunc free_func =3D 0;
-+    for (int i =3D 0; i < method->nparams; ++i)
-+        free(&method->param[i]);
-+    if (mdata && free_func)
-+        free_func(mdata);
-+}
-+}
diff --git a/meta/recipes-devtools/clang/clang/0035-libc-Disable-float16-=
on-32-bit-x86-without-SSE2.patch b/meta/recipes-devtools/clang/clang/0035=
-libc-Disable-float16-on-32-bit-x86-without-SSE2.patch
new file mode 100644
index 0000000000..df35636055
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0035-libc-Disable-float16-on-32-b=
it-x86-without-SSE2.patch
@@ -0,0 +1,36 @@
+From: Sunil Dora <sunilkumar.dora@windriver.com>
+Date: Fri, 29 Aug 2026 13:55:00 +0530
+Subject: [PATCH] libc: Disable float16 on 32-bit x86 without SSE2
+
+GCC 16 defines __FLT16_MANT_DIG__ when targeting i686 even though
+_Float16 is only usable on x86-32 with SSE2 enabled. The float16
+detection in float16-macros.h keys on that macro, so the shared f16
+math headers are compiled on plain i686 and every use of _Float16
+fails:
+
+  libc/src/__support/FPUtil/BasicOperations.h:63:67:
+      error: SSE register return with SSE2 disabled
+  libc/src/__support/math/acosf16.h:73:14:
+      error: invalid conversion from type '_Float16' without option '-ms=
se2'
+
+Since llvm/lib/Support/APFloat.cpp started including shared/math.h,
+this breaks the LLVM build itself for 32-bit x86 baselines older than
+SSE2 (e.g. -march=3Dpentiumpro), as used by Yocto/OpenEmbedded multilib.
+
+Require SSE2 on 32-bit x86 in the guard, matching the existing
+exclusions for 32-bit Arm and RISC-V. Targets with SSE2 are unaffected.
+
+Upstream-Status: Backport [https://github.com/llvm/llvm-project/commit/0=
5da143c63d333420b99eab198e1a89c97480929]
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+--- a/libc/include/llvm-libc-macros/float16-macros.h	2026-08-29 13:55:04=
.771442947 +0530
++++ b/libc/include/llvm-libc-macros/float16-macros.h	2026-08-29 13:55:04=
.773991812 +0530
+@@ -15,7 +15,7 @@
+     (!defined(__GNUC__) || __GNUC__ >=3D 13 ||                         =
          \
+      (defined(__clang__) && __clang_major__ >=3D 12)) &&               =
          \
+     !defined(__arm__) && !defined(_M_ARM) && !defined(__riscv) &&      =
        \
+-    !defined(_WIN32)
++    !defined(_WIN32) && (!defined(__i386__) || defined(__SSE2__))
+ #define LIBC_TYPES_HAS_FLOAT16
+=20
+ // TODO: This would no longer be required if HdrGen let us guard functi=
on
diff --git a/meta/recipes-devtools/clang/clang/0039-Rename-UNUSED-and-UNK=
NOWN-elements-of-OffloadArch-enum.patch b/meta/recipes-devtools/clang/cla=
ng/0039-Rename-UNUSED-and-UNKNOWN-elements-of-OffloadArch-enum.patch
deleted file mode 100644
index 493948acef..0000000000
--- a/meta/recipes-devtools/clang/clang/0039-Rename-UNUSED-and-UNKNOWN-el=
ements-of-OffloadArch-enum.patch
+++ /dev/null
@@ -1,274 +0,0 @@
-From 82f18b02d9fec1bcc225a92251466ffee82f56b5 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 20 Mar 2026 14:22:17 -0700
-Subject: [PATCH] [Clang] Rename UNUSED and UNKNOWN elements of OffloadAr=
ch enum to avoid=20
- macro collisions
-
-OffloadArch uses enumerator named `UNUSED` `UNKNOWN`, which are common m=
acro name
-in external codebases (e.g. Mesa defines UNUSED as an attribute helper).=
 If such
-a macro is visible when including clang/Basic/OffloadArch.h, the preproc=
essor
-expands the token inside the enum and breaks compilation of the installe=
d Clang
-headers.
-
-Rename the enumerator to `Unused` and `Unknown` and update all in-tree r=
eferences. This is a
-spelling-only change (no behavioral impact) and mirrors the existing app=
roach
-used for SM_32_ to avoid macro clashes.
-
-Upstream-Status: Backport [https://github.com/llvm/llvm-project/commit/5=
bc3d1966b2d0b300c338d85bb38e356f0d12a8c]
-Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
-
-diff --git a/clang/include/clang/Basic/OffloadArch.h b/clang/include/cla=
ng/Basic/OffloadArch.h
-index ea665b1..970487c 100644
---- a/clang/include/clang/Basic/OffloadArch.h
-+++ b/clang/include/clang/Basic/OffloadArch.h
-@@ -16,8 +16,8 @@ class StringRef;
- namespace clang {
-
- enum class OffloadArch {
--  UNUSED,
--  UNKNOWN,
-+  Unused,
-+  Unknown,
-   // TODO: Deprecate and remove GPU architectures older than sm_52.
-   SM_20,
-   SM_21,
-@@ -145,7 +145,7 @@ const char *OffloadArchToString(OffloadArch A);
- const char *OffloadArchToVirtualArchString(OffloadArch A);
-
- // Convert a string to an OffloadArch enum value. Returns
--// OffloadArch::UNKNOWN if the string is not recognized.
-+// OffloadArch::Unknown if the string is not recognized.
- OffloadArch StringToOffloadArch(llvm::StringRef S);
-
- } // namespace clang
-diff --git a/clang/lib/Basic/Cuda.cpp b/clang/lib/Basic/Cuda.cpp
-index 514fa2f..7884910 100644
---- a/clang/lib/Basic/Cuda.cpp
-+++ b/clang/lib/Basic/Cuda.cpp
-@@ -75,7 +75,7 @@ CudaVersion ToCudaVersion(llvm::VersionTuple Version) =
{
- }
-
- CudaVersion MinVersionForOffloadArch(OffloadArch A) {
--  if (A =3D=3D OffloadArch::UNKNOWN)
-+  if (A =3D=3D OffloadArch::Unknown)
-     return CudaVersion::UNKNOWN;
-
-   // AMD GPUs do not depend on CUDA versions.
-@@ -141,7 +141,7 @@ CudaVersion MaxVersionForOffloadArch(OffloadArch A) =
{
-     return CudaVersion::NEW;
-
-   switch (A) {
--  case OffloadArch::UNKNOWN:
-+  case OffloadArch::Unknown:
-     return CudaVersion::UNKNOWN;
-   case OffloadArch::SM_20:
-   case OffloadArch::SM_21:
-diff --git a/clang/lib/Basic/OffloadArch.cpp b/clang/lib/Basic/OffloadAr=
ch.cpp
-index 05177f1..f3bbe64 100644
---- a/clang/lib/Basic/OffloadArch.cpp
-+++ b/clang/lib/Basic/OffloadArch.cpp
-@@ -17,7 +17,7 @@ struct OffloadArchToStringMap {
- #define GFX(gpu) {OffloadArch::GFX##gpu, "gfx" #gpu, "compute_amdgcn"}
- static const OffloadArchToStringMap ArchNames[] =3D {
-     // clang-format off
--    {OffloadArch::UNUSED, "", ""},
-+    {OffloadArch::Unused, "", ""},
-     SM(20), {OffloadArch::SM_21, "sm_21", "compute_20"}, // Fermi
-     SM(30), {OffloadArch::SM_32_, "sm_32", "compute_32"}, SM(35), SM(37=
),  // Kepler
-     SM(50), SM(52), SM(53),          // Maxwell
-@@ -132,7 +132,7 @@ OffloadArch StringToOffloadArch(llvm::StringRef S) {
-         return S =3D=3D Map.ArchName;
-       });
-   if (Result =3D=3D std::end(ArchNames))
--    return OffloadArch::UNKNOWN;
-+    return OffloadArch::Unknown;
-   return Result->Arch;
- }
-
-diff --git a/clang/lib/Basic/Targets/NVPTX.cpp b/clang/lib/Basic/Targets=
/NVPTX.cpp
-index 6526eef..9584f8a 100644
---- a/clang/lib/Basic/Targets/NVPTX.cpp
-+++ b/clang/lib/Basic/Targets/NVPTX.cpp
-@@ -64,7 +64,7 @@ NVPTXTargetInfo::NVPTXTargetInfo(const llvm::Triple &T=
riple,
-   // Define available target features
-   // These must be defined in sorted order!
-   NoAsmVariants =3D true;
--  GPU =3D OffloadArch::UNUSED;
-+  GPU =3D OffloadArch::Unused;
-
-   // PTX supports f16 as a fundamental type.
-   HasFastHalfType =3D true;
-diff --git a/clang/lib/Basic/Targets/NVPTX.h b/clang/lib/Basic/Targets/N=
VPTX.h
-index 9bd0cc3..eeffb0e 100644
---- a/clang/lib/Basic/Targets/NVPTX.h
-+++ b/clang/lib/Basic/Targets/NVPTX.h
-@@ -87,7 +87,7 @@ public:
-   initFeatureMap(llvm::StringMap<bool> &Features, DiagnosticsEngine &Di=
ags,
-                  StringRef CPU,
-                  const std::vector<std::string> &FeaturesVec) const ove=
rride {
--    if (GPU !=3D OffloadArch::UNUSED)
-+    if (GPU !=3D OffloadArch::Unused)
-       Features[OffloadArchToString(GPU)] =3D true;
-     // Only add PTX feature if explicitly requested. Otherwise, let the=
 backend
-     // use the minimum required PTX version for the target SM.
-@@ -146,7 +146,7 @@ public:
-   }
-
-   bool isValidCPUName(StringRef Name) const override {
--    return StringToOffloadArch(Name) !=3D OffloadArch::UNKNOWN;
-+    return StringToOffloadArch(Name) !=3D OffloadArch::Unknown;
-   }
-
-   void fillValidCPUList(SmallVectorImpl<StringRef> &Values) const overr=
ide {
-@@ -157,7 +157,7 @@ public:
-
-   bool setCPU(const std::string &Name) override {
-     GPU =3D StringToOffloadArch(Name);
--    return GPU !=3D OffloadArch::UNKNOWN;
-+    return GPU !=3D OffloadArch::Unknown;
-   }
-
-   void setSupportedOpenCLOpts() override {
-diff --git a/clang/lib/CodeGen/CGOpenMPRuntimeGPU.cpp b/clang/lib/CodeGe=
n/CGOpenMPRuntimeGPU.cpp
-index db0d56d..f78047d 100644
---- a/clang/lib/CodeGen/CGOpenMPRuntimeGPU.cpp
-+++ b/clang/lib/CodeGen/CGOpenMPRuntimeGPU.cpp
-@@ -2266,15 +2266,15 @@ bool CGOpenMPRuntimeGPU::hasAllocateAttributeFor=
GlobalVar(const VarDecl *VD,
- // Get current OffloadArch and ignore any unknown values
- static OffloadArch getOffloadArch(CodeGenModule &CGM) {
-   if (!CGM.getTarget().hasFeature("ptx"))
--    return OffloadArch::UNKNOWN;
-+    return OffloadArch::Unknown;
-   for (const auto &Feature : CGM.getTarget().getTargetOpts().FeatureMap=
) {
-     if (Feature.getValue()) {
-       OffloadArch Arch =3D StringToOffloadArch(Feature.getKey());
--      if (Arch !=3D OffloadArch::UNKNOWN)
-+      if (Arch !=3D OffloadArch::Unknown)
-         return Arch;
-     }
-   }
--  return OffloadArch::UNKNOWN;
-+  return OffloadArch::Unknown;
- }
-
- /// Check to see if target architecture supports unified addressing whi=
ch is
-@@ -2382,8 +2382,8 @@ void CGOpenMPRuntimeGPU::processRequiresDirective(=
const OMPRequiresDecl *D) {
-       case OffloadArch::Generic:
-       case OffloadArch::GRANITERAPIDS:
-       case OffloadArch::BMG_G21:
--      case OffloadArch::UNUSED:
--      case OffloadArch::UNKNOWN:
-+      case OffloadArch::Unused:
-+      case OffloadArch::Unknown:
-         break;
-       case OffloadArch::LAST:
-         llvm_unreachable("Unexpected GPU arch.");
-diff --git a/clang/lib/Driver/Driver.cpp b/clang/lib/Driver/Driver.cpp
-index eb3f9cb..c8894a1 100644
---- a/clang/lib/Driver/Driver.cpp
-+++ b/clang/lib/Driver/Driver.cpp
-@@ -946,7 +946,7 @@ inferOffloadToolchains(Compilation &C, Action::Offlo=
adKind Kind) {
-   llvm::DenseSet<llvm::StringRef> Triples;
-   for (llvm::StringRef Arch : Archs) {
-     OffloadArch ID =3D StringToOffloadArch(Arch);
--    if (ID =3D=3D OffloadArch::UNKNOWN)
-+    if (ID =3D=3D OffloadArch::Unknown)
-       ID =3D StringToOffloadArch(
-           getProcessorFromTargetID(llvm::Triple("amdgcn-amd-amdhsa"), A=
rch));
-
-@@ -961,12 +961,12 @@ inferOffloadToolchains(Compilation &C, Action::Off=
loadKind Kind) {
-       return llvm::DenseSet<llvm::StringRef>();
-     }
-     if (Kind =3D=3D Action::OFK_OpenMP &&
--        (ID =3D=3D OffloadArch::UNKNOWN || ID =3D=3D OffloadArch::UNUSE=
D)) {
-+        (ID =3D=3D OffloadArch::Unknown || ID =3D=3D OffloadArch::Unuse=
d)) {
-       C.getDriver().Diag(clang::diag::err_drv_failed_to_deduce_target_f=
rom_arch)
-           << Arch;
-       return llvm::DenseSet<llvm::StringRef>();
-     }
--    if (ID =3D=3D OffloadArch::UNKNOWN || ID =3D=3D OffloadArch::UNUSED=
) {
-+    if (ID =3D=3D OffloadArch::Unknown || ID =3D=3D OffloadArch::Unused=
) {
-       C.getDriver().Diag(clang::diag::err_drv_offload_bad_gpu_arch)
-           << "offload" << Arch;
-       return llvm::DenseSet<llvm::StringRef>();
-@@ -3305,7 +3305,7 @@ class OffloadingActionBuilder final {
-     bool Relocatable =3D false;
-
-     /// Default GPU architecture if there's no one specified.
--    OffloadArch DefaultOffloadArch =3D OffloadArch::UNKNOWN;
-+    OffloadArch DefaultOffloadArch =3D OffloadArch::Unknown;
-
-     /// Compilation unit ID specified by option '-fuse-cuid=3D' or'-cui=
d=3D'.
-     const CUIDOptions &CUIDOpts;
-@@ -3407,7 +3407,7 @@ class OffloadingActionBuilder final {
-
-       // If we have a fat binary, add it to the list.
-       if (CudaFatBinary) {
--        AddTopLevel(CudaFatBinary, OffloadArch::UNUSED);
-+        AddTopLevel(CudaFatBinary, OffloadArch::Unused);
-         CudaDeviceActions.clear();
-         CudaFatBinary =3D nullptr;
-         return;
-@@ -4669,12 +4669,12 @@ static StringRef getCanonicalArchString(Compilat=
ion &C,
-   OffloadArch Arch =3D
-       StringToOffloadArch(getProcessorFromTargetID(Triple, ArchStr));
-   if (Triple.isNVPTX() &&
--      (Arch =3D=3D OffloadArch::UNKNOWN || !IsNVIDIAOffloadArch(Arch)))=
 {
-+      (Arch =3D=3D OffloadArch::Unknown || !IsNVIDIAOffloadArch(Arch)))=
 {
-     C.getDriver().Diag(clang::diag::err_drv_offload_bad_gpu_arch)
-         << "CUDA" << ArchStr;
-     return StringRef();
-   } else if (Triple.isAMDGPU() &&
--             (Arch =3D=3D OffloadArch::UNKNOWN || !IsAMDOffloadArch(Arc=
h))) {
-+             (Arch =3D=3D OffloadArch::Unknown || !IsAMDOffloadArch(Arc=
h))) {
-     C.getDriver().Diag(clang::diag::err_drv_offload_bad_gpu_arch)
-         << "HIP" << ArchStr;
-     return StringRef();
-diff --git a/clang/lib/Driver/OffloadBundler.cpp b/clang/lib/Driver/Offl=
oadBundler.cpp
-index f69ac41..6d446f2 100644
---- a/clang/lib/Driver/OffloadBundler.cpp
-+++ b/clang/lib/Driver/OffloadBundler.cpp
-@@ -95,7 +95,7 @@ OffloadTargetInfo::OffloadTargetInfo(const StringRef T=
arget,
-       Components.size() =3D=3D 6 ? Components.back() : "";
-   StringRef TargetId =3D TargetIdWithFeature.split(':').first;
-   if (!TargetId.empty() &&
--      clang::StringToOffloadArch(TargetId) !=3D clang::OffloadArch::UNK=
NOWN)
-+      clang::StringToOffloadArch(TargetId) !=3D clang::OffloadArch::Unk=
nown)
-     this->TargetID =3D TargetIdWithFeature;
-   else
-     this->TargetID =3D "";
-diff --git a/clang/lib/Driver/ToolChains/Cuda.cpp b/clang/lib/Driver/Too=
lChains/Cuda.cpp
-index 6cc73ff..d97b926 100644
---- a/clang/lib/Driver/ToolChains/Cuda.cpp
-+++ b/clang/lib/Driver/ToolChains/Cuda.cpp
-@@ -319,7 +319,7 @@ void CudaInstallationDetector::AddCudaIncludeArgs(
-
- void CudaInstallationDetector::CheckCudaVersionSupportsArch(
-     OffloadArch Arch) const {
--  if (Arch =3D=3D OffloadArch::UNKNOWN || Version =3D=3D CudaVersion::U=
NKNOWN ||
-+  if (Arch =3D=3D OffloadArch::Unknown || Version =3D=3D CudaVersion::U=
NKNOWN ||
-       ArchsWithBadVersion[(int)Arch])
-     return;
-
-@@ -408,7 +408,7 @@ void NVPTX::Assembler::ConstructJob(Compilation &C, =
const JobAction &JA,
-
-   // Obtain architecture from the action.
-   OffloadArch gpu_arch =3D StringToOffloadArch(GPUArchName);
--  assert(gpu_arch !=3D OffloadArch::UNKNOWN &&
-+  assert(gpu_arch !=3D OffloadArch::Unknown &&
-          "Device action expected to have an architecture.");
-
-   // Check that our installation's ptxas supports gpu_arch.
-diff --git a/clang/lib/Sema/SemaDeclAttr.cpp b/clang/lib/Sema/SemaDeclAt=
tr.cpp
-index 3f0ea5c..e6d3516 100644
---- a/clang/lib/Sema/SemaDeclAttr.cpp
-+++ b/clang/lib/Sema/SemaDeclAttr.cpp
-@@ -5732,7 +5732,7 @@ Sema::CreateLaunchBoundsAttr(const AttributeCommon=
Info &CI, Expr *MaxThreads,
-   if (MaxBlocks) {
-     // '.maxclusterrank' ptx directive requires .target sm_90 or higher.
-     auto SM =3D getOffloadArch(Context.getTargetInfo());
--    if (SM =3D=3D OffloadArch::UNKNOWN || SM < OffloadArch::SM_90) {
-+    if (SM =3D=3D OffloadArch::Unknown || SM < OffloadArch::SM_90) {
-       Diag(MaxBlocks->getBeginLoc(), diag::warn_cuda_maxclusterrank_sm_=
90)
-           << OffloadArchToString(SM) << CI << MaxBlocks->getSourceRange=
();
-       // Ignore it by setting MaxBlocks to null;
diff --git a/meta/recipes-devtools/clang/clang/0040-libcxxabi-declare-__g=
nu_unwind_frame-in-cxa_personal.patch b/meta/recipes-devtools/clang/clang=
/0040-libcxxabi-declare-__gnu_unwind_frame-in-cxa_personal.patch
deleted file mode 100644
index f458fd0cf8..0000000000
--- a/meta/recipes-devtools/clang/clang/0040-libcxxabi-declare-__gnu_unwi=
nd_frame-in-cxa_personal.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 5dbd0a05f64a43849a7edde95a0e5f2323cd1f9d Mon Sep 17 00:00:00 2001
-From: Khem Raj <khem.raj@oss.qualcomm.com>
-Date: Tue, 31 Mar 2026 19:33:29 -0700
-Subject: [PATCH] libcxxabi: declare __gnu_unwind_frame in cxa_personalit=
y
-
-ARM EHABI builds of libcxxabi fail with clang-22+ because
-cxa_personality.cpp calls __gnu_unwind_frame without a visible
-declaration, triggering:
-
-  error: use of undeclared identifier '__gnu_unwind_frame'
-
-Add an extern "C" forward declaration before the EHABI unwind helper
-so the source compiles correctly.
-
-Upstream-Status: Submitted [https://github.com/llvm/llvm-project/pull/18=
9787]
-Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
----
- libcxxabi/src/cxa_personality.cpp | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/libcxxabi/src/cxa_personality.cpp b/libcxxabi/src/cxa_perso=
nality.cpp
-index 35f4e3807724..ddff277cc7b8 100644
---- a/libcxxabi/src/cxa_personality.cpp
-+++ b/libcxxabi/src/cxa_personality.cpp
-@@ -1116,6 +1116,8 @@ __gxx_personality_seh0(PEXCEPTION_RECORD ms_exc, v=
oid *this_frame,
-
- #else
-
-+extern "C" _Unwind_Reason_Code __gnu_unwind_frame(_Unwind_Exception*,
-+                                                  _Unwind_Context*);
- // Helper function to unwind one frame.
- // ARM EHABI 7.3 and 7.4: If the personality function returns _URC_CONT=
INUE_UNWIND, the
- // personality routine should update the virtual register set (VRS) acc=
ording to the
diff --git a/meta/recipes-devtools/clang/clang/0043-LoopUnroll-Iterate-ex=
it-fold-candidates-in-determini.patch b/meta/recipes-devtools/clang/clang=
/0043-LoopUnroll-Iterate-exit-fold-candidates-in-determini.patch
deleted file mode 100644
index 39e27ac12f..0000000000
--- a/meta/recipes-devtools/clang/clang/0043-LoopUnroll-Iterate-exit-fold=
-candidates-in-determini.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 965f9d87adb0a7376454374fbc140ab69bd796a9 Mon Sep 17 00:00:00 2001
-From: Florian Hahn <flo@fhahn.com>
-Date: Fri, 27 Mar 2026 13:02:51 +0000
-Subject: [PATCH] [LoopUnroll] Use MapVector for deterministic iteration =
order.
- (#188821)
-
-NonLoopBlocksIDom determines the order we adjust the DT, impacting DRT
-child ordering.
-
-Similarly, ExitInfos order impacts the order of SetDest, which applies
-DT updates.
-
-The order impacts collectChildrenInLoop, which in turn impacts the we
-process BBs in LICM. And this in turn impacts the order in which we
-perform alias queries.
-
-If the order is not deterministic, we sometimes get different NumNoAlias
-statistic counts, and possibly also different IR, although I have not
-confirmed the latter.
-
-Upstream-Status: Backport [https://github.com/llvm/llvm-project/commit/9=
65f9d87adb0a7376454374fbc140ab69bd796a9]
-Signed-off-by: Sunilkumar Dora <sunilkumar.dora@windriver.com>
-Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
-
----
- llvm/lib/Transforms/Utils/LoopPeel.cpp   | 3 ++-
- llvm/lib/Transforms/Utils/LoopUnroll.cpp | 3 ++-
- 2 files changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/llvm/lib/Transforms/Utils/LoopPeel.cpp b/llvm/lib/Transform=
s/Utils/LoopPeel.cpp
-index 91737b5c30533..4c67d5a9ae680 100644
---- a/llvm/lib/Transforms/Utils/LoopPeel.cpp
-+++ b/llvm/lib/Transforms/Utils/LoopPeel.cpp
-@@ -11,6 +11,7 @@
-
- #include "llvm/Transforms/Utils/LoopPeel.h"
- #include "llvm/ADT/DenseMap.h"
-+#include "llvm/ADT/MapVector.h"
- #include "llvm/ADT/SmallVector.h"
- #include "llvm/ADT/Statistic.h"
- #include "llvm/Analysis/Loads.h"
-@@ -1121,7 +1122,7 @@ void llvm::peelLoop(Loop *L, unsigned PeelCount, b=
ool PeelLast, LoopInfo *LI,
-   // later. Immediate dominator of such block might change, because we =
add more
-   // routes which can lead to the exit: we can reach it from the peeled
-   // iterations too.
--  DenseMap<BasicBlock *, BasicBlock *> NonLoopBlocksIDom;
-+  MapVector<BasicBlock *, BasicBlock *> NonLoopBlocksIDom;
-   for (auto *BB : L->blocks()) {
-     auto *BBDomNode =3D DT.getNode(BB);
-     SmallVector<BasicBlock *, 16> ChildrenToUpdate;
-diff --git a/llvm/lib/Transforms/Utils/LoopUnroll.cpp b/llvm/lib/Transfo=
rms/Utils/LoopUnroll.cpp
-index 6a2ccbea996bf..ab35d217f0d93 100644
---- a/llvm/lib/Transforms/Utils/LoopUnroll.cpp
-+++ b/llvm/lib/Transforms/Utils/LoopUnroll.cpp
-@@ -17,6 +17,7 @@
-
- #include "llvm/ADT/ArrayRef.h"
- #include "llvm/ADT/DenseMap.h"
-+#include "llvm/ADT/MapVector.h"
- #include "llvm/ADT/STLExtras.h"
- #include "llvm/ADT/ScopedHashTable.h"
- #include "llvm/ADT/SetVector.h"
-@@ -515,7 +516,7 @@ llvm::UnrollLoop(Loop *L, UnrollLoopOptions ULO, Loo=
pInfo *LI,
-     BasicBlock *FirstExitingBlock =3D nullptr;
-     SmallVector<BasicBlock *> ExitingBlocks;
-   };
--  DenseMap<BasicBlock *, ExitInfo> ExitInfos;
-+  MapVector<BasicBlock *, ExitInfo> ExitInfos;
-   SmallVector<BasicBlock *, 4> ExitingBlocks;
-   L->getExitingBlocks(ExitingBlocks);
-   for (auto *ExitingBlock : ExitingBlocks) {
diff --git a/meta/recipes-devtools/clang/common-clang.inc b/meta/recipes-=
devtools/clang/common-clang.inc
index 9018094419..5d571e5fce 100644
--- a/meta/recipes-devtools/clang/common-clang.inc
+++ b/meta/recipes-devtools/clang/common-clang.inc
@@ -3,9 +3,9 @@ LLVM_DIR =3D "llvm${LLVM_RELEASE}"
=20
 LLVM_HTTP ?=3D "https://github.com/llvm"
=20
-MAJOR_VER =3D "22"
+MAJOR_VER =3D "23"
 MINOR_VER =3D "1"
-PATCH_VER =3D "8"
+PATCH_VER =3D "0"
 # could be 'rcX' or 'git' or empty ( for release )
 VER_SUFFIX =3D ""
=20
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtoo=
ls/clang/common.inc
index e1e03872cd..0ca6951ff4 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -17,51 +17,45 @@ BASEURI ?=3D "${LLVM_HTTP}/llvm-project/releases/down=
load/llvmorg-${PV}${VER_SUFFI
 UPSTREAM_CHECK_URI =3D "${LLVM_HTTP}/llvm-project/releases/"
 UPSTREAM_CHECK_REGEX =3D "releases/tag/llvmorg-?(?P<pver>\d+(\.\d+)+)"
 SOURCEDIR ?=3D "llvm-project-${PV}${VER_SUFFIX}.src"
-SRC_URI[sha256sum] =3D "922f1817a0df7b1489272d18134ee0087a8b068828f87ac6=
3b9861b1a9965888"
+SRC_URI[sha256sum] =3D "ab1f0e3ec52448c33e8782eaf0422504b87c7b016b225146=
53ee0d8fcee479ff"
=20
 SRC_URI =3D "\
     ${BASEURI} \
-    file://0001-libcxxabi-Find-libunwind-headers-when-LIBCXXABI_LIBU.pat=
ch \
-    file://0002-compiler-rt-support-a-new-embedded-linux-target.patch \
-    file://0003-compiler-rt-Simplify-cross-compilation.-Don-t-use-na.pat=
ch \
-    file://0004-llvm-allow-env-override-of-exe-and-libdir-path.patch \
-    file://0005-clang-driver-Check-sysroot-for-ldso-path.patch \
-    file://0006-clang-Driver-tools.cpp-Add-lssp_nonshared-on-musl.patch =
\
-    file://0007-clang-Prepend-trailing-to-sysroot.patch \
-    file://0009-clang-Define-releative-gcc-installation-dir.patch \
-    file://0010-clang-Add-lpthread-and-ldl-along-with-lunwind-for-st.pat=
ch \
-    file://0011-Check-for-atomic-double-intrinsics.patch \
-    file://0012-cmake-Fix-configure-for-packages-using-find_package.patc=
h \
-    file://0013-clang-Fix-resource-dir-location-for-cross-toolchains.pat=
ch \
-    file://0014-clang-driver-Add-dyld-prefix-when-checking-sysroot-f.pat=
ch \
-    file://0015-clang-Use-python3-in-python-scripts.patch \
-    file://0016-llvm-clang-Insert-anchor-for-adding-OE-distro-vendor.pat=
ch \
-    file://0017-compiler-rt-Do-not-use-backtrace-APIs-on-non-glibc-l.pat=
ch \
-    file://0018-clang-Fix-x86-triple-for-non-debian-multiarch-linux-.pat=
ch \
-    file://0019-libunwind-Added-unw_backtrace-method.patch \
-    file://0020-lldb-Link-with-libatomic-on-x86.patch \
-    file://0021-compiler-rt-Enable-__int128-for-ppc32.patch \
-    file://0022-llvm-Do-not-use-cmake-infra-to-detect-libzstd.patch \
-    file://0023-compiler-rt-Fix-stat-struct-s-size-for-O32-ABI.patch \
-    file://0024-ToolChains-Gnu.cpp-ARMLibDirs-search-also-in-lib32.patch=
 \
-    file://0025-clang-llvm-Add-OE-specific-ABI-triple-for-N32-ABI.patch =
\
-    file://0026-llvm-Add-libunwind.pc.in-and-llvm-config-scripts.patch \
-    file://0027-scan-build-py-respect-LLVM_LIBDIR_SUFFIX-like-other-.pat=
ch \
-    file://0028-compiler-rt-Do-not-pass-target-to-clang-compiler.patch \
-    file://0029-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.pat=
ch \
-    file://0030-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patc=
h \
-    file://0031-compiler-rt-Exclude-sync_fetch_and_-for-any-pre-ARMv.pat=
ch \
-    file://0032-compiler-rt-Hardcode-uptr-sptr-typedefs-on-Mips-Linu.pat=
ch \
-    file://0034-Revert-libc-Remap-headers-in-the-debug-info-when-bui.pat=
ch \
-    file://0035-Prevent-revisiting-block-when-searching-for-noreturn.pat=
ch \
-    file://0036-Don-t-expose-LLVM_HAVE_OPT_VIEWER_MODULES-externally.pat=
ch \
-    file://0037-clang-Only-build-clang-tblgen-if-it-is-actually-need.pat=
ch \
-    file://0038-llvm-libgcc-Fix-symlink-path-for-libcc-when-LLVM_ENA.pat=
ch \
-    file://0039-Rename-UNUSED-and-UNKNOWN-elements-of-OffloadArch-enum.p=
atch \
-    file://0040-libcxxabi-declare-__gnu_unwind_frame-in-cxa_personal.pat=
ch \
-    file://0041-Consolidate-and-fix-sysroot-based-compiler-rt-search.pat=
ch \
-    file://0042-guard-clang-tools-extra-test.patch \
-    file://0043-LoopUnroll-Iterate-exit-fold-candidates-in-determini.pat=
ch \
+    file://0001-compiler-rt-Simplify-cross-compilation.-Don-t-use-na.pat=
ch \
+    file://0002-llvm-allow-env-override-of-exe-and-libdir-path.patch \
+    file://0003-clang-driver-Check-sysroot-for-ldso-path.patch \
+    file://0004-clang-Driver-tools.cpp-Add-lssp_nonshared-on-musl.patch =
\
+    file://0005-clang-Prepend-trailing-to-sysroot.patch \
+    file://0006-clang-Define-releative-gcc-installation-dir.patch \
+    file://0007-clang-Add-lpthread-and-ldl-along-with-lunwind-for-st.pat=
ch \
+    file://0008-Check-for-atomic-double-intrinsics.patch \
+    file://0009-cmake-Fix-configure-for-packages-using-find_package.patc=
h \
+    file://0010-clang-Fix-resource-dir-location-for-cross-toolchains.pat=
ch \
+    file://0011-clang-driver-Add-dyld-prefix-when-checking-sysroot-f.pat=
ch \
+    file://0012-clang-Use-python3-in-python-scripts.patch \
+    file://0013-llvm-clang-Insert-anchor-for-adding-OE-distro-vendor.pat=
ch \
+    file://0014-clang-Fix-x86-triple-for-non-debian-multiarch-linux-.pat=
ch \
+    file://0015-libunwind-Added-unw_backtrace-method.patch \
+    file://0016-lldb-Link-with-libatomic-on-x86.patch \
+    file://0017-compiler-rt-Enable-__int128-for-ppc32.patch \
+    file://0018-llvm-Do-not-use-cmake-infra-to-detect-libzstd.patch \
+    file://0019-compiler-rt-Fix-stat-struct-s-size-for-O32-ABI.patch \
+    file://0020-ToolChains-Gnu.cpp-ARMLibDirs-search-also-in-lib32.patch=
 \
+    file://0021-clang-llvm-Add-OE-specific-ABI-triple-for-N32-ABI.patch =
\
+    file://0022-llvm-Add-libunwind.pc.in-and-llvm-config-scripts.patch \
+    file://0023-scan-build-py-respect-LLVM_LIBDIR_SUFFIX-like-other-.pat=
ch \
+    file://0024-compiler-rt-Do-not-pass-target-to-clang-compiler.patch \
+    file://0025-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.pat=
ch \
+    file://0026-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patc=
h \
+    file://0027-compiler-rt-Exclude-sync_fetch_and_-for-any-pre-ARMv.pat=
ch \
+    file://0028-Hardcode-uptr-sptr-typedefs-on-Mips-Linux.patch \
+    file://0029-Revert-libc-Remap-headers-in-the-debug-info-when-bui.pat=
ch \
+    file://0030-Don-t-expose-LLVM_HAVE_OPT_VIEWER_MODULES-externally.pat=
ch \
+    file://0031-Only-build-clang-tblgen-if-it-is-actually-needed.patch \
+    file://0032-llvm-libgcc-Fix-symlink-path-for-libcc-when-LLVM_ENA.pat=
ch \
+    file://0033-Consolidate-and-fix-sysroot-based-compiler-rt-search.pat=
ch \
+    file://0034-guard-clang-tools-extra-test.patch \
+    file://0035-libc-Disable-float16-on-32-bit-x86-without-SSE2.patch \
 "
 # Fallback to no-PIE if not set
 GCCPIE ??=3D ""
--=20
2.43.0


