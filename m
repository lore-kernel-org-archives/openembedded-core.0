Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90640C5B572
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 10:06:15 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9737.1786701973179166459
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Aug 2026 03:06:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=aCtDlsen;
 spf=pass (domain: snapchat.com, ip: 209.85.128.43, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so7986015e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 03:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1786701971; x=1787306771; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m4CsjNsOQ+jvDcBgMDcCcrr80thaRKk+h6HkVmXvhwE=;
        b=aCtDlsen80C1lEkohCBcRkuXOeuSYbXyxvut429Zs7kZ0j+mjr/NbWcXpXv671c6KU
         7gnmadKZAxeK2upOPLqRK+N46Oyb015Mb4akZyXLiTFJeH63o7zhTTvDl41qnvq5KUsi
         x6ADKd0wpom0LqRyAn5jmaHqVbWg+RuMcm82w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786701971; x=1787306771;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m4CsjNsOQ+jvDcBgMDcCcrr80thaRKk+h6HkVmXvhwE=;
        b=L8dNpW6KCV9ODym3QHgMFRT1ttd632AePyUuXLmUCWYmHYdL68yum3Gu4GXCYZ5+Lp
         yUZ38egbgC49udETlEY+JmjcutozJA4S6b6xuui0aoI+kPjZ7IwQnr3FvlgaCuWowtoD
         74jlkErcDKo4NOWsgDYdDKabevjE+cdKMAWrerCbdRjK+tCsL4bztL9g1T9jEsSt7qpI
         VJEhV8COJ59s+QDD15w1Wv9qANNQKw0x0Licl9hDEdPpfJAKVGFILqng8SIotal0R/0x
         /3w8Y9DWcd7Aw5jfu+W6p3yfLgNX2xxnqOfqFjxj7zE8Rjl9JNvl9JM+nlnx0AhMYzpg
         g2Tg==
X-Gm-Message-State: AOJu0YyJSsYrAs+GGBnnIr66FkAfwH0wVEFTLXFGLKvUzOycntQhQUVh
	Y0tS/Sn+KexgYa5u5kXedTLeT+RWvHTpgacBKv6O7NQCj2j7CF4PhG70HTwFJbPs5YmzT9LuhtK
	pj5I51CM=
X-Gm-Gg: AR+sD12jXauo+2FmSHMZh7fiPzm4EbnnmIHrYwDdKfrastuGAqgzAsn1nla0YUYNfKg
	ktDZiry0IyYH374p9PogXiG8hJME9uQzSxuSCuysek3hYy3K/sW8FPXonKgv0IJQjgHL6NY8hy+
	5a6qHIDP6gUVV2EsH4YtUX2ERsnoRWSK3gYRVvrZQMsLycL7parVavx5thaBkQlycLn1ZmlBDFR
	r+NpguKf0LQv7pNun4Bk0fgdtP4MnNhC6KUN8lHSll0HxukvOi5uo1p7un5Uf07ESlGFO5DzyLP
	obOlstLx/n3b3OT+Oqh1Ao2z2oOoIPggQFWJkqpVcXUWnNC7whM+gDLG5SS1OIR9ucktcmGu+E6
	vY8uq7rw1WuTbLss0Kopd7NQ4CtTQVhLSmjb5Bos0bx9h+rqmknNLI1EPYDR+pTLpPLicdX5Vis
	B6hz0zC5DZNHsDakkIdgKLStCouPimIjZHF7E3P+nTUGmxI48xk14K2kMoZUZLjCiA5cuB+o8nY
	HkuGm2dAr3Uc3ed3yghCGZHqCf3IBVokN8RJk+pdYTu
X-Received: by 2002:a05:600c:8b6b:b0:495:4689:1e98 with SMTP id 5b1f17b1804b1-4998795eb1cmr69301435e9.10.1786701971146;
        Fri, 14 Aug 2026 03:06:11 -0700 (PDT)
Received: from lj8k2dq3.sc-core.net ([85.237.126.22])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f2c0a75sm7362013f8f.25.2026.08.14.03.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 03:06:10 -0700 (PDT)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Etienne Cordonnier <ecordonnier@snap.com>
Subject: [scarthgap][PATCH] bitbake.conf: add TMPDIR to GIT_CEILING_DIRECTORIES
Date: Fri, 14 Aug 2026 12:05:55 +0200
Message-ID: <20260814100555.856374-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 10:06:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243431

From: Ross Burton <ross.burton@arm.com>

We export GIT_CEILING_DIRECTORIES=WORKDIR to ensure that git calls
inside the builds don't find oe-core when they're meant to be looking
for the git repository of the source code.

However, this breaks for recipes that use work-shared (such as llvm), as
their working directory is outside of WORKDIR.

Solve this by adding TMPDIR to the list as a final catch, but keeping
WORKDIR first so that git will stop sooner in the general case.

This solves reproduciblity problems in LLVM, where for example lld's
version string would contain the URL and commit hash of the poky repo
being built.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/conf/bitbake.conf | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index e20b17fad6..3fd442edbd 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -786,9 +786,9 @@ export PKG_CONFIG_DISABLE_UNINSTALLED = "yes"
 export PKG_CONFIG_SYSTEM_LIBRARY_PATH = "${base_libdir}:${libdir}"
 export PKG_CONFIG_SYSTEM_INCLUDE_PATH = "${includedir}"
 
-# Don't allow git to chdir up past WORKDIR so that it doesn't detect the OE
-# repository when building a recipe
-export GIT_CEILING_DIRECTORIES = "${WORKDIR}"
+# Don't allow git to chdir up past WORKDIR or TMPDIR so that it doesn't detect the OE
+# repository when building a recipe.
+export GIT_CEILING_DIRECTORIES = "${WORKDIR}:${TMPDIR}"
 
 ###
 ### Config file processing
-- 
2.43.0


