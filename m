Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27A40C433F5
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 01:31:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.5829.1635298271668820126
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 18:31:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=X4Z7SrCC;
 spf=pass (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=5934f1ba75=saul.wold@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19R1BXo0023776
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 01:31:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=1Tsq1krgJ06a2j1W5TWMBPzMGQod0cxHhJji+yOJmHA=;
 b=X4Z7SrCCXuI2lN/xtglqq0tcYCAd2unA/Lsbcg8uLRtg08gSa6pfHj9d1cEH5SxGNboJ
 IGLnul1u4bl1oM0pk5Tblzlrdly3yU6uWqb8QwpQ8UCTH5MaWBGaG51WxBBv0sBImv4Z
 NXNclDfEadyPQQ8JBoskKOHitsbn1w9T6feWMfHd6Zm7PsgYAuAkOLmo94ZXvKMAAwno
 HAWB8CvQIe58ozLmG0GebRWVBfkuBQHnZKny1G9xYSey9Yy6QOCcRt3yWSsQ8sWpI7pK
 TGKW5vxHX4o0Y2TQ0NL5gqbKFhxBvvoN4ROxlqcMTQYM3f8I8SXNYQS37uvpy2ieASeO yQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bx4egs3k0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 01:31:10 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19R1VADu023445
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 01:31:10 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2109.outbound.protection.outlook.com [104.47.70.109])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bx4egs3jx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Oct 2021 01:31:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gwy97vBl/hWVvF8b7PyO0gcyFnqadwrdccXcGyS2C1MZxDGW+qx7ZZOTUcn7V2DShFpklqZ0QE+v+IL9tsPBrfYuT0JIZ769Uk0dyiFJPy/T/RS2bpDXisChxLqg456BWUXZHD6Pyr2tLDCppUU9ZZPFyuenLvobFYh8NJfm9h/FQDpFwzTcac2MLhX8Tw05OejWGgaMbm1thyiEw3bMqLeyfqGeZa/ZYymrK+aBO7tHC/hpK7O1eOvKtZPxly3M9Me5IZsGJNNVIPselnAFmOjhzmcEUKM4Cmc19m5A8MQz2FeSMAlnR1zbY85c5acarTQQvnF+gH4uPhSROfs7qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Tsq1krgJ06a2j1W5TWMBPzMGQod0cxHhJji+yOJmHA=;
 b=VUQYPLLYhmeRz6KrJDnTAmgNUoqD60Cbu4rRVBSpypDtIL93nf/r1wgcxWis2BjTQs0YcD4aJKUwpbY2+KmLnHFa0R8rvd1lGslJUkiZQ6G9ivwffR+i6gAlUS6EDrZMmtseCqTSFC0FhJxvGs6mz1JJCWyIgPcQZzIdLcs1FSfnCuRU0nib5mzq+vP/kA8kTNOqbeOezaWRHAW4zVblal+uCjnktg6Oo8yED8pfNbQOuFevlqshKURv4k1xGz4iiH7eGlam/fQHzb+bNSbB6oHELsckeyv0jyKYqr6567Ezg2GDyphA7TJ7MrhNQv+O1UA2uLb+q/Fx+uzTLQEwng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by CO1PR11MB5027.namprd11.prod.outlook.com (2603:10b6:303:9d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Wed, 27 Oct
 2021 01:31:09 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::61b9:f111:c64:3c74]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::61b9:f111:c64:3c74%8]) with mapi id 15.20.4628.020; Wed, 27 Oct 2021
 01:31:08 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org, jpewhacker@gmail.com
Cc: Saul Wold <saul.wold@windriver.com>
Subject: [PATCH v2 3/3] create-spdx: cross recipes are native also
Date: Tue, 26 Oct 2021 18:30:50 -0700
Message-Id: <20211027013050.137364-4-saul.wold@windriver.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211027013050.137364-1-saul.wold@windriver.com>
References: <20211027013050.137364-1-saul.wold@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0044.namprd08.prod.outlook.com
 (2603:10b6:a03:117::21) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 BYAPR08CA0044.namprd08.prod.outlook.com (2603:10b6:a03:117::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16 via Frontend
 Transport; Wed, 27 Oct 2021 01:31:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56d28389-289e-494f-375c-08d998e973c0
X-MS-TrafficTypeDiagnostic: CO1PR11MB5027:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB50273F9A691BFA20D089592FEE859@CO1PR11MB5027.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HHS2XQQ5HlUxkVMZ4IMwunrkl7l/kRYuc5Dvq2qL2hbonD+xdQD7GolLEU1OkDZoH69g69mpqJSJgndqKrNEKyU5Y+zM+OGTndI7j9YGLeQQnGx7ZUn7bO77SeyCdQ7++JWZiySKNTQaypDqCI2NNW60AxNF7WoxSLZ0X6dvj2vw1DI+D46FIy1LZ5JIeLJmtxIa8wdGxGhhpOgo65qsw9bhSNhWlcBbXZDPsjJyW9x+cFtBmMAtIcOugaT0dhJ/grbXGS7lKVkQh4dLm5HDxN0w81XIq4Pj2TzwMXqSHkhRBpxnOOkwQlnYzO67EtkLDbcUi2RhHoQFxq/s21q9g3w3mC9byP1kluBDEozqgNvVH2Fp7D5xZvafSTTHETIzOJRIA5qjA1uSzPKvWZB9/2FsQfyT8aq66FkiXajRtQLWiAcM6Zps0tYp01THyDdXiHTbO8ibU0pUV6SFXIg16BW3xOq3YqIhpdl9HfCQ/4ApwiMwgAMnQf11Ya07ZXDMuhmWKc3EcSEJS1oA+XRzT9Mg4Mvj3VWm4kqxrRU4mOfAq3BnKHBJtJ6bgM/6xwHP6rohVYa+zzr7P4gPUuZHdPyMxng/zEJhvxOCACNrhLOwAItS6HLxmmxLmKOIh8ouITKZTbEr+scjWa8sUJApRTt3aJHfbO4uyZ0lAcYGbo7fQziUrg5r9GzBq4DzniBmb+qFArAL8vEA6KXTABSSEg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66556008)(36756003)(66476007)(66946007)(6512007)(186003)(1076003)(316002)(2906002)(83380400001)(107886003)(26005)(2616005)(86362001)(8936002)(6506007)(4326008)(956004)(5660300002)(6486002)(508600001)(6666004)(38100700002)(8676002)(38350700002)(52116002)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?t1ixWGyNFYRvuKeXY+U2xON88adQoPZN9zMb+SFlEuuPGhyRxpmUTS0iRfqm?=
 =?us-ascii?Q?Og08p1LyvW7dIZcmIYeuKXAMMCFDHnz1fh4OTha1XgdK3HHetCtIuHBH983r?=
 =?us-ascii?Q?FNCqHelcJ4yKgU9SzMUHDG7w/4e2AZEHVKKm8gNIYp0wQ1vBtPW4LeQ+Jri1?=
 =?us-ascii?Q?FSMQtMarrbxiblKqXVlZVqrGFHce9A9KtJEeg4/6qQuosLratuCMoICYQk/x?=
 =?us-ascii?Q?871ksTk8YrH31eXUMW0rcFZLY4UBh5/R0w54wfwk98pDPt0kfBkxJg6jCi1B?=
 =?us-ascii?Q?9H8EKcyZaGFn1YoS8BBeKgSiWftsJIbKrrayiMiZ70fZ6Ww05uP9CRIQZv8F?=
 =?us-ascii?Q?gZk8xUV+MiB37Btefk1JCNxSXZYYUNxZn54LG+29JDbBn8IAoOQRV87EyXMN?=
 =?us-ascii?Q?vmz2OrflLmoLTEkAYPsEsZwdrHqOGV5fDrohRYKT8XmJmRYdnkNQRmhTLc5j?=
 =?us-ascii?Q?5uYF2Uh7ArdlRQw4HzVlzGisJwySnDJlqNd1WbCN5x6rZCcHyvXL9Lbn2QOw?=
 =?us-ascii?Q?4zUSjfNpg+0zoVeQx29QvhB7ll2o0PI+LcJ3l1HS1VipO4bhWmhYTi/BqEhG?=
 =?us-ascii?Q?+REsedd0Ey9mFP6GdsW9gD+Xd3/CTrO9/A/2YcQLy1/YlYnJEt/PXBxK3p3O?=
 =?us-ascii?Q?oahysNlI6w2LV6WYRoPj8gZMHrt/sO/cF2H21EUL7SzWV8AC0GEVggZejkxn?=
 =?us-ascii?Q?2RSK05vAF62dcx3tIm4sglToKpk5zE+VqWQVVpIpsMV0p57DDmPapvpzbkya?=
 =?us-ascii?Q?T64LULFkzbFRM4scjCvKct2r4WhVmQRtLD6beTQ7eQVc4R+seWYpBKOXAIZ2?=
 =?us-ascii?Q?DQQkmaj9SUHXXWGHqUxAebssvzT9n9X8GcXoa+iQU5vJEh4cULl0LYjivtK6?=
 =?us-ascii?Q?UptBuR1Ae91gfBlwttK4T8sCsAVz5a/U1VMGc0gSGOd1zaAyVHiZcZSFiRGC?=
 =?us-ascii?Q?BPFAkYI5/OSMLjs/77A1HS2jXJZWP2ZU6pidiO1WYLinZWsCRZFOZ+ANAbt0?=
 =?us-ascii?Q?651KfdOcfWloitcJzGNesyOcUTfvsxqr94XGWl+tygTcvN3y9ZTahThCsKBE?=
 =?us-ascii?Q?P4XVgtuyqb2ERmJ7e0Km9LZW5ytFZJeZ5niG3im4Ie01wbHhpiHe1Ryk5kfX?=
 =?us-ascii?Q?bJgWWRYqhjTnlsIpXbzm6264saiKLOMXoQt7G1ZEzcyapY65hXR10mxFaPC4?=
 =?us-ascii?Q?AhFNeYvuefSxcnLxf17L8g49Dk6FByxa6IH2WNqWtdDOIG4lWDWZSv+q8CBN?=
 =?us-ascii?Q?/uSbqVSTeZM/o2ejDWzbTSXn9ibDGdQDeU+VBpeBbjUWdg54HKVyFI/LwXmj?=
 =?us-ascii?Q?GRjhJ+BgLhE9jVqiJ7qpX3aJTEEVnnuSFN2sT8tqzHmhyiuDRnSiJR5lrEBH?=
 =?us-ascii?Q?A1YTAGhTtAVo6k34OK2pIWUpG+w7pgyhaeTZ8Nb9gYSIxfHTnH9XwEtZAl24?=
 =?us-ascii?Q?ZsQo7nm3bedrdXw8+7VNLN1gtVuT3xRHRvidbI8x0uOpqbJgBfzVyJQiV6ZB?=
 =?us-ascii?Q?7uGZkWOVE0HQzLKXPSWUWAFTe9SWet40Qk4A1Al+mKHi+d/Zn89UuF8IAhox?=
 =?us-ascii?Q?G6tfseP4e9Q2QdoD6YunGTIuBWMzb8ZyL5jjCJzypYjBZHTqinJMW9i2SPMS?=
 =?us-ascii?Q?sQDN3B4HRQb+p0XjcERgK+I=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 56d28389-289e-494f-375c-08d998e973c0
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2021 01:31:08.7778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Bj8+fGMMXwZ2XsFZ3jwAbPsGTMflT4SsTGZLA9skb9eAusPw52D7UpPqB7RaWchget1obnvJOPe723oGsCxUaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5027
X-Proofpoint-GUID: t2RT_U2wwQqM1eb-zv5Hrttdlli00BP_
X-Proofpoint-ORIG-GUID: 1aZixCa1NZ7SzTn1tfxq6tg8BLKh88h4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-26_07,2021-10-26_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=875 suspectscore=0 clxscore=1015 phishscore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2110270006
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 01:31:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157467

Recipes that inherit cross should also be categorized as isNative

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 classes/create-spdx.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/classes/create-spdx.bbclass b/classes/create-spdx.bbclass
index 72a9b55..e8f476f 100644
--- a/classes/create-spdx.bbclass
+++ b/classes/create-spdx.bbclass
@@ -418,7 +418,7 @@ python do_create_spdx() {
     recipe.name = d.getVar("PN")
     recipe.versionInfo = d.getVar("PV")
     recipe.SPDXID = oe.sbom.get_recipe_spdxid(d)
-    if bb.data.inherits_class("native", d):
+    if bb.data.inherits_class("native", d) or bb.data.inherits_class("cross", d):
         recipe.annotations.append(create_annotation(d, "isNative"))
 
     for s in d.getVar('SRC_URI').split():
@@ -610,7 +610,7 @@ python do_create_runtime_spdx() {
 
     deploy_dir_spdx = Path(d.getVar("DEPLOY_DIR_SPDX"))
     spdx_deploy = Path(d.getVar("SPDXRUNTIMEDEPLOY"))
-    is_native = bb.data.inherits_class("native", d)
+    is_native = bb.data.inherits_class("native", d) or bb.data.inherits_class("cross", d)
 
     creation_time = datetime.now(tz=timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
 
-- 
2.31.1


