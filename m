Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7600ACCF9E3
	for <webhook@archiver.kernel.org>; Tue,  4 Nov 2025 08:34:11 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.118])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13398.1762245230231928511
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Nov 2025 00:33:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=vgVr7N1O;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 40.107.130.118, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P0KDwZO10N8QWnRh0XbHbz0BpiEKYrgUO0rgMdU99CK/LRKq5W7AetN2tQvSdYS4AT5faa+/k/xOstozmxO7kPSKx3aBagdvJY/5HJL5J95MfovJJYc4Rx7Ak4t1rbQhs1fEAtfYeiFiI68eAhzMocHAKrTtH/nNjtLtVRY6GJ60Z6mYx6Gf4XQLy0wlP2osI/v2y7SFZyGLFiFaNt41/+NLA69XZpG79U4revwtw1DKcUztNyWDSxyhpMk7L5AB2Y52xhkXjBlmHdfWAH2VWwJfYLeHQ+hjUCA0Jpaz7K92YGSGr0hLomNPk8N9dRonYoR6ZvgZD7V2AsKbeyZBfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jaVj9rSEp9LUBXxicmf6Qfsc5xJt5BCOu4UpW2satOI=;
 b=EwbeOv081T7M7JT8Vfok+5HUNF8DbbotIR2XLY0S80/ADoia/KcKyTAKiszyUsnXndAuJXbh5f4TGtF1z2EuE4Yr0A0Zq3EEZrKHt6nK1J/LFESu94k9OWxFOFDXQC7eAnvJeo7LpLpiRLiaNgFPLKrORcvynGk37ZIt8dcVuDSknf9NdurBTS3pHw55lYmyGtLxkL4Mtgiha/5aGYFZVCd0NYDUVWo5BqDkKvf5M2QZFQXKLyY0YrNrqFMxO5d0Ts7uRjR4E6BwIPo5+48JCqCSqIgT+iv77cAwy08wVMmAW4K+T0cDTDoNaZjXKjnrxBEwe0kho7u5Jg79X0YtAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jaVj9rSEp9LUBXxicmf6Qfsc5xJt5BCOu4UpW2satOI=;
 b=vgVr7N1Owqr0Dw8Z7A7nnIaURUNTRcnyG0LToKtyyJ1dc2+EMVTh6yeZEQ847fMbLJfq2Xe7gFYJXyXZW5TvUKHa4wnQMsDrHJy1h1mNg5MPIncS6TGtwu9YFapKToR1ci8lnPiWSb/Vv5WckYjKSsz2EEF3vDsfM5PZZC6kR9kjMrfQ/tnbJz8Sevr8Lry1Az8hwvSCIfN/1th2j4cqH7CwYIbvxeq+U/JrAYfgqi5mt6IAULE+ESbohH9abF97zP4Bik82yOxsKR1Cem9oWs+0I/GPtTGk5H2E/7dVMD2gJeA4xriV8i0en/UIhYHqlKW/9mVQ1lzA3ipLQnPbjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PAXPR06MB7405.eurprd06.prod.outlook.com (2603:10a6:102:de::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 08:33:44 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 08:33:44 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: ross.burton@arm.com,
	rybczynska@gmail.com,
	peter.marko@siemens.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH v2 1/5] cve-update-nvd2-native: pycodestyle fixes
Date: Tue,  4 Nov 2025 08:33:29 +0000
Message-ID: <20251104083333.814331-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.47.3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF0000384D.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:9:0:f) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PAXPR06MB7405:EE_
X-MS-Office365-Filtering-Correlation-Id: e9c275a0-6709-4143-f1b9-08de1b7cdde7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?yUk1/A9UByIihzYycZNg4As9EjldSDKu9Npd5dS4r3JGr9TzqgaVnmmYQdYS?=
 =?us-ascii?Q?ttgrve06G5FIpvsA+Tor8vE2tdbi3+sHiLahQ/TfOtX/zj80gdqYp+EJoeCy?=
 =?us-ascii?Q?Fdh8YyCRUV4GPYkbnDiOi7i6u8biJMXCxQYDfUWzvxUMoD4qKjVQvgDM0kFS?=
 =?us-ascii?Q?Ph6EdhXN9iqoP2qMQhcqOu/z3aLGJzFHp2NJghRlqtGlS8BWWyaz4FYzVXX+?=
 =?us-ascii?Q?0BpIJe2g6lBl68Q9kv9S4tbTetNdqlI9eRA4SX2zUhE7yAN7FkC5kJsS+2Xh?=
 =?us-ascii?Q?Lklz6azL9Dgw7wcMZWMJHIxmtbiwkJGw7v0sQ/zyQ297mRZAbmIIIkLA/jiT?=
 =?us-ascii?Q?uoVjO6dcz7Cs+Ca/35xDwhP5QonIUtiYzRgI8Spr4O71nB0YiTyA18al8zHn?=
 =?us-ascii?Q?RLz6KtFEdLNidlFrS3UQtBlihTL8PPttp8AdIFTC6xiTJTSj1eVuZxpkWHiJ?=
 =?us-ascii?Q?8vKKvtgtFHwQTwci7+Jar2iYk44n+4D4jH3+3D/BQMSoUPwiXs2hLOU8ZUc7?=
 =?us-ascii?Q?0YD1+v5AsHn/xkWA3CiXrihK558bv7/pTDh4jTuXLa2mSWFr0BUoX+DWtQsD?=
 =?us-ascii?Q?Tcg//9Ma7y5KuZ8fUD+hu6qjhpyRu1ltyGgaSQBqNWKcjRp39dt2cB8/xDhB?=
 =?us-ascii?Q?/y2Jc6B5GYqkwnHaqy1jtVi6VTmKxO8zNL2EarAphPyxSeM13ebx3AYP6zHg?=
 =?us-ascii?Q?8/wTlCtTVsauF5elgWosyjOd2AUZ6Eib4gvMcdTka4pyDr1vc4vRhRxRlO9T?=
 =?us-ascii?Q?n9aZebQ85gAVGDByO28N16nqx5lUNcHYjNbBBUaZu9E9UbOZL5LK+iO3glnt?=
 =?us-ascii?Q?e6LKTB6ZYetFQEmkoSoOp1DUOlAJTFWJ2smJPo+j4VoN25RVke8kQjB18u9z?=
 =?us-ascii?Q?fVjxJceSzsVTpHEbwAlinTJHOT7Q0VyE6WHFULtzG9gwlp8W3NpYYGl6x42c?=
 =?us-ascii?Q?mxwEL9wxfGtVDdDb++Akq7Y7rJIQyIjWd1aUq9YBlBpImf+fOwPLQvamJ2DR?=
 =?us-ascii?Q?DWh0tQDYkn/uTHztfbAx9F5tyquz/lW5GQX1I1I6fNTxiIlU9AWGYCmvK+RQ?=
 =?us-ascii?Q?Cm4sQBMTImzBKHF5+Gazb/c7TTW9q9/wOJ0/ecpy3tk0mnm3EoIA+l5ebWQT?=
 =?us-ascii?Q?ACBC6uivyrLreWzTY/S0qBlhl+CtMEEjgH2fzh9e8Eax8BMGOZev/Fn67rgK?=
 =?us-ascii?Q?hZwlVZZiI6kQPPPIl8HkK19S0igygAzcQqsjqEIDle7cv5xfACvi8/SHV6Gs?=
 =?us-ascii?Q?CtbVDs1hcuRbGnR8fAaPUsys7ehFMGH8VuxR/YQW1axrFwK3qQ/Tw9xMEl9G?=
 =?us-ascii?Q?BkG4MSBqg/R0glzuIqo4tyHJKG/hNq8JOGy6Hwt0zog6UNVCkghEKHbHLDWc?=
 =?us-ascii?Q?eNRE99UunLHNHLmRMPUoKFzgoC7LpsBwabUxwabGoYFkpHp8lY19lfHSRX5T?=
 =?us-ascii?Q?dB5+Uy3vgvLXFHz2lR8JahWz2gCeXVMgcx2IjffRvvXaUL0XpfDInaMGzvYD?=
 =?us-ascii?Q?RJ1M9NkcId4CXcmx0DAVQ0VmDrzQmDb4hGL1?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+F7AT8jKj6ixqJYcjA4v7okpqTBVQHAvY+gZcGnOpJCClzFdY/1ZCZZRx8MJ?=
 =?us-ascii?Q?lF84sqaKqbYnJdHBvMGBRnKOgz393s/64vwzFwCcPBuD9fBHVQo/8zMzgEc0?=
 =?us-ascii?Q?LaY2QagJVoBUXl/cU52Iwq9rK9V9XucuUQ+8Ck40y7BBSPYEiBvQY2HIGq9u?=
 =?us-ascii?Q?j/XteaXyNtfW6sZ8bZn0xYOUZEJ4CpejT5jAiTjibtDUadryuhVr+623lfL7?=
 =?us-ascii?Q?X8WY81DcfHefuvlPwL5HuqPQUduPUWYXf5rnzSWZKS9hrh8KU+pKhpHMUZaW?=
 =?us-ascii?Q?TKZEbXDimSWzReHK02z2shUmPR7oaPbFPjKaXik8O6HZZhiSJK+qnUu9JRqQ?=
 =?us-ascii?Q?fZQGGard5TxVzBEfj9cSLZrmZ783GFmg8YkKL8p51qFNAJ165Tc7YV+lmBAM?=
 =?us-ascii?Q?Yv9EyoFZFw+x6GDGqqFaCfJKERebjm82GqlNfET3YwJqTc+SuetX9Kw00y6r?=
 =?us-ascii?Q?GoSxdOP8xn25km3m/Yyo2NJXzqincmTdQ6qu9fJjiGzaCMiDxXfbrmzrOY+/?=
 =?us-ascii?Q?+q+SoL0T17cySQWJiuDUpaJSWY0t2KPrfpC+gmSHdd7vhiP4f5WVOLdf98YN?=
 =?us-ascii?Q?klyc5FrBxs+CdE+O//RYNg9X1b9o92CKwzMsK+0gBcFIdc6WJXexk0UWHQW9?=
 =?us-ascii?Q?DCBD2Usclrx0PvEeiS87gHb3s02+8vrImlVdL68zfPyPJYbkXj5Nd4e1LcAE?=
 =?us-ascii?Q?6HfToI+x+K3PnA7i7K1cU8exsg0QObzCpq3S9klfVwERl0Fq7rIaGhzI5ve8?=
 =?us-ascii?Q?epHzJv1eJOVldK1tQ3C+fRJwI6Rp4lygjerTQWI9erSuYHJv9p3/sPpR6BZt?=
 =?us-ascii?Q?LqeSwGVdL9d2lM6nXiKYEeMH/YW/GqarWQZ52lxxOueJGoqzf+bxSmxpqDhb?=
 =?us-ascii?Q?gF0Iz9SAnEEHymKajj4D7nH7wZKcEC9kpDLfrFIramSakpFbLgGL5vuPqJTt?=
 =?us-ascii?Q?xQVsCQGDMzRljArKyawnrdIjNtQPdYGEjLsx/FB3RI6vlik6waZ3nglUbvZ7?=
 =?us-ascii?Q?Vb2zsen6o+73Bv/kCLlSJl5SfhsENZd1GxJjRYRFlBYkabalnNvnYBu/UB20?=
 =?us-ascii?Q?gcAn2EgQhnzFoNNnNyntzHFhfjd4uEkg9lQriQDc42e7b9SlDM/TOvIfp3Ek?=
 =?us-ascii?Q?ck2Bk3x6L8LimnL1bjZ+Hfh6Sw7bJwvhJdggcFwhdYKVD3wLinP8ysszU+h5?=
 =?us-ascii?Q?s+kukaU9NRxwMaolwwhf2KTxRyVChwa7OGieocJkAhLcLmbIz0as2TSnPjNm?=
 =?us-ascii?Q?XUBIrzH/YdKazDQOssmhVIraxeVajtm7tfBjoqZSYhciJk0ytAW4qb2lJ/6i?=
 =?us-ascii?Q?qtmBcXCjCX0mmYQRsfq5oKYXZKkR5BEmh15lXHT0c8suD8Qb8Lc09dOB/yRh?=
 =?us-ascii?Q?hXgzKAL6WLzQEMtB4h/Mzpqhl/YaWToH7cpr1+SIIBQ2s+lTblX5H+oaKQJY?=
 =?us-ascii?Q?JjmIsDa1+J9WsLr+r8SJ5AV0v6gy/kwMuka6rmVMbwJwoO6uRIm3Ib1ry77f?=
 =?us-ascii?Q?Bl1VIktuBWq8bcmpRvcTAp2KLV6qkLcjTgtNlNWpmF4LDJC8dNzHSq8EODCM?=
 =?us-ascii?Q?hGsY1VXbxwwxRxPJ1LGN+k2tUDs4Gx4FrWXgX+5E6/+aJ7CiDyuPmoQwbbRQ?=
 =?us-ascii?Q?gg=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9c275a0-6709-4143-f1b9-08de1b7cdde7
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 08:33:44.7734
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ECm3hHUXnLlN8hjIm+Xf7J7tniYhFejl0jQFLODG6JuuJs675EiXLpX0YA+zwEb/k91oH1id9zDkHlkMSldPbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR06MB7405
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Nov 2025 08:34:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225712

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


