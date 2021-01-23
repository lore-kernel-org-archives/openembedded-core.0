Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web09.7520.1611414770239270913
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Jan 2021 07:12:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TeSkRCbF;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: tomasz.dziendzielski@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id a25so8845260ljn.0
        for <openembedded-core@lists.openembedded.org>; Sat, 23 Jan 2021 07:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MAknTZJr9JDMLAV6ohGx8WWAO/T9RRq6pxynOM9FmoY=;
        b=TeSkRCbFICdX/Fa9IBmtBuq9uWcif6AqbdtqV6VBD1M3RHvkMOEijpdo23hIar+V2d
         lAIczvw7JOgRExEVGNUlFkhqAt86YqVJ8ioVb8TNhchxwgbFHePw7cNRmKe+uz1KPGd1
         o4bcMGMtovN/SR8d5/SAvzZEFYMNQn50QS38D1kQJBGB4hS3tx4VAxM2MWJ1c+Zz/h8Y
         rQ4T5iPsfjUwDDguqvKYy5YOMBC6u8HBdHG1CXR/bF9zuEKh5JPdRryKWnHLSTxnbirR
         dqptaVm89kwItwE3cFJsVsvnbIYtzf6ng+fqOWGxHu9zpIWndmNwTveLk0uu/QPtrvKX
         hlTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MAknTZJr9JDMLAV6ohGx8WWAO/T9RRq6pxynOM9FmoY=;
        b=hCXvxhilgu06MOG8V1R54Ziw4bWHu06YUKXxf7s1dLb1qx2A223Vka7rMVhGD1WCwy
         E4Orl5tQqzqqGrpZqccUJ8nqq/x1wzs+pvWYRFpGFYlLjYq/oJm0/Ag4ouzGv9NJilY9
         Jo36uuzojXjU0rMsBuiGdWIACUXfHZJREQGX9iG9sXTWcGlHfFdfCqL0wTODXOty+f1A
         SW+pTtS1stx71mWEkWpag/mNfDiOiRK7X6h4HYmK90o+jIbH7y8ufZLDs+7Wuq/2v6g6
         q8DGdmwFHd7H15eO1l1GqNn0IF/Pb7Cipw0zt97YfgxaT3Y8gO6WS3zVz1dtYyqe1J6s
         BPHA==
X-Gm-Message-State: AOAM533y6vlJ0yTTp1ge/ddO/K3r/tqZUzeov4gVX5BB9Y9a910sTcgI
	Nzx2LK72dkY3uLO83QqwmuWrypGBJSY=
X-Google-Smtp-Source: ABdhPJwAWb6iHeRivB2M1rqIBXBJ2Tf4xD/TwOXisltLh13nDtbNwraaxlFFz5tYKrsFLaqpGP9LOw==
X-Received: by 2002:a05:651c:120f:: with SMTP id i15mr156631lja.339.1611414768153;
        Sat, 23 Jan 2021 07:12:48 -0800 (PST)
Return-Path: <tomasz.dziendzielski@gmail.com>
Received: from localhost.localdomain (h124200.man.tk-internet.pl. [93.175.124.200])
        by smtp.gmail.com with ESMTPSA id m16sm1208319lfb.248.2021.01.23.07.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Jan 2021 07:12:47 -0800 (PST)
From: "Tomasz Dziendzielski" <tomasz.dziendzielski@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Subject: [PATCH] selftest/devtool: Add modify_localfiles_only test checking symlink path
Date: Sat, 23 Jan 2021 16:15:10 +0100
Message-Id: <20210123151510.14395-1-tomasz.dziendzielski@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If recipe uses only file:// fetcher devtool unpacks sources under
oe-local-files/ and adds symlink in source root directory. We need to
verify if the symlink in subdirectory has correct path.

See [YOCTO #13738] for details.

Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 37 +++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 4eba23890f..3385546e8e 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -697,7 +697,44 @@ class DevtoolModifyTests(DevtoolBase):
 
         self.assertTrue(bbclassextended, 'None of these recipes are BBCLASSEXTENDed to native - need to adjust testrecipes list: %s' % ', '.join(testrecipes))
         self.assertTrue(inheritnative, 'None of these recipes do "inherit native" - need to adjust testrecipes list: %s' % ', '.join(testrecipes))
+    def test_devtool_modify_localfiles_only(self):
+        # Check preconditions
+        testrecipe = 'base-files'
+        src_uri = (get_bb_var('SRC_URI', testrecipe) or '').split()
+        foundlocalonly = False
+        correct_symlink = False
+        for item in src_uri:
+            if item.startswith('file://'):
+                if '.patch' not in item:
+                    foundlocalonly = True
+            else:
+                foundlocalonly = False
+                break
+        self.assertTrue(foundlocalonly, 'This test expects the %s recipe to fetch local files only and it seems that it no longer does' % testrecipe)
+        # Clean up anything in the workdir/sysroot/sstate cache
+        bitbake('%s -c cleansstate' % testrecipe)
+        # Try modifying a recipe
+        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        self.track_for_cleanup(tempdir)
+        self.track_for_cleanup(self.workspacedir)
+        self.add_command_to_tearDown('bitbake -c clean %s' % testrecipe)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        result = runCmd('devtool modify %s -x %s' % (testrecipe, tempdir))
+        srcfile = os.path.join(tempdir, 'oe-local-files/share/dot.bashrc')
+        srclink = os.path.join(tempdir, 'share/dot.bashrc')
+        self.assertExists(srcfile, 'Extracted source could not be found')
+        if os.path.islink(srclink) and os.path.exists(srclink) and os.path.samefile(srcfile, srclink):
+            correct_symlink = True
+        self.assertTrue(correct_symlink, 'Source symlink to oe-local-files is broken')
 
+        matches = glob.glob(os.path.join(self.workspacedir, 'appends', '%s_*.bbappend' % testrecipe))
+        self.assertTrue(matches, 'bbappend not created')
+        # Test devtool status
+        result = runCmd('devtool status')
+        self.assertIn(testrecipe, result.output)
+        self.assertIn(tempdir, result.output)
+        # Try building
+        bitbake(testrecipe)
 
     def test_devtool_modify_git(self):
         # Check preconditions
-- 
2.29.2

