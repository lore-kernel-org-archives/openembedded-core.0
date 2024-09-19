Return-Path: <quent_55@hotmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E043CDD578
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 13:41:23 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.92.91.103])
 by mx.groups.io with SMTP id smtpd.web11.20129.1726753278933205471
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Sep 2024 06:41:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@hotmail.com header.s=selector1 header.b=JyjNv5q8;
 spf=pass (domain: hotmail.com, ip: 40.92.91.103, mailfrom: quent_55@hotmail.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bjEQO8CdB3GzSO75OdxsxVPQt4iJrdXeBpt7AOL58XoaOxFnipNtqFRK92nsZUXSXLBR7dDNsb0+IMGayo4Zl57xRJnshlDm/QgmdDNwHhEvmt6c2F48mPo7e/KT9P1bNmA4G6AJohsT5cZWQUO4ai2MpPN8uwphN7C/wmb3/xzJjwDEfGbbS6UmfTyXK8nrtQnMyKo/KrHBu/7GhomkEGyt+AeDIrgd+MNHj9S65qQjdhTPgR4DLGm1J7L/gi19xuZ9LKXWg6HcyrHFzQMs5WVPXrF3HIaSj8Qw9/1ex11lkOx08z8SGut9a74ZhDSFT5Wg5mfDvgDI4WMsSVKc+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HUM08f+xwh/yplnUT9aL4pazBHyBzTy7ELV/tLdkb7w=;
 b=Q4FXB7zRF8W+YVGKWabJ/l4F7MytYxa+BiNw1SRjNA1n2G5jKEqHNfYWhP3dYWxl55j1LHS6DeNt+YVK85Bye0D8InKfk3sqcxvRE/Ol+rN6J8kz3izs6Es30mJrUD49Ome5z2IMjLJZwqJfXfIx4G+0YZAZrotSmh7UrL5D/7wYZcSbV7DGCVU7OeyvFB9EGoOTEUv4+xs+0ZgFmOBW9SgX2O87i/zS8yulj8zd3SMPH11oN62mk2i8DX3tajmh7j8bLyfq7iK/NWtRiwmFaRnSB1qoeIXS7Ul3rqLwvIGgQou9COJEGShrLb2vLvdTILfSOyDXDIVdEqgOpCtS9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HUM08f+xwh/yplnUT9aL4pazBHyBzTy7ELV/tLdkb7w=;
 b=JyjNv5q8qgb1+vqgd8V/NJkvAx5UspqdOw7Cf5ycM/Em7LWXtFXF+AdlDlMUaFGHcGV2HPWzV7cHG0a6CZOYGCt/kEPWZy7dHPAVL8Q5kseebgOp2cnK21UYhvHW8PnQ9NTbKF8Zka+JP96MJWcwRP1tGT28XOasbhpKbF62irBtA9ei3kWdO0stSFw8ugdOTgWHBTWLn0MiY7ZLqXhopTfyqb44wD1cvj0UsVdKbX2j2lNJrFn3Z6s2dR/kKt1fmm7amHEXnNWihj61ph0QSEvyBrYkR++6QoYGYBgDQBuwyZHQhst+5ZtOjiojPgljHX5MeFoLbIIlyBy9duAC7g==
Received: from AS4P195MB1645.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:505::17)
 by PAXP195MB1376.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:1a4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Thu, 19 Sep
 2024 13:41:14 +0000
Received: from AS4P195MB1645.EURP195.PROD.OUTLOOK.COM
 ([fe80::1055:1602:12e4:49c0]) by AS4P195MB1645.EURP195.PROD.OUTLOOK.COM
 ([fe80::1055:1602:12e4:49c0%3]) with mapi id 15.20.7962.022; Thu, 19 Sep 2024
 13:41:14 +0000
From: Katawann <quent_55@hotmail.com>
To: openembedded-core@lists.openembedded.org
CC: Katawann <quent_55@hotmail.com>
Subject: [PATCH] cve-check: add field "modified" to JSON report
Date: Thu, 19 Sep 2024 15:40:54 +0200
Message-ID: <AS4P195MB1645496BED047F45D6B9247FEB632@AS4P195MB1645.EURP195.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.46.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0118.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::15) To AS4P195MB1645.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:505::17)
X-Microsoft-Original-Message-ID: <20240919134054.37470-1-quent_55@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4P195MB1645:EE_|PAXP195MB1376:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ecb7a85-b0d9-4f22-990c-08dcd8b0bad7
X-Microsoft-Antispam: 
	BCL:0;ARA:14566002|8060799006|15080799006|461199028|5062599005|7092599003|5072599009|19110799003|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info: 
	mjFutpdVeMEPqBTyMriWLNSvUzTLLN3kjXGtfQZVr8OANu46/kjqXb0EOrTzCGcVgqzWXwkmHtVc2eIMJKaW8jm6h9WmaHQ6u73tR4Wf3ayW1QCLGPGFugSLQQW4Z13f6DG38+V6hIm1VWqEQNq60gSdY6aKOxJDUy/eCb0x6il/d+d1WetRYGIfXYFeQFXruA707olHPEAdyOccMozGkFz7RaaaWEApsAk2gWqgz2fmlsHa7FFOIyymXLBr9fJJdkQhRctNj/dS72ZGUzxktqtwAFwGnb/EPjvgfbiAdxm/putPAHoBpOM8AKvXXZyewhJI9MHOwjmh5xpm1hXtz0kvBZn3fGvO8Vr5aY5FpA1CeqlHZUQYxZ+hBvPbo7Nf/U9YjPeUIQV8VWElDWTxquwqjZ0YKa6SyOW9179UTAdNZe0KkDChI7UOK6JqR+shbR4W+GxH3+plCESPbYyU0UIPLxi1gRw+Ur8JtIOL1maxhW+Ke+6JReZ/xy+QN4Q7bx5UD896y8No0HCMNTeouHJk2730qGuoc2Gx6yCzGGJs/W3I5xniIWuE5BGO1DJdgDaPaxlc/41NeQSF2i6duDu175/Pla1th1wcRhPNb7NYc1IQmPPttXp0rKYqHRsZmCx9qbM7Cy2LO9B/BWX/akO4+c33jfORX4chhRxXB4o6vhNsoxKRFleSSPjoPR8iFAY1xHsqdJXNM0u93+ikzc8kj3WXO2E4HnvCrwSVk+kslMq/cXpHGn5HGuXiIkW0XV6mzE8QMBRS+l32DdDrBSu2CSeDjG81XveK9Z5lYio=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YUhaZ9O/6ZJ2ObVui0J3Nd4XD3ZU6mGLJZ+q1+L3KDZybRwtWb47lLXGxazc?=
 =?us-ascii?Q?5aoKfWCjxM+j8/6WdaaFrbibAu/L/ZGMxBMetCa9P51pilBxanI5ym/T0G8t?=
 =?us-ascii?Q?GWwOPgakGqeOaydgIUgfdBqWS6J1rXg6ponH86WaOxC6aicovNENB6PivucX?=
 =?us-ascii?Q?v0IbBLD+sgaUhZyiXVYE4p5xjzVij7iSpmN7X7CQ4DrDyN8magoG2QRC7tA8?=
 =?us-ascii?Q?sQJV7xguoDxqdTjxVW8t3s/PPJ+ZV7YXy/9LCF0SVPBfdp8L57SWF/+T9ewO?=
 =?us-ascii?Q?+Vj+ZkGYKQV0GIbPGxntlXpOeRRY3eoalKumjaoexAM2hX/TzuaAJcGirG/5?=
 =?us-ascii?Q?DHy2jHMTPmqLe9shgQaoo8H5Jat2VMArpJIrm9vFTeTAggTR1ZgTftTHWlgG?=
 =?us-ascii?Q?p3ggd86KGIWYttUpmIyMTfg81YtYa6cXPQTSu6nG4xHNxCGxX5bOWPrieOf9?=
 =?us-ascii?Q?qASrZSLYvh5hWX1aH88erbPa/FvoI2jZEhWDrxXoaMzzN0lkG85KgikGttUr?=
 =?us-ascii?Q?KPnzKFP+03YBz9j6PZZKVNzmJilihaA7bM8kX9O02En65loRgFPlY95kZfbu?=
 =?us-ascii?Q?uVOewFN4GYy8RdHpijLCa+98Ap00yVVmKJUr6JM1iF4cn7/bOXWmrSar7Ma3?=
 =?us-ascii?Q?y+HKtNNpk9Gp27whIjZT6rko2JLpK/K6FDDOZJW7jnkhnX2G4MQtoBpYGY7Q?=
 =?us-ascii?Q?/T/jkaqtKeOceUSFO7qIg0P35uEr2CQtaTSk6+mGwNPXFUuLr1jZ0qkkvTOp?=
 =?us-ascii?Q?CUcQqc9+mW4E7J7158AsT/KDRvXJacHD6nbSZMf5n6m+kU9UHsiwzmV9vKNs?=
 =?us-ascii?Q?KVjuN2IL0Acx5SjWBISAfBBvHzSm7Xz9cwZTfiDIXg89Es06LYNDArLcLvVZ?=
 =?us-ascii?Q?LHgJZkL0cY1CLARwG+T3jUG9kAhAHf1A8JrHQgRNL/+opp/xJ5SwtFZ4GMlv?=
 =?us-ascii?Q?0JVj/lwVr2qiVTaayG0k5n9kiDMs0+jd+jl4/UOYvgu5YJFTJiEVdrCtODNE?=
 =?us-ascii?Q?JM355tbxD6EWGsE+tHJpqkofHnbmKO0ROFVk1Ym/Yy6i3E/QlLW3PgqDyV+/?=
 =?us-ascii?Q?/oLh6+QT5sR+V1IJFCjwT2Dz4PAd4rUeqmMe3dvQ8EFgmBdeJoGpZ7/mbsRu?=
 =?us-ascii?Q?nGX16irGrCeV3o4dpDNL5SzwI76c6JOt92LktR4Za8TKpLj2zxK0BywXgE/w?=
 =?us-ascii?Q?zgWRmAPtA9+Q6Uw6vf19IdZM7jmJT83sBKGEL3+zLbfBeRm5TEtYkcWDVRw?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-49ed2.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ecb7a85-b0d9-4f22-990c-08dcd8b0bad7
X-MS-Exchange-CrossTenant-AuthSource: AS4P195MB1645.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 13:41:14.5598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP195MB1376
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 13:41:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204689

cve-check: add field "modified" to JSON report

Signed-off-by: Katawann <quent_55@hotmail.com>
---
 meta/classes/cve-check.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclas=
s
index a5104f210b..6245594dd7 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -534,6 +534,7 @@ def cve_write_data_json(d, cve_data, cve_status):
             cve_item["summary"] =3D cve_data[cve]["NVD-summary"]
             cve_item["scorev2"] =3D cve_data[cve]["NVD-scorev2"]
             cve_item["scorev3"] =3D cve_data[cve]["NVD-scorev3"]
+            cve_item["modified"] =3D cve_data[cve]["NVD-modified"]
             cve_item["vector"] =3D cve_data[cve]["NVD-vector"]
             cve_item["vectorString"] =3D cve_data[cve]["NVD-vectorString"]
         if 'status' in cve_data[cve]:
--=20
2.46.0


