Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80B9DFF8850
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 20:57:14 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32603.1777064225957558888
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 13:57:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=eGGnbJS6;
 spf=pass (domain: smile.fr, ip: 209.85.128.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-4891c0620bcso53510215e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 13:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777064224; x=1777669024; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NzJtNoexvhkIkcet+RXT40OaVxXOZO0Ior6BVKAsNGg=;
        b=eGGnbJS6oLqg/A4wulXB38elNf1U0YfY5k0U4EQrd+hn/pQ0ZsJMH3vGcTw43jmvl6
         QV59W5hf8VmvoltOTRI9x+ow+2dmh4EqOZcU8hatvWjHp3wgEQ0D/kI8Rx/epwnYIYd1
         YNUwvf6PB7Hir1QDHuq5KqX2REoQozvzsWKtI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777064224; x=1777669024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NzJtNoexvhkIkcet+RXT40OaVxXOZO0Ior6BVKAsNGg=;
        b=SlE4cOdmC3h6C6n1pwHoPHuBTiPuSwA9PaIY1TERd5oQy4C6SaHSQNCE6jAwHdPjVR
         Ft3VVbLjsviZql1MVdpldw/xuUel1jA7RgRgZdjlVGFOeEBL+kx8g0WqtrjBo9Is98V9
         CplHb8OYVCyzwd07ZggHZeGS/ilphwvRVDFe6MuHIhhU7N7YNKAFhMdQGRi0iemx/oBu
         /Lkv4nNF5+FXsn52hCXryrxR4IYj12YpKc26kKNz9/VYE/iwHI+JKS29zd2dv5TEMEpK
         ZeTf/fSH3y3hWjYPEUK3AGERyDxDLoUhuWBsiKa2Oq7aioQX6jGzn+mUG+iue1GrZwja
         2hVg==
X-Gm-Message-State: AOJu0Yw+17ekwkxCf7c5V0AmDywZxvU1Q1KRuWgWvcH9zySb3IWwWggU
	RmuuvVrJ1n3b6jDkbXOg7BFNMW6N6w7FNIH3WlrZJwwTELbS4swdaQY4zmM1CN65doy1WcT/t8o
	LGI1OU9A2VY5F
X-Gm-Gg: AeBDieu3XFccsRDnfJ/ltG5GVHq41t51k9cod3zUiM+Z9Ukv/rHaeswkKyyPK9bdTBm
	dJCQzDKqheYsa3Dq86zJQ2pfyztXsVg5cxNsuFNsMkpu17d+qvPtjr3xwqfkSWX67N3o9L1Yo+l
	8FBp/BZ3a5UE3AOvaFJ9IgFPwbuRbgO8Eao4wweJ2QWrcPb0bPk6ghV2ohN4e6tGUP9j9WPdIKr
	v9Zgd9ggeAaTmd+IisKu5t80pjxjfaOVwCcu6ufl+u7XtWtNniKIC+Ki+kTNI6hp+YZCg8RrTI8
	yOckTOm4fs/f9CG92BMdyeMlXMyGdhxtRTKKsDUFXAGkZyz03HZm6SIm4w17o4EF9sUktX3o841
	586ZVyr+l/7VZF+VPHBJytPjfzoQNacL+oA6pAWtIor7qLHU387XBvUJn9A/sH9EfC/qsDK3xTo
	XG32KHezFv9UKim8vln5FY5eJMzu9w6H2GNekThvo/K5BVlKrSn0Utsm0KHTfr72q2BHZNAbEf9
	YuugNbb7xvz8/WV/cAviaKGi8fy5O3O9iWZ6A==
X-Received: by 2002:a05:600c:8b8c:b0:489:1d74:56d with SMTP id 5b1f17b1804b1-4891d7406famr363468525e9.29.1777064224119;
        Fri, 24 Apr 2026 13:57:04 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm394841005e9.9.2026.04.24.13.57.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 13:57:03 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 46/66] oeqa/sdk: Default to https git protocol for YP/OE repos
Date: Fri, 24 Apr 2026 22:55:45 +0200
Message-ID: <296798981c9b8a1185a31146bb660eb0fa016ab2.1777064068.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777064068.git.yoann.congal@smile.fr>
References: <cover.1777064068.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 20:57:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235919

From: Yoann Congal <yoann.congal@smile.fr>

Following up on commit 139102a73d41 ("recipes: Default to https git protocol where possible"),
> The recommendation from server maintainers is that the https protocol
> is both faster and more reliable than the dedicated git protocol at this point.
> Switch to it where possible.

(cherry picked from commit 037f83803905fdbdf77ed325466abaa8a501d7ff)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oeqa/sdk/buildtools-docs-cases/build.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/sdk/buildtools-docs-cases/build.py b/meta/lib/oeqa/sdk/buildtools-docs-cases/build.py
index 6e3ee94292b..9f963f18f8d 100644
--- a/meta/lib/oeqa/sdk/buildtools-docs-cases/build.py
+++ b/meta/lib/oeqa/sdk/buildtools-docs-cases/build.py
@@ -15,5 +15,5 @@ class BuildTests(OESDKTestCase):
     """
     def test_docs_build(self):
         with tempfile.TemporaryDirectory(prefix='docs-tarball-build-', dir=self.tc.sdk_dir) as testdir:
-            self._run('git clone git://git.yoctoproject.org/yocto-docs %s' % testdir)
+            self._run('git clone https://git.yoctoproject.org/yocto-docs %s' % testdir)
             self._run('cd %s/documentation && make html' % testdir)

