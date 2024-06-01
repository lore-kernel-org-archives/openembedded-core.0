Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC561C27C52
	for <webhook@archiver.kernel.org>; Sat,  1 Jun 2024 12:25:26 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.36172.1717244724140425824
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jun 2024 05:25:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=I0wSuEkT;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1f44b42e9a6so23125645ad.0
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 05:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1717244723; x=1717849523; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NC/1qvevR2tCOgOyY80y2D0ENBAkTgXsH8g7Pvr0A/E=;
        b=I0wSuEkTGgUd8kFP94nKzbS8J9ZU8crANQSSXMjSI8kXTuyuTdv0HpIA/sr3ehAkUU
         Kog4WDhuN5tDOtYEupRzorh7eBWwMeQCgCVk5rpQM+zTaEYnOYRxlOiymxEXhDlpCo5V
         jZp16Tv5H0ASir4j/0yt/4hcNLFtSF7GiZ0PElG0V/8Wp94Lz6D4jptJdvMIrXU6ddDG
         5atjOszi9XtsqxYoOPTM//6YpxgubP+21szJouJBqY5Cb7CLgpXX5spS4LJ5lWAq0qSe
         rCFjXvS6cfp9/lgZjEeOaMlIhTZ3rPXu4w10EKsWMsUIz95ilm5ZRIG/zMPj1L2L/MAZ
         /wmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717244723; x=1717849523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NC/1qvevR2tCOgOyY80y2D0ENBAkTgXsH8g7Pvr0A/E=;
        b=STUD5Vswjvg1A44oVr30gJbaeoTE/Jdjv1P/b1OHoUMvUvvKQl7h9zCMx1n6DZWWSI
         1pBPnsinOCkpI+9eAIvDdF3ENHcFMb3ADDt8ulIAQYvCx9RKdqpVp5hSqoEP6iQEk1qu
         y8g1d7gOcjHb8K6mnWQBgQn0KDFF4BqzhlHFfMGTdEIDq6eG6V/Hu/Hwlxa039J+wpBc
         5EpFLp0qR60oWrgmWEtnN6HaZCoYQBOwqS8ITvAy0tffMQB4+aVCjXT4zPp7WJEqJIw0
         JxfOSXHSEOaTe+aM2YontZ/9ngSID3lb6GOqfS2mz4+lvQPmLJ4hHCFB1Hh++/ctA9kA
         QFSQ==
X-Gm-Message-State: AOJu0YxMV1p3/GT5K0r73eVCB9lRxhYZgDL4dJA13EajTHRibi0ZXI/H
	Q+WDhmn/KDQFqnOg0Je234hTdcRwTma7BUO2JKlKc/91h9bytio4MImnpfk+OnzbAg02BB0kG3N
	n
X-Google-Smtp-Source: AGHT+IEd7C2iE0PhcQegwPADervEVuOu5P6ti7O045gwri9p14DCdaeZeci99yDLOB//5nVejSBglA==
X-Received: by 2002:a17:903:32c6:b0:1f4:962f:6343 with SMTP id d9443c01a7336-1f636fe8771mr48601945ad.3.1717244723142;
        Sat, 01 Jun 2024 05:25:23 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f63241d4d9sm31804165ad.296.2024.06.01.05.25.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jun 2024 05:25:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 21/21] git: set --with-gitconfig=/etc/gitconfig for -native builds
Date: Sat,  1 Jun 2024 05:24:47 -0700
Message-Id: <a3f5ac9f9fee2c8e10fec7c3f758e49513fef724.1717243719.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1717243719.git.steve@sakoman.com>
References: <cover.1717243719.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 12:25:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200117

From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>

Commit 6c2ae2346db0 (kern-tools: depend on git-replacement-native)
broke our kernel builds. For saving space and time, we have a DL_DIR
shared between multiple users/buildbots, not all of which run with the
same uid (and with appropriate sticky bits set so that files
downloaded by one user become owned by a common group and are readable
by others). This works fine also for git sources because the docker
images we use all have a /etc/gitconfig with

  [safe]
    directory = *

But with the mentioned commit, the host's git is no longer used for
do_unpack (nor for do_fetch if re-building and sysroot has already
been populated by a previous build), causing spurious "fatal: detected
dubious ownership..." failures.

Currently, the path where the git-native binary searches for system
gitconfig is the sysroot from it was built, which obviously doesn't
contain a /etc/gitconfig. As for the nativesdk variant, respect the
host's /etc/gitconfig if present.

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 572f511f7ff02fb559ac42d2d5dbd09fec478d97)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/git/git_2.44.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/git/git_2.44.0.bb b/meta/recipes-devtools/git/git_2.44.0.bb
index 90e555eba7..78b00dd19f 100644
--- a/meta/recipes-devtools/git/git_2.44.0.bb
+++ b/meta/recipes-devtools/git/git_2.44.0.bb
@@ -40,6 +40,7 @@ EXTRA_OECONF = "--with-perl=${STAGING_BINDIR_NATIVE}/perl-native/perl \
 		--without-iconv \
 "
 EXTRA_OECONF:append:class-nativesdk = " --with-gitconfig=/etc/gitconfig "
+EXTRA_OECONF:append:class-native = " --with-gitconfig=/etc/gitconfig "
 
 # Needs brokensep as this doesn't use automake
 inherit autotools-brokensep perlnative bash-completion manpages
-- 
2.34.1


