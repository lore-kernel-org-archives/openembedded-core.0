Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63117CD8CBD
	for <webhook@archiver.kernel.org>; Thu,  5 Sep 2024 17:27:59 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.15684.1725557277391042617
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Sep 2024 10:27:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=U3PA2TKh;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-374ba74e9b6so799427f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Sep 2024 10:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1725557275; x=1726162075; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vkM2YPcXKBEbJz9hI6+rwecAte0ikkqTRr3052I/FCk=;
        b=U3PA2TKhXuNWz43A1SdAxhwZDeyS/ZQr21eMAOXAMIidcMj+EfMDBw8qsOk25yniN7
         qUz/HGexQ9HmYetMAr0o7o9Jb//tFC6rfln3Sq7AC95MJIu5cNbrFnnhh/d8maGbpizo
         W9CXcfQ9vGDWCl2JiLvfsMp6oAR+vMTPjSzhY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725557275; x=1726162075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vkM2YPcXKBEbJz9hI6+rwecAte0ikkqTRr3052I/FCk=;
        b=qq6rnVUMydNt99LXtvf2ArnJ2uVULDiyIo1wlYxWL44gT+rgIpT1t0Y7qrcczf16CD
         I3IaJtjDCWXrqFCd10J703/CEhCKZYTxejXJYvUthxb4n0uczpwdnvSpZkONgbUXZ67G
         RwnpSrYd0rWZrc7k2ltZ/p7DX9OqSAj/IXBW2H8XeKlhG6Xx4v0/ix+qWJGgQVvcVbDa
         6j0fwMT1evI/u8MVFvQnQ3IwW3wAaOS4SBAu0tJe6g2Ms0vJQdDfp1C9PoGX00KfjRVm
         LlINEtQ+zz7vLnhc7rWYfBOeXhYVVWq+yMQOjAa+wSX/jsKghzOLNkZroTJ7JyWdgdsL
         jSUQ==
X-Gm-Message-State: AOJu0Yx8E+RsPQgHXr8thFOadxYitQ63WGcWK5VKSvP+1vcUfTZhumfm
	nPDq3Iro7mQ7LvvklX1FNpWWgH5OBVSN6Q1sVZABubxpmIHu2WmAaKupOOAZUMUbuIiFZCIKF79
	U
X-Google-Smtp-Source: AGHT+IHAvsUE5bPKA6LzQ5B03cjQ1SExdIjU0OCab8a4mwh8D+2PUhRkd6hhOxyi8IDVLr/kI9t6sg==
X-Received: by 2002:a5d:668a:0:b0:374:c11c:c5ca with SMTP id ffacd0b85a97d-374c11cc70cmr13573880f8f.46.1725557275109;
        Thu, 05 Sep 2024 10:27:55 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.local (2a02-8440-b210-51d7-ce2e-7cd9-4251-ec6c.rev.sfr.net. [2a02:8440:b210:51d7:ce2e:7cd9:4251:ec6c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374b5e3511dsm17013143f8f.34.2024.09.05.10.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 10:27:54 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH] spirv-tools: Update merged patch to backport status
Date: Thu,  5 Sep 2024 19:27:39 +0200
Message-Id: <20240905172739.2818260-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Sep 2024 17:27:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204241

From: Yoann Congal <yoann.congal@smile.fr>

Patch 0001-update_build_version.py-support-an-envvar-to-force-t.patch
was merged here: https://github.com/KhronosGroup/SPIRV-Tools/commit/bc4060ed274ad9749c20daced96d6f0518d6418e

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...1-update_build_version.py-support-an-envvar-to-force-t.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/spir/spirv-tools/0001-update_build_version.py-support-an-envvar-to-force-t.patch b/meta/recipes-graphics/spir/spirv-tools/0001-update_build_version.py-support-an-envvar-to-force-t.patch
index edcbf506b9..c596a3679a 100644
--- a/meta/recipes-graphics/spir/spirv-tools/0001-update_build_version.py-support-an-envvar-to-force-t.patch
+++ b/meta/recipes-graphics/spir/spirv-tools/0001-update_build_version.py-support-an-envvar-to-force-t.patch
@@ -9,7 +9,7 @@ description instead of resorting to git describe which can change for a
 given commit if multiple lightweight commits point ot it.
 
 Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
-Upstream-Status: Submitted [https://github.com/KhronosGroup/SPIRV-Tools/pull/5758]
+Upstream-Status: Backport [https://github.com/KhronosGroup/SPIRV-Tools/commit/bc4060ed274ad9749c20daced96d6f0518d6418e]
 ---
  utils/update_build_version.py | 9 +++++----
  1 file changed, 5 insertions(+), 4 deletions(-)

