Return-Path: <esben@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 393B7CE8E68
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 11:41:17 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web11.12526.1729770073836663953
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Oct 2024 04:41:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=LLd0elSB;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: esben@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References; bh=Gw+RZX4/sgrtttljct8VxOZMFuBUPbllFEptQNQUAvU=; b=LL
	d0elSBUIJWj/OaPiLM8YfJliOiCbQ2Gf37EDPsKqnOyOBNuIDXjh/LBimC2qwZ9sErXChwxyb+JkY
	CquJ3aetCMx9Xz5QQRNRC5Zk+UrPfMtqSeYuRZGAC6lDcFoM9Qjee7CMGclAGINdholkhmU1kY2zp
	iYyz/dlcxzayHH2wjjfcOVmoOBBy2gTQ6n5K7Pcb+OFwhHK4U8gddTtd5/UlNs/24FCSH3TsjmTtg
	XVlAGl4MwkZARSc3AXxCkYBt+/rHntRJta6x3l+EMoIQYthlNoideU61Y+chxGbS7OKDw6kfVuEy9
	j9VKfnP0wNz0ACTYNzqw+5cVV3yHrkLQ==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1t3wDG-000DTd-W9; Thu, 24 Oct 2024 13:41:11 +0200
Received: from [185.17.218.86] (helo=localhost)
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1t3wDG-000NOk-30;
	Thu, 24 Oct 2024 13:41:10 +0200
From: Esben Haabendal <esben@geanix.com>
Date: Thu, 24 Oct 2024 13:41:04 +0200
Subject: [PATCH] systemd: fix journald persistency when VOLATILE_LOG_DIR is
 false
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241024-systemd-create-log-dirs-v1-1-23cba4a734ab@geanix.com>
X-B4-Tracking: v=1; b=H4sIAE8yGmcC/x2MSQqAMAwAvyI5G7DFBf2KeChtqgE3EhFF/LvFw
 xzmMPOAkjApdNkDQicrb2sSk2fgJ7eOhBySgy1saRKotx60BPRC7iCctxEDi2Idm7KwJvrKtpD
 qXSjy9Z/74X0/xvn9X2kAAAA=
X-Change-ID: 20241024-systemd-create-log-dirs-6f74021fc529
To: Changqing Li <changqing.li@windriver.com>
Cc: openembedded-core@lists.openembedded.org, 
 Esben Haabendal <esben@geanix.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729770070; l=1781;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=zKaWIy3Og+sN5X6y8roZltO1A9IJVDzUMzur7XA47uw=;
 b=HISJPxK8p2dfMhdPW3GO7QjcevqIRogF+75KlLHf5Edxw5UOS2x3dIDOVlSocUoX2bc6tS5W7
 oiaEdEw00dMDPuQpWbSRdGU5+HqiIeYJ+LkZjt4sB5qp0QMK7oMzdAo
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27437/Thu Oct 24 10:33:37 2024)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Oct 2024 11:41:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206292

Commit 18d46e11d85d ("systemd: fix dead link /var/log/README") broke the
default systemd behavior when VOLATILE_LOG_DIR is set to false.

By not creating the /var/log/journal directory, the default configured
systemd (Storage=auto) will silently revert to just doing volatile
logging (/run/journal).

The problem fixed with the above mentioned commit was specifically related
to configurations where VOLATILE_LOG_DIR is true, in which case it should
be perfectly fine to not create the /var/log/journal directory, so we
should be able to keep the fix in place, while not breaking behavior for
non VOLATILE_LOG_DIR configurations.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 meta/recipes-core/systemd/systemd_256.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_256.6.bb b/meta/recipes-core/systemd/systemd_256.6.bb
index 68f15ab065dd5985e4e5cefc2cd005dba5ac9c7f..88ee0c8a7f89726fc9be489f3fc419f9feb37251 100644
--- a/meta/recipes-core/systemd/systemd_256.6.bb
+++ b/meta/recipes-core/systemd/systemd_256.6.bb
@@ -254,7 +254,7 @@ EXTRA_OEMESON += "-Dnobody-user=nobody \
                   -Dsystem-uid-max=999 \
                   -Dsystem-alloc-gid-min=101 \
                   -Dsystem-gid-max=999 \
-                  -Dcreate-log-dirs=false \
+                  ${@ '-Dcreate-log-dirs=false' if oe.types.boolean(d.getVar('VOLATILE_LOG_DIR')) else '' } \
                   ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', '-Ddefault-mdns=no -Ddefault-llmnr=no', '', d)} \
                   "
 

---
base-commit: 8278d82d8203212bb159eb3805d4a5617c5370df
change-id: 20241024-systemd-create-log-dirs-6f74021fc529

Best regards,
-- 
Esben Haabendal <esben@geanix.com>


