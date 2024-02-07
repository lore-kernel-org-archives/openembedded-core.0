Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DACDC4828F
	for <webhook@archiver.kernel.org>; Wed,  7 Feb 2024 22:56:22 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.4756.1707346581627085533
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Feb 2024 14:56:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XqNXiWrz;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2907a17fa34so917334a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Feb 2024 14:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707346581; x=1707951381; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T5p/7VM3P+K2scxn+Z/Yt3oZq8xDukdAi0wL8DGlMT8=;
        b=XqNXiWrz6q+gubdvuZiPGr02NtacedX7/lSTtghwO3LurIN8qQvzmOrOiaCTy6or4B
         RB3AlWrOVjbQkqH6abD6A0UabSVIbv/DhPlOf3NzfwiWf/dmmRODolUZUTbUw8gvt21g
         pcEoxcsjSX86xTUnZDd1z7np2d/qQtt/QJ0rC1aRmBcIcn0mUSnb2wP3iP8L6mSEVCtv
         emZw+dQ6hU7CDMg5xAaS1tGNHbM2r6Xv2VflMgn6Fy18jd0JD+oyPA5uVtqHK90tUem1
         ASvVZKcRtdpsTfjgmwExrZzYwfgj3MXe9LmFwAppWrdC6OWtTaBq6+GzcnBGu76zQJk+
         JfEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707346581; x=1707951381;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T5p/7VM3P+K2scxn+Z/Yt3oZq8xDukdAi0wL8DGlMT8=;
        b=w0DrZDfZTouoyTM8K+PkMSuWu2XrFvgCUugjd8KA81cei/wNh09XQfa8tPt7aSMAT9
         Jj2GwIG29EoKx42VdNMR25LuiogV7NoY5OkQWI3VpV7NDxalNbRr0dUFLRJV1Zwkx6pr
         4UGwrSUkutZD4G7iuoTs/rNI5ITKmbX+y8w1lST2oH+nPxIA3vkgNJhNoO2n7o9IHLre
         vnf2guKwM4yNT7QOgKYpttGZUGpMUwyONOE3GeLa6GWwR3hrkh5Qe5B5Vz43oPhJm6U/
         C3RBalXwi8RqdINLbbyTK63Z7SkTWFtWXhSaR5gqheySxANJXEhBcJpbM+FUK/wKEkiA
         mLDA==
X-Gm-Message-State: AOJu0Yy8iBa9m9I6WC3KNrAw2bt/GMVFssEKSvKxk60W/1ei3dJCBVLO
	A+9hU6GmtPTmL9IzbnYfjSWwQEpa7UtGNc9DrFi9P6O7OUZrGVBnyoO6TdN5y94=
X-Google-Smtp-Source: AGHT+IEYZJjQ8TINCl+l3Urj8R3QgkE4XK5mG5fzQOqg/w3uLx2I+gyJRZ44zAh2e0mkh0nQxGvyHg==
X-Received: by 2002:a17:90b:4b4c:b0:296:6bd5:42df with SMTP id mi12-20020a17090b4b4c00b002966bd542dfmr4042613pjb.38.1707346580746;
        Wed, 07 Feb 2024 14:56:20 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::c29d])
        by smtp.gmail.com with ESMTPSA id nl5-20020a17090b384500b0029658c7bd53sm4583317pjb.5.2024.02.07.14.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 14:56:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] glibc: Update to latest on 2.39
Date: Wed,  7 Feb 2024 14:56:17 -0800
Message-ID: <20240207225617.4018010-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Feb 2024 22:56:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195095

Brings this bugfix for arm

63295e4fda arm: Remove wrong ldr from _dl_start_user (BZ 31339)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index a35c7b28a70..0d86917f454 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.39/master"
 PV = "2.39+git"
-SRCREV_glibc ?= "6d1e3fb07b45e2e31e469b16cf21b24bccf8914c"
+SRCREV_glibc ?= "63295e4fda1f6dab4bf7442706fe303bf283036c"
 SRCREV_localedef ?= "fab74f31b3811df543e24b6de47efdf45b538abc"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
-- 
2.43.0


