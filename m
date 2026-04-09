Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E7CBF36B88
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 23:11:41 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.144840.1775776296105420613
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 16:11:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=qK1HkdXs;
 spf=pass (domain: smile.fr, ip: 209.85.128.65, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso18118975e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 16:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775776294; x=1776381094; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SgIyqMNlcqdB2Slzv2LSndHGiI0+jykFFYW2FWI32yQ=;
        b=qK1HkdXs4/T521nsw6tza8KFr15IEVXvPyocPZSOm6X3NWFrQct/19Yg2zWb5wm1DZ
         v+HgpdmLiQY9VJn/ArAGjPgQWxO1bFHzaA3cQ3UWnb5meyJTCN/aSQ+QK3+N+aB64ky5
         Cqq73KnuL/1/ybYvOTJFmxChJs8dw1c3w0W7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775776294; x=1776381094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SgIyqMNlcqdB2Slzv2LSndHGiI0+jykFFYW2FWI32yQ=;
        b=jIudnMf/+BgtRU/HyxDH6GxJDRgvfv7k0zQfOfqfJqEYMMkCEM+daZn3/Ohn/rQsm7
         tppq0iHw8uWXy6sb5WYS9++J66VLNGHH6xmYalm0Vd2ewhXdAwzUmy9I0yfm1tY4KcT0
         V/SLaxVdBc9HpbrdGSj++PL3PWES+45bnOG37wqTrCaixObbpk9OJx2c5s09cgNxQfC3
         vpgg8UxkxKG23bacnTksYaWoBoEWWTUVXxiJIxp8V81dGaXfSxP7lpXRwfXQia7jmXca
         L4cojqpljao9d9Tb+9uTPAVV/m08l5AgbHEi91YOS40cbn1quKtBA9SmbgdU6ifTNarI
         D78g==
X-Gm-Message-State: AOJu0YzEyjh/boC5TbGw95g0Eg4NLuF2DJtXwYlyHYxI30nTbMH2aixe
	ed8kYD0azYrKATmczldD+1f3vM4A9+4lhOS/WbT9fv1oo75D4HpxkmXC8DTlpoE0nJqVAaweIEQ
	KCQp0wsObcqTl
X-Gm-Gg: AeBDieuvLk512J+IwZMBpeDyHaFAmwu4nEisuxjhEGQwramzOUB4OwF2uv+6bnZAoEF
	V1VOi673sT+TG85vxCaEQ52diJ2Pz4jfA9MymLw15ZJjR4rZRtYVz5iZ6gbzaQelAoN/mipHNkv
	h/VC981tJ2XMYurSZp4egW3z2i6lxUynaBFJVfcTgyCkaBNsrBQTd79CcXDEas/QcyoIMgg/Rit
	pfkHXgnsPV+jb4Zgme/soe5TejRDR2VulXjtDDhbPSpgBIJ2iFqoVYz+iD0Mf1PrnRmf1FvHE+a
	6fR8dyeMd0VinevJw1tUtEIunF80ktOt8lkXDEkPLlOHnU/Yvqs7/DPmpXmb7QFFbrxkFYKaSwi
	8ylU2lZbsFRaBeBsmu+g2QNjvThsRyrSZsiqzibuhQYLg8dVPKQH7zMiX3VaJu+1lJXpZKhtwFq
	3kpYVUCr9HPlSHBVbLa9q9Wn3obThvOQ1EsLyJkCX5MLrc8CSy+/FuOLTiDry+hmpPwE27BHESh
	o5erw3JdkjPhGxlk63kKL9aOYGQ
X-Received: by 2002:a05:600c:a105:b0:485:fbd2:f72 with SMTP id 5b1f17b1804b1-488d681701fmr5166855e9.1.1775776294266;
        Thu, 09 Apr 2026 16:11:34 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00af4acfc73fc9518a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:af4a:cfc7:3fc9:518a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d67e685csm7708855e9.6.2026.04.09.16.11.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 16:11:33 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone v4 21/30] oeqa/sdk: Default to https git protocol for YP/OE repos
Date: Fri, 10 Apr 2026 01:10:21 +0200
Message-ID: <a88f039a3cf5c98824ebb19355d7cadeb36dc136.1775775155.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775775154.git.yoann.congal@smile.fr>
References: <cover.1775775154.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 23:11:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234980

From: Yoann Congal <yoann.congal@smile.fr>

Following up on commit 139102a73d41 ("recipes: Default to https git protocol where possible"),
> The recommendation from server maintainers is that the https protocol
> is both faster and more reliable than the dedicated git protocol at this point.
> Switch to it where possible.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oeqa/sdk/buildtools-docs-cases/build.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/sdk/buildtools-docs-cases/build.py b/meta/lib/oeqa/sdk/buildtools-docs-cases/build.py
index 5b0eca046fa..264f813e076 100644
--- a/meta/lib/oeqa/sdk/buildtools-docs-cases/build.py
+++ b/meta/lib/oeqa/sdk/buildtools-docs-cases/build.py
@@ -13,5 +13,5 @@ class BuildTests(OESDKTestCase):
     """
     def test_docs_build(self):
         with tempfile.TemporaryDirectory(prefix='docs-tarball-build-', dir=self.tc.sdk_dir) as testdir:
-            self._run('git clone git://git.yoctoproject.org/yocto-docs %s' % testdir)
+            self._run('git clone https://git.yoctoproject.org/yocto-docs %s' % testdir)
             self._run('cd %s/documentation && make html' % testdir)

