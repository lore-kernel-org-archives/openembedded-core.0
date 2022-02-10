Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DD95C433EF
	for <webhook@archiver.kernel.org>; Thu, 10 Feb 2022 16:18:11 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.88])
 by mx.groups.io with SMTP id smtpd.web12.12556.1644509887047822028
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Feb 2022 08:18:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=Omezwlvg;
 spf=pass (domain: weidmueller.com, ip: 40.107.22.88,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=isZBkVjvAk1Wqqjot4eAPBpMhKHoxFdBc0LvTIKWdZgXNksY0bHmtuhmd72YpOhnnC3/Fqnq98rqpfQchXiL9m7stf3dzYIhbIrSwE3qQ5XH8nhBZzvMZ/9R5rx2B700vVgNEAq0fe/h9GAXSQXTPZiLqJ2mZo+PiMabz0lNc16PekdHmtr1qCK6MZL24XanwGFWaLZJ/QfgJwxdClmA808cYHEfSOiuVX5Le7lcB56lcIw8s9NCJKVI+bEh+s8N9x9HgJ7hmjk9XWEtqCpdnCEhKeb5eQyo55xHS6aenju6hHgy+jnHs8FDfXXo8FSb3f8cUccVvHDldOkcGbyc1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bCiAbv1USim62iSMCO91pdYtwM6d6L7G4uIM5YUoTeM=;
 b=PqFkruWOGdhkhmkqgarjRUc7JhbNrktdNJnwtmXRq0DUvQ7VsqmFjdyDI2eNUXJJlbYSIEciEoMR6ZnFlbD/2pBTfgK3yZtHLTpgVnJSVNczTP9ck8ew+VyBiNV2vccjI3oaBa1HnR2r6Q4dnKe9j1xlcqPlvB7lUUlBN93P0kNdzQ0E5aSLuD11BmF2eSuZu+IvOmkrPmwutMW3wdL1OT6gSFfqa0Ma6PtpqKJ3htjQBGrKYldjZpmtiwI+W+pMAvMQcDDVi0gVh5LhvTO3v5frx0o6Gvme9GwCUI5Auy3ilTDTZE2NIreM2jPCGLQvBuEQRmSlUjgsGHR6nFSnlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bCiAbv1USim62iSMCO91pdYtwM6d6L7G4uIM5YUoTeM=;
 b=OmezwlvgJ2adrrxmnwlRijEoUGx9giHMg6vNp8n7GNHh2s2fXnZCTM6EIjwq78G6acgLqUtC6wyN46xL1CoM4uHrFOM1dgipURGrlROFq3ldNjSZd09VtNvYXtTY/iYKB4rwjubNNm1q2kZdRpuBSFj65ywaa7NAZcoacuJdERc=
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
Subject: [PATCH 2/4] wic: rawcopy: Add support for packed images
Date: Thu, 10 Feb 2022 17:17:36 +0100
Message-ID: 
 <20220210161738.17989-2-stefan.herbrechtsmeier-oss@weidmueller.com>
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
X-MS-Office365-Filtering-Correlation-Id: 9354bc2a-f0e9-4a1c-48c8-08d9ecb0ea47
X-MS-TrafficTypeDiagnostic: VI1PR08MB5501:EE_
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB5501F895AF1D37CB6C74539AD72F9@VI1PR08MB5501.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:473;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	T/sAko3KxUj1wscKgF/VeE0jLvAulRqWOCj7rd037NK/9UqwuCRpmVQOCaZTJs4hiV978p4T/ALZ5mIiM2MdphprLr3y2wfSfF2wNyrjM5Zkm15buvkNx55wvHbsOPBe9oyAl/vLIg0ZFNAvIeu1haZ/+6Bil4BU/V4xXaKQzh/xNGcVKQUMjI3uSQaysGurfQv7XkpVHyUpRCzWLlXCbGqDewHHkkmiDZJpsUG0NfqGnD5E3307kfYqT90G80RMRUYEEx/8UF1/1a97Z+hbl1V9qc+8yyiUevPyGOX3EaRfavH81njYKaKAM7dlXQdq8yHbG5qt8SmtsrsedqbaB4/173qNwfIkZ8N9U68XoeECzoT6IOls3sgG6x9RrDpCvB4S6CKiLWY9xCqr4B1OFapU6yPCOzw6ehiOeMlQsP1Hxmwv+g3VB1v2s8/UfXPJ3juFogREjpks9sZsSwkr91apQZ2/7s8O+9KrQ+rRfFZSrFTcaGURHI6p+e3tAw2pj6k4iO9EI6xLzuHV2vqbMXOMMoyBj6uO6pTO9IwHPn0TgJ+C2ewBnKDt8HlPLtDLGSyr+sT1GhC0zu8Df0QkEAs/HN245CyJBtGqwOCGOwKmAG79su2fPS/V0i/63UhPO044weluLV0SjR3i4uyPJrhFfs1PP6FhjxlrFldU8DMCsjuVpCr07RnO0vgWldhX+5s6tmudrvxy1+p8dJiYWQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(186003)(5660300002)(38100700002)(6666004)(1076003)(316002)(38350700002)(6916009)(2906002)(4326008)(508600001)(8936002)(107886003)(86362001)(66476007)(66556008)(66946007)(36756003)(83380400001)(6512007)(26005)(6486002)(8676002)(52116002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qpIdmEc1HUDpbNPq5kcB21M9u1RfOQ34JSYo/6V4JJkCsArhHhwWLm+2WnHY?=
 =?us-ascii?Q?12EgTBKm18PfbJDJVmD79VEu2qBlv6ItCJbY+WQfA13zSzmEvqLpVEHw1NJ+?=
 =?us-ascii?Q?Mnv/m8lrGdPpVxTqtU/jywDeZRp6t2+1RF3AUF1Q+jtjRbY5u7gUBDm8zuVh?=
 =?us-ascii?Q?IDqe1F/qqX4UhfcStwaIm/Du1IcKIp2qhZOR3tUwF3QMVD9gNCTYwfcDDiKn?=
 =?us-ascii?Q?T2O8nxN+QFnmf/BUEXkfhQgkcLiubO86eZzPcmVL3UJoRc8IuMLzyzBbsXEo?=
 =?us-ascii?Q?mj9cTpLqvwAhFCMbvc1rHeUxWFoGToU3sqVsnNz5lILVJi0zRw4Bvy933aag?=
 =?us-ascii?Q?VQPEQiaFNszj0Vyh7qe6W9mCJ7ma2KCaHoY54iJsfiICJ6isbCPz3A9p/J9M?=
 =?us-ascii?Q?JNdjsYAWOAqtqFf6ycpHxpi8ZymrUMJVpuJ9ZWjMziU0qmbPuQbJq18zN1uG?=
 =?us-ascii?Q?DXf4DnUjLAMSlDoGmJTitGJQ9QPtV6zZiFMTphI7d5Qd7lVeagdZ/GQyMSIg?=
 =?us-ascii?Q?XK1sMaiZYj7zwVZ10acMjE8MfSpDY9IV+Eow0dRdIwj9VMi/qglgIghnzlsW?=
 =?us-ascii?Q?dWYDZgB3yKohLi5+j2jjJzpL2rZJiAwiVtiQ85AOAsFCf51I9Nem4jLK9Dmb?=
 =?us-ascii?Q?2ctl+LkRwhfnjIRMXeDmlk6TB4kA/u/2ojZMBFRTRfiQWxQ7HSzYEnlTegMC?=
 =?us-ascii?Q?L8hj7elyOdI9FgvlfCTmA2M79YtA1R9A4WpNUM/BbDxqy3AHenNG6JUh7GIG?=
 =?us-ascii?Q?l0gGIQvbwrcmDD4jAsO40hiQs5sa/luAXr7JZyqhkYTAvGBjXipTnll0UvT2?=
 =?us-ascii?Q?1F9FR0XEW1nTUMbhrzxjwhWzweZxKL4z7Mg/LdlPsg9CEdqdOkem0jxaqtqM?=
 =?us-ascii?Q?116IddgCWE8fD7emASjq/KH5xp2ZSbPYO9xa6tP4g7OGnnE88PD5OHBPhDeO?=
 =?us-ascii?Q?/pn3IX5SvRPwwjNFFod9D323H7yxBVQY1pCHwYewtQmxK6Yue1tUzedvvrKF?=
 =?us-ascii?Q?EdKbbMsObUuUU00Kjsq1qtaaho7arvC80XtE+Uc8WpsvXtZHv47S+7/NcrgN?=
 =?us-ascii?Q?cjbD06kYd4TGBoH7c0Qk2O1C8AQN0mPzAQ+2llf7VoIyvnHBCLp0NgOMevce?=
 =?us-ascii?Q?LvDUPmmIZesSWp3wiKaekgSnQWfWGnOswD1dGdQvESjSLkVQC1jnf9OwrZwU?=
 =?us-ascii?Q?cT/1F6pKuLIT9kSYpRUV6HW0JcrGcI96e4e+MW0ti0j8EmIB/lfQo7Ni+oXF?=
 =?us-ascii?Q?E3aVSCthGTEMF5BOsU1jHyoXSYHkTibCj5WmDFu8CEuyqma0q0IGepBIuzO7?=
 =?us-ascii?Q?vYBISOyP7XUWx12gxPA824Y/3sGq7CM5RNlcHTTVMzmCL+vTNQgNY5SJsKmC?=
 =?us-ascii?Q?g5+028mF863VZoDu5VUn4DZC29clmuRI1MBrWbNs8zrm/drDQh7W5d7Jqwq0?=
 =?us-ascii?Q?srmnmrA/n58WMkLRwbCPKtHCqaYIu7dXnuAys3jYT4MMJXy7unh6pQJ6Uvci?=
 =?us-ascii?Q?KWww2DBeE39ChikkR5ZEUBCm/TY1HvQJUemLl1T+E+ZUD2pe+F4qizM6z/Kp?=
 =?us-ascii?Q?NVX09HKNnChTLzqSNzNEQWr7EcXoz/UjJxA8FLMHCnAiPpCPrvKsYF7898vh?=
 =?us-ascii?Q?fOfNO3wrA7fhoK3x1DfwdQ0=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9354bc2a-f0e9-4a1c-48c8-08d9ecb0ea47
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 16:18:04.0479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 d2fL7ORZL56fuTSs6iCCDJfrEhgv/+s4jc8cj6p4GyIVqgEeg41B3PtRHoTZeM/GKjwLxHxYCPiC8eEv/SG41A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5501
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Feb 2022 16:18:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161618

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

 scripts/lib/wic/plugins/source/rawcopy.py | 28 ++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/source/rawcopy.py b/scripts/lib/wic/pl=
ugins/source/rawcopy.py
index fa7b1eb8ac..7816e00e49 100644
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
@@ -38,6 +40,24 @@ class RawCopyPlugin(SourcePlugin):
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
+        decompressor =3D {
+            ".bz2": "bzip2",
+            ".gz": "gzip",
+            ".xz": "xz"
+        }.get(os.path.splitext(src)[1])
+        if not decompressor:
+            raise WicError("Compression not support")
+        cmd =3D "%s -dc %s > %s" % (decompressor, src, dst)
+        subprocess.call(cmd, preexec_fn=3Dsubprocess_setup, shell=3DTrue, =
cwd=3Dworkdir)
+
     @classmethod
     def do_prepare_partition(cls, part, source_params, cr, cr_workdir,
                              oe_builddir, bootimg_dir, kernel_dir,
@@ -56,7 +76,13 @@ class RawCopyPlugin(SourcePlugin):
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


