Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C83FC982ED
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 12:58:15 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.12])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48100.1789995451352927989
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 05:57:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=d4K+F8/I;
 spf=pass (domain: est.tech, ip: 40.107.162.12, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=USLBNm6DEHxagx0lEUj9bGzCC//LETiN+b2pU5D7rWdPeVBVzrbKIL+OCjLTCB9JGW4/YEPh1fcfJA/RspwFkn/MJbaRnsmlXAcCUK2dZo1ZBXXikiwVMAjmJeEas4McgRq5oCXmSFON9XijPzfEEK7fA8pJlJn5FeIv6IBtkpDNDBIeb7h1ZXUyQKgS5n4kz3VjBwl/ydvv1Q2NNDrn5W3ZF/1ZXedWP0IaRBFICplsfZRaUDL/83li10ayJfvyj9vv+9Aekvw3dx3rLqz0y+c/xEg7iSXRGviB3lh84fXjFcWKYoJyeGMjKqHrRFSvmOcfaeBuNo+Z3ncywARTkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=12kCHE8x74cKVq2IsYXlK55SE5n1tJw9Uu63NoVnkqU=;
 b=uKPkOHoVYVYXzFGnGUzTTKh/p3dPn11P6Vassbbr9Agp7zy6mQoA/n2Nxe8XP2152DiIBXs4iJVN8x38Jt9TiDne0vTiBpoxzay2LIZJMT+kQWmBy36J179sA2aBqystv7c2Z+wx4n9sKmjZvGaQ4m11YxQTiDFDBXRYQka6KpBobyfDWlz8sfMKmfUoLFJ2M26cA2cvnkQRyjYsBZf6R9UvKsHxLsSR4fVFEC/wHKGDBwhMd56lJ0rnLsl0vDGOF5RjQ04KtqKHBDRy7JpTIT6ni2aVAAQTwvTPXKkTXG+o7wjAg3n8KrnekCb842ETSbQseBkbzgV+Hf7elNETlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=12kCHE8x74cKVq2IsYXlK55SE5n1tJw9Uu63NoVnkqU=;
 b=d4K+F8/I3wzvlQZLpR9QftLaV/XPralxkpHV8FqGqeIoSsGpx2wBLAne1avDnqadiEu6AAyjgULWfae/yXDe3e4vhWr0PzwWAOyjDHiifW5lDmapTKMII9LoMXBfnXesaq0S3K5iK4QclI081V8yG6XFJkEYjT9rH3DcMH86tXDcNhpyejsS9eFf7Exnujqixx6ElqXdCht1qoOkQcaVjMH4cb/qkVgVjfYheRvtaHP70c8KjLC5mpK9BiHLYtbJN8OTo/rDVWi7woYpRfnkSEvqNYggVcg39ftMhdeq8jk3verXKiCeEr1Idj9WEWimGoNpHK68jZCFlm5oaww/Jw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by PA1P189MB3147.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4e7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 12:57:23 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0428.014; Mon, 21 Sep 2026
 12:57:23 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v3] psmisc: add ptest support
Date: Mon, 21 Sep 2026 14:57:19 +0200
Message-ID: <20260921125719.30898-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914130447.107189-1-pratik.farkase@est.tech>
References: <20260914130447.107189-1-pratik.farkase@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2P250CA0007.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:231::12) To PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:4d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3P189MB3239:EE_|PA1P189MB3147:EE_
X-MS-Office365-Filtering-Correlation-Id: d1f1906a-8b73-4923-0880-08df17dfe10b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|11063799006|5023799004|56012099006|10067099003|3023799007|6133799003|22082099003|18002099003|20052099010;
X-Microsoft-Antispam-Message-Info: 
	o7x2h4rJhZvbWipF3FO4MEnL5vUB6W46jOb5P1ydUTyxaeI2Gqi92LjNbrrnZKwAndKc+UWontFCQ+eHFnj5CP43JPrd4MhN4X7qKuaAyQw7TDJywx761YpdczN1hZhRaxIYxFEYt883lSjeby/IY7eB1/Td4/Euc16ILbJYrYDOwf6mmPmdqnxytovYe//3vkCDXCDCG+V3X588RQ9DWHZyDwbBil2P3nJGI5q3rCJNOnymAUVbmBUARgJ4cZZxFCkF9zAZAlXeyBsT/Ct13p5FCnsuuCYGVtT0w0dwGBADTlJOKzWyhNlItESwajUo4DasrJC7WlqAuAQ4KbIbgClZgHsEEhdT0TLaw24aCtbrK2Bw8ZtKBd5PZoID1/uxsbMoZRYx2sOne4hjnNMxcGK2BxKJcgaNqW6/FNB+gmAHiMCEisWw99Kh31w8ZYIuHokDehsoyijraHL4btohMl0RNtLtbrR6C33gCoiRwRFXWPI0DJkWEl6UUtUIMeJ69OkUxBTYk5NYO2WrnEkYSoMDg1KwrzTkjPt7sZFIlfRLCUVFEkeDoaovnC+v8967+1l8upBklkMFyxbwrY7UIP4qYyy89oRP+2JDq69qXLWqHAYI+lSz99MUAJgL3cpVIzT7R8WjWNAh1/RADwcBRtItGJH6lns5z0uNPxtaIlE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(11063799006)(5023799004)(56012099006)(10067099003)(3023799007)(6133799003)(22082099003)(18002099003)(20052099010);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NH6CyPSHl+WnWnsuCDV/MSWOhqeGF0HPVzkiuUMJjHwKxcb9glkiGfaqcVu4?=
 =?us-ascii?Q?d0ad8xg+aNZYy69rltEUF7SfY05q8TVVBg6nPCApx3AhrzWYU+uK9j90E9Ir?=
 =?us-ascii?Q?m268MgIL9AyYXzKTxjjBnwQn5sR9NhMMv4vJckjcmk7UbN1cV5K8OUxoN0Wi?=
 =?us-ascii?Q?DtdpSxlUVQ0cUxFpXkJY/LTfny8j724xfEotdNPm8yPmC1+zbVqLyfv5hDsZ?=
 =?us-ascii?Q?iTLWn0BlAxwd6VduJnyQh2MYyUYx3ua8fPp/Zx/UVwZkswOWCuEe/6vjs+CB?=
 =?us-ascii?Q?Ku/Bl8v5e1pStx4RquxRz0okHQW+HVAU4vk0Ekr5botC04GfjYdAA+6QN4NA?=
 =?us-ascii?Q?04w9Q+pD7/vu7sD7cOYGJl8UsU6PKIIyxDDY1iU/hHY5KNg0glvR+lDOtmdg?=
 =?us-ascii?Q?x01RQmOI6U/4N4GEbShPi+gtXmsxY3SsuzD9vWMNrG4RVbiZgcrrA/y2BJJq?=
 =?us-ascii?Q?qLNmS9QGAd+aniyI1bTwp3WnhAHSh2lt+wec/BvfsupJ+QlYbfsiUBjUR3XC?=
 =?us-ascii?Q?TaguNFeOaxf+YPVp+Rkq5aRNK3M6CYX/zgEXgSDFwWRLjgSz0+z6T2EV6cES?=
 =?us-ascii?Q?aIVmdE5yA/QBaZH4aDw5+qFCia3QiCk0GBjiXIa3lISNn9X5DBZFmDcyFEKz?=
 =?us-ascii?Q?CZeTnFoNQkN/mrE18tu0M5KfvYiTuGE40/rRHR61FkNb7f8pA65Oobb6bKbD?=
 =?us-ascii?Q?VZpugnUq0dHFWjZpaDCe7ka+N6B/+98kgd8nf0rZkU9D/yDAgkBZx2W4r+/l?=
 =?us-ascii?Q?KLRpyxkQrjC64lWxnzbW+WNzlVCM0eFxsQypHfdLY2O2G2oLU/3PY7pNE60L?=
 =?us-ascii?Q?5kE51Ox/OnnfInO1mxLFI+F/4xkUQ0K0mJWnFnY7rIV6F1x4B7fnTaDnEr4x?=
 =?us-ascii?Q?mNyXTzNEG5dVBlbA734BDkkWsS8Auurbl+4E8+IBMDOYMmuVpOv6jRIVHoR8?=
 =?us-ascii?Q?23+1O4JhNO0SBgOA9r0QEzT0OU7MPqPFkeJsnx3J36TaoKOBl12gf6uS9bJ2?=
 =?us-ascii?Q?c2GuRuPcQpgBAwMKF68z/IT0gIpgvS09kGEmje+/QbsfnWrRYPQPqZ0miNUR?=
 =?us-ascii?Q?+tV+SLT00SyIkG2kJjLT33HnQxKdsnrttIWSNpI3yQaOf48xpXmfp+Ch8xDh?=
 =?us-ascii?Q?jI6n9uW4GCOEg0K08nLpzQ7oGHcnIf7JNU1mcBAbfrAc3JuRRcPF8w5cxnSk?=
 =?us-ascii?Q?snCVAPI6Yd9YBx0sTo8nlNNHb/KVtlUPVnYGoW1Yo7xkzhJh090A2jmz19GA?=
 =?us-ascii?Q?Ru3KaJ03BZUmOgDgajE0V8696pcyWm3qnC5rsPBoOaPyEoojvgqHuS6XawAU?=
 =?us-ascii?Q?V6QeKWs3xU/IBjCfu7N1wfLj9nVrzeaLVUJQjzlQGuQ0PaBoTYfhy2q5rRPD?=
 =?us-ascii?Q?VY31UfVfMETJUwwo+/gkSd4t87WawiMqhESpXWih7rwLK/4mWnLQ7h+6uzyJ?=
 =?us-ascii?Q?JAk+mJqeDLmA9WUo9oj7luCp9N8IFaKegYIzA3RVYIDdZFZVMeBtozD28v57?=
 =?us-ascii?Q?c5Lt+IuNqR2YFgtVvoq0kh+su88KfJGSpMZbOe0LcXkTLDWktc4AQP7kD0pK?=
 =?us-ascii?Q?1RioLcOzHPiRQv/OUKcFwCr8eN3L7W+lAFK9sYlOSHE2j+TZsFez+bvRBsKj?=
 =?us-ascii?Q?y1Duqrhvf4Lm1th9Mp564c/TOGDPNx4CqTsebi3Cf2h0srJ+mkrA78IPYx7p?=
 =?us-ascii?Q?845xfdj7Tc0HlY4bN2S5oQLTtV2WC1NHIV2WLm+NVxYCXA/ugsCWEbg71Z1s?=
 =?us-ascii?Q?YKMbOB1eEw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: d1f1906a-8b73-4923-0880-08df17dfe10b
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 12:57:23.1583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bEQ8zjhUVe8Terbzik/dY0J3+4xv0nqdhaDsHhpvBZJWWHxiRKChHLd1yhIOEQDztkET46upk2goCBjanEqP0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P189MB3147
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 12:58:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246330

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
 meta/recipes-extended/psmisc/psmisc/run-ptest | 13 +++++
 meta/recipes-extended/psmisc/psmisc_23.7.bb   | 57 ++++++++++++++++++-
 3 files changed, 70 insertions(+), 1 deletion(-)
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
index ad57c49ffe..4984f86ced 100644
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
@@ -25,6 +26,60 @@ do_configure:prepend() {
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


