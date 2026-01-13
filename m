Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 684F4D2F35C
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 18:40:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.66632.1768329606443106610
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jan 2026 10:40:06 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4EE9C497
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 10:39:59 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 80EC03F59E
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 10:40:05 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] tcl: skip all socket tests
Date: Tue, 13 Jan 2026 18:40:00 +0000
Message-ID: <20260113184000.3938096-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260113184000.3938096-1-ross.burton@arm.com>
References: <20260113184000.3938096-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 18:40:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229289

We've had more intermittent failures in the socket tests, most likely
due to overly-tight timing requirements that we cannot achieve.

We should continue to talk with upstream about relaxing the timing
windows, but for now skip all socket tests (socket, socket_inet,
socket_inet6)

[ YOCTO #15495 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/tcltk/tcl/run-ptest | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/tcltk/tcl/run-ptest b/meta/recipes-dev=
tools/tcltk/tcl/run-ptest
index 46a1967def..506529eada 100644
--- a/meta/recipes-devtools/tcltk/tcl/run-ptest
+++ b/meta/recipes-devtools/tcltk/tcl/run-ptest
@@ -16,8 +16,9 @@ SKIP=3D"$SKIP exit-1.\*"
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
--=20
2.43.0


