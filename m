Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB686C64EDE
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:26:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.3693.1649994942098684655
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Apr 2022 20:55:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=SW89unFh;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=110437c6ea=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 23F3rMQx002796
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Apr 2022 03:55:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : to : from : subject : content-type : content-transfer-encoding :
 mime-version; s=PPS06212021;
 bh=wRL7XTV2UG4mb5UrP6/n1l70xS+uw9j6hneFwrIuhRg=;
 b=SW89unFhDfJuOJKIA9nlq+fc5IpqgXV5JH3rCGKXge13q8q5DoVCzTkJWaUQ7bThXnL2
 Mld7r8q+xknrAzyePrREzPYDMWVLdfZMpDVIvULcZWE9H6JhAI2QEnF5S+8k6NZWywls
 Dm8kVJkuAScGe3FMv09C/cIS3vpFs0ThniLMduGe/EWV7FE2QdJo/ry0S8rsqcbcvyW5
 9RI33CAF0B4kYnnXh1bJANcOJ+Vxu8zhCjsJxEoPu5qwL5SYeFgvUn2EFxRi1BQfad6d
 z0rajS5S+v8Zz4mo34UPvOl6v3lGXw/m84596hXcMTZxcLF4tSTK+u1szl2k7Njto0sX 3g==
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fb66evg6p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 03:55:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lrMl2CdIdq2MWihjAL5ZFVUXU3I18sr6mcYwUbOymzuBqQV+SNrIxEDV9TxoatUXzt80ONWSx38cI1SE0JPM96IlHFozYteNAm8i+gCc6+rcjjXjSHuMWBQ9jXPXT9u0Yho6h+p5CJjKhFMc3X6cmNpuOCIIWUjHhEVNKvesqykKgh7+SfClsU+W8fBoMB8pHjVnlBgifwPfb6LSgmYeUrzRfFN8jo7Y5EQcrnAIh67oyvghuuFxdsocURyHlZ4KVLGr5DHVJQnQCmeMnnD598kM12WPE7tev/ro/y9IsZFAa1fy0qbboDMXNELwPwsnSJgXrLGksdp7ghFpz6cmpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wRL7XTV2UG4mb5UrP6/n1l70xS+uw9j6hneFwrIuhRg=;
 b=aYhiI51UfWx2tYM+QZ8I2iFSNqRmV956UI5TGPhNJdyQy1vqv1hZDYjFBb+Mt1dIAIrEUoiSVmGHfAbHb5anEqq3oFwyExqjtNKbtVLA5YVQanS3PzNyFgPxVT56wDmC+H6OURKGK9g3klhx0RiX8srQe2KamrQQThLYYC3Em5QlCSkGSdsniSlOtk0eH//KBshqQuS/MyHwS+42v1mTYWQNPwaEH804tB1PtLC+g3f26iVTGNd/sZSoa08AgT2Ng3SDhJPHcNhkNOfm63oc27bPwAK6oQ2ToNWjbRp0VEmUncQI7xzVDRy7LParl9YeLD3OqV0Izq3lOppVdJrgZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BYAPR11MB2789.namprd11.prod.outlook.com (2603:10b6:a02:cc::11)
 by DM6PR11MB3306.namprd11.prod.outlook.com (2603:10b6:5:5c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Fri, 15 Apr
 2022 03:55:38 +0000
Received: from BYAPR11MB2789.namprd11.prod.outlook.com
 ([fe80::952b:793c:c458:460e]) by BYAPR11MB2789.namprd11.prod.outlook.com
 ([fe80::952b:793c:c458:460e%3]) with mapi id 15.20.5164.020; Fri, 15 Apr 2022
 03:55:38 +0000
Message-ID: <73be0c1d-e8e8-5361-5132-62f2c837205c@windriver.com>
Date: Fri, 15 Apr 2022 11:55:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: oe-core <openembedded-core@lists.openembedded.org>
From: Robert Yang <liezhi.yang@windriver.com>
Subject: License mismatched for libxshmfence_1.3.bb and
 recipeutils-test_1.2.bb
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SL2P216CA0149.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:35::9) To BYAPR11MB2789.namprd11.prod.outlook.com
 (2603:10b6:a02:cc::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ea29eeb-0aa1-4840-bb23-08da1e93cd68
X-MS-TrafficTypeDiagnostic: DM6PR11MB3306:EE_
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB33068E09AC6A1FC7CC8AC530FFEE9@DM6PR11MB3306.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DIQz4wOcIZ5jdUyKbpb3s9swzFGpQCLtCMl+vRLXkJaE9xD7EZQAQ49r5htZ3g/utNM8DxV2UlAkQ35w+zm5+avQVATDGEKNNZDKTZ3ZndtFOtuLbvPWLJ8xDO7Dsstw1zeqne5lJbmEjp/Ir554zM08wOuZOJulAdxFa4XlQ0JY3kLVmuMr1Ve1GuMtVJbVi0zehudrDy0yM/G0zmXnkJRCy/8Vvp4Z7yMIUAyJrhD5ZH/wErgpKIVhPtKscQ0uLpQ6mEfrlMaTqFeOO3vfiK7dy5jl489Fz+WEOcsd+8Z22VZdclN8LeCvFVb3RiiXXojxBjql/d5IQ1GWTrmihiVBwBtwX4EaxU2hFHwvq5FfCHoM9gtYrj2I4nWFpK4Bpjpi9K5fnav1EhjkMlBcEaxJLEn6D4OzszZlchL8sM9p63mr5rbVto5xMhiDzy4eP88KsnTIFzmkYEuuvH+5Zybktrmp4xR5y0+rAIbo7HVHnfcBkjrsntjuYpfomYiBHQ8DnTf2KiHPurmfXfo25zqeFqp2z+JK096wfSs8Pp6BuaLfn+tTjiY1gs0BY3zNlUvxYkuDCy4ZWBt3Qb9dz5sitm+wCeV/Gs79mZAHDrBFyOVRRWjPCdA7g97sAQB/K+a/ZRpp1ahMgtYgjUFYi5ngwE5D1dnFFtghyhIiiTq50jHA2hqKMdyf1UN9RmLrUfqYjbXevmgIpwAINdNh5locUHarZhMvFGg4CQ9TUz2nBaM2/g64je2ygYQn3ndUGkqqwCQ74/Sr1WcQDA7Ne3rGixOQuK6YpUVIebhKyYcE4wbSVb1BC8gUc+QCLeO99A0ODIVmf4Y9uF6BI6mh7ofl0cT+/cQ2mfXrRjn7QFvzG/HcGoCswnNRlmwyKIbH
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2789.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8676002)(36756003)(2616005)(86362001)(6916009)(316002)(6486002)(6666004)(66946007)(26005)(6512007)(8936002)(66476007)(31686004)(66556008)(6506007)(5660300002)(4744005)(508600001)(38100700002)(38350700002)(186003)(31696002)(52116002)(2906002)(2004002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UVpzUzJ4cWdUZk9rZ3lZKzVhQTNrVjE5MWhselhSeHgyRnBSWDJQYi84S3pN?=
 =?utf-8?B?NWFncGloc3hFeThGK2VlMUdhcjk4OHk0V0hXb2NtaTNqTVE1Ym5IUDlvRGN0?=
 =?utf-8?B?emtXbnlmRWZhRCtxdFhqUkExc1cweWZ3M2J5QWpQcjhFWTVJaGpiZEcyUjY0?=
 =?utf-8?B?T01EV2dETEdXL0loRjY1SndxUW44MVJKaGpRSVoxMlo1OXZrNERLN2xGcUY1?=
 =?utf-8?B?NlJSUkZaS2JJUHBGL1Rqc1gxNWY3NG5LSC83dEJaRWtvUTJpT3JYMk16aWxi?=
 =?utf-8?B?U082d2I4U2huL0h2NHU2NWd2Z0V1cVIrNkxtSGtuTnJHVGRjUUxxQ2owejlC?=
 =?utf-8?B?bE9mRHZDMHNqNUZDVVBNT1M3bVZVZTM2MGNkakpHZThGd1VpZ3BqbWhmbk5w?=
 =?utf-8?B?cG5HNEg2elErWm11QmNmZVJQdHJrTlh5L0FwVWRHRTZ3UUkrTEJXaFA2U1Mz?=
 =?utf-8?B?Y29nSXNoSE9WeEJqRGJlTnF4UVh2VW5uKzNyb1h0QVlpSUpIN05QZTdLSjJm?=
 =?utf-8?B?N0EvK0o5Sy9BYWc3SytuZFFFTE5YOUpkMmtTSXlCRmZZQzVtaXo2T3V1VlZk?=
 =?utf-8?B?bWNlMGdYSlRPY1lVRTFYMzE0d1RXL1ByMVhYM2Q0M2JZY3NQbVMxS2JGMi82?=
 =?utf-8?B?M0s2Y0ZHbTVlODBmU3FoVW54RUVJUm82SllpZG1WOHZoTXJuSHlDZzJDakF2?=
 =?utf-8?B?eEFQK2pVM3czWFRJaVZSUEZCR2RXU0dJUC84UlV5MUhybUVXZ04wd2t4Zkg4?=
 =?utf-8?B?ekFoaWx2RE5obXdITktPODVGcmp0Zit1ZVRHT0VaamVwM0V1dmdKd25uc1RH?=
 =?utf-8?B?MGI1R0hBdHpvSnJGTjBidEJMWW1zaEhtek1vY1pQRnR5MWQvS0FydnBGL09t?=
 =?utf-8?B?N0tUbXRadEYranJHOWdYU0dZb2M4NjVuNUJkMHA2aTl1RG1VQU9uc1FkRnVq?=
 =?utf-8?B?V3EyQndjZE5TSjBER2ZNYUQ3OHFKdVY5RnZaMXFFRWw4UUFWZWZDbWtBSG5T?=
 =?utf-8?B?aXdJQzBUK2Y1M3RXdnZya04zMjVjS2c3dkdvNXN5S0ZnOUFUUWxVZFVRZzVp?=
 =?utf-8?B?a1RSY0hzdU1uMmcwVFB6NmNrUUhLOFVwK1d2VkZXMVUvMG9xVHZlb2g0N1dk?=
 =?utf-8?B?cUtGWEl1YlFOZkpTRXlMd1ZyamFVN1prelpBckhqemV5WEhLd2RWVThzSE1r?=
 =?utf-8?B?dEUyMThVQWQwU3pRT29tbDBIUm1tbTJTWmJ6SnZTS2hKQ0tGeXQxTDJibXVF?=
 =?utf-8?B?ZXpXa0RwOFdSNnBpZ3YzaTdQK2hHazlwY2RCWEI4UWwvbmVBY3lJMFBtN1Rp?=
 =?utf-8?B?VlE0SSsrRTViOXRlNm9WeTlzeEp0a05VWm5OMEw0SVJMdUtIMjI1ZWNTd2Jz?=
 =?utf-8?B?S1FWd2ZuRC9kRDBmRHRRZHozRkthQlRiaEN4QUVuSTJWT0hHWksrMTRKSHhx?=
 =?utf-8?B?SWRnR3R1b2I4c1p6Z25PaDRYRmsvWXg5VXlrMCs0THBNemIyUlFFM1NrMkM5?=
 =?utf-8?B?OVlkS1B2NlNmR3lPWVdtQXpWeGxIMXU0dm5rM2x1WGxqMWE3QkpBNHlXOTJR?=
 =?utf-8?B?VU9PN1NMRXlPbWxIUXdRQ2o0bC9MZWlNUnNaK1F0R2lCRnFuUkMrd2VaMGdB?=
 =?utf-8?B?Ny82N2hIUjNpNU5ncjNHQkJ3bVZpa096TyszZzhQcm0rVll3L1E3bUVoRDBV?=
 =?utf-8?B?NTI5VVp2MzlKQVkvVEhhWDZmWGdXTytGajh5NWZZWlZoejFjVmNvblFZWGtY?=
 =?utf-8?B?dnFuS3YzUkRmSEIwZ3YrMEYvQkpLd1d3Si9KT1V2WjNtQi9GY1JhK1pEUTVX?=
 =?utf-8?B?ZFE4anlnS1RUZkczSVoxdWEvVHRFZnJDRlBCY0FKekwxR0VJd0RNMDJpdFZk?=
 =?utf-8?B?eUtRcXp2Um1mSDN0YUt3MWpJQjJmRElkTGFBd1dlcDJRS09iNHpJdnd5SHpn?=
 =?utf-8?B?aHBtejRhRFV6ME9UWjBDUXprSW1FTXpUWXJsUWRKYjY0T25PdVJYVXVmNFhp?=
 =?utf-8?B?R2pPemdOb2RkcXJuS1k3Vzl5UGV1T0VDd21ocVFUL2NLQXY3WTRWNUtCOUlJ?=
 =?utf-8?B?YmFTM1BtNlUxeExWczBFQ1grTDcvc2psamM3VDRGeWxVdXZzWGZsM3hVVUtL?=
 =?utf-8?B?c1hBSUlOMjd5cUcwVUtpZU16NVJLK1BCZE50M29iaC9PS2tMOHpRT2orR0pZ?=
 =?utf-8?B?amN4ZUtOV2NnTzJ4Y3NhVnNuczA3UkZDY1NzZmxjNThmSkRLUjRYRnhPcVNX?=
 =?utf-8?B?Qko2UndZUDc0bkVYeU5vYkgwRTZsdUdyc3hCTmlBQmg3dzJFNTluaUVIcW5F?=
 =?utf-8?B?MEN0bkRlc1VHcTVONXlpTUNTTTE5ZjZGb3hLZzlNeGcrSVVYRFI3VjJTdk0x?=
 =?utf-8?Q?fIpud+m6uam9Nij8=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2ea29eeb-0aa1-4840-bb23-08da1e93cd68
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2789.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2022 03:55:38.4377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 6Do6ElmdapvrvK+ZV4BoBJRgM1hPq8BKRTTYM5ghOaeg+Z3jy4bwFsvKSAWVqEwncFjwqxHy2LyrnXGGotlFEJaMP2CiFW77B6lK56E6AxQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3306
X-Proofpoint-GUID: cGe2cgahoJWu44_krMaJhz-MnHIJuvCv
X-Proofpoint-ORIG-GUID: cGe2cgahoJWu44_krMaJhz-MnHIJuvCv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-15_01,2022-04-14_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011
 suspectscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=563 impostorscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204150022
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:26:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164417


Hello,

The following two recipes use the similar sources, but their LICENSE are different
in the recipe:

meta-selftest/recipes-test/recipeutils/recipeutils-test_1.2.bb
SRC_URI = 
"http://xorg.freedesktop.org/releases/individual/lib/libxshmfence-1.2.tar.bz2"
LICENSE = "Proprietary"

meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb
SRC_URI = "https://www.x.org/releases//individual/lib/libxshmfence-1.3.tar.bz2"
LICENSE = "MIT"

There is a COPYING file inside ibxshmfence-1.2.tar.bz2 and 
libxshmfence-1.3.tar.bz2, they exactly the same:

$ diff libxshmfence-1.2/COPYING libxshmfence-1.3/COPYING

Please check the end for the full contents of COPYING, it's not either MIT or
Proprietary, but should be a free software.

How to fix the LICENSE name, please? Add a license file called libxshmfence? Any 
comments is appreciated.

-- 
Thanks

Robert

