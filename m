Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E847FFF8855
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 16:59:13 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1058.1778000344161622445
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2026 09:59:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=FYus7/Lx;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso44824565e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 09:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778000342; x=1778605142; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L52WJ5fGiuO+miUg2QqozZ2oBUlIXB/4QOBR8StjFzE=;
        b=FYus7/LxqC+nns8HC22LimN13ockXwgzImYARE4SV/zPrLZ3JwtkHBrRD4zzC9o+L3
         e2cxiUHFleCxuPlHpgM7aBjC0Hvntlx7VngXKsQhx0vsPYdS+/EDunO+AmbZyXl8jwRL
         w7QLil5wa94OHFMb3Ay54V0oSXw2NOSbo6ICg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778000342; x=1778605142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L52WJ5fGiuO+miUg2QqozZ2oBUlIXB/4QOBR8StjFzE=;
        b=S+F05yHJLfMQ9UY3JvTSS3zQcI/MDHeObQezMCho2ShtcC1hb284YWZ/L2utEfV1UI
         RfeSSuSI2zxSprS5a87itnCDCK8VCSJ8Edlyp+tC6GfapPTllnJLRiEx5JezXsEXF0zO
         GMJTUnFv92vmvi9BoTjxMPnJ6ioYs+Bx9AU7cHgWtZv+YBbQgGiVtvrw54eavt2yJvWb
         iID9p08InPceHb9v7OCs5CJPxe4pg3tuX+eEmAGYPGxN75i2uwbAQEn33O/QO7NYf97Z
         QUMacG9buPVsi/W4mu6xUHtK7BBMbI6zncvc/KeFNveXJJLVoXGBvnn4bkozOckLShAL
         fvDg==
X-Gm-Message-State: AOJu0YzO2I+8IJJVSfJhc+rCGXyVPrHm3uisBV1od6OXQAULtWhDB4LH
	DF0NtL2p56FNBr8SuvPBwx3HKki7+FVLvmVaETuIzFnrTsuqv3NXsKArrsSxmIiNUtRJaIpG2lD
	RcoY3//U=
X-Gm-Gg: AeBDievjZjQBOTVVF7q/ZPYM3qibTzr6mbrGRB8Ml4rDjmgCn+hJ0ZflLYyrUy6j4OQ
	colkalBA6gOMmKUNzXCgEsYs2xA+mKmf24WXbybUcRYB0kQtuc6K7Y1pDYZEfwE2szQ8Bg0hMtd
	InmBRVDqd0VAbyWjMcnK7bHegTgOcAC+BMEQzBykna5e0U3FgsAqI7/1vc6ThSchIeEFtBsnJRu
	lr3TpiT1Wpxe5V5m8BrtOXXWbIO7O9pC9sgkxT6f0wK+8pjl+bDi6stRy44QxxrNgSnnSlkXIpD
	OzD/wKQE+AOw8LAd76jKbeO0C5Ew7PRBUqW37wzhKREAlLFBDDBUAiOG0B1jnEA7afkQaLW07lz
	QetlOguy6b5mzVEr6KdpEdcC+3BA7ob1wHD4OoDNKUMPJTV/q5bTUwhkIHnG5bX6Eeus/x+4GtQ
	StQMQ5I0z8y7zVAdfx87sRV52AxyVowO8etIOFEnQEdtMd17p7M3tggslMlQOYoz3fLgkvDb8zP
	tKqUOq7JvRJzIqtC1HJbGRgPw==
X-Received: by 2002:a05:600c:4255:b0:489:1ff1:74df with SMTP id 5b1f17b1804b1-48e51e0c818mr843525e9.1.1778000342169;
        Tue, 05 May 2026 09:59:02 -0700 (PDT)
Received: from localhost ([2a01:e0a:8cc:5b00:b8fa:c45c:f26d:53a3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e51f6805fsm60025e9.2.2026.05.05.09.59.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:59:01 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 17/23] gdk-pixbuf: Fix CVE-2026-5201
Date: Tue,  5 May 2026 18:57:34 +0200
Message-ID: <fb718f1ed26ec9a88c82e5310fc0e3dccaeaacec.1777995876.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1777995876.git.fabien.thomas@smile.fr>
References: <cover.1777995876.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 16:59:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236508

From: Vijay Anusuri <vanusuri@mvista.com>

Pick patch according to [1]

[1] https://security-tracker.debian.org/tracker/CVE-2026-5201
[2] https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/issues/304

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
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

