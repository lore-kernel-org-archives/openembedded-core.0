Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4229EC5516F
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 06:22:50 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1041.1785565360756421722
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jul 2026 23:22:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Pj/RDod/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47f84023916so1783268f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 23:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785565359; x=1786170159; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RkPbY5FJD6pWqCByBXvHhrJRiECQUlzM+RSXZ3UMFiU=;
        b=Pj/RDod/di2gIUFw7JAjuYRxT1Bq5wgFlK5eNoDwMBnB4/v1dP7zmryeGCZ2V3hEZU
         xuWDl6xipvagAEJ8FKr4gsbA0dhCmnYLa2BIDh9qNZmUn+iVqf1knoMNxwOcsqigoGZe
         MK2QEDOOArdKdjlUCLPzR9tadCzjvivknU8Nc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785565359; x=1786170159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RkPbY5FJD6pWqCByBXvHhrJRiECQUlzM+RSXZ3UMFiU=;
        b=jJHezclkaA9YzOQhaDLvZAffv7yKZIgI/7MD8LPv0EOWELNBsxHYGT3wgDzE24crwx
         ++N2oNVk9iWYFHWU1MAwLdC6642H+ZB9tJjHbfR+0m0LJUR4P2FaypbqDdMyCtGMkEre
         ireEY2MA1fe652aUuzhrxpslrvkGu8EpMJSH2FhjBS390wlIvgv31eKIyjMqHtp6MTgr
         iLeZ1tPDFpXYaIJV0ZR/kFNLF+POhiqHao4Ym9RVJ/IKegKw9v8gqBSUzBml3zmLxDk4
         E6h3H4GIHXSQsR6wI1+lb65ASR6v9wr1HG93AYNvTnMebKIdnvh8VUEwgsHnd1whYByS
         mXBw==
X-Gm-Message-State: AOJu0Yybi2ku3l87Jaf5JWsE69ewk9OcTIsy2TCOhfuGV6fnT1goWoXs
	4plkdNlwEjQlWeXxrr+f2nGNpvLvU/0dl3b0PRrt+TJGLi7rRlJU9xCKsCOSVixQVeSXYbeW0lD
	8nctzpnE=
X-Gm-Gg: AR+sD126UAHZ2A7TG1SeceIq9q8o1yZvmb4T9VVJK8SeHPTW21Y5LCS9aWI4w15dmlo
	u1lz51HnpEoSKHDb4DE3TMPly7izBBjxg2kjeRM6zzRcLIhYrJgelUEAUlR86z1rYxrdxCcNyb+
	gIlfdDHRdewfg1UTe4H/OK2AofodnBQOW624SrErviuHCz0TCHHaYYDsS0QbXe3W/oJUqjHxTEo
	1J0Bg9feBojFnXNctrN+x9CHMYAJEedDiRky3OS/eYHLgLz2oCvbnAi/xhWRALMaDjSI9v7Meco
	wbhUVUzS4yLfBD0OZpyooLdNmWd/ECJYidSoAdchbmEfMdYgJ6CC9yTgVufGRz2hEw3Yd95D8QS
	Z4LYpTFoIWynFGY5vqBfCacqWX/gk+Sf7pafYUxLye3ElboGSRa+MhXDLgwW5zXjMj/3nwePBoM
	HGei3/tGVdVOMx18fJYw5T/KPY6hcrkzNPq0ieleeiZMmTVRyYiRk2fJyFraOOnqcVhNcdNkAQj
	flp/c5ACVqT1/OEgQ==
X-Received: by 2002:a5d:5d88:0:b0:47f:6f89:7dae with SMTP id ffacd0b85a97d-47fd72bbbeemr4489706f8f.6.1785565358755;
        Fri, 31 Jul 2026 23:22:38 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:43cd:3a42:fe4b:e585])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd4068fb7sm13921262f8f.0.2026.07.31.23.22.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 23:22:37 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] python3-markdown: upgrade 3.10.2 -> 3.10.3
Date: Sat,  1 Aug 2026 07:22:32 +0100
Message-ID: <20260801062235.2497102-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260801062235.2497102-1-richard.purdie@linuxfoundation.org>
References: <20260801062235.2497102-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2026 06:22:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242471

* Fix `SetextHeaderProcessor` regex to prevent mixed `=` and `-` chars in setext-style headers (#1606).
* Add AI Policy to Contributing Guide.
* Officially document all included extensions as being in maintenance mode.
* Link the Extension API documentation to the API Reference (#1612).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{python3-markdown_3.10.2.bb => python3-markdown_3.10.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-markdown_3.10.2.bb => python3-markdown_3.10.3.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-markdown_3.10.2.bb b/meta/recipes-devtools/python/python3-markdown_3.10.3.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-markdown_3.10.2.bb
rename to meta/recipes-devtools/python/python3-markdown_3.10.3.bb
index 6a35e0def81..a7fd3d78406 100644
--- a/meta/recipes-devtools/python/python3-markdown_3.10.2.bb
+++ b/meta/recipes-devtools/python/python3-markdown_3.10.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=ec58cdf7cfed06a21f7a9362627a5480"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "994d51325d25ad8aa7ce4ebaec003febcce822c3f8c911e3b17c52f7f589f950"
+SRC_URI[sha256sum] = "3589362618f743188b4d955b874402bc814f4f83f544dc207719f4baa7d9c45f"
 
 BBCLASSEXTEND = "native nativesdk"
 

