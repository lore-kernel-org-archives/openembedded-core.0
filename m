Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24432C27C4E
	for <webhook@archiver.kernel.org>; Mon, 27 May 2024 18:12:26 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.3775.1716833543722499453
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 May 2024 11:12:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V8+8aKJw;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a6269ad71b6so4816666b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 11:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716833542; x=1717438342; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ym4amD73d93y83I5J9pWWXwORnznxm7jqUMONU+sQ04=;
        b=V8+8aKJwXUmlMpDu4Al66MblkscrgrNPZvMkU9M7Lqf2oiic+QmUrU4cTM3+sMDcPb
         GunetDz8AVPnXVhEvVW5HXH63+fZRlM8pjkrAFuomjkf0Zi4K+cAXw3HahHmEd3q+gw8
         v1TDkggQvDxkZOiM6kTjD2jliZl5M9HEsMhaoihbKXxP4KMr72c7t1VVEp6iLrxqjL9h
         Iww/24fw6HMu+VBkCYAlzVRf5Tfl7QujuW95JSRQO0ueIeCfAQO6a0oqrdxT0w9ishbn
         /udhd9UIxJGJ1kZmrDXRlBhR/3DqdqQhyLamHTkhpUkVN9lXKPDCogpr5oNWrsfHMJHy
         L6NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716833542; x=1717438342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ym4amD73d93y83I5J9pWWXwORnznxm7jqUMONU+sQ04=;
        b=lIMa61L0Ovm/SOj+S9TdLnKOwFNRFA8FgO7AlXkEOO2HGkct1ygjtAFVEjk3DoH8IQ
         vhn9aWCagQyHd2NdJjhXulda0bmmqZ/y2LiYOn+rQjTNPExzN33IJOlUrnDsHXfE/Qkc
         UuSlqntsSxFGkJ0rOURKGUE3j/j08Vu9XtagVCwDU+vKkXZOER/i9w1CNXtIX80jLHQA
         Dgtm1hB3OSvc6Y6JzYj4AhvKbVoEAWvVl2XvnLdhhJk9Dp/Tyc3tRALNrRqR4YBpIvaP
         MZakyJRgGaIXY5QmiHESQ79KI8REYSr1eT1X7I8fOCAykk5Ai8lNvj54ANSujXQo5psJ
         m0Iw==
X-Gm-Message-State: AOJu0YxWjqVbtoj5+D+mLy8OLFfXnHGVcYXAC6rWMSNN/TmHykTsXGWH
	joMPnqV1IHBeHPDnhmM9uUSN0UQwIxzAGT8EG1lgHCJIpwmGLOZyPA+6NQ==
X-Google-Smtp-Source: AGHT+IFPPHcKelzPvJaCNhYXUw2W3/490+VhKWc3qkPKhywM0bWP/hoJtmXOUl+Ry7T6LmPupOuMJw==
X-Received: by 2002:a17:906:318c:b0:a5a:8248:253e with SMTP id a640c23a62f3a-a62646cd4b1mr605223966b.36.1716833542153;
        Mon, 27 May 2024 11:12:22 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cc50064sm510272466b.107.2024.05.27.11.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 11:12:21 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 07/13] icu: upgrade 74-2 -> 75-1
Date: Mon, 27 May 2024 20:12:08 +0200
Message-Id: <20240527181214.1778037-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240527181214.1778037-1-alex.kanavin@gmail.com>
References: <20240527181214.1778037-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 18:12:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199924

From: Alexander Kanavin <alex@linutronix.de>

License-update: copyright years

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb      | 3 +++
 meta/recipes-support/icu/{icu_74-2.bb => icu_75-1.bb} | 6 +++---
 2 files changed, 6 insertions(+), 3 deletions(-)
 rename meta/recipes-support/icu/{icu_74-2.bb => icu_75-1.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb
index 97efc56c646..6b0eb120461 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb
@@ -32,6 +32,9 @@ PACKAGES =+ "${PN}-icu ${PN}-icu-dev ${PN}-subset"
 
 LEAD_SONAME = "libharfbuzz.so"
 
+# Remove when https://github.com/harfbuzz/harfbuzz/issues/4671 is resolved
+EXTRA_OEMESON += "-Dcpp_std=c++17"
+
 do_install:append() {
     # If no tools are installed due to PACKAGECONFIG then this directory might
     # still be installed, so remove it to stop packaging warnings.
diff --git a/meta/recipes-support/icu/icu_74-2.bb b/meta/recipes-support/icu/icu_75-1.bb
similarity index 95%
rename from meta/recipes-support/icu/icu_74-2.bb
rename to meta/recipes-support/icu/icu_75-1.bb
index 8352bf2a5b4..14fbf31de57 100644
--- a/meta/recipes-support/icu/icu_74-2.bb
+++ b/meta/recipes-support/icu/icu_75-1.bb
@@ -78,7 +78,7 @@ FILES:libicuio = "${libdir}/libicuio.so.*"
 
 BBCLASSEXTEND = "native nativesdk"
 
-LIC_FILES_CHKSUM = "file://../LICENSE;md5=08dc3852df8fffa807301902ad899ff8"
+LIC_FILES_CHKSUM = "file://../LICENSE;md5=9cf7c317c3f2a0962437465a9022dbe9"
 
 def icu_download_version(d):
     pvsplit = d.getVar('PV').split('-')
@@ -111,8 +111,8 @@ SRC_URI = "${BASE_SRC_URI};name=code \
 SRC_URI:append:class-target = "\
            file://0001-Disable-LDFLAGSICUDT-for-Linux.patch \
           "
-SRC_URI[code.sha256sum] = "68db082212a96d6f53e35d60f47d38b962e9f9d207a74cfac78029ae8ff5e08c"
-SRC_URI[data.sha256sum] = "c28c3ca5f4ba3384781797138a294ca360988d4322674ad4d51e52f5d9b0a2b6"
+SRC_URI[code.sha256sum] = "cb968df3e4d2e87e8b11c49a5d01c787bd13b9545280fc6642f826527618caef"
+SRC_URI[data.sha256sum] = "a5104212dc317a64f9b035723ea706f2f4fd5a0f37b7923fae7aeb9d1d0061b1"
 
 UPSTREAM_CHECK_REGEX = "releases/tag/release-(?P<pver>(?!.+rc).+)"
 GITHUB_BASE_URI = "https://github.com/unicode-org/icu/releases"
-- 
2.39.2


