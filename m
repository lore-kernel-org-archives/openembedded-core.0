Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
 by mx.groups.io with SMTP id smtpd.web12.40856.1590446246530322039
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 May 2020 15:37:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=TesobYd9;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.196, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f196.google.com with SMTP id f21so6130679pgg.12
        for <openembedded-core@lists.openembedded.org>; Mon, 25 May 2020 15:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=2nZJVLKm0LmOdaJgP7AfgEdF2Pli/V8un581lPVeBpE=;
        b=TesobYd9t0eLwtvTiGN+xoM91MUKGBQtFCCYVRl1wkSbX1FYJDt5gEJ9Sr3zz3C/UX
         nXDm80rTrGLEnd8eza3+mmY4b5MvCyGcKaLjvFQ0WZXtCvSCdcHt4/BbF2yWNkUbm1v+
         oOnpwiwh5TMDsnXvdZhOUfFe4WFxKSBoiJbeIo3lml1y0GkBHKW4aA6FEu+KVgxV1EnI
         Neg9mZth8JlxC8IbKKqmROxWALFRCy0W84SRICz3hvEiJZnLlFoXFqpuYKWAnjqGYyK0
         Wzm5wwSQ0wT1Q4f9EZTLB6UnFv5PXtjScUHPWR/U8CD+/vWJtIgIeqeNwolQdJBlD9H7
         V4DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=2nZJVLKm0LmOdaJgP7AfgEdF2Pli/V8un581lPVeBpE=;
        b=c9SzW9Ra0hkJit8jaFiaeSUjN9nG0Du4iATWdQMFZHMfjgnekG5saZ42L4T8a7mF4m
         rtFb1n1RaCG1uhQGyaPjrnLkMJQsNSWRwECf/qL07vf65BdSPPYBEN+XcmPpIvVl10hS
         37ed7KfrW1Aszg5o4WlAPpisfjHsw1T1VkErwJQ0OZxX3sIMkCic+GC7/xqwY/SxG+3R
         sYBiEsB5eAFB3V5XlbBhUmQDzbMWjX1RB7NWDOAAwT0W8MDZC+wDNHfyutzy9XetDYXg
         iuwtDz9eFv2rXggcUm0PXEm402Nuz4OpJmszfzZYJW3cAZHHKqmCnLldRSF7w3LJOXGK
         oQVw==
X-Gm-Message-State: AOAM531jbJ7rXXjNfx9U9F1qg+Yhat2muoYjFRIWttNywQ/nMH04JYTA
	GM1rJmTjo7iT0zuGvoI2KCxmyaYkR7s=
X-Google-Smtp-Source: ABdhPJzoxc+C2GY/txoP1S1FgZjUj5RUba9N88LxnUaedUIgad6SMcPYTJDvLBJHXicj8EgHC1AWyw==
X-Received: by 2002:a62:3584:: with SMTP id c126mr19053670pfa.316.1590446245645;
        Mon, 25 May 2020 15:37:25 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id y23sm1990432pje.3.2020.05.25.15.37.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2020 15:37:25 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/17] archiver.bbclass: Make do_deploy_archives a recursive dependency
Date: Mon, 25 May 2020 12:36:49 -1000
Message-Id: <66a2e4bcafb3f8835bb21d73a9e78e7d9d15bbd3.1590445868.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1590445868.git.steve@sakoman.com>
References: <cover.1590445868.git.steve@sakoman.com>

From: Paul Barker <pbarker@konsulko.com>

To ensure that archives are captured for all dependencies of a typical
bitbake build we add do_deploy_archives to the list of recursive
dependencies of do_build. Without this, archives may be missed for
recipes such as gcc-source which do not create packages or populate a
sysroot.

do_deploy_archives is also added to the recursive dependencies of
do_populate_sdk so that all sources required for an SDK can be captured.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit e1feb6030cd8e77c553ec10a366cbeb7e902bada)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/archiver.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 48b4913a9f..43333a7551 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -583,7 +583,9 @@ addtask do_ar_configured after do_unpack_and_patch
 addtask do_ar_mirror after do_fetch
 addtask do_dumpdata
 addtask do_ar_recipe
-addtask do_deploy_archives before do_build
+addtask do_deploy_archives
+do_build[recrdeptask] += "do_deploy_archives"
+do_populate_sdk[recrdeptask] += "do_deploy_archives"
 
 python () {
     # Add tasks in the correct order, specifically for linux-yocto to avoid race condition.
-- 
2.17.1

