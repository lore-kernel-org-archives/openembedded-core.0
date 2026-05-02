Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D202ACD3430
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 16:31:14 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9406.1777739473874231031
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 09:31:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=R9LfJTUy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so16781015e9.3
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 09:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777739472; x=1778344272; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7mNikGgVktohOvOv6KULaP3+TTcBu+t+uOeKbADLp/8=;
        b=R9LfJTUydW+SlEsu8BxQ7r+0uV9jHyW/t2tCaY3Lkl5F0+FB7lY1H0vkFumm5qvhKB
         JBROQvi8XQitRPSubkgKaHC77Xa9lr+7jW5Bd49xRaMQfB71sXQ3pn0URTx2ODLwCwiB
         WiRNjw2DuWxmFqtchOWn1XQ4PkYmVm2oeYado=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777739472; x=1778344272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7mNikGgVktohOvOv6KULaP3+TTcBu+t+uOeKbADLp/8=;
        b=NHq7mTBDYlTEc6WkI6NoaIfO0AyGsNY/UWK/ycToB/w1qF8AECskcijLWwJQ+X4wDQ
         NaP6mIHpKD2WpYHhr/13N/g4xki3NWj3GDM9XK5pf7xHvqdXEkyH5xkqDNiO2WySvDAu
         zAQX2AydZDzoNlTvs3rJKE6CgamLF2gr/SoWz6rxrZMpi34M14QZ/jHpn0A3TsXSgI6o
         t1hNSEWiJsfiVv31E7+S2rDF8/L0x/FJTbOQ+rHrFosWwTe7jKhLQnhPEpu/HjCkfjaC
         JQmlBOXhTPFvuPJ16lT/EnQ/sGVr9Xpj+kUbXUqPIvNL9DzLQdz2m/Ltlj18wY4JuwrS
         fr3w==
X-Gm-Message-State: AOJu0YyBfdogvmJy/m9/+O8y1ATYi0de6pCO8COvHUn7LeKYGeVKppT/
	2PFIjHa2Xgow9LWwwBwVdyhSnPJwvUbF5xUvISQV33VkxaoaCw9A8QAs+bvychYp7nkvnxcGyb1
	Z5nfPL65QKgYNLltnL/NGWqr1oOLEHqqTbJpVib/RdoqMdxhbWd4Cv+BhvGDIdGgrjIbzBhC0ES
	iR/I5/PCXaahOzxgs=
X-Gm-Gg: AeBDietHJWEbpjiN6Ag6FS6toWH1d+P+ugXFCQJjnhM1flLdHdU1vS9D4OxXKHU3T8n
	XSp013jO9gtDa1Xg1iHYEfC13xnZ+6XBrww2VixveNHE4XJpMplm1qpICuE4d3Msu1zL7cmufE5
	FxKI+2WSqhv/HbxeWEoCqBiPeEy2VAUXA5mARf9hnnZfm6MEGLA4uQtH6sUNwSVhTYXhC5GM4no
	b8Uql3T3UhVizcOg+/M5wLpBwFlbNjbQz3vrdXADz3y8Ky6VDP3V5tmXj9DjQl0NsgfDlpe3JTr
	sYi+KQP2IGXHjWfAW+CaLHTXWms765waxAxybmv/ViKEZHzkJ3ivSFLcrGPIFfTXYRKUjOgt2Iu
	2bra780DLeA9UpSWWdlH89wrKjkf82Ykb5eA0SbG+WUdvpZFue3g8jsXVnS59Aabg0Fltaik1G5
	g3QHvkieNId2kWUKFkzwcfWZVIOn8iiC+bq9k9VJJc3undUcJVWndeY6V2OY5kt7o=
X-Received: by 2002:a05:600c:859a:b0:48a:581c:ead with SMTP id 5b1f17b1804b1-48a98637facmr38226935e9.10.1777739471887;
        Sat, 02 May 2026 09:31:11 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8635:4fc6:d16e:90be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aac01sm11971926f8f.31.2026.05.02.09.31.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 09:31:10 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 49/62] python3-uritools: upgrade 6.0.1 -> 6.1.0
Date: Sat,  2 May 2026 17:29:09 +0100
Message-ID: <20260502162929.1377831-49-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
References: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Gm-Spam: 0
X-Gm-Phishy: 0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 16:31:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236358

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{python3-uritools_6.0.1.bb => python3-uritools_6.1.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-uritools_6.0.1.bb => python3-uritools_6.1.0.bb} (76%)

diff --git a/meta/recipes-devtools/python/python3-uritools_6.0.1.bb b/meta/recipes-devtools/python/python3-uritools_6.1.0.bb
similarity index 76%
rename from meta/recipes-devtools/python/python3-uritools_6.0.1.bb
rename to meta/recipes-devtools/python/python3-uritools_6.1.0.bb
index 718de87eabb..eeeca59e210 100644
--- a/meta/recipes-devtools/python/python3-uritools_6.0.1.bb
+++ b/meta/recipes-devtools/python/python3-uritools_6.1.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/tkem/uritools/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e21bbe53b2730bfe1911cf381b81821e"
 
-SRC_URI[sha256sum] = "2f9e9cb954e7877232b2c863f724a44a06eb98d9c7ebdd69914876e9487b94f8"
+SRC_URI[sha256sum] = "be97e452528e7a42ef0a4df68364ddd77833e982c5bac5cdcfee15c81f65e96b"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 

