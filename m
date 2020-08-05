Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
 by mx.groups.io with SMTP id smtpd.web10.2220.1596649819076825933
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2020 10:50:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=G3ZfAsdw;
 spf=pass (domain: gmail.com, ip: 209.85.210.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f196.google.com with SMTP id 74so14888811pfx.13
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2020 10:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SVns+PeaQNVDmHB1Cxlf8374C6CnVJUyLtTg7H6omJw=;
        b=G3ZfAsdwPutbd8vZODlyHC2YUuDeI78AyKwBkUp86eLOHirU4Pd/WXbIg7GoQ4e0Gu
         kT2ZvkMQRdQHuiMhhYPfT/oa7iq0h0wrSeiwaRQxZiwL8dX9mV89rBGA3QkYGA+SGPxi
         Yz3wILZo8dpDa2tiQlqz8QPi6Gnm1XeegOrFNGqK4Ld4OMzNEfRsuMUXqeTw6MLgadHI
         zBRGxK2QMd7xsD9Dm0QPthcGFKFmAWft4rxMzmTNS4fLCnNQ++VU3ENuB9Dte0m6ZUiU
         KqfbaMlCw3sygRIQ63wQqPgFB6ePMLG1wtynskSF+UbEmhPfElNKDbpdohuoUCsiUdSB
         qF6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SVns+PeaQNVDmHB1Cxlf8374C6CnVJUyLtTg7H6omJw=;
        b=X/HVsAf+0fT8+JNJ6cZePJ7t3ol5ri1KCwYK5HROEE/mYg6ZjZ+g+e/9fPZJxJs8gh
         PY6SaMHt49DNumt+k0KuJvMNKQBWYFo0ISJ+MWygWuZ8CzOD0xBQ2CW9OAkC2Bysh/wx
         wx6LlopQCp8xBfAg91Uv6KUzbdBg5MsvrPFcoYvCPqvJRfQTV0i0uJjn8Ab1mxlc3/hY
         7KNOmPq6vnbfcvKIn+I8eJYuwdn8WK2YlOWmCnlcNGmiOZo2yvnbQvUT6GBh2GZ5iEpD
         JK0FrvNplJ601x7KjW3nELBai263h6Ak+edLd53EvuP9LybEMV+dq6v38u2ABydA65ZQ
         AfSQ==
X-Gm-Message-State: AOAM531nosXZYPKi7smfInydbl9+u1ezMg1arIO5FhEWrYJKsfOzYpng
	M/5i6bPZGoim2QsnTDNgoyM8U+uXGeI=
X-Google-Smtp-Source: ABdhPJw353m9RqOkeAkkiPSVgjqpu5s5G1tXgf7cOWE9bo0cm7P2SU7B0wqejoEZJ7MAdS4C+WcgKw==
X-Received: by 2002:a63:29c8:: with SMTP id p191mr4184174pgp.333.1596649817608;
        Wed, 05 Aug 2020 10:50:17 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id v77sm4711115pfc.137.2020.08.05.10.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2020 10:50:16 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 4/4] distcc: Fix build with -fno-common
Date: Wed,  5 Aug 2020 10:50:11 -0700
Message-Id: <20200805175011.126156-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200805175011.126156-1-raj.khem@gmail.com>
References: <20200805175011.126156-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/distcc/distcc_3.3.3.bb  |  1 +
 ...cc-10-which-defaults-to-fno-common-c.patch | 34 +++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-devtools/distcc/files/0001-Fix-build-with-gcc-10-which-defaults-to-fno-common-c.patch

diff --git a/meta/recipes-devtools/distcc/distcc_3.3.3.bb b/meta/recipes-devtools/distcc/distcc_3.3.3.bb
index c52f136be8..d92b9c3046 100644
--- a/meta/recipes-devtools/distcc/distcc_3.3.3.bb
+++ b/meta/recipes-devtools/distcc/distcc_3.3.3.bb
@@ -17,6 +17,7 @@ RRECOMMENDS_${PN}-server = "avahi-daemon"
 SRC_URI = "git://github.com/distcc/distcc.git \
            file://fix-gnome.patch \
            file://separatebuilddir.patch \
+           file://0001-Fix-build-with-gcc-10-which-defaults-to-fno-common-c.patch \
            file://default \
            file://distcc \
            file://distcc.service"
diff --git a/meta/recipes-devtools/distcc/files/0001-Fix-build-with-gcc-10-which-defaults-to-fno-common-c.patch b/meta/recipes-devtools/distcc/files/0001-Fix-build-with-gcc-10-which-defaults-to-fno-common-c.patch
new file mode 100644
index 0000000000..86c07c11f8
--- /dev/null
+++ b/meta/recipes-devtools/distcc/files/0001-Fix-build-with-gcc-10-which-defaults-to-fno-common-c.patch
@@ -0,0 +1,34 @@
+From 98530865795300008fe06bb647a6fc2dddfc7967 Mon Sep 17 00:00:00 2001
+From: Romain Geissler <romain.geissler@amadeus.com>
+Date: Mon, 27 Jan 2020 09:28:43 +0000
+Subject: [PATCH] Fix build with gcc 10 which defaults to -fno-common (cf
+ https://gcc.gnu.org/gcc-10/porting_to.html)
+
+This fixes the following link error I see when I use the latest gcc 10
+git branch:
+/opt/1A/toolchain/x86_64-v20.0.7/lib/gcc/x86_64-1a-linux-gnu/10.0.1/../../../../x86_64-1a-linux-gnu/bin/ld: src/serve.o:(.bss+0x0): multiple definition of `stats_text'; src/prefork.o:(.bss+0x0): first defined here
+/opt/1A/toolchain/x86_64-v20.0.7/lib/gcc/x86_64-1a-linux-gnu/10.0.1/../../../../x86_64-1a-linux-gnu/bin/ld: src/stats.o:(.data+0x20): multiple definition of `stats_text'; src/prefork.o:(.bss+0x0): first defined here
+collect2: error: ld returned 1 exit status
+
+Upstream-Status: Backport [https://github.com/distcc/distcc/pull/373]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/stats.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/stats.h b/src/stats.h
+index 9bde285..74d4690 100644
+--- a/src/stats.h
++++ b/src/stats.h
+@@ -33,7 +33,7 @@ enum stats_e { STATS_TCP_ACCEPT, STATS_REJ_BAD_REQ, STATS_REJ_OVERLOAD,
+                 STATS_COMPILE_OK, STATS_COMPILE_ERROR, STATS_COMPILE_TIMEOUT,
+                 STATS_CLI_DISCONN, STATS_OTHER, STATS_ENUM_MAX };
+ 
+-const char *stats_text[20];
++extern const char *stats_text[20];
+ 
+ int  dcc_stats_init(void);
+ void dcc_stats_init_kid(void);
+-- 
+2.28.0
+
-- 
2.28.0

