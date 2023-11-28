Return-Path: <lukas.funke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 653A8C4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 13:52:56 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.59])
 by mx.groups.io with SMTP id smtpd.web10.32904.1701179563652080413
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 05:52:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=N1Bvi04B;
 spf=pass (domain: weidmueller.com, ip: 40.107.13.59, mailfrom: lukas.funke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e230EUBypxurwbg/urjpV7vl9EjHgbzHHtZgTihILZ/Mgqf2yGMRk9zMt/Gdjd1wLr5hrE4z93K9rFw04CVDSq8lR/kMwJscKW42f/uIq4bzLlyErH+auUfH5e3Jh25MJv85pLl7Wg3xBKYggkZzH6XcJnzxtWTIxHhZcA6BmwPpdB1KdttG24OPNTLTCYd+GVdD96NT0N/A8P/qZz2l2m0GawZ3JRqEwEjai1pt406m+kAH9ZBzpAAcxeoKZYC/VTh2cfulHhKeA5a+hqDt6fw45bx4hofKNxMEeXW7hn/qry5SWLmy6LybFodSzBWBQrfFRXltXxwRZoMbkKj1Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z7LjsefHir+J5aeSSD78nHVZ6dq/imfGNXg1paFSzU8=;
 b=gx5o6sDZdPur8Bv8H6CfORBQUeorY7JKoo9wqlvmqkcF72RX0KmCbdbkeHJP83gLz6kYN9HkZ5NUdaTbh6l3mMM6AVkkMZwdcad5hJsyd+3kR6f6BCW2vCfh8odDSCr2JRADPL8PFuluakNhRCm/0ceid7IBOJO3gaoNrRXcv/5smq7AiMvlLTOmA2ZS1nMJmf2WTuParBe0dX72SDlTDpTPyu/Q6ECqByFAxqN+OsTzaqsL0HBT3EgmashT4vxylRT+/C/KTpf9/0HtSRoXB7ZIl0afWlJ1GcSZvH0MDuf6JIEHIdHvZHy9CXpXr6yOC186LU93N/unlAqaEAIlPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z7LjsefHir+J5aeSSD78nHVZ6dq/imfGNXg1paFSzU8=;
 b=N1Bvi04BzLQT8/WmytCbr7MyyN/hRCvh50IQmQGSrgSVuHa6YT/Kd+8zdn+Za1HUSdTsU9TJG0CGkpxLyliNkZEtlZBRacv6fo3izNu2m5MjA6xbWKTRDNiYI00dfA+Z/tBQj4GRBr+S3TQf9X66wkl+C2QO5FZ7ZWovBpwYbeg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com (2603:10a6:20b:55a::18)
 by PA4PR08MB5968.eurprd08.prod.outlook.com (2603:10a6:102:e9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Tue, 28 Nov
 2023 13:52:39 +0000
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::b914:d9b5:6462:13b6]) by AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::b914:d9b5:6462:13b6%5]) with mapi id 15.20.7025.022; Tue, 28 Nov 2023
 13:52:39 +0000
From: Lukas Funke <lukas.funke-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Malte Schmidt <malte.schmidt@weidmueller.com>,
	Lukas Funke <lukas.funke@weidmueller.com>
Subject: [PATCH v3 1/2] wic: extend empty plugin with options to write zeros to partiton
Date: Tue, 28 Nov 2023 14:52:31 +0100
Message-ID: <fb6e3fa4bf9eeee354cad28fc70e206fb25e04c9.1701176186.git.lukas.funke@weidmueller.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1701176186.git.lukas.funke@weidmueller.com>
References: <cover.1701176186.git.lukas.funke@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0261.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::15) To AS2PR08MB8431.eurprd08.prod.outlook.com
 (2603:10a6:20b:55a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR08MB8431:EE_|PA4PR08MB5968:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f857d6f-cb6e-477d-7e35-08dbf019494c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Cc3ZMonReb7VP9feAHc0diSd3z6ykTMuphBByZcb7rEMI+Y1YjwYohLdCkCVcCpEacLVp+qHZ2kzRv54aeV3Gm5TIseVjlo1ZIGwWVsOvBiHgz8w0nbRZRiRfo8oJcWPw2afMjVc6Q2liJLiAacNcWE/uQnricI4oAn3Mfq8wn0sXAUTB3jD7zt74yJrISSryjxHEb61njxZ/JOCux2nqHGpzNaRoohrLMDYggxv5sVmf38LqrQZCsawHnqZ11xfSZqIIRNpWC2X6SlcMO50sRIdU/R9q/mY7E3y6IeBk2B2uYagLsqDk2hZcOwX672Ny8y+CB6HOmgNxJ2LHqPkJN0oRqyXqC4MkUIrIULPfpArRkaCDdcCA4isK0tEY4nFZ4wPYZ0SDgzYJ8G+hy3QTjuA+yI6X0/y/9odR2WJ8zW0bPLQdVmCBjjVbWieIN7YFwgxHCZkrC2tUhA3MaUOiLRiG4mPg6KvHgS0je/bilrzAfLLNZV1PLnDoL678OwFA70abMleckUSDTEkJfFa7+AL0HsLKQj9pPFDWVozOP89CCW7NSM8WMfF5BFyvNf7TVuhKgN2pwYLRPhkGxbjQLhYuG5rgGsatyEymbbTMkclClGh+rCbG8/m5lydnDmn
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8431.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(39860400002)(376002)(346002)(396003)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(52116002)(107886003)(6512007)(6506007)(478600001)(6486002)(2616005)(6666004)(83380400001)(2906002)(5660300002)(41300700001)(66946007)(4326008)(316002)(6916009)(66476007)(8936002)(8676002)(66556008)(54906003)(38100700002)(38350700005)(86362001)(36756003)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OS141U/DQVkKlvWjhu239Y1p4H32+huQqXTSqq/Mcq4iRMuKdR5Nr/LhA9eq?=
 =?us-ascii?Q?3WZONca1Nv54T2zsDGftQAUs2StTkAm0m6j/3+fHgj4GQDhz6CqzFTTkEzZ4?=
 =?us-ascii?Q?1SDHoAyR/xDVkFc1DCpAaG/aa1TBSeNPmkR3LlZp3FLlsrqB59M0K8kJ2bIJ?=
 =?us-ascii?Q?DBQbnGn6ejO1Xx0TftLTOyiawfn0aKtRnTs/Uca0JldSFffLb1LHDFNaAziX?=
 =?us-ascii?Q?qkUtWh9GkOKeWg4bpY1i7KUiLA/HR0xAhOm7NBM5yvE2S787Jr4K5XMtr+wx?=
 =?us-ascii?Q?PQu6Lol6l6ZTQ7dI5Dr0v+5crn1W+NrNWAyR4N/sv4mO4aa3T+pKO+5N8nvu?=
 =?us-ascii?Q?lXXwYuCA7i82Uxh9fbIy988QbQ49sf8pNdj4IDVTqlMqP+cluZlkw6wzQ+p2?=
 =?us-ascii?Q?jAq5M/jqyXD0jaKEWry+rd/QCpARqALdSJq2xbtBsxvKgJfyjaLmJ8rr8egP?=
 =?us-ascii?Q?yDgEucTFdrDNqt7B6CQ35RldPmiT1wpfkFeBSvzsqd2qGalz1MXSZoLOQOd0?=
 =?us-ascii?Q?x33N9B8Oa2Vwf49DSx1Cyeh36IaHELZXqNjGH0N2py2WZV7LuS0JvgXGu/aU?=
 =?us-ascii?Q?Pidyz8Dk62B8o/+cpwvFQj0fx4/uiksBsYFWj0MpwG6EEz1ceZXPlvzd4dk0?=
 =?us-ascii?Q?jusZ1Wf/tr8Edkg+l8uEKhVj1Kd+EAm2aTs9FNCxIH7WEMzPXCKkTYGkeKVo?=
 =?us-ascii?Q?/t+3rWWmSFNIZBRsPoBUoxvvkxI0d9Hsaub6bnuT7PKc6nV/aUCqJrn6KJdL?=
 =?us-ascii?Q?slBBqQ53dLihZXR97h8x3nSVehEA1D4iRsdDnTlV3yc+k3LTT/VGWm2rSTEi?=
 =?us-ascii?Q?VWPrUgMyXVgexAcHwL/XL97Vzns9lxyYXilObwH/rPb9WJkZf3JgSoobBACb?=
 =?us-ascii?Q?Sa2P92Z1hKRpDPbBS/hxt370FDX5nszEoSYHKoSsEsS6UZZYsDshQsUx9Qqv?=
 =?us-ascii?Q?4FDp+X630u0w0AqndOFLPbBNsRWFLeCa4p5xHfNSbDo3KYlmlFyV8UkaiWQ6?=
 =?us-ascii?Q?zXEG+a9kRNUVnG6MgcKhOy9ewMB0z+z53xdDPBZDH8PMd4+oqIBNbb0XB2Y/?=
 =?us-ascii?Q?g+bfOjaiqFQ4FyPmTG3mkLbjXFlpnJcEQlQRfzFtQxAEwNn+1QXdR/kW0QpT?=
 =?us-ascii?Q?wJ/MXJLHclnyZ89PBU6OsiAxF/0fdYx0oBphhwKBxOztJHS9/C5rxfyhs8TM?=
 =?us-ascii?Q?Qmnv3eyMA7mHLpLTN4h1Dg5ULC1lY8AXusHGIwX6hZ1N9HUWOXgztSw41lZS?=
 =?us-ascii?Q?fKjAH4/N+hTjuumjyS5Xnm5Lahscbcz8veAOQfel/o2o//3KDO2ROsWgWQBR?=
 =?us-ascii?Q?A18a/F/Lj1t1iTOBJSut5DHXiGmGGVvJIkw9BKRG1vjCNm/apV2ycXRNOnCg?=
 =?us-ascii?Q?Q8GRZCXEFm1r7ynAiIXnxDjeGv3j6I6Qybr6a05HVjYgZl/6jTxrEXbEMiXX?=
 =?us-ascii?Q?nwGFx/1j7cbTZsQnRK1ilJ5ymOuy0z6tCTSl7wN0XCaY8fT1bZ2qjx2mBLZV?=
 =?us-ascii?Q?n7G2DdEwl0FGcCBAM7RLUE7lNTpIiqA7ECedXXt2EXAY+vW3jBs7UYy8ptf1?=
 =?us-ascii?Q?lUS4kbRlIVswvKSeqQT3tOfnf6qkM+fwmkE0FeUk3npgrOEhM938+zFZZQR7?=
 =?us-ascii?Q?PQ=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f857d6f-cb6e-477d-7e35-08dbf019494c
X-MS-Exchange-CrossTenant-AuthSource: AS2PR08MB8431.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 13:52:39.8511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BzmpSNv7wzDuTs6cdeBGi6i0z09QNq0bm7NkwA6Cngu7VeFQ3gq2eDVjO4KRsoiTju5TlJtzI0O5u2IXQgXdoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5968
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 13:52:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191371

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
index 9c492ca206..0a9f5fa27c 100644
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
+            size =3D get_byte_count(part.fixed_size)
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


