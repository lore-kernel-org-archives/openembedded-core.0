Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E96BD1CDA8
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 06:27:33 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.12379.1729578447741449420
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Oct 2024 23:27:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iBUGxZyO;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-71e4c2e36daso4343897b3a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 23:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729578447; x=1730183247; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3kX6iowYBJob35jB1DvVJQnj86VmjvzU3bbBosx05hg=;
        b=iBUGxZyO9/aVYvX0BYgbwfKOVbGE4wo+P/2FyCVlD6SthtaPA0qWvWp5qmYTrZSAco
         qXf+/vIj+yLG4XLVw2WGJQfV02MFPyBA5M3s8EVi8OlP36XagWgf8GR28RfzGSETxM3S
         uXDgIjsjZlwj9tzv21XJ1XKKN9UqQZzv/9fLiQLYIicL2Qjl8J7soPGNNbbJY7Ytb2AP
         te89aeioabIAzDfdowDzxBFM0x5IgZTigQsEB7hDKWXyPnVGzUarSfhLNAPJW99H0XJQ
         VcJRNhMrHG1ygVIz2MC6ZEkyq+VQmbp09mWni77wgRSF09NZjqly1mLRiKScDQ4QgmME
         Ghhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729578447; x=1730183247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3kX6iowYBJob35jB1DvVJQnj86VmjvzU3bbBosx05hg=;
        b=i49M6GIvLNoAipkIC5Fnyv43kqtpEL6+ILBJUp6NHbR7P+aJ1291Wr1hjpNbMP7lNF
         dkGPKFwvU8oDOlh0Fnn3pOIOqwDILGKE5ttD1BvkrLgEeWZQFbxr7yipQcZZ2bqj8YRl
         o01crUM6/dt7V3xTN2WsrfR0vzX7TZqYqs/QQLvxdDz/svef7IkthAHxqieHv0wKWD8n
         MEUq+c++g0pJGfhGouVzmQMYRFzOZyhEA4RoapCvihNU0GdeaCb0nBuk29HXuiL0mr/b
         gurqCjnPSlZ+YdEZUJUT0GQhTjngLLDKAaEqQUOfb4vPH0L+erdlqerRsnfMrGltMIzU
         6www==
X-Gm-Message-State: AOJu0YzkjMCdG03mEQ8RV7dhl5ieT5R8pdoG8AVJO0Xsfr3EoBeGZIAP
	8up9YS5PpFo7EqjraTqgayfXHwXo/M4TRlyzvwcDKqngVgKp/4uDZ6mRS9ao
X-Google-Smtp-Source: AGHT+IFipt4zDv7Q0oNHsDUSWVafs0q3k2PDaqSBTcN2y6wP2n8Q2cRD9niA9F6hk/eFiY5LC92yfg==
X-Received: by 2002:aa7:8003:0:b0:71e:427e:e679 with SMTP id d2e1a72fcca58-71edc146704mr3150052b3a.4.1729578446827;
        Mon, 21 Oct 2024 23:27:26 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::2fbb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec13336c6sm3948775b3a.76.2024.10.21.23.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 23:27:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 3/3] python3-libarchive-c: Avoid using find_library python API
Date: Mon, 21 Oct 2024 23:27:21 -0700
Message-ID: <20241022062721.4131585-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241022062721.4131585-1-raj.khem@gmail.com>
References: <20241022062721.4131585-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Oct 2024 06:27:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206140

find_library API depends on platform to provide ldconfig, ld, gcc, objdump
etc, so either we add these dependencies or avoid them by computing the
libarchive library name during build, which we can be done.

This ensures that ffi module works with musl as well as glibc equally
as musl does not provide ldconfig like glibc does

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: rebased
v3: rebased
 meta/recipes-devtools/python/python3-libarchive-c_5.1.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb b/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb
index 3116c6b62ec..510e2d9159c 100644
--- a/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb
+++ b/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb
@@ -16,6 +16,14 @@ inherit pypi setuptools3 ptest
 
 SRC_URI[sha256sum] = "7bcce24ea6c0fa3bc62468476c6d2f6264156db2f04878a372027c10615a2721"
 
+DEPENDS += "patchelf-native libarchive"
+# Avoid using find_library API which needs ldconfig and ld/objdump
+# https://docs.python.org/3/library/ctypes.html#ctypes-reference
+#
+do_configure:append() {
+    sed -i -e "s|find_library('archive')|'${libdir}/$(patchelf --print-soname ${STAGING_LIBDIR}/libarchive.so)'|" ${S}/libarchive/ffi.py
+}
+
 RDEPENDS:${PN} += "\
   libarchive \
   python3-ctypes \

