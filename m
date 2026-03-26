Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE68D10A88F9
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 17:55:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.54763.1774547699600760592
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 10:54:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=N3mHQUvx;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2C2391AED
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 10:54:53 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BABD13F641
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 10:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774547699; bh=+9IaRxshQ2dkKJlsHJwhByq9xn/OL0VLRtpga0yS2to=;
	h=From:To:Subject:Date:From;
	b=N3mHQUvxG2G7zMFfYS/G9PRi5AAGyldqm75uUAUzhIW5xQ8Up2GpStcHfVN3pQwfx
	 7KPcYSU17lHSsI53HDIO53Jlwr3MU0RNzEwR4MAf0BCXnrL9JrLnIaEM4TQtthJfpE
	 DM93hUart1pgoOJMHCzYCkYoWfMhxhWxhaO1ZQ84=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] tcl: skip the mutex-condition-* tests as they're load sensitive
Date: Thu, 26 Mar 2026 17:54:57 +0000
Message-ID: <20260326175457.2194709-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 17:55:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234034

These tests appear to be load-sensitive, so skip them in the ptests.

[ YOCTO #16214 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/tcltk/tcl/run-ptest | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/tcltk/tcl/run-ptest b/meta/recipes-dev=
tools/tcltk/tcl/run-ptest
index 86b74a4177d..46f6cdca333 100644
--- a/meta/recipes-devtools/tcltk/tcl/run-ptest
+++ b/meta/recipes-devtools/tcltk/tcl/run-ptest
@@ -32,6 +32,8 @@ SKIP=3D"$SKIP socket-\* socket_inet\* socket_inet6\*"
 SKIP=3D"$SKIP http11-\*"
 # tries to access google.com
 SKIP=3D"$SKIP httpProxy-\*"
+# These tests appear to be load-sensitive (16214)
+SKIP=3D"$SKIP mutex-condition-\*"
=20
 # Run all tests in tests/*.test unless tests are specified as arguments
 TESTS=3D${*:-tests/*.test}
--=20
2.43.0


