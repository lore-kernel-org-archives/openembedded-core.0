Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09739D711DD
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 03:22:36 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9462.1766114547371078609
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 19:22:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GNFGmwuN;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7e1651ae0d5so1064568b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 19:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766114547; x=1766719347; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tvyQxpwtFcOjHi5/f4+pBqbM01hNiCHRGQc2YfpEsuQ=;
        b=GNFGmwuNZmuho0wviBnBFSin9XTXLL9+keNedUWxaM+jNdedBKpRu5yem52UEZnd0O
         iBQKUJzESKVPKbOkMN449zxp2scP2+DU7rYjCKSY8cNo4rw+bReUWbdtXSJ4U9ZeTKYw
         vTirDjJmoz3xIpozB4jx5HpPwEKMBZ26vPi2H/El8uIq7s1mFREuFtZ+KnRCP5Vqe7Gw
         habKE5OmBmdh/XGwNGlrJ/gYfPzycqsP1rXL1+7qNxQr4jzdekLnLIKAhDkwrN3/dWhH
         rdJrborEWZuhDPLsCpvg4ZgS3HGM16vxSxj1cF/bmOYYT4SEKGxu3/LykfchYdGZWdT2
         x4pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766114547; x=1766719347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tvyQxpwtFcOjHi5/f4+pBqbM01hNiCHRGQc2YfpEsuQ=;
        b=fPBb0aK9GFmxXSzsIPwxPGkG083uvow3b9CIqUetaIjXRWPFxfnye5EzJ1jhk6dWHk
         9UoR9KANyoN+fX856ZW/QbTRtWn9vCJiiZEVtcWCrcDdVeGEEQt2O0bL9J1YzxkW1yD2
         RILnJK6r1CDjzVwnwiGbDmpLgH36Rw1eBeLsjBfA5rric6dxfszFPh0ZuyrrSbejn8xB
         c8OA4/QKNt0TQRwXu0XUmmYYl03j4+v3utwOQCQeXoUei6RXbcFWzLx57O4Ol02rxBEI
         PwG4R7gqpnrTrx7V2YPQt4ethalNZxKFZRq6JoGpVLi4W6C0+G+1DE8LvJDu46MQPZ6q
         3/ig==
X-Gm-Message-State: AOJu0YybAvgJhO64PiTe6nGquryUJCQ3yWIfBdtHne9CBvSZUXZpQT7D
	ep25OCZJyJWNRjLufTuk7OuwZqR/TDOSGKeccGVTblkC6h9u617BGLux2+uneg==
X-Gm-Gg: AY/fxX6vEFloCY+7vaxTHcizUxa9X+ybWwS6V9rLKbPg2er+QRBM3mL1aVTSFx/hLio
	j8EB1EDg1tCNjtxeCqgMC9afSTXEZrO5WdC9pvp0mOUWZe3bMhDW8LJ3f1ZMJY0IuHSif4wRQX+
	dPscxJylX2Tng4xUsNVswPkN/dJXD29udBiplvAyqMLsKHjE31tNgT6zF+/8XSBVVfBTR+kDYZ/
	aYyWw6bND5U6EMErAvTYSka8EVxRE9fLBMCIWDnhZgync44oKv+fD4wb+7YoG+181z7zgrN0oqJ
	OAQGQmQDec0F9eYPOx3ZzZUMY6PQrYqOlJJWo1PFor64AwdsfBGOqKzknvnNVYZJmixubjQcF5J
	ngdGV6McaywtNSeQcga8rbyMzDMo92cUidm4WC49uHmQihyIauF/j6g2M6MJQEheaGIFDAoBBXd
	fEH+czlbrknTFp/KoelxN0PjHT
X-Google-Smtp-Source: AGHT+IGypbkPjOiPBKdaLA/X2uI+iLp+pUuxG2DzqN7v8fIFMOjYFZPwzPzT4pjNaop8WcRxLSc4cQ==
X-Received: by 2002:a05:6a00:ac08:b0:7e8:4587:e8c7 with SMTP id d2e1a72fcca58-7ff664806cdmr1272429b3a.58.1766114546577;
        Thu, 18 Dec 2025 19:22:26 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([165.225.124.219])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7b12a7dasm753360b3a.22.2025.12.18.19.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 19:22:26 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH v2 04/29] ell: upgrade 0.79 -> 0.80
Date: Fri, 19 Dec 2025 08:51:43 +0530
Message-ID: <20251219032209.960840-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251219032209.960840-1-ankur.tyagi85@gmail.com>
References: <20251219032209.960840-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 03:22:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228172

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  Fix issue with ECDHE client key exchange.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 6a1a278de3183a1b8e6e27a38b17dd1dc8890ac2)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta/recipes-core/ell/{ell_0.79.bb => ell_0.80.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.79.bb => ell_0.80.bb} (88%)

diff --git a/meta/recipes-core/ell/ell_0.79.bb b/meta/recipes-core/ell/ell_0.80.bb
similarity index 88%
rename from meta/recipes-core/ell/ell_0.79.bb
rename to meta/recipes-core/ell/ell_0.80.bb
index 8bd0f8badd..90474dadae 100644
--- a/meta/recipes-core/ell/ell_0.79.bb
+++ b/meta/recipes-core/ell/ell_0.80.bb
@@ -15,4 +15,4 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "28dabdb1966fd2e47363c44e041de507e9420411b846947efa01b4cb0cda0d6b"
+SRC_URI[sha256sum] = "6efc70ae6d3e2ca1ec255ecd855a3d5fadefe59897f4307816e3ba7a771f3d00"

