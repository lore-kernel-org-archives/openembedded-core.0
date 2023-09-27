Return-Path: <sean@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70645CD37B3
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 12:58:22 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web11.16748.1695819498441435255
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Sep 2023 05:58:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=0DUtAcKN;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: sean@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=XP5yj6H0VqHq/daL1aNBc6/PPQyKLbkWOqpgxev7jNY=; b=0DUtAcKN5P+wBU18OONykTzenN
	PAtIo9rw56k0qhw2rJDdcIAVP32B6LSswihvBc1HYvUFdCwUaEQT5GbQy0y0RE9TXaXKxZREbjboQ
	ZsAsZRN7RLHppqZjD/7f6HhpdUWT/2pg3QzJbB+BfZQ4Si/hKQPdzULRRy4fYZmySPd/6ZEflswfZ
	3zQczezXEo8lslqce7zq2qVIFMWQ35IGOQidKCm658oKD4PmmcBq3H0lRtvSfxrF+56u9d3z3RRXI
	L3m29bkfpJs5IgIXZ+vT9XtfJg9Qz/yAZ3XfMhi81ofmCAonQLdi1qv8eZb+u1+HZ2VIFxN3AkmZI
	xedVpI2g==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <sean@geanix.com>)
	id 1qlU7L-000Pq6-2u; Wed, 27 Sep 2023 14:58:15 +0200
Received: from [185.17.218.86] (helo=zen..)
	by sslproxy03.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sean@geanix.com>)
	id 1qlU7K-000UCq-Rp; Wed, 27 Sep 2023 14:58:14 +0200
From: Sean Nyekjaer <sean@geanix.com>
To: openembedded-core@lists.openembedded.org
Cc: Sean Nyekjaer <sean@geanix.com>,
	kasper@krinvent.dk
Subject: [OE-core][PATCH v2] gcc: depend on zstd
Date: Wed, 27 Sep 2023 14:57:59 +0200
Message-ID: <20230927125801.3962397-1-sean@geanix.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27044/Wed Sep 27 09:43:59 2023)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 12:58:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188314

Add zstd LTO support for target and nativesdk compiler.
This also brings gcc into sync with gcc-cross.

---
% x86_64-oe-linux-gcc -v
[...]
 Supported LTO compression algorithms: zlib zstd
 gcc version 12.2.0 (GCC)
% x86_64-oesdk-linux-gcc -v
[...]
 Supported LTO compression algorithms: zlib
 gcc version 12.2.0 (GCC)
---

Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
 meta/recipes-devtools/gcc/gcc-13.2.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-13.2.inc b/meta/recipes-devtools/gcc/gcc-13.2.inc
index d96f3171e4..359db1e278 100644
--- a/meta/recipes-devtools/gcc/gcc-13.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-13.2.inc
@@ -10,7 +10,7 @@ BINV = "13.2.0"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/backport:"
 
-DEPENDS =+ "mpfr gmp libmpc zlib flex-native"
+DEPENDS =+ "mpfr gmp libmpc zlib zstd flex-native"
 NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native flex-native zstd-native"
 
 LICENSE = "GPL-3.0-with-GCC-exception & GPL-3.0-only"
-- 
2.42.0


