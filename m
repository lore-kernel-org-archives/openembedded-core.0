Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web12.13920.1602250546702905400
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Oct 2020 06:35:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=VJSgGfY2;
 spf=pass (domain: blade-group.com, ip: 209.85.128.54, mailfrom: yann.dirson@blade-group.com)
Received: by mail-wm1-f54.google.com with SMTP id e23so2842330wme.2
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Oct 2020 06:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xG8z5/qVks/nPRXDy8ANPnvWGMs3wvaSyG/awBdYavk=;
        b=VJSgGfY2cZqiikDZtZ/I41ldZBlOyRMF1q/TpCEqNbOoiTFImer6/zUYqP7VLDaD+f
         TZ6z1ns/tFQZeWA4FIr6lAxbPN9EvZ+PHp+hA++oLxUB9YO1yEe6h5dTou6OZtEIt2mX
         xMqYx5bO10FDj4YaZhApqThHwfXNas81I9AMEbxFRXK/Y4UMrg8TO3Y01KO++lnIqbVj
         8d6CnrImqJk2WhawfLO2PeIdVUEtD227mlmpdf1Xnj0IyIaLTNBNvn8M70BqF3Pl58aZ
         S+x4ZemxDIv5Tb5+8fdPq7JW8WBSbNviBDV3XRmd1kxyL98nEDwpCWfFYQbtR7XoMcBj
         p1Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xG8z5/qVks/nPRXDy8ANPnvWGMs3wvaSyG/awBdYavk=;
        b=dL4x9jR1No+VHehilqilSvRE7bZeXAJg2kCyY1U8um4L1pphz5nXoCZSR5Ehmc6cz/
         ZFEk3bZtfz/KPMtfwCQSncyhdXucoOrH1E8w9UzmtQ1NlWQex6ZOqAItGB1ZbYw5maMU
         wUSEI7sv6JzHDvTeA2h/q3vxY8h7XpQtjoMdieYYFBOgy2lET2JK+sEpZE9kFD2RTZrp
         dEgoSSIzFmhCA/SRc899G2sy13AZXISUZ2lnymXIAYj8cTEK8/opoIcCTSZKP+rjsBaz
         URDNcAkaDRfL1zd3rMuv4nMg2prQ32IWAdqtvkt5nO05MMwSwT5/hhZcF5NkoJj4CbzA
         PmoA==
X-Gm-Message-State: AOAM532w/g7iM7Zquo/8Lwt4LA/hwe3BIcyXZSeJxf2gw0iaxzNl/SBd
	1KqAiajOHF16ILeolbrYOVUlCy34zlN3qNK5
X-Google-Smtp-Source: ABdhPJyrsuzktKFBa2QB0qk8LD64GSIvcpTIVU2WkV2i96nPzX5mVKNOhb10MXX67RfCNE050LnKQw==
X-Received: by 2002:a05:600c:22d2:: with SMTP id 18mr9109171wmg.66.1602250544606;
        Fri, 09 Oct 2020 06:35:44 -0700 (PDT)
Return-Path: <yann.dirson@blade-group.com>
Received: from blanquette.lan ([88.120.44.86])
        by smtp.gmail.com with ESMTPSA id s185sm11500172wmf.3.2020.10.09.06.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 06:35:43 -0700 (PDT)
From: "Yann Dirson" <yann.dirson@blade-group.com>
X-Google-Original-From: yann@blade-group.com
To: openembedded-core@lists.openembedded.org
Cc: Yann Dirson <yann@blade-group.com>
Subject: [PATCH v2] rngd: fix --debug to also filter syslog() calls
Date: Fri,  9 Oct 2020 15:35:27 +0200
Message-Id: <20201009133527.2009825-1-yann@blade-group.com>
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
index 0000000000..85d2add6c3
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
+Upstream-Status: Submitted [https://github.com/nhorman/rng-tools/pull/100]
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

