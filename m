Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web10.20021.1591291997671058985
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jun 2020 10:33:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=J8Iejoq0;
 spf=pass (domain: konsulko.com, ip: 209.85.128.68, mailfrom: pbarker@konsulko.com)
Received: by mail-wm1-f68.google.com with SMTP id u26so7322029wmn.1
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2020 10:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=01S+bt1uf4SWY+6VOHkOoCpSVSEylXfC8vxsU9rdw30=;
        b=J8Iejoq0ocTwRm7dICuni/0WIjUf00qCBD37ZVY/x5dio7w4U0+dtX8FV0hzw9iJHI
         wKsV7YQmiECaovX6BtMdHCVfYSH4e5KSSNrIpaVs8p0lxyzFJ+0aCh+0XP6w0IvHypQ+
         kY0WM7mOBKabtiKK5CMGWL+CDKOxXd3yLSCEc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=01S+bt1uf4SWY+6VOHkOoCpSVSEylXfC8vxsU9rdw30=;
        b=rPcvb7pkVNCDP96VTZxh0ag3yMzzUK2j15Kd8zaXMoAkimyIHECtTPUABldU1YV0eN
         31kZutEBbvIUxmQ+5RZ7qHwq2eCrRxzJkdZC4g63BgI7GfTYEMn/Boy7Agg3WB95xIoU
         OoI1SSQlK7jlrf3eQQtrX1MKyU9YHwj6dEbDTOE83NFe2A69l2/kVzjri/NiTHTPsrop
         37oaiwn3wrvg7hgAM5pZI2GZWeu17mkx8TlYi3NTNPRrD1VAUNQULCVRwDCMW72kdwFq
         MPNw2JSOutuo0h1Z3NhpHkUU3vY9sXR8dAISwg3EnY5KXPNoaCfI9wVIaONcFCkAXrBO
         u7Ww==
X-Gm-Message-State: AOAM531WXuLXliMAeQPAzHOvqLeUuMuXJeyMm50nmNmi0647gn80VrGN
	opKVlcWJfSKRx0ydTxPJF1Wx005xhanJ7Q==
X-Google-Smtp-Source: ABdhPJzlSMLghhI6gY+SBfF02VgtsN6DTBJ/cMxeV+kGOp0bMSQKYMl8GyU/CcEJKlgSsHEBNSIBEg==
X-Received: by 2002:a05:600c:1008:: with SMTP id c8mr5034266wmc.95.1591291995974;
        Thu, 04 Jun 2020 10:33:15 -0700 (PDT)
Return-Path: <pbarker@konsulko.com>
Received: from ar2.home.b5net.uk ([213.48.11.149])
        by smtp.gmail.com with ESMTPSA id o10sm8868339wrj.37.2020.06.04.10.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2020 10:33:15 -0700 (PDT)
From: "Paul Barker" <pbarker@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [PATCH v2 2/2] archiver: Capture git submodules in mirror archiver
Date: Thu,  4 Jun 2020 18:33:01 +0100
Message-Id: <20200604173301.12364-3-pbarker@konsulko.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200604173301.12364-1-pbarker@konsulko.com>
References: <20200604173301.12364-1-pbarker@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using the new Fetch.expanded_urldata() function we can get URL data for
all git submodules.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 meta/classes/archiver.bbclass            | 13 +++---
 meta/lib/oeqa/selftest/cases/archiver.py | 54 ++++++++++++++++++++++++
 2 files changed, 60 insertions(+), 7 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 780c562b68..c2c049c343 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -345,13 +345,12 @@ python do_ar_mirror() {
 
     fetcher = bb.fetch2.Fetch(src_uri, d)
 
-    for url in fetcher.urls:
-        if is_excluded(url):
-            bb.note('Skipping excluded url: %s' % (url))
+    for ud in fetcher.expanded_urldata():
+        if is_excluded(ud.url):
+            bb.note('Skipping excluded url: %s' % (ud.url))
             continue
 
-        bb.note('Archiving url: %s' % (url))
-        ud = fetcher.ud[url]
+        bb.note('Archiving url: %s' % (ud.url))
         ud.setup_localpath(d)
         localpath = None
 
@@ -367,7 +366,7 @@ python do_ar_mirror() {
         if len(ud.mirrortarballs) and not localpath:
             bb.warn('Mirror tarballs are listed for a source but none are present. ' \
                     'Falling back to original download.\n' \
-                    'SRC_URI = %s' % (url))
+                    'SRC_URI = %s' % (ud.url))
 
         # Check original download
         if not localpath:
@@ -376,7 +375,7 @@ python do_ar_mirror() {
 
         if not localpath or not os.path.exists(localpath):
             bb.fatal('Original download is missing for a source.\n' \
-                        'SRC_URI = %s' % (url))
+                        'SRC_URI = %s' % (ud.url))
 
         # We now have an appropriate localpath
         bb.note('Copying source mirror')
diff --git a/meta/lib/oeqa/selftest/cases/archiver.py b/meta/lib/oeqa/selftest/cases/archiver.py
index bc5447d2a3..37efed57c8 100644
--- a/meta/lib/oeqa/selftest/cases/archiver.py
+++ b/meta/lib/oeqa/selftest/cases/archiver.py
@@ -255,3 +255,57 @@ class Archiver(OESelftestTestCase):
             glob_str = os.path.join(bb_vars['DEPLOY_DIR_SRC'], 'mirror', target_file_name)
             glob_result = glob.glob(glob_str)
             self.assertTrue(glob_result, 'Missing archive file %s' % (target_file_name))
+
+    def test_archiver_mode_mirror_gitsm(self):
+        """
+        Test that the archiver correctly handles git submodules with
+        `ARCHIVER_MODE[src] = "mirror"`.
+        """
+        features = 'INHERIT += "archiver"\n'
+        features += 'ARCHIVER_MODE[src] = "mirror"\n'
+        features += 'ARCHIVER_MODE[mirror] = "combined"\n'
+        features += 'BB_GENERATE_MIRROR_TARBALLS = "1"\n'
+        features += 'COPYLEFT_LICENSE_INCLUDE = "*"\n'
+        self.write_config(features)
+
+        bitbake('-c clean git-submodule-test')
+        bitbake('-c deploy_archives -f git-submodule-test')
+
+        bb_vars = get_bb_vars(['DEPLOY_DIR_SRC'])
+        for target_file_name in [
+            'git2_git.yoctoproject.org.git-submodule-test.tar.gz',
+            'git2_git.yoctoproject.org.bitbake-gitsm-test1.tar.gz',
+            'git2_git.yoctoproject.org.bitbake-gitsm-test2.tar.gz',
+            'git2_git.openembedded.org.bitbake.tar.gz'
+        ]:
+            target_path = os.path.join(bb_vars['DEPLOY_DIR_SRC'], 'mirror', target_file_name)
+            self.assertTrue(os.path.exists(target_path))
+
+    def test_archiver_mode_mirror_gitsm_shallow(self):
+        """
+        Test that the archiver correctly handles git submodules with
+        `ARCHIVER_MODE[src] = "mirror"`.
+        """
+        features = 'INHERIT += "archiver"\n'
+        features += 'ARCHIVER_MODE[src] = "mirror"\n'
+        features += 'ARCHIVER_MODE[mirror] = "combined"\n'
+        features += 'BB_GENERATE_MIRROR_TARBALLS = "1"\n'
+        features += 'COPYLEFT_LICENSE_INCLUDE = "*"\n'
+        features += 'BB_GIT_SHALLOW = "1"\n'
+        features += 'BB_GENERATE_SHALLOW_TARBALLS = "1"\n'
+        features += 'DL_DIR = "${TOPDIR}/downloads-shallow"\n'
+        self.write_config(features)
+
+        bitbake('-c clean git-submodule-test')
+        bitbake('-c deploy_archives -f git-submodule-test')
+
+        bb_vars = get_bb_vars(['DEPLOY_DIR_SRC'])
+        for target_file_name in [
+            'gitsmshallow_git.yoctoproject.org.git-submodule-test_a2885dd-1_master.tar.gz',
+            'gitsmshallow_git.yoctoproject.org.bitbake-gitsm-test1_bare_120f4c7-1.tar.gz',
+            'gitsmshallow_git.yoctoproject.org.bitbake-gitsm-test2_bare_f66699e-1.tar.gz',
+            'gitsmshallow_git.openembedded.org.bitbake_bare_52a144a-1.tar.gz',
+            'gitsmshallow_git.openembedded.org.bitbake_bare_c39b997-1.tar.gz'
+        ]:
+            target_path = os.path.join(bb_vars['DEPLOY_DIR_SRC'], 'mirror', target_file_name)
+            self.assertTrue(os.path.exists(target_path))
-- 
2.26.2

