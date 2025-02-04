Return-Path: <omri.sarig13@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEC2DC02196
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 12:56:47 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.115681.1738673797893191922
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Feb 2025 04:56:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PYuE2F1e;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: omri.sarig13@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5401c52000dso6043937e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 04:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738673796; x=1739278596; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VjJ3tFDcnkcPzgInjUUI4bctNNAaaprhUGcMoYVC3+4=;
        b=PYuE2F1eXmSTOiZIS/QjKk8demJ19aMUujqMU1/r9jxfpge3jydNFaTr5jHu+DrIqX
         92dC3O9kddQ/i7Bcnr0AUdWj1or5PFfJu2Em/hmDi99WKIorM+UdINoH/F5rrzryols7
         XY8ShtwOBR5uTTZ3N/rU45sPEWMMxkuAh4avlMAfQKFTko2SRh9a31JFaUFqUlNhFS+J
         6dWMBhB1i3PH7wjJIKXbnh7S+j1UBaJp6NxlzVWMEm9fAfcdi0Xcl06hSDAtyV+IUPe/
         hUygL04WfiARiMRdONmJi9RTzjqgHWiCOBx4idZYOy+gxxQmNa7ahAnDddZeBeeEGUkn
         8/sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738673796; x=1739278596;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VjJ3tFDcnkcPzgInjUUI4bctNNAaaprhUGcMoYVC3+4=;
        b=JV7Vg2P58GNHGgI9leo+SvxSpdkipYDhF9KtMmTwvtNvXrpgttqgrJfHIG3V0JOJ/P
         GDpcNKJTgq0+aRNxkuER8j6/zMwsVc1l9orxP15g6UMypvjsA1hRSd3hlS3pIDDdvLCH
         Kw1z4rIWNesdpWFz2PccFSiapyKnzhgzn5Bp9mnxRqD6qWiiztaTk/NsUMB9BhyqNVyE
         7Jx9W+6EZ7v6Q4GtlfTMCxFc4Q0XrdLIywbxpGzCY6GdQqsd0nvDRW540hx4BOygNwab
         xCbMlPpMaCDB/nEsfIoKlbh9Vj+5PX6PiEArIW4vT2nV0hPH69/OvOCqTEHCZdOcaBFD
         EuaA==
X-Gm-Message-State: AOJu0YwkqL5lLguRvu2quNzNM4dYvzR2eC9J+0fgRTb9yheFlpSM7Cqm
	CBQ4DdYK72P0kw1vxPBU8Cv1sgR+ne0UOKhxoyLRgVrE4pNsM19LvRiTX7G6YKM=
X-Gm-Gg: ASbGncuF0fqiTI5c24bRtw6V488UQSySWKnGoze4aL5TxFaYWsbaiOZbxmSAN1c1zZx
	hRU3TSqaVhz00j2JAT2ehTpz03YZ9p/3jfJoomboKqi4f3zVkBZeYWeCw1sW7Ft3UyQNyM3IkOF
	cljsZnIHmOnFWIgd+KjYDSUZsHGBUPmKAGn6/CBza+9Z5z5Y/aBBW6JJjzW7ZH26PWZm7E9jQQT
	IzruikZ9SWi28nZUWQZmupQeweOmtofiqtyJLqOgUQWL/kKaG5CCDtMP0o6of9c+D0yaygM/ihj
	HahQXeouYzJz7w4KScTFzFO6gIdNLlFzJGttitosbFdSbiB5cAnoZEnB7KfQaCbo8d0DyNeebg=
	=
X-Google-Smtp-Source: AGHT+IHzOcX9uGsZYb6DqKxZbvOqCSAIRjxXBEbINB2cVhJBikfP9OjXCWjFfjPRvnnIE+XRzK9B1g==
X-Received: by 2002:ac2:4f8c:0:b0:540:3594:aa39 with SMTP id 2adb3069b0e04-543e4bd8e9cmr7072863e87.5.1738673795364;
        Tue, 04 Feb 2025 04:56:35 -0800 (PST)
Received: from omsa-HP-EliteBook-840-14-inch-G9-Notebook-PC.prevas.se ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307a30890absm18007061fa.38.2025.02.04.04.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 04:56:34 -0800 (PST)
From: Omri Sarig <omri.sarig13@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Omri Sarig <omri.sarig13@gmail.com>
Subject: [PATCH 1/2] python3: Fix typo in python3-manifest.json
Date: Tue,  4 Feb 2025 13:56:18 +0100
Message-ID: <20250204125619.2278355-1-omri.sarig13@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 12:56:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210782

Signed-off-by: Omri Sarig <omri.sarig13@gmail.com>
---
 meta/recipes-devtools/python/python3/python3-manifest.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
index f99cc5e2f0..441830833b 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -1,7 +1,7 @@
 # DO NOT (entirely) modify this file manually, please read.
 #
 # IMPORTANT NOTE:
-# Please keep in mind that the create_manifest task relies on the fact the the
+# Please keep in mind that the create_manifest task relies on the fact that the
 # target and native Python packages are the same, and it also needs to be executed
 # with a fully working native package (with all the PACKAGECONFIGs enabled and all
 # and all the modules should be working, check log.do_compile), otherwise the script

