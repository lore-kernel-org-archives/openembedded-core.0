Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A27FCD6E69
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 18:13:01 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5855.1780337580674458562
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 11:13:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rbR4DO8F;
 spf=pass (domain: gmail.com, ip: 209.85.161.44, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-69e32df92c1so298205eaf.0
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 11:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780337580; x=1780942380; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQQojXUZcQdjzLsCXQDgivUylg2RbICZ5aGXFKsrmOw=;
        b=rbR4DO8Ft+ei6EglLrXfkmfbMNyyCS8wlvK/in96XrUh4IgnzNGR2NXkCXn4cstSR6
         paMPS7YK8rPRx8hMm3EHGqmgQvtnmoQildBe/GmOae8M5+hF0oRZUTv0pe+VzMW8MBoR
         NQhjIz1pYUxw08KUn1kwVGHJL7InRRgxTanzzhS19L+Y4LmqNA7fhfYILzTblB1RNKJO
         PumGiUSMPtcB8Cjoaqj2GixhuNBR+ueVqV4aOanqNdPnhzGdaxwRXFa0CAOelAnWR7Og
         zymyS9rCOrlsuSYo2ShmwvOkLR2EfG7JjbUN+gwSfexIyEA42fFQN7oPF0HAV2T9Hna9
         8IsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780337580; x=1780942380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CQQojXUZcQdjzLsCXQDgivUylg2RbICZ5aGXFKsrmOw=;
        b=sR68TYEWVKDAuMvLRUQdbBl1f0ZmoG+W7hMLtCl38lzm5+MchCn1aU+ZIHbYQEdMhd
         xF/BBO4rZeno+3YJVJ+/OyzzIEGZXcJnVX4r9qtqXjiH8zWhwLj+XlMFfFyQ+5ZP1uTn
         ufzZj/8KCyytdg6weMpMPzd0fH+l6oapnfQ+YUTHzgAFIz/svf3MdLdgLuVAursqzU1q
         cPJqvwvpdkeF5UTuMgOFXMDzqMYQCNt4ptJ0hquYL0j3ZHCl5kEHT+3uG9nBV/sRc6x2
         pr56XvkT9OK2bd8tCo7Ue24/D1QlptlSmZCnxwACkGqeggy2hDuU1DmWGLq5QqxhYXrQ
         g9QQ==
X-Gm-Message-State: AOJu0YxO8e/KrXYQsmbKtQENabdeuIYVYG9ep2J4wCHrovLGmGhg13Pc
	PDrd6zSfPzH+Ydi/vOYgiGFunXZGhCDJAYDm4aMtstznPeFfJb6HGHRDIhyAwA==
X-Gm-Gg: Acq92OHQ+MYKeiDbgDPCAjaCra+8KBgYQ9I7qUCU6FpZSU8ecWmdhv/nqRCueaNtsA7
	/7/710tUbtNWOdMdJ/OqglSHjxWKTgKc5gHNtjHjUgnNFPsXeX+UBv2O2iyy78HZDI94L0BMlEe
	S3gkRb2OhTOaTetUjg/ZQOiiVH+sp/yOQtmoODcKQ++nJxrqjPtdMoAxr670FMM0/fjBWocj+DE
	Z9KyEORj+LkA+2t5dmqt2OcrgQmGerNqMIz5cj0ExUOqj32DMpjF0OoRQOHfjE4e8zx6S/1w/fT
	BTegdrAJ0DCFVSW12juB7fBofwZJWk+qMljO5dRuRhmnEuNvrAmaquPaAm5x8OD+DEtxl/Ji+wW
	17/DlKmfdmD4MQ+zu5YKZSK5OUavld8C+BD+Oz2bKCTm1TbSpkqM9LHcEkb1bP1JY5C4s5C8wJp
	935jp+wBGZ72vkQ9sExu5Wno/y/Hh0jio=
X-Received: by 2002:a05:6820:198f:b0:69d:79f5:f638 with SMTP id 006d021491bc7-69e10405b21mr6367168eaf.48.1780337579894;
        Mon, 01 Jun 2026 11:12:59 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::399e])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69e30afb3e6sm860649eaf.3.2026.06.01.11.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 11:12:59 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 8/8] util-macros: Remove redundant MIT license
Date: Mon,  1 Jun 2026 12:11:43 -0600
Message-ID: <20260601181251.123019-9-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260601181251.123019-1-JPEWhacker@gmail.com>
References: <20260601181251.123019-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 18:13:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237983

Removes a redundant MIT license declaration

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb b/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb
index c8e0b8d490..7cd774bac6 100644
--- a/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb
+++ b/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "M4 autotools macros used by various X.org programs."
 
 require xorg-util-common.inc
 
-LICENSE = "MIT & MIT"
+LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=42ba50748cb7ccf8739424e5e2072b02"
 
 PE = "1"
-- 
2.54.0


