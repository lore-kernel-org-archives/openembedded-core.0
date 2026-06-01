Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C8F0CD6E5E
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 07:55:51 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23082.1780298540891521013
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 00:22:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=QAiy7z8v;
 spf=pass (domain: kernel.org, ip: 172.105.4.254, mailfrom: devnull+rouven.czerwinski.linaro.org@kernel.org)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0D54560018;
	Mon,  1 Jun 2026 07:13:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B4BA4C2BCC9;
	Mon,  1 Jun 2026 07:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780297983;
	bh=laOOaiu9qo52T9sWlZXECszo+NYX1xW97lSoEtkIKnw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=QAiy7z8vK7y41iZ1nnML8S7e7KM14UVznjw6e8SKCcFAOcfYicWwSw2a0cdRXGcbD
	 UZ8ca33DTcySNAqYDSpjTgWK6ASmHQFzq10g0ZtA0wzpGpGGRCQi8YWcZAA9P4jieJ
	 o24cyK9wlfvR8B7Q/klQq7ZJShr3Sin9fpPSK9rAaJHdg8ptCTSqxMAtlwjVMTqhbm
	 JVlNXkeuyBO9T4y+6Wdl8rcZsbf0Utzxueqw5qsdxLDIiif4YAwtCzzbTXWbGesCMQ
	 00e5ZcZqWAlgIYkaN6ptRJz+UT1ejllvpzGOvEnaeJOyeGBMAJ2qzha0L7fuRHnKmN
	 Pd6MuO7xg6kCw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE9C3CD6E4C;
	Mon,  1 Jun 2026 07:13:03 +0000 (UTC)
From: Rouven Czerwinski via B4 Relay <devnull+rouven.czerwinski.linaro.org@kernel.org>
Date: Mon, 01 Jun 2026 09:13:02 +0200
Subject: [PATCH 1/6] package_manager: sdk: remove install_order
MIME-Version: 1.0
Message-Id: <20260601-topic-packagemanager-cleanup-v1-1-926e4d5b724d@linaro.org>
References: <20260601-topic-packagemanager-cleanup-v1-0-926e4d5b724d@linaro.org>
In-Reply-To: <20260601-topic-packagemanager-cleanup-v1-0-926e4d5b724d@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Rouven Czerwinski <rouven.czerwinski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780297982; l=2091;
 i=rouven.czerwinski@linaro.org; s=20260126; h=from:subject:message-id;
 bh=3s/tqeGzYl2p0pcIZGxjct/H6oVWX//wOCliBO0pCZg=;
 b=c7eH2wARsnjnysK7kMUWArRpJ/yr+0VmsEYEbOPU+LwRjJYbMqcCC7gl8BHpuLd2ANp7x7NhG
 vjykJ5qnpLiDsvVCFRVawDi364lFDdx/gAW9OT26XzDSh+WPJxoMEPj
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
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 07:55:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237823

From: Rouven Czerwinski <rouven.czerwinski@linaro.org>

The install_order instance variable was only ever set to
Manifest.INSTALL_ORDER, modified nowhere and used as is. Instead of
using an instance variable use Manifest.INSTALL_ORDER directly to
simplify the code for those reading it.

No functional changes.

Signed-off-by: Rouven Czerwinski <rouven.czerwinski@linaro.org>
---
 meta/lib/oe/package_manager/deb/sdk.py | 2 +-
 meta/lib/oe/package_manager/ipk/sdk.py | 2 +-
 meta/lib/oe/sdk.py                     | 2 --
 3 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/package_manager/deb/sdk.py b/meta/lib/oe/package_manager/deb/sdk.py
index 6f3005053e..1169744674 100644
--- a/meta/lib/oe/package_manager/deb/sdk.py
+++ b/meta/lib/oe/package_manager/deb/sdk.py
@@ -54,7 +54,7 @@ class PkgSdk(Sdk):
         pm.write_index()
         pm.update()
 
-        for pkg_type in self.install_order:
+        for pkg_type in Manifest.INSTALL_ORDER:
             if pkg_type in pkgs_to_install:
                 pm.install(pkgs_to_install[pkg_type],
                            [False, True][pkg_type == Manifest.PKG_TYPE_ATTEMPT_ONLY])
diff --git a/meta/lib/oe/package_manager/ipk/sdk.py b/meta/lib/oe/package_manager/ipk/sdk.py
index 3acd55f548..c39a32fa24 100644
--- a/meta/lib/oe/package_manager/ipk/sdk.py
+++ b/meta/lib/oe/package_manager/ipk/sdk.py
@@ -50,7 +50,7 @@ class PkgSdk(Sdk):
 
         pm.update()
 
-        for pkg_type in self.install_order:
+        for pkg_type in Manifest.INSTALL_ORDER:
             if pkg_type in pkgs_to_install:
                 pm.install(pkgs_to_install[pkg_type],
                            [False, True][pkg_type == Manifest.PKG_TYPE_ATTEMPT_ONLY])
diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
index 9fe0fbb752..c2c5431c0d 100644
--- a/meta/lib/oe/sdk.py
+++ b/meta/lib/oe/sdk.py
@@ -29,8 +29,6 @@ class Sdk(object, metaclass=ABCMeta):
 
         self.remove(self.sdk_output, True)
 
-        self.install_order = Manifest.INSTALL_ORDER
-
     @abstractmethod
     def _populate(self):
         pass

-- 
2.52.0



