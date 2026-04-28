Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 119F7FF885A
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 07:02:58 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7103.1777359774613752151
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Apr 2026 00:02:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=U/htL1rW;
 spf=pass (domain: mvista.com, ip: 209.85.210.171, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8318293f02bso2054517b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 00:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1777359773; x=1777964573; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UOjKmBcpDsuK5OQVweOJ+Vo7XfL1NsmIyqKYaI6r1JY=;
        b=U/htL1rWquaYQmpZh9GvRPm7aA7vXQwaT0AyLhZ4d3++vgoxcObX2t8LjMWtahKgU/
         xlWJxq7Y5wcFscs4jqwWNJDQSKMsbh02HV/5xnuHZbR6TM3A0+2SAr8qlzRCxTTRag2B
         NkiIze4Fiyuy0ob0twXQOfIoQxEZneUBIR1sA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777359773; x=1777964573;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UOjKmBcpDsuK5OQVweOJ+Vo7XfL1NsmIyqKYaI6r1JY=;
        b=JGOb9qREJ9K2f7vkc2riv62YO5oIF/7j/G8uuSDrmbiW8gYuSbgrgIGaOyfcxGddGh
         Qnp6lnw3/J9NBMWHI2cheevq3IEDjq6sIo3hHu0+tu/+f1smMW4Ql7lnJVxE125XGaRL
         xJ7FgI1rbw47tOaKQZ8zbBYbsneUM3sT8SU0/7/oTQMst3VEsiQp9Eja+ZcBr054bDa9
         ltjulil6CSamwcUgJREGU5AMeqUAkxCAog0poGWaXWNG5io9q7jNrJIPmojaaEhR4Cxv
         ki4IK+YBNVAdJjFhtBY2vfbWRDBos+dJXBwjip6UGKt3qwwDHnA1cR41L0k17ExJDXUC
         gt8A==
X-Gm-Message-State: AOJu0YwFQfX5dEn9BnZGBOp0ZwVmaJy1PbrIlF2T+AWZXR1iLavPVmiu
	uWe8YPUYvW48K8Jw0mVwP1cIExwSiJ6q1VQcYWGmB1wm+jf4U4DIbJFYZwwZdfyzHjl7eSi8qLZ
	J8Niz
X-Gm-Gg: AeBDiessUqE+HG0jK0bfQ6ZaG7/dO6Y4nyPcy5d2nQHn9NHz6QhRe4xEjV5n5/R4eGX
	wmRf+SJWlsxwG0Q6I+P22Me1s6C+1/xNq4r2PCT95urwz/jpnxjnJwFb14f3gWRPy52chRRntkm
	sPeC3V9MUkkbrW12DdQwf08RyzJHp5/CoBXV14ia8LhFjVkffQYzaJ+ZEN7p0Yal2wR8yZU+5St
	3cX4ER5V0fqryb8fjJTbTMAgWhej3Xmk1qshObJhBMbgfMqddvZYwee69wg3oPFV3Xgm5eTDN2a
	bBB2x3N2vIGxLaGZBHt+9moZuMoMwHrIwsyDNITdLGwwSYvL7DO+6siMDArbFzzzjLliN2b9YpN
	OEaWCqo8L6PQ44OxP0fSaXIL1Ey8EfDw1sb95UHT+cwjThkabFllQjuTqiSMPw19Wt+DaL8QyGT
	RGO1rdROdX4je6G8mW2fn/XWZMIIrS9dwJlehcRVTNSDTZXe5hGQ==
X-Received: by 2002:a05:6a00:b483:b0:82f:7888:e2fa with SMTP id d2e1a72fcca58-834dd3e98dcmr1621793b3a.17.1777359773369;
        Tue, 28 Apr 2026 00:02:53 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2401:4900:1f28:603c:6fd6:b51b:642a:9f84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834daf31e33sm1601393b3a.36.2026.04.28.00.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 00:02:52 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][patch] gdk-pixbuf: Fix CVE-2026-5201
Date: Tue, 28 Apr 2026 12:32:39 +0530
Message-ID: <20260428070240.2691024-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 07:02:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236041

Pick patch according to [1]

[1] https://security-tracker.debian.org/tracker/CVE-2026-5201
[2] https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/issues/304

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../gdk-pixbuf/gdk-pixbuf/CVE-2026-5201.patch | 44 +++++++++++++++++++
 .../gdk-pixbuf/gdk-pixbuf_2.42.12.bb          |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2026-5201.patch

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2026-5201.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2026-5201.patch
new file mode 100644
index 0000000000..97e0dddb62
--- /dev/null
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2026-5201.patch
@@ -0,0 +1,44 @@
+From 6cce9311e70b969cbcc6e3e1e74ae1756ed02d5b Mon Sep 17 00:00:00 2001
+From: Matthias Clasen <mclasen@redhat.com>
+Date: Mon, 30 Mar 2026 12:21:56 -0400
+Subject: [PATCH] jpeg: Reject unsupported number of components
+
+This condition was already checked for incremental loading.
+This commit adds the same check in the nonincremental
+code path.
+
+Closes: #304
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/commit/6cce9311e70b969cbcc6e3e1e74ae1756ed02d5b]
+CVE: CVE-2026-5201
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ gdk-pixbuf/io-jpeg.c | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/gdk-pixbuf/io-jpeg.c b/gdk-pixbuf/io-jpeg.c
+index 9ee1d21..d419812 100644
+--- a/gdk-pixbuf/io-jpeg.c
++++ b/gdk-pixbuf/io-jpeg.c
+@@ -625,6 +625,18 @@ gdk_pixbuf__real_jpeg_image_load (FILE *f, struct jpeg_decompress_struct *cinfo,
+ 	cinfo->do_fancy_upsampling = FALSE;
+ 	cinfo->do_block_smoothing = FALSE;
+ 
++	/* Reject unsupported component counts */
++	if (cinfo->output_components != 3 && cinfo->output_components != 4 &&
++	    !(cinfo->output_components == 1 &&
++	      cinfo->out_color_space == JCS_GRAYSCALE)) {
++		g_set_error (error,
++			     GDK_PIXBUF_ERROR,
++			     GDK_PIXBUF_ERROR_CORRUPT_IMAGE,
++			     _("Unsupported number of color components (%d)"),
++			     cinfo->output_components);
++		goto out;
++	}
++
+ 	pixbuf = gdk_pixbuf_new (GDK_COLORSPACE_RGB, 
+ 				 cinfo->out_color_components == 4 ? TRUE : FALSE, 
+ 				 8,
+-- 
+2.43.0
+
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
index 7c58fe1e1d..2f0de425b5 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
@@ -22,6 +22,7 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch \
            file://CVE-2025-7345.patch \
            file://CVE-2025-6199.patch \
+           file://CVE-2026-5201.patch \
            "
 
 SRC_URI[sha256sum] = "b9505b3445b9a7e48ced34760c3bcb73e966df3ac94c95a148cb669ab748e3c7"
-- 
2.43.0


