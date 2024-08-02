Return-Path: <pedro.silva.ferreira@criticaltechworks.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37B9BC52D6D
	for <webhook@archiver.kernel.org>; Fri,  2 Aug 2024 14:00:24 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.41])
 by mx.groups.io with SMTP id smtpd.web10.93593.1722607219789261476
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Aug 2024 07:00:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticaltechworks.com header.s=selector1 header.b=RQdl9hTd;
 spf=pass (domain: criticaltechworks.com, ip: 40.107.21.41, mailfrom: pedro.silva.ferreira@criticaltechworks.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jx0zLtfN2JVTRLPr8HFhLvcs2JUu8H33tkNDOxd0q/N8gTbw5xbwn4t46avBIkRq0u5XMb9Tk9Nc/OA6Lphjx+LG46dMOOOft0qs6z6KIAPCoswpRsR/fcU4khliVOs/IOjAIcgej4rlaMA6mpK2qWK76zFEioSxYbQOJv4oorjUVrotOFvav0NIz1TB31vaG5SSi73ObYS9hH0/aAnGzV92JooAet8JUWtEuG7gJpp/Zf2Eb/CEbGW7L3Yzs9J2hhxNmqpiIilhO0K2pqqdUfJowdKkWsr1Li6LXk2ItgXMesAyN6Bu3YRnc3aaZhNu3j26OiHV7qYobQn/4Okrdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OvGyK1f3KXdMg/4zLI9KnM/XBfufNUhTjvGfMEPYp40=;
 b=VzPycKbmwT+nm9gaAkLISIo42lRpoZy/B8tIe1NwCLGVluDAjBW3/303zfGaavF1A3Bid5+zkGrkD5UrduxQRylxmAYD8/GqiZvB5PrlEGf7XYBK1d2qt73VOZJGoMcDfLFb7/yhyamiqQLDv6Cu67DAbzaQKvb3WxFhcxpTaVBmMPlbmHiuELqHQP9OfsxOBHqrrhmT97FskRIiqCh3HpjywxQgiuoqJ24DrY4FeUfkkXo3xlO2c1Si6mEBMJH8C+CP5UDtXfC37XOYryrDgItLzYabpcQxN2mzzD04ydHGe+ClP+X0HrjIxShKlCgVFTieHqk0/lTKx2oXVM04SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=criticaltechworks.com; dmarc=pass action=none
 header.from=criticaltechworks.com; dkim=pass header.d=criticaltechworks.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=criticaltechworks.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OvGyK1f3KXdMg/4zLI9KnM/XBfufNUhTjvGfMEPYp40=;
 b=RQdl9hTdoxJyoWJ6BDUgH4fUxRrrJUIatf2oscrOpOWdU5AIcL/R6gd1B2dzAViWyONw/3avCZbEPACeNcOVmsI+cyjkg0pXplvJpKusrxhQ+3rHE8DqPGmafqnnWzCgZxc8nvuN13p6TjG2lD0Ra5LKQG1VwROjoqH4RwdK3GbmXgXLIQpXftRW0bUzVUf5Z4CBifVnJn3pVxaq/+FkM4ENcJVZADCMzacF3Jl+hU+PgfykGzaeT+sgxn2nHgTUdDRfY2bb3HJV27vqMqv7BHYJ+XWZHmEsZupIAhGAc8QHSPrBXkKQZMYN8JOZTMrlHhzrwskDqrUvOXKs8qn8gQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=criticaltechworks.com;
Received: from AM8P193MB0900.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:1ed::9)
 by DU4P193MB2518.EURP193.PROD.OUTLOOK.COM (2603:10a6:10:563::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Fri, 2 Aug
 2024 14:00:16 +0000
Received: from AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
 ([fe80::c359:f497:ed59:65a1]) by AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
 ([fe80::c359:f497:ed59:65a1%7]) with mapi id 15.20.7828.021; Fri, 2 Aug 2024
 14:00:16 +0000
From: Pedro Ferreira <pedro.silva.ferreira@criticaltechworks.com>
To: openembedded-core@lists.openembedded.org
Cc: Pedro Ferreira <pedro.silva.ferreira@criticaltechworks.com>,
	Pedro Ferreira <pmi183@gmail.com>
Subject: [PATCH 2/2] buildhistory: Restoring files from preserve list
Date: Fri,  2 Aug 2024 15:00:08 +0100
Message-Id: <20240802140008.497492-2-pedro.silva.ferreira@criticaltechworks.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240802140008.497492-1-pedro.silva.ferreira@criticaltechworks.com>
References: <20240802140008.497492-1-pedro.silva.ferreira@criticaltechworks.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0367.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::19) To AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:1ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8P193MB0900:EE_|DU4P193MB2518:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ec9621d-79a7-4f0e-1eab-08dcb2fb6ff2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?LrbakD0c/OHSuLcAaUbTx4ur4Zyv4A+Ix3EkWytpzHX27NVR0w6ZGxWCHlnA?=
 =?us-ascii?Q?DeCRPcc3TDDFMjh5D9ONhZQgdC2V71zdcvR1B/R9NItqbh/enuUihT+lvvon?=
 =?us-ascii?Q?N/YhtpEaIlWJlk568XSf1iDpKYwTxoEheKepUmRhT3WurNm7Y/O34w7fNpAj?=
 =?us-ascii?Q?RrrPBkrgaR1jSsuS5Vs8N7p4+saflMbqvYgYLE1k4Kqrj4iTXTDZWNpLR4vM?=
 =?us-ascii?Q?wwPZF3+70ZedvXrH/gC8euX9FrSqzHqvZGsQQgTNc6PbJ4tWumszFjmgrS2M?=
 =?us-ascii?Q?8SiuQt+RyTv3yM/qdwngzZMmYl2XC7zX4E0a+u7tGeMnO9aBWkO9a26cVlVC?=
 =?us-ascii?Q?N9tqbH8aLpgRu/T5uQgtdLHfze2ILRsOS5XL5/Ua+QCXrNDIUywvLWXCyt8s?=
 =?us-ascii?Q?Gbmp2gfVDHHd8kPVpow+37eMCc3jnUWOJoNrJ4Z3M3tOQKTy2HfpvYp442DV?=
 =?us-ascii?Q?SB4tX53klCcGorR4IeVZxXTBYPLOa6DRaYJCDhGrsptn2kqbDkVZKkSE/tSs?=
 =?us-ascii?Q?F/C2aWYdAn2kyiLPAdVoeLvq1ThJjc4LF4fMHx9BWAhTwHl0c6d9EX3dr3jW?=
 =?us-ascii?Q?H7fElWChum6kCE4k1qGVgnsatd92JdkZqMe7Zo+24qO/tL9IRx4TurfoAXrv?=
 =?us-ascii?Q?Gj7lNKZTJTzBWigeK2NwPc9Q9YSYxrgQJ8H65IBDkVkzBjSg4AQfunBzOGPb?=
 =?us-ascii?Q?PxAE45fBQrxjFyzDz60NqgGWTwBMpAbE8VswGXeGXPiUn7ZQXfzXD+m8Tn6v?=
 =?us-ascii?Q?anNz9nyQGRROeDi+7IA1jg3kq4MSoPRxnY99fdiZRa/uneTu03tTcmYwuejR?=
 =?us-ascii?Q?zh5fS+p+wbVwzGYD+N56pGtGQHSEgryZFQQA9VqcietTcc2aLCXzFLwc8RV/?=
 =?us-ascii?Q?8RlH3BtZtLHu4B6XtrPFd7ZmjRIVeFAV57KVAtaaSOnJyOaD/Xwep84Ijci+?=
 =?us-ascii?Q?d81L6igYur2g3cK4PkNMXkr/SdjcQmA/GXRN7ZDY358CKtS+flDsF+OY3MOM?=
 =?us-ascii?Q?9trni8V5WJG5kJFsrE/LcefllqzFGoM7nCefwYsnV4aFpB1TWw0ZD3cCl3nE?=
 =?us-ascii?Q?KjYvGGHoePmNQd70iYDoCyk2xvfa3U8pTqyuVX/RWBgkTFO1goSGunQv2kfB?=
 =?us-ascii?Q?RAnbpfNGFUuodLlThlbrDO24UHXV8kjprpuUGlD0I1v/ddCSbyQcsZqjNUem?=
 =?us-ascii?Q?/DNOftrAbDXVUuM5q04p49Erf+w6yHbuoH+4GGfsQkVXMgGkd+VFLKlEK9Ic?=
 =?us-ascii?Q?CiymPDkDC3Ts6fjXT62zz0hCkkHM2AdfeUykc3Nioagzcs1tswtZcX1mIdV5?=
 =?us-ascii?Q?bd1I2TrUq6NpVflADlZbOJN8GCB72C0H+LWuDm+OqdY5Y7HxrFnYg9ntgXun?=
 =?us-ascii?Q?8TyQU5ZVgsMzK34s+JuumIfN5oBMXYL3nkKGoGVlsnfPxfbftA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8P193MB0900.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TvYOmdvQ3NZ8DfGzWJMMvF/BSB0p+YRlpKw2n7IvuEkJy8JeTbVUZgB5n6Ak?=
 =?us-ascii?Q?E4ALdtANSE4ygW+7uTlDkgB4aIu7JJRdbZneNsvRLrsZjbOVMnZdPEFs1S6J?=
 =?us-ascii?Q?KH70o07ErqDCi1eqHVMbpUbTttf4TXb8vZomTA431UOk0Azmv0k7Cab3ihHb?=
 =?us-ascii?Q?fni5vC65Lj0oz/8X/Kywq5gOAQS9Cmu4X6/6MbyyXkD9/+Yd5JpvUdWTTgsE?=
 =?us-ascii?Q?pL9+reCfNd+bh+N910496hLr8FDhTwXLdqONIZeqbhdXeKMBIJL8BKnq8a4d?=
 =?us-ascii?Q?jVZT97LmphPZqOABFYeiy67Oz2a7VflgL2ALYMLOA/917Tud5G6bbU6bztOH?=
 =?us-ascii?Q?Jv98aIKZL5T/Wc3w8Ym1nWTOiCIokPVp1pHam1Edp/OlFfZan1fhcR2VaPVl?=
 =?us-ascii?Q?X1pDT6mwNRFtf4xudwqX4R3/bQirIJBWhE8HFH9/GmEU9FcVT5wYxDCCmtGv?=
 =?us-ascii?Q?Y3SQG2CRyOjG0KFs5iMGtaxJvCu6AqiavPmdwmlRj2O6hi8n7peMStAdqlAj?=
 =?us-ascii?Q?Gbh01rtMlbW/2StGZ7514RCyLoWxA43tR/iCb2fbX5BatnJrvi217SQSVVPY?=
 =?us-ascii?Q?tIxIc53Y2oFiUgNzQnWkaE6+PqoiLTv1fQHLCeBYsVmhzVwV7XVqe39S6BNy?=
 =?us-ascii?Q?1x6vZTfN/QO4OK5+qu4br683iOLn+P/4v2ckP4FLjY1iHzD7RhKLsJNyvWXU?=
 =?us-ascii?Q?4TTAyxp9qtCtFzSo0CPMpNdxLjKcpEUY5b7fHW79GknsZcxq8/Bohf4aixek?=
 =?us-ascii?Q?JvPtcBCZMQAPTAkORWz/DQgY5fUaKcQlveRR2gWFq6etKl9QExuAWA1M7GIX?=
 =?us-ascii?Q?U8jZJmGWx6UAr6Q2/dx3nFrYOwb2l6ZCTIHloRptEYVdLBKfCwhi9dsOrmYq?=
 =?us-ascii?Q?/JnICxfKrDmbIdeHd7kXzZULvIas4x6M5PGCQenjtf5cE6e+721BUm+oDnsd?=
 =?us-ascii?Q?f6U8j3IO5LOvvmHRVe5a9TNvS4F3dagkaFYMVY3qGxXgOpcuXCthPZQunBR3?=
 =?us-ascii?Q?N1o8HJExXzzo0B+i4y3q6yHTjHhYWvXHwGEI5JL006NJcPQBDLoVm6ZsyUuw?=
 =?us-ascii?Q?tlzdIJk/Q7HAXfQj3PWKrI9vKPVQHvkOTMGC4Lbb7dXPkqAZKM6XweOEo6q9?=
 =?us-ascii?Q?vnhlI62FDng/Zh9iy7eSvAGvFhdQoDPi1gqhoH9Me7taVmoerkHEuVvKX7UC?=
 =?us-ascii?Q?RVEcdM+i2X7/382W+PqFU6X7UOhQGmykT64H2KwCJ8yebEictNORkx2MS8Nl?=
 =?us-ascii?Q?c/200ts3KhGQGNb+h4edRAUoj/Ku/BLLdZkeISYR9CNqx1DZQclAhWM4ccNz?=
 =?us-ascii?Q?kCq1lcL4zzPYnM8kTUNsazJB0FfdU3HsEw4Gr+tPVe5sXAtOjGH0GmbRw2+e?=
 =?us-ascii?Q?Wj+kVSWLudIT5qR74x7/RgXRH0t1yeI1XRWUH+3Lfi+ydV/A8ZEzHv5zD0tt?=
 =?us-ascii?Q?gIlUFWHTynnytadIyr9tOyH0vUd6lbRzrYyiQ29rAze0omNYx34ksSXAixcs?=
 =?us-ascii?Q?9w0nxSSBUDcDUK1ef72HyVrSlsyU8RTmc0Jm/cWega1VTXK4uNpb03NeA27V?=
 =?us-ascii?Q?05aPVCFyBrIeQCsRogWq14ZiDUBRwoNRqoBMQO3oAxnYAHUANiVGLO+FzDe3?=
 =?us-ascii?Q?f5ZWkULfMRutgkqtk+4XVRY=3D?=
X-OriginatorOrg: criticaltechworks.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ec9621d-79a7-4f0e-1eab-08dcb2fb6ff2
X-MS-Exchange-CrossTenant-AuthSource: AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 14:00:16.5775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 61f30b8e-4f6b-44fe-9bc2-041e3a9f7346
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qHpmRYRUd0VYt10pLlnspBg7XVVYkoKuKlZof4Ylse0SgpCUuM2vmj6bLz+KlFWxIw+CmWaDw7I1BZlekCZnN+jKoiln++iNKcHND2XGNNM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4P193MB2518
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Aug 2024 14:00:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202912

This fix will ensure that, when we activate feature
`BUILDHISTORY_RESET`, files marked to keep on feature
`BUILDHISTORY_PRESERVE` will indeed exist is buildhistory
final path since they are moved to buildhistory/old but
not restored at any point.

Signed-off-by: Pedro Ferreira <pmi183@gmail.com>
---
 meta/classes/buildhistory.bbclass | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.=
bbclass
index ad151092c9..349b7dfba2 100644
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

