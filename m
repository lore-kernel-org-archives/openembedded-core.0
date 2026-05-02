Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADB3DCD3427
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 16:31:25 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9407.1777739477710919229
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 09:31:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KOJU8m7G;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-44a044cb827so1626369f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 09:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777739476; x=1778344276; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pH0UWM0xt6gTiu64PqlVHogabk9XEd2wdm5rsfoQ7Io=;
        b=KOJU8m7GEmLxgAguXMGMk/lguECg+Hx9W21LhNSwFlHx8ZAZESB+gUfPglk+OHETl9
         z65VCIb/l4VS082OXz17D9MFavutci8PfFRiYTXiCDPtH0d440Fk+O50U9VeYYHImxEF
         MCKd9mLkDvDNqP2Zsl09dGTDTmKgqCigeSNe0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777739476; x=1778344276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pH0UWM0xt6gTiu64PqlVHogabk9XEd2wdm5rsfoQ7Io=;
        b=fccM5IPOHUOPadORDcL6oetb2bkocqehs+bfqxFlfm24El+UzjrDOo4OSd3VBTHU6W
         7q28nu1KRLcJgIqYi2AGqauBDti5Yy0WYlx3nOl92tgODrh2QFBnFpGwG/7ahMxKlh/F
         ip4FzgERpZV1IZmCmXvN/cDcf4ErCSsKYjazn5+/SJQ6BbRk6ywLMElf6f7Sp2ldO6Nl
         4TKkUpgd4jo/Vy5IQlYWWwiumk4UrveJ8eUDJ4+H/lZ/vl+1e2CuBppFyxk8YJ01Slqi
         0Eme9kNmhIsZNTIva3wksJ48kiCcwh8EQkJPHi2tWKUtO0eiqqHgQstsVbpUoKQXTkgY
         sMcA==
X-Gm-Message-State: AOJu0YxcQWCD04VCV8iUgYB/LIfskOncynos2PjwpBCPhAFcP1Xn+UsN
	yx3yFQtF/4DT/h2OhcHvHgYiD7ExymF4O6aa34gB+M0XlcIx1rovOVvI9ktH6xBE4SsdHx57+Wl
	xioyjGuGxMvun32TL/DnXz4j1vxa8BGbFVUC1Evwml6wkpZpZYT09CslzFTPfKFuqEqaeHdRXQo
	8bfz8KxFF8NbqMhHk=
X-Gm-Gg: AeBDieuZLd3T3bouiBl+4YsXYYEK16k35CBB0AXJyaH/3GvM61XF03prJh3gABPDCyz
	oQZT0orPwn5IBYmnii2Ub40uL3n391N8PtHnqRqZRJQZ9FGLeN7UPBdRY8o9OHK0Y2/jD5v984o
	rnuK22GEfTGhNoihfuIGUqymquN4adQAmQP1jtTzqtTwYpVrudGwUR7KzeN8VssjvNyEMheUINP
	823asFDgtggBtnUxIRROhxo6+lzzpkqZQLsIJtBWoEWmBT4nvYyI200R0O7mVaN48IRJg21uCO4
	tnS1YBEbOYHgZ2w3QmT4hdc0VZ/6R4adcCD3eYv45EErDatzDEf0WYCHIct/x/XNk3Pt6br7S6O
	489WFCZTpTfhcVR3L8tTXA6iSLgnTJM5f4J9LURP+XqHt0VY57SoPTz3lPL12jfaGLr4fysyzbF
	ffZ/Wpd/8JdjKyXHNf6Ti9obMly2Nsc93Y+3sb1w9Mgi0whLnOP5yTn/01A4txgfI=
X-Received: by 2002:a5d:5c84:0:b0:43f:e791:a347 with SMTP id ffacd0b85a97d-44bb66d6469mr5829980f8f.26.1777739475719;
        Sat, 02 May 2026 09:31:15 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8635:4fc6:d16e:90be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aac01sm11971926f8f.31.2026.05.02.09.31.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 09:31:14 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 51/62] python3-wheel: upgrade 0.46.3 -> 0.47.0
Date: Sat,  2 May 2026 17:29:11 +0100
Message-ID: <20260502162929.1377831-51-richard.purdie@linuxfoundation.org>
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
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 16:31:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236359

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/{python3-wheel_0.46.3.bb => python3-wheel_0.47.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-wheel_0.46.3.bb => python3-wheel_0.47.0.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-wheel_0.46.3.bb b/meta/recipes-devtools/python/python3-wheel_0.47.0.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-wheel_0.46.3.bb
rename to meta/recipes-devtools/python/python3-wheel_0.47.0.bb
index 2545e5496e9..88b54c2ee22 100644
--- a/meta/recipes-devtools/python/python3-wheel_0.46.3.bb
+++ b/meta/recipes-devtools/python/python3-wheel_0.47.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7ffb0db04527cfe380e4f2726bd05ebf"
 
-SRC_URI[sha256sum] = "e3e79874b07d776c40bd6033f8ddf76a7dad46a7b8aa1b2787a83083519a1803"
+SRC_URI[sha256sum] = "cc72bd1009ba0cf63922e28f94d9d83b920aa2bb28f798a31d0691b02fa3c9b3"
 
 inherit python_flit_core pypi ptest-python-pytest
 

