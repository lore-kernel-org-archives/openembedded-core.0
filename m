Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web12.5415.1611295097898912325
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jan 2021 21:58:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SLnyNjMf;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: milan.opensource@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id c132so2996033pga.3
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Jan 2021 21:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cdFuVs20Ifg2QXcP/H5g/TpBNbU0+0jB33iz5A3a5+w=;
        b=SLnyNjMf1xi1Z+QNp0sc8d46MCRm9ATQzILzGOxFzflD4r4qe8wA0AHth55FqOQMlb
         ghcUeuPJpuTm9RfSgSJzTjTSeBhdEVvNB+aFIFUErf1sihn+MBtNf3bF8sFL4TqvPB7U
         1Dn61FSZzvvR4P8JUyoadQqVTTygGkbEIdTLNjItrp/zsAcdO/pXTWCuAXSozuDvmwTO
         7ZXm0VxIPOhlli70EYltT0Q5ndJhNGmNtGV8BQHH35vYKRo6LyQ3pWAk9CxpVJKMaKLd
         5hVL89CoSRn2F2odhKeLmKywhncCWeyLInsOJdQsuptsvS3nSiA4cz708X7KtKfV6VHn
         nc9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cdFuVs20Ifg2QXcP/H5g/TpBNbU0+0jB33iz5A3a5+w=;
        b=UgY2NVo7ll/S8Tugt/61jrOZhRomOn0FBsObv+3qNBVIexLsghH6KzUYR5glRxTKAJ
         DVHn8c47CTvR69c6qmh+dK8FwWwY1pwIDgWXrSlP7SdgrZ33ol1feiKAM75PT+AGaOs5
         mnFU3MJV1mxNgCXPlLRdXgdXWoEGt8OyKogMOmkqtHv5xBUihDjIm1Yx9G1IQhM0nDox
         df7y1mtE710j/dT4cBBgXqikuoXV5YIhk5ZGZSLXOoM1OU7h+DRvLCavHldJYzI/0Ncr
         389bHmHpIvu5PFb1BG781dlW06+7qKrWh1NqV3HJmXOIaumZMpW3inGMqo/jrRYY0mc3
         r0qw==
X-Gm-Message-State: AOAM5334mLvbqqAsjeUyA04ARln6maiHZpW/2vX1VzUKc/qidyapvyOl
	czC+K48rsKkY9XH8oA/ReT60fdEriPFO
X-Google-Smtp-Source: ABdhPJwtHwnDs1g69ASaQZNGqMnOYx6fywuobgcnWFUkc9yAf0/p4vvgLqjjnjwgzzkCNLQsWJZa1g==
X-Received: by 2002:a63:a804:: with SMTP id o4mr3190322pgf.67.1611295097055;
        Thu, 21 Jan 2021 21:58:17 -0800 (PST)
Return-Path: <milan.opensource@gmail.com>
Received: from localhost.localdomain ([103.102.57.109])
        by smtp.gmail.com with ESMTPSA id a188sm7817906pfb.108.2021.01.21.21.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 21:58:15 -0800 (PST)
From: "Milan Shah" <milan.opensource@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	akuster@mvista.com,
	randy.macleod@windriver.com
Subject: [OE-Core][PATCH] manifest.py: Add tests to empty image
Date: Fri, 22 Jan 2021 11:28:05 +0530
Message-Id: <20210122055805.14834-1-milan.opensource@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An oe-selftest test is added to ensure
meta-selftest/recipes-test/images/test-empty-image.bb builds and is empty.

It is just a test that ensures that an empty image has no packages in it
(i.e. nothing in the manifest)

See [YOCTO #8455] for details.

Signed-off-by: Milan Shah <milan.opensource@gmail.com>
---
 meta/lib/oeqa/selftest/cases/manifest.py | 45 ++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/manifest.py b/meta/lib/oeqa/selftest/cases/manifest.py
index 5d13f35468..d9b8612628 100644
--- a/meta/lib/oeqa/selftest/cases/manifest.py
+++ b/meta/lib/oeqa/selftest/cases/manifest.py
@@ -162,3 +162,48 @@ class VerifyManifest(OESelftestTestCase):
             self.logger.debug(logmsg)
             self.logger.info(msg)
             self.fail(logmsg)
+
+class VerifyEmptyManifest(OESelftestTestCase):
+    '''Tests for the manifest files of an empty image'''
+
+    @classmethod
+    def setUpClass(self):
+
+        # the setup should bitbake test-empty-image
+        super(VerifyEmptyManifest, self).setUpClass()
+        self.buildtarget = 'test-empty-image'
+        self.classname = 'VerifyEmptyManifest'
+
+        self.logger.info("{}: doing bitbake {} as a prerequisite of the test"\
+                .format(self.classname, self.buildtarget))
+        if bitbake(self.buildtarget).status:
+            self.logger.debug("{} Failed to setup {}"\
+                    .format(self.classname, self.buildtarget))
+            self.skipTest("{}: Cannot setup testing scenario"\
+                    .format(self.classname))
+
+
+    @classmethod
+    def test_image_manifest_empty(self):
+        '''Verifying the image manifest file is empty, this may take a build'''
+
+        # get manifest location based on target to query about
+        try:
+            mdir = VerifyManifest.get_dir_from_bb_var('DEPLOY_DIR_IMAGE',
+                                                self.buildtarget)
+            mfilename = get_bb_var("IMAGE_LINK_NAME", self.buildtarget)\
+                    + ".manifest"
+            mpath = os.path.join(mdir, mfilename)
+            self.logger.info("Manifest file path is: {}" .format(mpath))
+
+            if not os.path.isfile(mpath): raise IOError
+            if not os.path.getsize(mpath) == 0: raise OSError
+
+        except OSError:
+            raise self.skipTest("{}: manifest file is not empty"\
+                .format(self.classname))
+
+        except IOError:
+                msg = "{}: Error cannot find manifests in dir:\n{}"\
+                        .format(self.classname, mdir)
+                self.fail(msg)
-- 
2.25.1

