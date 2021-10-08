Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ECD0C433FE
	for <webhook@archiver.kernel.org>; Fri,  8 Oct 2021 07:48:59 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.63])
 by mx.groups.io with SMTP id smtpd.web12.6087.1633679334680079990
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Oct 2021 00:48:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=dRqUuRnD;
 spf=pass (domain: weidmueller.com, ip: 40.107.6.63,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NcKg2jeY4QjliZzSPYHdNy09qL1yoo6yLdFpFY3ZKgRtuKBPci2rPOBxwX7MEpMpXMAAKTACUp+B6tvX2P5G5nrmxv181JlNbGF3GZc6Xh418LWYZFc7WLLhi7Y6ibediJUaQZh5Afk4jG5iRg/LEm5ExRkAbOKd7wfJWjvR7fEt/xX18DO8hYjIQ7NUBLJkBDwOdkQZecYfv4vSw4d//MPF4UOmiqgd68xnA4DQtULcvqJXQd4sTtQWJffCVPW0uDDkTemnnpS5oq06nmdHb+1FwGTaTl9AofDTlFU/yIjUK0sewk0DpPX9LkL5ibWK4k+rHOtGDJHDzYjf6l+1hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pPR1kzMuuhyOBoGHXo3FBht3+uemlOS+rYK3ClEHhtY=;
 b=Cv9+8E9VJfQcQiSN9B6Ew24gcc2f5o9wCL9S5KOGXBdacsGilqnG9mNnAvsylRaZMRicKxnH57VlYsK71H558pCSgcotd4TVAIGYgHZaMuyPn0w7TqGBM310Kq6Obs8kJSNgBtRdh/yUEOpbTqnzssBZe80S3ibaPlhh6R2BmaVsUOzHC+AKNS3dKIucSNBf1H9MGkD/MYfQDNHb/z3tdwjrPwVOxehVT55zbjIqDHwWxlba9nxY+mSRBdqLzQi1wLf8hso5hMeLsvO8Fig/CxjIbccry92aNYwG01uBlKxYOcDETKngDV1GicxXf/bjGrZAyNQowBAcs73LDJZ/mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pPR1kzMuuhyOBoGHXo3FBht3+uemlOS+rYK3ClEHhtY=;
 b=dRqUuRnD2ADcnUTXWauuOJm4E/s/ZCF9unzOEyJtO518RlddQ8u3Y/M65rfDjXWq6dTlylEgWQ6sHvf7YyZWWYiVBbNor+0REzc68jxXz+Ee1ikqPSQwBCiIkZjdIuSFpEQXnUc0XwXZjrXZe2laG0f56WiOpf4/koWV13AKpqE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PA4PR08MB6127.eurprd08.prod.outlook.com (2603:10a6:102:f3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Fri, 8 Oct
 2021 07:48:53 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0%3]) with mapi id 15.20.4587.022; Fri, 8 Oct 2021
 07:48:53 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH v2 05/12] recipetool: ignore empty license files
Date: Fri,  8 Oct 2021 09:48:28 +0200
Message-ID: 
 <20211008074835.10320-5-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: 
 <20211008074835.10320-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: 
 <20211008074835.10320-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::9) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from DE10512.weidmueller.com (94.134.181.155) by
 FR3P281CA0051.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::9) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.4 via Frontend
 Transport; Fri, 8 Oct 2021 07:48:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c16afb2-b874-45f1-374b-08d98a301354
X-MS-TrafficTypeDiagnostic: PA4PR08MB6127:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PA4PR08MB612729556B46B094E719F4D3D7B29@PA4PR08MB6127.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YOn0GGMsec2gMGR40mnkrJQsuxF5FM13Yg+AQcEmWCx9mXYibZ5gqlU4LiSnLVxGh8UNCJX56Ze4cc9hWTQruPJDLWqzX+0e7RjFicHYlb/jcXFKHbK5Ud6GaUXtA9MxS+4PphFxp2B7vI/aidnngjtrD2ZNh5VIHXOjOpXw67P8XKSVdS3gkAEg8GxznVSUw7WyYqJ+jMYWYiErPMtInRkpj2HZm/gabxe06FSfOBAuuGNo6d7qaCqvIDu3eTVxd5sokl4uEJgYQIm6Sdm/wgXegpPx3oSwGuoZIeNA/f1LjwXBGjqCJX/lUkawuJCLOrXxYPVtwAmf8ngngcxxKnOoHopyeJIOJaSFea3I3Hf0WsZ2KitI5z/JlorhbzX/KU0fKhgMx0QfQ0/eZufThoHCcWt68JMFz+xrwYyQqHNZmPpw1LvQpm7gMmjGDShcPNdcMNOr2Hy/EhWzMuK5SJgvIhZybl5HZ7NKgUgoPehTTWeq/yaDo5bLblKV6xSvjpUVZdYg1o2FYlmFgeHUEs0EhDmYnNdtmVxJdIEnfemw9abH3ICNaA1QRoQJyO/KCfXHe3znNV5QOw9KIAXtUUmH+6Z9ubXWgAF4+G8cZKyDXqYtoaivz0SSyvd/loOqU6/OHL7Vd+njuCUZCm9gpy+yANbO6eNeZwYPz898WmClkkNkv3i9aBJdSEKpp4Vsi1JaGG66hsc6zrcGKjlYAA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(52116002)(186003)(7696005)(5660300002)(26005)(316002)(8936002)(107886003)(86362001)(8676002)(508600001)(66946007)(6486002)(4326008)(83380400001)(36756003)(66556008)(1076003)(66476007)(2616005)(2906002)(6666004)(956004)(38100700002)(38350700002)(4744005)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cijNH2TNvjOoEogRHT7wsQimxOHghhFTc5mbH6kkR9tf5qGfAchTBgVOUe9T?=
 =?us-ascii?Q?86v80QG8UG+hagqyYc8h8XiNUtZg5nMJGJM0vXo1IZK4Ulx22t/KejpNN00g?=
 =?us-ascii?Q?wymaPWvzVC8985HqLoJGEGHE102zcNcBfZcEEcYSj9O9u/AquJEV65xrN141?=
 =?us-ascii?Q?p4c+BLII/zZlnRnB5AR2L/4/5r2AmSK/TZHhp2XHd0/C2ieGXAXkw8vqMURB?=
 =?us-ascii?Q?wCrnf1ppXA+JFj4P/f7ujTQTu0QTayuKXfbFZMNB6l6eycQL7vhtKcXSdUq7?=
 =?us-ascii?Q?RjxbJ9ytC3bn2SSvP/fqa7rAveoVVZEGSBfINhn3NbNYwzHYaAGJHUlewVDb?=
 =?us-ascii?Q?Qvtqf1qW9CUJqDISJ+IO1nWfJ6xcYGje4DsPrjL+Q/7USdcAvAzp5+w5fPvW?=
 =?us-ascii?Q?xKr0WSsFuCmdxFc110AmrVYgjFkHOaJpFy5pXdbQjPWY/gJOcQHdZlUI/5Bl?=
 =?us-ascii?Q?SieToMZQvUErgp3TkMFFlkpHbQXvq2WUK2wek0PWsVAIcaxA09/QtVc1gQal?=
 =?us-ascii?Q?zZ9ZAU0xMXeS/vhUoWAe+NXBLX51Z2/8bMeT6hRy5lBQsjUXWDBKtNczdIdA?=
 =?us-ascii?Q?8oLFMvj12rnBVb5ZIiLuAPqHc2yMLSiSltNLjURg4LQO+2CMIxoy6rw4bqEW?=
 =?us-ascii?Q?1jnbAVJzksAJb8a6D3V/6KIKl9a5WeQgEZVWemuSNEPE8mP6WzO8naalmxUb?=
 =?us-ascii?Q?JbBRx0PvPuriWZlahhAqvCwKx7BzIiWee+NSba3hgqpS/XfT4PaxONnICe7l?=
 =?us-ascii?Q?F0KeldItSAkFjs/UIotB8LEy6gAkA8duNAFtmKxoiejFafPu6fhTz4bOYayt?=
 =?us-ascii?Q?5QtITd0OhJ/AkrMm2D4j5V5K1AY2GvwOGKPlrFt5k5TuD/qnCNfz3/tLwW9A?=
 =?us-ascii?Q?NI8Z+JQ/6ZKuQQS6lX7k+pywSqGZUS/ZzceKdHvqZdyQNxoCeLBZDbn0Zip4?=
 =?us-ascii?Q?YdvuBdShfvU4erD/yR9T6Wu8FsiH+Po7a/L4AH7xKSWQS6STiiKQ1MnGsJPr?=
 =?us-ascii?Q?99EiJONyK602O7PXMySrLKreL7zlM1+ff4H0tJ6VXSZ8q6JCCpYl4fJA+UIo?=
 =?us-ascii?Q?gK7Dj3nT+c40EZ6Zx4Rg2jFRiHMCizrv987jTcZlguFvRv7RVMJMiIPDDtl8?=
 =?us-ascii?Q?QULlIwcDBfP14tCwEdbUMrhJpad/xC4DnaoeebSKzl8LC3/IXK9HBdC9DwLk?=
 =?us-ascii?Q?39uoPHSGGDOXSjbS4NvKz5RgBkLqmhdY1+F3/TOr8xXIOpu2BOQnLwgmVyw2?=
 =?us-ascii?Q?WiefJeoHcacPGileGgJ7Q+Q/Kh/epNrgZUPE9yIFeIQsxCHHQvZMd4a0ZBBu?=
 =?us-ascii?Q?jtIHpxHl4V1gxxdRXnhiDEKn?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2c16afb2-b874-45f1-374b-08d98a301354
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 07:48:53.8090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 d6cSPD5N74owgxFVi2ZEU5NqaFf+RTAduC2YOS8KB4NJUMHO8Zb9/lZcktHF6cCvtl2dnintKlEJN7UHw4g6Gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6127
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Oct 2021 07:48:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156762

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

(no changes since v1)

 scripts/lib/recipetool/create.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/crea=
te.py
index 893980a5ce..87b25ebc7e 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -1126,9 +1126,10 @@ def guess_license(srctree, d):
         license =3D md5sums.get(md5value, None)
         if not license:
             license, crunched_md5, lictext =3D crunch_license(licfile)
-            if not license:
+            if lictext and not license:
                 license =3D 'Unknown'
-        licenses.append((license, os.path.relpath(licfile, srctree), md5va=
lue))
+        if license:
+            licenses.append((license, os.path.relpath(licfile, srctree), m=
d5value))
=20
     # FIXME should we grab at least one source file with a license header =
and add that too?
=20
--=20
2.20.1


