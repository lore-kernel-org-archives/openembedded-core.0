Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.17824.1602260458785531074
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Oct 2020 09:20:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=qx4ZC+AG;
 spf=pass (domain: blade-group.com, ip: 209.85.128.41, mailfrom: yann.dirson@blade-group.com)
Received: by mail-wm1-f41.google.com with SMTP id 13so10401011wmf.0
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Oct 2020 09:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MErJWWRwFMWvcLGt4X86sOqLiS5AY6hAWE7rgkzRy3Q=;
        b=qx4ZC+AGum3UcM4bzbkCcaa28/kqJqjqHvp3Nye4TaTJZvKlEKK7UQbpbXW8y26isJ
         0kFeL6ZHdnOzrinV6SB9zFoziPVIKsF1mAkc0KHwZN+iOno6tOqPVj9xA11QIowgPlpG
         vHhkhEMZFzXtQ6pciQ6qoAKA2LJBLKGC+s6/ymwC0hbHNbswSiblOuJ3ofgo8wsVheae
         U7wYI98LN6tUB6EcWUxxEDmudOCXqUGawZZcUuhXOLPAMFKgFwhTroaYxwnvVMCJmHCk
         l1HCeZSOydd4ePe9/qPkSjao//3DrghHh9Sx7wDrcgy2zW6ZueoCr8lEpazQ1uV4tTmY
         vLOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MErJWWRwFMWvcLGt4X86sOqLiS5AY6hAWE7rgkzRy3Q=;
        b=Ih6WoKDGqFtHfgqCsLyNYp9jGsm9vn9cn/AvZrLzr82j//bGZPg+Zz8uhQtxTpcstX
         cDew3NxhP2vGLo3qdaoEq0MwFPQha5w/CO6YSiqH+0BuhxZQRGxpvQBn28YL9hbJNuf8
         YZTALdvxmytIYFTU5YKWKWsbnIRXIGaaLy3V2vIPwxgWQ0RJ62rMr9EUte4i4OSnNQQV
         V4xihAbVu354r1AD2agz+AlzYzaJ6dzdMDU3HmfqbqKFdnTXGdUxPmPbVtKqB9As2mjA
         C70SguwRsWn/g/kClQ4ZnN8D8CImluOGHViXEvFOS1XvSsudeVIxzNHjgKX+d3TmfAKd
         I8xw==
X-Gm-Message-State: AOAM533DVdtQJvYIx6UlAA+JtqKsFDFwj0vvvRCSVYUxVnxNsYEiOhvc
	PjdKZ0KQIooK3Irzcq3h6NKoGZr0x5IMLhB1
X-Google-Smtp-Source: ABdhPJx5aRFnmW9YXGcE+clNEvFKQpEScDhYLOffKCFLOVDOYEu/sviOonukqHmjmL6rTnbk9ml6jg==
X-Received: by 2002:a7b:c3c5:: with SMTP id t5mr15450114wmj.79.1602260456702;
        Fri, 09 Oct 2020 09:20:56 -0700 (PDT)
Return-Path: <yann.dirson@blade-group.com>
Received: from blanquette.lan ([88.120.44.86])
        by smtp.gmail.com with ESMTPSA id u15sm11815875wml.21.2020.10.09.09.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 09:20:55 -0700 (PDT)
From: "Yann Dirson" <yann.dirson@blade-group.com>
X-Google-Original-From: yann@blade-group.com
To: openembedded-core@lists.openembedded.org
Cc: Yann Dirson <yann@blade-group.com>
Subject: [PATCH v3] rngd: fix --debug to also filter syslog() calls
Date: Fri,  9 Oct 2020 18:20:30 +0200
Message-Id: <20201009162030.2017658-1-yann@blade-group.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yann Dirson <yann@blade-group.com>

Debug logs were only controlled by --debug flag while in --foreground mode.
In --daemon mode (the default for us) /var/log/message got stuffed with
details of entropy pool refilling, which is useless in production, and
hamful when log rotation then gets rid of the more useful logs.

This change makes the two modes consistently only produce debug logs when
--debug is specified.

Signed-off-by: Yann Dirson <yann@blade-group.com>
---
 ...ix-debug-to-also-filter-syslog-calls.patch | 46 +++++++++++++++++++
 .../rng-tools/rng-tools_6.10.bb               |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-support/rng-tools/rng-tools/0001-rngd-fix-debug-to-also-filter-syslog-calls.patch

diff --git a/meta/recipes-support/rng-tools/rng-tools/0001-rngd-fix-debug-to-also-filter-syslog-calls.patch b/meta/recipes-support/rng-tools/rng-tools/0001-rngd-fix-debug-to-also-filter-syslog-calls.patch
new file mode 100644
index 0000000000..0733378668
--- /dev/null
+++ b/meta/recipes-support/rng-tools/rng-tools/0001-rngd-fix-debug-to-also-filter-syslog-calls.patch
@@ -0,0 +1,46 @@
+From 213a869e8315ead2c739acfcbde712358a842dee Mon Sep 17 00:00:00 2001
+From: Yann Dirson <yann@blade-group.com>
+Date: Fri, 9 Oct 2020 15:12:26 +0200
+Subject: [PATCH] rngd: fix --debug to also filter syslog() calls
+
+Debug logs were only controlled by --debug flag while in --foreground
+mode.  In --daemon mode /var/log/message got stuffed with details of
+entropy pool refilling, which is useless in production, and hamful
+when log rotation then gets rid of the more useful logs.  This is
+especially true for embedded systems.
+
+This change makes the two modes consistently only produce debug logs when
+--debug is specified.
+
+Upstream-Status: Backport [213a869e8315ead2c739acfcbde712358a842dee]
+
+Signed-off-by: Yann Dirson <yann@blade-group.com>
+---
+ rngd.h | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/rngd.h b/rngd.h
+index 901b6f1..a79ea0f 100644
+--- a/rngd.h
++++ b/rngd.h
+@@ -166,13 +166,13 @@ extern bool quiet;
+ #define message(priority,fmt,args...) do { \
+ 	if (quiet) \
+ 		break;\
++	if (arguments->debug == false && LOG_PRI(priority) == LOG_DEBUG) \
++		break;\
+ 	if (am_daemon) { \
+ 		syslog((priority), fmt, ##args); \
+ 	} else if (!msg_squash) { \
+-		if ((LOG_PRI(priority) != LOG_DEBUG) || (arguments->debug == true)) {\
+-			fprintf(stderr, fmt, ##args); \
+-			fflush(stderr); \
+-		} \
++		fprintf(stderr, fmt, ##args); \
++		fflush(stderr); \
+ 	} \
+ } while (0)
+ 
+-- 
+2.28.0
+
diff --git a/meta/recipes-support/rng-tools/rng-tools_6.10.bb b/meta/recipes-support/rng-tools/rng-tools_6.10.bb
index 3f9720e406..40ec5ad671 100644
--- a/meta/recipes-support/rng-tools/rng-tools_6.10.bb
+++ b/meta/recipes-support/rng-tools/rng-tools_6.10.bb
@@ -12,6 +12,7 @@ SRC_URI = "\
     git://github.com/nhorman/rng-tools.git \
     file://a4b6d9ce64f132e463b9091d0536913ddaf11516.patch \
     file://dab16a5fd4efde8ef569b358e19b1fcbc7d0d938.patch \
+    file://0001-rngd-fix-debug-to-also-filter-syslog-calls.patch \
     file://init \
     file://default \
     file://rngd.service \
-- 
2.28.0

