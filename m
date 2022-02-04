Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2BDEC4332F
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 17:02:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.11863.1643994124119177481
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Feb 2022 09:02:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=fw7iI/fQ;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=903448d3ab=saul.wold@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 214GOe1n023764
	for <openembedded-core@lists.openembedded.org>;
 Fri, 4 Feb 2022 09:02:04 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=+FVBBW7FaOyc1X1CTY5uT8QYVObifBfykhLdy/PEqlA=;
 b=fw7iI/fQ3jS26x7pZKMUoFYinbbzq3Uv+kmnMYrUa4BdPiVWz8oq+1SL+NCtLMGCDSdE
 tjK24HdTZkpLUOdlqVfGvPiKs1RYpYEbtmBHNjUOC9Aqkejk4TZG8ePfhw2IViMrfdyF
 rBrUWCXbekLxgnavMVNcZFsNryUi5cHIikY3tr/nC1efMzrHUosaTqYryM0C5RLpXHbE
 BoYfJqfSsputWlpTljl7COlG44cVIdxTodG3Ukn+EC/U+0A2C1lZnKjZV821KvKa1m//
 UOlrijwgE41JzhOsUusFuxZhNWv2PCZH01VfzpRAnt5e1BgkXvBrUCVfoPcZ6hhq+VzI EA==
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3e0jpgguu6-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Feb 2022 09:02:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i+rscWV2UPqTTl4LrImgWiCde9gjeN+O0zpQrNztPVzeyJo4VztWrP5rOp6P0ezo599sORPpV7al2GhaVq9k6x2neruOl06uctmK9gDurq7lAahP2BjRV9kQqqWuN0Mg0Pa4DwuX8DwBGEUPhjtHSXuFr4tQCBKd3ctwjVKUiu3KegNNvOBryKNkq/mb4/xz41n3J08bWfNMvNTd3AGXX2ciKFO202CUBuz3YP/+l49yVtUykoAXcl3qoJKnNy3MDA47VZQhVIoC2V05H88YcLpxwxy5wx/qNHHT6aYDGhMFps8irSjZGT9gQMWIXO3PItxIrXqOtGfBvhmmFJPBFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+FVBBW7FaOyc1X1CTY5uT8QYVObifBfykhLdy/PEqlA=;
 b=OspKmr5rVAEWdlyuhCA6L1dEh/MfH2TFBpq7lZx9AgipR6NyFkv9nZhJxLWtj0LZ8gyX1RWIgTudOzA+yLxcpAgGuRCcGjtF3kYdC3t/7OgCrpe4ytrt2dOzvoCDzfeIhb62PsxWTNZbJBQKCEZX5+pYI0458QJ7ew2HstCr13gFwHQnG8mhmPhO68Q0yw7inpDVKME8byadYXDjtxA1uUOc1wxqKs77OL92LsqkMXvUCM1vvJhnJoCrPuZG68kiH0bcpHRvKxwXf81ZOOuiTCa9njHRTVA2tHQvSdwKO/SRLnZuctjwn7l9FvJchokET9FXOMLblLr+D9q+3E0MXA==
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
Subject: [PATCH 3/5] multilib:  Use renamed SKIP_RECIPE varFlag
Date: Fri,  4 Feb 2022 09:01:42 -0800
Message-Id: <20220204170144.105536-4-saul.wold@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 681c08e0-4d19-4633-ab8a-08d9e800107c
X-MS-TrafficTypeDiagnostic: CO1PR11MB5042:EE_
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB5042CA27D7AA22BC547B1E18EE299@CO1PR11MB5042.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	19GegdyFzsEyp4YVtrjFyeFrd1TR+Vuj//34td/sMrGySU6Mg4Z7cyDtz5JH9QwYwkzbWAUMgt3l1uauKbeVOG+JNXtXTej0XL5srzuWl1NqTqTybvau5Ka+CyL2j9+NQPM5BemZ4pPztE24tBoZESSQbaVa47yM9ZrdFM5+Pn4GkYjiOwpjoQn0kjhBvydUO61qxnc7rzD+kfeOKGWzZpZea9DtRaSg7HmIGVc+Q+eJj6H+wuw+u7GCrR67BOgH1hnUFJp5ugO8yqJ5gPOj9De+GCLlMjbl+2n7rD9wwFlS6bomzPB9jLOo3K0HtuyIA9ylFW2N57c1V0TsukSJyaW8KrDpjZP4VUYjTBSIZunFidwIsqW6SlDrE13Ymo+CxWezJug+EN9GAxq/5icpfrpi7SCpK16BfidjvOcOy79q00Na/I+jsELIUTVSlp0ntx5DpJHt/nDiJrg1kKDna3uIvp2fulv6M+NhrJ4KN+I0a2YY9LGwnZjXVW8cia3cT+9+d0FFx3crRW6f6MdNdeZrGfvl27q3Qg/VxRMq6qrDZSGaqpunvkEQBz/AG7RRLw8IKo2hIJYDBM+ulB4zn+kVP42pDSRiupnlQfs4N6D2uBGgZJczWcnVkRiwkmC64fxT+qPEEKMBgBycnWf88YZezb5nbCkZM1/R90APUdB+6LWZRMm5/yC7fS76+ZsDQ3qLeK5FlY2k2ZIS382olQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(8676002)(8936002)(4326008)(66476007)(66556008)(107886003)(66946007)(83380400001)(5660300002)(6512007)(26005)(2616005)(186003)(1076003)(36756003)(52116002)(6666004)(6506007)(508600001)(86362001)(316002)(6916009)(6486002)(44832011)(38350700002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xFmAse6Oxpz3i19ZNgYE5hYvw8ew3IhUcKDw6CkrSeWkBQ6MmgjQibP760xS?=
 =?us-ascii?Q?3jUF4J+FzqLwrWwlnRgiUKZ/n1MFsHnCXlPecx0xgr9RcAVIIOXSagTJkmY5?=
 =?us-ascii?Q?KCs6WruL0NvgOWjjYRMEwGSQEqfX/0DilWpARaKw+P5B1bMSw9y4KoNG4DF9?=
 =?us-ascii?Q?8NYV2eo6cMYGkIyauW7+ecfLMnZ1z6XmcRSxq7p4+3vGeAmrtW+Hn/jDrBs1?=
 =?us-ascii?Q?qB5FaTIES6EUePNInpKg4KYYBxp06OVMQp9KiIw/ZjgPu22xwx2lLmjgqATS?=
 =?us-ascii?Q?Dv0YZRqFMKJeMMoAjSUI5Tfozsse3MIFcjCrHoApQJCrxXzuyR2nf7Ud9Gqm?=
 =?us-ascii?Q?IFXMj71iM2cbe+qCQwQX7ol5XHhdBLWf3iQY80WO564aiPlZFkM3spLWqkjQ?=
 =?us-ascii?Q?JPYEEOvDoYBBJYewAX4FzElRhCbbR2857LHKGbWwSjJ35ohFIy9JP8fYWp7E?=
 =?us-ascii?Q?RcCTj+eQAQalQ2dJm03a93ryXZQqOe1fYpnZtwC+pfSgN/N0SeCdqueeOvR0?=
 =?us-ascii?Q?d4Bxc+26W1Gd4elcyBxlVNY9ocGgrtrxxlhnyWiNQHr42KIDuFhggL0jzvED?=
 =?us-ascii?Q?YRBNUuYjKtiMWWWnzsgIiELcDFOFChSdaKLtT8aL1+Q7apsoUCZk2Va3KqIi?=
 =?us-ascii?Q?xFIBfzWnEhB08DfbW5lVXXOnm9m4GxM0T+ZTtyF3hp8XQim2bJFyG0UXNGEQ?=
 =?us-ascii?Q?GaHiBlajYLyGbhB1hF1R1Rm+2HGeTGmMPcjqUiQRuPxE6tgXAnpLrGvEK2JY?=
 =?us-ascii?Q?UUtPrt0WKt6lyNL1YztdLMJvrKaQgInGx26G6n9Bi8effgdgVRKKVe8j+aHV?=
 =?us-ascii?Q?HyRBnDL9yI6EKNlrixvmFGTxJOCCDzZ2uQe7ytTIcxq3a9xohQ11pxvnlFnV?=
 =?us-ascii?Q?siU5Cpr0kXtlw7HHdUv7cTyJRiYQezOsI+8MTQGP73kMRzc9DdkAMVvZJ/f7?=
 =?us-ascii?Q?pSyp6ZYnZmWPI35TGAcAJoW/Vmk1vC2iITBke5HHNiXKbWIn1SIIarLTcOAn?=
 =?us-ascii?Q?3CgRgph/NwOmBAxS1XmbuDfq0QNgUiEMGPovVFl+UyEbRsg2tbYbAxwT+rfg?=
 =?us-ascii?Q?TWzm8QvAa+eTcdFSB6tFcU5XpjSr5A6LPU+u5t6RnFgjrNI0T1/MVaA64nnR?=
 =?us-ascii?Q?OLmNFeN0hNgCl7WU0HOtkrhLfmGU0qep75joBcRbHjZKfeEdXlZIyvENoCOw?=
 =?us-ascii?Q?SLnC7vLWs8Q3JwekfTW3LerTybOgIMUa+FbyTLmqUsG8im5fgvXxQIU4IS2k?=
 =?us-ascii?Q?zQDGn/J2emmGzNg6po9a3tcvgJkueUK4KJCeQH41i2uWxwq6HTrJHYK+mdv7?=
 =?us-ascii?Q?QR55YT4PoOZEpH9k4vTEDLW9YF6i99NR/EdqExAJ7VmFT2+D1jWWNrR2w/HE?=
 =?us-ascii?Q?TrcWND1+xFFUahEhvlE9DQ+OXPMykqctHVzl2XgyilQgd5exhINyJOCUB9fM?=
 =?us-ascii?Q?xUwMu5c7Oh0J/WMJtxtrS+Wb8612wXDqlI586Kz8cYVWIJLFQMhg6rwnhw3d?=
 =?us-ascii?Q?LWNQ8gY3S+sZkrJMdZ1atW2Y4a5zVlxsGVPE/JxyQgVOJcUhnhuLLrAv+giE?=
 =?us-ascii?Q?75hckNdh/7tZz0TKYoXuJclwTgANi159MBqFSS+5pWKAsqrEJvVTo+y4LAj6?=
 =?us-ascii?Q?0WY4ZVqkiGvWRJhum5AHOoc=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 681c08e0-4d19-4633-ab8a-08d9e800107c
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 17:02:02.6072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 U15ux1Ldbw5VJrv3dHMK/teUiT5ohLvjCXUlzDaZL2BI96qSErdnDBp5nZhdVgI3Mwh7cAdYJJW2vWNp1ITlgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5042
X-Proofpoint-GUID: KsvKDzkhwY2_ZLHULVJ8PTnVBdeQheym
X-Proofpoint-ORIG-GUID: KsvKDzkhwY2_ZLHULVJ8PTnVBdeQheym
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-04_07,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015
 suspectscore=0 phishscore=0 mlxscore=0 malwarescore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=624 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202040095
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Feb 2022 17:02:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161369

This is a more descriptive variable name updated in base.bbclass

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta/classes/multilib.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 4a3e582816d..ec2013198ce 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -65,11 +65,11 @@ python multilib_virtclass_handler () {
  
     override = ":virtclass-multilib-" + variant
 
-    blacklist = e.data.getVarFlag('PNBLACKLIST', e.data.getVar('PN'))
-    if blacklist:
+    skip_msg = e.data.getVarFlag('SKIP_RECIPE', e.data.getVar('PN'))
+    if skip_msg:
         pn_new = variant + "-" + e.data.getVar('PN')
-        if not e.data.getVarFlag('PNBLACKLIST', pn_new):
-            e.data.setVarFlag('PNBLACKLIST', pn_new, blacklist)
+        if not e.data.getVarFlag('SKIP_RECIPE', pn_new):
+            e.data.setVarFlag('SKIP_RECIPE', pn_new, skip_msg)
 
     e.data.setVar("MLPREFIX", variant + "-")
     e.data.setVar("PN", variant + "-" + e.data.getVar("PN", False))
-- 
2.31.1


