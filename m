Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56A5DC47BEF
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 11:41:18 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.88119.1767699668457172371
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jan 2026 03:41:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MY5dmflQ;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-64b9230f564so1236596a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 03:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767699667; x=1768304467; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m2sIoTUO+A/k25DPdEQ3R0iFcOFGd2B9J/+ufrsZI0I=;
        b=MY5dmflQutcAzHhDkhrMctb+F8PQuu8a02DCiuNsku57TG2KwrwPJFRUeKU5LDObFM
         fhLjErJJVNNSyhrGV8NvXs1jCO0PSRFuAwo9KmGqmkQEuDimUnRmxpOGzVq90a7z6VEe
         3q4/A0YGUPAuAWDMRgDM/KEubEDFczxvy9PzXe8PbJMIlNdXw45YMIWs7sGfTV3za6N6
         Fw42So5EBl5iXOKsAi5yd6ih5jZP+43JQBpTNI8csE4xnxcx6rh7+3anM/Yy32uHeE+4
         gmwoQ98TaLijyzQasbFaRBkWQCzjpH9KEdaUOkD2oWy5lnWDtsA/GVscbYImllyfggcF
         dhSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767699667; x=1768304467;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m2sIoTUO+A/k25DPdEQ3R0iFcOFGd2B9J/+ufrsZI0I=;
        b=Hcguepu8T2ccd/drqG9TzzpjyONdk31J124HUxI5v2g5Wt5hDB2fkv2siCLw2S8E4l
         QNh8hJKJfkYP0o48yYwxzCyI/6dX3CHbSTkN4OpZ2KocH7YT8uTuvh5jop1vSkHTQ6ZQ
         jb8ulNfJebTHYX9EocTsSJ7+7f2i/bDIa706aYvVR0pDIn8+RInhpshOXnK1+e3u2SSx
         E/szPB+Nuhe0JRxDlQmBaLhXZ0EjIGFeHkxru1o3EgJyIQN27pggg2JrOpxcjexRvbBh
         ExS80RoSpPgq46wSo8NUPAK6X6ydfLA9+GEaCFe2c7nP56iRgY5ThykrUO5gB5EbcYbE
         usZw==
X-Gm-Message-State: AOJu0Yy/gNI7g2SscpOzrvunOjgHOB3j9f+EUvY4NRz/q50qxhA0+YCX
	JlJ/jEHYZ3GhlK1Dw92WcXFYUERml94FWXY13kh71zvhXtWM5IyawhDv/QK9iQ==
X-Gm-Gg: AY/fxX4sNB2QCt2i11WQeuJcX4Cy7AMz00nM/p9aUfjwOjUIvfvAGAgj3uaIPyrVxET
	CruRkg2NxrcThOis4Cf1eukaIHm68bRqj+7ZzClGpAAs/47cHzYFc1UMAf5Pt96ZcMW1jEqoaCD
	k9uDM4JNKQEXKZ++0ujfUGj+O7LgNPeRmay4V66XPx86EfoPddpvvHXSCyU5gEhFjSVah9B69GP
	2WkO7d9uT3C9cnnvM05+QmZFonnmfvLyAgvuNRVF26XYUEIfuJKhoRnl2S2+KyYNKZ+53nfhmZ2
	+QrrHrH2FZLvXFow3W+UGh/2EwdV7cxTtYilATAeyobNHZAGu5PIDZlmgGnDNFqjlNACMEqBj3v
	hVf+Mp2L5qrSAAASGcJoYikRBlHMRR4CkCGkZuNfuW9WHO+bsbO8NhVeoUZxFS1DsDv1N21RhzU
	9zR9TUa+xjKCewrWvrRHcM2+MFjj3YFqo/ZRxRU32BJKqHDIk=
X-Google-Smtp-Source: AGHT+IFIp1Hel+Q4NZiUqDfCclTlenPdWqUx+YO7ePMBECwD5hLV9BsYs16g/ahqHCIcMX0fnarBtg==
X-Received: by 2002:a17:907:3e12:b0:b80:a31:eb08 with SMTP id a640c23a62f3a-b8426e1c30emr299632366b.55.1767699666484;
        Tue, 06 Jan 2026 03:41:06 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a51183asm210163266b.49.2026.01.06.03.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 03:41:06 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2] igt-gpu-tools: upgrade 2.1 -> 2.3
Date: Tue,  6 Jan 2026 12:40:57 +0100
Message-ID: <20260106114057.3887879-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 11:41:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228885

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
v2: add details about how and where the variable with the bogus value
is used
---
 ...do-not-hardcode-the-build-directory-.patch | 47 +++++++++++++++++++
 ...-gpu-tools_2.1.bb => igt-gpu-tools_2.3.bb} |  3 +-
 2 files changed, 49 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-meson.build-do-not-hardcode-the-build-directory-.patch
 rename meta/recipes-graphics/igt-gpu-tools/{igt-gpu-tools_2.1.bb => igt-gpu-tools_2.3.bb} (93%)

diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-meson.build-do-not-hardcode-the-build-directory-.patch b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-meson.build-do-not-hardcode-the-build-directory-.patch
new file mode 100644
index 0000000000..7ff8aa22a9
--- /dev/null
+++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-meson.build-do-not-hardcode-the-build-directory-.patch
@@ -0,0 +1,47 @@
+From 27fd94beadfc29ea4ad82f660dbdb2540d0b6b97 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Thu, 18 Dec 2025 15:45:11 +0100
+Subject: [PATCH] lib/meson.build: do not hardcode the build directory into the
+ installable library
+
+This breaks reproducibility, and is not otherwise appropriate, as the
+original directory may not exist. If there's a use case for referring to
+it, the location should be passed in with a command line switch or
+environment variable.
+
+imgdir is set elsewhere in meson.build to:
+
+imgdir = join_paths(build_root, 'data')
+
+and them IGT_IMGDIR is used thusly in lib/igt_core.h:
+
+/**
+ * igt_fopen_data:
+ * @filename: filename to open.
+ *
+ * Open a datafile for test, first try from installation directory,
+ * then from build directory, and finally from current directory.
+ */
+#define igt_fopen_data(filename) \
+        __igt_fopen_data(IGT_SRCDIR, IGT_DATADIR, IGT_IMGDIR, filename)
+
+
+Upstream-Status: Inappropriate [hack patching in a bogus dir; issue reported at https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/190]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ lib/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/meson.build b/lib/meson.build
+index d0487fb3c..f6452e970 100644
+--- a/lib/meson.build
++++ b/lib/meson.build
+@@ -292,7 +292,7 @@ foreach f: lib_sources
+ 	    '-DIGT_DATADIR="@0@"'.format(join_paths(prefix, datadir)),
+ 	    '-DIGT_SRCDIR="@0@"'.format(srcdir),
+ 	    '-DIGT_LOG_DOMAIN="@0@"'.format(f.split('.')[0]),
+-            '-DIGT_IMGDIR="@0@"'.format(imgdir),
++            '-DIGT_IMGDIR="/this/is/a/bogus/dir"',
+ 	])
+ 
+     lib_intermediates += lib
diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.1.bb b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.3.bb
similarity index 93%
rename from meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.1.bb
rename to meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.3.bb
index 96f3530436..c92d10c617 100644
--- a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.1.bb
+++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.3.bb
@@ -9,9 +9,10 @@ LICENSE = "MIT"
 
 inherit meson pkgconfig
 
-SRCREV = "4871829d8b7117553eb2dc1bdb9a0d18de428a98"
+SRCREV = "2d7ec9a36c550c48af4bdd6e748f6753369ab8ff"
 
 SRC_URI = "git://gitlab.freedesktop.org/drm/igt-gpu-tools.git;protocol=https;branch=master;tag=v${PV} \
+           file://0001-lib-meson.build-do-not-hardcode-the-build-directory-.patch \
            "
 
 DEPENDS += "libdrm libpciaccess cairo udev glib-2.0 procps libunwind kmod openssl elfutils alsa-lib json-c bison-native"
-- 
2.47.3


