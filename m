Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web10.35364.1612792546563000472
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Feb 2021 05:55:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=gs+VoReW;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.172, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f172.google.com with SMTP id r75so2020373oie.11
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Feb 2021 05:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=QZ6lnaibee9lF2RMZUfu4xikr0tTwchAa+bDxnHg16s=;
        b=gs+VoReWeNTRNFxnS8K2letngMx3MWPZn0cAYpYe3fFqbz+UwAJjLBbraDW7Z0j/3+
         Umd5mNEMsQx4AZBGji0GERi5GCyQf33w0ILX91R/zqBkjkY/F4neVuNkqq9XbPUTLisc
         68/yuTltXwLq+j2Xkp1mFJKncQ5AbBl2/XsU35ULHrG0FCSNvqu1I/pxvS4ky5ppl8xU
         o1V5axTXFjLmRb9NRMfoH2OZdS85tVa491jWFzlfqaPMG2lhx4EsKbz0WfV+rJGdZHs0
         uFUCVfAWW6CMMQWpSauF0o8LsHK9nd0BxWjF7CSIh80cxFxSFInJBlN8TI/jqChg+LlI
         Q8HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QZ6lnaibee9lF2RMZUfu4xikr0tTwchAa+bDxnHg16s=;
        b=thpnKmxb2Al5SzcGnrAoUj7ov6OaFL6lOJkzJlosy/BmrGcy6i3uJawopWoQtdaJHn
         lUSkoDv/8/oYIHQbHhwZeQ7XcJ5kg5RWJ/0SJsACXTAzsCcncoTh8NJi16r+2SC4CbYA
         nWM6OajkAFcCs9jtKxU8oYaVLwZS4L6GzIRc8rJtkDXBzrlOssS45INdG9V38rKQrw5I
         dZb/b6BnQBmxDWjtb0b09rJ+E+UvNS224R7kneQ9l4xuurKZDQGxZTNwcuA6OUwPsBfx
         nxl78/Iyye8G1+IomnOkJdfYQcUaHo69ckvpvifxgkuWR981k8INGk8YEXuZ/RYk8QmY
         7JWQ==
X-Gm-Message-State: AOAM530+2dvS23KJ6guT8uRrD6pKPQvyOpG1I5omprIfX4ezXHkSDWIK
	3giDkGXSr5i/xBCdN+VihFoIW1tRwb5kcaHJxO4=
X-Google-Smtp-Source: ABdhPJwzWOhm3s54Dwj4Gp45XQsng2xrOm6tcGjhIJJ6Lx3SpRAaTnxpNKn4WE4oWgn3QjMb8muunQ==
X-Received: by 2002:aca:554d:: with SMTP id j74mr1008138oib.96.1612792545404;
        Mon, 08 Feb 2021 05:55:45 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id g8sm2023833ooe.21.2021.02.08.05.55.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 05:55:44 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 25/28] rng-tools: fix rngd_jitter initialization
Date: Mon,  8 Feb 2021 03:52:17 -1000
Message-Id: <b1cae70da819f2625a4e1885b201c4f465c90a76.1612792088.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1612792088.git.steve@sakoman.com>
References: <cover.1612792088.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Massot <julien.massot@iot.bzh>

rngd daemon may spam the console when using an older version
than 6.11.

Backport patches from https://github.com/nhorman/rng-tools/pull/99/commits

Signed-off-by: Julien Massot <julien.massot@iot.bzh>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...-O_NONBLOCK-setting-for-entropy-pipe.patch | 26 +++++++++++++
 ...ialize-AES-key-before-setting-the-en.patch | 38 +++++++++++++++++++
 ...ys-read-from-entropy-pipe-before-set.patch | 38 +++++++++++++++++++
 .../rng-tools/rng-tools_6.9.bb                |  3 ++
 4 files changed, 105 insertions(+)
 create mode 100644 meta/recipes-support/rng-tools/rng-tools/0001-rngd_jitter-fix-O_NONBLOCK-setting-for-entropy-pipe.patch
 create mode 100644 meta/recipes-support/rng-tools/rng-tools/0002-rngd_jitter-initialize-AES-key-before-setting-the-en.patch
 create mode 100644 meta/recipes-support/rng-tools/rng-tools/0003-rngd_jitter-always-read-from-entropy-pipe-before-set.patch

diff --git a/meta/recipes-support/rng-tools/rng-tools/0001-rngd_jitter-fix-O_NONBLOCK-setting-for-entropy-pipe.patch b/meta/recipes-support/rng-tools/rng-tools/0001-rngd_jitter-fix-O_NONBLOCK-setting-for-entropy-pipe.patch
new file mode 100644
index 0000000000..3b44095cf5
--- /dev/null
+++ b/meta/recipes-support/rng-tools/rng-tools/0001-rngd_jitter-fix-O_NONBLOCK-setting-for-entropy-pipe.patch
@@ -0,0 +1,26 @@
+From 6ce86cb5cf06541cd5aad70fe8494b07b22c247e Mon Sep 17 00:00:00 2001
+From: Matthias Schiffer <matthias.schiffer@tq-group.com>
+Date: Wed, 27 Jan 2021 16:10:32 +0100
+Subject: [PATCH] rngd_jitter: fix O_NONBLOCK setting for entropy pipe
+
+A pointer was passed to fcntl instead of the flags variable, setting
+random flags.
+
+Signed-off-by: Matthias Schiffer <matthias.schiffer@tq-group.com>
+---
+ rngd_jitter.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/rngd_jitter.c b/rngd_jitter.c
+index 32bac53..25b3543 100644
+--- a/rngd_jitter.c
++++ b/rngd_jitter.c
+@@ -465,7 +465,7 @@ int init_jitter_entropy_source(struct rng *ent_src)
+ 
+ 	flags = fcntl(pipefds[0], F_GETFL, 0);
+ 	flags |= O_NONBLOCK;
+-	fcntl(pipefds[0], F_SETFL, &flags);
++	fcntl(pipefds[0], F_SETFL, flags);
+ 
+ 	if (ent_src->rng_options[JITTER_OPT_USE_AES].int_val) {
+ #ifdef HAVE_LIBGCRYPT
diff --git a/meta/recipes-support/rng-tools/rng-tools/0002-rngd_jitter-initialize-AES-key-before-setting-the-en.patch b/meta/recipes-support/rng-tools/rng-tools/0002-rngd_jitter-initialize-AES-key-before-setting-the-en.patch
new file mode 100644
index 0000000000..34f8227543
--- /dev/null
+++ b/meta/recipes-support/rng-tools/rng-tools/0002-rngd_jitter-initialize-AES-key-before-setting-the-en.patch
@@ -0,0 +1,38 @@
+From 330c2ba14510c8103b30d5021adb18f1534031a1 Mon Sep 17 00:00:00 2001
+From: Matthias Schiffer <matthias.schiffer@tq-group.com>
+Date: Wed, 27 Jan 2021 16:18:09 +0100
+Subject: [PATCH] rngd_jitter: initialize AES key before setting the entropy
+ pipe to O_NONBLOCK
+
+Signed-off-by: Matthias Schiffer <matthias.schiffer@tq-group.com>
+---
+ rngd_jitter.c | 9 +++++----
+ 1 file changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/rngd_jitter.c b/rngd_jitter.c
+index 25b3543..48f344c 100644
+--- a/rngd_jitter.c
++++ b/rngd_jitter.c
+@@ -463,10 +463,6 @@ int init_jitter_entropy_source(struct rng *ent_src)
+ 		pthread_mutex_unlock(&tdata[i].statemtx);
+ 	}
+ 
+-	flags = fcntl(pipefds[0], F_GETFL, 0);
+-	flags |= O_NONBLOCK;
+-	fcntl(pipefds[0], F_SETFL, flags);
+-
+ 	if (ent_src->rng_options[JITTER_OPT_USE_AES].int_val) {
+ #ifdef HAVE_LIBGCRYPT
+ 		/*
+@@ -487,6 +483,11 @@ int init_jitter_entropy_source(struct rng *ent_src)
+ 			ent_src->rng_options[JITTER_OPT_USE_AES].int_val = 1;
+ 		}
+ 		xread_jitter(aes_buf, tdata[0].buf_sz, ent_src);
++
++		flags = fcntl(pipefds[0], F_GETFL, 0);
++		flags |= O_NONBLOCK;
++		fcntl(pipefds[0], F_SETFL, flags);
++
+ #else
+ 		message_entsrc(ent_src,LOG_CONS|LOG_INFO, "libgcrypt not available. Disabling AES in JITTER source\n");
+ 		ent_src->rng_options[JITTER_OPT_USE_AES].int_val = 0;
diff --git a/meta/recipes-support/rng-tools/rng-tools/0003-rngd_jitter-always-read-from-entropy-pipe-before-set.patch b/meta/recipes-support/rng-tools/rng-tools/0003-rngd_jitter-always-read-from-entropy-pipe-before-set.patch
new file mode 100644
index 0000000000..b3bc8028ea
--- /dev/null
+++ b/meta/recipes-support/rng-tools/rng-tools/0003-rngd_jitter-always-read-from-entropy-pipe-before-set.patch
@@ -0,0 +1,38 @@
+From 36bc92ef2789b13183c8895d83665f48b13c2b9e Mon Sep 17 00:00:00 2001
+From: Matthias Schiffer <matthias.schiffer@tq-group.com>
+Date: Wed, 27 Jan 2021 16:22:39 +0100
+Subject: [PATCH] rngd_jitter: always read from entropy pipe before setting
+ O_NONBLOCK
+
+Even with AES disabled, we want to make sure that jent_read_entropy() has
+already generated some entropy before we consider the the source
+initialized. Otherwise "Entropy Generation is slow" log spam will be
+emitteded until this has happened, which can take several seconds.
+
+Signed-off-by: Matthias Schiffer <matthias.schiffer@tq-group.com>
+---
+ rngd_jitter.c | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/rngd_jitter.c b/rngd_jitter.c
+index 48f344c..b736cdd 100644
+--- a/rngd_jitter.c
++++ b/rngd_jitter.c
+@@ -492,6 +492,17 @@ int init_jitter_entropy_source(struct rng *ent_src)
+ 		message_entsrc(ent_src,LOG_CONS|LOG_INFO, "libgcrypt not available. Disabling AES in JITTER source\n");
+ 		ent_src->rng_options[JITTER_OPT_USE_AES].int_val = 0;
+ #endif
++	} else {
++		/*
++		 * Make sure that an entropy gathering thread has generated
++		 * at least some entropy before setting O_NONBLOCK and finishing
++		 * the entropy source initialization.
++		 *
++		 * This avoids "Entropy Generation is slow" log spamming that
++		 * would otherwise happen until jent_read_entropy() has run
++		 * for the first time.
++		 */
++		xread_jitter(&i, 1, ent_src);
+ 	}
+ 	message_entsrc(ent_src,LOG_DAEMON|LOG_INFO, "Enabling JITTER rng support\n");
+ 	return 0;
diff --git a/meta/recipes-support/rng-tools/rng-tools_6.9.bb b/meta/recipes-support/rng-tools/rng-tools_6.9.bb
index 913342c315..b8c6f022f3 100644
--- a/meta/recipes-support/rng-tools/rng-tools_6.9.bb
+++ b/meta/recipes-support/rng-tools/rng-tools_6.9.bb
@@ -10,6 +10,9 @@ DEPENDS = "sysfsutils"
 
 SRC_URI = "\
     git://github.com/nhorman/rng-tools.git \
+    file://0001-rngd_jitter-fix-O_NONBLOCK-setting-for-entropy-pipe.patch \
+    file://0002-rngd_jitter-initialize-AES-key-before-setting-the-en.patch \
+    file://0003-rngd_jitter-always-read-from-entropy-pipe-before-set.patch \
     file://init \
     file://default \
     file://rngd.service \
-- 
2.25.1

