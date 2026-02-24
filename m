Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F96EF3C992
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 15:04:04 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22215.1771945437382009932
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 07:03:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=iMttHhGf;
 spf=pass (domain: est.tech, ip: 52.101.84.67, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x8X7+xHEpihTwLc1RLZNOW8feSK+zyuD1yRvq9FqxmWlM4emSM0GbLKjDaR8x3U+3CS2EgKoI2+w/DCfqubOLix21B2RnZ7uyqDR318SR0T1N3u4pp4IeYTxX3Ul2ity2hFVVlNbeyy0ubSdZQtqFWWYifDB3/8zh3zOl4xlSSwHW0xdkOIDI49bE9A4DJEDeYi97+JmD1SJbO4n4K5mqrGBeU6+h9LIU6mZeDKEZJChBwd11NXKZSkYaGW18dJg8PcV1MCPOljareBigCKXFE7G7iRPf9bPeNyWH/JcuBVyhmJmTIRxeZhe1Ynt+Uzissd/SgLwnQHexVWCvlgRtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YiUsZA2K69b9xbVXeqrDReMWrFW9aZMoJsnSm7n7vcM=;
 b=rchphFi2Vho/8KRKCineXw623YVeQyUex2P8Ujoo3UlEXCs6gNuTbPEswdEAX39FBwiSgcLSwp0YYYBZJFTM3x17ilucehEIBtpNbiUidHBQNGBZjBNp/6KEzZ/q3O4l2IJ1ZQvcsZyjLQwauPlpWysZm7JxAm+Fk+V47fyeK8DGBIEcVJDHHO1FXsPRf+J4j1Mp6kxx8DHEV/Vgu2ASRveSoNFKjgnXz4Fk64+KTbcnyuYwwy4BZnWzX0kZkUeo8NI9JLe7C4u0OxH+diQ8JtqEUPSEezh76QoPrq7c164zUlQNFRXMHK79SXXAovwAiJQ7Z6JNwYDHB9h4lXsNNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YiUsZA2K69b9xbVXeqrDReMWrFW9aZMoJsnSm7n7vcM=;
 b=iMttHhGfOBKDrE0SUNKDt7FzL/iHRT+yBJNJycClY+gWJd63xVfj60f4r1w2GHcNGUVs0GIeRMmTpIE6oigWS+1gj5J8Y6cx3VDH0B/rR/6JMxvRQYLXJbvUu04A0RW9gcpkWYNWGvGuv1Jun/5+i9mRSVuzEgk8LZRRDcd9bKhEqEsAnNTb2fJKq3NfNNgzCpzRyqiZIPpPi7ZMXsVOFO4BEj/IxGsNX8ReyzEWjuKP7OlqlKe2mqRwf09hOFddf1qfvs3I+uFd3MeBsO56+Zw96KHEtkwrmf9r/KNFsZhIhMFGiRufqTbsrv+2DRcLJ2VqqjTA+hXhtRMpx1rSyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by AM4P189MB3521.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6e2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 15:03:53 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 15:03:53 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][whinlatter][PATCH v1] libarchive: backport libarchive ptest to whinlatter
Date: Tue, 24 Feb 2026 16:03:48 +0100
Message-ID: <20260224150348.57934-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0051.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::15) To GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:26e::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2P189MB3005:EE_|AM4P189MB3521:EE_
X-MS-Office365-Filtering-Correlation-Id: 338d9a87-b608-4df8-b44e-08de73b5ec90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?4Y7ThO+5KtSnzSMml+Z/XRwMC1O8S042hHWVAVz27d7Rph2qPsc02hlhP0z+?=
 =?us-ascii?Q?w2uIIzCFADSMfTCeNd2aIgZS05e+Y8ZSNWGANNh9f+cu/LoDGO+C4GO4IuNE?=
 =?us-ascii?Q?8DFXGQvVdqSG9TLu+h0FLDgVqiiI8sWgetVIG5wzLvnYCX1BclskT+qWJTUk?=
 =?us-ascii?Q?iuHOMuIwmq3M1MjWFTITVWKds5dDdAMZmWbAvaUn3cDhk2F9gMxjdTKuDica?=
 =?us-ascii?Q?mvbPF48XhX+421kq/Jehb9Dv7z6zWQA1YqGjR4QWkfeowm2lQ+w3VF5FM3uI?=
 =?us-ascii?Q?dDAaEt/KkMIoMT2am37VCee3RuMP0j3sJ0aPeJKEc+Q5MX4+o/+Wcty4Ftew?=
 =?us-ascii?Q?bB+g5ko4ALZvmHYZa7MwMc6kZQg70G/6Q0Qqu0QOvUFHwAakVy2T93AxY9jj?=
 =?us-ascii?Q?iLyKbKXYr+HQHF2i08RnueI5zDxw3cz8GupMIAI/N8ge64OXW5FMyCGdEqs1?=
 =?us-ascii?Q?b7I8WdoUYz7zT7BKwWwcLAbqFltrbEM+HDanmbl1V5ZAiLmyOw/lIcUlXBpn?=
 =?us-ascii?Q?J0RHkmaf7rWf5EpweKvAQabBQZayStd5BvxIEUw2aCieAr/7omAjmAGQ81v3?=
 =?us-ascii?Q?hwVMFAXcy3h7/t5W7f9O9YkNaXiy89fFjBVnGCpq02d9ZEuIfh81x5qdk5lF?=
 =?us-ascii?Q?JgmUR6jBZTNRpnQMiKkxIc8iedShKHeCiknF/qW+W9c7r9JiGtreisEgbdHa?=
 =?us-ascii?Q?DpSEJlD+oTVHNWtbcBpMFlIzObLdaULx02IIzhOntsqoqIifg9cEiaUNwj5Q?=
 =?us-ascii?Q?VaK+Bnag/dPI90l76RsF7yyJExXtm08qmEgm7k40IuGlTDWoZpdEMTysTzRG?=
 =?us-ascii?Q?JtLjHWbPvuih2/oGmGI9spVXeUsr7hDM6qvJmD/NVA0zwy5RvtB63PiCoZhw?=
 =?us-ascii?Q?Q13WygAjCisSk2h/ioal+NtB+x1+3kq49K0/ilpFdFM9pTGWJg2Q+ieiYzvU?=
 =?us-ascii?Q?MVKsDGt2e/ZUBHzjw7v/ixglPcK9/34sPv04XTnnCoYr+Iit73oMCftAxM4H?=
 =?us-ascii?Q?9nxlDW3s2AYfhpXddkPZd0JL4N5RenUnY/TG36R/w9hk4aMUos+/IRx1vvEf?=
 =?us-ascii?Q?oFavzAiKmIUPDE9hA2LOtIn4xYy3uTgZK3U4I/T/IZIq4JY3G9kKwa4vnqg1?=
 =?us-ascii?Q?78mj3ZvFp9IRnSEAzqdHfX2IVUCTuckBPQAX/aIiSVk3XCWLs84Y3+hIUCbx?=
 =?us-ascii?Q?fT1X46xrsSQyp6v7U0jifulwdGCpPLmsq3bhPOlmyup5kULvrrzFJJXPA26J?=
 =?us-ascii?Q?VvGqFtNNGATMkypEpPtNYQOX+ADFF9mPU0qE8cI3OQA+IpMrlOYCR0dAy8qY?=
 =?us-ascii?Q?hoUbGGjy+Mi25lZ4c2W3KO7OCmc8OuZ13YEbk4jhXLhI5SuaCfkzVMjRihms?=
 =?us-ascii?Q?yJg2HRZhIPUVCj+yUsuHajrqr5j8MM2LD+2gJwvt5L5ykKlDIY0x3+jKoRbZ?=
 =?us-ascii?Q?hzmzHNa+qLS5OzB+e6PR95ooLQwq57ME+OK44Ufqz0L/fQTtOrF8caSaF1A8?=
 =?us-ascii?Q?7NPycc13jpJAS+xY+5aqM6T8DO0voMJGu7er?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mFT12tjmBlOJN5toPtdiqc9Syp5eJGwSYz6JE/21HBlUvnh25Tqyb4yFgcR8?=
 =?us-ascii?Q?eCo5HlleUhfU+SYYvIBvEtAsNzmKwXcmlL40JyrA1RpEeWl80/ipy/jhIDgH?=
 =?us-ascii?Q?R50e6453ybWe5HjWWi6kxBrzODFBVnLGB4i794E4WLMrIUMiHUhbZafYw1M6?=
 =?us-ascii?Q?r2ahHyXe+YvLC/EScCIuVgBOd264agJxyFFya0Qdjv8fnRENvRWpcQEdXCii?=
 =?us-ascii?Q?jAZ6bsLtsFW0iPJM8Caw7GRNKx5uiLMdPZeS8Ze724aGwcDamOruWWbxWPGO?=
 =?us-ascii?Q?vrEyHk5pQmF7Wm54KgyxeWtzpZqtCMZS3aTOZKhrNKIOZX4or+3mT9hcgRuw?=
 =?us-ascii?Q?W+7ShyyzonY2j1mjSfnw7Jg/4nQ7t0jIsBMVUqvZeGI5Yc0n5Vea+2Cm7n+Y?=
 =?us-ascii?Q?+VzI4MijjeibVSjNhCG3bBmiH2MYT+4wSqMycXcVGdSHJtwYj5DBRq+pMrwd?=
 =?us-ascii?Q?rXxM+ev5DE1UeWDyweqIYfsv1/vonh7eQq/huQj1CmKXSmQg2+lo9u36gOpT?=
 =?us-ascii?Q?Trwpp0zuTe4f9dYPpGspppywEbzCe95hJTySdvYOQkMdZZS2BnePPm9II6DZ?=
 =?us-ascii?Q?0Yebm+45R/5hmzbsl3hrr3FuAK21Gm+NWfyoiCM8fzqUPPqvPqXtuscwVG+T?=
 =?us-ascii?Q?s/hUKfL6rVZhufiFkSN+P1CogEp0jeHNszV+h8a3IuDezZKh28p4JmK3uo/Z?=
 =?us-ascii?Q?aiybHoPwTdWfFWl7hW2wtBU4BzqsXcNXy5MivU9QVI3GME9HNl/+CjsjtHU6?=
 =?us-ascii?Q?cWvJdpi5Hh2uxtkBjO1M3Wwi9Cd0YKddWktvBz40gF3gx+qD1mFXIJbS3Sdw?=
 =?us-ascii?Q?dgbZNrt3eTdH/hpOqOmSAg+JYxjRPox523PE4OHp9V65+/AGEb/5HMLBI2Gb?=
 =?us-ascii?Q?6swd/gEOXtmIGrhBItIL7hPZudT8FW9LXyu3uHcYmwSSbyrF5vuJpJBCZZAB?=
 =?us-ascii?Q?Ae1TdamBdVQnb/9Zub1JtNQI3waWQlAVLHGU56lS70Nun29YJF60TPZqjagQ?=
 =?us-ascii?Q?ftSUmTCP3pV36nJ4A+ocWXvrWV8Z8ztPywgvb531mO26pcqIL5YVuWqOhd0/?=
 =?us-ascii?Q?737jSuYo1o8axoFKGLVSSuxKXWefu7LHaz60pfdmfjeWrSetUFJ5BGB7a47A?=
 =?us-ascii?Q?p6Xw26FuIHrCFYrAplsJca9yvIgKV7/rPYQfQy1zyTpVI0bC3z9rZdjVS4Cl?=
 =?us-ascii?Q?1clI6ZqZ71SBPCRRrAEyRqz5vcO9i1b4P5Qvtel8QCxHDNneov+dA1VbJNAz?=
 =?us-ascii?Q?ki0/D1G5wr39gVFJVXLaVBLXhDkIcVJK2P11qLbrNWNB0gU0C5IidsCjxL5n?=
 =?us-ascii?Q?k+kNJe56JzYsx1lFv1mGTQ+w23BVXxEjxQXojTwL1NGtKVQkRgggWGWfuDL+?=
 =?us-ascii?Q?IzwiI+L8MgDNIynsorbZS8zvbOeqv1F0LM2YD/jitVOTH5WVAZIQWw+7Ic1Y?=
 =?us-ascii?Q?yUU5/9xVkUZJMoexaFdXcvgxLfDVt0D+am97kbp+nHErjI+hXIxmYYmkPPQc?=
 =?us-ascii?Q?aeM2o6m9xXwcl0NWwzumCcn7079xF4BtHfjw4To3/Kj52jwQ1M4SSEwmS1ga?=
 =?us-ascii?Q?6rIIuaykHruDByMEM1xi7/+8AhBOzdRv7xCHVuHxgEylGPp6ru+5MHrEch5Y?=
 =?us-ascii?Q?9PIc2wPBE+a/B5DOfLh6YhxAn+6LuZb4hTOFaDcSZEDM5figalz8WcS5iORV?=
 =?us-ascii?Q?JgWFr3hMPr0BFISb9JXNX/nklIVhj1f6eeaiTJqr8itF1H0226LsPRsgsVNN?=
 =?us-ascii?Q?MXZxQGdH+Q=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 338d9a87-b608-4df8-b44e-08de73b5ec90
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 15:03:52.9972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6kFhCIiahTXJosFDNTjVdMFNX3vc0MN7LGI50pPhqARVK+KCj6Hgk7XwHu3mn10cz70wBQg8zHGPAWUKsg57NQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4P189MB3521
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 15:04:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231864

Backport ptest implementation from master branch to enable comprehensive
testing of libarchive functionality in the whinlatter release.

The implementation builds and installs five test suites:
libarchive_test, bsdtar_test, bsdcpio_test, bsdcat_test, and
bsdunzip_test, along with their test data files.

Test executables for bsdtar, bsdcpio, bsdcat, and bsdunzip are
provided via symlinks to the installed binaries.

All tests on qemux86-64 pass:
  libarchive_test: 689 tests
  bsdtar_test: 76 tests
  bsdcpio_test: 49 tests
  bsdcat_test: 18 tests
  bsdunzip_test: 8 tests

This backport ensures the whinlatter branch has the same comprehensive
test coverage as master, improving quality assurance and catching
regressions early.

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../libarchive/libarchive/run-ptest           | 10 ++++++
 .../libarchive/libarchive_3.8.5.bb            | 31 +++++++++++++++++--
 3 files changed, 40 insertions(+), 2 deletions(-)
 create mode 100755 meta/recipes-extended/libarchive/libarchive/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index 06d113e264..a70ad52f72 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -28,6 +28,7 @@ PTESTS_FAST =3D "\
     icu \
     json-c \
     json-glib \
+    libarchive \
     libconvert-asn1-perl \
     libexif \
     libgpg-error\
diff --git a/meta/recipes-extended/libarchive/libarchive/run-ptest b/meta/r=
ecipes-extended/libarchive/libarchive/run-ptest
new file mode 100755
index 0000000000..36d982917c
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/run-ptest
@@ -0,0 +1,10 @@
+#!/bin/sh
+
+for t in libarchive_test bsdtar_test bsdcpio_test bsdcat_test bsdunzip_tes=
t; do
+    ./$t
+    if [ $? -eq 0 ]; then
+        echo "PASS: $t"
+    else
+        echo "FAIL: $t"
+    fi
+done
diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.5.bb b/meta/re=
cipes-extended/libarchive/libarchive_3.8.5.bb
index fcfaf5d231..b074617141 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.8.5.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.5.bb
@@ -29,12 +29,15 @@ PACKAGECONFIG[zstd] =3D "--with-zstd,--without-zstd,zst=
d,"
=20
 EXTRA_OECONF +=3D "--enable-largefile --without-iconv"
=20
-SRC_URI =3D "https://libarchive.org/downloads/libarchive-${PV}.tar.gz"
+SRC_URI =3D "https://libarchive.org/downloads/libarchive-${PV}.tar.gz \
+           file://run-ptest \
+          "
+
 UPSTREAM_CHECK_URI =3D "https://www.libarchive.org/"
=20
 SRC_URI[sha256sum] =3D "8a60f3a7bfd59c54ce82ae805a93dba65defd04148c3333b7e=
aa2102f03b7ffd"
=20
-inherit autotools update-alternatives pkgconfig
+inherit autotools update-alternatives pkgconfig ptest
=20
 CPPFLAGS +=3D "-I${WORKDIR}/extra-includes"
=20
@@ -62,3 +65,27 @@ ALTERNATIVE_LINK_NAME[cpio] =3D "${base_bindir}/cpio"
 ALTERNATIVE_TARGET[cpio] =3D "${bindir}/bsdcpio"
=20
 BBCLASSEXTEND =3D "native nativesdk"
+
+do_compile_ptest() {
+    oe_runmake check TESTS=3D
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}
+
+    for test in libarchive_test bsdtar_test bsdcpio_test bsdcat_test bsdun=
zip_test; do
+            ${B}/libtool --mode=3Dinstall install -m 0755 ${B}/$test ${D}$=
{PTEST_PATH}/$test
+    done
+
+    for dir in libarchive tar cpio cat unzip; do
+            install -d ${D}${PTEST_PATH}/$dir/test
+            cp -r ${S}/$dir/test/* ${D}${PTEST_PATH}/$dir/test/
+    done
+
+    ln -sf ${bindir}/bsdtar ${D}${PTEST_PATH}/bsdtar
+    ln -sf ${bindir}/bsdcpio ${D}${PTEST_PATH}/bsdcpio
+    ln -sf ${bindir}/bsdcat ${D}${PTEST_PATH}/bsdcat
+    ln -sf ${bindir}/bsdunzip ${D}${PTEST_PATH}/bsdunzip
+}
+
+RDEPENDS:${PN}-ptest +=3D "bsdtar bsdcpio"
--=20
2.43.0


