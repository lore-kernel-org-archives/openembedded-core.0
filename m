Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29770C3ABCC
	for <webhook@archiver.kernel.org>; Mon, 16 Sep 2024 02:25:01 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.69.1726453499265163575
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Sep 2024 19:24:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=l3e6z7PQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-207115e3056so35183045ad.2
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Sep 2024 19:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1726453498; x=1727058298; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LzEOi0k9KdKfGp5nqciP2ecgnywJZn7mI2Z/TwA8P34=;
        b=l3e6z7PQ457suBJpf2Rw7ySdflXZ+pZj8oYxT7mZ8MjCp0h96WYUDj/3GMUWT80q9O
         fIiFKjRvGqq+h3jhU8kLGGHSe4la4fX8E7xawTX2wGIohuw4BDEnlPTimI3t39ijNsDu
         LUrYhTrvZ+VKiI4yfPcnAFpXv4TlraXk3OOOJvC5NQ1YdUH0HIuAi35A9Ui4pz18wf6a
         AXVYn9CtygX5umRPtS0RVpo7cs0QLpnB2iXTbjWkZ4qGQnNhAZnZsZf+kpffM1xQoWLw
         S7gf8UR1IleGo7OR0gLqqassTYYQ5gBDO2ZfwgC5EePcsB4iqblaWGATT2U/Aziox0h4
         BV2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726453498; x=1727058298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LzEOi0k9KdKfGp5nqciP2ecgnywJZn7mI2Z/TwA8P34=;
        b=qpGJ88hO/nWGnABPwYG+wTN+MqcUah8Sklm11TLM5gIB6pMFwsWHarvnzUFLO+XQAZ
         TOzQ11BeQqAL69adqoHOacXUiP4mIBpu0fbgBjisi4YYd83oBIvf51pZ++aznOrok46a
         PKPsl4PVwYNp9LZkexCFnNxXv155dfvaZbsnoiX2XfabyYGMzwCT/7O33FGxJLOEJZdX
         CJwnLwx8QLypYF6vadFTKgVKoWBZyW1DzRIxyva0vU4VhWee44a2ioHyMJWqWl7wiCce
         L96j/J/5YCVaiNoQGZRmoDWRQerHiBJWUSXkSMHc9Ce0F3KNG6lLmGjenZVtBJM3jH5f
         be3A==
X-Gm-Message-State: AOJu0Yxu2UjsbzWHVJH0vV1leECTZE5YwEw2nWRxS4Ob/abbBNhM6Oh4
	5D5PVLsMrgLDrM2QlLSlpQ/WMJVyozx4NC3mfB/Vu/8Y/bO7oQt3kTo0ePV3a/UyBaMo+GBFPzj
	lKLs=
X-Google-Smtp-Source: AGHT+IHwLvlpC9GER6kk3GXxiq3c0i1EjOji5Aa69fG+kvun6mKixlv8TG6Hvx5IuwMPJQ+Me0f6dQ==
X-Received: by 2002:a17:902:e88a:b0:206:96ad:e823 with SMTP id d9443c01a7336-2076e46178fmr201412465ad.39.1726453498509;
        Sun, 15 Sep 2024 19:24:58 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2079460255asm27866555ad.107.2024.09.15.19.24.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 19:24:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 1/1] libedit: Make docs generation deterministic
Date: Sun, 15 Sep 2024 19:24:50 -0700
Message-Id: <343f40b0bc8ef65cc1e2abd6c9c33bb2e08bad3d.1726453391.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1726453391.git.steve@sakoman.com>
References: <cover.1726453391.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Sep 2024 02:25:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204602

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The presence or lack of nroff on the host was changing the doc type. Stop
the code from looking at host paths outside HOSTTOOLS and hence cause the
doc type to be deterministic and reproducible.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 918e2b266eba6779f19f65349f85caa880ba45e7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/libedit/libedit_20230828-3.1.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb b/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb
index 1684b57d31..8ea09e176a 100644
--- a/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb
+++ b/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb
@@ -15,6 +15,13 @@ SRC_URI = "http://www.thrysoee.dk/editline/${BP}.tar.gz \
           "
 SRC_URI[sha256sum] = "4ee8182b6e569290e7d1f44f0f78dac8716b35f656b76528f699c69c98814dad"
 
+# configure hardcodes /usr/bin search path bypassing HOSTTOOLS
+CACHED_CONFIGUREVARS += "ac_cv_path_NROFF=/bin/false"
+
+# remove at next version upgrade or when output changes
+PR = "r1"
+HASHEQUIV_HASH_VERSION .= ".1"
+
 BBCLASSEXTEND = "native nativesdk"
 
 inherit update-alternatives
-- 
2.34.1


