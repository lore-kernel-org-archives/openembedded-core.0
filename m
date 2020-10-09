Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web12.9487.1602233746954945912
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Oct 2020 01:55:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=l0L/UUlH;
 spf=pass (domain: blade-group.com, ip: 209.85.128.42, mailfrom: yann.dirson@blade-group.com)
Received: by mail-wm1-f42.google.com with SMTP id p15so8999594wmi.4
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Oct 2020 01:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tZndmeMHvXgHRIxuswVHsk19WrbLgyapQVi/cG8+xjI=;
        b=l0L/UUlHNw2D3b8EkB3FuTC1y3NO7FK2OUSbJlHDNo69uBe3pT1QVm6E6+Nv5yiCHr
         4xNXMasDapX2axvEjhmYVTYOchEdCoDoXs4mdRh2lz7UvioiujyySxMlIbRurXMBPfev
         T3F4HLoknThV6nO6aL/T50fdQ78L3dGTLKMP7WSs3xA9dsWcSOhsDIf7GZ6AjfDzKIwF
         Jbj4UY0Y6NJ7w8hPMUCjHIyxnis3LOMmfUxlE1RW7/HSBzobR9aeqFqwjklX2pwCmwdi
         qeDBKm2jJqhBqH0I4lzLa1GwGI5d3Cglvw1XFnAmBnQKOp7vzWWuz/2rKw6CmV0tADKa
         SGSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tZndmeMHvXgHRIxuswVHsk19WrbLgyapQVi/cG8+xjI=;
        b=lN0Z7MC+FYaC7rI9atseEiGI+4eMGfMQrpvxovpebVYvemWyC1k0bfzR/BdYfc7YCm
         TEMfJOztgbBEOJs5ahr130JJw13YpHs7UxpOIY/JS/mydWsLPUSsP3hz8crcPcjEf1zx
         lRci88k+TacPrmhfXzg7xkC4azusyreJmKZUNvYp1B/ROswKK5gvC4BRso5tHTkP1Uhp
         q8qYk3/IdiB+r2YoaKtScL6tw5ha3bnhOyCNOicAIp9XkZRo3G/yvFU+IQQq2Ng0wN+0
         Wd+b0eBNfjjPPBNk/SIH/i718S47Mpg0omlz2axkaaQkTlbmxYRZ9cD6wUk5EgaBsytx
         nFAw==
X-Gm-Message-State: AOAM531wi8frcg2uWkxQYmFQP3PbEphtcp0fxNalq54wi3OkwFQFSM46
	9Ow+wSiC1AdVMvHLtP8SSvKaeBtOeTXp0zks
X-Google-Smtp-Source: ABdhPJyg9xxIq4BaVjDuRRMVMUKEfqpioIpVhhT1C0aNA8rycxnJIaTBY6cqm4rOwoQaj8YKdh1m5g==
X-Received: by 2002:a05:600c:2297:: with SMTP id 23mr1736321wmf.104.1602233744907;
        Fri, 09 Oct 2020 01:55:44 -0700 (PDT)
Return-Path: <yann.dirson@blade-group.com>
Received: from blanquette.lan ([88.120.44.86])
        by smtp.gmail.com with ESMTPSA id m3sm12421446wme.3.2020.10.09.01.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 01:55:44 -0700 (PDT)
From: "Yann Dirson" <yann.dirson@blade-group.com>
X-Google-Original-From: yann@blade-group.com
To: openembedded-core@lists.openembedded.org
Cc: Yann Dirson <yann@blade-group.com>
Subject: [PATCH] rngd: fix --debug to also filter syslog() calls
Date: Fri,  9 Oct 2020 10:55:27 +0200
Message-Id: <20201009085527.1993257-1-yann@blade-group.com>
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
 .../rng-tools/rngd-debug-filter.patch         | 22 +++++++++++++++++++
 .../rng-tools/rng-tools_6.10.bb               |  1 +
 2 files changed, 23 insertions(+)
 create mode 100644 meta/recipes-support/rng-tools/rng-tools/rngd-debug-filter.patch

diff --git a/meta/recipes-support/rng-tools/rng-tools/rngd-debug-filter.patch b/meta/recipes-support/rng-tools/rng-tools/rngd-debug-filter.patch
new file mode 100644
index 0000000000..320f0257e6
--- /dev/null
+++ b/meta/recipes-support/rng-tools/rng-tools/rngd-debug-filter.patch
@@ -0,0 +1,22 @@
+Index: git/rngd.h
+===================================================================
+--- git.orig/rngd.h
++++ git/rngd.h
+@@ -145,13 +145,13 @@ extern bool quiet;
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
diff --git a/meta/recipes-support/rng-tools/rng-tools_6.10.bb b/meta/recipes-support/rng-tools/rng-tools_6.10.bb
index 3f9720e406..98fb7aa775 100644
--- a/meta/recipes-support/rng-tools/rng-tools_6.10.bb
+++ b/meta/recipes-support/rng-tools/rng-tools_6.10.bb
@@ -12,6 +12,7 @@ SRC_URI = "\
     git://github.com/nhorman/rng-tools.git \
     file://a4b6d9ce64f132e463b9091d0536913ddaf11516.patch \
     file://dab16a5fd4efde8ef569b358e19b1fcbc7d0d938.patch \
+    file://rngd-debug-filter.patch \
     file://init \
     file://default \
     file://rngd.service \
-- 
2.28.0

