Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70BFFFEFB56
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 14:08:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.96446.1772201329084018895
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Feb 2026 06:08:49 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 45F5314BF
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 06:08:42 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 41AD33F62B
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 06:08:48 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] tcl8: skip more timing-sensitive tests
Date: Fri, 27 Feb 2026 14:08:45 +0000
Message-ID: <20260227140845.2052004-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 14:08:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232101

Skip more tests, as we already do for the tcl9 recipe.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/tcltk8/tcl8/run-ptest | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/tcltk8/tcl8/run-ptest b/meta/recipes-d=
evtools/tcltk8/tcl8/run-ptest
index 12921d8cfdb..0422e28a9d2 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/run-ptest
+++ b/meta/recipes-devtools/tcltk8/tcl8/run-ptest
@@ -19,11 +19,14 @@ SKIP=3D"$SKIP exit-1.\*"
 SKIP=3D"$SKIP \*io-46.1"
 # io-13.6 explicitly says it can fail on slow/loaded machines
 SKIP=3D"$SKIP \*io-13.6"
-# 14825
-SKIP=3D"$SKIP socket-\* socket_inet-\*"
+# The socket tests seem to be problematic with tight timing conditions, =
skip them all.
+# 14825 15495
+SKIP=3D"$SKIP socket-\* socket_inet\* socket_inet6\*"
 # These tests seem to be unreliable:
 # https://core.tcl-lang.org/tcl/tktview/3764f4e81f1483ab554c6d60f8483887=
bde28221
 SKIP=3D"$SKIP http11-\*"
+# tries to access google.com
+SKIP=3D"$SKIP httpProxy-\*"
=20
 for i in tests/*.test; do
     i=3D$(basename $i)
--=20
2.43.0


