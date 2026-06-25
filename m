Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07373CDE000
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 18:12:05 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15236.1782403658321034692
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2026 09:07:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=trGGB0GQ;
 spf=pass (domain: kernel.org, ip: 172.105.4.254, mailfrom: devnull+torben.hohn.bruker.com@kernel.org)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EAF0C60218;
	Thu, 25 Jun 2026 15:59:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BC26DC2BCC7;
	Thu, 25 Jun 2026 15:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782403181;
	bh=dq6zUpbkScXq1MzNqwNb5SB0VdWOG4LHjY9dy1kFQt0=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=trGGB0GQd5lokR58s7k1mSk6VCQIhRfHKh4Xn8mxAYwxvJztiWRC/2i3aLYSDGwIu
	 rEXqd1xu+eZzydZR84uMTMN/fMkvMvzU+QEuRMR85bUw+mnS8kO5hyVhQ5Du0+fglg
	 Yhvh9qhjJs070HDfjeGuuCAh38hIAp8PuShScPVBeIk7U4ZgXh3GFVh6xo6Z0ZrEoU
	 dp7gyKUQXmU9WCocUhy4E1LIN5xHbzcooqizMenlVnFMhk/03HKKd61ZShyag/wDa7
	 NUDuGO19Y+JLfNWkT/hL806vZR6ZYiMsO1othwSjAzaR/3E8D1thYGDbZuSt9ybEmK
	 IvhnqP3SGFLZQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2689CDE000;
	Thu, 25 Jun 2026 15:59:41 +0000 (UTC)
From: Torben Hohn via B4 Relay <devnull+torben.hohn.bruker.com@kernel.org>
Date: Thu, 25 Jun 2026 17:59:35 +0200
Subject: [PATCH] systemd-systemctl: Add support for UpheldBy fields in [Install] section
MIME-Version: 1.0
Message-Id: <20260625-systemctl-upheldby-v1-1-b66839cab56b@bruker.com>
X-B4-Tracking: v=1; b=H4sIAGZQPWoC/x3MTQ5AMBBA4avIrDWpkZa4iljQDibxlw5CxN01l
 t/ivQeEApNAlTwQ6GThdYnI0gTc2C4DKfbRgBqttmiU3LLT7PZJHdtIk+9uVeYGrdWFMx4hhlu
 gnq9/Wjfv+wEYVohFZAAAAA==
X-Change-ID: 20260625-systemctl-upheldby-83526607c5d2
To: openembedded-core@lists.openembedded.org
Cc: Torben Hohn <torben.hohn@bruker.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782403180; l=1384;
 i=torben.hohn@bruker.com; s=20260625; h=from:subject:message-id;
 bh=R/nG2OjNBzK8ShZkAJStRPF6gEyt5fnMN84RqMWP2Ds=;
 b=8pxrFeDS5KefhApTleR0xJEZossjha9uGBY/5QfzMJoTSOQ/kWCAFMTxeJBnx5LOZsZqbflVR
 d36MEVaL4XNCPjHy8LoREDISJFBoyMSa4jpNzISNkZYLMIgDi75HEE3
X-Developer-Key: i=torben.hohn@bruker.com; a=ed25519;
 pk=xwQUIFyS0KMR/PWxOIZJmY0wxZLSQusEDFjPRjZWdhE=
X-Endpoint-Received: by B4 Relay for torben.hohn@bruker.com/20260625 with
 auth_id=842
X-Original-From: Torben Hohn <torben.hohn@bruker.com>
Reply-To: torben.hohn@bruker.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 18:12:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239588

From: Torben Hohn <torben.hohn@bruker.com>

UpheldBy generates *.upholds links in the same way WantedBy generates
*.wants links, when systemctl enable is executed. This feature is needed
to have a service restart, when a dependency restarts, and
the service is stopped via BindsTo= for example.

Call self._process_deps() with appropriate parameters to support UpheldBy.

Signed-off-by: Torben Hohn <torben.hohn@bruker.com>
---
 meta/recipes-core/systemd/systemd-systemctl/systemctl | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta/recipes-core/systemd/systemd-systemctl/systemctl
index 2229bc7b6d26c757414715341ff79d8a76034c8d..0171d2fca639ed452af9295c6a3cfd3c7102f67c 100755
--- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
+++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
@@ -244,6 +244,7 @@ class SystemdUnit():
 
         self._process_deps(config, service, path, 'WantedBy', 'wants', instance)
         self._process_deps(config, service, path, 'RequiredBy', 'requires', instance)
+        self._process_deps(config, service, path, 'UpheldBy', 'upholds', instance)
 
         try:
             for also in config.get('Install', 'Also'):

---
base-commit: 78626a6f1861361bbd78a411cb27b093e34b466b
change-id: 20260625-systemctl-upheldby-83526607c5d2

Best regards,
-- 
Torben Hohn <torben.hohn@bruker.com>



