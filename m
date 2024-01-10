Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49DAAC4707B
	for <webhook@archiver.kernel.org>; Wed, 10 Jan 2024 11:54:58 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.9953.1704887688023631276
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 10 Jan 2024 03:54:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lmv1OnI0;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40d4f5d902dso42921485e9.2
        for <Openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 03:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704887686; x=1705492486; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W8TACjfaP5Orlf3PVEjOTKt/7jhtJJert9otb48ELqY=;
        b=lmv1OnI0DsA667J93jE+y9G5dawYc15ZdCb0QeX0/nKkaLT6GI1jXZCy0DkJsIkHX8
         sRORB6PoZYMG5Uw7Cwu/68NaOVBeiV+tw0KJMGnsabKqLSvQWyzPdhAMlDE15L1MVs4h
         B7alQhz5ioABCyzJJjjr63kjh5OgmXk+MH5Z0IEqCJjld5dwtOx1dPu9bC6lO+T0LjOb
         iiLB1loA+cdt8FXyCeEODb8GyeRkrk2f91VCXlmQM8z53veJ4w5rHo+L9WmZtqHiFrVS
         YcVZ2MF2bN4mEwUAeSj+3VBKFEvO93FxzAm+//LgywqzOhG9TmrGJhOub0MqaH/+d+3J
         jSPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704887686; x=1705492486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W8TACjfaP5Orlf3PVEjOTKt/7jhtJJert9otb48ELqY=;
        b=dOL8jtnMS0g8vXdN+/3ID6RDnnwVsAz85K5wW8cQfNqYFYjG4I+Pmx/w2A4mZbyvSN
         BtuvDii8Uc/avLAsEJtdAc2mTN8Rpxv1yh8GRWt6dERw95pSJkbLB7/rwL4l8F/nB02b
         SsaC2qKI5khEeGL6pM8s/3Y5rOuhEQ0kF0dUO6fG5/sqGsjpIimxRQoiNt58L8vd1YxA
         U3+8rIEt5+IWBcqUYZ0bQYwGjjnrExX/5vrDBO1GKadfqN4l2zbwh4fdjedgd1bLGUwg
         /IQIC5fcVeSNOXCFo8J9/Bj2t5QPHvbom4z/I88x/DPNZenGKhj2G+hkCtAg/c3PC/+B
         xZeA==
X-Gm-Message-State: AOJu0Ywrxmqt14ZS0aVw7tQKH5mCl6cyLGjbmfiFeW4CqB7ONjnyYm68
	8JDcwHgwkfSj05aXysoIgqvKA4I4NKmjYg==
X-Google-Smtp-Source: AGHT+IGrYSdqb8Yw3FOtL0jCAHCEL3eTJPSdXGWFYqfaYXV3rNky00Iyis2tHJxquAQe4Sf7pMCWUw==
X-Received: by 2002:a05:600c:1ca6:b0:40e:5536:4594 with SMTP id k38-20020a05600c1ca600b0040e55364594mr460642wms.172.1704887686077;
        Wed, 10 Jan 2024 03:54:46 -0800 (PST)
Received: from slackware.local ([154.47.27.146])
        by smtp.gmail.com with ESMTPSA id n13-20020a05600c500d00b0040e5a0515aesm44191wmr.14.2024.01.10.03.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 03:54:45 -0800 (PST)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: Openembedded-core@lists.openembedded.org
Cc: Lukas Funke <lukas.funke-oss@weidmueller.com>,
	Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH 2/3] classes: go-vendor: Reference local modules
Date: Wed, 10 Jan 2024 12:53:34 +0100
Message-Id: <20240110115335.92914-2-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20240110115335.92914-1-uvv.mail@gmail.com>
References: <20240110115335.92914-1-uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 11:54:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193494

Create symlinks for local modules, which are usually not referenced in
the SRC_URI, but still expected to be found in the vendor directory
during the build.

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta/classes/go-vendor.bbclass | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/meta/classes/go-vendor.bbclass b/meta/classes/go-vendor.bbclass
index 2426bddfba..b965428dd1 100644
--- a/meta/classes/go-vendor.bbclass
+++ b/meta/classes/go-vendor.bbclass
@@ -169,6 +169,7 @@ python do_go_vendor() {
     fetched_paths.remove('.')
 
     vendored_paths = set()
+    replaced_paths = dict()
     with open(modules_txt_src) as f:
         for line in f:
             if not line.startswith("#"):
@@ -182,6 +183,15 @@ python do_go_vendor() {
                         vendored_paths.add(topdir)
 
                     topdir = os.path.dirname(topdir)
+            else:
+                replaced_module = line.split("=>")
+                if len(replaced_module) > 1:
+                    # This module has been replaced, use a local path
+                    # we parse the line that has a pattern "# module-name [module-version] => local-path
+                    actual_path = replaced_module[1].strip()
+                    vendored_name = replaced_module[0].split()[1]
+                    bb.debug(1, "added vendored name %s for actual path %s" % (vendored_name, actual_path))
+                    replaced_paths[vendored_name] = actual_path
 
     for path in fetched_paths:
         if path not in vendored_paths:
@@ -189,7 +199,13 @@ python do_go_vendor() {
             if os.path.exists(realpath):
                 shutil.rmtree(realpath)
 
-    # Create a symlink the the actual directory
+    for vendored_name, replaced_path in replaced_paths.items():
+        symlink_target = os.path.join(source_dir, *['src', go_import, replaced_path])
+        symlink_name = os.path.join(vendor_dir, vendored_name)
+        bb.debug(1, "vendored name %s, symlink name %s" % (vendored_name, symlink_name))
+        os.symlink(symlink_target, symlink_name)
+
+    # Create a symlink to the actual directory
     os.symlink(vendor_dir, linkname)
 }
 
-- 
2.35.1


