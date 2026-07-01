Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70885C44500
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 07:54:32 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39679.1782892468982492012
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2026 00:54:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kkzTzenP;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-92e52c9fddfso21247985a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 00:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782892468; x=1783497268; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uKwxjrpDKYfu/m9GuR0fY3bjyK3h2l3VaBufTKmqEVo=;
        b=kkzTzenPWffFDS9Cjux8qRYfQjp+aFwjP/CnPfnj5tWOiiNVkLNgpuDCPtwZzxFLRl
         vCHsqExw/cZKexkKu2sx1rPsCn5724wnxguQnPAhu/Fkn3v3X89HuqNfNp24aktrq61U
         p3/faK7pXR6IhZGPwHu3sFIk5mFwZOAZHsO6QfQudsh+AiZ7oBStmTwwqliTKGbUTSEz
         fvN3FuwT5RdCe7g3E++ACp25H/yg0fE3MuoLPBUYzuBp1Gfzk6zm2aK4WLl8OfN7+IBE
         Y/4MoF9SgKhBQUuK52afoH4yG/6dQZOeciHB81R0V3JbGOuHEEZP3jp3M4zVpmvyGgQ4
         rCDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782892468; x=1783497268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uKwxjrpDKYfu/m9GuR0fY3bjyK3h2l3VaBufTKmqEVo=;
        b=HC+1dqCzwL318G44TW3+HVXfco8GFv28Cbn6WpudCGzp8scWd4J8zvBmIG13Edt1EO
         KLjyPvy0jdr/3Ivq5TBGXQYJpP4lsWidj5uGQZAkUD0W/O3FB4Wj/zgvcoRxnyqblS/H
         WAyjyxGif6GWVozyTgEh/jBVTGL/s6wA5ftOWalLEdfjS/QEjHo7nbiqHeD8Zb2Lw1+8
         zlTqWhO3Lp3RlIpv4VfWTHXmeXjb9DQio+tDP5kEvnonwvOkfry8adez2Rqpx5v/ri+h
         N1Ori5d+SZuib0CEMosnlVKL0VPc9gYWHd1vQyMqLckOPS5Oh+0ImwHaSJIrUjcL/M4Y
         8GWQ==
X-Gm-Message-State: AOJu0Yzvfk8pd2Hkx0yinGz3Jguxb/TvW1EwK//l/G0f+lI0Hwx6HM9s
	MpXDtzXDAF9YsXU3CmeWAxvN/8P7zRWM/NN7fuzRjOTLccccMy9D/tVGOAbVyA==
X-Gm-Gg: AfdE7cn/mtAgWbcAbjMfje0gkna3+Dyk2D+TW+wLzjv8puUz/6Wrv+X5Q8JR0amXiyN
	THGXHkzp2ov8rw6RZUv4gMWcs48Fx34q4zCZ+bMJuyn+BeDAe7PBJVhQIHJvUG/Ot8upbuVdubu
	ekxTwQsvuyRs4YiVZAyGiDqhKFWVoXlSlEjtLEPs2BZUlenNsPkzoHufBgKlIJsYE/jDi/m9pUB
	/HH3v+pLiZy+anPEsnCiFSG5gl0keS90xhHOiCC/6J4gLmHFTZHPEsU8+tPWDvfqIBs94lWMFCb
	HMRU6N7tqBT81IyqxV99azx3AnxggVgLkSi69igcxT4OoGj3R8D6ygVrV2POZFtOs46tIaQ/+TF
	19tjmk6rMIUHEkNq/Yqa5m4DOuwDQbVvLdoWsjXo/BDqJPRr+jU/XegUKSfGnnGWWkJYLYPOQk1
	g9vx07jhV8XnLe5lSsI8RgcKxP+2a6B/4utoT2oEIG4mTPRVtcE9oum9rWhmMF9R2zAQ==
X-Received: by 2002:a05:620a:2991:b0:915:8f08:5fa7 with SMTP id af79cd13be357-92e784f0698mr67200485a.52.1782892467911;
        Wed, 01 Jul 2026 00:54:27 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e62371ba1sm502294485a.42.2026.07.01.00.54.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 00:54:26 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] buildtools-extended-tarball: use nativesdk-wic
Date: Wed,  1 Jul 2026 03:54:10 -0400
Message-ID: <20260701075411.1092848-4-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260701075411.1092848-1-twoerner@gmail.com>
References: <20260701075411.1092848-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 07:54:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239951

The extended buildtools tarball carried nativesdk-parted, -dosfstools
and -gptfdisk so that "wic ls" and friends could work on an image. That
list predated wic becoming a recipe, so it provided some of wic's helper
tools but not wic itself, nor the rest of the tools wic could invoke.

nativesdk-wic now pulls in the tools it needs on its own, so replace
those three entries with nativesdk-wic. The tarball ships a working wic
with its full tool set instead of a partial set of its dependencies.

AI-Generated: codex/claude-opus 4.8 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/recipes-core/meta/buildtools-extended-tarball.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-core/meta/buildtools-extended-tarball.bb b/meta/recipes-core/meta/buildtools-extended-tarball.bb
index 633f8e6b99d6..9dddd70a2ce5 100644
--- a/meta/recipes-core/meta/buildtools-extended-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-extended-tarball.bb
@@ -30,9 +30,7 @@ TOOLCHAIN_HOST_TASK += "\
     nativesdk-glibc-utils \
     nativesdk-glibc-gconvs \
     nativesdk-libxcrypt-dev \
-    nativesdk-parted \
-    nativesdk-dosfstools \
-    nativesdk-gptfdisk \
+    nativesdk-wic \
     "
 # gconvs needed for iconv to work in vim builds
 
-- 
2.50.0.173.g8b6f19ccfc3a


