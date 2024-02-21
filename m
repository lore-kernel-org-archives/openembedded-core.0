Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A326DC48BC4
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 01:58:23 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.3945.1708480703007134890
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Feb 2024 17:58:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dJ6JqTY4;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1dba177c596so33946685ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Feb 2024 17:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708480702; x=1709085502; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Cwd3MjCAwvC5lDGLP2RWMyyoW5Mx6/VC7xvl0/duG1I=;
        b=dJ6JqTY46l3H/8qS8kSZvkFvP26D5t6fRAQBPdRm5nfxMxUEykEgJckCZAbxrInglE
         gBefCgmoEnFK+S3y/mnWIAmjQdOcZiPYmdhsHllZBLhom51VFaewGjASzEjSmBHVTGHr
         1TVAl8qxYMXxBpulnIjrTJxIp/7A8vsbQajnEexJ7s2FHlGPNwBgWtyicjp1zwqvMHMC
         EhCesC0Zd1njMUlJC5vRUw1FyL3XQWGTKaNST/rzGeK5rSdNexpvwIag2OD4brxtQyui
         Lt2z34lIP63naoteZFhoiq3JWay+x8JNwHR8EQ7z8Th9YW1jCN4BOEDOnk7HTz9pwD7t
         VYjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708480702; x=1709085502;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cwd3MjCAwvC5lDGLP2RWMyyoW5Mx6/VC7xvl0/duG1I=;
        b=PYFISWG2KZs9NlVvKX4Ojlb49oHrOiINL72Rn+JBlsl6wvbd0wMj7Pm39Fz1gX/VZ3
         ESYYDQv6JqnH+WSJ/XZo9cAmqVbyJNy8Waa77a5Fal+LuR7lvM85CLaEGA5xjBDsyOPH
         bkzrMecOxGERwNEqnvLD/daUhdTu/tWfND2LSkDEZJxK3ip+ZXICh8sTcDV2xnwO7KXn
         qh9JftrC3zdNb2M9f3mR67zYNRfjBf/j1EbGKNf58uodiqQc93yscHEpJwIQL7zz6KOJ
         UXu4/dqInaA3j9U7CFsmjPty6Eg3dAvdWEwyi7kLze6SZjQIk1hach2WLgA/GW944VS9
         WWwQ==
X-Gm-Message-State: AOJu0Yzd0TdDq9bPEFIKT8BrNSgH7X+Dut0FJEF2JeK0bece/DFc6Yds
	+g7EUQOqQFNRGWA1wY3tqXVHbqgHdsz3wqbC12skJYDc302YDkP9eEOH0fbEWRk=
X-Google-Smtp-Source: AGHT+IF5VYjbrxfxyaYPmxHJPWeuYk9cWwyPXllhI6modAIOvhuYotMpA6KCN17lKqEyNVQZrFUehg==
X-Received: by 2002:a17:902:bb93:b0:1db:6dfc:5c56 with SMTP id m19-20020a170902bb9300b001db6dfc5c56mr17813922pls.30.1708480702064;
        Tue, 20 Feb 2024 17:58:22 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::696f])
        by smtp.gmail.com with ESMTPSA id p3-20020a170902c70300b001d92a2b258esm6888856plp.118.2024.02.20.17.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 17:58:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] ncurses: Always pass -D_GNU_SOURCE
Date: Tue, 20 Feb 2024 17:58:19 -0800
Message-ID: <20240221015819.691952-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 01:58:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195932

So far it was assumed that it was detected ok for target recipe but
actually it ends up with warnings and build moves on, however with
gcc-14 these warnings are treated as errors and we see the problem even
with target recipes.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/ncurses/ncurses.inc | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index 367f3b19f48..761b6a3d312 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -27,10 +27,8 @@ EXTRASITECONFIG = "CFLAGS='${CFLAGS} -I${SYSROOT_DESTDIR}${includedir}'"
 # TODO: remove this variable when widec is supported in every setup?
 ENABLE_WIDEC ?= "true"
 
-# _GNU_SOURCE is required for widec stuff and is detected automatically
-# for target objects.  But it must be set manually for native and sdk
-# builds.
-BUILD_CPPFLAGS += "-D_GNU_SOURCE"
+# _GNU_SOURCE is required for widec stuff and is not detected automatically
+CPPFLAGS += "-D_GNU_SOURCE"
 
 # natives don't generally look in base_libdir
 base_libdir:class-native = "${libdir}"
-- 
2.43.2


