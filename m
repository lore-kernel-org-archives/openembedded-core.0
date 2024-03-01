Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB372C54EDF
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 22:05:20 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.36632.1709330716812796276
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Mar 2024 14:05:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=VguE+rB8;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Nq61lDDr;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018dfc0cd4d4-e1f1a974-5da3-4469-96f2-ecf49ff72c58-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1709330716;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Udpw6UXemLjKMa1ErHmhMvqJNX9rLpOOMFOZxEPdtx4=;
	b=VguE+rB8FsMfHGVWHh2Kkic4RAHzHY+tMS516zHXuzmRn+SIHOVZRvN1h1enl68G
	1Zj7KznWulrBkLOdBxI9qcLm+NrOFKBn/ivCxvmsgwsno1jTho9IdURYVLc9LBG+J8u
	7riEMy7AptphF6ArbgWi4IZcGIaXVCiPwY11B8k0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1709330716;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Udpw6UXemLjKMa1ErHmhMvqJNX9rLpOOMFOZxEPdtx4=;
	b=Nq61lDDrl9X1/pdbnwbKEfsJQdSOtweyC6DFqLPb//H5OZoAF1CrDkXabQuZlBx9
	R57YeL3c1ueEA01K5E5dmFY/yYJR6Wf+B2XXIP9y9apaM4hbGDN8Gmd/2Iheq2ERZj2
	OkNpBuIFLlTrGh/2ICLxjqf8IJitunkktmLF7KQw=
Content-Type: multipart/mixed; boundary="===============1489399965254558330=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dnf: upgrading to 4.19.0 SUCCEEDED
Message-ID: <0101018dfc0cd4d4-e1f1a974-5da3-4469-96f2-ecf49ff72c58-000000@us-west-2.amazonses.com>
Date: Fri, 1 Mar 2024 22:05:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Mar 2024 22:05:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196489

--===============1489399965254558330==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *dnf* to *4.19.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dnf-upgrade-4.18.2-4.19.0.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From c71da3db89d86253243775cb28b922eee600e00a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Mar 2024 11:39:58 +0000
Subject: [PATCH] dnf: upgrade 4.18.2 -> 4.19.0

---
 ...1-Corretly-install-tmpfiles.d-configuration.patch |  8 ++------
 ...t-hardcode-etc-and-systemd-unit-directories.patch |  5 ++---
 .../dnf/0001-dnf-write-the-log-lock-to-root.patch    |  3 +--
 .../0001-set-python-path-for-completion_helper.patch |  7 ++-----
 .../0005-Do-not-prepend-installroot-to-logdir.patch  |  9 +++------
 ...ot-set-PYTHON_INSTALL_DIR-by-running-python.patch |  3 +--
 .../dnf/dnf/0030-Run-python-scripts-using-env.patch  | 12 ++++--------
 .../dnf/{dnf_4.18.2.bb => dnf_4.19.0.bb}             |  2 +-
 8 files changed, 16 insertions(+), 33 deletions(-)
 rename meta/recipes-devtools/dnf/{dnf_4.18.2.bb => dnf_4.19.0.bb} (98%)

diff --git a/meta/recipes-devtools/dnf/dnf/0001-Corretly-install-tmpfiles.d-configuration.patch b/meta/recipes-devtools/dnf/dnf/0001-Corretly-install-tmpfiles.d-configuration.patch
index 6692b41a16..fd942228b9 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-Corretly-install-tmpfiles.d-configuration.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-Corretly-install-tmpfiles.d-configuration.patch
@@ -1,11 +1,10 @@
-From 05e059cd4e9910c00b32d377f4f98e3c8dde6bc6 Mon Sep 17 00:00:00 2001
+From f70eb308c837f2c944e23bb680a501a605004d65 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 26 Jan 2017 16:36:20 +0200
-Subject: [PATCH 4/5] Corretly install tmpfiles.d configuration
+Subject: [PATCH] Corretly install tmpfiles.d configuration
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  etc/tmpfiles.d/CMakeLists.txt | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -17,6 +16,3 @@ index f69c773e..3eb6d0e8 100644
 @@ -1 +1 @@
 -INSTALL (FILES dnf.conf DESTINATION /usr/lib/tmpfiles.d/)
 +INSTALL (FILES dnf.conf DESTINATION ${SYSCONFDIR}/tmpfiles.d/)
--- 
-2.14.2
-
diff --git a/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch b/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
index cb09f17a56..37359a5765 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
@@ -1,17 +1,16 @@
-From ffb7942cc73c3d2c6aa7c689cdaf9bc0bcbc144b Mon Sep 17 00:00:00 2001
+From 3ca6d14fbc6419ff6239b4ba16f77da20fb31d03 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 26 Jan 2017 16:25:47 +0200
 Subject: [PATCH] Do not hardcode /etc and systemd unit directories
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  CMakeLists.txt | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 73552967..38cf4fbf 100644
+index 4aee99fb..9e2e9e9e 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -3,8 +3,8 @@ CMAKE_MINIMUM_REQUIRED (VERSION 2.4)
diff --git a/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch b/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch
index eb0309d81a..18f9a30949 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch
@@ -1,4 +1,4 @@
-From 3bd0faf58cc9ad531e6b63d5660c4b8316e8daed Mon Sep 17 00:00:00 2001
+From 049e2832284ab883e185d9020c881518a68e6c38 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 28 Apr 2020 15:55:00 +0200
 Subject: [PATCH] dnf: write the log lock to root
@@ -10,7 +10,6 @@ already existing, and base-files creating it as a symlink).
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  dnf/logging.py | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-devtools/dnf/dnf/0001-set-python-path-for-completion_helper.patch b/meta/recipes-devtools/dnf/dnf/0001-set-python-path-for-completion_helper.patch
index 448f6408bc..fcd970a7ae 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-set-python-path-for-completion_helper.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-set-python-path-for-completion_helper.patch
@@ -1,4 +1,4 @@
-From 7e79b3b67fd5cecd7380e7e365fd88eca63b5bfa Mon Sep 17 00:00:00 2001
+From fa32c7dcabaa3c00d3620a3266e49629365c0cbe Mon Sep 17 00:00:00 2001
 From: Jeremy Puhlman <jpuhlman@mvista.com>
 Date: Wed, 11 Mar 2020 22:10:02 +0000
 Subject: [PATCH] set python path for completion_helper
@@ -10,7 +10,7 @@ Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/dnf/cli/completion_helper.py.in b/dnf/cli/completion_helper.py.in
-index 351226759..2835cd3b6 100644
+index 0da0f2a2..9330d15b 100644
 --- a/dnf/cli/completion_helper.py.in
 +++ b/dnf/cli/completion_helper.py.in
 @@ -1,4 +1,4 @@
@@ -19,6 +19,3 @@ index 351226759..2835cd3b6 100644
  #
  # This file is part of dnf.
  #
--- 
-2.23.0
-
diff --git a/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch b/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch
index 0e11c2eac2..cfbda11f77 100644
--- a/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch
+++ b/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch
@@ -1,7 +1,7 @@
-From 6365389074a1b86962f3d8b22a2ead2202026a98 Mon Sep 17 00:00:00 2001
+From c6d03b51e2098fc681e6811790bd5dc6597091eb Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 11 Jan 2017 15:10:13 +0200
-Subject: [PATCH 5/5] Do not prepend installroot to logdir.
+Subject: [PATCH] Do not prepend installroot to logdir.
 
 This would otherwise write the logs into rootfs/var/log
 (whereas we want them in $T),
@@ -14,7 +14,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/dnf/cli/cli.py b/dnf/cli/cli.py
-index d2d9c082..82270ecf 100644
+index 1824bd00..4dcb1c1c 100644
 --- a/dnf/cli/cli.py
 +++ b/dnf/cli/cli.py
 @@ -944,7 +944,7 @@ class Cli(object):
@@ -26,6 +26,3 @@ index d2d9c082..82270ecf 100644
              conf.prepend_installroot(opt)
  
          self.base._logging._setup_from_dnf_conf(conf)
--- 
-2.14.2
-
diff --git a/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch b/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
index 5cffc9dce1..64ea7874d3 100644
--- a/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
+++ b/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
@@ -1,11 +1,10 @@
-From ceb1043c4f3de095e36908232320b74a4128a94e Mon Sep 17 00:00:00 2001
+From d5b154ea69afdcd862299a0b7f255f6ece3686c6 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:29:07 +0200
 Subject: [PATCH] Do not set PYTHON_INSTALL_DIR by running python
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  CMakeLists.txt | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch b/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch
index eedbb5723f..eb46113f3a 100644
--- a/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch
+++ b/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch
@@ -1,20 +1,19 @@
-From 8d97b72a1d77149e2f9048d1ca6cef66da1a8aa5 Mon Sep 17 00:00:00 2001
+From d3556767b84f3687743fdad0a88af0739d736ea9 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:29:37 +0200
-Subject: [PATCH 2/5] Run python scripts using env
+Subject: [PATCH] Run python scripts using env
 
 Otherwise the build tools hardcode the python path into them.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  bin/dnf-automatic.in | 2 +-
  bin/dnf.in           | 2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/bin/dnf-automatic.in b/bin/dnf-automatic.in
-index 5b06aa26..891b4c24 100755
+index 17e35a05..28827e38 100755
 --- a/bin/dnf-automatic.in
 +++ b/bin/dnf-automatic.in
 @@ -1,4 +1,4 @@
@@ -24,7 +23,7 @@ index 5b06aa26..891b4c24 100755
  #
  # Copyright (C) 2014-2016 Red Hat, Inc.
 diff --git a/bin/dnf.in b/bin/dnf.in
-index 645d0f06..bdf7b3c4 100755
+index 55ceb3f2..e38973c7 100755
 --- a/bin/dnf.in
 +++ b/bin/dnf.in
 @@ -1,4 +1,4 @@
@@ -33,6 +32,3 @@ index 645d0f06..bdf7b3c4 100755
  # The dnf executable script.
  #
  # Copyright (C) 2012-2016 Red Hat, Inc.
--- 
-2.14.2
-
diff --git a/meta/recipes-devtools/dnf/dnf_4.18.2.bb b/meta/recipes-devtools/dnf/dnf_4.19.0.bb
similarity index 98%
rename from meta/recipes-devtools/dnf/dnf_4.18.2.bb
rename to meta/recipes-devtools/dnf/dnf_4.19.0.bb
index dc0c18be5e..784d7a94b3 100644
--- a/meta/recipes-devtools/dnf/dnf_4.18.2.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.19.0.bb
@@ -19,7 +19,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git;branch=master;protoc
 
 SRC_URI:append:class-native = "file://0001-dnf-write-the-log-lock-to-root.patch"
 
-SRCREV = "1c43d0999178d492381ad0b43917ffd9c74016f8"
+SRCREV = "566a61f9d8a2830ac6dcc3a94c59224cef1c3d03"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.42.0


--===============1489399965254558330==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/dnf/dnf-bash-completion: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-bash-completion: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-dbg: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-dbg: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-dev: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-dev: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-doc: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-doc: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ar: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ar: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-be: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-be: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-bg: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-bg: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-bn-in: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-bn-in: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-bn: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-bn: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ca: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ca: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-cs: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-cs: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-da: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-da: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-de: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-de: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-el: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-el: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-en-gb: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-en-gb: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-eo: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-eo: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-es: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-es: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-eu: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-eu: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-fa: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-fa: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-fi: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-fi: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-fil: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-fil: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-fr: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-fr: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-fur: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-fur: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-gd: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-gd: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-gu: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-gu: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-he: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-he: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-hi: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-hi: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-hr: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-hr: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-hu: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-hu: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-id: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-id: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ie: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ie: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-it: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-it: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ja: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ja: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ka: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ka: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-kk: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-kk: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ko: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ko: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-lt: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-lt: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ml: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ml: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-mr: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-mr: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ms: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ms: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-nb: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-nb: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-nl: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-nl: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-om: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-om: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-or: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-or: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-pa: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-pa: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-pl: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-pl: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-pt-br: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-pt-br: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-pt: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-pt: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ru: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ru: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-si: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-si: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-sk: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-sk: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-sl: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-sl: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-sq: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-sq: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-sr+latin: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-sr+latin: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-sr: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-sr: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-sv: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-sv: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-th: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-th: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-tr: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-tr: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-uk: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-uk: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ur: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ur: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-vi: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-vi: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-zh-cn: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-zh-cn: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-zh-hans: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-zh-hans: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-zh-tw: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-zh-tw: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-src: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-src: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-staticdev: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-staticdev: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-test-dep: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-test-dep: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-test-main: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-test-main: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf: PKGSIZE changed from 958861 to 960292 (+0%)
packages/core2-64-poky-linux/dnf/dnf: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf: PV changed from "4.18.2" to "4.19.0"
Changes to packages/core2-64-poky-linux/dnf (sysroot):
  /usr/lib/python3.12/site-packages/dnf-4.18.2.dist-info moved to /usr/lib/python3.12/site-packages/dnf-4.19.0.dist-info

--===============1489399965254558330==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dnf-upgrade-4.18.2-4.19.0.patch"

RnJvbSBjNzFkYTNkYjg5ZDg2MjUzMjQzNzc1Y2IyOGI5MjJlZWU2MDBlMDBhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXIgMjAyNCAxMTozOTo1OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRu
ZjogdXBncmFkZSA0LjE4LjIgLT4gNC4xOS4wCgotLS0KIC4uLjEtQ29ycmV0bHktaW5zdGFsbC10
bXBmaWxlcy5kLWNvbmZpZ3VyYXRpb24ucGF0Y2ggfCAgOCArKy0tLS0tLQogLi4udC1oYXJkY29k
ZS1ldGMtYW5kLXN5c3RlbWQtdW5pdC1kaXJlY3Rvcmllcy5wYXRjaCB8ICA1ICsrLS0tCiAuLi4v
ZG5mLzAwMDEtZG5mLXdyaXRlLXRoZS1sb2ctbG9jay10by1yb290LnBhdGNoICAgIHwgIDMgKy0t
CiAuLi4vMDAwMS1zZXQtcHl0aG9uLXBhdGgtZm9yLWNvbXBsZXRpb25faGVscGVyLnBhdGNoIHwg
IDcgKystLS0tLQogLi4uLzAwMDUtRG8tbm90LXByZXBlbmQtaW5zdGFsbHJvb3QtdG8tbG9nZGly
LnBhdGNoICB8ICA5ICsrKy0tLS0tLQogLi4ub3Qtc2V0LVBZVEhPTl9JTlNUQUxMX0RJUi1ieS1y
dW5uaW5nLXB5dGhvbi5wYXRjaCB8ICAzICstLQogLi4uL2RuZi9kbmYvMDAzMC1SdW4tcHl0aG9u
LXNjcmlwdHMtdXNpbmctZW52LnBhdGNoICB8IDEyICsrKystLS0tLS0tLQogLi4uL2RuZi97ZG5m
XzQuMTguMi5iYiA9PiBkbmZfNC4xOS4wLmJifSAgICAgICAgICAgICB8ICAyICstCiA4IGZpbGVz
IGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDMzIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9kbmYve2RuZl80LjE4LjIuYmIgPT4gZG5mXzQuMTkuMC5iYn0gKDk4
JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDAxLUNvcnJl
dGx5LWluc3RhbGwtdG1wZmlsZXMuZC1jb25maWd1cmF0aW9uLnBhdGNoIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2RuZi9kbmYvMDAwMS1Db3JyZXRseS1pbnN0YWxsLXRtcGZpbGVzLmQtY29uZmln
dXJhdGlvbi5wYXRjaAppbmRleCA2NjkyYjQxYTE2Li5mZDk0MjIyOGI5IDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDAxLUNvcnJldGx5LWluc3RhbGwtdG1wZmls
ZXMuZC1jb25maWd1cmF0aW9uLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYv
ZG5mLzAwMDEtQ29ycmV0bHktaW5zdGFsbC10bXBmaWxlcy5kLWNvbmZpZ3VyYXRpb24ucGF0Y2gK
QEAgLTEsMTEgKzEsMTAgQEAKLUZyb20gMDVlMDU5Y2Q0ZTk5MTBjMDBiMzJkMzc3ZjRmOThlM2M4
ZGRlNmJjNiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZjcwZWIzMDhjODM3ZjJjOTQ0
ZTIzYmI2ODBhNTAxYTYwNTAwNGQ2NSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFs
ZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTogVGh1LCAyNiBK
YW4gMjAxNyAxNjozNjoyMCArMDIwMAotU3ViamVjdDogW1BBVENIIDQvNV0gQ29ycmV0bHkgaW5z
dGFsbCB0bXBmaWxlcy5kIGNvbmZpZ3VyYXRpb24KK1N1YmplY3Q6IFtQQVRDSF0gQ29ycmV0bHkg
aW5zdGFsbCB0bXBmaWxlcy5kIGNvbmZpZ3VyYXRpb24KIAogVXBzdHJlYW0tU3RhdHVzOiBJbmFw
cHJvcHJpYXRlIFtvZS1jb3JlIHNwZWNpZmljXQogU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEth
bmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+Ci0KIC0tLQogIGV0Yy90bXBmaWxlcy5kL0NN
YWtlTGlzdHMudHh0IHwgMiArLQogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQpAQCAtMTcsNiArMTYsMyBAQCBpbmRleCBmNjljNzczZS4uM2ViNmQwZTggMTAw
NjQ0CiBAQCAtMSArMSBAQAogLUlOU1RBTEwgKEZJTEVTIGRuZi5jb25mIERFU1RJTkFUSU9OIC91
c3IvbGliL3RtcGZpbGVzLmQvKQogK0lOU1RBTEwgKEZJTEVTIGRuZi5jb25mIERFU1RJTkFUSU9O
ICR7U1lTQ09ORkRJUn0vdG1wZmlsZXMuZC8pCi0tLSAKLTIuMTQuMgotCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDAxLURvLW5vdC1oYXJkY29kZS1ldGMtYW5k
LXN5c3RlbWQtdW5pdC1kaXJlY3Rvcmllcy5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9k
bmYvZG5mLzAwMDEtRG8tbm90LWhhcmRjb2RlLWV0Yy1hbmQtc3lzdGVtZC11bml0LWRpcmVjdG9y
aWVzLnBhdGNoCmluZGV4IGNiMDlmMTdhNTYuLjM3MzU5YTU3NjUgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMDEtRG8tbm90LWhhcmRjb2RlLWV0Yy1hbmQtc3lz
dGVtZC11bml0LWRpcmVjdG9yaWVzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9k
bmYvZG5mLzAwMDEtRG8tbm90LWhhcmRjb2RlLWV0Yy1hbmQtc3lzdGVtZC11bml0LWRpcmVjdG9y
aWVzLnBhdGNoCkBAIC0xLDE3ICsxLDE2IEBACi1Gcm9tIGZmYjc5NDJjYzczYzNkMmM2YWE3YzY4
OWNkYWY5YmMwYmNiYzE0NGIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDNjYTZkMTRm
YmM2NDE5ZmY2MjM5YjRiYTE2Zjc3ZGEyMGZiMzFkMDMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6
IFRodSwgMjYgSmFuIDIwMTcgMTY6MjU6NDcgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gRG8gbm90
IGhhcmRjb2RlIC9ldGMgYW5kIHN5c3RlbWQgdW5pdCBkaXJlY3RvcmllcwogCiBVcHN0cmVhbS1T
dGF0dXM6IEluYXBwcm9wcmlhdGUgW29lLWNvcmUgc3BlY2lmaWNdCiBTaWduZWQtb2ZmLWJ5OiBB
bGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KLQogLS0tCiAgQ01ha2VM
aXN0cy50eHQgfCA0ICsrLS0KICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvQ01ha2VMaXN0cy50eHQgYi9DTWFrZUxpc3RzLnR4
dAotaW5kZXggNzM1NTI5NjcuLjM4Y2Y0ZmJmIDEwMDY0NAoraW5kZXggNGFlZTk5ZmIuLjllMmU5
ZTllIDEwMDY0NAogLS0tIGEvQ01ha2VMaXN0cy50eHQKICsrKyBiL0NNYWtlTGlzdHMudHh0CiBA
QCAtMyw4ICszLDggQEAgQ01BS0VfTUlOSU1VTV9SRVFVSVJFRCAoVkVSU0lPTiAyLjQpCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDAxLWRuZi13cml0ZS10aGUt
bG9nLWxvY2stdG8tcm9vdC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAw
MDEtZG5mLXdyaXRlLXRoZS1sb2ctbG9jay10by1yb290LnBhdGNoCmluZGV4IGViMDMwOWQ4MWEu
LjE4ZjlhMzA5NDkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAw
MDEtZG5mLXdyaXRlLXRoZS1sb2ctbG9jay10by1yb290LnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9kbmYvZG5mLzAwMDEtZG5mLXdyaXRlLXRoZS1sb2ctbG9jay10by1yb290LnBh
dGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAzYmQwZmFmNThjYzlhZDUzMWU2YjYzZDU2NjBjNGI4
MzE2ZThkYWVkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAwNDllMjgzMjI4NGFiODgz
ZTE4NWQ5MDIwYzg4MTUxOGE2OGU2YzM4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
QWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBUdWUsIDI4
IEFwciAyMDIwIDE1OjU1OjAwICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIGRuZjogd3JpdGUgdGhl
IGxvZyBsb2NrIHRvIHJvb3QKQEAgLTEwLDcgKzEwLDYgQEAgYWxyZWFkeSBleGlzdGluZywgYW5k
IGJhc2UtZmlsZXMgY3JlYXRpbmcgaXQgYXMgYSBzeW1saW5rKS4KIAogVXBzdHJlYW0tU3RhdHVz
OiBJbmFwcHJvcHJpYXRlIFtvZS1jb3JlIHNwZWNpZmljXQogU2lnbmVkLW9mZi1ieTogQWxleGFu
ZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+Ci0KIC0tLQogIGRuZi9sb2dnaW5n
LnB5IHwgMiArLQogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYvMDAwMS1zZXQtcHl0
aG9uLXBhdGgtZm9yLWNvbXBsZXRpb25faGVscGVyLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2RuZi9kbmYvMDAwMS1zZXQtcHl0aG9uLXBhdGgtZm9yLWNvbXBsZXRpb25faGVscGVyLnBh
dGNoCmluZGV4IDQ0OGY2NDA4YmMuLmZjZDk3MGE3YWUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9kbmYvZG5mLzAwMDEtc2V0LXB5dGhvbi1wYXRoLWZvci1jb21wbGV0aW9uX2hl
bHBlci5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDAxLXNldC1w
eXRob24tcGF0aC1mb3ItY29tcGxldGlvbl9oZWxwZXIucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1G
cm9tIDdlNzliM2I2N2ZkNWNlY2Q3MzgwZTdlMzY1ZmQ4OGVjYTYzYjViZmEgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tIGZhMzJjN2RjYWJhYTNjMDBkMzYyMGEzMjY2ZTQ5NjI5MzY1YzBj
YmUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBKZXJlbXkgUHVobG1hbiA8anB1aGxt
YW5AbXZpc3RhLmNvbT4KIERhdGU6IFdlZCwgMTEgTWFyIDIwMjAgMjI6MTA6MDIgKzAwMDAKIFN1
YmplY3Q6IFtQQVRDSF0gc2V0IHB5dGhvbiBwYXRoIGZvciBjb21wbGV0aW9uX2hlbHBlcgpAQCAt
MTAsNyArMTAsNyBAQCBTaWduZWQtb2ZmLWJ5OiBKZXJlbXkgUHVobG1hbiA8anB1aGxtYW5AbXZp
c3RhLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
IAogZGlmZiAtLWdpdCBhL2RuZi9jbGkvY29tcGxldGlvbl9oZWxwZXIucHkuaW4gYi9kbmYvY2xp
L2NvbXBsZXRpb25faGVscGVyLnB5LmluCi1pbmRleCAzNTEyMjY3NTkuLjI4MzVjZDNiNiAxMDA2
NDQKK2luZGV4IDBkYTBmMmEyLi45MzMwZDE1YiAxMDA2NDQKIC0tLSBhL2RuZi9jbGkvY29tcGxl
dGlvbl9oZWxwZXIucHkuaW4KICsrKyBiL2RuZi9jbGkvY29tcGxldGlvbl9oZWxwZXIucHkuaW4K
IEBAIC0xLDQgKzEsNCBAQApAQCAtMTksNiArMTksMyBAQCBpbmRleCAzNTEyMjY3NTkuLjI4MzVj
ZDNiNiAxMDA2NDQKICAjCiAgIyBUaGlzIGZpbGUgaXMgcGFydCBvZiBkbmYuCiAgIwotLS0gCi0y
LjIzLjAKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYvMDAwNS1E
by1ub3QtcHJlcGVuZC1pbnN0YWxscm9vdC10by1sb2dkaXIucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvZG5mL2RuZi8wMDA1LURvLW5vdC1wcmVwZW5kLWluc3RhbGxyb290LXRvLWxvZ2Rp
ci5wYXRjaAppbmRleCAwZTExYzJlYWMyLi5jZmJkYTExZjc3IDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDA1LURvLW5vdC1wcmVwZW5kLWluc3RhbGxyb290LXRv
LWxvZ2Rpci5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDA1LURv
LW5vdC1wcmVwZW5kLWluc3RhbGxyb290LXRvLWxvZ2Rpci5wYXRjaApAQCAtMSw3ICsxLDcgQEAK
LUZyb20gNjM2NTM4OTA3NGExYjg2OTYyZjNkOGIyMmEyZWFkMjIwMjAyNmE5OCBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKK0Zyb20gYzZkMDNiNTFlMjA5OGZjNjgxZTY4MTE3OTBiZDVkYzY1OTcw
OTFlYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxh
bGV4LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTogV2VkLCAxMSBKYW4gMjAxNyAxNToxMDoxMyAr
MDIwMAotU3ViamVjdDogW1BBVENIIDUvNV0gRG8gbm90IHByZXBlbmQgaW5zdGFsbHJvb3QgdG8g
bG9nZGlyLgorU3ViamVjdDogW1BBVENIXSBEbyBub3QgcHJlcGVuZCBpbnN0YWxscm9vdCB0byBs
b2dkaXIuCiAKIFRoaXMgd291bGQgb3RoZXJ3aXNlIHdyaXRlIHRoZSBsb2dzIGludG8gcm9vdGZz
L3Zhci9sb2cKICh3aGVyZWFzIHdlIHdhbnQgdGhlbSBpbiAkVCksCkBAIC0xNCw3ICsxNCw3IEBA
IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29t
PgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZm
IC0tZ2l0IGEvZG5mL2NsaS9jbGkucHkgYi9kbmYvY2xpL2NsaS5weQotaW5kZXggZDJkOWMwODIu
LjgyMjcwZWNmIDEwMDY0NAoraW5kZXggMTgyNGJkMDAuLjRkY2IxYzFjIDEwMDY0NAogLS0tIGEv
ZG5mL2NsaS9jbGkucHkKICsrKyBiL2RuZi9jbGkvY2xpLnB5CiBAQCAtOTQ0LDcgKzk0NCw3IEBA
IGNsYXNzIENsaShvYmplY3QpOgpAQCAtMjYsNiArMjYsMyBAQCBpbmRleCBkMmQ5YzA4Mi4uODIy
NzBlY2YgMTAwNjQ0CiAgICAgICAgICAgICAgY29uZi5wcmVwZW5kX2luc3RhbGxyb290KG9wdCkK
ICAKICAgICAgICAgIHNlbGYuYmFzZS5fbG9nZ2luZy5fc2V0dXBfZnJvbV9kbmZfY29uZihjb25m
KQotLS0gCi0yLjE0LjIKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9k
bmYvMDAyOS1Eby1ub3Qtc2V0LVBZVEhPTl9JTlNUQUxMX0RJUi1ieS1ydW5uaW5nLXB5dGhvbi5w
YXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMjktRG8tbm90LXNldC1QWVRI
T05fSU5TVEFMTF9ESVItYnktcnVubmluZy1weXRob24ucGF0Y2gKaW5kZXggNWNmZmM5ZGNlMS4u
NjRlYTc4NzRkMyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYvMDAy
OS1Eby1ub3Qtc2V0LVBZVEhPTl9JTlNUQUxMX0RJUi1ieS1ydW5uaW5nLXB5dGhvbi5wYXRjaAor
KysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDI5LURvLW5vdC1zZXQtUFlUSE9O
X0lOU1RBTExfRElSLWJ5LXJ1bm5pbmctcHl0aG9uLnBhdGNoCkBAIC0xLDExICsxLDEwIEBACi1G
cm9tIGNlYjEwNDNjNGYzZGUwOTVlMzY5MDgyMzIzMjBiNzRhNDEyOGE5NGUgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tIGQ1YjE1NGVhNjlhZmRjZDg2MjI5OWEwYjdmMjU1ZjZlY2UzNjg2
YzYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxl
eC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IEZyaSwgMzAgRGVjIDIwMTYgMTg6Mjk6MDcgKzAy
MDAKIFN1YmplY3Q6IFtQQVRDSF0gRG8gbm90IHNldCBQWVRIT05fSU5TVEFMTF9ESVIgYnkgcnVu
bmluZyBweXRob24KIAogVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFtvZS1jb3JlIHNw
ZWNpZmljXQogU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBn
bWFpbC5jb20+Ci0KIC0tLQogIENNYWtlTGlzdHMudHh0IHwgMiArLQogIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2RuZi9kbmYvMDAzMC1SdW4tcHl0aG9uLXNjcmlwdHMtdXNpbmctZW52LnBhdGNo
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYvMDAzMC1SdW4tcHl0aG9uLXNjcmlwdHMt
dXNpbmctZW52LnBhdGNoCmluZGV4IGVlZGJiNTcyM2YuLmViNDYxMTNmM2EgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMzAtUnVuLXB5dGhvbi1zY3JpcHRzLXVz
aW5nLWVudi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDMwLVJ1
bi1weXRob24tc2NyaXB0cy11c2luZy1lbnYucGF0Y2gKQEAgLTEsMjAgKzEsMTkgQEAKLUZyb20g
OGQ5N2I3MmExZDc3MTQ5ZTJmOTA0OGQxY2E2Y2VmNjZkYTFhOGFhNSBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKK0Zyb20gZDM1NTY3NjdiODRmMzY4Nzc0M2ZkYWQwYTg4YWYwNzM5ZDczNmVhOSBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4Lmth
bmF2aW5AZ21haWwuY29tPgogRGF0ZTogRnJpLCAzMCBEZWMgMjAxNiAxODoyOTozNyArMDIwMAot
U3ViamVjdDogW1BBVENIIDIvNV0gUnVuIHB5dGhvbiBzY3JpcHRzIHVzaW5nIGVudgorU3ViamVj
dDogW1BBVENIXSBSdW4gcHl0aG9uIHNjcmlwdHMgdXNpbmcgZW52CiAKIE90aGVyd2lzZSB0aGUg
YnVpbGQgdG9vbHMgaGFyZGNvZGUgdGhlIHB5dGhvbiBwYXRoIGludG8gdGhlbS4KIAogVXBzdHJl
YW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFtvZS1jb3JlIHNwZWNpZmljXQogU2lnbmVkLW9mZi1i
eTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+Ci0KIC0tLQogIGJp
bi9kbmYtYXV0b21hdGljLmluIHwgMiArLQogIGJpbi9kbmYuaW4gICAgICAgICAgIHwgMiArLQog
IDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogCiBkaWZm
IC0tZ2l0IGEvYmluL2RuZi1hdXRvbWF0aWMuaW4gYi9iaW4vZG5mLWF1dG9tYXRpYy5pbgotaW5k
ZXggNWIwNmFhMjYuLjg5MWI0YzI0IDEwMDc1NQoraW5kZXggMTdlMzVhMDUuLjI4ODI3ZTM4IDEw
MDc1NQogLS0tIGEvYmluL2RuZi1hdXRvbWF0aWMuaW4KICsrKyBiL2Jpbi9kbmYtYXV0b21hdGlj
LmluCiBAQCAtMSw0ICsxLDQgQEAKQEAgLTI0LDcgKzIzLDcgQEAgaW5kZXggNWIwNmFhMjYuLjg5
MWI0YzI0IDEwMDc1NQogICMKICAjIENvcHlyaWdodCAoQykgMjAxNC0yMDE2IFJlZCBIYXQsIElu
Yy4KIGRpZmYgLS1naXQgYS9iaW4vZG5mLmluIGIvYmluL2RuZi5pbgotaW5kZXggNjQ1ZDBmMDYu
LmJkZjdiM2M0IDEwMDc1NQoraW5kZXggNTVjZWIzZjIuLmUzODk3M2M3IDEwMDc1NQogLS0tIGEv
YmluL2RuZi5pbgogKysrIGIvYmluL2RuZi5pbgogQEAgLTEsNCArMSw0IEBACkBAIC0zMyw2ICsz
MiwzIEBAIGluZGV4IDY0NWQwZjA2Li5iZGY3YjNjNCAxMDA3NTUKICAjIFRoZSBkbmYgZXhlY3V0
YWJsZSBzY3JpcHQuCiAgIwogICMgQ29weXJpZ2h0IChDKSAyMDEyLTIwMTYgUmVkIEhhdCwgSW5j
LgotLS0gCi0yLjE0LjIKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9k
bmZfNC4xOC4yLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmZfNC4xOS4wLmJiCnNp
bWlsYXJpdHkgaW5kZXggOTglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYv
ZG5mXzQuMTguMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmZfNC4x
OS4wLmJiCmluZGV4IGRjMGMxOGJlNWUuLjc4NGQ3YTk0YjMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9kbmYvZG5mXzQuMTguMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvZG5mL2RuZl80LjE5LjAuYmIKQEAgLTE5LDcgKzE5LDcgQEAgU1JDX1VSSSA9ICJnaXQ6Ly9n
aXRodWIuY29tL3JwbS1zb2Z0d2FyZS1tYW5hZ2VtZW50L2RuZi5naXQ7YnJhbmNoPW1hc3Rlcjtw
cm90b2MKIAogU1JDX1VSSTphcHBlbmQ6Y2xhc3MtbmF0aXZlID0gImZpbGU6Ly8wMDAxLWRuZi13
cml0ZS10aGUtbG9nLWxvY2stdG8tcm9vdC5wYXRjaCIKIAotU1JDUkVWID0gIjFjNDNkMDk5OTE3
OGQ0OTIzODFhZDBiNDM5MTdmZmQ5Yzc0MDE2ZjgiCitTUkNSRVYgPSAiNTY2YTYxZjlkOGEyODMw
YWM2ZGNjM2E5NGM1OTIyNGNlZjFjM2QwMyIKIFVQU1RSRUFNX0NIRUNLX0dJVFRBR1JFR0VYID0g
Iig/UDxwdmVyPlxkKyhcLlxkKykrKSIKIAogUyA9ICIke1dPUktESVJ9L2dpdCIKLS0gCjIuNDIu
MAoK

--===============1489399965254558330==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 916 .bb files complete (0 cached, 916 parsed). 1864 targets, 46 skipped, 0 masked, 0 errors.
Removing 71 recipes from the core2-64 sysroot...done.
Removing 85 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-c389301840161ea9cbb8a47df25522af814d6b52"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:c389301840161ea9cbb8a47df25522af814d6b52"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 639 Local 581 Mirrors 0 Missed 58 Current 263 (90% match, 93% complete)
Removing 5 stale sstate objects for arch x86_64...done.
Removing 2 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 276 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.19.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 277 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libcomps/libcomps_0.1.20.bb:do_create_spdx_setscene)
NOTE: Running setscene task 278 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libcomps/libcomps_0.1.20.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 279 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libcomps/libcomps_0.1.20.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 280 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libcomps/libcomps_0.1.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 281 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libcomps/libcomps_0.1.20.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 283 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.17.bb:do_create_spdx_setscene)
NOTE: Running setscene task 290 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.17.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 291 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.72.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 296 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 304 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.16.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 306 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 307 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 308 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 309 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 310 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libcomps-0.1.20-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcomps-0.1.20-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe libcomps-0.1.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcomps-0.1.20-r0: task do_package_write_deb_setscene: Started
NOTE: recipe dnf-4.19.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcomps-0.1.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-c-0.17-r0: task do_create_spdx_setscene: Started
NOTE: recipe json-c-0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe librepo-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe libmodulemd-2.15.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdnf-0.72.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dnf-4.19.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 311 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.2.bb:do_package_write_deb_setscene)
NOTE: recipe json-c-0.17-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 312 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.17.bb:do_packagedata_setscene)
NOTE: recipe python3-iniparse-0.5-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 313 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.2.bb:do_package_write_ipk_setscene)
NOTE: recipe libmodulemd-2.15.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe librepo-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcomps-0.1.20-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 314 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 315 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_create_spdx_setscene)
NOTE: recipe python3-iniparse-0.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 316 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.16.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 317 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 324 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 325 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_packagedata_setscene)
NOTE: recipe libcomps-0.1.20-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libdnf-0.72.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 326 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.72.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 327 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_packagedata_setscene)
NOTE: recipe libcomps-0.1.20-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 332 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_create_spdx_setscene)
NOTE: recipe libcomps-0.1.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcomps-0.1.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 333 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_create_spdx_setscene)
NOTE: Running setscene task 334 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_create_spdx_setscene)
NOTE: recipe json-c-0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 335 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libcomps/libcomps_0.1.20.bb:do_packagedata_setscene)
NOTE: recipe python3-iniparse-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe json-c-0.17-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 336 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/lua/lua_5.4.6.bb:do_create_spdx_setscene)
NOTE: recipe libmodulemd-2.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe librepo-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe debugedit-5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.38.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libdnf-0.72.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.12.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.12.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.12.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe librepo-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmodulemd-2.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 337 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_create_spdx_setscene)
NOTE: recipe libcomps-0.1.20-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 344 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/lua/lua_5.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe debugedit-5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 345 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libdnf-0.72.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 346 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe json-c-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 349 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.17.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 350 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libsolv/libsolv_0.7.28.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-iniparse-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 353 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 354 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 355 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.11.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 358 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb:do_create_spdx_setscene)
NOTE: recipe libarchive-3.7.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe lua-5.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe debugedit-5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lua-5.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe rpm-1_4.19.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 359 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/lua/lua_5.4.6.bb:do_packagedata_setscene)
NOTE: recipe libcomps-0.1.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 361 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_packagedata_setscene)
NOTE: recipe libsolv-0.7.28-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe json-c-0.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe debugedit-5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 362 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libarchive-3.7.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 364 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libcomps/libcomps_0.1.20.bb:do_recipe_qa_setscene)
NOTE: recipe rpm-1_4.19.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 365 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.2.bb:do_create_spdx_setscene)
NOTE: recipe json-c-0.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsolv-0.7.28-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 366 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 367 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libsolv/libsolv_0.7.28.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.12.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 371 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 372 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe lua-5.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata_setscene: Started
NOTE: recipe lua-5.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 373 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.12.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 374 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.12.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 376 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 377 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_packagedata_setscene)
NOTE: recipe libcomps-0.1.20-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsolv-0.7.28-r0: task do_recipe_qa_setscene: Started
NOTE: recipe rpm-1_4.19.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 378 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 379 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.12.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe lua-5.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 380 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_create_spdx_setscene)
NOTE: recipe gtk-doc-1.33.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcomps-0.1.20-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 381 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.42.bb:do_packagedata_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/libxml2/2.11.5/temp/log.do_packagedata_setscene.1627535
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 382 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_package_setscene)
NOTE: recipe rpm-1_4.19.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsolv-0.7.28-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe binutils-2.42-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 383 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.0.bb:do_create_spdx_setscene)
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 384 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.39.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 389 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/lua/lua_5.4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 391 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 394 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 395 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 396 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 397 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 398 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 400 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_create_spdx_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 404 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.12.0.bb:do_create_spdx_setscene)
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tzdata-2024a-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 411 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_packagedata_setscene)
NOTE: Running setscene task 412 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe lua-5.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.12.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 413 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.12.0.bb:do_package_write_deb_setscene)
NOTE: recipe lua-5.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 414 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.12.0.bb:do_package_write_ipk_setscene)
NOTE: recipe expat-2.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 415 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.12.0.bb:do_package_write_rpm_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 416 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.189-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe tzdata-2024a-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 419 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 431 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 435 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.4.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 438 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.12.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 439 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gpgme/gpgme_1.23.2.bb:do_create_spdx_setscene)
NOTE: recipe bash-completion-2.12.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe bash-completion-2.12.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.12.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnupg-2.4.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gpgme-1.23.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 443 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gpgme/gpgme_1.23.2.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 446 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb:do_recipe_qa_setscene)
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 447 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.189-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 448 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 449 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_package_setscene)
NOTE: recipe bash-completion-2.12.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 454 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 458 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-completion-2.12.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 460 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 461 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 462 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libksba/libksba_1.6.6.bb:do_create_spdx_setscene)
NOTE: recipe bash-completion-2.12.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe gnupg-2.4.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 463 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_packagedata_setscene)
NOTE: Running setscene task 464 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe gpgme-1.23.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 465 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gpgme/gpgme_1.23.2.bb:do_packagedata_setscene)
NOTE: recipe gpgme-1.23.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 466 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libassuan/libassuan_2.5.6.bb:do_create_spdx_setscene)
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_package_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libksba-1.6.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_package_setscene: Started
NOTE: recipe gnupg-2.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Started
NOTE: recipe gpgme-1.23.2-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 467 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libksba/libksba_1.6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libcheck-0.15.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 468 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_packagedata_setscene)
NOTE: recipe libassuan-2.5.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 470 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_create_spdx_setscene)
NOTE: recipe gnupg-2.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 471 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.6.0.bb:do_create_spdx_setscene)
NOTE: recipe libksba-1.6.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 472 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.3.bb:do_create_spdx_setscene)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 475 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_recipe_qa_setscene)
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 477 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_create_spdx_setscene)
NOTE: recipe gpgme-1.23.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 478 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libksba/libksba_1.6.6.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 479 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe libksba-1.6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.45-r0: task do_create_spdx_setscene: Started
NOTE: recipe gpgme-1.23.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libassuan-2.5.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 482 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gpgme/gpgme_1.23.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 483 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.48.bb:do_create_spdx_setscene)
NOTE: recipe curl-8.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_create_spdx_setscene: Started
NOTE: recipe libksba-1.6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.45-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 485 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_create_spdx_setscene)
NOTE: recipe gnutls-3.8.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 486 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_create_spdx_setscene)
NOTE: recipe gpgme-1.23.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 487 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 493 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.48-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 496 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: recipe libksba-1.6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 497 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.69-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 500 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 504 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: recipe gpgme-1.23.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 505 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_create_spdx_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libksba-1.6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.8.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 508 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libksba/libksba_1.6.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 513 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgpg-error-1.48-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 514 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-3.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 518 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/npth/npth_1.6.bb:do_create_spdx_setscene)
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 519 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/npth/npth_1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libksba-1.6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 520 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/pinentry/pinentry_1.2.1.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 521 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/popt/popt_1.19.bb:do_create_spdx_setscene)
NOTE: Running setscene task 522 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/popt/popt_1.19.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 524 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 525 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_create_spdx_setscene)
NOTE: recipe npth-1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libksba-1.6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 526 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.1.bb:do_create_spdx_setscene)
NOTE: recipe npth-1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 527 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 529 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_recipe_qa_setscene)
NOTE: recipe pinentry-1.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe popt-1.19-r0: task do_create_spdx_setscene: Started
NOTE: recipe popt-1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_packagedata_setscene: Started
NOTE: recipe npth-1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe sqlite3-3_3.45.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe popt-1.19-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 581 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/npth/npth_1.6.bb:do_packagedata_setscene)
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 582 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/popt/popt_1.19.bb:do_packagedata_setscene)
NOTE: recipe npth-1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pinentry-1.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 584 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libassuan/libassuan_2.5.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 585 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libassuan/libassuan_2.5.6.bb:do_populate_sysroot_setscene)
NOTE: recipe popt-1.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 592 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 593 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 597 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 601 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: recipe util-linux-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 604 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 605 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.12.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 606 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.12.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 607 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_packagedata_setscene)
NOTE: recipe npth-1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 608 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libassuan-2.5.6-r0: task do_packagedata_setscene: Started
NOTE: recipe popt-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libassuan-2.5.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.12.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.12.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 609 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe npth-1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 610 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 613 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_recipe_qa_setscene)
NOTE: recipe libassuan-2.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 617 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/npth/npth_1.6.bb:do_recipe_qa_setscene)
NOTE: recipe libassuan-2.5.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 623 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libassuan/libassuan_2.5.6.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.12.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.12.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 627 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.12.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe npth-1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 629 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe popt-1.19-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 632 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/popt/popt_1.19.bb:do_recipe_qa_setscene)
NOTE: recipe elfutils-0.189-r0: task do_package_setscene: Succeeded
NOTE: recipe libassuan-2.5.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 633 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 634 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 635 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 636 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 637 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 638 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 640 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 641 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_packagedata_setscene)
NOTE: recipe npth-1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 642 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.12.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 644 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe libassuan-2.5.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 648 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe popt-1.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.12.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 649 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libarchive-3.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 650 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe popt-1.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 651 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 657 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 659 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 662 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 664 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 666 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 668 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 669 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 672 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_package_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 674 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libarchive-3.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_package_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 872 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_fetch)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 686 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 688 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 689 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 946 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.bb:do_fetch)
NOTE: Running task 954 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_fetch)
NOTE: Running task 964 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.16.0.bb:do_fetch)
NOTE: Running task 971 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libsolv/libsolv_0.7.28.bb:do_fetch)
NOTE: Running task 990 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_fetch)
NOTE: Running task 995 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_write_config)
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1000 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.72.0.bb:do_fetch)
NOTE: Running task 1038 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_write_config)
NOTE: Running task 1055 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.19.0.bb:do_fetch)
NOTE: recipe elfutils-0.189-r0: task do_fetch: Started
NOTE: recipe perl-5.38.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1084 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.4.4.bb:do_fetch)
NOTE: recipe acl-2.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe rpm-1_4.19.1-r0: task do_fetch: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe librepo-1.16.0-r0: task do_fetch: Started
NOTE: recipe elfutils-0.189-r0: task do_fetch: Succeeded
NOTE: recipe libsolv-0.7.28-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_fetch: Started
NOTE: Running task 1085 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_unpack)
NOTE: recipe libmodulemd-2.15.0-r0: task do_fetch: Started
NOTE: recipe libdnf-0.72.0-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_write_config: Started
NOTE: Running task 1086 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_unpack)
NOTE: recipe libmodulemd-2.15.0-r0: task do_write_config: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_package_setscene: Succeeded
NOTE: recipe dnf-4.19.0-r0: task do_fetch: Started
NOTE: Running setscene task 693 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 694 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_write_config: Succeeded
NOTE: recipe gnupg-2.4.4-r0: task do_fetch: Started
NOTE: Running setscene task 695 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.6.0.bb:do_packagedata_setscene)
NOTE: recipe libmodulemd-2.15.0-r0: task do_write_config: Succeeded
NOTE: Running setscene task 696 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe elfutils-0.189-r0: task do_unpack: Started
NOTE: recipe gnupg-2.4.4-r0: task do_fetch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 697 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 699 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_unpack: Started
NOTE: Running setscene task 701 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Started
NOTE: recipe libmodulemd-2.15.0-r0: task do_fetch: Succeeded
NOTE: recipe librepo-1.16.0-r0: task do_fetch: Succeeded
NOTE: recipe file-5.45-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 702 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 703 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_populate_sysroot_setscene)
NOTE: recipe rpm-1_4.19.1-r0: task do_fetch: Succeeded
NOTE: recipe libsolv-0.7.28-r0: task do_fetch: Succeeded
NOTE: Running setscene task 705 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.6.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1092 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.bb:do_unpack)
NOTE: recipe curl-8.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdnf-0.72.0-r0: task do_fetch: Succeeded
NOTE: Running task 1093 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.16.0.bb:do_unpack)
NOTE: recipe dnf-4.19.0-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-3.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1094 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libsolv/libsolv_0.7.28.bb:do_unpack)
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 707 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_packagedata_setscene)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe rpm-1_4.19.1-r0: task do_unpack: Started
NOTE: recipe file-5.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 709 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_recipe_qa_setscene)
NOTE: recipe librepo-1.16.0-r0: task do_unpack: Started
NOTE: recipe curl-8.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 710 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsolv-0.7.28-r0: task do_unpack: Started
NOTE: Running setscene task 711 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_unpack: Succeeded
NOTE: Running setscene task 712 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_populate_sysroot_setscene)
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 715 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1101 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_fetch)
NOTE: Running setscene task 716 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_package_setscene)
NOTE: Running task 1102 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_patch)
NOTE: recipe file-5.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1103 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_unpack)
NOTE: recipe zstd-1.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 718 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 719 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_fetch: Started
NOTE: recipe file-5.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 722 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_fetch: Succeeded
NOTE: Running setscene task 723 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.10.3-r0: task do_package_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 725 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libmodulemd-2.15.0-r0: task do_unpack: Started
NOTE: recipe lzlib-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 727 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 728 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_patch: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 730 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 731 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gnutls-3.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 732 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 733 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1122 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_unpack)
NOTE: recipe zstd-1.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1131 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.72.0.bb:do_unpack)
NOTE: Running task 1132 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.19.0.bb:do_unpack)
NOTE: recipe librepo-1.16.0-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1133 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.16.0.bb:do_patch)
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 737 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 739 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_recipe_qa_setscene)
NOTE: recipe rpm-1_4.19.1-r0: task do_unpack: Succeeded
NOTE: recipe libsolv-0.7.28-r0: task do_unpack: Succeeded
NOTE: Running setscene task 740 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 741 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1134 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.bb:do_patch)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_unpack: Started
NOTE: recipe dnf-4.19.0-r0: task do_unpack: Started
NOTE: recipe libdnf-0.72.0-r0: task do_unpack: Started
NOTE: recipe nettle-3.9.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 744 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe librepo-1.16.0-r0: task do_patch: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_package_setscene: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 746 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.11.5-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 747 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: Running setscene task 749 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_recipe_qa_setscene)
NOTE: recipe libmodulemd-2.15.0-r0: task do_unpack: Succeeded
NOTE: recipe rpm-1_4.19.1-r0: task do_patch: Started
NOTE: Running setscene task 750 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.2.bb:do_packagedata_setscene)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_unpack: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 751 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 752 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 754 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 755 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.48.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 756 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 757 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.48.bb:do_populate_sysroot_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 760 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.10.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgpg-error-1.48-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 762 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_recipe_qa_setscene)
NOTE: recipe librepo-1.16.0-r0: task do_patch: Succeeded
NOTE: recipe python3-3.12.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 1154 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libsolv/libsolv_0.7.28.bb:do_patch)
NOTE: recipe python3-3.12.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 764 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1156 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_fetch)
NOTE: recipe libgpg-error-1.48-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1162 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_patch)
NOTE: Running task 1164 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.16.0.bb:do_generate_toolchain_file)
NOTE: recipe nettle-3.9.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsolv-0.7.28-r0: task do_patch: Started
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 766 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe nettle-3.9.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 768 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe librepo-1.16.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libmodulemd-2.15.0-r0: task do_patch: Started
NOTE: Running task 1187 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.4.4.bb:do_unpack)
NOTE: recipe libgcrypt-1.10.3-r0: task do_fetch: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgpg-error-1.48-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 770 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: Running task 1201 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe libgpg-error-1.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 773 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.48.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.10.3-r0: task do_fetch: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1202 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_unpack)
NOTE: recipe librepo-1.16.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmodulemd-2.15.0-r0: task do_patch: Succeeded
NOTE: Running task 1247 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_fetch)
NOTE: recipe libsolv-0.7.28-r0: task do_patch: Succeeded
NOTE: recipe gnupg-2.4.4-r0: task do_unpack: Started
NOTE: Running task 1259 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libsolv/libsolv_0.7.28.bb:do_generate_toolchain_file)
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe dnf-4.19.0-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1316 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.19.0.bb:do_patch)
NOTE: recipe libdnf-0.72.0-r0: task do_unpack: Succeeded
NOTE: Running task 1326 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1327 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgpg-error-1.48-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1333 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.72.0.bb:do_patch)
NOTE: recipe libgcrypt-1.10.3-r0: task do_unpack: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_fetch: Started
NOTE: recipe libsolv-0.7.28-r0: task do_generate_toolchain_file: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.48-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.12.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running setscene task 775 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 776 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 777 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 778 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 779 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 780 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe dnf-4.19.0-r0: task do_patch: Started
NOTE: recipe libsolv-0.7.28-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running setscene task 781 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_packagedata_setscene)
NOTE: recipe python3-3.12.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 782 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libdnf-0.72.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running setscene task 783 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running setscene task 784 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 787 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 788 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 791 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 792 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 795 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 797 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_packagedata_setscene)
NOTE: recipe expat-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 799 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 802 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 803 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 805 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 806 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe rpm-1_4.19.1-r0: task do_patch: Succeeded
NOTE: Running setscene task 808 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdnf-0.72.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 810 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.12.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 811 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 812 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dnf-4.19.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 814 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 816 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 818 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 820 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 822 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 823 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 824 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.3-r0: task do_unpack: Succeeded
NOTE: Running setscene task 825 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 826 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.1.bb:do_packagedata_setscene)
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 827 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 1382 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.bb:do_generate_toolchain_file)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.45.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1394 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.72.0.bb:do_generate_toolchain_file)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1395 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.19.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1401 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1402 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.19.0.bb:do_generate_toolchain_file)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 830 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 831 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe rpm-1_4.19.1-r0: task do_generate_toolchain_file: Started
NOTE: Running setscene task 833 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 834 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 836 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 838 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 840 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 843 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe rpm-1_4.19.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe dnf-4.19.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdnf-0.72.0-r0: task do_generate_toolchain_file: Started
NOTE: Running task 1414 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_unpack)
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 848 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe sqlite3-3_3.45.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dnf-4.19.0-r0: task do_generate_toolchain_file: Started
NOTE: Running setscene task 849 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 851 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.1.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdnf-0.72.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1416 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dnf-4.19.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1417 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.19.0.bb:do_populate_lic)
NOTE: recipe debugedit-5.0-r0: task do_unpack: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dnf-4.19.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.19.0.bb:do_deploy_source_date_epoch unihash changed to 40deb3e596529daa59df9f5f641f9aadc569d5e4352ac703f9b15c38d4e1f159
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnupg-2.4.4-r0: task do_unpack: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dnf-4.19.0-r0: task do_populate_lic: Started
NOTE: recipe debugedit-5.0-r0: task do_unpack: Succeeded
NOTE: recipe sqlite3-3_3.45.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running setscene task 846 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 855 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 857 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 858 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 860 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: Running task 1453 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.4.4.bb:do_patch)
NOTE: Running task 1454 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: Running task 1455 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_patch)
NOTE: recipe dnf-4.19.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.19.0.bb:do_populate_lic unihash changed to c5b094e7a17151c401836a3fe2c1c4830e56b7184d98434856eaab01f3e0767c
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe debugedit-5.0-r0: task do_patch: Started
NOTE: recipe gnupg-2.4.4-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1471 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: Running setscene task 862 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe gnupg-2.4.4-r0: task do_patch: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 864 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 865 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 867 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1476 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 868 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 870 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 872 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 873 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 874 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 875 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 876 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 878 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 887 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 888 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 889 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 892 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 894 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_populate_sysroot_setscene)
NOTE: Running task 1514 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 3827d1886d21fc285ddcf2fcb9cb1cc58679b8245b5b8a3c52f01f2714d587ae
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 895 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 897 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 902 of 902 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2013 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2014 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2051 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2058 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_packagedata)
NOTE: Running task 2182 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_collect_spdx_deps)
NOTE: Running task 2203 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.19.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2244 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_collect_spdx_deps)
NOTE: Running task 2265 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librepo-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe gnupg-2.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe debugedit-5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2340 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_create_spdx)
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2344 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.16.0.bb:do_collect_spdx_deps)
NOTE: recipe gnupg-2.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgcrypt-1.10.3-r0: task do_create_spdx: Started
NOTE: Running task 2350 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.4.4.bb:do_configure)
NOTE: recipe librepo-1.16.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe debugedit-5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2351 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_configure)
NOTE: recipe librepo-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe rpm-1_4.19.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2352 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.16.0.bb:do_configure)
NOTE: recipe gnupg-2.4.4-r0: task do_configure: Started
NOTE: Running task 2353 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.bb:do_configure)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_configure: Started
NOTE: Running task 2354 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_configure)
NOTE: recipe librepo-1.16.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe librepo-1.16.0-r0: task do_configure: Started
NOTE: recipe rpm-1_4.19.1-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 2355 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_collect_spdx_deps)
NOTE: Running task 2356 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.4.4.bb:do_collect_spdx_deps)
NOTE: recipe librepo-1.16.0-r0: task do_configure: Succeeded
NOTE: Running task 2357 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.16.0.bb:do_compile)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe gnupg-2.4.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe librepo-1.16.0-r0: task do_compile: Started
NOTE: recipe gnupg-2.4.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2358 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_create_spdx)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_create_spdx: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2359 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_collect_spdx_deps)
NOTE: recipe elfutils-0.189-r0: task do_collect_spdx_deps: Started
NOTE: recipe elfutils-0.189-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2360 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_create_spdx)
NOTE: recipe librepo-1.16.0-r0: task do_compile: Succeeded
NOTE: Running task 2361 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.16.0.bb:do_install)
NOTE: recipe elfutils-0.189-r0: task do_create_spdx: Started
NOTE: recipe librepo-1.16.0-r0: task do_install: Started
NOTE: recipe librepo-1.16.0-r0: task do_install: Succeeded
NOTE: Running task 2362 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.16.0.bb:do_package)
NOTE: Running task 2363 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.16.0.bb:do_populate_sysroot)
NOTE: recipe librepo-1.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe librepo-1.16.0-r0: task do_package: Started
NOTE: recipe librepo-1.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_configure: Succeeded
NOTE: Running task 2364 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_compile)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_compile: Started
NOTE: recipe librepo-1.16.0-r0: task do_package: Succeeded
NOTE: Running task 2365 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.16.0.bb:do_packagedata)
NOTE: recipe librepo-1.16.0-r0: task do_packagedata: Started
NOTE: recipe librepo-1.16.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.16.0.bb:do_packagedata unihash changed to ddbff3fc17879eabffd3f46a505737fe3460a0b423433642fc9fe45e7157e345
NOTE: recipe elfutils-0.189-r0: task do_create_spdx: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2366 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.bb:do_collect_spdx_deps)
NOTE: Running task 2367 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.16.0.bb:do_create_spdx)
NOTE: recipe rpm-1_4.19.1-r0: task do_configure: Succeeded
NOTE: Running task 2368 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.16.0.bb:do_package_write_ipk)
NOTE: Running task 2369 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.16.0.bb:do_package_write_deb)
NOTE: Running task 2370 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.bb:do_compile)
NOTE: Running task 2371 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.16.0.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.19.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe librepo-1.16.0-r0: task do_package_write_ipk: Started
NOTE: recipe librepo-1.16.0-r0: task do_create_spdx: Started
NOTE: recipe librepo-1.16.0-r0: task do_package_write_deb: Started
NOTE: recipe debugedit-5.0-r0: task do_configure: Succeeded
NOTE: recipe librepo-1.16.0-r0: task do_package_write_rpm: Started
NOTE: Running task 2372 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_compile)
NOTE: recipe rpm-1_4.19.1-r0: task do_compile: Started
NOTE: recipe rpm-1_4.19.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_compile: Started
NOTE: recipe librepo-1.16.0-r0: task do_package_write_ipk: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.16.0.bb:do_package_write_ipk unihash changed to 80c2828e80dfde0e2de892b20be54ded2ab9ed900cdc3657f8ddb4f53f2d54e3
NOTE: recipe librepo-1.16.0-r0: task do_create_spdx: Succeeded
NOTE: recipe librepo-1.16.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.16.0.bb:do_package_write_deb unihash changed to f0a91832b876ef87fb66e90130c6bf5a773e2f2af4672f7f49dd8fd50c235b08
NOTE: recipe librepo-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.16.0.bb:do_package_write_rpm unihash changed to 8d601394d6c6f66668df007a8b471d8b79b33b8b789f7221997599da5612dff2
NOTE: recipe debugedit-5.0-r0: task do_compile: Succeeded
NOTE: Running task 2373 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_install)
NOTE: recipe debugedit-5.0-r0: task do_install: Started
NOTE: recipe debugedit-5.0-r0: task do_install: Succeeded
NOTE: Running task 2374 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_package)
NOTE: recipe debugedit-5.0-r0: task do_package: Started
NOTE: recipe rpm-1_4.19.1-r0: task do_compile: Succeeded
NOTE: Running task 2375 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.bb:do_install)
NOTE: recipe rpm-1_4.19.1-r0: task do_install: Started
NOTE: recipe debugedit-5.0-r0: task do_package: Succeeded
NOTE: Running task 2376 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_packagedata)
NOTE: recipe debugedit-5.0-r0: task do_packagedata: Started
NOTE: recipe debugedit-5.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_packagedata unihash changed to 0f6f0e54f97f6574cdd981be4d71853a74d46ede8637b2291d487681c7e079f2
NOTE: Setscene tasks completed
NOTE: recipe rpm-1_4.19.1-r0: task do_install: Succeeded
NOTE: Running task 2377 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.bb:do_populate_sysroot)
NOTE: Running task 2378 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.bb:do_package)
NOTE: recipe rpm-1_4.19.1-r0: task do_package: Started
NOTE: recipe rpm-1_4.19.1-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.19.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2379 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libsolv/libsolv_0.7.28.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsolv-0.7.28-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsolv-0.7.28-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2380 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libsolv/libsolv_0.7.28.bb:do_configure)
NOTE: recipe libsolv-0.7.28-r0: task do_configure: Started
NOTE: recipe gnupg-2.4.4-r0: task do_configure: Succeeded
NOTE: Running task 2381 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.4.4.bb:do_compile)
NOTE: recipe gnupg-2.4.4-r0: task do_compile: Started
NOTE: recipe libsolv-0.7.28-r0: task do_configure: Succeeded
NOTE: Running task 2382 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libsolv/libsolv_0.7.28.bb:do_compile)
NOTE: recipe libsolv-0.7.28-r0: task do_compile: Started
NOTE: recipe rpm-1_4.19.1-r0: task do_package: Succeeded
NOTE: Running task 2383 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.bb:do_packagedata)
NOTE: recipe rpm-1_4.19.1-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.19.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.bb:do_packagedata unihash changed to 5ba6d0a708fe1b535be0f3a78635886291b487da2cea27a737553d8745718502
NOTE: Setscene tasks completed
NOTE: Running task 2384 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.bb:do_create_spdx)
NOTE: Running task 2385 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.bb:do_package_write_ipk)
NOTE: Running task 2386 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.bb:do_package_write_deb)
NOTE: Running task 2387 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.19.1-r0: task do_create_spdx: Started
NOTE: recipe rpm-1_4.19.1-r0: task do_package_write_ipk: Started
NOTE: recipe rpm-1_4.19.1-r0: task do_package_write_deb: Started
NOTE: recipe rpm-1_4.19.1-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.19.1-r0: task do_package_write_ipk: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.bb:do_package_write_ipk unihash changed to 926d198a6b44d0834581769d442f4982b4b228b135ecbe2a408ac212c13834f1
NOTE: recipe rpm-1_4.19.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2388 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libsolv/libsolv_0.7.28.bb:do_collect_spdx_deps)
NOTE: recipe libsolv-0.7.28-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsolv-0.7.28-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libsolv-0.7.28-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2389 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libsolv/libsolv_0.7.28.bb:do_install)
NOTE: recipe libsolv-0.7.28-r0: task do_install: Started
NOTE: recipe libsolv-0.7.28-r0: task do_install: Succeeded
NOTE: Running task 2390 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libsolv/libsolv_0.7.28.bb:do_populate_sysroot)
NOTE: Running task 2391 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libsolv/libsolv_0.7.28.bb:do_package)
NOTE: recipe libsolv-0.7.28-r0: task do_populate_sysroot: Started
NOTE: recipe libsolv-0.7.28-r0: task do_package: Started
NOTE: recipe rpm-1_4.19.1-r0: task do_package_write_deb: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.bb:do_package_write_deb unihash changed to c5f170182823ee8fbed3ffd8b411ce88b82bad29e39fa47eae1762f80e5f1b5b
NOTE: recipe libsolv-0.7.28-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rpm-1_4.19.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.bb:do_package_write_rpm unihash changed to f77db895297f68db4fe0c127e64e65545001326a8f2115d9be9acb42177d63c5
NOTE: recipe libsolv-0.7.28-r0: task do_package: Succeeded
NOTE: Running task 2392 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libsolv/libsolv_0.7.28.bb:do_packagedata)
NOTE: recipe libsolv-0.7.28-r0: task do_packagedata: Started
NOTE: recipe libsolv-0.7.28-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libsolv/libsolv_0.7.28.bb:do_packagedata unihash changed to 2f0aae5d85c3e4975cf352cc9b7b391d5dc312af226c13a79b74a8dedeb4ecc0
NOTE: Setscene tasks completed
NOTE: Running task 2393 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libsolv/libsolv_0.7.28.bb:do_create_spdx)
NOTE: recipe libsolv-0.7.28-r0: task do_create_spdx: Started
NOTE: recipe libsolv-0.7.28-r0: task do_create_spdx: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_compile: Succeeded
NOTE: Running task 2394 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_install)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_install: Succeeded
NOTE: Running task 2395 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_populate_sysroot)
NOTE: Running task 2396 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_package)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2397 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmodulemd-2.15.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmodulemd-2.15.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2398 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_configure)
NOTE: recipe libmodulemd-2.15.0-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_package: Succeeded
NOTE: Running task 2399 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_packagedata unihash changed to d3eccab720b27878fab4ed18ae9defff049eb69be03fcb8719d760ed1eb78719
NOTE: Setscene tasks completed
NOTE: Running task 2400 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_create_spdx)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_create_spdx: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2401 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_collect_spdx_deps)
NOTE: recipe libmodulemd-2.15.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libmodulemd-2.15.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libmodulemd-2.15.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2402 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_compile)
NOTE: recipe libmodulemd-2.15.0-r0: task do_compile: Started
NOTE: recipe gnupg-2.4.4-r0: task do_compile: Succeeded
NOTE: Running task 2403 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.4.4.bb:do_install)
NOTE: recipe gnupg-2.4.4-r0: task do_install: Started
NOTE: recipe gnupg-2.4.4-r0: task do_install: Succeeded
NOTE: Running task 2404 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.4.4.bb:do_package)
NOTE: recipe gnupg-2.4.4-r0: task do_package: Started
NOTE: recipe libmodulemd-2.15.0-r0: task do_compile: Succeeded
NOTE: Running task 2405 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_install)
NOTE: recipe libmodulemd-2.15.0-r0: task do_install: Started
NOTE: recipe libmodulemd-2.15.0-r0: task do_install: Succeeded
NOTE: Running task 2406 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_populate_sysroot)
NOTE: Running task 2407 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_package)
NOTE: recipe libmodulemd-2.15.0-r0: task do_populate_sysroot: Started
NOTE: recipe libmodulemd-2.15.0-r0: task do_package: Started
NOTE: recipe gnupg-2.4.4-r0: task do_package: Succeeded
NOTE: Running task 2408 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.4.4.bb:do_packagedata)
NOTE: recipe gnupg-2.4.4-r0: task do_packagedata: Started
NOTE: recipe libmodulemd-2.15.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2409 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.72.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdnf-0.72.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnupg-2.4.4-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.4.4.bb:do_packagedata unihash changed to 6302ebb137c21022ad633adb7055103e9254a21cd256798f06441f0e0637b9ae
NOTE: Setscene tasks completed
NOTE: Running task 2410 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.4.4.bb:do_create_spdx)
NOTE: Running task 2411 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.4.4.bb:do_package_write_ipk)
NOTE: Running task 2412 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.4.4.bb:do_package_write_deb)
NOTE: Running task 2413 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.4.4.bb:do_package_write_rpm)
NOTE: recipe gnupg-2.4.4-r0: task do_create_spdx: Started
NOTE: recipe gnupg-2.4.4-r0: task do_package_write_ipk: Started
NOTE: recipe gnupg-2.4.4-r0: task do_package_write_deb: Started
NOTE: recipe gnupg-2.4.4-r0: task do_package_write_rpm: Started
NOTE: recipe libdnf-0.72.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2414 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.72.0.bb:do_configure)
NOTE: recipe libdnf-0.72.0-r0: task do_configure: Started
NOTE: recipe gnupg-2.4.4-r0: task do_package_write_ipk: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.4.4.bb:do_package_write_ipk unihash changed to 2785a591b7c77fc9f0f09abb48cd183309675879285c6e7f6ceb5295d1511a17
NOTE: recipe libmodulemd-2.15.0-r0: task do_package: Succeeded
NOTE: Running task 2415 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_packagedata)
NOTE: recipe libmodulemd-2.15.0-r0: task do_packagedata: Started
NOTE: recipe gnupg-2.4.4-r0: task do_create_spdx: Succeeded
NOTE: recipe libmodulemd-2.15.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_packagedata unihash changed to 4591da20c06fb26ab2dcb4f9652d3049befe06167e60c2da9cc071ce97183b42
NOTE: Setscene tasks completed
NOTE: Running task 2416 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_create_spdx)
NOTE: recipe libdnf-0.72.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2417 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.72.0.bb:do_compile)
NOTE: recipe libmodulemd-2.15.0-r0: task do_create_spdx: Started
NOTE: recipe libdnf-0.72.0-r0: task do_compile: Started
NOTE: recipe libmodulemd-2.15.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2418 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.72.0.bb:do_collect_spdx_deps)
NOTE: recipe libdnf-0.72.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libdnf-0.72.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gnupg-2.4.4-r0: task do_package_write_deb: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.4.4.bb:do_package_write_deb unihash changed to e2acc4ea8485f653d4a609a8d4c6b71f85fb980fe087e90f6a51e27a4c817244
NOTE: recipe gnupg-2.4.4-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.4.4.bb:do_package_write_rpm unihash changed to 345381055979f769a56c7030dbae80c0ffbb916af364387ef51f61d006cccc87
NOTE: recipe libdnf-0.72.0-r0: task do_compile: Succeeded
NOTE: Running task 2419 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.72.0.bb:do_install)
NOTE: recipe libdnf-0.72.0-r0: task do_install: Started
NOTE: recipe libdnf-0.72.0-r0: task do_install: Succeeded
NOTE: Running task 2420 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.72.0.bb:do_package)
NOTE: Running task 2421 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.72.0.bb:do_populate_sysroot)
NOTE: recipe libdnf-0.72.0-r0: task do_populate_sysroot: Started
NOTE: recipe libdnf-0.72.0-r0: task do_package: Started
NOTE: recipe libdnf-0.72.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2422 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.19.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe dnf-4.19.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dnf-4.19.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2423 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.19.0.bb:do_configure)
NOTE: recipe dnf-4.19.0-r0: task do_configure: Started
NOTE: recipe dnf-4.19.0-r0: task do_configure: Succeeded
NOTE: Running task 2424 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.19.0.bb:do_compile)
NOTE: recipe dnf-4.19.0-r0: task do_compile: Started
NOTE: recipe dnf-4.19.0-r0: task do_compile: Succeeded
NOTE: Running task 2425 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.19.0.bb:do_install)
NOTE: recipe dnf-4.19.0-r0: task do_install: Started
NOTE: recipe dnf-4.19.0-r0: task do_install: Succeeded
NOTE: Running task 2426 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.19.0.bb:do_populate_sysroot)
NOTE: recipe dnf-4.19.0-r0: task do_populate_sysroot: Started
NOTE: recipe dnf-4.19.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdnf-0.72.0-r0: task do_package: Succeeded
NOTE: Running task 2427 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.72.0.bb:do_packagedata)
NOTE: recipe libdnf-0.72.0-r0: task do_packagedata: Started
NOTE: recipe libdnf-0.72.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.72.0.bb:do_packagedata unihash changed to 0484e3bd696e77bce5917d17a05ab60630e9e3010202ea91ada93966cf44fa9b
NOTE: Setscene tasks completed
NOTE: Running task 2428 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.19.0.bb:do_package)
NOTE: Running task 2429 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.72.0.bb:do_create_spdx)
NOTE: Running task 2430 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.72.0.bb:do_package_write_ipk)
NOTE: Running task 2431 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.72.0.bb:do_package_write_deb)
NOTE: Running task 2432 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.72.0.bb:do_package_write_rpm)
NOTE: recipe dnf-4.19.0-r0: task do_package: Started
NOTE: recipe libdnf-0.72.0-r0: task do_create_spdx: Started
NOTE: recipe libdnf-0.72.0-r0: task do_package_write_ipk: Started
NOTE: recipe libdnf-0.72.0-r0: task do_package_write_deb: Started
NOTE: recipe libdnf-0.72.0-r0: task do_package_write_rpm: Started
NOTE: recipe libdnf-0.72.0-r0: task do_package_write_ipk: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.72.0.bb:do_package_write_ipk unihash changed to 778431386d3d70e528d0aef65132ab241eb3c323d99649de9a68573bc2329ae0
NOTE: recipe libdnf-0.72.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2433 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.19.0.bb:do_collect_spdx_deps)
NOTE: recipe dnf-4.19.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe dnf-4.19.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe dnf-4.19.0-r0: task do_package: Succeeded
NOTE: Running task 2434 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.19.0.bb:do_packagedata)
NOTE: recipe dnf-4.19.0-r0: task do_packagedata: Started
NOTE: recipe dnf-4.19.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.19.0.bb:do_packagedata unihash changed to af55ea30686ca4e3deaa688d84ac5b7311dec4583623df9934f9549c723cb28b
NOTE: Setscene tasks completed
NOTE: Running task 2435 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.19.0.bb:do_create_spdx)
NOTE: Running task 2436 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.19.0.bb:do_package_write_ipk)
NOTE: Running task 2437 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.19.0.bb:do_package_write_deb)
NOTE: Running task 2438 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.19.0.bb:do_package_write_rpm)
NOTE: Running task 2439 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.19.0.bb:do_package_qa)
NOTE: recipe dnf-4.19.0-r0: task do_package_write_ipk: Started
NOTE: recipe dnf-4.19.0-r0: task do_create_spdx: Started
NOTE: recipe dnf-4.19.0-r0: task do_package_write_deb: Started
NOTE: recipe dnf-4.19.0-r0: task do_package_write_rpm: Started
NOTE: recipe dnf-4.19.0-r0: task do_package_qa: Started
NOTE: recipe dnf-4.19.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2440 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.19.0.bb:do_create_runtime_spdx)
NOTE: recipe dnf-4.19.0-r0: task do_package_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.19.0.bb:do_package_qa unihash changed to 907874c7d40cac97697c86be08d453eec744ad148f92126aa072ce47ab0600e2
NOTE: recipe dnf-4.19.0-r0: task do_create_runtime_spdx: Started
NOTE: recipe dnf-4.19.0-r0: task do_package_write_ipk: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.19.0.bb:do_package_write_ipk unihash changed to c78ce479ad3ccb13275c3125d591b68bfed448c079821a9fcf7830d322e4af78
NOTE: recipe dnf-4.19.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.19.0.bb:do_package_write_deb unihash changed to be10b4b90bdf8a4cb7550cd0e3c26fa44809b45c089d35d7b99aec97b0068405
NOTE: recipe dnf-4.19.0-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe dnf-4.19.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.19.0.bb:do_package_write_rpm unihash changed to aabee0e8d08d8342657439df15a2d841ae5bc2c6e8f4fe43cce25de61ac2398d
NOTE: recipe libdnf-0.72.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.72.0.bb:do_package_write_deb unihash changed to 051c3fdd1f62bcc8f4dc2499228f72302cce25acbb57bf6f017bae41224efe77
NOTE: recipe libdnf-0.72.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.72.0.bb:do_package_write_rpm unihash changed to d37c5e42d8e10746a17aca21f5bc9bc2b804b43d8d9f4a639852fb2aab058b3a
NOTE: Running noexec task 2441 of 2441 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.19.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2441 tasks of which 2288 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 11 ERROR messages, returning a non-zero exit code.
ERROR: libxml2-2.11.5-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-src went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.11.5-r0) [version-going-backwards]
ERROR: libxml2-2.11.5-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-dbg went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.11.5-r0) [version-going-backwards]
ERROR: libxml2-2.11.5-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-ptest went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.11.5-r0) [version-going-backwards]
ERROR: libxml2-2.11.5-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-staticdev went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.11.5-r0) [version-going-backwards]
ERROR: libxml2-2.11.5-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-dev went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.11.5-r0) [version-going-backwards]
ERROR: libxml2-2.11.5-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-doc went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.11.5-r0) [version-going-backwards]
ERROR: libxml2-2.11.5-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-locale went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.11.5-r0) [version-going-backwards]
ERROR: libxml2-2.11.5-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-utils went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.11.5-r0) [version-going-backwards]
ERROR: libxml2-2.11.5-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2 went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.11.5-r0) [version-going-backwards]
ERROR: libxml2-2.11.5-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-python went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.11.5-r0) [version-going-backwards]
ERROR: libxml2-2.11.5-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============1489399965254558330==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/dnf (sysroot):
  /usr/lib/python3.12/site-packages/dnf-4.18.2.dist-info moved to /usr/lib/python3.12/site-packages/dnf-4.19.0.dist-info

--===============1489399965254558330==--

