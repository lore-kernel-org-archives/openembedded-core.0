Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.8465.1618836990051203490
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Apr 2021 05:56:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=t5c0qzc8;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id w23so36952568ejb.9
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Apr 2021 05:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=37VFPCJarsMo8BGPCb83v7rVh1DsdzoKK0GHu//zkB0=;
        b=t5c0qzc8LtR9JLLtTpRgTBQbzubIxUdflAHgY80Pd1aKFCmylTBNdAErlecsbGibFk
         wnnjHPkmkSx6HO3DMa9bZOfMnRnDQkU1XjwykMDNXZgbYGApZOPV986QAbDGz4YnOqZt
         JQGxtq/szTsFm3FAUUB7LdR6GoCFd9YLnlDxBYHJmVT8NpNa8C0xS2WxXOiwjMyENmz6
         pshJJb/2X1qgrI1pDSPV9YPxcjqWFdyHY3frs134LXZ8oacudwxGKYpxv9lCSSSV+tLn
         Wy/NbDO/YTvFXv+Bxkb9a00w5GDeJIDZ8sf8icPuSIk5v4CXHUXTWSjAY65jTRfdmJ5x
         8xXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=37VFPCJarsMo8BGPCb83v7rVh1DsdzoKK0GHu//zkB0=;
        b=OgbKMAleAt737mrDoevVW4CT3VLrdj4FKJ6t4uwzQ6C6bPI/rD2XwfcvjsGw35bFwr
         HRG3F0QQJ3fjHr5VN7VUQEuClc3mVoVWE2/P02nyOOKUpmD+DizxyQ5ATiYVwfxern4N
         0aYvisJQXqV73dKs3yg4vjxN/u1OtojCaDKhycWWU0ElZYIFj8zFOQ+1k+RkEn71MVzl
         Pimstm4+BGFml0HgHsB0avWlauSamHpVxDyZymydDZM8mwuNMsA1B9tPhBf/JJ4UZkWH
         ffC3Q3W+ddSnb+Ja2Y2ihvAwicgAYLV/QP4knw5N7Lin/mmlyspyZSBukc1HXnLnPYcD
         lFcQ==
X-Gm-Message-State: AOAM533DjH1mjc2lybHc6h2iG2itjrhKaR7ze52e9uYMIiqlTmTos6Dy
	CRVl9MBfsGpIjLEg9/oMxguknuhDDwq2cg==
X-Google-Smtp-Source: ABdhPJxIHo/8ZfiTcPCXvWKecPhwkT0RWKwWEH6WWtlgy7N6DHrmPhmjeln0DZcOjoUqOu0Prg0Zbg==
X-Received: by 2002:a17:906:88b:: with SMTP id n11mr21216859eje.26.1618836988407;
        Mon, 19 Apr 2021 05:56:28 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id t14sm10352602ejj.77.2021.04.19.05.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 05:56:27 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org,
	docs@lists.yoctoproject.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH] dev-manual/common-tasks.rst: correct the documentation for debuginfod
Date: Mon, 19 Apr 2021 14:56:18 +0200
Message-Id: <20210419125618.584909-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Particularly,
- correctly describe the use of DEBUGINFOD_URLS; drop it from bitbake variables
- all necessary component tweaks are enabled by default via DISTRO_FEATURES
- provide on-target examples of what to look for when things work properly

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 documentation/dev-manual/common-tasks.rst | 43 +++++++++++++----------
 documentation/ref-manual/variables.rst    |  6 ----
 2 files changed, 24 insertions(+), 25 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 176025f9e8..dd8ce98276 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -9997,42 +9997,47 @@ methods you can use: running a debuginfod server and using gdbserver.
 Using the debuginfod server method
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-"debuginfod" from "elfutils" is a way to distribute "debuginfo" files.
-Running a "debuginfod" server makes debug symbols readily available,
+``debuginfod`` from ``elfutils`` is a way to distribute ``debuginfo`` files.
+Running a ``debuginfod`` server makes debug symbols readily available,
 which means you don't need to download debugging information
 and the binaries of the process being debugged. You can just fetch
 debug symbols from the server.
 
-To run a debuginfod server, you need to do the following:
+To run a ``debuginfod`` server, you need to do the following:
 
--  Ensure that this variable is set in your ``local.conf`` file:
-   ::
+-  Ensure that ``debuginfod`` is present in :term:`DISTRO_FEATURES`
+   (it already is in ``OpenEmbedded-core`` defaults and ``poky`` reference distribution).
+   If not, set::
 
-      PACKAGECONFIG_pn-elfutils-native = "debuginfod libdebuginfod"
+      DISTRO_FEATURES_append = " debuginfod"
 
-   This :term:`PACKAGECONFIG` option enables debuginfod and libdebuginfod for
-   "elfutils-native".
+   This distro feature enables the server and client library in ``elfutils``,
+   and enables ``debuginfod`` support in clients (at the moment, ``gdb`` and ``binutils``).
 
--  Run the following commands to set up the "debuginfod" server:
-   ::
+-  Run the following commands to launch the ``debuginfod`` server on the host::
 
       $ oe-debuginfod
 
+-  To use ``debuginfod`` on the target, you need to know the ip:port where
+   ``debuginfod`` is listening on the host (port defaults to 8002), and export
+   that into the shell environment, for example in ``qemu``::
 
-To use debuginfod on the target, you need the following:
+      root@qemux86-64:~# export DEBUGINFOD_URLS="http://192.168.7.1:8002/"
 
--  Ensure that this variable is set in your ``local.conf`` file:
-   ::
+-  Then debug info fetching should simply work when running the target ``gdb``,
+   ``readelf`` or ``objdump``, for example::
 
-      DEBUGINFOD_URLS = "http://localhost:8002/"
+      root@qemux86-64:~# gdb /bin/cat
+      ...
+      Reading symbols from /bin/cat...
+      Downloading separate debug info for /bin/cat...
+      Reading symbols from /home/root/.cache/debuginfod_client/923dc4780cfbc545850c616bffa884b6b5eaf322/debuginfo...
 
-   This :term:`DEBUGINFOD_URLS` option does the client configuration.
-
-   ::
+-  It's also possible to use ``debuginfod-find`` to just query the server::
 
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

