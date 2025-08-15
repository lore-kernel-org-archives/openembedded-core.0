Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABCC4CA0EE4
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 10:20:39 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.8510.1755253231947495219
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Aug 2025 03:20:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c5baHz5Y;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3b9a342e8ffso1302317f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 03:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755253230; x=1755858030; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MEJ+e9eQyjdLBRLfx0W9hG+FAHdgquAQK9yw1y5aVwk=;
        b=c5baHz5Y13qLWF3eRrCekaBduzsXPOm02Rfd8EUWVIaXiWUsieVgMBVut9VOhoPn0a
         s3E69QmEJIWujUwF7wX7IHXqbLMpg5WqVc+OmM/vgEcBlpU0TZc6bdULJuDfpksBhS64
         sDQ0ffmR8P3Izvtm2TATd2UfV17B1b2lE88zfMRzY7jPGyfGki97up1S4GahHu01D5g6
         ciEPc5uTqfM/HTHlWPhd1jgXyWPOVDe21FBL1Y5KV1OvuVzX0Mc/KgsSPaW/oo3KO3S1
         u4aYWpHM0EXEoNSHqsokkeCWHP7TVAxNU2MSrG5ChxyuHzewpaAJO45DEnqWPdVHRLRB
         xy3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755253230; x=1755858030;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MEJ+e9eQyjdLBRLfx0W9hG+FAHdgquAQK9yw1y5aVwk=;
        b=Z7W5xT6y4Nz50i4exQcFeKXvWgZRB7U/a7nLQG7YvvA6pUiOqkgVGIf2rxeb3UBgVL
         pboSlk0RvglsJ4FiQzk8e5ZqDtY22X4Kwtplicmde3Nsv4tL/w9+kNU7myz1cRBTQinJ
         JANC34CZ5gQcTs0XY66gszkEt3PeDHbg80c88XBRhSAYhlUIaT7jYukmbNq23EdWZLF7
         q7c+nac5LXKD8vY5QUG/DZnktT4q6cFnDySHvTrz2ZNQk0PwMUh0AO7jPlKRz7GagICd
         Rez64nPwJIJxky+vH0yMmSZSyKTW5L8M83z/Z5geEUCTT0fSMtHV3dmy5SA7g0TzcwOl
         CVUw==
X-Gm-Message-State: AOJu0YxD4Typ828AbZH6LaJCJXd98xywvapCXB1f9GkO4rjhejP0yDLV
	VCl64l8ZzFG5PlntRmo3+DVF6Zxeit2W0oodqPfRSp4IYib19FjF+sKXsOFKvQ==
X-Gm-Gg: ASbGncuvu4UP1F8jgpAA1Sy4Z7bgO5rYBX8W/hNrS0VcLkAhWz7puzfu+pjGO0z105H
	o324TSrSXlYG6YpIqQiTF7QL23pOdBAi4oAn+KIhPjKZ0vE493bkZ/qsYMcrtPLGlfc8f7UTLzf
	mfxKICWwEhIlOrvZzzq0hQzuJSpV9ciSOddqI89/zGyzeSvNJp48j34zJoZkdhBncLLnJXY2ZL6
	LoViapQg987KM6Yd8sAMVWK3XeB6XjgHasHaT8pVr678oBkDKdQPY7wUtCcOBM7zu1NzcB86Z12
	nTk19DR//J+GJIdB5Id8PDuK6CE9Rx1UX2orMj0EFuObSvwU9sgpsAYFuiQfSIjh1OXBS9sUTHW
	beQIY7GxapnJyKdFH91vvjbsfBWccQQ3B62uxEYhrqQ/lXpuJPs9NiXbsLMoBAuZ9qIdgOg==
X-Google-Smtp-Source: AGHT+IEgAQlNSqgK/GjkzlW6i7QvJ7B3ZUa1k0C3YnTfuAifaJ02sZPTYIj0s9tO8l76aEOaJKV0VQ==
X-Received: by 2002:a05:6000:2302:b0:3b7:8acf:1887 with SMTP id ffacd0b85a97d-3ba508ec36amr4987914f8f.13.1755253230137;
        Fri, 15 Aug 2025 03:20:30 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a22328b5fsm13559275e9.20.2025.08.15.03.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 03:20:29 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2] fragments/autobuilder: add go to SDK_TOOLCHAIN_LANGS
Date: Fri, 15 Aug 2025 12:20:24 +0200
Message-Id: <20250815102024.1664011-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 10:20:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221881

From: Alexander Kanavin <alex@linutronix.de>

For reasons unknown, only rust was listed, which means
nativesdk-go was not built or tested, which lead to
breakage like one fixed in
https://git.yoctoproject.org/poky/commit/?id=a669cd2e0c760da9d7e872daea9590fc9e86d766

Note that with this change only building and installing go
into SDKsis tested, but no tests are performed with the
toolchain itself in testsdk/testimage.

For that, a bug has been filed:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=15953

Remove go from x32 targets as it will not build for them.
(next to similar removals for rust)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-recipe/populate_sdk_base.bbclass          | 2 ++
 meta/conf/fragments/yocto-autobuilder/autobuilder.conf | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes-recipe/populate_sdk_base.bbclass
index e6685cde97b..a87e3c49eb1 100644
--- a/meta/classes-recipe/populate_sdk_base.bbclass
+++ b/meta/classes-recipe/populate_sdk_base.bbclass
@@ -62,6 +62,8 @@ SDK_TOOLCHAIN_LANGS ??= ""
 SDK_TOOLCHAIN_LANGS:remove:sdkmingw32 = "rust"
 # libstd-rs doesn't build for mips n32 with compiler constraint errors
 SDK_TOOLCHAIN_LANGS:remove:mipsarchn32 = "rust"
+# go will not build for x86-x32
+SDK_TOOLCHAIN_LANGS:remove:linux-gnux32 = "go"
 
 TOOLCHAIN_HOST_TASK ?= " \
     nativesdk-packagegroup-sdk-host \
diff --git a/meta/conf/fragments/yocto-autobuilder/autobuilder.conf b/meta/conf/fragments/yocto-autobuilder/autobuilder.conf
index e3bac343390..85987b08995 100644
--- a/meta/conf/fragments/yocto-autobuilder/autobuilder.conf
+++ b/meta/conf/fragments/yocto-autobuilder/autobuilder.conf
@@ -9,5 +9,5 @@ IMAGE_CLASSES += 'testimage'
 SDK_EXT_TYPE = 'minimal'
 SDK_INCLUDE_TOOLCHAIN = '1'
 ESDK_LOCALCONF_REMOVE:append = 'BB_HASHSERVE'
-SDK_TOOLCHAIN_LANGS += 'rust'
+SDK_TOOLCHAIN_LANGS += 'go rust'
 
-- 
2.39.5


