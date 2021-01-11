Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web09.32275.1610361176800568997
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jan 2021 02:32:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=eNEedVDV;
 spf=pass (domain: konsulko.com, ip: 209.85.221.45, mailfrom: pbarker@konsulko.com)
Received: by mail-wr1-f45.google.com with SMTP id r7so15821406wrc.5
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Jan 2021 02:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3MpQCCdrXOWsZmzsC8JftjLo0irVTBTwVqsFgDt+UuU=;
        b=eNEedVDVxf11Zo6gv4KTbqrh5fnEhYN4l3EvXABXwM6l2tx6zhqXNJScZq4TqDCc9+
         z01925ZikVOmyvokD0Bl9J6GncoAaKzMXYQjJlhFLdDbW5PDNABUwHYfyE72TaTU7joW
         5gBUCE4iPFesPrxhjEwdDIRZLG2wFW2ooJ2FM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3MpQCCdrXOWsZmzsC8JftjLo0irVTBTwVqsFgDt+UuU=;
        b=kxoWC4Kqelj3/kaermY7RfStJ0Hpy4v3t1oVptPikHCkjM5Se9sXIKIqGmEbg6EMcC
         SLywA0keaoGFOfZzHmeXm7tVcV9S9TICGQN7p3K8DN9E0kKzm4sueU9NSuL13QQTH246
         3Ols+QpX0p7Be65pgIni5cN8q9g2w8tHZiSG1FTQQpVPvyJrthoPLcomF9c2lXSCtg3r
         7+ypf4YxGUQrLnEqREKhR2RYusrDOeJFe3f8DThr+rkod2CheA57tyRZZAcJFoMZ7ACc
         SnMzbximV6/exMX2/D1EN4cM1bqLy41DbeVvmg13ikJ+LpotRiueWJvCm3Anjd9+8bf8
         6IQQ==
X-Gm-Message-State: AOAM5301TzlgWmkoOYIuHTfuXLRxoxeUHCQ5S+mQ+NCCMcf4eQG91Bam
	Ml/REDRREMK/hXAeT6PlAe4JdyWMW7+k3A==
X-Google-Smtp-Source: ABdhPJxaQF4KpeaZsA2q3Ew7PQkCYqa67ekRuUB1S5n9OVXW9ZYVOSoo40vgs5RopIDNPIDSSkgNVQ==
X-Received: by 2002:a5d:4241:: with SMTP id s1mr15694835wrr.269.1610361175067;
        Mon, 11 Jan 2021 02:32:55 -0800 (PST)
Return-Path: <pbarker@konsulko.com>
Received: from alpha.home.b5net.uk (cpc76132-clif11-2-0-cust80.12-4.cable.virginm.net. [80.7.160.81])
        by smtp.gmail.com with ESMTPSA id a13sm23536969wrt.96.2021.01.11.02.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 02:32:54 -0800 (PST)
From: "Paul Barker" <pbarker@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [PATCH 1/6] wic: Add workdir argument
Date: Mon, 11 Jan 2021 10:32:42 +0000
Message-Id: <20210111103247.11685-1-pbarker@konsulko.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This allows the path for the temporary workdir used by wic to be set
when running wic from bitbake or directly from the command line.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 scripts/lib/wic/plugins/imager/direct.py | 2 +-
 scripts/wic                              | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 0ca67b77d5..b329568c7a 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -62,7 +62,7 @@ class DirectPlugin(ImagerPlugin):
 
         self.name = "%s-%s" % (os.path.splitext(os.path.basename(wks_file))[0],
                                strftime("%Y%m%d%H%M"))
-        self.workdir = tempfile.mkdtemp(dir=self.outdir, prefix='tmp.wic.')
+        self.workdir = options.workdir or tempfile.mkdtemp(dir=self.outdir, prefix='tmp.wic.')
         self._image = None
         self.ptable_format = self.ks.bootloader.ptable
         self.parts = self.ks.partitions
diff --git a/scripts/wic b/scripts/wic
index 24700f380f..a741aed364 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -312,6 +312,8 @@ def wic_init_parser_create(subparser):
 
     subparser.add_argument("-o", "--outdir", dest="outdir", default='.',
                       help="name of directory to create image in")
+    subparser.add_argument("-w", "--workdir",
+                      help="temporary workdir to use for intermediate files")
     subparser.add_argument("-e", "--image-name", dest="image_name",
                       help="name of the image to use the artifacts from "
                            "e.g. core-image-sato")
-- 
2.26.2

