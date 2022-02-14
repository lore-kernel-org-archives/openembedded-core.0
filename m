Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DBDEC433EF
	for <webhook@archiver.kernel.org>; Mon, 14 Feb 2022 18:13:11 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.43])
 by mx.groups.io with SMTP id smtpd.web10.37911.1644862385167473379
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Feb 2022 10:13:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=YOnpmL7z;
 spf=pass (domain: weidmueller.com, ip: 40.107.2.43,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XnXImgmmMQUXjpEwmUXep7CoimAM/xSVl1vZ3e2q3HbSU0ZrD1fPRKw//6Gp7auTn4Z1fBeWTI4UxaA22TnMexRwdqSWuGNYuoRDzeAAS6ThtedxtaCZvHeMz2XnWhtN7Gwcz7qvvSgVdH4WJv3QHfAxtIqkfmWB9jrJDJYsZLvY3V9bc29tsT9ABCjJTHmkXolEsuX23NqHLoEvifiLpSHLy51+ATQbwyUOHRk29DXvwxJfSeGsGmv0IpXDCBYsASO439HOF1PAJytvcT45pzP45g473RckHAckc1WIVULtIGXomtqYLd9TmJN+sKQ+mwH95gewwr78MHSzMX6gFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xkV0JSdobVomIT2PD/jcj88jVdL4Vmva7ZQ1xycucSs=;
 b=mvhiajy4WuYTbDE3w9or43ETqeqniN2UCLPFlimkQovImPOCpksWcTBkBVjPzuKjVTf0UMkYWuk+ySWmktKXR9Hy6tloASxLl8ZuxGpANRc9vatZ1lDbJLh+qnTSHL87FCijxzfVk/jhVRpZKddECTi8pCwgCi4L3onRtF0KtsodVTbYQ+C6Qc6NG6nnK/YPIzhr8EqGpCRYKRnKz/SmSdENwb3n1+aA/AkRktYkYZ0HWoLdDHJT6exE7Kn/96gQA38kdq0oHdqSnPVXaXhfx8vxatuS7HLAH99q2GtSC0Z7igC2u/7j2Xta/nll/ubsAVWI25/prK4nc/B5lXVCTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xkV0JSdobVomIT2PD/jcj88jVdL4Vmva7ZQ1xycucSs=;
 b=YOnpmL7zR8C0VlxeEJf1lvTi2WISMRZJeBm2Xo2Vq7nxnhJqxD6EUm6sYBkpCtDmaccFRGVCq3UglDDuU0hfUuWG9h0OPqFlGT3Gf62qmYxRg3RAYJ4ntwbChCEKBIaZ5XyYBW+ibRCYv7YiyiFjMiIQHwaOVofYs9wLk/wfugQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by DB6PR0802MB2181.eurprd08.prod.outlook.com (2603:10a6:4:82::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Mon, 14 Feb
 2022 18:13:00 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2%4]) with mapi id 15.20.4975.018; Mon, 14 Feb 2022
 18:13:00 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH v3 2/4] wic: rawcopy: Add support for packed images
Date: Mon, 14 Feb 2022 19:12:35 +0100
Message-ID: 
 <20220214181237.10308-2-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: 
 <20220214181237.10308-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: 
 <20220214181237.10308-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0256.eurprd06.prod.outlook.com
 (2603:10a6:20b:45f::7) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6cfd78af-ccc2-46f5-b040-08d9efe5a2bd
X-MS-TrafficTypeDiagnostic: DB6PR0802MB2181:EE_
X-Microsoft-Antispam-PRVS: 
	<DB6PR0802MB2181FDB6F8D70A411286EF2DD7339@DB6PR0802MB2181.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:473;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	V3vaiEAIoyzyVPUml7jIPSaI8inyRt3cvc6UYfCWg1Hagw6GciQgPUGQqay8wEEevaP9IQTvHRZIapIq8bwi0VfgcFRx/4b1azmxazqbr+GDuqr1KL7IjPp4sUrQKKelGBHHEFfa5pkjwmAHudmLYXWe0a9CyRekG2cMmLgnb7yB88g+N4/8qfi6nKv95qCJrJQmFP90oOrSFNERGLAUHajWnVig1iOhDd3aggGs9jTQXx99J1SqbJqW8STalt3M7ElKEVjmpKIHscjkgpVE2FRitLR1cLeAFVEBoD3P8hxSqlflnf35HiHQxJhpAyuR0+/cgT00KN5YokTGyuvQA6V4bfxBNRUzbHQYx2vg0y6bzAYELFTOGi8B1HLIw9tv69AUfzk2bI2dJmKNTyzNXwKDDtLyEXmz/BFUzM9kwzUloPFMmtiSS7voa/b6FEdUkDnJP0lZ7scMW4LHbhpFLopifcz1kP9B6JrOykGobKLyVYNCWYul6aIWewdP75Qu+lnLTBRo9MMmNSL1VshsT15u5thcMP2SADElbc3U53aL+bvgxsoj7afHnip6oXi+1+5i8mhOSOKDL1N2BN/2BTLF7JDaQZNYGkBGYsTZKlf+XP7+cKtqwBbl28PxOeAPDA5EwQajk8oWp+rNNwHVJnBKUFf3bSIWoItHd2xTyvyhKaxppulK7NVot3Y1TO877DxbRZA7UcDu9oNLjKwluA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6486002)(8936002)(6506007)(4326008)(66946007)(107886003)(52116002)(66476007)(508600001)(6666004)(66556008)(6512007)(8676002)(6916009)(86362001)(316002)(2906002)(38100700002)(186003)(5660300002)(2616005)(83380400001)(26005)(1076003)(36756003)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?whSI3u+/P6URMf0VYqjjq/kVbg5q/ZvjrPdB/tl90HwQuU5QzNWSTNAfwb8i?=
 =?us-ascii?Q?Oy2cr0Ajmo5VMKV4wL/kxJ1KbUi6Rt7g7uqbFxQ3IJXcK1Ug/oSzXAExKUcH?=
 =?us-ascii?Q?80+HhrZpJz1MjPG+b9o++kr5QiFOk2HQgCQASUEd22eHeyp45U0UYADyOf7n?=
 =?us-ascii?Q?zDEhZ9eCotVj9Pmb1GLKfG26kReHlo11QnIQnmF+35Da0Tst3DMCtapYGKM1?=
 =?us-ascii?Q?Kx+JPlYDJ3U3vA/MEgjv443mKEsxILX20jq6REKqo+hTHvRjWvuwPy7KcUd+?=
 =?us-ascii?Q?sPubhpcsMbvY2fkq2qPb46a8uCXQyZ4G4t4Q8aRp1rTwAsmlyGHYPHsKHagI?=
 =?us-ascii?Q?hK6l0tvGXGcp43qjhXd56ZGbwYYcrI32I5oxZYhclotvadEivJi/UXV9XJ3/?=
 =?us-ascii?Q?KbRjzIvEry6C18C/Kp8l+JzlSlWkz5wSZFJdO3UI+LQTlxDe4k2F1s2Bq2dS?=
 =?us-ascii?Q?brwb+Ge+6vCYRhpe9U1Ob1jCs3fol06N++R4yty12w4q/5qhN1hA62Gsvwn2?=
 =?us-ascii?Q?RrXZv7+y6EBK9ldVZ8XtbXUCJhaxcFtILoKTd4cBYV/8hcPhfzF7GWCekzNC?=
 =?us-ascii?Q?61CC2kaD9PE3I//kEG24dOZTfWa5HTGo7ftmv9tR6541L0OKxT5cW94HyxQB?=
 =?us-ascii?Q?Jn4SpRMzYJiqeHVbRAsLxP9i9OabCRlOl3n/a448wggBvblSTTaOLJa88H1k?=
 =?us-ascii?Q?7xgAdB5zDqk9HEZbKansFrOZ/wqUQhcuzVvslB8C8NNVxwwM8aq4fhCsfpFf?=
 =?us-ascii?Q?FHOn8msYxmqhpH+SJJxOrEEe8G2sg5axcErZSJSGVy9YBuaAumlyXVRQMQ68?=
 =?us-ascii?Q?uvevkbmbUKf0GAlKMxxqCtGbOmVwf8AIed7ysLwc92JRrVisnfpvcrE6ZuIQ?=
 =?us-ascii?Q?zAB+GbOhOts9g2CioWQy3xYah9esfZwbFhiO59HNrXhKCXNed5yTHGG5swGz?=
 =?us-ascii?Q?GHLLbrzXAv68bJjtqhH4JB+sxdxyDKgQWclukrSH25JJ7QJvNvQsUZepoI7/?=
 =?us-ascii?Q?5c2s7Y6JX1JkHKinFm1WRSB1S6dN0Kglr5Ja87u5MssO788TwjBRlkGAMHgn?=
 =?us-ascii?Q?zMYJnRhGE7nSr03Bw4CbDO4rJfJsPIlZsFPeCt5gPWY6UHSC3cRhYrJzWIxe?=
 =?us-ascii?Q?9k4sJ3pvLzOxor4/3UKYVY2G78+HB0EORLPL8lPgVQYg5EwGQuuIfARx6jAN?=
 =?us-ascii?Q?HK+sUrNHY/zSF79zf0q8gvJLmbCEJ7nTjzlKvE2CaCpmH33mm99LuJwwssi/?=
 =?us-ascii?Q?l5wMOwz73Uma35beQvQUyeU1UK7KkUMuIILySryaoaC509Gy1/HG9chk7wGZ?=
 =?us-ascii?Q?kFMkm1gtFIt8tmYP0gt3MZoK4Uz/h1Wqb6y1Wm3tvQSHzysXsHlnZa0/tkGu?=
 =?us-ascii?Q?wK2EVBvYI4e1k2sAcu7c96WRVzpmQheRVk6cYkRg4vfyD9aajmlZUaABFQOX?=
 =?us-ascii?Q?sJEyZFNAgxj4BqNfxu2WrIyi8+Cm2lx8bA+CnwSAheya160SHA6agEU1tDB7?=
 =?us-ascii?Q?aAHYt3I9ShGVfpUIwY0M6u6roLR7a+wK1B1K111C7e6lXhPIyJW8203E4rze?=
 =?us-ascii?Q?Gmn3y1FH/WWQvcwoH/IbDMws/V2RKZh0lQCdwfNExEB/nSl/byomgQTxTXim?=
 =?us-ascii?Q?MJglVJ5YcAbt73N9MWIp3aA=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6cfd78af-ccc2-46f5-b040-08d9efe5a2bd
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 18:13:00.9025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 EHdzTB8P5AIgwVgtM09opvDaKBqp216rKPkVDr+AUGUPEJkuymZ9tnEk9oHcKmuctzg7S/E7tRTXeO+72H9+CQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2181
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Feb 2022 18:13:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161730

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Add support for packed images to wic rawcopy handler do minimize disk
usage in deploy directory and reuse of packed images between wic and
swupdate. Add `unpack` to sourceparams to unpack an bz2, gz and xz
archives.

Example:
part / --source rawcopy --sourceparams=3D"file=3Dcore-image-minimal-qemu.ex=
t4.gz,unpack"

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>

---

(no changes since v2)

Changes in v2:
- Reword WicError message and add compressor filename extension

 scripts/lib/wic/plugins/source/rawcopy.py | 29 ++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/source/rawcopy.py b/scripts/lib/wic/pl=
ugins/source/rawcopy.py
index fa7b1eb8ac..7c90cd3cf8 100644
--- a/scripts/lib/wic/plugins/source/rawcopy.py
+++ b/scripts/lib/wic/plugins/source/rawcopy.py
@@ -4,6 +4,8 @@
=20
 import logging
 import os
+import signal
+import subprocess
=20
 from wic import WicError
 from wic.pluginbase import SourcePlugin
@@ -38,6 +40,25 @@ class RawCopyPlugin(SourcePlugin):
=20
         exec_cmd(cmd)
=20
+    @staticmethod
+    def do_image_uncompression(src, dst, workdir):
+        def subprocess_setup():
+            # Python installs a SIGPIPE handler by default. This is usuall=
y not what
+            # non-Python subprocesses expect.
+            # SIGPIPE errors are known issues with gzip/bash
+            signal.signal(signal.SIGPIPE, signal.SIG_DFL)
+
+        extension =3D os.path.splitext(src)[1]
+        decompressor =3D {
+            ".bz2": "bzip2",
+            ".gz": "gzip",
+            ".xz": "xz"
+        }.get(extension)
+        if not decompressor:
+            raise WicError("Not supported compressor filename extension: %=
s" % extension)
+        cmd =3D "%s -dc %s > %s" % (decompressor, src, dst)
+        subprocess.call(cmd, preexec_fn=3Dsubprocess_setup, shell=3DTrue, =
cwd=3Dworkdir)
+
     @classmethod
     def do_prepare_partition(cls, part, source_params, cr, cr_workdir,
                              oe_builddir, bootimg_dir, kernel_dir,
@@ -56,7 +77,13 @@ class RawCopyPlugin(SourcePlugin):
         if 'file' not in source_params:
             raise WicError("No file specified")
=20
-        src =3D os.path.join(kernel_dir, source_params['file'])
+        if 'unpack' in source_params:
+            img =3D os.path.join(kernel_dir, source_params['file'])
+            src =3D os.path.join(cr_workdir, os.path.splitext(source_param=
s['file'])[0])
+            RawCopyPlugin.do_image_uncompression(img, src, cr_workdir)
+        else:
+            src =3D os.path.join(kernel_dir, source_params['file'])
+
         dst =3D os.path.join(cr_workdir, "%s.%s" % (os.path.basename(sourc=
e_params['file']), part.lineno))
=20
         if not os.path.exists(os.path.dirname(dst)):
--=20
2.30.2


