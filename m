Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AACA5C5ACB3
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 22:48:51 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.20276.1700174930439740430
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Nov 2023 14:48:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Tp8/IOoB;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-53f9af41444so1978128a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 14:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700174929; x=1700779729; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CqEPMMS2vLOSRA9x9J/Bek7wYU1HlzQddMoKpZ7y/w0=;
        b=Tp8/IOoB1lD3CSnuTRSbVK2nyl4y1PTCULU05qOoD17fN3XTbqwF56jJvEz2n6oOO4
         E7M2c2YMZ4SeDDjmvcV7cUOZs60xPH1+ZX4U/MQcl2KaFhNaJ8Af9DbDyvfndGCnq16T
         ZuD+FFMHwVS82185AdTq1CethHxFQ6xG7BFLW48gJwbl3YgulU3BTuGHo4NmXUYMlXzj
         f4gIBepZ73sTdAf0ktbxsBAwOUZ1OAGmv5URicm8VBinmqZXS6EVUxA+fH5dxSqItGfN
         Ur4dvV9EwZ0ad3tVRpbdo4p/6RGc4eehLnHtxky7y+mBwmLvVw/gcxr1M7WwdvzRdiSw
         uH0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700174929; x=1700779729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CqEPMMS2vLOSRA9x9J/Bek7wYU1HlzQddMoKpZ7y/w0=;
        b=bk4LsbFBT7rrY9yOtbLNX3X3ojwGDoRtNHlNEgs7wFE6Jj0jDzPy4vOC/jvoke6W4t
         yj2sP754Z7mtyOXl6TqOcCY/NwfC8CkPT0U+Sh5g+A+XBPoV8io/JMnHJLO6FGbK/lBt
         JafMBa9wjiJR01MnLsR7ncCr/A996W4lbB2SX3vpzQSwLwwC3QgHG85qTJoWJPnFFYbb
         0b8Vguu6pfyYP/geyYcJC+u80FDMN9zOqlap87AJavEPjwpoMWBjGEtxN6ZQv2xBHrnz
         oVFLTztpx9gOo/WxlcjLMzb8GQcvJvAQ45L6s71Wi2JY1yWXq6S/5LQwUE8Z7CIK45Uz
         prsw==
X-Gm-Message-State: AOJu0YyNJsjZWnEjRjzFTDBdNGLHgvtxTOslsZpVtkECldyCoSpkLwoW
	W2so0y2euu7RYkl1VBV7QPf/MNQTx7E=
X-Google-Smtp-Source: AGHT+IG8ecejR4cBbvAUqxtHDvU6lGsJhW+nldq0c4U6Y8RQq461aTQJGhjav6QCaPBgImOtjT0bXA==
X-Received: by 2002:aa7:c788:0:b0:543:8391:a19a with SMTP id n8-20020aa7c788000000b005438391a19amr10810776eds.40.1700174928667;
        Thu, 16 Nov 2023 14:48:48 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id w9-20020a056402070900b0053e5a1bf77dsm117878edx.88.2023.11.16.14.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 14:48:48 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCHv2 10/12] valgrind: drop PE, PR from /usr/src/debug paths
Date: Thu, 16 Nov 2023 23:48:34 +0100
Message-ID: <20231116224836.2696913-10-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231116224836.2696913-1-martin.jansa@gmail.com>
References: <20231116224836.2696913-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 22:48:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190824

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.21.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.21.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.21.0.bb
index 68ab319a1b..67a197c509 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.21.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.21.0.bb
@@ -239,8 +239,8 @@ do_install_ptest() {
 
     # As the binary isn't stripped or debug-splitted, the source file isn't fetched
     # via dwarfsrcfiles either, so it needs to be installed manually.
-    mkdir -p ${D}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/none/tests/
-    install ${S}/none/tests/tls.c ${D}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/none/tests/
+    mkdir -p ${D}${TARGET_DBGSRC_DIR}/none/tests/
+    install ${S}/none/tests/tls.c ${D}${TARGET_DBGSRC_DIR}/none/tests/
 }
 
 do_install_ptest:append:x86-64 () {
-- 
2.42.1


