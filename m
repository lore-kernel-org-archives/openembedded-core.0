Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52BE1CD5BAC
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 08:21:23 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7382.1779265272559084860
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 01:21:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=hiO7ElT+;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-45e7c636e74so2188919f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 01:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779265271; x=1779870071; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FyisB7/NWet7jggIZ/bYjpO3yAC66N/q+/ldLyGbY7I=;
        b=hiO7ElT+x+6ltG3EO7n4mrKtVa+gE2gFcZzvvmVJbfU5Zo6ixDna3mq5NuxX064BCV
         e7oPPqpwGbrStxpHoSmVkMXOwjVwTylvnap4B3NJckMeUequdogTUh4xS+KOh2FuCRcY
         NYeKV2hCXEedNb500VSc7Gw871tzVpyA8Y0mc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779265271; x=1779870071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FyisB7/NWet7jggIZ/bYjpO3yAC66N/q+/ldLyGbY7I=;
        b=equ5nzu0aj/IPcABCZ9OtB6lN+DcCPlI/JXAN1VA4T5Dz2fl87AvPh7rY7PUAw1yaB
         u2/LgH4sbBFr16Ae/6K1LzqDe5yu+YH1uIvCGLJn+X7tWWzIW10bE53QuX4lGuvfw1to
         0DoUeHzMWQZuVgmLMszb+xUm/sGVvxFwQMDzv22qgcVlNU+VUXN0tfqZHSEYVc1rc7lU
         bUb71iII+yQrmmde/l+WsJ2ZoSQugx1vnsc4+l7IKt0SGlssKrGVzN1QNjShDLzpEVXv
         EjqlAqck8+K0J/o0VZH3OVCrQg7tAtVgUnod74DXG0Agf+ojVkriamLjwUMGT4qRUh4U
         xkSA==
X-Gm-Message-State: AOJu0Yw5GAC73aswDkPUMrJ917orRu+fppNQjnTEevYLVMDoKvp8usf8
	uEZbh9yzyB+fhpMEC4YoWMgHm2nOyCfvqRQVwkW+n5uIH+WikWL3g5lfdtoJXbw/L7pDWQNMein
	R7/Wi
X-Gm-Gg: Acq92OHFwgDz606GacezsQyXZlSKJi6P/OFG/Sq3gDDOQVP4KAthuZj4GLkGpC1yboi
	MhrHMAH3E9qUWiJz+XahLBvhBdt86O7NfhR9ucRpu7WG4eVr5UlQDcMs8lJMY1wnkPBGLcAgPmq
	E2S4SPKhr3tlmh8wDBGZMXa6ofNqHfT3P3isGJnB7lUt1Pj/U0AjRART4ETcvi5EKIi+1mpWu11
	tQUXJCGQ9xC9oSqQeOaAILn0Qv7xIYy1xkpJCswGZcOJP7P5r4ZX2SXwf2+ur5f4jn2xf0dkPIy
	6igzspr8U/j2OPGyXjWoFLq3Awe1165kFKUGilovG8a3WxV3Lyu3tbtkHr1Do94z9izRas1xOhW
	qStq4kdOAZmOhAvKpbSpRxlgICu5IFVdtHn5oI+lD9wgs6N8YAgDXfS4N46lsNsL7XvO8ZoIdk/
	tTPG7Ym0CqVFIKOt4BLSNPma9VbHjU6acyndR7KkGygwga6tP4fGFITqcXiwwPkb4mI6a2l/dNf
	c7U8rY6hjxnCyFW8QK1wZGCqFY9So2dd/+bkZQRs1Jes7bAeQ==
X-Received: by 2002:a05:6000:18c6:b0:45e:73a1:8db5 with SMTP id ffacd0b85a97d-45e73a18e91mr16992063f8f.40.1779265270674;
        Wed, 20 May 2026 01:21:10 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-250c-63aa-0256-2b9f-d16e-d784.rev.sfr.net. [2a02:8440:250c:63aa:256:2b9f:d16e:d784])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec39ff1sm56350642f8f.10.2026.05.20.01.21.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 01:21:10 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose v2 17/28] oe-pkgdata-util: fix runtime-rprovides handling in lookup_pkg error path
Date: Wed, 20 May 2026 10:20:18 +0200
Message-ID: <ccc2ee6169022751fff9732007c6868c46fe378f.1779264709.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779264709.git.yoann.congal@smile.fr>
References: <cover.1779264709.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 08:21:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237416

From: Thomas Perrot <thomas.perrot@bootlin.com>

Commit 678c1c207731 applied os.path.isdir() + non-empty check to three
functions, but the error-reporting path in lookup_pkg introduced by
commit 46ff3a8d2c18 was left using os.path.exists() + os.listdir().
This is fragile: it raises NotADirectoryError if the path exists but is
a file, and silently falls through to the generic error on an empty
directory rather than skipping the rprovides block.

Apply the same pattern used elsewhere for consistency.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dbca656205a7d9a9a9b0aa25b4ad6562af9c5180)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/oe-pkgdata-util | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index 904008bd029..acefae24f3a 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -239,8 +239,8 @@ def lookup_pkg(args):
         missing = list(set(pkgs) - set(mappings.keys()))
         for pkg in missing:
             providepkgpath = os.path.join(args.pkgdata_dir, "runtime-rprovides", pkg)
-            if os.path.exists(providepkgpath):
-                providers = os.listdir(providepkgpath)
+            providers = os.listdir(providepkgpath) if os.path.isdir(providepkgpath) else []
+            if providers:
                 for provider in providers:
                     if provider == pkg:
                         continue

