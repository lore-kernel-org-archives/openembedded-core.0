Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web10.31874.1613399928922346845
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Feb 2021 06:38:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=niTXpmNB;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.51, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f51.google.com with SMTP id b16so3797980otq.1
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Feb 2021 06:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=cq6GX3rRvSs9Nxc/3gp8QCAGStYz6Z6NpzFbRrr8yys=;
        b=niTXpmNB/3MnfadByUEGNYVKNRuFbV2XjOZ8rqDCuvAOfrvu+eBrm/fyy0UKYmpPB4
         IVVcGhZJmxd6XJ2u4O52GnaRr7iJG+W/Ch+fZGU6rL/T+3jkH5flV2IIu0TeCQ36DLVb
         br4aTNdlcY5wDVCIMhw9mE8kj95c5CtCbk2EE0NOdrtdxZEMY8Ah7qiQHbCoaEDKLD+F
         YEUQPlvrGO6EyCtRqXU4p9Iw5VCl0UIhrQOXmBU6hkXmLOcdRHa4UQ9GV31l13gm7DQp
         gbxftbYZGHUxFsJRT8r7mnz3FxZ8fNDL/F85oYtrhUxc+gfWsJoPzDcqFKwX1CZdkZc8
         v6hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cq6GX3rRvSs9Nxc/3gp8QCAGStYz6Z6NpzFbRrr8yys=;
        b=FuTlGIZPY/UJ5zq75EN6DHeTnbYsbYroMnRKUAbqGyCY7XJjfg0kIGMw35Tc4hV3hl
         yDifBbDDZn8QlBi6TWTQbewhReGlQD/DPq2vwY3CUNQ1vkX+w7Gb+X7yFi2CuDIcyyCF
         1p6OMrnQdOxzgXpQuHvrRWEfK1LE7lhOqH/OdFWPUTuJCyaMTU2iWQxt+O4rTR0zB9Md
         ftqZLysnw36aLlqjDwUuaB60xUMB76h9pCuZkHt9TXmTcZm27gbkl1gBqOXESZN/lyiK
         tvSylzcIxAaVhHMO0GlrKWof4vJDseZDMDeZz81yKqPyH+Fh6/fENykv/C22yvRt1Fxw
         0fHQ==
X-Gm-Message-State: AOAM530GUQcoOkGLTfJAVg1D1wk9gwO6Jx0nAFzjIgpIzj9iFUU2coUC
	VNCbkAVVs8xuRzJTG5cElt0duH58whLq5Y2O
X-Google-Smtp-Source: ABdhPJwIQWjCNIzxJl/ruBn0e0uOL6zauznkaIhPwUj8KU4XQ51bApgJ3Rmsztf/+0iQeIvmaO/xgA==
X-Received: by 2002:a05:6830:2316:: with SMTP id u22mr11805592ote.324.1613399927878;
        Mon, 15 Feb 2021 06:38:47 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id f1sm2714068otq.10.2021.02.15.06.38.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 06:38:47 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/17] python3: split python target configuration into own class
Date: Mon, 15 Feb 2021 04:37:23 -1000
Message-Id: <0bdc6a25c102068de27d98c9b632f222feb991fb.1613399659.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1613399659.git.steve@sakoman.com>
References: <cover.1613399659.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

Setting _PYTHON_SYSCONFIGDATA_NAME in python3native class globally was
problematic as it was leaking into host python environment, which
was causing tracebacks depending on host distro and action
(typically anything involving importing sysconfig module).

The new class sets the variable only in specific tasks where it is needed,
and should be inherited explicitly:
- use python3native to run scripts with native python
- use python3targetconfig to run scripts with native python
if those scripts need to access target config data (such
as correct installation directories). This also adds a dependency
on target python, so should be used carefully to avoid lengthening builds.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5a118d4e7985fa88f04c3611f8db813f0dafce75)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/python3native.bbclass       |  2 --
 meta/classes/python3targetconfig.bbclass | 15 +++++++++++++++
 2 files changed, 15 insertions(+), 2 deletions(-)
 create mode 100644 meta/classes/python3targetconfig.bbclass

diff --git a/meta/classes/python3native.bbclass b/meta/classes/python3native.bbclass
index d98fb4c758..2e3a88c126 100644
--- a/meta/classes/python3native.bbclass
+++ b/meta/classes/python3native.bbclass
@@ -17,8 +17,6 @@ export STAGING_LIBDIR
 export PYTHON_LIBRARY="${STAGING_LIBDIR}/lib${PYTHON_DIR}${PYTHON_ABI}.so"
 export PYTHON_INCLUDE_DIR="${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI}"
 
-export _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata"
-
 # suppress host user's site-packages dirs.
 export PYTHONNOUSERSITE = "1"
 
diff --git a/meta/classes/python3targetconfig.bbclass b/meta/classes/python3targetconfig.bbclass
new file mode 100644
index 0000000000..640d0c97b6
--- /dev/null
+++ b/meta/classes/python3targetconfig.bbclass
@@ -0,0 +1,15 @@
+inherit python3native
+
+DEPENDS_append = " python3"
+
+do_configure_prepend() {
+        export _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata"
+}
+
+do_compile_prepend() {
+        export _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata"
+}
+
+do_install_prepend() {
+        export _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata"
+}
-- 
2.25.1

