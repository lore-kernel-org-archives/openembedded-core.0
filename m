Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68A95C10F1A
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 13:51:56 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.12259.1715089911235288687
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 May 2024 06:51:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BCA5E106F
	for <openembedded-core@lists.openembedded.org>; Tue,  7 May 2024 06:52:16 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 76E323F6A8
	for <openembedded-core@lists.openembedded.org>; Tue,  7 May 2024 06:51:50 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] gstreamer1.0: skip another known flaky test
Date: Tue,  7 May 2024 13:51:48 +0000
Message-Id: <20240507135148.2783699-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240507135148.2783699-1-ross.burton@arm.com>
References: <20240507135148.2783699-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 13:51:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199096

The baseparse:parser_pull_short_read test is known to be unreliable,
according to the list of known bad tests in gst-devtools.

Also clean up an incorrect comment.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest b/m=
eta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest
index 7d0312005f4..ab2df80dcc2 100755
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest
@@ -1,11 +1,13 @@
 #! /bin/sh
=20
-# Multiply all timeouts by ten so they're more likely to work
-# on a loaded system.
+# Multiply all timeouts by five so they're more likely to work
+# on a loaded system. The default timeout is 20s so this makes it
+# one minute.
 export CK_TIMEOUT_MULTIPLIER=3D5
=20
 # Skip some tests that we know are problematic
 export GST_CHECKS_IGNORE=3D""
+
 # gstnetclientclock.c:test_functioning is very sensitive to load
 GST_CHECKS_IGNORE=3D"$GST_CHECKS_IGNORE,test_functioning"
=20
@@ -13,4 +15,7 @@ GST_CHECKS_IGNORE=3D"$GST_CHECKS_IGNORE,test_functionin=
g"
 # https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/410
 GST_CHECKS_IGNORE=3D"$GST_CHECKS_IGNORE,test_infinite_seek_50_src_live"
=20
+# Known unreliable tests as per subprojects/gst-devtools/validate/launch=
er/testsuites/check.py:
+GST_CHECKS_IGNORE=3D"$GST_CHECKS_IGNORE:parser_pull_short_read"
+
 gnome-desktop-testing-runner gstreamer
--=20
2.34.1


