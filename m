Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D8D9EE49A6
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 02:48:02 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.5801.1692931674118078429
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Aug 2023 19:47:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=o+i4BwXl;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-68a4bcf8a97so399480b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 19:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692931673; x=1693536473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WmjHd4m7LazMqAul80+kkTLXim7MXdPgbJK5lBU26k8=;
        b=o+i4BwXlcj7cfbQDiA9/vY/TWFebHOR+pG4zqlXgKdL5aGbFKV6p8M5p9/zSIA469C
         CyOGPxL3rB4FQDS1xEaZbe+7SX6lcR67BCODNKk3fGkZwvbfOP6dGsTLuWHHZUrKDsbK
         8NoAWkXYqT47o4FKBXN1JY98ITWM+ZTuiylouVbqGLVGWKM4y62ZNn33WfMw0NHvThfJ
         9ofyuQzsnaH8XmEE/BwsC6WJ4xUR4XhNUdUgzd1JE6SaKzH9s4nxPUmtaDQDQRSuNHfk
         k51rQfM4aSSg2TpsBYMEJHuwL3ckZZB2ebkFb32+c5uzLUWjWdGiz9CRJnui6PqtbqDc
         zkrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692931673; x=1693536473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WmjHd4m7LazMqAul80+kkTLXim7MXdPgbJK5lBU26k8=;
        b=P4G20vl5BOT+E9WJG9iYeVxwA3AFXrfWzlzmS2+XqzP+cg9P/lb6HmTmsBCu0oGtp1
         aTtTWhXk4IGe0+pJfqKuFumDEqMZ64jRF5/m3UpW+D11os8PmBiGfUVz5I19PaHDiclq
         ruHLHmMTItDi+MsyTgF5wKy/UVDdonpQgamtnlY70Npj1bSGmZY1gvRI/rrmDY6E7HBK
         /9K4Z4b88k1kffIOMhVXwkU+RchB48bRmhTV0j8ukWgNqZ6M/RRJzcuNpTSOGSBhIbc9
         HHzS7Lon6ri20Z9P6mBJqudQ4sXeGy6xfmbbAMJZErqe8DNl7nNDAd3fXQdk24CNk8NY
         cusQ==
X-Gm-Message-State: AOJu0Yx7R+OL+MtZdm3RMKfEbvUbbMllxD3fRyN+77Pkm1j8Vl/DiNWG
	ceCrai/PudCDwJ6Ct2pbifdV9CwJe0ezy3T/c/0=
X-Google-Smtp-Source: AGHT+IEipjuHsaewcAWzXhUz9atKIIPSxu7EjZNjxm46oxI63uaKFgnki/EcSoM99OWONQeqrhN30A==
X-Received: by 2002:a05:6a00:138d:b0:68b:f4e8:3dc8 with SMTP id t13-20020a056a00138d00b0068bf4e83dc8mr3648813pfg.21.1692931673156;
        Thu, 24 Aug 2023 19:47:53 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id d3-20020aa78143000000b0068883728c16sm446803pfn.144.2023.08.24.19.47.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 19:47:52 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/14] cve_check: Fix cpe_id generation
Date: Thu, 24 Aug 2023 16:47:28 -1000
Message-Id: <8fad45ce31ba8369a5dc8d772f0196bf984d0425.1692931546.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692931546.git.steve@sakoman.com>
References: <cover.1692931546.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 02:48:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186677

From: Jasper Orschulko <jasper@fancydomain.eu>

Use "*" (wildcard) instead of "a" (application)in cpe_id generation,
as the product is not necessarily of type application, e.g.
linux_kernel, which is of type "o" (operating system).

(From OE-Core rev: cae9528b002c06143bf048b991b9d7e93968cb6b)

Signed-off-by: Jasper Orschulko <jasper@fancydomain.eu>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/cve_check.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
index c508865738..aada53bf38 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -168,7 +168,7 @@ def get_cpe_ids(cve_product, version):
         else:
             vendor = "*"
 
-        cpe_id = 'cpe:2.3:a:{}:{}:{}:*:*:*:*:*:*:*'.format(vendor, product, version)
+        cpe_id = 'cpe:2.3:*:{}:{}:{}:*:*:*:*:*:*:*'.format(vendor, product, version)
         cpe_ids.append(cpe_id)
 
     return cpe_ids
-- 
2.34.1


