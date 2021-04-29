Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web12.2042.1619668395127190154
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Apr 2021 20:53:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QkEZ5U25;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id h20so34038041plr.4
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Apr 2021 20:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bEozpZ1uiUz/WAq341b7lqf7jIrMNdKE+qvJgmZStZI=;
        b=QkEZ5U25Vfxlh222C3lTGT9B0XW+lgng9HAv6PvN7o9nioD01fdqorOikLBtc6dveT
         FRZ+kphvBMl5xytpblojq9296Ko2sl04rodbsZwKP7nol1g2Oc1STQC6KgZa294dGFuC
         SLaE3/BBBMRjJKsmvNEaXYrNnZzAXk+rmubFXEokmowD8u7b0o2ge8xUqAxIlrU4VxJ1
         bq/y7XIoHk5UYe3mOcc9zxIEhEKy9VrcvvlQ/VSU70o/Olbu8em6VBku52KUtjLlD0Ey
         Zcy5Th/QIjDcNf342BSjfBpajOQWcal73icVkidWHQqaB3OqOrMGX91FsAztM9dCKL9u
         gYSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bEozpZ1uiUz/WAq341b7lqf7jIrMNdKE+qvJgmZStZI=;
        b=NAIh/UkCgW0brYOU1DGzwkRDGeY0gJb810rZ3aVnoOTMl+zllo0Zn+FR+rGf5CMxNN
         PU4kx8rWFW+SieBeue37hjiz5oxkS8vRBO8vzOpOMwxwqnmO0cAkhXakEl40wm4Ygpa8
         dqZPbx2Zu5KAcQcdtP77uucPq6tyxuvbOcoVxSNUXPEyEvN9fyWCzR+4GdJU8dR2IfLc
         Ix4l0n0cRvLAI1+Crm7Tb38dI1xOt3mmSSwIk9Hma3181rGkwJGI9MgzraGp9+qybPqp
         C9eyt7fiX8UM3asNDOyVU+I6AZf2/tQGPgRhbdE1bCQXN3CQw+OUbXOEwSEnvmoxZZsB
         pl0g==
X-Gm-Message-State: AOAM530LjxD6UTI6xXyIEI4TBY0Z8S6rqNLia7OFAUOM+nXWsas3x4cx
	GioD4c+2aV9ztOk9axCAYxB+8y+cFCO0yA==
X-Google-Smtp-Source: ABdhPJxxdRnqH4qs8PCizZS2vEQi7iijC7NWUo1xAblg4OktQ9pNe0NVJVBGMn3yiFnuKaBc9lj3lQ==
X-Received: by 2002:a17:90a:f009:: with SMTP id bt9mr10984190pjb.137.1619668394283;
        Wed, 28 Apr 2021 20:53:14 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ef3])
        by smtp.gmail.com with ESMTPSA id b7sm996929pfi.42.2021.04.28.20.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Apr 2021 20:53:14 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 1/2] libgcc-initial: Do not build fp128 to decimal ppc functions
Date: Wed, 28 Apr 2021 20:53:09 -0700
Message-Id: <20210429035310.993762-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210429035310.993762-1-raj.khem@gmail.com>
References: <20210429035310.993762-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These functions depend on glibc headers e.g.
stdlib.h/fenv.h/string.h/stdio.h which do not exist when building
lbgcc-initial, and these functions are not needed during glibc build
so we are fine to disable them

introdcued with [1]
[1] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=781183595acba67a37c66f59a0c1d9b5fee7e248

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/libgcc-initial.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/gcc/libgcc-initial.inc b/meta/recipes-devtools/gcc/libgcc-initial.inc
index 06bf224f73..f7d8041226 100644
--- a/meta/recipes-devtools/gcc/libgcc-initial.inc
+++ b/meta/recipes-devtools/gcc/libgcc-initial.inc
@@ -51,6 +51,8 @@ do_configure_prepend () {
 
 do_configure_append () {
 	sed -i -e 's#thread_header = .*#thread_header = gthr-single.h#' ${B}/${BPN}/Makefile
+	sed -i -e '/^libgcc_tm_defines = $/a fp128_dec_funcs =' ${B}/${BPN}/Makefile
+	sed -i -e '/^libgcc_tm_defines = $/a fp128_decstr_funcs =' ${B}/${BPN}/Makefile
 }
 
 do_install_append () {
-- 
2.31.1

