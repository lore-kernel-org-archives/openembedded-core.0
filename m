Return-Path: <pedro.silva.ferreira@criticaltechworks.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49E9FCDD54C
	for <webhook@archiver.kernel.org>; Wed, 18 Sep 2024 16:57:59 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.71])
 by mx.groups.io with SMTP id smtpd.web11.20626.1726678669093856824
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Sep 2024 09:57:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticaltechworks.com header.s=selector1 header.b=DLmUsxo7;
 spf=pass (domain: criticaltechworks.com, ip: 40.107.20.71, mailfrom: pedro.silva.ferreira@criticaltechworks.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BVG9skF0kp2sufkUMhooGNIYUUZySAnzP1lXizGKZN3NoRJWdEXuf70JDi1ieIJuQMrRksEXgn+7iOkAR9SpXu7I/rlthIj3482GVNdgmMe4usgCSvtLiXooFNSwdmafMJTVPlKYoNbBMMmjRTSNudYNek9xJr4nK0tzRq6w4nXctGJpXrsmRjEpVdPAbKGPBTz9ksa+dUcxoqAK56lYsePeRjtnUmJ3CDUJBO26y66tc7rAQ3z4OQo4Jlq9lYV3BiFQUuj9iBG3tSmUyD7yoeFnewgRTWA/pCpMfH/Yy4dc2pbNVcPH7iCghPQ5rXLluCcDa93vqJOZj+HoBkrUDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Frgdx81Hi2PIMQcBxCXpJETDucKCTu6qFB9haTRnO0=;
 b=J559Guy19v/AHmSBcPUTauVMLSJIERzYdISTGdnZPj4jUbx57FJ9Nh/ES9pbC6TnF1Txw4zz4+WC8Gn23H5l7ptGYpeyLuI/zL6Sp5l8IiXE3wISwmm0hWEKnNyvDtDYXUeUmi5w09zeIorZBC24IT90IG1YpnlYSxyvenmiFdxhnaAGRmenxh8BSv6Td8JiP1DwrsJsuECvK6ezBbrsUZ5Hi/ge+Jguu173N4Eqs8hGSnzQQ93r6J+7WEA4MnOF22jTHXhobKcJbVyC4eozDfxVB5pChCLgVl6xdYvcbs8VsJ19yiqSmqoQNOd5Xnss5a4JoJjJ+AVG1FTAsmY0pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=criticaltechworks.com; dmarc=pass action=none
 header.from=criticaltechworks.com; dkim=pass header.d=criticaltechworks.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=criticaltechworks.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Frgdx81Hi2PIMQcBxCXpJETDucKCTu6qFB9haTRnO0=;
 b=DLmUsxo7IawScGxgqmj32xcJxWO9KA+hLMw7cTTSvUdHvrFuGJtbNz2oQn/tQ2B0RrwcbqRdiAQSxcEpKWbdOPhiHYk7U/p0NfEqPD30w0ZRt5fjMAdxYQIM/nWX7vFlDr5a9Fa4jmGqQUGnoU7tFUXGMuNaBDjFN5WlzO+L++uhr/6z8Qut8mxNyAQQ+vRZRGHUZFRfpRmWtyktWvMQBARRSFSHY34T29LMXljTDCzjyi2GYejZw/xc+KIH9bi88UTftfmsLDikdZ8KaBKDxCkr+KnIIAy9rZlxT+WyJu64ZwHy6jtjEEKBQEVeMDzyazOAezDwppl0CmWwK0uH3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=criticaltechworks.com;
Received: from AM8P193MB0900.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:1ed::9)
 by AS8P193MB2030.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:40d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Wed, 18 Sep
 2024 16:57:45 +0000
Received: from AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
 ([fe80::c359:f497:ed59:65a1]) by AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
 ([fe80::c359:f497:ed59:65a1%5]) with mapi id 15.20.7962.022; Wed, 18 Sep 2024
 16:57:45 +0000
From: Pedro Ferreira <pedro.silva.ferreira@criticaltechworks.com>
To: openembedded-core@lists.openembedded.org
Cc: Pedro Ferreira <Pedro.Silva.Ferreira@criticaltechworks.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH v2 2/3] buildhistory: Restoring files from preserve list
Date: Mon, 16 Sep 2024 08:13:02 +0100
Message-Id: <20240916071303.2831698-2-pedro.silva.ferreira@criticaltechworks.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240916071303.2831698-1-pedro.silva.ferreira@criticaltechworks.com>
References: <20240916071303.2831698-1-pedro.silva.ferreira@criticaltechworks.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0266.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:375::6) To AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:1ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8P193MB0900:EE_|AS8P193MB2030:EE_
X-MS-Office365-Filtering-Correlation-Id: ef85ca5d-dacd-4535-b81a-08dcd803048e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?VTWBq1Dgdpzf1wTOlYuPGoEXY5GibYgllg7K0eIU/J2cK10o1zEhIXWeRZCZ?=
 =?us-ascii?Q?U1v4BbT5P0t+j27VsOQtGrUGeO6S2jRX9nUGq/MXH+2G4R7UeCBccKaA/g7c?=
 =?us-ascii?Q?GONVwJPc66pSAngWvU8fA+GP3TMfWS4NTs04gtVHNwfGz0obRzR4SF1QuXSn?=
 =?us-ascii?Q?mpe9v8lnRFoC5dmQlpw6zIJaSoDV7VtATnLn37t/mgE6YppUV8oOcNyNz5Av?=
 =?us-ascii?Q?UGfOgZrSz0pZ7UB5eiuEVanfZMucQkoeIMBIv++Mzk5GTKvC54lgffBmfxxE?=
 =?us-ascii?Q?n2Nr/Es0LhXZ18t1Rdv7aB3RHe6UtggQZ62SCKUSvoP47PxUoXLJq4M10V/C?=
 =?us-ascii?Q?V/DZsuCADRtggPogemzbRAcRfphBkNYCkGJryjbxiP2Hsm93SElEoD0vgf7X?=
 =?us-ascii?Q?k+O4ukqHGdL0VQQRrDUPgzkVoRo4OFKFt0dYpusGkXVt+pK4pU3xEoyV9Lcq?=
 =?us-ascii?Q?/T4GvEqZWdQ2f1D6utVEi2xV7QqzphfQt/cOKa8cLzrEwHhbD8Fyv2r/YU3p?=
 =?us-ascii?Q?DsG4Gt72qlWSZIVnEnZXuHKeWQ1mAgqeMCbKu/ytfztAXS5i/A79sTJbOGxn?=
 =?us-ascii?Q?YWsUIKH1zd+dPxCH0ikSTAKsweHZdf9hzSo2FebWQMIaoEZnzixaLcGTG+m2?=
 =?us-ascii?Q?zGfL+nHmkJhUU/FZ8hvD1xKuQ96FzVa1KjUMm18KnlmdWHyGpVl52DyRq8Cx?=
 =?us-ascii?Q?rGavSCW+7e1J0G99UYAjsc4YxAplFmi2R1cOOduPCwskuZ3sTUsLFN/XcI4t?=
 =?us-ascii?Q?4jOd69Vw+DJFMInA72DtW6Alit3pCLLgmKnjqqFDejUTi8pg/JWuvUtD2ZdF?=
 =?us-ascii?Q?mbEzzJQzyAljvL73uwaNCdWFBWbyDxdKnpFBH1ZNwFya0kqj54qfEsXNhbqw?=
 =?us-ascii?Q?S8BrIvLundo53lPLMSJTqXxbs/Ehn3j5IZBa+WFHrk3VctS4oYhnm4jtZd8p?=
 =?us-ascii?Q?Jli8NBH67IrdWqOop9Zsu2Y5HR2rnXIfjkDh+VwGqayO1MZd2R7xYY5YPW15?=
 =?us-ascii?Q?TU8HYlSNPTmDtHxGRdb84ew5FaxXY5qnY3TJTl4u3oncolWyW9sX4W++EIir?=
 =?us-ascii?Q?A7WrMyg/NOmo72r99Pr6wLg2vRJwYfbwYvtCJmf7CguSiC0sq0AO6BuS9Sp4?=
 =?us-ascii?Q?DPSjW+eL3rfWK2o58lAJkYluvOIRHABWPLpU6CrtmD5fdaKoN/8Jpfn8VKDe?=
 =?us-ascii?Q?u05kIVpYGHi6AKcXon7z5z122U/W2oG2MEIdx3IVxHgC+KcNLNDWxlwsZOkc?=
 =?us-ascii?Q?0QvQEQeOq1Za3wOCsh+vSgyMijEIKL28XukyFYNoXPV0TF0c40lpGKPDdlGH?=
 =?us-ascii?Q?GVR34E5Moc0DY0KitoPfvWaZ9MeBotoCQFA+raoXJXrqUQGlYCVRiPTHZDTq?=
 =?us-ascii?Q?EBa05AGXrhflxF7OWyn8uHZvkptPiX4IEyjlENHD3E4uHrKNHA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8P193MB0900.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2K9YLJH5Vqo+v7nTBqdvWqOmwgkIYhbZ28K3IUXshxb9GrsGPydEZO9YM4a0?=
 =?us-ascii?Q?s3QC+A7S+CNGz91fFxRbSWfYirVTSzBJL9oVOOYizfjC/4KTLyDxjckBMBb9?=
 =?us-ascii?Q?lmCkbs5Oankc0B+VebZFGTCydaU8ZYzK1LncfNPyRXp1dlN8DOjuWXZld3w7?=
 =?us-ascii?Q?fRdte7toj1U25NFiOKeIjHZl0vRY39R5kXadgnntkRVhQXEWolOauxlY2RyA?=
 =?us-ascii?Q?2ROLGg+v1Zxv+t/0YOLVLAwo4z+uiVlQfoe23F5ubWUUB1N7hwwo/W0UVLI5?=
 =?us-ascii?Q?ZP4BYOG0nWSPb3dTwZY+fz+DN47gJnhPVZnysKOf817QRSQzjx4uBeSxuTBV?=
 =?us-ascii?Q?Olei/E0LHQBKYU2Msb3P043fEDcH5Y6op68WAJIByvMcQLKsxiVKhiuiNAaX?=
 =?us-ascii?Q?kinh1VRuxHlcYGFQzy8/eTfhJW0qkVr0DqLGwlLmQR+TdhfKhMdbdSVfFgmA?=
 =?us-ascii?Q?UBc+z1PODdndsqDhfbPhNPskdQJwpgo99EG+rEPuKzR5EDbLywP7KS7y+QWp?=
 =?us-ascii?Q?sqhgyCCdW1YKV81A62GJLaLLHR7YgLwiszpT8EIaji0x4sbP8LVRZ0igvWc1?=
 =?us-ascii?Q?XzBIFYyX0y9Z4k/P4zEGH8tzlrFpHszohp+KftLjryBLRuWyHH7yZTEIHPSG?=
 =?us-ascii?Q?QFzo1p1XfRutH0Ptl4DE3aTxaSM5D9WzgDTzK2T/com30Kwg7YS53vnT8aI/?=
 =?us-ascii?Q?pZZwoX8V0gu6xhYW7Dn3ee5rDWzmrx+ktWqsJvAY5Pz1NWcVRtNokzgTw8pl?=
 =?us-ascii?Q?fsv0jKNLUJAb7wTZE7Ywl/Y/tvt0kkwDtPoodsYWj5rpknLKjAeMI3yXUvju?=
 =?us-ascii?Q?8ii2gw4r/AXpDBy7RgcmIq5uOHZoBCQoyI3OfyKD4CyHcGh+fUk6a7dpUfs0?=
 =?us-ascii?Q?qp/L48tH+5ZEZtzLv46DOvVvpA6R+xSmyuCLopTc6fvkFiJym29GWcQ6HlrC?=
 =?us-ascii?Q?znk/q4GMwDmUIqNu4Pg2fbrj0Et3KoReOd7pgkBlbAKB9Zwh4diI0UOtsYZX?=
 =?us-ascii?Q?26/DBnYk5YnJuuRVx6dcL02BNsssM2A4w6Dzgh2NIaCFSk3PtXU8tKKajJwh?=
 =?us-ascii?Q?mOvzMhCF1pNwPuWC93oNvhLXuPgYopOifxuCgs03BPslWSbOMArPqex5lZNt?=
 =?us-ascii?Q?QJXTEpR21g6e/3FWf2YDr+aZZKAi28QhC+5K6sZxiaZ+fXWCnUwQjXSQKhl3?=
 =?us-ascii?Q?kTWp+twc9XI0EzH82BIJxvKs9mdbGbOUXIszM22cz709HbzBBLmCXuEyt0WJ?=
 =?us-ascii?Q?5BoifqeCx2Q4ib0vtK21Up/bnOSg48cRyTUhA9PMINwnR0IS6V30xEX8qA8c?=
 =?us-ascii?Q?D1fUH4LX4fzrip1vfRRjC7lfUCMkTVu8FDWFbjDQvM6glOKKZ6A2gjOlrRUc?=
 =?us-ascii?Q?EdCucXRagikFBqLjYfj92yOUuLSbec9PQ/h1NHf5bjwb7o+Tx4mYwzXdb532?=
 =?us-ascii?Q?R8mudcgHmjmP0wlopcGV/JlyAYy82PmSICuw5+s/A5/2u4lknylj+yZxu8dw?=
 =?us-ascii?Q?iGRQG+b25NL2E1bXY4BUMRA705icqTBdsgAQ4qo+TFnNDQsU1ZNMga7tXsNt?=
 =?us-ascii?Q?8okXTQTEseJLeVUgEgOpdlxx8wmKvtaf6cwSnpZfXy1pwPAiK9YX8hS42HeT?=
 =?us-ascii?Q?4wrj3d/5kp8tcr4mw58xDFM=3D?=
X-OriginatorOrg: criticaltechworks.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef85ca5d-dacd-4535-b81a-08dcd803048e
X-MS-Exchange-CrossTenant-AuthSource: AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 16:57:45.5055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 61f30b8e-4f6b-44fe-9bc2-041e3a9f7346
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8GwxXi3Yo0qGfdQJ9qVJgq3GHZv9J7+7FjmhGsPxVBXtM4NhZ8QgB62PLBqd/XVWFBsOU/ICV7udIab5gyB3FNqATwi8U3J5aTPUlGLdzes=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P193MB2030
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Sep 2024 16:57:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204648

This fix will ensure that, when we activate feature
`BUILDHISTORY_RESET`, files marked to keep on feature
`BUILDHISTORY_PRESERVE` will indeed exist is buildhistory
final path since they are moved to buildhistory/old but
not restored at any point.

Signed-off-by: Pedro Ferreira <Pedro.Silva.Ferreira@criticaltechworks.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9f68a45aa238ae5fcdfaca71ba0e7015e9cb720e)
---
 meta/classes/buildhistory.bbclass | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.=
bbclass
index b35508db27..8adb44eba5 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -108,6 +108,7 @@ python buildhistory_emit_pkghistory() {
     import json
     import shlex
     import errno
+    import shutil

     pkghistdir =3D d.getVar('BUILDHISTORY_DIR_PACKAGE')
     oldpkghistdir =3D d.getVar('BUILDHISTORY_OLD_DIR_PACKAGE')
@@ -221,6 +222,20 @@ python buildhistory_emit_pkghistory() {
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
@@ -248,6 +263,14 @@ python buildhistory_emit_pkghistory() {
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

