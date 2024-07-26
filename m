Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1BCDC3DA49
	for <webhook@archiver.kernel.org>; Fri, 26 Jul 2024 11:47:18 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.59629.1721994437448493710
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jul 2024 04:47:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Csj6dVH4;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42797bcfc77so14875885e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jul 2024 04:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721994435; x=1722599235; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gRoukWZkTX3TiO9ds6oFnvls6GITroCkGNOa56zS5Bg=;
        b=Csj6dVH4B8S5+SsHePHZRZsfkEfJugE8jWYaXPZsJAqGaPeJi+XRP6XcFS6hg+Xph4
         FRK5PgE+6KYfxmiJ0fkmehN3YrQAIlCf4K6US4LeS4eHLxmXJWv1yR7slAKS1fcQt/zl
         dhl5aKxJVFS0Er+3QP9F595ecnqJ6USoZ+n/c3mAbrmYblXhloUMh2n2wq9pgn28EqeN
         XASlJ7ffA2CWfAtwb43aUWxZoedGHkhN5VYUSfKi7PDw0tHWmNe8aZ4GnQVH/wFcEDV1
         AFqtxawX7JfkpC1dwzctZSVz+98DiaT4Iz+elmW8o4kDi+wRhEFrKkCEhnyRMG/v/40E
         gpZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721994435; x=1722599235;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gRoukWZkTX3TiO9ds6oFnvls6GITroCkGNOa56zS5Bg=;
        b=FlsbUU5hq5olJWtyUq6R85dIQKRtJ4EbtnvjsXq9G4WyTJkq+f0p94W1keOi3vgv8T
         uObmIOzO2kIw2Jo8UNoEeXsaFCXQyADWUO4eEjG/PP9PrtgNYkw9rG/HHtEa71x4t7b9
         klnP50BkAzCwac6xDp5J7Pzr1oC2DWI4Q+C7O4FXhRJhY6428bKNZpBRvV+Wvb86ki2D
         LhgDy4hwOttmuvnbHy3giiCD1HZ0RnCoA4wLYU8wjsRl2i3ZmCD0lJxfem38jdecqmsi
         kDl36ssuUkEO173PWSG+QpRG9JX5ZG+b4++9FWR7N/Ndx1sMz1JigIOvHjqQHftfwkLm
         jDkw==
X-Gm-Message-State: AOJu0YzyWeMGRNGik9t1sf/DrRv+FYQQ80jX4N1V1vnjfmk9UybSOY1R
	h27l3uiYD3ybZTLmy+i19KQ5M+t7NmJLRmupP7b6o4JdKGMgYdiC4nWZog==
X-Google-Smtp-Source: AGHT+IEISLj0vX8MQqgze+VhQGn8z6fJhwGSzPCeQSZHyaKefcYf73oJefDRoHnjW5hdGYk5lKsvTQ==
X-Received: by 2002:a05:6000:1544:b0:368:557a:c64d with SMTP id ffacd0b85a97d-36b319d238dmr5568439f8f.9.1721994434764;
        Fri, 26 Jul 2024 04:47:14 -0700 (PDT)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b367c0673sm4944993f8f.5.2024.07.26.04.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 04:47:14 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Steve Sakoman <steve@sakoman.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v2] rpcbind: Fix boot time start failure
Date: Fri, 26 Jul 2024 13:47:12 +0200
Message-ID: <20240726114712.700085-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jul 2024 11:47:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202528

With commits 90bc1810 ("bitbake.conf: Add runtimedir") and
561e853e ("rpcbind: Specify state directory under /run") rpcbind
still can fail during startup.

It has two problems:
* The lockfile is still hardcoded as "/var/run/rpcbind.lock".
  It needs to use the same internal define for RPCBIND_STATEDIR
  as the paths for rpcbind.xdr and portmap.xdr.
* Using --with-statedir=/run/rpcbind doesn't guarantee that this
  directory exists when rpcbind.service starts. Add this guarantee
  by running rpcbind.service with After=systemd-tmpfiles-setup.service
  and add the tmpfiles.d entry for /run/rpcbind.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
v2: Superficially fix the Upstream-Status: lines in the patches

 ...ke-the-lockfile-follow-with-statedir.patch | 31 ++++++++++++++++++
 ...ice-after-etc-tmpfiles.d-is-processe.patch | 32 +++++++++++++++++++
 .../rpcbind/rpcbind/rpcbind.tmpfiles          |  1 +
 .../recipes-extended/rpcbind/rpcbind_1.2.6.bb |  6 ++++
 4 files changed, 70 insertions(+)
 create mode 100644 meta/recipes-extended/rpcbind/rpcbind/0001-Make-the-lockfile-follow-with-statedir.patch
 create mode 100644 meta/recipes-extended/rpcbind/rpcbind/0002-Run-rpcbind.service-after-etc-tmpfiles.d-is-processe.patch
 create mode 100644 meta/recipes-extended/rpcbind/rpcbind/rpcbind.tmpfiles

diff --git a/meta/recipes-extended/rpcbind/rpcbind/0001-Make-the-lockfile-follow-with-statedir.patch b/meta/recipes-extended/rpcbind/rpcbind/0001-Make-the-lockfile-follow-with-statedir.patch
new file mode 100644
index 0000000000..d487312d22
--- /dev/null
+++ b/meta/recipes-extended/rpcbind/rpcbind/0001-Make-the-lockfile-follow-with-statedir.patch
@@ -0,0 +1,31 @@
+From f10db88174e73c78c028561715f16ed38148ebde Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?=
+ <zboszor@gmail.com>
+Date: Fri, 26 Jul 2024 12:36:06 +0200
+Subject: [PATCH 1/2] Make the lockfile follow --with-statedir=
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Inappropriate [OE specific]
+Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
+---
+ src/rpcbind.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/rpcbind.c b/src/rpcbind.c
+index 36a95b9..948a284 100644
+--- a/src/rpcbind.c
++++ b/src/rpcbind.c
+@@ -105,7 +105,7 @@ char *nss_modules = "files";
+ /* who to suid to if -s is given */
+ #define RUN_AS  "daemon"
+ 
+-#define RPCBINDDLOCK "/var/run/rpcbind.lock"
++#define RPCBINDDLOCK RPCBIND_STATEDIR "/rpcbind.lock"
+ 
+ int runasdaemon = 0;
+ int insecure = 0;
+-- 
+2.45.2
+
diff --git a/meta/recipes-extended/rpcbind/rpcbind/0002-Run-rpcbind.service-after-etc-tmpfiles.d-is-processe.patch b/meta/recipes-extended/rpcbind/rpcbind/0002-Run-rpcbind.service-after-etc-tmpfiles.d-is-processe.patch
new file mode 100644
index 0000000000..f454fdbb3b
--- /dev/null
+++ b/meta/recipes-extended/rpcbind/rpcbind/0002-Run-rpcbind.service-after-etc-tmpfiles.d-is-processe.patch
@@ -0,0 +1,32 @@
+From 408b18c77c254baaa9111b3e7031ebf12149db38 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?=
+ <zboszor@gmail.com>
+Date: Fri, 26 Jul 2024 12:54:38 +0200
+Subject: [PATCH 2/2] Run rpcbind.service after /etc/tmpfiles.d is processed
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Inappropriate [OE specific]
+Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
+---
+ systemd/rpcbind.service.in | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/systemd/rpcbind.service.in b/systemd/rpcbind.service.in
+index f45ee1e..e9d94ce 100644
+--- a/systemd/rpcbind.service.in
++++ b/systemd/rpcbind.service.in
+@@ -9,6 +9,9 @@ RequiresMountsFor=@statedir@
+ Requires=rpcbind.socket
+ Wants=rpcbind.target
+ 
++# Make sure the runtime directory exists
++After=systemd-tmpfiles-setup.service
++
+ [Service]
+ Type=notify
+ EnvironmentFile=-@_sysconfdir@/rpcbind.conf
+-- 
+2.45.2
+
diff --git a/meta/recipes-extended/rpcbind/rpcbind/rpcbind.tmpfiles b/meta/recipes-extended/rpcbind/rpcbind/rpcbind.tmpfiles
new file mode 100644
index 0000000000..fecee72c09
--- /dev/null
+++ b/meta/recipes-extended/rpcbind/rpcbind/rpcbind.tmpfiles
@@ -0,0 +1 @@
+d /run/rpcbind 0755 root root -
diff --git a/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb b/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb
index e751eb631c..477092b37d 100644
--- a/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb
+++ b/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb
@@ -13,8 +13,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b46486e4c4a416602693a711bb5bfa39 \
 SRC_URI = "${SOURCEFORGE_MIRROR}/rpcbind/rpcbind-${PV}.tar.bz2 \
            file://init.d \
            file://rpcbind.conf \
+           file://rpcbind.tmpfiles \
            file://rpcbind_add_option_to_fix_port_number.patch \
            file://0001-systemd-use-EnvironmentFile.patch \
+           file://0001-Make-the-lockfile-follow-with-statedir.patch \
+           file://0002-Run-rpcbind.service-after-etc-tmpfiles.d-is-processe.patch \
           "
 SRC_URI[sha256sum] = "5613746489cae5ae23a443bb85c05a11741a5f12c8f55d2bb5e83b9defeee8de"
 
@@ -49,6 +52,9 @@ do_install:append () {
 		${UNPACKDIR}/init.d > ${D}${sysconfdir}/init.d/rpcbind
 	chmod 0755 ${D}${sysconfdir}/init.d/rpcbind
 	install -m 0644 ${UNPACKDIR}/rpcbind.conf ${D}${sysconfdir}/rpcbind.conf
+
+	install -d ${D}${sysconfdir}/tmpfiles.d
+	install -m 0644 ${UNPACKDIR}/rpcbind.tmpfiles ${D}${sysconfdir}/tmpfiles.d/rpcbind.conf
 }
 
 ALTERNATIVE:${PN} = "rpcinfo"
-- 
2.45.2


