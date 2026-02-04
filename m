Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00FFEE9D3EB
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 14:58:28 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.13])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22251.1770217102963157300
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Feb 2026 06:58:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=jr++UpaF;
 spf=pass (domain: est.tech, ip: 52.101.66.13, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zRmOMYtjGl9PYobvMAphi4LLVCsqaaZl97D+ldzvq8wLZ1PPWT7QUU40890VQ27x6+IenSeEagVC+d0eusayqQ4g4GosZ9DZJuaSNByGCZy4fl3YLUsE8qiuXuYmSxBhC+LeQT6MFfPYpU/GTrFE7MhzXj/FkI+WIzRGntF3CtbVQgGB5JeFjUXO8Gt841gvd8MeOx/ZciBsfxr0Kn4L9xMCtnarSb3rkHbgC9m2IV8kYToU5knpvPX9fVmYJcln5bVo9NDIXiw7otzZpROfNabaQuXIzt4Ua3Q/3gmkUlv06u8Gun8iU4Qq4D7NUS6ROV1SYE4RpmJcj6aA+1gijg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ashvBmuslSDw64FACVO84bGVSK6U2b81StUQMJC19rc=;
 b=V7oORQGpqCVFdhS9sY3g7d2VTbJccYIyPp9DYPPSWNQ544JHcLGaiKyL2spjNa674SqEwSykOj3f5GuDytJrbxElGGerKTH8218ggVCn+8qsu39w5mXw2HXIzDaFtJDBvgjsWEwDfpTD2JqlRQ9zvPrgJftZl5Ewxwenvap5k3+y7EHup9Ufsky6HjX6V/acprR4v2wJipEHYTZgjhj87r9HBaqnNkNyvj4G693AULx2SwSJADFFCAoBEaRVkRJTdCwQmYhGqAn7Jpoe7UgrBlnBxfyRYH6SU+5/bKjFcRNZkv5phvj/0IMo0cbRDN7dQBELmXH3nmt+j1EaBwdB0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ashvBmuslSDw64FACVO84bGVSK6U2b81StUQMJC19rc=;
 b=jr++UpaFh67J38vDp4s+jpPuQYlUifLU/USTS3OACb1Ipjhrx5eIIgetSnnv2KNR+8zlk96flTgx6PQn+H1aaO9B0z4wbG9QXu49EGQaSHqQh1cV6Sh6ZPdYQ6ePMwUhbM4X+tOUAnGDNCdIHnJOXFf1rWO4iAicMlSNoyezE1oZr7v+dOsKNK1pBmamg3aS8r/DXjsA7xDEJVk/15P8LQyKqpsMK1DVG9GyktwSBLzRyjGSC6Lr/7ocwjg4JPrMdYicuUufgNxP4UmBFGVSZv5yy8CU75eFOSnlwK9mrvXZgoSu0df2oayt6Wmire2CxFR4A/QfGjVb2V/o/4VkLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by DU0P189MB2615.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:472::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.13; Wed, 4 Feb
 2026 14:58:18 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9%4]) with mapi id 15.20.9564.016; Wed, 4 Feb 2026
 14:58:17 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v3] libconfig: add ptest support
Date: Wed,  4 Feb 2026 15:58:11 +0100
Message-ID: <20260204145811.19113-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260128140635.43214-1-pratik.farkase@est.tech>
References: <20260128140635.43214-1-pratik.farkase@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0110.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::14) To GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:26e::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2P189MB3005:EE_|DU0P189MB2615:EE_
X-MS-Office365-Filtering-Correlation-Id: a9a77db0-d9cb-4b61-43bd-08de63fdd403
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?kA+w+wDxABdRbvmRYTPoTpQb9E6DQsGTzicc1P6J+xhczONoAQ8GHqRtYUCi?=
 =?us-ascii?Q?aWFsDyigivwPtDrcj88mKNePbU+j8j1mE5SmvgQyoLgDPdRblqF7zu0H85XJ?=
 =?us-ascii?Q?/0MgudJ8ZylDPBV4AHgI6GlM5Zx9iseMGqe7m/RD77g0IAcXtKR1Y3qt63zX?=
 =?us-ascii?Q?2MMyaVjA86KKhAY2q7cDro6i2XQ/lGHVO/8RkhBYWr4z4+PQayQ/40/E5PPn?=
 =?us-ascii?Q?t+5qVuJ4kgrLEoiEQ7ohSNUX8eFg57BO4M6Boiuq0mtRQ3gSAu8DTgoy4bcb?=
 =?us-ascii?Q?9KYGAGwe3ZowOG7VP82CeKVss43FC6D5ja/7R+AWWJX7+T38G6t4sOi7rlrI?=
 =?us-ascii?Q?Yr9gVDtsl+JrORS4cL/6iR62QvMXtyl+nyXuP1xtTdqGr3uMxzR8d4EHA8O5?=
 =?us-ascii?Q?XLs6FoC74sbzYltZxtbXHzYrsRd7ZZog2zvEvZlO3ZIgDLZvyhbE0UXLSDif?=
 =?us-ascii?Q?6meU4igVSBsQOJB5xTrBQWrqCyGUg/wVlwenjYMlNagR72a0KgadrNDA3Z/u?=
 =?us-ascii?Q?0MiE4AIBVG3lyZOfjPhjb2aIU8UlZrvBbtQjn2dc1/wdbx6odi6zpmgbL2iv?=
 =?us-ascii?Q?jil/ZQVPbgH5FCXEEmahm4KGBEgTUxLpE8nc/PpN5OZWLATNgsGKM3/jgFQY?=
 =?us-ascii?Q?wQRH3IkwQtnsHb/YbFUs2+leOX1qqe++az+OmiWrurCFH6XIxEGTuXx9Do6D?=
 =?us-ascii?Q?X9ZN0mAOQbTHI8A0Ceh4HZOy7gGRida8KIWSOOM7FfsCo0vcbUg8RW08wJEc?=
 =?us-ascii?Q?Tu6ATwquA4xwQmdKtJAx60EgjxlkxYlJ7NtnrVq1x8lYH0oTUvhEGUK0TaMa?=
 =?us-ascii?Q?Uq/2MOx2FVW0XQalObuz6pM7FugtCCYr2OttrvYhGMCeBrknNgNf9ZnzW08Z?=
 =?us-ascii?Q?CphCod1W7bQIk8fkmPXvAR9Cl2V6vgwUtuuKCekanIhNwKQhNm2W4qDVy+32?=
 =?us-ascii?Q?bzabWGVE4ehNJgArN98o5OigsmkdW27Wgd/cHQC2iwQoix5VweANQ1Xo2ZyV?=
 =?us-ascii?Q?kqQvWyQrAhwapmrzXCw5Nxy7q9cLfEeFuwRfElOaiuycD3VqlBDbx0ZETD4i?=
 =?us-ascii?Q?71FZExSWQSTssmtIoW97pGWZkZgYNIS+rhpvP3cKnWcm06jjMA7iVGQWmNvX?=
 =?us-ascii?Q?9GE5LEcjE5HgxhLx8p2VbohZ9pSMGDqslUqK0gLHImRN0yG5TcKZ+9vyJk0m?=
 =?us-ascii?Q?CVf25UkJEfMh33mv7Uj8EDLnQAZt4jMKOUh4z1y4dv5Jdhi+bwsdDy4zuCuq?=
 =?us-ascii?Q?bLheQac1hgmB/KpoV0shj/FlUDmPM61gzoMOiXNuAB+a2NBS1y6c+yBWyHok?=
 =?us-ascii?Q?rmENOxh7KnSk81etvUIqtA48iF9D167jWLI3UUdNqMnJa37DoqLpVRhlYJUJ?=
 =?us-ascii?Q?1yXn806AzgE4OPdM4U4ERfhw6VZiRq+9KCPBt7HDEQsqE1rWhAzqqL39m3WP?=
 =?us-ascii?Q?FcU83F/9LP00wHmvWx9R41RcDQR7mBlp3BWLD6hivoHTLMbP12D8ezJUjkax?=
 =?us-ascii?Q?Bo8kz7Ke4/v2xvhCILCuOxBjZtXnih8WYecBr+TrMzSSJeqC1W6G1aM4WpAm?=
 =?us-ascii?Q?39TmKGRl9HOrg4Pz5pI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xL0VcyR/R+g0vXnfcUqzTA5eF4C/tiNXFdHVk8l6ZUW86I3xYYg6cbxMUlyR?=
 =?us-ascii?Q?BIJm/p0YdUWR+cAK4pC8g9dvuZjsG/uoONvzCwEcCP4lsKpuCAkHRojlmtt2?=
 =?us-ascii?Q?NLEAuGHrUtPXEwh1m/KF6nPgRAIa0d8Umb3HQ3jsokPEv7KJLFiq6p5izfFH?=
 =?us-ascii?Q?mQa2RnnQGquNcWOl9n9SPUyZLxbWI5LZha9U+BUGKXPK62Yq70FkkX/UgvqQ?=
 =?us-ascii?Q?o5TY/cPeOucDkwRS/3OMxHbq4dhXEClufazMozVvlEAVj+/c8hxaqL9Oueyj?=
 =?us-ascii?Q?5a65pdJcex4HQfXHkpmXMfb77QdvBd35KTi6g+vX3urK5UjdgU+gGfgCxYrr?=
 =?us-ascii?Q?Y8WZRvcK7kNMxzkX1l7R2eYirzxt49rM4h64ILRzyLoxkzcHugjHzVbOlWYP?=
 =?us-ascii?Q?e+8uM9XjoIlqr2SMGU2xYQsIm+M37m53XWLUBuVUR4/ET/rb1bNArrkQP9xu?=
 =?us-ascii?Q?Y80MW9V4tvYbv4caB/o5OzUir3ZEXCyjDC0xXwYUGXUYtZRrfWIRW8Hja4LW?=
 =?us-ascii?Q?mmDaWhP+Q5NzykkVsDK8N7kewHUVpvP2WVxt4hHcMKIosezYevJlRBlvttnb?=
 =?us-ascii?Q?X8yp2y3aYe02MdoCbtjem809AJeiJv5lE25Iu2u+RwGApdwbvdZmjR8FgvXi?=
 =?us-ascii?Q?7fVjti7gbZT3W8MjdEjDcRnUqu2dsJm/uFbNok++QZzHzzlMBEil4jrvEbxb?=
 =?us-ascii?Q?tb6FxiOu5nZkNAwmVUqse9ZG4oi6ZtExKM/uV0B+ln2lic+p2F4t9RuEiOox?=
 =?us-ascii?Q?UyC/hriSZujxEBqjEjcA/a69SwUnOQ2J/YBOJjcIK1a0s6FvfagCdDyCNyb2?=
 =?us-ascii?Q?87s2tYWGLpngAVbWYXXknhaSd6gNgtcIxDjPP5gPxBWQsAa0nJqndHcx/hdd?=
 =?us-ascii?Q?0mNGsQP5py1zAfTLv/FsoBTG/fXlq+WoNzL2c0ys0i5twPdPkCdAMbGGAfdK?=
 =?us-ascii?Q?qm/dCf6l8KsKEioJa743bI7bnsVhIcIxl9LDI4HM2YZqjtci9b16dBplKQyC?=
 =?us-ascii?Q?XVjgnYlEjVYxWEyiTU2CWreOprnxXrIxpcnOBjbPSCwYXoJ5VS7jBtzo638H?=
 =?us-ascii?Q?rQBV0BQ7nZq8HOPjVZ7slLPGsmIOuPSqUxDJfgZ7S6JMFrD8EjWS2jX7odGi?=
 =?us-ascii?Q?A4XZsZ8lkh/AC2V4ExPdrGAplk0TAY5ZGEKZ0+6SSJxZvGzrdGboalMNkL0E?=
 =?us-ascii?Q?F6yf03djfGVcc5VLQg5Q7/WeTteaUyKRbF3fRvGFF+P/dM+0Bjwb7zZ8es1i?=
 =?us-ascii?Q?h7Jthdc1UocyP2Aj6CUDIG5nk9czIAnw8h0kvld3HZ1KOYIqXOECeo7PJ8nH?=
 =?us-ascii?Q?Jy3mOEKoS/y7krtRuk0xRG6ghbXzAahAB5BFi594lBybWw2uianKgvZh340a?=
 =?us-ascii?Q?2kP/Sb/sKnRv914F0LLLVmZPMPtqSWqy15bxdRt4eedmWrLodh8nQbEYtOtC?=
 =?us-ascii?Q?3Jb7joVQ8Z4hlcusOPxjq6XfGZKaLP8VfLiRVbqPpeenU+uL/fSfD12ZEgJK?=
 =?us-ascii?Q?OaBYTGW31zUXmMsbTyZni/7UPPZLPyCKcjwCEe7FuPIV7029fsI1HzyNCtbr?=
 =?us-ascii?Q?cMkJ1ORlBl80+47AKIKqG7+A32dHKU3nKHUm6/VfT+RD61rZt0N+DBJB0pYC?=
 =?us-ascii?Q?rgh+A4IbrLTI87e7v+mmDR5GroSQUG12kq1j1ndFoKHNj6AyrASRS2dZdy2L?=
 =?us-ascii?Q?kVgQsjKJAoswkK2oPdCpyCEl68UJ3VvcJI4zCUdXeAexpxwL9iQNS0vbrxZ9?=
 =?us-ascii?Q?jrdRlgs1DQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: a9a77db0-d9cb-4b61-43bd-08de63fdd403
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 14:58:17.0635
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q5ASCj5SRL9Xspp4BBjnrVGvhxjlSXLq97qIPgJ7fovBy1Zy/hl4orTsfRKrrovf7xP6CoKL61VY1xWhBOmvKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB2615
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 14:58:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230540

Add ptest support to enable automated testing of libconfig
using ptest-runner.

The implementation uses libtool --mode=3Dinstall to properly
install test binaries, avoiding issues with libtool wrapper
scripts. Tests are built via 'make check TESTS=3D' to compile
without running during the build phase.

The test suite includes 16 tests covering parsing, formatting,
binary/hex values, escaped strings, and various edge cases.
All tests pass successfully on qemux86-64 :
START: ptest-runner
BEGIN: /usr/lib/libconfig/ptest
[TEST] ParsingAndFormatting
parsing testdata/input_0.cfg
parsing testdata/input_1.cfg
parsing testdata/input_2.cfg
parsing testdata/input_3.cfg
parsing testdata/input_4.cfg
parsing testdata/input_5.cfg
parsing testdata/input_6.cfg
parsing testdata/input_7.cfg
[ OK ] ParsingAndFormatting

[TEST] ParseInvalidFiles
[ OK ] ParseInvalidFiles

[TEST] ParseInvalidStrings
[ OK ] ParseInvalidStrings

[TEST] BigInt1
[ OK ] BigInt1

[TEST] BigInt2
[ OK ] BigInt2

[TEST] BigInt3
[ OK ] BigInt3

[TEST] BigInt4
[ OK ] BigInt4

[TEST] BigInt5
[ OK ] BigInt5

[TEST] BigInt6
[ OK ] BigInt6

[TEST] BigInt7
[ OK ] BigInt7

[TEST] RemoveSetting
[ OK ] RemoveSetting

[TEST] EscapedStrings
[ OK ] EscapedStrings

[TEST] OverrideSetting
[ OK ] OverrideSetting

[TEST] SettingLookups
[ OK ] SettingLookups

[TEST] ReadStream
[ OK ] ReadStream

[TEST] BinaryAndHex
some auto big hex: 4294967296
some auto big bin: 8589934591
negativehex: -1430532899
[ OK ] BinaryAndHex

16 tests; 16 passed, 0 failed
PASS: libconfig_tests
DURATION: 0
END: /usr/lib/libconfig/ptest
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Change-Id: Ibd69ccd63ce0168571d46a199c08be59ea748d69
Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>

---
Changes in v3:
- Use ${B}/libtool instead of libtool from PATH
- Fixes TMPDIR build path leakage
- Resolves ptest runtime dependency QA warnings

Changes in v2:
- Removed RDEPENDS on bash
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../libconfig/libconfig/run-ptest             | 16 ++++++++++++++++
 .../libconfig/libconfig_1.8.2.bb              | 19 ++++++++++++++++++-
 3 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100755 meta/recipes-extended/libconfig/libconfig/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index 739995bcfe..7c5810f252 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -29,6 +29,7 @@ PTESTS_FAST =3D "\
     json-c \
     json-glib \
     libcheck \
+    libconfig \
     libconvert-asn1-perl \
     libexif \
     libgpg-error\
diff --git a/meta/recipes-extended/libconfig/libconfig/run-ptest b/meta/rec=
ipes-extended/libconfig/libconfig/run-ptest
new file mode 100755
index 0000000000..d81fcf4def
--- /dev/null
+++ b/meta/recipes-extended/libconfig/libconfig/run-ptest
@@ -0,0 +1,16 @@
+#!/bin/sh
+
+cd tests
+
+for t in libconfig_tests; do
+    if [ -x ./$t ]; then
+        ./$t
+        if [ $? -eq 0 ]; then
+            echo "PASS: $t"
+        else
+            echo "FAIL: $t"
+        fi
+    else
+        echo "SKIP: $t"
+    fi
+done
diff --git a/meta/recipes-extended/libconfig/libconfig_1.8.2.bb b/meta/reci=
pes-extended/libconfig/libconfig_1.8.2.bb
index 6e08a7b04b..7a17791aeb 100644
--- a/meta/recipes-extended/libconfig/libconfig_1.8.2.bb
+++ b/meta/recipes-extended/libconfig/libconfig_1.8.2.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING.LIB;md5=3D17c8e32f0f72=
580cc2906b409d46b5ac"
=20
 SRC_URI =3D " \
     git://github.com/hyperrealm/libconfig.git;protocol=3Dhttps;branch=3Dma=
ster;tag=3Dv${PV} \
+    file://run-ptest \
 "
 SRCREV =3D "a42cb47c1526a4f2ed025fcbb2289863375bc898"
=20
@@ -17,7 +18,7 @@ DEPENDS +=3D "bison-native flex-native"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "^v(?P<pver>\d+(\.\d+)+)$"
=20
-inherit autotools pkgconfig
+inherit autotools pkgconfig ptest
=20
 PACKAGE_BEFORE_PN =3D "${PN}++"
 FILES:${PN}++ =3D "${libdir}/${BPN}++*${SOLIBS}"
@@ -27,3 +28,19 @@ do_compile:prepend() {
     rm -f ${S}/lib/grammar.[ch]
     rm -f ${S}/lib/scanner.[ch]
 }
+
+do_compile_ptest() {
+    oe_runmake -C tests check TESTS=3D
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+
+    if [ -f ${B}/tests/libconfig_tests ]; then
+        ${B}/libtool --mode=3Dinstall install -m 0755 ${B}/tests/libconfig=
_tests ${D}${PTEST_PATH}/tests/libconfig_tests
+    fi
+
+    if [ -d ${S}/tests/testdata ]; then
+        cp -r ${S}/tests/testdata ${D}${PTEST_PATH}/tests/
+    fi
+}
--=20
2.43.0


