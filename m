Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94640C433EF
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 16:39:37 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (EUR02-AM5-obe.outbound.protection.outlook.com [40.92.67.50])
 by mx.groups.io with SMTP id smtpd.web08.28226.1639499976133243957
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Dec 2021 08:39:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com
 header.s=selector1 header.b=kht4GTwz;
 spf=pass (domain: outlook.com, ip: 40.92.67.50,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VJ1x1y6oKri2pzKicpLRMKW+U1r3mDi6JJME857nt/+9+8OXYrkZp5CYyAjM1v4hNJduMyOpmU3dcU8/jHq3Q32xgKH4OqWpxZDZ+fK3dgIMonxg0E+6itP5uq1afC4DWdMuuxp3QIOWZ7GG/xtq+KRxESaD1iiez/4J0hko+T3tlSYcyaYMRJg69AioS+nir/ZqbCpj7iD8K6mq6SVbO+t6HC4nZCHq4cGkdmN9vjUi4TpLpFeYtJ5Hwot0bmkLnvNaIt9+9KYNeyhN61+NNmgfMZP/qsYr5Tt5YtUzvy+5k2mk8PdFNUcfdDzI+Q7i5XQCioThxXWhCubQTCY1fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+l7VRLvILogBsJsXr8trKO1/aTWBmx7sLLnuxwLmj8M=;
 b=nD/0DPZtT6FYvXhSPDY1xS+enmGblfwr9j9wEKtwdeXdWJjR67NLAetG9OkecgYkfrPFoiFn4khkWiXJbmYQVvStzajOLncDDFqVdli68xJERXP1cNR+xTDhkHuUggOjghHQlp+kbW1T6K6c86H63odnoy3DM0MVyE2u+REZMBIcBIxvVRUJXW0WD6Ga/QRLhP+NdNy9yqmKx5QuzZUb6VY/sjWtBf3rH17CsAMLDGSW7JMI+k6y9TUAmsum2BIwH9enNmmeHqpVnhiJnyDGDpWzXH1alaeU7mFyaK4ZbevFQEXmzgLgZT6M4JjP6rvcUaufB89Zza7A9lk8LyGtHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+l7VRLvILogBsJsXr8trKO1/aTWBmx7sLLnuxwLmj8M=;
 b=kht4GTwz8X1oyH6z+fD5TzIkclalw6AYxKEwuGKmMbZw1WdE3/xZJ29fnVka9oW66u0DxKEv33GrLOZNhvoAAqfxFsGlo65bgh6Q6S2RWLFfvHoPBpG3V1A8Hq+R3fSzrwACYphlIZs2plDrLl0AvVc1/ZDNDY+M6MXNR7v1Ne3mTm//0vDZYeqebkspY0pzgrItpkdRJ8D8wOJ/uMyUEx/BVWPZJKiKMsSeJmmM1qSdUmkhCrCAAVa1mIMHu240V/ST+pHdbQn/NDU6EddsvIwryewQxeDYs1c0ow1BNOz9EmJqzur8tlTBTPj4fajRVPnPUpHRMWg/C8/9kUSBmg==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM0PR09MB4291.eurprd09.prod.outlook.com (2603:10a6:20b:168::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Tue, 14 Dec
 2021 16:39:34 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::782f:9964:348b:b2fa]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::782f:9964:348b:b2fa%9]) with mapi id 15.20.4801.014; Tue, 14 Dec 2021
 16:39:34 +0000
From: Konrad Weihmann <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [meta-oe][PATCH v2 1/2] insane: move src-uri-bad checks to unpack
 stage
Date: Tue, 14 Dec 2021 17:39:20 +0100
Message-ID: 
 <AM9PR09MB46428ABA5E7BF994C45CB7BBA8759@AM9PR09MB4642.eurprd09.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-TMN: [pA5KEkpFc1tVqwi7kweFRzFgwFN+D/9U/FtGuYXzNrd5Mlvoyp82KWo7MCv7nCn5]
X-ClientProxiedBy: AM3PR07CA0146.eurprd07.prod.outlook.com
 (2603:10a6:207:8::32) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <20211214163921.1839963-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8151fde7-3b27-4b5c-5dd4-08d9bf204f3b
X-MS-Exchange-SLBlob-MailProps: 
	tBYDyRQCPclxISl++lM8ZOjhKIfmIxnlmO8PsZs66BeaJLN4Rj0cD4lC6t8Y+wJcuAWLQzdESZ+/pc1wV0/8khcPgop9TKYKy/+RwKtLYHmF6p1uVOYlEyrkXlrbOoAdpLlMeUHfTVeBd+Zbyi4KWzuc70LqtN/EFdf0CXwTywDtsVbwQzQ1tTFwUVp3I3XDg5wuozMKbyWe6C7OXe0p7NfHIHuUkAWTJNkKn94MftEQbSClF5iPURajDTD9WBAbXtGoni1NYTxBY026bVhQlTt0R/rFucKeA0/s6OxxpgRlClIP477x5VTXFV7VQTADc5lrkgcMqzRmmGoOK2UIARPTF1mGmg55DjQSzpJ+8ItRxMsf/GZznhEC68ytNSi8XM4/p3jsv4pdDQux0ofyhSqtU1sr4+zQEA1JEkDG5kTHmnhbRhlOhgPTSpu73sRi46Kr9jlszOcgRdvY7qacCGz31Ha0xxDnePPtqnBT27xeQnWTcSaPFExeIoP1dL9b7oOR42D3xwLBhCuByq2T97mgX4qjoCS+ZcdncDMfPH34j6G8pNmQ24WWNtZhBHYSBmSUzlI/c0ieWoySImVtIavsArE+HMl6NTmr8QwL06yaBNByLgAjwn4cD++xw4j+F1QaukpnAaG9qnU3vZtYGD0P86fdijxAmOlfvfk37GywkpjyI8c2nsLya4EOjQBKTuerAe1GzbHGhsNWgdzt+50hzvfSwOSFDnL72P68guR46r0bEoynC8x2qLxLzOueA/r/kR3pu10=
X-MS-TrafficTypeDiagnostic: AM0PR09MB4291:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bF0aa5e3ciX/ykDGlyDjiyGyqHmuR6UzV9BeNfuNfY0WwCJjTw9jQbYavhnJPC50QPYn9WaI2dPBydAIHNE6n7zdq5YOH5Ap48rcD85UGa0VYTbB2AkBBmUI7Q7xrhY0lyjNvp4X5Z2L4HaI5xVcUFLVTKb69JT10+IgwKFItyeo8eMuyhoA2Ahkakfq39t6r1tmiJdFGGmt7QYL1HmI2LG9Oqj45ePduD6onX76OHdDv8QaZZY04xGeRma/ngaNpuXThYijhhNDXSB+Q5kZATwGgX3NDgtjqejrH3b/SlDVnrfP8jwLkHvhfmv6Dx+C42rG+NA5Wf4w6LtuJ5cSaGzkOEsW/3woteASxdruk8te4gIlrSlA/6TXVXyMGOxnNfXM9tKo7TQdr/BX4wyGyZ2sDnhMDLTEPz+CyzKMMzuOhGo/DavdIe773rFsXVIryhvtriSdW3OVQP52TsuYDkpcmA1nLPdiinbHRspF/l096dyGPAAdB+9LRQChqc2i0p8F9PX5BMS9nqK/+yUqbdaYmDkFrnzPJJzp/151NHMl8BDoReBTigLd1KzPRJa3uLgnhd/jp9CKGbGPCsW7ZQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XDRdJCWj5Q48slNqhkLHGx/Jd+WS5oWlbUbtxj+drMDKXLWz65x65ex7REQu?=
 =?us-ascii?Q?TTj0UikdJRSzvPdU669vMAeW0i2PzR4xx8rF0m7uN/m3tusHelG/3sasugWw?=
 =?us-ascii?Q?ElrYi1pFB+bVbHRZd+A951G1LVNGvtyF0yvA79DLeNs+0Ol4PZkrqav1N5jc?=
 =?us-ascii?Q?8jYrLrPYRhNbehWXeBzGib8G+hCkZ+EfxtQHCmmaWeTbuVarelnP+1rHbXS3?=
 =?us-ascii?Q?2HkJvtInco06ot+4O5/zctKZHqNApl2+T48wZTMSd1gznsdv3Z6jLCkC42RT?=
 =?us-ascii?Q?IQDRrKB78ZrsrxKeOyxnmV/kefhSFZDupl7QQtsBYYxaeL4kH0+eKuQ9R4bi?=
 =?us-ascii?Q?XrRcoCbi75etgUSLn0RL8FW4/tEkmKhoWGv8d8+l07v740Ust7dv/KiKzr6q?=
 =?us-ascii?Q?KNDvZPGfRi7a8beuMHK4g12YKWTgh5I2lhPVjThSN1r2Nwi0QssXIM+cOExT?=
 =?us-ascii?Q?O8LCPJ+/bq9bADtUXbiBbpFh/CX5YaqprPLYaIlKKDuYmdh6LExZHm4fiKb4?=
 =?us-ascii?Q?rIAKI+BH83g/Dta3GnLDSCHyi/uw4MUsJzNuZlN7LGB0rPSS49VzXKO12rEJ?=
 =?us-ascii?Q?hCJzDSUfrs/HelqArFLuU+03g+I5qWeOPvDV05ItMGEMHet6tyJrt1ZwIrFa?=
 =?us-ascii?Q?+UoZRs562ty+Kvt1Dk4mZt2cjvYqMNzckHlu7ui0ymDdYNS88ovrXeD/+cti?=
 =?us-ascii?Q?7gTEmQT/rk99nzYpU0clwu/0W6yXoqwTrtgNC4zHCzbt24n3PspOr44VoIJr?=
 =?us-ascii?Q?HNTxTPLAOqAbiEWNnqmZdisanmprH87nwukMd7RoPyiNH4TqHZrma30wJeNx?=
 =?us-ascii?Q?Hkf+NpaGlhDYwr081U9O2yexR4d1ItCCw8LtlE0HK+Tk2lbHt3XhEZdoDK4U?=
 =?us-ascii?Q?/QgZXm2QNcJIB45fVYvKuVq6ZjJJ9SjbGVMADr0WyMnnwxvrCj79vQG3eErS?=
 =?us-ascii?Q?qI3FHInrZt1m36KWKKDwzsgqLO/usBsePUKd4DGp3nq0bi90WkriygifXedw?=
 =?us-ascii?Q?etRjH2KEeDVDw85GWgJ6r+42RA=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8151fde7-3b27-4b5c-5dd4-08d9bf204f3b
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 16:39:34.0972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB4291
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Dec 2021 16:39:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159697

previously used package_qa_check_src_uri was triggered during
package_qa stage, which implies having packages.
This isn't the case for native-only recipes or recipe that inherit
nopackages.

Still the checks performed (src-uri-bad) apply to those as well.
Therefore move the check from package_qa stage to unpack stage.

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/classes/insane.bbclass | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 240f3aad62..125c339942 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -968,17 +968,6 @@ def package_qa_check_host_user(path, name, d, elf, mes=
sages):
             return False
     return True
=20
-QARECIPETEST[src-uri-bad] =3D "package_qa_check_src_uri"
-def package_qa_check_src_uri(pn, d, messages):
-    import re
-
-    if "${PN}" in d.getVar("SRC_URI", False):
-        oe.qa.handle_error("src-uri-bad", "%s: SRC_URI uses PN not BPN" % =
pn, d)
-
-    for url in d.getVar("SRC_URI").split():
-        if re.search(r"git(hu|la)b\.com/.+/.+/archive/.+", url):
-            oe.qa.handle_error("src-uri-bad", "%s: SRC_URI uses unstable G=
itHub/GitLab archives, convert recipe to use git protocol" % pn, d)
-
 QARECIPETEST[unhandled-features-check] =3D "package_qa_check_unhandled_fea=
tures_check"
 def package_qa_check_unhandled_features_check(pn, d, messages):
     if not bb.data.inherits_class('features_check', d):
@@ -1285,11 +1274,28 @@ Rerun configure task after fixing this."""
     oe.qa.exit_if_errors(d)
 }
=20
+def unpack_check_src_uri(pn, d):
+    import re
+
+    skip =3D (d.getVar('INSANE_SKIP') or "").split()
+    if 'src-uri-bad' in skip:
+        bb.note("Recipe %s skipping qa checking: src-uri-bad" % d.getVar('=
PN'))
+        return
+
+    if "${PN}" in d.getVar("SRC_URI", False):
+        oe.qa.handle_error("src-uri-bad", "%s: SRC_URI uses PN not BPN" % =
pn, d)
+
+    for url in d.getVar("SRC_URI").split():
+        if re.search(r"git(hu|la)b\.com/.+/.+/archive/.+", url):
+            oe.qa.handle_error("src-uri-bad", "%s: SRC_URI uses unstable G=
itHub/GitLab archives, convert recipe to use git protocol" % pn, d)
+
 python do_qa_unpack() {
     src_uri =3D d.getVar('SRC_URI')
     s_dir =3D d.getVar('S')
     if src_uri and not os.path.exists(s_dir):
         bb.warn('%s: the directory %s (%s) pointed to by the S variable do=
esn\'t exist - please set S within the recipe to point to where the source =
has been unpacked to' % (d.getVar('PN'), d.getVar('S', False), s_dir))
+
+    unpack_check_src_uri(d.getVar('PN'), d)
 }
=20
 # The Staging Func, to check all staging
--=20
2.25.1


