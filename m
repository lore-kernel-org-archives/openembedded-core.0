Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69206F8DFC7
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 21:09:06 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26629.1776373740532871935
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 14:09:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Ht0vCvsf;
 spf=pass (domain: smile.fr, ip: 209.85.128.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-488afb0427eso99592195e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 14:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776373739; x=1776978539; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0uHzev+D2TX5lx68FpEJum0Jy8kOUbQhyO7z07ltsbM=;
        b=Ht0vCvsfjkNxfWRzqZc+OCi0juwOB4a4QknPnOlWAVqfLnj70L6S0cHhcuATePF00/
         TVtQCXnYiANPXCyh9sROYwvMElNmbPijePSzKAiEQITh3mfFuUuQ6UeGC8RF6IBiqwz7
         rVaoIXog7NQ7/9RAewIe262b+lWTASHGElskU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776373739; x=1776978539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0uHzev+D2TX5lx68FpEJum0Jy8kOUbQhyO7z07ltsbM=;
        b=osE3oo2X3sNbwQab37tCgkLMzkiNtihwXhzDQSI9i6bDG7UWi4qSKtdcpTAfdtlJgZ
         AGLNnJXbRIzkGLW1ClOu2GwC4tqOyaJMvqiTyeq7qXcRnymWBVaEMfGDL7QrlUMyUNx/
         guQAeEUKgLZzm7dQrR2FvYSgi4dOCiR1Niw/wDdOH5IOEgYgtDXxP3x4M1zbonAyl8wJ
         HlICEaA+jL9xtISFLyp8z/LZOuNsAchlzFhycPRB1ZPU0CsE5wGzECKerEfI5/fKzvdy
         rQGCRXFlBssAEu77XAwj2F9VgzppmaMbo4Mt8tyUr3g3mp5F+q/VHXY3y19jurHnSj/u
         IdHA==
X-Gm-Message-State: AOJu0YzGCUhq1r8ZXVo0iGlKpGVRl2XBvAO3NcZcHssk2Gp8QwC9xSnN
	YCMSvX9PK1I1NEzJhB7IJ+NeBQFZPooPuRDghNd52klS0Ltk04Mln2+xkIaBekK0PhosjHgLoIy
	Q9Z7cqQ8ifFr0
X-Gm-Gg: AeBDiesiL/8t/IRzVtU9bADEpHVoIsjYKzgRIiqEn/ABczpwzWWfEEULiteDDopJSDe
	HJlVkoXXONP+Rwnod5L2xV71z18bggAhCxM/pwa2u4HXonr+BpOVJ/7ql0cEmo5TO6yHUSMQJC5
	DPcguNRvY3Jba1KI2s4B3iyL/9pukIWhUtLdulTfDs5Y+hVnxvHLEjHROWaL2CnyNFg+lz2Sn4X
	9LFShazP5oZ0bLQ+OwoNrEFwvd3GUNNl8yDY0cUVLXwW5KJDrCN0vCYHyW2QqH6nz3dDVyT+JOQ
	wbJViCLYLV5GQB1LVWrqIUawbq3mf4HOujJP1s+R81QiThqiX2teBdMkiDtNVkjsxjHvjsgCuUv
	okkSYcn9uxu3sI8/KQ5IXNIvTx3+m9d+/ZMF3SuI8AmeZiwRL9pMX87077iBtpbtjvjie9DL79E
	fioCiOSdxqsFtu/+WovelTBhnGH2PdMx5nreDx4tHLWFIlxKWrzmyukGCDb5uzqK41GGuUACMyI
	FS0mVFwckgrj/Y7VISSeHxa7MHEHRDgMOYuXw==
X-Received: by 2002:a05:600c:620c:b0:488:ae6c:42c6 with SMTP id 5b1f17b1804b1-488fb7786c2mr2822345e9.14.1776373738639;
        Thu, 16 Apr 2026 14:08:58 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb7c2167sm944985e9.36.2026.04.16.14.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 14:08:58 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: OE-core ML <openembedded-core@lists.openembedded.org>
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH 8/8] oeqa/sdk: Default to https git protocol for YP/OE repos
Date: Thu, 16 Apr 2026 23:04:01 +0200
Message-ID: <20260416210836.1336162-9-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260416210836.1336162-1-yoann.congal@smile.fr>
References: <20260416210836.1336162-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 21:09:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235426

From: Yoann Congal <yoann.congal@smile.fr>

Following up on commit 139102a73d41 ("recipes: Default to https git protocol where possible"),
> The recommendation from server maintainers is that the https protocol
> is both faster and more reliable than the dedicated git protocol at this point.
> Switch to it where possible.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oeqa/buildtools-docs/cases/build.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/buildtools-docs/cases/build.py b/meta/lib/oeqa/buildtools-docs/cases/build.py
index 6e3ee94292b..9f963f18f8d 100644
--- a/meta/lib/oeqa/buildtools-docs/cases/build.py
+++ b/meta/lib/oeqa/buildtools-docs/cases/build.py
@@ -15,5 +15,5 @@ class BuildTests(OESDKTestCase):
     """
     def test_docs_build(self):
         with tempfile.TemporaryDirectory(prefix='docs-tarball-build-', dir=self.tc.sdk_dir) as testdir:
-            self._run('git clone git://git.yoctoproject.org/yocto-docs %s' % testdir)
+            self._run('git clone https://git.yoctoproject.org/yocto-docs %s' % testdir)
             self._run('cd %s/documentation && make html' % testdir)

