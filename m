Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web12.4394.1591214527381227599
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2020 13:02:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=q7lT3w9R;
 spf=pass (domain: konsulko.com, ip: 209.85.221.67, mailfrom: pbarker@konsulko.com)
Received: by mail-wr1-f67.google.com with SMTP id y17so3672221wrn.11
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2020 13:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yfS3k2ue3c5ThEAhUwiTk0Atp6kXd+QGwRI2KT4030M=;
        b=q7lT3w9RvdaqPtyS0xPNF3sFjbolQENnDHkvdxEB6ld8x10JwjDYDcUUGiuO7fZbcu
         LsLbtNy8Mx1bBlb3AvsND2bRtEPzwnYWMMFIKU/KHYucbzxb7Q4wyBw5tEkAxliAWMPJ
         9bBjW1Q/8RIXksr/n7wZMp0hrk7OHa3vzED14=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yfS3k2ue3c5ThEAhUwiTk0Atp6kXd+QGwRI2KT4030M=;
        b=evnt7guclwKU7wUFEFu/56QSjfu8UjUFyk0e+jkpmH7Pv7qZOM9OTYvbN/8toeUTrq
         cD3bTCSt7javo14ZqEd29l0LpDRgqNkB1ccE1FHAdgucmM1FN+tG33VgMW/fSCfbTPkn
         VP6Yrtf6X8dQO/2LfDLxso9YSovVM3CV3htrgzpEJ+sHCeX+wX0870jYFq0pGAr8i6Rn
         ELOK5cNmvhlmZrvegB/pQceSkXMW+MPYvLkes4LqNWyRYLvWEsNXJIzzGsKiT3gP7n/c
         2dlqPpxMvV4VkNjc8yKE3OICTdtRH+g1M3YXPWPVYSYbo7f5Agh5bJguo/AUxfqhgDET
         AOzA==
X-Gm-Message-State: AOAM532hDQRyqXZuT/myo1geVdoXZGYJPEEoznI7fXfMnQKclvyE0jo4
	+u3Ub/TGAAdhEa7Y1tBh3IUfxmaC+Yuvow==
X-Google-Smtp-Source: ABdhPJyztNyQ9HPynxWwNOyd1whm5WXXBr2H9DddIAXiUJwlBoAeJD6lsxnA/NWEF6qWUCi3Z/naTQ==
X-Received: by 2002:adf:b198:: with SMTP id q24mr996942wra.368.1591214525546;
        Wed, 03 Jun 2020 13:02:05 -0700 (PDT)
Return-Path: <pbarker@konsulko.com>
Received: from ar2.home.b5net.uk ([213.48.11.149])
        by smtp.gmail.com with ESMTPSA id a3sm4682716wrp.91.2020.06.03.13.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2020 13:02:04 -0700 (PDT)
From: "Paul Barker" <pbarker@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [PATCH 1/1] archiver: Capture git submodules in mirror archiver
Date: Wed,  3 Jun 2020 21:02:01 +0100
Message-Id: <20200603200201.23110-2-pbarker@konsulko.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200603200201.23110-1-pbarker@konsulko.com>
References: <20200603200201.23110-1-pbarker@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using the new Fetch.expanded_urldata() function we can get URL data for
all git submodules.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 meta/classes/archiver.bbclass            | 13 ++++---
 meta/lib/oeqa/selftest/cases/archiver.py | 46 ++++++++++++++++++++++++
 2 files changed, 52 insertions(+), 7 deletions(-)

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
index 606eaabcb0..d557d9b576 100644
--- a/meta/lib/oeqa/selftest/cases/archiver.py
+++ b/meta/lib/oeqa/selftest/cases/archiver.py
@@ -254,3 +254,49 @@ class Archiver(OESelftestTestCase):
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
+        # We assume ovmf will continue to pull in openssl as a submodule in the
+        # future
+        bitbake('-c clean ovmf')
+        bitbake('-c deploy_archives ovmf')
+
+        bb_vars = get_bb_vars(['DEPLOY_DIR_SRC'])
+        for target_file_name in ['git2_github.com.tianocore.edk2.git.tar.gz', 'git2_github.com.openssl.openssl.tar.gz']:
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
+        self.write_config(features)
+
+        # We assume ovmf will continue to pull in openssl as a submodule in the
+        # future
+        bitbake('-c clean ovmf')
+        bitbake('-c deploy_archives ovmf')
+
+        bb_vars = get_bb_vars(['DEPLOY_DIR_SRC'])
+        for target_file_name in ['gitsmshallow_github.com.tianocore.edk2*.tar.gz', 'gitsmshallow_github.com.openssl.openssl*.tar.gz']:
+            target_path = os.path.join(bb_vars['DEPLOY_DIR_SRC'], 'mirror', target_file_name)
+            self.assertTrue(os.path.exists(target_path))
-- 
2.26.2

