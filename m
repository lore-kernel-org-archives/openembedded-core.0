Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A182EC61DD6
	for <webhook@archiver.kernel.org>; Sat, 29 Aug 2026 16:47:37 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69.1788022056431849238
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Aug 2026 09:47:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rXg6sdnf;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-90cd43bd740so17679326d6.1
        for <openembedded-core@lists.openembedded.org>; Sat, 29 Aug 2026 09:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788022055; x=1788626855; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KmTBlD+VQeF73Di56Uw/GSn9GTmQxV/lD9RUSgTBrow=;
        b=rXg6sdnfmR4kGkuDB07HznefxJDNDgwW2/qzggLIktfF1fDaxg6YHpNG/z+N4bS6g/
         eoQeb/I8c9BR+QZbARs5e9u4CqWnRKut/dX8nC3n9DYUiXiUoAf5WPyJ/Hi2b8VGc0BA
         uPljA9scHvkJ0X3TRTbF6IvmzsJbZF1Yb9zv8KBFqIcjttWj0mKqYzSl7naVT9qyiZTa
         1H00PBByaERK8+bJM4ZOBxKn7o0WgOGBF5/aTzCjH3RYA0aJKPi7o59/XwVNID9zz+Bn
         v7tGSrrpDRnmi6Z74SJjbamtZPPeB57igTPA+2dr6oy2Thv6YEoNhUjfk50F1FKI1aWx
         30KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788022055; x=1788626855;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KmTBlD+VQeF73Di56Uw/GSn9GTmQxV/lD9RUSgTBrow=;
        b=GhaJaQTkqJbGD+0sZpKYlFhl+SQGwzgRcu97rsoiIoEKvodE57Bi8qQZ5KIQRCGDmV
         7enJIODZkB9AJDr6A3VN9qRS+VXCOV0CPLEeXO4yvvBtb1mW4D4ORQB26WRbWvbpMpXM
         lckn6AzHjO1tLKn8jnAQBkZaHO5tK/YXKUVvqj3vAYqH+PhfjvxsKhjl0laqqMxJyhlX
         Sg0F7s/0xmGyfjF21yZfK5s7BQxqoPhkpSZlk5h3eqOFJ5vUu2HpMbifGtF3cJ2FwUGy
         vUKFPIVy3bC8BrL8FN6Nx3N5t+9HYcH5wjewYMWDkbxZ0zuuDME6H8E9kW8Um3STGHen
         KzSQ==
X-Gm-Message-State: AFuF++ldD2ooAMfhfpKuV7naj1Rh1tOMgQc/UfbdlArf3lXOyeibQJvz
	LiSR0JM36DtMYb21bFhFdIVR4og8Mt6P5a8n93nySP5A+VcIDDsdXAFIuI/lnZBn
X-Gm-Gg: AYBFou2JCAlkCPB569xhLcmXfovjb7tQq9Z0C27fd4C9+M+Dp3fJPQIV2x7/ZAEUeBZ
	oKHvj8/hoj4uvzVPM+aaUGp4whMZI46/MeoG8A/vFtLRj10wF6sHgo9pwM+FZS9YvJgywuEpsCk
	nhgUfKxkwkiVU2ow7Ntoy2O1oBL9QYCZZUP8Rv/VZeFA5c3FaDCLdMH7pivaQg2jbGRLMAcXBqM
	BM4XwOdgav0q0svEuhPQCmvgsLwCIhAXD1w5lw9+Fkm66fwERUgZgvy770QemVDEZ8bXESZOKVa
	Pv5SpF47XQ3hpLM2SX78hBk5ynR332PF9pkwCPj7S6Abb7sAemFcsY1+Gydqz75EU3xcwmBlgQH
	dfA5Lpvz9YcOBbeBeKkWqsIKrYHYiofEGhDucXdTo/7z54m4oEAQDrp3JSX4EHLEYY47TOZNNEu
	sB7zNETeI3eHn5Gazzh8dy9OW9rqXmRkX3PoET1aXCQ6q0IKWmIJduN+mu1dNkFh3Sg3e0x6SD7
	t4Q8vhFAizRmtBWCMSif31KJrGV5w==
X-Received: by 2002:a05:6214:401c:b0:90c:ae98:20d2 with SMTP id 6a1803df08f44-90ce0f1e729mr180211586d6.23.1788022055337;
        Sat, 29 Aug 2026 09:47:35 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90d98aab8acsm22721016d6.22.2026.08.29.09.47.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 09:47:33 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/sdk: check for pkgconf rather than pkgconfig
Date: Sat, 29 Aug 2026 12:47:28 -0400
Message-ID: <20260829164728.3089112-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Aug 2026 16:47:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244634

pkgconfig was removed from oe-core [1], and hasHostPackage() matches the
SDK manifest literally, so the meson cases ask for a package no manifest
lists and skip on every SDK. pkgconf RPROVIDES pkgconfig, so the
packagegroup dependency still resolves and nothing else reports a
problem.

[1] e32bf38fab8b ("pkgconfig: remove")
    https://git.openembedded.org/openembedded-core/commit/?id=e32bf38fab8b2ae417022a4dbd36f7e1ce52c206

AI-Generated: codex/claude-opus 5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/lib/oeqa/sdk/cases/meson.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/sdk/cases/meson.py b/meta/lib/oeqa/sdk/cases/meson.py
index 77864b2f8d36..7540d8ba5539 100644
--- a/meta/lib/oeqa/sdk/cases/meson.py
+++ b/meta/lib/oeqa/sdk/cases/meson.py
@@ -25,7 +25,7 @@ class MesonTestBase(OESDKTestCase):
             self.skipTest(f"{self.id()} does not support eSDK (https://bugzilla.yoctoproject.org/show_bug.cgi?id=15854)")
 
         self.ensure_host_package("meson")
-        self.ensure_host_package("pkgconfig")
+        self.ensure_host_package("pkgconf")
 
     def build_meson(self, sourcedir, builddir, installdir=None, options=""):
         """
-- 
2.50.0.173.g8b6f19ccfc3a


