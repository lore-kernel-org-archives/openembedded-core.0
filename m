Return-Path: <pedro.silva.ferreira@criticaltechworks.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A804CDD54D
	for <webhook@archiver.kernel.org>; Wed, 18 Sep 2024 17:00:59 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.44])
 by mx.groups.io with SMTP id smtpd.web10.20693.1726678850529329324
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Sep 2024 10:00:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticaltechworks.com header.s=selector1 header.b=BWDei0S/;
 spf=pass (domain: criticaltechworks.com, ip: 40.107.105.44, mailfrom: pedro.silva.ferreira@criticaltechworks.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jXs7aacwIn9RWoFFH4mj7nB7DFNqOjmkV9gm3+YmW9MeN4O9MQYe++y6CDz1VoqvAo2Wr9bJPZqwR2Ajg5Xc27Fwu4sPgumVF5MVPGzF5XZvSUr5SPbRKuPf74biSIwTSHAM1CJJ4hp7AWJlNJuh9N5DCynugglBloqrEwxYvTI/Mf0PSza0+GMCzGLAaxxzcS24BC+evxGqKJmkMx+W38cTB7PmDIdBCuwxKA59rBjUmii4Nwllb5lcO/bh3d+uWTI2FtDywtGVsXuUs3EXfjiWM8jQf1HyFYg7bhqjSVXpo6xa11nNyrAzcQXzXJxd7XAehQf/gYbP3AAXyQyBIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dt9QUPxeNdmqES2mhcFlC7kngxBxSdiTGiTeonM9Zkw=;
 b=f460eK7jpcgQuLiMSmYfjvsrVA6NoRFnPbAE1xOF5zbUE1+r06Vjxbmj59fRE7Xb4YKs2zY8skMdTANP0fDrFP2GkoMqKjRzSBBpL9i/25Mg0TvDUdXqIThUvEDJM3drKoM+clMC+zm3I09rdfmHc9nphMpQS3QtxD4u9cK5YVOv/xNvFbvZcIMDiZaWwiIVPIoP2ArWOzPiN3YIBtFM8d0013doMPsf0dnEIEw+14jcEwCYgFJnvUa45YGSGoWa5U3lwMOQXaL75NMtPVL+8mHkfcGjbc66w0i1k/13eZmp1vbV1QfBBaAV8GDwMg3cQGhv9TCBpo3D5MP/BQmQBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=criticaltechworks.com; dmarc=pass action=none
 header.from=criticaltechworks.com; dkim=pass header.d=criticaltechworks.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=criticaltechworks.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dt9QUPxeNdmqES2mhcFlC7kngxBxSdiTGiTeonM9Zkw=;
 b=BWDei0S/aTTNg+giGhghnbqdd8PXiScma05SHvZnGnzHOzAf/xbXjZb5o2laNgKQ12GC0lyDYNbZlifoof1S9n2bBK3gKxEVcAYuO0irtoNQQe7wgjxEodLNHyxS2Qd5nG2kCMiY8TIjxcyl6ElY/NtY1qOzTG5Iu3ArD+NNmwAurQSimPgj3Do3XqjfANiSPrNksQ07deymPNHqTAbFfNzHXlprevtppcSByjktnFQlzYJ7iQAPxX7Z+5K1PN70S+C1ikvk5fbdgM//Ht6FFEcSW7v8PB0gZMvA181uol5idgg2C0EMKJJ0P3OFAH54mHSLhclUImSM2NWGnRsejg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=criticaltechworks.com;
Received: from AM8P193MB0900.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:1ed::9)
 by PAXP193MB1278.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:156::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Wed, 18 Sep
 2024 17:00:45 +0000
Received: from AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
 ([fe80::c359:f497:ed59:65a1]) by AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
 ([fe80::c359:f497:ed59:65a1%5]) with mapi id 15.20.7962.022; Wed, 18 Sep 2024
 17:00:45 +0000
From: Pedro Ferreira <pedro.silva.ferreira@criticaltechworks.com>
To: openembedded-core@lists.openembedded.org
Cc: Pedro Ferreira <Pedro.Silva.Ferreira@criticaltechworks.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH v2 2/3] buildhistory: Restoring files from preserve list
Date: Mon, 16 Sep 2024 08:16:19 +0100
Message-Id: <20240916071620.2831989-2-pedro.silva.ferreira@criticaltechworks.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240916071620.2831989-1-pedro.silva.ferreira@criticaltechworks.com>
References: <20240916071620.2831989-1-pedro.silva.ferreira@criticaltechworks.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PR1P264CA0152.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:346::10) To AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:1ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8P193MB0900:EE_|PAXP193MB1278:EE_
X-MS-Office365-Filtering-Correlation-Id: 048bcf64-2fd9-48a6-982a-08dcd8037017
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ucxwfuojq2lEN6MYBBIDcR2mptguA+DmFw4xvddt2OeEKf09RPNiKjtCJwea?=
 =?us-ascii?Q?LxQQEYxI2H7IggVHrF12ymamnXpUlRTOcqX2mqwYvp26UxbRHvIiSWAEmQDa?=
 =?us-ascii?Q?GvVjXiFWz6LiavmZ05m+0BdVbfr7D9552P6WRS6cHm/x9Tb7QJkFqDlfaP64?=
 =?us-ascii?Q?rzR4cogEj1m/zRYb491/f056mRWrnbJ/VA18Qo3pv73p/wI1Wm9pP6ek3CIn?=
 =?us-ascii?Q?6p7nSZNyxCfGgHDKaPyj9lljvdvwX8Cv1s8grRy6oxWLBRoUJv3UzKUb9t+U?=
 =?us-ascii?Q?QJtFusq9bHsv3vNe2xDHBXJDMkKayRc1scfOa+4DVplK1rTYsPYr5giS+76s?=
 =?us-ascii?Q?YIku4pz5RdxnENC0DFQbWTAdFOo74frkMRR5+l8rgu/SlcyMQmSHikKbKX+Z?=
 =?us-ascii?Q?BJMsibRYrpOVJupT5HaiAEYpC/SdEqhGVt5a/FCnxnraRqxqFWr6IA612WLA?=
 =?us-ascii?Q?/PRgyBaAaXPpvlgUS+V6Zxa6AZGm1hrXtFermEOKW5wTEvsPPt5YRyu5BUp2?=
 =?us-ascii?Q?eR/eOxD8lbmPOrt//dDBLBV+KWhwOxKFGRSzo+vruhVZkqgv+dFZLYdyjVKH?=
 =?us-ascii?Q?NWvDEEcdW5rI65eAatoIZuSGIeqijC4NNGI7op60WEICkhKutGVAyN3yvFB9?=
 =?us-ascii?Q?x4bp407oi0WmpAtA7ol85Bsz9qd58oXJgHErq6vKtUHUqlSf9QSG+c0oqrG/?=
 =?us-ascii?Q?fL5IAlJ2ZEG9PlDwevEeqUHlANyOCcTZHiUMr91kA9f7AWjek40JWqKIiPfb?=
 =?us-ascii?Q?ewbtJt0RCTezow7NB1VNCagrD/HrluD3fjwkI0CS0THTJNvM+1aQ9EFDzo3b?=
 =?us-ascii?Q?hKOFBgqD93kkrsga62ShtaPczSIZupZSGnx0AqZXT1uYR9d1K0AXWgq+Dqvu?=
 =?us-ascii?Q?f9LIXYu1OgjdLfQgYX6F+T78FCL8Ngtc9BZCmDvPTotiDzB+L3F3CuCiOuCw?=
 =?us-ascii?Q?4JDRTWMG65PSAVJq65fzBWAiu6Rl/YCM5nhbtmG3+zWFlSYnIlBo9MY3WfL3?=
 =?us-ascii?Q?xWx+42mWi3QYqnPpe6LRwD/Vz45igMmG5IH1aG9DdDzCOye9EAxjix8euzGs?=
 =?us-ascii?Q?LPNK53pFB53eku4SRvtHxdbo5RXze7c+nNbIvDDB3fvxvM8PChxtplFk/+k7?=
 =?us-ascii?Q?jH6o2sumBu+xtJ+CAfw5Vbdv+hI9cefzMam6p6JOcUtQiEGTP2XkacgoHHf6?=
 =?us-ascii?Q?yJE4klxA2+D8xq7QBvQPJBIjj1EhLe4/5sud6c24hbaNg3t2mHUbjBqlngPd?=
 =?us-ascii?Q?8s+Nz1T1eIvRUe+uLB+8XSf50U3pJWTXraJE38evHKh3pqRUws+L4z2uycDT?=
 =?us-ascii?Q?cVtooW+dT8E0tvIo5L5IkpHIqFeKhdrK66yQKkiV82wsh+p2f071VMi9yzKj?=
 =?us-ascii?Q?dHMeYywVfe0ZM55i85p97fVwCxe78VcQAiuIsK/CEOWuOGBnqQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8P193MB0900.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PQgCPLA8SQXPGziZOMu4IH0gtjzyb4PkOjGHnFVngxD1GzzLqL2c/Ahhr51j?=
 =?us-ascii?Q?xdareJDudoOEBxbJVniSIQ3IfQSMQiI9DEnGUEtTX8hxT30ug2pTkeo5V9nJ?=
 =?us-ascii?Q?V1G4IOHD6uftZoZFpcfxsmtxgbhjW7ajGjQ/C8BAkTiXaIUb3Aweg6PxjS4V?=
 =?us-ascii?Q?64zqoDgYwVMAghriPCrjwJ7rJk3yWvF+QfKJ2dOfRBFDIQTdBmUFLJ8jLfWH?=
 =?us-ascii?Q?XNIMYzDs7S5pUxPrr7ha7sdRynxxXPmcrPvLW0exsEWW9FESFXKKhyVviYQ9?=
 =?us-ascii?Q?V8zKyr97Z9oT7YttIah5bn5GzqSIxnByHaY7zdXrW74jdB5eUjrHxEvXFh1q?=
 =?us-ascii?Q?cRKk7DyNyAk/ErgNWYvN9cb9lgcSwsQbaQNqyywLv5LOu26fcauRZNFXrTT/?=
 =?us-ascii?Q?hHuHxY5zAxkza7ejCVMUwvC9Md6m2KAIDZ5zdSZttOjYUdVXrFOcEGZ54pT8?=
 =?us-ascii?Q?+gfdl9k7TUJATfI6pQHOLUEOqL75xfcHqZkp1WhxmhnGRKPwQe0m0woHMvUC?=
 =?us-ascii?Q?tXk9/zAagwmIPEDQBMAMX+I5GiSLPTvC4mupl3kKeZDTPquqRGF4FDDwGiL2?=
 =?us-ascii?Q?6YcL7kOJOY68M0JQozkIfgarGrcOsw/QW7vQrsmvIXl1imyo2sulfBI4ezsl?=
 =?us-ascii?Q?a3Bs439XifDrKXc9ne2TqIDT+Sjrapn8Yckit8TOnu4exIVNzO8ire+TkagS?=
 =?us-ascii?Q?kHaI87d68Si76ca4ZzGuK6wrjOVWxiTxzZNP+dlYpnOm4pKbjx1nnloR6N90?=
 =?us-ascii?Q?rYK+9MtH+8UGyYJ5tUz4Bx8ZMHMhfaWELo3EPYzy9FrVOGFZqSIhzZxqQ9oi?=
 =?us-ascii?Q?FHeoBW/7gEUjA7odAeoYTDEyjkLcrFrp4QShlh3KKZJg+W6zj6L27/WEK+11?=
 =?us-ascii?Q?wzRBBg7+vGBRSStOh+ZRmASa5dLpUy9VUub6XWp4WXPiKicEg2+MUZZplpb5?=
 =?us-ascii?Q?KLGWzPuAXryZ6DjDAW29ZJ6PBmOv5ABLPET7czue83t01+DHlgC3h575MkuU?=
 =?us-ascii?Q?3K3+3Yo8QqmyKwvMdc9CoHwkp5iCM8iGRLfYncLqrwfTiPZ2FlNDBHZGS34y?=
 =?us-ascii?Q?0zycX1XmiPe7GoBtNFLDavAzSQmcPC81kLZrMfJnCF//aLhzZ9iQyR18mdzc?=
 =?us-ascii?Q?StH3HFXa8JnjmowBHkM9AuARU3KJgwwOaPaujkJ5NQouMgzQTHU7x57VypTV?=
 =?us-ascii?Q?dc/JZ57oJpfbFJ1ARIxeiYtv0/Col4IzppWmbokHviXHGgh/VW/LhrsB3sB1?=
 =?us-ascii?Q?4efGr+mgHxMM1Ge1Y6oO0JctM9RmJDVWUze4E/oXn9nMTqdBdzt1TkrSpFGV?=
 =?us-ascii?Q?69OMqR2ycjDbSYxb2a3N7+YbBTbApmjlYzzI2plyQD+kbFCCSGA8rUiqB0n/?=
 =?us-ascii?Q?Zs7h45ovb28wOir17p+cclQwVkex6xAGBKgWNMi4KQZVcPDAahyyij51L1+1?=
 =?us-ascii?Q?mg31u530bA0G3KF6aR0swViHxF488HWTTNPeGzHNapuThVeZeZ6nJzbWTLX0?=
 =?us-ascii?Q?45Mb5+p/GZ9G41yD09FkglyHGwk+3ciefStfM99Xurkwf/1dIYY41ZYx3b8P?=
 =?us-ascii?Q?k3Ua0kzfkAcfI/2ivu+9jSa/ZllA74FnWY+lr6c6QxzNFnVZC9NSxFOGfxUa?=
 =?us-ascii?Q?Bcf1WZETzMBoBGyQmUOa5AY=3D?=
X-OriginatorOrg: criticaltechworks.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 048bcf64-2fd9-48a6-982a-08dcd8037017
X-MS-Exchange-CrossTenant-AuthSource: AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 17:00:45.7888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 61f30b8e-4f6b-44fe-9bc2-041e3a9f7346
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tv0sg/l5fQj4GFS19Y+cSaPqmsBCSrJlwLjmp+HHUyQnh0p27FOl2by4dAuQzThTLmUA+tF5fVlKT6k0cF7gA3er2JC/InvLzXzAfYGwCK8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP193MB1278
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Sep 2024 17:00:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204651

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
index d219519f86..08970aafea 100644
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

