Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB6DBC35FF3
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 16:12:42 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.31794.1742141558023727827
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Mar 2025 09:12:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aI7vZfUZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4393dc02b78so7183215e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 09:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742141556; x=1742746356; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/U+d0wAedXrtLor3ROgUg76pJ9JCKPf2giPLQI4fJno=;
        b=aI7vZfUZ7i7rVaQNLtsgTrbRvkDWvRky6HtiWgYDrg+69cHRYtaU/akHI33yyHl6br
         lWFOm0BPkMuLZEJAoncv2uwMQgUyoQMM4U6wNf8dnRhyL2u4RNisdWO/QDWISEanvR06
         GxePS3yg1b8nMvsYWtNuMLh34ygu77Uf0JZ1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742141556; x=1742746356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/U+d0wAedXrtLor3ROgUg76pJ9JCKPf2giPLQI4fJno=;
        b=Lpr7mSC15BKLJ/Xa4zEgBo7FeHTubRGzAIswmfC77lRywPlOMv3TQgZoeDu2dYdMF+
         RRIxKNpBX+sSuOdrGss0cDYSWwfmFB0YEpjGtpuh17gh1T0hbeMIzPUoNFG4Q37NvRUp
         baYraSNybXAx+02dHsoJXIPU9NNrRnwfHqhmjGmis9tPS3lG1XSQFTlRy/fVxL0tyGRg
         hJkYG/4RGLmvQ+wyFLLSSNqLXOKhwmbBUNBBhmMZsKeN3o4g29dKSa/tzkpIV7odw7NP
         +h8M4Tht/L1O4Jvpcb83cClZ/4Bi1CLDSNMiiZWpJMc61+Z0EypCDnIl8BlR7T1Crfxi
         02lQ==
X-Gm-Message-State: AOJu0YzyW2yI+rnxAKE7YolZu42CB7lqKeBdu4bhZD79Nc1NmzRQpra2
	t12sXCaPp/TIgVcU7i3SgdjgVCtt9Api9TRejQssvoswUJ1YY9ev/ramjeu3NtAOHxAlulpUa4r
	t
X-Gm-Gg: ASbGncuSLlpu+zC6B36liSamiG/TsG9XowV4pXYUQOJ8tWl1Va0k+o9Bqz0nuyR3Xdy
	fTzQThED8gC427+GKqnuvp8W7wMlv7hwnhvlpo1wob2lnhmRVwyIlhKDI66Z6mFgC60OPsxoz24
	BvIWxKj4W+/S/SKU7+9P22HSEM94yyeNO9g72aDDymAuT1L0L83mtAeuXKsrPLMWQ/N3IvJNyjR
	4luNtI4DLGpuDI0FbC8uWXV4xwTHon/4nCyJtonD9za9KBj+LKMx0db+F+hBneaWZbGHE9bf9n9
	mBfj3/aW7jZ7jmBMQIU0bO9RlEq0a88fkBC+YFvLuRDxDZJCbBWOaKrbFWkd+imTEG8uVbj9LA=
	=
X-Google-Smtp-Source: AGHT+IGH6eQJhI/U9i8Edst6ldz0PxEEsHJTaGrrA7WfB1D1PKdYsiwZuUGSOE9+7TQ3/salvn7QLA==
X-Received: by 2002:a05:600c:1d1a:b0:43b:cc3c:60bc with SMTP id 5b1f17b1804b1-43d1ec87be2mr114401895e9.15.1742141556039;
        Sun, 16 Mar 2025 09:12:36 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:bead:7cef:d139:9ec0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d200faebbsm80252225e9.30.2025.03.16.09.12.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 09:12:34 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 18/43] puzzles: upgrade to latest revision
Date: Sun, 16 Mar 2025 16:11:44 +0000
Message-ID: <20250316161209.3629986-18-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
References: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 16:12:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213021

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-sato/puzzles/puzzles_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 2df512a5cda..15f6979beca 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -10,7 +10,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI = "git://git.tartarus.org/simon/puzzles.git;branch=main;protocol=https"
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "79be403101d055d2fde3611a5f133135d4094ee9"
+SRCREV = "7da46412223273b3adf6d513466342b9d3a5c869"
 PE = "2"
 PV = "0.0+git"
 

