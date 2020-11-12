Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.1057.1605165910270683285
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2020 23:25:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iLbYKkiO;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id f18so3419497pgi.8
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2020 23:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WOj2abajz4Y0l/T53CjoQZbMV7+7tb5L9A8q+6q0Fmo=;
        b=iLbYKkiOomxbk2gXZ0B8UzmFwOS5LkdpYaXN+Dr+4mYlGNsavokKPOkdCtN5P1c7yh
         +g83OOOJICIfmz1PhgRdb5OoM6DZuHH9w7Jrx4QLNTUAGrvJ2buVnBRnx8gO/bvRkKYv
         jbX+8pdSNkXSOTHGjzr6cbun1bQw6yuKRW8vaJGf44pTWaRD4pWqYHfkMTqauuqTaLjj
         82fLpy2kUHoWn0Dlor/8EGG8TQbWzDMJPQQerKps1fNxKMrnMhv1e9td/UV8u4utk9AC
         o7cqkXWAnmpUBGmTKXlSi1An0k7xN26QEfrQ7IVTDizZ0vsf2nC3yucns8IDPTXFmSZF
         Hg4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WOj2abajz4Y0l/T53CjoQZbMV7+7tb5L9A8q+6q0Fmo=;
        b=bZeY00hOYOhrdAnrRY+NJWeZ1tjcON6DeoLN4JdykE7rVZvj7XhbRAB19pJKLOYhEQ
         a3dxBTkm8+Cmg35j9xTFpQK7WahHo0gcr4F8XxdYKexMHDBYzo8xWDH6VRC46hJ6Ytpj
         +6cYfpP+5NgcHrwAg7+J2ue3zQH0jVH3oDRlcYuHGSsbYksTewZuhWgnT5VAjHpgvmWG
         7txcSP4QVUvQ5HRiGwMbIN+wE2esWfcOA+/dyj+0RbQQKihRnmaLLYYMIM4x0y7hlb+M
         QFQaj9cH6YgL/4HJXNxvhUGrfdUu1+uo4SS6e78pAVOjKE6Z8inlNuY00o+l5509l5nf
         +yTw==
X-Gm-Message-State: AOAM533z63PlwnPYYr6juva2++7D9QEb/1ulrWPqRkBklhxYXvfu8Sxa
	ta03f6CoD5HXMvZpBUgfiu+StWOzR43Vag==
X-Google-Smtp-Source: ABdhPJwaH71/Sdmy25QZ1CpxOFSplbBR1Gv+S+RUI8seK+XzG1AGyN8cPwHbOa125WN6NeQEE+h0KQ==
X-Received: by 2002:a17:90a:34c5:: with SMTP id m5mr7972570pjf.184.1605165909248;
        Wed, 11 Nov 2020 23:25:09 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id a25sm5156741pfg.138.2020.11.11.23.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 23:25:08 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] gawk: Avoid using host ar during cross compile
Date: Wed, 11 Nov 2020 23:25:05 -0800
Message-Id: <20201112072505.155698-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Use-cross-AR-during-compile.patch    | 35 +++++++++++++++++++
 meta/recipes-extended/gawk/gawk_5.1.0.bb      |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-extended/gawk/gawk/0001-Use-cross-AR-during-compile.patch

diff --git a/meta/recipes-extended/gawk/gawk/0001-Use-cross-AR-during-compile.patch b/meta/recipes-extended/gawk/gawk/0001-Use-cross-AR-during-compile.patch
new file mode 100644
index 0000000000..ca0d668ce9
--- /dev/null
+++ b/meta/recipes-extended/gawk/gawk/0001-Use-cross-AR-during-compile.patch
@@ -0,0 +1,35 @@
+From 207b94e37c84007b294e57878c913271aad544ef Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 11 Nov 2020 23:13:23 -0800
+Subject: [PATCH] Use cross AR during compile
+
+If AR is specifcied then it should be used instead of defaulting to 'ar'
+from host
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 31364ab..4804f7b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -92,6 +92,13 @@ GAWK_CANONICAL_HOST
+ AC_USE_SYSTEM_EXTENSIONS
+ 
+ dnl checks for programs
++m4_ifndef([AC_PROG_AR],[dnl
++  AN_MAKEVAR([AR], [AC_PROG_AR])
++  AN_PROGRAM([ar], [AC_PROG_AR])
++  AC_DEFUN([AC_PROG_AR],
++  [AC_CHECK_TOOL(AR, ar, :)])
++])
++AC_PROG_AR
+ AC_PROG_EGREP
+ AC_PROG_YACC
+ AC_PROG_LN_S
+-- 
+2.29.2
+
diff --git a/meta/recipes-extended/gawk/gawk_5.1.0.bb b/meta/recipes-extended/gawk/gawk_5.1.0.bb
index 0d005cd43b..8c6411c867 100644
--- a/meta/recipes-extended/gawk/gawk_5.1.0.bb
+++ b/meta/recipes-extended/gawk/gawk_5.1.0.bb
@@ -17,6 +17,7 @@ PACKAGECONFIG[mpfr] = "--with-mpfr,--without-mpfr, mpfr"
 
 SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
            file://run-ptest \
+           file://0001-Use-cross-AR-during-compile.patch \
 "
 
 SRC_URI[md5sum] = "f719bc9966df28e67fc6ebc405e7ea03"
-- 
2.29.2

