Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E090C61DDD
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 19:38:33 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3061.1787945910106754741
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 12:38:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=T6gcotOf;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so15266755e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 12:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787945908; x=1788550708; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DEW9sjU/D5AIrlcvwI4Gu2l+YRMm38w5g0b7sET42DQ=;
        b=T6gcotOf6TRhgsjGYv1z3ED8/iE/vGNwRF/yO65+lvzaPf7PX6g/S61KUjikVo53Sm
         0WQrs6cjWI5lA1aFAPBekO0HLp21npuMqIgLfcJD+ECDxvGy+oo1jSQw7Xm4QH75OXQ4
         aCYdIMDlB8jTnq96QFpSsvA7DkJIPmBB+nPP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787945908; x=1788550708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DEW9sjU/D5AIrlcvwI4Gu2l+YRMm38w5g0b7sET42DQ=;
        b=ej4qNL1RVgnw02sXLHZf6jlPDI7JnNmyo8wgrV0O0vbupB3qxGMYu4O7k6ao25UjF0
         vTPCaNW4Ok8JBKYuexaI+PDSXo7zJ/fXEEmToSBqRWJnbzwCk1y8L5OZLyntjPGZF5A7
         SXErCpHe0U+/IvCG048T25bvg+4ENcleNHKqqik/zu7Mx8auEQiY7WKTBVEJyYtCsezT
         EhTClaK+e0V52CQnqvNzIXcdRsuuZQXYVSakzIJ6ihBRp/3BFFZqmniRH8Iw6Nphv1eV
         GxWZx8102JthHuYweBVXjFGdrleRV3ahY1fNnjN1KpBM/Jg7ETThpfr6uUH4bXuFuNPw
         pQtg==
X-Gm-Message-State: AFuF++nWUyBnXXUggMrzRzrwgJbfl+KKDoxaEeKHPYSEJ9c8aQwHB0Ui
	Ztt0NZRFBfIIY3Xq5LbBSXVoGoaDQHGIpETGxojAJsf5nMXM0jN5V0mcojRSYKmLzICzwY0NOXO
	99KudnvU=
X-Gm-Gg: AR+sD123m0ZaYXbL/QpODmUAyy4/5HxgpOWOxQDGs8FYTzGhaaYn5/D1IhI6NaeJr/u
	m1N8GuD9vCR7RauxgZSlvwkJGmfROhdSpaFRUvstLXwhw5CVKc9QmtNsJfUbns4EVufAXZLOr1C
	VAAdECY5Wk3PG/EJHcXNuQPxBQwOZ6cqDSoBaHsJ8OKhTZ09yqAkNhiG4a+St6P7wCXYtHCl8kH
	DQ/NX89p6NSyAH9n04XtNLjPEj6SbN9cvahltwwPdm30cNPcC9Xg56zCx8atv7XvYfymIxhBUTh
	ELzErhSCCiIIB13kZ8r9of5XIfL/vfGm/BIIqdM/7WFkSY3DeSXPOEvGRaj6TCdx+R2NjxHygpo
	9XV1KsW9xjYHC6U8+XfFX5Wms5ISGfsnntq67Mwq/nXQ7e7c+HdgfeixPwADvrXTcSuSiZ0XdVl
	iw2nUfyHbhegUhsByQ1qaVnOX21pZB9oxjergPvjNcmLJnwaZIveFnz4KAVon3v9Lymu+iBFa7N
	j+KrLn/SBsqymMW7Seb4PBbvpGopW9IqtyGq0+2OHNVlmLXNoIB9ztcL9ty8f4A
X-Received: by 2002:a05:600c:3155:b0:49b:910c:7703 with SMTP id 5b1f17b1804b1-49b91c3dcb4mr138755905e9.9.1787945908347;
        Fri, 28 Aug 2026 12:38:28 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm147703115e9.4.2026.08.28.12.38.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 12:38:27 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 42/56] p11-kit: upgrade 0.26.2 -> 0.26.4
Date: Fri, 28 Aug 2026 21:35:52 +0200
Message-ID: <2828dc2abe3afa1c11164c4937570c9fa1a23f06.1787945536.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787945536.git.yoann.congal@smile.fr>
References: <cover.1787945536.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 19:38:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244603

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 4e58b57cdc5e25d6cb12b658f09fea7c91835430)

Release Notes:
* https://github.com/p11-glue/p11-kit/releases/tag/0.26.4
  * Build fix
  * Update translations
* https://github.com/p11-glue/p11-kit/releases/tag/0.26.3
  * server: fixed stack exhaustion via unbounded recursion in RPC
    attribute parsing by enforcing a recursion depth limit
    (CVE-2026-13757)
  * fixed confusing error message when trying to store an existing cert
    with trust anchor
  * fixed assert when parsing p11-kit files with value (")
  * fixed numerous memory management issues
  * Build and test fixes

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../p11-kit/{p11-kit_0.26.2.bb => p11-kit_0.26.4.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/p11-kit/{p11-kit_0.26.2.bb => p11-kit_0.26.4.bb} (97%)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.26.2.bb b/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb
similarity index 97%
rename from meta/recipes-support/p11-kit/p11-kit_0.26.2.bb
rename to meta/recipes-support/p11-kit/p11-kit_0.26.4.bb
index 5f553f11bbb..5a42d0dc508 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.26.2.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb
@@ -12,7 +12,7 @@ DEPENDS:append = "${@' glib-2.0' if d.getVar('GTKDOC_ENABLED') == 'True' else ''
 
 SRC_URI = "gitsm://github.com/p11-glue/p11-kit;branch=master;protocol=https;tag=${PV} \
            "
-SRCREV = "8e6e4e6d64d9fe91c62b0052c105b2b72d4c24ef"
+SRCREV = "a14788849d1ef44422d679534a13821eab5bb5f4"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,libxslt-native"

