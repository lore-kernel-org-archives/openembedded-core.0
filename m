Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F461CCFA00
	for <webhook@archiver.kernel.org>; Tue,  4 Nov 2025 08:34:11 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.118])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13398.1762245230231928511
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Nov 2025 00:33:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=sAMf2dIJ;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 40.107.130.118, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ejaAIaa5HdNKd3ZYnFBMA6Qe4rqMfROPOv6XEoQrw5WQGIF/1LMi4taHH9PXiKoMYKR+QDUrPMAkxcmGXQZWIOwk7xL69ZbC/KvMnL4+Y0C+GIh6jyoBOSULTKvnB2Fa6IGzQN6FweH288WsN6U1f2HJQNkNXAKaSWdsZhcGew+kssZmx39tgq2pcKr+Beq164WmhLg6x4uYPQxUqwr1tKEzVDmvmoI5Ejw/tBxI0sKDHn8dHKEV2+Oy3OQv//4YuQltPzSFVyEQQC+6yA2Zzbrw+q9n1CO84N8MTq/xcsxEsyBueDDq8JTgaJIsUui/Rze4hMltRLHcv3jtxNKjkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0YvBv20ZeHs5+m5oaxJYZuiXU3tkg8OKp7HTswJdha0=;
 b=mOvrqnfSUzJ5A8y5nlU40uDpmDTDw6A4kLUCwH+ugrFZUGYyrR02G8ZBlsmUAUx3Q4MgPaK1LlPY1C1zCSRdPmWcfpKeA9AXDbWkK2NpKSGx6BeqZj4MnmeCF7DqT/difZp0tlTSPJRj10higolo8FmLBAr67Mzi10r655vyJwaVMMK++Kf3T3yp69fjPFCZtfvtEsh+cir3IlUnZQjmH94H4y+TP4Cvk+Dg//kBY+INJ6e9RLSarXMMMHOcvqaIlduwg0M6ufZLa/mtntHM0sDmQVhia85xy6fq3tyeN+Ja05+Yv73scvVibejgeFlbgoAFDDypEjB32HENiyxA0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0YvBv20ZeHs5+m5oaxJYZuiXU3tkg8OKp7HTswJdha0=;
 b=sAMf2dIJ34/IHklfVWAd1J7tqVf0ITS8uvpkMUjT+MlOLmccmCFXZMO+LXW4ozyMUURAqLQrzJobusrDJHpr07X8/+P1P0ZJnVMr47du2urbsNqElgp5GR/+wUCk/ejQyHhliV2h4foJt5qlUaLM3AUu1RmG3TmDqMuxhFG5rh0flePbJwcp6+iPJIlIuPg+sqPSwMG7Rt8pnhP1QmNN5matHBZ9VvNCJCz4RgYKUZJ/4aFcy2ReYLt+JOwP5fHJRpXJehRkflJoLScU+wVUpcDiSfNzSCCR4jdQfC4iooml1iU5nnSBWGSr3Cre3nxoFZ6U9q+nawrWCqwVnHiQDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PAXPR06MB7405.eurprd06.prod.outlook.com (2603:10a6:102:de::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 08:33:45 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 08:33:45 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: ross.burton@arm.com,
	rybczynska@gmail.com,
	peter.marko@siemens.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH v2 2/5] cve-update-db-native: pycodestyle fixes
Date: Tue,  4 Nov 2025 08:33:30 +0000
Message-ID: <20251104083333.814331-2-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251104083333.814331-1-niko.mauno@vaisala.com>
References: <20251104083333.814331-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF0000384D.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:9:0:f) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PAXPR06MB7405:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e974eef-97a7-430d-97a9-08de1b7cde45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?aBdOz0v7A1hRujYJQF8kOyJA+phEElAGjFeUxdmHdgsCTyvBiGQJjE95wwIO?=
 =?us-ascii?Q?3eokqOQbyI6DVy49nzte+DuVmXGqCe3MCNkyZe00yhHXxba7/ePAXQzhx7yw?=
 =?us-ascii?Q?5hFP/RG1Truez9yFuA/GsLm26kiy6MYU1w2DHhuDIzK9HGj8M4ute5qJsBSE?=
 =?us-ascii?Q?Lck/TgieIDIRISgYs341OXiPNtlWZ3Rk2eJ4ionUAzNJOkcU2Rd37U1UUFac?=
 =?us-ascii?Q?6s7SnvullCV6vwlN+vvlafBTYt6nk8v5MD02uSXCdPMrygLhih4ZuwPGpajR?=
 =?us-ascii?Q?SIvW1QJM7sQ1w8B6usAaz18vIrsZXS3Q7yXtqTKs4Ce7eZNI0JEq7TotyLT3?=
 =?us-ascii?Q?Ycpp+zm62sII8xJeLoTz7rymv3V6n6qVJfAyYO4oFrGVg+FyTdypOBCjTC2A?=
 =?us-ascii?Q?BLDxdvmpF5MRyK0CDxbYNABsmdEkBKOjEgRd8VCyfBqDHsUHR1FqEJWW8QJW?=
 =?us-ascii?Q?K8sTXQAaUuG9zVxzmfGALmz4RYG1/vLotynou/sPatpNbElz98CLxsOTmrAO?=
 =?us-ascii?Q?y4leX35kA3bTNoVc59YeOaRqMU5suHDkzyLyae5OFaaDLXPPAE6OOseoTF46?=
 =?us-ascii?Q?DHpRP+JutBw8UmMYgnmjt//9RuX6X4rw6GNs7CPSBp4zqoMJD0o0qWxotShv?=
 =?us-ascii?Q?N7hOaAj29ZyJx1+L4aLrEGY0SKyF8p3ro2xIP0axIZJP0ZOLW579F0wYR2i9?=
 =?us-ascii?Q?7aVybHNKdRWKBpz+Q+/YUtPQoc946rZpS5OIv/IH8QHdFZcBPCp/kCUak9lk?=
 =?us-ascii?Q?s9NYBNGyoQRKU6BO9WPUvHBjKbnwkgcCGRTrkLsbYS5cngt45Jq6JgHdpINa?=
 =?us-ascii?Q?9oPlNKLuSAH+k6GoTdX0LFsUUtgMJIGICWVoCICzjrKsZUXOcLaIYaGFP1PK?=
 =?us-ascii?Q?fjVNtAa7WR3YJ2suYWdNky0bZD1kAKywk+FbINiwd1VDByvUcSZp1W5E1gAG?=
 =?us-ascii?Q?4vyqLg1kmVFP72J8VdwzPtxq6vAV2YWCbm27w611ntvW+cP6j6BhpPMc++en?=
 =?us-ascii?Q?xqZABSiMRhWIxos8QZqEzClezFy07+ZRyzcFlad78a8SIyNGusOg4J5Ybx+O?=
 =?us-ascii?Q?7p94c+tTag0aHnOk9LphrmpOBmFb0mFrD1l0OKwIPqAnGB2WV/XodT6JIs/4?=
 =?us-ascii?Q?jpmFPnMp2MN1Fj8/W8zDbtB/jaGHtc/gw2L25sKNaEtu5nishUhT6Zteo8Kh?=
 =?us-ascii?Q?1V9uaabrTUW1e8xyOqCUHyLlyS0K0GZjSgug2xXnwtgeQNDrHwSIyRcXjQAa?=
 =?us-ascii?Q?lAN2nyorXLPsZzrNvte8e+X0oF1IXc/qsqJ179VDkUp6rH+lVjQu8+bq8+PU?=
 =?us-ascii?Q?+QyCp8Aq7w4LeW5lM9EfXXlWQsfEw6Hwg04vVOJzBTCI1oR8VPQP3zvo1KQh?=
 =?us-ascii?Q?Lx7mWS8kaViq2JL4h/pruRJEp1Lq+Gk6PoUZtwb60xj9wxTd//wGBA7U/sA8?=
 =?us-ascii?Q?aSzlwhB7h+BukNJHwJ2x7rm9ZejWfFB8ud2TGFYkFCZOjTLoUGNSd/nhTb0e?=
 =?us-ascii?Q?L29u+YzHtxpXU2++neaAse1BfBKt3B2etHRN?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0M1lJ0QsGtkzybZpa3Ua6i0Xtw/usACb0fB3WOuWgMmVCmtuRb8JuBxAZ0qf?=
 =?us-ascii?Q?b2ud643+X9d0P3WQw8PnBD97uBmbtFyF6TNcaMQ+eBhXtLIZHSYDyew9BOCN?=
 =?us-ascii?Q?L1BsI1ld4+thTMlcmpybJU7Asw9AEwZPyMdspqpBeGngrDvQGHOnhso859zy?=
 =?us-ascii?Q?djWDoQwCa5uqGhj8btWj7s4FDnrkMg0kBNHElQ40DTkyEKTUiGi2klLxN7jp?=
 =?us-ascii?Q?DaaRl6yLQwWo/yqIBep05pvL22ex/DyPtWF92r5zw5S/7gkeeJuKbGtRgo1L?=
 =?us-ascii?Q?DM2ybCra+ykHLCC5h6naWmGyi5peMsFEyuUFH0AcmWdersEOC3NXnfoh7NB7?=
 =?us-ascii?Q?EVW3FNQtgmyyV7smrZiqbuejQyFsbESRyDbsnoUn07x0kMbAnQsCLK7vtxXT?=
 =?us-ascii?Q?kSXZ9XYQz/G8jIEL5KoJmKRJH3SmjWgAR9gjFYlAuU8X09Q92tM6daZbJQAv?=
 =?us-ascii?Q?CaMeOtUl9aThiMZ4AiM9hIOabZoGcbs2/AJNew0Dew84ZKAxIGTh4DseB0kL?=
 =?us-ascii?Q?tfHF7yj9WjyRkQtVy3aJuaMfhO+Hk9bDGVqn3wG8ybL5H7qlZUo7QVTeeiX2?=
 =?us-ascii?Q?OI+cF6O+RhsV5PtzCzkzOGL2pjsi22+5UrxHvZrZkDUYEpZXMssYRNcdO5HK?=
 =?us-ascii?Q?FiDd+ErmRE92TBfRc641ej6wIQJO5EPy0euioosQIwMNXMIgHrDJbrHzERcb?=
 =?us-ascii?Q?dFxwO9ajW/+I3MY4hwyC1eEJx2p6CKUDvP79G2Y2BZ9gV6hpotp7toY5Fsa0?=
 =?us-ascii?Q?xbBnf38JX43dgphzeyReVDfD1+PtORc/D2l8p3+FUUoSqurRJxADq53CeMVi?=
 =?us-ascii?Q?MRb0kvNfYHNerq6IclUig2EBat+K2V1qxu8rdIqcvg39IBfvH6cE3jBEMj0p?=
 =?us-ascii?Q?T2qXQdi5S90lEIghzH3AMFiv2mdhrCs7h8sFiJRpd0VkXm0eEbeWois9wjep?=
 =?us-ascii?Q?vty0STJhKipcoaQgbspxmpNQvKwQk+H2cCuwQ87c96SQvWO6NB4gfmQ3ESp4?=
 =?us-ascii?Q?s/aLaJQ+7s2ogBpHFDvB7rKZvZatJnbHSGVbmvIKKC7pCfctRu/m5deOW7gh?=
 =?us-ascii?Q?Rx2f3LGUDhKgkZWThZ05xVaYOaaBTrJCNGKHuy5lbSN8F5hpvrEmLKBI4S/s?=
 =?us-ascii?Q?25FgwWLQLna35G2vLRbIjxYPshnb3A75h4s1W+FkqSwgIrlwOtZa3YB0ipfo?=
 =?us-ascii?Q?sRFoD1gEzxmzKZ04I8DRL+Riz+QCRh2YHlqXROwlY/WQGu6Oej0DyN69a7R2?=
 =?us-ascii?Q?LZzRo+gIHrexN6LCwdsdWrN4ZG4JybQ1aKJDx5U4kzWbEJEOnUUa7Cb3Tpuo?=
 =?us-ascii?Q?aUKX69tZthZRvAMdZTOKeK31VpaqYAp5E9YTTUkRvL1YbDP+E6D5isQtEe7g?=
 =?us-ascii?Q?/UqVExSnTYxz6f/+4XkKmXF+eG1+I8F1qKoJSD0LDS68ywYpgZJraLA8vjgM?=
 =?us-ascii?Q?Yzj3wbZpamZFd7QQNgWtL6PQ8IKzLEVx4D1WyMBcDdzGmYGUFh9BmhaXqlF+?=
 =?us-ascii?Q?g73rTLQH0VN7TgceVE7JnFlCuWWJO0H0/MGTAMCc38ONxV2DmIIsr9howUfg?=
 =?us-ascii?Q?y3R6R6Pp1zWkfKQE0aYF0p5uSIQhFDgRJ79tDpaccfFnWq4ka3ynSNIBubit?=
 =?us-ascii?Q?DA=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e974eef-97a7-430d-97a9-08de1b7cde45
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 08:33:45.4302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sfnWhNdelnocj2PocI6VqRrbndqP55rxDnmZNA/IzJTHznNugd1shZ57cyDSj17wsmdBccOjX/BEri6Y3TMy7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR06MB7405
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Nov 2025 08:34:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225713

Fixes following pycodestyle complaints:

  cve-update-db-native.bb:80:39: E712 comparison to True should be 'if cond=
 is True:' or 'if cond:'
  cve-update-db-native.bb:128:20: E401 multiple imports on one line
  cve-update-db-native.bb:130:18: E401 multiple imports on one line
  cve-update-db-native.bb:171:21: E741 ambiguous variable name 'l'
  cve-update-db-native.bb:335:26: E225 missing whitespace around operator
  cve-update-db-native.bb:344:12: E713 test for membership should be 'not i=
n'
  cve-update-db-native.bb:347:12: E713 test for membership should be 'not i=
n'

Also leaves out a redundant 'gzip' import in update_db_file().

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-=
core/meta/cve-update-db-native.bb
index 713c73e574..3a6dc95580 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -77,7 +77,7 @@ python do_fetch() {
     if os.path.exists(db_file):
         shutil.copy2(db_file, db_tmp_file)
=20
-    if update_db_file(db_tmp_file, d) =3D=3D True:
+    if update_db_file(db_tmp_file, d):
         # Update downloaded correctly, can swap files
         shutil.move(db_tmp_file, db_file)
     else:
@@ -136,9 +136,11 @@ def update_db_file(db_tmp_file, d):
     """
     Update the given database file
     """
-    import bb.utils, bb.progress
+    import bb.progress
+    import bb.utils
     from datetime import date
-    import urllib, gzip, sqlite3
+    import sqlite3
+    import urllib
=20
     YEAR_START =3D 2002
     cve_socket_timeout =3D int(d.getVar("CVE_SOCKET_TIMEOUT"))
@@ -167,8 +169,8 @@ def update_db_file(db_tmp_file, d):
                 return False
=20
             if response:
-                for l in response.read().decode("utf-8").splitlines():
-                    key, value =3D l.split(":", 1)
+                for line in response.read().decode("utf-8").splitlines():
+                    key, value =3D line.split(":", 1)
                     if key =3D=3D "lastModifiedDate":
                         last_modified =3D value
                         break
@@ -332,7 +334,7 @@ def get_metric_entry(metric):
     secondaries =3D [c for c in metric if c['type'] =3D=3D "Secondary"]
     if len(primaries) > 0:
         return primaries[0]
-    elif len(secondaries)>0:
+    elif len(secondaries) > 0:
         return secondaries[0]
     return None
=20
@@ -341,10 +343,10 @@ def update_db_fkie(conn, jsondata):
     root =3D json.loads(jsondata)
=20
     for elt in root['cve_items']:
-        if not 'vulnStatus' in elt or elt['vulnStatus'] =3D=3D 'Rejected':
+        if 'vulnStatus' not in elt or elt['vulnStatus'] =3D=3D 'Rejected':
             continue
=20
-        if not 'configurations' in elt:
+        if 'configurations' not in elt:
             continue
=20
         accessVector =3D None
--=20
2.47.3


