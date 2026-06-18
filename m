Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10FF9CD98F8
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 16:52:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24046.1781801537862029678
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2026 09:52:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=nFTc/6cK;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8A8AD4746
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 09:52:12 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BBE7E3F632
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 09:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781801537; bh=2mRPzCkS3Hw1QlxIE6j0aH8YcMaqRCYHCZWJAy738NA=;
	h=From:To:Subject:Date:From;
	b=nFTc/6cKYybc7EiKikU8Wlaz4ybYycraEdG09iOYLzXSuAo2Aw1aS0uvLjxpmoBEc
	 AjoeaV6PkYjCerGTdhjaUhE1s5DitCkf48WjxanLavVhUgDvGC6mfS+AA05NFbgXMF
	 f9iit8ir3+h4AwqAd0kmAwxN8FoEVlhGLQESLx8Q=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] tcl: disable the timer tests in run-ptest
Date: Thu, 18 Jun 2026 17:52:12 +0100
Message-ID: <20260618165212.2297400-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 16:52:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239096

We've seen the timer tests fail on the autobuilder, presumably because
any tests that are exercising the timers will be unstable on a loaded
system.

[ YOCTO #16324 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/tcltk/tcl/run-ptest   | 2 ++
 meta/recipes-devtools/tcltk8/tcl8/run-ptest | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/tcltk/tcl/run-ptest b/meta/recipes-dev=
tools/tcltk/tcl/run-ptest
index 46f6cdca333..c01a7a1da28 100644
--- a/meta/recipes-devtools/tcltk/tcl/run-ptest
+++ b/meta/recipes-devtools/tcltk/tcl/run-ptest
@@ -34,6 +34,8 @@ SKIP=3D"$SKIP http11-\*"
 SKIP=3D"$SKIP httpProxy-\*"
 # These tests appear to be load-sensitive (16214)
 SKIP=3D"$SKIP mutex-condition-\*"
+# Timer-related tests are going to be fragile (16324)
+SKIP=3D"$SKIP timer-\*"
=20
 # Run all tests in tests/*.test unless tests are specified as arguments
 TESTS=3D${*:-tests/*.test}
diff --git a/meta/recipes-devtools/tcltk8/tcl8/run-ptest b/meta/recipes-d=
evtools/tcltk8/tcl8/run-ptest
index 86b74a4177d..f4d0e90c0f0 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/run-ptest
+++ b/meta/recipes-devtools/tcltk8/tcl8/run-ptest
@@ -32,6 +32,8 @@ SKIP=3D"$SKIP socket-\* socket_inet\* socket_inet6\*"
 SKIP=3D"$SKIP http11-\*"
 # tries to access google.com
 SKIP=3D"$SKIP httpProxy-\*"
+# Timer-related tests are going to be fragile (16324)
+SKIP=3D"$SKIP timer-\*"
=20
 # Run all tests in tests/*.test unless tests are specified as arguments
 TESTS=3D${*:-tests/*.test}
--=20
2.43.0


