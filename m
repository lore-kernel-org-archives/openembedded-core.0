Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99AC0C433FE
	for <webhook@archiver.kernel.org>; Thu, 10 Feb 2022 16:18:12 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.88])
 by mx.groups.io with SMTP id smtpd.web12.12556.1644509887047822028
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Feb 2022 08:18:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=m/Uy15up;
 spf=pass (domain: weidmueller.com, ip: 40.107.22.88,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SyR1pL+wXrMtEy589dUGqdOtRXCccGnl8My4nKsD+zr7UbR9p/6uQHbisHxjIXqW3NVGAGBsv+eN9f05djqsBEDN1kXgmZdv3+/RIuG2GaA+pYW6/6LvUV9fz6rhdis58vf1NnSWfQmT6P2iu2NTUvizf/UdJZtoj6+9zWTJBjChPhb8MJU/AUIz8GN4hAExAJhaPPhmzdz8go48O95ecWEDj/S2RxH6yKhGypiGSt8kt9Nm0qYt6h3CdUrgOY0fJhbL12UzIk1b4eJNW51wXz2xUP/m6tTjXnMbIaNU6ahfWHy3XC/g0uzRgKo1hZz7ZG6U0GRFk/z5QFCKC5b6Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fPfRGI6pWADPd8OL2uDIRdfZoMCLmb+XlcMCocixR6k=;
 b=LHtwWsyNHS5QGHLScvQLV0FNXsydpah1u2qnZqLpc8TJHfIm8wDY7KNEsD4jpwQTAUh3vG6l/0L9DK4TFjwvaoME3nd9GdufU4B+/8XbxZdwZbmEp2WW+QdPBB4yjJ2Si7WAMg+iNa7oFY0c+gBKs9PJe5xGQTZxitxI/BS3o8H7fIONSWfmayjltD3+DUJbW1hquNlKUpsJIvW+5qnFcRd3WhyKW+nxnTgDpxj/6X5swFST51+iRavIoqTYZi2xP2onmbKN2V+wrrHRuxpOeY2G8WzUVe5HTVHZRJ8Acm5cffQjLKeZt18V2De6JP2/dDO2VCo5+Tr448xNcteNEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fPfRGI6pWADPd8OL2uDIRdfZoMCLmb+XlcMCocixR6k=;
 b=m/Uy15upKlZj5S3blCi/OFUYHxNlgoH0EihoWYCqHzfAxiuazTReOltmXJgJl1oP6xqu8QQJCh1Qdqo/at2st9jRyNExlB7TWC5XgBDNwKhN3Kc9lCjbcel5KgxerTKFpm5auQG65IflYSxt5tn1jgpIN3N4IpslbJfUphkebKg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by VI1PR08MB5501.eurprd08.prod.outlook.com (2603:10a6:803:138::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 10 Feb
 2022 16:18:04 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2%4]) with mapi id 15.20.4951.018; Thu, 10 Feb 2022
 16:18:04 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH 3/4] selftest: wic: Remove requirement of syslinux from
 test_rawcopy_plugin
Date: Thu, 10 Feb 2022 17:17:37 +0100
Message-ID: 
 <20220210161738.17989-3-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: 
 <20220210161738.17989-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: 
 <20220210161738.17989-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0024.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::15) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1cf2f2d7-bff7-4b96-b6e7-08d9ecb0ea85
X-MS-TrafficTypeDiagnostic: VI1PR08MB5501:EE_
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB5501B7D9A3F52D50DB149C33D72F9@VI1PR08MB5501.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:211;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gxk/QmAD7CMDi4iXK95qPUatdaNmDUysofB3x/7eYKQaO0bNbjOyRSFS/vhEnvhYcxwLqAOSmHuVnpi9FajVmukXuj9Le5cgWEsDSCcbJEVDQXfS83HIGD6IaFkKkaHwuEXRgX6FHjGEqmQ0NnSHLecXpeRwroZ0mKmCnwTnkmqkVUaWQ1lfn7/RHB/OQ7du5MuFFDuqoD9a2GXxw6dgTyP+nEi+oEy9kotrKMMokzeknW8AWOz7Eg22QkpNaGx7ERMgpLV47VnX+ns+1MmbLjE2W+9dtaWxjGfyyWKfByzJqTCi9h4LGOssAFcn9PgUbl4tUboAIbS7gMo7pbwD1WhVIZ5jrBtJR+MMpGZ4mSNLqyercL0zSHxONRIGJ5zjV0fiUsBSlDRqoRKPeoNExH0NUhMzLR/r2eisZKe2LoccTPH3Lm3km50CyJLY65d+yeZMFwe2mB6Ok9pzp4wOG0ZyzyFos+M54hjek1mGECdsULgR5E/KxqRXmEmSlMC2j6ShOCvaYwFObZ8Bb1H5WhgNpdR/Ie0ZK/WO+PsNRAFOr++Fy0Y1IPEtSUYTYNmB0JjrdSeYZdzxwFLMCem3P01UA9rTKAji1b89HIi6BCy8whVfEHi8umcyXEriiPau2EhTVyTIO2xJMvvu7mrP2gVI5lMEHfQ0zLyDIoIdpAPTCO5pjo5b5r7sn/ceneHr4zR49QK5dmZz+B5iTDYVxw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(186003)(5660300002)(38100700002)(6666004)(1076003)(316002)(38350700002)(6916009)(2906002)(4326008)(508600001)(8936002)(107886003)(86362001)(66476007)(66556008)(66946007)(36756003)(83380400001)(6512007)(26005)(6486002)(8676002)(52116002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PWNquu0UY/i9BH9mr1RGTtMDNMs2V5OmB9tW+ha1pJjobwxQO4ofFkCWjIg8?=
 =?us-ascii?Q?oMAW8y/qG+8w8snLOIvtiyfnAjhoX3uuyZkUtJfMrkOqZVy77hqpNvNlBJEs?=
 =?us-ascii?Q?unfrCm9sTzL98PR3icKIk/EpPhqqZgcgDMGloCMkfiSXDwFx13l8L8YfTeCA?=
 =?us-ascii?Q?V3IrZXMnB3N+QiXJxtCdKw/J6cqI48e2ES6uXS6f2rgRQcgDgaBE7X5Wixit?=
 =?us-ascii?Q?WTXdbE7ylrWDiw5/A1KdEjZuJIq1madS0NdoKHTD5ailIfw8yM6RqpPedLAu?=
 =?us-ascii?Q?3OGfNPp506r3hn43+TTQscyNp1TyzqHWgtJpesBDjPE2H2LfCmZTew4XzVZq?=
 =?us-ascii?Q?ZZzgu34yJo1jY3y+ScVAAbYBkCL7/2a2CicnSxkNHT/9hkM9SJ8fQSkcFdVK?=
 =?us-ascii?Q?gAv8zkmsZWv/J7xkqiW3fPuPebZlSZlW63GCD2NVOLT3C/egthuDz4AUU4st?=
 =?us-ascii?Q?Gc8EX+6D/9+TDFxQh7zOGNaqtpymW1MXthxstBjjEzpRpiBBDF4t6r3iitC6?=
 =?us-ascii?Q?TjeaWKfc2Yo5SpixtlogiCoxO7EZyI/CKqasA2mQ/yai2b1OkcuPQ/vpsH6o?=
 =?us-ascii?Q?UexD4b7xEecJ7rToBjPcRLVZJGzNwfySIGzoxu4KsR1QvAUscp0cHTODPEdw?=
 =?us-ascii?Q?bZDUtERdkDk9ffJ4mlt/JQXZGgc2ZCvzf4PlL66pbiXlVCPOp5hGVizoJwrC?=
 =?us-ascii?Q?JwB3TMUkkNv5d4xwbLHvYm5gXn3znNA0JP5o/Cy60L5ouD+PLP2s4xa8uHdb?=
 =?us-ascii?Q?FsfupmuZgjHsfBmYFZyuXpm6n3nan1GkJLLQ4CpcUBhf/+PmI2/Jrb4zuNyl?=
 =?us-ascii?Q?+So4zDG6gQrk7fDTyjA2RVryN9tBn8S1jDL485gsuxQL15NYM4SdeSXW72Yq?=
 =?us-ascii?Q?ODD5muM0/sdhEWlWfplsmljbe8OJE7uwISGUi68B/lEuNDlKMcydypHX88JY?=
 =?us-ascii?Q?dz7yrD81+Kccve2AAQI+DSkCPpjQ64lynogXS6AlMI5UCTCj5HHLVcPJgkB/?=
 =?us-ascii?Q?/9R2QFPiBtbYZvEDJtFpjRsVZSE6LlRg/sP/H0ptpUmDX9hP2dEZHUtyJkB9?=
 =?us-ascii?Q?rrHMu00PHtyL0oaRqMZ5lg2PWcHr0pWHwDUdz+eS9fTxXcExBHzDKbYyH6bZ?=
 =?us-ascii?Q?e/GhcIgD+lrY7s77gBHzF5Xo7bMil9t4BWVUQnGZAucaWKsgH2UJFWJA6Rcn?=
 =?us-ascii?Q?BYZyRTdAHxi6jVthoGZlMWKOEzATsq23j0xoSLaBOtlKsv0NU2Bh8ep79ksR?=
 =?us-ascii?Q?aJf8gRzl2ZUGXQl9veJC1fS903+SBTRkVuKL+Egeah0VK4mILy/fgJfE5sbx?=
 =?us-ascii?Q?bKPtNzI5nYmeRdDyoCEiU9EC1Ywzc3UP4HqFSBOCSjHHxWd/NxsYSOt3HYMe?=
 =?us-ascii?Q?F5tILIbYX5QVnTXvuXRunF8a/eBRNxCu5vC7ibPDZEXCsIpcU/9/qE/Qe6Ns?=
 =?us-ascii?Q?k8LT2rayfxxIc3cqNoUWy4ca6vY2MfXkTlvZWnO9h/TG8ODAF9LFBPm0b8bx?=
 =?us-ascii?Q?Gj1w4Vf9GK+HkPKA4Rd+ffmDEx07LH53H+U53WPx9MW14iCe+mqhadtrEUyA?=
 =?us-ascii?Q?OOZ10Kjp9OVIqxqRK09n75lD4E0NnkzoZ3EAVUZWyA0eX5KrxGDfyWLa6Ovx?=
 =?us-ascii?Q?mKjT9XSzZ5LBQbecDQ+3xLM=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1cf2f2d7-bff7-4b96-b6e7-08d9ecb0ea85
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 16:18:04.4553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 xQ0ZVWZXN6CDbM4a7v4bR00+xmzqLi8BIL0hrgGQHPi/rVe49cs4GRZ66IKUTZ0s2IkExe4ocj9HhHaXAdfsXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5501
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Feb 2022 16:18:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161619

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Remove bootimg-pcbios from wks to eliminate requirement of syslinux from
test_rawcopy_plugin to avoid the following error.

ERROR: Couldn't find correct bootimg_dir, exiting

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

 meta/lib/oeqa/selftest/cases/wic.py | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/c=
ases/wic.py
index 5fc8e65142..96b3e1b6a5 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -1070,10 +1070,8 @@ class Wic2(WicTestCase):
         img =3D 'core-image-minimal'
         machine =3D get_bb_var('MACHINE', img)
         with NamedTemporaryFile("w", suffix=3D".wks") as wks:
-            wks.writelines(['part /boot --active --source bootimg-pcbios\n=
',
-                            'part / --source rawcopy --sourceparams=3D"fil=
e=3D%s-%s.ext4" --use-uuid\n'\
-                             % (img, machine),
-                            'bootloader --timeout=3D0 --append=3D"console=
=3DttyS0,115200n8"\n'])
+            wks.write('part / --source rawcopy --sourceparams=3D"file=3D%s=
-%s.ext4"\n'\
+                      % (img, machine))
             wks.flush()
             cmd =3D "wic create %s -e %s -o %s" % (wks.name, img, self.res=
ultdir)
             runCmd(cmd)
--=20
2.30.2


