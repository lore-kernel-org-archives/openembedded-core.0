Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0185BC982F0
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 12:31:43 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47723.1789993899006371616
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 05:31:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=bYPK78uY;
 spf=pass (domain: est.tech, ip: 52.101.69.30, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EPHvor/fRw54Z08nN80+HABG++iQmztbocE4ORoijzCyq43M5hYEZoZxKoZPxx2q7e5EA2TYZT1AYAceNhMpHpUMgXLmAyQ0XRcctqVLNW1J6MuJ8HVjIXA50J+07ndsmTreo+eoS59Roh2dffyPbQPHVDz/TJYcjiKn0di3zppm3yk7iwlp6cX+NDyl4gMuZSsTM59nqPkMyL+c19/PDLTfHOMf373i+cW/ekA5gRkojF3akITNpFVqbPaRNjBmjiRkdAtxIDSxG4rVGv/Atm3w7d9c5Ll4FHEc0VGmbBgttTCdgkgwJJOt0Cw15HVZL0NibIYFSPcELFtD8U5OTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kJnd6j83ymDjwCqxdaYNRHUbeMJbnHwazoKZJqPQCGU=;
 b=ZKg5fnsGIhUMapaS+TzFKhOyuvEdlP9phIoQc298+y5U01m/F1bppBKY5f44mIevgZXXcATx71GQQLh8dn8G7zYbfMBOkDqgraaOYmrbeuSQ15aNry0t+KRu2L/O49fKgMoJkZ/xTlG2k22k7E4zTToccio1wEpye9UwkHp92Q72e/vxLrWcKReeJoccuhxEBTvWvidLy1we/EVBRVU1+zGpjLV4ySB8vPWnHPEobsteLCRL5nhLRg4FHNY/B7gzsmI+mleRB9ycr9BndtO+uNlMPvDRwfTl+MW5b6LeBciF2ovsOYFXUORt7/c2cleGsIlSfKk+rQePiD31/SbCgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kJnd6j83ymDjwCqxdaYNRHUbeMJbnHwazoKZJqPQCGU=;
 b=bYPK78uYz1mvqF8R+4dZn2dz1AouOvwK1vTPoyYrxfhONbImv4UG9dtu6R+lCwS7MV6bcS3ebi9goU+hV+DZNr4tthLF6DsSrmXoLvpVmL2GKwGbx3OLZNOpm95FPpwppAgZqwCE7s+JBhiKAu4TDnm6DlMhhlugwCLbUA0d1/h0Y38tTbkalN8y6xheDzS0TePoj+YfhmtFKWMXN9mXK0fWmC06iPp7hzSWsKKvmhd4kZjG5Ywcy2OzgaHvmEeL2vPqKHCxhWVtt+ozpX8EealP6QMpi4hGGuHku8NF7kVoxAFazglk1f0bAaMhWyQofrtJGIBfvA7EddTKy+eJJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by VI0P189MB3393.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2ce::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 12:31:31 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0428.014; Mon, 21 Sep 2026
 12:31:31 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v3] psmisc: add ptest support
Date: Mon, 21 Sep 2026 14:31:23 +0200
Message-ID: <20260921123123.28135-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914130447.107189-1-pratik.farkase@est.tech>
References: <20260914130447.107189-1-pratik.farkase@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO3P123CA0013.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::18) To PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:4d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3P189MB3239:EE_|VI0P189MB3393:EE_
X-MS-Office365-Filtering-Correlation-Id: a583be49-4f35-47d2-9814-08df17dc4409
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|6133799003|18002099003|20052099010|22082099003|11063799006|5023799004|56012099006|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	Tv3GuK5d3kYBZKVlZMeRA8VsrZUDGDPJJ8V7Lm+xv0fqXDSeZosyfMA8XHXQnVk5EsXZ8Zy0al6exWzkBu01LZP9jBhcFuUq6IzncRmDidfOHm3ECPHpfNojEPQ/amMJRmKzbFHIlvjiCU7P3u9e2XzqovthKt6OJqfA8z96bkh3+RBfMNE8m8iqyGILpmhthAV/mkk2URc599K8TMmB+jdcUivkW6Iqx8ilGZYZEthvzi7i07RuRLFH+HbM0KxqQN5LdxSvHaBvopTRsqY9g1mxebxxH/1oG5cHO7+LWiyBYAQ2r5/QBM07j3EJApO7h0W+pHUfLlYdgSZFHfzaHysOUkX3z+Q4KB0FKOlxyy7kgTJxzJMVk7SY0+2UBt0Cjogk82ozEZbHkJFmJgelFh5RIGQGsiXw1JumM5IoMbxWftjy+XEc3ABibmPdqv1mCc5ItONNJGi2KYayfZbPYnOUBqBDCRmHMys6y7RwFWGFDABTG3BhAY6SFPQPc9q/3n6XCzoCWCmbhSl/hJWjtk7RMQ1ZR7S4JKtJhzadG7KsfEuFYgQuv5JOVFO3KlKhBVqv8AUnRcV+73GXVAKN2GwugXEMnOEYBCEO6K8NrsTzIkZAjlwxif9sPzaJ3JCCVo1oYKIL8UIb51kiTJ0y6QeGUsVqJ1KeSzfibfWwnv8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(6133799003)(18002099003)(20052099010)(22082099003)(11063799006)(5023799004)(56012099006)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kSmXPm+DmEtxNXj50tys1YuOE+FNODTzbVKr0MzfvbPZA+JyOfoqiExY5aQN?=
 =?us-ascii?Q?hv+KgBcueGOB8bcApBKY+b22fxUFoXMY8LmN/PTul/4cjheJQ2RUTpkutcvn?=
 =?us-ascii?Q?hnVNvGkD6JYHbmrAfK/H3hmu+0a++XzgWjkjsJo7qHb/egpb1QOVV0NOjfp0?=
 =?us-ascii?Q?L1kVh3a/O2M7H51U1FDt+/hpVZNt+nTt6ddWmzE3kNeCql07Gci2dRqaBkcd?=
 =?us-ascii?Q?ciylZdrsF72OK4zz/sCy+YmWxDIVeHNJqpIu3z7zTgxg6fAm72kCf9vL8y5t?=
 =?us-ascii?Q?M1Iw1q8zxmaj0Pl98LSQ5XXCTvO1ip19lVaTdVISQoURlRAApMtVRfjC3kh3?=
 =?us-ascii?Q?DMiai70PYGKR1sW7AIoEyP3wXucyYevDjdOn2ynYUM8awBdhKsIUOQpMuscH?=
 =?us-ascii?Q?4Ln/VnQQe/6YU0GhbrtavEQ32dtXa/LozuuX9LhH1u3fgymjMQ5gPkl2Cn/1?=
 =?us-ascii?Q?Kvab9qaGfACWdBKZg+vKCKRqG/5jclIX6XAMelCyLKoAbxNNpd6Ic6/JttXb?=
 =?us-ascii?Q?adER/i3M9Fkob9+YbYR/CLfRDWW5/gq21e9yyDCmuMAytQzS6NlOMvJdS3Ko?=
 =?us-ascii?Q?dH6BxGkiW3faC33sVYAJbWKes//4rNgO7zmfKXaH6VPBreoN+PCMXdOwZh1S?=
 =?us-ascii?Q?q6b65/hWFFyr96I3cRrcSiWADPVrdiEHfS5IxXqUZU+To/4fcKVfWBm7qJaY?=
 =?us-ascii?Q?3zMJnzaBGnaxpepNfVsk4Bjj3D+q3LKG5+K8ivCizF2+yhxnsg+hjrg+w5ad?=
 =?us-ascii?Q?ugUh/JzvsvweHU0koxhRdem2+QZ75t3t6l1bXeBAncapk1z4LpZu2N8hh0C5?=
 =?us-ascii?Q?y8V9++dvTVnm6gow9z5Nk6bw4YQpkS9KvtohbteSBJrNwc/r6wGFQh7J7lXB?=
 =?us-ascii?Q?S2yj5ItSVg1QSE52VmPqipyaBuEQqADNwoNTcRzCPZoaGN/hv4WcBn2tWQ/T?=
 =?us-ascii?Q?yKtwcLtcirJaBC66pCJwqYLxkCv8JqAN1qO/FdQLOvIgQTB0D3PQxaFhLPGT?=
 =?us-ascii?Q?U/J3aESHbAk3sC8Erv+pXPcfKLsKo0YSQRjp8ne0xv7dnEyF72Vq/TXNrEh9?=
 =?us-ascii?Q?rC2kX6qJYIQDlDDNEvY6SN6+aNH4E4f6ddUXNX1dmCVCK7bdPS02AojfUfi4?=
 =?us-ascii?Q?Ls6yDu5OlzLkDxLdmnb/Y86BIJER0e50/2UFwMgo39OLVLRHrFR0ecRqxz25?=
 =?us-ascii?Q?lTJcf1as4+4WQmIOPC3tQBXoDkV9Qk274pnVNBDtOsX56CDBsTL5TMjF9tsA?=
 =?us-ascii?Q?X74Lzfojigxx/TnBqf02486TpTQZNWC0Z+NsbOok7xBbtmitGZ9+oUwNxBu3?=
 =?us-ascii?Q?q/1vd6VNaVg0Nv4wjxHFuJL3iim3Hkxnsl6cD1wrZ2mYoGG6Jp1zVDkS4kQr?=
 =?us-ascii?Q?Jo8vfXtDRUFDjmRdCukp49pOt5xrg0RCmGk1IlGjTcfX8TMRtTG6rsmoOCJ8?=
 =?us-ascii?Q?azO00i1rstoRRxCU2v9VoPW3EZlLg+4mm7Nqxwy+mpuAz7pWz5dhnITN4Ojk?=
 =?us-ascii?Q?wAVV/HKYRCQyqONI61wcWY2x6uu2jx7CIFrJV44pvwswqzOc8F9Lm+1o64Gy?=
 =?us-ascii?Q?tGwxzixi3uEhWjO+TBpGUAOiVo5E6/sv8YHfJG/ccTW7trYEVxfcvWzPEgdI?=
 =?us-ascii?Q?NTKK8l7odXZnmhgmCdKpeishmKB0vEbWE+3gwzhxQb7ItLhny22ToABQbLda?=
 =?us-ascii?Q?7SWRKnMHELyPX0Cu+f5K01/kTe3EvJeppuNcS1y1cTomYMcyRsSJS5tduBWR?=
 =?us-ascii?Q?0vk3s4C5+A=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: a583be49-4f35-47d2-9814-08df17dc4409
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 12:31:31.2841
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bIfTftkSUgETeocHqZNoZKcYPdtwPWPk+00XWWhPmmBFiGYnCjYrBKYUujPheGA/AQAbQ6cJWEqm7ywAMuZ0Iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB3393
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 12:31:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246327

Add ptest support using psmisc's upstream DejaGnu testsuite, which
exercises killall, pslog and fuser via their .exp scripts. The tools and
the testsuite helper programs (socket_test, test-listen) are installed
under a src/ layout so the scripts' ${topdir}src/<tool> paths resolve on
target.

Tested on qemux86-64 with ptest-runner: glibc killall 66, pslog 2,
fuser 9; musl pslog 2, fuser 9; all pass.

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
Changes in v3:
- Skip the killall DejaGnu tool on musl. killall's "-SIGNAME" shorthand
  depends on glibc getopt_long_only() error-recovery semantics that musl
  lacks, so the killall.exp signal-name loop failed on the qemux86-64 and
  arm64 musl autobuilders. pslog and fuser still run on musl.

Changes in v2:
- Point mktemp at a private, symlink-resolved TMPDIR in run-ptest
  so the fuser -a/-av/-va tests do not fail intermittently on the
  autobuilder when /tmp is a symlink or on a different mount.

 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-extended/psmisc/psmisc/run-ptest | 13 ++++
 meta/recipes-extended/psmisc/psmisc_23.7.bb   | 62 ++++++++++++++++++-
 3 files changed, 75 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/psmisc/psmisc/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index 4012be5f49..f01abc4a57 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -68,6 +68,7 @@ PTESTS_FAST =3D "\
     opkg \
     popt \
     procps \
+    psmisc \
     python3-atomicwrites \
     python3-attrs \
     python3-bcrypt \
diff --git a/meta/recipes-extended/psmisc/psmisc/run-ptest b/meta/recipes-e=
xtended/psmisc/psmisc/run-ptest
new file mode 100644
index 0000000000..53f7521ac1
--- /dev/null
+++ b/meta/recipes-extended/psmisc/psmisc/run-ptest
@@ -0,0 +1,13 @@
+#!/bin/sh
+
+cd ./testsuite
+
+tmpdir=3D"$(pwd)/tmp"
+mkdir -p "$tmpdir"
+TMPDIR=3D"$(cd "$tmpdir" && pwd -P)"
+export TMPDIR
+
+for tool in @DEJATOOL@; do
+    runtest -a --tool $tool --outdir ../log
+done
+cd -
diff --git a/meta/recipes-extended/psmisc/psmisc_23.7.bb b/meta/recipes-ext=
ended/psmisc/psmisc_23.7.bb
index ad57c49ffe..f9c6d13ac3 100644
--- a/meta/recipes-extended/psmisc/psmisc_23.7.bb
+++ b/meta/recipes-extended/psmisc/psmisc_23.7.bb
@@ -13,10 +13,11 @@ LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0636e73ff0215e8d672dc4c32c317bb=
3"
=20
 SRC_URI =3D "git://gitlab.com/psmisc/psmisc.git;protocol=3Dhttps;branch=3D=
master;tag=3Dv${PV} \
+           file://run-ptest \
            "
 SRCREV =3D "9091d6dbcce3d8fb87adf9249a2eb346d25a562c"
=20
-inherit autotools gettext
+inherit autotools gettext ptest
=20
 # Upstream has a custom autogen.sh which invokes po/update-potfiles as the=
y
 # don't ship a po/POTFILES.in (which is silly).  Without that file gettext
@@ -25,6 +26,65 @@ do_configure:prepend() {
     ( cd ${S} && po/update-potfiles )
 }
=20
+do_compile_ptest() {
+    for p in $(makefile-getvar ${B}/Makefile check_PROGRAMS); do
+        oe_runmake $p
+    done
+    oe_runmake -C testsuite site.exp
+}
+
+# DejaGnu tools to exclude from the ptest run on specific C libraries.
+PTEST_DEJATOOL_SKIP =3D ""
+PTEST_DEJATOOL_SKIP:libc-musl =3D "killall"
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/testsuite
+    install -d ${D}${PTEST_PATH}/src
+    install -d ${D}${PTEST_PATH}/log
+
+    cp -r ${S}/testsuite/* ${D}${PTEST_PATH}/testsuite/
+    install -m 0644 ${B}/testsuite/site.exp ${D}${PTEST_PATH}/testsuite/
+
+    # Tools exercised by the .exp scripts.
+    for p in killall pslog prtstat fuser; do
+        if [ -x ${B}/src/$p ]; then
+            install -m 0755 ${B}/src/$p ${D}${PTEST_PATH}/src/
+        fi
+    done
+
+    # Helper programs (check_PROGRAMS) used by the fuser tests.
+    for p in $(makefile-getvar ${B}/Makefile check_PROGRAMS); do
+        install -m 0755 ${B}/$p ${D}${PTEST_PATH}/src/
+    done
+
+    dejatool=3D""
+    for t in $(makefile-getvar ${B}/testsuite/Makefile DEJATOOL); do
+        skip=3D0
+        for s in ${PTEST_DEJATOOL_SKIP}; do
+            [ "$t" =3D "$s" ] && skip=3D1
+        done
+        [ $skip -eq 0 ] && dejatool=3D"$dejatool $t"
+    done
+    sed -i -e "s#@DEJATOOL@#$(echo $dejatool)#" \
+        ${D}${PTEST_PATH}/run-ptest
+
+    sed -i -e "/set srcdir/c\\set srcdir ${PTEST_PATH}/testsuite" \
+           -e "/set objdir/c\\set objdir ${PTEST_PATH}/testsuite" \
+        ${D}${PTEST_PATH}/testsuite/site.exp
+}
+
+do_install_ptest_base:append() {
+    sed -i -e 's/^set \([a-zA-Z_]*\)$/set \1 ""/' \
+        ${D}${PTEST_PATH}/testsuite/site.exp
+}
+
+RDEPENDS:${PN}-ptest +=3D "dejagnu"
+
 PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ipv6] =3D "--enable-ipv6,--disable-ipv6,"
 PACKAGECONFIG[selinux] =3D "--enable-selinux,--disable-selinux,libselinux"
--=20
2.43.0


