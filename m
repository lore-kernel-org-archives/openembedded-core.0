Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63E2BCC6B1A
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 12:07:51 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11964.1791979668004072173
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 05:07:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=eih2Wu6C;
 spf=pass (domain: est.tech, ip: 52.101.69.29, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UhJRGi71SA2Dyw5qb0KPbThwiBx7uGU+4w/RDcL3S6mZhw8FSVYYwbl1/HyDRErT9BD8xa8b7RAQkT1R4i3HcAOiBbudnvyZ/YiGLaZlWdGx8OfnDuI3h4MVqEq2Qbo9pKPoFjZIWWE9QtclN6x+VgQLY1i+dwR06hO1ykFET99cvkYjg1kn+oUzGb6T08GBQu5tOV6O82uk1oNLJiQn9XvinHhva8trwnR7H4WAmbkBMYgWkAoytoqD0ZnzauB7fcgQaMlDZQGF6s6GeproJip3yupSifPhW3b3zRrkyUjfyqtIliMIvKq13EpxlO7FO4XO02ai2jdkgji4/w7prQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=44e5Cg7S3OR98qVFZJm3yPPCu9RB7fWc5AveCVZbkbU=;
 b=lDJWrVbwPvnBHEJ5u3+LjGmIEAsoIl2y95+9FTVkzgXYnLVlRHlF9qBdJjeILhPCaehE43nT5aLx7BxrC8NFy86hestsByXfgTUeV4d0LhSL4bgHjiAFgD5TrW+19G0mFHwT1Z449/JXoJ8oRxuT+BzgLUASbfEo8ViqPesBRmzDwEOumncszZU9Q5saZ7+kWBSAmpjg6bx+HWtHLZYsdjmauJT9m+MRYSvpypHOFCdFkrCbulygTBBPLdK/qzUiyqxvzIs6OSusj+Jwy/+YMfU3Xaxl00qketXTBZeR6UQ0zGg4iHZilb8ViAAZ2dnCugYcBHfMlFdu+YfgOzzXXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=44e5Cg7S3OR98qVFZJm3yPPCu9RB7fWc5AveCVZbkbU=;
 b=eih2Wu6C9nTPlcgGUC9aL/mfbwk6ML1R0vJCa2FDOS72tG1IRy/meJl1UrNxGbOEoiE5mzDdL+aZ3NsT+wOtYRW4t3OSV18EtRXlc7bzScCMVRZDvdpIjUMpEm/QHL+wblO2n8lWBoYF8o5UHrUN6vr8H7+8Cm5IG+sdO0bgR+XLKM5Pw3MqG00A1G7T+epY0Wh2Cacme07s2DVqos3S7LcunhIOeAd2lRWO4ciPE5CrDbtBULJaaROzBfYCs2UuZMrar5viI7nBLnNXaLt6IBBWzs1fZSFLL1k4fTrgUsA2Rqi+YYpOTSSXYUW/AWG7tzHW/ogxwLv5heW1nXkdNA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by PA6P189MB3742.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:519::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 12:07:42 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0522.012; Wed, 14 Oct 2026
 12:07:42 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v3] libsoup: add ptest support
Date: Wed, 14 Oct 2026 14:07:37 +0200
Message-ID: <20261014120737.24575-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014085044.14497-1-pratik.farkase@est.tech>
References: <20261014085044.14497-1-pratik.farkase@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0062.eurprd04.prod.outlook.com
 (2603:10a6:10:232::7) To PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:4d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3P189MB3239:EE_|PA6P189MB3742:EE_
X-MS-Office365-Filtering-Correlation-Id: e984afa3-0c29-460a-fb87-08df29ebbfd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|6133799003|10067099003|18002099003|22082099003|260925022911599003|260925021311599003|260925021911599003|11063799006|261009223327099003|261009221227099003|261009221727099003|261009220027099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	FAuzN+hlcQrIg4VlalR4sXfMw+8Lq6pVmDG9swMW/VTpwScsQCV5xclza/MjNuh6rcPBYf3KZpA2akRfFabT31ns/SFK3HTxoU9Kh6u8Ohftiig0nitTl/O1LVm7mEnjkcDM723pJPGYJMf5CetG6EOB0661BPd+MXO08hgAn3HB3Y91XZFMpmKTDb3wyaueLmxbTUklMkdRxBEGrRSvInR+6PfWbQRjx0r1RXSIBqFk5coJygEksWvlg0fwEFJKekNZ/cOP/jFSJOgskZM9KrFYsvPnLBM/MvfxYDABS7eHi4tSE2e5XMf1qwXjacN8cl/vhT3O/nUcsl0UmS8Fu3iwofL6gHPAm0Z88awVN/+D5Yrg1lYEwGMHRs4DMu9dNFdopATN2Qe2JMjNNa7iiS3/tZsZO7JrXtir1ugGxqqYtP6KbcxEwRYhS3ATvoG2OUwxlHguRVefpLjen8dWsPDyPt91uECoJDwZ2j/CWaZbUYS+RPpUynGtJTgo0jYyavouEPoJc2NBlWZjvjHKjpNjuYzEXIjRiJt46GvMAhjQFTYMojCJOpgD76kpMre9UbctPP20ylkLJe1nDuikEqlW0cpempE/qDHmzFh2SFRv0t5dwPeHWhDxUg4y5tiWfo3gx9XJ8nkVDyHM3TLL+fPNcxB2ydFRac3UUWSyMXc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(10067099003)(18002099003)(22082099003)(260925022911599003)(260925021311599003)(260925021911599003)(11063799006)(261009223327099003)(261009221227099003)(261009221727099003)(261009220027099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DzyilFKStZ+RoY1E7jYtMIWj32zDrcGfPyqXpk1EoNybG0xG/7Uv07cyKEeM?=
 =?us-ascii?Q?zqz/KMgKRLYezntQ9KtXAlgPYHjIb3Kl2MMVBLav9+fq9+FvxbAzWHC2oiEB?=
 =?us-ascii?Q?fsQS8MtpnYQh3wK/KcUt2khYBsiCD1zLgSoFMNcJpYURVuE10a5oOoBGhcUi?=
 =?us-ascii?Q?KAaaEKHZqSNM3Xm/nj8jqnIsteIfFWWX65X4HsZQ3/Or6lkkxeRKCB7nglsi?=
 =?us-ascii?Q?xLofvqJj/ZA/ri77nxjunnIzxIukJpogGyhi1mq0IPk7CWfK3ocELq4wZNAZ?=
 =?us-ascii?Q?bKBCeXztAVu3tRG+EMNZt0LDbn0h493rboxrDf/4u8iv42Vy9eI/TOIcQlUk?=
 =?us-ascii?Q?Ah1nkUK2k1sUm5PzGv/FOI/VERloosf9mHidWBWeJfBKolaEyem7xd53loTS?=
 =?us-ascii?Q?5ibGEZ9bnny6sgdDT9CZ5iv5t2HlofBiECD/R7sBN4nJMM9IjH5rFLmHhj8r?=
 =?us-ascii?Q?LL2ioJSH62jvhKMu5RkXM+QKvdhZ1/AGPLNFxznbnTU/F63YzZtkmQSFUNdG?=
 =?us-ascii?Q?wKWrag5IOUN96unnZm2ROKyE7mXLl5GPe5F7RyB8d7tLs9uqKYhqdVG3R8Wy?=
 =?us-ascii?Q?VVjAg3Yuk1CziKGo4VXYSWktdhHA7DU27f3yOnmtPHRhCRg2tQjtkHvX5Fe3?=
 =?us-ascii?Q?+mDsWHOmuMDd3t6FCXaV+QPg+x0WTPZwNNyqPiwVRyZBxUlrdXJ056+pD2Wk?=
 =?us-ascii?Q?3pdbPfHxdcG598t3PcqpPbkWQ5MqRqYa6ZiQdLIENLw33sNgRjEU+0BOVTW1?=
 =?us-ascii?Q?56AooY+bDgZoN0XjM2dU/Hg0ircNdk4DwlM+cHFpNurg1M2rVhPtdGFWkny4?=
 =?us-ascii?Q?Lb7Nx80g7W81URzN073YNZ13KA61A8iVr/wnNtgfCa9KBCWP4CvJSSfHK/Br?=
 =?us-ascii?Q?v/RSbmpUL3sRnBS5LRM9jC2prY7XX4DqS+u5XV0KzHQ61BpVc0PKFj14G5Wu?=
 =?us-ascii?Q?4shu/UvrM0kFerzHOrJkBAOK73MbSgnlfwPg87NPPV19q5W3v+sJii7Pl8RI?=
 =?us-ascii?Q?d+uZytG5Vd04pnRY6Ybn0HytfvDOT+FsFeD7bCCm+Iy4VX+XXWxl1K5gmRV0?=
 =?us-ascii?Q?nIBQNLYkl+zjjvcDqBTy58XdIDtRkwPto/9bfN6zJHqtxzzl33y+9VcrwxdL?=
 =?us-ascii?Q?FGvj+18pcQUKXcpe4FQuVPQD+WesUknbLcDZSFsxPbt1gYLobl8svAayWpAm?=
 =?us-ascii?Q?od2tLiXHJRSvxj5uNN48cw7iyw9i4UqvNZCn55tQePAMpji5rQH1+L1tNgNj?=
 =?us-ascii?Q?Tv7dVOTcqyEe8nN+MuD2SWRpQ9s5Xgo3ATWKhgsYODBDD0CGxZmK/i/+wSaQ?=
 =?us-ascii?Q?nF6u+ebA/8hKyjvsYLIfflpH3gCLePX6Mz9vOwqvYtETX9yJRQOxH6FDKncO?=
 =?us-ascii?Q?CZYw+rAsCZSAbDatPaQFKNbzmMqD4NNILRXj4j1hOcSX1cG+OtMKGrhjsfos?=
 =?us-ascii?Q?lj206mAwT2CnO3rngXjPsw/6R57tj9on8f+p3iMSv+PHnKuTNqpWweFroblp?=
 =?us-ascii?Q?d5WLLpT0vZhpNvZhLK6i6n3Zgi+NlarKwEnvn64Yo68BRffTpxV4rV6yODPv?=
 =?us-ascii?Q?Drp5TLtYobKoDQfEAkwxTv1jLfnLOnJV8VbLxAvEZCxEIWQh5ygCcltfXcsi?=
 =?us-ascii?Q?rNIKTX/MuBAjKcFZ5wx/MObVxwaJUhK0/Z/swuJhNMedD258UFb1CKK78Y1d?=
 =?us-ascii?Q?aAYkjsecAn1OWbCHAvoiIKQKIfnEdjBbSmb3od1+9lELPQInSH8pQy58hxes?=
 =?us-ascii?Q?YucV5WNNCw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: e984afa3-0c29-460a-fb87-08df29ebbfd8
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 12:07:42.3656
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ft4z4JZhowj2/s4MzB7UV+XF9RAatsBXwZGWxcArk5hOX5FY0FnhsbQ9+gkXDOrYJFGbHYV9AS+DT3NKwt4LBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6P189MB3742
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 12:07:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247758

Build the installed-tests via the meson tests/installed_tests options
(enabled through a new 'tests' PACKAGECONFIG when ptest is in
DISTRO_FEATURES) and run them under ptest with
gnome-desktop-testing-runner.

Tested on qemux86-64 with ptest-runner.

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---

Notes:
    Changes in v3:
    - Drop the QB_MEM bump approach from v2: 4 GiB was still not enough and
      logger-test was OOM-killed (~4 GiB RSS) on the autobuilder. Exclude
      logger-test and http2-body-stream-test instead, alongside the existin=
g
      header-parsing-test exclusion.
   =20
    Changes in v2:
    - Rebased onto master after the libsoup 3.6.6 -> 3.8.0 upgrade.

 .../distro/include/ptest-packagelists.inc     |  1 +
 .../recipes-support/libsoup/libsoup/run-ptest |  3 ++
 meta/recipes-support/libsoup/libsoup_3.8.0.bb | 28 ++++++++++++++++---
 3 files changed, 28 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-support/libsoup/libsoup/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index 2bd11b1706..992d3666b9 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -138,6 +138,7 @@ PTESTS_SLOW =3D "\
     libmodule-build-perl \
     libpcap \
     libpng \
+    libsoup \
     ${@bb.utils.contains('DISTRO_FEATURES', 'seccomp', 'libseccomp', '',d)=
} \
     lttng-tools \
     lz4 \
diff --git a/meta/recipes-support/libsoup/libsoup/run-ptest b/meta/recipes-=
support/libsoup/libsoup/run-ptest
new file mode 100644
index 0000000000..efe975cf3f
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/run-ptest
@@ -0,0 +1,3 @@
+#! /bin/sh
+
+gnome-desktop-testing-runner libsoup-3.0
diff --git a/meta/recipes-support/libsoup/libsoup_3.8.0.bb b/meta/recipes-s=
upport/libsoup/libsoup_3.8.0.bb
index 2a40eecaea..1712c1b2f7 100644
--- a/meta/recipes-support/libsoup/libsoup_3.8.0.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.8.0.bb
@@ -9,20 +9,23 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5f30f0716dfdd0=
d91eb439ebec522ec2"
=20
 DEPENDS =3D "glib-2.0 glib-2.0-native libxml2 sqlite3 libpsl nghttp2"
=20
-inherit gettext gnomebase upstream-version-is-even gobject-introspection g=
i-docgen vala
+inherit gettext gnomebase upstream-version-is-even gobject-introspection g=
i-docgen vala ptest-gnome
=20
 SRC_URI[archive.sha256sum] =3D "bbf08fa3e03a88c31a3d27a0d87cb422e9490f2d08=
e149211103df6d638a2238"
=20
+SRC_URI +=3D "file://run-ptest"
+
 PROVIDES =3D "libsoup-3.0"
=20
 GIR_MESON_ENABLE_FLAG =3D 'enabled'
 GIR_MESON_DISABLE_FLAG =3D 'disabled'
=20
-PACKAGECONFIG ??=3D ""
+PACKAGECONFIG ??=3D "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '=
', d)}"
 PACKAGECONFIG[brotli] =3D "-Dbrotli=3Denabled,-Dbrotli=3Ddisabled,brotli"
 PACKAGECONFIG[gssapi] =3D "-Dgssapi=3Denabled,-Dgssapi=3Ddisabled,krb5"
 PACKAGECONFIG[ntlm] =3D "-Dntlm=3Denabled,-Dntlm=3Ddisabled"
 PACKAGECONFIG[sysprof] =3D "-Dsysprof=3Denabled,-Dsysprof=3Ddisabled,syspr=
of"
+PACKAGECONFIG[tests] =3D "-Dtests=3Dtrue -Dinstalled_tests=3Dtrue,-Dtests=
=3Dfalse -Dinstalled_tests=3Dfalse"
=20
 # Tell libsoup where the target ntlm_auth is installed
 do_write_config:append:class-target() {
@@ -34,13 +37,26 @@ EOF
 EXTRA_OEMESON:append:class-target =3D " --cross-file ${WORKDIR}/soup.cross=
"
=20
 EXTRA_OEMESON +=3D "-Dtls_check=3Dfalse"
-# Disable the test suites
-EXTRA_OEMESON +=3D "-Dtests=3Dfalse -Dautobahn=3Ddisabled -Dpkcs11_tests=
=3Ddisabled"
+# tests are controlled via the 'tests' PACKAGECONFIG (enabled for ptest)
+EXTRA_OEMESON +=3D "-Dautobahn=3Ddisabled -Dpkcs11_tests=3Ddisabled"
=20
 GIDOCGEN_MESON_OPTION =3D 'docs'
 GIDOCGEN_MESON_ENABLE_FLAG =3D 'enabled'
 GIDOCGEN_MESON_DISABLE_FLAG =3D 'disabled'
=20
+# These tests abort under ptest and leave the binaries in place:
+# - header-parsing-test: a g_hash_table_size() assertion in
+#   do_param_list_tests() does not hold (returns one entry instead of thre=
e)
+#   with the current glib.
+# - logger-test (long-invalid-body-length) and http2-body-stream-test
+#   (large_data) exercise multi-GiB allocations and are killed by the OOM
+#   killer on the memory-constrained ptest machines.
+do_install_ptest:append() {
+    rm -f ${D}${datadir}/installed-tests/libsoup-3.0/header-parsing-test.t=
est
+    rm -f ${D}${datadir}/installed-tests/libsoup-3.0/logger-test.test
+    rm -f ${D}${datadir}/installed-tests/libsoup-3.0/http2-body-stream-tes=
t.test
+}
+
 # When built without gnome support, libsoup will contain only one shared l=
ib
 # and will therefore become subject to renaming by debian.bbclass. Prevent
 # renaming in order to keep the package name consistent regardless of whet=
her
@@ -50,6 +66,10 @@ DEBIAN_NOAUTONAME:${PN} =3D "1"
 # glib-networking is needed for SSL, proxies, etc.
 RRECOMMENDS:${PN} =3D "glib-networking"
=20
+# The TLS-based tests (ssl, server-auth, websocket, hsts) need a glib TLS
+# backend at runtime.
+RDEPENDS:${PN}-ptest +=3D "glib-networking"
+
 BBCLASSEXTEND =3D "native nativesdk"
=20
 CVE_STATUS[CVE-2026-1467] =3D "fixed-version: fixed in 3.6.6"
--=20
2.43.0


