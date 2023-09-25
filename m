Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 208B9CE7A95
	for <webhook@archiver.kernel.org>; Mon, 25 Sep 2023 11:35:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.58565.1695641710585122320
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Sep 2023 04:35:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 33338DA7;
	Mon, 25 Sep 2023 04:35:48 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 929A03F59C;
	Mon, 25 Sep 2023 04:35:09 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] webkitgtk: reduce size of -dbg package
Date: Mon, 25 Sep 2023 12:35:08 +0100
Message-Id: <20230925113508.1087898-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 11:35:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188185

From: Ross Burton <ross.burton@arm.com>

Unless DEBUG_BUILD is enabled, pass -g1 to massively reduce the size of
the debug symbols (4.3GB to 700M at time of writing):

  Level 1 produces minimal information, enough for making backtraces in
  parts of the program that you don't plan to debug. This includes
  descriptions of functions and external variables, and line number
  tables, but no information about local variables.

This makes the sstate objects a lot more manageable, and packaging
faster.  On my machine:

  PKG          TASK                 ABSDIFF  RELDIFF  WALLTIME1 -> WALLTI=
ME2
  webkitgtk    do_compile           -613.8s   -21.7%    2823.3s -> 2209.5=
s
  webkitgtk    do_package           -143.4s   -53.6%     267.7s -> 124.3s
  webkitgtk    do_install            -93.7s   -60.1%     156.0s -> 62.3s
  webkitgtk    do_populate_sysroot   -51.6s   -86.4%      59.7s -> 8.1s

Cumulative walltime:
  -892.9s    -26.5%    56:06.3 (3366.3s) -> 41:13.4 (2473.4s)

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.40.5.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.40.5.bb b/meta/recipes-=
sato/webkit/webkitgtk_2.40.5.bb
index a0c97aa593c..0c54f202ca5 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.40.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.40.5.bb
@@ -87,6 +87,10 @@ EXTRA_OECMAKE =3D " \
                  -DUSE_GTK4=3DON \
                  "
=20
+# Unless DEBUG_BUILD is enabled, pass -g1 to massively reduce the size o=
f the
+# debug symbols (4.3GB to 700M at time of writing)
+DEBUG_FLAGS:append =3D "${@oe.utils.vartrue('DEBUG_BUILD', '', ' -g1', d=
)}"
+
 # Javascript JIT is not supported on ARC
 EXTRA_OECMAKE:append:arc =3D " -DENABLE_JIT=3DOFF "
 # By default 25-bit "medium" calls are used on ARC
--=20
2.34.1


