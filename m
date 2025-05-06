Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5A09C3ABBF
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 02:22:41 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.67819.1746498155074596863
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 May 2025 19:22:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QQ3UsBvs;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2255003f4c6so52882565ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 19:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746498154; x=1747102954; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c+whbVD+CzFySwFgk2+e4/6Iq4+2F5npw4EYxbSv36M=;
        b=QQ3UsBvsGYRmfltyCDmJy1aApncESGxdmG0emx7ia6Z6qGJGg4lQcW2a499AznZo9j
         1+o69Uaj03BYbPzIW/zqzvhmQ0eri/6tCmyfvmMFZQFY6s50XGH8LmzAPkXrtbL8cgdx
         RxytfXNFea+gLcAbu4ZGlCKu0PRU2RgBepzeVzq4uVwzaFgAw9Q7+jg5vgGOevkVAhQL
         5EANeHYGCfZ69aTn1blDC8bNZjJhrxQiYp0dHQqfi0UxOuJvXUtzZuJWR5NeYiIjKmVV
         njd1fsaS8rCzn8OH5k24I5DANRe7/O+C6QKIVuifUauvdB828HiYLKEiE/igmqfi4mHc
         w+mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746498154; x=1747102954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c+whbVD+CzFySwFgk2+e4/6Iq4+2F5npw4EYxbSv36M=;
        b=m08eW52HWQ0mLvTMysRtCk9wJZxZKhANMumdnOVPY/JMrMgbcH3e/HaaM8aV8qtZNV
         VeRa6wjUyKi1KYaZbgJHch9k3kTiSgkUBvbzDBd0Ii0WwJSh7bPlQAbj//lHdoYlRI4W
         9ifA/JWtU/BhBSmxUfmZLReaDktcAVZKDIWY8SVyA/F/+ToXzeb1RKwyRp4hfkzX/u/F
         2q+Bl8XgxHrIiVsDMUtOL8VjCT+XPsdC0HFvmKP1tXNt4Nz5HcIjkWwsuT5RHQ/Z/bS5
         ZhexETsCwQsZoq3ygIQVlntLejrJTUCfHczMYj2W8Bqt08qowR9YwBBAIgL7Ln7GdQnd
         nZjQ==
X-Gm-Message-State: AOJu0YxetEhAH9yLoncVNokGdymFKpR4pOKT56x+DkysdBbPCcOYtRaj
	I/NVIH1HcB0w8xYmmgu5xdIn1LdRJSEhL0xRhuj0xhj9iT1SBQFQ0p2jcAqG
X-Gm-Gg: ASbGncuBSxxQgB5yyGLzGVj8cHfU5goWIM7lMaNttIeQpR46Yg09w2EbnXGGV7VHADj
	KpB6O8vVcYxDIE8+Aht9ZAtp0OfNikRm0jnjwby/WKGzHpEKmNOK3EsXtyc8PDVs1ajwCGn5vyy
	YpERK5w0FMefuFGwzt9mkt/434Y36QixF0+mrRWmmfjlQkP0qK97f/jpVXr6ZZmzuZ9qsFpyw36
	zolA+lTVSN3MT4Msn311K9GbRuJKVI+xDRiAOMgJa6YWxlxb0KUfBQfCkJX1e9lwkSGbvihG+0o
	6VfSiFaxy6X9oXsrTHXlHzVw/+1zjBMu5ayP6ls8XiQ=
X-Google-Smtp-Source: AGHT+IGeMI72sQfE8RbktGpHDRCd0LA5JtmEPwKiM9y1TR3smeIduz+C3j0Nlkc1QD1hoDG3nTHjwQ==
X-Received: by 2002:a17:902:e747:b0:224:1af1:87f4 with SMTP id d9443c01a7336-22e102f315fmr244118585ad.22.1746498153877;
        Mon, 05 May 2025 19:22:33 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74059068e8bsm7616086b3a.156.2025.05.05.19.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 19:22:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] meson: correct bindgen_clang_argments
Date: Mon,  5 May 2025 19:22:30 -0700
Message-ID: <20250506022231.1665007-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 02:22:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216025

From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Follow the changes in Clang search paths and specify sysroot via the
TOOLCHAIN_OPTIONS, otherwise clang will fail to find system headers when
executed by bindgen.

For SDK packages TOOLCHAIN_OPTIONS don't contain full sysroot path, so
specify the correct directory explicitly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes-recipe/meson.bbclass | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/meson.bbclass b/meta/classes-recipe/meson.bbclass
index ef45a034a76..c8b3e1ec29a 100644
--- a/meta/classes-recipe/meson.bbclass
+++ b/meta/classes-recipe/meson.bbclass
@@ -62,6 +62,14 @@ def rust_tool(d, target_var):
     cmd = [rustc, "--target", d.getVar(target_var)] + d.getVar("RUSTFLAGS").split()
     return "rust = %s" % repr(cmd)
 
+def bindgen_args(d):
+    args = '${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} --target=${TARGET_SYS}'
+    # For SDK packages TOOLCHAIN_OPTIONS don't contain full sysroot path
+    if bb.data.inherits_class("nativesdk", d):
+        args += ' --sysroot=${STAGING_DIR_HOST}${SDKPATHNATIVE}${prefix_nativesdk}'
+    items = d.expand(args).split()
+    return repr(items[0] if len(items) == 1 else items)
+
 addtask write_config before do_configure
 do_write_config[vardeps] += "CC CXX AR NM STRIP READELF OBJCOPY CFLAGS CXXFLAGS LDFLAGS RUSTC RUSTFLAGS EXEWRAPPER_ENABLED"
 do_write_config() {
@@ -93,7 +101,7 @@ cpp_link_args = ${@meson_array('LDFLAGS', d)}
 [properties]
 needs_exe_wrapper = true
 sys_root = '${STAGING_DIR_HOST}'
-bindgen_clang_arguments = ['-target', '${@d.getVar('RUST_HOST_SYS')}', '-I${STAGING_INCDIR}']
+bindgen_clang_arguments = ${@bindgen_args(d)}
 
 [host_machine]
 system = '${@meson_operating_system('HOST_OS', d)}'

