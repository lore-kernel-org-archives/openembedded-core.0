Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.41])
 by mx.groups.io with SMTP id smtpd.web09.5395.1612429654616471151
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Feb 2021 01:07:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=hMOiB0uM;
 spf=pass (domain: windriver.com, ip: 40.107.243.41, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dzztMqlfxUEpi5Ze2qTkvX3m4nwCLGI1/tCKwJZ+wO7efPE4bz89RLKB1An0rfdJmsxe/TWGi76RoxFxucJkl+bS9g0LCGSd6KJbGlCOEjCH0AL7skTf2SHo4OqYsG0CnqkPZdJvnVf7LFvmfcSWPmJ0iJC8ZPf106ZNJFSmU/EIqR/ggDKGAKRv0+MYX07jJuYFsdiG+AMTsM6aIYQq8u6m8e7K0++QmLg/SV79niuiONUdPrGL3M3LXAmn7kIBboftDFEqU1Lu9IKHMS2bU/25mYdV/vmcnk5wdEXTwzKF58G6LHfCFmv3uw+Vv+s1+oXy62tga3eegn/xlr1PFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yScivQzNGa9VrAejsOuu2wxQ/kwESs0jKvuaP63iXhw=;
 b=a9Pm3DdzGPVDNxVwobSRevlc6sSBl9iLxaXijmIYiTX5QkX2k2pwvwpxZzqbsfo4qVpIMAKFglXGzrgHWugTqIPGlAHG/Ikhl5VAryqI0J3xk8wjjz2nCC4hlxSBkImNgB/KZIhCwOFhOi6r5YvqiJ674JFNOca7Xq9LMSuVRbp10wOYCV60Cdw9mtj8QsyPTVN4zVNyXQyyj7z5Du4QN6cB1SgalauOKukpkibD/gxjZ6mGaHfuWIAR7hOOfVZqVb8HJmNqONTk/w8JSFmwwV794FBrGB3GPX7XdrqVhxl4e11Bdl2gTeUDiQ2ewwWFXqNX3slroH8OJinHMOnTnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yScivQzNGa9VrAejsOuu2wxQ/kwESs0jKvuaP63iXhw=;
 b=hMOiB0uMrIg+7kcLTypCFO2o2JyiEM+/pU9oeNZKhTAVr6SKCQCYCNfU0b8GBsUxIFSzJb4p8QPyjwilUMU86ATz5DbQSu6QtiopeAkD/tdjtdvUi4pMdEas/No8Gpz8F2/Dmv58c63Nh+yLuuNWhev4yoWhbPatRo8rdLX9tfY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by CO1PR11MB4818.namprd11.prod.outlook.com (2603:10b6:303:93::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17; Thu, 4 Feb
 2021 09:07:32 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::45:697c:a699:df64]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::45:697c:a699:df64%7]) with mapi id 15.20.3825.017; Thu, 4 Feb 2021
 09:07:32 +0000
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] qemu: make ptest rework
Date: Thu,  4 Feb 2021 17:07:14 +0800
Message-ID: <20210204090714.3261-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.29.2
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: YTXPR0101CA0067.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::44) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by YTXPR0101CA0067.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::44) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19 via Frontend Transport; Thu, 4 Feb 2021 09:07:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6678c02d-44d3-45ae-574e-08d8c8ec4e23
X-MS-TrafficTypeDiagnostic: CO1PR11MB4818:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB4818F4F556018F9F3C1B043DF1B39@CO1PR11MB4818.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:59;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1iM6zBL9ziFpial7dClHks5wWyeRLpCU3RoSQ4r/PjFthsLqK6Tve7dyc5DU5OPh7qqyoU7sHVXK3EJGrcCgVXPqWiBZHyCzCgae0uM28v864W8K1Y2WSJwlWJpdWd24scS1gadyrmdnHaMs33fa+XgzKNC18IAudaRFD3G/zL9mTe9hYGRV4eE/UjpFnwj9TcQGcXlv0du9JxJHNxNSRFvcRlar1bKYyZ5BHvWsnx/BP2g7FZ1Ghk/B2TF7F9S4r7Q8H2A2dRweLZQ9WkVMnXqYu0SnzCnZqvJPeh4b9MOn6i+DQ+z2vCfF/LiZU34SDSKGqVjXQ1XNdZgKTtR32iTDxlWRCaukIFjggoCZHrBHFcRpPMw4gQ/+YkRLSFRzFuM3RUeIlRHuRZ6J2AYdzY9s1ZghMDwVfs9lzPXcKUT47Fn945YUYfmC6NAdIck1TPOitNaCgZELGTxbaZDTCWzPV5/zAfhCeaF43sn6iJaaj70JJ3ZCoUjqR4N9UH865qEfaGYbZng4GS7AAU0znXUMix232BajwUsNZPsktGeijNCw9uWe6IDYVoKIrJWiFeaI5fg28S4ZEgzTjDbKwA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39840400004)(376002)(346002)(396003)(136003)(26005)(1076003)(86362001)(316002)(83380400001)(478600001)(966005)(956004)(6666004)(2616005)(2906002)(6512007)(6486002)(186003)(36756003)(9686003)(6506007)(6916009)(66476007)(66946007)(5660300002)(8676002)(66556008)(8936002)(52116002)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?IiIw75XvDNf1oIhk7wv4+VOrzi3WBkDjIRbn5cNSHuXAbuqe89WJdUo0byiN?=
 =?us-ascii?Q?Wzin+oqDHGDsRTvDNHyp4WTjs26q5iZHIPwuSrt9uQ3Wa2jgKG+615YKGK2g?=
 =?us-ascii?Q?Q1vziQCoYXsqyZpmHKB8Sp1HEEgDUjn8Wc2btdydXv5XCn/XcXX1a0/+7yoI?=
 =?us-ascii?Q?RB/PsMIy9IJQFD4eZcLLUDzXT1Wxtk7JrK9zYs50qbRGKH5EgNLF95IwMwxE?=
 =?us-ascii?Q?GB2NxnVS+fL5R6LnbxM2qt08i3ceKRkMYxMJSg4R72cGqIycFsCbMdjS+yPH?=
 =?us-ascii?Q?97ItMtHELK0kqZia/eAjQdddK2o3d57DGrL3x2Z0OBbMYziIJ2lwzjOQ+Hdw?=
 =?us-ascii?Q?s3YBehzium7lPd9Hq6TPUaGrWs6FlzIsP255GvW4PxlxbBdeIpc8e0eu5+pc?=
 =?us-ascii?Q?ZcsITgwZCb5jYcU7YCFvB0gRwjTOtDuAFrhyYMExzkF7xchdoZJxHwiQv5pf?=
 =?us-ascii?Q?wmK4wR165UWCrUF29glaCWkfYBmU+Z84h++cQjm83iyhOfyAqVs8iaFzXv98?=
 =?us-ascii?Q?nedWpkprSXJqjuWsbFtUjbMcOVmzwNKN5jH/dWmhm7OoBmxg2eGVkT4TqMLc?=
 =?us-ascii?Q?r/Y+Gu6F11TvSFwLTyLKBoeXxrWer99giWz5fKhhBIeL9DIR5/5kqzt5xjbf?=
 =?us-ascii?Q?1npGqT+CL88P7vNkzFOKEX4A2pWNVG3NWdKx6seH5av3s4ppsBuBmLJC0VOK?=
 =?us-ascii?Q?0Txe8GxhrgIUlNSUBaRu5Zv85z9PKnMa2nz/arEPl+kTyewQYRP/v51Q2j4P?=
 =?us-ascii?Q?aRDt2XD3Ib66FEuky6OOw9IqxDmL+AVoTPOnhapnTLQo8RrTBaO7F0qB4pdY?=
 =?us-ascii?Q?TcOjkM+HA6qBcivycNxib0zGCXKet17lP2JcRIZwKJqSfehyN3RnyjpFYj/S?=
 =?us-ascii?Q?W0Jl4ye//GPIsDCJpzQ3vWCiesAbxJ/e/C/khPeYIbKNi4CCi7Q239Hjwy4J?=
 =?us-ascii?Q?3IDnLjqmyc82d/mI3g0nvHlf+p6KkLEQfItcpSSdf1VE2kY8PZFKzFwVb7ZP?=
 =?us-ascii?Q?KKixOOZmQ5NyHXj/Y8M/+DCcr2Xw84yh0atF3TEiy9EWpZ9HxOYn9U6saGPC?=
 =?us-ascii?Q?2wDL2saoJ+sefxVO4YCF+Jr7BQbEPf7T5oZwyhTDVfPntbp8BEdsiSJeEqKk?=
 =?us-ascii?Q?KG8bymfcb4ULwXGrBpRz68zTfbTH9DVE6ImDUn+kBcbeVnsfswfcGDC8MThV?=
 =?us-ascii?Q?8AaoSaBULcuhnKSDnu9Uty+PBrc0Jr7QuxGiOErUC6QkN0ozmqOQ1QO1eJLl?=
 =?us-ascii?Q?ak9VCDLnaxnslFTpwzlrYR6dc57N3lKdxH+r6dD9y3y32fRgoO7bVg7Gee9S?=
 =?us-ascii?Q?Okw+BeyQNLR2hiB+OnOh6yTC?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6678c02d-44d3-45ae-574e-08d8c8ec4e23
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2021 09:07:32.3503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k7tDANGVTt3hGxh5Ym+ma29+l+7qtigIFsFl59+8BV4+wIHTOIqvfI/SoKDToTbDPboVKMdGiRYRJAO8GxTGKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4818
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

After qemu upgrades to 5.2.0 in commit [1], if also switches
to meson and the previous logic which introduces the testsuites
changes in [2] and results in below error when run ptest test:
 # ./run-ptest
 for f in ; do \
     nf=3D$(echo $f | sed 's/tests\//\.\//g'); \
     $nf; \
 done

So refactor the ptest part code to make it work again.

[1] https://git.openembedded.org/openembedded-core/commit/?id=3D181c635567a=
afb9b4787d8d6d0bcd4a615ceae80
[2] https://git.qemu.org/?p=3Dqemu.git;a=3Dcommitdiff;h=3D279588d4deea2694e=
be9ceb29dfdc5c08a7c4e27

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           | 12 ++-----
 ...test-which-runs-all-unit-test-cases-.patch | 35 -------------------
 meta/recipes-devtools/qemu/qemu/run-ptest     |  5 ++-
 3 files changed, 6 insertions(+), 46 deletions(-)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0002-Add-subpackage-pte=
st-which-runs-all-unit-test-cases-.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qe=
mu/qemu.inc
index c894b81b10..cb854914b2 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -6,7 +6,7 @@ a variety of guest operating systems"
 HOMEPAGE =3D "http://qemu.org"
 LICENSE =3D "GPLv2 & LGPLv2.1"
=20
-RDEPENDS_${PN}-ptest =3D "bash make"
+RDEPENDS_${PN}-ptest =3D "bash"
=20
 require qemu-targets.inc
 inherit pkgconfig ptest
@@ -18,7 +18,6 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar.x=
z \
            file://powerpc_rom.bin \
            file://run-ptest \
            file://0001-qemu-Add-missing-wacom-HID-descriptor.patch \
-           file://0002-Add-subpackage-ptest-which-runs-all-unit-test-cases=
-.patch \
            file://0003-qemu-Add-addition-environment-space-to-boot-loader-=
q.patch \
            file://0004-qemu-disable-Valgrind.patch \
            file://0006-chardev-connect-socket-to-a-spawned-command.patch \
@@ -50,18 +49,11 @@ do_install_append() {
     if [ -d ${D}${localstatedir}/run ]; then rmdir ${D}${localstatedir}/ru=
n; fi
 }
=20
-do_compile_ptest() {
-	make buildtest-TESTS
-}
-
 do_install_ptest() {
 	cp -rL ${B}/tests ${D}${PTEST_PATH}
-	find ${D}${PTEST_PATH}/tests -type f -name "*.[Sshcod]" | xargs -i rm -rf=
 {}
+	find ${D}${PTEST_PATH}/tests -type f -name "*.[Sshcodp]" | xargs -i rm -r=
f {}
=20
-	cp ${S}/tests/Makefile.include ${D}${PTEST_PATH}/tests
 	# Don't check the file genreated by configure
-	sed -i -e '/wildcard config-host.mak/d' \
-	       -e '$ {/endif/d}' ${D}${PTEST_PATH}/tests/Makefile.include
         sed -i -e 's,${HOSTTOOLS_DIR}/python3,${bindir}/python3,' \
             ${D}/${PTEST_PATH}/tests/qemu-iotests/common.env=20
 	sed -i -e "1s,#!/usr/bin/bash,#!${base_bindir}/bash," ${D}${PTEST_PATH}/t=
ests/data/acpi/disassemle-aml.sh
diff --git a/meta/recipes-devtools/qemu/qemu/0002-Add-subpackage-ptest-whic=
h-runs-all-unit-test-cases-.patch b/meta/recipes-devtools/qemu/qemu/0002-Ad=
d-subpackage-ptest-which-runs-all-unit-test-cases-.patch
deleted file mode 100644
index 3cb1dac9c3..0000000000
--- a/meta/recipes-devtools/qemu/qemu/0002-Add-subpackage-ptest-which-runs-=
all-unit-test-cases-.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 5da6cef7761157a003e7ebde74fb3cf90ab396d9 Mon Sep 17 00:00:00 2001
-From: Juro Bystricky <juro.bystricky@intel.com>
-Date: Thu, 31 Aug 2017 11:06:56 -0700
-Subject: [PATCH] Add subpackage -ptest which runs all unit test cases for
- qemu.
-
-Upstream-Status: Pending
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
-Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
-
-[update patch context]
-Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
----
- tests/Makefile.include | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-Index: qemu-5.2.0/tests/Makefile.include
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- qemu-5.2.0.orig/tests/Makefile.include
-+++ qemu-5.2.0/tests/Makefile.include
-@@ -155,4 +155,12 @@ clean: check-clean
-=20
- check-speed: bench-speed
-=20
-+buildtest-TESTS: $(check-unit-y)
-+
-+runtest-TESTS:
-+	for f in $(check-unit-y); do \
-+		nf=3D$$(echo $$f | sed 's/tests\//\.\//g'); \
-+		$$nf; \
-+	done
-+
- endif
diff --git a/meta/recipes-devtools/qemu/qemu/run-ptest b/meta/recipes-devto=
ols/qemu/qemu/run-ptest
index b25a792d4f..f9a4e8fb2b 100644
--- a/meta/recipes-devtools/qemu/qemu/run-ptest
+++ b/meta/recipes-devtools/qemu/qemu/run-ptest
@@ -7,4 +7,7 @@ ptestdir=3D$(dirname "$(readlink -f "$0")")
 export SRC_PATH=3D$ptestdir
=20
 cd $ptestdir/tests
-make -f Makefile.include -k runtest-TESTS | sed '/^ok /s/ok /PASS: /g'
+tests=3D$(find . -name "test-*" ! -name "*.p")
+for f in $tests; do
+    $f  | sed '/^ok/ s/ok/PASS:/g'
+done
--=20
2.29.2

