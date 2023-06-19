Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EF95EB64DB
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 04:36:21 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.1181.1687149375831366082
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Jun 2023 21:36:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=kDKjCpPz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=55343858d1=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35J40fA0016441
	for <openembedded-core@lists.openembedded.org>; Sun, 18 Jun 2023 21:36:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=u+6tn3tV6S339YT1nhO39A2xRxE7B9PEoiz7fecfSO4=;
 b=kDKjCpPzwr1kvvatDI5fvGQpUsgf+q04iur5Q54btt3W6n9VLRk0QnFKxuKo905bq0+T
 wuLo+e1TVpbavDkYtqSXib/0fj76u8dKcSKNwpHmxwyX+gvusLtgmeFaYEk61+T8xK48
 RHO9aN4TSTGt2olfc4hXOoyLOJEOZSFSeIPTOKiPeAUWC0qFhnkC1MVdn3rDn1t0XP5Y
 qzlJV9SGcO+IczGR25FAhwAIGZvgO87kr93fL8VhfMSVStmCNnTZqZEJw+YckWBdJswD
 zj4iUOZ7pNPW1ERlDe1kh4F3wMcPukjsHJLV9zvBjrc9qcRt32VvfoEy+uSByuJYn7cR Eg== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2109.outbound.protection.outlook.com [104.47.58.109])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r9cbhs0ph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 18 Jun 2023 21:36:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZL3qbrT3in6nGjcvF1qkyfBW8nXgE38rcElbjQ7V/rF07aHZqTcHrLQYHqRlA2JahE+fy2e9+ujwkSi/P+MV4HRqG2teRrOsw4P6iYqFgZxiVsnj1gADbRRGLpvJu8sxeSgbhNOtp9yR9LXCeqVoW7H6RLT+vQ9mJ+RRatjhzpEO2Cs69LGWy8UPblRkZkCVLUCZp5I+h+cJ3576gSdAfJpQc6aVi9KRv590KG2zvDhGM6SmVuM1zmbMDbBISxeLMK6RAsLn7H8kQPbo8jkHlUZ49M1/V8FXwxWtVkvL71kZkdIolQjmD/J1k/LIh6ZczOROajeYu7wtrsZ6cp9R7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u+6tn3tV6S339YT1nhO39A2xRxE7B9PEoiz7fecfSO4=;
 b=W4fyopOEaTus04qZReaTXf9isrpTvBoMuoV9wshGQ9DG92FPqmCeHRZoi1FJIC9L7SvKx57M2g7/FEGYyC9dWfMsNX5KGDFzatYQI+eMgTl8Z7iHmc/Piov+Ze9elUhxtJnYWTfBqVNnTGrKT8Ak+yXK/CvmuEcbXCPclKLyEMTkUFbHTERAcR93kjZWW7vQLBvNlp+dyBKM1uZOcUILEPJJfZaQFLQvsvf4mme0zYjlRdKRzImz3T8Ss4a9FSK/NGHxMIXwfM3lDxuC6fBHtXvi60nimwUqLad5ikhVKa1xIYsSJ7B38gjl0wpU2vVHNvEHL+Jfvm/ydskP2mJjSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH0PR11MB4984.namprd11.prod.outlook.com (2603:10b6:510:34::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Mon, 19 Jun
 2023 04:36:12 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::b504:c7a0:9ce8:6f17]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::b504:c7a0:9ce8:6f17%3]) with mapi id 15.20.6500.036; Mon, 19 Jun 2023
 04:36:12 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/4] zip: remove unnecessary LARGE_FILE_SUPPORT CLFAGS
Date: Mon, 19 Jun 2023 12:35:54 +0800
Message-Id: <20230619043556.3432048-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230619043556.3432048-1-Qi.Chen@windriver.com>
References: <20230619043556.3432048-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0005.jpnprd01.prod.outlook.com (2603:1096:405::17)
 To CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH0PR11MB4984:EE_
X-MS-Office365-Filtering-Correlation-Id: 62a48e8d-820f-4565-12d9-08db707eb5b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6bsOC6jOP/qwy1LUsR/zwy/4MKrm+Xwyo2E/k3TjjFvnea91BtGPnRVc6MpiiNMpSUuV9V9dFU2+qy6lhKE8fqaq++lScXNRM+HRQCNflDRJmJJSAH1T5HasfY8TaB4e+vjug2uBrq+/XoA/sO5FgEhOHUnDGHBdZ+Wg9Gudz2r1ngGhK1Sn42I9ELpIXskBq6sf2d/LoHfGFCJOBiIVQtId3o3PR3g4wpxy/QVQw3rPTQUGcDpcK6hCzvItu8vLOJyhK9yYx7BuKgJuo3+G/FWsGIOJqzPUcA5R/jLpYsOY5KT5G0DXoKhdfOA7ed/ppJxX2vs8WnXyubpakyS6sg0bmSRad0VYv9NO3qlzDIuwpmTQUE9YG4Yjgbvf0tlfPVBIZcP2Xh3gRMiftsOnXGZH9wRxVVgtSpPcdxnKoLqs9Doc4ZOCpOUqGtWF0z6zKXJtmvcuQG3OleQilguQa0Nkl3GmGINfc8I96E/hc4hqC5PE/DXm5A7iXrNDf7G+IHLrI9/u2kgSmaXyY4UwYqMdqZ2bk5pCWv7wxc/rQu5+i2qM6hVZFdATHp3tqqMP1yXSSViFbfpHM9hzgj58T5zP1ZUh+f6tf0GLglf9S+1SBZe1KCeKLY47gmdun7Mw
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39840400004)(366004)(396003)(136003)(376002)(451199021)(186003)(6512007)(26005)(9686003)(1076003)(6506007)(2616005)(83380400001)(38350700002)(38100700002)(478600001)(41300700001)(66556008)(66476007)(6916009)(66946007)(36756003)(8676002)(316002)(8936002)(4744005)(52116002)(6486002)(86362001)(6666004)(2906002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TuQTObwAH6K+CNYZvyCDRzA/ItnoENmLOXFQ0rFaai0jHi5+ZixfnQoeRgsL?=
 =?us-ascii?Q?9gfjiyOAMhzI1vWyDoCoRsnqGr6raBugJYBSU/D6RqYoe1x7P4tufa6m5Qo/?=
 =?us-ascii?Q?SHQ03ulo4hmqUOV/Xp0E3yyYHGWhZpeMt77c0BJWPy6hgN0m0Xs3NiE/X4tw?=
 =?us-ascii?Q?YpFHkHuRKNGu19oSIPWsuSW24/MVQQBF/XSvwV32LLd9M/03qL3bUMD79K+q?=
 =?us-ascii?Q?1mUWhA0VK872rJm4lOk8Kvd1GBn6+h2H7g/91ORn3Zks8RUigFk+nPx+46v/?=
 =?us-ascii?Q?FrnI36x+YRRc1YVNLrXXuuZkzpc0SBn1CX4P5rpn/JTKtEqJAGukS0MpTAdm?=
 =?us-ascii?Q?6pabwt07PbEq/R5yeI0oTGDSGJLns41c7vmdLRXaQuMBy9LDU882I9LLdcwx?=
 =?us-ascii?Q?ipUf81PaotVQ3umKL3rKI6Qigg5i+Oy/ZG1SGyjBQykELMg7mMCpYv7QO1AV?=
 =?us-ascii?Q?9yuoEGShzXCLKurQCgdmRF3uCYzEE8GdeGibPrU12xdNsFOB5gJAKxdgcsxI?=
 =?us-ascii?Q?nGO2Sx+MVRrdD0rfOsri76snLeQRsWO1f5p2RonBMwkumSj+ig5Z4ZWVi0Ca?=
 =?us-ascii?Q?Q41Mv4aPa2Hr5FF1LD6SZ8WJkidMcNXJjxwq5kv6vybFa30fSBwO/kQ2sW9i?=
 =?us-ascii?Q?TXtI2hNrWSwH/6jqVGFKAuoyAWg1U/lcSMBWA/LlwNaZlUhYS7h3CPbp42cN?=
 =?us-ascii?Q?8ZefdAnqrfcb2VZA9wU5+X7rl9K8k5qdtD04TQKZsfTcCMANPb6e8l1pH80D?=
 =?us-ascii?Q?UQLwhT7/H26BlCOyC4cRVjkMime4nmTCleELP/575h6R+m38uRrNEkr7z6aK?=
 =?us-ascii?Q?FY17PhasqgfdDDeyExUsDDF6Jyqh/Z6DNDonPij9I0BAbmQ/F8r0WgiYV9DX?=
 =?us-ascii?Q?/zkpNKK4jq5X8MhnBwi+nNJjgNiBgBZIsuydTcuWd2zZxUC5aUzKpDgWCUeu?=
 =?us-ascii?Q?VDcOH8rhxxFJfGgsoRM+Qlu/lzjW4eiH6VVJrv2Z+s7APS+cYWi9hgpjzbXF?=
 =?us-ascii?Q?iGIGzQKIrvZTf95mRPsq2mnYz9DiBR0lOOIluXU+SzY6bLgJF3JvF2QtB4ca?=
 =?us-ascii?Q?TZQ5jokR5BdBbI1PvedAT0xTFEWH8FDYpR2lD3S/oBoeLFS4qsvp4gddfDb1?=
 =?us-ascii?Q?uts2+YoHO+DftffKGzqYhUw6wxvmSUxcaQ/WhpTAA5owuFVJcRGUKIzvSKkH?=
 =?us-ascii?Q?CjwvJ1WyY9DJmiA8eL0I4xmUSkuMrO5cQVUYYBQrfUXuD4zRf+BEedrr3pe+?=
 =?us-ascii?Q?XzYen4KwXvEJTJrZiWIDyJf9QIf9JI0kdL0M8LnsfQ+OEIat2YrSBrVuUtZ3?=
 =?us-ascii?Q?QXmutejVnbpHfKtbXccO70gr6MLCzKxWJ78/vYu7+6o857Awgn430fFvzxVt?=
 =?us-ascii?Q?IXdSSSCuMRVzBK4pTbMxHA1I4y5KEOXu9F0TKcEc6kgmZvnVC3T9R9IHumJN?=
 =?us-ascii?Q?u9J/J8s+JAd560Ey4kjPKTqbfy7LNkrwiKlo+rf1jScFBh5MG2fspheF4P7W?=
 =?us-ascii?Q?tdetBvce2OwADgpFrlGfh23Ck0Kyvpa3q8ZBre4cqCw90AMVMTayuRzSsM1h?=
 =?us-ascii?Q?iXy2apc6IKw0duXZ4lYnTJ0JZOFcNPP6de3IDjdB?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62a48e8d-820f-4565-12d9-08db707eb5b6
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 04:36:12.2362
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zuF4nHmN554TFgYJrrkOYheg/m7MCH63xAZMveOklLYul2t9jiYDij5dgyBOOpCuem/jRiaW6SZY1U0AxU1KEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4984
X-Proofpoint-ORIG-GUID: ZAPrEw8kvTmnsMrItYuDaLYa6pmHbyry
X-Proofpoint-GUID: ZAPrEw8kvTmnsMrItYuDaLYa6pmHbyry
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-19_02,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=956 suspectscore=0 phishscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306190041
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 04:36:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183086

From: Chen Qi <Qi.Chen@windriver.com>

As the zip's configure has been updated to use compile-time
check, it now can do the check correctly, thus no need to
pass LARGE_FILE_SUPPORT to CFLAGS.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/zip/zip_3.0.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-extended/zip/zip_3.0.bb b/meta/recipes-extended/zip/zip_3.0.bb
index 802877285f..82153131b4 100644
--- a/meta/recipes-extended/zip/zip_3.0.bb
+++ b/meta/recipes-extended/zip/zip_3.0.bb
@@ -32,9 +32,6 @@ CVE_CHECK_IGNORE += "CVE-2018-13410"
 # Not for zip but for smart contract implementation for it
 CVE_CHECK_IGNORE += "CVE-2018-13684"
 
-# Enable largefile support
-CFLAGS += "-DLARGE_FILE_SUPPORT"
-
 # zip.inc sets CFLAGS, but what Makefile actually uses is
 # CFLAGS_NOOPT.  It will also force -O3 optimization, overriding
 # whatever we set.
-- 
2.34.1


