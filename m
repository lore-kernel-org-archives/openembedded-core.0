Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53BFDC369C2
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 15:18:27 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.47])
 by mx.groups.io with SMTP id smtpd.web11.42765.1745335099443418510
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Apr 2025 08:18:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=a6ImZqpT;
 spf=pass (domain: axis.com, ip: 40.107.249.47, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pcm9vOgURKGKFo1xPt3xeoRrlHDQZtM2TbbQ6Sa5b8iB00rbhaQYQHlILpLDM8gAURxPaNWrurDHla4ynf58bD5iSsm1D0ndFN/5JpsSg9VoMb9q1CzN3hro0nAdYcb4ABs5ItxyO7ELE/oay/IDO5OsCdUjj4bH9isgs0IxGnnF2tr3BB6kGTtGDxSnGpsLtoNlKrJFwsuPIaJompTdETl5xNZ4IyRZ7aejULH8sSCNE1Afjm1Qa/BAatl2q2n3XAv0j8IPcGJzHRolUrCey/MYwvBbwJr9F21Z6c0NPbU/htmnM1RpiuxKFL//HcTHpA8xpd/qqLh8A3qSVWVZfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3RylBjEREkHfKIR59pmSQj2xL7sKFS5wacjiUodOdUA=;
 b=addWgRyxogCuJfIoGd5nKofxaeb/PJ6BkHyJwfOC1RDeL3r8A34KKoCTR9eXHhJ9Njt52MIA0sjz/6ZstJhZiuLjMf3JpUUkLvw8EZJLytiK7rgLMQIY9TMkVl/ZRVDLKYtQEnF1KLjmtLsN3hGbjW3c3mZzTOcR1WGVrvHcwA7ERyj4fHtEEH6rlctrO8pL9ijnl/zb5tRyNeqUvxOz7aMWfWWV0sSWqU+VzJvqxR27i947Lg8mSYHgguf/7G4EkLEjvbnEul8GONpXRI/oplI5fJvP8Z0UQJ7px4tIyzYC5I1wH2JEs+MwrKyddLrTBEtl9ZlR0sC5clVsQLLLAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3RylBjEREkHfKIR59pmSQj2xL7sKFS5wacjiUodOdUA=;
 b=a6ImZqpTYtRNg6Py3i9cO+lCwb48OVskL0/VSLP0EL8com3+7odcS7sE2rC74WjivucX615YGjAN4KMBemTrVp6aHYDT+WNph/BxlfSd/GHrL1FA8aPrXD9U2Hv5a9G1Zu21d1z8Oj+ixYuLAKBw5m+PIPhjG5bVdrjYuKqw1/o=
Received: from DUZPR01CA0282.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::17) by PA6PR02MB10521.eurprd02.prod.outlook.com
 (2603:10a6:102:3c8::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.21; Tue, 22 Apr
 2025 15:18:15 +0000
Received: from DU2PEPF0001E9C6.eurprd03.prod.outlook.com
 (2603:10a6:10:4b9:cafe::d6) by DUZPR01CA0282.outlook.office365.com
 (2603:10a6:10:4b9::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Tue,
 22 Apr 2025 15:17:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU2PEPF0001E9C6.mail.protection.outlook.com (10.167.8.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Tue, 22 Apr 2025 15:18:15 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 22 Apr
 2025 17:18:14 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Tue, 22 Apr 2025 17:18:14 +0200
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 3266D2A6
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 17:18:14 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 53MFIEoG306177
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 17:18:14 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 53MFIEYx306176
	for openembedded-core@lists.openembedded.org; Tue, 22 Apr 2025 17:18:14 +0200
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [walnascar][PATCH 2/2] insane.bbclass: Report all invalid PACKAGECONFIGs for a recipe at once
Date: Tue, 22 Apr 2025 17:18:08 +0200
Message-ID: <20250422151808.305986-2-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250422151808.305986-1-pkj@axis.com>
References: <20250422151808.305986-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF0001E9C6:EE_|PA6PR02MB10521:EE_
X-MS-Office365-Filtering-Correlation-Id: 07b641be-2286-4485-195f-08dd81b0e766
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?oRhF41bjQQLjiGNbJYks0RQUmn3jpbeSHHF37SRHUCQ9AJih6HAAp1pRdk3E?=
 =?us-ascii?Q?yaC226JWXIjU4XL0w1w8BFiESNN5olXQYlGP9Re5+8F6pngyWeGInj5KvE5V?=
 =?us-ascii?Q?E1HcEaL37AtFQmV7sl5E24uH87DF81Ey5xH4vOEAsgPUE9h4xY5Vp96QPfWc?=
 =?us-ascii?Q?RHXfBMmA3kTiIUZAyJxF6pwAKnKUcbMOReZc6wwHHT/bH/WiIb9BwKP/QG1V?=
 =?us-ascii?Q?6/TbSzFIVl+xYOC7QzD56IWpXXkT/UbS0qCj0RLDJExs4Zg1d1wriEPT9zWU?=
 =?us-ascii?Q?tfA2t7ZenEVYTrrOqtocnM1R7GUkX1R8+zzPgEnkRKyrbQipFIbnIkGzuuGC?=
 =?us-ascii?Q?7YR0DVXEIAVTyaYHjllDf4aA8j4gE9qafax+vcJLQKEgbci8bPPetZjK7wMp?=
 =?us-ascii?Q?6c6c35THpo55+0PuzPRDCVz+byQm0OAr1x/oIphzkUn8DEnXZ0pguaKtwhUe?=
 =?us-ascii?Q?GIBCAaErar+9tqgTIfSTkGaiyO22kjicOrQ3EdDxg8NuUDzD98qn04b6oXbo?=
 =?us-ascii?Q?bczZLEzvHRm+uJbrUhSEykC4vvQU/c+LzS6SazPY4lC/J7wtKQbp4yUD5gCd?=
 =?us-ascii?Q?ETTvqyEvGIphwl3SzSADb5N23Hip3Xkz5RwRrOq6Uxm4z3qzZ85ppt6QqPla?=
 =?us-ascii?Q?LuiEFzuX0itT49A457luoSzYggj6cIXJLu9JzgR/plJfAMwwobYjiaAaaJIc?=
 =?us-ascii?Q?PYZcPPeWbEFkD93heQNrRd7DeuII3ZGM9V91kebOhTa4sXYGZ2XB1LEkwofO?=
 =?us-ascii?Q?qo9vTg8j+lLt0+BkF7O17a7FyV4noFoLbofu4oiL3qrwlwmfYcv5pIKzbESZ?=
 =?us-ascii?Q?CJyAVD6/VSHzNwrqf4ynUJfYGpzbJVisMr44vM4+Jt19ZBf2YkXjqogJVdCX?=
 =?us-ascii?Q?4faMYXI5BPU+YT9Us9aSZqpDLZU+zAxCeXzs1cj99HUR6a5yTngO0Qli0iVY?=
 =?us-ascii?Q?4MEN7HeHg3Q3bdu7awSs+XTAgdsMaCYaWXKk9OE3tvgsUYYnM537Um2/Xlec?=
 =?us-ascii?Q?REkzGWMY1enQ40PXQcrL4HTjPExj+hrG9XpcwiM1WAIYzbSQMkejJXR7g1+g?=
 =?us-ascii?Q?c5aNVVUKtAC2EXC6yzPJmcFNnEraJtlt1CoJ41S9PNA+fuuR4Z6KPVrNaNnX?=
 =?us-ascii?Q?X251aF0NpxbLO5mnHuguIL/POllYf/fXXY/oyDQ1stT+FUuPTntISN1D0/5z?=
 =?us-ascii?Q?5/EVfdn9g6TX4yhEnha4J1ZV9SY8cUOrJlrJILFNB9CKd1DDn0jJH5BKpdNt?=
 =?us-ascii?Q?cMPfJ4RebDxJaMnHuyec3b2iSBBN2xBtp2eqcnr/hlZ+KhlUpIcPYwRSatuA?=
 =?us-ascii?Q?/LUOvau+FBKRuEIqK6+utY/CfXCqcINwxM7JKURnl34wxUi/Yzkw1kgX21CC?=
 =?us-ascii?Q?g6qrxapVJYxVtWNklJz2j8QWcg69n7EMhfLxtpenLIjOZOOYHmVRhCi+W2QU?=
 =?us-ascii?Q?J/DbsDmB8S93rBjhTnpytjz5iAdKqtXl/jvPpkI/MLJe9SQyI2Zjb0Ni3fIw?=
 =?us-ascii?Q?FHoqcWIkKyFimORkJWsk2hj3doNDetcsvlpI?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 15:18:15.2464
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07b641be-2286-4485-195f-08dd81b0e766
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF0001E9C6.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR02MB10521
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 15:18:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215231

Rather than reporting each invalid PACKAGECONFIG with a separate error
message, report them all with one error message.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes-global/insane.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insan=
e.bbclass
index 748de050e0..cd26bf5eb9 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1469,10 +1469,10 @@ python do_recipe_qa() {
         pkgconfigs =3D (d.getVar("PACKAGECONFIG") or "").split()
         if pkgconfigs:
             pkgconfigflags =3D d.getVarFlags("PACKAGECONFIG") or {}
-            for pkgconfig in pkgconfigs:
-                if pkgconfig not in pkgconfigflags:
-                    error_msg =3D "%s: invalid PACKAGECONFIG: %s" % (pn, p=
kgconfig)
-                    oe.qa.handle_error("invalid-packageconfig", error_msg,=
 d)
+            invalid_pkgconfigs =3D set(pkgconfigs) - set(pkgconfigflags)
+            if invalid_pkgconfigs:
+                error_msg =3D "%s: invalid PACKAGECONFIG(s): %s" % (pn, " =
".join(sorted(invalid_pkgconfigs)))
+                oe.qa.handle_error("invalid-packageconfig", error_msg, d)
=20
     pn =3D d.getVar('PN')
     test_missing_metadata(pn, d)

