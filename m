Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ED7EC61DC2
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:42:41 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.14])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7983.1787733758557486153
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:42:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=bd0cRM4F;
 spf=pass (domain: est.tech, ip: 52.101.72.14, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IiQhU2fhwkwVcK1avpEgrClJBYm44en60ZB2N9GWBlTzhSRfl1FIN0aJVxgwUAGGabz1sCIPbrzpTgtoCKm+Na5qvC8euRAr4pPjcQaL3Ox9BNWVROAFcsy6EsmyMPB38+QgsELFVrsSFvbjqhpRcFYcFebua6A5oDv+otRKuPK0mpymxtYWKTGvoy9tfcUgq1crIHtRzCZcXtd/hnUAcK/Q1s51k2kpYwyr2uez3qhjEaX6kK76tOZ1IlBMvGgqOmX5Zt6iRGkqhUqU3Zp/ixwNFLNkRxV1YUrEXfZM78qebvddgNeKBvsNpG+egdxlSf6+aCC9OaJAO0oxStaGJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OBYNsTGGS3kkfyUAYQ/a9OOF7eFIHaNNW0C1wNhTaaE=;
 b=OFlqzpOSiR9tkeNYt51pFdRKvE1y54aPNgRDopFdxci0RnCICohiReed1QZN0Fvu0giS82SJCat4f+XbcsjhyGSbnsNvwX75l8dhIqxtzilyFzlVPB9TfUee329XzYfZ9VqTfILHlJeZaL+zLJUdMmTox3pSKnOIwpPOyod4dEosGMu2GTF0Jm3whi57r0Ge8k9XlwF1XPWp05O3hVcf5jC/K2VqSgC0Cwkmda6WzAMFrPa3a9tt6N/XoJyBcN6KTsD6BBRg8vhQyKxBeeX3FUnSR/oZ90Sjq+qqaVxTGJccdQoeV30gaxB7UkPVDXfiz13wvA+Af9QoW5Usc9pF2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OBYNsTGGS3kkfyUAYQ/a9OOF7eFIHaNNW0C1wNhTaaE=;
 b=bd0cRM4FWGExuX+fhs3AqL//cI03890xz01uQpVnjYCwgIdB+tvsWCaWRKfiUpasUuGSNVKHlUMRcvyj6mcLTueiJQEVNqTEOAPCIhWJgQx1x/JWLrXci9SmgMsFdPhHHXPUcd2joyDYthpcxQa6XuA8RoLgZdSosIQjpfU2hNiljWEMyDGtzIGPWCV/JoyQzU7j3Yxt6mVUC6xd/7j4vDvprx6ZB1GuWgv1jsasZtzZNrKeKgn7funSqou3KrmA7E6Wjz9WEvjsANrpyJnwdKqUNORH039ixqzs5IVjpVYaeWAhqMbotR1JV40L5n80cGjQ25Jxz/cmirGcdKdatg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by PA6P189MB3744.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:516::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Wed, 26 Aug
 2026 08:42:33 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 08:42:33 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] devtool: handle symlinks in source tree cleanup
Date: Wed, 26 Aug 2026 10:42:31 +0200
Message-ID: <20260826084231.55333-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZP191CA0056.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4fa::14) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|PA6P189MB3744:EE_
X-MS-Office365-Filtering-Correlation-Id: 9653dd73-edf7-4d06-19c2-08df034df8b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	bALBoVtKOHLIDTuBk58nyzEyGsJVpXe0Mjs4zwzxH63rOqm6bT3u2Xx8vOVsOzWvttkN5eKtF+Gu9Vkac04ZUt7MSkKI9GzqMzTtwJQaWebsyDwey7H6R8kP2OTMImsSeIuJxX+K6SADiXnKUL2QSDeV6YSpPzJ3dUIaXT88G9FEFdLD+FiVgL/QgW4t0zeQuPx6bK21UkaW9mgGkbH3Y0LubwB4hyEd+mrQeRDU6WB9dggKmoiDg3tA7SkvIBt2x1cDi2UNomzQhjAehR4QJAwuwNaEUAPcFDpr5wE4IqywqtBdDJgS9JYK/ERyWWfJMhzUWhJCOxWXsXSz5i4tmEbqZkpM6pwnHVV/XWRWsLWbuU8o9uwiaoKf5HdzlR8u1Cx1CJOUn2n2GT5hpNV9+UUhDgNyXkZPrUbvB7p8tZtQOAqlGj323xZGGfPok+kaAxa8wd6NUAFTJdZl3wY3yXm4t85ONDwHQtAvIYnjXrlXHelwa0Xejln+Y/lljJboNt9kBjiQl/OFVJbrjbSYrUq2D8JVPd1KIYBrq/9gxdPzgbplpvdV8DysZNKo9QFmPhFPaJwqf9cX3EAiiEDxvIeQYxVkXBKOUDWaANcyLfqZE5ceOjH2huOd/dezKOTSwkVtXWzDN4gAIZ2nuRWosvFZu3tWF0BEao0NYB40rzw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LCAb1spddPS+N1wH3MJxSkhMssw3TzxG9vUNZaDuccwGfqueAtorn6cWpiVA?=
 =?us-ascii?Q?r5yLgJrCZANb0c3oNjtT/w/WC75BRBBEc+8lqmSxLgo9cxNya0jQzs9SteqS?=
 =?us-ascii?Q?lFj+viTJNCPBvo86H3nn36qsY/CZpYVVgXXaoXe1H+UP/FzcLtwpDWXorXEV?=
 =?us-ascii?Q?QRLJPesboDhEKtOMsPewxUffWEJX8xTEuCee8wPl5M3cxuyuHJBqpPYquaj5?=
 =?us-ascii?Q?bB52ph1Ia1hH6Khki0YKV+ZZZYBWbjsLdPOR37mSTunQRhqz/14n+Zvym3s7?=
 =?us-ascii?Q?RO7f/WQbcKzDiiY7uEh0bTlGCGa/feri7xDb58duGBWQIu7dSC68O6jSL1/n?=
 =?us-ascii?Q?+xggm/ssU3rNEG5XlgMBNhHCzI3+8QWAOLhefNThxdbPZ/coD3ai/ScjLdj2?=
 =?us-ascii?Q?X1rrybcKUTntxdUieuXCT36hEwkzCixDeOBZDTyHImljRs8b4x3s6qIWwIiw?=
 =?us-ascii?Q?DMitDMLKGIFgRIe08N6hJ57UyIjKKErWTsN3WQlM0DS3/Jz380QTu2YKYpnr?=
 =?us-ascii?Q?Y//7mVpnM2Cm9isIqza8nRprvkk5HmAcKwwnbXVXIdCF+Zos35IacwqnOqMG?=
 =?us-ascii?Q?g4tw02HvwUuqbBUF57JFtOtYhw1rqh2ovtsx2GOE0Chbo1SQbAlbxprmrScQ?=
 =?us-ascii?Q?dVtBncJY0zRUwW9km1zGg/QFJykvQb58nPZMr8qAzAfxxih3+/hlRAyDh8aN?=
 =?us-ascii?Q?g8GnCbKvYYRUDWBmUaAKB4Hx0WjzR/nAXsHHA3Sq6J7u0I40RdNbHQCne4Kd?=
 =?us-ascii?Q?JwfzQpVeG/0DSqo5XmaeBBZid0YuT2CgP62OqPnAgnnlDijeMKFufwx38dnb?=
 =?us-ascii?Q?fy0lVIhFcz6lx4VwUCxPyfigX3rYSx4TV2b5XCyO5IeeGT1CtU5txoha1v8P?=
 =?us-ascii?Q?1JOp8G5jxF/Kyb6LkaNQR7qGFc9AaOwh1CVip6aEWw+tWIAGDVLcWHpBJLrF?=
 =?us-ascii?Q?xm2mbcyRbn20Gl+SCogbiT9+oT7XnKHLX53F9o+R3VwrN9FWsH7PVE7T4Lm5?=
 =?us-ascii?Q?JETKaRq8YSF+Ja9RVt1ksCySf4+O0aWBKO3cTuZARp1PHKl/iTbbjtoYgPfK?=
 =?us-ascii?Q?mgsPWT8smlGES5FZvuG44U5Xu0rZvNxs/ijE6HQdjTmJNOE1RZa5pYBtahHm?=
 =?us-ascii?Q?ZSo5FfNIYkWw/Tsktj/H/63CmTj8daxkGU5sU/VRcq0k+MKxmO0mJqUCHeD9?=
 =?us-ascii?Q?fkDC26sPNNC0z5qR0LEUoNyrJ1tPnZ3GbFHj0wd+RoksX7nvrhrybndXKd7u?=
 =?us-ascii?Q?SP0wxc6PKIlIyApoo+VbDHbGFaWT79wWo3gky+V0AGelwGnzDX/LTtQoh9vf?=
 =?us-ascii?Q?u55mkJbKeBv8D5vq/2ouaIIJamlrusQ6llc2vdKDF/44vTuKHULHLf8JQzpO?=
 =?us-ascii?Q?odQKrZ7IVsETyZMWLaoesgy3l6GsiRVRglo9SfgKk0g/jA7AkQqRVivXYKQL?=
 =?us-ascii?Q?/Q8NI6grb1gryEDewPmgn4vRT2/nZGiCozUn2FapVlgCYGpogeM/Dt45TE1q?=
 =?us-ascii?Q?dmdBwkyaCQq1s1aCvZBv3IyvrpcvrHEjyt4IxItaRtpeeNMgZnNffoeGEzFw?=
 =?us-ascii?Q?Z9nTd+nbPpYTlf5dg2BrN/BtEbin441mAXDAKj+QuL2nJQHFo8Gd4ltoRIi6?=
 =?us-ascii?Q?JGtxthlNsSazd9SK63hUjg0zBCGyvdxNRlf6m3zZ9HRCaxuQHqZ7wvK7bOF2?=
 =?us-ascii?Q?X98stYcFRH5SDjWQ7U3fl9Bopc3LQgWZg88bzngqYXOC+9/evxnLYjWPMEG2?=
 =?us-ascii?Q?SfhcwwKnzbdcsZ/AAugosCaANbO5qOI=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 9653dd73-edf7-4d06-19c2-08df034df8b0
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 08:42:33.1019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VcGmq/gV+BZ2hW3jfPivhow8x5kIrtMFGzlwrWTxLMIRtNUVUeeiNJHvY6/BmkosJlMAAtTPSUxhbGQxmtxOG782KxjlKELMWk0pAeM49aE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6P189MB3744
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:42:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244378

- os.path.isdir() follows symlinks, so symlinks to directories were
  passed to shutil.rmtree() which raises:

  File "scripts/lib/devtool/upgrade.py", line 280, in _extract_new_source
    shutil.rmtree(itempath)
  File "/usr/lib/python3.12/shutil.py", line 802, in rmtree
    onexc(os.path.islink, path, err)
  File "/usr/lib/python3.12/shutil.py", line 800, in rmtree
    raise OSError("Cannot call rmtree on a symbolic link")

- Same issue reported on AUH while upgrading for man-pages

- Add check for symlinks first and use os.remove() on them.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 scripts/lib/devtool/upgrade.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.p=
y
index 523acf4250..5c2e6ebd46 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -276,7 +276,9 @@ def _extract_new_source(newpv, srctree, no_patch, srcre=
v, srcbranch, branch, kee
             if item in ['.git', 'oe-local-files']:
                 continue
             itempath =3D os.path.join(srctree, item)
-            if os.path.isdir(itempath):
+            if os.path.islink(itempath):
+                os.remove(itempath)
+            elif os.path.isdir(itempath):
                 shutil.rmtree(itempath)
             else:
                 os.remove(itempath)

