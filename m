Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.78])
 by mx.groups.io with SMTP id smtpd.web08.35275.1615206701771177234
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Mar 2021 04:31:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=o3XTpLqr;
 spf=pass (domain: kpit.com, ip: 40.107.139.78, mailfrom: saloni.jain@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DKtkC8ifruUUPcV1qF4x4hrhIF5wKIZwLg8btFjfO7c3+IzmtqcgZMHnzVUwsk7+hDCOTayrj0MMxQaCrQ4+52uXmobW3f4UCGFGHcR3WWFvHsIOWMicKdlMEgahxDFoZ2QDx9iAO8h3Lh7Deqr+XSXhYVVZNkvL9Mhw50IEvO/r3waFkLiwycEk1umyjpjtnVWWl1hag+lWtcxVi2lnH6JQAqNqWRTQyPf/S07FyM2rL+ijtar+cieNT+0/CxFAyHcLUa88aYsSCsIG/OuqGqVVnxF+NcgqunZ0qLbbaR2hxxrF3RTb59Tp3ke3BytayNSLMIVTHqhCkTbRH9TUcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I2g3MV0PFtB+YsWytsFRrTsV6dbm9gYacn3Z8Cj8pFA=;
 b=G5nrX84+8K0qVUoZ84nvyGSGaC0bZGng2hof+xhm77oAi0jzqVcbMPnzzgpp83JWrD0TZygLDZcv/NHVgwe/iKBgUIDbl/4cTQvs7PHekBH9UKCS8R35xZeFbA7QMztSbuPTfrUSFvDdpBhhhwbUxKRsxLxWvVWOIEXk0O4w/RDK0vfgpOqyVMzSOSaLRwpPcE1HN0jJIiV4U2V4u46OqccarjfosfG4HaFHX3PVQcOW1004PWVAhyaNLGVC4+CReinH4/0L5ad8OV4Cch2+vZEI3VKfpyfhHkOPAjoyRxH+1GFDo+/1QzM5yvL5pOum+GsQrqVBR8KPAYocB6QF6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I2g3MV0PFtB+YsWytsFRrTsV6dbm9gYacn3Z8Cj8pFA=;
 b=o3XTpLqrujHdoJNq32n+WTEIncp7LG0ZHBKZZv74o0r0BVhoWKqljaAn7XkAsf8MnwtRl57s9Jm1t0nzNAaW5NA415NEkBD/AGJVRjKT+wkIzgcLydom9x8lvja9JMjHrVz9JNuYKbqzqCPxPjztLbqJ8xQxH46cvX9GqIlTF/4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from MA1PR01MB3257.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:72::14)
 by MA1PR0101MB1157.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:2c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Mon, 8 Mar
 2021 12:31:30 +0000
Received: from MA1PR01MB3257.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::e080:2e6b:8611:6d10]) by MA1PR01MB3257.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::e080:2e6b:8611:6d10%5]) with mapi id 15.20.3890.038; Mon, 8 Mar 2021
 12:31:30 +0000
From: "saloni" <saloni.jain@kpit.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com
Subject: [meta-oe][master][dunfell][gatesgarth][PATCH] neon: use pkg-config instead of xml2-config to configure
Date: Mon,  8 Mar 2021 18:01:12 +0530
Message-Id: <20210308123112.6612-1-Saloni.Jain@kpit.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [2409:4043:514:4c26:e0f3:3269:f4b2:6535]
X-ClientProxiedBy: MAXPR0101CA0044.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:d::30) To MA1PR01MB3257.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:72::14)
Return-Path: Saloni.Jain@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2409:4043:514:4c26:e0f3:3269:f4b2:6535) by MAXPR0101CA0044.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:d::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Mon, 8 Mar 2021 12:31:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0d1d6e24-a5d1-4b80-4590-08d8e22e19ca
X-MS-TrafficTypeDiagnostic: MA1PR0101MB1157:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MA1PR0101MB1157E2A18269B3489B94110E87939@MA1PR0101MB1157.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	W9OPhbRwPdzoBTSlLV/MvVnRmyQJ3vUwR6JPmW1M0YkmrFr4MAgxMx2pUWlwITdkmcs9o9Hdk/JoxMpell15O0NMb2ZdTEExXOtetwG5QL+7D4G0SszlFYL8ItUwiilgJhYNpyzOCesW6vvujZuDGxk5e2H+LiwFNsQEOUxx/EYuTxFZEBsrGLJOWND/5PT+3FZ1pExFxyqGt2SzpGbv2p7MU0+85IauRyz6z/NV0shvip/k3+gCUTGpqDnVRyGU8DJLMyFUnHjDr4k++tRWzWs8q9J9Nx7Nstwc3pT1F6uNGm+p0XM3RkM0IyXJjfWMAv0lwupIuEHuOB4jjbkaQHldxHj10h4kEpphalfU21kyK14ynZm7CECRy6c7xv8ZxgUwqAZ16l0wlZJKhmnXkHYBfp2JswAbwL2toGr0HzcqYX8o3i4sk9ZIjmVdPrY3zyvoaHQ3kQ3Pf5qKsV+NrSUD+siYu7G9lGeC770NbycBUPADvAmLi3SuW8Qbd06hM4TRtfC3jxvfvXhI9o6pwV2DYq8RLdfRS/tX3Jrehf0425R/8/HCESbGITWoIM1blSw2h2ZcT3PpQAQZ3gHQgepK9eyAzLbXr+s04eefDSNzIA04GqrhVYUKXLxIrKOPnkNaTKD4Fd2t2N12To11DS8YV2jQFGMFJ8W+DbQA2pM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA1PR01MB3257.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(39850400004)(396003)(136003)(376002)(107886003)(86362001)(8676002)(478600001)(69590400012)(52116002)(66946007)(6486002)(6512007)(36756003)(66556008)(66476007)(2616005)(5660300002)(316002)(16526019)(2906002)(1076003)(186003)(83380400001)(4326008)(8936002)(66574015)(6506007)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?XwVQh6VJVeostrdSa364AIXMaXNdHzicyb/+zn5/0GU+KhxPGv2vbTWl7WPC?=
 =?us-ascii?Q?TtnYfIOGXv6xvrnBEjR9hWpbp2Lm4c40h5uBnOUXX4o3qwSdKSxzxofcDOxZ?=
 =?us-ascii?Q?LA9lpIP1jk226Wk1/kz07kdr/8PJN01EyzMOQ2Nw9W5wQ5pbwkxxSOOZt1kk?=
 =?us-ascii?Q?Rzpk0Pg16PFAuGZxPtefCqJlLKsef0ubpg7pSQfrbrykoeQVvXgKlfMoluyW?=
 =?us-ascii?Q?tReXv4dKZNnsS3GuMZ8X3Ptp5uykpZ5hM9ZsgQzAOantSW6IMTXy7U6nzll9?=
 =?us-ascii?Q?+pdva+RZpVD7NDqq1U9UE8EJgtntEwyTRlqvjYvBxtDN/Kh4HDb8mI79gFqp?=
 =?us-ascii?Q?tgb6FHv+cZ1uump8Iu1+z7yykkp9pR0vyt5nGCmszmoXKfdpnonWltr+uixE?=
 =?us-ascii?Q?VeV1EKsyvhh9JyV+oyFEa1oPfAuK1R1cOEzpbq7lzxuP856iIkhBaXLNy5IN?=
 =?us-ascii?Q?E11uJj9XzM/ikiaDKFISGtbSbXSOPSsRVx4hBqhQx7USjegSKRQ+LVPzYYTZ?=
 =?us-ascii?Q?9YZctQOh6l+D/yWaLUhjItLwvoz4Z9LqJFshyuqU2V8t9KN3mgiT8vopaeQP?=
 =?us-ascii?Q?ea4omQq/DfRmFnPdtoCCk+X5LPmh/2yBqYCXWE3dm12v3/D9LoIuzO/ygNsO?=
 =?us-ascii?Q?luAn1CdjhRyqTEDXf9WWXwLfQm8y5fHf+itNfa2WcjmRkZB02cz2jzW3mR+6?=
 =?us-ascii?Q?Z9lmVuCPeUNR5YxpFOS02EwrOL3XiY5N9iXI3MAynpWjA53DPJ+6PQEC99WE?=
 =?us-ascii?Q?2zt+yrc3YE+Y/YunjI+dSc8tqbDWVkEuN9tlfamJeG9WqSd28+cUov5exzka?=
 =?us-ascii?Q?uLQ2JoWtBFG4kRElyAiZ0w9iKeDEjbBijIJoqMsMY/RwLW6eNVF4H9vsJBbz?=
 =?us-ascii?Q?zH65IaJ5nOPJmUBOIGdE3kysbJ7tq+x1H6cVR8WLyfPEx0ekK8XuBOaG0qM2?=
 =?us-ascii?Q?kwyI2/znuMXDvR9sxJ0aP2BNzwikeXVPlxVFg5fzBI0b1mdozW6CgMjMU8oW?=
 =?us-ascii?Q?p2Ltdc9MFf6pH8MV5Gp3qzqTKDGsGKyT4UCSxDkIH6e5js4iALhRd4gMNU+E?=
 =?us-ascii?Q?gLGyy4gJJ5VVm4mGz00PwXN7c+QNr9HZBIzxYTIHwCkLLhrLpGiSljqJlriD?=
 =?us-ascii?Q?FS2kGNOkEB5LH60PyWGVpbS/o2RABuyjCdBokpMgeYzlVCKUnfb2vGH58JwL?=
 =?us-ascii?Q?y/Gg5Z+7MDxIO2OCPhtQ2x/a0I6nzsZUU/neMEIbQIg5m/dIfT8xtNyugUhO?=
 =?us-ascii?Q?vO1v0DUEWB2PugPNReWElNC2222JWnS2n8Aw8WmnUfwmptUiQ/P0jfaimB98?=
 =?us-ascii?Q?uJNhW8Pz8pLMLG15PAN9GiINYyq3NFmmNar9+bVHr0bPEZI5TDCjhlh1G2mk?=
 =?us-ascii?Q?WqrIs0xEAzNyM0hJKR6+os751tKg?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d1d6e24-a5d1-4b80-4590-08d8e22e19ca
X-MS-Exchange-CrossTenant-AuthSource: MA1PR01MB3257.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 12:31:30.5452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dFsc8YDH7GOOHgMIxikFziqJa2IXnAFMOFegXZ52JpfHnZF3G/8XkQ+GUY+ybbHp7o7d4Xkz7bB1a0iSDHE6Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA1PR0101MB1157
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

From: Nisha Parrakat <nisha.parrakat@kpit.com>

xml2-config is broken for neon.
if packageconfig libxml2, webdav, zlib is enabled for neon
we get the following configure error in the yocto build.

| configure: WebDAV support is enabled
| checking for xml2-config... xml2-config
| ERROR: /usr/bin/xml2-config should not be used, use an alternative such a=
s pkg-config
| ERROR: /usr/bin/xml2-config should not be used, use an alternative such a=
s pkg-config
| ERROR: /usr/bin/xml2-config should not be used, use an alternative such a=
s pkg-config
| checking libxml/xmlversion.h usability... no
| checking libxml/xmlversion.h presence... no
| checking for libxml/xmlversion.h... no
| configure: error: could not find parser.h, libxml installation problem?
| WARNING: exit code 1 from a shell command.

The patch lets configure use pkg-config

Signed-off-by: Nisha Parrakat <nisha.parrakat@kpit.com>
Signed-off-by: Saloni Jain <Saloni.Jain@kpit.com>
---
 .../neon/fix-package-check-for-libxml2.patch  | 50 +++++++++++++++++++
 meta-oe/recipes-support/neon/neon_0.30.2.bb   |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta-oe/recipes-support/neon/neon/fix-package-check-for=
-libxml2.patch

diff --git a/meta-oe/recipes-support/neon/neon/fix-package-check-for-libxml=
2.patch b/meta-oe/recipes-support/neon/neon/fix-package-check-for-libxml2.p=
atch
new file mode 100644
index 000000000..9363c6d5e
--- /dev/null
+++ b/meta-oe/recipes-support/neon/neon/fix-package-check-for-libxml2.patch
@@ -0,0 +1,50 @@
+neon: Change the neon configure to use pkg-config instead of xml2-config
+
+xml2-config is broken for neon
+if packageconfig libxml2, webdav, zlib is enabled for neon
+we get the following configure error in the yocto build
+
+| configure: WebDAV support is enabled
+| checking for xml2-config... xml2-config
+| ERROR: /usr/bin/xml2-config should not be used, use an alternative such =
as pkg-config
+| ERROR: /usr/bin/xml2-config should not be used, use an alternative such =
as pkg-config
+| ERROR: /usr/bin/xml2-config should not be used, use an alternative such =
as pkg-config
+| checking libxml/xmlversion.h usability... no
+| checking libxml/xmlversion.h presence... no
+| checking for libxml/xmlversion.h... no
+| configure: error: could not find parser.h, libxml installation problem?
+| WARNING: exit code 1 from a shell command.
+
+The patch lets configure use pkg-config
+
+Upstream-Status: inappropriate
+(Upstream suggests to use latest 0.31 as per the discussion
+https://github.com/notroj/neon/discussions/47)
+
+Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
+--- a/macros/neon-xml-parser.m4        2008-07-19 23:52:35.000000000 +0200
++++ b/macros/neon-xml-parser.m4        2021-02-15 23:56:59.202751257 +0100
+@@ -44,17 +44,17 @@
+
+ dnl Find libxml2: run $1 if found, else $2
+ AC_DEFUN([NE_XML_LIBXML2], [
+-AC_CHECK_PROG(XML2_CONFIG, xml2-config, xml2-config)
++AC_CHECK_PROG(XML2_CONFIG, pkg-config, pkg-config)
+ if test -n "$XML2_CONFIG"; then
+-    neon_xml_parser_message=3D"libxml `$XML2_CONFIG --version`"
+     AC_DEFINE(HAVE_LIBXML, 1, [Define if you have libxml])
+-    # xml2-config in some versions erroneously includes -I/include
+-    # in the --cflags output.
+-    CPPFLAGS=3D"$CPPFLAGS `$XML2_CONFIG --cflags | sed 's| -I/include||g'=
`"
+-    NEON_LIBS=3D"$NEON_LIBS `$XML2_CONFIG --libs | sed 's|-L/usr/lib ||g'=
`"
++    PKG_CHECK_MODULES(XML, libxml-2.0 >=3D 2.4)
++    AC_MSG_NOTICE([libxmlfound CFlags : , ${XML_CFLAGS}])
++    CPPFLAGS=3D"$CPPFLAGS ${XML_CFLAGS}"
++    NEON_LIBS=3D"$NEON_LIBS ${XML_LIBS}"
+     AC_CHECK_HEADERS(libxml/xmlversion.h libxml/parser.h,,[
+       AC_MSG_ERROR([could not find parser.h, libxml installation problem?=
])])
+     neon_xml_parser=3Dlibxml2
++    neon_xml_parser_message=3D"libxml2"
+ else
+     $1
+ fi
diff --git a/meta-oe/recipes-support/neon/neon_0.30.2.bb b/meta-oe/recipes-=
support/neon/neon_0.30.2.bb
index 00b79f633..63676a98b 100644
--- a/meta-oe/recipes-support/neon/neon_0.30.2.bb
+++ b/meta-oe/recipes-support/neon/neon_0.30.2.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM =3D "file://src/COPYING.LIB;md5=3Df30a9716=
ef3762e3467a2f62bf790f0a

 SRC_URI =3D "${DEBIAN_MIRROR}/main/n/neon27/neon27_${PV}.orig.tar.gz \
            file://pkgconfig.patch \
+           file://fix-package-check-for-libxml2.patch \
           "

 SRC_URI[md5sum] =3D "e28d77bf14032d7f5046b3930704ef41"
--
2.17.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.
