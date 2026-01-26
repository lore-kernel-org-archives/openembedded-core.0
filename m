Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD705D13C1C
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 14:04:27 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20082.1769436263788948303
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jan 2026 06:04:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mTYO6QpS;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59dcdf60427so5347329e87.3
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 06:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769436261; x=1770041061; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PwDLYBmYpFHwGxgFW5QAmSil1XBLm4RpsTRh3XBgfMA=;
        b=mTYO6QpSvvMUhkzqaALsYhZtjpah/uv+T22HZntM6b/FeG+s8eekBpxWqFRCKOQc15
         zC7OCxSI04M4lCTAxvWXnxKn+c0ZCIqUlPKekkC/8wwGXov1+DLORgaYnjIDr1lUZ938
         jslU4i/u7iUvVezLHk4NXaR+AR+R3Vo3nCnt5LlwMBZ+z8Psb8XKzgMjb3pP+rIdkasN
         yM8aA2oqdQOXH1fpXak0eqaxTXrgYCz9oekvuSAz3llNZlVH7Ity4pmVsJT/jcaB7eYg
         LpLT1U0X8HVE2i+ppHLe16sAWIQjTW4DciIzbaAWXs9ICGjcfRi7k8M3lNmKTGebbWb7
         20oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769436261; x=1770041061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PwDLYBmYpFHwGxgFW5QAmSil1XBLm4RpsTRh3XBgfMA=;
        b=t+D9aeKaXBNCqf6NpMP6o+sb91GVvg1MgHDnvTqXgJU9mnNoY6geKMICZFNAbhEXXx
         MjPrAYEc0dviRsQ6PULbOfRP0l/Yejmo/Nv7VieIll6muboX9EiJZ8/qpYJ3JKkfTaB4
         4WqBR7yFjU7bmkGkmnEp7cQURyRa54+CQxDBOP8knYZzRUuttceZPiuWEsrhdV2PvGEt
         YTPL4IU4W2/4RkunMyBa2svE5pYu0qcXyR6PHPUoDjvk3Vv/51dbiwGVfGw8crJ2ekzt
         jwB7pfa77g7VMQN9YTJTRIxl3o0gHLjo0CL46kJATERd91X9WCqz/t5i63jtIroo65YS
         AxiA==
X-Gm-Message-State: AOJu0YwCw75ufJyV9bP6DPhxDLNCXBET44DNTqjO+VZF6dm3JF8iOvR+
	JRk0O2o1xV0tcSugCmzgIRwIgG3og9ubowulbkwp86uRwUZujpa0PGr/owfqQQ==
X-Gm-Gg: AZuq6aJwSOfZ8xDyoVrUk/lIO2DOtGCGzpfvYyqv0Og4XyrEeA0Djp4bKWweQWlLTXR
	qsNPhPml4Z1km1WE9DPMpAePoO+GwYVd5tU9VjDum2hQ8+v/SBjP3RB5HZptOM1F9KoLoh0/UNj
	zBcr/w7KQOX2lQTeMzSOvCt9VKuDIB0oRQvRJdKBx/d5vf68XHfv15kfa50YliPbDFGAhpSKNJA
	pvwW5OkCwmUiVu+5l1bWK6KPHTKGszjM/nVfQ6mBf7yHtMxGttZx2ePYu90Hsd391C6LLUjqSHN
	g8H3QgcPH2HGsog+x6UXqOUEBFsM4rVrukh9RQiq6/1bHURjFrUETyuvC7B06Yq2xowt2w4CTbI
	OTrTMF+OktaYVltnjmXPVh2GtP7bCuYDsqzlRdJzBRf42ekk4Iy8gSrtAR/MoZUTPIKIuPt6Bri
	uVM0ioNje4vyiUW6OcuRdSYC/mWB5T7EuM7xLNHvpBY4+ub2zeeH4RxSJiCTCFFNrGZWQqPocp5
	aSI5J+hf4dDyol60RxBwtE7jIXynGOFHw==
X-Received: by 2002:a05:6512:4022:b0:59d:fd41:d6e8 with SMTP id 2adb3069b0e04-59dfd41d6famr436189e87.34.1769436261190;
        Mon, 26 Jan 2026 06:04:21 -0800 (PST)
Received: from peterliu-precision-5680.emea.group.atlascopco.com ([2a02:aa1:1159:3a3c:c72a:e3b3:afb9:5640])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59de4918f87sm2821599e87.57.2026.01.26.06.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 06:04:20 -0800 (PST)
From: Ming Liu <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH] elfutils: fix a compilation race issue
Date: Mon, 26 Jan 2026 15:04:14 +0100
Message-ID: <20260126140414.11731-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 14:04:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230009

A following error was observed occasionally:

| in function `_start':
| /usr/src/debug/lib32-glibc/2.39+git/csu/../sysdeps/arm/start.S:118:(.text+0x40): undefined reference to `main'

the issue due to build/src/readelf.o is zero size.

it can be fixed by inheriting autotools-brokensep per test.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/recipes-devtools/elfutils/elfutils_0.194.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.194.bb b/meta/recipes-devtools/elfutils/elfutils_0.194.bb
index f7963afcbe..5d81fadbdb 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.194.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.194.bb
@@ -26,7 +26,7 @@ SRC_URI:append:libc-musl = " \
            "
 SRC_URI[sha256sum] = "09e2ff033d39baa8b388a2d7fbc5390bfde99ae3b7c67c7daaf7433fbcf0f01e"
 
-inherit autotools gettext ptest pkgconfig
+inherit autotools-brokensep gettext ptest pkgconfig
 
 EXTRA_OECONF = "--program-prefix=eu-"
 
-- 
2.43.0


