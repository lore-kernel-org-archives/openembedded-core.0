Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
 by mx.groups.io with SMTP id smtpd.web09.9621.1625830375667673446
 for <Openembedded-core@lists.openembedded.org>;
 Fri, 09 Jul 2021 04:32:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sCCqSiKL;
 spf=pass (domain: gmail.com, ip: 209.85.166.52, mailfrom: uvv.mail@gmail.com)
Received: by mail-io1-f52.google.com with SMTP id h6so12081538iok.6
        for <Openembedded-core@lists.openembedded.org>; Fri, 09 Jul 2021 04:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R6Ma+iQ4IbfZcsMnb+cefqGmQZiBn/c9c7kN69ip2FU=;
        b=sCCqSiKLA8HzB8SoPgWvmePUammoCNDOBrU/ahlZXoteTiq0tcqm7Wjiuq2FLb3ZIx
         9OFN2KV0pZW0GJquPPRPoJOoqMlxD6afopWuA8vHDC7S38XtnbrGl6wdOa6IVo83A+d6
         fCKr9Nmuu2kW1jaSRywFQ83ngs43pJ3HhPRgFgGOQtCIkJ/NKol2ScPmbpbbrfGAEtd/
         X0MdqScpCK76WAcLMq+/RbmvxEtgGTE4Dkn8zc8ZnErEb9nVkgfjVWnejtT/bxOsbaoU
         5X85Z+fM4gRfkLFLl8up11aaLutrpj78xO/KzvTRvHhq5HCjHxLFOYpZz1+VNvQuYxsU
         cmMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R6Ma+iQ4IbfZcsMnb+cefqGmQZiBn/c9c7kN69ip2FU=;
        b=D/LpKkKfI7VYagA6A7uyMk3tjpFL+a2boeQhnqmDHhMs9sZtyFuOvFUEvYhlvoRMUO
         YQKGg3ElPAd2FiMrCcFm8s7VPfN7bz7UP2RzVd7u6bI/4N4Aan5+zydZ1srzwFNsk7Ey
         pPy2DE7OZ5KxNaI06GkCoI1je1i/xSzrhRuDI+1trdcWnmR2EnWVRAcScTcmmGwr55VZ
         MpH1u2g0Ibptvk9TJjfHYLI7sj8+kFwpHIyL/L8eGYgH9t4uYcwHyWaLhPV3HRMEHBQm
         /qoOVWt7PAKRDDyFQXXfJgBaEMz6nZeBigbBZfxAurZ3ipCxQOb+ssH2FayooVktOY7c
         y0BA==
X-Gm-Message-State: AOAM533WmKu1NsAhmrBHjD6TiGymn+K+XSco/N7rMSxJI9CRlLSFuAAI
	Ls7KlcInzXZWW3y91rC5dCECSaROjynUsw==
X-Google-Smtp-Source: ABdhPJweMCdKJD9FG4xzvIdfGjCIgjw4m7vK16498mbtz3XUW9w/wEmTMYkrBfGxU/n3pKZ6J/FRcg==
X-Received: by 2002:a02:9a02:: with SMTP id b2mr26231479jal.107.1625830374792;
        Fri, 09 Jul 2021 04:32:54 -0700 (PDT)
Return-Path: <uvv.mail@gmail.com>
Received: from slackware.local ([37.120.205.173])
        by smtp.gmail.com with ESMTPSA id q7sm2570463ilv.17.2021.07.09.04.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 04:32:54 -0700 (PDT)
From: "Vyacheslav Yurkov" <uvv.mail@gmail.com>
To: Openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH v2 8/8] docs: add overlayfs class
Date: Fri,  9 Jul 2021 13:31:46 +0200
Message-Id: <20210709113146.69020-8-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210709113146.69020-1-uvv.mail@gmail.com>
References: <20210709113146.69020-1-uvv.mail@gmail.com>
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

