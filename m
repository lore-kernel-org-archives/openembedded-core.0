Return-Path: <pistora.tobias@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 139C8C98311
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 09:24:08 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3723.1790241841586498254
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Sep 2026 02:24:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=tKAuPl7v;
 spf=pass (domain: gmail.com, ip: 74.125.225.76, mailfrom: pistora.tobias@gmail.com)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f633cd78so1084285f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Sep 2026 02:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790241840; x=1790846640; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2rRRWArLE/m6FFTRWC7jJ7uLpQL1S+oZ4BpTZsjk5Q0=;
        b=tKAuPl7vsIf+UiFGd8MInxIj4UV/sHodhVSl3GQS+ZY6Ixub2ff5atV7HLSk0OE35E
         h0SutCaKgfw0ifYi19es1jtGsUWP4Y3Fh5bg0S57sG9vp75Ywva5bUnuZbCV5rXsBYV3
         1nVHaPbPD75gvJsN8h0f6PRYqkfCkayWhdGJiIesCj0NEuawywoFh9rkbJNzWsoBHE6Q
         SwtomFPZrX0Lnui7rq2K8wmh93JMuHhlT6pWjxqiKUgj+OSBKyfAyjXtCW2Dw79X3ykB
         7BX+K+dWC1jo0jX29hAX/7l30j1ShAxLwBH990KhLL2RWnBIQsHfzNygBNpOIUzlXDL8
         vfQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790241840; x=1790846640;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2rRRWArLE/m6FFTRWC7jJ7uLpQL1S+oZ4BpTZsjk5Q0=;
        b=TEklHcqU5oChZaif+TGym/JQ6Iw1uoAvAMbVMNqlkF8o6BaMkzrEaFcr84F4NFu04j
         I8vvaNuZDJWPSZR2pSFgfiujGdy7I4acExqVwuUYxY3YVuEkUL7buq5OVe6ex7b9lqvp
         vxv6udhRNmAqRVuOP9Y9T8/s00IATokekfYFgM63LzJyCIu/ol0S1wF/apXNeKdSPPGQ
         I66GUDrAjwVd1tN6d0J7FNTKAz25Kl/2l9uRpjqHumuCNZjQU45TYRc8rcpRXkwtuPJv
         zWu2Tref/IobViLh4zEpHmvL5l8C6YndxXZKN/PzC8Fci+j6YNSkli93IZBZoTc/ezU8
         vw8Q==
X-Gm-Message-State: AFuF++kB5ZewCwjVDSvmrYPOZ8SbMCzEPRXlzUZ7/HnJHtOQ7piNCHh6
	9AmRTsYGmE9bM88VPYAxBftQQ/kKsMwpVJKGlDZWX0EZDEhU8JFGpjF+Bgtgtg==
X-Gm-Gg: AYBFou1116A2LI/EoRabZwsGWsVx4yhIPlgVGzpglcifddyIDxgHKo68O0gC6E6iAp4
	zVStB4pNuetWMVGKwiRfosG8t1sTXtr0Dq0W/qRFpLFJnVIkFWMx3drdIguGkvNiaGETbH1WvwQ
	195gHXF2M/ofzFo8XukVy251nYSnz6/QmgtN74vLFOWEcM1xMiorouuMmyaJimDQ0QaJf0LDnKa
	WiGKVqlx6prqSZQSMxPo0SPFfKyIYSg7fawabaD3fBfC92X56eS1PA7RpxwfjC67OegMXR6Q2b0
	XGyf2xl7PIvL/vplvQOB/hyXD8os4KzsoZY2QANqUc2zNUjAEe6e1/ZxnwbYfYqCs0fxUK6Ztz4
	8Se2co2cktR4M4zMvFdtWTqSTHh411/67Bf1Ux7obkLczfDhe+hXfPBY+TEcd2hL27lZg75tNcZ
	gzSvlEfqQmtFx7GulRr2QLBQGtCcMLiLN+WbOKggwY9pGYEXeC8mXqg8J0NNlJCtzaAjEvrFHGL
	lpLEoe1sCw64tq03NDa3wbo2BvWgU1n
X-Received: by 2002:a05:600c:6085:b0:49c:eb04:1c49 with SMTP id 5b1f17b1804b1-49fe66cccd4mr32535025e9.13.1790241839678;
        Thu, 24 Sep 2026 02:23:59 -0700 (PDT)
Received: from se-pc-pto1.wien.schrack-seconet.com ([81.223.165.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5de4de4sm56915915e9.8.2026.09.24.02.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 02:23:59 -0700 (PDT)
From: Tobias Pistora <pistora.tobias@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Tobias Pistora <pistora.tobias@gmail.com>
Subject: [PATCH v2] kernel-fit-image: remove fatal error when .crt file is missing
Date: Thu, 24 Sep 2026 11:23:27 +0200
Message-ID: <20260924092327.26115-1-pistora.tobias@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Sep 2026 09:24:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246575

Fixes [YOCTO #16427]

The minimal requirement of mkimage for signing a fitImage is a private
key file (.key -> using -k). Passing a public key file (.crt) is only
necessary when a key-destination is provided (-K). The -K option is
optional in the kernel-fit-image signing process and can be passed only
by the user via UBOOT_MKIMAGE_SIGN_ARGS. Therefore, providing a private
.crt key file is optional and should not cause a fatal error when
missing.

changes in v2:
- fix shortlog format

Signed-off-by: Tobias Pistora <pistora.tobias@gmail.com>
---
 meta/lib/oe/fitimage.py | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/fitimage.py b/meta/lib/oe/fitimage.py
index 1ac4b2c59d..484e5c5ee0 100644
--- a/meta/lib/oe/fitimage.py
+++ b/meta/lib/oe/fitimage.py
@@ -593,8 +593,11 @@ class ItsNodeRootKernel(ItsNode):
             if not os.path.exists(key_path + '.pem'):
                 bb.fatal("ECDSA signing requires '%s.pem'" % key_path)
         else:
-            if not os.path.exists(key_path + '.key') or not os.path.exists(key_path + '.crt'):
-                bb.fatal("%s.key or .crt does not exist" % key_path)
+            if not os.path.exists(key_path + '.key'):
+                bb.fatal("%s.key (private key) does not exist" % key_path)
+            # public key is only necessary when passing -K option to mkimage
+            if not os.path.exists(key_path + '.crt'):
+                bb.debug(1, "%s.crt (public key) does not exist" % key_path)
 
     def run_mkimage_sign(self, fitfile):
         if not self._sign_enable:
-- 
2.47.3


