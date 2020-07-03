Received: from EUR02-HE1-obe.outbound.protection.outlook.com (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.97])
 by mx.groups.io with SMTP id smtpd.web11.5766.1593761802198956519
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2020 00:36:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=XaPsoCjU;
 spf=pass (domain: prevas.dk, ip: 40.107.1.97, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oLrEIM0h+rauVXJubRBYsTiXk4iKaN3d0dnHhNONZkjwkKyI+4tOp/UEnLLzfS4zvciBgjkUNriz7x8RbIhPcQhYiuT8+wgUeQkiOA9gmBpnAP7IojreWwvVxGFgo0OZNLQzO3AWqGvf4kmee4aGY1khb/LBhByw8JgXzKpup/14F9NMUICf1C+MB8xMFy+aJlo+BLM0kHFqfHihiga/EsnphZ776T75DLuHoda3VKmrwC6zilEZs/zMXznvhUTSAzbp+MDqjSe7826PVstSfKQ4gTckQB98XyVhatTG33c6AgIyWt9Qgll1FTulYdXAYTn0OzTwL9Z+ngyz+ikOeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RgFAJPdrmgPiWwfrjvELNfoBDdIVrrbd/1Yrcsua/jg=;
 b=M2UxsvX7HXYA8guYaEChscHIJypgGORmZcbBcakKRSfVR1MmSHp7lITP8pLo1v6v8BDorjusbJElMW7sQ2mPhCHQXgZOmqKKsvDWmTGgj19qsn8/7TDkQ9FqZSP4mfuYaHAmgutcw55q0DMMKbPs3ljQ5DFekasKwW8Nu9Snmb/chDVfExes/8KLe+3nWlxHDlximVJSKurgCy39Cxz2COlAHy9SNOaYzxOJEz/6xeggrZx2bORyHHEzdOgAzmoq7Uca4EWWx1guDcyW1woMjj5gSsNE7noebtkfVIpsXqSPUMVCTexYyGm4Cm05RQSaC8NRTYbaSY8T2XsfY5r52A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RgFAJPdrmgPiWwfrjvELNfoBDdIVrrbd/1Yrcsua/jg=;
 b=XaPsoCjUJElva3aPJ7TWxvvo0u3pLvdDNF71kl2CWdZ10JJUe2LdvJPBFEjtLgLt0pmqgIG5Lo8CpmwU1lIHB9GwQ2DfrT31lAHprtburrifsLeLmeCZBxAafCx3bp9zVaj/TfpazcvQIvWzo2ViHMPP5zS5skL+ynPE54nrcAw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=prevas.dk;
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:3f::10)
 by AM0PR10MB3586.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:157::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.21; Fri, 3 Jul
 2020 07:36:39 +0000
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::91fd:aebc:e8cb:a663]) by AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::91fd:aebc:e8cb:a663%7]) with mapi id 15.20.3153.023; Fri, 3 Jul 2020
 07:36:39 +0000
From: "Rasmus Villemoes" <rasmus.villemoes@prevas.dk>
To: openembedded-core@lists.openembedded.org
CC: Adrian Bunk <bunk@stusta.de>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: [PATCH][dunfell] coreutils: don't split stdbuf to own package with single-binary
Date: Fri,  3 Jul 2020 09:36:31 +0200
Message-ID: <20200703073631.16530-1-rasmus.villemoes@prevas.dk>
X-Mailer: git-send-email 2.23.0
X-ClientProxiedBy: AM0PR10CA0042.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::22) To AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:3f::10)
Return-Path: rasmus.villemoes@prevas.dk
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from prevas-ravi.prevas.se (81.216.59.226) by AM0PR10CA0042.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.23 via Frontend Transport; Fri, 3 Jul 2020 07:36:38 +0000
X-Mailer: git-send-email 2.23.0
X-Originating-IP: [81.216.59.226]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cf1d61cc-1ec1-41ad-7077-08d81f23d272
X-MS-TrafficTypeDiagnostic: AM0PR10MB3586:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM0PR10MB358654227B1646891C905B9E936A0@AM0PR10MB3586.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 045315E1EE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cIXuFpctX7uv9sKWUSgUuCoGr2kGjnGr5lXN4IisnLmPO3VJHrsH3BzuP8kyMdKANz7BKLbKpc+fmTxS6aYoffbSHDmNGkLeqj4aEOkM6S0GRSCzh86/wqI54YfTfFdgl7ZMP7l+KxS5iI3HhfqzU0QMTZYvkPetjkDkVDXAH+7kvTWgrAm1jwM0dcXqeJv+FEka4kaesavuTryYImlOf6J83qBjoC0ttnrbQprvlF3GkZK8Fsalr0IjRf/OnWfqztJ/UKWF15if7Gc3ZYkpg/lY/NkZCLqziRKjw4KpVVlWh+J7XoaEr/EvvHPHePvc/qDFe05Ti0QFM8cS/xvScQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFTY:;SFS:(346002)(376002)(39840400004)(136003)(366004)(396003)(16526019)(6512007)(5660300002)(26005)(36756003)(186003)(2906002)(83380400001)(66946007)(66556008)(6486002)(54906003)(66476007)(4326008)(316002)(478600001)(6506007)(2616005)(956004)(6666004)(8936002)(52116002)(6916009)(86362001)(1076003)(8976002)(44832011)(8676002)(107886003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	rjcVzQhQEH0TXJrhd2YsUJffPcPRQIHKjxDzqxiMwMJO8wvSTzFNfj0t3j5poa1TNste9YcI16JpvPBhCawe6XDAbiYLdlTNSXzinI77I5SJcpyO4w9PQHtWK8mRhjjbI6ZFiIg0+tBB3jwM10IdG8QhuisjQiCRq2CrFCKMIER1id3kann4jbFg3xunC+6QWC9HBoxGm7uFsdl/N+zbxPxOi1qflk3a+TkCirGwFlz1Vigtetk644gboeLXa6Ww6n9m7LHuRD/heWifEZ1bUB23vbFY4ET7VgB6jdOrQ+JtsHCXL23+bpnu+ka09cOC2H6T3Agq0+qY8urPFYcZRZKQsW4VlW/4sRZM1E9Sg0Ie6QjgEsSgf4mLghEq4lRVs9NjAH8+L7HRex2VXeKoU9uBe7vwvdYzhKMQFhxmqFipgu9Ly1nLAXKD1aWzIIRXLrGpOBP1GaP+ZnR/VEUWB47irm/WQQCSEAnuhhG/8z8=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: cf1d61cc-1ec1-41ad-7077-08d81f23d272
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2020 07:36:38.9655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G7ktYE+UNaCDxrBwU8H4k27gL3BKkvWUiacGRspnF7ezAv+NuJiRdn93JcwxVdlgFqJflPkKRLKvnu88UuOSA0FtolzA0lZrdXqiCwHboJc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3586
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Commit 992cec44 (coreutils: Move stdbuf into an own package
coreutils-stdbuf) breaks package-qa when the single-binary
PACKAGECONFIG is used:

ERROR: coreutils-8.31-r0 do_package_qa: QA Issue: /usr/bin/stdbuf contained=
 in package coreutils-stdbuf requires /usr/bin/coreutils, but no providers =
found in RDEPENDS_coreutils-stdbuf? [file-rdeps]
ERROR: coreutils-8.31-r0 do_package_qa: QA run found fatal errors. Please c=
onsider fixing them.
ERROR: Logfile of failure stored in: /mnt/ext4/projects/deif/pdsystems/yoct=
o/tmp-glibc/work/ppce300c3-oe-linux/coreutils/8.31-r0/temp/log.do_package_q=
a.5594
ERROR: Task (/mnt/ext4/projects/deif/pdsystems/yocto/meta-poky/meta/recipes=
-core/coreutils/coreutils_8.31.bb:do_package_qa) failed with exit code '1'

With that PACKAGECONFIG, /usr/bin/stdbuf is just a simple "script"
containing the single line

  #!/usr/bin/coreutils --coreutils-prog-shebang=3Dstdbuf

Since there's no point splitting stdbuf to its own package when all
the functionality is in the single big coreutils binary anyway, fix
this by not creating the separate stdbuf package for the single-binary
case.

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
---
The same issue exists in master, which has been bumped to 8.32, but
other than that the patch should apply cleanly there as well.

 meta/recipes-core/coreutils/coreutils_8.31.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/coreutils/coreutils_8.31.bb b/meta/recipes-c=
ore/coreutils/coreutils_8.31.bb
index 57b2c1bdba..80e8161367 100644
--- a/meta/recipes-core/coreutils/coreutils_8.31.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.31.bb
@@ -58,9 +58,9 @@ base_bindir_progs =3D "cat chgrp chmod chown cp date dd e=
cho false hostname kill l
=20
 sbindir_progs=3D "chroot"
=20
-PACKAGE_BEFORE_PN_class-target +=3D "coreutils-stdbuf"
+PACKAGE_BEFORE_PN_class-target +=3D "${@bb.utils.contains('PACKAGECONFIG',=
 'single-binary', '', 'coreutils-stdbuf', d)}"
 FILES_coreutils-stdbuf =3D "${bindir}/stdbuf ${libdir}/coreutils/libstdbuf=
.so"
-RDEPENDS_coreutils_class-target +=3D "coreutils-stdbuf"
+RDEPENDS_coreutils_class-target +=3D "${@bb.utils.contains('PACKAGECONFIG'=
, 'single-binary', '', 'coreutils-stdbuf', d)}"
=20
 # Let aclocal use the relative path for the m4 file rather than the
 # absolute since coreutils has a lot of m4 files, otherwise there might
--=20
2.23.0

