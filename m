Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E21DC4332F
	for <webhook@archiver.kernel.org>; Fri,  8 Oct 2021 07:49:00 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.50])
 by mx.groups.io with SMTP id smtpd.web09.6082.1633679338556585943
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Oct 2021 00:48:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=Yn/atcN8;
 spf=pass (domain: weidmueller.com, ip: 40.107.0.50,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mQilzkDBtEc4r6N8xpuD7wrI9eM4kxCfZOkduOsq/p/tCGFnCOC8wTB9JyFnFxXMEwW9ZpUQZaMpKYwfdk2rDzsw6qxxq+jwK8hiW5of4LbE29AvrgNZ/BrwaEHVtIeAyFQoUMaQ82VqTj50O0FEGaixv7lC/UgBColZvx3vEbPOW+UGNm19pC3d0ceQwNLgcTB20+zSALHJLh9rwvDM++A/TjeD4qCDk+W5nPAMAYz37hkB5oqLJO76yOL8FF521VfFOY9hX+64jR8XXUg0lI33KK4uYOUzDqPS+S++l52larh/8mAY3BU7SSYLf1k+Mbin9GMbYlt3C5bBI5igNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GqBZrYq/9bo+MVgggxZ2/ZPrs36coWOC11R2hsytbNQ=;
 b=VeGmbiengOS8mpZdWMarhcPqDSuKfc2GNox3/WfTdSKDvaAz7b1XgR43f25AZ/TFl/PQKA6i7qOTjcEhY043CSJQwDLzDOIbnluNFNOqhZWdWefpVd4qF6aM9T2XHAn1yKC1N/uLqataMChhukY0SqLpDucwxnSDRzlxT0QKWgXdJh/RzTKboM9hmK57EToXUaKQmRSmp/BDn/En8F3Yik6ge0sGFPl6lJzsInIvtufTUd03xBv8x/YugKNUYkPgfDEPxcnNuaStKIrSDdTYK6qf5W5YnBUF+RKd0DZriQtrObSvy/Acm27F45s5l0Mn5RkKh/B1QqW4Y/3Zz8Ke4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GqBZrYq/9bo+MVgggxZ2/ZPrs36coWOC11R2hsytbNQ=;
 b=Yn/atcN8cdATVuIT2ci9EX2mCoAl6XJL1nFWi5cKgueRRYyYAk6wcGFpN5Lg6o+Q9jfklyxNx2Flca8FRvtX0yYiOohQabPDI8hteLtbY/ocY2rmhH9wCcbND8LiKlM6Lmb1PVERhSnTP3vwyC+KiHqPSB2p98NEML0om1H2fr0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PA4PR08MB6127.eurprd08.prod.outlook.com (2603:10a6:102:f3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Fri, 8 Oct
 2021 07:48:54 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0%3]) with mapi id 15.20.4587.022; Fri, 8 Oct 2021
 07:48:54 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH v2 07/12] recipetool: Add support for linenumbers to
 licenses.csv
Date: Fri,  8 Oct 2021 09:48:30 +0200
Message-ID: 
 <20211008074835.10320-7-stefan.herbrechtsmeier-oss@weidmueller.com>
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
 Transport; Fri, 8 Oct 2021 07:48:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 287d61ae-a163-4dc9-c79b-08d98a3013bf
X-MS-TrafficTypeDiagnostic: PA4PR08MB6127:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PA4PR08MB6127530E84A43D94644B9354D7B29@PA4PR08MB6127.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	i0akN32f8ATjtrLsjr5uLWTGJVDGAeapBDD/6byqvkDbn2AKEkszSxNGZ0WY/pF3j73g+SbA6cL4m+gpG77cASAABhDlMXyJ/tmC82FKv+PRlAwI6zEWf5yhm+Ht4bhSwsf8OS5op9yniAzdIEWKqFYIedKkVWnOvJkM9KgH5FoLzY98vSuNTeupD7Ok6LRowMrrKelIk/SAQrxzdENPgyTZC/BtK+Cpq14ic6WSqkUiU0/pd8YTcwORV0XUWLV3y15jZ3WrUk/ovhsoKyMk5+ZgK039joRkRRko8QAMdXRDZlELtRgqRLjiOPHLC15jf5Rq2ortVvazsN8bNXpEu6PpwDjZaCCusPUq/KakSZ9LPmQDYStmwfYV0QInynBoYAEevsuCAd796vmnTmezJD02fvABwEYghCRtMR02q8MY7vYoDhLidMuAhEcRN+pw+mGzeE30jrt8nkh5ti0InqXM4X2GNkbLPyCw7vnI1G3JeQ90kdtPyCjrdhn/lWYbI+XmF3pLpgFbGzwi2ZbgtR5c2Tr6i1tndIOx0vcgp6Ujh1OLGpfl+93aw78uHH0sZHaWj40f7n+AtnaqcYyzBQn3WLSMHUoM/GDY3+D9unXKxo8KfypETgoAirPzgQmbk6TWuoDNUOPHjnVhzgFWvurdwMRkdqlDACCKt5x/W3q9xGgfMOtQQM4kvuyreHyO2BrYBLfRtmDrtW5hQ2Zqrw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(52116002)(186003)(7696005)(5660300002)(26005)(316002)(8936002)(107886003)(86362001)(8676002)(508600001)(66946007)(6486002)(4326008)(83380400001)(36756003)(66556008)(1076003)(66476007)(2616005)(2906002)(6666004)(956004)(38100700002)(38350700002)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dmdkrDc/Z2MNqGgz7983lAd3YP5m5Nu7EMQL910XrH3UKPo5MlgaJ1Ya4hmj?=
 =?us-ascii?Q?0DTaV14AlBrayw8ZsFnDqrnS+PuqyYn/Sqw+9U/k6KCeb4gawP2X3KXyxZW1?=
 =?us-ascii?Q?8qkufzaCX62i9GvGSM1LJC8JXRZv9KFjYDS0CXIEzD47ijlHOdgec8znfkTa?=
 =?us-ascii?Q?mb9+2JIEws3esCu9WuA8foQRjaz4FayehlTvTZig1QLvo9t+tcI/i67P3Fzg?=
 =?us-ascii?Q?G0x9aNAFtkHiCqkfZzslzBFmLnlq1dsGNE2evMkgr+TrdsDlGsCgh//S8kW7?=
 =?us-ascii?Q?O6PQkhamzr3qGSdbIQMIhQ1JgEDtxvbGtXTSfcYrpXjjx2Z0ZtNIK6OaE/CH?=
 =?us-ascii?Q?W9DjhoAT5y7wbQ1Xbw/XNGhNsU/o4l3ZB3SBV8eI0UtRa8AZAdwuSUMP0Bkl?=
 =?us-ascii?Q?gcuHogjWFt/F5K+4516uJTJTdOYrm4YlqrDaRmlVstFiKoJ07AxRko5t1IIh?=
 =?us-ascii?Q?7HRlKU+39zj9GCA3Ql3YZ0k7WOCMY9WW/0DwZVQyqjeUsOgbIeRuDtYIDubz?=
 =?us-ascii?Q?KLiIeVW9ulpcHZkndnVDA2TlSqH9K7QrP4w2Ko4afhdkfhtsEU5DS6+6QZWD?=
 =?us-ascii?Q?CYZIIfLlUV5QCRSheGlL2e8UvtEWPbebVYIH1ryMfAm0p7E5db/C8WpAZcRA?=
 =?us-ascii?Q?8aDTts2b2HF6GTL9wr75i7pyKNrpHE1p2tC37VRQFz9Cx8rrG66luhgwur1c?=
 =?us-ascii?Q?fr99ZSDKMxdFl/BEYI+G48YXNEZzPMod7gyudVxx2WA0hJ+9/t7zNxqE+an7?=
 =?us-ascii?Q?5Io8cfZAFJhkyNhso38un4wjujL080wzQ3iDGxuL4W1Z/FkOYSBO0HZHCmwo?=
 =?us-ascii?Q?E3u9Wk3x/hYAsX3mx/7YiWWB6ABplgEp2Z4KpvMrm6guvoKhy0dApGF+/dAQ?=
 =?us-ascii?Q?gZLHC2xbeFeQ9pxGQgiH5zVK+5JN/h+aKwwG6FR7yALbZNeQP4HIEYh/S6tq?=
 =?us-ascii?Q?x3XE2AVH6ZNUGu0cxuceJ8E6MV3nPDZJ6womfERDfdYrqV2mlT9DXtDqLp3f?=
 =?us-ascii?Q?/f9jtMktHQ3n246+BQ7KBPP/femU2SSds55QtOmjDEMtTNOFUX50SygqlMwM?=
 =?us-ascii?Q?YdJ4XjAczmDS8lzUIK2gTquEsIKJz1wUCEEDZMVeEUpIFX5hx0BHR6Dao9Lz?=
 =?us-ascii?Q?SNnSf6fmZgmG3JgUmVVSglZ47PbrSIFvDyKQ4S79jg+GE9y3i+Pk1Mqz3WUa?=
 =?us-ascii?Q?tpqd7a9MSJ1cUCho7lNqRSBCuWKHEKfeT98eT8Vp24pVEB3YLz1JMvDX0Mpb?=
 =?us-ascii?Q?OkKTcMygn6MOc78d1x5tLWCGc0XLwZPxLvbpvYn2s9s+uPRGKXW0CIYF3bY6?=
 =?us-ascii?Q?0t09mnpzGOTYdjURS9PRkAKV?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 287d61ae-a163-4dc9-c79b-08d98a3013bf
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 07:48:54.5060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 NlHwoNYyFQ3rN5eElniOBiPqsqBm236YGgWOMpo+ooQoayg90tjMsr1LStpL6gBv6wIPU1r3g09AwIMTS1k3AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6127
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Oct 2021 07:49:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156766

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Add support for linenumbers (begin and end lines) to licenses.csv. Add
an optional linenumbers parameter to get_license_md5sums to support
different use cases.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

(no changes since v1)

 scripts/lib/recipetool/create.py | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/crea=
te.py
index a8c4cdef4a..277266be4e 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -1002,11 +1002,11 @@ def handle_license_vars(srctree, lines_before, hand=
led, extravalues, d):
     handled.append(('license', licvalues))
     return licvalues
=20
-def get_license_md5sums(d, static_only=3DFalse):
+def get_license_md5sums(d, static_only=3DFalse, linenumbers=3DFalse):
     import bb.utils
     import csv
     md5sums =3D {}
-    if not static_only:
+    if not static_only and not linenumbers:
         # Gather md5sums of license files in common license dir
         commonlicdir =3D d.getVar('COMMON_LICENSE_DIR')
         for fn in os.listdir(commonlicdir):
@@ -1024,10 +1024,14 @@ def get_license_md5sums(d, static_only=3DFalse):
         csv_path =3D os.path.join(path, 'lib', 'recipetool', 'licenses.csv=
')
         if os.path.isfile(csv_path):
             with open(csv_path, newline=3D'') as csv_file:
-                fieldnames =3D ['md5sum', 'license']
+                fieldnames =3D ['md5sum', 'license', 'beginline', 'endline=
', 'md5']
                 reader =3D csv.DictReader(csv_file, delimiter=3D',', field=
names=3Dfieldnames)
                 for row in reader:
-                    md5sums[row['md5sum']] =3D row['license']
+                    if linenumbers:
+                        md5sums[row['md5sum']] =3D (
+                            row['license'], row['beginline'], row['endline=
'], row['md5'])
+                    else:
+                        md5sums[row['md5sum']] =3D row['license']
=20
     return md5sums
=20
--=20
2.20.1


