Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AC52C5B549
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 08:45:59 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.29171.1749199551719618481
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jun 2025 01:45:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd83.aul.t-online.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout10.t-online.de (Postfix) with SMTP id B7431450
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Jun 2025 10:45:49 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.168.221]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uNShw-0xKABV0; Fri, 6 Jun 2025 10:45:48 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] libcheck: use cmake instead of autotools
Date: Fri,  6 Jun 2025 10:45:39 +0200
Message-ID: <20250606084539.2960891-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1749199548-477EBA7D-37FF5FCD/0/0 CLEAN NORMAL
X-TOI-MSGID: 78f60434-3575-4f8f-9df9-ea69d36b394c
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 08:45:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218121

- this fixes a build issue seen with current master-next branch:
| check.texi:1610: warning: node prev pointer for `Testing Signal Handlin=
g and Exit Values' is `Selective Running of Tests' but prev is `Selecting=
 Tests Based on Arbitrary Tags' in menu
| check.texi:2051: warning: node prev pointer for `TAP Logging' is `Test =
Logging' but prev is `XML Logging' in menu
| make[2]: Leaving directory '/home/flk/poky/build/tmp/work/corei7-64-pok=
y-linux/libcheck/0.15.2/build/doc'
| make[2]: *** [Makefile:452: ../../check-0.15.2/doc/check.info] Error 1
| make[1]: *** [Makefile:574: all-recursive] Error 1
| make[1]: Leaving directory '/home/flk/poky/build/tmp/work/corei7-64-pok=
y-linux/libcheck/0.15.2/build'
| make: *** [Makefile:420: all] Error 2
| ERROR: oe_runmake failed
| WARNING: /home/flk/poky/build/

- checkmk adds a reproducibility issue. @AWK_PATH@ is  unique, because aw=
k is
  in hosttools. We dont want it that way for target. Hack it with sed

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-support/libcheck/libcheck_0.15.2.bb | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/libcheck/libcheck_0.15.2.bb b/meta/reci=
pes-support/libcheck/libcheck_0.15.2.bb
index 5ab67b8728..34d41ce2ff 100644
--- a/meta/recipes-support/libcheck/libcheck_0.15.2.bb
+++ b/meta/recipes-support/libcheck/libcheck_0.15.2.bb
@@ -18,15 +18,18 @@ GITHUB_BASE_URI =3D "https://github.com/libcheck/chec=
k/releases/"
=20
 S =3D "${WORKDIR}/check-${PV}"
=20
-inherit autotools pkgconfig texinfo github-releases
-
-CACHED_CONFIGUREVARS +=3D "ac_cv_path_AWK_PATH=3D${bindir}/gawk"
+inherit cmake pkgconfig texinfo github-releases
=20
 RREPLACES:${PN} =3D "check (<=3D 0.9.5)"
=20
+do_configure:append:class-target() {
+	sed -i "s|@AWK_PATH@|${bindir}/awk|" ${S}/checkmk/checkmk.in
+}
+
 do_install:append:class-native() {
     create_cmdline_shebang_wrapper ${D}${bindir}/checkmk
 }
+
 BBCLASSEXTEND =3D "native nativesdk"
=20
 PACKAGES =3D+ "checkmk"
@@ -34,3 +37,4 @@ PACKAGES =3D+ "checkmk"
 FILES:checkmk =3D "${bindir}/checkmk"
=20
 RDEPENDS:checkmk =3D "gawk"
+
--=20
2.49.0


