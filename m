Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web09.13592.1619796910737271699
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Apr 2021 08:35:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=bTMb/2ll;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id b21so8300719plz.0
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Apr 2021 08:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=WbGtD+dnAyvcGx5xZrE7VhJJB/w8+zUqRgIzJUQVO8w=;
        b=bTMb/2llBP/9LcXMTRdxAr0PoB0IBCo+7rk9TxqmWQveyzDg6byIArqHN/MJLuA8gV
         Lw7C0ubJz0RGH97pW5HC/S9CAd/i4AH/qpDcyrKGxQJtQnzlil4bHntvup8Jjc6jXItB
         tLCVlNFhXZT6XIAnrWur6kyWS9CZT7tbuCX7O3CzUfaA1HxN3A9ZDrFkfLQViKd1OQn5
         5hOItp83OhxSVbiY8zlEk3zu6D4OjfIGJC3YRXNVXj5RtJUfCY4C6tcfepwi4iduSNcE
         7XYvqIrJfGkudY06ytvc6TamFthq7XFgALbMUIz8x1CBBiZFoSr//iihhc7X8qQiusJD
         1EYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WbGtD+dnAyvcGx5xZrE7VhJJB/w8+zUqRgIzJUQVO8w=;
        b=pILpE1b9DC9i0+1mDwNAPhFj4VrAWizamQAt2fmuB73Cwcj2BzfMKpQ5XfkfiRxZDY
         9SEEv3AhFu3LuCcp77Xtp0DYoNsl5cKzNE2u8W7giMbVTYGA/an+kfRAwT4qHweeg034
         JxyFu3KwI37Qw1+ZVqyQlbGYgIiB5m6XS21RbJd7hu2IReg+ucuKHwmR8TjlcFCDu/vX
         DbL38m57Bad/4FlD0i1uq7Y800564Cw0dAFrdW6EwBlZvHkwPKzJXK3zyA/xfk6FJZf3
         gyoKgshCKnEDYzoN5szxnO8zPox1OfRDaeQPK4AgZ+3R78Rmw3MTDS2bAc6ViRJ/XtWf
         LwoQ==
X-Gm-Message-State: AOAM531iDOq6rjMScTj+vTpt5/nuTqWfUfUQ+IEZ1h7Drkg0oq0F70UG
	7bMmKvFJJOlem61PPAr37u3Sq/Ao6/Lm+y+R
X-Google-Smtp-Source: ABdhPJwWVado/KqosrzfLES9QnmIpC6P+fv58OSILRpw/LQ4gG4QoYiMrzdqtiHJ8eY7yNpUZCRg9g==
X-Received: by 2002:a17:902:6b02:b029:e9:8e2:d107 with SMTP id o2-20020a1709026b02b02900e908e2d107mr5696404plk.61.1619796909832;
        Fri, 30 Apr 2021 08:35:09 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id x9sm2900386pfq.197.2021.04.30.08.35.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 08:35:09 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/12] yocto-check-layer: Avoid bug when iterating and autoadding dependencies
Date: Fri, 30 Apr 2021 05:33:48 -1000
Message-Id: <571db128cf9dd780e1eada84e2792fb5f92bdb6a.1619796615.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1619796615.git.steve@sakoman.com>
References: <cover.1619796615.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

If iterating a layer with multiple components and auto-adding dependencies
the tests can break since layers are never removed and order isn't guaranteed
to account for that.

Fix this by resetting the layer list back to the original list each time
before auto-adding the dependencies in each case.

This fixes scanning of meta-openembedded in particular where the sublayers
may not be added in order of minimal dependency.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bf1b467dacf345379cd5d84a1c9b3b0d844d5c91)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/yocto-check-layer | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/yocto-check-layer b/scripts/yocto-check-layer
index b7c83c8b54..deba3cb4f8 100755
--- a/scripts/yocto-check-layer
+++ b/scripts/yocto-check-layer
@@ -138,6 +138,9 @@ def main():
                 layer['type'] == LayerType.ERROR_BSP_DISTRO:
             continue
 
+        # Reset to a clean backup copy for each run
+        shutil.copyfile(bblayersconf + '.backup', bblayersconf)
+
         if check_bblayers(bblayersconf, layer['path'], logger):
             logger.info("%s already in %s. To capture initial signatures, layer under test should not present "
                "in BBLAYERS. Please remove %s from BBLAYERS." % (layer['name'], bblayersconf, layer['name']))
-- 
2.25.1

