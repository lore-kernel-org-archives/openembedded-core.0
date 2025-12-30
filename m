Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DB5DEE49BD
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 20:12:55 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.71750.1767125572350934754
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 12:12:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=V+qiluuj;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a0a95200e8so88889765ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 12:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1767125572; x=1767730372; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0+N3F948Jycb3ffi21mFCaWDZjqe8ZKz4teFtJEeYW4=;
        b=V+qiluujSsVZG51e2HRU/m+o2tXuhzdZvJX10uBc9v/MODMYHt7ybhZYTAQsLigFuE
         73Jxsfsmn4LwrbfNfZ17eLOk8WPqUv8fzgv/HVRQ83IHmePD9kmDod6tKHxcPLYaIzID
         YlKBnenVrOntsSxSmMpp+mkKXIQ3Z1IQYAiSbxPz50ocR7tM3nZoGa5FAMlSzwMtON7E
         nLEAqj1+f5IFvqWFRZQ1Uji+jio7q13V+nCYTLiPfE7Hhgr62kG+5sOJaBFss51EG4OR
         Dq/qhMedMtyRYnHT93SDoSqXQRu3vU7UzHpxFxS2Ck3TMgbBMPPkKijp53faMH2O7+Fr
         vx2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767125572; x=1767730372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0+N3F948Jycb3ffi21mFCaWDZjqe8ZKz4teFtJEeYW4=;
        b=h+qJVLu/3xyDBA7L3/hqtSJjke090vvhtoCnEU9Mjd8BhXOARM5k03I+x/aM8hULbY
         56oSrQk/nLi5quK5Yoy4WG10xkx2PcUuF71Ae9N7+oZKSjD10i/inyXv4Zue8Rs97Z4F
         SEUxOwpqs4nOv7zEe5JLT+tfY1C5JUFoQoWa97FLPaY+ntgiExBBzjv4aARTT7mBK2a1
         mBdd74WyFMjnNAOr6GTNNKQaaDfm1njOBOcZMnQiz+SwGmEXMQJ4PaakgDBtU+MNvD6z
         NIPfH0jBoyYL3LL0bgWHkRIy7jou+U7fW2EfLvqpWBicQWZaRgXG3EHhPNGYk+ZuZpbo
         +cng==
X-Gm-Message-State: AOJu0YyNnGhKPpQ/8Lx/vbH4Pmh9qldrQ6Hdt2WHoSD4YrGPlYP85iR/
	gfrOcfKyxBHqil3VVsHQvxh9F2xhQVkbzERmL9lmKJRFY1YmrS47PSzorTaB0QYyMXYvleeqHEV
	firGY
X-Gm-Gg: AY/fxX484im4g0FHrZvKO3+U0Qpv8574rg3SwWbTUHStkq8RWnLr5Xdc6zlv0FFt7NU
	ysZQfLbTre75On20gCckdWYd3t2Ns5/E4RpK1X9WTvoOixo/8gb7OJ2XmNQvc+eMob1m5wnHeH2
	sD72kvm2G3DKiv7pgs5Ek1SQMsx/nZnQAOkgIva7G1NI8bCQon7fz8cmEaP2Z+2843TkMbL5hiy
	ESjUQLgbBDtXle6DYxbgQIwVCOoH7LLg604qzWc+oR9QO6PPKzqi7xuB8KyshgBblRXQ5Ed5ts8
	spxb94hU4MjtDKwh+fSJnOy1c0E8eBo+MCqM+ABUCBpzGU7Kzdv/1eTFw6EhwMesXSyj/PO0MMu
	7Cw/QrNDIvIPAV7VgnI9Wore7RqnuHlPrlOieCkMeW3Ah3K5ExCuEPnNe1KMcMNbtLsyu5hnifB
	/lvA==
X-Google-Smtp-Source: AGHT+IGqzj6+DBT9jIkOlMOkFKAVzBqGODorzYuaGrG3aBeLmyDksFVdK32wpXYiFdrztBl9bdslzQ==
X-Received: by 2002:a17:902:dac8:b0:295:8dbb:b3cd with SMTP id d9443c01a7336-2a2f232ba96mr292258855ad.27.1767125571612;
        Tue, 30 Dec 2025 12:12:51 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:501f:80a7:5971:3e87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c83325sm310391365ad.34.2025.12.30.12.12.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 12:12:51 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 27/29] ccache: upgrade 4.12 -> 4.12.1
Date: Tue, 30 Dec 2025 12:11:57 -0800
Message-ID: <56d06e3417ebd820495873e05ab2b3389e5765fe.1767106395.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1767106395.git.steve@sakoman.com>
References: <cover.1767106395.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 20:12:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228719

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit e47f62e44f44d0e45a02ad13826d3a7fb722079c)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ccache/{ccache_4.12.bb => ccache_4.12.1.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ccache/{ccache_4.12.bb => ccache_4.12.1.bb} (93%)

diff --git a/meta/recipes-devtools/ccache/ccache_4.12.bb b/meta/recipes-devtools/ccache/ccache_4.12.1.bb
similarity index 93%
rename from meta/recipes-devtools/ccache/ccache_4.12.bb
rename to meta/recipes-devtools/ccache/ccache_4.12.1.bb
index 52643c4bff..2d0b83e244 100644
--- a/meta/recipes-devtools/ccache/ccache_4.12.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.12.1.bb
@@ -17,7 +17,7 @@ DEPENDS = "zstd fmt xxhash"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "e884c62cbacae2e9488b8641a671a79fb7a1221db01310dacef61c9e55c2e55b"
+SRC_URI[sha256sum] = "a3da50ab0fb0d42f60c17d1450312e6ace9b681f6221cb77c8a09a845f9d760c"
 
 inherit cmake github-releases
 
-- 
2.43.0


