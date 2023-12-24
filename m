Return-Path: <sgw@bigsur.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C4CAC3DA6E
	for <webhook@archiver.kernel.org>; Sun, 24 Dec 2023 01:12:14 +0000 (UTC)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
 by mx.groups.io with SMTP id smtpd.web11.18352.1703380333050319000
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Dec 2023 17:12:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bigsur.com header.s=bigsur.com header.b=HtjIgQRu;
 spf=pass (domain: bigsur.com, ip: 209.85.166.178, mailfrom: sgw@bigsur.com)
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-35d725ac060so13774455ab.2
        for <openembedded-core@lists.openembedded.org>; Sat, 23 Dec 2023 17:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bigsur.com; s=bigsur.com; t=1703380331; x=1703985131; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pyn6lWQoxx26GAt6z1LAEZtcNDVI6N+cexX/ARWim2E=;
        b=HtjIgQRufsElWEOQKgdKrQxmHKwd8IBvARXikINGDSXc8F8GL4os8q2TAogaBJsodX
         iLIIa8/CxN6QkfWuljmZzflOzSOWexHZ+BWBL03InWUz3M6ofnpJ3exr5CdcfnEyiwgQ
         m6CWjhRwAxj8V7TmhO3D+120GzgUVh3woYLTU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703380331; x=1703985131;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pyn6lWQoxx26GAt6z1LAEZtcNDVI6N+cexX/ARWim2E=;
        b=p7MITKfapuP8CKILhqlNm0RlqwXtLn8SbjlpzCnt8JwzNYlqt9JFfDtKFYFtUAyaFT
         v35725aWRkPHhbszdcfI2eiJMW3orlYRywhbAysMcwJrHnnFtod+x0in//WV/Hsvq249
         TwYvjozacVqwwAM2OYWa8Kv+/IP/1CjV+5N1P3+SYMgwUiWHWO4dX6A8wOmBaLv7sRbv
         DaRZVrJ1JwlzG4qCpA3OedsX+cnIzu610a0mFj6xHHpahZpcD9CednN/qN9JpoKCXVC8
         mSsdavzsOz63r9IXvQu9yPY9MxEMmBxtRytVtnFi9KzPT5FXy073I6pmFNT4JJcpeoLR
         F1uA==
X-Gm-Message-State: AOJu0YyMbL94xBfI0BN+uiO1Ny1ngxrGOlr7uVi9EthWXyJviBGxWvSr
	sSJe3YXuA3CxTE6cxKeYUxLWb/QW1ojupaVDSVumDrLxZ4jt
X-Google-Smtp-Source: AGHT+IE7Rb53o31dZW1NMhHHNwLSJnannImONgVxZy454Pu1MnRRK83PXD05JWuyAVESDmRDg4VAZg==
X-Received: by 2002:a05:6e02:1561:b0:35f:ebc9:8229 with SMTP id k1-20020a056e02156100b0035febc98229mr3137795ilu.64.1703380331299;
        Sat, 23 Dec 2023 17:12:11 -0800 (PST)
Received: from framework.localdomain ([69.9.134.55])
        by smtp.gmail.com with ESMTPSA id g12-20020a170902c38c00b001d3985a593esm5649003plg.172.2023.12.23.17.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Dec 2023 17:12:10 -0800 (PST)
From: Saul Wold <sgw@bigsur.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Subject: [PATCH] package.py: OEHasPackage: Add MLPREFIX to packagename
Date: Sat, 23 Dec 2023 17:12:07 -0800
Message-Id: <20231224011207.3099245-1-sgw@bigsur.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Dec 2023 01:12:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192889

FIXES [YOCTO #12342]

When testing a Multilib image, the package manifest list contains
the fully qualified package name which includes the Multilib Prefix.
This patch adds the MLPREFIX to the package names that are passed
into the @OEHasPackage() decorator to ensure the set isdisjoint()
matches correctly.

Signed-off-by: Saul Wold <sgw@bigsur.com>
---
Tested with a lib32 image and without

 meta/lib/oeqa/runtime/decorator/package.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/runtime/decorator/package.py b/meta/lib/oeqa/runtime/decorator/package.py
index 8aba3f325bc..b78ac9fc388 100644
--- a/meta/lib/oeqa/runtime/decorator/package.py
+++ b/meta/lib/oeqa/runtime/decorator/package.py
@@ -38,11 +38,12 @@ class OEHasPackage(OETestDecorator):
         if isinstance(self.need_pkgs, str):
             self.need_pkgs = [self.need_pkgs,]
 
+        mlprefix = self.case.td.get("MLPREFIX")
         for pkg in self.need_pkgs:
             if pkg.startswith('!'):
-                unneed_pkgs.add(pkg[1:])
+                unneed_pkgs.add(mlprefix + pkg[1:])
             else:
-                need_pkgs.add(pkg)
+                need_pkgs.add(mlprefix + pkg)
 
         if unneed_pkgs:
             msg = 'Checking if %s is not installed' % ', '.join(unneed_pkgs)
-- 
2.34.1


