Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.479.1619199638342537843
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Apr 2021 10:40:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=j3aYrvUC;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id h8so18189012edb.2
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Apr 2021 10:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LZa9LtnmM8c0BZR/iX3wPeO+TrBb1b/5MvktRnNW/5Q=;
        b=j3aYrvUCx/KmI+MJn1NacuNWExZIQQJalTQWMxNtZ42GyCFLn4e8DZTib5Fj8ZCofk
         o55eTsY1UWvFjdHEHLR/IXdy3aV8SJbR/r8D35jnTzLaZWsqMhvho5v27Cwgj+9oSJB4
         /BHKnB7l8j/LSkfh51pDP3SKMfSJD2r/1nqa7xWfEKDiAENnagBLSrocBgxyJ6vGCtfl
         6p4yp4vdWB9tEI65g5vqn906LG1rh0tQufqLohgXJSc2slX9HZecGUDWxw/DJV0u5Dsd
         7WCbAc7MOPlDj2DyM/BcnJPZXMG4ety9ZDNMtubdVB0d3z3QOyoEvKZhFZrj60gWG4n2
         2tJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LZa9LtnmM8c0BZR/iX3wPeO+TrBb1b/5MvktRnNW/5Q=;
        b=C31US8sfrbAFQTloAoqnc9eVeR7nvPXGURXgHCLJ9aSE+y8mR1yzk8DJqn+f/L4HSd
         qmrq3rHwmlLDwrIQqAWyE3nUCI6ynI8+BkmwIkijel0fm+Va1YvWJIHUe3nwTqogDijF
         GMUKi+JlepW1kL8ul3308d+Ck7UEgdq3QprmGDdGw1gCzKzg3dXbjdhJKCqDsbP7r1cm
         pUXfGvjJgg8kXQXBZ9On9YkEQYFhcybMFbJvd8pjfCN0IhpkPwClLclDPsSaQsbzmKZS
         ULTywiC0D0NMmSyjaf4BpDjC0s22ffQSBV7eRzn7Lkk21A70Ll0x+jcDx36ooQ3b6JTN
         +ZWA==
X-Gm-Message-State: AOAM532j8DuXhcGzC2yyHNhUJBt/KUCxS6YysMJryjkEcwBOX9vbSkn5
	proTdq7GiGrTJ6FYw4XWjnY=
X-Google-Smtp-Source: ABdhPJzpPCybb82u6h55/Nlafu6E/oVELZ2yn5OOXyxKgmwzNFw5845TXRO1zYYB0cCkzgm03wjE6Q==
X-Received: by 2002:a05:6402:b66:: with SMTP id cb6mr5915182edb.248.1619199636753;
        Fri, 23 Apr 2021 10:40:36 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id k12sm5251153edo.50.2021.04.23.10.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 10:40:36 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: docs@lists.yoctoproject.org,
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH] dev-manual/common-tasks.rst: correct the documentation for debuginfod
Date: Fri, 23 Apr 2021 19:40:24 +0200
Message-Id: <20210423174024.705459-1-alex.kanavin@gmail.com>
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
index dcd3a11c3e..e3b9dcef18 100644
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
+   If not, set::
 
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

