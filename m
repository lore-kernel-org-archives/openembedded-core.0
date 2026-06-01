Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07D6DCD6E5E
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 07:55:41 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22995.1780298540876624034
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 00:22:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=lkoZjqEr;
 spf=pass (domain: kernel.org, ip: 172.105.4.254, mailfrom: devnull+rouven.czerwinski.linaro.org@kernel.org)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 33E9B6014C;
	Mon,  1 Jun 2026 07:13:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DADDDC2BCF6;
	Mon,  1 Jun 2026 07:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780297983;
	bh=ebrCT+P7JhGXzhdmoyO9bhymclOf7Pe1Bi0oOpbW4ek=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lkoZjqErgee+wKHEjyW03AOUiKKadzIWnU8yGx2mj4sjYEdQgr6qgDZTdB8CK4xX/
	 YxrLHCY0uE+pvjzQlhDk+jV0nAhq75Hra6rQ/RRD2gr7CJQJKlWXE1JL86sV6/Aozr
	 E8ePgZvXaD1Qwb6tZqWnnwhl0zvy6E2vaYtoSMl7TpYn+Ih4L5+bH5Wb4ZY5xtfp7H
	 OpfY0C7BeTww2MdQERTznZqFEOILX+j180Cn/Z5bopIOzD0SuJiwqdx+8w0vQJ8/xN
	 nItWAjKaC46/u68w4KHv3YrhMt+GwesHDJyrb8n/K6LK9ofPQCn1Z0a9DuaFBgOZvt
	 8ECnZ2dUM36dw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D502CCD6E5E;
	Mon,  1 Jun 2026 07:13:03 +0000 (UTC)
From: Rouven Czerwinski via B4 Relay <devnull+rouven.czerwinski.linaro.org@kernel.org>
Date: Mon, 01 Jun 2026 09:13:05 +0200
Subject: [PATCH 4/6] package_manager: remove [True, False] list eval
MIME-Version: 1.0
Message-Id: <20260601-topic-packagemanager-cleanup-v1-4-926e4d5b724d@linaro.org>
References: <20260601-topic-packagemanager-cleanup-v1-0-926e4d5b724d@linaro.org>
In-Reply-To: <20260601-topic-packagemanager-cleanup-v1-0-926e4d5b724d@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Rouven Czerwinski <rouven.czerwinski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780297982; l=3544;
 i=rouven.czerwinski@linaro.org; s=20260126; h=from:subject:message-id;
 bh=EWUMxfp5xIJ+TSxGcoFdO33TOCfs6Lu7ITMhUnFxKqw=;
 b=QUe2V7gCu/RfQpPv1I6Pkf4mAHIDO3eu6Z5hcCzBKIPxIGxgpirkCuZWerkWb8H49p+y2uDQy
 QcM/asyjYTXB0mBTxB5fSmmdY0upMg+uh+7b1AJ8nZoO/4fSVN4+GPV
X-Developer-Key: i=rouven.czerwinski@linaro.org; a=ed25519;
 pk=/5pmUK/XIAIIo8JA0axgfy1k8NRhRTQkxVwZYa1ga7U=
X-Endpoint-Received: by B4 Relay for rouven.czerwinski@linaro.org/20260126
 with auth_id=616
X-Original-From: Rouven Czerwinski <rouven.czerwinski@linaro.org>
Reply-To: rouven.czerwinski@linaro.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 07:55:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237821

From: Rouven Czerwinski <rouven.czerwinski@linaro.org>

Remove a [True, False] list evaluation that itself relied on evaluating
a boolean condition. Instead pass the boolean condition directly.

The previous version works because int(True)=1 and int(False)=0.
So:
 => pkg_type = Manifest.PKG_TYPE_ATTEMPT_ONLY
 => [False, True][pkg_type == Manifest.PKG_TYPE_ATTEMPT_ONLY]
 => [False, True][True]
 => [False, True][1]
 => True

No functional changes.

Signed-off-by: Rouven Czerwinski <rouven.czerwinski@linaro.org>
---
 meta/lib/oe/package_manager/deb/rootfs.py | 2 +-
 meta/lib/oe/package_manager/deb/sdk.py    | 2 +-
 meta/lib/oe/package_manager/ipk/rootfs.py | 2 +-
 meta/lib/oe/package_manager/ipk/sdk.py    | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/package_manager/deb/rootfs.py b/meta/lib/oe/package_manager/deb/rootfs.py
index 21d6cc5e5d..d2b077cc37 100644
--- a/meta/lib/oe/package_manager/deb/rootfs.py
+++ b/meta/lib/oe/package_manager/deb/rootfs.py
@@ -165,7 +165,7 @@ class PkgRootfs(DpkgOpkgRootfs):
         for pkg_type in Manifest.INSTALL_ORDER:
             if pkg_type in pkgs_to_install:
                 self.pm.install(pkgs_to_install[pkg_type],
-                                [False, True][pkg_type == Manifest.PKG_TYPE_ATTEMPT_ONLY])
+                                pkg_type == Manifest.PKG_TYPE_ATTEMPT_ONLY)
                 self.pm.fix_broken_dependencies()
 
         if self.progress_reporter:
diff --git a/meta/lib/oe/package_manager/deb/sdk.py b/meta/lib/oe/package_manager/deb/sdk.py
index 690b10d2ba..519b5c9f90 100644
--- a/meta/lib/oe/package_manager/deb/sdk.py
+++ b/meta/lib/oe/package_manager/deb/sdk.py
@@ -57,7 +57,7 @@ class PkgSdk(Sdk):
         for pkg_type in Manifest.INSTALL_ORDER:
             if pkg_type in pkgs_to_install:
                 pm.install(pkgs_to_install[pkg_type],
-                           [False, True][pkg_type == Manifest.PKG_TYPE_ATTEMPT_ONLY])
+                           pkg_type == Manifest.PKG_TYPE_ATTEMPT_ONLY)
 
     def _populate(self):
         execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_PRE_TARGET_COMMAND"))
diff --git a/meta/lib/oe/package_manager/ipk/rootfs.py b/meta/lib/oe/package_manager/ipk/rootfs.py
index bc822bac87..a760000d3f 100644
--- a/meta/lib/oe/package_manager/ipk/rootfs.py
+++ b/meta/lib/oe/package_manager/ipk/rootfs.py
@@ -307,7 +307,7 @@ class PkgRootfs(DpkgOpkgRootfs):
                     self._multilib_test_install(pkgs_to_install[pkg_type])
 
                 self.pm.install(pkgs_to_install[pkg_type],
-                                [False, True][pkg_type == Manifest.PKG_TYPE_ATTEMPT_ONLY])
+                                pkg_type == Manifest.PKG_TYPE_ATTEMPT_ONLY)
 
         if self.progress_reporter:
             self.progress_reporter.next_stage()
diff --git a/meta/lib/oe/package_manager/ipk/sdk.py b/meta/lib/oe/package_manager/ipk/sdk.py
index 8dc01661ef..e75e9bd991 100644
--- a/meta/lib/oe/package_manager/ipk/sdk.py
+++ b/meta/lib/oe/package_manager/ipk/sdk.py
@@ -53,7 +53,7 @@ class PkgSdk(Sdk):
         for pkg_type in Manifest.INSTALL_ORDER:
             if pkg_type in pkgs_to_install:
                 pm.install(pkgs_to_install[pkg_type],
-                           [False, True][pkg_type == Manifest.PKG_TYPE_ATTEMPT_ONLY])
+                           pkg_type == Manifest.PKG_TYPE_ATTEMPT_ONLY)
 
     def _populate(self):
         execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_PRE_TARGET_COMMAND"))

-- 
2.52.0



