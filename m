Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web09.5049.1619433743564281390
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Apr 2021 03:42:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IBoiPcvu;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id i24so5534186edy.8
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Apr 2021 03:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QBx+AG8acKA3Xx6mK89K8vM29hgW5LsiBaP6+WIYfpU=;
        b=IBoiPcvu/y0BKE3cPRCiBvl087TB7FZTqJ6dz8NMiqd86P5YU/HQBpm+ffg2RCawZj
         IuV0BSrCV8by15j6qwwyrbsExPbcjPRUK/pMrZFbfZBjOU+Wm7nldFSAnNlfBamOMnF0
         0Juxgd9sQBt7FMS8tswgtTGOEN86zVAkfRnDrjmgwg4LBMZFnwB0uedfhe3JvzoA7LnV
         YTvXif4sdJAcia6sck+R2uA6z+XGO2L3szk3alysiHWGBJOI3PM8XoFccp8v9HPTzERC
         AOXty357ZbPxRkaQcaYrNYEf/+vCOT//PXThwz7apVFKU/4obrvs4Y8rAEN1xe3E+9bO
         C6RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QBx+AG8acKA3Xx6mK89K8vM29hgW5LsiBaP6+WIYfpU=;
        b=aud3i97pTVFmrwkmaK/Oj6AaR/KXWG99T1sM1YpH0L53xrnhIrLvIU8Gx1gusdNiU0
         AAK6fEw3xKhBjfzGiwRkux9RnaoUvGzWvv2KBcCrdF+R2+cfBYVwBCLUAW9j4W1eU6JT
         ongNlCeVCUzdX3kwIQU3uRLj6uUS2CAVYzdrka8qmJv5ySBeirB5linaJsOoD3QdZ1Bx
         mQEqsLOvqLXPkfanRPsYquilr0XBxAaoSg8gyelD0mfoNVwGf8ntoNfPeOCQZkxip3ZO
         ab0pJlM6xEgdIXQmNMeHCTfkcnhbymiM9c4d+1gGS8BBFwI0k8na1NTFRo6nvGHpK3b0
         vgzQ==
X-Gm-Message-State: AOAM530fsAaZhnv5j4UWEuwR5OwVlTBDoUB0ivw2QisIXcCHtFmChgZT
	jMWl05FZJwkc4k4fbkSbkeLPUwQkLZJQVQ==
X-Google-Smtp-Source: ABdhPJzarTB+nKufnAvYcZ7Tv9NGvbSatqTVZ4PCVdDXl4SUGUDvKWVwb3YGg7OZDfx2heExPK8mDg==
X-Received: by 2002:a05:6402:190d:: with SMTP id e13mr20093964edz.151.1619433741816;
        Mon, 26 Apr 2021 03:42:21 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id kx3sm11257824ejc.44.2021.04.26.03.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Apr 2021 03:42:21 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org,
	docs@lists.yoctoproject.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH] dev-manual/common-tasks.rst: correct the documentation for debuginfod
Date: Mon, 26 Apr 2021 12:42:10 +0200
Message-Id: <20210426104210.789444-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Particularly,
- correctly describe the use of DEBUGINFOD_URLS; drop it from bitbake variables
- all necessary component tweaks are enabled by default via DISTRO_FEATURES
- provide on-target examples of what to look for when things work properly

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 documentation/dev-manual/common-tasks.rst | 40 ++++++++++++++---------
 documentation/ref-manual/variables.rst    |  6 ----
 2 files changed, 24 insertions(+), 22 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index dcd3a11c3e..37c7a19bfa 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -9705,39 +9705,47 @@ methods you can use: running a debuginfod server and using gdbserver.
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
 
--  Ensure that this variable is set in your ``local.conf`` file::
+-  Ensure that ``debuginfod`` is present in :term:`DISTRO_FEATURES`
+   (it already is in ``OpenEmbedded-core`` defaults and ``poky`` reference distribution).
+   If not, set in your distro config file or in ``local.conf``::
 
-      PACKAGECONFIG_pn-elfutils-native = "debuginfod libdebuginfod"
+      DISTRO_FEATURES_append = " debuginfod"
 
-   This :term:`PACKAGECONFIG` option enables debuginfod and libdebuginfod for
-   "elfutils-native".
+   This distro feature enables the server and client library in ``elfutils``,
+   and enables ``debuginfod`` support in clients (at the moment, ``gdb`` and ``binutils``).
 
--  Run the following commands to set up the "debuginfod" server::
+-  Run the following commands to launch the ``debuginfod`` server on the host::
 
       $ oe-debuginfod
 
+-  To use ``debuginfod`` on the target, you need to know the ip:port where
+   ``debuginfod`` is listening on the host (port defaults to 8002), and export
+   that into the shell environment, for example in ``qemu``::
 
-To use debuginfod on the target, you need the following:
+      root@qemux86-64:~# export DEBUGINFOD_URLS="http://192.168.7.1:8002/"
 
--  Ensure that this variable is set in your ``local.conf`` file::
+-  Then debug info fetching should simply work when running the target ``gdb``,
+   ``readelf`` or ``objdump``, for example::
 
-      DEBUGINFOD_URLS = "http://localhost:8002/"
+      root@qemux86-64:~# gdb /bin/cat
+      ...
+      Reading symbols from /bin/cat...
+      Downloading separate debug info for /bin/cat...
+      Reading symbols from /home/root/.cache/debuginfod_client/923dc4780cfbc545850c616bffa884b6b5eaf322/debuginfo...
 
-   This :term:`DEBUGINFOD_URLS` option does the client configuration.
+-  It's also possible to use ``debuginfod-find`` to just query the server::
 
-   ::
-
-        PACKAGECONFIG_pn-gdb = "debuginfod"
+      root@qemux86-64:~# debuginfod-find debuginfo /bin/ls
+      /home/root/.cache/debuginfod_client/356edc585f7f82d46f94fcb87a86a3fe2d2e60bd/debuginfo
 
-   This :term:`PACKAGECONFIG` option enables "debuginfod" for "gdb".
 
 Using the gdbserver method
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 3297a69edf..c339d45e18 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1523,12 +1523,6 @@ system and gives an overview of their function and contents.
 
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

