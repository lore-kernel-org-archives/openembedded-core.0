Received: from mail-io1-f68.google.com (mail-io1-f68.google.com [209.85.166.68])
 by mx.groups.io with SMTP id smtpd.web12.1118.1595353944390878108
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2020 10:52:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=P+DsiUuj;
 spf=pass (domain: gmail.com, ip: 209.85.166.68, mailfrom: jpewhacker@gmail.com)
Received: by mail-io1-f68.google.com with SMTP id i4so22294591iov.11
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2020 10:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0aRY5+cLw8pA3tML4ILa522MjRhTA+LuYdXLj0LfBGY=;
        b=P+DsiUuj3EoiIsNUiQsTEJrwtNCwHoWJohm130v6GHelmHtzvXQAyNYoD4gbi4EPYt
         2UQiun8LmpcqkxVmdL8ofvO3whJS+kPZKKCHZ0L1RXspcZ2BOguLJ84Jd6gBXRaytrvd
         tckQUq8Huud/5pLyF77xeQMbj1RHWfIsUAm/aV+EyGcGKmSeJkQIPPLMVIZlkuTFCdhI
         O8mjjM5/883F1hmzJBvMTZIeISjeQELNC7I9/12DcRU7Mohd/E8T/I2eWfKW9p3teSDj
         9Eob8lzmGSUU64ry4SMjlzqhSOF9sBBrCnx08DZg+zIaazGIN1Ez7ZmbAxIsQE6l2oCq
         5G6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0aRY5+cLw8pA3tML4ILa522MjRhTA+LuYdXLj0LfBGY=;
        b=aKenLtQoBOmtQeO9OE7yp9KlgE1LfTSbOPeRTSZcikH+lm9f19gX/Ca2mCLI92WdXJ
         xhq8Y9+5cJQY/uyu3TFPm5JdBGEQQbp6ds9+1MgCTEVgo0DiG1zjVhsbtRy4QyiTmuGG
         OBQHZ/90KcijN152xCmd7QC6vMoby9h6u3budQyfWPctbDx4z8OlvrmjgF+F/dN69H31
         w9YPZyFKphIrU/51vGtUJr6Cq3+AVI9uGixt2/xM3fUW9P5p36poHv0FeegKFKbhcrS1
         RnbZ8qxE0BknTDXqpWc3gCYY9ySVyJBJgspiirkXQod/Z9Fyc5/ddPaDsNxfVFC4gT4T
         DceA==
X-Gm-Message-State: AOAM530hfBQ3kr8QO3pG4fuj7F3A//WH9rfiNZNye3191vGJ/jaFI2Gd
	CnLeT3FfDY8lsMKaO/HDG36VNOwHU1U=
X-Google-Smtp-Source: ABdhPJwXBZGHWiq2eEX+rXRPg7DWFsy6dmsfdzECX7G4LGphAgbgC3tnyO0KMcy8TqjVVhCoMmPkuw==
X-Received: by 2002:a6b:5c07:: with SMTP id z7mr29778879ioh.140.1595353943605;
        Tue, 21 Jul 2020 10:52:23 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:c183:1b34:3163:7b15])
        by smtp.gmail.com with ESMTPSA id i10sm264508ild.29.2020.07.21.10.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 10:52:23 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] classes/package: Use HOST_OS for runtime dependencies
Date: Tue, 21 Jul 2020 12:52:19 -0500
Message-Id: <20200721175219.11267-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The code was using TARGET_OS to try and detect what type of OS the
packages would be running on, but this is incorrect. TARGET_OS is the OS
for which the package will generate output (e.g. GCC output target or
GDB debugging target). The OS where the package will run is the HOST_OS.
Note that HOST_OS only differs from TARGET_OS when doing a
canadian cross compile, and even then in our case only when doing so for
a non-Linux host (e.g. MinGW).

Fix the code to use HOST_OS instead.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/package.bbclass | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 0af5f66733..f8dc1bb468 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1039,7 +1039,7 @@ python split_and_strip_files () {
 
     dvar = d.getVar('PKGD')
     pn = d.getVar('PN')
-    targetos = d.getVar('TARGET_OS')
+    hostos = d.getVar('HOST_OS')
 
     oldcwd = os.getcwd()
     os.chdir(dvar)
@@ -1194,7 +1194,7 @@ python split_and_strip_files () {
     if (d.getVar('INHIBIT_PACKAGE_DEBUG_SPLIT') != '1'):
         results = oe.utils.multiprocess_launch(splitdebuginfo, list(elffiles), d, extraargs=(dvar, debugdir, debuglibdir, debugappend, debugsrcdir, d))
 
-        if debugsrcdir and not targetos.startswith("mingw"):
+        if debugsrcdir and not hostos.startswith("mingw"):
             if (d.getVar('PACKAGE_DEBUG_STATIC_SPLIT') == '1'):
                 results = oe.utils.multiprocess_launch(splitstaticdebuginfo, staticlibs, d, extraargs=(dvar, debugstaticdir, debugstaticlibdir, debugstaticappend, debugsrcdir, d))
             else:
@@ -1761,7 +1761,7 @@ python package_do_shlibs() {
     else:
         shlib_pkgs = packages.split()
 
-    targetos = d.getVar('TARGET_OS')
+    hostos = d.getVar('HOST_OS')
 
     workdir = d.getVar('WORKDIR')
 
@@ -1912,9 +1912,9 @@ python package_do_shlibs() {
                 soname = None
                 if cpath.islink(file):
                     continue
-                if targetos == "darwin" or targetos == "darwin8":
+                if hostos == "darwin" or hostos == "darwin8":
                     darwin_so(file, needed, sonames, renames, pkgver)
-                elif targetos.startswith("mingw"):
+                elif hostos.startswith("mingw"):
                     mingw_dll(file, needed, sonames, renames, pkgver)
                 elif os.access(file, os.X_OK) or lib_re.match(file):
                     linuxlist.append(file)
-- 
2.27.0

