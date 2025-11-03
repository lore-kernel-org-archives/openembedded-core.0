Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10158CCF9FE
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 14:32:22 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.80])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22256.1762180335060390657
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 06:32:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=JMkHmyXK;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 52.101.70.80, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ESGwwEMtjsSsUQsGYTMHn7w67lpUgn5ap0xdI1pfYUSoN16bM3kUvGM4JvETX325JbMY7TTXkUCX0cM8nxRlw9kyZ2IXlRSNk8h3RF9ntSWkoSK2ob1U8sTWEa/nFc3u0FhlMqeaVeln5/cKH+ZEOOgYiIbhR/oEBDUTVF9DDF0zgNeDhTp1wL1LFLvGrslv9UHn1QA89/r3XlDSpJBP9Jkd5eIxRmkrbPwoLXzH6pAxNqldV08QPYRIdLaz0c9YQpEAWJyVTRJ+vQz5CwAaqcB0lu+64PwpaiFyNBmZUe8Fd6vQobsbiCBkCo0CJ2kBl82XXNJUlNUhqQ15t0sd7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0YvBv20ZeHs5+m5oaxJYZuiXU3tkg8OKp7HTswJdha0=;
 b=dNGOX+j5yJZa7W+6T61rzaw8kNjj0qGLvUexvovD5mwA30rBzZYwPmz9otX7mMdJqjC6wsYQqjOF35cOZbSvvok6k/BjqXlw9hCeTDF9/B7w1eOrGkkyTbpiA5YAHbmx1H7fcNrT5d/qjwwKWhkflwe5qZDoABwitumNp4NLgiTW1IZ/1TOyoZ4SOMOhbneYko32+Cect3NkvyK5SSD2znxPdALhkF/2nxkBH3uqD9r83CclCpOscsvmWTqdNrxH3KhFtCOXCVNFdQLtUJHSitTxFX13Ek4lUpGm83d/ammQpGOyrfNgUjVYwipCFvqF/oHfe9vIQEsjCxZ1GCSQIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0YvBv20ZeHs5+m5oaxJYZuiXU3tkg8OKp7HTswJdha0=;
 b=JMkHmyXKioSZXRseLL5XcYqCj4Y7IpDUz6/mN7BFB1MPDzzujt8JNmk7JBktLpSx+AjyuBvBOYWwb9XtaXuNNQtLNnRnoJml58Sz7SBE2UVRKkX6LEDTxLKc2rceYLwRFbbnze+0z/5WohiIkCvmXCraenCSpUOfmImv7Em31qXv0d/AehKClAw4ObKWbpHmSzyPlOF+tYuBfzzJalr0a9quGQL+EWfL+crUTksSkL/qvq+kZJpZd1fXl1d54DCcN/5R54dJwIrz4jq+R2ebixu8uwY53oF+JSv10bnXjB+FwdFeLDKN5cjZjnQikvlzjkzfFQtnJILox2PuaMW2Aw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by AS4PR06MB8517.eurprd06.prod.outlook.com (2603:10a6:20b:4e4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 14:32:12 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 14:32:12 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: ross.burton@arm.com,
	rybczynska@gmail.com,
	peter.marko@siemens.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH 2/5] cve-update-db-native: pycodestyle fixes
Date: Mon,  3 Nov 2025 14:31:54 +0000
Message-ID: <20251103143157.315178-2-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251103143157.315178-1-niko.mauno@vaisala.com>
References: <20251103143157.315178-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0085.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:a::8)
 To AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|AS4PR06MB8517:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e9b7458-61e7-488f-0646-08de1ae5c695
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?acGEmn/aDTRUi2AXcnbMY6nGjuRB6mgOKQFeBnnvTNGqyDjO8wvIhQWf2lkG?=
 =?us-ascii?Q?ANHkeG4aDsf5oR1qPRYJ5FUAG4fRd+uHp9k0sbXhpK9MmjSExvsKE4cMAq78?=
 =?us-ascii?Q?qJ3HqwKpJEEOWb9FIlRrcDdQgA6lv7EMLjL5c2XjbdH6Kk7LI44fYnS2TGLe?=
 =?us-ascii?Q?OyN7OglmTIsuEQWGBuybsLqIDk5w8sbmnn5ID6rOHaVWjSFgz6DVPk7X3rLK?=
 =?us-ascii?Q?j21cYdVtuNHumf9ZoT4LHkhK3ISRJdRnMlrgfjGl0auWBjpr87stIxuyY0r1?=
 =?us-ascii?Q?lTxeqQfZnFVHtHCRDcmkl+kgQWdVybom28iSpvD69H0C/lheyUM2MPtVn41P?=
 =?us-ascii?Q?UY8uoO7LcJpWUdmmX5d0j+uTZf8v02wt9/MuCQk9T6h2NiOUgHu0llaweTEL?=
 =?us-ascii?Q?6oEMhuXm+wPZD2yTvSBx2WZWHvQTLsEWhdcdcR1Yp9ekD7hIwz6Xz8RjK+qm?=
 =?us-ascii?Q?fe0tv8/WQVvAta4n+j8JGBKMYaIy+WCYLQaZXG/jBm3TZL5KQJ4bQhX0j654?=
 =?us-ascii?Q?3A9/wqtZHaVsvLaJtL9vZ09GEyNbA7kt4uAOu+kLj46SLQnUr4wtDBiuW3Nu?=
 =?us-ascii?Q?3GlGits/QcAWKyrPFIshhNOdrePJEnAxCelZvyWPx3zsjlE77KtU4lD6lrUM?=
 =?us-ascii?Q?H6qB/2W5FmIW7ManSQyC7obdAdTv62BX1HYV1alrHXKM/wQm57Ye/oyTH9rL?=
 =?us-ascii?Q?I/zVXjhPzjAd8sWHhG9zZnIHdFMvALw8PxtG+nI7O7OM0BkmB2OPJbU4RqZ+?=
 =?us-ascii?Q?rjIlG6r1BZMfRHJ7HrcFtylQiLtantVwoVAuADNZ9AlfXHaRO8udSeuyoDu3?=
 =?us-ascii?Q?wULW8BYq76cmLgNY+HCuWLwCoj6iPAw8vU7jHtvSfPBLtKsFYf4y1g25kb+o?=
 =?us-ascii?Q?/qjhrbgKbrk64gL+ObeyIOOjZ4yf5h1rPMwIYTT9gmTIWqHlLUumBbSB2Sxp?=
 =?us-ascii?Q?MHO8fwFcV2DEHbS4mUPYQ2/mrU9lfAD/xiAGqV2RrCDe1FAw+aqh7kfIK8rO?=
 =?us-ascii?Q?2zhjtMz0s6fwl8ClkzhGxZMGpFtxDAvI7q1sxoau0eK7fKEVO1pDLAWqHmZT?=
 =?us-ascii?Q?MhZ8SgH9yBSFG/UY9T5zH/ABEQJXouA/NHW6wOpdDfvtyw/aDmmES03BRyl3?=
 =?us-ascii?Q?KNSfrWSOHMsKELpZzsAaDSWO16MjiYvw9VyLxszhvxay3VBk5WTLWpePyAZx?=
 =?us-ascii?Q?u1teyEl5CFGzh+lhGtgxWabP6ZuG/qFUCPmu6PovhdHQ3IqZpo4sAs+Y7+CG?=
 =?us-ascii?Q?VNSM1M6J09kxxEAF2KrH0KPFyikH8G53W6Qg3dUx5UTt5tKKue/73/tZ1400?=
 =?us-ascii?Q?QFWw5dxX0x20qPmqL6AzOTurJ1UAYnPxw45v1TCQ9pKfbw2m0QILChm6u0zk?=
 =?us-ascii?Q?SKW0XfGMUCQpOQ00SP9FiGvhmTP7cJrvR1KEV81RsB0X9wwQRjlmfk3xpVO0?=
 =?us-ascii?Q?2ATYH+1APPwmWNaOQvaEOJHWX0sdDmNsWBKTsVVwVNdxKKPblHS4/wX8K3f5?=
 =?us-ascii?Q?dsF5RFQBUNDNk71aHP6kv1Au9GPeEE/Hzzia?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GY+zb9CEMY3G/dGc5jvbfMo+FCx28L2UaQOyrCgFFaFKyp2qi9m9mLUA0JA+?=
 =?us-ascii?Q?ZUQwbNxWnZNEQ2QugRJYUvoCcYy4yss/PLTlN0XvcnCt5jcIqWwBWkayMs19?=
 =?us-ascii?Q?7bzOmkh1Y6hjmatTP+fpuJ2QEVCM2gnVehZS7klHaLxjckJJ132DcR4p/ZVT?=
 =?us-ascii?Q?dczrQ943xyeqCxvmuFG2oZvk8zsKJvtuy8Rj0n4Ikmy0xS5AvsWzcrkUB4Rp?=
 =?us-ascii?Q?TCzg7MqmHH/ppE/otAoYTt3RIq/IOS+Ic8PM6Al5xPSXWkhTUgKRhSfDuVA0?=
 =?us-ascii?Q?+4BN7n8KZ8NRyMBjnTjm4QntBFaotCYVdlafnQrCn3++fwHF7+CAS3JOokUC?=
 =?us-ascii?Q?a0/cpKl03nAvViDkiEMN3jvcHprufm2ER7g29HpFTwDKJJxdda2/2fcl8mS2?=
 =?us-ascii?Q?LVHaIwtEUC0ieMObONq9CnUX3lLAIAwGt53KCwe2DLC8Z+QKvij4VeB58iWe?=
 =?us-ascii?Q?n/t67NaeaEO+Il9c0C4W0yH5IlXMwFsdnW2Gddo50KnHcuvmoc4Xd9eKSejd?=
 =?us-ascii?Q?PrT2GZZV8r+9VYA9IMK4GUE3GsdbUdhem/KZdhWA3Qhi2x0Q7Nlu9HQZfGbf?=
 =?us-ascii?Q?IZ52vEhTMAZaen0GzKb8xeAq7y9cEMzYNgp5G0km8SNqFyNLhxqO+dHwyhN8?=
 =?us-ascii?Q?JtO3aflqFBE3yo8QTECSu4ECGujpjY2wCr5/hsfOIGdVYPfgBTRS0zXcQv43?=
 =?us-ascii?Q?LaCOwaAU6uhh1ORD03tWE3JC0xu+41kA3HDm+OiWeFnnH03tTWCuAvDKM6Jj?=
 =?us-ascii?Q?HNqCnMAZmZhFnYx/8s00MVngLIYCUc2+K93iBVn7Nz0B7g7Ty+3uuwgVDmii?=
 =?us-ascii?Q?3XCyVwTf8fd21UfI1scTUPvtrNgKGStOn7xscP1EiPSo1sxrNfKFjZ7vsMx1?=
 =?us-ascii?Q?mk7863rnib/lwvwhugc+hViVPRh4bmhvuInKkXVcPHnVkJuIFK7tOEeNJc+K?=
 =?us-ascii?Q?XkUucBH5H0XNzUQR3pqrGmTYCVd5ASNjP+iRPKJJWU73WpUhIlV/1VDEOFns?=
 =?us-ascii?Q?dK7YtpJDeDtej7/c3tVh+Hr27PXsWjRVQeJ9yduyZVJnOCKjmP5zPBRV9JKI?=
 =?us-ascii?Q?Epi96ZidjN+AJOGMOIEOroB49JVL3tcjZs0FggA2Om3lRxQYUiOdmCyjbm7o?=
 =?us-ascii?Q?121dfZuKcdkZTw23xNPKo4i1wb/BKzIlRMjRlWFI22VnG+2KtAIx1wisAKg2?=
 =?us-ascii?Q?YnwzSGUt9/vta/Jm4T2IDsuHtJpXwTLZDUjO/a0UAZL3xGRuMDoPFDzjK9rl?=
 =?us-ascii?Q?X4IjVCRQkCIof/8+S6O9ZdNW4UjnMCbI9mUvVceInXJCI/WR/HaDe0gN6+h7?=
 =?us-ascii?Q?4cMqXoSCDyY7N7LfzCfBEK7DwDXV1cpx7/AvSDWTrhYbJqyEbD7FE1VMaNrb?=
 =?us-ascii?Q?Gh00q8rzNvVmEom5kuXfkjm0beEbWyhkxO0TlbscwZFWXySUME+TgR/LOHRW?=
 =?us-ascii?Q?C3wMylPpZf04MNtWE3swkWeqiGSI7/eP2Zkxq5Ba79Psmqu8XTiUQwIUsCkY?=
 =?us-ascii?Q?FldO/63JoJjh4hIefRIQmHpe3nAvllfOisN104v2OLZW3h2sukL7H7UGKtLc?=
 =?us-ascii?Q?PIFvEuvnZfJBDdd3IpaYVWWcN6QAzvrAYx3Qb1+IEdhI27o6/ssfT8Y+iCOX?=
 =?us-ascii?Q?dw=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e9b7458-61e7-488f-0646-08de1ae5c695
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 14:32:12.1538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l6Tr47hBbUwTOzMeAM08qzCitJJwtTXYUVM/f/8B0bMh2HVC7XQWPPPJsF/cVj2ZQ6hYL1BRkrITJCjcloHahw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR06MB8517
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 14:32:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225657

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


