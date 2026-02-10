Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06C97EB270B
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 19:51:02 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.35])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2071.1770753053281774157
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 11:50:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=H/H9KFKR;
 spf=pass (domain: est.tech, ip: 40.107.159.35, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A4k3+nP/uCRjkF/aUFGFWNvC/srVtG8ldpmrDMyDAMbgNt2Gnf45ijEqV7vgQiFK/PTH8Zt1QoUpVmmy9QX7tFHyfAlUjXaryRV9n1ve3bAUqbeGACoV901ZmzWGCVb4iilX4vpkLPD2PBYFT5iA7/tuAhDEo8nSby8XdDiWLDyE3qgkSxNPoqAIrEkT6Q2mt/xEr3uozZiCPYu3zkGLOG2GzKCRnIjNHq4FyV1CdCcbk2jajWy2gMIpX/h7RHCyiYb97fdE33AXmgZsNdKAPnI7vaHxALjsUjjwMGv5euOAM6kAl9m2dI3xrectMg4oVjRN9H18id9jHqGPiA1fDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9sOcDLeOLqxQfVSyBlDnmAU+7QOuVOLbWKHqnXg5lbA=;
 b=rVZR388eLQ614kufl0rWvif65JmA3uS1yh0KJM831HM5xsvIBtvKZoB6UQy9RnuhuAtZwApa7g91maUdIfRYd6u4awzg80XYPzcVSahss04Xd2xePVkOCArxZTk2NnZip4chxPXvjH6P46g9jgILbLu6t8yJqdlKaKvxsfLbDbMbhxpuUCGQPepNHuLo1uf2OjzFBlNAfejb4ZZ0ZFWMKSeO0hx6F3ueAXE5yRR2hDguvkmtkVf+Nu1SHG1mMh7nQgFYiawYcDb/h5irP5LgLfnTdWEKYrQF6IbmLdUOqOyRijnw5EaJfn130rlgxPdVuDQ3x4/An1aSlueyED9elw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9sOcDLeOLqxQfVSyBlDnmAU+7QOuVOLbWKHqnXg5lbA=;
 b=H/H9KFKR0H2B6voIopanDPvHpW4DW5qOJEJ96VD3TxloZB0EjrHTLLokKiT6zzaMqWw+QIt8z/jEMbjhvbkYipg5yu6Lrt8LkwcSy3iCq8dkK42/lnoe6Y1jZ0xPF8ciNUENmd6BIwaQywvOb7J2eUKA5EerH/bNvCa0Md5aexX4luYBAWM2Olq9g1xPXA5Dk27cMbr3EyR5PGnPEuke4nI3/+a/gzBcZ12KT6vhlroDYp6a6AJ739kLJbsRcWSjxXbK3va5hFIspdlt+df3zn6MXdiU4aOuHvYuhwTo4Ep8w5+Ieb80LJJ3jQp2j07esjuDf/vbnCn9/lD8+aQNRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by AM7P189MB1028.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:174::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.8; Tue, 10 Feb
 2026 19:50:48 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9%4]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 19:50:48 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v2] libassuan: add ptest support
Date: Tue, 10 Feb 2026 20:50:41 +0100
Message-ID: <20260210195041.9694-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206121709.7421-1-pratik.farkase@est.tech>
References: <20260206121709.7421-1-pratik.farkase@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0167.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::12) To GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:26e::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2P189MB3005:EE_|AM7P189MB1028:EE_
X-MS-Office365-Filtering-Correlation-Id: 78bbec2e-52d7-41cd-bfa9-08de68ddafdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?z6met/pAUuObTAVMbK65MsHaxgW8WMo8biUIitd0p65AIs0C2rMhyrX2eHyQ?=
 =?us-ascii?Q?AYxb2GuSYnzdMnqYTYcYNGoFmqbP44YmYPgKVf0mLgPfG2pc/hfQRXuOD7sx?=
 =?us-ascii?Q?3bJKqZHvremUQY/lOYL/iPMxSwpwx7DlHBGZrVEsEiGkKy3kfOYST5NbqnWv?=
 =?us-ascii?Q?/rmRPfE9RtSY0GJ6J8FLhwIoFalUVBSDwWxQj5jwLtWskrfmJt0KLHiXbbq7?=
 =?us-ascii?Q?x9KbIZMcwntGbBhF+h/yaI7qgd2B82rMdIl7OaUx1RZxP2LoYJ2q3uza2BNI?=
 =?us-ascii?Q?m0gtuiP+QF4MJj/wGd37nmdN91qYHKclt+jdNWMbQsbUqrP+TiZkmyC5Sb7B?=
 =?us-ascii?Q?MXDpyZYoJE6vk3Jubkvz3hUuWecTWBexOfsGwxUrSzAQ/OOC0yJBLWuwWWau?=
 =?us-ascii?Q?6Kw5qsHG25NVLPr4iBZj/9a8LbDVYmaS3yJrf9TyBnM9jGwPfgpTDDWV0Dsm?=
 =?us-ascii?Q?f7w+hdbLqGPhJYD5+sedmqZp3uxJM8my/4shEjvllH4hy6vEEaVlc5IT94Yt?=
 =?us-ascii?Q?IJttI+F1e4OI4SqE30fXSYK7H2WoHsCC+jNibirYFlNepihVjZnmpibcghG9?=
 =?us-ascii?Q?te/Z7bRb7CYbhrXEsx/hDF1IS/dga2Xp0VVNEjAxxU6UOOzBE98IWE+Mvrdd?=
 =?us-ascii?Q?3Ppe5VYbmh6+M0+4RiMm7jA5SUmpqrsOlPyc4LwCsDxZ9iOKw5+CWEMi4zEz?=
 =?us-ascii?Q?TJMoxPfEPANCpj91ZUXeKCK+jQNDMUTo4a87Xt8QMu1qRuo9cvfdtSDzqL1Z?=
 =?us-ascii?Q?S2kOIJt44SNMT5/Sv8lgihz64vUVAUNPiybyDBkVo8IjJqd3T/wPaWhthyTc?=
 =?us-ascii?Q?w0cL/VGhffX/75SKwa6jcaJ+jSfqn0pjoDH0cTfOBiKkvjprNPrkGyYiy8i9?=
 =?us-ascii?Q?AyIG7+rGzaSFN1nsm2bxlojzBMviiMhjkm1Ln102Gp8wJCYPOlRD/OvLVT2q?=
 =?us-ascii?Q?orRTGJSng09ihNxCKlC0QhXhG4zvFwLRZm62D9oGmcusUySdpuR0Iu8lfHOW?=
 =?us-ascii?Q?xkwiWXwex0Nt+lbEz/UdM79cxc2rOmCIO9l7HO6aWrTdk2nSAjVkHrwGZnK+?=
 =?us-ascii?Q?h1M5qslTzJ4jVRRZtjHfA1jlUQV9iWC0hG0vsG3lKri75Ia1WSrItOEQvpTH?=
 =?us-ascii?Q?waP2pXQJwDC+0QUFfOLKIjLT3Bn2AmBEIYl9NK8fRr92+cMm9qWCRpCR6Qwj?=
 =?us-ascii?Q?1I8pX/d+gHxhlmnO00Z6OF+SGEBB/CJThjFytmxUWhblJhl+tUGM3TLhF8mz?=
 =?us-ascii?Q?/5KWX0LclSBYt9PL1FX57iblJ+gFfl0YY+370ufoSkJ7FYPLFSLo7A+NiT06?=
 =?us-ascii?Q?en+jd0rakHbRlVuqqYaJvqQa7oaoyUa63I13Mr6wg33Q/aQPcr0xYZ0g/oiY?=
 =?us-ascii?Q?yCmW4TJI1lFnx9bOT3WCShDakrmKvPv0LLVTaXzei7rLW3kgYwpBmVRhFZ2S?=
 =?us-ascii?Q?ibpgUuwsnc44EaqoND3p4vX9YM+7/83O1kcmgcyZX5Znrjc+Da3xvZfnmYFO?=
 =?us-ascii?Q?KhiRV4xVEEk8sQQONbjnT86aOwzIAdojHDgTQ6lUHii310uLSQXC6OLKCgQm?=
 =?us-ascii?Q?WcGWmbvEGC6wFa54jgs=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+EJ5PyPwszIAolf3DhgA60i4xtydEJcpYA2BoFT7T6/YYNN0L4QYUQ5NwqzQ?=
 =?us-ascii?Q?1mruZkuwy2p0BrZZhHhG84yzXOKmNbyVzn6Nk1fhtljqMJ1Bu7mJGxPWgNzg?=
 =?us-ascii?Q?LryCTSWkOZjUmT4JMhg5gzz0Qr2FWLNCG/w+su0PYQS6plpiaxmk1t11Uj7J?=
 =?us-ascii?Q?Wblre3qDX8F+93AH9KIt1i+a+6aTLdYP6KnWfuZ3kLs6wFRHzNN+05KegsRl?=
 =?us-ascii?Q?Vh6vdyNv/ITfaKUBVydYfQNxBGOh/SmCx0SdEU2sxoYDANYiLuy616p0sBGp?=
 =?us-ascii?Q?3A4F2DzVXB1r9Uoo+lSBt+pYxbq3VuBEpAkW5FG0GDiVJw3J8KVmruwFrQVo?=
 =?us-ascii?Q?yx2TkAk/mS7Rp1CN/IgK6LSvooMQTL1bDcgse+n0tETRc3q8ri5+9u3uMacY?=
 =?us-ascii?Q?J8ZcLEth7ThxNYCfNUVYP9hHJ6cFS9j40VXfpqTf8u1Ncx7KwcaJ1MhowbuW?=
 =?us-ascii?Q?mmoWfRLJQ/Ks/Pe1PPfnmOrvwiiuf9cb6aB5/8dj/U8Qm05ufK734JetF4qt?=
 =?us-ascii?Q?6fqMuPOWalJ+xFdGil+M3VOE9mNIqJqL5i2WQgzYbBzeUvblRdiNKGGY0E5n?=
 =?us-ascii?Q?AckCVqRe+3zGeP/9DMquNHRiIRCZwfk6zozW6oV/iY86urrI72geFvfn+4aO?=
 =?us-ascii?Q?hnWUNi675zK8+F7NWXjLUUqYEy03szer7UTmvt8TZgPTxTjJ+2gn4IFVx65H?=
 =?us-ascii?Q?ga4rVDysouFOMMIYhHd54msc6N/znUnEwB8+u2q1DuPdg1ucOjtpJACRCoJ5?=
 =?us-ascii?Q?F3CDX9EZEbl7RY8ar8zTcZJQq+KIWs5QA31Da7905LIf5nAVp7/YIyiaSS0n?=
 =?us-ascii?Q?IUJvAGM1mcHmUNWcmVeUTr/2/D0J/lMBKvkpo6opkK1ULV9GcboeJbNM0aPN?=
 =?us-ascii?Q?Le1p+u18XKrvsf6b4K9K5mNXY3RtEIWjUp7DELJVgr63UKLZtuE5CtR96rBp?=
 =?us-ascii?Q?Ebgh7RrBKCq5rRIn1QXStHloFiM0v9LlGdCveqIT477RdbxEGsRcl9064n3s?=
 =?us-ascii?Q?prZQusK+q/KS+qtB1F/HAcvqoo2hIdVt7bJsW7BCx1DDHvgC+ISMM4o6rORO?=
 =?us-ascii?Q?AaJ+cVWABovrMi+6vFx5LQUeP/IklUmolkcxnDsP/KqNKkTClv/V2yUGrNcN?=
 =?us-ascii?Q?aTfILzn2nzEWB2IQZ5KJTr68b67oL73Z74730L2SGOViBep74xqACcn+/od7?=
 =?us-ascii?Q?SmihtJufexYYo/smXNb01pHpgxrz6rRfVFJPdVn4ry5d74EaVPh7p51hOxmE?=
 =?us-ascii?Q?ubMVuxaqw52MvwblHI8Ix5jDGgGt3wDh9ZjEiA9HMt47b2H0JTu2Iqge8qBB?=
 =?us-ascii?Q?35o6FBiuvPK6q9Eb41bVblg5gYk+X/CSJh0ut4RNivLmQRgh+L1VpIdwod/B?=
 =?us-ascii?Q?ZoFwptTHqtc1ESqPjXXjwxa7z3ONDQhoLfIfibION8PQf1jNOjwNcpcjJWBp?=
 =?us-ascii?Q?sjWfivQu2p2sCNfurtlor0cAZjasgHK2PlplRJbFNw5rZ3Uo/KkqjNEMi7QS?=
 =?us-ascii?Q?k5leREcKUycZuQelvwyd0nqtDCBFfGhPir0gbiFYvqiIFT1oiwkiI2kSD62T?=
 =?us-ascii?Q?ReNGs4f7Q9VnWVGq8ySfdTnjCqBcitZftwWN4XcsChDpjJHLE6vKolsDptGI?=
 =?us-ascii?Q?fbzaE4bBtJ0HvSgEDm/ua2vI1KCKQOCR7+POiNPSjIEtNTWUPYB3+lI4jlEC?=
 =?us-ascii?Q?z9IeiFyUh5H09rTWCDxCqmiOqP6N+PL7uJ6zFMU/miY0cbdqpEspOx+LC7pI?=
 =?us-ascii?Q?D+a5wMrKvA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 78bbec2e-52d7-41cd-bfa9-08de68ddafdb
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 19:50:48.2287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ge2W6yqSYfcOl+US8mPAilI7QApj6MDOgRO0c7cZ+GmckhNZCdOffbRi7tLXz1/UBA5rXMq9TrZcI0ebTu+voQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB1028
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 19:51:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230931

Add ptest support to enable automated testing of libassuan
using ptest-runner.

The implementation installs test programs (version, pipeconnect,
fdpassing) and the shell script test (fdpassing-socket.sh).

All 4 tests pass on qemux86-64:
START: ptest-runner
BEGIN: /usr/lib/libassuan/ptest
PASS: version
Received data `Your lucky number is 3552664958674928.  Watch for it everywh=
ere.'
PASS: pipeconnect
PASS: fdpassing
PASS: fdpassing-socket.sh
END: /usr/lib/libassuan/ptest
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>

---
Changes in v2:
- Remove conditional checks from do_install_ptest()
  to avoid hiding test installation failures
- Remove existence checks from run-ptest
---
 .../conf/distro/include/ptest-packagelists.inc |  1 +
 .../libassuan/libassuan/run-ptest              | 12 ++++++++++++
 .../libassuan/libassuan_3.0.2.bb               | 18 +++++++++++++++++-
 3 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100755 meta/recipes-support/libassuan/libassuan/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index b9616e9bf4..ba4f99c04d 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -28,6 +28,7 @@ PTESTS_FAST =3D "\
     icu \
     json-c \
     json-glib \
+    libassuan \
     libcheck \
     libconvert-asn1-perl \
     libexif \
diff --git a/meta/recipes-support/libassuan/libassuan/run-ptest b/meta/reci=
pes-support/libassuan/libassuan/run-ptest
new file mode 100755
index 0000000000..cbf971e12e
--- /dev/null
+++ b/meta/recipes-support/libassuan/libassuan/run-ptest
@@ -0,0 +1,12 @@
+#!/bin/sh
+
+cd tests
+
+for t in version pipeconnect fdpassing fdpassing-socket.sh; do
+    ./$t
+    if [ $? -eq 0 ]; then
+        echo "PASS: $t"
+    else
+        echo "FAIL: $t"
+    fi
+done
diff --git a/meta/recipes-support/libassuan/libassuan_3.0.2.bb b/meta/recip=
es-support/libassuan/libassuan_3.0.2.bb
index 0d2ccce989..2ae2fa77cb 100644
--- a/meta/recipes-support/libassuan/libassuan_3.0.2.bb
+++ b/meta/recipes-support/libassuan/libassuan_3.0.2.bb
@@ -18,13 +18,14 @@ DEPENDS =3D "libgpg-error"
 UPSTREAM_CHECK_URI =3D "https://gnupg.org/download/index.html"
 SRC_URI =3D "${GNUPG_MIRROR}/libassuan/libassuan-${PV}.tar.bz2 \
            file://libassuan-add-pkgconfig-support.patch \
+           file://run-ptest \
           "
=20
 SRC_URI[sha256sum] =3D "d2931cdad266e633510f9970e1a2f346055e351bb19f9b7891=
2475b8074c36f6"
=20
 BINCONFIG =3D "${bindir}/libassuan-config"
=20
-inherit autotools texinfo binconfig-disabled pkgconfig multilib_header
+inherit autotools texinfo binconfig-disabled pkgconfig multilib_header pte=
st
=20
 require recipes-support/gnupg/drop-unknown-suffix.inc
=20
@@ -37,4 +38,19 @@ do_install:append () {
     oe_multilib_header assuan.h
 }
=20
+do_compile_ptest() {
+    oe_runmake -C tests check TESTS=3D
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+
+    for test in version pipeconnect fdpassing; do
+            ${B}/libtool --mode=3Dinstall install -m 0755 ${B}/tests/$test=
 ${D}${PTEST_PATH}/tests/
+    done
+
+    install -m 0755 ${S}/tests/fdpassing-socket.sh ${D}${PTEST_PATH}/tests=
/
+    install -m 0644 ${S}/tests/motd ${D}${PTEST_PATH}/tests/
+}
+
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.43.0


