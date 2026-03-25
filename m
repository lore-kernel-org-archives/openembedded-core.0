Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1FBA103A9B5
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 11:31:49 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20279.1774438299838940314
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 04:31:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Qpo5DSkR;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4852afd42ceso17569645e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 04:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774438298; x=1775043098; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ruk7EcBmYGALcyJ8p2+TWV6qkM79CcIANTBjV9YCSEM=;
        b=Qpo5DSkRCYkoLaUird8IXE/GvWmVrQzZia7g/T04KiY8y5cgJXT7ulKFJkWWYJkmnB
         mHc/OPZQF6rr2A/oPOTRufLn/oHddkYvVKfsUk4zHzNucYBcfpkw6Zkw+KxJvDWmyWcG
         p+8fUgIq4Umt/Bsov/DAseph08DnVp5soRxs4eI81QLPwNPneX+vT+rO3F3frFldmunV
         uBcildQfYLjdpsylDs0Ff1vDMUkhz0tLjxC4kqIlXim9irktMG58S5aY3QxCuniRSTtm
         NOPkizpKKK/oLXYiSfftCVt7XO3t51ygVKqnc4T7a/eXbaG5z8iHUjFeE7HbWRqgtYAe
         VjSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774438298; x=1775043098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ruk7EcBmYGALcyJ8p2+TWV6qkM79CcIANTBjV9YCSEM=;
        b=lSNFp84KGAzTpZSrlQ2DOvAYm6QQNSjIglvvLSWpojAaLMYGxkdFPzLtG+H51hPbym
         DXHT8/3N12agiqeQPgIYT3fthr8feAZ9bwEmO79OEJa6rZ5iOg6FbryN2o/n1tjyQRvZ
         7GbZypfYC5G6+/fujbVSiuJqK/xCZUA7iNL+Y8FCCFIp5g3VGMJwI3CYTzdYWABqVddd
         HH9WW2mkw+GsOcJeyOxly6/tZibqgQIltohTOlFks5GuqxvWLGaqALzbwrkxzda4voFo
         2RoRi9HO1/ug7xV5pS0ftGZgPL9R+/UyC1/5wI8gDXiq9PgwyKgY2a45gPLcCJiKTWLB
         oxQw==
X-Gm-Message-State: AOJu0YxTo6BUe1nLXn5y+Azak5gdlfXmXbufRMEPwllSWL29UTpr9L1a
	U2MwmOKL2ANeKvQLvvn4FDT7DbFOlqhSWbh3FYSFXFqTcJMlTENKpm319BCh5g==
X-Gm-Gg: ATEYQzz3mEGalYoQrYEniyOlHAY1sUtf76jPutr5gdjr++IBAh0PDzV38h/TrmtvDTM
	iGb4BiBPbVDp+ytfa0XLCjpG6KuQrIt3zKX6AfrfQsbhtGU0mVbdkGTCRnhzpvhyKC50oy0oUFe
	P8osPdLivfviIPKxBGKJkF/IfvH2q+HoNzZ70bpCU5q9iUu280DAxLTBzZiSH3jlGR3VzVFoULS
	jY1uuoyK0AI2jVr4MnqxVVlRVxWmKwqJLJTwFuYVbnaJbLkB2Rom+DRuUxV/RE1XkZDQNIg6vs1
	Wyb5jq2PwMY0rIx+m7q1DblMS7kGJ+4bUMvYi1+TZxXavqGHsKOH23NLP60nN9NAgSOBXM2O1Yo
	YeCfGWpiog1qhnlFXNuVJX0COdKN96+OfEqJlEiGDu7EuFSj76OQRl/Klo3CKc471GqII1hfnQf
	f8FTyBx26iVQ3/8A==
X-Received: by 2002:a05:600c:1548:b0:486:fba7:b150 with SMTP id 5b1f17b1804b1-48715ff7432mr49739415e9.15.1774438297919;
        Wed, 25 Mar 2026 04:31:37 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48711693a08sm170539955e9.2.2026.03.25.04.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 04:31:36 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [RFC][PATCH 06/14] gdb, gdb-cross-canadian: Fix settings for python freethreading
Date: Wed, 25 Mar 2026 12:24:16 +0100
Message-ID: <20260325113112.1163632-7-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325113112.1163632-1-zboszor@gmail.com>
References: <20260325113112.1163632-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 11:31:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233880

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


