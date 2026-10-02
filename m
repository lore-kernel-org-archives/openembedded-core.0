Return-Path: <jennifer.chukwu@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2597CCA5FC4
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 12:23:47 +0000 (UTC)
Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10753.1790943820709743966
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 05:23:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=Glz+mLDf;
 spf=pass (domain: amarulasolutions.com, ip: 74.125.225.98, mailfrom: jennifer.chukwu@amarulasolutions.com)
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48aef5d66c1so2373021f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 05:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1790943819; x=1791548619; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zRS2xRrsyR+1nLz7qsZ1VucHUgWOdGnOmPnm/DvS0l4=;
        b=Glz+mLDfhSM0/PDRGJ3jaigX+6vjlfJznKs8ALb3isgJ3MZYnATyfwQoY1xmkKIsC1
         Q2g4JklpbTg6LakIoSTpC8XOQHlGm356UTUESKbaHNkSu/HdibpGMXp5IOipZkE5fbW+
         RaCnEOVFm6pdIhzkpr7ayIFPn18lN0WgJpV4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790943819; x=1791548619;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zRS2xRrsyR+1nLz7qsZ1VucHUgWOdGnOmPnm/DvS0l4=;
        b=xjnAUjtzJWftWyjT7oanD+qWDFuOKGHpSccilX4H+ZquRNahjLQeT1nsIzb2LjyWVd
         M42cgkylojh43hHszMp9dfinjtmOBHIowcGPVEmJrSehXkfO1wTc22dKAK7K5LiqOfze
         evgFivnWBq5iSs202inX6rvlT8gKydzQwlvKrHwSH33zQ7eGhSX3StWhMndfLvKUQbLv
         BnXkxBxOE7xGrsiY+YFRRbl62fx4tnaTCGHdAjzcy/UDsRTixXtLcA8XDnarODIJeM/y
         69hgNXqFeoFFKlsQShIveSnklifyIyA8+WRf5+il2IQaMXQfAzcPl7Q5FvtlDsVv6mbR
         LV5w==
X-Gm-Message-State: AFq9FYKXtpq0DGgboiErSW2K5nVYzplIBAarYPj2rcweWeTGHA7fi9mM
	yiMn27WzwQL/u0Et08zgjIf78wb8EuNWO8iJpGYWO3Bt8L5cDhJLiEcdObMlN1Y8LqZi1ZnA9W/
	8KryQpOM=
X-Gm-Gg: AYBFou0SrvXKU+aYoAnmvhHOIEDl5/lNdWRKAC73FXpZAOC6eWvSfjzMr/M7jAi+lom
	XIKeqyM2awV6rEZrY/+ReYzgPxJBJq9xPBtK9OnwoPpF8J6zQ+jP+3x+dBeLFChOHmDMrKJxl7l
	dlApSkTbs5UMgK/Sv5EO71n8GYsU3ZnZCeNpdbo5r/7oNmTjVnel4yJwFfL/PFs9vQKJtoROCA3
	kDNsWUv+LrCdQ3RpUf9vI9SwRdgq0f6nVhEEsO3i4cUvjDr6d9RVO84urq2FXszBT17DJonLO08
	6DMelufyToJThAQZKBfkFRIaEED3C9bxnDYWTX4QjcWJ2gU2McXulD5YOZxjAjL6reMHpFcRYB2
	a6r0PWr6AL5IBJjQ5xiGEmk6ZEek/w7Ka2QNmBqp5s+Cfn+omwfuvA3XA2Grr3fS/mbqbWLikDc
	KopSkd63hafLTLjFG08jLSCKQgSpVaMCQBh+J+WDgzXjlnGAWBupghrxQMCyBX6JDaqA5FErtL/
	hqL160WzDW1mig4i1Oer6TQPwbpAxP9AlofVaoge5N09e84Sz7t
X-Received: by 2002:a05:6000:480c:b0:48b:e54:84a1 with SMTP id ffacd0b85a97d-48b12736915mr4844838f8f.55.1790943818939;
        Fri, 02 Oct 2026 05:23:38 -0700 (PDT)
Received: from jennifer-chukwu.amarulasolutions.com ([93.90.163.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b82253d6dsm4866842f8f.5.2026.10.02.05.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 05:23:38 -0700 (PDT)
From: Jennifer Chukwu <jennifer.chukwu@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Jennifer Chukwu <jennifer.chukwu@amarulasolutions.com>
Subject: [PATCH] python3-meson-python: upgrade 0.22.0 -> 0.22.1
Date: Fri,  2 Oct 2026 14:23:28 +0200
Message-ID: <20261002122329.923388-1-jennifer.chukwu@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 12:23:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247115

Bug Fix release
- Do not remove absolute build RPATH entries, unless pointing within the
  build directory. Fixes an issue when using system compilers in a conda
  environment.

Signed-off-by: Jennifer Chukwu <jennifer.chukwu@amarulasolutions.com>
---
 ...n3-meson-python_0.22.0.bb => python3-meson-python_0.22.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-meson-python_0.22.0.bb => python3-meson-python_0.22.1.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-meson-python_0.22.0.bb b/meta/recipes-devtools/python/python3-meson-python_0.22.1.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-meson-python_0.22.0.bb
rename to meta/recipes-devtools/python/python3-meson-python_0.22.1.bb
index f85f6c55cb..2b8306593b 100644
--- a/meta/recipes-devtools/python/python3-meson-python_0.22.0.bb
+++ b/meta/recipes-devtools/python/python3-meson-python_0.22.1.bb
@@ -13,7 +13,7 @@ DEPENDS = " \
 PYPI_PACKAGE = "meson_python"
 
 inherit pypi python_mesonpy
-SRC_URI[sha256sum] = "9c819d0d4efa746edadfaae4663c0e9c75659186ef7e5bab12330bfe22964dfc"
+SRC_URI[sha256sum] = "52c88628b0e5671592dc2306613fb5f6f3615fd24def059b9894f143b7f9a139"
 
 DEPENDS:remove:class-native = "python3-meson-python-native"
 
-- 
2.43.0


