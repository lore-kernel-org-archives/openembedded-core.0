Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A68CC9830D
	for <webhook@archiver.kernel.org>; Fri, 25 Sep 2026 10:53:44 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5141.1790333617362841695
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Sep 2026 03:53:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=duaiJNX8;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A63A169C
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2026 03:53:33 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8AFF83F86F
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2026 03:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790333616; bh=XHcIQnKEhYC+W9auDZJ545M+AlLR+tfoP6vb9ZSlsn0=;
	h=From:To:Subject:Date:From;
	b=duaiJNX8bxVA9+CUMK3fJ6P4m6QvHNkCulcxF82Sn9wmNkRo8ODiHCDr5qyYS5Uym
	 bMRrX7n8mno9ii1QbpwdeHgqHJNvMduHgxCnaWRyOOOx9spbCKkngyQLZxym398lCJ
	 XAZ3GnrhtnhzaC970J0AASWy/4CE/EnfLXPlJ4/g=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] gstreamer: skip test_queue:test_leaky_downstream test as it's flakey
Date: Fri, 25 Sep 2026 11:53:33 +0100
Message-ID: <20260925105333.1817812-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2026 10:53:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246614

This test occasionally fails, so skip it.  A bug has been filed upstream.

[ YOCTO #15408 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest b/m=
eta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest
index 83a78fabd0f..d425eed825d 100755
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest
@@ -27,4 +27,7 @@ GST_CHECKS_IGNORE=3D"$GST_CHECKS_IGNORE,parser_convert_=
duration,parser_pull_frame_
 # https://gitlab.freedesktop.org/gstreamer/gstreamer/-/work_items/5163
 GST_CHECKS_IGNORE=3D"$GST_CHECKS_IGNORE,test_device_monitor"
=20
+# https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15408
+GST_CHECKS_IGNORE=3D"$GST_CHECKS_IGNORE,test_leaky_downstream"
+
 gnome-desktop-testing-runner --parallel=3D4 gstreamer "$@"
--=20
2.43.0


