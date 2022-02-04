Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6F44C433F5
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 17:02:14 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.11862.1643994123734065672
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Feb 2022 09:02:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=n1Ks+hAD;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=903448d3ab=saul.wold@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 214GOe1m023764
	for <openembedded-core@lists.openembedded.org>;
 Fri, 4 Feb 2022 09:02:03 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=9BFx9rRXtyWPiA3n6meOoG2VpPlWruYKPk+jmxDuFsQ=;
 b=n1Ks+hADIkyhmTs7ASIGHqFwCGW9gdq7AMgjANfhQ9OVyv0eAYxmao2XsteQ6hlOjfA7
 B0Hirb4zYnPIIdIjnI3ivySK/NkJfQHJy8KW7KLqBmqfUH7FEdIpUnBqtkqRgfA9Bgxu
 IMSl9g6aQCp9C0D1tdqWcOt+8txSw+n8Le0Zi+4TE4J8jn07d1rNIWn9taid9xNsVz9t
 2h3kRGxbPvOjqouXTHVs1ziETD0U/f3IzrcU7D8fDwd7jhssgcpxosIdtANtMB4qi2Gr
 UgRmFmhEaXNS8FuGft6rMGkke9ONIpmoqcrcsEslaXha1omcRuZXibrcTbUZaj8p/IN7 dw==
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3e0jpgguu6-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Feb 2022 09:02:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KRROIx8/rXN5C+gmkCutrXM8DB5xkGWh8LznLYbf4QnLdjGVbSoRKaKyAYQLq1mhF34mvn+rfyTUwsRFNgvRknOIPacAFNaOLL3uSE/clXCMxMZYMEnwHkye4NK/6aDkcSfkFZLDxT5QZxcfxlM8GSwbVnZgtX8ZQgOuNLqLcrTGJKq2sAJQgDhFyKJqstkAdYlfrLQNoq+gWjDhtflzhwUtaMwyev4ftNRDSmAm5r1Xj+FMAzPWLt0d5ca9MH7Bpx5JUR3oFE8AE34ZhOPByo4W785X9JKgkLfE+cvc8ofNJ+dli+uppEw6nzvuPAWISaWPFIys12LSZVaJVH0DWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9BFx9rRXtyWPiA3n6meOoG2VpPlWruYKPk+jmxDuFsQ=;
 b=gRGwufRWwAmBlGlFk6b0GZ2KqL4zWd81Qlq/siNeMrGyWm6UzDhpxZy1ak/CE59eRluXzczYBLOILUMSCrMXxfYuyvT7HvTpCSMJiKxK3yJsOYtQfNsS4xyXIzDFY6yPjvMXd0X3XPf5ioqdhzKbcbpCyJCtNuMFUXrQWnR3q35sQpZW1/Z6eS4EnVILQ1afATW8FA+ryz59m1iYtJN/toTrZmd5dlDDzdvKB1v7q4LQjGvA5r8ONIug1iImvMMdxBVvfRKBRuqVQe8GIWPROFkqjmtSlchWF43H6oFAgyFC8QGiGBJg48Oo+OsQ8tc+CGFs7Hb+75Zgiv3Th+NGCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by CO1PR11MB5042.namprd11.prod.outlook.com (2603:10b6:303:99::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Fri, 4 Feb
 2022 17:02:02 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac%4]) with mapi id 15.20.4951.017; Fri, 4 Feb 2022
 17:02:02 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Saul Wold <saul.wold@windriver.com>
Subject: [PATCH 2/5] imagefeatures: selftest: Change variable to be more
 descriptive
Date: Fri,  4 Feb 2022 09:01:41 -0800
Message-Id: <20220204170144.105536-3-saul.wold@windriver.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220204170144.105536-1-saul.wold@windriver.com>
References: <20220204170144.105536-1-saul.wold@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR04CA0011.namprd04.prod.outlook.com
 (2603:10b6:a03:40::24) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3344f15a-2869-4304-1392-08d9e8001041
X-MS-TrafficTypeDiagnostic: CO1PR11MB5042:EE_
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB5042A3CD75DE3EEE3EDD078EEE299@CO1PR11MB5042.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:334;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aFed3kPkJfj0cdg464yutVpeB8deVdmd6vysJf4FRYhO0zgt3EiHG5u/831egWUnKma+qjYyV1xryRyZgitzthOGByUSqPuamL7StU5bcggejSajxuuW5gEDvYQbncfT/jdthtUFo1Cy4dcI5kujJU1sx7RGxfoyMd5iWPByGKHDy7dr6wt9fVuetBPzME6av3kGATE2db27FDa39cnl2xdyDOAMQA/GfdMxQdeeN6nAM32qBd13X9zyQSaIeXU352McpQJ61bXvbLO9W64UiRzM5mQ9xS2JAhFqWnCb2bf2tPLcCC1PdqGTkeWNoAJbvz6ugCLr36H7OrPid/PTBaVpOQBLAAgLeEJTw5EungvchEIFqHUbfFCnSqDOqwJQjBKYXchUrXcVPK0T8nwh/2uGMflwA/WmDrSmctKgN40VreU/7mttFRkVLZwnUJ0EhAh0aAMcYur2jOj1x3uzad5FE0ZM5pQ3wtOXoEuA/H7zx57wlpr5+fOvLKDeaLHYlIiZLguc76UjQXBH6L0KqXyDMGPq4viVFgVlTKDm2UyH0mQSOfT76T1wVVVhq7nG9R7TNiSQWYU5H481dQs5atJ/GgXFHeCIgOFl8XwE5rqC/ezHq8gqiAPNRIOZmYzo1PX/glsC/3nm/cKi9JyUOvV1fQ7AECIoBqW0IDHH9oAdMlH9icq9vfuO6jiRUslkNZsf3G9af3lsIU8uR04dgw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(8676002)(8936002)(4326008)(66476007)(66556008)(107886003)(66946007)(83380400001)(5660300002)(6512007)(26005)(2616005)(186003)(1076003)(36756003)(52116002)(6666004)(6506007)(508600001)(86362001)(316002)(6916009)(6486002)(44832011)(38350700002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6IAXmxIkaTwl6vXlSuuYhy5K9Z4VY307v05w+84KgAI9o0v4gtFipjeOQx09?=
 =?us-ascii?Q?v/kKXntfyX4z32bDebPCAUcase16IXHFiXH4KZ7HecyWD7n3Hmf1vQNZlDmt?=
 =?us-ascii?Q?QciVGtNurEYl37+lykuHQKUHC8TCF9J7BnWAddLbJYeBXmNw0QEX2s3j5Ojv?=
 =?us-ascii?Q?KIW9LsA9d9ZinGC87v6LhP9CGgxLQGXA9r60SZbATFcIfEPHj3ulhDWui0L5?=
 =?us-ascii?Q?yZRUdh9CPDbPthGUuLDyG3+fOUWUV8YOu+iVf6wylWGFpefet3fLFCFj+gTV?=
 =?us-ascii?Q?KbKDr4AqzacsDAk2jQ+eMEIPa51Y3SzuJJmp9wglym3MdVk8kts4lL0mZlLj?=
 =?us-ascii?Q?8rLhiJ/SNfWiQeUeSgKnpBUMWmKfcUClc/hWrih5dKtsI5BTh7FOUIFjbYJB?=
 =?us-ascii?Q?GDJyg3dgOdilOEpreuJyzoQx7H4xHQO0+B0qywk+E/+rRCOEE9Yp2wwpjKtc?=
 =?us-ascii?Q?YZKK7a0K3TxjCj/XP//JXMFqB9/tLiBfZYneYnAonBFWi295br/GYhNSx4lu?=
 =?us-ascii?Q?qlPgcTp6SaLVxh4FRRkGgPp8ojlJdPpalwGxBUYk+YxeS9gBJGr22vPmhhLg?=
 =?us-ascii?Q?pTDnPmmYLCvsWjrSvL5wE6gMOIk7MbYdcQQSKkUIPvWdxxH0MSpT0tVUsl+F?=
 =?us-ascii?Q?tB7C+l07zli+vH5eXA62dx8Rr3rpi8gxZbWQNpNUdEFJAtLiGSU07v+azYuM?=
 =?us-ascii?Q?S6iLWlKtCvv+ECcFqK1sLo6Fzv+W8RU4FM7CZevImDzoWWYMkE4TlZ3z8BfV?=
 =?us-ascii?Q?3ENYHUJZgpWulVIObcW97HpEyWEDAFCOKi5fVGCoAxdwPcaGAtbyPqFTFsxe?=
 =?us-ascii?Q?TE/LBqupjMIPg/5nYMtO4ZwO5mOrSkR73WpV4asOpkWTqG33ephZhoNVXWIr?=
 =?us-ascii?Q?FufxNGolMMZRIo79hP81LBqVreuAy0Aofu5UN+rM6vYVLKtaXL5X+YBhNeCV?=
 =?us-ascii?Q?rFmeeAb5PUQV9VfHJ0f1a6R71NqN4BVCwYUlYKzM/9U7+UrAiEFNp86j/1+C?=
 =?us-ascii?Q?2vYlJl2HpN0QHTkceaaaCju4EBvHVbKgC8fX4SAJNKSGaQYrjYJqNMIIAGrf?=
 =?us-ascii?Q?OcLED2Hd/B9wQUPKroBPuX1p6Kyu2WgCDcKoglZUcQguNU5Ss1kn+jixsHgh?=
 =?us-ascii?Q?FaVH61v55FTYGggezAhw7vq0KKvT9aN3VbVLz54ArYi3lxw/6Maw6ct50PLD?=
 =?us-ascii?Q?kr6uv3a9ft5jDhoM9aHHPjj8c+04H7MpNcoRY7tFqe/QRepFOsmzhRj52NOl?=
 =?us-ascii?Q?CsXPS6IScixPwmUTwvAWdVlpNpJd3/KjBApc2Rn3826XxG0ht1+s4yeQ6AiW?=
 =?us-ascii?Q?zXDT5j6PVbKCC6/SVpxd0bPRSuKQKpluo3T7qVlQ+4Z6U8Ti0UezSn3xHoSm?=
 =?us-ascii?Q?TIO8cYahFtGZi3PsFzxGETkK/RC5v+GQDe8Y+N12fPvbqQ58W+vkYu9p/aDR?=
 =?us-ascii?Q?MbD0VZJh0E6pg2sFCUGv4u/DBDCk6v2Rl+3neQeFFlBUaFH+Sw4EQF5IHksa?=
 =?us-ascii?Q?1/oghEUhGafJaCE1cM1fE3bSpVoMd1vloSuZTjHJLY90J+ziqFPCjO+C3egB?=
 =?us-ascii?Q?vCZ0AJHUE8WI9l5JpmuBCn/KDMO78bOloWo5XIs6lT9lJJkC5XZUiLOoZoA8?=
 =?us-ascii?Q?suqhLYi/pbS+fLNdHuTN6I8=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3344f15a-2869-4304-1392-08d9e8001041
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 17:02:02.1386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ouIVWtsJRmBIVNdghXTBdouhtq9tnYo2OU410DkE+ixT1qdpesCpKCrqx908WFD9xfJyCwTomW6ll3aMlwyPaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5042
X-Proofpoint-GUID: KX7EbntSrPkWo3P4BnEadbCbAHgPMxYg
X-Proofpoint-ORIG-GUID: KX7EbntSrPkWo3P4BnEadbCbAHgPMxYg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-04_07,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015
 suspectscore=0 phishscore=0 mlxscore=0 malwarescore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202040095
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Feb 2022 17:02:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161372

This changes a couple of variables to be more representive of
their usage.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta/lib/oeqa/selftest/cases/imagefeatures.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/imagefeatures.py b/meta/lib/oeqa/selftest/cases/imagefeatures.py
index 18f37c6d7d9..d36d45c5516 100644
--- a/meta/lib/oeqa/selftest/cases/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
@@ -198,8 +198,8 @@ class ImageFeatures(OESelftestTestCase):
         image_name = 'core-image-minimal'
 
         all_image_types = set(get_bb_var("IMAGE_TYPES", image_name).split())
-        blacklist = set(('container', 'elf', 'f2fs', 'multiubi', 'tar.zst', 'wic.zst'))
-        img_types = all_image_types - blacklist
+        skip_image_types = set(('container', 'elf', 'f2fs', 'multiubi', 'tar.zst', 'wic.zst'))
+        img_types = all_image_types - skip_image_types
 
         config = 'IMAGE_FSTYPES += "%s"\n'\
                  'MKUBIFS_ARGS ?= "-m 2048 -e 129024 -c 2047"\n'\
@@ -245,8 +245,8 @@ VIRTUAL-RUNTIME_base-utils = "packagegroup-core-base-utils"
 VIRTUAL-RUNTIME_base-utils-hwclock = "util-linux-hwclock"
 VIRTUAL-RUNTIME_base-utils-syslog = ""
 
-# Blacklist busybox
-PNBLACKLIST[busybox] = "Don't build this"
+# Skip busybox
+SKIP_RECIPE[busybox] = "Don't build this"
 """
         self.write_config(config)
 
-- 
2.31.1


