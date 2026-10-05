Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60AB6CA5FCE
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 07:01:42 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14465.1791183698525026529
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Oct 2026 00:01:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=L96kSKS1;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48c5358fc28so596201f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2026 00:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791183697; x=1791788497; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LsZH167h4A0TS9o6kFuSbAaqFnnkTvcKlHVDpToio1A=;
        b=L96kSKS1vxtnuB4KRnpGfEsSXZgTzj8oGnDsdG/+S5ARpVrdDrwN7mgCcUwpq+IIzQ
         w6EGAmlBDNBBH+q4ATRo0VwwN4f71rtv3MoRmV9PTdGXGIMpyICXiP6I6iJLY6ZVi+xw
         BATJCdyFtj1hxmArj2euB4XSAlsulMBBOdma9AKa4ZS0WzWfZ3RL7qqx22ajIq5jWXg/
         LDh+XUFw2ugTDThAUgM1xxLJCLCbU9sq9CeRzCV90XvQk++9OFNZVYlFyypelWN1k5by
         Kjcno707zCjLAVv1zdUY6LqAEMP9+HSbDdUQDyBGykHxKFW/BgYNUn++Ibn8onwO0a9I
         WMng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791183697; x=1791788497;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LsZH167h4A0TS9o6kFuSbAaqFnnkTvcKlHVDpToio1A=;
        b=IGoHL/WPnlo0jntZyE+npNqELsliV11x73ZC3gVbXLPuU0fJfAJqzHq0kTjNVDUwQc
         mJ/IAhKwuczV3buThkUMOudEvm3KQK2EIuQQmEPak2CE8HLjLUl6t1+/5rn1pmjHWItw
         wbzh1MMkVsnUqQa4PEF0Vy/OuFMfS2jZXbBU5urqb6JrjyS7ZAVGW7m7OppjOV3l+6lp
         hTyji7zgKMuXrdArYoyKZD5tqbl79/iOqeLrjn26+9kce3MZvwUycvuxGmeOw/BUAn7G
         5O6vMMamAGZfUShgVdrNJmqOMJ68W2rD0+ZjihTAEezUSFS+bwlRHyjbeTDqLOriKf1y
         BkeQ==
X-Gm-Message-State: AFuF++kWGpncZuBoeypxNW6aLiBUpZ/gZzA2waCNoBP4Qibtv4kVjMa8
	qC5sC1EgdD9pDg99lQ+DV++StOUcNI3F8rBmFf2Nk5TES9N+r+d/iZJ1t7J0vA==
X-Gm-Gg: AYBFou3pcw6eEL28jwbRZQI5fv4zG7pVMq8mREbq7qVs15NBsJUnzOmAZM1hKyzKNW4
	zukYyjy22rz+ikhEnoPdvx3mouuLWpD7WkocmqouSlh3FMvy8NL+hMcRl32DKVOg3fGOVRkGh/g
	rzptIogezRgMnrQ/ifO9pVZv0JuvVYm58Q+T1qwQQPSTTkbpieq2eYf9cC77NxaVbfZZKHak0vq
	V7ozGT1LiCI8+YAMHEgxax+fwY3fIOxdNcc/N19yDq4oOwa7qGCQyFMTCBHNMg4C0KIBPheC/4w
	WX6T2xxVCIvwkZ7jYjT5hYHiFwNrfiadM7iZM4VYie58gvqR2U+9XhA42ZBfPJA7H6M6PXS5hPz
	WtIBCTTaHJ7hmGgUxqSb0YzuxoRIzufwf/gAh7WPlGPvQtubPkz3SLNWQNXk631VALgJidAoC0Z
	BBLn2zHAgICAnXLhO63RYWckv9Cav3boi3Fnx8Hk8vY6GqisAKbDloZerui5pgyim67/OzOL90j
	gfrvGsn7mdyAyb5L58CLDdcdr+Ixv/NskEGzUWmln5qVQi4pgyA4yAXZ4M=
X-Received: by 2002:a05:600c:1d0a:b0:4a1:6ff4:886a with SMTP id 5b1f17b1804b1-4a16ff48af5mr50689935e9.16.1791183695105;
        Mon, 05 Oct 2026 00:01:35 -0700 (PDT)
Received: from localhost.localdomain (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280be5dfsm354546715e9.7.2026.10.05.00.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 00:01:33 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [PATCH] python3-cffi: move python3-setuptools to ptest
Date: Mon,  5 Oct 2026 08:01:26 +0100
Message-ID: <20261005070125.30784-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2026 07:01:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247220

When ptest support was added, python3-setuptools was added to
RDEPENDS:${PN}. Whilst it's required for ptest, its not in normal
operation - move it to RDEPENDS:${PN}-ptest.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 meta/recipes-devtools/python/python3-cffi_2.1.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-cffi_2.1.1.bb b/meta/recipes-devtools/python/python3-cffi_2.1.1.bb
index 455732a26994..6166d644b4ea 100644
--- a/meta/recipes-devtools/python/python3-cffi_2.1.1.bb
+++ b/meta/recipes-devtools/python/python3-cffi_2.1.1.bb
@@ -21,7 +21,6 @@ RDEPENDS:${PN} = " \
     python3-ctypes \
     python3-io \
     python3-pycparser \
-    python3-setuptools \
     python3-shell \
 "
 
@@ -29,6 +28,7 @@ RDEPENDS:${PN}-ptest += " \
     python3-pytest \
     python3-unittest-automake-output \
     python3-dev \
+    python3-setuptools \
     gcc-symlinks \
     g++-symlinks \
 "

