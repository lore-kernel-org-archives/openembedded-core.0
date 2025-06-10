Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08113C5B552
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 05:58:24 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.79649.1749535101952930428
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jun 2025 22:58:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd89.aul.t-online.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout01.t-online.de (Postfix) with SMTP id 16E4E3E1
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 07:58:20 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.166.111]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uOs03-0GzSMb0; Tue, 10 Jun 2025 07:58:19 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCHv2] libcheck: use cmake instead of autotools
Date: Tue, 10 Jun 2025 07:58:10 +0200
Message-ID: <20250610055810.7036-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1749535099-D7FF25DB-610E0199/0/0 CLEAN NORMAL
X-TOI-MSGID: 8fe323a7-13ec-44c0-a1cd-e441ef0c065e
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 05:58:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218311

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
  in hosttools. We dont want it that way for target. Use a '-D' assignmen=
t to
  fix this (Thanks to Ross.Burton@arm.com).

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-support/libcheck/libcheck_0.15.2.bb | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/libcheck/libcheck_0.15.2.bb b/meta/reci=
pes-support/libcheck/libcheck_0.15.2.bb
index 5ab67b8728..8455f2c748 100644
--- a/meta/recipes-support/libcheck/libcheck_0.15.2.bb
+++ b/meta/recipes-support/libcheck/libcheck_0.15.2.bb
@@ -18,15 +18,16 @@ GITHUB_BASE_URI =3D "https://github.com/libcheck/chec=
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
+EXTRA_OECMAKE:append:class-target =3D " -DAWK_PATH=3D${bindir}/awk"
+
 do_install:append:class-native() {
     create_cmdline_shebang_wrapper ${D}${bindir}/checkmk
 }
+
 BBCLASSEXTEND =3D "native nativesdk"
=20
 PACKAGES =3D+ "checkmk"
@@ -34,3 +35,4 @@ PACKAGES =3D+ "checkmk"
 FILES:checkmk =3D "${bindir}/checkmk"
=20
 RDEPENDS:checkmk =3D "gawk"
+
--=20
2.49.0


