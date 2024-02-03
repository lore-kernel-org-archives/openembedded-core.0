Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 839FCC4828F
	for <webhook@archiver.kernel.org>; Sat,  3 Feb 2024 19:15:23 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.23488.1706987715947505068
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Feb 2024 11:15:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=kRhuep38;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-5d4d15ec7c5so2960317a12.1
        for <openembedded-core@lists.openembedded.org>; Sat, 03 Feb 2024 11:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706987714; x=1707592514; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BGoMUgeE2H1N86lzSZIlwX1TG74eWmvSjKrIf4xC8PI=;
        b=kRhuep38RSzDaKV3pxO3sGkTDAT/FrByovUPDa9rhihTWDrnYlY3G0R/EOvLUAuavF
         9MBy1B+z0VbFg9ra/iQbXoldksuKYyzbHVleDJ7IzaeDJ9SMj/8eU1ZuRcVAPh3g0a0w
         1+zrHoRRy6ll1rGwjBRUr3ULgDTp0HFp4telNT/2SjW3f0uSVVFy1PdTsdKz2PYSU9rR
         0VdhfBHoUZr1OrNVp7f9+RDq2VGHg5RN+T3IcYMH3Hc3UYMgTh+EWaNqJAOHgWJnCQCg
         TZcKPYvsY4WVz9NqTGHremXmTFpyJF81CCAlXiyMao1/5CuTShS2aZ2PJqv2UqsFhuf/
         e/mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706987714; x=1707592514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BGoMUgeE2H1N86lzSZIlwX1TG74eWmvSjKrIf4xC8PI=;
        b=b3PBOwwnJj32g9gUEjEd8CBLs71Saqy1T0qetB5o3p7g0zggFBBRstsiKDx33BaEaM
         EFTmoM6m7qycYA0/GXcvN0m/sxAUTrY3BQRXszXRUZ74CgDt1fLV1J2WHA7hd9JKEGpn
         +fo0J4QtOEdrE3AY+tNqHFCi+WBwspnBZzQxS1ZL+z/GhnkJy84DAazuQ0jESDoy8Hs/
         OLMR15MlTMY1PTbUkoGircUMTC+sYw3inNkXXKdjcXysLVICg4r6awq4M589CI/v3r6V
         JPFT4Ima57rDz7jYbv3mKeLse+WxGFtOWNlZ3M1xzWB9zKG5nvo3zdnMGVTDooyQiWIp
         2g+g==
X-Gm-Message-State: AOJu0YypIOAZZr/qTbBB8qSS7tAyU1u73CkmPuHs/q9yw3iH2OZW9dPQ
	qR92xSsdkXZCuvIXjtm1RydfkuWLkaYIixnEjvNXiw0nlFXqqryMFh4FjSdLNXZAQWBDY3LTOkW
	ccK8=
X-Google-Smtp-Source: AGHT+IHwIAEuZyCC+W0XEdggboZjRmR68siYuwvkw7bI7qNmQ+cu11GnOie2jVN2t/ItYnpkZRuq+g==
X-Received: by 2002:a17:902:e548:b0:1d8:d56e:5dee with SMTP id n8-20020a170902e54800b001d8d56e5deemr16395618plf.1.1706987714607;
        Sat, 03 Feb 2024 11:15:14 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id w63-20020a17090a6bc500b00296443780d7sm2376863pjj.47.2024.02.03.11.15.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Feb 2024 11:15:14 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 14/15] rootfs.py: check depmodwrapper execution result
Date: Sat,  3 Feb 2024 09:14:41 -1000
Message-Id: <2d8e913e2bfbb4ccbdf3eb747aab46fc38cf23e7.1706987549.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706987549.git.steve@sakoman.com>
References: <cover.1706987549.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Feb 2024 19:15:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194858

From: Yang Xu <yang.xu@mediatek.com>

The execution result of depmodwrapper is not checked which makes depmod
generation failed sliently and hard to detect.

So check exection result and stop building if depmodwrapper failed.

Signed-off-by: Yang Xu <yang.xu@mediatek.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 2f88e7d331390c6aaecc4522253e24791aec299e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/rootfs.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 1a48ed10b3..3f27164536 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -349,7 +349,8 @@ class Rootfs(object, metaclass=ABCMeta):
             bb.utils.mkdirhier(versioned_modules_dir)
 
             bb.note("Running depmodwrapper for %s ..." % versioned_modules_dir)
-            self._exec_shell_cmd(['depmodwrapper', '-a', '-b', self.image_rootfs, kernel_ver, kernel_package_name])
+            if self._exec_shell_cmd(['depmodwrapper', '-a', '-b', self.image_rootfs, kernel_ver, kernel_package_name]):
+                bb.fatal("Kernel modules dependency generation failed")
 
     """
     Create devfs:
-- 
2.34.1


