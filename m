Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06E58CA5FB1
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 11:04:28 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.34])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10767.1790766261042056029
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 04:04:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=e31HkPG7;
 spf=pass (domain: ericsson.com, ip: 52.101.66.34, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ll2grFhNOSOygNKk2fFC7ItisFGF8o6nR5DR53SD26gDTuEtHVS4oUA3e6B/6puWqEmyrZ6JGEKxox1mUWp8ZogVql65C8A+1861FWauiUvbvW4ViUcDUypBZYp4AXx0kJoyrLZVGv9qOe/zUbUCVmScewKoz9+OZTE6d7eBbmueE0rQYfVxTaz0ZyiY3Slf76u84IO2OI8Gtm6dqfwBhcB3nQvwY1z5DT1SuLTqUFzim1SOOiT7uR8NriMvAXg0cCmHhzWzq8dRms4QEWDk+NCHKbH2xj0FAAwNn3adzVMa94pZ5OoHreHL6vS1C62KNJNd71V1mll3rrYRZTBvsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i+7nbRHJ+K+F1P5f74hr91rZewc0fvLp1S9DPmKosZ8=;
 b=v/s+UVVnub08GI7eq3KeOTFq5ago7+UQpp8nNEi1LGBscvjs8Bg8GCr5w9UwJ8g0JxV6x7NfOeeyd7kel9C4z6T30oqcmpNfiiFdOUAGOT9VHsbguipBb9nzhu6BkKrgjpWGPD/gpurBM4vwjfKRehj8QzNXZtDpzZ0bjst6AhcuY9O3+ZKYP8BiQzdgu7leqvPif1ySV+ubapu6UhlS7hVXvhw69ZHfl91sYj4Gxvg7BuH1DZgepIJFWP/914UIx2FNZk4Ghha5HLZuYOj0AuRXbfagdkdaqvHCe2ntSImNrRFaAhU0bw4pDxlu1sCldvkd+He4t0zNS6TMw4XToA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=gmail.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i+7nbRHJ+K+F1P5f74hr91rZewc0fvLp1S9DPmKosZ8=;
 b=e31HkPG7FuLW11cegqGMKyIbppyiMKwnX5gJS/4lxDYI7J3n5VmYPICjPb1VuzB4/Zxe2VUbLPNVx0ZpPPWLLsTV62to8fILltF490XdvoMwkWC89MMDoIhsHUXo3xOCACS0Abi2vtdeGTEXOrQKa0WvxIiM1W72QcVMgYjQQgq9oP8kCUbN67a9kb5srCAhtHnN1v5b6Vexp9EYykDpMu7SqvlN4C/j6jMAYc99aUaNajCG3z5qaE1Oz0jggAtTvvDKTIkDxrs/0SQqrOkcEamNmPo6NMFyXeSPQLnQEv7m7F1IQH10f6OWK/daToHv59/pxxZkWjuzN9skOfgnsg==
Received: from PAZP264CA0041.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1fc::12)
 by AMBPR07MB12117.eurprd07.prod.outlook.com (2603:10a6:20b:720::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 11:04:17 +0000
Received: from MI3PEPF00008555.eurprd05.prod.outlook.com
 (2603:10a6:102:1fc:cafe::48) by PAZP264CA0041.outlook.office365.com
 (2603:10a6:102:1fc::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Wed,
 30 Sep 2026 11:04:17 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 192.176.1.74) smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 MI3PEPF00008555.mail.protection.outlook.com (10.167.240.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 11:04:17 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.65) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 30 Sep 2026 13:04:16 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id 541FF4020C12;
	Wed, 30 Sep 2026 13:04:16 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 18FC0700CF25; Wed, 30 Sep 2026 13:04:16 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <alex.kanavin@gmail.com>, Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH v2] lib/oe/recipeutils: honor stable_upgrade for UPSTREAM_CHECK_COMMITS recipes
Date: Wed, 30 Sep 2026 13:04:05 +0200
Message-ID: <20260930110405.950728-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF00008555:EE_|AMBPR07MB12117:EE_
X-MS-Office365-Filtering-Correlation-Id: dff0a66d-fe98-4c5a-f6b0-08df1ee2924e
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|376014|23010399003|1800799024|56012099006|10067099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	WjXk4uxfIY2rOmLZpJxXPkrE//CjiNHETa3JmwZ0YCgK+UVpUGnDH3F0csuV+1x9lQ4tie2qmOFbLRX9Zsb+7BC2NVIQA/babez0ok7ji1uED3NuiWCOeTdazs3tnyOuD7AC0m49NoflcvOXoWeYJzzkO7T+EkVSLMvfjbZyOnLbqlW4/0arzkBc30AtKkg5ZzoMuY1pPe+SYkDV5UfXZdymwXkrwH7p+AyUE+gVm7XsgNIvQi5kvDCXhbld1Nno5C+Dxl67xp3q7EVG3HhzY89qVh3FPe2fR3/wSG4aHFqedEqcTXENxA+7OkLycTFZboe2ORw7H5IIauDZMfHQRzLkzNV8rTF3Euxb0LFFVXI4iUpIIhvDbELnEHUDayEa0+uTMArFpskzzzfcuRswIEDdlmOHStuhFtVdJFaerjluQkYU8SzxcyutLh8UF+5P0f8Ia1JaMDFnZ80Orm9ujG6e66ta16TpFK3UzzhpTiYV1t6hu5miC+JnJi73vsxnolkV417YL/4YnvUVuXJkz6TP7u/SlbchksaYru5nSn1w3EUvMdf3Vh//co8l9UUjU3ABs1b86qTlNdGb1S7fTfUERVP/mZJlJzab4ZkSSqQgVsl1U8EgDzUYXrVynkzCmJudIGVRgCAhH2wyJAJqVETI70+LDE34oUH7R1uFrfSzSvR+LrB6pNBK7ORDreIi9HaU3BBhiRECTgqDXTNaMQ==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(23010399003)(1800799024)(56012099006)(10067099003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	NJQLszVbGDsKWF0PqWywUz4NVi4o0/keaGKXFgo/PYnDg/GQHPEBTV2bzDmOVB7zSUO9nfyayzWkwJZJjr9GGZ9GymnNFWYMB5NPCuJu7h7tHbyUaj19uvo4xl9N/fU01imvisb0u0ErT3Unw6ZT8Qxxie84gddKBQfPUnIEvtAFKRPOJA0K4KzFVHDyfR0qWUUXJmlFaa/ZbjpMFlxjt27693ZbGlK6jIG+pTqv/LqueMk39LuVZgnVfBMhYBoe3wXhAzYLWTbwbSIdBuHzS3T5c6Yu4qid4DrLMV/72R//TuBbgHGTUZO4n97rW9VILg407WeQVEh0u6oIXcM+cB0wj/uJoD3n/EgH9UJ+HxZBayNySP/s1ncWOHWOBfhiHk94h1xxg3j6anHIQ+ytlhWhKr5VbWY0K5HgXRkLbAW/y4fQ+KgxBKBcNO7p+kXe
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 11:04:17.5187
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dff0a66d-fe98-4c5a-f6b0-08df1ee2924e
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MI3PEPF00008555.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR07MB12117
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 11:04:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246955

From: Daniel Turull <daniel.turull@ericsson.com>

Found running AUH --stable on wrynose: recipes with
UPSTREAM_CHECK_COMMITS set (gnu-config, gn, piglit, etc.) always
reported "-new-commits-available" regardless of stable_upgrade, since
that check ran before stable_upgrade was ever consulted.

AI-Generated: kiro:claude-sonnet-5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
v2: restructure the UPSTREAM_CHECK_COMMITS/stable_upgrade conditional
as a nested if/else instead of if/elif on the same condition, ordered
to mirror the stable_upgrade/else branch below it, for clarity.
(feedback from Alex)
---
 meta/lib/oe/recipeutils.py | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 99e7bc7acf..522537e0d9 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -1069,16 +1069,23 @@ def get_recipe_upstream_version(rd, stable_upgrade=
=3DFalse):
     else:
         ud =3D bb.fetch.FetchData(src_uri, rd)
         if rd.getVar("UPSTREAM_CHECK_COMMITS") =3D=3D "1":
-            bb.fetch.get_srcrev(rd)
-            upversion =3D None
-            revision =3D None
-            try:
-                revision =3D ud.method.latest_revision(ud, rd, ud.name)
+            if stable_upgrade:
+                # UPSTREAM_CHECK_COMMITS recipes only track git HEAD, not =
a
+                # version number, so there's no way to filter for a "stabl=
e"
+                # release; treat as no update available.
                 upversion =3D pv
-                if revision !=3D ud.revision:
-                    upversion =3D upversion + "-new-commits-available"
-            except bb.fetch.FetchError as e:
-                bb.warn("Unable to obtain latest revision: {}".format(e))
+                revision =3D None
+            else:
+                bb.fetch.get_srcrev(rd)
+                upversion =3D None
+                revision =3D None
+                try:
+                    revision =3D ud.method.latest_revision(ud, rd, ud.name=
)
+                    upversion =3D pv
+                    if revision !=3D ud.revision:
+                        upversion =3D upversion + "-new-commits-available"
+                except bb.fetch.FetchError as e:
+                    bb.warn("Unable to obtain latest revision: {}".format(=
e))
         else:
             if stable_upgrade:
                 stable_release_regex =3D rd.getVar("UPSTREAM_STABLE_RELEAS=
E_REGEX")


