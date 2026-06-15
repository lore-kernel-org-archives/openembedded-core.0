Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C58A8CD98C7
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 12:17:57 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.40])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.128145.1781525871791014071
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2026 05:17:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=kDQ1AUY4;
 spf=pass (domain: est.tech, ip: 52.101.66.40, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x6ov8DtF6VOrun17lLdZMWItRGo7fjckJxIkPHiECONDOkWxS9v1z9vGtqW7mz+67+BFcNeezvpOq9/ruFGnEPGQSscNuenPuvaOdyfUFo73HWCUdgLl3tvp2Jw3vYlAadTiaVKCpfU/iIHlmSVSoWN3qO6DcQQCrfmXbgJudc6Czz3oZzt7OYwP4tLBVyasMlc7ZETTbyqLZKaXHSRcbjqK/j2UFCunXAv8KOWhmPHIBaB9AOnPv4n6BfyMxcoxcy8AyGvzd3DQ0UZlPqeq2CfuUiNKp3aOmBYSarXSxcI5Q9SjyF8AFeq5Vp+rtP3i8VftezMFKI22tPkac2GMDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7S19DNbBMYzlECHSPZQKGoI+PStygBYLTILopCLbskg=;
 b=U/DrHP117/jp3AkPW+MPIFqNycngUo3BBM6/dOzcVC4OzuhfS6BC46QiQl06RgrKY3pChlYY1HIV7DqFLZZmTkMVx+LX5BLJ5P1AzZTKKswHCFZWZh7jrel1qKrXm+VxmOWLV5iDNhYejJJoIdWPBC9qd9Lkl+TusogkrvlUcV6gwjgsArByv+q2hY/m5CBs7zM2Kml8gD/1kRCCGSkaHTP0FyIxJ2BgIhUPi9pk527Sn1ER5KV4ZLeECW0HoUejuusQBp+6NaU1HNK25XINiZKZ4ypWaPVGmbB5YQb3akh+CfL6skvJpzkQ1dBgJmUuEbrbt0srZB+nsPqvkDNllw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7S19DNbBMYzlECHSPZQKGoI+PStygBYLTILopCLbskg=;
 b=kDQ1AUY4Hdzrfzjq0n82vXpD6lAVKQeJP1zROxHHhlCl/lHBxDUgdwRq5SRf9S3w14LIOrxeZ+0Lquc6erytnu0us8UUxm9LOA7hCW1YqHbiHmn8rTmhDqcFp/SuAOu761vl5Mn0bjxvYRgbDBk5tnG7JNWF0SDoqXLTdhHRyyJ5LG6+8QNwYgeWgH4IO/f3vvvI964SDXPP4H6wnwmrTmTRdgjQ9f25yWhXTEiCLHeq9O76AUbZFL1K3wPEaW021+3+Wa9NgULu43auBdYqPEO+qZOQ0u+2XWEQMN0ilJdFueQCOBaKnzHE+odVHW8sePR8TcLjRIhDvgQet4M1+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DB8P189MB0747.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:121::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 12:17:47 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::566d:7425:a795:5560]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::566d:7425:a795:5560%7]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 12:17:47 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH] install-buildtools: make SDK name configurable via --sdk-name
Date: Mon, 15 Jun 2026 14:16:53 +0200
Message-ID: <20260615121653.96009-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0178.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::20) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|DB8P189MB0747:EE_
X-MS-Office365-Filtering-Correlation-Id: 83bcb081-5e14-4062-51d5-08decad81c9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|56012099006|10086099003|11063799006|6133799003|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info: 
	5ZNUur5tpHihTbRIOKp24D8av8BgJVCLaANyXpe+sDAyK48y/U+n1Wx6h/lKEj6007KfX9zaJ6qpQAtCE6j31aI60KMDbDgX/5F+H0sgwUMk46aBUZ8QVfFtu8Q/1lb5WIiN1SwrCqddOnphl9NlauaqPEe/Bz6F9BZPCoxn2Nfn8zvGk3jOwSxuDeifWiIGmURUxJrcQ2NB0m/JPUHaxOGEhkoKFmibJKtfaiTLKQAgpvnZnscfgUdefvnhNwyaucPktc686a0RjADQ/UZ7uqSLGgRJqUFNlEIXt/OsYKEYSAK8SYF7b5E2kySt3juX3Fq/4fpVsagbsi7szgGGqrs/w0G5SL3UM8TbP6nVK8JE98hApCk+1sA4gY50/e7vDXSyMtoeW+Ij4BcbCL73pb+XGnDZS3lccNC116qx49j9rWHbBMQvtFtSdjV+n31TgobCQuXUyUnH5bGeUesACq8ac1sneoW2wOUp1qv0j03QY9VJdGBhVL4ysiHjJwrz2LE69BSPMn38aqr9JOh3IvGx35oyIhp/FxBVWB0CZTYTUWajMKNNl+5Om4PkhZX9L2KPdGugX5bpR2vQToX4fz4MARQ80leSHigOaZnc8k+s8QBSwNWPhfE0NiMsnhhdOVPnGnkNFXJd2rvsDz8agvserxpr4ndAkGNgOSLcmsA/Wn6O/VNAiwl3TMy5plg1
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(56012099006)(10086099003)(11063799006)(6133799003)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/WjG6exkgU2wirrqSKYVDIrWD+1lomkEDpPlyUVJ6hlTfYU3UsZConzQWUlN?=
 =?us-ascii?Q?yW0NXoBJhdqOpZy9bysrt3Yfj7VrCDF41RDNDOYTzvWTipkI2TYJS+R3hRW8?=
 =?us-ascii?Q?QA28ZO7QeUMuyM1c+NOpJrn0uqyXOBPtb789/65SAAKKLsZOYx5TD7sCiIuG?=
 =?us-ascii?Q?Kfz+0fA3iA/xAC2boFVjlMXJ9ly1Ww2H+D7/X02Eyyp35eOPL/uoS908WvER?=
 =?us-ascii?Q?NAxWauYYV7IhlY5X/9cS5v1n56L4sufzXmypmt5oLDtjqkPgcBMCDxRp9uat?=
 =?us-ascii?Q?kEywfyblHipf683EqNvTjZIJdu0CElkuNKzGEcp8V7NmOH+i+py1t9mUMTVn?=
 =?us-ascii?Q?hRui3XXn9tbhZAtpMAXJzIxV7ZnNOUKsyrz7ZFBCodSfu/xkocpKFpQ733vV?=
 =?us-ascii?Q?/8uRg2HB2LsJWsfV5QaGyqtlqFRKV6o9zUhpBEfvyARXW13M45CIZay3HwOn?=
 =?us-ascii?Q?+3SNUdCYV11v9KnUgP1YPDLbDDRACeSo/dY+v2y5QPpnMdcSMQY1Unk+fIBt?=
 =?us-ascii?Q?mLr1FVjbFuwuwuIandYV1jDvRLaM/pZZZbDpvWTlqEgv/MC3Xm4xqkoMau3m?=
 =?us-ascii?Q?40ohOrUrQkXu1RNd6exUu3lJ3aYJ7dWUWjWuiOUmf6t5Kn0txRvJXzdDm7HG?=
 =?us-ascii?Q?//xACfgsk2a77nGk1bGYAB/8y+6O4uFRpX9fvgakD3SK4qiPNeZ+iXz86BFj?=
 =?us-ascii?Q?+sffNW1014xwc1Wirt5gskAf5LUK0hWY7MKKutt/k5Dit+KRD+K+BHW3GjQR?=
 =?us-ascii?Q?1lcj0J1OtYQ2Z2U0cDidPKDFGEGtnRjM6p4nA7ktUcZCySaYHfPuh15UJE8N?=
 =?us-ascii?Q?OUExX4yfryWSPf6nbg/5KvkEkoHouUV8Nt5n32kAdhH00iIOMybSX46W5Z0Z?=
 =?us-ascii?Q?WYtF8FO7S3T86/709DZMumYvY9AisBDnzjI/go/jwloRQCIOuOmVE1pwpECf?=
 =?us-ascii?Q?m8v4e4r2V5QvpeTbt1ddVvcZ8pb7dUeBZtYNePS2RViBzQy+ZzDMx+HyAOlU?=
 =?us-ascii?Q?SUkRnV0pZMm2B1Xvz8w3aeFueIX5t49yOP/3Y+WwvsODpe3m7gx6R3eWi5tE?=
 =?us-ascii?Q?k84sfT+mO81+iBqI1HrhMCgu/fd7ZWb61ks24MMEyRdQEWyu02NdC+PTMCKL?=
 =?us-ascii?Q?7pRlRc3ayKl8zj4Aytg3ziHJdzNvJk5EBD1y5KDkYIqVPsgOhHSRGR8DPt2R?=
 =?us-ascii?Q?mBVcMa2HyJXwq7xns/SWObkrBB05HDQJ+SFwT8E/+iWofcpKLJAyTOsMNeMY?=
 =?us-ascii?Q?7mELDT1T3+GgUQui4ZXxeyOly2fyPMdEcygFe8B3wz+3YTN3GjBgdx3cvJgm?=
 =?us-ascii?Q?AptSPxBN4afdPYQbth90Zi2dvgFHqZLx1IdVGFQ2tI3FpVksO3cnQtMSq204?=
 =?us-ascii?Q?OQNe+sULEBiw/J4VyCpDemGT4rrMDP2xyERyNWCAdTyhtyCpZ4iCvj5+RaTE?=
 =?us-ascii?Q?6Ok8iDO9RUNzEflauirCuQbMNdNHGQQNcvd9YtZuLEyH8SXq1aBf0Y+wNe9p?=
 =?us-ascii?Q?xmhRmQGPgAjc6alo1rBn1+pCDd+7G7v7oW8kvl7iK+Lw+BQtZ23g3euU5FxC?=
 =?us-ascii?Q?6cdhOM8IA9S3L8S9BtsXuhOfPu0Jduv5b8UC8dWrXdfvPJTi9zmNaUh/Ha3e?=
 =?us-ascii?Q?JMcpGjfR0t0c+KCg0i5lu/EUMSFtTY5nSRweacayHpFzlDgvVZ5R5x3+Q4c/?=
 =?us-ascii?Q?to9Vk5LzQ9YA92/bodQs+msEitxU5XftKTK9vny+PywqpXIXK2yi+TohLStG?=
 =?us-ascii?Q?n6qDO3oiiw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 83bcb081-5e14-4062-51d5-08decad81c9a
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 12:17:47.6243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PAyePfeG1sKQkbO3HT6zWTiocP/T/52BHPYYNVh3QCTI4hKQsxOCOql5s4QGxgBMQdI1Io3Si9Imeku802J7SR47L0SqZ8eYA0D16QjPvJ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0747
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 12:17:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238847

The environment setup script installed by a buildtools tarball is named
environment-setup-<arch>-<sdk-name>-linux. The script hardcodes "pokysdk"
for this component, so any distro that ships buildtools under a different
SDK name gets a FileNotFoundError after an otherwise successful install.

Add --sdk-name to let callers specify the SDK name. Defaults to "pokysdk"
so all existing usage is unaffected. Invalid values (empty string or a
value containing path separators) are rejected early with a clear error.
A friendly error message is also emitted when the resolved path does not
exist, pointing the user at the --sdk-name option as the likely cause.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 scripts/install-buildtools | 41 ++++++++++++++++++++++++++++----------
 1 file changed, 30 insertions(+), 11 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index b9c008a2ec..3525d8f7af 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -113,6 +113,14 @@ def remove_quotes(var):
     return var
=20
=20
+def sdk_name_arg(value):
+    if not value.strip():
+        raise argparse.ArgumentTypeError("SDK name is empty")
+    if os.path.basename(value) !=3D value:
+        raise argparse.ArgumentTypeError("SDK name must not contain path s=
eparators")
+    return value
+
+
 def main():
     global DEFAULT_INSTALL_DIR
     global DEFAULT_BASE_URL
@@ -175,6 +183,12 @@ def main():
                         default=3DTrue, action=3D'store_true')
     group.add_argument('-n', '--no-check', help=3D'disable checksum valida=
tion',
                         dest=3D"check", action=3D'store_false')
+    parser.add_argument('--sdk-name',
+                        type=3Dsdk_name_arg,
+                        help=3D'SDK name used in the environment setup scr=
ipt '
+                             '(e.g. "customsdk" for environment-setup-<arc=
h>-customsdk-linux). '
+                             'Defaults to "pokysdk".',
+                        default=3D'pokysdk')
     parser.add_argument('-D', '--debug', help=3D'enable debug output',
                         action=3D'store_true')
     parser.add_argument('-q', '--quiet', help=3D'print only errors',
@@ -305,17 +319,22 @@ def main():
         # Setup the environment
         logger.info("Setting up the environment")
         regex =3D re.compile(r'^(?P<export>export )?(?P<env_var>[A-Z_]+)=
=3D(?P<env_val>.+)$')
-        with open("%s/environment-setup-%s-pokysdk-linux" %
-                  (install_dir, arch), 'rb') as f:
-            for line in f:
-                match =3D regex.search(line.decode('utf-8'))
-                logger.debug("export regex: %s" % match)
-                if match:
-                    env_var =3D match.group('env_var')
-                    logger.debug("env_var: %s" % env_var)
-                    env_val =3D remove_quotes(match.group('env_val'))
-                    logger.debug("env_val: %s" % env_val)
-                    os.environ[env_var] =3D env_val
+        env_setup_script =3D os.path.join(install_dir, "environment-setup-=
%s-%s-linux" % (arch, args.sdk_name))
+        try:
+            with open(env_setup_script, 'rb') as f:
+                for line in f:
+                    match =3D regex.search(line.decode('utf-8'))
+                    logger.debug("export regex: %s" % match)
+                    if match:
+                        env_var =3D match.group('env_var')
+                        logger.debug("env_var: %s" % env_var)
+                        env_val =3D remove_quotes(match.group('env_val'))
+                        logger.debug("env_val: %s" % env_val)
+                        os.environ[env_var] =3D env_val
+        except FileNotFoundError:
+            logger.error("Environment setup script not found: %s" % env_se=
tup_script)
+            logger.error("Check that --sdk-name '%s' matches the installed=
 SDK name." % args.sdk_name)
+            return 1
=20
         # Test installation
         logger.info("Testing installation")
--=20
2.34.1


