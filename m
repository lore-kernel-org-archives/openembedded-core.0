Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web09.4957.1624840122170247328
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jun 2021 17:28:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UfWczqfL;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: jeanbouch418@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id h3so2762433qto.4
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Jun 2021 17:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wutD8k+6HeAIBbJ6g+mGzm68Y0iUr32IOdDXkTSX0hM=;
        b=UfWczqfLYjQdtutr0YHzO/WQEyzhMl2mjbEWm6ZweKeZrLuwqjXOREWF/yCzwHqub+
         N+w8REVCL9hrhO8lDZKdojIfIRTmbbW2VG8CsTJvV6EC66jkoC6PUCjJj0RvtdPJhMBc
         t0a26avnn0YQp+OusgCqRAcI59YAL0zo3RruvJtuH5eonVILa7k8ag5A83NkjtOyClx3
         2X3KodvGy+Kkc+6lrgSzF4IEeN4cZN59NDMci+ItBWdiNQSycIS9Iz36q1NGsijIm38z
         1PJmQ8gyob72Qht2excpSArEEsaNjDuvdzjH0pe37JLvKiJydt36iswfE64ZqMgfFNQO
         ZE1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wutD8k+6HeAIBbJ6g+mGzm68Y0iUr32IOdDXkTSX0hM=;
        b=o85DGkUUtB6X/kV4GS50yVMBKEzy75DKEoNv/HCWqCuof1Pz900EKdRQZrWstEv+/x
         a88ukLl+aEL24X/W4BpAmTiCeLGgxnYLeycdZE/+Ghs5RWEZHetSFIaXbBk+jcOVTk4h
         Fto2JtxRlgZIs2zc9MnSTNZM0wOESeIj0ewZcK5fN9EyPQtVfGuqLz7dK9nAvpqDHbwC
         XOAP+KiWWhPG308XXXoY8WJM6V+RBjaCCUqwZguGtW7Z4xTGTHTPc9Bz51pdCGcbco1C
         TxNGp2PFtF8ZYbwlUXjNG6wHvmouZRFeUO5gyK6t1B56FA8jzx5LUHm2qQVL3sbu1iBS
         2nmA==
X-Gm-Message-State: AOAM532JT2JA120QaZTpPoGWcRYRdh0vmq/93PgkRsywwui29Y1y/oZc
	UDI5HET1ZRXLvdSVDPn98b+Tw5HhQe8ANw==
X-Google-Smtp-Source: ABdhPJxOsSsSVbpEOr7OHyBuODGPNfq37XNhEHtoBP56ajbbo1aPK6G+a9d7nFRru+jqk/eBrKiaMQ==
X-Received: by 2002:ac8:4c9a:: with SMTP id j26mr9883232qtv.271.1624840121081;
        Sun, 27 Jun 2021 17:28:41 -0700 (PDT)
Return-Path: <jeanbouch418@gmail.com>
Received: from fedora.. (modemcable125.136-200-24.mc.videotron.ca. [24.200.136.125])
        by smtp.gmail.com with ESMTPSA id t139sm9269799qka.85.2021.06.27.17.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jun 2021 17:28:40 -0700 (PDT)
From: "jbouchard" <jeanbouch418@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: jbouchard <jeanbouch418@gmail.com>
Subject: [wic][PATH] Use the label provided when formating a dos partition
Date: Sun, 27 Jun 2021 20:28:37 -0400
Message-Id: <20210628002837.3842-1-jeanbouch418@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Previously the bootimg-pcbios wic plugin was not respecting
the --label option provided from the wks file. The plugin
was setting the label to 'boot'. With this fix, the --label
option is use. If no option are specified, then the default
is 'boot'.

Signed-off-by: jbouchard <jeanbouch418@gmail.com>
---
 scripts/lib/wic/plugins/source/bootimg-pcbios.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
index f2639e7004..32e47f1831 100644
--- a/scripts/lib/wic/plugins/source/bootimg-pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
@@ -186,8 +186,10 @@ class BootimgPcbiosPlugin(SourcePlugin):
         # dosfs image, created by mkdosfs
         bootimg = "%s/boot%s.img" % (cr_workdir, part.lineno)
 
-        dosfs_cmd = "mkdosfs -n boot -i %s -S 512 -C %s %d" % \
-                    (part.fsuuid, bootimg, blocks)
+        label = part.label if part.label else "boot"
+
+        dosfs_cmd = "mkdosfs -n %s -i %s -S 512 -C %s %d" % \
+                    (label, part.fsuuid, bootimg, blocks)
         exec_native_cmd(dosfs_cmd, native_sysroot)
 
         mcopy_cmd = "mcopy -i %s -s %s/* ::/" % (bootimg, hdddir)
-- 
2.31.1

