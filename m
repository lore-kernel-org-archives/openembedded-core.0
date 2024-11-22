Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF84EE69188
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 18:28:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.31798.1732300100233079751
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Nov 2024 10:28:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A30C31477
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 10:28:49 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 547CE3F5A1
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 10:28:19 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gstreamer1.0: run ptests in parallel
Date: Fri, 22 Nov 2024 18:28:15 +0000
Message-Id: <20241122182815.2357334-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 18:28:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207644

Run the ptests in four parallel jobs (reduces runtime from ~80s to ~20s
on my machine), and also pass any arguments in the scripts to make it
easier to run individual tests.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...004-tests-add-helper-script-to-run-the-installed_tests.patch | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-ad=
d-helper-script-to-run-the-installed_tests.patch b/meta/recipes-multimedi=
a/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installe=
d_tests.patch
index 629b0563f6b..cd795fe0ec8 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helpe=
r-script-to-run-the-installed_tests.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helpe=
r-script-to-run-the-installed_tests.patch
@@ -59,7 +59,7 @@ index 0000000..cf7d31b
 +GST_PLUGIN_LOADING_WHITELIST=3D"@GST_PLUGIN_LOADING_WHITELIST@"
 +GST_REGISTRY=3D@GST_REGISTRY@
 +GST_STATE_IGNORE_ELEMENTS=3D"@GST_STATE_IGNORE_ELEMENTS@"
-+exec @TEST@
++exec @TEST@ "$@"
 diff --git a/tests/check/template.test.in b/tests/check/template.test.in
 index f701627..b74ef6a 100644
 --- a/tests/check/template.test.in
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest b/m=
eta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest
index 7fee5a3d09c..44dc350eb3b 100755
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest
@@ -23,4 +23,4 @@ GST_CHECKS_IGNORE=3D"$GST_CHECKS_IGNORE,parser_pull_sho=
rt_read"
 # https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3524
 GST_CHECKS_IGNORE=3D"$GST_CHECKS_IGNORE,parser_convert_duration,parser_p=
ull_frame_growth,parser_reverse_playback"
=20
-gnome-desktop-testing-runner gstreamer
+gnome-desktop-testing-runner --parallel=3D4 gstreamer "$@"
--=20
2.34.1


