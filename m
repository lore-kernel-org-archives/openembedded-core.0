Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ED3CC5DF6D
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:03:44 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2411.1787127706704681446
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 01:21:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=P+e83fmO;
 spf=pass (domain: kernel.org, ip: 172.105.4.254, mailfrom: devnull+jonas.juffinger.liebherr.com@kernel.org)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1F0EE60A59;
	Wed, 19 Aug 2026 08:21:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C98E0C2BCB3;
	Wed, 19 Aug 2026 08:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787127704;
	bh=3TH1L9KWRSbhNKdTil4qEOF3xpni0XKrQyRF/LPTgak=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=P+e83fmOKXeIrTD6uouTSaiTG0YOpZA7qFDm0LgBpYNZw9xccJzK4YYkwlcDBy7iE
	 zaqhhsndMpYIKL+Xzsn5lXwCZkZDU1wewHpNq144HsK5Yds1F9FDgZ7RwOJ00ExbEe
	 jSROonuhB6oLnUg8LirsP47cY1qSdkSBbaCskj8rVc+ghxMfP3u4iRRC29iyfCOmMy
	 kWc9g3JuPuF8QKXVou4FMmY30dHn0vJ8LfiSnHPhHiLgEVIlE5fJtuSLv7GNiehm2g
	 ZYusqDXMqyAfsBIVr0aUndLEBcQBuyBStDdszNQYK2UGMGAh7U3pdJQODvfOqESt/b
	 HDR15LCB4EIdQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5343C5DF85;
	Wed, 19 Aug 2026 08:21:44 +0000 (UTC)
From: jonas.juffinger@liebherr.com
Date: Wed, 19 Aug 2026 10:21:37 +0200
Subject: [PATCH] kernel-fit-image: Don't add hash node when signing is enabled
MIME-Version: 1.0
Message-Id: <20260819-bugfix-dont-add-hash-node-to-signed-fit-images-v1-1-c0ffc1a0fc17@liebherr.com>
X-B4-Tracking: v=1; b=H4sIAJBnhWoC/x2NsQ7CMAwFf6XyzJOSDED5FcSQxm7igQTFBSFV/
 XcixhvubieTrmJ0m3bq8lHTVgf400SpxJoFyoMpuHB2Vz9jeedVv+BWN0RmlGgFtbFgazDNVRi
 rbtBnzGLwIS4uzeHik9CIvroM/T+8P47jB6lowVmAAAAA
To: openembedded-core@lists.openembedded.org
Cc: Jonas Juffinger <jonas.juffinger@liebherr.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787127703; l=1359;
 i=jonas.juffinger@liebherr.com; s=20260615; h=from:subject:message-id;
 bh=dtNhGWXLaF9vg94YLb4ySsWG4N9Rg6SxtwNTftjmrlU=;
 b=A5p/LCa7sXh/hlb7HsIH3pCpPLkaL8j0mC8eWHaPXzZYxvkuGlsD0/Le6/va6Dx4MxUFCf+xK
 tgWByAHxK+3AnKb+WAo4ruS7QmHnkryZzLpZIUfLHgRnn9twpPIcMW9
X-Developer-Key: i=jonas.juffinger@liebherr.com; a=ed25519;
 pk=57Vzs2aKTP3E7TDrBuZMQibGR+Koattc4oIhiMOs3FI=
X-Endpoint-Received: by B4 Relay for jonas.juffinger@liebherr.com/20260615
 with auth_id=821
X-Original-From: Jonas Juffinger <jonas.juffinger@liebherr.com>
Reply-To: jonas.juffinger@liebherr.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 09:03:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243719

From: Jonas Juffinger <jonas.juffinger@liebherr.com>

When configuration signing is enabled, mkimage does not fill
the hash node even if it present. This causes the verification
to fail with a "Bad Data Hash' error because the hash exists
but it empty.

This patch adds a check to only add the hash node if signing
is not enabled.

The example FIT from the official documentation also shows
the configuration field with only the signature, without the
hash field:
https://docs.u-boot.org/en/latest/usage/fit/signature.html#signed-configurations

Signed-off-by: Jonas Juffinger <jonas.juffinger@liebherr.com>
---
 meta/lib/oe/fitimage.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/fitimage.py b/meta/lib/oe/fitimage.py
index d4dacdd508..142a5d60f7 100644
--- a/meta/lib/oe/fitimage.py
+++ b/meta/lib/oe/fitimage.py
@@ -485,7 +485,7 @@ class ItsNodeRootKernel(ItsNode):
             f"{default_flag} {', '.join(conf_desc)}",
             opt_props=opt_props
         )
-        if self._hash_algo:
+        if self._hash_algo and not self._sign_enable:
             ItsNodeHash(
                 "hash-1",
                 conf_node,

---
base-commit: 6f7a806ece411ab32e4b1c08a0299400bdf3b588
change-id: 20260819-bugfix-dont-add-hash-node-to-signed-fit-images-12ab0c9271ce

Best regards,
-- 
Jonas Juffinger <jonas.juffinger@liebherr.com>



