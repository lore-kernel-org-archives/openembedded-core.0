Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C5B6C55162
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 05:18:47 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.22])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36914.1785734319715544514
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Aug 2026 22:18:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=fKoN3fST;
 spf=pass (domain: est.tech, ip: 40.107.162.22, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P41r+3W9JHOQes+DlhJxUIZHrvOinWXyh7cy0NrajrjHI0nplLZhHTDoIMR9MmBWR/LCRTKFgjuSukJAXQKWhCRg13X2zA+ZAJ2MbVkFCnDIAXhQxt1/FizDj2czw4/YS5f+BF5eT2Tl4M20HJN1TymQ9HS6aerNGrs5aJ8SEkv8L69EDVlC/IURbnjBEIHv6WtZdMSPVIx6k+Il8dM65TVECxVX2f9h+pZyhrb0wc9FcY0NxGW0sW0JurlV6cuQZr6kmGzvEF5SZDJzBhJLYpKRVVfI8yM7ae7yL4IzqIuhcBs6oKpFdePb3oYbZd78I1o573o+OweNdDr2Ioi5vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bVL0V6kbXUfoWyjbB4gENczH8xhtKKejuX/eu2RvNTg=;
 b=OEYBOaZ/LjTpXPyoweQEeSHDN0mRkLOg1/Bk7jgoOLT/iAyXecuNuYls4Hu4dlPErWoTkbrA/UrnGNDDM2RACWBrx09tK04/o+LjNtN2828wSVj/JOsANLHVNixEwvG6OSAPE2nl5GrORdIXnSG/aVE9+ibZ2cExB/URoWdBAvDQO+tlv1bE7w+mHC/1cYL8/yLis4bWrp2Tapzx0flEUFkzs/IIq6nOyvl10xlly5GGbLqeaiM4G1E0w174v+9HnmCkwyOvlOJl2cqY1oboYy7OAGByDwOTOrsPON+Wn7sY9tk7RZGatSVp6fFAd7O0Y7L2Y94o17/YJbPDZBTIuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bVL0V6kbXUfoWyjbB4gENczH8xhtKKejuX/eu2RvNTg=;
 b=fKoN3fSTDtCZjWBxOa1jBa2WQxSkbJP13agSNlPFOjcF00fAEn4E/21vOavZzrif8TKtm+WyoHpPSZU/FkX0VtAL6VAVMZR7EzJF0WtvBAMWpDQ0pX/DtaVzDnjOaxFVnsSRlZwqabGYV39/AdgH5iJNTO3jhqpJSVNhcZcqUe8jPIgHtq6F3GjK2f0KRcP4CRHe5m8biPLNGSioJ2cgAEvnu/9FTMD366oREOb7dIGc2MO374VQsg6gmiFfOVpcdjsg1IUrHzxp5ho+2b/s8bI/7sL39RAJYx2b249tjzXzk+wgGU7Qc1qvv9qFXcoKgAeyfciPxlnbe4SPSr65WQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AM7P189MB0947.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:178::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.13; Mon, 3 Aug
 2026 05:18:39 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0292.012; Mon, 3 Aug 2026
 05:18:39 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH 2/2] useradd.bbclass: drop groupmems from sysroot setup
Date: Mon,  3 Aug 2026 07:18:32 +0200
Message-ID: <20260803051832.25488-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260803051832.25488-1-jaipaul.cheernam@est.tech>
References: <20260803051832.25488-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DB9PR02CA0010.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9::15) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AM7P189MB0947:EE_
X-MS-Office365-Filtering-Correlation-Id: ff8e54bd-4115-4ccb-623a-08def11ead7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|10070799003|366016|23010399003|376014|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	5bpAcwZbSEeeCs4hzAIsxK+YM8JLIffbQlffaIcPwf04KWJXGEz2lX6UJej8RBnQ6UNt79UzLFT0zMMyApUFkXPkXOiCnL9jSJidQIW0at71Fv+SW+4e2Czfizz+CmU0u0bwNUP55QInYdKj7GcusjVwVEpuBCU1jb2qKGZIecYaVtOzvcgSFc7xFT+kVb7U0h1luxndl08CI6dk5ppTmDboHo4CPjjHU/E6ULDRKr+ULNbDq5IxVYwunWetyfkxMEpYRKrM6ol1TnEjyrbnJ/mZGEmSxZzHX95rqDmkwgwM+PXHRyBY/IOMgKR9Fa+9d25G8XRUdIqqmE+GW2TsUn7ZBHt+mqmvnORzJs7G/EPGxqWlQAFdZX5PIkjv1eIjPZ69tJo6RgBeEXqyh8HiNqiW8j75ABHXa8ccki7kW1p4hOxCNwTuOuR4uWOtdQeUK5fwhJ6C/FRxxVqhnwtFEHoqmDxPZd78ZZsn9m0xkr9Xf0krFHGPOKbWaSbX/ATjSEIYp+2GOdUYnR4KPvKb8kmgCBIjVfwKS5bUC1szlFHMNkwUkT4zeoYWGXqFOYDGRqALzkG0hoCnYxlzJ7qt9znYiOCnt0uvK6v5VszqMRiOTC0FCwYJtL1ych8oV4lupLakt+GA8Aq0EvIQnV0pgQ8d9TY5k9heGz6LU/dBzj8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(23010399003)(376014)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qK156cpfkhmoXjk53BSjv1hX9uIsamUJIVc/ca0x4zdE4R5u8XsnRWyb/1C1?=
 =?us-ascii?Q?/HVCmnGMJJooMkjXROwZOqt1YDQHue5rHY+Nxs6YUJVSSYwF4726d4Q2sdyv?=
 =?us-ascii?Q?WiYOd68lot5p4n3N4mMtTpMmrpOFjfUqjaqHAah2Zo7PzKnQhJA3snTDKMrD?=
 =?us-ascii?Q?G+9bQI5SsJxnUU9d4vD6r9NYWc20Rd4n37z6plAo8oyxtkoNRGtbYlMsma0N?=
 =?us-ascii?Q?f2vpSlXHFDozc+/DEmyW3W1S7igJCwhhgF3nr0HQxoliw4WSBixUC6Yl5uUo?=
 =?us-ascii?Q?3m0rWz4gP7Tg0bYQDT8CRIDqdZiclr8Mr4bDJ+9P1jz3dxzJDlr3+LVY3lYg?=
 =?us-ascii?Q?AV/iYYq8qx+/YSXmi7HQJPybMyTaUmE52jPYYyPyiRY9UHZJlpAUvG52xLzN?=
 =?us-ascii?Q?OBynKYRHBl3dxzqrdx2U39D2mp83g72hsjBCjN3vhYCan4VT7oU9EvU57yIP?=
 =?us-ascii?Q?XeZEj/1qlao77y+Cl5njWPM55dV/Aov47DvSFxOACO/4LwlzDIAhfkebo5xC?=
 =?us-ascii?Q?iWNULd3ccjfkTY5VVv6xp8buD1LhsU1hg2bgr9hn5CNZ+QajLh9/G1r0CtnO?=
 =?us-ascii?Q?55YJ6IELDqXfuOQXQYbLEbHzaiNJp+Xdl95NICL+q5gBOM1svDzWlnnDH9O5?=
 =?us-ascii?Q?wmzeY2ZQh040WUaEBsBxb7PVUGEQ2AAz7Q+Od3YMD8gAER5wgKQa1WqC8YaT?=
 =?us-ascii?Q?KWAlw5HjksVPXnZYkSY0Gv9XQxjLTtF9CL5DWjA0MDJqBfgUZ88tjMBU8UWI?=
 =?us-ascii?Q?TMDOUtudMZQE3XMjkY9iYsSTjch4AqU1F2Wgq8qGhVc6TBTCsr0iVzS15noc?=
 =?us-ascii?Q?l1Us1UOiKAnXw/NPB0unOVXyXxQg7VatipH35wLkY8Q15um3qVPvqvS8K0ON?=
 =?us-ascii?Q?rGEVk6h480d3mHPKcUc7891AnkRSvYb529huh6fb6IZhz+e+adprtGXVaOIB?=
 =?us-ascii?Q?sZKtHdzl8aTt4Va5EfEaEDiKMzVmA4Z9Jkx6rCI6zy66ttP0jS/iX9Ta+eVi?=
 =?us-ascii?Q?jgXZ+/OKRknFdwgXCVuXE179fLmkPwLhH9QxV2BX5LpAPkvdC8eJwQZ/ZOcH?=
 =?us-ascii?Q?Qo6xQIUo5sl1wKtcB0LJxdSOMaf7quZ9v65cg3RaYn6TuDXOF3YcVJM64/E2?=
 =?us-ascii?Q?gf29Xn7nnxKIvGTap3rJN8rgPPOGEba7bMg21JOxByI32w3AEfPmCI5/0N+n?=
 =?us-ascii?Q?yO73rU8AMOLdu+xnnRcKjg1My3nXIz11h3Y48aq+67Jv/oG2N8GQ0RRfDRlu?=
 =?us-ascii?Q?km3w4t0Oh6x4JNx8w8WPhCJOySIobeUhDmI9uhuolg5vFsvAdtPX1GFRUqmk?=
 =?us-ascii?Q?W+03sHVEYcse5iw5p2lStcJcc2zHzHaOQEo8xhyRpOv9B+wwbfBsOm7Z2osl?=
 =?us-ascii?Q?mwd68V7kKbed9aQwoSHxHkB0RujxidQhwe4mxxJPl77nvw+DwnsrbieQ7bSS?=
 =?us-ascii?Q?qeaxhmXZhBmthMHyUqsvkr1ymR8tH/mQBsf1Ikc+uWvcJXb/12W//jVqoefI?=
 =?us-ascii?Q?n4SZr/ckLHbpuKPZKz/orJH7po6y2Ovv0YfGMiB/6A+3Sj4EXIFpbEyWiNiv?=
 =?us-ascii?Q?RKzkI2vFo0b/Byo0mXtnQ8xdTXIFVW8/oLuOaR5DwDZfnHrGD3sF0E2bAG1R?=
 =?us-ascii?Q?5uzQ5NkmV1Z+SM87bmDTi/rFhLHrSYoEfgdx+m1a9UaVJqobfsb/2ttBmebk?=
 =?us-ascii?Q?HVZF3Gta2Bx8dqcPacZFs4Kba4iGC7RBZ7k6NhzDp7GiNVFJpwjMR7GunOTm?=
 =?us-ascii?Q?ksi+hLeIuFFRG7c4eyGXkFl8ud60oy+FZhaqTcZgDrNxAiyiICY17eiTtUYp?=
X-MS-Exchange-AntiSpam-MessageData-1: O6McDpJYz9k0gzKR7PRdhaY+G2bcNA/HFeQ=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: ff8e54bd-4115-4ccb-623a-08def11ead7d
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 05:18:39.6967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YmtpSSLHOF+eOAxkH80WJWutLrD49wonuI0ak4vWpdiPjWgNmj7dXwJ6hHAKSud3FGLqlyv9G9hiChyyEXI0eMmsODvmGUDY7RCQEWq3eE8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB0947
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 05:18:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242605

groupmems was removed from shadow 4.20.0 [1]. The useradd class never
actually called the binary - perform_groupmems already uses usermod.
Drop it from the sysroot loop to silence the warnings.

[1] https://github.com/shadow-maint/shadow/pull/1601

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/classes/useradd.bbclass | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index d6e1df2bd6..e9e835e1a2 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -131,10 +131,6 @@ usermod_sysroot() {
 	common_useradd_sysroot usermod
 }
=20
-groupmems_sysroot() {
-	common_useradd_sysroot groupmems
-}
-
 common_useradd_sysroot() {
 	# Pseudo may (do_prepare_recipe_sysroot) or may not (do_populate_sysroot_=
setscene) be running=20
 	# at this point so we're explicit about the environment so pseudo can loa=
d if=20
@@ -168,7 +164,6 @@ common_useradd_sysroot() {
 		groupadd) GROUPADD_PARAM=3D"${@get_all_cmd_params(d, 'groupadd')}";;
 		useradd) USERADD_PARAM=3D"${@get_all_cmd_params(d, 'useradd')}";;
 		usermod) USERMOD_PARAM=3D"${@get_all_cmd_params(d, 'usermod')}";;
-		groupmems) GROUPMEMS_PARAM=3D"${@get_all_cmd_params(d, 'groupmems')}";;
 	esac
=20
 	# Tell the system to use the environment vars
@@ -184,7 +179,7 @@ common_useradd_sysroot() {
 EXTRA_STAGING_FIXMES +=3D "PSEUDO_SYSROOT PSEUDO_LOCALSTATEDIR LOGFIFO"
=20
 python useradd_sysroot_sstate() {
-    for cmd, sort_prefix in [("groupadd", "01"), ("useradd", "02"), ("user=
mod", "03"), ("groupmems", "04")]:
+    for cmd, sort_prefix in [("groupadd", "01"), ("useradd", "02"), ("user=
mod", "03")]:
         scriptfile =3D None
         task =3D d.getVar("BB_CURRENTTASK")
         if task =3D=3D "package_setscene":

