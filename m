Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62117D3F066
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 14:06:53 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.58])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14011.1769609210787583094
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jan 2026 06:06:51 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=ehHjPaDD;
 spf=pass (domain: est.tech, ip: 52.101.84.58, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UOol0DotJnCJPD1BuwVRDHYSHSTMxIbXUm5oaECqnmIglCjhb3PmignNpxJJHE6k70ULcx7hI5wGqzn5C66cQuIX8Zp5bffj0KQ3Ic1n7pDgFJhHgBid75rAXKPH1sfkDyqD5C+9i2Nzutv0nRWSF1bKqJgYHv68+AA+k8/Euv0WAgP6lK4WVllE6s0BC2A4SUsDsGSbT/LRhHrs0LqCWMphISo3UPXghCbNXPoCbsYczUyUAd216yZZV0uyU9xeLTXyd4tFctD0br/bvkkfcdIGcZrdUuSZsAOvBmo1OZv7S9w3szYW/6tQdEhwFsD5Li518IMlngCocivlLQFQQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uuKWAfmKC0TpMdkTyF1Bs8kvOtwScLG8Q5sP9J+/gKo=;
 b=fvF5oucErgp0kZ1nDlFxZXZtfU914kQrNKDhx7oLYbqJlrT5wqEQ9zOVMN4iZw2GtCFwVkWAViAi19P2gRqkvPcgFrRsgmX8jeCxVGNZLhGBXaFSXWMUl3cl3WuSkMlJCgAxpbItZg16/5xkawfKZkFdiTId8yaluMfIVyM5TJjRqz0d8f11+DLCIGEofXGq07sxmVYYgiStXW3R0Lw16QJK0wHb7K8ekyAwTqCZ20BqATXneuFVVT0tLbdZhcHdHE2q/MJwwqW89Od0l9R1cj1VTPLFQyz/OkPDeSm5du1uVg6nzQKMmLNOCY0MPReFzolmGp95AH2S6r46w6sM6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uuKWAfmKC0TpMdkTyF1Bs8kvOtwScLG8Q5sP9J+/gKo=;
 b=ehHjPaDDcJRLEGqAPr9eukHW9mgXmUOC1mBOi5e5wjzPPrKwLtadaAdbaYD8sma4sUx7nE7maHPxXz64PlBJzZmbRiYGk53ulpavByJOs9QqWPj3st3Dy8F43bkMY/UZMWT/SvSo3frbAAfZn2tStliTUvb242KiNSWk36Bw5bA1VH7rB4O63z4AEqM1XQDJcm5R0XBxLSqaG1DOZPh+UAxjEU9vSoT16B8I0lJ53kcaKL0wM+4giYqllVc5CuBB+OXHOdlPWgP1ZDiBoEqxGZZrPEDPSioNsBnTFTq3uKhmGpsYLiYMKrohXi/6Xg+QR0e7I1dDuLZhggPrddc5ng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by GV1P189MB3097.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:25b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 14:06:46 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::c13f:ef4:ecf2:85af]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::c13f:ef4:ecf2:85af%4]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 14:06:45 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v1] libconfig: add ptest support
Date: Wed, 28 Jan 2026 15:06:35 +0100
Message-ID: <20260128140635.43214-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0061.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::12) To GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:26e::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2P189MB3005:EE_|GV1P189MB3097:EE_
X-MS-Office365-Filtering-Correlation-Id: f8ea859b-cfd3-43cf-72de-08de5e767864
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/Z3SFztFVTDjx8WAZXNAHRYCQOxNCdpBfjw91gdoI5rMuK5MyjBhz42PWEI2?=
 =?us-ascii?Q?FFh9dWahcCNXfq7IgjMy6lFAsAMRq2yr0nVbGAi4nWD0lWACbxGHG/nSlEg1?=
 =?us-ascii?Q?iiZ+PyGoi3kfHhCDRfEyShIeyZj+PArgr/I7Wvt25pyorLpAbXN8mPmFcgyW?=
 =?us-ascii?Q?2czO/ht8vooAW0SJbEJZBnI24Y5pTb5QIZgS8TQYMGyaA3UKSGcipsZZIvAA?=
 =?us-ascii?Q?uDmCodqVAsDX6AXFfizfs/3IhG7bnnnjVCXmBvbBrVRvZ/I/7DDgQh6GVuj1?=
 =?us-ascii?Q?DW54zCdBvNC8wiHudDehI9G2zouOJdLVVdJ3ZaLlovoxh0G8G/aY1MDlwaNU?=
 =?us-ascii?Q?UKjTUKh8X26terSjOrVrryvWFD5kETnrvIr31u2Q2NwgYGsCaFL3qsEU8y3J?=
 =?us-ascii?Q?X2QmUIVXZ0hW6ngbR66s679Vs3Xf8DSxk3fIhV58FPEblR94UUEV+XyKe5tH?=
 =?us-ascii?Q?+285UbnHc33sM6k0QqcPIxOQ4FXKa2ZYHwQ5m9YQgQ6VmuyBVtsWndvvQGhi?=
 =?us-ascii?Q?O5DdTBjI9WsaSNJlkbiCPkLF2vzaGIU22O86pBfRc/1QtOVX6x/AO4cKwT4Y?=
 =?us-ascii?Q?Q2q6LIWd7/5TfvcQrk0sH3D5pkMDPL4I4Nnv9igEmE+2NbiGn7ZM9R3BaIJo?=
 =?us-ascii?Q?xve+Z5cWh55M9RYMAfBVFIziRNNFSe5LfyOUD6kgbF0LwZN4uR7q0A6jg2sI?=
 =?us-ascii?Q?YocDV+ikP00JVg/tyaFP74L2AgRSWTDyxukBuZao3PDk5a/Ho432UXG1d68V?=
 =?us-ascii?Q?a6ld/inTB8QpskwT9Ffskt7Xdz/fSr6JyC/9XMIUSgLtiU5VT/GmNH3YTNbi?=
 =?us-ascii?Q?81YgbXDNCijkp1QxW+E8oou0kmFEDJmYQ9f+xQeOsUgjU2tHdYzdSNLs/8Y1?=
 =?us-ascii?Q?UHF0k87m44LZ1111PrUW4ZboE9GfPDby2W3+RQZaxqXVQZdmF3WjZBSmJFUY?=
 =?us-ascii?Q?kSR93gI64lQAN/S0YvJpFTihWj8FISRUQ6Ah9vuqsq9h4LgFvJdhTq67ufCS?=
 =?us-ascii?Q?lZs+Pv5Hp+opFnYl48rOLfNtTm9gH9NwS0QNOY54KfL2Uru3WdVo0io4o+Wo?=
 =?us-ascii?Q?x3CwBCcpTR/GoeKbAGo2v48ie3vnHcLvQ6jlXoUPs775ss2wmTzzIyG2dOTX?=
 =?us-ascii?Q?3RRHH/JdP5JWQU9o6v7rVyHdEIdLDrhykDriYPk2KLhKzddV4be/X7Y3h7Ot?=
 =?us-ascii?Q?qoGH5a9gkWwh1VI083vlfiezRXHNe6DF5t2zxKwZ5STzAmH2o4ZXe0RMVNb+?=
 =?us-ascii?Q?7SwABlkAXmMm3GmRdDrIViQTzCIHDULPaA38GOWmQVOHuVhzogOBruDjmP64?=
 =?us-ascii?Q?BdKSQc5ZhJMXt3ib6M6LjFcpHJGioUcaki/J351HG+MpKrHnIzBvMCQuWiKs?=
 =?us-ascii?Q?7ifd47tOVo67V8MfUrWmnwt8f2kvY0Su+ZwMhBAKePb/JzBUE+CEu6iKFpxR?=
 =?us-ascii?Q?rznvwjl74kJI8VeVYS59HBc0MBRxs3AJCq+DthYK3MKa0ll3CBTsfPNpUIW/?=
 =?us-ascii?Q?dlIodSkPL5/3/MLc9JZmBRs069yt0CgfJT4cwe7QYnl9pdKrLbbYnNhuSQfT?=
 =?us-ascii?Q?80j+5yQv5apnoR7JB/E=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?o4l6YSKB7UlwKslzyaxVeUF7coF4G78KJlplyotaUtC8/um14V5MQpF/1Hl8?=
 =?us-ascii?Q?H3PQCcE913QopwdqrvcO6S4WMbn5Gkez+KB85yQvXluqv14y2kICObEh99pw?=
 =?us-ascii?Q?qXiPJvBIS9FCeEdaJgwiGwZTEKoM5qFJh/FQ0WyNStCztOxDyMGVfBQIx416?=
 =?us-ascii?Q?2olvRIp6kJD9yrFhP4JIWDizBSuORZ4MxQpqMWf2Pb4IB5pLnNXvE1XKuWwi?=
 =?us-ascii?Q?gE7FFVEfqNFThTKuZ2STqLcCJCMeRGJg4Ow3vIpEeJDOt1diBMg6BgTFB2nC?=
 =?us-ascii?Q?OozEZyhtCFWl3uPv17ypkSLNW10xNioR/n3xW/qqjKVkKLXNLr9x+a+i3Nn2?=
 =?us-ascii?Q?1EJ/RtGnL/ZNxlAq/dkk33B4TzjcWG4QgTDMbMxhNclzS7T8etQz7DC5SXQe?=
 =?us-ascii?Q?/keD2Yc/nVgLbruBXfQrtZ5k1Hm4A3x8vgRrkc1ZePmtbNEyxwZjIT0EivFZ?=
 =?us-ascii?Q?yRXUNfknVd11x1ijnsGZhKXk/ppNTZW1Jy8xpVbyqJSeiHtZ5TJ/SXvMEtQI?=
 =?us-ascii?Q?cnctSG/LLBRRAhYkq9HMLvaTNaLwFfXJYUsia7VR7Ym1tHpYMKHCxAj7YRGo?=
 =?us-ascii?Q?X2OZ8WF+nu+y9l+2jWwwmo9Nstbv8maHbjD8BQXRdOZHEb67DLg6ojss20lC?=
 =?us-ascii?Q?zM/vsXxbapVwmuw9ZLfrj1bVcfjfj3SqF8FubPSs3BYLu1NTeOwbGKV2FfQJ?=
 =?us-ascii?Q?8b0ijH9vcbnqa9/3bjVnQrhEeWX8zEaoSD3NzR/0kOE4DYWn1/1r95oh6lAO?=
 =?us-ascii?Q?dpqceSJ61KT+7l9GGucCme78gKzBzGm0sUiTRJgQ6djn82IwFG3gn2Uexh2k?=
 =?us-ascii?Q?HEY1cJ+XAFBhLTVkkvrjpbdwhyjj74Teo4h6NFETagpmMOkxRn4SXtWzdVTW?=
 =?us-ascii?Q?6qwimUdj2IxS0+HmkyhInAR8DlSjEqhu0R782ZWWJssc691UsCk+GtN6cNUS?=
 =?us-ascii?Q?Ynw6klZOM9DRjjflyMYcu13gEJEWAVZXL2twS4xYN5skU/gBbCfwgvymLSfK?=
 =?us-ascii?Q?5gdFSJSDSR7+CiKVNipcFsk2WYZwA9ZaJvt2PQ02cKws4jAlFjZBOKSl1YvJ?=
 =?us-ascii?Q?6oJpAtOK79KBLu1xHlVjFJdcL85yjJhJjbIeJstq0bGuM6m1LhMRd4VBUKxE?=
 =?us-ascii?Q?K5sv5gp6OJo7HzMtgUm40mllAAIEFxF8X7yFGQrfJVpHhr2Hy4RfMHN9os5n?=
 =?us-ascii?Q?uWOY4caVUYmaa9OLE6oz5/GVEQFE+F3Cdktjv4jaZcA7PReSwXlZJaxF2Lh5?=
 =?us-ascii?Q?dk/TCv9NKHQHY90iQ4YWOK5PDnKtL/dvp5bZ9oFlgC+WUo8gsiSdhDWOPsiB?=
 =?us-ascii?Q?CzaQZYE40lhq0jFMAWk2F9yuP5a8PhYU6vqIZx5J8XQBf9KhcnacBXTX86Zj?=
 =?us-ascii?Q?6iKVJw9tIdjKAMQ1e5Tpl04W5dWJ33EIQTEn6gUjBEsQVaX48KHjux7xOkU/?=
 =?us-ascii?Q?fgAKTTGWYKnasez/KHBnBVeXjnYeMB2oEMWqLmWGkvo/tXRqWAGLvK8PGpcw?=
 =?us-ascii?Q?smQCc5C2+ac3lUC0JN2x9AW7FEOSU9h5C7QC3qF+VT8f6wXrMJvbNOPitTkZ?=
 =?us-ascii?Q?72OsX/1ZeLfDP6EpPFHwbnmIfS5LgVYvIqlwsOSFYroIUljKmobyeQCkz4lt?=
 =?us-ascii?Q?MVaV5KtnlYzTaGgasdEgU2Xpj0cC0RsGHJQob7zvZPbaEnNhCUc9DQz8Y4qg?=
 =?us-ascii?Q?cupDRiE0IFSP8Ts9AuRxpNevV/NirPMEfV/K/znMcS0TcfONl0QMWTJHl01i?=
 =?us-ascii?Q?mMc5FwKGzQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: f8ea859b-cfd3-43cf-72de-08de5e767864
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 14:06:45.4918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i4JfMUVEY+Til6SrdoUie+mrysvSsHB3ONIvnnFOGcHRr/Jem5HthrzQceENBotBUQnfuy9xYYL6HkE31zzKhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB3097
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jan 2026 14:06:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230097

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
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../libconfig/libconfig/run-ptest             | 16 ++++++++++++++
 .../libconfig/libconfig_1.8.2.bb              | 21 ++++++++++++++++++-
 3 files changed, 37 insertions(+), 1 deletion(-)
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
index 6e08a7b04b..9ae0ce2e6e 100644
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
@@ -27,3 +28,21 @@ do_compile:prepend() {
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
+        libtool --mode=3Dinstall install -m 0755 ${B}/tests/libconfig_test=
s ${D}${PTEST_PATH}/tests/libconfig_tests
+    fi
+
+    if [ -d ${S}/tests/testdata ]; then
+        cp -r ${S}/tests/testdata ${D}${PTEST_PATH}/tests/
+    fi
+}
+
+RDEPENDS:${PN}-ptest +=3D "bash"
--=20
2.43.0


