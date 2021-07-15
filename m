Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web09.45.1626378006488262758
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 15 Jul 2021 12:40:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sPVHr/kd;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id v5so9274108wrt.3
        for <Openembedded-core@lists.openembedded.org>; Thu, 15 Jul 2021 12:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R6Ma+iQ4IbfZcsMnb+cefqGmQZiBn/c9c7kN69ip2FU=;
        b=sPVHr/kdV0mI8594V9b3MnukC715MlZExzTTz6vOeFxJWJbE01Hb+N9z9fGcx3NOt7
         ukWuf2lKP+4v4y+7n8zSwsIvHeH3Y2M6hW58bLwl/dbRE1koo/KjDgLSijolG6HKwwZA
         Fhxt9bveIRP7FqZkIlFcdjCz4zf8OnO3YT/NY2A3DNYwqIybDWIt/9foqSMxaRtqJ8Ka
         eJL99JiS+Q8glv5G4lyv71YV3/Jzt9qqRkAaRorcNr25uPuAJzHIbZuEadK2TtHkVaYA
         71rkrFL1mIUvJ3yRG0LXGlvALRH3JEMecStsR7NFDVERIsOKMAMen03UzVUkoJ7AQyi+
         N6Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R6Ma+iQ4IbfZcsMnb+cefqGmQZiBn/c9c7kN69ip2FU=;
        b=fxE4dtizN4pR00I1IuAp+YvoxLb0g6iqJR2IRd+fW7z3BSlCLRTHCq0pl+1di3dHCd
         Uuv0cIUdU+4QJni1LxyCXTXKXRdW/mG2zfzQy36J/SUSYO3ApycPHludhN2mRlpP2+5/
         +t+8DfOhRY8cAuRhs1e0NMZ1grA8YEdb1nEBDwNCOi0nOI5FwmAkv1U3n0lmPlT5vNM2
         uauCKQrVLNyokd+rhWSUpEjhMhFR7DVlwyvcfkPGhtXkUZrAPSeJKPnYVEnGDaFUBrvA
         4cxgejdMLYK509udJk18dfHdK6+OSH84d6Zgr8qGlFnf+rmQYknYQ+5WvF3uXLyDkk2O
         NHxQ==
X-Gm-Message-State: AOAM531tvNX/rtXWL4ViHIIolhgk081TmF/PX32y5uOyaSGJsRPVabF/
	6MWzOE4KWa0RMKoFkvBa8wCpmS8TeOmY/A==
X-Google-Smtp-Source: ABdhPJz9i970Cdlg8MxGXEEJCnjdePLj0dThrzVEH4/pkse6Msjo0LCg21bqycy0CTvP1SStDOoBLA==
X-Received: by 2002:adf:b307:: with SMTP id j7mr7649067wrd.243.1626378004687;
        Thu, 15 Jul 2021 12:40:04 -0700 (PDT)
Return-Path: <uvv.mail@gmail.com>
Received: from slackware.local ([194.99.105.68])
        by smtp.gmail.com with ESMTPSA id p11sm7533809wrw.53.2021.07.15.12.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 12:40:04 -0700 (PDT)
From: "Vyacheslav Yurkov" <uvv.mail@gmail.com>
To: Openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH v3 8/8] docs: add overlayfs class
Date: Thu, 15 Jul 2021 21:39:33 +0200
Message-Id: <20210715193933.66120-8-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210715193933.66120-1-uvv.mail@gmail.com>
References: <20210715193933.66120-1-uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 documentation/ref-manual/classes.rst | 46 ++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 09878c480f..6d80e7dc4f 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1708,6 +1708,52 @@ one such example. However, being aware of this class can reduce the
 proliferation of different versions of similar classes across multiple
 layers.
 
+.. _ref-classes-overlayfs:
+
+``overlayfs.bbclass``
+=======================
+
+
+It's often desired in Embedded System design to have a read-only rootfs.
+But a lot of different applications might want to have a read-write access to
+some parts of a filesystem. It can be especially useful when your update mechanism
+overwrites the whole rootfs, but you want your application data to be preserved
+between updates. The ``overlayfs`` class provides a way to achieve that by means
+of overlayfs and at the same time keeping the base rootfs read-only.
+
+To use this class, set a mount point for a partition overlayfs is going to use as upper
+layer in your machine configuration. Underlying file system can be anything that
+is supported by overlayfs. This has to be done in your machine configuration::
+
+  OVERLAYFS_MOUNT_POINT[data] = "/data"
+
+.. note::
+
+  QA check fails to catch file existence if you redefine this variable in your recipe!
+
+The class assumes you have a data.mount systemd unit defined elsewhere in your BSP
+(e.g. in systemd-machine-units recipe) and it's installed to the image.
+
+Then you can specify writable directories on a recipe basis::
+
+  OVERLAYFS_WRITABLE_PATHS[data] = "/usr/share/my-custom-application"
+
+To support several mount points you can use a different variable flag. Assume we
+want to have a writable location on the file system, but not interested where the data
+survive a reboot. Then we could have a mnt-overlay.mount unit for a tmpfs file system.
+
+In your machine configuration::
+
+  OVERLAYFS_MOUNT_POINT[mnt-overlay] = "/mnt/overlay"
+
+and then in your recipe::
+
+  OVERLAYFS_WRITABLE_PATHS[mnt-overlay] = "/usr/share/another-application"
+
+.. note::
+
+   The class does not support /etc directory itself, because systemd depends on it
+
 .. _ref-classes-own-mirrors:
 
 ``own-mirrors.bbclass``
-- 
2.28.0

