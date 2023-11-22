Return-Path: <lukas.funke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F8AEC61D9C
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 10:48:07 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.82])
 by mx.groups.io with SMTP id smtpd.web10.16542.1700650077155555998
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 02:47:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=bTymF80y;
 spf=pass (domain: weidmueller.com, ip: 40.107.105.82, mailfrom: lukas.funke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YjSrpUgje/hDIZNiw9klRsMg1DFulj+u0V3fIXZ6hLyXNwUpJIzu+cpygTg9C5enP0pCX3ZHz8Oj6Y+6qw1HlCn9g7Yul9RUP8kYspIUU4RhdkAjBAKEaRL7Hd0tAvxx2178VDPQ23Oqys9rSjP4YUYeNHd4qvUoWb/pVWWMKWDiGgM0wWFhJ4RUIKdtNHt28BBC0PG1U/4zhcmxRSpWMlouO5XVruV5u/v9HUe8cZKq8SaVPiY4Zbo0nYyVfkmt9pK0DcKbeK6+RvX+kFPmd7wRSBVcNR7kzwvrpjEQ2LTHMTX1Td4InAbhXPFliLARNAZq3gicKm4z0+gAiBaZbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z+Lu0YcbsX7HB3N2KX4EtmHlxRfpqGCI4enyindSMOQ=;
 b=aFiLG7mMSRLqIStuvC5p4V8yvfaCbSBShc9dJdU9hgcTz9lCylwAhE84z1TUPOXTXQIn7QripUl/SbHaX4SpbufrcS8FLitDDIkSSKcMqdMYRe0iqFzctu8OGbm3/hyGLkad006n6Y363/wm0BZV+a/21T3mkM8rcq2Bir+Fg+TX+rrew7tcpam2DbhltMpzCZZ+N8LGC0AGpTzgRwCoqYRBQWHfKuL6kQcLismySmNZ0tD+KhEwwiV24/X4EW59zGI/g4i6rUowepVpjqPkaVu8c61cLcqa8njyrAbSLYi2qGBOTNVWFpbcpxQYs+Y46p+0bNsZl2i0zAYBbndRjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z+Lu0YcbsX7HB3N2KX4EtmHlxRfpqGCI4enyindSMOQ=;
 b=bTymF80yAjZCrXw4NbnBSBHEFWp70/aRJv2PStVhjTzSAqibRAfwxouwBuD9mC7/fs0oL/hQ+c3nkcC9m6ry8YyG3Eyc5Cuy5oWRWOgddo6qOsyWYhGH9qv8gjBYJxZnhZlb39k2qFktWHPHmSV0i9t5hI3woI6P5W39vqOnQgU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com (2603:10a6:20b:55a::18)
 by PAXPR08MB6493.eurprd08.prod.outlook.com (2603:10a6:102:15a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Wed, 22 Nov
 2023 10:47:53 +0000
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::b914:d9b5:6462:13b6]) by AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::b914:d9b5:6462:13b6%5]) with mapi id 15.20.7025.019; Wed, 22 Nov 2023
 10:47:53 +0000
From: Lukas Funke <lukas.funke-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Malte Schmidt <malte.schmidt@weidmueller.com>,
	Lukas Funke <lukas.funke@weidmueller.com>
Subject: [meta-oe][PATCH v2 1/1] wic: extend empty plugin with options to write zeros to partiton
Date: Wed, 22 Nov 2023 11:47:47 +0100
Message-ID: <d4ac3df6b09be317ec7530694c6815a2e128ee8d.1700646304.git.lukas.funke@weidmueller.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1700646304.git.lukas.funke@weidmueller.com>
References: <cover.1700646304.git.lukas.funke@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0065.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::18) To AS2PR08MB8431.eurprd08.prod.outlook.com
 (2603:10a6:20b:55a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR08MB8431:EE_|PAXPR08MB6493:EE_
X-MS-Office365-Filtering-Correlation-Id: 38d3dc37-30b2-4ee4-e8f7-08dbeb487ae8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3ceyBZteSdTa/gUTVuhuCMefOMRNOIp2Imsg+EPG9Ru4xJwzi6C9Ltr7Pb3qqEnfQaGhLbqJSSRCplON8EvjWYb/RlmeT4I3IudhX8KXUNsHG6NQJquo+8c8syRbD9BEXkDBGynQPwWBz6AapAjZJyhavrWOuBVdeb8bbC1TJKCLqDXQ0lVaYY4Zl/6ABpr3zlx6UZE9b0vbPJonCIm1VxLpBr2jMLSU7Nw1rAYUA9oqoOlzGX8bR6r7DEFoR+7YKjFuk+z4INs7zedJzcMMrBms+fN4AnVcEarfwoJ8VzUOZ2AZGpmvaUsz+Fgr5qw9oFmwVMQhLOrUY6cgFA+cekO09jOL7v9cS2ayndO4wAXlHlWNquDWMD0Z2BayZn3EHwwRxDB1g+v+WbVfwt1O3/k0ISq7HpVvqzGfw7Khcoyu3YGCpBZ9d94PR3yQJkTIQ2Dnv8ECS0kRCGg92aa1CnB+yFZwy+F8M3wRcYCk1i7VTyMRpvSHit1dz4nLvQIRbS2BYCp/Ka8CzFSdqejT1JNjy9KENFtV3zlxWfTLti8CXFdoKrRw1E6zQPEwVF9cgmVfjWH5UNrszL9xM8219BiEk3/WFXSa7PsjA+CEJTBGgN5UPuMmLMJstgh5v3hL
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8431.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(39860400002)(376002)(136003)(346002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(38350700005)(36756003)(86362001)(6512007)(2616005)(6506007)(8936002)(4326008)(8676002)(52116002)(26005)(83380400001)(107886003)(2906002)(66946007)(6916009)(316002)(54906003)(66476007)(66556008)(5660300002)(6666004)(478600001)(6486002)(38100700002)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?43ORnxM6w3DESsU51nynZn3q9BFZP2vOSeHYRSdWtxofI+ySJlWe2e2LtvAF?=
 =?us-ascii?Q?gxPcN70JHghf4eVsut1xVsiK+AMD1khM2TB+KyPOx0lRxqRrgRqlx5K4ruro?=
 =?us-ascii?Q?CIlS0KHjPSOc6uMLL1YcbSqlkFtBv4keLnYuzHJoKZZfCJBYxw0UddV+feFb?=
 =?us-ascii?Q?RWNqw4MZOJR6cT7wy6Z2dZPJT7KOm0hUpuy2+p+Tq3OMrFKM6jOqcQGG1eQK?=
 =?us-ascii?Q?IPPcisMEkTTpHWl7czibYiuxtueN5VWB3DyT+NU4JLAgy+WG8kbi+7yK129c?=
 =?us-ascii?Q?2W2Zd5OvkQGNY2qPH2rwDXZeqGvBcnH00BDGw7gnm3wUSX3y5Q8MekZHzGMw?=
 =?us-ascii?Q?+qfux+JUuhBdY0VAUpAokeZgJhIl8BSGizwM7zVIzw4AWglN8peXhjt3Rvzv?=
 =?us-ascii?Q?7JRh9+RY1WaozxoDJcI3wA1C54fo5oDUnKkZwaBqTYR9fcWfHcQREhXJVJ2+?=
 =?us-ascii?Q?5VRoDni/layVh4blayG90jumcDSTqBAiATGsTHJzeOO8U+XuFx5iBysD9Hsw?=
 =?us-ascii?Q?zTDJy5y4RNxmOncd5gZa55F+pJn14JTt8NN/DgUpK81aWISGwnPJI8/cfWsO?=
 =?us-ascii?Q?PXi2jk4cbofg3fQsqPxyl8U7+CukSPqe7Zju6Wh/J6ZP2NptFfwthWI4Kk4k?=
 =?us-ascii?Q?tDF7gOB2LN64D9VPfHI8iqCE3/JqfIPtyVx936nzRG2geKNxvovgJf7o1pIG?=
 =?us-ascii?Q?E39LS3G+4ZoxIfgdQorF5Iv9K+b8ziHrKpE8dlBfmVYW6UHCCq58OFjluz7/?=
 =?us-ascii?Q?dt1TnRAtf6R/4chWK+VdEmEvnumpUxi/4TBAU6xB6CXM1pi0B+ecHOsv+xlJ?=
 =?us-ascii?Q?IIa+VSCKOZurqny/LdmusS4IR/Gi+aMkwynoB7J/aM0KRshKSwzD30O/2o10?=
 =?us-ascii?Q?oHRn0ZpJ4wmMEtVUce8/85lZQ2LL8JD+7p3YR6xj103QB4s+aIpe7cFR3ZY4?=
 =?us-ascii?Q?0o6kfpHaP+nLFOQ9Bf8K48xoa4isTLMtdMTxBq3T/BeHEPf/V2VpS7em5evT?=
 =?us-ascii?Q?h6lcRmbUCk2c1cDWKOO6CPaZstKRAf0/RkDiGHu2akez0ctQv19pwZBLrAj/?=
 =?us-ascii?Q?HmgyQyl1gzQZ0z7jLn8xeaIpvxMbhUcBUWAG/W8QdajWaNITOhh6p3eXLRLS?=
 =?us-ascii?Q?lEOaNG6ZOzg5LwrEhYNdi/o4HBa8X1REcBHHJ+yA6ihfDB4v6ZvbVX1bVVOC?=
 =?us-ascii?Q?Ta0MLRGXG/LZhD0irZtzW4bTcMavp3rQuce7h81JZ4I4GqukFqziHUPAMWeP?=
 =?us-ascii?Q?Aqe6TrJb7fz8q37puMRIIXNuaVOk5XGzgEKdbDo0uB9/0nbeHSioNLcUZHsA?=
 =?us-ascii?Q?LCRI2x7XGiDWcAzR9O/hIu9XaBo1IThfv9up7X+hPh9MsbtEuAo3rR7OKwpj?=
 =?us-ascii?Q?qRWICS4BctytT+E7Hd0O3IzSopDvNfoon1AY2TwolBTEpikVm1cDYamvhKBm?=
 =?us-ascii?Q?VPhP8hDwmqoO5dMvqNq56VVmLoZg4IadZpltQgz9XlbmKJFM/9U+V3EugS2G?=
 =?us-ascii?Q?if/XZbh5HCe7IR9RnOGs8BB9yi1uO8Hv79RBoZ2z5q6rbgANiewh7QLiWytf?=
 =?us-ascii?Q?XrrUFHJLZQCcICFPTr2cGTpqJO30+/9RjutnfX6KD/7xcZFTlNCDZdZs2X/F?=
 =?us-ascii?Q?9g=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38d3dc37-30b2-4ee4-e8f7-08dbeb487ae8
X-MS-Exchange-CrossTenant-AuthSource: AS2PR08MB8431.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 10:47:53.6072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z/dgrb0mK4pBrAXidKvR5x0GIYb5ETDtQB9rjYl6suvlVJue+avbYe2zPbsqOdhex1qPkW3uf1k/vjfza2Wppg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6493
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 10:48:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191058

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
Signed-off-by: Lukas Funke <lukas.funke@weidmueller.com>
---
 scripts/lib/wic/plugins/source/empty.py | 57 ++++++++++++++++++++++++-
 1 file changed, 56 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/source/empty.py b/scripts/lib/wic/plug=
ins/source/empty.py
index 9c492ca206..775631b588 100644
--- a/scripts/lib/wic/plugins/source/empty.py
+++ b/scripts/lib/wic/plugins/source/empty.py
@@ -9,9 +9,19 @@
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
@@ -19,6 +29,16 @@ logger =3D logging.getLogger('wic')
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
@@ -31,4 +51,39 @@ class EmptyPartitionPlugin(SourcePlugin):
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


