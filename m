Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60E4EC982DE
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 10:39:16 +0000 (UTC)
Received: from PNZPR01CU001.outbound.protection.outlook.com (PNZPR01CU001.outbound.protection.outlook.com [40.107.51.38])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46181.1789986275105636396
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 03:24:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=1+Rvr0bp;
 spf=pass (domain: bmwtechworks.in, ip: 40.107.51.38, mailfrom: upstream_ip-sk@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mxnz51Vb9WxRPKXy01LzjybSnbGVj+FCLrbIQlv15YY1KYAn7xAh3eclktqEN54yBumW8UtmOXu4+QPGGO1BRlK8C7uFJQIuA+7qld7EBUF20e3CAtvYmvbxSJCWzgaFOpeMzxyFAptut1bHzBUEWu4SHXmALJmv4kxs56WSaoiDnB34QxZl5XVO7Ea1zn9X0RHHE3tRegQBPhUJtKIC0238z3evzo91XReNQKP4vKoh6Xd0Fupc8NqO89powTSdxL9L3QEliXoCf7WkNEE6cGxmyVPZz+SPFsqGTS0enWgLbuGq+E73WvWRU68sjV1GaJ9R0CaV4s1SFbmYZ9w8HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B68P7Bl5kYRSIBbz9t2905ds8HLbzp8i6BgAmDBYLjs=;
 b=qvfRSgeHWwFCZl3t9lfT1vR1Jg9oNQlZD0V0/vz4OXpl9zEQAT84qvqNGqaGmx3sAhulrwn/l3rtKu0zMBgTPTm/qF3xQTDJn9bCPSFHQIUt5FWhULr5rJAVtRIutpEmhq+agZV6Vyk94z6IEl4tQQni7Wv1l2lTzaOOZuAHXWcLGhZQg8C8tOrpADOiewvDU/gwl0iu1WJx8t5h/O1aQtOZ5o9r151xBCVYXJfzXJ1E/LjqrI6SZl7DqRt4MUVJcOE+QXCPejcjAu9VPzXnR5ecSaraOONaICIQ1L6SIoimFzyq/Nv4NTzgweJfMrD7dxyFJ9jOewIkuxD1eYg7eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B68P7Bl5kYRSIBbz9t2905ds8HLbzp8i6BgAmDBYLjs=;
 b=1+Rvr0bpE6a91jvqDTSQOG65YKuhnjJW4SynMWWcPkY1eT69MXqSD37O7V2NdEZlON2oGe7GK9JUVRDywYrxCUHewmyFjkDRnMWH6Br20GiQ0gISz8NgILpncv8cKJyrmk83JjjdamU6x5hxfndHeIa2W2WnhXZAO5TcYDd263gTMeB6OhrPh0ksBI0BiGsEMWimrXAow1PVmH/BPpJZg4khBl6712GIiWSMi3dTRtQE1vGKZ/5KJ6gWPr8bNEhsYsWe6FKftOlC+qkUPSKiJM9GVBtx4ulY4+R3fsfIo/sZUgtPczAK4p7C+wtOMJAAkZriOJOa2IFJOlxr/yq6FA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from MAYP287MB3754.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:148::9)
 by PN4P287MB4251.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:2a3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 10:10:20 +0000
Received: from MAYP287MB3754.INDP287.PROD.OUTLOOK.COM
 ([fe80::ef09:5a67:49d7:9504]) by MAYP287MB3754.INDP287.PROD.OUTLOOK.COM
 ([fe80::ef09:5a67:49d7:9504%5]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 10:10:20 +0000
From: Sana Kazi <UpStream_IP-SK@bmwtechworks.in>
To: openembedded-core@lists.openembedded.org
CC: Sana Kazi <Kazi.S@bmwtechworks.in>
Subject: [oe-core][scarthgap][PATCH] alsa-lib: Add ptest
Date: Mon, 21 Sep 2026 15:40:12 +0530
Message-ID: <20260921101012.1107752-1-UpStream_IP-SK@bmwtechworks.in>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: PN0PR01CA0053.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:49::22) To MAYP287MB3754.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:148::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAYP287MB3754:EE_|PN4P287MB4251:EE_
X-MS-Office365-Filtering-Correlation-Id: e7a02eff-717f-4d19-8046-08df17c88ae1
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|23010399003|10067099003|56012099006|6133799003|55112099003|18002099003|11063799006|12006099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	idbcZ23m7qQuGpGwRSAkNYC9FSvukZfzlr62PlveuyH5fRKDmYuKDkG8JeHA7G6gz4CFLY6+bi7tBw1rWjOW3gnKyPFzcCugSVAA/ejEZS2w9d2vyxzhi3VkhvSY5o33d1NCOXRnECWIjcSztdz4yCcR/e0I7rbRJQD2mnIyXlB6QRMTHoKdFkESQnI+xLBZa8MCb7p8C4+FK7gyAzemFy9f1cfxrvB6UDxcw9Wv93hL7+hDSVssR+Rhf6vavzWuCK2yvGvLp803fl1Kq6VmfU8rHNCEkArAoLNU1O6cCGT4+lRe9L75oqC9BLdNV5/C7J5r6UJ8sTXYVcJ8AZiEKAmbQjbi+D731Cs4l8y8iXlDBRF6odYCRmn0BKxPiRTFJ3ykeqyjUk8zZXbu5/3YfJIEyqZZEwHi0fRS4+C6AObkRdKKPwApYRcxcDkJtyzwpn5H+NzYAKT9BzNuSPzId1HPOEs6700TQicFEgrXxrqd7JTzmJwfmIIUxX+EqDG+h0ajk6TIoIM8K3krUiGXsgtGfzgyOUyWwTbPt08NvviEZruIrQCNMzE4w0JM07RTohE+9XDBZ7O8u5AY9OMSwkduBP53MU0OXLylyFSZj2NHHOr1ELg0WYKTJivcOgR0seaa96Ho05iqe1lA+7VF6qY+I8tJ4o11P3MgX9xhSLo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MAYP287MB3754.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(23010399003)(10067099003)(56012099006)(6133799003)(55112099003)(18002099003)(11063799006)(12006099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IuLbfsLs2g/MnRxWhEx7SC+zCLGNBEmiVYdqP+HBfjTjJA72Ulp5SRAR+9Vm?=
 =?us-ascii?Q?oEGOskPQtsrszvACGWPre3MAE5ZlWBUv3xoPmy4cUvBIv02Ip8wYJoyA5epK?=
 =?us-ascii?Q?B7xBOYLEpbI2lFwFlAhUplh0p38EiEtBZMoUoRd4NcCN4CbGyRASRMSB//RF?=
 =?us-ascii?Q?G+azxOxhB2iAKNxQBuPHDolTS5jbbT0LF/RlgMGuzcbyGm8G86qY9HP+1YAs?=
 =?us-ascii?Q?N1bYWaZAhLv8oQ9xjsN+ib4YMJBax91jdefIP3iqqUEGfUB1uj++DrUrhggK?=
 =?us-ascii?Q?wo9rGGqQ0Ha0hltQRJOD5AFYHko0IsmqGY+ZNT5wfO2TdyzBg8A5rOh0MV0X?=
 =?us-ascii?Q?0rkhuJL0YEA/aL3HG6YF717XUo9R4oj8eZV/2G6PWbLq7pYnLfX8P2l5rOUh?=
 =?us-ascii?Q?O1m2O3S/37aacFSdAgoYzdcbwmNvaZr5T1GUOpofhCvp8vkK0J3YVzjRbwT2?=
 =?us-ascii?Q?ZwgT96X+TiBICzVh9j0CmwztzgEvZrAhKItbB83Bc1KIwCJ17eXNOXXbfcOF?=
 =?us-ascii?Q?PEnU+uCNzV7n4b0Dw/wdnMXnv4uxPmLAyoQtPqRtF6CKJoaIpqLjrr25Bt3c?=
 =?us-ascii?Q?kQ4Vt4bQJcEbc6K5KU3+tWGmES+NbF/lNR+sA27C+8HD/jTza8/O/rIIGLNl?=
 =?us-ascii?Q?pGHW8NNWa29rHauqE14hcU6gM/JtF6qShv68Ong2RnauihP73nUXj6O6iFXY?=
 =?us-ascii?Q?NX8s2K998mAPXvOwt8haNCb39Re8mg+xeXZxye8LKP+4rXdkUzcgZ2ho5c73?=
 =?us-ascii?Q?HKmnMUFPa/ddO9PWND/RC1ntcogUCX30aWBb7cSfOWIQPltpSDMUbjeWVuPf?=
 =?us-ascii?Q?xQ34+Ci4E23hxQnPHzHOH2Fq8W+6/JoILN39ZJfU6xkBxtYlkUbzQyKPc8ah?=
 =?us-ascii?Q?/tB3pFpE0IZ9KLUaT3uIguJ9Uk/hEi90sWpw8JnjyHtGzHzKzhrLnbA6fH6s?=
 =?us-ascii?Q?UCY/SCKRp4IyL+w7gIjYiRH0qKTRIHdexiFCsvXdHmayV344Jk1g2d9IlFFn?=
 =?us-ascii?Q?+QzeyrZ1XQ7jeaU4kfrciuIUGMCy/Gz8mrMazHFogWROOwsyqhDTd0d7wl7W?=
 =?us-ascii?Q?Suytxg2cUf+Vo3BW+pZHXIVi2dAKYAsP2T3LDZmKbEwAUdOwsKdleAg//D4d?=
 =?us-ascii?Q?KI7s/r6A/QjqudXFNDDFhnfqbaP6boIifq9Go6gGfwW/RGqyPjKDs3a1K7QM?=
 =?us-ascii?Q?OZ9Rc4/uUwV5TdXi8zoFfVSSdunWLQKmSUV1sY5nGgWiCBaxexc7FekERbYZ?=
 =?us-ascii?Q?GV1eKMPOlhfVuEtXL1PRL6UUvMyPkVXvpoPgnwjf4SdVLG02pPgcJEzi2jA/?=
 =?us-ascii?Q?IVHfHlOsr6JQXMu7v2wKa4IV5UzFwRNfDm0oX4I28sCajKOihDOMwxRseRCL?=
 =?us-ascii?Q?xa0CK8fl+HmtUNPtyzd3DmM38mnaRJCCDU8XxukE03w/20obyCOs3r6ZCKtn?=
 =?us-ascii?Q?/IJOrUP5QW4TrMxEml0ISnCpdRMLgFCCzAvII3IW32ozdH5JL2S20sGjSLFm?=
 =?us-ascii?Q?2sJTXbq1nBev0RC8rczd5C0CC3iNXxmzGKlrqULHZU7uDfaIM+/shlYd81tO?=
 =?us-ascii?Q?oEfVTC9sV67+trTaTbhnOw2u4eD/r6wThrbm1yYgGxHHced2hoQlyfHDk8W+?=
 =?us-ascii?Q?ALZRHmDT2X5zrZKBq0kXMB0lKvRPbdtcxVGKbbnFgO/QJhiIa7elHf2lw6vJ?=
 =?us-ascii?Q?SreeRkTurUI2xk9aBJMh1k8YqkDinjnTaevyFMNHWJzLcv+Yg0b240cxpu+0?=
 =?us-ascii?Q?YEtY/dSkpmuX9NNvS/J5cVJQvFvOmXU=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: e7a02eff-717f-4d19-8046-08df17c88ae1
X-MS-Exchange-CrossTenant-AuthSource: MAYP287MB3754.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 10:10:20.1508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IyPfoiQuy79CprOzrlfHmZLH+4xG6gYVkT6PnY0H2NA5OxF9ZML4NuuHV0EWpgwu5j3g62e1/dUk7QNDa1ZzC8D17udR15rCRNdecpK/KyY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN4P287MB4251
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 10:39:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246317

From: Sana Kazi <Kazi.S@bmwtechworks.in>

alsa-lib is a user space library that provides audio and MIDI
functionality apis for simplifying application programming
and provide higher level functionality

ptest executes below binaries on target:
1.config
2.control
3.client_event_filter
4.midi_event

The following changes are introduced:

- Add the required include path to CFLAGS to resolve:

  fatal error: alsa/asoundlib.h: No such file or directory

- Remove the test suite execution "make" call using sed to avoid
  executing tests during the build.

- Build the test sources using:
    oe_runmake check

- Install the generated test binaries through do_install_ptest().

Signed-off-by: Sana Kazi <Kazi.S@bmwtechworks.in>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../alsa/alsa-lib/run-ptest                   | 14 ++++++++++++
 .../alsa/alsa-lib_1.2.11.bb                   | 22 ++++++++++++++++++-
 3 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index 9950e46776e..2f1373421db 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -5,6 +5,7 @@
 #
 PTESTS_FAST =3D "\
     acl \
+    alsa-lib \
     apr-util \
     attr \
     babeltrace \
diff --git a/meta/recipes-multimedia/alsa/alsa-lib/run-ptest b/meta/recipes=
-multimedia/alsa/alsa-lib/run-ptest
new file mode 100644
index 00000000000..f6d3ac23dfa
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-lib/run-ptest
@@ -0,0 +1,14 @@
+#!/bin/sh
+set -eux
+
+for t in config control midi_event client_event_filter
+do
+    if "./$t" > "alsa-lib_$t.log" 2>&1
+    then
+        echo "PASS: $t"
+    else
+        echo "FAIL: $t"
+        cat "alsa-lib_$t.log"
+    fi
+    rm "alsa-lib_$t.log"
+done
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.11.bb b/meta/recipes=
-multimedia/alsa/alsa-lib_1.2.11.bb
index e86239ff871..b3ce3d5aa4a 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.11.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.11.bb
@@ -12,10 +12,11 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da916467b9107=
6e631dd8edb7424769c7 \
 SRC_URI =3D "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2 \
            file://0001-topology-correct-version-script-path.patch \
            file://CVE-2026-25068.patch \
+           file://run-ptest \
            "
 SRC_URI[sha256sum] =3D "9f3f2f69b995f9ad37359072fbc69a3a88bfba081fc83e9be3=
0e14662795bb4d"
=20
-inherit autotools pkgconfig
+inherit autotools pkgconfig ptest
=20
 EXTRA_OECONF +=3D " \
     ${@bb.utils.contains('TARGET_FPU', 'soft', '--with-softfloat', '', d)}=
 \
@@ -31,6 +32,25 @@ FILES:libatopology =3D "${libdir}/libatopology.so.*"
 RDEPENDS:${PN}:class-target =3D "alsa-conf alsa-ucm-conf"
 RDEPENDS:libatopology:class-target =3D "alsa-topology-conf"
=20
+EXTRA_OEMAKE:append =3D " AM_CPPFLAGS=3D-I${S}/include"
+
+do_compile:append() {
+        sed -i 's/^.*$(MAKE) $(AM_MAKEFLAGS) check-TESTS.*$/ /' ${S}/test/=
lsb/Makefile.in
+        oe_runmake check
+}
+
+do_install_ptest:append() {
+    for f in control client_event_filter namehint
+    do
+        install -m 0755 "${B}/test/.libs/$f" "${D}${PTEST_PATH}";
+    done
+
+    for f in config midi_event
+    do
+        install -m 0755 "${B}/test/lsb/.libs/$f" "${D}${PTEST_PATH}";
+    done
+}
+
 # upgrade path
 RPROVIDES:${PN} =3D "libasound"
 RREPLACES:${PN} =3D "libasound"
--=20
2.43.0


