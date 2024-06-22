Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F484C27C53
	for <webhook@archiver.kernel.org>; Sat, 22 Jun 2024 11:58:17 +0000 (UTC)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
 by mx.groups.io with SMTP id smtpd.web10.95799.1719057487184351725
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Jun 2024 04:58:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=bybCWyaC;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.178, mailfrom: steve@sakoman.com)
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-376208fbe7bso11186365ab.3
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Jun 2024 04:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1719057486; x=1719662286; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4GArektbN48DpPPimPqvlKjjqrUMOBfEpytN34p/YdI=;
        b=bybCWyaCSfTRQRMii6yRJgRl7UeeHF73Jpc0wG5zkg79OnQjV01vY2BMxBe2mI+o+e
         hfk1k/pBr1tgN1mf5tRZOj19llSAUXGSFYecv/aRjmQWW1XjLWhW4Z9sXuAyWWPGMAa5
         EDPfTrjIxRH+v9Fl0Yu5N9ZXWONx3RLm0Xzb+bWL3gKOtMMqQEVrX2Tt4PJbuknrkMSk
         XLyu74vr+q0CuUuz00MeGIpO5PeJCxYjwJRVreDZuD4f0d6lIajTGjGafrn7AF6NfWnD
         TOEbXu2mWyNsdH0PEuPHESaJ/HQ+8G6NVhGfWJSz0yKk6KzEsuQOUM6j4Vh9mhsoaBYG
         ALUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719057486; x=1719662286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4GArektbN48DpPPimPqvlKjjqrUMOBfEpytN34p/YdI=;
        b=Gy8AhKIncGH7fvLERZAfipMEFpJLjaMDkut54tD+7NAfRyFMxCvHfDbOMlgVbPYkKz
         E6AaBJoYHG81AUq4xwh0wyEhiZXAA9ow0VajHSHKFJjt91l4n2YMgaCfavXDIL0r+cDc
         01ZWgoXcZp/mwjZowwrXjICaVXGv4CAc8FUMBw/EYvXkfzsiuCyP0cMEZtQQztk2W75F
         n8Tbtnr0dg7FDKx175LOKBg7GH2cIHrInOCnWyvp1jeWnzl6apBc8M0IuPF4En0hjYz3
         Zp6lrl5iRTI9lfXxRAKI4yrQ/FgXrytxR0xxfudQN749CmZFVW4JbUeyGx0e3LDljtbv
         RhEQ==
X-Gm-Message-State: AOJu0YxSGKNd+Pne1NMAlNQMrY927NUOEl5+9GvL28Gv68XNJC4hooB6
	zUWC0/mK5CwFHlQ/UoQwWC8pSmLbHxjJvuow5x8M+NFmqDSFqxfuZZX2ro1uMkDwy+vwX6bVk8P
	s
X-Google-Smtp-Source: AGHT+IGXVR+X6NTK8lILjYqTegsXlGK+lT1Shlz7dxd/heyR1wzT0ED/Lv6N8UldqFV8SLfQdqWbig==
X-Received: by 2002:a05:6e02:1c2b:b0:375:efde:97a6 with SMTP id e9e14a558f8ab-3763df4d275mr2959915ab.7.1719057486239;
        Sat, 22 Jun 2024 04:58:06 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-716b364687bsm2101074a12.12.2024.06.22.04.58.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jun 2024 04:58:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 5/9] glibc: stable 2.35 branch updates
Date: Sat, 22 Jun 2024 04:57:32 -0700
Message-Id: <8accff90a850265ecc8570cfa15e8e5963d2a5d7.1719057291.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719057291.git.steve@sakoman.com>
References: <cover.1719057291.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Jun 2024 11:58:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201043

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

Below commit on glibc-2.35 stable branch is updated.
72abffe225 Force DT_RPATH for --enable-hardcoded-path-in-tests

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 1a8d51ef63..a5903bc5f4 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.35/master"
 PV = "2.35"
-SRCREV_glibc ?= "54a666dc5c94897dab63856ba264ab2c53503303"
+SRCREV_glibc ?= "72abffe225485d10ea76adde963c13157bf3b310"
 SRCREV_localedef ?= "794da69788cbf9bf57b59a852f9f11307663fa87"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
-- 
2.34.1


