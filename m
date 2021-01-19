Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web09.13472.1611073579489735866
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jan 2021 08:26:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=BMlLNzWw;
 spf=pass (domain: konsulko.com, ip: 209.85.128.44, mailfrom: pbarker@konsulko.com)
Received: by mail-wm1-f44.google.com with SMTP id j18so314593wmi.3
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Jan 2021 08:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lQ64W4Ymw3rmGZQzWGq8ZSqtohKIjJWvsMfFCbfxqio=;
        b=BMlLNzWwEh2H05wbg001P1B1CZlMJi3eyHNgGbRCLBJZZ4T/RmzO4Y5vL4uskXlT3s
         vfzlNetlivxCBzoX2EBWanxWfnOL93ddsvY2m1GJ2c/4qdq7OpNV32tTDq9vv5S7I9yN
         Y9WDV5mUQ0PkUeJpSqQLGkZ63BfpIqWnq7SPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lQ64W4Ymw3rmGZQzWGq8ZSqtohKIjJWvsMfFCbfxqio=;
        b=ROaE94tDvGEdNF9hD3Sk6dfF+CMIz/P9JqN5g3HN/IgSzdtGTunVfSclOsH2SAR3KO
         T5ZMhDDyHYuQ2K+GWX9JZuwm0EVkB+fK5MXh6JE3xlVhkTnjs1k2CK629uIS6wz4jc8T
         Is6Pzmb5qw5kcYArAIlcj8kjiQRCF9oLs1H0x96nczwItQZ/lCC65BZMKvhBJROeHW/g
         v8qV1ecio9ALnFNu4DZmKNjmGnz41s9J6CWNDJyvPecKcYbuQ9oD9uYmuY/UlB8HIRSk
         PScoOQfGRjjIMgu8vjXgJ7it9/mxiINZw9rPNFgyCU8EoZ08Z0Vqeg7jVHZUvIXLZjiJ
         ZWgA==
X-Gm-Message-State: AOAM531PYza345yA44ee3qeFru5xQn29UB+LyG841bEzVxc5y56q16Ux
	peoQoNgORM9E3Wqfg4HO7pdp35vVye/OSw==
X-Google-Smtp-Source: ABdhPJxmtNVNDxpphqNk6K6SlAphXssCynVkitWiy+nypgc8btaSs0tni9prOH5EuUFp0U0/BevYEA==
X-Received: by 2002:a1c:4e:: with SMTP id 75mr413967wma.150.1611073577633;
        Tue, 19 Jan 2021 08:26:17 -0800 (PST)
Return-Path: <pbarker@konsulko.com>
Received: from alpha.home.b5net.uk (cpc76132-clif11-2-0-cust80.12-4.cable.virginm.net. [80.7.160.81])
        by smtp.gmail.com with ESMTPSA id d85sm9223754wmd.2.2021.01.19.08.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 08:26:17 -0800 (PST)
From: "Paul Barker" <pbarker@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [PATCH v2 1/5] wic: Ensure internal workdir is not reused
Date: Tue, 19 Jan 2021 16:26:06 +0000
Message-Id: <20210119162610.13104-1-pbarker@konsulko.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If a path is specified for the internal wic working directory using
the -w/--workdir argument then it must not already exist. Re-using a
previous workdir could easily result in rootfs and intermediate files
from a previous build being added to the current image.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
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
2.26.2

