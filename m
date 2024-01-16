Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7266AC47258
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 08:24:33 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.8366.1705393471680879699
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 16 Jan 2024 00:24:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RCic81z/;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-33694bf8835so7299063f8f.3
        for <Openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 00:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705393470; x=1705998270; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W8TACjfaP5Orlf3PVEjOTKt/7jhtJJert9otb48ELqY=;
        b=RCic81z/CZu1bqrUQ7vjV+uUSdaL9B+t/iOJkGzk6D4BOBI3S0eqTLfjh8DJasY95C
         fy7xWRSEZ7pOgJfSzu32F0la8kRXQaFPHfbTAslOLx9GNGk5aydJH0UkAVGgWLnqD3Ar
         PcXK7mjlVbsMuOY0cFpWuOWEPFA3EKOo+t/iD+xXfF+wnGBGYFI5Pp9CrbI+Tilrjnn7
         kpLbxJSrSOVs5kzhx6oGF7m2KmC1bjC3sg//vJJvuOZZLqwWrDg9QQ3ut32KlNbgKO6R
         SH3Ia2wIldWzvzcehL/spkfsixYvQMRVV690/nQbB90Tf/Tq24bLr6D+oOfL3qNSJZ50
         cuvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705393470; x=1705998270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W8TACjfaP5Orlf3PVEjOTKt/7jhtJJert9otb48ELqY=;
        b=QGbV53EHmQS7Fn8/BaZ5AomszX4UqpXalJoOAYBd+J3YtQiq0ABABCOn0D833YgklL
         mEyP//rgcfipHMvFEjO3HcbjBgJa5YJk0J7zvqzvk7gYiR6LyqKtLVvEjbpb3ghnfcfE
         DdlPn1zl5zwbNOaIey8zo16tUCctXtSwdLfjCUDMM72Es8VYv9W6f1ouGq2mdwwKaSWz
         mbhdLQRcxZZbNKIVEQ/Sf6vvNWdVYay7WN4NpTvBmIvaq3MSxk/y8GkZ6n7yt9D0CK7r
         dxD7sc67n+3MRpmt90YH+VCGsvaAZWJfmM89wAf6A+0SyVSj613/6M+KsLNXLaIWTlr6
         158A==
X-Gm-Message-State: AOJu0YzmHlp1dVJyebou0te4PYe2yD/gaqyKCwaLK6JPh4zvI7zy21Iu
	v3NtzYEn3sOyY20dqXIcUtk0DiISu8LiSQ==
X-Google-Smtp-Source: AGHT+IE4fyZMT9zb7oCGbz7JUrCOOjjy7L29MCbNIYCjR+WG9qpPvFPf6NmIsxpKMpgiGcA0z+YpCg==
X-Received: by 2002:adf:f049:0:b0:337:bd95:b0f9 with SMTP id t9-20020adff049000000b00337bd95b0f9mr126829wro.35.1705393469633;
        Tue, 16 Jan 2024 00:24:29 -0800 (PST)
Received: from slackware.local ([154.47.27.145])
        by smtp.gmail.com with ESMTPSA id dv1-20020a0560000d8100b00337b55ed9afsm1091923wrb.95.2024.01.16.00.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jan 2024 00:24:29 -0800 (PST)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: Openembedded-core@lists.openembedded.org
Cc: Lukas Funke <lukas.funke-oss@weidmueller.com>,
	Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH v2 2/9] classes: go-vendor: Reference local modules
Date: Tue, 16 Jan 2024 09:23:20 +0100
Message-Id: <20240116082327.128990-2-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20240116082327.128990-1-uvv.mail@gmail.com>
References: <20240116082327.128990-1-uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 08:24:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193825

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


