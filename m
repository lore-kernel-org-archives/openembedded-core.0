Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web12.10089.1619891224637503189
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 May 2021 10:47:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ADKVguGh;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id y32so773970pga.11
        for <openembedded-core@lists.openembedded.org>; Sat, 01 May 2021 10:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=G+9BmNpcqGd4AkL3kXjrpQK4NtpqQjVlWw7EWOujbc0=;
        b=ADKVguGh8IS3nX5Zds3igQZY2VDp9Gy0sO/PrGkoOJrzojxM6fG+rREdF6aLFA3iVH
         BPYJV8dEtJAaRA8k67NQrAbuxgiVK09dDs4AMi2h3OBSM6TeQN+ySEs8bW3n6DO6EuBF
         EBv/BT3nTYoVAwNQ7X5gGXD9sfAepGiNxmDmzA5xxxBv5sF0iwrwd/Y2vvoX9s6v399C
         kUYcFLhiNKdLrFpd17WtLah9WXWB5j5JbRoxys0vvFyuqyzjqWi64y5f1bW8icfB1/VM
         EPwaGc2DCqR2cxt0lfCOHa8HVX9ltXWUjSKuVYzssGhAPsed1vK8qqqHKOaFgVIDJCW7
         gTcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G+9BmNpcqGd4AkL3kXjrpQK4NtpqQjVlWw7EWOujbc0=;
        b=QCNOEwr+KNZnWdTiYRo5/6CavSLqFIuxMdzvzCEp0m4WyPmdIy4dgiHiYDo/3bW61y
         0Pi4EatETUcu83ih8soSgYicO0fw8ST5MVi1+BIggWzJoMUCpF/mCs/9gi6rSpyPNCnR
         /gwu1fFRkb1F1+IuROx2OsgcYClgQb165CgYAXJbSsbN85aWwo3mSAUUl38HEeGkA7Lm
         d87mAyiWHZ2hPbiSXS63Lur2I1+eTUXTAb+unxUjB6OIE64cB/ai7VZTcAjLBIL1bx3d
         qRlFvVTuzFuMtem2uUUGyDBzDjUJ0YynX29V14NUowGJroFhPa3sjWQITO/Phn121MhA
         plTQ==
X-Gm-Message-State: AOAM531GnpxTgIrrMExvjb6srDSgVSswjImGFfJID/h4RZJsXP3GU1B7
	BzLzJJhk800p2LKg8jQnmeywF4+Rc5ldTQ==
X-Google-Smtp-Source: ABdhPJyPspMGXXexglKzURoSMyaat0sVPyhsa2jp4f3N/zYR2ONZJ6KjFoDyyGGzixPJ06ufYaUASw==
X-Received: by 2002:a63:f965:: with SMTP id q37mr10268760pgk.132.1619891223982;
        Sat, 01 May 2021 10:47:03 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a7ac])
        by smtp.gmail.com with ESMTPSA id h9sm5750098pgl.67.2021.05.01.10.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 May 2021 10:47:03 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/4] bluez: Fix shadowing of pause function from libc
Date: Sat,  1 May 2021 10:46:57 -0700
Message-Id: <20210501174658.524270-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210501174658.524270-1-raj.khem@gmail.com>
References: <20210501174658.524270-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 ...se-funciton-to-avoid-shadowing-glibc.patch | 48 +++++++++++++++++++
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-audio-Rename-pause-funciton-to-avoid-shadowing-glibc.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index a7b628ce1b..74b59e406c 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -52,6 +52,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'file://0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch', d)} \
            file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
            file://0001-test-gatt-Fix-hung-issue.patch \
+           file://0001-audio-Rename-pause-funciton-to-avoid-shadowing-glibc.patch \
            "
 S = "${WORKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-audio-Rename-pause-funciton-to-avoid-shadowing-glibc.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-audio-Rename-pause-funciton-to-avoid-shadowing-glibc.patch
new file mode 100644
index 0000000000..d9067df02d
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-audio-Rename-pause-funciton-to-avoid-shadowing-glibc.patch
@@ -0,0 +1,48 @@
+From 8adab7f1e04948e78854953f9373cac741445a0f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 30 Apr 2021 21:09:33 -0700
+Subject: [PATCH] audio: Rename pause funciton to avoid shadowing glibc
+ defintions
+
+Fixes
+profiles/audio/media.c:1284:13: error: static declaration of 'pause' follows non-static declaration
+static bool pause(void *user_data)
+            ^
+/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/bluez5/5.56-r0/recipe-sysroot/usr/include/unistd.h:478:12: note: previous declaration is here
+extern int pause (void);
+           ^
+../bluez-5.56/profiles/audio/media.c:1334:11: warning: incompatible function pointer types initializing 'bool (*)(void *)' with an expression of type 'int (void)' [-Wincompatible-function-pointer-types]
+        .pause = pause,
+                 ^~~~~
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ profiles/audio/media.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/profiles/audio/media.c b/profiles/audio/media.c
+index c84bbe2..7110089 100644
+--- a/profiles/audio/media.c
++++ b/profiles/audio/media.c
+@@ -1281,7 +1281,7 @@ static bool stop(void *user_data)
+ 	return media_player_send(mp, "Stop");
+ }
+ 
+-static bool pause(void *user_data)
++static bool apause(void *user_data)
+ {
+ 	struct media_player *mp = user_data;
+ 
+@@ -1331,7 +1331,7 @@ static struct avrcp_player_cb player_cb = {
+ 	.set_volume = set_volume,
+ 	.play = play,
+ 	.stop = stop,
+-	.pause = pause,
++	.pause = apause,
+ 	.next = next,
+ 	.previous = previous,
+ };
+-- 
+2.31.1
+
-- 
2.31.1

