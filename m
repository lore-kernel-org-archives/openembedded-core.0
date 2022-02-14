Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 628FBC433EF
	for <webhook@archiver.kernel.org>; Mon, 14 Feb 2022 15:46:03 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.51])
 by mx.groups.io with SMTP id smtpd.web11.35436.1644853554743174786
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Feb 2022 07:46:02 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=VhqRyxt9;
 spf=pass (domain: weidmueller.com, ip: 40.107.6.51,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O+dsDasFB5GOqLZzLIr/aLzasDXtV+fhNGFIurpn68XLKMlqhJV5RRLhEZ8ge7dNSLK2USWm+VknDtrZfAavrXrwe8V+LTjbp5uBdPixWIrlxr0LKSh6onuDCbxBFd/Cv4C+TvwPPy1mnEmahWO5L6ZgkouxQqhygJystzzRFY/a09yjOfxba/RchQRyUOrbMkeL4TgJusf88qMHeTg5++p3oO/GBj+jvfFfTTtP4oS8ys7VAhfhSEa0Y4x1E6x5pRM86PBN0dxuk5IwitosX9HhAnWbkiGNjw5It6xVJyqxhPGYwUlMsu0SYxjWaQFXhBVe3DfenUBx/NbJUReb5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SHIhz2qENzrE7FgaYoR4mK5qljFzgvVoNg7W+awwraA=;
 b=MuYLslz/IyRZf8JQwtC3h/lP3/LHh9HNoUXxIRZmgb2LCe84vplWWaVXlRZiD59o+Z8wsNmJN/QM0qCwV7MMuvdfP+WMQQw9UJq+LCcQKOuanta7g0cNjN+ZA93W9I0C+azgoTd5GxGFBLP8J46E5toiPxwwks/sDlp+8jobCmx+ad8sn75JdtVqr0V8ygX2H2ncbdRvyVqApOjcmdH9f8Br3SFDk+t179f+IVP6N0kGuyjadYypjzWAnN23nToO5STMadd6D1XrMZjp0HiUYq0SfMS4fUDlQjrTsZh891xCY80NxJ7AcMW6iDeTs6rPSVITojvbA+bzp7oz17/kcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SHIhz2qENzrE7FgaYoR4mK5qljFzgvVoNg7W+awwraA=;
 b=VhqRyxt9YvOfH2Ne6i9zrlj1biLw5U52UjdA9GXOditJy//0ddpR0v6mgBFjSk53Lh+WJ094EBfADw9cim91ZC5mpxIGHECPUvNvtwYuyh8lzRtxisB9f0vSmRtERaeHvXAg6eHvEPM9Ohn6WqaBeV2c1p6AoLiedY9cnKDyfXQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by DB8PR08MB3929.eurprd08.prod.outlook.com (2603:10a6:10:ae::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.17; Mon, 14 Feb
 2022 15:45:46 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2%4]) with mapi id 15.20.4975.018; Mon, 14 Feb 2022
 15:45:46 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH v2 2/5] wic: rawcopy: Add support for packed images
Date: Mon, 14 Feb 2022 16:45:18 +0100
Message-ID: 
 <20220214154521.26905-2-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: 
 <20220214154521.26905-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: 
 <20220214154521.26905-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0257.eurprd06.prod.outlook.com
 (2603:10a6:20b:45f::11) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 110699c7-5016-49c1-7118-08d9efd11084
X-MS-TrafficTypeDiagnostic: DB8PR08MB3929:EE_
X-Microsoft-Antispam-PRVS: 
	<DB8PR08MB39293F74234F4CACCEDB2BD1D7339@DB8PR08MB3929.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:473;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hz4RPbUPt6BEpvt8ncTusckMdWs20fguNRARi+W/IBiy84Q8BZTKoK066Lz0KOPqofm7XOQfftcWXY/dlP7kNsQYN/QzEZ9fny3eKzAahevKKkuTzGA8O49NWXDJzKbxDgSpEAdH22acjYafRoLC80I7jApvEQIKLhWey6iRM8duIlT630kXMTovN3srqWTC2CM2Dl2+kIZgRz6HQ0OTJcxRG1ioSdQoB3CR6LGrQeNkBWhOMAYWSw4jU2b0Rtbistife1Un3YDluqXA3FU7Ofi3P1qYGPy7+vMffnBkW8eMU0EF7xyHvRSRhGSBO78e1icJdzSpSf86ohFgcFPh3m/quD034qyx2xdp/HoRaYmdLIJadF/me30wsb6Rnbe2+q8sV3qY1vHc22mgnI6UyCATRW9oXVXmv3brTmCrORl0sR8dJ3OmxG14cNqixg3neKbEjIhWGrtRvTOqmejBpwEOwdp8R36Pxgt3eEhWau7E99uecta26ko8Z79JlRXJ+YDvJ4UeC/IHTUXEf24vEpR8W3uQMhkpjHFRRYqwi4YMBqlAYleKE4harHfRrzI3NmBxFRQgIAGtJHvbSp7+sbDTQh8cixZe9bVP7rTH+x5DNxJRvmC2Av8bqTi+CxAZ7o/44o2MgKP//tfrm+QnmCqnjL6XPABWnF9/IjkySXl8S0gzgH/ptL73cBY1w+AbT35VupNtnl2tb2+1mBHpCA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38350700002)(36756003)(66946007)(316002)(38100700002)(2616005)(66556008)(66476007)(4326008)(6916009)(6486002)(107886003)(1076003)(186003)(26005)(6666004)(6512007)(2906002)(86362001)(508600001)(83380400001)(52116002)(5660300002)(8936002)(6506007)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1yt+R0kDSrczA2mmrdeQfMKJpoGcYH/y7H2imNK96LarOns08hi8qXUzdTaG?=
 =?us-ascii?Q?e/PMl63PCZXrX8f4+Iu5TAZ82pmLDeQzGydraI7OPHoSt+ZanZqcqscPCx3f?=
 =?us-ascii?Q?DLa9oQr9sboHHQJsw+f2NfMqVFnOZBy19LW7XuV3a3G2BWv2MNjymsM/+JyQ?=
 =?us-ascii?Q?boa6S79l+ydsPz9aWico3evRReVOt1nxMPu7RruHnDg7DcVX5nfKyDI4fFI4?=
 =?us-ascii?Q?vAJv7mr7lJKXYpw3Z7D/v6w/MFdn6166FJpZdQ8KvL7cBmjC2E05pCayZtBE?=
 =?us-ascii?Q?dMtKQBFq1q5GGR0cbJBFxT53CREf4gYET/COV9UsZk8Aw8ok77CGL4uX2fvu?=
 =?us-ascii?Q?3G1DgnPvhA4Xh1MIpFtR9ETGCw7QIrfxH2fgOV9jikz18fdAH58VxmzVd8C4?=
 =?us-ascii?Q?1i0jUwnCCx+W5fd5ScW4AsCzfvCnJP092Yugmya4RQteBmIHOv3X5q11pa8Z?=
 =?us-ascii?Q?9HAW+zADUOMBgtOdOFWbYL1vHXuoslWq25fWGsy3+QlQULDLciOKQHXcUlAi?=
 =?us-ascii?Q?cQed5SoCfykOm/YGsrmpiqG+CBjyIhDZjiXrIREQn5EaFz557XY/4RYTtzy2?=
 =?us-ascii?Q?aqQ9asxTQZJzjqyCSUNyzH+A11fcER2bmd/LSIindN2OTDjJ2RJQ+G41fy3Z?=
 =?us-ascii?Q?IJIYGehKFmmO67eQN3XAj+6ZhueqV3mmTV8SNc/jkYOpmTAAFiK3OkTw+Ioj?=
 =?us-ascii?Q?woq0ztQ79q6+SEvPYFn5d0TJ97badXTT13XC6qvpss5hycgtOUWls+/wJZs/?=
 =?us-ascii?Q?G9GiJgtkMEDlk+Tr3b6boiZbOp3dkbbi6a8BWXtkiwsyTXApmMO+aOc368wJ?=
 =?us-ascii?Q?rekxLixPTYQD1oOl5tvHP+cr8CuUst6G9ocZndWWfSiy+F8J1ZRiiQwZi7xZ?=
 =?us-ascii?Q?F8XIw6wtKIE+4n3x0uwd6MAOetJDtFRKfY+MHl7N5VQqDavJRDSjbGE2C8xs?=
 =?us-ascii?Q?BcdhnpSL+g9P3H6mD1+WVhXReRUEZbsfOrhitjdGIDYECWJLYZmuJzG1awBg?=
 =?us-ascii?Q?WoDHygbc/GyoEGCdNhDt/B/8S7bAquGDWPvSIUYdFYzHvHwkBqnUb50qHS9E?=
 =?us-ascii?Q?uNOl9dykmeOptuhJrSkxzVciRxdjCK5dXb7PSHyo6SVGq/hZd5MgVRyXU2/w?=
 =?us-ascii?Q?nRdgBZTlG7X4v+/+D6ZEMgqoQVQJoeo3De2KePJPcG953vSaanOZzcvqoIWS?=
 =?us-ascii?Q?LjkwQDvREwAZehAnPz2Q8Q1hRB1c9SgZyvoaGmsuW+lfjWKCdQOnFkHljTt5?=
 =?us-ascii?Q?D6wB7XzIiT7oXPsIkKgRHePGf7lN6Of5KZlB5JteDzVAeKNG9D+C9ntIcpkZ?=
 =?us-ascii?Q?PT+BqZ0zgyyzeildIqrxt6s7RKZ22zKi4eXRXZNn1iPIUARr63rwx8CnTGPC?=
 =?us-ascii?Q?Z76E9ZMhG8BRkPKKMq6N2lP/RS4gCUz80xpHjwHFxlVEzzw/R9zwIYPwaeWz?=
 =?us-ascii?Q?qBxhpn0hvdSDeXk3x+rLJ/1uGLdvtvJFod4qJAWws9eCkesS0ZyMG4lbDnw4?=
 =?us-ascii?Q?t/6rEmREop+LEAVw24bfscDQWcHqsugyka4sSwpwbfOr+BSYxPFkoaS/YiUU?=
 =?us-ascii?Q?LOypaK0ym9WiYuvYUMXrKFZIOb/nWBywHaemmmCuqrgOgreC9GwmMHFm5Pvl?=
 =?us-ascii?Q?YRfKrJfSnsd7SYnpcpmSCbE=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 110699c7-5016-49c1-7118-08d9efd11084
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 15:45:45.5204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 jjuQVGcV/1TiyyiT/Kj47ZSd/nGzdorUDMGu8stmkOz9zmr7uOsNpk7dFcfe/fC2kWL7IX4HJkkTbnf5OYPcrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB3929
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Feb 2022 15:46:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161719

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


