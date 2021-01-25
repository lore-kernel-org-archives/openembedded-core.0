Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.366.1611586419366561821
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 06:53:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=1MslgYn6;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id q20so8507560pfu.8
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 06:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=PKzhp+a68Dg4kAEb6UDUw6fiUW9dC05Y7Ihl6BBswPY=;
        b=1MslgYn6mnSQSXshTW4FBPkWl3CaBWbr/3hfVx+g7JRfbvohQriVUXSIJA7wImyUdt
         RR0RhtnmjOKOu/KQGiayPcNV/RqLXzfyfnlLBo/8uPixTHaseE6AWe7fcXVXASc4M/vL
         IhNNtgVqFZcTbHsHdAxW6k+dwhAGX9PqcgrlVJuY4j6tQXBRQ+mmSoF3hNMWEmyPVgvt
         EPnyuN0u9Z7ptDMxnUZpNHoVMMGCWgaCe8L1A4M3vk5I7WpNMluHVi0du/C8AZjSiKWO
         fr9Zl2ngRSgqnIFwQbRdXAY7Eo6oGWMJHLivFufFij7Rugu+CDtbhj3Xdj+PlEPYaAyE
         5/Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PKzhp+a68Dg4kAEb6UDUw6fiUW9dC05Y7Ihl6BBswPY=;
        b=DXS6XyUAJK7MC6zsWf8+Rhx5qlHsV5A7+MNXKYJHSB4i+tZExwkr8AGtwy7xdGQFyM
         T6NnI9Y57CSbJjymD/dnSkjnPuvviX6DxK2NIl6pid+1xE8pHvCWJuXD7Xv8G6VZeSXX
         uie21AH7xPGWKHRgivYyLnqp+T92+8GlGxlGzwDaI5ZJmPsHkR3FGDnliruztBG5MS0y
         nWhMi3PbvD9F8RdRKLKkDEmroWfrmbp8LFhxz6bPDdD5Wly84VfVXGT1mX7RuE70RaQq
         zQ/JT7OCQrflskshcNwCQy9Q9VaIur6nEoOSXqK5mkhEWLde/Svzb3Sn7B9HR3xkdNkL
         SkMA==
X-Gm-Message-State: AOAM532q1SPnvP8/RoagMuEnrED4Is/95DcPNlPyZOQuM/49fAnGcP75
	K/rw5zDOrXKYwqPwLzqMnpTGJ2hrnUg8vkGFa1Q=
X-Google-Smtp-Source: ABdhPJxxr2kPmUihmjdTVMWasD0F9X3i+eLr+SVbib7ypdr/tf1A5Vj2CzY8QDWB3XdkYU0ZkskCEA==
X-Received: by 2002:a63:1426:: with SMTP id u38mr955879pgl.149.1611586418511;
        Mon, 25 Jan 2021 06:53:38 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id x8sm17574354pfn.27.2021.01.25.06.53.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 06:53:37 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 42/47] wic: Ensure internal workdir is not reused
Date: Mon, 25 Jan 2021 04:51:14 -1000
Message-Id: <d483502a189c688b0ded948a7b1a8ab4afb09ec2.1611585425.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611585425.git.steve@sakoman.com>
References: <cover.1611585425.git.steve@sakoman.com>
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

