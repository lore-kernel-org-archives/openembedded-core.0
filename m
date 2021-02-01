Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web08.36644.1612196815456042640
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Feb 2021 08:26:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=gS9tnIHu;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.49, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f49.google.com with SMTP id k8so16842738otr.8
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Feb 2021 08:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=WU1Xc9WVDYiU7lQ1jvRPySCRYz94IX9s1wZweF3u9BQ=;
        b=gS9tnIHuTEdjbjsi9E4Urgc+pSnAhXVh0oPZuWpwsC96BEklo/qU6lChIkjrBfwZee
         KQFNyZd+ZwKdof/3fsALJ97D9FMkSLtm0eBdSbMSgLi8r8ksSIoEPHjSmT8bS6YNGMvZ
         SzwMtAynmmaiaDHmjeT5hYZQEAiLVWXslmmXzOa28e/IlgHtB4XoEdT2SGr4tZTLQ7mS
         izUYIXTptulrGZmNHWRfeZ0c8SVFiG2ms2iLmlFG08UxFyjsnQ+8BgXJO/NShMgMzwtb
         shMTgRZ0TkECRGf06CmvaRA88PH1T+EwAONtPQMTz6eULTsVkpqTOL6bZVh6lP3nbpVK
         fN9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WU1Xc9WVDYiU7lQ1jvRPySCRYz94IX9s1wZweF3u9BQ=;
        b=T8iTxECmawS0fKVlrYenGqRaLGMB9fkygRT9XNqU7Zgmk+iwd/U7kyudrfc4tqG/c2
         L76rixZgMgXTKkSDCPgmiRS0jRKX4VaWGFntCZnum+ue9bXnl6ecNvGA7QVJCmyXmuzE
         ojfUWk75yf4gUDHSTxLgxWsbrqPAnlNn09LHUKps2lKS25EDEIrsY3INZBlhpfIw45+8
         ZlmvC8CKI0MVXMk0HwwrOm4btbC349FYC06HV3zRJvaYhwGKPyh6ok0GVbc6ji7L3xrc
         Q42bxDGoLXy/7SomkK6c5gaEsWg8ymE9z3sIbFnRgpSASSlSv6Od0KP59hbxWzePiOWg
         ktfQ==
X-Gm-Message-State: AOAM532QnE687dirHS3/VDEUOWgBgrfa5hLf6RCWkR/rYExAhEhQ34No
	GPZ9jckFY+k1WZbFAvs+oWv/x9AU8BAWPzKHJr8=
X-Google-Smtp-Source: ABdhPJzNqG1oMiDWw7RZbj+Y95/V2jAGBUuC13SxmFHX8vCn2f0EKchkxpzAl0312BG5cs8M2GCxOg==
X-Received: by 2002:a9d:66c1:: with SMTP id t1mr12304404otm.106.1612196814380;
        Mon, 01 Feb 2021 08:26:54 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id o16sm3980726ote.79.2021.02.01.08.26.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Feb 2021 08:26:53 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 15/21] selftest/devtool: Add modify_localfiles_only test checking symlink path
Date: Mon,  1 Feb 2021 06:24:46 -1000
Message-Id: <d9d8a04c9564b2801a1f613ffb6471de3cabdb03.1612188857.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1612188857.git.steve@sakoman.com>
References: <cover.1612188857.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>

If recipe uses only file:// fetcher devtool unpacks sources under
oe-local-files/ and adds symlink in source root directory. We need to
verify if the symlink in subdirectory has correct path.

See [YOCTO #13738] for details.

Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 044c90d152bfd1b2a23272df39327ba4cd862dff)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 37 +++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index ddf46547de..0985434238 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -693,7 +693,44 @@ class DevtoolModifyTests(DevtoolBase):
 
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
2.25.1

