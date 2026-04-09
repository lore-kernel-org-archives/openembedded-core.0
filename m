Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 012F2F364CD
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 22:08:36 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.144058.1775772512589054911
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 15:08:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=f626hgMy;
 spf=pass (domain: smile.fr, ip: 209.85.128.65, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-488b0046078so14506085e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 15:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775772511; x=1776377311; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SgIyqMNlcqdB2Slzv2LSndHGiI0+jykFFYW2FWI32yQ=;
        b=f626hgMy6cGe6vRUF2BF1BLX399keu8oGw3eXYkPTmSEckPa0JC6IfAiX5G+kSPk94
         eoiftUe3HIK50CqRkxstzWiZp/bPnNZDEJcOIhfwzYsFXoH90Pvgc1EWCBggirz/sNwZ
         +r/OVlP3jBZCwG8hz+RMNYBG6Nk2OFtRgPiNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775772511; x=1776377311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SgIyqMNlcqdB2Slzv2LSndHGiI0+jykFFYW2FWI32yQ=;
        b=W3WXC4vO5UdAyLyx9y6dd8mCxsvGxMdBCVHIZulI9yNisf+RvU/V4FywFuoZC6o8la
         IjsjjmsGAXmRz/xs3cEi0inwNkadlRTMb0CBSuLrtjh5nMPS9hV7xdBT67n3qi1/pDHt
         fKW9/Hba5EpfFnI8Pvi5qu1lZdVuDeeR55aeFRgHM7DTb0O+k44ViwJ0vqPzwwyBXhuk
         gsAqznPKWl8hAJSrgoywxbbXMi2vscPwESbc/owwRxUqLv1wc56wKXPVWTKjn78tGFLr
         DhZIhlIROP1oRafWnHgiC8lgIbSS1xoia647VCLdlqXTXxiPg8d3gqShRTgzwsUhhs1j
         DU/A==
X-Gm-Message-State: AOJu0YzPEYnjMd7tTGgRmS6mvvvG/Aj/yTg3psL8vYHO1sN6qj0+jmjK
	JN0WE98T02zuyLf6phH0DE2pDOx+/fjOOQXqPJ8r+0k1/CBT1IRAGdZf3YMvN1N9+c70KpgSko3
	Sz+8OVdK/2EYI
X-Gm-Gg: AeBDievqKT9YMjCpW1pAIIfaeHlZrxxj6y7iGvUkdl0EiH6eahTUfFkBif0TRv35FHS
	yqTMVIn4214zvzl76SxbrP3+2RDubOQ6eSggALKC7C/9P8n5IAtOzM5rL0GWixAyvHwUF9Lkg37
	a9SJksi9TFky2kcsPFfiyNVh4T27/qJ7KNb7X2mAws6fenhOeajnc1TJ4W0bzMJP/h3hvCPiXhL
	/fsUzuHwAv67+ffsdaJpYbwGdqAM8BhoAu5M+t2ThXBRJ4ygbsh3kvNEKBYiWucPlkQIac9rRCE
	PuHSQEH9sSjhV6VksAGJv7bVboEdrslmVHTkpwfoIzSTfppN4m4PfjoNza51Hnu0L9EcStmgjwS
	nLZmYtTj4jankyHLenxjVD0ZqUZwFFkshttRNtYbDYp+PTJyZ5D8Ndzj0qpMrRKTao0k+zpAa47
	XCamR8KNOISNC9/SDW1GkxcN/kNk3nuQ+WADJ0Zn5quUI1Gn3mcY+P+3LjNFdOkeoyNxih5xXRZ
	cK/d1RxZch0pfTw16FFqRAj3Ki4D/2ZHBhtzw==
X-Received: by 2002:a05:600c:3b24:b0:488:c078:bfda with SMTP id 5b1f17b1804b1-488d688d2a1mr5782355e9.26.1775772510804;
        Thu, 09 Apr 2026 15:08:30 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d58bb830sm22123045e9.7.2026.04.09.15.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 15:08:29 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: OE-core ML <openembedded-core@lists.openembedded.org>
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [kirkstone][PATCH v2 3/6] oeqa/sdk: Default to https git protocol for YP/OE repos
Date: Fri, 10 Apr 2026 00:08:16 +0200
Message-ID: <20260409220819.2427583-3-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260409220819.2427583-1-yoann.congal@smile.fr>
References: <20260409220819.2427583-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 22:08:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234955

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

