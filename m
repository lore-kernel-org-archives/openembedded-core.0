Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CE22C5DF9C
	for <webhook@archiver.kernel.org>; Sun, 23 Aug 2026 07:49:30 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10587.1787471368254406756
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2026 00:49:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QBSDGrVI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-480033bdcf4so1132032f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2026 00:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1787471366; x=1788076166; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iZ+m953RRz6//F80NGmMMxAQwXgG+irBWa3i2SWtL+o=;
        b=QBSDGrVIWfbd9re5YC9LFiNU7OkHcN0WiYcMNuY6A/awI2JoZVk8i2c19oV73/4ciE
         EFQiHfiba/6pmc0CujyhJtQmYTU3r9keF+X4t4rUK90y1KDmeapit5i9PSNKfNXA3gPW
         vLDEkpCNsRCIyyU67W92IoBy4NhqsMeX0Cuto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787471366; x=1788076166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=iZ+m953RRz6//F80NGmMMxAQwXgG+irBWa3i2SWtL+o=;
        b=TGRnen5Z++lZp14n+uCFTtxz6qtvlgooNkNOhBH/YrsdRWVc9selpWwedOaOBzgsWs
         8U0pndEQDts3LG+rOUdCue9tdcj7fRYM7zNMgqZSr+MFBvsMip+8iiPe26J02YYTGzR5
         Tluk0Ctm/3MotTNlE+yghaVWOqK2/UehjsXKXOqJIv/u4KK+DCYgRNvNWw1qra9Kkn3k
         JURTAf4M8o8LdYWaBr2F80S/lqirUCN9WB/R1WgNlu+Q92pEr+VAJgdOG+ZKEbRfsHPk
         X3PGyD8Whd83yG8UeAuqY/pDoz6yiA1oVInN4Dk9WMqa1Ni7ECP4+u465cX3jjEycxVe
         5bjw==
X-Gm-Message-State: AFuF++knbp4ROtA1fMY4sj6NTqJkJIIJ+b3iszaixoSaYE9Ef2jlK82d
	jlyHh6GJe4BTL5MjStl2U8CDRc94kVf/jYErJBJ0wGLdfzz8sggZWXBjUxM7ZGH30T8NEM1eKij
	pKHVfAPs=
X-Gm-Gg: AR+sD12Q7oNHK2m/z9bYl0XyRN/hy0Ds+XWWTmYlEjAFe4CM4SGspbrGrkUJBBZt2TT
	UCXh4v7FOxIYHAu+07CgD12IxcNyv/vH8mGAKepfbWLSFndTZHHHT+1ri6G4ozIvE/T54FtQb3t
	36jSvJY4zGCXt2+L+edmbiu+YeUD/nNWt4A3lTIOEH5bLJAV3hnp02tGL4suQ8DB8ZyfyUoEhKt
	hv1iIToYvgZ3tqiS5WHggjhcbp+B7UWpo/Wx0K53c4pP4vM0zijMpfmUNPoUY6VFH5L8UcCPXbJ
	O7Zd29eGiDzS20fhmhudcl9SeiJPNzLo7+1sEtHUOLJQlcS+ZytHYzChUCUV4FpnzoCo+gP7WaW
	twojvkvOYPkIImr35OKiq/MjNbDe0EUvRLTQ8/8EIED62goiQk2Gr76vts1avcG1kwgSXNyV3Um
	epkf5i/pNa+9IJBAkKsT5rcODy3fBjoGxv1HTw1Ta0BGKWEceSNpg3SdDRGcrbeIXpvkKwNaVyD
	fc16EG+pT/CucydUuA=
X-Received: by 2002:a5d:5e02:0:b0:481:3db1:a62f with SMTP id ffacd0b85a97d-482c814fe89mr9514643f8f.17.1787471366498;
        Sun, 23 Aug 2026 00:49:26 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8601:39db:494d:605c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482c9bfcc31sm4279602f8f.17.2026.08.23.00.49.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 00:49:25 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/7] python3-hypothesis: Upgrade 6.165.9 to 6.165.10
Date: Sun, 23 Aug 2026 08:49:09 +0100
Message-ID: <20260823074911.1711858-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260823074911.1711858-1-richard.purdie@linuxfoundation.org>
References: <20260823074911.1711858-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2026 07:49:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244016

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...on3-hypothesis_6.165.9.bb => python3-hypothesis_6.165.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.165.9.bb => python3-hypothesis_6.165.10.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.165.9.bb b/meta/recipes-devtools/python/python3-hypothesis_6.165.10.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-hypothesis_6.165.9.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.165.10.bb
index 197989521e2..ccb6c6cf8f7 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.165.9.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.165.10.bb
@@ -17,7 +17,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "a5d1fa312020b499c517e1217ef4440c56a9b52e20b47b420b48a583a81c412b"
+SRC_URI[sha256sum] = "68b45e09834cd80523cb1eb274463073c7a9af4e4ef7cff34d9615f355572d32"
 
 RDEPENDS:${PN} += " \
     python3-attrs \

