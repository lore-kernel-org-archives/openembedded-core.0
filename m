Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B61CECD4F3D
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 02:37:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.207.1779071831635678481
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 May 2026 19:37:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=HNvYszC6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9598bf1d35=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I2as9v310841
	for <openembedded-core@lists.openembedded.org>; Sun, 17 May 2026 19:37:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=irSnRiOEUSCQ9UnYZ9HwzPoXD6STPKxlBTGJLfHo1do=; b=
	HNvYszC6VLbcVafXPQpwTtFqFSYf6s4Iky9YEBFfMqwtaDFY3pP4iZ1R73/AXQDZ
	GehIgL/gUjFx8pxSoLaO2B0uoPxdAlm/9xptAerE7LlW2JgjRbxTIeSylAjWIA5r
	jFclhZcapYcxfqdJIK/2NCoFekbACPaYIW5LniCVlfWaY9eb3+dSNklVROYXqFEL
	jTmJCotbBYNk4bbP9tW0dlZj+0BtQ9Lqe0q2MwNJZB7mJkXdd71rV02mV9vSr7Uv
	Fq8UiO0LbTMUOeSjNeHpd+du6+WmrFee32AXCim3ehmBL2QpiAbQalHhAv3UO+o1
	3khkHvXJMlIQxJHS+98bDA==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010000.outbound.protection.outlook.com [52.101.201.0])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6r3g96ea-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 17 May 2026 19:37:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BAusiTNBn5V47SX9iBe48rBkAp+YsAkQk/8QZZCH3E9PG3XVKtkUQSO5lpOU0ppCv8vtE8/PRhpeWkurGXnuFfmes+yAZuPrYUek1wKErY9g0lmPPwX44somWTmjrrYlBpNWVjgvUhJ2MsdqSyVOSVf8IOBqZc7keU4LoxaIWJ4ZMCURZKQ45HcsV84OoHcegxGMTW6O4Zj6zmpsaD8enWiQE64utHT3GTMQJ0AKaipE6WmjHw5wMPgL/2zSVhwqurGcVbBvu4U3jLsAm2VPL4lL5Z5OcZ7fDVbIbUa8ClFxMX3hPSVHmwDvNdnB+l5bKmqfV+NKSWR7huqe8CQKgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=irSnRiOEUSCQ9UnYZ9HwzPoXD6STPKxlBTGJLfHo1do=;
 b=IDrgCR/PI1Sc93QWubnfc6tm9UOUBXJ87k3BDl1JUacACkKgogfBC6I9DgBfijOx6Nr+hMG4PtBN3Rd/wHgrFFKLJHbAX8Vh9QTnVrdvnLs7mELemexUn3vxdORMYEpCOlN0LcZAjD1Mg9lrgxevgEYf4GEOXCCeWYuKH6a1vT01ebQf3Xq55k8fYL1utUh94jJ3qN+BCwekIPLDV/i8hN61PbZVciGqLey903spBbE3LH6sv2pEmxYJz4HMYG0T5EGMp/a+VpNvBPFmpOHUOfwRvEmm/c9zw5+hxeOJdcsnkSzZCAxB7r0NbsnGdOsNyGdWG3Ffh3dOhR5mEbVv7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA2PR11MB5145.namprd11.prod.outlook.com (2603:10b6:806:113::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 18 May
 2026 02:37:06 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%3]) with mapi id 15.21.0025.022; Mon, 18 May 2026
 02:37:06 +0000
Message-ID: <c128db5e-2ef5-4c93-9cc9-ae55f31f7da0@windriver.com>
Date: Mon, 18 May 2026 10:37:00 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH V5 1/7] recipeutils: add optional stable_upgrade
 parameter to get_recipe_upgrade_status
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
        "MacLeod, Randy" <Randy.MacLeod@windriver.com>
References: <20260513052334.2271800-1-Qi.Chen@windriver.com>
 <DIIC2A22J8TH.2IC6O1ZQ1MODS@bootlin.com>
 <CO6PR11MB5602B1780BBA2AD5C925D884ED042@CO6PR11MB5602.namprd11.prod.outlook.com>
 <CANNYZj8pf8FtsRjZpnMGP2egY+Wc9aw4ZDz2DR=rqv74Oopk1w@mail.gmail.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <CANNYZj8pf8FtsRjZpnMGP2egY+Wc9aw4ZDz2DR=rqv74Oopk1w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SE2P216CA0038.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:116::13) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA2PR11MB5145:EE_
X-MS-Office365-Filtering-Correlation-Id: 194a2465-cf0f-4d98-4756-08deb48659d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003|11063799003|4143699003;
X-Microsoft-Antispam-Message-Info: 
	kheLXQHLX9cWnMfOCjfSYfNaBc7KjiBhB2CWRUc0XNq7ePwjtuB1fynkmkyCwIdM4rLBQkTJKXKFtwuf9z/8v9Objb6XP+YngzNye4lPtrGhGhhRwqVU1bjyioNLwOK5mUy86XrKTQHCryQmplngdG6voCM4/cM5pOJIWLR1p4zMScgwD52k8bEC8PINcPErfhsnleR0Luf1MG/2iRR4l4aQyJveAP1NPvbuvqTETfT76MAkDp+TrEL+cmXIULdmU6SBZ3n9JnyfIx6bv93EdtDsJSh6Mk7C+lWVL+MJ8QkNU0yqwcfIf9nav8bWGg2qHIKjleOndziRsKX4F03xDPEY17ytxMYhU3/FrL1TsR5z9wNAPHOcyqS+68ObYBtIvH6WIcxRfVWbd5M9U81u1198E/oRuyG5ut0vrm2OZRQ1LdyIrjCC7DoM697o87ewHxEv+NHzhUzKvMznVJI6Q+W1xpNsU1RydEQ4D/FOM+/bviOuwRN0IMSKYNypfPsxwRWg6M98k3kkcj5rAiREvhKJkK46E+XkuP2lTP+CmG13vvf/zJJmfvdAaIMynIZeoxglDudrEBMa6BKpgEFW39kKU6kUnG1/bPjVPtDXyHH0Ricd7pSX/7nIj5XPp4uDvq2hGVtesTF4TZj5ZR4P4hlnGGWzdHdFLNi1p0zzBRzGkWoql/RFMAlvRwKLsxYJvgMVqYl9ifea1v7SuueYcg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003)(11063799003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YmRnUnMrb3dwdHhTYmZYMnhtRlBPeEEzbkhrSjhoRGVlenpYQTVoZmtSS25L?=
 =?utf-8?B?Q3p3VjNZaWRjQ1BYbUF5Y0doY0YxUVNHY01uQlVMay80L3BrdGo4VzhJQVNZ?=
 =?utf-8?B?VHRJTkZjcXdHeHBrQVdjUEphc2tBSTZSZzZPVHo5VTBhbXRWSFRBSXIrdDZt?=
 =?utf-8?B?cTNraXZyR25IVDkwMmt0anViM0JHNUFlY3FaM21lSU4yNHlaUk4wSzVCTWdZ?=
 =?utf-8?B?ZFpVN3FCRFc4ZEZaSkVsUDJLdnEyV1FOaGx4RFpUNjBpL3I4MDI1ejBGb2xY?=
 =?utf-8?B?R3pXcVFDdDUyc1dGRVZkdS9sRlhoNTQ4ZjhNR3FES3A1Qi9xZzVsdUxRNnV4?=
 =?utf-8?B?UWxBYm1QYnRTVlVKYUJzeW1heHMrUE5mdmtYc3RLd3RuMG5BSXdOR2R6cGJC?=
 =?utf-8?B?clJRaDFNdDJHUUxiMjM5TGJIUjVEWW1CaGdzRm1IU0JpdDh2QStHVyt4NklM?=
 =?utf-8?B?SWdoL0oyckZnYVI2NHhIQVZhODRKanF5UllSZ2FqdWdTRUZ5NHVTVmdDUVhV?=
 =?utf-8?B?N3NIam51YlpIUmlqSlE0SVhpRGRZYTh3SkgydHQ0MUdTUitTTFh2cThNWSsr?=
 =?utf-8?B?S2pwZDNZL2hRdlNSTkhiZElYR3AwZDFMUXZMaXQyV1ZyUlRrK210UndqNUNv?=
 =?utf-8?B?TWpwVnNGWWZyUkhyOUYwYlZmSkw2TkVBKzk5RkgxZTU2MDhnblFtNnFrV29x?=
 =?utf-8?B?UU5hYlpNdjQyd1B3ZVBhM2NROG02QXRlNFJUMFJNZlN3U0NUdU14M1BWbzBL?=
 =?utf-8?B?WTZ6L0Jjd0xFZk5aR0VNQ0FOd3hkb2FhcXVhS2FHRmJYeGlLQklMb0NmTnN0?=
 =?utf-8?B?UFFWUjJPYmYxTXo5ZFFoVmRlMDJrazZHVDlYSlB1bExtUWpLdzk1RnpXTEtF?=
 =?utf-8?B?cWYvUmJlL0V4dnV4MDdSQTV6ZXhVRHVsZFp5dFFYbUxId2RHTHpBTmllR3ZP?=
 =?utf-8?B?TE5CbDhkVVo2U2hORHJNbm9wUXpUTkVML25HNmR0LzRwUW1PQkVGZ04yYkFq?=
 =?utf-8?B?ZW42L2hFK011MGpyVzBrWVR2UDF0eDNtZlFLQUNiaXFNUUtZN1J3OS9MMUxt?=
 =?utf-8?B?YW5MK3VwTTlOOEduRzVLaXYrMjdSc09hR2ZSazc3UG1xQmhhRFc0aXZXTEJv?=
 =?utf-8?B?cm94NWJPenIydkRlWFR3Tm1xMG8wbXZ3UkpIdlR6enJ4TmRhcjZleFdENnBx?=
 =?utf-8?B?Um5MUjRpSTBoN1JwMTFHNFJ2bmF2UVJQbjZadU10ZlpoN0xlajB1d2ZKRUoy?=
 =?utf-8?B?WUthUGJDQm44MEhsZEMxYTJVSWFmdmhvcEltN21NQjR3cmhNQ3lVTDZhNWFZ?=
 =?utf-8?B?blp1WGdWNm5Ma2JWdE9LRmxINGZ6ZGNwL3ZIdW9ZeHVxWWVMam9hYXVJc0hS?=
 =?utf-8?B?WW9SUUlGRW0xVWR4ZUF3N212L25vNVVwRlFpcnBob3AxejZ6aVNSU2pHN0s5?=
 =?utf-8?B?OVV4Y1JtaUd2Z3hNd1RaMkVwQ2VxYzQ3cFZtVlVMeUNTQUdnT3I5WXVGTzgx?=
 =?utf-8?B?dnMwUG5QU3JMZHZYQjFtQ1UxeDVpOFRLME9JMDZqQkF1WUhZdTNEc2pzUStS?=
 =?utf-8?B?dFRWT0VQN3Z3MGZpSjhFUUQ1NSs4WUw5Q3pxSDFBOElueDdsT0RqRkpia2Fs?=
 =?utf-8?B?WmxpdFN0OEppRVM1VXRBdGxLdFBHSlAxSyt0RVVtQkUvSTJiQ2Nzd0VlMUs3?=
 =?utf-8?B?N3RBbVc0Mk9xSHJjeXVlL2g1Skw3OVlWV3VnZGNoaGY3L3Z0aXlqRHU3YU4r?=
 =?utf-8?B?SzNSakdZMjduNWtHdFdZbzFHYWFoT28rbXVlYXdmMWNhMG1pNlIxOG5mUndP?=
 =?utf-8?B?Y1pkQTduU0dmV0J1bmJvMGJwaW9uRTd3Vm1lbTFpUmQ3MXNaZmZtd0VrU056?=
 =?utf-8?B?TVB4MjFNN1JpWEJGaWI4OFpHOFIwNW1JTFFxbnZzTkkzWW9YckVQbHNIY05v?=
 =?utf-8?B?Z3JJVzZUTllCN01jQlowZCtwakd0WDNiaU9lQVQzNVNmZG1raERxYi8ramVn?=
 =?utf-8?B?cC91MnNqNDk2clg2aUp6bXQ5MkNIMGVJM09JVlRrcDlPZjhIUE5jSGt3dmFh?=
 =?utf-8?B?N1E3S0ozVmpvTkEybTlNbHo5aE1ZWU5pWlQvYVFhdkQreDU2Ynh2UGFmNytC?=
 =?utf-8?B?YWsxRzRNWkp5ZXlUYXJENGhYdDRmUHo5NTZGTXdIMEhsY1JUOVR6MFVPS29K?=
 =?utf-8?B?a1NiZ0dmSnBTV1NDTGRMZGQ1QmxRZjZGamlsYUM1OXdvNGp2RGQ5WFN6bUxW?=
 =?utf-8?B?V3dlR1VCNEc5QzlXdWF1SitRcUNtWFlScU9jVVhVSE1ZeEUrM0R2N3dyaG1O?=
 =?utf-8?B?TDRNcVk1NW92cWd2MzBUaXJZUi9EWG1WL3JMVTdUSjIrRWVWR0pzdz09?=
X-Exchange-RoutingPolicyChecked: 
	TzXGVaU1eDAIOr58F/UJ00JOKLCW/H+rYGDB2rwUvE5R5gCvNRpy0kp9ln1cCWEKpeNUWQ7P+h2LHVyrgYmdasVYpHSE125zMGSrPfiSCB13Not0ud1VN4suUckeHomY9u1gWyqQgr5ZFmJQtb090dYKz23iKt0v7p5ljDXyxgXzWFpV5IhlTmQsMAvIXRNs4N9Y9ZYxvm4jBziYnb2z0UqGGZVREgklz/iqutRXMpqA5Dq6Tk0TwRV+MYrBcIQWzDFcpnTn1ABOpF8FG/jjF+xwAar/dKjOUGfYB9PNX/x4pWZxPx+Q7ySlM2gfOLJhz02NgGJkuYMlW3mZs/e21g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 194a2465-cf0f-4d98-4756-08deb48659d3
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 02:37:06.0240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AcVtugJkgXVhz1zZUut3y+c6AK8j1Syl08L+LHsOZFD7B6CCEqIMvPlpXS4DHXx64i03gRdoJwUW2WVKMi/mtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5145
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: fxXKuCjy2Y4PQk4Q1V62000QdtEhYAuE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDAyMyBTYWx0ZWRfXwUSUkOqzsSw1
 PpErsaQjIzcUMVYpetVnJq6WfLa7UwE2o6/KGrauouey1RV/oB8abaQDfpoi1hsiDSMZnT3xS6U
 XQPwXnx9WwiH06DzoT322FpqDlzGNO65C2zXWMLFjM29pP6ZoAKGOfS2Y3LHoWawQtI4JMKiYmh
 2aYy6e9soEgqc1LUsGsn9WbuWYkAsPzMmlMPhLNi9IuWdQ6yOgjQbfBIzSFWuLbdMzfXoB2++0L
 jl7223g0Tspd36ogz6HAutuFtov9qQDjV6T7RzEMb2CMJY3kDcXMpHsFTP8RFbQ72+3BVQXXuZ/
 gAQlQyl+Z68ruWfxRQv2DOYPtspra5+OoUQLpIqGtrqPa6mwwkS3KXIZvNFscUzfEBhksGFeIFs
 EfxrfgUrMzBvHJVjjWvFDrJJXSjjObP105bStUtOK/YAjRlqrIB8uqbvFolKbol/QPRvP6uiqRF
 iYokd/Otg7bAudRiNwA==
X-Authority-Analysis: v=2.4 cv=I45Vgtgg c=1 sm=1 tr=0 ts=6a0a7b57 cx=c_pps
 a=0bDVNUKav+K/acou55tioQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=Q4-j1AaZAAAA:8 a=RlzsG-BoY4eNq-2Py8MA:9 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: 5pjDXMKNIX6Q63MLjVe8ARHz9rpr5b77
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180023
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 02:37:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237191

On 5/15/26 18:22, Alexander Kanavin wrote:
> On Fri, 15 May 2026 at 11:06, Chen Qi via lists.openembedded.org
> <Qi.Chen=windriver.com@lists.openembedded.org> wrote:
>> I examined the error messages on autobuilder. The key part is:
>> upstream-stable-release-point.bbclass:18: SyntaxWarning: invalid escape sequence '\\.'\n  return '\\.'.join(stable_parts)\n
>>
>> However, the actual codes are:
>> '\.'.join(stable_parts)
>>
>> There seems to be an extra '\' there. Interestingly, even if I manually added an extra '\' to the codes, the test ('oe-selftest -r recipetool.RecipetoolAppendTests.test_recipetool_appendfile_add_bindir) still passed.
>>
>> Could you please help me check how to reproduce this issue?
> Hello Chen,
>
> I'm not sure why you're not seeing this, but the fix is almost
> certainly prefixing the string with r, e.g. making it a raw string.
> Oe-core has had lots of similar fixes recently, e.g.:
>
> https://git.openembedded.org/openembedded-core/commit/?id=24b0ba00d4f0b4d9834f7693ecb6032dfc534a80
>
> Alex

Hi Alex,

The variable setting has no difference than the similar 
UPSTREAM_CHECK_REGEX/GITTAGREGEX.

e.g.,
meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:UPSTREAM_CHECK_REGEX = 
"speexdsp-(?P<pver>\d+(\.\d+)+)\.tar"
meta/recipes-multimedia/speex/speex_1.2.1.bb:UPSTREAM_CHECK_REGEX = 
"speex-(?P<pver>\d+(\.\d+)+)\.tar"
meta/recipes-multimedia/gstreamer/gst-examples_1.28.2.bb:UPSTREAM_CHECK_GITTAGREGEX 
= "^(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)"
meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:UPSTREAM_CHECK_REGEX 
= "libtheora-(?P<pver>\d+(\.\d)+)\.(tar\.gz|tgz)"

In theory, if the UPSTREAM_STABLE_RELEASE_REGEX setting gets a warning, 
settings like above should also get warnings. Or am I missing something?

And in Yocto, we can't set variable like this:
VAR1 = r"abc"
This will result in parsing error.

I'm quite confused about this and any help is quite appreciated.

Regards,
Qi



