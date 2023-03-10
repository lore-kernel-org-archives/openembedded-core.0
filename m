Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73AF4C6FD1E
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 09:54:38 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.15612.1678442072044393068
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Mar 2023 01:54:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iUB8W3xX;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id da10so18244678edb.3
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 01:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678442070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oEUmDiiSY2vXc4Ezu14bEkCe2rERqKhXafQPtxYddtU=;
        b=iUB8W3xXlnbjE4xyN1g4y/ib/MZRUmgVMk4ku1HRqAvvZ56bqnKzzIpdgNbe+1D8yo
         JfDxZJTzcJiukiu95+nuHmfAJGIASn8i5hdFO2Cy9k7gXwrCwMP4+GqsT/MEmINDev4L
         l8CmgMw4udNQmu6BeoM2amenPsn5QHXrsXyVaddYZY1/WccXTbWJgoWUF62VFwa5UN9A
         zpXQJxc5mA0dDt7mUboCmEfwic0lT+qW4jgzI5Vii4u/XGobGJB+whKS1yx7gE5L+7NZ
         3nT2+gQFUyDaZY+2D4UMqIUAqt16jpe9hbXcvkZKahjmTchqQ75voaBDWt3be8/lbZ9Y
         4kcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678442070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oEUmDiiSY2vXc4Ezu14bEkCe2rERqKhXafQPtxYddtU=;
        b=jP36eNovop6ly2emMRJfNbti6/qLd3xc1R2z7duM1lZHuxpr/1lPm6PmA+7Q9v8Hlb
         crwlQj0j7tN2D71+5VemHGgyDbUs2CjgPQqSAmhpZVX9eDVdwkukZhl9CbJpbO23mhdU
         Iaw/Ooh/KhfA6EXAw5XAshXGWewbHnMK+fWhKvfpPgydcVF/V8CHpKgawqLWGlz8bs2m
         g8JOBpMLSmNoNi/0SG6oweewBCqWAVikQCZRi390yUrcZOsgcSallFi/8HJbD4U2C7y3
         BqF+h/0kE9SUbJIULOpwTU9iYgdW0e8LTBjstI8oh7KBlKZVL7H/wg1V9lowWeKJDt5/
         Rirw==
X-Gm-Message-State: AO0yUKUQkGAB7xbwsE0va7ypC9mcaTttBkFDKOv0ugPX5m+wQwFrFL4+
	q7QPNPZvu7Tuo8WUVxeHGASdgnETwG8=
X-Google-Smtp-Source: AK7set/WTsWhWL6JyUhh55x/rsYarAijbTyZ6u+qyv8cN9Z//BNqIdmgRMaJF1wIP1vFyLEqT7ECFA==
X-Received: by 2002:a17:907:7b0a:b0:88c:6345:d0e7 with SMTP id mn10-20020a1709077b0a00b0088c6345d0e7mr25297980ejc.36.1678442070103;
        Fri, 10 Mar 2023 01:54:30 -0800 (PST)
Received: from localhost.lan (BC244571.dsl.pool.telekom.hu. [188.36.69.113])
        by smtp.gmail.com with ESMTPSA id kq10-20020a170906abca00b008c405ebc32esm759549ejb.28.2023.03.10.01.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 01:54:29 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH 2/4] python3-scikit-build: New recipe
Date: Fri, 10 Mar 2023 10:54:17 +0100
Message-Id: <20230310095419.3487056-3-zboszor@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310095419.3487056-1-zboszor@gmail.com>
References: <174B040A85AB843D.27660@lists.openembedded.org>
 <20230310095419.3487056-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 09:54:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178317

Used by python3-cmake and python3-ninja.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 .../python/python3-scikit-build_0.16.7.bb     | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-scikit-build_0.16.7.bb

diff --git a/meta/recipes-devtools/python/python3-scikit-build_0.16.7.bb b/meta/recipes-devtools/python/python3-scikit-build_0.16.7.bb
new file mode 100644
index 0000000000..c033c56bad
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-scikit-build_0.16.7.bb
@@ -0,0 +1,21 @@
+SUMMARY = "Improved build system generator for Python C/C++/Fortran/Cython extensions"
+LICENSE = "MIT & BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7c96d2b08b3cec6d3c67fb864d1fd8cc"
+
+DEPENDS = "python3-setuptools-scm-native"
+
+PYPI_PACKAGE = "scikit-build"
+
+inherit pypi python_setuptools_build_meta
+SRC_URI[sha256sum] = "a9b9cc7479b71e6c8d434596dfade025253aae23adb22a9a2d85850fd51cecfd"
+
+RDEPENDS:${PN} = " \
+	python3-distro \
+	python3-packaging \
+	python3-setuptools \
+	python3-typing-extensions \
+	python3-wheel \
+	cmake \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


