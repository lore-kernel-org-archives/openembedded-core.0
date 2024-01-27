Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9F07C47DA9
	for <webhook@archiver.kernel.org>; Sat, 27 Jan 2024 02:38:29 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.8388.1706323101930187996
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 18:38:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=CuJs+nbo;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-5ce2aada130so649236a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 18:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706323101; x=1706927901; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ShVhgX8pa9Wg2hqrCn21gYdlFwZwO5VcJTocMpMT0lY=;
        b=CuJs+nboLn4USAF75Bz6onHtu8k+ytLut0vLm1EFu+YykH8m9G2GsbNEvVc+GbZHkM
         HZXYE6NfRy+DuX2ldhEUPkB3AnYMlF0tQbi7GpzRdR+cQO+vZ6dikY+rbr9QoPS15doj
         ZUOiSQQiVjTUBg/EeaOHkbdsXbVwXh96hRF6Um1Xa2klvz5lIT5dqLfzp4exBI+l2sTh
         aTA9kOpzB3oxDy6n0iUb4jKQFsa8Ch5zHR0zUG8FY/hTZPnbqRit+majN0CtHsqzx/l7
         coMfOEm3UH9/SGuTRVrVKSVt7C0hEHmpIsMdnmysr2wQobhrul2aibNnXo4GMLAfEOBv
         WTXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706323101; x=1706927901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ShVhgX8pa9Wg2hqrCn21gYdlFwZwO5VcJTocMpMT0lY=;
        b=rcobrsBL0vbnPpP6PzlHiPtRezsQIZgWoMj/nvISfQYICXRXKEiJYUpFctMnRpRpf+
         gwooE4KjQ+0/KR0DEKmBtzwyg3haA5OpxjrWyk9Nh0h0jMTa1XIXGatK9PeKu0ZoFSUu
         KWCh3WQ7loHY3bHGBKrBVPvd8myfQrGlOVzCpAKjPXqouDXn6GVcKrc+zvgjISjzfHLP
         kf6XVr/KkGIoGSBYANSyIY6BFJbqLc7yIMkwUKVLTBrOMDNxsSvKH0B3LLYrxUxf+vgE
         Do5bGLgI7CgpI2NtF91gXgdojIUVR2gwvhDBvzSDNpmEFsItLYrfuMMmXLw9FINTj3XC
         5VOg==
X-Gm-Message-State: AOJu0YxPyiyj2xyZTY4U4Fr+ouRccW1ub2cqiZu/RZKIw3Xnex7nbEzx
	8d8qbohLi4GAHj0XhK7ZV8xrTtQWc7g7rxkKznYXzYvXeDBMjcHmJvSEdDLmGa6z5Nq4Uu8KQl7
	dZ3UCvA==
X-Google-Smtp-Source: AGHT+IGm+pvilzI/TTNLmxI24ZLXvkO1qp/DGPQo3oWBKqz9f3jQUyVXb3UHXpN+OmypaXL08VjviA==
X-Received: by 2002:a17:902:ced0:b0:1d7:3adf:b103 with SMTP id d16-20020a170902ced000b001d73adfb103mr549120plg.114.1706323100770;
        Fri, 26 Jan 2024 18:38:20 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id r8-20020a170902be0800b001d7405022ecsm1547045pls.159.2024.01.26.18.38.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 18:38:20 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 23/23] package.py: OEHasPackage: Add MLPREFIX to packagename
Date: Fri, 26 Jan 2024 16:37:31 -1000
Message-Id: <a27983e0b6bde730fe501c9931119bf18b2c376b.1706322780.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706322780.git.steve@sakoman.com>
References: <cover.1706322780.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Jan 2024 02:38:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194432

From: Saul Wold <sgw@bigsur.com>

FIXES [YOCTO #12342]

When testing a Multilib image, the package manifest list contains
the fully qualified package name which includes the Multilib Prefix.
This patch adds the MLPREFIX to the package names that are passed
into the @OEHasPackage() decorator to ensure the set isdisjoint()
matches correctly.

Signed-off-by: Saul Wold <sgw@bigsur.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit ab87e4f92305b2a664cc473869e1615cf56e0936)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/runtime/decorator/package.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/runtime/decorator/package.py b/meta/lib/oeqa/runtime/decorator/package.py
index 8aba3f325b..b78ac9fc38 100644
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


