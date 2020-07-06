Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.98])
 by mx.groups.io with SMTP id smtpd.web11.53552.1594023477375048215
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2020 01:17:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=GCKyKh9B;
 spf=pass (domain: prevas.dk, ip: 40.107.7.98, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AOg29epvSbkY2hunn+qHXJYuTfWXWsw8WKyyW5kKV9ictiymasg0M05uBRQuylQ/HmsU4sVpZUvjGtUery1adR8IXSZhR6w3x5OFOK+Gzv/5NJCVn++SIW9hua887wEjeLdvVGzMgGtFQJHUP8+1cuPGahH1dUlQyO3v6sMyRzIDdwj0rGmGOxXW+rfyKe0dXgUH8ey9v+m/XTAmjHpzqTmOQ7GNRefP+3OME6dSAdqCO2fVJgpdglFSFETVlknQ8ToruLyocwpxDd9OrinVUAEcVO7wHCSaTAQCSxWRT022bJ7z2zKsTqxbXvnzDaU58ngzbprFNWv3OQh8wKu8Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kvT+YXy8yKc/DIbT/SwaPkl2bQo0VRlNphwh0TV1ij0=;
 b=BaYChckt4DK9eTWQjcfDxP7UVAalT3xMUnjtZXE56WGvtdlfYGczk0x7vjzPuFSMuN8ixuDnvAXOSf3avs4LnFzKOwfXCbxP08OQgzZkBxCFOkCeseM6ovw8JrsdqrPSb7oxBPEpyW+9JYxCNsVIFTEoFFvzZuej1NUQVgK9WHXl6xeftTcc5yHJe4UBHsPklWQmbCKX/rUQLS9HACXq/oU4X7o/vMnh9ARqnXC0/JHckAi+QZqYq5hPjZ7CbqXKbPVXn+hvqYN6MgXE8Ck07eIfJ2cMkK9cyLZ5D4A+fraoBTBJBN3fUeYKjG+gpJunCYb9L5R1fqNyiVm3kcEXPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kvT+YXy8yKc/DIbT/SwaPkl2bQo0VRlNphwh0TV1ij0=;
 b=GCKyKh9BZrW7LbEt3mMYsOnBA62AMHftkUZvuFc0GGMJCNpKUf70vgTk+4/ZW+8fXgRo70PwFlR6N1aSgTtPcNHGPUdF6ChXqZTd7JH1ef2ZdQ/9ebihDOU8gL2xW7cMqTVE3wnYxZtdMXUPO4vhl09ajjuqcRDAaeEhF5ZFdPE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=prevas.dk;
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:3f::10)
 by AM0PR10MB2962.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15e::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.27; Mon, 6 Jul
 2020 08:17:54 +0000
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::91fd:aebc:e8cb:a663]) by AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::91fd:aebc:e8cb:a663%7]) with mapi id 15.20.3153.029; Mon, 6 Jul 2020
 08:17:54 +0000
From: "Rasmus Villemoes" <rasmus.villemoes@prevas.dk>
To: openembedded-core@lists.openembedded.org
CC: Adrian Bunk <bunk@stusta.de>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: [PATCH v2] coreutils: don't split stdbuf to own package with single-binary
Date: Mon,  6 Jul 2020 10:17:39 +0200
Message-ID: <20200706081739.8418-1-rasmus.villemoes@prevas.dk>
X-Mailer: git-send-email 2.23.0
X-ClientProxiedBy: AM0PR10CA0060.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::40) To AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:3f::10)
Return-Path: rasmus.villemoes@prevas.dk
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from prevas-ravi.prevas.se (81.216.59.226) by AM0PR10CA0060.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::40) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.23 via Frontend Transport; Mon, 6 Jul 2020 08:17:53 +0000
X-Mailer: git-send-email 2.23.0
X-Originating-IP: [81.216.59.226]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fca3499e-efce-468a-1d84-08d8218514fe
X-MS-TrafficTypeDiagnostic: AM0PR10MB2962:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM0PR10MB2962CD37546EBBF0B435188593690@AM0PR10MB2962.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 04569283F9
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DUwowqRKh02lDeAuDu1459hLNvhbCR0tcfsheIhgHtyXkCGH997+09a4L2Ze8ZGxe4jqc4E+t3tFvPQPIcCwvd1x5JPqiINMTndnHQwwoeIISH0beJdAO6s8rP5lyTcsJw5eZ9jO72jakvhqeRpZdzK/rgqpv3wZiNMfNCnqdKWyAPzKZXOwvViy8tzWFdni689DY/UEwbpz4ur5ifN5/mvgzM92GqzFvuxG3g7oQZD3ys6/2aAV1eFhpLvwuU6mVO6hxzTVFB3o225vciy+KZQoKXdQyJS+MQQMCAAVeZUEi/IVwQZUU1QT6YDPrLS9C5iqy/K/sHFllHpDxfRTIw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFTY:;SFS:(366004)(39840400004)(396003)(376002)(136003)(346002)(8676002)(6666004)(8936002)(6512007)(316002)(86362001)(36756003)(478600001)(186003)(6506007)(16526019)(26005)(2906002)(52116002)(54906003)(5660300002)(8976002)(6486002)(66946007)(4326008)(1076003)(107886003)(44832011)(83380400001)(2616005)(66476007)(6916009)(956004)(66556008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	8K4BH2vfiGvGf9RLRIXoJZV2r3sEvFqQw8fxELijwCs8dFt5rvhG2YyJ/T/oDUtFeP9+CGFzIgtXR0128DydZMEowEa/y3tj5AvCSa2YOoMlGFkSmrkpUGCa8zTaYShvH4mmxY139MGQ0KgG30nenUz4Y+j8lUh8asdr3eh0ZcmXYkpFgTLUjuqsIvAE0TWLKentTQH70Bq+hEpgJdpCWoqcZCi9R5uH9a6Ah4YGE1w8OTRC1+Yg8wEIc1Q+jmTwQa9kW/orRg2X6je+aaQplOxGfTnu7/M2QhjW7/2yqJGp9Nbm5Ch+FFegttsPDMliaHTqQrnT/QXi4aQ3SduMicvk13izEd4MvKboRiGZoPtnNw/2WwWP+ARdPYIJTblzmSgGqVJl76ck5gC9li/WYmlaofmjexA4sAaUE8gqO6oq/W7ctXMBm5gzq224I59Nv9cTrvW68f8PtwP6um1x9hgWeQ4KqRMwJ+d+yTmOiTM=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: fca3499e-efce-468a-1d84-08d8218514fe
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2020 08:17:54.1469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r+2xscCE3lx7jvZ0x4ZRyqraRjUEerjZACjxlkQOJBZcc6LXHd1gmOQLvbOx9qNmVShiCtQmB10jwDT/yPxPGVMlZD4Onx86iLY48rI6giQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB2962
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Commit 992cec44 (coreutils: Move stdbuf into an own package
coreutils-stdbuf) breaks package-qa when the single-binary
PACKAGECONFIG is used:

ERROR: coreutils-8.32-r0 do_package_qa: QA Issue: /usr/bin/stdbuf contained=
 in package coreutils-stdbuf requires /usr/bin/coreutils, but no providers =
found in RDEPENDS_coreutils-stdbuf? [file-rdeps]
ERROR: coreutils-8.32-r0 do_package_qa: QA run found fatal errors. Please c=
onsider fixing them.

With that PACKAGECONFIG, /usr/bin/stdbuf is just a simple "script"
containing the single line

  #!/usr/bin/coreutils --coreutils-prog-shebang=3Dstdbuf

Since there's no point splitting stdbuf to its own package when all
the functionality is in the single big coreutils binary anyway, fix
this by not creating the separate stdbuf package for the single-binary
case. But also make sure that the coreutils-stdbuf item always exists
so recipes can always RDEPEND on coreutils-stdbuf.

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
---
 meta/recipes-core/coreutils/coreutils_8.32.bb | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/coreutils/coreutils_8.32.bb b/meta/recipes-c=
ore/coreutils/coreutils_8.32.bb
index 2422f8634e..f8ae3fd94c 100644
--- a/meta/recipes-core/coreutils/coreutils_8.32.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.32.bb
@@ -59,9 +59,20 @@ base_bindir_progs =3D "cat chgrp chmod chown cp date dd =
echo false hostname kill l
=20
 sbindir_progs=3D "chroot"
=20
-PACKAGE_BEFORE_PN_class-target +=3D "coreutils-stdbuf"
+# Split stdbuf into its own package, so one can include
+# coreutils-stdbuf without getting the rest of coreutils, but make
+# coreutils itself pull in stdbuf, so IMAGE_INSTALL +=3D "coreutils"
+# always provides all coreutils
+PACKAGE_BEFORE_PN_class-target +=3D "${@bb.utils.contains('PACKAGECONFIG',=
 'single-binary', '', 'coreutils-stdbuf', d)}"
 FILES_coreutils-stdbuf =3D "${bindir}/stdbuf ${libdir}/coreutils/libstdbuf=
.so"
-RDEPENDS_coreutils_class-target +=3D "coreutils-stdbuf"
+RDEPENDS_coreutils_class-target +=3D "${@bb.utils.contains('PACKAGECONFIG'=
, 'single-binary', '', 'coreutils-stdbuf', d)}"
+
+# However, when the single-binary PACKAGECONFIG is used, stdbuf
+# functionality is built into the single coreutils binary, so there's
+# no point splitting /usr/bin/stdbuf to its own package. Instead, add
+# an RPROVIDE so that rdepending on coreutils-stdbuf will work
+# regardless of whether single-binary is in effect.
+RPROVIDES_coreutils +=3D "${@bb.utils.contains('PACKAGECONFIG', 'single-bi=
nary', 'coreutils-stdbuf', '', d)}"
=20
 # Let aclocal use the relative path for the m4 file rather than the
 # absolute since coreutils has a lot of m4 files, otherwise there might
--=20
2.23.0

