Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16E4BCA5FFC
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 15:46:50 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48870.1791301599925390454
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 08:46:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=T3+musbb;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48c5358fc28so1745778f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 08:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791301598; x=1791906398; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cnBf3cVYQgiLwm3FRyl/LLlS1cl/Da76mPjtnZMhoVQ=;
        b=T3+musbbLFOvSJz+mkNXtgZ9NdorW47sh7vFYacRoKoDBO5gspi1TOErkIRQldm+3k
         L8fEVE76oOkYIuHixR/4G9m3i9ypbJ0yFr1yDW5NXTKHfRLEayG2Y3KmwMv4os+yAYbD
         IlClPLmnd7accneyvKltu2wNV2OhrQxu4bGy0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791301598; x=1791906398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=cnBf3cVYQgiLwm3FRyl/LLlS1cl/Da76mPjtnZMhoVQ=;
        b=Hsccju+dTQ45aXcDRQ7l6ej14lsyq0iVZ4cSUFQcEXrpmWGgC9sAAh4LFqojztBiYV
         Sr62oc8f3y406Wu+fiHzOaQEYt1BCfPPUBKRO3pIU+fhXWyI9xKe55ykOhNhGRno7AKG
         0s2zPb4PVPNcouIOx1yBEBIVrF4R8ZtzzHMAs+eYO0KTXg2J9mWtlFXElgkfqM5JWTvN
         eLhvvn844xdAC8n8QXnOkhNvAGLs+XOy4JR0xomUYZol9DRXyE0y6OlQhfvCIfDUQ5jN
         38Accr2nLwsF60BZLOt783+GBVIfQ6FKfbL8jiQ/ILvzLpxr2zcW3rl7CAgEA+dRJSG1
         sPtw==
X-Gm-Message-State: AFq9FYKw2D3RBd2wollKX2V78RuOLKBBE0c9oM8aDWnmWeDiaps5QA9K
	hDjBTyG1haZhny60U1t9v3kghpvsDtZkyIoesx0S654T/ZEmMFw8u1pPUCOADORHcAeojVHGiPE
	YIklWmOg=
X-Gm-Gg: AYBFou0yUfojkI/6Ud3qHwCwN3TWXJM04ykIkhIZTXubsSTzwkJSBKYIsf1Zb50z11+
	xuLuhpfvUMXd02X46NjTL93IJtUKiBD6PKYYiIU/i2QsaZiAty5fh38GyP9XfsQN5BFp+KlaC6X
	ybnMYG/EjKGfNmcEh1sjp2bMElfd98T13QWZBw5zY7+0hzmKkKtccqLeux6r4NG60Lic6oz9oUx
	gsVYRtNk+0wCr/WtnREuGcTRlu7W69PD0qnCSFPgKHfLveLSBdZJzo+4GCL53rkpd5lRULNL2xa
	ySPPQpzb5YvguMppvAH3sNVTQ5VF7y4UcjlZEgNOVm/LDZpNlz3q300mBs+N1O2q+hn2W1h+r9Y
	kyaIcbZRr7nzq1N/UlUqoXQgAuTV5O1oRaaMAffeiauB08UKWD00/gIo4/92i3tm5qH/8jV3vS0
	pGJuWFGlUqlI1zJZGk46PioNtUWi77w6pQNJjQL1T/tfJuMuFJK399+0tEoFCHdFYEoB02dSj5H
	lr1npUJdF+KFc0WcWbG4uSlxxlAr8/qf7PNFsXhIxh2uw4P2Ma1L+KPq8uH7kmHFuV8lR/FUWuo
	ZdJmFQ==
X-Received: by 2002:a5d:5f09:0:b0:48a:f464:2cc5 with SMTP id ffacd0b85a97d-48c4800d152mr20099181f8f.37.1791301596662;
        Tue, 06 Oct 2026 08:46:36 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d3032csm257281f8f.45.2026.10.06.08.46.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 08:46:36 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 16/19] python3-pytz: upgrade 2026.3.post1 -> 2026.4
Date: Tue,  6 Oct 2026 17:46:02 +0200
Message-ID: <2f796944eecaa93ecb062c19a2007e60275325b2.1791299195.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791299195.git.yoann.congal@smile.fr>
References: <cover.1791299195.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 15:46:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247306

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

