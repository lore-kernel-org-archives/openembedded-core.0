Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.15373.1631124095177982949
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Sep 2021 11:01:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=E1xfiVnd;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id i28so4587640wrb.2
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Sep 2021 11:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UW67Vz9o+V/Em6gYXMKsg7K3xebTTZ0YlNgf6RVD9Mc=;
        b=E1xfiVndEW4qtNuiuizRSRgBj+Wvef+Q8jltq79ypvL8yK263xNLJrPD5UXNU7VRuY
         Saf5piF9rF5Y+gOJ5ziIqFGHISYNTKLoM2Vzc0gBq5lSkfIqMJDOSOb18Ks+oYl8svxE
         0pjLJnEYvOxrEclD6M7LKxE/17aqK7L5jkoIOKENEeLw84o/N5+SZwcdh71ZWK3bXtYE
         C2l+HaTuG8/+KBCciAyoA5skUoSuqaXku5Y26PyA5hZNkz7JVKeCDIugMxDzuK6K3oH2
         W4i/B1CF4cXeIP6jFVUeGVNzTVhHOnsv7M9zwWb0n3iNTXxIQgO83+Hvb7F2xPQBBaYz
         hbMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UW67Vz9o+V/Em6gYXMKsg7K3xebTTZ0YlNgf6RVD9Mc=;
        b=yyuJzc6IxvIpzXaZjHaHarRivsxpYFJafX8jwiAtfUJwZrRx4udUZW4q77JqOZD2z3
         RPn5hpWrOMstRGn42uQR72B6oA19U22WpK1UaoL7grlyqEASj6Z1VRgFr/tEGdpxwmxC
         VayOXkM2jAgVX8Oex4njsOqfMsDySlVxV40opOeZXAh5DxIoDY3LjysUpqhk62RLt/Cc
         JHomMkHTFEBy2BUM8cg1Mf0iT7ZfTf42GsN3gEqQ3+Tj0MqZhXYMYjQjzlbIanm7frJR
         WRFgwnBLvNtBobG7UVbfs4F7PviudFWulY208lsmaascLCrN/m6qCdvAoJIcnMu/WLUj
         PTKw==
X-Gm-Message-State: AOAM531ZHS4SWsgfUMY3Whze6LOWIl+kSQ986WWwSutMNPL9/H/1QU8l
	SD54CU6PmtaYdorooHAGJZ3Fs2mP09c=
X-Google-Smtp-Source: ABdhPJxNsqLhO32MTqY8oOsJnQCYDjhbVvaPy0SroVYIo72X4kC8jGEn97WIMyAkukWkOPbnB8ZoMw==
X-Received: by 2002:adf:b743:: with SMTP id n3mr5463990wre.243.1631124093834;
        Wed, 08 Sep 2021 11:01:33 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:29b:3b00:d35d:e3cf:58b5:748b])
        by smtp.gmail.com with ESMTPSA id s14sm2539648wmc.25.2021.09.08.11.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 11:01:33 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 07/26] libsolv: disable rpm bdb format support
Date: Wed,  8 Sep 2021 20:01:06 +0200
Message-Id: <20210908180125.103473-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908180125.103473-1-alex.kanavin@gmail.com>
References: <20210908180125.103473-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Otherwise this causes runtime errors when only sqlite is present.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-extended/libsolv/libsolv_0.7.19.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.19.bb b/meta/recipes-extended/libsolv/libsolv_0.7.19.bb
index bb925073ed..d30e61e9d9 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.19.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.19.bb
@@ -20,7 +20,7 @@ S = "${WORKDIR}/git"
 inherit cmake
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PACKAGE_CLASSES','package_rpm','rpm','',d)}"
-PACKAGECONFIG[rpm] = "-DENABLE_RPMMD=ON -DENABLE_RPMDB=ON -DENABLE_RPMDB_BDB=ON,,db rpm"
+PACKAGECONFIG[rpm] = "-DENABLE_RPMMD=ON -DENABLE_RPMDB=ON,,rpm"
 
 EXTRA_OECMAKE = "-DMULTI_SEMANTICS=ON -DENABLE_COMPLEX_DEPS=ON"
 
-- 
2.31.1

