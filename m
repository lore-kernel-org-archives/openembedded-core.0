Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web12.1868.1588791694332326887
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2020 12:01:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DM/+JGvA;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id z8so3485447wrw.3
        for <openembedded-core@lists.openembedded.org>; Wed, 06 May 2020 12:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SrP9YNM/hYtuqD5QDBYwLRCl8KW/AZ2JTqib//wv4+8=;
        b=DM/+JGvACbz6AOyXOS7Bz/MZYePa8iR6k91YYHrdgNmaHttnJa3UJu1xsX3dtrpB6i
         hDLO6PIlaK2IJX0Ti6K2X8JHgI+YLlSWNHAWHbLulpaUuMvwIOhkyhkCcViIvajnqX7F
         MV0FfkRcxhwlM7X7FzTNBUqSa4SKmM3S/DEzYAQ2Z7rJ2Nv/XkphOiZ9Qiqc9QQ2ugxd
         B3mF3ido0zQ2X2zs2UoQYWY+RJEmT+NUDlykAsYmWTb8G9F+MJyyELukVXYrwD+OHZph
         OPxcraXxj6fk/0uWmpPOTRH1WKrtJRGPpoL7g9DxGcaba4Rxj4mTCUJ+WLyEIHrHxEVz
         H1CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SrP9YNM/hYtuqD5QDBYwLRCl8KW/AZ2JTqib//wv4+8=;
        b=gd637ZTwtjzQe5RscNMELT6ElV2Fn0VUp2RggyA7eXstdf1LgkXBF68DaOU3tA5GzL
         2iB4c8RPllgunuA8iSKsLf9f6F9GZv+Fc5wBWrDYEC/aACFfkYSanX4Q1dxc64241m9a
         eQO2Dq4u2Inl26QJuHoVTD/9s7CS5YOl7jsH9fxeYkYDFdMKSNzWykrPkSPycOKcDq9b
         86kcVPUcKlVJzgVMvU4dP1UABcgB7HO9mB4TXljhEkYg6jP3EMuw7lYuYreBwj2dHb4I
         oVTf4baVTjH+RQGQAAFsOKu/mLBPzDbC9F0vcExdbsCWzs2V2cTbHdZHc+zdRkL8ua+c
         htPA==
X-Gm-Message-State: AGi0Puad5NN9pchcHqhrBQuvKst0NkbK1WSk18ze1vvo3g/4ml22ULGt
	+dohnOMOO8mm7egm3eOxhQYO7OXO
X-Google-Smtp-Source: APiQypJafJ3Zd/HVlEBMNeUmGxiMULkr2cSHz1ZySy0S3T3qNpYb3oT5IxNZQAH5hiSf930x3ZwjiQ==
X-Received: by 2002:adf:fe51:: with SMTP id m17mr10846031wrs.414.1588791692598;
        Wed, 06 May 2020 12:01:32 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id n131sm4197061wmf.35.2020.05.06.12.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 12:01:32 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 2/2] libepoxy: do not strip RUNPATH from native/nativesdk
Date: Wed,  6 May 2020 21:01:03 +0200
Message-Id: <20200506190103.6304-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200506190103.6304-1-alex.kanavin@gmail.com>
References: <20200506190103.6304-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This was done to fall through to host GL stack; now that
mesa-native with host dri drivers is used instead, this is
no longer necessary or desirable.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb b/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb
index af9867407e..0782c6ce35 100644
--- a/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb
+++ b/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb
@@ -33,11 +33,3 @@ PACKAGECONFIG_class-nativesdk = "egl x11"
 
 BBCLASSEXTEND = "native nativesdk"
 
-# This will ensure that dlopen will attempt only GL libraries provided by host
-do_install_append_class-native() {
-	chrpath --delete ${D}${libdir}/*.so
-}
-
-do_install_append_class-nativesdk() {
-	chrpath --delete ${D}${libdir}/*.so
-}
-- 
2.26.1

