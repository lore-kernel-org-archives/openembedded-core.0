Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.4485.1591214863857105767
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2020 13:07:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=JKUEaeu9;
 spf=pass (domain: konsulko.com, ip: 209.85.221.54, mailfrom: pbarker@konsulko.com)
Received: by mail-wr1-f54.google.com with SMTP id r7so3734294wro.1
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2020 13:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=J70cKavKc66IWVyRjoZrz7vu1NnJ+sk1LUwiIoSbi54=;
        b=JKUEaeu9oqCu3uBnY6RBgablJRR3dogAdCNjb9DOJH7fCi3nEwL/I6VLx2VbLu8Y8S
         s+wj/7Zi1cafTf34DoyjOn33cXZ2UoEp9yMr9+ev7a0rKxO12pipoGrkvlvnajf6LKjr
         PtwMN/NAk2VgNuAcIwFbr7ifPqQAGdZC6oais=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=J70cKavKc66IWVyRjoZrz7vu1NnJ+sk1LUwiIoSbi54=;
        b=OUrr+3ADQlb7dvSXb0lS9Q9IGDPF6SCIf/ZXeG2YiqFLPwERpF+2b5D7sUJBz13jLF
         i3jjlnofDl1UMG8Y8G3/3ZGzrENEmEQ4/OCsl/4C7MHMXFyIJSgWf+xSzas45mYforw3
         qFkL3EQaJINo5DDOct3uVjgjwJgFpaO9fkMh7I/yTMOUB67dHbzEzJxcxI9GzjTljAu1
         p6ZyROmHFGXVuRXVBIn6OWJYKs33B5MDp/2R7LYXG/UwaqculuggLIJKqdWmdnmnKSy9
         7ic7VaArazNG2+VG6OTRHFG5lr/Qbuzdaxd92blYZJHIHR/w9XtZxjuOpqzpMQW8DsqG
         WQTA==
X-Gm-Message-State: AOAM533YadJRRVSNQyQLF7wwqLQMcM6JHcA3gNKOzEhrFhQEXBbZEAm5
	OpXFrkFgjZHUa1VPneaCBH2mLHhG4sd0Tw==
X-Google-Smtp-Source: ABdhPJxpGqVqli6K7gckRaijwot2LUs8z4huKdfb8ErOMTwio+CznhGN0LfS4tciQycTrXFFyRm4uQ==
X-Received: by 2002:a5d:6581:: with SMTP id q1mr978454wru.43.1591214862070;
        Wed, 03 Jun 2020 13:07:42 -0700 (PDT)
Return-Path: <pbarker@konsulko.com>
Received: from ar2.home.b5net.uk ([213.48.11.149])
        by smtp.gmail.com with ESMTPSA id y19sm4186338wmi.6.2020.06.03.13.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2020 13:07:41 -0700 (PDT)
From: "Paul Barker" <pbarker@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [PATCH 1/3] oe-selftest: Allow overriding the build directory used for tests
Date: Wed,  3 Jun 2020 21:07:36 +0100
Message-Id: <20200603200738.23534-2-pbarker@konsulko.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200603200738.23534-1-pbarker@konsulko.com>
References: <20200603200738.23534-1-pbarker@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This may be useful if the parent directory of the original builddir is
not writable, on a lower performance drive, etc.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
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
2.26.2

