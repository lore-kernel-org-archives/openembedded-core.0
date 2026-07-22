Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59712C4453C
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 21:57:51 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11280.1784757466206991038
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 14:57:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rWuITPUK;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ceb096e675so42685ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 14:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784757465; x=1785362265; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=79uv6b9kpGK3L9wWaFCFvGy8djv5dMf5yobbeY0Lvj0=;
        b=rWuITPUK12f/lU8UPug4xZUuviQinronM3qVB3kdR4Zlq0vHvpfZcOjatSAqS4ZXeL
         u7w6+Nn7KEeii4vHLAvM43BQKJQsULkvDCDhPc1rnPKUZG2eZ2JrB1e6ATeKDJ+t3Kev
         o/AeoGs//tQ4LnQ6bQq5oJqWsIgpONyWs0vwHY8vcG72kF907K/jG3DTIOzFQUZ2Q9Oo
         +cWgoMO36ejvVpuYBv/H0sQY4s8Z14JL4HgjOmf5uR0Ur4eIa8QmP7oC5Seh1ALCVrGc
         ho0d8LcjqKZDi9oiD1M8d988RSTSbkzvh7ugL9I28m4UXGWRZAvKUu0hlbVbHcu78nj5
         9jWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784757465; x=1785362265;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=79uv6b9kpGK3L9wWaFCFvGy8djv5dMf5yobbeY0Lvj0=;
        b=smT9+6yYMNN0HXVGgNAUSmRpZGy7WNUweBinN1uk0hG5YbVJdsh5gpeQsg1Za1Bg5g
         qy+P4CQqplQremziPEFLbbFaFcb3tDbrdiP55zA8qdDGvdHSxhadjaJ5SIFzq3NZOi3K
         wTAB6NpznPrxvNrRSNGgaLZRCyYx9Dvnt1SFjfggTO48QqDM46NdrgYJ5uZZjF7ITReq
         MfIvPrb6+4t5QMLV3VzwwkOKhGL8eElhdWhVegj9vEi4j6kbHECNDOUCjzOm9YcffdWm
         OPMHUEeQGOAW/3diDL+HiqwkpeTpgBuYj/gntIwS4UOYxd8i6QyHX/8TFfpWcV6fEhS9
         kwWA==
X-Gm-Message-State: AOJu0YzrIj3dk/QunelWQ2awnBRiqykpcFz5NUucynGn3Uiy2bVAekvD
	vyrSwUd7fnzBilQaYUli45LhObDB3MTgV44cJcQzyphrKrLBGYgB40GYRE5wjw==
X-Gm-Gg: AR+sD10KfFbR1Yq9n5va5xKzZB2W9GppAjpbX60VCIeUshH+rN0Y71zjeyVf0VJq2aH
	bF0u0Kh2bK7OSKXfWtJSnqvldoFjFEmq0J89U2O6h4jCozaUsOp8JUeNjN7OZ7s0IKyq278U21S
	0x+jKNSqu/DAEWs5Y9hRIAb7HqN1nPbYxoNk5LyIptaGjCMf5LGK/M11/VaOvsSX0jHPsHB8xiR
	jN9udczrEi3yWPom5e/QQgjtphLgMOJvf9ewAuz+uWgAv5Qex9fO+dcDZOHHTURzRFYiMFVkGcY
	wmXVTqilJH0VQWrhmce/OL+b8e5u65l/4cX/B37VVAujk7wyn1hVJOLZF1UPS16ADFCmizfEXVK
	sDePDpjh3bFbZkXOMptAicngmGF3RA1s3bX5Aut6vksywmzBe8se0Z+Unbxjux5Ihx9ap0Bp4T8
	gVPQgGD9J+0ApQpZjXZqky9bQCU+L69ooVIyp0efVWc7Pxt+rvwCB3CEQV7aQ4+ykScKoAeRphO
	R8TrWLOZsaCH6t2762DXpxwVnU62nK9fpkY9DYka4XrBcgZSRk/jbF/kNGOKWCM2symz/7hlK+q
	5rGFYATlhmCDwTZO8Yg=
X-Received: by 2002:a17:903:4687:b0:2ca:20b1:3e0a with SMTP id d9443c01a7336-2cfa6a5a2d0mr7885385ad.3.1784757465504;
        Wed, 22 Jul 2026 14:57:45 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc9f2f0sm13264388eec.13.2026.07.22.14.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 14:57:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH v2 4/4] libpsl: Fix meson configure failure when docs are enabled
Date: Wed, 22 Jul 2026 14:57:35 -0700
Message-ID: <20260722215737.1940382-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260722215737.1940382-1-khem.raj@oss.qualcomm.com>
References: <20260722215737.1940382-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 21:57:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241761

libpsl 0.23.0 ships docs/libpsl/meson.build referencing an undefined
"cdata" configuration object; the top-level meson.build only defines
"_cdata". meson shares scope across subdir(), so with docs enabled (which
OE does via gtk-doc) do_configure fails:

  docs/libpsl/meson.build:7:20: ERROR: Unknown variable "cdata".

Backport the upstream one-line fix to reference "_cdata", which already
carries LIBPSL_VERSION for version.xml.in.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ta-to-_cdata-in-docs-libpsl-meson.bu.patch | 38 +++++++++++++++++++
 meta/recipes-support/libpsl/libpsl_0.23.0.bb  |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-support/libpsl/libpsl/0003-meson-rename-cdata-to-_cdata-in-docs-libpsl-meson.bu.patch

diff --git a/meta/recipes-support/libpsl/libpsl/0003-meson-rename-cdata-to-_cdata-in-docs-libpsl-meson.bu.patch b/meta/recipes-support/libpsl/libpsl/0003-meson-rename-cdata-to-_cdata-in-docs-libpsl-meson.bu.patch
new file mode 100644
index 0000000000..8aecf34e4a
--- /dev/null
+++ b/meta/recipes-support/libpsl/libpsl/0003-meson-rename-cdata-to-_cdata-in-docs-libpsl-meson.bu.patch
@@ -0,0 +1,38 @@
+From 3e02f2cd038209e873c970709a9eeeead4d70afa Mon Sep 17 00:00:00 2001
+From: Tim Rühsen <tim.ruehsen@gmx.de>
+Date: Mon, 22 Jul 2026 09:00:00 +0200
+Subject: [PATCH] meson: also rename cdata to _cdata in docs/libpsl/meson.build
+
+The 0.23.0 release ships docs/libpsl/meson.build referencing a
+configuration data object named "cdata", but the top-level meson.build
+(and include/meson.build, which sets LIBPSL_VERSION on it) only defines
+"_cdata". Meson shares the interpreter scope across subdir(), so once the
+docs are enabled (get_option('docs'), which OE turns on via gtk-doc) the
+configure step fails with:
+
+  docs/libpsl/meson.build:7:20: ERROR: Unknown variable "cdata".
+
+Reference the existing "_cdata", which already carries LIBPSL_VERSION as
+needed by version.xml.in.
+
+Upstream-Status: Backport [https://github.com/rockdaboot/libpsl/commit/3e02f2cd038209e873c970709a9eeeead4d70afa]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ docs/libpsl/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/docs/libpsl/meson.build b/docs/libpsl/meson.build
+index 1111111..2222222 100644
+--- a/docs/libpsl/meson.build
++++ b/docs/libpsl/meson.build
+@@ -4,7 +4,7 @@ if get_option('docs')
+   configure_file(
+     input : 'version.xml.in',
+     output : 'version.xml',
+-    configuration : cdata)
++    configuration : _cdata)
+
+   docs = gnome.gtkdoc('libpsl',
+     main_sgml: 'libpsl-docs.sgml',
+--
+2.51.0
diff --git a/meta/recipes-support/libpsl/libpsl_0.23.0.bb b/meta/recipes-support/libpsl/libpsl_0.23.0.bb
index 6026adad9f..3b3c4aa32b 100644
--- a/meta/recipes-support/libpsl/libpsl_0.23.0.bb
+++ b/meta/recipes-support/libpsl/libpsl_0.23.0.bb
@@ -14,6 +14,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=49296c1806ef92c28297fb264163d81e \
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz \
            file://0001-Support-reproducible-builds.patch \
            file://0002-psl-make-dafsa-embed-only-the-basename-of-the-input-.patch \
+           file://0003-meson-rename-cdata-to-_cdata-in-docs-libpsl-meson.bu.patch \
            "
 SRC_URI[sha256sum] = "f39b9631b3d369a21259ea4654f8875c0ec6995ce9551c0eb5d423e4c011f911"
 

