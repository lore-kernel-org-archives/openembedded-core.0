Return-Path: <christian.taedcke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0EC4C4167B
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 14:18:59 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.63])
 by mx.groups.io with SMTP id smtpd.web10.279.1701440334882749168
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Dec 2023 06:18:56 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=4XTHt5qu;
 spf=pass (domain: weidmueller.com, ip: 40.107.22.63, mailfrom: christian.taedcke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e7+i8gut11sWPe24fjjvwmJeCwnTacpn/p1nXVOp1ssXFTZoouT4UthjPPDu6YU1lPO+tv7/EmZLzd0KOdcTMpDkJWDnzQS0fiLDGM0Jb9J44QFIYv6doMjtWuM+mX804QrOJ4uSm9PsBY070H8rpyB2w/zqcsrOBR9RYpeEGGKOyJtDv2Ew/MXJkCNboXdmydg9wUDlKK5I3Hab2+c0Lt+QrbT/kOa90E34c3diL1ljCMaHc2aoCNKi8ODJVokzKvf1PWKHAn2z+BUelqrf48hZFW5YMyvmCEafLB4UL7Q8zraEZcCxFZ6+FlQTBLw017WZXcmKYcj73SQjfc0PHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0kDQJ+U07KLodnfR5R/Ft4Pt/x8Yt+kyf3gMBeSEjA4=;
 b=gDwoUnwZWeFrlu3c9fQG+k1n8r6QxpFkI2vyB1Zb/uahBVb5nweoTdT6InIcqAsN6x4QNrFzVm5DcujV0tWBwzLGqmcnPQXbdDlgefETBbY8LkoAmVcDB41gEY1MvXhPrChnsWRsmIqegur05Codu1fZUHXHZ5A/p5YtXgQYcgu1NPhhc1SO3ntuJMhMIdxdoGFRRPmqIKrhMCTmUwc3kJDKpDC8nTnfZdie2OuCmhafJiOq3XT55+rF4M4zW+r1vXTH0MDI3Q0Z6IkP20QM98lJRNiYJDy7P6Rt5A26LEdLIytcbOv6Ywi/ZLt8uSEleK2yx0uKxy1fg/Q5AB5kKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0kDQJ+U07KLodnfR5R/Ft4Pt/x8Yt+kyf3gMBeSEjA4=;
 b=4XTHt5quhbdl5Vi0fGMYm2/GUfBFQ4wTPxjKR7qWLNZndt9uSFqzOFFn5iSEeFzOftUJltodPbJOrZ3vxvGtE7TuFxHIQsE5aLbp95ZZph39H7S6HHz8sV1WWU8gRqa8PFsOLSEK3s5SlgXwSnUrpMgTdSY+k5XtNqMD3PfVQqA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AM0PR08MB4946.eurprd08.prod.outlook.com (2603:10a6:208:165::13)
 by PAXPR08MB6397.eurprd08.prod.outlook.com (2603:10a6:102:12f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.26; Fri, 1 Dec
 2023 14:03:50 +0000
Received: from AM0PR08MB4946.eurprd08.prod.outlook.com
 ([fe80::a732:6327:19b0:b4d5]) by AM0PR08MB4946.eurprd08.prod.outlook.com
 ([fe80::a732:6327:19b0:b4d5%3]) with mapi id 15.20.7025.022; Fri, 1 Dec 2023
 14:03:50 +0000
From: christian.taedcke-oss@weidmueller.com
To: openembedded-core@lists.openembedded.org
CC: Kareem Zarka <zarkakareem@gmail.com>,
	Kareem Zarka <kareem.zarka@huawei.com>,
	Christian Taedcke <christian.taedcke@weidmueller.com>
Subject: [OE-core][PATCH v1 2/2] oeqa/selftest/wic: Add tests for kernel image installation
Date: Fri,  1 Dec 2023 15:03:32 +0100
Message-ID: <20231201140332.2145367-3-christian.taedcke-oss@weidmueller.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231201140332.2145367-1-christian.taedcke-oss@weidmueller.com>
References: <20231201140332.2145367-1-christian.taedcke-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0425.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::12) To AM0PR08MB4946.eurprd08.prod.outlook.com
 (2603:10a6:208:165::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR08MB4946:EE_|PAXPR08MB6397:EE_
X-MS-Office365-Filtering-Correlation-Id: 55de96f9-5feb-4ed9-4263-08dbf276580a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JOxiIxb7OAd7evr9vjdh06mEu7N2JuZYQ6gN8Dk/rpdAj+CQQyy7VgMHHIx26ShhDEpNOMZoEO8rRovJ0V5n8EBjOYuRClSOtucbm9iTy7JQ7UpxsdkXW2lVo/XUwQ26ys0itvjE1pbRLEjDTYrH6W4n4JsZ0yODjrUrQiBbAX/erDYFffYekxTfjvVX5hY0RjcLjz7YXCZl8Eg47RNdOweRBe/ptS2AOmG5hm+tp4JN//WVbPEiEUCypwudYXrakhXw4sqNZfIfEl1TxvlZMnVoA6Ai/0NNJEqjqhuKwuc5LMNRLnxpxfPrbDBxZOynDoMLPVWrMDxWijRpOPvcVZ62ZKsvFla5Gcc3khQ8A2Z30RmmGcV0yVt+CFq0gJ7OD2bQr2t7AlTi/BB40UqOXVPJRTYmpOVrsMcJHiR2//pzE4sUTFZ962cqpk3zu3nKpV5ULMlZdUVuzdzM46O9/3ZdsskNvkKr6BfqzkCkH48yURDz+bpLASUdj/6K6N96d5qAOvvqUnlwcUiMUS4XCr0PIzW3dytBM2qF6T+7Jk50ZAKqcm8+aq/zXHNJ0NTEYuJd9ozMDPLK542+6/H2o9ptzznB22gKcpifcyGeSevwh7fa+JafBzt+2jGALj2f
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB4946.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(39860400002)(396003)(136003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(6512007)(9686003)(1076003)(107886003)(26005)(2616005)(478600001)(6666004)(6506007)(6486002)(52116002)(55236004)(83380400001)(2906002)(66946007)(5660300002)(54906003)(41300700001)(66476007)(316002)(8936002)(4326008)(6916009)(66556008)(8676002)(38100700002)(38350700005)(86362001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZvN3rL3JWIP8F4NEEsXKRwDDJkOX/GDFJR4ye6N25Yw3ATBP9QAbDjpKJJHR?=
 =?us-ascii?Q?4fSsEhwxj+XPKYStqpMg6EfivMVdXgQfSxhbcvIFSrRvLpDMdECwfpxnQuPI?=
 =?us-ascii?Q?6WuF1ZPIMR1n95Mto+aKqMZiRCbbOPGEhIxMtHHwrNKpE2Ya/KMPRAniZreB?=
 =?us-ascii?Q?kAVTGSewV4BfuqSPyj+bfs4mJBb+yY0WxmWaZATcXdvaROtO+/Trrraq28cX?=
 =?us-ascii?Q?O/R0w6Pt2b5Xep19Mxwq4DVSqlcIoXVrdY6rAYqL+p2j4gD2z+kd/d+HeK9N?=
 =?us-ascii?Q?/gs/n8XlkrAAgYuvAk3CBZLHnHDlxYW3HVFN77YQ/2KEWABFbAZyhVjOrD9L?=
 =?us-ascii?Q?vnDHT7oD63y8S7oLwcA9sF8BOGmw4qlhJWurofXa3azRNC0jCOsdCJZ54LKr?=
 =?us-ascii?Q?YspICn8Byz+72ZeetJ8Z53BhO6kk/BPbr583akztsuG22CLAbT++cn7tjQNX?=
 =?us-ascii?Q?4b/4Lpoqb0wk8IfLxcbIDwftvq2z6AqBoA89IoPSdoTl6IxfFr5A5vZm3D0o?=
 =?us-ascii?Q?almWsBygyNzxTofVKeYDAPHQYY9q6PgirMCZ2VgCFsC+yM5R7N/pPd4DFwhB?=
 =?us-ascii?Q?Gmx2j5GGlH1n3biCPYTKCnZi9ZdoGQ8ZTRpELZibvDqSxbg8E5gdegdvPhIy?=
 =?us-ascii?Q?IpcagyyUpKQExVB6bUKfI88eF+LX/+uOqmg9DpjeexEQCv9x9MRuRVZZ+VFa?=
 =?us-ascii?Q?kN4Qnzm+G0rD8EHmpcBte1b56k46wL5PfRjIGJa5j8hZy6nUTodhWtYOM+bA?=
 =?us-ascii?Q?VYWgLO+coQ68ltzsrzCEBCt6Qp0dTcXVnGDB0XT+/OXyXqZwbVWykJQjb9gh?=
 =?us-ascii?Q?FQk9AG5nBzU2px+Uo2iRa0zITO1SqxtviB7GxgGkzQqISnMUDp+MdN+oJU1D?=
 =?us-ascii?Q?ypMQ7hRQGpdxYI1CJxJ+VWyuApsB+IKqPOiw/5XBofQYeCBAwIuC2bWhjKiq?=
 =?us-ascii?Q?XF3yKtuA+SudH3uKpPq48njBA+GwCspvMlkX7ZgMw8aEHPxE3vgaZRozq1eY?=
 =?us-ascii?Q?k89sN+QNc1UQvmmM9nC2Q7MDxhZ3XVbIKjYA2nQC36prYnnVEJZ13VEUnNlw?=
 =?us-ascii?Q?RonOIm/Hy06xtzae2HRWeCDluMmfA3Z2AkQn5aezxIxAMDwChmBv9pFj1eZB?=
 =?us-ascii?Q?9oa/rKY3flmIlgLdFCoCvcWsTmmB/AA0uK9dgTNutOycaqI0mQx4C3Nt4lY9?=
 =?us-ascii?Q?yuchRCKY3Q3ugtlqpzo0YeDT7OodeSBkjmoArKuZNlO/iRx4UmCdktHc9nKF?=
 =?us-ascii?Q?0h/Te8tISwZ2sd22XNaXgtLgQUy0B1NtZjUyHIPWHikeK8VRzuo/0LClcqV1?=
 =?us-ascii?Q?qsoid5Gs1J253CkU9PVZtX9fYEtWeBeBF4JkRtK6bVpa8ofD8CqMONlqqKa9?=
 =?us-ascii?Q?zjGGx3jK/qbEWhZVBP0q0ORP8+4367kNj/dKH4KJEm3mH8dzH2EETJu+/7uG?=
 =?us-ascii?Q?GxvAPU+V7eHV8JHAl+dzfADtlQEVikpND6ZJzDRzwt/MHFgBy9C/C0UidYJU?=
 =?us-ascii?Q?cpXR306AaaYBQhFjjXGvkvdq4M+iLqhm5HqRR/LW2EFVUvQXoF1M9BzRI+sN?=
 =?us-ascii?Q?4V5mMvgtMHVi4MQA/Sn2Hl4IxBpX6p0vxWDRp3ye1aFej7pv8uhdrjQTQOKK?=
 =?us-ascii?Q?3E7gKEivLcUbSwYC3EVQU5E8ggGDukrJFSDaG0/Pw978?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55de96f9-5feb-4ed9-4263-08dbf276580a
X-MS-Exchange-CrossTenant-AuthSource: AM0PR08MB4946.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2023 14:03:50.1057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DJwOEc64iOqkYonDyLH58vQphq66r+VIZg/uPr5E8b+zM3YLcgIBiiMQ3cXLS1zpdxZOgKUmDvkVai9z6mjZQ+sraXGUbOUONp9EReJNmJcP8JDFQmnIuc127Waftn8U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6397
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 14:18:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191667

From: Kareem Zarka <zarkakareem@gmail.com>

- test_skip_kernel_install: This test verifies that the kernel is not
installed in the boot partition when the
'install-kernel-into-boot-dir' parameter is set to false.
- test_kernel_install: This test verifies that the kernel is installed
in the boot partition when the 'install-kernel-into-boot-dir'
parameter is set to true.

Both tests use a WKS (Kickstart) file to specify the desired
configuration, build a disk image using WIC, and extract the disk
image to a temporary directory to verify the results.

Signed-off-by: Kareem Zarka <kareem.zarka@huawei.com>
Signed-off-by: Christian Taedcke <christian.taedcke@weidmueller.com>
---

 meta/lib/oeqa/selftest/cases/wic.py | 68 +++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/c=
ases/wic.py
index ab248c5898..4ebcb76cc4 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -16,6 +16,7 @@ import hashlib
 from glob import glob
 from shutil import rmtree, copy
 from tempfile import NamedTemporaryFile
+from tempfile import TemporaryDirectory
=20
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.core.decorator import OETestTag
@@ -146,6 +147,73 @@ class CLITests(OESelftestTestCase):
         self.assertEqual(1, runCmd('wic', ignore_status=3DTrue).status)
=20
 class Wic(WicTestCase):
+    def test_skip_kernel_install(self):
+        """Test the functionality of not installing the kernel in the boot=
 directory using the wic plugin"""
+        # create a temporary file for the WKS content
+        with NamedTemporaryFile("w", suffix=3D".wks") as wks:
+            wks.write(
+                'part --source bootimg-efi '
+                '--sourceparams=3D"loader=3Dgrub-efi,install-kernel-into-b=
oot-dir=3Dfalse" '
+                '--label boot --active\n'
+            )
+            wks.flush()
+            # create a temporary directory to extract the disk image to
+            with TemporaryDirectory() as tmpdir:
+                img =3D 'core-image-minimal'
+                # build the image using the WKS file
+                cmd =3D "wic create %s -e %s -o %s" % (
+                    wks.name, img, self.resultdir)
+                runCmd(cmd)
+                wksname =3D os.path.splitext(os.path.basename(wks.name))[0=
]
+                out =3D glob(os.path.join(
+                    self.resultdir, "%s-*.direct" % wksname))
+                self.assertEqual(1, len(out))
+                sysroot =3D get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools=
')
+                # extract the content of the disk image to the temporary d=
irectory
+                cmd =3D "wic cp %s:1 %s -n %s" % (out[0], tmpdir, sysroot)
+                runCmd(cmd)
+                # check if the kernel is installed or not
+                kimgtype =3D get_bb_var('KERNEL_IMAGETYPE', img)
+                for file in os.listdir(tmpdir):
+                    if file =3D=3D kimgtype:
+                        raise AssertionError(
+                            "The kernel image '{}' was found in the partit=
ion".format(kimgtype)
+                        )
+
+    def test_kernel_install(self):
+        """Test the installation of the kernel to the boot directory in th=
e wic plugin"""
+        # create a temporary file for the WKS content
+        with NamedTemporaryFile("w", suffix=3D".wks") as wks:
+            wks.write(
+                'part --source bootimg-efi '
+                '--sourceparams=3D"loader=3Dgrub-efi,install-kernel-into-b=
oot-dir=3Dtrue" '
+                '--label boot --active\n'
+            )
+            wks.flush()
+            # create a temporary directory to extract the disk image to
+            with TemporaryDirectory() as tmpdir:
+                img =3D 'core-image-minimal'
+                # build the image using the WKS file
+                cmd =3D "wic create %s -e %s -o %s" % (wks.name, img, self=
.resultdir)
+                runCmd(cmd)
+                wksname =3D os.path.splitext(os.path.basename(wks.name))[0=
]
+                out =3D glob(os.path.join(self.resultdir, "%s-*.direct" % =
wksname))
+                self.assertEqual(1, len(out))
+                sysroot =3D get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools=
')
+                # extract the content of the disk image to the temporary d=
irectory
+                cmd =3D "wic cp %s:1 %s -n %s" % (out[0], tmpdir, sysroot)
+                runCmd(cmd)
+                # check if the kernel is installed or not
+                kimgtype =3D get_bb_var('KERNEL_IMAGETYPE', img)
+                found =3D False
+                for file in os.listdir(tmpdir):
+                    if file =3D=3D kimgtype:
+                        found =3D True
+                        break
+                self.assertTrue(
+                    found, "The kernel image '{}' was not found in the boo=
t partition".format(kimgtype)
+                )
+
     def test_build_image_name(self):
         """Test wic create wictestdisk --image-name=3Dcore-image-minimal""=
"
         cmd =3D "wic create wictestdisk --image-name=3Dcore-image-minimal =
-o %s" % self.resultdir
--=20
2.34.1


