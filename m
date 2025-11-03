Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 017B7CCFA05
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 14:32:22 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.80])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22256.1762180335060390657
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 06:32:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=dr7bwecg;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 52.101.70.80, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fyiq7Yd6/taUz7ZtJk82zNe2Hgjswme7Q0AnPA/58HCu517w+M50VEUV+i/0GpTP9cfnPo93kevc7mVej6Qu8g2SmZnGh0wfEu0H5VSoEyraG4qwFhjK2OMNcA5zzgTC8xnyZeJnvjnqgT2o26RLiSbnMeixtLaT3wXJuNm3+Y+IC74+nJouxbNhM9D2uvsSFCmFOEqulN5EmYcuo2XeBvkFi8KNHcpEDOV7IhCVFXRLHijGngLV0exobVL+03o2ZhuUdbK5pwtJkSe14UVcuUa2D3T6wjpWlZ0auLYmY4JqnJuUPOivHMfjkOm21hcXpOjmrylmLukqurUky7FHqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jaVj9rSEp9LUBXxicmf6Qfsc5xJt5BCOu4UpW2satOI=;
 b=uV0ycXX7iLxdDKQHG0twbG603io4pnwYP/kmVg+HD9zPdWUAszF3ub3liQTustbCxMyKcihSzBgaq0A4K+J5wXnYOVPsAFUwH1yufinhA2fMz2rA6p1ygS+ljAbX5G66xs/BJxYuO+g88h1GIcBiQWCv8GlfRpxrIM0URtFSrecTgRZOGYgUplfZdFCuTjwtxkFX6Qs4PxCfJCg+Scyx3LKRkXG2qAg1IO0BQ/wHF3kVTVpyWDWVHOw56pBhkXkqsTC6/BZSrUxPYKD9l/RQSejYpG+hZhut0qjH/AA0MzUMynXDjeUgeGfT4j69dZbaz0jAmuhj3osJjGMB/1Agzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jaVj9rSEp9LUBXxicmf6Qfsc5xJt5BCOu4UpW2satOI=;
 b=dr7bwecgOnt1sbkget33l0y3SmiO4+M9EbErddG6SqwGsgmUbA6yTeq6AM12UG3lqnFWnNoH0ENNkS5XRZBZ5bzL/QNlIw2Zs43oTnokNd61C2/vgpSqIM5dDh99KY27Aub3a9QwVHg2zW/fOzYKAT+1eC9YlxoVEY6R8tQkVIy6Kx4XppSfUxdzet3RMMAIyeewQTy8IdIgL80/t5cgw54BoJd6Snd0ma3fkT8KUrT7PWmYr+6KoYLiY6hX0N3jOhRM3hBB8dWgMBsFCVBvvNQsxHHmZZzhcFyguqvZFE/WZIlRSwohXQEDffdxlqFxPPq7EEZYCp6jDQ16rPJcnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by AS4PR06MB8517.eurprd06.prod.outlook.com (2603:10a6:20b:4e4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 14:32:10 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 14:32:10 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: ross.burton@arm.com,
	rybczynska@gmail.com,
	peter.marko@siemens.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH 1/5] cve-update-nvd2-native: pycodestyle fixes
Date: Mon,  3 Nov 2025 14:31:53 +0000
Message-ID: <20251103143157.315178-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.47.3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0085.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:a::8)
 To AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|AS4PR06MB8517:EE_
X-MS-Office365-Filtering-Correlation-Id: 26e4553f-caeb-4690-50a2-08de1ae5c54e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?JToEowYhQ4MCMTetKobfsvtK9LRmD8UgK8IIvKmYp4kwsOTWEcY79gTPnRyt?=
 =?us-ascii?Q?zBLDO49bvrnoPvcSikmQEC8ZpRifSvB9ojcnTAG7m3ni4h9FSygzs2+sagdQ?=
 =?us-ascii?Q?/WTv6bWWu51vouS1cZtk+AsA3HBU7DojIRkkbWQGgQaee/s/B5cb8XQOrRrr?=
 =?us-ascii?Q?qkDyjFMF337LnMyii9z+MSDVhTh4ruYELC+TpsfvT+27EoA2/+wOPEkgVY15?=
 =?us-ascii?Q?jwzRHmWEJOLATpvWRQdk8Gx5wgn8P9iACvpRjojRu90wV0L+59l0DJlwxs6Y?=
 =?us-ascii?Q?Po3STHIK/Nk1gqlG0Un5vI5TG8VfX8e6Hx2f0FtD4jtetlqEgZqPU7mUYwWr?=
 =?us-ascii?Q?gOMDt/rZYO/XsE/+D2VmoeigjP0qkd4oS8LVwX0w9ElRTc7K301GbRn+VFTs?=
 =?us-ascii?Q?ftox0l9NkKPB0Q85Rybs+9pWHSBaMl5o7H13zdBT0283fhBcTe+n5O8E0P+z?=
 =?us-ascii?Q?gIAiEO95cDMq2sR+VFap2NtUg3wCRvxNhjeJPdmjIANk6uXV2F3jfhL8s87o?=
 =?us-ascii?Q?COnz9qTMRMkP7UPOyRf3kCoQrn1ZiQ6Lh4YSHgP6kNZJVHXVZUYsr/1HAhcc?=
 =?us-ascii?Q?lJK2aPVH8/qmRXrZIkRmld5qoGv+fHYirYV40WP4HSrwLbZA/Zg/sqojhBQ2?=
 =?us-ascii?Q?xdwRz5CGd3jS63+zwaUh9U3ZJ+81iiViT3P9WJ0WQD0qAUtI5Rg6oWWSx4ag?=
 =?us-ascii?Q?HXL/Bm9Uh/SjI+8fIp5ohf9cL+L78V+fT4luNon+zO3QOdPdmnuBNoiP5uju?=
 =?us-ascii?Q?2WIDhekF8it7sNY15o2DN625zEcQ07Si/BeP7EhzuxQLd4haxlPFgW2j2EV8?=
 =?us-ascii?Q?M9nFKo04EIQbCSd+V0FxakbdkrquTadhiyUWsYJNpJ7+e4AVS2WdbVD5XGx2?=
 =?us-ascii?Q?3HXAVhew+EkLpofI8Mkpob6bb3fXpVWDCx8xdEyaNJ3O6Ji3lYWoRDkbSrHT?=
 =?us-ascii?Q?Zx3BGDrZFROy+zj5e9PWGQva4xRCyPMgJQBUUK7A4X/APk0e+e/IdRApoy02?=
 =?us-ascii?Q?ZCsM8IB82Mhxg4ctZfMqVpzy0ggPX8nUWoTu9+XQMJduN0tQ+UvN7Xs/IGqY?=
 =?us-ascii?Q?dDBujXhj8c44kR4ZcK1+Wv1c1EYE1DG141w8bfDlH0OylZSjLcnOFy3/rcOb?=
 =?us-ascii?Q?eGmUAOHQ15R/BDjpLQIo4PDp5IG3PWEeDJQG70JN0kF2GT8wJ/pwpTfJ1cKY?=
 =?us-ascii?Q?xjsAbGtfThqFQP0OsMJ/c9Nze8ylmZpDxfA3KlJqjC/o+G8SyFbTbluw4OZQ?=
 =?us-ascii?Q?NnJ6oxKqUp/xWYv3YaBh7q5JB81ObQj18pGpqx+in+zDZAPf2XMkkPEH8ge8?=
 =?us-ascii?Q?D3pxOVAnKBcpSrqVGJHhfC2Mmpqhd/8tQ80xJokyqXqFd5FCziExEdXSY40P?=
 =?us-ascii?Q?EGEUHh6hacQJlhu6qS9eQTZf7fJTIY2xlq4DHWewk3S4L0YWo0hdJ5a1cI+q?=
 =?us-ascii?Q?esWEVfgNG2E0J2IW598aca9ecCZeDp08341kfBpMp+nn+dTOI1zfL+tHg1aL?=
 =?us-ascii?Q?+lOw7zL+rJYbSn3tJjtRfkEkJG5S8+YhQYjp?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qu1fMbLzJvXwMLBIEk1yEzJw5k29lxYLDe0OnF/5LhEl1c9p646Hae4QlPje?=
 =?us-ascii?Q?NXLFQPRxh0Y0HYm9eLt3r4ugHPPOuY9w0+zYHPjN/5IA0/xfswYtg74vjndG?=
 =?us-ascii?Q?orSNUpwBUZ5Y1gqwMBKkL1z0RYyRuqSEHmzya4Utz4MxFeFC3vpP0WWlKSXg?=
 =?us-ascii?Q?PrNZCqQuqfC/rwPmQwSO8ET5ybHZbyfu38lmAjIW3o4OAgnCD4r7xuo2c4HI?=
 =?us-ascii?Q?hnc1W1POO7tKATRkeMoU9371rlzGb4X3rX5pCmL1UggnIvEJ6QdGCAc2yKDX?=
 =?us-ascii?Q?n3ayCR0TvHnwOP853BlEacKgEJ76oqSbLyfSgcLRG7nctlUGnlNpdLyl2RAI?=
 =?us-ascii?Q?xtbzbU49017zy5xypvx7trEmMlPZ1rPm0pdswKHz7YqY0BmbhzXeBwiEY+V6?=
 =?us-ascii?Q?CHbTgMCWYLddYYGFfjEzj3Llby5l3g5qacO+LWwU6+WHDyUSoGmgQJ30TVQE?=
 =?us-ascii?Q?Utxm4E1LFxL9pBZPSeVZfFtuJTR7cT4cjZc+iIV16TjBSlhgVZLyPLKh4NJx?=
 =?us-ascii?Q?RFVIqqcXOSrytJbf2Deb8XK3EjF1rm0k+skij2fnhmObdFcdr0YEyDbvpPHL?=
 =?us-ascii?Q?ptoqp+0uo08uyAnr9CvLcFN07r4PDGAJz56Re53uHWYvPD8/WWM01m6X4vi+?=
 =?us-ascii?Q?x+zevJJ+x1RMiA0BQj2RD4KjxqBWROlxH8fueYsR1TjAhLVJRRTQYNn5ymWO?=
 =?us-ascii?Q?/epzRUcKlyNo8O+vIiS6pJBmChraY4ga3m2e1goHI2dZ1cZFBdsErK9JGGLt?=
 =?us-ascii?Q?aXHA3915sjTENteJ6SXVf90nRhKLXJR6zC8JN9z3ABhs2VyklIZ/s3pI9vk/?=
 =?us-ascii?Q?9poTF7SgpDYfDoXCUkXSY4Dn6ZRfG3a4FZ4SSS8JtAf2dMG/9yh7aDYvm8kJ?=
 =?us-ascii?Q?5/y5Afn5P47awIoGhv9XuBA65esRkw+gZjtCZs4jeaDPw3FSqLTAbHEeDLoS?=
 =?us-ascii?Q?JJJepQUUaZVxYDrpcM9z/o1PafeWSvIpgKKIYBMKO20Thv+VPR7nHeGawiXt?=
 =?us-ascii?Q?+1JY5tlCyTK9tRpAsQKaPzziUzqvNua3OaO3URwdBmObNm6XDrxnUj+qHRsG?=
 =?us-ascii?Q?jvE+5VZ2iUhFFX/Butnm83MZSYOj36qdvhNb5lKbbZEszq+i0ZrCvgj9OfNf?=
 =?us-ascii?Q?nDT+CKwCaJknTuY6bXZH5Po/4Vqx+Tb5icUQCJTNEvneKHPvIdP7RwvjD9/l?=
 =?us-ascii?Q?RfqfCWKDjUONTMPZ8SAoeFP7DI01bEYXU8ZwhU6XohMzcNecUK/x846Ot6J1?=
 =?us-ascii?Q?XMd7X2QaMG+8tVBjqSUgvSyBmwgQGGOlOmS3Ck6VNQ+zDemb4RjUHKkwOw6m?=
 =?us-ascii?Q?mhzWdIyDbIzq+Lew9l+TtO5aho9E/DEurC93+cERqPDcQ0WOfnP1xRYhwOfY?=
 =?us-ascii?Q?z5MSPwFCr+/cXnrrKRz/6RZoLAHEvcrF06U2Wxm7YL07w4M8RvUXkQSnwOIT?=
 =?us-ascii?Q?yw+g5DkXLmYWh6ssfbXlcdzBHG+euTSKcCIUuJYo+S6vVaExfGhuf1x0TsPT?=
 =?us-ascii?Q?hBiLuJf/MvRV3zoynHIZuWRMxnWHFc78P/bren7CM0amTsmvKUPDYRliiev1?=
 =?us-ascii?Q?BX0C9RWcrJjbEKQi6UQBPDHwlEPMk3j7rkdTX6L9jky6jy3s9RouBxDCLDhj?=
 =?us-ascii?Q?Yw=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26e4553f-caeb-4690-50a2-08de1ae5c54e
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 14:32:10.3203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LCzreYocWx8EPsgHHEkrpHoLFVyhthFZs+//wS51CAmREHIlleYl/cZMV8P8Zh0yRDq3C1O+yz8X3XFMN4ayCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR06MB8517
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 14:32:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225656

Fixes following pycodestyle complaints:

  cve-update-nvd2-native.bb:95:54: E712 comparison to True should be 'if co=
nd is True:' or 'if cond:'
  cve-update-nvd2-native.bb:127:15: E211 whitespace before '('
  cve-update-nvd2-native.bb:127:17: E201 whitespace after '('
  cve-update-nvd2-native.bb:127:19: E201 whitespace after '('
  cve-update-nvd2-native.bb:127:44: E202 whitespace before ')'
  cve-update-nvd2-native.bb:127:46: E203 whitespace before ','
  cve-update-nvd2-native.bb:174:20: E401 multiple imports on one line
  cve-update-nvd2-native.bb:183:29: E203 whitespace before ':'
  cve-update-nvd2-native.bb:236:16: E111 indentation is not a multiple of 4
  cve-update-nvd2-native.bb:241:16: E111 indentation is not a multiple of 4
  cve-update-nvd2-native.bb:336:39: E222 multiple spaces after operator

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipe=
s-core/meta/cve-update-nvd2-native.bb
index 1411d16e20..abcbcffcc6 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -92,7 +92,7 @@ python do_fetch() {
     if os.path.exists(db_file):
         shutil.copy2(db_file, db_tmp_file)
=20
-    if update_db_file(db_tmp_file, d, database_time) =3D=3D True:
+    if update_db_file(db_tmp_file, d, database_time):
         # Update downloaded correctly, can swap files
         shutil.move(db_tmp_file, db_file)
     else:
@@ -124,7 +124,7 @@ def cleanup_db_download(db_tmp_file):
         os.remove(db_tmp_file)
=20
 def nvd_request_wait(attempt, min_wait):
-    return min ( ( (2 * attempt) + min_wait ) , 30)
+    return min(((2 * attempt) + min_wait), 30)
=20
 def nvd_request_next(url, attempts, api_key, args, min_wait):
     """
@@ -171,7 +171,8 @@ def update_db_file(db_tmp_file, d, database_time):
     """
     Update the given database file
     """
-    import bb.utils, bb.progress
+    import bb.progress
+    import bb.utils
     import datetime
     import sqlite3
     import json
@@ -180,7 +181,7 @@ def update_db_file(db_tmp_file, d, database_time):
     conn =3D sqlite3.connect(db_tmp_file)
     initialize_db(conn)
=20
-    req_args =3D {'startIndex' : 0}
+    req_args =3D {'startIndex': 0}
=20
     incr_update_threshold =3D int(d.getVar("CVE_DB_INCR_UPDATE_AGE_THRES")=
)
     if database_time !=3D 0:
@@ -233,12 +234,12 @@ def update_db_file(db_tmp_file, d, database_time):
             per_page =3D data["resultsPerPage"]
             bb.note("Got %d entries" % per_page)
             for cve in data["vulnerabilities"]:
-               update_db(conn, cve)
+                update_db(conn, cve)
=20
             index +=3D per_page
             ph.update((float(index) / (total+1)) * 100)
             if index >=3D total:
-               break
+                break
=20
             # Recommended by NVD
             time.sleep(wait_time)
@@ -333,7 +334,7 @@ def update_db(conn, elt):
     accessVector =3D None
     vectorString =3D None
     cveId =3D elt['cve']['id']
-    if elt['cve'].get('vulnStatus') =3D=3D  "Rejected":
+    if elt['cve'].get('vulnStatus') =3D=3D "Rejected":
         c =3D conn.cursor()
         c.execute("delete from PRODUCTS where ID =3D ?;", [cveId])
         c.execute("delete from NVD where ID =3D ?;", [cveId])
--=20
2.47.3


