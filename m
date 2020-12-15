Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web12.8183.1608021126558524893
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Dec 2020 00:32:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nathanrossi.com header.s=google header.b=OH94oFjx;
 spf=pass (domain: nathanrossi.com, ip: 209.85.214.170, mailfrom: nathan@nathanrossi.com)
Received: by mail-pl1-f170.google.com with SMTP id 4so10622834plk.5
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Dec 2020 00:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nathanrossi.com; s=google;
        h=date:message-id:from:to:cc:subject:content-transfer-encoding
         :mime-version;
        bh=IXeQikfZCGvm2JTC6Sxo06twcQEUEfa2I6y3GFUPzz4=;
        b=OH94oFjxCLwihQa/MOcS6jruwZvz10XDf+9Yj5AbD+GWEjWEq1HEzvfEpPUu2/zERE
         QeO0BwZu69I4S4yt/vUITotBABUJ7dvUedmlIM9g33sHBFaDUnCRtAAqtBueAOwK+gqW
         whBLlLcc4rsqrFTfDzDs0+ufP0kwDo+Pv5qMlzZTTJ9BgH8VZYZq9nh5mDLN0lfQb1o0
         UQ/EcJih2FGTm5sQiX5A7RKQoH+2s3NVdCA80SteLp8AqQYQeETMkH9Yg9b/FEVEeJkj
         QvFxnnvI7IyWD3Fzm2zYgf4WJQricRXVP8eUdh2dkg19fP81fZJEuhMj0tBbUtr209Tk
         eQCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:from:to:cc:subject
         :content-transfer-encoding:mime-version;
        bh=IXeQikfZCGvm2JTC6Sxo06twcQEUEfa2I6y3GFUPzz4=;
        b=KU9HFGtFBJAP7i8Dy3jNP4R+U0EG8X4NlOAr6JFwxKZNBrRiN4PYPCWsJpYR1+EV5p
         77mEu7rHmT3BgRmqkQgA9A5pKimRo4VxrmBQj4iv+wlXArhrlFi1+c7WYVcBdsBauY+w
         3atpk2/rYwilT0jp1KQI9WXu8wh7vo1oWVngmHrc2QFkGnDl8SPeKAGdXO2RIf6v1SAA
         qrMdmi4Jt/IwfR/ZigCtNLCcNP5DuMvrPzoTwhBjaKgvjhYX3tItoZp3yAsRfFxP3vs3
         dYHEROQywBayMOFRfIhEkEL3deDJy5Jvo4nRuecp6MOHts+O5UmJMn6pmQydZ7zTd7Ca
         isfQ==
X-Gm-Message-State: AOAM531o+KanWtItof/hoLSGjKjDpPoQvKwm4A6Zohj0tjyl7MBhxbgC
	vofT9oqR4+hejEgGb5JaJtukBzzQJO8awPH7
X-Google-Smtp-Source: ABdhPJz+iKpvfG+gwXlmNNWR54DvadyaNEiajkituc4WUYE8KbWba/hhYF1dLWuF4AcI7ogsavRzbA==
X-Received: by 2002:a17:902:8ec4:b029:db:f9ef:564f with SMTP id x4-20020a1709028ec4b02900dbf9ef564fmr10359393plo.19.1608021126134;
        Tue, 15 Dec 2020 00:32:06 -0800 (PST)
Return-Path: <nathan@nathanrossi.com>
Received: from [127.0.1.1] (117-20-70-209.751446.bne.nbn.aussiebb.net. [117.20.70.209])
        by smtp.gmail.com with UTF8SMTPSA id s5sm21754294pju.9.2020.12.15.00.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 00:32:05 -0800 (PST)
Date: Tue, 15 Dec 2020 08:32:00 +0000
Message-Id: <20201215083200.1360715-1-nathan@nathanrossi.com>
From: "Nathan Rossi" <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
Cc: Nathan Rossi <nathan@nathanrossi.com>
Subject: [PATCH] ncurses: Prevent LDFLAGS being emitted in .pc files
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

By default ncurses includes the values of LDFLAGS in its output
pkgconfig .pc files. This causes issues because OE includes options that
are specific to either the build host, or build configuration. These
options are not expected to be embedded in the pkgconfig output that is
installed.

Specifically this change resolves issues with uninative, where uninative
includes '-Wl,--dynamic-linker=' in LDFLAGS in order to force the
building and execution of native binaries against the dynamic linker
provided by uninative. This path is specific to TMPDIR at the time of
build, such that the installed files (and the associated sstate) have
this path. This prevents the sstate from being portable across build
directories/hosts.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 ...ig.in-Do-not-include-LDFLAGS-in-generated.patch | 29 ++++++++++++++++++++++
 meta/recipes-core/ncurses/ncurses_6.2.bb           |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-core/ncurses/files/0003-gen-pkgconfig.in-Do-not-include-LDFLAGS-in-generated.patch

diff --git a/meta/recipes-core/ncurses/files/0003-gen-pkgconfig.in-Do-not-include-LDFLAGS-in-generated.patch b/meta/recipes-core/ncurses/files/0003-gen-pkgconfig.in-Do-not-include-LDFLAGS-in-generated.patch
new file mode 100644
index 0000000000..1eb17767a0
--- /dev/null
+++ b/meta/recipes-core/ncurses/files/0003-gen-pkgconfig.in-Do-not-include-LDFLAGS-in-generated.patch
@@ -0,0 +1,29 @@
+From 3b3e87934bb6d8511261d7c3d6e39b4f71849272 Mon Sep 17 00:00:00 2001
+From: Nathan Rossi <nathan@nathanrossi.com>
+Date: Mon, 14 Dec 2020 13:39:02 +1000
+Subject: [PATCH] gen-pkgconfig.in: Do not include LDFLAGS in generated pc
+ files
+
+Including the LDFLAGS in the pkgconfig output is problematic as OE
+includes build host specific paths and options (e.g. uninative and
+'-Wl,--dynamic-linker=').
+
+Upstream-Status: Inappropriate [OE Specific]
+Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
+---
+ misc/gen-pkgconfig.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/misc/gen-pkgconfig.in b/misc/gen-pkgconfig.in
+index 8f00b824b9..009d215663 100644
+--- a/misc/gen-pkgconfig.in
++++ b/misc/gen-pkgconfig.in
+@@ -80,7 +80,7 @@ if [ "$includedir" != "/usr/include" ]; then
+ fi
+ 
+ lib_flags=
+-for opt in -L$libdir @LDFLAGS@ @EXTRA_LDFLAGS@ @LIBS@
++for opt in -L$libdir @LIBS@
+ do
+ 	case $opt in
+ 	-l*) # LIBS is handled specially below
diff --git a/meta/recipes-core/ncurses/ncurses_6.2.bb b/meta/recipes-core/ncurses/ncurses_6.2.bb
index f3c84c2877..e7d7396a20 100644
--- a/meta/recipes-core/ncurses/ncurses_6.2.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.2.bb
@@ -2,6 +2,7 @@ require ncurses.inc
 
 SRC_URI += "file://0001-tic-hang.patch \
            file://0002-configure-reproducible.patch \
+           file://0003-gen-pkgconfig.in-Do-not-include-LDFLAGS-in-generated.patch \
            "
 # commit id corresponds to the revision in package version
 SRCREV = "a669013cd5e9d6434e5301348ea51baf306c93c4"
---
2.29.2
