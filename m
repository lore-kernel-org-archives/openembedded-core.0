Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2917EEF06E1
	for <webhook@archiver.kernel.org>; Sun,  8 Feb 2026 18:47:01 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.63])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31313.1770576418397299349
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Feb 2026 10:46:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=vYpGWcF9;
 spf=pass (domain: est.tech, ip: 52.101.84.63, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dS4IoO360SvBvJSD6WmX62LrKrfDHWg0fanQ7+L3SRrqNNJvDCqPpJREAhfEqkaZuTNT6KU2lIxfC9o1+7tAw5hYh/9ZBedS3z18sgout5ngqGF/XpfL7HafMA4/lCaaHZeoahtdsi5vhvU7W5XjYGQ468bwe89YZPduAQd6be/d59n6NodpIre2B0/IN/MgPG/0LaJsb3lvfpail+IgBXXdW9+O2wwp6XsUCH2Bw/wBal29Pj3KQ44uF8hgeL4V8rLnoxc7nTucQu2OY7D/LntfxccKfK9PAPh6CW3w2F9kDpwPkQ4G/jrre/0BpWAsCWMIUfytzR22F84Azb52Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5nidkMI5QODe6K8PDT7nZn84TaPoTECP43hY9nCVTYg=;
 b=rETciEUyUfFZeD3ThpsjwqKBpBc1lgMnb0n1ECBanf5l2x5Kum6EBjPb2US78KfNO2CZxx6wdcps7QrxIFdlKzd9jpHSPxX9f0tgoT4L/Wds0/xomK1dTNvcmI3P+17MQBey7Y1yQKXC/hzOq83H9DZAOshr0M95Yqln5mBLpZlRtkpRedZ0SEI+eWZ2zJ8rYksrMr6qUSHIYwhN2Q+g1bhopQoaappTvpRjyJ4gj0zEEImg0wI0FyfE/hHcTBcKjH/UaUe6iJJt01Fgu5S95dOpdb9q/V262gzLaEZthRHO6VxbtqqbmiRthxnE5vTOWJDKB8IRuYH0p04WXn47Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5nidkMI5QODe6K8PDT7nZn84TaPoTECP43hY9nCVTYg=;
 b=vYpGWcF9U+o5t37xaeJlVz//KlSH4ZFcPVSRCKn3sETvhBVI9Ma5U/cza8ZQE8UmtJ8GcK6wi4rIzUJl9YjNsUc2HpMG708hWAcIRaD56gkvfkt6vPBI6dBVCq65LVfEAIQeJGAAKPAuMP3IWPZ0i+3YZv+IYSwKrJe57rWLrrn4Yk4bJQ07kWd0AArXSyZmopW6eIzIAHMmWTA4SfRM2QN7Muv7WK6bcH2tXfIuSt6bWBIuavL8Bq0IT0SvpG4eFgXFxZN44JK6vjSp72lLO3pjK0iEBsYo0jsRec+c9mRutIMyDuxIG8ZOoEdQfqknkSURSmLjsL7coPGF9KYprw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by VI0P189MB3176.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2c6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Sun, 8 Feb
 2026 18:46:53 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9%4]) with mapi id 15.20.9587.017; Sun, 8 Feb 2026
 18:46:53 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v1] libarchive: add ptest support
Date: Sun,  8 Feb 2026 19:46:37 +0100
Message-ID: <20260208184637.14046-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0690.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:37b::7) To GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:26e::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2P189MB3005:EE_|VI0P189MB3176:EE_
X-MS-Office365-Filtering-Correlation-Id: b9cb6297-146f-43f8-e319-08de67426cf9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Vjp3IrqMKOWNafeK/uhPglmMVr4zEiSjMCcXw0ElxCfXzVICOKK/62B/1zpR?=
 =?us-ascii?Q?pQe86JKQSAO2PztTcZ1Wg2/608DbxhiAvc55WBgOTw5QMgINVKOIyPiCGdn2?=
 =?us-ascii?Q?SOIhl9tmPJcqNmYDxcp7QIIO6CjXXO+nGqjjZjEq/6HqO1r3/tJgHEoyzhA2?=
 =?us-ascii?Q?kxaQxGV7WW0bS1tuuLUkNOJiEGR9pCM8HKF5gFFwnlAH+maU8DJf6IlQenV/?=
 =?us-ascii?Q?1Cz9gcflPwcsPzWZgHmUBAls4SpUs9GboRQa4vGoiZMzwcf1rktllSANkKZE?=
 =?us-ascii?Q?K+Cf4qTkI0TGM78e3HvI6oNIqynpuS67LT9n7173FVBNtG51StNq6scRwu1Z?=
 =?us-ascii?Q?ttTvRs4TQoVpJQoMEyiyjG4FDcnezshd0I0x2679hYe4f5m8G0DywK6FDiya?=
 =?us-ascii?Q?6qvO8KSEfIA/hbR6mjQ0Uhm+SVHfpaf8NgyAjWRmi6Hpw7Uy/60Tiv9i84f9?=
 =?us-ascii?Q?0+aO1P76hodzcvzVNnSOrZg9/r0kaowt++FxlJh1ejAaorgeZVsW2tUIPLvh?=
 =?us-ascii?Q?fv1cQb6njsegsg6ng9/ABWWWiNmLeB4VVaObjk9GAUfhnFl6c4Lsl5O6+lV5?=
 =?us-ascii?Q?wo3Jh1lk8DfpIJoop9srQ8AU1azbWWIpJrYwbe5HX1YM6rj4xtwKOpmxRVSC?=
 =?us-ascii?Q?HQHqk3mKkSH8CaaQXCUJ/AW9Bw2Fpy5Nric8YJOiQkj4m7Oa7Yu1xGh4pNnW?=
 =?us-ascii?Q?FUYbpXSbEYswoaL8PrK1cJVvMWdkfDme1lJzIqpPxM28cnCJaNBsdOQkZ9/i?=
 =?us-ascii?Q?sK5XCZx9nJUu2nIZ8lXJwrGa7psys8Z3O+/1CzGzxnwDhBilpYUbPCH2jpFN?=
 =?us-ascii?Q?vx1qCe/b5t3+Bn8/9jV1caMsFNhVVsBjg/af/UKQDQ1/22hUdzIdrefhit+I?=
 =?us-ascii?Q?n2ZrQt73GF1d9qhI35W2cUjAsPMKwm0+Nubic/i47xRjRJ2/R1WjS+ziUegU?=
 =?us-ascii?Q?dy1gCgAIlNcfA3UJpuze8KPIIxlSHm4XCj1J1hz7TIKUt0vhyZjhH4YAYUtG?=
 =?us-ascii?Q?HYMVn4WAYm7Yvd+hU4aBC2m9zvbEI7q/c1dxmuJ6JKuZvymbD01OFSVQvz9C?=
 =?us-ascii?Q?uWRGQcAV7wrLG9cRNbZFSC2Ai0z+RoxcUslfVQXZbuyYxTEJOT7+rxrLhXFp?=
 =?us-ascii?Q?oklgQZFw2VaRGx9bIXV40cOnjAiMtoglWuoO91SlA65l9ie7J2saQUSkZLT6?=
 =?us-ascii?Q?1DBu5EQAh7Thm/lSBY0fUZeC/yqb1wLsoX3El34aTgaqftfiWXoM78jHg+Rg?=
 =?us-ascii?Q?YaFm0D0rkjNujFdHEKQkqY6XCpNnyhQxccaXQ+YaHFBwR1414kkCzDbZPtcQ?=
 =?us-ascii?Q?j/oqHmbJ9zXReJjfFgAmsWbXX4VqPi50vUIKE6FXy0Vm/uhtX3fBasrlhqpw?=
 =?us-ascii?Q?HINy+TxSF/quowMU4e3xzN82Wh+tdmdVPsX1rqkUfUDHua2pu+Yc/1W6qCk8?=
 =?us-ascii?Q?6EHemXIDhh/tCJe+KmQVsciV/e+0P1g1azmbR8oxAsNu/YpkYhuDEDfjA2BA?=
 =?us-ascii?Q?TwKJrA+82ecshh4=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rkdM2C6+47iwgkidQOPJlHULyId3PsbhsBzq671GTMPoXCvTi5EoowxvhkQf?=
 =?us-ascii?Q?nlcFNaZXzAfUIO1WqBOQeO0Sfa1gWOHyThzhpfQI3bvs1IikjFmLpapj88m9?=
 =?us-ascii?Q?KRUyKEgPAmgpWa4xind+/lEdOUBPi0ON2RHnrF4PQIxyoBCNN5nJUIc4+72H?=
 =?us-ascii?Q?p8GveMCWVYR0egxYSBTsOj5ze6ISORZaSqCV7weZ1LfvEO72le/3N2nhXiJP?=
 =?us-ascii?Q?V6HpfLPkDwZuWT+Oz2EvTGo+xopRCGbFGwXSmxCLsRDWqzjGDIWR8tiyiafy?=
 =?us-ascii?Q?Q2awIeNSAulT5d+ITp15wj8yzY/w9es50tMyq0PeJtUHuXz/AxLH7k0yvpdH?=
 =?us-ascii?Q?MLJCH3nN0kEFWwM9zJPI2H58xAqmac/lTF/IppGpqgVWTxXB4FhD2hbEYUNH?=
 =?us-ascii?Q?/4hsmCAFJzkBm8QAf9S9SEpGMTaZkxxA5blyxCybmru3VzRSIlo42Bhns+ZM?=
 =?us-ascii?Q?jFaExlrmHsd6D5O1OjJRxB1w2FZQWUXIDIc3pmSQNaQ0e/X3nr0IkHXKHcIX?=
 =?us-ascii?Q?bXdsNj1RuWCRn/evOVG3XTAiNhXGgBmOF9EuD49QPcQUSez8MNqdwaXQm1BI?=
 =?us-ascii?Q?K03rkVn2VERE+eOwy7MTDl1cqrlWftYlbLtdzCu98T/aSvZfAY5g0zlO01X0?=
 =?us-ascii?Q?ldN8B7Gau6E6yn6+CCoQEc/IRrlAadP9WsMq+swo/uFZl6s6h80ay9b0HHYr?=
 =?us-ascii?Q?Y6B2VYRpLNsyFW4Q4lI1RwTpXVSXQ8e/FyLl/LPLYM7I09ho2mpnoijbsOxq?=
 =?us-ascii?Q?mgYnEIqZeC1UAxKlqcAhM0pFUdMQsEqzI/qAtX+FOzg4rnXpfwqL9vdX6jAI?=
 =?us-ascii?Q?b8g7253Oo+JqOgWQvUz9RdExhnaE2yxwTvy6ZZdZPgK4CLf0Qd/PAUvvl2ae?=
 =?us-ascii?Q?izb27KeBjR8x6VqtB1hJFW3T0tfze6H1H92G0WXKj9huKlA3DMfoedmdFPAv?=
 =?us-ascii?Q?yP1kYkTyCAkUbUpYfhUNdUk3hum3CTA+TBc+0bgZ6d3+jJRRprfH9ZMi6LLE?=
 =?us-ascii?Q?Isy41ghQUMZNhjbYs8dI90vzBF0wixgSKIMQFojuSxfRPYs6a+UMggKb7mWb?=
 =?us-ascii?Q?wTb1R/S83MAElcUKHt0iNPFcXTbq23AEwiGp2D+1pkpUVWeqXS6Xa33gYXz6?=
 =?us-ascii?Q?ckhG5li88kzSAcCzLLiRAW4nvumNnxD7vesrDzzxMw0pbF9v2YY4TJI6q7wy?=
 =?us-ascii?Q?2ZcAvjuGUbyAEwG0PW/7/7PjlLeTIyrwRWfYuY7qWZahZNe80F4OZIC96gO8?=
 =?us-ascii?Q?JRQL758Ey4mUQthN2uI4geN1NWtxPpJkh8o65rw1kvBxQSx0GbOIEaoe5vB5?=
 =?us-ascii?Q?z9DePZi7IDb04IOjJ7eBQ/zxQqefF5WoMWa9KtQqB7+DVZdtyo5SuBwL4+L+?=
 =?us-ascii?Q?BvVuLt3Ljh7vmdi4ZFqiWqx9xuSiiuBYNAYvvMCyJgNC/nSgQ0LUnzo1nd0i?=
 =?us-ascii?Q?H7M2wc119iJtQxaLYC5c+W8UcELjbN7dv3b1o4HU2a1YaJA8pFnlrtP4kWyU?=
 =?us-ascii?Q?NiC1T1XQpUEPq3P9gFfJW2CfJHhG3ERAMzKvgniX8GRrpmVbJmOrtNBoJmJl?=
 =?us-ascii?Q?WYsSDVSC1GI8rDDAaJH3ClKVRmzFpJfFbfir6tiUzSn0NOJ57z96AvOIBFUd?=
 =?us-ascii?Q?ks4wS/6BwRtjGpV6eexciabAdgO6XtnbYVaRotfQAbixIGdA8KTiJoCDBor5?=
 =?us-ascii?Q?3Y00zYd4vBrGKZsRmvUF2mSTzgIHHnsSmBZ2lwihZi/xGgp+dGYzisRbaqyn?=
 =?us-ascii?Q?JTsNCHR5mQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: b9cb6297-146f-43f8-e319-08de67426cf9
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2026 18:46:52.9691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jTC5PBUb5V+uTBXKjUAFI3weEciYSHvp81IfE2PftFapPOiUeDg7wFWeUMMhs6bOBGFYA19gXW/gzJV+MlRrUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB3176
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Feb 2026 18:47:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230680

Add ptest support to enable automated testing of libarchive
using ptest-runner.

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

Change-Id: Icad1ad50cfd1933b0286c7c333abad9a91aa30ee
Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../libarchive/libarchive/run-ptest           | 12 +++++++
 .../libarchive/libarchive_3.8.5.bb            | 34 +++++++++++++++++--
 3 files changed, 45 insertions(+), 2 deletions(-)
 create mode 100755 meta/recipes-extended/libarchive/libarchive/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index b9616e9bf4..648b53a5f6 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -28,6 +28,7 @@ PTESTS_FAST =3D "\
     icu \
     json-c \
     json-glib \
+    libarchive \
     libcheck \
     libconvert-asn1-perl \
     libexif \
diff --git a/meta/recipes-extended/libarchive/libarchive/run-ptest b/meta/r=
ecipes-extended/libarchive/libarchive/run-ptest
new file mode 100755
index 0000000000..49396b2c80
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/run-ptest
@@ -0,0 +1,12 @@
+#!/bin/sh
+
+for t in libarchive_test bsdtar_test bsdcpio_test bsdcat_test bsdunzip_tes=
t; do
+    if [ -x ./$t ]; then
+        ./$t
+        if [ $? -eq 0 ]; then
+            echo "PASS: $t"
+        else
+            echo "FAIL: $t"
+        fi
+    fi
+done
diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.5.bb b/meta/re=
cipes-extended/libarchive/libarchive_3.8.5.bb
index fcfaf5d231..4bd25d6364 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.8.5.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.5.bb
@@ -29,12 +29,14 @@ PACKAGECONFIG[zstd] =3D "--with-zstd,--without-zstd,zst=
d,"
=20
 EXTRA_OECONF +=3D "--enable-largefile --without-iconv"
=20
-SRC_URI =3D "https://libarchive.org/downloads/libarchive-${PV}.tar.gz"
+SRC_URI =3D "https://libarchive.org/downloads/libarchive-${PV}.tar.gz \
+           file://run-ptest \
+          "
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
@@ -62,3 +64,31 @@ ALTERNATIVE_LINK_NAME[cpio] =3D "${base_bindir}/cpio"
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
+        if [ -f ${B}/$test ]; then
+            ${B}/libtool --mode=3Dinstall install -m 0755 ${B}/$test ${D}$=
{PTEST_PATH}/$test
+        fi
+    done
+
+    for dir in libarchive tar cpio cat unzip; do
+        if [ -d ${S}/$dir/test ]; then
+            install -d ${D}${PTEST_PATH}/$dir/test
+            cp -r ${S}/$dir/test/* ${D}${PTEST_PATH}/$dir/test/
+        fi
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


