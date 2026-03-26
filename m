Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86DDE10A62F7
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 14:30:42 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49671.1774535439128631492
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 07:30:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=k3mb3JVn;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43b5bded412so715336f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 07:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774535437; x=1775140237; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ruk7EcBmYGALcyJ8p2+TWV6qkM79CcIANTBjV9YCSEM=;
        b=k3mb3JVnOpxi3KEhT6o1jSI9gTSWYwsjy+Yw79JnSZsDCx7IgPGHb5lU5JFXAe1GNk
         WMo9wEnuawGc7ny3qrVHLcmXeNt97zF5eyncaGwgSpt4qvKTFW3YjrC5Gtl+2zZ4pnN1
         DlGZfiNLednwVYE+YpJHfbPNPY8LCPcJIg3mkyLcEXLUJX60V9lb9fja342SPtIZqVTj
         4sFNfeiOdN8FaA73ELwc7eRBd9RKSXQ0YvLGhlbMIV2yToLbokqMOQFAv8N4X2k6Z92s
         Pdy2LHFA1sjWo2fKVzbuuQAKh7nnAVfVjNN3AHA5wl/qAdoeMglPbTSMFreIlsp6VN29
         su2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774535437; x=1775140237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ruk7EcBmYGALcyJ8p2+TWV6qkM79CcIANTBjV9YCSEM=;
        b=sFAI2jsekq0enunidOtGfEG5d7MO8zbsjP6iAfog9yrXKncBAdmykMY/jCTcyT4fi9
         ePnqIkkRqbTaZvpKlJ9gMg/8NZBVSL5QsEhuZGGQ0f8wUoo2/K+Qgb7yWOEC1Xo3MQHd
         7xe7ULgGDOalyAwwwixCsVdHTzLEfLChUmDDqD1WV7HlNicixPJ+7XwKc8ZB6XiN74hm
         NT59tnk5U0Z0QXrmxXXyZBHzqJh1V0uIlLpGBDRzvS7B5N5dOFTS98XmWkbEqWKsgEw0
         v/VigOgqFCy0bPIWp3xbrgMdyKL5WDUo0t7oI/hJMnKfESHIIb7Q10LIIQ0F6PQ+Pgqq
         0jDw==
X-Gm-Message-State: AOJu0YyMOTgNKQCpxBNPEZnd3EcE1EEbmcE8a9kp3NNZ5idX/7v09C7U
	pqaPGtQEbns4oMd4devD912qcRWTQQzTd3E/VMBpz8BXdXGopQmjTFMw4SRaqg==
X-Gm-Gg: ATEYQzzZyqV+Xa+j1Ui7i/V2kb2WTCMZEnD0+TaQ8CRxqNynm6OYwATSoKnq2QjCJRx
	s1CrhAg0+38CwWpUtxkFETKWXlDbuWaByk3+Q2Lssm3fA2ahp88OWg9kpiZUgg9eOmZ+7wje80H
	cCzjv5PGvyFWVkhltlqJvRBr55ZkFx5952rFOLl2vh5Y7ZRcxylSm/FGF88uDUX5mKBqcu2spnH
	n20cM0mvB4l1yTmFUTojPIuyzjaN706PFL0dTRQyh3nvI5Kn8yxJpf1FABW7yX1KiIr9qlwhviq
	8dvoMHzgf+vzNrH6Yqp2cw5BjyRYjWTloA3lWBLkuK/nOmBcpL4nLJaJq3z5GxUr2w1wv6Uyph1
	poNIhwl67mBIFRrz0gVcSOV1IrFrE6OzJ6D484OVTQlV2XqYxQpUOwQOiQdgLYT+O74tmx2X9tq
	HCexLyOIfbijbSaQ==
X-Received: by 2002:a5d:6806:0:b0:439:c157:2577 with SMTP id ffacd0b85a97d-43b88a055a4mr9348369f8f.34.1774535437121;
        Thu, 26 Mar 2026 07:30:37 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b91942f24sm9162880f8f.11.2026.03.26.07.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 07:30:36 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v2 07/12] gdb, gdb-cross-canadian: Stop using PYTHON_ABI
Date: Thu, 26 Mar 2026 15:30:15 +0100
Message-ID: <20260326143020.2083293-7-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326143020.2083293-1-zboszor@gmail.com>
References: <18A06529173E9998.57592@lists.openembedded.org>
 <20260326143020.2083293-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 14:30:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234010

PYTHON_DIR now contains PYTHON_ABI, don't use the latter.
Simplify the linked library name to use -l${PYTHON_DIR}.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-devtools/gdb/gdb-cross-canadian.inc | 4 ++--
 meta/recipes-devtools/gdb/gdb_17.1.bb            | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
index 7b4a7719e4..c4c62d02af 100644
--- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
@@ -22,8 +22,8 @@ do_configure:prepend() {
 cat > ${WORKDIR}/python << EOF
 #! /bin/sh
 case "\$2" in
-        --includes) echo "-I${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI}/" ;;
-        --ldflags) echo "-Wl,-rpath-link,${STAGING_LIBDIR}/.. -Wl,-rpath,${libdir}/.. -lpthread -ldl -lutil -lm -lpython${PYTHON_BASEVERSION}${PYTHON_ABI}" ;;
+        --includes) echo "-I${STAGING_INCDIR}/${PYTHON_DIR}/" ;;
+        --ldflags) echo "-Wl,-rpath-link,${STAGING_LIBDIR}/.. -Wl,-rpath,${libdir}/.. -lpthread -ldl -lutil -lm -l${PYTHON_DIR}" ;;
         --exec-prefix) echo "${exec_prefix}" ;;
         *) exit 1 ;;
 esac
diff --git a/meta/recipes-devtools/gdb/gdb_17.1.bb b/meta/recipes-devtools/gdb/gdb_17.1.bb
index 9c6db4ca2c..a5d96f01eb 100644
--- a/meta/recipes-devtools/gdb/gdb_17.1.bb
+++ b/meta/recipes-devtools/gdb/gdb_17.1.bb
@@ -26,8 +26,8 @@ do_configure:prepend() {
 		cat > ${WORKDIR}/python << EOF
 #!/bin/sh
 case "\$2" in
-	--includes) echo "-I${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI}/" ;;
-	--ldflags) echo "-Wl,-rpath-link,${STAGING_LIBDIR}/.. -Wl,-rpath,${libdir}/.. -lpthread -ldl -lutil -lm -lpython${PYTHON_BASEVERSION}${PYTHON_ABI}" ;;
+	--includes) echo "-I${STAGING_INCDIR}/${PYTHON_DIR}/" ;;
+	--ldflags) echo "-Wl,-rpath-link,${STAGING_LIBDIR}/.. -Wl,-rpath,${libdir}/.. -lpthread -ldl -lutil -lm -l${PYTHON_DIR}" ;;
 	--exec-prefix) echo "${exec_prefix}" ;;
 	*) exit 1 ;;
 esac
-- 
2.53.0


