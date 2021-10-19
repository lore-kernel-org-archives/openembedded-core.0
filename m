Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 502F9C433F5
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 19:54:27 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.15514.1634673266238515072
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:54:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=DAvyQlde;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id
 pf6-20020a17090b1d8600b0019fa884ab85so708051pjb.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=GO+Xq5fdn120YUri59kBvOYtRwrWE8XGoqkHU9ETaAc=;
        b=DAvyQldelhAQcTgjNVqUBxqfH8A3h93S4eC8xuWqzqCX/xEPk1W9SJWp1rhZ/Rew9e
         Tatm4bX252cJ/oosvtikkOk0QnP01oTnou/pV2EWTH4e3K1NVKYqOvAN+BmF/YabNPDd
         luVbHp37Hk6lrN1mN2FGhsqkBmwVIklhqbrzxlbyYuy9XVVxFbv0qZCAVVKgdkvAZgf4
         7dCFJf5vPELCKps2sr+8GW0Fk4RC64GZWW97Df5lxgPkLPhV7+eFwkXewkbfKInzW1bs
         Gxk49fcmkmErJpBaJ9849RpHy+KRonxyfTw5QKFFh1C6DSGlsVM1peKumU8TyuNfr4bs
         Iu7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GO+Xq5fdn120YUri59kBvOYtRwrWE8XGoqkHU9ETaAc=;
        b=cI+ianXaKd4kXVjz+d7nB9SbGAtimEc7Qr4kOPGHoeU66/9GTC5kz3g0T5Dfuc/gpY
         3BzsfPM4J3Yb0ayY+e4zLc4tUdUr62N07SfqakQ14GBmzfpq4QYmqpRzpiNBiLzXskx/
         GB1J211y4nULQ+ee+pGkqn/AL3Kuhl1lcu2xUm2LDU5t0GjZp/4kX0KDqKTWu8fVjYN/
         bFaK9itpnlPdA77aVu/8p6IsosB0T0ZaZTFVBZN4NcrfpS3Xdu0V/rj8vv15VAEZZ9pg
         3KC5oXF01ikjFTWzj0hGwvaNXPhBbatcILZni9kutfmu+Q8/OM8gjTtnzkDBBEZpoDAC
         xLXA==
X-Gm-Message-State: AOAM530KWKcAvp4p5XTvTdGlh05panSau8whBU+59sD+V4rJMnVYgNu/
	IqUTNb2Pzy1kQrgbfwjL79Q73Uuqz4qQ5+gDbgg=
X-Google-Smtp-Source: 
 ABdhPJwONKX81BopJYeppeYV9U/B/J6/jkvgD2N0aS3aF9FHJbrVyO6aw4V3G3lqd+0110AYlgRNKA==
X-Received: by 2002:a17:90a:7d11:: with SMTP id
 g17mr2125299pjl.150.1634673265304;
        Tue, 19 Oct 2021 12:54:25 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q14sm67104pfk.3.2021.10.19.12.54.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 12:54:24 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/38] multilib: Avoid sysroot race issues when
 multilib enabled
Date: Tue, 19 Oct 2021 09:53:19 -1000
Message-Id: 
 <771c7fe5fff266038954873290f4c785f66c1634.1634665675.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634665675.git.steve@sakoman.com>
References: <cover.1634665675.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 19:54:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157213

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Multilib changes RECIPE_SYSROOT which can make the value in PSEUDO_IGNORE_PATHS
incorrect. Add the correct value, which fixes races over files in the sysroot.

[YOCTO #14581]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 64003e5e1b51c0cd561681b1ac13293546b8182b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/multilib.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index d231107f8b..e9767c73b6 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -11,6 +11,8 @@ STAGING_DIR_TARGET = "${WORKDIR}/${MLPREFIX}recipe-sysroot"
 RECIPE_SYSROOT = "${WORKDIR}/${MLPREFIX}recipe-sysroot"
 RECIPE_SYSROOT_class-native = "${WORKDIR}/recipe-sysroot"
 
+PSEUDO_IGNORE_PATHS .= ",${WORKDIR}/${MLPREFIX}recipe-sysroot"
+
 INHERIT += "multilib_global"
 
 BBCLASSEXTEND_append = " ${MULTILIBS}"
-- 
2.25.1


