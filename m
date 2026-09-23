Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4D13C982EA
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 09:12:15 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2839.1790154730663486476
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 02:12:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=FRPy81/8;
 spf=pass (domain: smile.fr, ip: 74.125.225.76, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f635552aso601958f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 02:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790154729; x=1790759529; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=glZDvkks9W6kXLd5kO+ZVizDm70lE3W86F6L1K7+8vk=;
        b=FRPy81/8qezU9iXk5tAxqL7e627Iit7I98bQ8+vZ+NabD3qAy0GmuPK8eo4/bigEj/
         NGPbFGHV5enjs1/u3jK+8Wrn3icfiWbBJDof5A0Ah5mFJM0X5C9Uauuxet3Pk0Y6fhxC
         OzfGy42z+ZmUggJhq9HjQnL1kD4C8xFzcevWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790154729; x=1790759529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=glZDvkks9W6kXLd5kO+ZVizDm70lE3W86F6L1K7+8vk=;
        b=V7WJ+nVE72Grwp2iksrfDoCeGs8CU5vk1+0x5rF1E/deuYMZ9E6Bktw/06cukNggEg
         N4sjCH9P9CjWxIUXRk3phDHUjBGln7+YCP7jK2e+mZI258GS5HfbTb6Gu9faULwZ09j6
         1nUY0sL6nbIbOi5Dow9F5iQI9spC2akG6kzG8OnJA8Ema1guvY18VK+Z10kPfbWZMx77
         wUj7CSXzlTjQKr7YPMGHJhpR2wu1VuUErK6PuFYiI8oJasltx9fvnACwNgBSMKgZ0jW6
         SGW1/qr5Caumf2rEoS5NakUuuYbP2+T+3+31UoZXP4kcOfudIxX4GOuk2zu4F9w/zjz1
         n4jg==
X-Gm-Message-State: AFuF++mMMpjxJDvCNYOTI/5hPyQpbHiPH3LhygZynXhmzRBsh5o+c9Uv
	Atj9EiUtyXEOya43D+YbOF0ssW/Seauy6uLRT94B3l4VKxnAcqzFGVmwLB6ZKt/MB4o9YJKidIJ
	YO/25HE4=
X-Gm-Gg: AYBFou3FJFPWL3+ClNKiRSScAtPAhoZ7TbV8rABolZ+lKuUJi3FhK1Gk5T26/b27LLK
	bOqsqSpYlity+XbGROK8/BdAl6WQKogZK0Tlu7Qpb+8W7dVryhSPffUrOZTJ1MbsmZkwrBQEk8v
	uvkyHYZ3OAGMCdsxVFbrhvGph4Lk7OCXDH+YXn9PXri88p3BcHmdIbgXi0VjsRocmkMJ69aX1No
	XXNvV4xbcygZOllEGNwV73CWXF1hoPBC2c7X28cTzvBuxCSTb3ef1i1uywfy0t0oqDouM4Nq64c
	mJ9LYstBJCOGlxCR9q+maVmDeu6VchBGQlHH9LptiL5PuSFXYMcnr6xtAT5iCPKuNm+wm5miao1
	sh42jeNz51jG3rbu49/6KO7/9HQR/XQCtloc8yUd+rjvYWBOKVJtbfPKdBHKu2LpA5NFC7cMSux
	1ddbEahYi0jzwzGekX5/EV0rFDBsCps3xcjNb72kXwMF1AxKdY68wy8icjEEvS/rnyWf5stXkKN
	/RgTEiBO/9uCbf7g5znzTKjWtYbb6O5n++p3r9PRwR8zX1oD8yEhHqgqx8/iOgTaXhlkaaz
X-Received: by 2002:a05:600c:3e0b:b0:49d:827:e5b6 with SMTP id 5b1f17b1804b1-49fdf134f93mr25844725e9.20.1790154728799;
        Wed, 23 Sep 2026 02:12:08 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a02-8440-b519-f416-8bed-8817-19fd-ccf7.rev.sfr.net. [2a02:8440:b519:f416:8bed:8817:19fd:ccf7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe2730da9sm14251525e9.4.2026.09.23.02.12.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:12:08 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 40/48] libslirp: patch CVE-2026-9539
Date: Wed, 23 Sep 2026 11:10:42 +0200
Message-ID: <2ab23c37a6799af522f8be006615bc7def95c37a.1790154074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790154074.git.yoann.congal@smile.fr>
References: <cover.1790154074.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 09:12:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246502

From: Peter Marko <peter.marko@siemens.com>

Pick patch from NVD report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../slirp/libslirp/CVE-2026-9539.patch        | 122 ++++++++++++++++++
 .../slirp/libslirp_git.bb                     |   5 +-
 2 files changed, 126 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/slirp/libslirp/CVE-2026-9539.patch

diff --git a/meta/recipes-connectivity/slirp/libslirp/CVE-2026-9539.patch b/meta/recipes-connectivity/slirp/libslirp/CVE-2026-9539.patch
new file mode 100644
index 00000000000..192d2b4b26f
--- /dev/null
+++ b/meta/recipes-connectivity/slirp/libslirp/CVE-2026-9539.patch
@@ -0,0 +1,122 @@
+From 927bca7344e31fd58e2f7afaca784aad4400eb84 Mon Sep 17 00:00:00 2001
+From: Samuel Thibault <samuel.thibault@ens-lyon.org>
+Date: Sat, 23 May 2026 22:06:59 +0200
+Subject: [PATCH] oob: cap urgent data count to what is actually available
+
+so_urgc is provided by the guest sender, so can arbitrary and beyond
+what we actually have. Worse, this can lead to an sb_cc integer
+underflow leading to leaking gigabytes of data.
+
+Fixes #93
+
+Signed-off-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
+
+CVE: CVE-2026-9539
+Upstream-Status: Backport [https://gitlab.freedesktop.org/slirp/libslirp/-/commit/927bca7344e31fd58e2f7afaca784aad4400eb84]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/socket.c | 40 +++++++++++++++++++++++-----------------
+ 1 file changed, 23 insertions(+), 17 deletions(-)
+
+diff --git a/src/socket.c b/src/socket.c
+index 77c5cf6..c491d0f 100644
+--- a/src/socket.c
++++ b/src/socket.c
+@@ -337,7 +337,8 @@ int sorecvoob(struct socket *so)
+ int sosendoob(struct socket *so)
+ {
+     struct sbuf *sb = &so->so_rcv;
+-    char buff[2048]; /* XXX Shouldn't be sending more oob data than this */
++    uint32_t urgc = so->so_urgc;
++    char buff[2048];
+ 
+     int n;
+ 
+@@ -345,12 +346,15 @@ int sosendoob(struct socket *so)
+     DEBUG_ARG("so = %p", so);
+     DEBUG_ARG("sb->sb_cc = %d", sb->sb_cc);
+ 
+-    if (so->so_urgc > sizeof(buff))
+-        so->so_urgc = sizeof(buff); /* XXXX */
++    if (urgc > sizeof(buff))
++        urgc = sizeof(buff);
++
++    if (urgc > sb->sb_cc)
++        urgc = sb->sb_cc;
+ 
+     if (sb->sb_rptr < sb->sb_wptr) {
+         /* We can send it directly */
+-        n = slirp_send(so, sb->sb_rptr, so->so_urgc,
++        n = slirp_send(so, sb->sb_rptr, urgc,
+                        (MSG_OOB)); /* |MSG_DONTWAIT)); */
+     } else {
+         /*
+@@ -358,7 +362,6 @@ int sosendoob(struct socket *so)
+          * we must copy all data to a linear buffer then
+          * send it all
+          */
+-        uint32_t urgc = so->so_urgc; /* Amount of room left in buff */
+         int len = (sb->sb_data + sb->sb_datalen) - sb->sb_rptr;
+         if (len > urgc) {
+             len = urgc;
+@@ -403,7 +406,7 @@ int sosendoob(struct socket *so)
+  */
+ int sowrite(struct socket *so)
+ {
+-    int n, nn;
++    int n, nn, noob = 0;
+     struct sbuf *sb = &so->so_rcv;
+     int len = sb->sb_cc;
+     struct iovec iov[2];
+@@ -413,16 +416,20 @@ int sowrite(struct socket *so)
+ 
+     if (so->so_urgc) {
+         uint32_t expected = so->so_urgc;
+-        if (sosendoob(so) < expected) {
+-            /* Treat a short write as a fatal error too,
+-             * rather than continuing on and sending the urgent
+-             * data as if it were non-urgent and leaving the
+-             * so_urgc count wrong.
+-             */
++        int noob = sosendoob(so);
++
++        if (noob <= 0)
+             goto err_disconnected;
+-        }
++
++        if (noob < expected)
++            /* Short write: either we have not yet received all
++             * urgent data, or the socket buffers are full. Leave
++             * it for later when we have data or have room.  */
++            return noob;
++
+         if (sb->sb_cc == 0)
+-            return 0;
++            /* Nothing left to write actually */
++            return noob;
+     }
+ 
+     /*
+@@ -453,12 +460,11 @@ int sowrite(struct socket *so)
+         } else
+             n = 1;
+     }
+-    /* Check if there's urgent data to send, and if so, send it */
+ 
+     nn = slirp_send(so, iov[0].iov_base, iov[0].iov_len, 0);
+     /* This should never happen, but people tell me it does *shrug* */
+     if (nn < 0 && (errno == EAGAIN || errno == EINTR))
+-        return 0;
++        return noob;
+ 
+     if (nn <= 0) {
+         goto err_disconnected;
+@@ -485,7 +491,7 @@ int sowrite(struct socket *so)
+     if ((so->so_state & SS_FWDRAIN) && sb->sb_cc == 0)
+         sofcantsendmore(so);
+ 
+-    return nn;
++    return noob + nn;
+ 
+ err_disconnected:
+     DEBUG_MISC(" --- sowrite disconnected, so->so_state = %x, errno = %d",
diff --git a/meta/recipes-connectivity/slirp/libslirp_git.bb b/meta/recipes-connectivity/slirp/libslirp_git.bb
index 334b786b9b7..820cd6e4f0c 100644
--- a/meta/recipes-connectivity/slirp/libslirp_git.bb
+++ b/meta/recipes-connectivity/slirp/libslirp_git.bb
@@ -4,7 +4,10 @@ HOMEPAGE = "https://gitlab.freedesktop.org/slirp/libslirp"
 LICENSE = "BSD-3-Clause & MIT"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=bca0186b14e6b05e338e729f106db727"
 
-SRC_URI = "git://gitlab.freedesktop.org/slirp/libslirp.git;protocol=https;branch=master"
+SRC_URI = "\
+    git://gitlab.freedesktop.org/slirp/libslirp.git;protocol=https;branch=master \
+    file://CVE-2026-9539.patch \
+"
 SRCREV = "3ad1710a96678fe79066b1469cead4058713a1d9"
 PV = "4.7.0"
 S = "${WORKDIR}/git"

