Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web12.26560.1592249800044593051
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2020 12:36:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=l4VeyDE9;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id ga6so272928pjb.1
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2020 12:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=v3wgLnHd5qIMv5Wll+d7qjpJEWNiESpieTLHlPoGJUA=;
        b=l4VeyDE9KSyeCo2ILU/c6zlRWnn99cmGRVi+VkHmZRjy+5+4blyoy9DRdSuOh9dE9M
         djytozW8Lswfg68QAuwMK3akjJTzj0dsKlv9jM+zex/135H1p7kVjoE94/FmRCsVlXhC
         8NubWjHBJv/aVKJ9mxOOcY1geUSIiZptKC+tSKOHbQ9WljDaAZc/gl8oVWkOprO5KNS9
         0EZyPICvtaspzqlPi/pmubmRrnwziPcLEQ1owFVlxejZFHzl+Uuct3y2Pz82KzrwMvDI
         GbX937PX10G8ZnWGrmyAVy4YM/hHxZ5ajmzipVV1Uqqeg4b8YGaa8xx0LBP2hTJoeNwv
         O4YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=v3wgLnHd5qIMv5Wll+d7qjpJEWNiESpieTLHlPoGJUA=;
        b=FzU5EHXS7N0IsVb2OlBJr75AP75BuBe5Ay6Ubjz8MzYxsRsRJFlbg4pWdVg/qbS6OW
         3o2+Lnu6ZM9pRqb/R/Yoq0TKCLeSMqc4anb8jF+PVQdrCT9LcgyGOZp8/oYHIWF1p4KO
         a/OmYEYftwZ9jxSbQAcZKuqt8Qc50ldIhtUM5ioSICNRJMd3CNYqSGV8Mwi7QcPuDgwF
         PeCu5l1jUvFiRnFOkAdKUIW6wG0T3Wv6WTsxUUlFpsuIOA4mCvVHtyFrCkffwnDS5Il1
         bu0n/S+FLCvLd1lOQdGHnKRlaOd5BCG/2VQgRpnl6gd0vcfeeI1jiaTXuciw19j6rpEi
         qsWg==
X-Gm-Message-State: AOAM533YXJbHvRlHjgWoexU6HGio0S8EiOYCfxnpkZE32ixbGsSNlFZq
	ZaXhgREtpgc8DyKIJPEO+7KvRz41Wis=
X-Google-Smtp-Source: ABdhPJwlwbD1wsw8Brr7TGVgOsNYtNeibAA9G0I5+Ck7RVOwnCpWQHkS1+wH3/EhRNn7r216VbPnUQ==
X-Received: by 2002:a17:902:9b97:: with SMTP id y23mr21902248plp.54.1592249798962;
        Mon, 15 Jun 2020 12:36:38 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id u1sm12405492pgf.28.2020.06.15.12.36.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 12:36:38 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 15/21] oe-selftest: Allow overriding the build directory used for tests
Date: Mon, 15 Jun 2020 09:35:34 -1000
Message-Id: <27b2d4634756511d8385ab9bf98ff5c9fcbbcba5.1592249381.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592249381.git.steve@sakoman.com>
References: <cover.1592249381.git.steve@sakoman.com>

From: Paul Barker <pbarker@konsulko.com>

This may be useful if the parent directory of the original builddir is
not writable, on a lower performance drive, etc.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dab719e5f1964fd48e9a35e6b9db1508b5414540)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/context.py | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index 48ec5d419c..17f2a0cf6b 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -22,18 +22,22 @@ from oeqa.core.exception import OEQAPreRun, OEQATestNotFound
 from oeqa.utils.commands import runCmd, get_bb_vars, get_test_layer
 
 class OESelftestTestContext(OETestContext):
-    def __init__(self, td=None, logger=None, machines=None, config_paths=None):
+    def __init__(self, td=None, logger=None, machines=None, config_paths=None, newbuilddir=None):
         super(OESelftestTestContext, self).__init__(td, logger)
 
         self.machines = machines
         self.custommachine = None
         self.config_paths = config_paths
+        self.newbuilddir = newbuilddir
 
     def setup_builddir(self, suffix, selftestdir, suite):
         builddir = os.environ['BUILDDIR']
         if not selftestdir:
             selftestdir = get_test_layer()
-        newbuilddir = builddir + suffix
+        if self.newbuilddir:
+            newbuilddir = os.path.join(self.newbuilddir, 'build' + suffix)
+        else:
+            newbuilddir = builddir + suffix
         newselftestdir = newbuilddir + "/meta-selftest"
 
         if os.path.exists(newbuilddir):
@@ -133,6 +137,7 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
                 action='append', default=None,
                 help='Exclude all (unhidden) tests that match any of the specified tag(s). (exclude applies before select)')
 
+        parser.add_argument('-B', '--newbuilddir', help='New build directory to use for tests.')
         parser.set_defaults(func=self.run)
 
     def _get_available_machines(self):
@@ -187,6 +192,7 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
         self.tc_kwargs['init']['config_paths']['builddir'] = builddir
         self.tc_kwargs['init']['config_paths']['localconf'] = os.path.join(builddir, "conf/local.conf")
         self.tc_kwargs['init']['config_paths']['bblayers'] = os.path.join(builddir, "conf/bblayers.conf")
+        self.tc_kwargs['init']['newbuilddir'] = args.newbuilddir
 
         def tag_filter(tags):
             if args.exclude_tags:
-- 
2.17.1

