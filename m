Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.9898.1607002660114947209
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 05:37:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=r1cL+LoG;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id n26so3496235eju.6
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Dec 2020 05:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HZ9KSSwpsZCrTZrL/cHK/FpH29sqykeb/x5cdonp2T8=;
        b=r1cL+LoGFWvcmZyn14QfOjI/FmLQtisu/JVMHzv6mP41/hduT8750Hziqi8q1Ij5HZ
         rlkgZdhuq+U/GoOS8gGA8cgRDIX/G5ULqXkTFTn+Th2B/lMCeSCXZmpwku7MHn0WAJNY
         3HyRX3xBXrWYVQ3OYubQNH+bv9LmCV2R6e5J+EbYAdoh4VffSOlxXQuYs5yxP0pSh87T
         kvkGA8dWBX52MWAjlPVkRoualvE7fvBjTkc7DRiHFMraiapWxj4+JEvqX6WH7X0YXJbn
         be1A4i5TOijkz88UxzZ29JCuMwTCBkTpEunNKsVlmLCFm54vzFYwSmrq2zhe7WeZq52P
         hbnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HZ9KSSwpsZCrTZrL/cHK/FpH29sqykeb/x5cdonp2T8=;
        b=js0RcceoJqsaimeoCoF1fH8Rm5CxpIa/4005A+dI+MK598lW1FpmzqiHh6+I93cuFF
         OQzukV0qHqLFivwV6EfKcu14D1CiYuYeFRz6GXwEc1BOQWug8nOBoOjBKtt6TzDHTKaw
         WdNk3L6s3BktkGC49zpgWa2kpj5JPSupJlFIm2wZVGkoVikQNYCy4PPrHs33dUHhrWkQ
         j3uG5fR47V644/fHAG6xiAUfTWfK5rJskXG89n54zqkbilzH6YpdsN68ntP1HDk9IH8d
         P0hd14dDVpk7jHQttPadR1tp9r2r/LQwEslRRuOP4rLrOFMiNG4+6tbZ1AmBFaqKYW2K
         Ipzg==
X-Gm-Message-State: AOAM532pAruEs0esjswYbPipUNtu2XJejjoeo2jCvwQ2RFrHx7sBN8HU
	3LLDBEMq0qAoqbKLXNNvAFOm3ggmB5WNzg==
X-Google-Smtp-Source: ABdhPJyPAA+007YIJVowMav50i1AsIwdhnR+ntuqOiu2t5smv27KCawRnBw83pfqMGtgIsi1EOm9yQ==
X-Received: by 2002:a17:907:373:: with SMTP id rs19mr1037033ejb.298.1607002658316;
        Thu, 03 Dec 2020 05:37:38 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id ng1sm77130ejb.112.2020.12.03.05.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 05:37:37 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 04/11] ruby: fix reproducibility
Date: Thu,  3 Dec 2020 14:37:20 +0100
Message-Id: <20201203133727.12936-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201203133727.12936-1-alex.kanavin@gmail.com>
References: <20201203133727.12936-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...e.in-do-not-write-host-cross-cc-item.patch | 32 +++++++++++++++++++
 meta/recipes-devtools/ruby/ruby_2.7.2.bb      |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/ruby/ruby/0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch

diff --git a/meta/recipes-devtools/ruby/ruby/0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch b/meta/recipes-devtools/ruby/ruby/0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch
new file mode 100644
index 0000000000..826daf2cda
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch
@@ -0,0 +1,32 @@
+From 2368d07660a93a2c41d63f3ab6054ca4daeef820 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 17 Nov 2020 18:31:40 +0000
+Subject: [PATCH] template/Makefile.in: do not write host cross-cc items into
+ target config
+
+This helps reproducibility.
+
+Upstream-Status: Inapproppriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ template/Makefile.in | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/template/Makefile.in b/template/Makefile.in
+index 10dc826..940ee07 100644
+--- a/template/Makefile.in
++++ b/template/Makefile.in
+@@ -657,11 +657,11 @@ mjit_config.h:
+ 	echo '#endif'; \
+ 	quote MJIT_MIN_HEADER_NAME "$(MJIT_MIN_HEADER_NAME)"; \
+ 	sep=,; \
+-	quote "MJIT_CC_COMMON  " $(MJIT_CC); \
++	quote "MJIT_CC_COMMON  " ; \
+ 	quote "MJIT_CFLAGS      MJIT_ARCHFLAG" $(MJIT_CFLAGS); \
+ 	quote "MJIT_OPTFLAGS   " $(MJIT_OPTFLAGS); \
+ 	quote "MJIT_DEBUGFLAGS " $(MJIT_DEBUGFLAGS); \
+-	quote "MJIT_LDSHARED   " $(MJIT_LDSHARED); \
++	quote "MJIT_LDSHARED   " ; \
+ 	quote "MJIT_DLDFLAGS    MJIT_ARCHFLAG" $(MJIT_DLDFLAGS); \
+ 	quote "MJIT_LIBS       " $(LIBRUBYARG_SHARED); \
+ 	quote 'PRELOADENV       "@PRELOADENV@"'; \
diff --git a/meta/recipes-devtools/ruby/ruby_2.7.2.bb b/meta/recipes-devtools/ruby/ruby_2.7.2.bb
index 055ea9343f..db6d672985 100644
--- a/meta/recipes-devtools/ruby/ruby_2.7.2.bb
+++ b/meta/recipes-devtools/ruby/ruby_2.7.2.bb
@@ -6,6 +6,7 @@ SRC_URI += " \
            file://remove_has_include_macros.patch \
            file://run-ptest \
            file://0001-Modify-shebang-of-libexec-y2racc-and-libexec-racc2y.patch \
+           file://0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch \
            "
 
 SRC_URI[md5sum] = "2d4a28dcfa38352a627a597f6057c465"
-- 
2.29.2

