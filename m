Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB3E2C433EF
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 16:40:59 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web09.643.1646412058724781539
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 08:40:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FovVMgeW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id
 az40-20020a05600c602800b00380f6f473b0so464871wmb.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 08:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=riCmMHhk4M+WVAW0JtvxZN2dasO0v2A3qXwbKhyypsg=;
        b=FovVMgeWolfKzGhN1gJvzDAt/7RgxrD8FVi0BUHTAd3d9PELlB4SJRcgxTLm2uemQZ
         1msEVciq2bS5v5wVVUzSyo9OeYioQlryQXjYuEBkaobXc8jFqSDFf9TP8+moe31doTTR
         u7DqCYFmW9v9lHJzVoSvm1Sf9l2UwHuJEybZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=riCmMHhk4M+WVAW0JtvxZN2dasO0v2A3qXwbKhyypsg=;
        b=cjK4wnFHe4zPsPnkx/MVPrxT302zn1Ha+pQq6mtTAWzB/guAQaZDYbQ5UP3GBqXTjm
         fSSZe2Fx9b+lHv/rXJAMEB7gBsfZgOpjNMjlRR3rLg4jrWGVHjPI7altnvuhTue/h6Ou
         h2RiKGx4hdLAdAKzQvMR7pjsHaJVuaPH83t4UREeKOb6VqujmWoInjgoA9lPVTuJ29Ji
         R6HM13veDM1lMYOgx0n4VDjcrf6TR1Rh7lj/FQaLBE7m5ptZGCyYu0LeDAoUx+pDFlnK
         p/XW8+e9fLT5gZBHytGYe3HwbUML3g/EdVSD1skQOLjtFUl1lUmOUpVEHfQ2Cyrt0wKc
         Zd+w==
X-Gm-Message-State: AOAM533rEKTyODV5iEpnwUgPfbmroT+Om8CVIwkR6VFulAJfqcEENvTe
	CJRnLcWXH/8n0gbRFOHrZkGoa3YnvU2AYrhN
X-Google-Smtp-Source: 
 ABdhPJwkCCJGPRIDsjn/lEwqbzK78Sh+Kp26yVVLC65/vOz+6hE4uV1Ok8YFNkiBWJHuyNWzGXvJDQ==
X-Received: by 2002:a05:600c:d2:b0:388:fd80:3b37 with SMTP id
 u18-20020a05600c00d200b00388fd803b37mr5899233wmm.144.1646412056864;
        Fri, 04 Mar 2022 08:40:56 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:f5cf:8b05:e0eb:94af])
        by smtp.gmail.com with ESMTPSA id
 d8-20020a056000114800b001f045f3435asm6970536wrx.108.2022.03.04.08.40.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 08:40:56 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] layer.conf: Filter docs dependencies for efficiency
Date: Fri,  4 Mar 2022 16:40:53 +0000
Message-Id: <20220304164055.379402-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Mar 2022 16:40:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162739

Where a recipe has depends on native docs tools, in most cases
we don't need recipes that depend on that recipe to also install
these things into the sysroot. We can rely on recipes wanting these
tools to have direct dependencies instead.

This massively reduced dependency creep in simple recipes (e.g. an
allarch one) and reduced the size of builds with the api-documentation
feature substancially.

gperf-native is also included since that would normally have a direct
dependency in a recipe which needs it too.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/layer.conf | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index bdeb8a47589..8f30de5f6b4 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -100,6 +100,10 @@ SSTATE_EXCLUDEDEPS_SYSROOT += "\
     .*->patch-native \
     .*->pkgconfig-native \
     .*->quilt-native \
+    .*->xmlto-native \
+    .*->gperf-native \
+    .*->gtk-doc-native \
+    .*->texinfo-native \
 "
 # Nothing needs to depend on libc-initial
 # base-passwd/shadow-sysroot don't need their dependencies
-- 
2.32.0


