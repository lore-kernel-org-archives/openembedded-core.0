Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 512AAC624DC
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 09:59:45 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.3])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9240.1788343178800317946
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 02:59:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=UzzR1vUQ;
 spf=pass (domain: ericsson.com, ip: 52.101.70.3, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ih1AcIvAvdgbulk3FHgpX51aGvkcrfx/Or0lxtMTqWfXFzgXzeSsoxfncI6qdLTS8hfFNQgZEHi3N8xrPI6JWLxtI+B106CmoQ/txgy5t53/NKxQQ2KTCaaRRShACAkOzlLPdGw1BN32wa+uzIBRXAFDsY5joO88SN2r/APnLgN38YnLtHVTUVaHv2LhIa9DlOAU4tIR4Oq2qD+wSf7LONqh/Da2bG8iFsM0Af8/kNS3E3fUMV1wXPGzBQZfjx67wPAqS1CxEBLEqgyuXi7Pu+YoCp7/gjNqgLpRU6bv6F77jFq/chb5X1YjpOgZw0uaOcgIOHgnEYDHObK+2rXO/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ONroZiIEPfA5nj1gbU5uw7Z0p27OBU7N06CLCaCOCto=;
 b=AKfASPsi3QGPuPKp+bkqZVJZo3IKNKs+m7iLPahcYAAbdbtEvesCm+kXZKxFUXLjANNTbupt+Sj8oVutY+rPIklTmaOygnQodqKIJXBkzch5xcyLSx13kCD5NtyjNqzN3OhyyQhd1+S0BpWutlXUO5hGRtLJAu1FhdpzOw2cxvVluN7b5iZx6ogTQwGowTqOV16sBp65WuilC28JbHRNCB4l2oy33H0IGLuStPakk5srQdnZQj6y0UUnlnF8Dalpi+rPEJV/hcY7dfQSjEQjszf/DLlW/0PcFNGS+ZbwiuD9tWDETT9+A0vFwV3My3g9A2d4uL/aI2BC3H015ad+1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=bootlin.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ONroZiIEPfA5nj1gbU5uw7Z0p27OBU7N06CLCaCOCto=;
 b=UzzR1vUQ/uqhYVbwwRm1klQVqjsMUBCVNN1yJBis3axp3q2bZUhf+9ofMVKDymoeQcS0VruVINj9w5E/GgGtSpIFRVqBsUYFjvK6ZLtJAZM8ol5fp8C64OXQ6Cr1cUCtrPzyrvd9g1R8rYGnu2eIBk/GKvJf94VuD9prq2x1xiMLQLMEN/BVzET+OOOWazNK1+FCoP//f8pEWHqBVfaCvZYUzSrreQJ7SfMevNyd8v0LAUfkC8tbA6SXkKIO67AKN5AbYDv+L/MXyfvKcQ0kTJdYy+yQ2jCQ7nuRKYD8KYapjN2XQ/aZN76mU+7KXhXtYVAkRUKUQgPxU/MAVqMEvQ==
Received: from AM9P193CA0012.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::17)
 by BESPR07MB997850.eurprd07.prod.outlook.com (2603:10a6:b10:147::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 09:59:34 +0000
Received: from AM3PEPF00009B9C.eurprd04.prod.outlook.com
 (2603:10a6:20b:21e:cafe::19) by AM9P193CA0012.outlook.office365.com
 (2603:10a6:20b:21e::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 09:59:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AM3PEPF00009B9C.mail.protection.outlook.com (10.167.16.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 09:59:33 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.64) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 2 Sep 2026 11:59:33 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id 699494020B42;
	Wed,  2 Sep 2026 11:59:32 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 3961C700CF25; Wed,  2 Sep 2026 11:59:32 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chen Qi <Qi.Chen@windriver.com>, Antonin Godard
	<antonin.godard@bootlin.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>, Daniel Turull
	<daniel.turull@ericsson.com>
Subject: [wrynose][PATCH 01/20] recipeutils: add optional stable_upgrade parameter to get_recipe_upgrade_status
Date: Wed, 2 Sep 2026 11:59:01 +0200
Message-ID: <20260902095920.2840293-2-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902095920.2840293-1-daniel.turull@ericsson.com>
References: <20260902095920.2840293-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009B9C:EE_|BESPR07MB997850:EE_
X-MS-Office365-Filtering-Correlation-Id: 5294078a-82ad-4b54-4903-08df08d8e3f1
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|23010399003|22082099003|18002099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: 
	UHdDc46n/+MMZnH+woUWcuNxSP5GCfNWuxcUOb94EULeCpIAwHPeJrm6uIYyA8P1LbTFbpE3hNiAtcxEyS4cKpGcOnE8avsExA2SP4rDj0d6HZ/s6/xEF3TBt+Wk/MxblpiHOkJWV1giKm/9Qnnrg8yLqG9VfStaDthtDAiZ0a8aG0uEcIOCXOF9CmwOmuBy9lFCGzmSDDuPMfrsNr4l39gcaLqRIrozeGuiOphgR5xixqgRya6sn8Gc71sx4yf/l4zZ+XY7dksnA16HX+yV2N74vBHEBxm72p7olbKIt9W3R6OMKGBKOldbu1nFrbaHJZirTw1XRv0YhJlv2oik8/YaK7Miq3wXpt4ydsv1vn2FgwbskoswKqWvMB6NuDcAyz1aYqoo5uFnrsy2TuiSjqnUUWyV5RM6Ie4Z3+aC1frlivKaMOekvaVBla6sDOi2el7oGqgsLCyhjYA1MRSZ4X3avyORByvq2PwhRTb/5XtbKDphAYDfnAlsyZB/nAoSG71cKoQthH/didg6C8MIsCDIni8dVmq77T7qC9FHkg+NuvAmar18UtsPSTfQI3gJzgVdJVpZYiY8ROJieRN2MJPngo493xRgIe4Jh0WW1J7PCKuy+E8PrL/j9tKZNRfZ1AHqhCVitKu6KXC5OeQv9W0/ma5MOsHUs7k1vhn+p/QPGvT/Mr1sT/pNNIfiOdICSutD6O+bccG47RimM2seyg==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(23010399003)(22082099003)(18002099003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ln9OTQSu9oKTfymSDwBeEA2DCwbshRvapR4TsoEvOnd9dVAYYPdnfbMxh7GWHgSAyDrUbR3yMMl8Rsk+/z4zNue7c5MQ3QaClNtHt0dN4mJR0t06HUK+ybRBsjdGqOtat/3Yr3q/NNrNRWzoqDvlS5bvmOyILN8VNV5CReLcBWDNP/qyrF3C+YVZi3k3BwGnBuTifps7XOPGT1qzBamfmrh8+ZRh4SAKRU9IiIWx15Qqtwtavb1HfbRHY+rpVLyIX71iWxr75PosHvme7uY2WvPykp5bu9bZFeaK/D3PNaFU+UIh+y9H1q3RYfvO0nUoQAuuD+6CSWnB98Y26VKWmmpiw+WitvSWE9ewyt6zKVpLrvAqJfnuymZVPEzygvf4dtbIkyMBOW6zVj9uFcO8rlmpWgLEGnzm7nn0BSsZPhdN0DCEPWAb1wq8xS7cNmX/
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 09:59:33.9503
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5294078a-82ad-4b54-4903-08df08d8e3f1
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009B9C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESPR07MB997850
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 09:59:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244911

From: Chen Qi <Qi.Chen@windriver.com>

We want the ability to do stable version upgrades for recipes.
To this end, add an optional stable_upgrade parameter to the
get_recipe_upgrade_status function, which defaults to False and
when enabled will try to get the latest stable version of the recipe.

The UPSTREAM_STABLE_RELEASE_REGEX is respected. If a recipe sets
it, it will be used as the filter_regex. If it's not set explicitly,
it means that there's no stable updates or the recipe hasn't been
checked yet.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1ed8fdda035dcc21f3df71c0c996973224f4f683)
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/lib/oe/recipeutils.py | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index c6604f536d..7c1df518a8 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -1009,7 +1009,7 @@ def get_recipe_pv_with_pfx_sfx(pv, uri_type):
=20
     return (pv, pfx, sfx)
=20
-def get_recipe_upstream_version(rd):
+def get_recipe_upstream_version(rd, stable_upgrade):
     """
         Get upstream version of recipe using bb.fetch2 methods with suppor=
t for
         http, https, ftp and git.
@@ -1080,7 +1080,15 @@ def get_recipe_upstream_version(rd):
             except bb.fetch2.FetchError as e:
                 bb.warn("Unable to obtain latest revision: {}".format(e))
         else:
-            pupver =3D ud.method.latest_versionstring(ud, rd)
+            if stable_upgrade:
+                stable_release_regex =3D rd.getVar("UPSTREAM_STABLE_RELEAS=
E_REGEX")
+                if stable_release_regex:
+                    pupver =3D ud.method.latest_versionstring(ud, rd, filt=
er_regex=3Dstable_release_regex)
+                else:
+                    # Not explicitly setting "UPSTREAM_STABLE_RELEASE_REGE=
X" means there's no stable upgrade
+                    pupver =3D (ru['current_version'], None)
+            else:
+                pupver =3D ud.method.latest_versionstring(ud, rd)
             (upversion, revision) =3D pupver
=20
         if upversion:
@@ -1094,8 +1102,8 @@ def get_recipe_upstream_version(rd):
=20
     return ru
=20
-def _get_recipe_upgrade_status(data):
-    uv =3D get_recipe_upstream_version(data)
+def _get_recipe_upgrade_status(data, stable_upgrade):
+    uv =3D get_recipe_upstream_version(data, stable_upgrade)
=20
     pn =3D data.getVar('PN')
     cur_ver =3D uv['current_version']
@@ -1119,9 +1127,10 @@ def _get_recipe_upgrade_status(data):
=20
     return {'pn':pn, 'status':status, 'cur_ver':cur_ver, 'next_ver':next_v=
er, 'maintainer':maintainer, 'revision':revision, 'no_upgrade_reason':no_up=
grade_reason}
=20
-def get_recipe_upgrade_status(recipes=3DNone):
+def get_recipe_upgrade_status(recipes=3DNone, stable_upgrade=3DFalse):
     pkgs_list =3D []
     data_copy_list =3D []
+    stable_copy_list =3D []
     copy_vars =3D ('SRC_URI',
                  'PV',
                  'DL_DIR',
@@ -1134,6 +1143,7 @@ def get_recipe_upgrade_status(recipes=3DNone):
                  'UPSTREAM_CHECK_REGEX',
                  'UPSTREAM_CHECK_URI',
                  'UPSTREAM_VERSION_UNKNOWN',
+                 'UPSTREAM_STABLE_RELEASE_REGEX',
                  'RECIPE_MAINTAINER',
                  'RECIPE_NO_UPDATE_REASON',
                  'RECIPE_UPSTREAM_VERSION',
@@ -1180,12 +1190,13 @@ def get_recipe_upgrade_status(recipes=3DNone):
                     data_copy.setVar(k, data.getVar(k))
=20
             data_copy_list.append(data_copy)
+            stable_copy_list.append(stable_upgrade)
=20
             recipeincludes[data.getVar('FILE')] =3D {'bbincluded':data.get=
Var('BBINCLUDED').split(),'pn':data.getVar('PN')}
=20
     from concurrent.futures import ProcessPoolExecutor
     with ProcessPoolExecutor(max_workers=3Dutils.cpu_count()) as executor:
-        pkgs_list =3D executor.map(_get_recipe_upgrade_status, data_copy_l=
ist)
+        pkgs_list =3D executor.map(_get_recipe_upgrade_status, data_copy_l=
ist, stable_copy_list)
=20
     return _group_recipes(pkgs_list, _get_common_include_recipes(recipeinc=
ludes))
=20

