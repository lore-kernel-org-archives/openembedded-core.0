Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D793CA600C
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 20:44:40 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5182.1791319475182939548
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 13:44:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=xy+XkpVc;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-487049569b6so878719f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 13:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791319473; x=1791924273; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cnBf3cVYQgiLwm3FRyl/LLlS1cl/Da76mPjtnZMhoVQ=;
        b=xy+XkpVcjwtinj7mm87AwvKFjb3fYCiI1i9Iq9G6m5Hal8xH0RLVKCd7FewcnPnWfK
         PcvTD5AA66/7IyX4c2P1ps9iigMYj+Mt0gmTXinHnKrbhzIx1g3JfKY1wRYh3SMA/fC3
         8lShifm7vybQurj9iVi5rzGzNUp6wNaq9eEuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791319473; x=1791924273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=cnBf3cVYQgiLwm3FRyl/LLlS1cl/Da76mPjtnZMhoVQ=;
        b=n6DF1+4Tx8TljG0rcYX1kEyzS5Ei8Ljrc/I2X+IJV7cbf8UISmEcGjuqFc8xujB7h4
         3mnfL/RHtHPlBnGFRf+BZ58UtHjuebPkd3KVqT7d3UpF/dYCoQH7H3+6RxOzW+MR9PSj
         TO0EPgGmDrniCZ43SJBNsgzP4LaK/ljjzCgU/kNmXZG5BHlXaZ/COPlDhzNCxPS//PTE
         ZHXslrdjZ5jdm4K6zzMSFlQ3jX+fdOntzXHhIKuboEPftvZwnzjyiUPeD6oM1yz06GVB
         LDjFWLS9VWXrfXCDA+c7BJqGB5hJCuX6Sn4wCUiW2ftH3nUKfG2e0uQtXMHDYWLIk2m1
         x7mw==
X-Gm-Message-State: AFq9FYL/v30eTwnofthxmhiJrOWnTzvqWFKbjlECOCIMH2M9O7iWGkJ0
	QyghXvuOW6uxV3yHtYUwHECzdgbJBlHh82kVyinhENKmT5VQ8AT2fu8YMzNeJ6rZu53bTW1wdL5
	VKjaGQws=
X-Gm-Gg: AYBFou316DNWe9QfHnnfqk/ww4aWvuynRYdyGChyT9rd8Z94qkFgxTOZSL7AS5dm8Hp
	RA54p1Qqcdbxp4k8fhy6psUjoBLODOd9sxThgZgWw8tUSY7Ys+YQMNMR+ZHaCuK0dY9gXD3fig8
	3E9FpGAlPUHezg6TOdZ/Q+TVDBQ10EXZzron0KwTKhJBjC5bAc+UErHel2UUuwOkWJgMI0ZZ8QT
	BJFGVW+PGxZYBeS+KaBj+xxEZtPzje2yIHvcUz0+S8xdO23zzlv1eAeBpXtZNYP3PuVSjee7FrZ
	Fvu4demhGeBQhLOPBR3+Kj0XkycJwaPLJba5M5k+MDUVKSEoZeNiDMj8J0eQNBFXzcs9tvlgcH4
	CjNxIkBnWX1+6EWZdA4AoCp8Q2P97aPvM1FM1/tbD0KgTvJV+VduCU/21TUyD5bXRm1vkuhZlL7
	b7bD/YRh3dJ9tLTapgoLer8T+Ivjz26EUsJLsQhM1c6KCTjV9Ws0cSDkLG9ssLIos62ny+Z+ISj
	3ulRqn6Rc/ad3lWhRLBewg4zuCkWMXJEq8avzDj70h4n26sswD4am5gpF50jqUtAGw=
X-Received: by 2002:a05:6000:41ce:b0:487:baa:aa6b with SMTP id ffacd0b85a97d-48c728992efmr837821f8f.43.1791319473401;
        Tue, 06 Oct 2026 13:44:33 -0700 (PDT)
Received: from FRSMI25-LASER (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c7273b5e0sm997338f8f.14.2026.10.06.13.44.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 13:44:32 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail v2 15/18] python3-pytz: upgrade 2026.3.post1 -> 2026.4
Date: Tue,  6 Oct 2026 22:43:50 +0200
Message-ID: <82cae8f573df55eda0cb9a5e6d02715cc89b1050.1791318909.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791318909.git.yoann.congal@smile.fr>
References: <cover.1791318909.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 20:44:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247352

From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>

Full changelog:
https://github.com/stub42/pytz/compare/release_2026.3.post1...release_2026.4

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 79cb8f719518a5a4134dc17546b6d8cbe3c6bc8a)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../{python3-pytz_2026.3.post1.bb => python3-pytz_2026.4.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytz_2026.3.post1.bb => python3-pytz_2026.4.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-pytz_2026.3.post1.bb b/meta/recipes-devtools/python/python3-pytz_2026.4.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-pytz_2026.3.post1.bb
rename to meta/recipes-devtools/python/python3-pytz_2026.4.bb
index 72a74db3577..4a2eda07a60 100644
--- a/meta/recipes-devtools/python/python3-pytz_2026.3.post1.bb
+++ b/meta/recipes-devtools/python/python3-pytz_2026.4.bb
@@ -7,7 +7,7 @@ inherit pypi setuptools3 ptest-python-pytest
 
 PTEST_PYTEST_DIR = "pytz/tests"
 
-SRC_URI[sha256sum] = "2211d3fcf9a797d3405cac96ac7f61d80e6a644f72a3309607282fe8a2010c5d"
+SRC_URI[sha256sum] = "464303645bafafd72418898368b2429458f709cf1eb6a15372fbcc396b64da63"
 
 RDEPENDS:${PN}:class-target += "\
     python3-datetime \

