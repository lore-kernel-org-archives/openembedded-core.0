Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web12.29840.1593356690090674347
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jun 2020 08:04:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tOMUXaX0;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id l12so14059200ejn.10
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Jun 2020 08:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q/vNftdR9HCB5vXdEkFJQ+nejXXrFc46Hpf6jCS9gkE=;
        b=tOMUXaX0XOhhw9h1NF4831VwAiQh7yF90dORwlpqwr+trjrsQ/O62+Yy7h+9W96bFB
         TuciXBehe0JPIEy3HkBDvm8Fh8JbricP4wHgNLcUlSPQJci6/F2diuCAyuUzTmdb5InU
         05HgWWZySitNsz4BTI9BWv4Ex0S2mxORUF4rUfhwYm/dbi/hJqxcw3B9+BNffa/b5A6U
         ghUlvn2A5SCUN+JDOnB0IhmyfQISIHgwozJ8Wt+0jeC7fDiUenftSBV9roS1xkwW5b/T
         VPQssneWCzve2RkuWgHXGcXhar7YfWYHpU7HAL/X7MeOCdgfpO/2QuTsQpFTmjaNmS8R
         6MWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q/vNftdR9HCB5vXdEkFJQ+nejXXrFc46Hpf6jCS9gkE=;
        b=IWDCyKNvGDGa2UoWnX8v1jgTHMwRaDUcsDDUruaxLf9ufinF1Sa/moZn9F+dpXFaz6
         ska3/juBVYpAyACQxPYtSIOhiQ3zEoa7xle3kRT8XK9uOIg07ngC5EuUVgT94rX/LLyL
         J2TawSll2Awcx9jM8xaKAg1ficZ57t1dx4ebus21e2P/wQHqplEq+361Pvactf0z3rrc
         ORA5VTpaY5IvdmNhuNsQJ1IfzYHaOJNdSDA+DqNghrJHIoJ+nhgAY5jBgFJyaKjA4upI
         ilT4ZV6DA3NEEbQP5EpQPyPJUgdMKmdLiFG9SywIlcC5Y9/I9Hy2hvSm6dshs/ztHbmQ
         b+aQ==
X-Gm-Message-State: AOAM531BhxAWp0IcZQh3JVqQmA9oOmbynTu/A6X4FV9IPnaMnWlrDpNf
	I/6Z8HzeF48rWuFl0ErphFntBxAm+VU=
X-Google-Smtp-Source: ABdhPJxYWwhYlWM9uWZaFDeLEEeQF7OdN6MbdzDAl5I2GK3O6gK+XJ6jS8YpgCnrbQt4XKIFDPg4SQ==
X-Received: by 2002:a17:906:3282:: with SMTP id 2mr10065345ejw.93.1593356687747;
        Sun, 28 Jun 2020 08:04:47 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:b652:c378:b428:fdf])
        by smtp.gmail.com with ESMTPSA id f17sm10508672ejr.71.2020.06.28.08.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2020 08:04:47 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH] xserver-xorg: add a patch to aid debugging an intermittent AB failure
Date: Sun, 28 Jun 2020 17:04:35 +0200
Message-Id: <20200628150435.13322-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...xserver-crash-out-if-memory-cannot-b.patch | 65 +++++++++++++++++++
 .../xorg-xserver/xserver-xorg_1.20.8.bb       |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-dix-atom.c-make-xserver-crash-out-if-memory-cannot-b.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-dix-atom.c-make-xserver-crash-out-if-memory-cannot-b.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-dix-atom.c-make-xserver-crash-out-if-memory-cannot-b.patch
new file mode 100644
index 0000000000..e7f04af4ff
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-dix-atom.c-make-xserver-crash-out-if-memory-cannot-b.patch
@@ -0,0 +1,65 @@
+From 4ee9a5d88f0703f5a1ff53668f7bb38d06c9f3ad Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Sun, 28 Jun 2020 11:57:08 +0000
+Subject: [PATCH] dix/atom.c: make xserver crash out if memory cannot be
+ allocated
+
+This patch is made strictly for debugging an intermittent autobuilder failure.
+https://bugzilla.yoctoproject.org/show_bug.cgi?id=13908
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ dix/atom.c | 13 ++++++++++++-
+ 1 file changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/dix/atom.c b/dix/atom.c
+index da0adfe..32d57f8 100644
+--- a/dix/atom.c
++++ b/dix/atom.c
+@@ -70,6 +70,12 @@ static NodePtr atomRoot = NULL;
+ static unsigned long tableLength;
+ static NodePtr *nodeTable;
+ 
++void kaboom(char* msg)
++{
++    LogMessage(X_ERROR,"%s\n", msg);
++}
++
++
+ Atom
+ MakeAtom(const char *string, unsigned len, Bool makeit)
+ {
+@@ -98,12 +104,15 @@ MakeAtom(const char *string, unsigned len, Bool makeit)
+                 return (*np)->a;
+         }
+     }
++    //kaboom("error: makeatom failure 0");
+     if (makeit) {
+         NodePtr nd;
+ 
+         nd = malloc(sizeof(NodeRec));
+-        if (!nd)
++        if (!nd) {
++            kaboom("error: makeatom failure 1");
+             return BAD_RESOURCE;
++        }
+         if (lastAtom < XA_LAST_PREDEFINED) {
+             nd->string = string;
+         }
+@@ -111,6 +120,7 @@ MakeAtom(const char *string, unsigned len, Bool makeit)
+             nd->string = strndup(string, len);
+             if (!nd->string) {
+                 free(nd);
++                kaboom("error: makeatom failure 2");
+                 return BAD_RESOURCE;
+             }
+         }
+@@ -124,6 +134,7 @@ MakeAtom(const char *string, unsigned len, Bool makeit)
+                     free((char *) nd->string);
+                 }
+                 free(nd);
++                kaboom("error: makeatom failure 3");
+                 return BAD_RESOURCE;
+             }
+             tableLength <<= 1;
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.8.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.8.bb
index 26815feb33..72d0d582eb 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.8.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.8.bb
@@ -5,6 +5,7 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://0001-test-xtest-Initialize-array-with-braces.patch \
            file://sdksyms-no-build-path.patch \
            file://0001-drmmode_display.c-add-missing-mi.h-include.patch \
+           file://0001-dix-atom.c-make-xserver-crash-out-if-memory-cannot-b.patch \
            "
 SRC_URI[md5sum] = "a770aec600116444a953ff632f51f839"
 SRC_URI[sha256sum] = "d17b646bee4ba0fb7850c1cc55b18e3e8513ed5c02bdf38da7e107f84e2d0146"
-- 
2.27.0

