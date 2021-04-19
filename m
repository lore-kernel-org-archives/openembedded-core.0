Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.6335.1618822854983782003
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Apr 2021 02:00:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=h6d5Z55g;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id w23so35899713ejb.9
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Apr 2021 02:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gAq0yTZJtze9USbuGnCC+PHadyAPxfmhemLedmKkKhA=;
        b=h6d5Z55gF3Z01qmNSWSjrtciILy4Kfi1Iq9tQdx3F7nGJyBbbJKfdcSuM2HTHgbO2r
         2sciaJxpNbiTzmTp9oNHqTHrixnIER3yLdkcQC6CUSo/+60/WhXbO8Flmoe95clxnLin
         0d30Wt5Z6C61nlxlEN00ISp06AS0eZJ/JXbOSKL5BYKUgRpIlhOckOMZ9ynOw1mbpGbt
         HzLcp3PzgWU9zDdDpscf5LARo60LIbmZMiNLOqoLuf9h3CGuU6NQXPk/xPxjhiujBG0T
         5mp3QTNQoBiE0XHY88qT1nNWUJuZ96tuw5eL3kekPbiTLk4Vm3AjL5m2XjNVu7gueQWQ
         CnGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gAq0yTZJtze9USbuGnCC+PHadyAPxfmhemLedmKkKhA=;
        b=ijVyL0uJp4ltzqnfpc1h17C/J0b1deSlO0sRTYHI1j0PvWTjpF0oxk4ioBMf2q6BjU
         NmpOXN9wYKg/l+Z3gKslT2gGK26YMYzx3QRz7NcK8l/zv2w+xy2jkTwqBG4oj2XBq7tM
         Hp4AsDfixGsJJOnZxKjBaki76f/wMW65linXDfBfZggOFAccXGWxdSrK4k7R7yzWmVuJ
         zaBIiNcpZ62U4+fMc4uCwEZwRvU8gBoHldxWIO7NxWR23J1I7eqHZS5IXt7b0vhm189i
         4RMUNXYBnEdc/fQjK7J1vWMm43b6mzIS+31l43zmjR1cF3vmn6c+oLceycWL2xmtzy+x
         ebQw==
X-Gm-Message-State: AOAM531ZtDOncYgdnenvdvbjO8G/0ts5PHPjAvKEaA5vVzb6iPWY/gto
	l1waQ8ZFr6rJtyyc+WGlsqWuQRYbi1AYow==
X-Google-Smtp-Source: ABdhPJzzz/48D1dP9KzIq9eCUfw1He7c9yrFXVBQttWTBfip9V8rltl/h7uubJBUvjvamI7PHKXnEw==
X-Received: by 2002:a17:906:fad8:: with SMTP id lu24mr20146956ejb.159.1618822853562;
        Mon, 19 Apr 2021 02:00:53 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id dc24sm3596474ejb.123.2021.04.19.02.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 02:00:53 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 4/4] dev-manual/common-tasks.rst: correct the documentation for debuginfod
Date: Mon, 19 Apr 2021 11:00:44 +0200
Message-Id: <20210419090044.582453-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210419090044.582453-1-alex.kanavin@gmail.com>
References: <20210419090044.582453-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Particularly,
- correctly describe the use of DEBUGINFOD_URLS; drop it from bitbake variables
- all necessary component tweaks are enabled by default via DISTRO_FEATURES
- provide on-target examples of what to look for when things work properly

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 documentation/dev-manual/common-tasks.rst | 34 +++++++++++++++--------
 documentation/ref-manual/variables.rst    |  6 ----
 2 files changed, 22 insertions(+), 18 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 176025f9e8..9f33b6b2c8 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -10005,34 +10005,44 @@ debug symbols from the server.
 
 To run a debuginfod server, you need to do the following:
 
--  Ensure that this variable is set in your ``local.conf`` file:
+-  Ensure that "debuginfod" is present in :term:`DISTRO_FEATURES
+   (it already is in oe-core defaults and poky reference distribution).
+   If not, set:
    ::
 
-      PACKAGECONFIG_pn-elfutils-native = "debuginfod libdebuginfod"
+      DISTRO_FEATURES_append = " debuginfod"
 
-   This :term:`PACKAGECONFIG` option enables debuginfod and libdebuginfod for
-   "elfutils-native".
+   This distro feature enables the server and client library in elfutils,
+   and enables debuginfod support in clients (at the moment, gdb and binutils).
 
--  Run the following commands to set up the "debuginfod" server:
+-  Run the following commands to launch the "debuginfod" server on the host:
    ::
 
       $ oe-debuginfod
 
+-  To use debuginfod on the target, you need to know the ip:port where
+   debuginfod is listening on the host (port defaults to 8002), and export
+   that into the shell environment, for example in qemu:
+   ::
 
-To use debuginfod on the target, you need the following:
+      root@qemux86-64:~# export DEBUGINFOD_URLS="http://192.168.7.1:8002/"
 
--  Ensure that this variable is set in your ``local.conf`` file:
+-  Then debug info fetching should simply work when running the target gdb,
+   readelf or objdump, for example:
    ::
 
-      DEBUGINFOD_URLS = "http://localhost:8002/"
-
-   This :term:`DEBUGINFOD_URLS` option does the client configuration.
+      root@qemux86-64:~# gdb /bin/cat
+      ...
+      Reading symbols from /bin/cat...
+      Downloading separate debug info for /bin/cat...
+      Reading symbols from /home/root/.cache/debuginfod_client/923dc4780cfbc545850c616bffa884b6b5eaf322/debuginfo...
 
+-  It's also possible to use "debuginfod-find" to just query the server:
    ::
 
-        PACKAGECONFIG_pn-gdb = "debuginfod"
+      root@qemux86-64:~# debuginfod-find debuginfo /bin/ls
+      /home/root/.cache/debuginfod_client/356edc585f7f82d46f94fcb87a86a3fe2d2e60bd/debuginfo
 
-   This :term:`PACKAGECONFIG` option enables "debuginfod" for "gdb".
 
 Using the gdbserver method
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 74ac12bf98..8a35b0960e 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1563,12 +1563,6 @@ system and gives an overview of their function and contents.
 
          DEBIANNAME_${PN} = "dbus-1"
 
-   :term:`DEBUGINFOD_URLS`
-      Points to the URL of the "debuginfod" server. Such that for every
-      debugging information lookup, the debuginfod client will query the
-      server and return the requested information. You set this variable
-      in your ``local.conf`` file.
-
    :term:`DEBUG_BUILD`
       Specifies to build packages with debugging information. This
       influences the value of the ``SELECTED_OPTIMIZATION`` variable.
-- 
2.30.2

