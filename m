Return-Path: <lukas.funke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE304C4332F
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 08:13:49 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.60])
 by mx.groups.io with SMTP id smtpd.web10.8452.1699949621774483481
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Nov 2023 00:13:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=e/UYwiZt;
 spf=pass (domain: weidmueller.com, ip: 40.107.105.60, mailfrom: lukas.funke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RFCMlgAuJPf/fA42se2L8Yt4kNqkr+4TaQHSQPCIpx0p++5Ht0OO8EpF0ye0GlmAziwLuJvUXz4zmI4bZRgduJOgAX39maLyUInQwvJ4bQvs4Nyqo6yFebixDWu6XoY9367+405hOq+YDmef4oGNR6oqp7MaQZcmZwKMHpFTAoKwOXY5BPI0hlV5DPLV9Ax9AzMjUbqKiegN022ZZenKRz8eN1B/1tEjI/Y/s95GaEBvihSP+vKz2uizroIDfuydBErBOjfr+G6bD144Ffk00Lk6IpCW/wX2LwylBhXIFmsnMTAb7nVTyOd2sYp5tG5zFAU8Df0sl+iP5UhxBvtd6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CH7tBYQ/RTeoBG/KgOiUYyQWU0V0p7ofeelM5zkavI8=;
 b=dE/r9vn7dtl5CgoHQrFx/bCwKll1ECu03cYA7OxuWVlXaJtSvrdtPeLU/42Kbmm4VQCkzFyAqxdJ6f5lYnFe4dh9geuasQ8Ia9VfeUOmxrqg6nn4w154njmdrqP40cN5xkSmsTp/k9oHKRHYcvUve6rMdCM75Is4Lt6zZO/hQOL8oiOMxQpDwWsz47xlzuPIr00rirpJDOQpPd3ZBg81h1IU+/3nYPInQyKVLq/XANEyy3HFEO2YvZmI2sLoDa2oKBYVcjT0oZQHYIjX/jYNUNe570AWDq51n0pFda9aSHkxndMV/NAhqy/gztiTQn/Me3vQ9bYX/kGEmHYLKi0ZAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CH7tBYQ/RTeoBG/KgOiUYyQWU0V0p7ofeelM5zkavI8=;
 b=e/UYwiZtlrPGO+M2pY30dy6nGJ1t1oSnDRRf8QPZfImF4JLgp61bGgr9Y0FYIqTbHVcYTopAtqaluBSjDZHj/cIV245RH8RU6UjcY2YkyKlcWutzSS6IGdzN7jhLg14i+LUoe9on9Jx0/yPFpojqQSirGpKHPxAa3uFz5/wwb8Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com (2603:10a6:20b:55a::18)
 by PAVPR08MB9458.eurprd08.prod.outlook.com (2603:10a6:102:318::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Tue, 14 Nov
 2023 08:13:38 +0000
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::b914:d9b5:6462:13b6]) by AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::b914:d9b5:6462:13b6%5]) with mapi id 15.20.6977.029; Tue, 14 Nov 2023
 08:13:38 +0000
From: lukas.funke-oss@weidmueller.com
To: openembedded-core@lists.openembedded.org
CC: Malte Schmidt <malte.schmidt@weidmueller.com>
Subject: [OE-Core][PATCH 1/1] wic: extend empty plugin with options to write zeros to partiton
Date: Tue, 14 Nov 2023 09:13:32 +0100
Message-ID: <084355e0fe303a8322111da4b84f3a3a6c2048d9.1699885520.git.lukas.funke@weidmueller.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1699885520.git.lukas.funke@weidmueller.com>
References: <cover.1699885520.git.lukas.funke@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0334.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ea::10) To AS2PR08MB8431.eurprd08.prod.outlook.com
 (2603:10a6:20b:55a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR08MB8431:EE_|PAVPR08MB9458:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b3c5bbf-8550-436a-35f0-08dbe4e99b1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XLDkHoo7bQO+oB+1VYgRb2Z4P0zxVBKLxuzGx6ge/r+bgU4yPL3raBG+UHiAx5HggWb9oWBbIRBH6ENUfXeAaozCPVSFKBj7u460tYQtueBe2gD4ntvgrhG5sORhFUPFr3w8XkyftlY3rrnrhQrhYJwLc754y+srLnhUXNnjtGYWNs25SLL6SXTaRR+q62A0OYc/XAg6nPVwqvHLvGWMABMQ8Sgea8o3Vqoi27M5wM4M5op1RjZTpouEJLTIt7XYtjljjqwBkVLOImKpYJHqM13YUrwJuM0xldvxsX82F4R0xKwCAicpoF4Wq1hmwOvjCHG0IX2REdgFTqCQmLSh/QwAz7+3HJkWMmHly4eWeNS27qZHklVoB7mBznObw6MiJQY09sN8wbiXOydjl7qFQgjtQSO/JqurJbPoKabmi8GHH0Dh5bc3CFhQr/4PjnC+S4sOF2WTcdXWbuuCPmk+TCLJZPFckVlIFKxvrONXHhVoZZOuKoQep/lKhrIgOqcAVA0i3wdriKjZQ6V0veHDpt8RjSJVnPdVuASkZpjUNwDnxJusq35h1s7pT4reV0B14VAxuF3pvval9OYi6ffJuE/SfH1Ra8P5b2wNePo2JzS87V09RzVQJRNsy83J/aUe
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8431.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(396003)(376002)(39860400002)(136003)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(38350700005)(66946007)(66556008)(66476007)(6916009)(38100700002)(36756003)(86362001)(9686003)(6512007)(83380400001)(26005)(107886003)(2616005)(6506007)(6666004)(52116002)(2906002)(478600001)(316002)(6486002)(4326008)(5660300002)(41300700001)(8936002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?t7gl6tSrerioWuv5xtuvMWUNnl/9hUIyOTGUZ8UBMaKtAksfTFfbhuh8f8iS?=
 =?us-ascii?Q?Z3kWkJOpvDBP2vRRPf1jSnDckISn7TieWLQXXWm8oNzRZlbw4pXrpgsQI9Cm?=
 =?us-ascii?Q?pl5RinzHp4AauWjCLEoXu9AdYnbefZZzxqePPaGIQL2QaE9gv1L9j4JjE1s8?=
 =?us-ascii?Q?FuhtACTnzaDjLsc9GvLdzaBjeE2+fehAUoE8RcXmZOJPqsJyzA6DHIWQdPG7?=
 =?us-ascii?Q?1V2ksZGYDJBLR/UuSdMXJtmehbD7sH/uqXYm6cRHlyUEt2sXBMrSj1TVOobc?=
 =?us-ascii?Q?NM2rVrjuIpho5Pz29cvQjY/Z2n3JBPDJ49vaCrkJlwE3bHNzC+XjL4Mb/ibY?=
 =?us-ascii?Q?e5+qlf04Nf2rKQg1qn/9cGogneJtxqyqvfR/GwPPm7HWKodZMMM9/v/6+Crk?=
 =?us-ascii?Q?RpPSt5vh3DhqrSDAd2hgkybe45XXVacxYn9+Z5OV5b4GnO/tfZUhE1S649SM?=
 =?us-ascii?Q?cqa6bIUcROXaZ+2J2Q/l36FxStsP+woxVgv0j+hnLosxqQDk0p4DmNMbXg/A?=
 =?us-ascii?Q?HXbG8X2MGbFms4Box6lXtnQGZuYxcHZ0HML5y5Ppp4dgIhM/uIT9CJJUjGDY?=
 =?us-ascii?Q?VkwTlDgrhHfPI/cMitx3NeLoDEzQcyb0E2YgiztZmEneeJBzliOREbg/pWs4?=
 =?us-ascii?Q?kRY4zgpXFlCbEoAC3SRs5fQN+/3TW0R+2AWllpd5fexx97aHtodWSwus8JoH?=
 =?us-ascii?Q?nVKzQhYUE8iyqPghJf/BtQ3/UI/iHa3A5jLcge+st2iH/+9rT1uZNk0O6N4z?=
 =?us-ascii?Q?31QUKmqBBhNhtFeucvZreGtl5XEivVcbVHwEeQgQNy5Q6y/A0dN+jDYS3bdd?=
 =?us-ascii?Q?mtvgufixpH6sHcNi8g9tAjl2p9rMJw5B52Ro43G4wxLIln3amEPLU6AUh1Wh?=
 =?us-ascii?Q?T1YFdmDJjzInhIo8Fx/CWHXJBFAaTEx1uV8+cQCc2cOEn3k5GjSpnpuA7jqi?=
 =?us-ascii?Q?IZS7y+R9cRqQeCQuz8oQlZFcCwfJyJD/G62PcKq04FqqC+lZ2uEpYL8oW02T?=
 =?us-ascii?Q?V/s9aC2v7QYQvoajzV62eq5sGMtLBgzRn3MxStzFUpRSIDk/lUBwB4C9pepV?=
 =?us-ascii?Q?M04c76C8ua5Yj7EyClfXgUyxIaDty7+b2x9oKovKchJMVLWe9v/nloo0oR/T?=
 =?us-ascii?Q?5jERmTmSR/50AhN7Sz4+AFhOEpaqmB9xtUZCPVzEnobnjt/RXJknqrHNxIqx?=
 =?us-ascii?Q?E3JtIZpPQ6W0I3urhc6vXVnTpIW664WqfETfdYNiZBXLY3Jy7pGeTa4ecJJ9?=
 =?us-ascii?Q?A27bynaHQLNR1MGM6J3KTgdt8FMlOi0Hyen7IHJDgg7KsP9Qi3VsHEDohkJH?=
 =?us-ascii?Q?OQZES0n0sgffI8GG94OZjFDqImUq9EKIqRqu9KcZOufEfMdsp1NTOiKLoKgD?=
 =?us-ascii?Q?VWjRBPr52RLY4yC9ggozGWnOIWsd4Mun7D+sgwehOuxNCNayF4Rshy/hZteA?=
 =?us-ascii?Q?Q+FZal3ayl14Nw4YY1osBOhA4A1pXLwd4D/2ZExbYGlc/NAZUpJ0Wbiwx4/3?=
 =?us-ascii?Q?QYbLIdEH21xzY1e4cPNx5V0BE0g0EAJCQIO0G1hXImBYSVhOUrLGlxxhkE10?=
 =?us-ascii?Q?bFQ+N48em+VOhCc4T0OuRYWB2/930OvFwCBgKyHddPFUDw4FEZrenfYg140k?=
 =?us-ascii?Q?6A=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b3c5bbf-8550-436a-35f0-08dbe4e99b1e
X-MS-Exchange-CrossTenant-AuthSource: AS2PR08MB8431.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 08:13:38.4945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kznCOs7k4YjsjnSNU9ahjIO/IlKi7sgZ2Si7V/MZEH89OHGKeZDmkhvfA0J3sBtGlqkwPze/9winP7txvx+OSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9458
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 08:13:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190489

From: Malte Schmidt <malte.schmidt@weidmueller.com>

Adds features to explicitly write zeros to the start of the
partition. This is useful to overwrite old content like
filesystem signatures which may be re-recognized otherwise.

The new features can be enabled with
'--soucreparams=3D"[fill|size=3D<N>[S|s|K|k|M|G]][,][bs=3D<N>[S|s|K|k|M|G]]=
"'
Conflicting or missing options throw errors.

The features are:
- fill
  Fill the entire partition with zeros. Requires '--fixed-size' option
  to be set.
- size=3D<N>[S|s|K|k|M|G]
  Set the first N bytes of the partition to zero. Default unit is 'K'.
- bs=3D<N>[S|s|K|k|M|G]
  Write at most N bytes at a time during source file creation.
  Defaults to '1M'. Default unit is 'K'.

Signed-off-by: Malte Schmidt <malte.schmidt@weidmueller.com>
---
 scripts/lib/wic/plugins/source/empty.py | 57 ++++++++++++++++++++++++-
 1 file changed, 56 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/source/empty.py b/scripts/lib/wic/plug=
ins/source/empty.py
index 041617d648..f7581a0298 100644
--- a/scripts/lib/wic/plugins/source/empty.py
+++ b/scripts/lib/wic/plugins/source/empty.py
@@ -7,9 +7,19 @@
 # To use it you must pass "empty" as argument for the "--source" parameter=
 in
 # the wks file. For example:
 # part foo --source empty --ondisk sda --size=3D"1024" --align 1024
+#
+# The plugin supports writing zeros to the start of the
+# partition. This is useful to overwrite old content like
+# filesystem signatures which may be re-recognized otherwise.
+# This feature can be enabled with
+# '--soucreparams=3D"[fill|size=3D<N>[S|s|K|k|M|G]][,][bs=3D<N>[S|s|K|k|M|=
G]]"'
+# Conflicting or missing options throw errors.
=20
 import logging
+import os
=20
+from wic import WicError
+from wic.ksparser import sizetype
 from wic.pluginbase import SourcePlugin
=20
 logger =3D logging.getLogger('wic')
@@ -17,6 +27,16 @@ logger =3D logging.getLogger('wic')
 class EmptyPartitionPlugin(SourcePlugin):
     """
     Populate unformatted empty partition.
+
+    The following sourceparams are supported:
+    - fill
+      Fill the entire partition with zeros. Requires '--fixed-size' option
+      to be set.
+    - size=3D<N>[S|s|K|k|M|G]
+      Set the first N bytes of the partition to zero. Default unit is 'K'.
+    - bs=3D<N>[S|s|K|k|M|G]
+      Write at most N bytes at a time during source file creation.
+      Defaults to '1M'. Default unit is 'K'.
     """
=20
     name =3D 'empty'
@@ -29,4 +49,39 @@ class EmptyPartitionPlugin(SourcePlugin):
         Called to do the actual content population for a partition i.e. it
         'prepares' the partition to be incorporated into the image.
         """
-        return
+        get_byte_count =3D sizetype('K', True)
+        size =3D 0
+
+        if 'fill' in source_params and 'size' in source_params:
+            raise WicError("Conflicting source parameters 'fill' and 'size=
' specified, exiting.")
+
+        # Set the size of the zeros to be written to the partition
+        if 'fill' in source_params:
+            if part.fixed_size =3D=3D 0:
+                raise WicError("Source parameter 'fill' only works with th=
e '--fixed-size' option, exiting.")
+            size =3D part.fixed_size
+        elif 'size' in source_params:
+            size =3D get_byte_count(source_params['size'])
+
+        if size =3D=3D 0:
+            # Nothing to do, create empty partition
+            return
+
+        if 'bs' in source_params:
+            bs =3D get_byte_count(source_params['bs'])
+        else:
+            bs =3D get_byte_count('1M')
+
+        # Create a binary file of the requested size filled with zeros
+        source_file =3D os.path.join(cr_workdir, 'empty-plugin-zeros%s.bin=
' % part.lineno)
+        if not os.path.exists(os.path.dirname(source_file)):
+            os.makedirs(os.path.dirname(source_file))
+
+        quotient, remainder =3D divmod(size, bs)
+        with open(source_file, 'wb') as file:
+            for _ in range(quotient):
+                file.write(bytearray(bs))
+            file.write(bytearray(remainder))
+
+        part.size =3D (size + 1024 - 1) // 1024  # size in KB rounded up
+        part.source_file =3D source_file
--=20
2.30.2


