Return-Path: <jaeyoon.jung@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A77BD49C9B
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 10:25:09 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7438.1769768706135840159
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jan 2026 02:25:07 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.51, mailfrom: jaeyoon.jung@lge.com)
Received: from unknown (HELO lgeamrelo02.lge.com) (156.147.1.126)
	by 156.147.23.51 with ESMTP; 30 Jan 2026 19:25:04 +0900
X-Original-SENDERIP: 156.147.1.126
X-Original-MAILFROM: jaeyoon.jung@lge.com
Received: from unknown (HELO magneto.lge.net) (10.177.121.44)
	by 156.147.1.126 with ESMTP; 30 Jan 2026 19:10:04 +0900
X-Original-SENDERIP: 10.177.121.44
X-Original-MAILFROM: jaeyoon.jung@lge.com
From: jaeyoon.jung@lge.com
To: openembedded-core@lists.openembedded.org
Cc: Jaeyoon Jung <jaeyoon.jung@lge.com>
Subject: [PATCH v2] apt: Set gid to nogroup
Date: Fri, 30 Jan 2026 19:09:15 +0900
Message-ID: <20260130100921.2584213-1-jaeyoon.jung@lge.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jan 2026 10:25:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230191

From: Jaeyoon Jung <jaeyoon.jung@lge.com>

Without --no-user-group, it tries to assign "_apt" gid which ends up
with an error as shown below when using static gid values and "_apt" is
not defined in USERADD_GID_TABLES.

| apt was skipped: Recipe apt, package apt: normal groupname "_apt" does not have a static ID defined.

Conventionally "_apt" does not have its own gid but rather uses
"nogroup". For that reason '_apt' gid is also removed from
meta-selftest/files/static-group.

Signed-off-by: Jaeyoon Jung <jaeyoon.jung@lge.com>

---
Changes in v2:
- Remove '_apt' and add 'nogroup' in meta-selftest/files/static-group.
---
 meta-selftest/files/static-group       | 2 +-
 meta/recipes-devtools/apt/apt_3.0.3.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-selftest/files/static-group b/meta-selftest/files/static-group
index 252fdac67d..3fca4aa5c9 100644
--- a/meta-selftest/files/static-group
+++ b/meta-selftest/files/static-group
@@ -19,7 +19,6 @@ tracing:x:519:
 pulse:x:520:
 bind:x:521:
 builder:x:522:
-_apt:x:523:
 weston-launch:x:524:
 weston:x:525:
 wayland:x:526:
@@ -29,3 +28,4 @@ ptest:x:529:
 xuser:x:530:
 seat:x:531:
 audio:x:532:
+nogroup:x:65534:
diff --git a/meta/recipes-devtools/apt/apt_3.0.3.bb b/meta/recipes-devtools/apt/apt_3.0.3.bb
index 7f0a38ab29..d2dfe48e9a 100644
--- a/meta/recipes-devtools/apt/apt_3.0.3.bb
+++ b/meta/recipes-devtools/apt/apt_3.0.3.bb
@@ -38,7 +38,7 @@ inherit cmake perlnative bash-completion useradd
 
 # User is added to allow apt to drop privs, will runtime warn without
 USERADD_PACKAGES = "${PN}"
-USERADD_PARAM:${PN} = "--system --home /nonexistent --no-create-home _apt"
+USERADD_PARAM:${PN} = "--system --home /nonexistent --no-create-home --no-user-group --gid nogroup _apt"
 
 BBCLASSEXTEND = "native nativesdk"
 

