Return-Path: <pedro.silva.ferreira@criticaltechworks.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F959CD342C
	for <webhook@archiver.kernel.org>; Mon,  2 Sep 2024 10:23:18 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.49])
 by mx.groups.io with SMTP id smtpd.web11.35585.1725272591078618791
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Sep 2024 03:23:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticaltechworks.com header.s=selector1 header.b=AMwW5Kf9;
 spf=pass (domain: criticaltechworks.com, ip: 40.107.249.49, mailfrom: pedro.silva.ferreira@criticaltechworks.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qQdRn+1HjC033mpMm/zoeyaz8pAyyFQIevu8gbM2zs7OTj0fIQsR20y8EP+4wOdjfRukgCSX32bLW+HeixmsTkKIbTXz4KqnpklvEKXRxsP1QN4brdQEN8PorrsMMoVIzrzkbXtV3y4P2FNun8uzJZ1R9Gq75uSP073F227iDqMRt96pA7TxGT4hkM/ap5lINfzJxA+tVCUEYZLxAOLt/L/BjKRRm9HnnHxJ9rQ+Uhvd6GNTNAcxi1VwQkLYF94m3dypJcuxevejMWWK0jWjU4oQWD5lqopH+1ofRNmCeE2iUTGYDyg995SzhGI90pQJIpTMINOc+H9BM4DT58pTiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Frgdx81Hi2PIMQcBxCXpJETDucKCTu6qFB9haTRnO0=;
 b=rtipRPQ9eGKlczFt+PlHmlqmOs3OffsTuA86oAjvy7m3Xv15Keq0zHDilEp2UMmroOQw+LCw3y4dADKOtCMwnua5fIj3JZiyCawLb5gnXyF1iXBlM3kpis7S2r3tiJAZD2C/xXDyHZvPwLx1iyde3E7qKmEvze2Apq71gDHxUck8VIICZ+NDLvVuyTalpGSder/XD8dCM41qPK6Slit+ICbHPgxTdn0RnaTzNAPdR+dElyf3IyoYceucXU5I4ZmMCOaJ7sdnR0WfOqEyqn5E8plhv7IBH4TLE65I3pjVyCT5Vh43KmMFohRz92DRZ8heYPJtnR1UicdT+aPnbARlKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=criticaltechworks.com; dmarc=pass action=none
 header.from=criticaltechworks.com; dkim=pass header.d=criticaltechworks.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=criticaltechworks.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Frgdx81Hi2PIMQcBxCXpJETDucKCTu6qFB9haTRnO0=;
 b=AMwW5Kf9OuLX5gmUYmsNnXWO10ZWXh0gMrMk3z8ep41SIQ8wAG1zG6i1xVNr8GA5VvR75mZVmekaEGyawGImi1v2nDXE6alXabnrXP322o+IyB/9HH6gPk4Yxv7v711T7EHMlFxu0Vl5w1jMBAWJ7h+lcz4x4KQrfmknQ3YCY/pGPzw9djwPm1Nt3+2+m10auiC+GqCgYo6fyEe0iG5MVGnUoSSMOkKm/8UEWpwXf+SJRmxHwsyM3sYq9OY20rjbw7gP0kWvmj/QTCsUEqt9WpEfi3gFbiAKP8GXRTMbNT/Al3Fa6E0aWK/GGzqyeAqxunm85fYurThFT7ZuSlSqrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=criticaltechworks.com;
Received: from AM8P193MB0900.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:1ed::9)
 by AM9P193MB1427.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:304::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Mon, 2 Sep
 2024 10:23:08 +0000
Received: from AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
 ([fe80::c359:f497:ed59:65a1]) by AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
 ([fe80::c359:f497:ed59:65a1%4]) with mapi id 15.20.7918.024; Mon, 2 Sep 2024
 10:23:08 +0000
From: Pedro Ferreira <pedro.silva.ferreira@criticaltechworks.com>
To: openembedded-core@lists.openembedded.org
Cc: Pedro Ferreira <pedro.silva.ferreira@criticaltechworks.com>,
	Pedro Ferreira <Pedro.Silva.Ferreira@criticaltechworks.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH 2/4] buildhistory: Restoring files from preserve list
Date: Mon,  2 Sep 2024 11:22:38 +0100
Message-Id: <20240902102240.3760442-2-pedro.silva.ferreira@criticaltechworks.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240902102240.3760442-1-pedro.silva.ferreira@criticaltechworks.com>
References: <20240902102240.3760442-1-pedro.silva.ferreira@criticaltechworks.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PAZP264CA0122.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1ef::18) To AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:1ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8P193MB0900:EE_|AM9P193MB1427:EE_
X-MS-Office365-Filtering-Correlation-Id: cbdea41c-a68b-497f-25c6-08dccb393d51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?BDqauGzTo1e/YBkB6gwNsfUkrHiKvK/3ls2xaaGULNZCy6obmQPi7oXCrhgG?=
 =?us-ascii?Q?sI/2c4BTg967qif3fHhtlyKD9xs+4jhagPPnpy3Xw/puUCYa4xeGTIKDODlw?=
 =?us-ascii?Q?oh7fvLkdW5mpRRSISvF2ecjkM631xl/978d0+osG1N0aSbbsbhuLHVYvxq65?=
 =?us-ascii?Q?g2bNm3NnNbuL368SRc9qwk5XP8ofwaFYdTlfCR0v0Le4z2Yolw/BrCmYEEhN?=
 =?us-ascii?Q?ViyFPH/9MxAXR/4Ee78RCUihTNK74EG2qr71gIU3vQg2HnTbMRoZdYwa0QPJ?=
 =?us-ascii?Q?bGPDIH+f/WxydR+4piFKaeoIliVfc8C+J5jlCuMvPJqgiufaRDF1h3TSeHfx?=
 =?us-ascii?Q?ErKl58pMtFmKgLHQNfedaDptFrvE3/4kvCWeglIPNkZ45Ur7iJZkQnPV1LY3?=
 =?us-ascii?Q?TPibrWe7PvLvGL+pqp2oKHq75TU6qBSLTWIL5PQdLHUZAq4idz6xzYpQ7L1Z?=
 =?us-ascii?Q?NtFJeDIs1IKrNh1vuxUHQts9lYUwkyq2R74rnW7JGrlu9fnj2cYvru72DeKT?=
 =?us-ascii?Q?rMOX8Wqjh8TtgJEvHxL/ZR6duga7ptl9NarVWVvntP2GYxJyMJeG1rxnFSx2?=
 =?us-ascii?Q?l9BkVcgRMCmAlGkDdRRJic5187mW30jh41Fj4hhEIvGiakKgRlw/nJWURI7b?=
 =?us-ascii?Q?rLON2bWm+RhCVjCnFkveDd8P1Xz6IZcE6BmQs6xTg77FGOBYx+vI1Rf27FVh?=
 =?us-ascii?Q?+lCtGAIL1YJ5fjJms+QwESJxB6RpeKe68K8nuThsCoWdVtGJ2UygX4gsaiYI?=
 =?us-ascii?Q?dFpQX7j+m3nQe+SQvVwWyalUrQh440WtLELiefW75b7vFFlfMQ4xQIrMY9nd?=
 =?us-ascii?Q?f0wES2XxG0PTg5RDo+qjQ/HLSbsHfXDo7AwyBDG5fxaWXfpeXiHjkcQLo6rf?=
 =?us-ascii?Q?jSrNhGrEkxtV8h3ufhZVVZcgebkL5ePR7HG/2zipEKCn0Q3iDPUSu7SbJbJq?=
 =?us-ascii?Q?2HHhKUtieRUvRDpzWXS2x57CqXNnVjYko22YDMlvT9ZKEO84VGVBr2tqCCjs?=
 =?us-ascii?Q?K7RdL2/h8cfXyAStVA3D6e3cKIsQj46IRqnCSWAZRftfq4Ggz+xx5TU+bsNx?=
 =?us-ascii?Q?QrDdC7VHJ5Mop3EBqgbxPDYrVftOB4FLpW7odaXZWJpwHdr8hfDdulv8amyx?=
 =?us-ascii?Q?3/pIUKSS46zEYeOz0PgX5tnffT3YI6FciUZsSPiFu/krMPc8WVwyzwB65ubg?=
 =?us-ascii?Q?PHx3IXQ/DOn8vCzInW1SnRPZIFkiyz9F2mIterHNVEM1vujcpDqSUmgyV/Np?=
 =?us-ascii?Q?PDjtjdpUrhdGsRJy1k/xagUiWghokXXhbU4SKvEgMaY3sCF/kweeEo7RWRA8?=
 =?us-ascii?Q?++PUGnEvrXIXTj04sQ4bskIMNxWfX1umBMcCdwh0fcQD6EeBFLqQEpLQROqy?=
 =?us-ascii?Q?ixqwIsiv715iM8qTwSOwsWALzfVZNMMN4iD0JDsaAnjm3NQWJA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8P193MB0900.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ehKmZFK3N1F9CLanQFnYxumNicBhWQtzwlade0MZ99QQTI2/soLXYHfli7DB?=
 =?us-ascii?Q?W6k8w25IuEf9VdDFmPcX0Cp9+wT++VY8B5SORWZz/x69nO1X6fK+WWEViCxg?=
 =?us-ascii?Q?fHGBcIJZ0Wrpo4ix0P72YhlcDeJjiRhD/pKS4oGGi05vxM7oQ82Ef4pyJl9R?=
 =?us-ascii?Q?w4tEF2SSLiMI5xSJh4lhfSklEJAx33w2BTOUjmBYwb16moiiE9wiFFtAQTXz?=
 =?us-ascii?Q?g/HSG5cAhluZTXmaJl+tJS8qH4lann22JkPBFdFzFxSXEjphfEDwhH4Mg8M8?=
 =?us-ascii?Q?oIhjSlAxO6Kl8jA4yvCXD3n0K5DSguObpPVDQ2RtHacc823mGLWJbxAeSWM6?=
 =?us-ascii?Q?Hx0ka6+IzOujTr2nTfwN49HgdStnihr7NVDtcl5P+hzHQ2/analnk9bjbqnZ?=
 =?us-ascii?Q?960WfnAezd7cZQbLwO8NzrBZ4g/Nig/8rgcQtJpwH+GTBt1YfwCyrx+rrfoW?=
 =?us-ascii?Q?ihdkZllEgKuJeenIECqCX9pNtN3vczINcZCEk/GrVmNeav6382mgJbc+yA2P?=
 =?us-ascii?Q?oQnTyaHw30DfFaX66wCoOCfUPwaLgzy/lXulQUNBw6i8wli5DBsvWOn2Gx5q?=
 =?us-ascii?Q?8YVIOX6CznpBgMiq1bAjIagZnBfJ0sVv5kf64cvRFiT64V9fFhSbdDLQV/Vm?=
 =?us-ascii?Q?E10+ZSOMvoYiNQX6scNkaHkiv2e5G2dc90FsUo0uqJjHm8t+QYJIHdbqHYlV?=
 =?us-ascii?Q?rvgmFLc25A0T8/1bf8/T1u3sIDjJtwkMAxFT0ZjJKQZcZsQQlDtK15fCF4fZ?=
 =?us-ascii?Q?iATloV4nI/iEqnzw+wO82gooYP2YrdKNIE8lFdnMqMM4KhJsqB+ypsNZ3iOl?=
 =?us-ascii?Q?lwk8UIL0GCaiz6xQCz+MN0a34SHJW64Gw1lHGLwSj35A9SG+yfCeZD4LXnEP?=
 =?us-ascii?Q?a6MDDJJD/6C46oDK5r/COhUbHEkp6nP2oVQ+8ggI3UnlTHKOjAu+KFYBXU/U?=
 =?us-ascii?Q?ZCDU4s7IkqlgHO5pjmFvqiDp+bDcjrJOcmKPArGwOmu1c6MFr2fU/Mc3jlYK?=
 =?us-ascii?Q?ya58Y0OntP7rLDcHARZHTM8QNGkGlqEest+/sMueFHZ7LixHd8V4gC1/O9kN?=
 =?us-ascii?Q?Lzic8ifsR8jBeSGwFibnuEQ9LWcjH5F1mqW28cf5MJp7tbs+/vhT2Fqsz5+k?=
 =?us-ascii?Q?gqr2l2LBPhlTpujtCbkSx6hikdvYUvngxZcJCx/dk0Ndo3VV0HnI0GaqF9mH?=
 =?us-ascii?Q?slxz3FMrX3gG4IYsxz4Kgi5NmNJRLBgTtpnZKqZVY1W5Jz+yODCfVSHtLw8U?=
 =?us-ascii?Q?MXkS9pahSIRhC6r7CFeAXrD+nQSGkqDMAokY6WFBUAy/WR/aIRnVMDN++HL0?=
 =?us-ascii?Q?iPL5DCQq19O39psXJSEIdEyioEp5TCuIEEfDayyL27XwQKxGfNtoT+Eux7pU?=
 =?us-ascii?Q?vUd40wsct48rm3iHaTyeNNriAr7/wnRNICJJgHGUNKORg6lyZCvEz6kSCPn8?=
 =?us-ascii?Q?5xPqys41KwIt72s2lZb41W6XZI+2sWTHtDla2R/2IeobR4jXLP8Ao3l5KwQi?=
 =?us-ascii?Q?HDxgHXJhklmH3dyX4ICqhybCNljOaMASxbTZWdobO58wskBwRjOoOxYuXWIJ?=
 =?us-ascii?Q?dEfT7lRNGak1HjTlFGwbNWXLhJ9ga0LBasML3C0Ea/X+1yqXrib2gPKhwn8T?=
 =?us-ascii?Q?gHBO22cP8axSaVAsUGAtLj0=3D?=
X-OriginatorOrg: criticaltechworks.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbdea41c-a68b-497f-25c6-08dccb393d51
X-MS-Exchange-CrossTenant-AuthSource: AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2024 10:23:08.2949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 61f30b8e-4f6b-44fe-9bc2-041e3a9f7346
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ckMe5Q8qaPQrHKo1O+D9fANmFP3LhbNWDKnnDXTj4zahU5Uym6OeE3PODlQdLGOIm/gl5OdvQsu7jDI4/nCxDEZPjtLokPyX0bnAA3dyXWg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P193MB1427
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 10:23:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204075

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

