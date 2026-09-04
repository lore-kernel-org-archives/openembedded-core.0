Return-Path: <Ghanshyam.BanaitSanjay@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7242AC624DE
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 08:44:05 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9384.1788511444996603261
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Sep 2026 01:44:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=fs3SHYwL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=37078d05f9=ghanshyam.banaitsanjay@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684653Hx575859
	for <openembedded-core@lists.openembedded.org>; Fri, 4 Sep 2026 01:44:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=Wx4OfjTvk7SMp10L5uY4
	zRox4cVrWxNd1NmBpxPVrB8=; b=fs3SHYwLu8jRRPi29PKuR35bL5WdqrybPF/t
	avaPxIfQkLIJuscRG61kWpQUXcl1VKSpjMwajXr4LIP6fRlUcFAK2tO+x2GUIZID
	JgkAT/qAzyjvRyQ92c2XZgfDx72p35oFl/OfhHQ0ZNPMURawDFqYDlldS7X9ynVg
	Yi+3B+sYf7DiEFPZscQdnoYjeVjJ3VmSAbz4cyDsWwa3hYu9mSbgqQ35iU8mpC3C
	kXNszb0uNg+EDC+pLeB+BUnrdnjGWyOH6lPm4uBp97TEY52vDW8Tkk09H4C7nDgj
	yDQlWWwWo95Q6aZ8aXfPGVLsFBpyK37FPuw0jQlmlCMkU96w1A==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020092.outbound.protection.outlook.com [52.101.61.92])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gf5qsj3f6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 01:44:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=orkwjETdQsGYeQtuon6YBH0j0cctJwPxQ6SNwsedIBTQL/m0cDpRUNK1RLGptX0K7wPM3HG5VotLhDhCEoDLvrPdJVLcW3nGuj7w4OoF58wW4ZnD5Oj/peN1LAoxUNhRJjz6sU2GGMoEchiHftEq8+abG8Sk/BV8cnmmOX6PFadvxnKkmE31tYGwSMxZUDS0sZuNF9N/BgDMKJLACYopYLgzxz818FjNSdYvOj1g2rCoJ71h/Bp/X0u8BXmozaIu/CYdwriAQbkDP90KmQKG2UIqt0LyLQHYGYQNrRwPQfWUSwkZ0UvL7dm8/734ilFXcEbKhyTceLwlqMJqGY0Jsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wx4OfjTvk7SMp10L5uY4zRox4cVrWxNd1NmBpxPVrB8=;
 b=TkPmFcA3U07h0AAlZLDUNDjox5KdUTbTAx99CwMvZVXkbXUr8NTA4URKHzfzbd37Op+c1aXz37LdEitXgwNT2VSjFmmayJv6YkTZ92aNFFdpZSfT+ZtKU57F4TQOxLaXx8o5iTC8+UPfoD2p+fJs1wFRqn+gmfD1Mf+CJMAx6vmO7gA7GEJ/6e5gX9PR/iKKNY5/Xw+GAzrkhYN95JnkbeSqlm/A6kt7p5dCC2x9CFLrbL3tGFfiAOa5qiJlAeZApgWACQk2HO15uKrHqBlaluy7R7pDx1LEppxhqsRCX2wNC8pMhICg04wr3LSapV6rkhB4pZC2F4rKyjPzt+j4nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ5PPF57F27BA08.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::82b) by SJ2PR11MB7548.namprd11.prod.outlook.com
 (2603:10b6:a03:4cb::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 08:43:59 +0000
Received: from SJ5PPF57F27BA08.namprd11.prod.outlook.com
 ([fe80::68e:cafc:75a:3e02]) by SJ5PPF57F27BA08.namprd11.prod.outlook.com
 ([fe80::68e:cafc:75a:3e02%8]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 08:43:59 +0000
From: Ghanshyam Banait <Ghanshyam.BanaitSanjay@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] wget: fix CVE-2026-16599
Date: Fri,  4 Sep 2026 14:13:35 +0530
Message-Id: <20260904084335.2264773-1-Ghanshyam.BanaitSanjay@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: TY4P301CA0113.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37e::13) To SJ5PPF57F27BA08.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::82b)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF57F27BA08:EE_|SJ2PR11MB7548:EE_
X-MS-Office365-Filtering-Correlation-Id: ec3afe2f-6cc8-4191-6dbf-08df0a60a99f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|52116014|13003099007|38350700014|56012099006|10067099003|5023799004|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	TYEVT94YpBp+CYW9eIZcMeWte3T6dz5y4UE2GaOLObGyITuyyEjEvTv+I5FHfeMp7FrRwCrL+kTBsDeePkWjikb31nkku9ZMwAptFqWCsPEl7u6PFE2pxp2VQIC6IS0ju8WKo06L/5azl5ECVL5Vx1pVPtlPsDn5lbPgADklw8LgMY7i6jcA83U7DQBa5mByJo9INyn6KLsEh2jRjDCQWWsCD3AfmyQPxqvayU3LqQ0uXF/hkToX0r40CuPCtVo3QWCqG4v4kfpqVgrHZddJ9qY8TGkOe8Dq3qzJjm7KHZ/Y3fJoEParEpkqTDz7dRucWAhPOoS9t9U5wcrVWLmni0vv8Tzpm6U7umP/L38EqnJ81q48VgkMV7uPazS0IxHFlu6CQmPR+N+J7qWS29NNoDMm7o0xBNF8e7rY+yiv4RPI7OFbjBfzIbJf0kO2t3kmmc7QRVMIGzFvAiCIpjSZryYyIEpjBbnwKGpS+C8M1yA7nG0mzFDwptlwJWiObGftKk1+hxZrag1M1yp6g+zQUWPy+MSv1GBSkCIYXI538wtsSWowkxwiLiwrcoKbI4CA7zhBXwOD9zhT7JA9lvQ3oJvwfvh5Nuyt/GnP2+1agtMjugrhe/10Xd6ECdpcmdLKITWVOxTb9ZBrEcbYpl35e8d3b2aZaXx7E0Ysjn0BGu82sCvhr+WD7S6n5lqam0oHkzD6KK+5OqnTiTJ8ybD3SwqXPZsss7gR3aNxTyFss1M=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ5PPF57F27BA08.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(52116014)(13003099007)(38350700014)(56012099006)(10067099003)(5023799004)(11063799006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SjRpWm1pU1BtRjBReW8wQkJYVVBtOFg5VUEwYXJiKzRVMTVIVy96Yjk5c09X?=
 =?utf-8?B?MEl4RDBzRG5pWm03cndxY09vb3ZSMlQ5MVhtMkd5YWFPZDZnZEV2dzlXdEh5?=
 =?utf-8?B?RjcvamRmNXNYYnkwMmd1MTh0cUI1K2crYWlRVGRBY0VJZGQxQ0trZWhHL2lF?=
 =?utf-8?B?ZDZpUGN3a0o1WGZTdUd6a1EzdndjRVlBMnZGMC9mZWdOdE1mMytrSjl5UWxV?=
 =?utf-8?B?ODlJYXhOcFduT3pScFdLUkdkSldpcyt0NWJFdEUrcXFMakt0UG1yNmFTMjZR?=
 =?utf-8?B?NUtCNkhkQWRZVVJ2alJnTGJMdkJnazFmRld0RFRFNmVxVnpTSjdEOFU5YW1Z?=
 =?utf-8?B?TktCWUovc3JOWEZMMEpaU3Z4Rmk0OE9lSFl4LzRzZzA1Y1dtLzdYY2d0Zktv?=
 =?utf-8?B?U1RMd2gxMnhUMWVpVUdDTm1QSzZnSzc5bHFqSjdzL1ppTVFaaGM5bnJMdFBr?=
 =?utf-8?B?YlVGK3VuUjN0Z1VyVnR2N1VncFpDQkcwUjdZNndRYzJKelNkNlk5QjFJRWVL?=
 =?utf-8?B?cHFYWGlVdC9PUjd0Nkd0elJ5c0RRcjgyUTUwdFFJUkVwWnlzSWg4bjg2Zk5Y?=
 =?utf-8?B?M0NHazR5ZmNST25CdWpGMnpXTVRhNDhveVRMaHV5blp2OWRJazNudkFxL0Jt?=
 =?utf-8?B?RDc2YmcrU2FMWmJZdndaY3NIK0twMXMwZ0g0UFpUUHV6YUNEd2RvaW8xdnRO?=
 =?utf-8?B?L2ZTTmZOQ1hlY2ZyLzkvS0JCUjRUNFlZSXJlZS9uRUUvQURiWStmcHdmQitv?=
 =?utf-8?B?TStLbWc1YlA5c1VIbkpnL3liUUFETWZsMjhiZXg5WmlxMXhucUxBb0FaT2Nw?=
 =?utf-8?B?eGlnNE40TlNmNjhXL296ZGcxZHBQc0ZFKzMyNTFWbWxSRzR1cnk3aHZiZWNR?=
 =?utf-8?B?RVRSTitMaHRKTHNZcS8vS2xHbFJkWnlsTjgvL1JuYlBZT0pnRzllaXRxY3VV?=
 =?utf-8?B?TDhWYlNjQ2JUL09BNDVpN2s1cGlpdXhpTy8vUVlrZEJsYTBNK1pkTE1FT05x?=
 =?utf-8?B?SWNqUXIrbGJUOHpxd3VTWk1UVlBMTjdvZ2xjazNJOCtxT0FRZjJiRnFvN00r?=
 =?utf-8?B?Q05qd0twcjZjTi9WOUVjSVVZd0ZOcGVzbTBHaDBhQTMrT2t3VUdzUWVBSnpi?=
 =?utf-8?B?THJsSXdWd1JjUnI0LzF2UDBoOGxhb0UwdDVIbEdnbGE5OXlkWVcwNHhQMDZX?=
 =?utf-8?B?MHh4aTQwYnhiNnB6cGlPb2V6WXQrT0ZLSVBUNDR1NDQxbGROMnBrakVwKzVt?=
 =?utf-8?B?eHlSa3l2djZzb2M5MXlqbmtmZ2kvakN0aVpmQXc3QUpKMXR1R3lvMW81ODFK?=
 =?utf-8?B?SWUrclcycWczK1BhN0tOMjhQalg1MTdyMXBlRlBWRG12eEdyZlZ6UHphdHdS?=
 =?utf-8?B?U0FMeFI4Uy9DMnIrUHFOMUtwVmlVVDFLT050VG9pMjZQR0xmNzZxU1dSK0xv?=
 =?utf-8?B?MlFrMVR4NXErTVlOeGxLMXRIa1g4azVqT3NHZjZPaFFINHRBcUY5aDlaLzNi?=
 =?utf-8?B?UmhNTFJvejhLUkNDckF1MUpVTUMzdDQ1UnUveFNHSCtKQUJGQzdQWE5DQnNU?=
 =?utf-8?B?alFLY2JHVWhMM05EN0ZRWjJnRzZ5OUVTQVBJSEo4eDA1Y1lnNGUvRUhOVWtW?=
 =?utf-8?B?QXoydlA0dWtnSkxkUE4zVW4vSElhaElZdGR1NDZsWkVQTCtGVm5DYVJMOEhU?=
 =?utf-8?B?YXVvS0hJb0NwNGlhUCt4aGY5c255Q0I5MVcraWRJNkdhSnY5eGd0ckFZNXJj?=
 =?utf-8?B?QlVpRmpjL3EyRWFQVExhQzBCUGdaeGRzdjVLc3ZnampBVSswZ1krcjJabWpw?=
 =?utf-8?B?dmk2TUZXMWhpUU9rTm1QdUpGRW1IRytIVkZ3bGJtQWt1OXl5YTJNTUNQWHpy?=
 =?utf-8?B?d1lWQXh3Q0ZrZnlteVF2UkpubzE5SmVGbG9obFRSOTdiQnVZa1BpMFNlTlBL?=
 =?utf-8?B?MGh6TnB6Q0QxUUhXM2I4NkMxUGMrbnpEV29MOE14aVh4UnhYc0hQVHpqVk8w?=
 =?utf-8?B?QUE4M3o3Mk83dWk4NnNXOVdld1NuQlNld3NFMXM0d1N3VndLU2ZERGxFVHJZ?=
 =?utf-8?B?bnQyMVRWKzNZVU9IQ2ZnR3UxRzB0U2F1TkNHdnJocXVWbG4wVnpUbFEyckhp?=
 =?utf-8?B?T2FXS2xEME1EeE5CK2tDeVovZnd3ZmZHSDBhWk1UVXRmYjMzalRMTG41Rm0r?=
 =?utf-8?B?blBHS2pWT29qbWRwVXhQZ1NCSm9sQXNTTkNxK252Y3l2VllyMXN1UXc0cjY1?=
 =?utf-8?B?SjhScXVJRjUrZXgrSDRHSFdBNnJMNjFETVJ2Tkk4L1gxNDg5TFIzRWMxLzNO?=
 =?utf-8?B?dWVUTHpQcWlENFNHRUN0RTdkRGdycDV3ckxHL0RnSVVHSm43clAxaXJqcVB2?=
 =?utf-8?Q?epIc7YMLMzCgL6UgfP2U8iVasBpwt6g28E89i?=
X-Exchange-RoutingPolicyChecked: 
	yaEAmMHhLl+dWfJsqq4Bm0WSg7supS+Ry/mAbBlsjR+wpOyHLwYInmu9/NbMsoqYMeoUtAYMn8LebQvOdmIEerxgsYnVErqUuO+qEpDiE4h4Ku9yzGUfmAkQhkaulBhrgafuqIGJ+tPIc/WeOrK1WuGRGDV+Y52VMtocuB+GAqNzDHj/eXeOTvDRa+6Tu4qgIL1Ehk31W8+HiXqA+Mx8wOu8CVWMKHyv5XPcYPWXwrEkGmP8khg7e6lqlhEDlB1LdVOwXLPk39Xp5KWnfj/0cYQtztRKbsxYN8U/xdIOf8jUjb9H5in4uPj5MkKnm5X/JbRKqp24ccZYIGjQ0k+z5w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec3afe2f-6cc8-4191-6dbf-08df0a60a99f
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF57F27BA08.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 08:43:59.1588
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ysxjv4mAv/99PLuRIRiBVqlr58h53uXh9Xyi5y1mViOienL2WD6R8Nu12NnFl4OKWT6NY4pknL/CvS/hnCWJwqkMYYprhvev6k1tEktd8g4D9Kc6H+3n1AAwCrMktg5F
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7548
X-Proofpoint-ORIG-GUID: m9oPu-VNMxSVLPyUOIKA_Bk-5AIk0tA8
X-Authority-Analysis: v=2.4 cv=AMY1HWas c=1 sm=1 tr=0 ts=6a9a84d4 cx=c_pps
 a=wB9IvHZoU+EKUwdn4J6Xfw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=PYnjg3YJAAAA:8 a=p0WdMEafAAAA:8 a=t7CeM3EgAAAA:8 a=zdLnC9K7CA7n3Skcb2gA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: m9oPu-VNMxSVLPyUOIKA_Bk-5AIk0tA8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA3OSBTYWx0ZWRfX4kZ7wpBl7P/g
 inVtUjKuObh93+Mc5kNl53QjGcieQOP6Cmoaicslbg2nXMvROPLiJF57+QAVVb5l7/r9BNP+qB1
 U1Rg22h7M63+2gaeks6ypEf8qhQzAgLX8D6Jd5MiCFK4tQ9mUEffQ9ftNor2Bb5in+JcNONRPlM
 b4A687dzpP2EKqEJm0So+LeNHLVJisjfEUXAmKvln7MPZboRKNNMuyXz8LtTLnRj5zil3EJLG4/
 kIPVYCUJ++F+fdRmEsoSGRqv84AXFvqnPKfnLi8lQ/eEOhpADi5soi/5C/jmemjIV9Pjprn3S2Y
 sV0ncpNL4YSngSs1DfwfRpSnUg1TyLDKVHM4ihPm02h5BQqLjzfi15Hdlx4zepkl21T1gpMYlkR
 tRq7qRpvly4Vt3bzsYcNm5MXaz//0Xml4qdvsHOvW/zL9GaDZTaO+ooRtfSOYumkpiExtkvqfUN
 D1GEB7MJgEeTeWumtxg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA3OSBTYWx0ZWRfX7J1azMFofmgH
 j8GQO4biOl5Jl8wneLM/iyjZuUJvseJ+FlWeySaZj7PDnxAkUxDxn19RKJxk0maiZubs2PMlz7E
 1iX4y/JfN5G3t1ug6RPgPNQ3R6Z1OSuresOPO+xznIFFsCrJA5T9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040079
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 684653Hx575859
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 08:44:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245073

GNU wget is vulnerable to denial of service in its FTP OPIE/S-KEY authent=
ication functionality.
The server-supplied sequence number from the FTP challenge line is used a=
s an iteration count for
an MD5 key-derivation loop without any upper bound validation. A maliciou=
s FTP server or a network
attacker positioned to intercept FTP traffic can send a crafted OPIE chal=
lenge with a sequence number
near INT_MAX, causing wget to perform up to approximately 2.1 billion MD5=
 computations and suspend for some time.
The --timeout option does not mitigate this because it applies only to ne=
twork I/O, not CPU computation.
This issue was fixed in commit e9697d98e7249b0f68a6be040a4f3dcc5bc101fa

Reference:
https://nvd.nist.gov/vuln/detail/cve-2026-16599

Backport the patch to fix CVE-2026-16599.
https://gitlab.com/gnuwget/wget/-/commit/e9697d98e7249b0f68a6be040a4f3dcc=
5bc101fa

Signed-off-by: Ghanshyam Banait <Ghanshyam.BanaitSanjay@windriver.com>
---
 .../wget/wget/CVE-2026-16599.patch            | 68 +++++++++++++++++++
 meta/recipes-extended/wget/wget_1.25.0.bb     |  1 +
 2 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-16599.patch

diff --git a/meta/recipes-extended/wget/wget/CVE-2026-16599.patch b/meta/=
recipes-extended/wget/wget/CVE-2026-16599.patch
new file mode 100644
index 0000000000..fbe8c0566c
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/CVE-2026-16599.patch
@@ -0,0 +1,68 @@
+From e9697d98e7249b0f68a6be040a4f3dcc5bc101fa Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Tim=3D20R=3DC3=3DBChsen?=3D <tim.ruehsen@gmx.de>
+Date: Sat, 20 Jun 2026 14:39:54 +0200
+Subject: [PATCH] Fix server-controlled unbounded MD5 loop in FTP OPIE
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+* src/ftp-basic.c (ftp_login): Limit the skey sequence to 9999.
+
+Report:
+wget accepts an unbounded server-controlled integer as the iteration
+count for its OPIE/S-KEY MD5 key-derivation loop. No upper bound is
+enforced on the sequence number supplied by the server in the FTP
+challenge line. The value is passed directly to skey_response() as a
+loop counter, causing wget to perform up to ~2.1 billion full MD5
+computations before responding to the authentication challenge.
+
+Reported-by: Micha=C5=82 Majchrowicz and Marcin Wyczechowski
+
+CVE: CVE-2026-16599
+
+Upstream-Status: Backport [https://gitlab.com/gnuwget/wget/-/commit/e969=
7d98e7249b0f68a6be040a4f3dcc5bc101fa]
+
+Signed-off-by: Ghanshyam Banait <Ghanshyam.BanaitSanjay@windriver.com>
+---
+ src/ftp-basic.c | 15 +++++++++++----
+ 1 file changed, 11 insertions(+), 4 deletions(-)
+
+diff --git a/src/ftp-basic.c b/src/ftp-basic.c
+index 0f4bb821..af38a69a 100644
+--- a/src/ftp-basic.c
++++ b/src/ftp-basic.c
+@@ -204,12 +204,11 @@ ftp_login (int csock, const char *acc, const char =
*pass)
+       "331 s/key ",
+       "331 opiekey "
+     };
+-    size_t i;
+     const char *seed =3D NULL;
+=20
+-    for (i =3D 0; i < countof (skey_head); i++)
++    for (size_t i =3D 0; i < countof (skey_head); i++)
+       {
+-        int l =3D strlen (skey_head[i]);
++        size_t l =3D strlen (skey_head[i]);
+         if (0 =3D=3D c_strncasecmp (skey_head[i], respline, l))
+           {
+             seed =3D respline + l;
+@@ -222,7 +221,15 @@ ftp_login (int csock, const char *acc, const char *=
pass)
+=20
+         /* Extract the sequence from SEED.  */
+         for (; c_isdigit (*seed); seed++)
+-          skey_sequence =3D 10 * skey_sequence + *seed - '0';
++          {
++            skey_sequence =3D 10 * skey_sequence + *seed - '0';
++            if (skey_sequence > 9999)
++              {
++                xfree (respline);
++                return FTPLOGREFUSED;
++              }
++          }
++
+         if (*seed =3D=3D ' ')
+           ++seed;
+         else
+--=20
+GitLab
+
diff --git a/meta/recipes-extended/wget/wget_1.25.0.bb b/meta/recipes-ext=
ended/wget/wget_1.25.0.bb
index 990bc386a6..a55b59f590 100644
--- a/meta/recipes-extended/wget/wget_1.25.0.bb
+++ b/meta/recipes-extended/wget/wget_1.25.0.bb
@@ -23,6 +23,7 @@ SRC_URI =3D "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://CVE-2026-58472.patch \
            file://CVE-2026-58472-regression.patch \
            file://CVE-2026-58471.patch \
+           file://CVE-2026-16599.patch \
            "
=20
 SRC_URI[sha256sum] =3D "766e48423e79359ea31e41db9e5c289675947a7fcf2efdce=
db726ac9d0da3784"
--=20
2.40.0


