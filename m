Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.13189.1611672243544352240
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 06:44:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=XTBsvzFU;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id r38so5659070pgk.13
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Jan 2021 06:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=PKzhp+a68Dg4kAEb6UDUw6fiUW9dC05Y7Ihl6BBswPY=;
        b=XTBsvzFUmMQ89dyxRqiwJ4ZPCS3Ft8yAGTNqcelTYq4Y3E+G+tgcrofJqHdeHPm8JT
         Zj5Y0ToPMm+G2qVUDfRFsI3gF5PK0ml8u+IBbSf84Sep5hMdYEeamAidCcWQMkFn+KCd
         I4rjlu8WvKfjISqJGpGfmDGxxpP4LbpaEZ2jslYV8bkja1OnBXBU0GtfJecbQQZ45Ehs
         yxA5Ira1/hkZ8rRAOgTwplyRwTkbfPf9Ae0KShWa3CXtftvX2lKKEghBSghN6SHwheKg
         ksT7rS+FedAqyvsXLiF3fK2vDSNsfFTbOcCyncfBBV8D+F9GvUj8qgPVCYHKBS2IODeq
         /CMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PKzhp+a68Dg4kAEb6UDUw6fiUW9dC05Y7Ihl6BBswPY=;
        b=VBoEKshRqKrSUtBZQ4kjgZ6H1fZP0X3AP3L6Pir2NnfN6c/ocNOMcbbvaRnZmAKpri
         FuvVmtqbvgHAuwOSdZDPOXwV3c1JNeKjyntT2gCpuTBV4/un0RQxBBdSeSk/YeMPbjdO
         G2Ewl108Zw3Gp841a4f6ir3QYoeCfghm0hHt7R24yhfUPscrKg1zd9Zt13ua3yVKCamR
         z7gpP/d5GjBsQJporMNWZaAMv2auqoxPhc0jBBr1Wyl85CIE7YJ0Bhl7ss3bLU+CDXp3
         //+gzB4fLHB+JtWGQvU6Nc/qLGIqrekO0YGXL5agHwvOFMfW0uRqo1M1cD1ZPPQYKVwM
         WmoQ==
X-Gm-Message-State: AOAM530MRmcKKS31i22fPxXdeuLXu6jU6kFXl0ZAfXnst1c+BY7Sviyk
	uFgbS6RHFj7vtu8D1Zx+22ZB6lKqYopl1rGEq5g=
X-Google-Smtp-Source: ABdhPJxQVx1g604caru8xk1/0tgFaDYqWQxrMuz9jO3UiqBBuHezWgzcu6339jc+mTDxrVXjKKdk+g==
X-Received: by 2002:a05:6a00:a8f:b029:1bd:bb89:5911 with SMTP id b15-20020a056a000a8fb02901bdbb895911mr5605298pfl.42.1611672242603;
        Tue, 26 Jan 2021 06:44:02 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 11sm19303634pgz.22.2021.01.26.06.44.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 06:44:02 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell V3 41/46] wic: Ensure internal workdir is not reused
Date: Tue, 26 Jan 2021 04:41:52 -1000
Message-Id: <a3a1dcbacb27510092b7bc9b08644abae45545cd.1611671734.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611671734.git.steve@sakoman.com>
References: <cover.1611671734.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Barker <pbarker@konsulko.com>

If a path is specified for the internal wic working directory using
the -w/--workdir argument then it must not already exist. Re-using a
previous workdir could easily result in rootfs and intermediate files
from a previous build being added to the current image.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2e40c8d4109024ff704c5ce40d98050ca7f34dd5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit 5dcdb76f89c2e5bbc383e2921589482cd1c51491)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/wic/plugins/imager/direct.py | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index b329568c7a..f107e60089 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -62,7 +62,7 @@ class DirectPlugin(ImagerPlugin):
 
         self.name = "%s-%s" % (os.path.splitext(os.path.basename(wks_file))[0],
                                strftime("%Y%m%d%H%M"))
-        self.workdir = options.workdir or tempfile.mkdtemp(dir=self.outdir, prefix='tmp.wic.')
+        self.workdir = self.setup_workdir(options.workdir)
         self._image = None
         self.ptable_format = self.ks.bootloader.ptable
         self.parts = self.ks.partitions
@@ -78,6 +78,16 @@ class DirectPlugin(ImagerPlugin):
         self._image = PartitionedImage(image_path, self.ptable_format,
                                        self.parts, self.native_sysroot)
 
+    def setup_workdir(self, workdir):
+        if workdir:
+            if os.path.exists(workdir):
+                raise WicError("Internal workdir '%s' specified in wic arguments already exists!" % (workdir))
+
+            os.makedirs(workdir)
+            return workdir
+        else:
+            return tempfile.mkdtemp(dir=self.outdir, prefix='tmp.wic.')
+
     def do_create(self):
         """
         Plugin entry point.
-- 
2.25.1

