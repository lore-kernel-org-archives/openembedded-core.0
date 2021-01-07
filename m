Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web12.1442.1610056909539657039
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jan 2021 14:01:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Btb7OuMC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 190so6343106wmz.0
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Jan 2021 14:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ndSFjxUyn/c3Elg1UnSenatl/OKeU9cRwAuTDjz/Gc4=;
        b=Btb7OuMCKD6k2941pFVvhPQ6WkvHzwyeDjw1eXMNxI/pIjDsrtEx7qJt5+NEafLpiO
         vkuEycs6qV0EfBa0v9ZweRqKvjnc7Zw+zAr8L5f65FMcNedmSw5OQI+D53njUZlAaVeZ
         ayU3sny4PNu6J3HSrW37zTyLW6XXRSlZmW0TM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ndSFjxUyn/c3Elg1UnSenatl/OKeU9cRwAuTDjz/Gc4=;
        b=uOlgJY0+El1DvBfXNdxeRLCvTU1IrJ3zODq9b3FK+gDUMM3YQf6Ssv3oj3ZyQ1pmQJ
         v9C8EuQJxbqlotvC+qF/wSZ6nEk4UFYDpiMnfItXRwyY7fTFHB7UHHa9ct3oYCoHldMN
         lHEJYJBiWYzd7hdWW34je2rQjR6p9JEabz+RoeNaDOHSwc47ObJLIlSq2Tjiq/BdIvH8
         KO+bq5mAvDsSQUGvCThpNgCqRN0daeCejw0XVO6IojJrS1gSW1wEvIXrPyCtEy/l478L
         ucnzhjOso8ZIAbhPiWCe4Hyt8XNw0g7IUi8i7nYMRvfCjDvROH/DdfIkRtAwA1fg80KA
         xwVA==
X-Gm-Message-State: AOAM530/xxMaPRG8H2zXq9hWWv+Lc4MobDh1XVzYK+/q/e9gh/ylN2hF
	4p2GT/yd1od1KzSZ15AQy5kOUIN47hfohg==
X-Google-Smtp-Source: ABdhPJyuKzaRpZ/6Fs1/d9CzCFLi6vidRJLsIt234YaxHiG16uuT6o7sAW1qAeiTJA+Xp+JojcScvg==
X-Received: by 2002:a1c:8d:: with SMTP id 135mr431081wma.177.1610056907894;
        Thu, 07 Jan 2021 14:01:47 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:8262:2156:a38b:824c])
        by smtp.gmail.com with ESMTPSA id j59sm10962686wrj.13.2021.01.07.14.01.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jan 2021 14:01:47 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] qemu: Fix mingw builds
Date: Thu,  7 Jan 2021 22:01:45 +0000
Message-Id: <20210107220146.594812-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210107220146.594812-1-richard.purdie@linuxfoundation.org>
References: <20210107220146.594812-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After the recent upgrade, mingw builds failed. Add a hack whilst a solution
is discussed upstream.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../recipes-devtools/qemu/qemu/mingwfix.patch | 21 +++++++++++++++++++
 2 files changed, 22 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/mingwfix.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 4c1502da7f1..286901fb1f0 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -26,6 +26,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0010-configure-Add-pkg-config-handling-for-libgcrypt.patch \
            file://0001-Add-enable-disable-udev.patch \
            file://0001-qemu-Do-not-include-file-if-not-exists.patch \
+           file://mingwfix.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/mingwfix.patch b/meta/recipes-devtools/qemu/qemu/mingwfix.patch
new file mode 100644
index 00000000000..8d76cef6388
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/mingwfix.patch
@@ -0,0 +1,21 @@
+OE assumes that mingw files are in a unix like file layout. The
+'flattening' done by configure in qemu for mingw32 breaks things
+for us. We are discussing with upstream but for now, hack this to
+disable it and use the unix like layout everywhere.
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Upstream-Status: Submitted [https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg01073.html]
+
+Index: qemu-5.2.0/configure
+===================================================================
+--- qemu-5.2.0.orig/configure
++++ qemu-5.2.0/configure
+@@ -1541,7 +1541,7 @@ libdir="${libdir:-$prefix/lib}"
+ libexecdir="${libexecdir:-$prefix/libexec}"
+ includedir="${includedir:-$prefix/include}"
+ 
+-if test "$mingw32" = "yes" ; then
++if test "$mingw32" = "dontwantthis" ; then
+     mandir="$prefix"
+     datadir="$prefix"
+     docdir="$prefix"
-- 
2.27.0

