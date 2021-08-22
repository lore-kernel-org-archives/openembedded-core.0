Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.14900.1629663785095921726
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Aug 2021 13:23:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kDBCiNzN;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id k8so23012149wrn.3
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Aug 2021 13:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7gw7w7dcvjg1WDIM/23GsWXZPD1wavsK5Zgp7kvLgQI=;
        b=kDBCiNzNt/YgkrT1IF5BQVT648gLU6sAR1mRJl1s31aHBJbIrR8CUQaTW4o7MDyLA9
         om7RC4p/ASFWzqkPj1mUM/V72nknzY0bEHEwzWc5WOZD7l4h92yP6Dcj1fm5o3LJxpFx
         XgM1RVSkzDBwRzrsYDiyI4jQBg9eZsuXKnl+cOLZElV/46YGlpOu38yEbwaNrbcnVEHp
         0hrawD8GYOADlBWnJq2Mo/p/yE51db7hgqobzyV0Troe9tyKeqjOj781MPxZGM23k/KP
         0c/6j0jbv/edIVl5l2PLTvCH7kVLcRaZkreqVBDbf2CCXgo7+zO2kJolReF3SWCNI5fK
         NgiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7gw7w7dcvjg1WDIM/23GsWXZPD1wavsK5Zgp7kvLgQI=;
        b=kgWCMbGig8Tp4VDcLL7qdbKm0dcVcDDKNXX+tBGDXmvoB1xdbUjwJA86sDdpHTRh89
         wHew93utilUc6vvFQA1iFak4gndFppfMBhnpJybXMaC7qr42PKWquUqeWlfG+3m9ryXJ
         khYynefdsSdmDdF6oPLN8nPY6YQPQU6KcGncaQrGoFnnsZ0gwk9Zt48Mq3QZM9CuwRsF
         CcjvW5SUt1t8jMOhq0yUXrfFvMAIpJnfJ2v3nBif+mU4GCNLAed2p4AJwFXddQwfgIJV
         RHcV3S4FfggrXY/Glw3nV9VRSUsfldVcFLDNC8OyTKMMzFyDwIj5brO2yB66/P3mjOVY
         fJMA==
X-Gm-Message-State: AOAM530q/Ek6M8mTxrvoMPYhw8VMyJc5n6IgoyfnpptOCahkehhQ4+kk
	hO1DYTy8KiOTTfHaQMxjVinfNHXJl6BuaQ==
X-Google-Smtp-Source: ABdhPJwpBPjpCELL/AAAqHe/hUovEg2pt/bjsy78rWfNtEuDr2CFmVrBhkk4bfaYNhBaZwHfdbQxow==
X-Received: by 2002:adf:fc45:: with SMTP id e5mr9756738wrs.127.1629663783542;
        Sun, 22 Aug 2021 13:23:03 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id r26sm673700wmh.27.2021.08.22.13.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 13:23:02 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH] qemu: add a hint on how to enable CPU render nodes when a suitable GPU is absent
Date: Sun, 22 Aug 2021 22:22:58 +0200
Message-Id: <20210822202258.689086-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is particularly useful for llvm-accelerated GL rendering from qemu guest to
an offscreen buffer (accessible over vnc or spice) using llvmpipe on the
host, rather than using unaccelerated swrast renderer in the guest.

This is the best that can be done in the absence of a host GPU with render node
support (such as old Matrox cards common in servers, or fully virtualized cloud
environments with no GPU at all).

Note: even though NVidia blob drivers do support render nodes, they do not
support gbm (yet?), and so rendering will fall back to llvmpipe as well even when
the system has a 3000 euro NVidia GPU. Cue Linus picture.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 6 ++++--
 scripts/runqemu                              | 2 ++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 4cfec94d85..129503de63 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -212,12 +212,14 @@ class TestImage(OESelftestTestCase):
         Author: Alexander Kanavin <alex.kanavin@gmail.com>
         """
         import subprocess, os
+
+        render_hint = """If /dev/dri/renderD* is absent due to lack of suitable GPU, 'modprobe vgem' will create one sutable for mesa llvmpipe sofware renderer."""
         try:
             content = os.listdir("/dev/dri")
             if len([i for i in content if i.startswith('render')]) == 0:
-                self.skipTest("No render nodes found in /dev/dri: %s" %(content))
+                self.skipTest("No render nodes found in /dev/dri: %s. %s" %(content, render_hint))
         except FileNotFoundError:
-            self.skipTest("/dev/dri directory does not exist; no render nodes available on this machine.")
+            self.skipTest("/dev/dri directory does not exist; no render nodes available on this machine. %s" %(render_hint))
         try:
             dripath = subprocess.check_output("pkg-config --variable=dridriverdir dri", shell=True)
         except subprocess.CalledProcessError as e:
diff --git a/scripts/runqemu b/scripts/runqemu
index 0976273eb0..c467b0eb19 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -72,6 +72,8 @@ of the following environment variables (in any order):
     gl - enable virgl-based GL acceleration (also needs gtk or sdl options)
     gl-es - enable virgl-based GL acceleration, using OpenGL ES (also needs gtk or sdl options)
     egl-headless - enable headless EGL output; use vnc (via publicvnc option) or spice to see it
+    (hint: if /dev/dri/renderD* is absent due to lack of suitable GPU, 'modprobe vgem' will create
+    one sutable for mesa llvmpipe sofware renderer)
     serial - enable a serial console on /dev/ttyS0
     serialstdio - enable a serial console on the console (regardless of graphics mode)
     slirp - enable user networking, no root privileges is required
-- 
2.31.1

