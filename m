Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 042E5CD6E4C
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 07:55:21 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23038.1780298289543677132
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 00:18:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=fbS6CYi0;
 spf=pass (domain: kernel.org, ip: 172.234.252.31, mailfrom: devnull+rouven.czerwinski.linaro.org@kernel.org)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E041D40C40;
	Mon,  1 Jun 2026 07:13:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C1EBCC2BCF5;
	Mon,  1 Jun 2026 07:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780297983;
	bh=M/+L04W2avoG6YQBi9oayQsXLxZ4kXkOOneRyAnx7J4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fbS6CYi0lOUOFmM5lj/FR9QOTiiFINL77R/60M3WHvT+zHBvEnSSy9zJ/JxcPdLP2
	 a+TsetsiR8KOeQSRjzbfkCfK+ghV6WZJJCpcW5eYuv4ZOplHBaN0A5WmyGUTrAPcY2
	 CttDxULVGoTBu6Dd2gaEkq1f3UejpUk9x5HOZbJ/sTO/oc6Vxi/padI0erGV2JqtP5
	 iQqaFVZ+ab/DbypfiL7ZuTXPyzlH6ppEHJFW+Ocy8DZMd1paikl7j7LnG9s65lC8zO
	 kJz7t0IJUXp1pPOhT8dCJUBgN4WtpyTLoLk7fv414eH662ycU3GDoFhj50KuBf2q9J
	 b5WIrey4Qun9g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBC15CD6E56;
	Mon,  1 Jun 2026 07:13:03 +0000 (UTC)
From: Rouven Czerwinski via B4 Relay <devnull+rouven.czerwinski.linaro.org@kernel.org>
Date: Mon, 01 Jun 2026 09:13:03 +0200
Subject: [PATCH 2/6] package_manager: rootfs: remove install_order
MIME-Version: 1.0
Message-Id: <20260601-topic-packagemanager-cleanup-v1-2-926e4d5b724d@linaro.org>
References: <20260601-topic-packagemanager-cleanup-v1-0-926e4d5b724d@linaro.org>
In-Reply-To: <20260601-topic-packagemanager-cleanup-v1-0-926e4d5b724d@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Rouven Czerwinski <rouven.czerwinski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780297982; l=2345;
 i=rouven.czerwinski@linaro.org; s=20260126; h=from:subject:message-id;
 bh=TjZBf0G6Bjkiu10F3DJm+xgYkZbJVsvMLVkTSeOxqHg=;
 b=+2krNKmwmQWUDxa8jYWhlTNPNieLJq1xUujFk5F8n7v4WpAJ5qaO5orJIgrMq0qMxft+1ac3R
 r25SDa+7IQCAHCb67upOfnQv7a05FxjQzmWd+gwGreCwjq8x0uK/Y2n
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
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 07:55:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237818

From: Rouven Czerwinski <rouven.czerwinski@linaro.org>

The install_order instance variable was only ever set to
Manifest.INSTALL_ORDER, modified nowhere and used as is. Instead of
using an instance variable use Manifest.INSTALL_ORDER directly to
simplify the code for those reading it.

No functional changes.

Signed-off-by: Rouven Czerwinski <rouven.czerwinski@linaro.org>
---
 meta/lib/oe/package_manager/deb/rootfs.py | 2 +-
 meta/lib/oe/package_manager/ipk/rootfs.py | 2 +-
 meta/lib/oe/rootfs.py                     | 2 --
 3 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/package_manager/deb/rootfs.py b/meta/lib/oe/package_manager/deb/rootfs.py
index 1e25b64ed9..21d6cc5e5d 100644
--- a/meta/lib/oe/package_manager/deb/rootfs.py
+++ b/meta/lib/oe/package_manager/deb/rootfs.py
@@ -162,7 +162,7 @@ class PkgRootfs(DpkgOpkgRootfs):
         if self.progress_reporter:
             self.progress_reporter.next_stage()
 
-        for pkg_type in self.install_order:
+        for pkg_type in Manifest.INSTALL_ORDER:
             if pkg_type in pkgs_to_install:
                 self.pm.install(pkgs_to_install[pkg_type],
                                 [False, True][pkg_type == Manifest.PKG_TYPE_ATTEMPT_ONLY])
diff --git a/meta/lib/oe/package_manager/ipk/rootfs.py b/meta/lib/oe/package_manager/ipk/rootfs.py
index ba93eb62ea..bc822bac87 100644
--- a/meta/lib/oe/package_manager/ipk/rootfs.py
+++ b/meta/lib/oe/package_manager/ipk/rootfs.py
@@ -298,7 +298,7 @@ class PkgRootfs(DpkgOpkgRootfs):
         if self.progress_reporter:
             self.progress_reporter.next_stage()
 
-        for pkg_type in self.install_order:
+        for pkg_type in Manifest.INSTALL_ORDER:
             if pkg_type in pkgs_to_install:
                 # For multilib, we perform a sanity test before final install
                 # If sanity test fails, it will automatically do a bb.fatal()
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 7ef7e71f9e..5eee48f587 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -27,8 +27,6 @@ class Rootfs(object, metaclass=ABCMeta):
         self.logcatcher = logcatcher
         self.warn_check_regex = r'^(warn|Warn|WARNING:)'
 
-        self.install_order = Manifest.INSTALL_ORDER
-
     @abstractmethod
     def _create(self):
         pass

-- 
2.52.0



