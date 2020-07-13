Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
 by mx.groups.io with SMTP id smtpd.web10.20454.1594649870713134051
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jul 2020 07:17:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=jzRo2Z9E;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.195, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f195.google.com with SMTP id x8so5566974plm.10
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2020 07:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=sD84jseW/QWb4KIJMh/74r2G8/APhzhO5AW+iOaevJo=;
        b=jzRo2Z9Ele+7IsqXlaGxSxkUn+KqA70TRgsbZVpqjXA9DI3quXm5+YqGdYj1VvoTBY
         Pq72ow0Dz0Olr2/nhXhFUtDag9ec+ujDYssHD7c9LxgPLxLPY/Mopw5j9zDNB+unuCCl
         8D86HhJwnJhPiWnWKsbX/W9NtRv/lpqz7OTAoCzvGQ4kVgyy6ye0xGTRKcsY7ZHmgLWD
         B1pi1LZFE6XZYlFnv8wYTJtKdIxTzSYMzoO5/LqCvi8IDOTOTEsqA3CUnY976NnKDNY9
         K/INr2Hr8EjG7owTJnhVqIwm6rlynWpWVLULcXdC+sqknCs0BwpHXmArlXNX1l1242Lf
         dhZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=sD84jseW/QWb4KIJMh/74r2G8/APhzhO5AW+iOaevJo=;
        b=eZGmJkLtuk2OSGtEzpGKK+ky5w91u72sPEz6xwqijvM+lQeRfcb5pzVgvLS416CFs2
         kbZ5dLpFZ1IBYYPgfP0FoMuFd4II+O61D4JnrY08FgjOs8wHpsvcwPNjPdd1s33SwVO7
         uo/u3wLEfR495gbxBVq2Vf8DCNgjDDg98BNQEzi+NkFRI2dwjQvMGacKTmJbBym+hrqT
         ggLFAJbrfodA46HUOCGg1yCJQdDthhOQK3L3H30jm2HHgdGpSM3Sa9nPYH8iZ3mx3p75
         gWg/H/N6vFT5lXQztUgBrzXCGmyukdjKMPWDq2UFH/cP9Vp7w1O7JbXWuHVMHQvBkHe+
         ZIww==
X-Gm-Message-State: AOAM530cBYNhFJc1UIZ3A8fW3Np+gXQzRMsRY3ZEjF8//xCG/MAZceUJ
	lfeJhC3hpy0w1hG7Xef9mPXyPw4uckzSaA==
X-Google-Smtp-Source: ABdhPJwLFPGpcrNySMWOuSYAGpqZOA9UT9sVaoCDekpARD6T5WgenjlSJssoM0fF7UlzO1ccITZkng==
X-Received: by 2002:a17:90b:353:: with SMTP id fh19mr20471790pjb.196.1594649869769;
        Mon, 13 Jul 2020 07:17:49 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id k7sm13723738pgh.46.2020.07.13.07.17.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 07:17:49 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/15] devtool: default to empty string, if LIC_FILES_CHKSUM is not available
Date: Mon, 13 Jul 2020 04:17:01 -1000
Message-Id: <87df275eb298e46abef12e96f124e687266b97e9.1594649587.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594649587.git.steve@sakoman.com>
References: <cover.1594649587.git.steve@sakoman.com>

From: Bjarne Michelsen <bjarne_michelsen@hotmail.com>

[Bug 13971] https://bugzilla.yoctoproject.org/show_bug.cgi?id=13971

A recipe using LICENSE=CLOSED would normally not have LIC_FILES_CHKSUM
set.
If LIC_FILES_CHKSUM was not set, it would cause `devtool upgrade` to fail.

This fixes the issue by defaulting to an empty string if
LIC_FILES_CHKSUM is not found.

[YOCTO #13971]

Signed-off-by: Bjarne Michelsen <bjarne_michelsen@hotmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 95e112f0f465868e98285509ea0d1a624a439ac2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/devtool/upgrade.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index cb6dce378a..327916ade3 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -550,12 +550,12 @@ def upgrade(args, config, basepath, workspace):
         try:
             logger.info('Extracting current version source...')
             rev1, srcsubdir1 = standard._extract_source(srctree, False, 'devtool-orig', False, config, basepath, workspace, args.fixed_setup, rd, tinfoil, no_overrides=args.no_overrides)
-            old_licenses = _extract_licenses(srctree, rd.getVar('LIC_FILES_CHKSUM'))
+            old_licenses = _extract_licenses(srctree, (rd.getVar('LIC_FILES_CHKSUM') or ""))
             logger.info('Extracting upgraded version source...')
             rev2, md5, sha256, srcbranch, srcsubdir2 = _extract_new_source(args.version, srctree, args.no_patch,
                                                     args.srcrev, args.srcbranch, args.branch, args.keep_temp,
                                                     tinfoil, rd)
-            new_licenses = _extract_licenses(srctree, rd.getVar('LIC_FILES_CHKSUM'))
+            new_licenses = _extract_licenses(srctree, (rd.getVar('LIC_FILES_CHKSUM') or ""))
             license_diff = _generate_license_diff(old_licenses, new_licenses)
             rf, copied = _create_new_recipe(args.version, md5, sha256, args.srcrev, srcbranch, srcsubdir1, srcsubdir2, config.workspace_path, tinfoil, rd, license_diff, new_licenses, srctree, args.keep_failure)
         except bb.process.CmdError as e:
-- 
2.17.1

