Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web12.2079.1619640883047212455
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Apr 2021 13:14:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NYQQzrgp;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id t22so10307621pgu.0
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Apr 2021 13:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K4GPAry3Aok0s1JqXTBrLcUteYCMwQkDvf+KG9+Ojvs=;
        b=NYQQzrgp0hxrLmdUMtqnEmrduMALUYW+6L3uDYi27polrfq9uSGbkimRyWwRZhJ/qq
         YxJEr+19lXo30udh4IMIjcz1FBZxNIDBAwzljKJwz1usJdmIw1Q2LUBblJfwQ5mSr+2C
         l3ox9rM0fHMxsvgqwZQZtCyShByDhKgSdh4BEC0wmgtSEe7RZbW64wAkHmc3lWed3EIc
         PmkoS/lVTgCi9+vAZUFHOd6hd0JiC1jkTAHpKLDropGxYql3D2zME3Rsw6We29tOnI30
         5AHlV+UrK+oHbwoNeb12+58VmtTQz7ngexXYkVzrcaNJDJU46mEB5nKWULr47ox+NMkg
         wEKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K4GPAry3Aok0s1JqXTBrLcUteYCMwQkDvf+KG9+Ojvs=;
        b=g0N+x+uKYbjD6Fq8D08luHndPm9V4YR3sAtZBF/xjNQ+Rfxo8Hk1GWeMys504ReHIn
         nX0WQyyx7/61xBrnTjmqZ8TMxi7/Za8YFIS5zvHauTiHOmq8/74qAxhrcTTC7NEEHfkw
         Z9L8mqSQNBsIWDGmGz0kctGfpBXg6UcrOlPprKsAFU0gK/sLrelcL+6Bqoes7VqiAqDw
         N9nkGszWCP1dDewVCEhj94lPNzSLsTLeHOBYRNukx56nkUKOvz2do7+CI/ZcTalXwjyi
         kh8oWAu1pWp3JDBTiYg+N7QzU1ZZqcSyQUdLWwyaTsQYerg4r0woNr/7Qy+bIiK7IPKB
         +/yQ==
X-Gm-Message-State: AOAM533x3Ony8v7nAwn4J199aLXKUug1i3my8vwfqtyA/1cA+OlAKX2h
	VQme1l1v/h6JJiSu0JDhEreMvytXxzHB9w==
X-Google-Smtp-Source: ABdhPJyEY7OcX9r6iYaH8XkNpIT9zZaTAasMYINxvouTkwUFWtBP/W/ugqCiGsf9JuqLVZIeBXVjLg==
X-Received: by 2002:a63:5963:: with SMTP id j35mr28471590pgm.281.1619640882309;
        Wed, 28 Apr 2021 13:14:42 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ef3])
        by smtp.gmail.com with ESMTPSA id 15sm464919pgb.61.2021.04.28.13.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Apr 2021 13:14:41 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] gcc-runtime: Fix __FILE__ related reproducablity issues
Date: Wed, 28 Apr 2021 13:14:40 -0700
Message-Id: <20210428201440.1902173-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

libstdc++ uses assertion macros which use __FILE__ macros and

  if (__builtin_expect(!bool(_Condition), false))                      \
    std::__replacement_assert(__FILE__, __LINE__, __PRETTY_FUNCTION__, \
                              #_Condition)

This ends up using absolute paths into build tree for the cases where
the charconv header is used, therefore replace the file prefix paths
with on-target paths to make them build dir independent

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 2aca96c408..59d9a24686 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -60,6 +60,7 @@ DEBUG_PREFIX_MAP_class-target = " \
    -fdebug-prefix-map=${S}/libiberty=${REL_S}/libstdc++-v3/../libiberty \
    -fdebug-prefix-map=${S}/libgcc=${REL_S}/libstdc++-v3/../libgcc \
    -fdebug-prefix-map=${B}=${REL_S} \
+   -ffile-prefix-map=${B}/${HOST_SYS}/libstdc++-v3/include=${includedir}/c++/${BINV} \
    "
 
 do_configure () {
-- 
2.31.1

