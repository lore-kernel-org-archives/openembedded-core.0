Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C7FAEFD20B
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 08:16:10 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41235.1772007368032292289
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Feb 2026 00:16:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=k6LV73Tx;
 spf=pass (domain: konsulko.com, ip: 209.85.128.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4807068eacbso49720725e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 00:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1772007366; x=1772612166; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tUB1aWjwcKX2H7HbPcqM3ffqi0QQiPnGbF2ANklsL5I=;
        b=k6LV73Txpvs9CbsYPbxK1lbNcNp0qTt4RYcw66t1O4tuN1ovrW0Viyy/X6rk1/O1BA
         Mzz+D+PdgD/PGzlLJrFvNrppQ6DgjiDdKV8AHlsYMP1ggqKMhKoAn2B/RbPj1bRYbmba
         89iSDuWyzun/SNSsBLP/fgGapANtGcculAITM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772007366; x=1772612166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tUB1aWjwcKX2H7HbPcqM3ffqi0QQiPnGbF2ANklsL5I=;
        b=UX5dFNXGQzTJPvy+vJsgBJwjVSZuqBsaZ+6pSOYQk8TThWT1xmRD0Kx+0OTlo3BLy0
         RqHHIRnUxr6XvyhLqPF8gzNdPYMRwla5kkdB2/HMgrKghRttHcUTIGxduFJQUJqkjrGv
         ZhtZMlL7QawoUaVH4/MAJ/E+CIaRllsFiiKFyQszY89ki93QKS7PjQbdZjgMCkBZxsDP
         KvK6NypVOOx60r+jlSqW4qanME7IdtKjC/M04VEE85BkcgpuN0PSTp7qLq2iU8S+gvNH
         3nmFdUn0r6Vuc1ugMEOKM5ZyppHYvlJHmNrtiH8Ka5bTMH8zTUO7osZdR4usj6qKuKdt
         ufsQ==
X-Gm-Message-State: AOJu0YwnoHx0W4mkuREYBlMNT+Qyn/t4dwNvbeWuIXDrNjjUMO/EUVH/
	oFeK9TLigpC5EJUg/oBnrC7gBkchvCHX9fnDGld9RH1q4UCNbjYZkyO4mCG2QcLLjqYBkrWAOHc
	ZSGAQ
X-Gm-Gg: ATEYQzw4ztca34NZhqeh6pXJrzrzHVFQLYwcSkzJFRHdv7CQKdYfkqPjOByQJkZl2i3
	/94XMxUUlwEEOTEe/iaXlOvllJl+XFqoCL40Xr2maGO9QXU6w+Q6CSf3u9pZAaLDbMvynqrLuZG
	EU7TcorJJEO6UFJK7uMGg8yu7EK1nwoa+4/ZesM2gU0cqz24Xx70TszMyPJUpQF5DU5kZwEs11K
	yDXlGyxCk9ZBGVVWqcLTvJ+fGz0HP2R0R5TepkpnERgc3qaNDWrqWCs3A1spqOIReVuwHhVwAFg
	EGCPfJCTt5VqmOW8IDnawRRrgeYy4WNWJTDaPBWMJEp2aOLOga2hfBocIEnodcjd+bZf4kP9zJ6
	R6AlcIWY2L1wN9LVnSTQDf5DBwkTZyt0xKC4Ai/H70zrM9xdw4HgTj2dpasC09cO2ISfQEMA3mN
	KYGnbgE2KzMfSrg6gRbUvYFvVBMc2TOupXKUccskXoBP34tTs=
X-Received: by 2002:a05:600c:3f05:b0:47d:8479:78d5 with SMTP id 5b1f17b1804b1-483a95aae85mr271201385e9.7.1772007365850;
        Wed, 25 Feb 2026 00:16:05 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd6f3124sm53264195e9.1.2026.02.25.00.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 00:16:05 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [PATCH] python3-hatchling: Upgrade 1.28.0 -> 1.29.0
Date: Wed, 25 Feb 2026 10:16:01 +0200
Message-ID: <20260225081601.1429045-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 08:16:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231940

Upgrade to release 1.29.0:

- Source Date Epoch no longer fails when set to date before 1980.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-hatchling_1.28.0.bb => python3-hatchling_1.29.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hatchling_1.28.0.bb => python3-hatchling_1.29.0.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-hatchling_1.28.0.bb b/meta/recipes-devtools/python/python3-hatchling_1.29.0.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-hatchling_1.28.0.bb
rename to meta/recipes-devtools/python/python3-hatchling_1.29.0.bb
index 6be0de39a5..080a954f7f 100644
--- a/meta/recipes-devtools/python/python3-hatchling_1.28.0.bb
+++ b/meta/recipes-devtools/python/python3-hatchling_1.29.0.bb
@@ -7,6 +7,6 @@ inherit pypi python_hatchling
 
 DEPENDS += "python3-pluggy-native python3-pathspec-native python3-packaging-native python3-editables-native python3-trove-classifiers-native"
 
-SRC_URI[sha256sum] = "4d50b02aece6892b8cd0b3ce6c82cb218594d3ec5836dbde75bf41a21ab004c8"
+SRC_URI[sha256sum] = "793c31816d952cee405b83488ce001c719f325d9cda69f1fc4cd750527640ea6"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.47.3


