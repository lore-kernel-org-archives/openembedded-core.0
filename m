Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBC1E10BA451
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 08:31:21 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.68449.1774600273151535194
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2026 01:31:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Xkk/LWEb;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48704db565eso25966185e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 01:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774600271; x=1775205071; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ruk7EcBmYGALcyJ8p2+TWV6qkM79CcIANTBjV9YCSEM=;
        b=Xkk/LWEboI7YsMoRIb/jbDzZPZOzVp4enmBmTUqygjOgmH+Gh0XLFyC5ArVFL2Rfug
         HD8IExMVJs4mQFBEW4DLljdeJjHm8OzUPjolog4w3l+co5aub5aRfS6cx/DLTqiVg27U
         vUz7rMdWVwLNMeuypkKwaHs2/MrsyYt6hiGli/VFr5b0mHn02KjhlXI4IGK7Ws0DPOKW
         U+FFrCJZcGnpsY5pSgbCj2NVhZC30bFBnXe4XzYVCjH+RId3WWc+n+8ePheFvnrB73Ye
         ctsru4avP7yQQZyoHydmMLzvWM3ruQxpqLx50RwDk9LDGs+rTadeDQ9JX4dvlFtCIT92
         fgqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774600271; x=1775205071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ruk7EcBmYGALcyJ8p2+TWV6qkM79CcIANTBjV9YCSEM=;
        b=iDpsKUYtxjCbrDpZlVCfsMrvGROmFpy0VPG8opdjqPl4ZK+rRmKUzQ9wPIH2ZA4I+1
         iFwOLXDJ4lWHJseiGRO6vlLvSQmPDBMTLj2oHrDoeDyR1E5JUEqEOM2o3CCFnTWVpuJC
         gppsoDzhfALPIdkktAB3e1BKvgNqJL8NuFJ5TUUafAr2DvXi4bbuxWrQH89ckD9AmyGR
         eCyA4I1NQw/8/EnWsPFh1MdLOJ3p5ziqyBGoDF+Za66mhVbFkWagHJVfvAAeOq3/9UEN
         wknzuSm4fGSIz22L7dpUjEpzG+RKdvXBcvTj9UqL7Oq6ZnucjR3ENwI46HLWIjCTG4Ui
         Lu0g==
X-Gm-Message-State: AOJu0Yzi6ANX1XZyja1Fp0uDve7n80xY5BkU8/zxz6pUCnWMLt7H0UDt
	h9eK85YL04YYFEQiR409N1t9LCzCMMo5+PPfGoQZmJmWYzhzh1y3X/z7mzMbsg==
X-Gm-Gg: ATEYQzzh57MLRh/Tlbp+hTWSYuJ6asvyu7D9nTGoHCdRfvf4CRfKxMsoNn6OO6J4CjZ
	QKaW3yfEJr8EIWcfyk61cVrttoKEZdKJAvvDhxzeOtELIVeXuOyAgW/guLZg+Pmbcq88Q+7qbFA
	2K99c6SWp4Z/ICTgIToEpavNjHNfjcF+rZSSguoxAtUYIqLPPkQag5g2yR61HrSgQFlFQyhCAqZ
	xKKizWh6ZcWuK7NINndOVaIb1wNRKv5qcUOOEhOzfi3p+JfGBrCxiuSVQFEN8cVd3kBB0r+r5lz
	8qWGN9LtuDcy1nA4WroJrsFE19X1D2QWtIzGd5bYuVrQuFHTP+dW4S8zneLqdB7vLV1XmYQ+a4E
	H38RTc5UVNEuoN1v3ox7pFa8D15WGi7IVdESjdzfvPKa+PA2n4hJn5VJ0LuKgzS4cMFShoBr+mY
	QH+h/5JDFLmppQrA==
X-Received: by 2002:a05:600c:8b2a:b0:485:3f1c:d8a4 with SMTP id 5b1f17b1804b1-48727d62decmr24547255e9.9.1774600271184;
        Fri, 27 Mar 2026 01:31:11 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c95041sm76411485e9.6.2026.03.27.01.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 01:31:10 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v3 07/12] gdb, gdb-cross-canadian: Stop using PYTHON_ABI
Date: Fri, 27 Mar 2026 09:30:50 +0100
Message-ID: <20260327083055.12571-7-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327083055.12571-1-zboszor@gmail.com>
References: <18A06529173E9998.57592@lists.openembedded.org>
 <20260327083055.12571-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 08:31:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234062

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


