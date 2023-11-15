Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3F7EC47076
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 03:18:16 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.4881.1700018288783458824
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Nov 2023 19:18:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=oI55lxdA;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1cc3542e328so48057145ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 19:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700018287; x=1700623087; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CoQYmkKbFuL+X2G2ota++Axb2enhm9OWpjYjt2vqt5o=;
        b=oI55lxdA5RS0FKAr9QN1Ro+DoJRwK6gkRkY9Pas0N9RWNVI5RZBH/OSCyvm5+YzRyc
         +SI+NTsDmypnkm+GdlRFL9YUC9u5tHxC+XAmHu4if8PCFFQldtqE0X3IXTjNcHSS+GqJ
         OjMx9rvlhZIqymLt0dW+MGDmQspUU1WbNPfOg8KEOmG9KKw8bqbWMdmzZfvJQSjzjy1F
         3Hn8bo0OJqfn7I+JDpfprYnQlIco0hbEWKd0RMND5pxK9fEcPYdvfGptz6+fsNARw62s
         QAIL1vbwmgyb+ZqiXkBsuVyXzu0utcI08qmyITRY733yEFnicEsJFa/GJno7CgSRZD5e
         XGgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700018287; x=1700623087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CoQYmkKbFuL+X2G2ota++Axb2enhm9OWpjYjt2vqt5o=;
        b=AVQGt6mQm4nYJNWHVksqZzRNEu5VdK+7yOdg+crEcat4aJGSoo23rEUI3Zgg983s16
         9JWq9P52nvNU/R2k+a1hra0VHS493o/aFZZr/hmBV5ilPbyWiPDyDLGGbwoGg9Z6BUiN
         LrtIqqTi5qdIODwujSwzR/ZjbjiZM4NfQiU7oMEog1EkrDK3Oy1xMLozsjjl1GYPLN9t
         6HFAgqI6yRfdxNbzKCTveo91vx4jjf+GXf48Fw4ahkRheZSh1PDISM5YThRoYgO/YMff
         dUIDOXblXETOKy3tNKt8uZ99h/VPYWQPmNx8lmyK19jTESgh2XYb8X9MpE0pe0DPUGem
         G+Iw==
X-Gm-Message-State: AOJu0YyzOh+wr9/Lgu7I0q+ycSU27R3MVgzm46IAqS7BbbT297faiPk2
	ohOZaRumdqtGR+xf3VIicYd0qulvvxNoH7q6BXWqcg==
X-Google-Smtp-Source: AGHT+IHoU++9+xnkJVyXleQYj68BqZjf0l145fUD3Vv9nZBpHb9cKmvFAliFei3uI0Cj5Yqy0aK/dg==
X-Received: by 2002:a17:902:d4cd:b0:1c9:ea71:8032 with SMTP id o13-20020a170902d4cd00b001c9ea718032mr4424266plg.31.1700018287534;
        Tue, 14 Nov 2023 19:18:07 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id l5-20020a170903120500b001c6187f2875sm6369300plh.225.2023.11.14.19.18.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 19:18:07 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 15/17] lz4: use CFLAGS from bitbake
Date: Tue, 14 Nov 2023 17:17:32 -1000
Message-Id: <af571c0841265dfa4bd87546080e499336a37fcc.1700018112.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700018112.git.steve@sakoman.com>
References: <cover.1700018112.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 03:18:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190545

From: Mikko Rapeli <mikko.rapeli@bmw.de>

Currently lz4 uses it's own defaults which include O3 optimization.
Switch from O3 to bitbake default O2 reduces binary package size
from 467056 to 331888 bytes. Enables also building with Os if needed.

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit abaaf8c6bcd368728d298937a9406eb2aebc7a7d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/lz4/lz4_1.9.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/lz4/lz4_1.9.2.bb b/meta/recipes-support/lz4/lz4_1.9.2.bb
index 0c4a0ac807..c2e24b518c 100644
--- a/meta/recipes-support/lz4/lz4_1.9.2.bb
+++ b/meta/recipes-support/lz4/lz4_1.9.2.bb
@@ -23,7 +23,7 @@ S = "${WORKDIR}/git"
 # Fixed in r118, which is larger than the current version.
 CVE_CHECK_WHITELIST += "CVE-2014-4715"
 
-EXTRA_OEMAKE = "PREFIX=${prefix} CC='${CC}' DESTDIR=${D} LIBDIR=${libdir} INCLUDEDIR=${includedir} BUILD_STATIC=no"
+EXTRA_OEMAKE = "PREFIX=${prefix} CC='${CC}' CFLAGS='${CFLAGS}' DESTDIR=${D} LIBDIR=${libdir} INCLUDEDIR=${includedir} BUILD_STATIC=no"
 
 do_install() {
 	oe_runmake install
-- 
2.34.1


