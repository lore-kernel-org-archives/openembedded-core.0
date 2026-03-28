Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1785310D1483
	for <webhook@archiver.kernel.org>; Sat, 28 Mar 2026 21:04:29 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.82])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18862.1774731867483744670
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Mar 2026 14:04:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=zOcq3zi7;
 spf=pass (domain: navimatix.de, ip: 52.101.66.82, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n7tel454Lic+SEDRYNM8e+f8d7A352Y72eKmZmzHuiLpWYzK1RiWdunBoidZM2NhutAtFLrcTt9V3Jqj/iTU/q8vdlicn6e/LnJjC51vwd5qC1env1VzrXSQGT8d93BCfyZtVWfRzgxGP7KExcJ3XRLHC/kt0OTYlJ2N4I+NmNosgR8HrXe5lytiAtlZ0kaKiogaRLd1zyjLW40g6W/BGlPBkwNI6zbhxNYlD+tkXg1zJtMXVQpkVI2T+qvMiwV4XlcOp9RDAemJDynP/2zmDy8LDeytQYkhwfXYz8SQxNZ5jvJv5bGO9FKwiBM0Vg0z+0vz5NeB9njqwnOMHXWeuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BJqCLP4/5qnuarfaGjAklXK3r++llERPZkgejIqliz0=;
 b=nlyxRAx/NdUEkG7R2HO9B6XVSyAe14UbyNZ9q25LAcB8jsnDTzmjL4e4daZGfxnkwdfVRpCNYEOHJLzPf/aMRag8HxcmqubOBrckVbcpEMalj58ulwvObZdQTIsTyQc4xd/1HFv/ECgxA53AbrgnCRUHnkCGtCepfNQmca72HsS2QpuB22LYbxWc2Smv6dDrhcNQEcMPATvOJ23l3EUhwY0oWDYsSwRVAESibl9hT54x1sZ9cv6/OVoUDZ2OPGvuqdh4F6fwVtuC3Y9HWI221GBvtz8BMbqkQ3sTDKwL5NshnoSREdV0c6eCmsexruoDz/s7n4AQ+wNxf93Dw7HSyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BJqCLP4/5qnuarfaGjAklXK3r++llERPZkgejIqliz0=;
 b=zOcq3zi7AlcQ2pxO4XUVCKR1/F5Wj1eSrznQVTi5EzD0ebTAnOUDndRAzlvcRacBmKkwrCVYFkqrHIPA8r/si8su/L/AUN6mPALYsOaqFLyv+Xiv0ilUN+UfMSZFlrMCv2JjWNnM1cxaw9ia+/z86cz7UzWEjZKzXEMOPASe9Rg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by GV1PR01MB10614.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:165::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.22; Sat, 28 Mar
 2026 21:04:19 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.20.9745.023; Sat, 28 Mar 2026 21:04:19 +0000
Date: Sat, 28 Mar 2026 22:04:18 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH v2] icu: Workaround buildpaths QA check, if TMPDIR is
 /build/tmp
Message-ID: <6401da269fe72dc465d76c60f7ae5fd6eff27652.1774731856.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
References: <3AEC70CD-51C9-41EB-9E7B-1619C424A1B7@arm.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <3AEC70CD-51C9-41EB-9E7B-1619C424A1B7@arm.com>
X-ClientProxiedBy: BE1P281CA0167.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:66::17) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|GV1PR01MB10614:EE_
X-MS-Office365-Filtering-Correlation-Id: cf0a391f-fc66-477e-5702-08de8d0d9428
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	5qnbJCl/8Zjr5EF3BNxFZ2/2mmrh/uQCRAi/Q7D+2smIcbHj5k7kMO88rboxCxTAQu1xi4Gn7nj2mHQDZeVwW1kYNJWlBbTVtBwb/tFOb/kpxvPl4EK5hKVXoZvS1Ddl15H6z0x8A4Ug13uSXHGSJ5nhVcW8fjhxHbmR1LFI+64telUeOyxhJhmtbTEXJ4XVQ62/grd/XPchxxW7g1bXqYe9p6Xl+kQ+gzXMD/3cOmwW/9pnsxjXS2s8k7IYxutwCqjlZ/yGHet5y8fgct4JwupGzQqwbDvt7pP/E3cqSqGbR7nAZYxKWyvtXxsiB0W49hvGYRnzFgcuF8TLXJUwkCjFbty+1iLcU/D5Unu8vWXJMg3k4EhBCt8O+eHpO8d/B05jAavhsH+YyUaCy5Rg3KuERMmOy14p4NcqgchsPNwVKxmPMypwHm365tgsl3SmYpy6NEHKq2iK6XUqI/Qj3MkUqDxt40vzuyiArkaEaoxIOJFzGLWTg6GOzBUY6qetS4WTAYedlcSmrsrUwDcTGASDKei4CuJBzoU55QYH9yaDubGTCMlATbKJjxfRv5GeBSZNPXbBAHwle2tgtr6jgs6BR3NsPb9Z1N1afGTzTej7kayc9YcdlqP4jVsXlOMjoVc4s+Op1dU6Sn76Ms2M+0h8oS7MGuJSQA5/PGo5oO2UbqcWPJ+4sI626z9ggM7wUAca0AkGBkACeSeOvU6qkSmELy8LhthQ+iutv95EoSg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wYxQY9FIkZmfNMoFpp1xyzPMDB3u9etPzh+aTPkYmWER/vWNEAgHhPy9h0bI?=
 =?us-ascii?Q?kSTqX1ED55c3NMbvFp9PsYt7EqzRMoBsg+K4Riv7/bJgMfui9K269AmM7J1e?=
 =?us-ascii?Q?oa2esfZi3pcNw8KvZOu6U22ZKuVowM+zNa+Cf5Jocmtz6lVxFSQiaw/CjhsJ?=
 =?us-ascii?Q?K2b78sjDze0pSQ1nWsUlyL6bPnL4+WwHFoR3JYNbAFv/iFdGz8ARDqFLdcT8?=
 =?us-ascii?Q?39caw7VcNm+HzpI+L9qbLFBE5VsUrL61CqQRTEBWgr8vRMcQSaR4G+ATeDKc?=
 =?us-ascii?Q?7zFiypukIv2AlkKlwf5y/Q0IZ4ipDt3mbxlQT4qomga5VFd7OiRX1DOYUMiV?=
 =?us-ascii?Q?zSFExdsZMSFA3nEMTmd32wMa89YQkIbVCE0T8P1yLR7s4RsjZ8+i0CAKY+Wo?=
 =?us-ascii?Q?LIYgE/Q+rYZq00JNZewgf00eFPAP2kQrB1akQr7YSbjDatCapIbqJ/HjJKyM?=
 =?us-ascii?Q?BCu5djUdyK9c5U6nJI70XwajbbxNp7USa3Wi6LxxD68ly3M07mqtdIC+WtqA?=
 =?us-ascii?Q?5YOJXObxrVPiqNJDY9+hx7sSfYoT7uL+PGKmvHsjDv6WvUamptJBcRbBNU30?=
 =?us-ascii?Q?cuHaEI3cPJOcCzcv0OZI722P/vt+sGl2hmCTmcCqmXmIU2GsGz6ANrG5KZEF?=
 =?us-ascii?Q?/SwMDA6P+2eZcEyJhpWKEOuuCTgIgsaYp2ecUAclFAvPPLJDzSXvRBB2J2fy?=
 =?us-ascii?Q?TpumcRR1rviIgFDGfIq8HOudmFURHNQN+srMcDRYUZwps4ELI0kW65DnR7Hl?=
 =?us-ascii?Q?lomD8g0h2FpbF8ERjo3yGoTWO32g74aYZo+Dnk/+0ANR16I678/E1cPQlb4Y?=
 =?us-ascii?Q?cSuSwatLVAtme21SYGAD1OUDVXfcHv8cBOCP3wV/IydUbcbZIiYxbxHYWkFh?=
 =?us-ascii?Q?xbZZgjJfUjtDWiXyl987k/9DDldgsUutyFJvhXrr78qHjy6v9A0M6Midu9w+?=
 =?us-ascii?Q?cjXNHBq6An7p1bUjQ534uLt0S3v9R5UIPN8g2bGi7YxLTr/N8jVyS7vW1S78?=
 =?us-ascii?Q?4r4Qrs/hlXvO5N+JE1oryzCss/whSalgdeAYbt6O4IS0k8cTVyG/5UluxT7C?=
 =?us-ascii?Q?YpwPduPl8dDnKVUs7QDoBTnvLVM1PRZpaMA32WYkK6GLek8JIzfH+NxiTbOM?=
 =?us-ascii?Q?iC1FoVTv3lGtAzP5E6VsNiqfA1p/sUpGtmqMFq17Lb0VgMWgku/LEV8a+uax?=
 =?us-ascii?Q?PITnEqviU3GRL1eIFxw5X7PZ5ivjSy0A7ynoSMV3WXBj4ZKZqF1ZWTaIUkL7?=
 =?us-ascii?Q?zDdozVDlErPPK3p1lsZUHGixqtbft3tFAhp3Qd8zVXZKvMLL91CRTWdp3VcN?=
 =?us-ascii?Q?wRGzV8+wpwfFwJYyT9eZlobiGVeb1xls87oNIpxyOaDqFr0MCyk6Ygskccce?=
 =?us-ascii?Q?YRweH0Gy7IxooBMUhtwiikFjJhIJRl/3uI0tLrr5KqTW21RZstQe7uVlE1Dl?=
 =?us-ascii?Q?hIi3MJtZRPel7+HjHkwmLatbdswhxU5TacAleDjKhZKEFAorUi2PvO6F+4hv?=
 =?us-ascii?Q?w4aUi3LhVrNxylFgSS3k1xEcS/rPQvB7DYmTpl9IZn1w+QRdyxCYFlL3pezR?=
 =?us-ascii?Q?J/IqRzf/+ipAvTMCvDSWE9FbAx/inQbIBtX3imWIwAl3TWdOnsQ1/po/Mqo2?=
 =?us-ascii?Q?FD5klJ2kg/q/eb0GEtbGy04dR0pD/WiJoBkRK5KtEoUstOGI8vMalHrVlFuV?=
 =?us-ascii?Q?SnVB8tNIjdeGClPP9zrBOo6tfuH5hWammI4WuYkk4Sry6Wr8lnTZvjngUfWr?=
 =?us-ascii?Q?JdZD1pdk20gTIGE3+97vG6c4eYgywlI=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: cf0a391f-fc66-477e-5702-08de8d0d9428
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2026 21:04:19.4121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FxfY6o64zWHmiruUM/4nKBIYbPmhhtDJU9jrM8rNfGbHFMIRm4lLrc5ejeBRoluJ0j+tyU4L72YNhP6eAVzvTlW2h7olqF82BxEXmoF0zRQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR01MB10614
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 Mar 2026 21:04:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234133

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

The file udatatst.c really contains the string /build/tmp. When building
with kas-container the build directory is /build and hence the TMPDIR
becomes /build/tmp. This triggers the QA check *buildpaths*. To work around
this, slightly modify the string in the source code.

% grep -n -C2 /build/tmp source/test/cintltst/udatatst.c
136-    char* path=3D(char*)malloc(sizeof(char) * (strlen(ctest_dataOutDir(=
))
137-                                           + strlen(U_ICUDATA_NAME)
138:                                           + strlen("/build/tmp/..")+1 =
) );
139-
140-    char        *icuDataFilePath =3D 0;

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 .../icu/icu/mangle-build-tmp.patch            | 32 +++++++++++++++++++
 meta/recipes-support/icu/icu_78.3.bb          |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-support/icu/icu/mangle-build-tmp.patch

diff --git a/meta/recipes-support/icu/icu/mangle-build-tmp.patch b/meta/rec=
ipes-support/icu/icu/mangle-build-tmp.patch
new file mode 100644
index 0000000000..cf24e53b88
--- /dev/null
+++ b/meta/recipes-support/icu/icu/mangle-build-tmp.patch
@@ -0,0 +1,32 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?J=3DC3=3DB6rg=3D20Sommer?=3D <joerg.sommer@navimatix.de>
+Date: Sat, 28 Mar 2026 20:29:53 +0100
+Subject: [PATCH] test/udatatst: Mangle /build/tmp
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+This string matches $TMPDIR (in a kas-container) which triggers the QA
+check buildpaths:
+
+ERROR: icu-78.2-r0 do_package_qa: QA Issue: File /usr/src/debug/icu/78.2/t=
est/cintltst/udatatst.c in package icu-src contains reference to TMPDIR [bu=
ildpaths]=20
+
+Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
+---
+Upstream-Status: Inappropriate [This QA check collision of Yocto specific]
+
+ test/cintltst/udatatst.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/test/cintltst/udatatst.c b/test/cintltst/udatatst.c
+index 003d7d4..7175725 100644
+--- a/test/cintltst/udatatst.c
++++ b/test/cintltst/udatatst.c
+@@ -135,7 +135,7 @@ static void TestUDataOpen(void){
+=20
+     char* path=3D(char*)malloc(sizeof(char) * (strlen(ctest_dataOutDir())
+                                            + strlen(U_ICUDATA_NAME)
+-                                           + strlen("/build/tmp/..")+1 ) =
);
++                                           + strlen("/""build/tmp/..")+1 =
) );
+=20
+     char        *icuDataFilePath =3D 0;
+    =20
diff --git a/meta/recipes-support/icu/icu_78.3.bb b/meta/recipes-support/ic=
u/icu_78.3.bb
index 367e2641e7..ad920f3ef4 100644
--- a/meta/recipes-support/icu/icu_78.3.bb
+++ b/meta/recipes-support/icu/icu_78.3.bb
@@ -111,6 +111,7 @@ SRC_URI =3D "${BASE_SRC_URI};name=3Dcode \
            file://0001-test-Add-support-ptest.patch \
            file://run-ptest \
            file://0001-Make-ICU-test-output-compatible-with-Automake-forma=
t.patch \
+           file://mangle-build-tmp.patch \
           "
=20
 SRC_URI:append:class-target =3D "\
--=20
2.53.0


