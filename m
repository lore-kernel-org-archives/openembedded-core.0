Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D744C53209
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 07:29:54 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14461.1784878188890405201
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jul 2026 00:29:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=cuDJpYod;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c998fd549a8so100484a12.2
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 00:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784878188; x=1785482988; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eGWelDjJyU+xQBDEIyA2YT+BYueHXZciTls3fxw92l4=;
        b=cuDJpYod6a4w35aKmTmPkN/LccStz2h5AhNP9m8HC9rNdTnpoAx1L+ts6UaadFJhJo
         iW4nbystCc+Dlu1oYBt9WXOkGNz4u5mp9FtCknRJN5Nu/n+L4cNqFbxlIcboOAfpm3Hh
         eRxxiEl3FIYzPqKmnXqsnYuwQzRJ0EmBYeG0O2lsfyijJFG2ydtiMkFdRwJ+sN9QVpHN
         V7luodGp2X002b0whmoiXAqz2HpgLzBP2PA938z/7nZW8yAbV0qjiRY1PuOpYCSy473n
         2znxX7/pzi0HV/tEIyTxob1uR2hxITyJcYcnvSU6Y6fz7sW2No5T1luFv/rl1QwDiacN
         k/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784878188; x=1785482988;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eGWelDjJyU+xQBDEIyA2YT+BYueHXZciTls3fxw92l4=;
        b=OgLe0xVfV8Esq6CreaiJE6r+c7GRFAQlpbAdVjOxg/ZkBK/rhlIzKSTlpsZhRuzSGM
         amSkn0fFPvYmKAIRLodRgd3ytxNV5U6UBw8uVKzzNuXWefZdzHtAOttBR15BtI0GD5Vn
         wEL50AVePxZmnWJ3iYcHBnN9e64BHX0SCeLlMh9ebKM8aDXCCB+l0VLzbReOYUHh0jac
         qfiqxg/vu5aanKSQXMu8pOZdkhgeqrHC5JS2s7IBIYi9pmi8yMr78W+hx1XmNxLsI6jH
         mxbKROevWVjPjr0wXekU44yZARCSAsDYORuJjeqTxwyc2tiahjBAUpUY2flupFmZOect
         rv0A==
X-Gm-Message-State: AOJu0Yz2mUBUOGUAgspkDh5tB03T+GmXKNJlpnEYotBzsHhndhbqrAQX
	4mTHWHkVosN5+oXK7KKt1E+wX/X4Qveq1B+3FceB7ezRt35S9VFgqMRNdhJ/Bg==
X-Gm-Gg: AR+sD12ogJv6vjBH/diNS8RVJKf8EtuTbAcsHD/KMN26L5zawhWbU7M0HnSswTOc56H
	QX4msDS9foRbU9KvAYawREpoPV2tAfoVJym1WlMGBFfjEz43+4Zt5otR5441dRDOdafth9cu8y1
	JxEtNk/owSF0Q/VuArTZXKtvzxShS4uEp0n01yPMn2uuUNQnvyZ3i/FiXAq17GBrrt/6pJOtbLJ
	asTi1TFI4rC2PgI7KGOuHD5mKerNgi5oAeA9NYQAVPvq40jWUlQVUQ8YiTSN/S4auGiWRg7bF0w
	KHQr5K0hWX/f/ISBo99hBVV/xK9BzFH6aQT1++pvhte+XzLsyGid/FStzewanELuHIdTxvp1cbc
	FlOg2V7uBi8B08joB0Wm/AFMnTGCL7S4x9Hf/4+Xa0w3Jc6UAgRvXzx8mg2o5Kgai9VmeVCtT0A
	/8sDVYqCjRU8x4K7xihV9waQbXQmLfKMP8XzChWXBv1XvmWvVudPD9wLrOJPg6tpNQgdSXcKvE8
	2NMECJz4Gi/0kqhKOWzHr1fVJqKi0vB8JY9b6EQx5k8/o0VrFJ6qfFpXyStVdbPLMR2cTPpZnfs
	5/BqbP/V/8/MIkqyR68=
X-Received: by 2002:a05:6a20:4304:b0:3c0:9c19:65a8 with SMTP id adf61e73a8af0-3c44b2443c2mr7064541637.64.1784878188038;
        Fri, 24 Jul 2026 00:29:48 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc193f8sm45091397eec.1.2026.07.24.00.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 00:29:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH v3 4/4] libpsl: Fix meson configure failure when docs are enabled
Date: Fri, 24 Jul 2026 00:29:39 -0700
Message-ID: <20260724072940.2807849-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260724072940.2807849-1-khem.raj@oss.qualcomm.com>
References: <20260724072940.2807849-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 07:29:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241905

From: Khem Raj <raj.khem@gmail.com>

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
index 0994b5a030..193f560772 100644
--- a/meta/recipes-support/libpsl/libpsl_0.23.0.bb
+++ b/meta/recipes-support/libpsl/libpsl_0.23.0.bb
@@ -14,6 +14,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=49296c1806ef92c28297fb264163d81e \
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz \
            file://0001-Support-reproducible-builds.patch \
            file://0002-psl-make-dafsa-embed-only-the-basename-of-the-input-.patch \
+           file://0003-meson-rename-cdata-to-_cdata-in-docs-libpsl-meson.bu.patch \
            "
 SRC_URI[sha256sum] = "f39b9631b3d369a21259ea4654f8875c0ec6995ce9551c0eb5d423e4c011f911"
 

