Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F375FC05027
	for <webhook@archiver.kernel.org>; Sun, 29 Jan 2023 04:57:48 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.10929.1674968265429407725
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Jan 2023 20:57:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aLr9frkl;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id 5so8620165plo.3
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Jan 2023 20:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5zilBASS2GJzYYwTSecrvgHnYNVw0fU5pPaC97rFmxU=;
        b=aLr9frklaFGhqB4BmJOHETAxyC86ZOc57C0XExXrJ4m1ZfXG7qmVw9dsBvEHvfQF9F
         2JpLxBhKrIQ8Vg9VszyJROEhW1fBRwbmfGS5ZReVWVEzGEv1W1WBJxjHE7S6HfEwofip
         cvIucdnGD8ifQLtw1U2M5MzGQ174XO331XhcXYggSZVmMiElKcHS3ivp4Vi1TFa3eujv
         EmUX0q8wSXYW1uTAJ3RxBDGmhVNYpFrKBuKmPYwlkRLG51QVbOn1xLbR0C9nnm2tAiJ+
         vJK6MoazEk6n5M9l4LC4tyP5xgKFlpAnKI/kBKwJ6JABGZbZ/7nvzeJkMrQhrgSzuMBd
         Iceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5zilBASS2GJzYYwTSecrvgHnYNVw0fU5pPaC97rFmxU=;
        b=oe+RIa/lDeO9BQLRTmMA23CbkDuDzDYF04mIPWqqvbJqG2doprj/KdBbNcM2Gy+iY+
         BC4w6O5gq+Xx6yBn/nueUoKvhxpqNu7vns95p+hlTVACizFumfOqwlIpNKCNM/CL+0qa
         t4pu0JItWkhaTMuhEbCW2iMynQLmO6o4yqLeUYxKxpBKEaO7v9BernoFPi0p0Q9AWTJF
         EChngsFy7Q6D4uTNT7jB4bFvo/q2Skpq3byTaw1YnQltmq0TH/LYfJBDRWcN/hEtIx7L
         p/f6gCeoqLRprxBhtu1HtMVaki9SQFlT+mLgUYC/vktMTbyBPRyP0G2LigVrKDTwbXRG
         OYLw==
X-Gm-Message-State: AO0yUKUz9ZI3mD+/CFqdGq9C38Qx5oMYXJsmk28qpdkQ9CdXeSWT8bV4
	Un4QK28tksJNpp4RJ6aa0POyZuKQ+vN6lw==
X-Google-Smtp-Source: AK7set90O20C3BATC0IMARmOBXK4kbyxjPyujaMKPLCXZMiaclC1LLD3LoPnxE3JgBQgTp+G7lpKkA==
X-Received: by 2002:a17:902:cece:b0:195:e480:acec with SMTP id d14-20020a170902cece00b00195e480acecmr4886544plg.5.1674968264220;
        Sat, 28 Jan 2023 20:57:44 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id ja7-20020a170902efc700b001945b984341sm5265035plb.100.2023.01.28.20.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jan 2023 20:57:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] nghttp2: Disable python bindings
Date: Sat, 28 Jan 2023 20:57:41 -0800
Message-Id: <20230129045741.3763129-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Jan 2023 04:57:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176468

python bindings need cython to build, moreover they have been removed
from future releases upstream nghttp2 [1]

This ensures consistent builds as it does not need cython which was
being used from build host if it is installed. With some distros e.g.
archlinux it caused conflicts with python from python-native

[1] https://github.com/nghttp2/nghttp2/commit/b4cb3b0090b704f2461766c455568b311013272f

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Disable python bindings

 meta/recipes-support/nghttp2/nghttp2_1.51.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/nghttp2/nghttp2_1.51.0.bb b/meta/recipes-support/nghttp2/nghttp2_1.51.0.bb
index fc1a592200..8ddb851f71 100644
--- a/meta/recipes-support/nghttp2/nghttp2_1.51.0.bb
+++ b/meta/recipes-support/nghttp2/nghttp2_1.51.0.bb
@@ -15,7 +15,7 @@ PACKAGECONFIG[manpages] = ""
 
 # examples are never installed, and don't need to be built in the
 # first place
-EXTRA_OECMAKE = "-DENABLE_EXAMPLES=OFF -DENABLE_APP=OFF -DENABLE_HPACK_TOOLS=OFF"
+EXTRA_OECMAKE = "-DENABLE_EXAMPLES=OFF -DENABLE_APP=OFF -DENABLE_HPACK_TOOLS=OFF -DENABLE_PYTHON_BINDINGS=OFF"
 
 PACKAGES =+ "lib${BPN} ${PN}-client ${PN}-proxy ${PN}-server"
 
-- 
2.39.1


