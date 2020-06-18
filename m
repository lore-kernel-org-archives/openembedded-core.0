Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.web10.10609.1592494987154929494
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2020 08:43:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=qj3IYWvh;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.53, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f53.google.com with SMTP id q188so1263385ooq.4
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2020 08:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=8plCM7mY9iZlqnWfcIbvQ65w/awAqm/eJ1nkg61gWJI=;
        b=qj3IYWvh9VTtt2aruvBYnhE0pC+V+aYRBXGn7YpiAreq3CRgzEXjXgiNHnG2Psu2+r
         k0TllyBm9IlLCiFUWJiJdGFKTtYs7L2xTSHM8OTu2c9noSuJIffDp6tH/Ip4ZHqulqG6
         0QrRqpNeBcRJox5T4Nu4xW0WFLOhnXfaEiv6K+jOKYvo5Q165Fazk7c7hOlfzKaNf6ri
         ge8GvLyQ8lI5y9JaPiY/hxYikK6dilmxQKo7/4XQBKNc2qOeSdvcrNV7PPE4Lr74EP2d
         IAd4i3YN3MVJhJFWNAz0bhHsWCFTjhbKpa7r8aOCN0mr4XJzw2vygdHWeiZxCV3COkN1
         4wpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=8plCM7mY9iZlqnWfcIbvQ65w/awAqm/eJ1nkg61gWJI=;
        b=thDGiunM1I5iv78I3UoKLRGp7SScVgmr5UZYSD9X20OZWUpgOY2NCzngS+4l+MSQap
         gFu72CjSVvyngkZG5w/fyz0NVKJYXpBM8ovdCBwQXXREQxWZgeA4kB0ul0NtkNsgOpG8
         hGtXU3K3zL8XCoMBx4KBgXN9zOJ4ueIrUsKnnnecYwqukElK6LxPE2UeYF1Jt7B/hJHD
         OwiI9IaQZ0G6rJSXOG1bMgJJ2c2YcSF08PM6DLooC7b74U0cUNnU1sodXw6Qv0cQtZ18
         sNqBE03xUnEv2KoZhtN0u//HxKvKuDuD/eb1KYHTvtmIRYOUFX+q0mmD6w1adekefYbk
         dtNA==
X-Gm-Message-State: AOAM5320k112SR8vzwp5VPuuvcN9FjIXTZjK3A/hxO8uXrENP7W5AB+j
	5SE0udH4eueXOj80/IdRT2yI/ewJysz1lQ==
X-Google-Smtp-Source: ABdhPJwpnWQVfmLJUWfP9wCN/lPcJEIJP2PaLuTSaA9yV7/XPr5GizrpUCpt4ymqgbCup/0bYsg/5Q==
X-Received: by 2002:a4a:7546:: with SMTP id g6mr4632442oof.51.1592494986031;
        Thu, 18 Jun 2020 08:43:06 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id r7sm768843oor.9.2020.06.18.08.43.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 08:43:05 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 18/21] valgrind: Do not use outline-atomics on aarch64
Date: Thu, 18 Jun 2020 05:40:48 -1000
Message-Id: <48c53bc81963621e8e9fbb89277d1a3d10f153d5.1592492076.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592492076.git.steve@sakoman.com>
References: <cover.1592492076.git.steve@sakoman.com>

From: Khem Raj <raj.khem@gmail.com>

This avoids the __getauxval undefined reference error seen with gcc10 on
doing static linking with -nodefaultlibs, which is uncommon usecase
anyway, disabling outline-atomics is not a huge deal for OE in terms of
performance as we already use -mcpu which is tuned enough to the SOC the
code is being generated for

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3952738d083b888e5b898ed3d63a0ed9a4dd3712)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.15.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
index 7954437a1a..25837e4b44 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
@@ -74,6 +74,8 @@ EXTRA_OECONF += "${@['--enable-only32bit','--enable-only64bit'][d.getVar('SITEIN
 # valgrind checks host_cpu "armv7*)", so we need to over-ride the autotools.bbclass default --host option
 EXTRA_OECONF_append_arm = " --host=armv7${HOST_VENDOR}-${HOST_OS}"
 
+CFLAGS_append_aarch64 = " -mno-outline-atomics "
+
 EXTRA_OEMAKE = "-w"
 
 CACHED_CONFIGUREVARS += "ac_cv_path_PERL='/usr/bin/env perl'"
-- 
2.17.1

