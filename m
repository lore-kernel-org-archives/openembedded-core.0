Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2741C52D6F
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 09:37:11 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.73734.1724751423437518019
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Aug 2024 02:37:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=PhxtPdbb;
 spf=pass (domain: linaro.org, ip: 209.85.208.171, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2f40a1a2c1aso46209671fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 02:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724751421; x=1725356221; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pvBYMdqW0e7s4J5UGZCyd+6dxBWKG6YsCdxq9WJXRGk=;
        b=PhxtPdbboUFssyRML4fxbUz1hodE0TBEUbJIPnM9fBBq3FHoVk9A5BNhq1P48S40zw
         vF7wlaG7rTTQr1jAMZN+Jk2BikvXDphOA7Gh811tmYRSl9oLihHJo761/xGse/hMDg3d
         KImyMxBJfY3k5AMws6eqGomTWdJfoJsmJmNHyl/Y94a41Wn63+1nCdbTEndecLuqJX5/
         nP7X/5RI1dtBQZf/fYWNSuqr2zZhqUIi4/ZKJ/blXSm5ZYwRYgwpBEgDL6SZZ1o2mFXH
         FLfOT9ySVpUgG+Sh2GY1atliFwB4D/9haiIBh+YRZmkNIjcMlOeru9/kFdyEaOYEX7+V
         19UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724751421; x=1725356221;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pvBYMdqW0e7s4J5UGZCyd+6dxBWKG6YsCdxq9WJXRGk=;
        b=YPODaESJSXN3TpGJzmPIKcETxefwJv+I3UHAYEO7oIsqHDw6gZUW1D/FypX+kXGH9m
         ku+Oh6xqBr6O9XLjGlVWYkYtogTijlV07Le16gBgxVaSMJKnPTZLqMzaBK3VnKqcO/Hi
         1zgvuqGeVyZXd59Gck+r1Hxnlu57+51oQ5riygb4H59fXZKINm9cfOZCbkzkpXil2XM4
         msX8SxNfZR54L6aFHMVIYWqMdVyTO2KFgIo3Q6v9Oe+2LQZNvokR7x04lWeu6cNirWdH
         MIDieu69phC8cAqdMw5IdumbUCVXxWzRkUob17+BzqN1LwUbzcst2jiGTMgOYRosPe7s
         OzrQ==
X-Gm-Message-State: AOJu0YwPca+BnO0jJS8T7BcChkHzXlWg6+IPkiaJFO1C7UX5n8LuPF9Z
	GdOZ5DFLZmBbV0m9TFNVjFe9PuJIeNmhvakkkue2OmBKZ5OQvNEMYras8GwV70fCuC38FyRp3wT
	b
X-Google-Smtp-Source: AGHT+IEuSAADuCfSi5SYAbwQE260TzPwOYvPW7b5Kgyy6zzKDlWSz7pi+0Ho5fAR97wnFTcQNT+law==
X-Received: by 2002:a2e:859:0:b0:2f1:a30c:cd15 with SMTP id 38308e7fff4ca-2f4f5797983mr67378231fa.36.1724751420683;
        Tue, 27 Aug 2024 02:37:00 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f4047c6436sm15012881fa.35.2024.08.27.02.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 02:37:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Trevor Gamblin <tgamblin@baylibre.com>
Subject: [PATCH] piglit: add missing dependency on wayland
Date: Tue, 27 Aug 2024 12:36:59 +0300
Message-Id: <20240827093659.1270472-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 09:37:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203821

After the recent piglit update it fails X11 builds reporting that it can
not find wayland-client package. Add missing dependency.

Fixes: 9662bdabf3f6 ("piglit: upgrade 22eaf6a91c -> c11c9374c1")
Cc: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 3a2dec34d7e0..7cdd38d823cc 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -23,7 +23,7 @@ S = "${WORKDIR}/git"
 X11_DEPS = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxrender libglu', '', d)}"
 X11_RDEPS = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'mesa-demos', '', d)}"
 
-DEPENDS = "libpng waffle libxkbcommon python3-mako-native python3-numpy-native python3-six-native virtual/egl wayland-native wayland-protocols"
+DEPENDS = "libpng waffle libxkbcommon python3-mako-native python3-numpy-native python3-six-native virtual/egl wayland-native wayland wayland-protocols"
 
 inherit cmake pkgconfig python3native features_check bash-completion
 
-- 
2.39.2


