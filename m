Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.90])
 by mx.groups.io with SMTP id smtpd.web12.1643.1594278388305265900
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2020 00:06:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=dXt5Af9d;
 spf=pass (domain: prevas.dk, ip: 40.107.7.90, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UvLJzIs3/3y24RsxQX/RJ673f4k/chJQrt20CK9IydiMf052ZBIauRHCBspzWe6MR2d5MyHiynuNv5uSDcLAhFBxfhaQey27lUFI/dxH4RpU9uD4d/geDAxBIpV1hA5JWMljCtn0BQCNlXgORnJXGK7hRRG7rO6hBJiyGq1qysjHIlLNIwScWU9I8Q0uLOK/qmYwh+PuswCDtxoXJEtTGO4KAAQjSkLhAAwlw3Zs9g3dXNhwEmHAuOwBmz7Iw46L0wqLaRoRJOqZSH/cbzMFk6vNpajHdEwG52QuWkJyjmDAJ8IQkpKhvdYH+4LvBxxbVCPsk8PohbAQxtU7LkeBmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tWQBbmLUSgqgE9yKPSIHnk1y8bw9P7gR4PXGFFJi+5A=;
 b=AFVf1ZhKjKOS/UUBpbV49Aswo+u/1/KYqEMabdePxQ9CFTXc1kHN6adacnnomya1LyfJejIw194ALxphqv/bS0bbfUGW79qdSGWAKGWdaLE7tDpe+rvC9dlXxa6gRnuRpo29qVl3ytBnxUOICRlp8RixlDTSpBCHwOm/JdqU1HXlf27fjalXAO07mhTTUG15XXAzs2EmOGeCZgE0XTrT8o4pPO3csUZM61/yfyirufwZMTRTZi+Ic8pJTNKM8nihqQenBk+Bo13tZsTrQZ9/q2iza67OQ9kdHA17YReRWZS985HUZzrvt2GqEvuyB2ZMrDaOSIQleSQ6v8Sale6lyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tWQBbmLUSgqgE9yKPSIHnk1y8bw9P7gR4PXGFFJi+5A=;
 b=dXt5Af9ddjBIUoCUIGMb40/8hxqFM4aPpGrzJVcLI1Mq+FKISYZbQbw+GTMCd1KK7sbRfdfEzCek2u9f8A4taydLUJQpchd558wEd3lk/QGTVeOudAlXPBLpcgVYYSv3LKvDvcx2TxElyUW0hEtU7NJsgaMlRlo1gBeravcrSjo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=prevas.dk;
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:3f::10)
 by AM0PR10MB3571.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:155::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22; Thu, 9 Jul
 2020 07:06:25 +0000
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::91fd:aebc:e8cb:a663]) by AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::91fd:aebc:e8cb:a663%7]) with mapi id 15.20.3153.031; Thu, 9 Jul 2020
 07:06:25 +0000
From: "Rasmus Villemoes" <rasmus.villemoes@prevas.dk>
To: openembedded-core@lists.openembedded.org
CC: Adrian Bunk <bunk@stusta.de>,
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH] [dunfell] coreutils: don't split stdbuf to own package with single-binary
Date: Thu,  9 Jul 2020 09:06:15 +0200
Message-ID: <20200709070615.7016-1-rasmus.villemoes@prevas.dk>
X-Mailer: git-send-email 2.23.0
X-ClientProxiedBy: AM0PR10CA0004.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::14) To AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:3f::10)
Return-Path: rasmus.villemoes@prevas.dk
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from prevas-ravi.prevas.se (81.216.59.226) by AM0PR10CA0004.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20 via Frontend Transport; Thu, 9 Jul 2020 07:06:24 +0000
X-Mailer: git-send-email 2.23.0
X-Originating-IP: [81.216.59.226]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 383dfdeb-f0fa-4530-d5e9-08d823d697b1
X-MS-TrafficTypeDiagnostic: AM0PR10MB3571:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM0PR10MB35716F6A81C7DD5EDDA5AE2493640@AM0PR10MB3571.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:1265;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YGol2O4QngkYaHKvbaaE/2vNqltaEM25qYlHr68RZW0ORhxyJM4Y3p2nN9NNrqMmr2L63K+1+5lbyWiOeDjn1UQ51bprAMcrMcgo1OHNy5MkO1bcIsKjsUBV3v/oNOCLYAw/tsJCvyW1KfmffW/1Lt336RKfR6pmWZ8y+XJaffD3ztoCAm5WitDHjj5uyo/4zkx2olkqQNsLEjB7IyILMLRX6xP4aLlCqWMEnNPJ0PyJzSzsR4SAv+mD6Usuj83oPV7b+H/ARCqS6i6RCVQTbYMke0RJ0ejigXYQ6U/M0IPEx/cyo7TKdwehBKFPwgcHP6hgVroBY9nYT2c4hWQiag==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFTY:;SFS:(396003)(346002)(376002)(39840400004)(366004)(136003)(44832011)(83380400001)(6666004)(8936002)(52116002)(6916009)(956004)(2906002)(2616005)(316002)(54906003)(4326008)(6512007)(8976002)(66556008)(8676002)(66946007)(86362001)(66476007)(16526019)(26005)(36756003)(478600001)(1076003)(5660300002)(6486002)(6506007)(186003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	+P6uVQ6L0eFR1qIZ4HVteDtgzK0Cya+/5fphiS9rJGfQmujxfExV/a5gxCghXUqMyUC2lICIqc13le52cBzcTOG+d30YE6rpxLqZdCJXstq/X8EUD/lqKGSNcoOQFNsX2BTjGdsNJiBFN5CnNWxlOYqH24/to8fGGKoVe6XB6KzajzrdklBYLKM4YRvxcR6hK9+diag3EEivbHn0FYRZut2rfm4TWNxPX2yZKXywOp951+40BXPGelc/L9PQSf1o+r0n701U/zfobJS3dZ4OuNZhrbhQiB73fOE/dVkiaFbEYX81Phksu0eFDDuyP6STNpxPtf/zrzh+5qwq5OemPFGUk3734vGg66R4xvx+7uBwenFO0FiChGfcBzf6Fkuoqk/9VnrQ3JWRlf3GTfv+vSzxWLBSm6mpHQZylxocQpobNBFZIfDNfjYzMz5OYDN0HukbPdu2N6f8l6ybA8Q8NuzMRkINgMTAb1SkEPihtV8=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 383dfdeb-f0fa-4530-d5e9-08d823d697b1
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2020 07:06:24.9282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rnSPpxzF5hfKcH1Pk5/N0eejm85emBJmWjN4AnU6i6dVJxBClKti3r2lri6s0k2Wo0R+GHKsKBEe0qSKsY07Bx0kRlU6RUxt+u+qnHNYnQE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3571
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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 74d24b5b895198898944260136d05e991a203c11)
---
 meta/recipes-core/coreutils/coreutils_8.31.bb | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/coreutils/coreutils_8.31.bb b/meta/recipes-c=
ore/coreutils/coreutils_8.31.bb
index 2b196b7512..0c8452da98 100644
--- a/meta/recipes-core/coreutils/coreutils_8.31.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.31.bb
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

