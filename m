Return-Path: <pedro.silva.ferreira@criticaltechworks.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8168EC3DA64
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 13:00:10 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.73])
 by mx.groups.io with SMTP id smtpd.web11.6627.1722949207556365127
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Aug 2024 06:00:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticaltechworks.com header.s=selector1 header.b=al451KZn;
 spf=pass (domain: criticaltechworks.com, ip: 40.107.249.73, mailfrom: pedro.silva.ferreira@criticaltechworks.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KmyObjzMR698M2nG31gOHAqpGfdt8+Rf3fwl837SfjMBeXFe5X55nqgkhaMuTXcy+5DX2xfY835xCflSK2dSMYug5EZLg8+4nQ6TL82xw+y2ElG3kFI6mX/G2i9HsZygGAJisMWLGCbnSVKhHPQKi84lHHrWu5Z30vMTQQPBSp0aQVfrjCy1OVzKPHNTCqlcTIZfPq4cmPerrLGnASAWKRcLZJWaZxOnR9mt9pCNupX2YCXZWZN+frlmy36AmMka/neGIhvtXVO+ICpJacooltjvvvgaj3QRCWj7zJ/d3Abi5W9MhykGiyGL0ro6EMP7ZoymSyJQLGpHhFiJ0zrPTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vEkK35PCRzJa20LimeOOd3GLIiMZbvc3HMyb6emCzhk=;
 b=HT2WvBWCoSdAvjpZrDfoGTcmSvpqfd4ELE9uDx/vHqqIp1w/9IVYBuls1uvba9V+xh+3xMngDluMkS3pxosRB4epm9pcVf57qM6Joap6Yuy3LjLfCtHF8PI7HH8yRmDsB8PD4z8iAtEi8Ct0egm35Nrx5QA2m3LyB+54aCgDQ2G0C+orVZVHoUWCjUfce6ViKbqXTW9ru4+em45HZ5855TLgh3Ii412uHkIwp5uotOxa5xk/rusGK+8ltJl9eigmt38Xf7UUD1eCEsTe5EMrXXbT7kw4LLTNwYqVVY+PKaIy+xsvQ4G4u/u3IaWYd21yAzQ+NCXCaD01kz5MSJgC/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=criticaltechworks.com; dmarc=pass action=none
 header.from=criticaltechworks.com; dkim=pass header.d=criticaltechworks.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=criticaltechworks.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vEkK35PCRzJa20LimeOOd3GLIiMZbvc3HMyb6emCzhk=;
 b=al451KZn6y5djwQtMhYl5c2WQz7rTkAdD2iuMsP/UoZrHndpWfuzrZuIqiH+B/RTorqhjjmAxA27LJwZSYDy3RdTeC6BH878oneVRaimMt1jLo9JbFVtypZ9mjlKp0rV6gdQ6A/0tN++gx0m8EyaQdXkzJDqvZXWS5zRBYaoETmpqf3UfLMXk8q2n2sJ0zGNAOvX28CQb0W3j3a5QJEbEs3EPh1J6NO7kWBnF1DWmRSE5qLaJyo5tzNYm0OVe7AHltoQXpTFf2OT2lBzQ1RnCSEIo/uOYX3DtqGobqd+yJxOBY0HUKxJFToeilMKViVYKINgbvVCp/b+Af6XHJ9P3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=criticaltechworks.com;
Received: from AM8P193MB0900.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:1ed::9)
 by AM0P193MB0532.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:169::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Tue, 6 Aug
 2024 13:00:04 +0000
Received: from AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
 ([fe80::c359:f497:ed59:65a1]) by AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
 ([fe80::c359:f497:ed59:65a1%7]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 13:00:04 +0000
From: Pedro Ferreira <pedro.silva.ferreira@criticaltechworks.com>
To: openembedded-core@lists.openembedded.org
Cc: Pedro Ferreira <pedro.silva.ferreira@criticaltechworks.com>,
	Pedro Ferreira <Pedro.Silva.Ferreira@criticaltechworks.com>
Subject: [PATCH v2 2/2] buildhistory: Restoring files from preserve list
Date: Tue,  6 Aug 2024 13:59:55 +0100
Message-Id: <20240806125955.160835-2-pedro.silva.ferreira@criticaltechworks.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240806125955.160835-1-pedro.silva.ferreira@criticaltechworks.com>
References: <20240806125955.160835-1-pedro.silva.ferreira@criticaltechworks.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0229.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::25) To AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:1ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8P193MB0900:EE_|AM0P193MB0532:EE_
X-MS-Office365-Filtering-Correlation-Id: f140bf36-390b-4254-812d-08dcb617b058
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?9ksnQa6z/dQXVV5iwD0lfWYuCOdi+5Kol6aLtUbkVDbdB3ciQllpXoTUqFER?=
 =?us-ascii?Q?N0UxjWWSGClKMN9+4+pwxsz3VqtQtQHXP9Ou00I/2P/VJ3tRp4XCvld/6fH9?=
 =?us-ascii?Q?WGneGMqaC8FQZLsJogvDMFad8CTGOcrtXOic+apW/aBk2w3vD4SUdDf/vdgx?=
 =?us-ascii?Q?4T2R+TzWIW8ArNjfx23Iwva5yk26+rUlTGZNDfu5i9JyIH/ol++Z0tIFVwMj?=
 =?us-ascii?Q?W5x+huMcJrFLJckOO6MXlmsfQ4vk6b+75j/NW4nlveTdUXGbQbsKcB1H6Zxa?=
 =?us-ascii?Q?GC7wuAsVYM/QfoMTltl95hP+vS5KUT2gTgK7uzRN5xvd+h1weLlgRfAnZzJD?=
 =?us-ascii?Q?EZt6at2kuUn2HuGappQ8B1AqlKonkg5Jd6r14sA+VmMqL1NsLeE9Qw/kyAwl?=
 =?us-ascii?Q?Gx4y1tlNLn8wIIPzLJRpPSln52jJVImkcvC/6Vl2NYHzok7QWngXDfSSX9gj?=
 =?us-ascii?Q?I/OIOlOJmsSz8Ik5PoIhiTlKfVuoqJ694JDQW8HeFWFWV7Qe92V7DS+g4RDr?=
 =?us-ascii?Q?czvI16QeYFV1PpTtcDHdFBtjY9pxXD+7AvgDrrsjE7k43sDm8wOh3dP4a8H1?=
 =?us-ascii?Q?oGYe67qmYDWUPsACJsPhT4HBFC/kl/CmQ5xH3DfOGfZiYbUkKEQro0Tjxdxo?=
 =?us-ascii?Q?MGjOGsAQsngjgpScrCXjHIjSbW0gQ95YcAJOL3CPs9XGBI6l4GSiK61rkQky?=
 =?us-ascii?Q?j8rPhWyqUzUPQ+fZdkCMvcTP/c19u4XugqGTtCufuNKUpeb8NUDVU5EjpCOD?=
 =?us-ascii?Q?l1SOkvOLd7nNZciYp122Z0J7MTUqz8oiCwtIAe5WqcEwgFifSpHd5C0VuPFQ?=
 =?us-ascii?Q?j+wm1qh3dV8WY0f+tcnQ09rVn/dAVuyIbRuVfQtvQP6x9UprVd6T5jdPDjBi?=
 =?us-ascii?Q?/KGEDM5U6HPV6N/AXRyUWLudv+xuAyHPtWk9O0RmovIILdcRslNQA+afmhqv?=
 =?us-ascii?Q?W3GHNqOs+8KOVz4lbYhSYFBczVgN4+hNaAxzYThfB8qF2qKropoUzWpiBA3+?=
 =?us-ascii?Q?3viELJk6AajsoxkhyHJSS4CiNcMadTJC5rs1Cw51vbf/RyiYG8u8JFYmVLO5?=
 =?us-ascii?Q?0kRifYmL77YUFz6V/po5RHvW16psb5T1pOlTKEWD3zag3cuf0lvfMUpkJNAd?=
 =?us-ascii?Q?ITnm6haz+F4QsuAI0JhjcM2XIOsgwNOTAQI4E+eeScC4jKL7cvcJzIqx7THG?=
 =?us-ascii?Q?xBz5lBfSt7uhNdp1yKYAHQqNWSQAKuao0cwkzQ98WAKQNaSDDxt56mP946Vd?=
 =?us-ascii?Q?i4Htcw8YU/1W2Vwxqu7M8QJmh2ziYgDcW9tCF1zUh53d+KXFFSk4OZNZdOKe?=
 =?us-ascii?Q?wBhIKxc8txZ3hfojxo57TO93hoLE9mH+NyQ4A3dDY7jfUwLu2ZQeFyCHcV3/?=
 =?us-ascii?Q?3hH4Ubf+7F3l/76fXTzg0NKJBCVpoe/fwsxQA3QlDeM2T1uIJg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8P193MB0900.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BQlrqFx0PeomSDwT6OO73YhYGDGVUvOGhbxcDW7LHLgLa6ArewoFnUfIh2WG?=
 =?us-ascii?Q?V0K2veeo8kOYflu/nPJWTT9JN4X6ZuUf0+4qbkoBEGi/24qdofDvXCUVlDt0?=
 =?us-ascii?Q?kUqMEtAhAQBxtq2SsoYnSIZkhjUvIv0b+ofMmBnTJ+IY090OJsQTwf8m+W09?=
 =?us-ascii?Q?BfH+2cQsbDyW2A7jpUYcXdOO1RHmAAmO3SmJAIEuJuG9bUlpVKu4sQwzzWnD?=
 =?us-ascii?Q?aUj2h2Q7F/KYa7NxzANbu8SVhBHRDkDoOTG2nyJoFmRLxQG1aFhXzHEW8/hd?=
 =?us-ascii?Q?/3frAVbazh0FC9SETH9kG2uPQqV6zY0RPrElWiOXIOwwtFsyqVfQ0L2cmrpY?=
 =?us-ascii?Q?3nxze7okijfZZ4YGCs8qbtfV5T7gfFCZSlz358oC7tazBwzMfync22xgvFyX?=
 =?us-ascii?Q?s6HV3hZgwIm9EFpbGP8iMUVAKFVbsHUW/FOorcc0k2ol7HX8cMpJE6+3P9XV?=
 =?us-ascii?Q?giHotD+BF4tBwqdnQ6Asnpt/Wnh6hp4ZnXp2xsD3H00XPRo7va/xhA6mZ0Zt?=
 =?us-ascii?Q?j2ZHA9pCkhq9j1G0Fwo8du7bp5X+bYtwoY2eJuSrNV6j6raUC7xcl8SsBFT0?=
 =?us-ascii?Q?7BMp4dpJoJdRkkI5l/yeGYJqd3moZ6Qfmkgu2MPR1vys7S4ct1w6t2WiOmpq?=
 =?us-ascii?Q?ynNyvpjpgBmyf/GJvse/X0wt/tcfNz12EsAzBHL/mLLdUg3YBht3m7hTYcwM?=
 =?us-ascii?Q?wtYq0p6DtS8+wYQSY8BJTg0aI9dPomesQ9xV4TsNtqhKljhWO9hSu7XldFWj?=
 =?us-ascii?Q?10HZA0/O7OSBNLgOzjBLoPxdiupWzergl7R+zZCEBdRts6hbJ0lPFJRTON+M?=
 =?us-ascii?Q?bHJhuRj+BPuwFUNv/HSwFWBwbD3+QMGzvCE74fGbI6HtptJyFXfWpd4bNlUT?=
 =?us-ascii?Q?yG/gso3QFScWXYHRJ2gMae8iLCoLDaN1kmCwi1CbcRDe3q3c1CcbW86OhJE5?=
 =?us-ascii?Q?+3sG0E3ISquTJ69PYNtFUm1KWnjqj+YMbTksPdgTFsIlNfxPmp1IfpaJpb8k?=
 =?us-ascii?Q?JpBNA8vuWZ/Z1oBwDDhTT389AM8Inf1CH5B2ndSvO7y5ZB+0z5Czkp0dD82B?=
 =?us-ascii?Q?0cKxxnDu0iUOddaIcgg+lt3t+8ku9dZDjGRspnoS/GOt48cvpRKuKb5gtAvZ?=
 =?us-ascii?Q?KXgU/UPadIlFitGb9C6SCTLxGjwx3BgXWmMyAcXqLvMu9nx4LGQMWR/RibFr?=
 =?us-ascii?Q?HVG8B4tI8//OiIbIRjAOh35smI/dzFGAm7JbUMYvUszNaRy1PbvHt6N5m0GO?=
 =?us-ascii?Q?0sPlKLyS/QrO1L7NjUzp8CxHy9oCf/J4/3Xe5GhFHAB700S85B4obAD9hqi7?=
 =?us-ascii?Q?yBX0XzcQJq6NI3nOZ8LN4H5hFinVjGCM092o0njDS+BJht9xO0bFGxnCXvWX?=
 =?us-ascii?Q?mN6UuxMyKOp8E35TzTtJ5ADV3O1PlqRNN1lPYICKHEXTuUxOh6Ohy16xYH4N?=
 =?us-ascii?Q?tyMr1z4R6oloJqWPc1ARw9NW7a6E9l9AtKgQtaoUo+NzIGxmt0HlxyemcffZ?=
 =?us-ascii?Q?hJhXT7Obkh8z9Dz0GDgmuV/Orv7nDFg23E9F5FFmA4zas4tKCv36fwk7Ege7?=
 =?us-ascii?Q?oebNWpE/dsd+uayuo1Zp5YjOHYp4yzvqJEuTlBKc62Ccc1NsYx+9bhZq8lYu?=
 =?us-ascii?Q?4oNxO2XIpoGjL1VOMhxpsZ0=3D?=
X-OriginatorOrg: criticaltechworks.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f140bf36-390b-4254-812d-08dcb617b058
X-MS-Exchange-CrossTenant-AuthSource: AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 13:00:03.9511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 61f30b8e-4f6b-44fe-9bc2-041e3a9f7346
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P7s9xQlU2pygCudhZWIgyPErkDyznialB/EmWL/LUBoZ84OTjv9rNM87za/mrhpuGN2hmTHIAHLGv5kw0u4EVDLQZ1dmsw5wL0MpNEYjcqo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P193MB0532
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 13:00:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203020

This fix will ensure that, when we activate feature
`BUILDHISTORY_RESET`, files marked to keep on feature
`BUILDHISTORY_PRESERVE` will indeed exist is buildhistory
final path since they are moved to buildhistory/old but
not restored at any point.

Signed-off-by: Pedro Ferreira <Pedro.Silva.Ferreira@criticaltechworks.com>
---
v2 changes:

Fixed Signed-off-by to the correct email
---
 meta/classes/buildhistory.bbclass | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.=
bbclass
index ad151092c9..349b7dfba2 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -110,6 +110,7 @@ python buildhistory_emit_pkghistory() {
     import json
     import shlex
     import errno
+    import shutil

     pkghistdir =3D d.getVar('BUILDHISTORY_DIR_PACKAGE')
     oldpkghistdir =3D d.getVar('BUILDHISTORY_OLD_DIR_PACKAGE')
@@ -223,6 +224,20 @@ python buildhistory_emit_pkghistory() {
         items.sort()
         return ' '.join(items)

+    def preservebuildhistoryfiles(pkg, preserve):
+        if os.path.exists(os.path.join(oldpkghistdir, pkg)):
+            listofobjs =3D os.listdir(os.path.join(oldpkghistdir, pkg))
+            for obj in listofobjs:
+                if obj not in preserve:
+                    continue
+                try:
+                    bb.utils.mkdirhier(os.path.join(pkghistdir, pkg))
+                    shutil.copyfile(os.path.join(oldpkghistdir, pkg, obj),=
 os.path.join(pkghistdir, pkg, obj))
+                except IOError as e:
+                    bb.note("Unable to copy file. %s" % e)
+                except EnvironmentError as e:
+                    bb.note("Unable to copy file. %s" % e)
+
     pn =3D d.getVar('PN')
     pe =3D d.getVar('PE') or "0"
     pv =3D d.getVar('PV')
@@ -250,6 +265,14 @@ python buildhistory_emit_pkghistory() {
     if not os.path.exists(pkghistdir):
         bb.utils.mkdirhier(pkghistdir)
     else:
+        # We need to make sure that all files kept in
+        # buildhistory/old are restored successfully
+        # otherwise next block of code wont have files to
+        # check and purge
+        if d.getVar("BUILDHISTORY_RESET"):
+            for pkg in packagelist:
+                preservebuildhistoryfiles(pkg, preserve)
+
         # Remove files for packages that no longer exist
         for item in os.listdir(pkghistdir):
             if item not in preserve:
--
2.34.1

The information in this communication may contain confidential or legally p=
rivileged information. It is intended solely for the use of the individual =
or entity it addresses and others authorized to receive it. If you are not =
an intended recipient, you are hereby notified that any disclosure, copying=
, distribution or action in reliance on the contents of this information is=
 strictly prohibited and may be unlawful. If you have received this communi=
cation by error, please notify us immediately by responding to this e-mail =
and then delete it from your system. Critical TechWorks is not liable for t=
he proper and complete transmission of the information in this communicatio=
n nor for any delay in its receipt

This e-mail is environmentally friendly, just like Critical TechWorks, whic=
h lives in a paper-free atmosphere. Therefore, please consider the environm=
ent before printing it!

