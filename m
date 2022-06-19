Return-Path: <ptsneves@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6DAFC43334
	for <webhook@archiver.kernel.org>; Sun, 19 Jun 2022 19:21:07 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web08.22172.1655666452552669523
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:20:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dZG2T5Gx;
 spf=pass (domain: gmail.com, ip: 209.85.208.181,
 mailfrom: ptsneves@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id w9so729077lji.4
        for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Gd+TT2+h7sHZ8k4eCB3EylAjwP5hm50V6/bgYDIOHXA=;
        b=dZG2T5Gxp0MfFxJQLjSOqomDTflSIkeJjQEglIy9jMAGW+sBteV2XnlxHJGE5Q3F6/
         IuMehW50JpAfAZAGKkY/no4fbCN6Zhh9nP8QwhUCwgHvTJELeAJ6mRZgreUfsDf7GTVQ
         rnQiCMmhz+ob/314ujDoFlNJpwzZJIZGMXslqxsptTae8ZNiFV4Hy4DSltNNvkYNfK42
         /hMiPl5t+h5iHHI6qkr16a3PrQlXxzFIVKVNXLojD1ZZqoJrGRbnC8uId4Ywrv6f6CpB
         xkJ9KA3G4uTuo128u9gT4rq0X+lpRN6UZbhXDZFjh67OkHVPEgSf1AER1lk09sp0NaTg
         qBoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Gd+TT2+h7sHZ8k4eCB3EylAjwP5hm50V6/bgYDIOHXA=;
        b=xFO+0/y6fA0y3QGhI7Ap7dTtY8XZ4Y/zohvnYOPQhmQdSP16sWhT/ZUvLPakMkRiDj
         1ubnRFbMbfBEfvQkqup/dVzfA7H+dxfCjdja+Bfp3T314SrGv88eXqyq/SKJTTBCGFA0
         TEe/WpRcTZrYvK3w4tPwlbKYK1cF+S//YDbz2v9Mw05kvyuTOV9bXp2nLbv3+NxwxRXl
         IxZ7bWELTqU6kI4eGmTiyqoyk/BJ7WShWEllDzf2CsqXpww1VzSGiYkFGJEAE7OIMDkQ
         Tjw2vC9DHoyeU1Hi57Jaj+dcc2CAVReen9lSH2M9cmkngJcBHyJ/eJcNbt5dCS0ahANC
         1PoQ==
X-Gm-Message-State: AJIora+ieVv1wYf4JDwgFFGGnDEMvLqp0/VRhyWRROk30TWKa3mI5ru5
	816M+0ZOCT/glR06RmxYVzwqRH5jtA==
X-Google-Smtp-Source: 
 AGRyM1s61CoFhkfZwlsci8zkPakZt3W1uIbschmoWiaEDUm+2wtqWKRQnFcj0PTmJyROM2xqeFXzPQ==
X-Received: by 2002:a2e:b209:0:b0:25a:705d:c4ba with SMTP id
 l9-20020a2eb209000000b0025a705dc4bamr284432ljm.468.1655666450908;
        Sun, 19 Jun 2022 12:20:50 -0700 (PDT)
Received: from pneves-XPS-15-9550.home (83.11.57.73.ipv4.supernova.orange.pl.
 [83.11.57.73])
        by smtp.gmail.com with ESMTPSA id
 k1-20020a2eb741000000b0025a59470621sm817020ljo.26.2022.06.19.12.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 12:20:50 -0700 (PDT)
From: Paulo Neves <ptsneves@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Paulo Neves <ptsneves@gmail.com>
Subject: [PATCH v6 7/7] libcheck: Fix too long shebang for native case.
Date: Sun, 19 Jun 2022 21:20:41 +0200
Message-Id: <20220619192041.1113263-7-ptsneves@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220619192041.1113263-1-ptsneves@gmail.com>
References: <20220606155807.1414519-1-ptsneves@gmail.com>
 <20220619192041.1113263-1-ptsneves@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jun 2022 19:21:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167045

It requires a shebang wrapper due to the fact that awk interpreter
has an argument.
---
 meta/recipes-support/libcheck/libcheck_0.15.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/libcheck/libcheck_0.15.2.bb b/meta/recipes-support/libcheck/libcheck_0.15.2.bb
index 188d689cc3..1393aa2a1c 100644
--- a/meta/recipes-support/libcheck/libcheck_0.15.2.bb
+++ b/meta/recipes-support/libcheck/libcheck_0.15.2.bb
@@ -23,6 +23,9 @@ CACHED_CONFIGUREVARS += "ac_cv_path_AWK_PATH=${bindir}/gawk"
 
 RREPLACES:${PN} = "check (<= 0.9.5)"
 
+do_install:append:class-native() {
+    create_cmdline_shebang_wrapper ${D}${bindir}/checkmk
+}
 BBCLASSEXTEND = "native nativesdk"
 
 PACKAGES =+ "checkmk"
-- 
2.25.1


