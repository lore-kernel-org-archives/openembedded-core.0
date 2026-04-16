Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFD98F8DFE9
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 22:33:26 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28259.1776378796323532585
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 15:33:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ozpBiyJK;
 spf=pass (domain: smile.fr, ip: 209.85.128.65, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-488af9fdaa7so312765e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 15:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776378794; x=1776983594; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aTSTwpC5bDG19T7VWxJSvKNmzJSczFr0PvMMp4dsYB4=;
        b=ozpBiyJKRKuBn45ziDUwbjnzxq5EyH7mN5dk2WJZenA+96oza4I9Omuem5uojgOQrE
         9r7Pjldiwhn3hoDiNaF1vcTO96ZVa87+eTHNeH98XS5c67Ahea3x3cuxxEBAu8KT8xfn
         Q6f5iiyC1AiM40p1f/X5gIpTxpsrYcKK6m9Vw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776378794; x=1776983594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aTSTwpC5bDG19T7VWxJSvKNmzJSczFr0PvMMp4dsYB4=;
        b=PySWz//pFhuTlPuJ800UzrvgwACpm2Qo5ouBRzRM5et0bpIaJT1j3Uhrfg3LeWT/k0
         vbHnEx+HYyfLU65BhroDwxe6g+ULbk4eGnlzkBTTM20fiDzOFoPhcak2R7Go83cReIrf
         PbACgZ9ozRsWvbCQDrIC6MlzrwrRlXK1mVHR+DZU9qDofj/EkK4xneJZVyMtZdM4ZxUN
         yf80wUd9Ga1qXSlCLnC68ae7doks3cTYVdiAqU3D1tZopRmCiLyU4SkGbOHbPXpLA7XA
         iVHyl1uOXkdWa6DzVaL3WjLGDJZJrKAGbQFPcpxQ4UjLnmGVgVGQPv8xNDLgpRFslFO+
         AcqA==
X-Gm-Message-State: AOJu0YzBzq1BYuHgAYfhWZH6Ara81Mj617cHL9Z6kZQ9/axShEvGuFfy
	zJh3pAJTpXRF0Rhsu829wHk44+45FPfEzCASjjRNUurIq117Wxv+LOfo5GHeL57BQs/mLZP4SSo
	8NAj/SiH0SFAu
X-Gm-Gg: AeBDietLMoSng0yusNG+cApA5QoUmAgSY6aT6X5NXhD+4BRCOUnTQh53EM6c8xfmiQd
	l53rYomw0q2b63ZDPuCyFbJ4hm8Mc7wysEZJunbes7adU2I2hseJHAwJHFQ62rcE8Kbty35uUcN
	kjs7oDUVF1+gCeJDSh4ilBm19UVz7UopTstyFB/P+yrsZHWjvItJVut99i4A9Yk2hKAUhA1bmYv
	saSkjrKYORIw/bB5y4p3mCEUhcNYK8j7xd4a+zWpIVpdDMPkjkOcdZ39XG0uWnzq1YZec44u6uu
	iwQMZ9gTsyPqH4CybUW2/Pn/dL54bdZKuLqxhbJL/WoAu40gLaswx9zVj5msNWPGidN1qoZvuwH
	sdtI8SKB7oTxR7oj002o8vhZqAqg5ArWJmEogo21rB8EXTxje8it1Lglbf1yFhFDpt6gzSyLepB
	GkhSAeci0bZS4QJzwKU/4F0yAaOo8vGpn7i2oBY5MmG6SAFeTELpB1dD7Hr0G3Shi4hFvts/KEk
	P3ZvsPFIXPImcjjSMtN8HGQAO+nzj5CnSFd4GUGjWU7IYvu
X-Received: by 2002:a05:600c:a309:b0:488:a882:b7 with SMTP id 5b1f17b1804b1-488fb788b82mr3004035e9.29.1776378794176;
        Thu, 16 Apr 2026 15:33:14 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57da2aesm141885005e9.0.2026.04.16.15.33.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 15:33:13 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 23/51] util-linux: backport fix to build with glibc-2.43 on host
Date: Fri, 17 Apr 2026 00:30:06 +0200
Message-ID: <5fda90b79d6b0e4fd948927cb66d3bfad0e34b09.1776377993.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776377993.git.yoann.congal@smile.fr>
References: <cover.1776377993.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 22:33:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235452

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/util-linux/util-linux.inc   |  1 +
 ...x-bsearch-macro-usage-with-glibc-C23.patch | 40 +++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/0001-lsfd-fix-bsearch-macro-usage-with-glibc-C23.patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 3135bbb7c64..3bcf681f243 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -21,6 +21,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch \
            file://0001-tests-helpers-test_sigstate.c-explicitly-reset-SIGIN.patch \
            file://0001-include-mount-api-utils-avoid-using-sys-mount.h.patch \
+           file://0001-lsfd-fix-bsearch-macro-usage-with-glibc-C23.patch \
            file://CVE-2025-14104-01.patch \
            file://CVE-2025-14104-02.patch \
            "
diff --git a/meta/recipes-core/util-linux/util-linux/0001-lsfd-fix-bsearch-macro-usage-with-glibc-C23.patch b/meta/recipes-core/util-linux/util-linux/0001-lsfd-fix-bsearch-macro-usage-with-glibc-C23.patch
new file mode 100644
index 00000000000..6194594f7fc
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/0001-lsfd-fix-bsearch-macro-usage-with-glibc-C23.patch
@@ -0,0 +1,40 @@
+From 710a6989e0fc6dfc9290e2639022d1dbf429557f Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Cristian=20Rodr=C3=ADguez?= <cristian@rodriguez.im>
+Date: Sat, 22 Nov 2025 10:41:08 -0300
+Subject: [PATCH] lsfd: fix bsearch macro usage with glibc C23
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+C23 requires bsearch to be a const preserving macro, build now fails
+with
+
+../lsfd-cmd/lsfd.c:1879:75: error: macro ‘bsearch’ passed 6 arguments, but takes just 5
+ 1879 |                                     nfds, sizeof(struct pollfd), pollfdcmp))
+      |                                                                           ^
+In file included from ../include/c.h:17,
+                 from ../lsfd-cmd/lsfd.c:48:
+/usr/include/stdlib.h:987:10: note: macro ‘bsearch’ defined here
+  987 | # define bsearch(KEY, BASE, NMEMB, SIZE, COMPAR)                        \
+
+  add parenthesis around expression to fix it.
+
+Upstream-Status: Backport [2.42 https://github.com/util-linux/util-linux/commit/711bda1441561bfd2eb6d45fe0bc789535c1f1a8]
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ lsfd-cmd/lsfd.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lsfd-cmd/lsfd.c b/lsfd-cmd/lsfd.c
+index 75cd1de..9aae240 100644
+--- a/lsfd-cmd/lsfd.c
++++ b/lsfd-cmd/lsfd.c
+@@ -1836,7 +1836,7 @@ static void mark_poll_fds_as_multiplexed(char *buf,
+ 		struct file *file = list_entry(f, struct file, files);
+ 		if (is_opened_file(file) && !file->multiplexed) {
+ 			int fd = file->association;
+-			if (bsearch(&(struct pollfd){.fd = fd,}, local.iov_base,
++			if (bsearch((&(struct pollfd){.fd = fd,}), local.iov_base,
+ 				    nfds, sizeof(struct pollfd), pollfdcmp))
+ 				file->multiplexed = 1;
+ 		}

