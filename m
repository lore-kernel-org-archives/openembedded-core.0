Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web11.2149.1606246399036190720
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2020 11:33:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hqXY3Mh7;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: toertel@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id k9so15365245ejc.11
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2020 11:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HbUSeIqQBQpnGht1Ymn0ua6nSB93aePpPtaq17AvUiY=;
        b=hqXY3Mh7IjF0Lh2AJOxhHm/66WuYe3KLcZBj+DGSmYIXgZcCoWOaeRd38JUSYM2wBp
         RlA2fFT9N8wER40Uebj+ybRaHmYXNLQwUNOm55Ng5jB4e8O43vddLGihNhMXP8f216uo
         9oFwpfyoqDbylTbIwRXajNtc1zwvQfmVY5kVB0CGw4QJ+G0M6r2lDL1farkTPilwPCYb
         k9TRhe5iEyYKr/KVO+Yow3qE3x75dLhJLHj7H4Wru7eCkMxVTCsizJ8tUd6yTSo9kdPG
         ubCe1mDOOk/jtsDVWOWk+oic0UV4hXPRhKuZNB1hFvDcW8oh+G/S/gyaGBH2TvXl9N8c
         +yFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HbUSeIqQBQpnGht1Ymn0ua6nSB93aePpPtaq17AvUiY=;
        b=C3eRIqNOsNyWtPVMPlndGPC9NDq+A9yqr4NiZlBUrQtMtSrkV7vODuWiv9FMePSoa2
         Qsi+kZtX/0f0hTo6OUl6A0wVV/sqNEb1BnkRhOwP0IFQruq683D4+vU8pyVhwvOFlWwj
         ipJbM0EE9G7DYOPccvfdwDJ3KMaIamt5vEbgy+BThCj5QTd4SEj8Jx8uBZKmAZb4IZhf
         0nzcs4g9g6JWL57S8g7gVj3pfpPmUFOWnnxxfwbCVonjw1firLxa8pp4DlyBdkGIEeWW
         kxm6FOPiufFdfVMJBi9rGAUGeTQ/4gFtfoKKSBwkODbaLMV76lhg6EqnCo4TIJEox/NB
         ZJnw==
X-Gm-Message-State: AOAM530sH3tggf67r5HnipmlqX4odlaOB6cs/LJtcGMJKzhqRokAdIpP
	MRbVSk44AtrjhAJQxNzH/WA=
X-Google-Smtp-Source: ABdhPJwxvOW1GR5sa5kped9poIVJuykWICosgMF/j/Y/qm4lx7qJF4pKGnzcjUku5zPmRFJ7nSb/Og==
X-Received: by 2002:a17:906:2742:: with SMTP id a2mr5368157ejd.219.1606246396885;
        Tue, 24 Nov 2020 11:33:16 -0800 (PST)
Return-Path: <toertel@gmail.com>
Received: from gigabyte.fritz.box (p200300cfaf38a20061ebb7657b8c9848.dip0.t-ipconnect.de. [2003:cf:af38:a200:61eb:b765:7b8c:9848])
        by smtp.gmail.com with ESMTPSA id d14sm7685116edu.63.2020.11.24.11.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 11:33:16 -0800 (PST)
From: "Mark Jonas" <toertel@gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>,
	richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	Mark Jonas <toertel@gmail.com>
Subject: [PATCH V2] libsdl2: Add directfb to PACKAGECONFIG rdepends
Date: Tue, 24 Nov 2020 20:32:50 +0100
Message-Id: <20201124193250.7351-1-toertel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201123191349.7503-1-toertel@gmail.com>
References: <20201123191349.7503-1-toertel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PACKAGECONFIG[directfb] already adds directfb to the build
dependencies. But the automatically generated runtime
dependencies do not add the directfb package to the runtime
dependencies. Most likely this happens because libsdl2 does not link
against directfb but uses dlopen() or similar. Thus, the runtime
dependency to directfb needs to be declared explicitly.

Signed-off-by: Mark Jonas <toertel@gmail.com>
---
Changes in v2:
- Add directfb as a rdepends instead of a rrecommends.
- Rework commit message.

 meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
index 2ef7d2e5ef..5fa99821c4 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
@@ -58,7 +58,7 @@ PACKAGECONFIG ??= " \
 "
 PACKAGECONFIG[alsa]       = "--enable-alsa --disable-alsatest,--disable-alsa,alsa-lib,"
 PACKAGECONFIG[arm-neon]   = "--enable-arm-neon,--disable-arm-neon"
-PACKAGECONFIG[directfb]   = "--enable-video-directfb,--disable-video-directfb,directfb"
+PACKAGECONFIG[directfb]   = "--enable-video-directfb,--disable-video-directfb,directfb,directfb"
 PACKAGECONFIG[gles2]      = "--enable-video-opengles,--disable-video-opengles,virtual/libgles2"
 PACKAGECONFIG[jack]       = "--enable-jack,--disable-jack,jack"
 PACKAGECONFIG[kmsdrm]     = "--enable-video-kmsdrm,--disable-video-kmsdrm,libdrm virtual/libgbm"
--
2.25.1
