Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90D9EC44506
	for <webhook@archiver.kernel.org>; Sat, 11 Jul 2026 05:24:53 +0000 (UTC)
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1288.1783747492070704638
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 22:24:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=jMbsFOkN;
 spf=pass (domain: underview.tech, ip: 74.125.224.47, mailfrom: vince@underview.tech)
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-6676fc59e59so2314189d50.2
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 22:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783747491; x=1784352291; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YVWY+7oyGR74fbj3+Z7rI7dybeM6Qu3VtU5VYxAfUsA=;
        b=jMbsFOkNNiwYXQ5mNY9hJfMEaWBi1BLc6PyFlUC0jrN2Q2zeiuZX0DCMZmVILdNUWQ
         ehqO2oE+8nV7iKyAfqk3rr0WlFohHWCDQoO+V/9Vxnd5oci94qm2896YAKB0BYfxvSse
         wxtUr/iUNjRmSwBtWfI5RKblQuTVEEpcIPyZfuteB5t8ulDhmOraAVrCtFvjDYs7pjyi
         SDU78t4oNJj9AQqMFiiLckXV7ArqOFuBCWHQbZpkBPw3b+GKEQ18DdLxNZxLOZtGamZj
         tTVDArsv6R+E/yc5WIbTUp+h9RWjFSAVHIq/j+t39aMxA3URn9uJoP72bUr/Bex65wk0
         fE8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783747491; x=1784352291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YVWY+7oyGR74fbj3+Z7rI7dybeM6Qu3VtU5VYxAfUsA=;
        b=Jj52YAmQUUq71hfevpoaSwY/hxymdsCa5POJaiGJuZMp9CwEDuozcFCgYhrNyHqHp8
         QittelnVs/++EdrLhLzzkw+i9QXktA4gBv4zU+Olvo3oB7j9Sx12INLaVse7oE2Pjguu
         yYfInmuPyfcNK1SeLBjje9bWi3EFwPMwkfm0csgIsp5FRKhgK91ULJIryQLsW1BvmU15
         Mb0EpZ4OhwQZGNZQQnKNA3FmQ5OfYMeqeUHOV5+gWQFmJMdRK58N5WqynN4BeCvpUjI4
         ESAyL+bHt5fRERMHU3W4LZbqyvCHMYFJtRVn4f9ENg/ncxs0zOPjbs+pf3jkkwtcNjA4
         /VnA==
X-Gm-Message-State: AOJu0YwttbtwxGhMU7gtdrPZYExHPow4x7v0hvfWOQ9iN+HekRgrM0a2
	3mtMzlGe5SCH4RvxtO+TmIVHzHmp+hpNlrQLIpXkua6miKTjQmz3g2lws5Sy00erF5tna0E0LFV
	+D2S0SUw=
X-Gm-Gg: AfdE7claxH7kaVF1vy6CB0eMCH1jaaMc7zT6A0rXCR+eDtLTddh1Q4bJzPMaOpng5al
	7/7aCGSFPhOtezdvEtOjQst/rBw5vn3r4HVq7LMB62AcXzXAP8W6n/elhndeE4ca2gVugBxNqwS
	kuewaqNzKM8VjXWBlFi10Od/T4/5DhtJxa27B9Be7jTu4ihgWciK+/KEimDIUove6pJtiGRL9fs
	XrNFQFx5GomF2hVP2fL7X774hRkS4oJhByTh4Usl32ZatZMIyF/ug/emvYMIZqCax0BsX5qPKa2
	Vr8uugxbYjVSZTTznmh4YRKahYkHsRxczvzo8AIz1/pYuGWBwtsx519x8jYVsi77/k9+qz56jwO
	MDHzfxsln25wNqOOscqzbZKzpRagvw3N3ne+ozLPwdqRpKwlFHH5KXkxBTzpK865TAN4cPqYERq
	xsKyqQxTzb5TmHqg==
X-Received: by 2002:a05:690e:4803:b0:662:ebb0:36fa with SMTP id 956f58d0204a3-667d7a949cfmr1057768d50.20.1783747491186;
        Fri, 10 Jul 2026 22:24:51 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66787a49befsm8643784d50.16.2026.07.10.22.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 22:24:50 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH 16/19] efivar: rename kernel prefix
Date: Sat, 11 Jul 2026 01:24:00 -0400
Message-ID: <20260711052403.1292286-16-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260711052403.1292286-1-vince@underview.tech>
References: <20260711052403.1292286-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 05:24:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240697

Utilize preset variable KERNEL_PACKAGE_NAME
to ensure uninformative with builds if
KERNEL_PACKAGE_NAME variable were to change.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-bsp/efivar/efivar_39.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/efivar/efivar_39.bb b/meta/recipes-bsp/efivar/efivar_39.bb
index e5839f7a99..9c971c4d9f 100644
--- a/meta/recipes-bsp/efivar/efivar_39.bb
+++ b/meta/recipes-bsp/efivar/efivar_39.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://github.com/rhinstaller/efivar.git;branch=main;protocol=https \
            "
 SRCREV = "c47820c37ac26286559ec004de07d48d05f3308c"
 
-inherit pkgconfig
+inherit pkgconfig kernel-vars
 
 export CCLD_FOR_BUILD = "${BUILD_CCLD}"
 
@@ -28,6 +28,6 @@ do_install() {
 
 BBCLASSEXTEND = "native"
 
-RRECOMMENDS:${PN}:class-target = "kernel-module-efivarfs"
+RRECOMMENDS:${PN}:class-target = "${KERNEL_PACKAGE_NAME}-module-efivarfs"
 
 CLEANBROKEN = "1"
-- 
2.43.0


