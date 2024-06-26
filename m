Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C82EC3064D
	for <webhook@archiver.kernel.org>; Wed, 26 Jun 2024 16:35:12 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.32191.1719419705680289456
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jun 2024 09:35:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B7DEB339
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Jun 2024 09:35:29 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 898003F73B
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Jun 2024 09:35:04 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gstreamer1.0: disable flaky baseparser tests
Date: Wed, 26 Jun 2024 17:35:02 +0100
Message-Id: <20240626163502.2169017-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jun 2024 16:35:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201175

There are three baseparser tests which are causing trouble on the AB,
so disable them as we've filed an upstream bug.

Also fix a typo when we were attempting to disable parser_pull_short_read
where a colon was used instead of a comma.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest b/m=
eta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest
index ab2df80dcc2..7fee5a3d09c 100755
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest
@@ -16,6 +16,11 @@ GST_CHECKS_IGNORE=3D"$GST_CHECKS_IGNORE,test_functioni=
ng"
 GST_CHECKS_IGNORE=3D"$GST_CHECKS_IGNORE,test_infinite_seek_50_src_live"
=20
 # Known unreliable tests as per subprojects/gst-devtools/validate/launch=
er/testsuites/check.py:
-GST_CHECKS_IGNORE=3D"$GST_CHECKS_IGNORE:parser_pull_short_read"
+GST_CHECKS_IGNORE=3D"$GST_CHECKS_IGNORE,parser_pull_short_read"
+
+# These tests are fragile
+# https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14884
+# https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3524
+GST_CHECKS_IGNORE=3D"$GST_CHECKS_IGNORE,parser_convert_duration,parser_p=
ull_frame_growth,parser_reverse_playback"
=20
 gnome-desktop-testing-runner gstreamer
--=20
2.34.1


