Return-Path: <akash.hadke@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9D2FCCA483
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 10:28:58 +0000 (UTC)
Received: from IND01-MAX-obe.outbound.protection.outlook.com
 (IND01-MAX-obe.outbound.protection.outlook.com [40.107.222.43])
 by mx.groups.io with SMTP id smtpd.web12.7455.1657621734275335272
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 03:28:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=rC61OkPH;
 spf=pass (domain: kpit.com, ip: 40.107.222.43,
 mailfrom: akash.hadke@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NAqLygHxqYTVZyRq+2dTrEN3yCqTjZNUAYHgD+JdpvdwLeALbVqudCS66Bfga0mr5RjsoVAKARALaU/wccI+rgYsLLwgqZf6/g9U8q7zdEs3vFP/PCxvmAVvxcizKc18XxCfAWwmiiB137fsPKlN2SUgz+xy2ElweZ70Tix7Ys/7N3EIaiseUkYOfnPpWJRUkDSthJO0JGmYbd5dgjkeO+er91Smlo4sFP20I87JuIIyDL7CUswrt2fXu8yNgsEFX8Prq/7Wrzf+Z2PGI+YMIFXxUdBmoFOkl5aNbJ+8Njgf5toz4/kVZzuo3na6c4bf1SHQorwwXIoASMzbGOC5pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1hRMk4lp4jam0BAOMy93zVl55p3bb3MquqEgXnIz3T0=;
 b=H6zVg4Y/4BzG0r0W9zpeM/VkN+tK18wZWdMQeo8go58F5oNp+TjDRPoYljv+iD7+K4DzRbHBF4bbaZfUenT7AV3VoBw6JIDbI7ZvdOG/FJ21IkkbIdghniTljHZ+z4W9wN5ozwezz9llLmd6xEEhmTgOcheBpt2Vpoill/HnlRomoAToBBSJMQyQEgYDyRRJ01z+EIZQrmuBvFfH+VssLaqn3eCvV/IgkarFGUNpiKhnFWR35Gx4T5lsXxqJrgdF/2oUWXLO0ZX8IbWbJJBuytRoyr0Lc/2oQegdQuJdK2XgP2y3lflBr0RC7GdE0H+ptyJJfwqB2bDwtdogROLMKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1hRMk4lp4jam0BAOMy93zVl55p3bb3MquqEgXnIz3T0=;
 b=rC61OkPHHWOPruDNrefMfOU1LhvV2HWpymOqAPyv4111NJ5ipSaSs9e23o2bJGJPGObwoqdjKAx7a5KQPbrTOCf0y0JBCnNEt4p2OhUT80qvV9wF4SYR58i6G16QK9DID5DomNNRjbeCgYinrACADvLY3R4n+h9bB6uQuIxDR6Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
Received: from PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:89::13)
 by MAXPR0101MB1322.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:15::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Tue, 12 Jul
 2022 10:28:44 +0000
Received: from PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::57:e269:a77f:d5d9]) by PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::57:e269:a77f:d5d9%4]) with mapi id 15.20.5417.026; Tue, 12 Jul 2022
 10:28:44 +0000
From: Akash Hadke <akash.hadke@kpit.com>
To: openembedded-core@lists.openembedded.org
Cc: ranjitsinh.rathod@kpit.com
Subject: [poky][master][kirkstone][PATCH] cve-check.bbclass: Add anonymous
 function to get patched CVEs from recipe
Date: Tue, 12 Jul 2022 12:27:29 +0200
Message-Id: <20220712102729.24407-1-akash.hadke@kpit.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0117.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::15) To PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:89::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c662b1e-4e77-410d-eee8-08da63f14bd2
X-MS-TrafficTypeDiagnostic: MAXPR0101MB1322:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	388YoCIIdZWma/EJpSQoi8fHW3mH1okPU0oK2/6DGoWuj5L1GIZBUMo6L+DgoTzh4tTX2jJZ9L5Ta0//zazvon0l466KLIHzQ652JEXFGUsyw7EseCDn9TdF2OpglPZO8ssqGDUcxOGR6di+t/VoEc4c/EEmuo5yM9rw+Gccbc6/Y10p7no1XbtC6GPaeRiatRzYjNIcwOZYpYQduWHcJs0WlbL9qB3q4aJ3EptriuSqhK9KP8KZdXcpHUqClWbQ0DYIKWnV3neQE0ghoNR2kh0IrmyTynewXORlvUjB6JY7lKIitpEGI+Y+HTa4biplh3gU7ilghppuKl4lLU0werFobHVICYbbcEtsGlwmcfi1Cy82tIuhe2oWx9DqR4WDxsqmDl8vErvrhI5WJGSxQfLAHiSxvaTKlsSX9ByC1NdVsKajZG8qiUSEZLSD/5iE42DctYicyfUfgQtTlxb6NEan71aPcRYmAsVmWmmoUgTmhclyLmSf6SlNTGAjBn5IvhaWk+30NJThQDwT9JhOtoX6z4DZLdysb77REzRhKyw891CJ7wEp1RZBvdDaqthOJiC8IzI/dmYoYt3hvvGS9urhbbHPfI5EqXfyx2GKZbDp6/dUJLGE9PoWljPC2P0ZMACWiS3sFsb7VUVyYPgtRX2fFj87YNtWv2NNshlSu6ODFeEupgE2wTXSQ0u4wC28AgXg+jRbdEyS9w61wOOcyCAZF9zk2DqivGUH+O3/irIfvtnVe51kn6HLk0utYE4+WKu3GlFGFb3/Q+ci/uh6xGcPjs6uyNKSffWnV4BsIeIhAhGS8Fn490OdPScyPYXX
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(346002)(396003)(39860400002)(136003)(376002)(26005)(6512007)(478600001)(52116002)(5660300002)(2616005)(86362001)(6506007)(44832011)(41300700001)(2906002)(8936002)(107886003)(38100700002)(6486002)(1076003)(186003)(36756003)(83380400001)(6666004)(38350700002)(6916009)(66556008)(66476007)(316002)(4326008)(8676002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FKmS9LJ+TAkiC0NyCjjaQ2HlnUIy4wyuaICuSQLIFuRJbxB9zMNwu8bZhAkW?=
 =?us-ascii?Q?o39WfD7klDIwiW5OKskAZJiKx0nuz44s7L74TnDGHcmoyNB76dqxXLC/LIKV?=
 =?us-ascii?Q?BY5rsTCXTZA7jHS2TiAw+fGCwdbFl9I27Vw9/aCE1Znj0IDGVcNrZgrlOCu7?=
 =?us-ascii?Q?pWR51kR/I8A3fDCZZ+bMXkccJbPkJovTu74WhXAtIAmG31NNSE5U4BAXystD?=
 =?us-ascii?Q?Peww9Qij/rEMuzOb5kQff0i5dAEhr0k/1WRwUXEIZxSq5lvVYK6gKRUZDeod?=
 =?us-ascii?Q?/2pQM9wDN4eaTHb1duhs+kfmSYhUDYRkK8ztfkT/cKiXkeqakJzyLThaqkPy?=
 =?us-ascii?Q?23hex8BrgyZWy8xIz3FVvGk3bdyo5SuURXE97+WOWGi/Qf9ygRyP9YbduQB9?=
 =?us-ascii?Q?QZ4+W0N85DP5AloRJ5pfbydJyNtbVEwyepTKF52HkWbPD47hcRxtCWVkR01T?=
 =?us-ascii?Q?U31jJa/x7wMcwfmwijAz1f616aJrpxYq3IgqE/rwuEwUkKPEkJUyh8KhUBz1?=
 =?us-ascii?Q?ZJM6d9W0chl/1exg1ycPMaBU/tbRU1uCX5e+GfLNK2bVMaV4uLsAkTTuQq4m?=
 =?us-ascii?Q?BaRDfafaftXPo0lwOBnLVQGNkJhmSnrJwQoqg8ltW50LmC+8Zt/Aaiu6crbD?=
 =?us-ascii?Q?AEYMR4eALTvEXF/flySbmLYACCHc5c376zlV4zIgrmwij+WYnPAZb0YLgiGQ?=
 =?us-ascii?Q?m2f282O4Vx62acgOrVHeXdd4Fz+RWw80eg9sh3MgtgUeQWAVBzEqRQYpuE7L?=
 =?us-ascii?Q?gvvfPRbNkKkx9hdoZGdvFJQuaiFhrk1qdppU3mPy8dMEyy8RVA2zq8UMUmbr?=
 =?us-ascii?Q?Cw4ljUukifwJ+61ZlLBWyvsLN25jafFEKQrjLL/ICvNk7Q5t2jVYowG44bv0?=
 =?us-ascii?Q?45M+ePH5LW/kDjmxbeNlWCSoPfIBDemdiq64Wt8wgLodgI+kDAh8nDwA3K6P?=
 =?us-ascii?Q?8HFb/nvYSZaojkw2inaPl0gEnc/G6W01WzK01wzmbjDQoeL9/uWQQ/fNqKDY?=
 =?us-ascii?Q?s0iLR9e7z5zX8LL52yCP0ydk2aTZ78phJQ3Cr6nAQT87Pfy3a3VWiqSguDz9?=
 =?us-ascii?Q?sFNOX4dn4PxR900i37idZyMl1hzxAiO4X/YLQy4UiThZJDge4pelq5hdSIvg?=
 =?us-ascii?Q?bMVaP8FDoT8zO7sXejXizdJE5Ddj0CZa6fPc3Yn5aqW1D1peh2mJfTCefkdj?=
 =?us-ascii?Q?0sp4u6IjXQnHSQBTsaL8BvZigGlatBC9bDLgsruDBXUzSauIPit6Flv3GMvU?=
 =?us-ascii?Q?IeTL6+tXjRR2KaodCLMxvIvu4nWei8Nrot7AHQ7kjLspozkFLrGj5etlL0io?=
 =?us-ascii?Q?LPLOAXKgs8XRSco/AlHR8exJ0R95Whtj+aSAhIBk+ZlFAkW2Iu+lH7qEnV8f?=
 =?us-ascii?Q?1sUL/9U52O53ZINeP6wp1jMhMo4h8LJOr48ZbQpGuXosKuARmw5VWJHPJEj/?=
 =?us-ascii?Q?e/22mZgTfDnysqH8yE8c8TrYL8Qo8tCNe63U4+PYUrEP8drDsKpJa6yMGuI2?=
 =?us-ascii?Q?ffys4+MoWkwq4tHQbN00p+g9xeyylFRFYNXkI5GzI04m0Sc/a9HA4h0fh6Ns?=
 =?us-ascii?Q?moukaJAXWC1s0PizPwTCZMFELfNjsR+MKiQpPRsB?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5c662b1e-4e77-410d-eee8-08da63f14bd2
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 10:28:44.0010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Z1DInhPrpvP4oOBMttGJDKVpsp/2uIGuAuI2pjr7GzIuyX8N6Y02ZPTnX5KryCQmKvwyn5DZ2YZIo1Dx6YoMbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR0101MB1322
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Jul 2022 10:28:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167917

Add an anonymous function to get patched CVEs from the recipe
and set the value to 'CVE_PATCHED' variable
This variable later can be used to do CVE data processing
outside of bitbake

Also, introduce a new variable 'CVE_CHECK_WITH_DB' default set
to '0', when it is set to non zero value it avoids CVE scan for
unpatched CVEs from NVD DB.
It will work as the second operational mode for cve-check.bbclass
which only exports the data.

Signed-off-by: Akash Hadke <akash.hadke@kpit.com>
---
 meta/classes/cve-check.bbclass | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index da7f93371c..b7f7ca73e5 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -82,6 +82,12 @@ CVE_CHECK_LAYER_INCLUDELIST ??= ""
 # set to "alphabetical" for version using single alphabetical character as increment release
 CVE_VERSION_SUFFIX ??= ""
 
+# set to "1" for avoiding full scan for unpatched CVEs
+CVE_CHECK_WITH_DB ??= "0"
+
+# Patched CVEs from recipe will be assigned to this variable
+CVE_PATCHED ??= ""
+
 def generate_json_report(d, out_path, link_path):
     if os.path.exists(d.getVar("CVE_CHECK_SUMMARY_INDEX_PATH")):
         import json
@@ -133,13 +139,18 @@ python cve_save_summary_handler () {
 addhandler cve_save_summary_handler
 cve_save_summary_handler[eventmask] = "bb.event.BuildCompleted"
 
+python() {
+    from oe.cve_check import get_patched_cves
+    d.setVar('CVE_PATCHED', " ".join(get_patched_cves(d)))
+}
+
 python do_cve_check () {
     """
     Check recipe for patched and unpatched CVEs
     """
     from oe.cve_check import get_patched_cves
 
-    if os.path.exists(d.getVar("CVE_CHECK_DB_FILE")):
+    if os.path.exists(d.getVar("CVE_CHECK_DB_FILE")) and d.getVar("CVE_CHECK_WITH_DB") == "0":
         try:
             patched_cves = get_patched_cves(d)
         except FileNotFoundError:
@@ -154,7 +165,7 @@ python do_cve_check () {
 }
 
 addtask cve_check before do_build
-do_cve_check[depends] = "cve-update-db-native:do_fetch"
+do_cve_check[depends] = "${@'cve-update-db-native:do_fetch' if d.getVar('CVE_CHECK_WITH_DB') == '0' else ''}"
 do_cve_check[nostamp] = "1"
 
 python cve_check_cleanup () {
-- 
2.17.1


