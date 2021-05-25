Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web09.9125.1621946463696237315
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 May 2021 05:41:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=F1lnoZKj;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: samuli.piippo@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id e11so37870573ljn.13
        for <openembedded-core@lists.openembedded.org>; Tue, 25 May 2021 05:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=2hDitnxjbC+sA5k1TFl7MtFi/8FTSzadKmWmddGaE4M=;
        b=F1lnoZKjpqHkDR7asf6KnGIY31S8hZLjZW/zVIKqsbMMoOEdlowY5Mc5ZFWy9jHeJ7
         NtBYzTnLM7ez1a75ORlJ9PzKnwV+9HBxCpTww7rDey7+KGpiE9rhMv+OUuVa34ubgFp5
         Q0uhpEjrVT9Gxh1yC94fUICWfiVklIVWRwuQYDyaL3UiYR2BrjkxjRR1SEaSw3gO0pNH
         C0E9+uJs3kHlYJP/2hY2iaak/rNGXR6q1zxIy9bLAgrRmk+4z4MaK09YvBfKoKUIqJeP
         Hl98NWrb/fdV4d6S/9wTzP3lYOAgtFSKijhS20BsYyrl+bXeSKiY2dNhbYGf+ufSDnd2
         Fibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2hDitnxjbC+sA5k1TFl7MtFi/8FTSzadKmWmddGaE4M=;
        b=oAdpDLdm+AU7NHuN9Hq7Gxg18phlJVwb/LvddgUc+WWb0e2pXtoshNcfOdMPxEWfJI
         QFQx+UyO/J6VgXjWGg18ndXYupGAbt2BKcuSIdOjlB/rI/uVrXOi6qRkP6nhqmTKyjvE
         f5anGzht1DudOEkoB95jvoCl7mBjG1NuKeXwDUiQXTwITRmjthymCUI5N72VW6vRP8dg
         Bmp9b9h9pr1L+bitpxu5NlP55YhSTz1JYDzsaOTRSBvItdMB/E0B+VQeTiBvi50bcWq3
         SBz8IGHR/hTIPRsJ8mPI73vFpez5HULWoc+DvASVLEAgkNPHpBtcmhB5JCDT1CjdUlks
         wpDA==
X-Gm-Message-State: AOAM533Juxm7idhrZZewIqh0UpJ1de58tfAcjF+VrkXnbqEP8oaqsI+j
	6FWHHO+vz6X2/G9CSooYui0FiYTLhjZYslaY
X-Google-Smtp-Source: ABdhPJzkdjy1pzSFQX8Ra9z1ewbUK7E+4GLxcZzsQ7zlyjfwfkHqZIbFfzkH0wNeGYO2ycPnOEXS/Q==
X-Received: by 2002:a2e:a374:: with SMTP id i20mr14506549ljn.149.1621946461734;
        Tue, 25 May 2021 05:41:01 -0700 (PDT)
Return-Path: <samuli.piippo@gmail.com>
Received: from munkone.intra.qt.io (62-183-187-94.co.dnainternet.fi. [62.183.187.94])
        by smtp.gmail.com with ESMTPSA id t1sm52507lfp.168.2021.05.25.05.41.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 05:41:01 -0700 (PDT)
From: "Samuli Piippo" <samuli.piippo@gmail.com>
X-Google-Original-From: Samuli Piippo <samuli.piippo@qt.io>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/2] cmake-native: enabled zstd support
Date: Tue, 25 May 2021 15:40:48 +0300
Message-Id: <20210525124048.282824-2-samuli.piippo@qt.io>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525124048.282824-1-samuli.piippo@qt.io>
References: <20210525124048.282824-1-samuli.piippo@qt.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CMake depends on having all formats supported and build issues can
arise when zstd is not available:
https://gitlab.kitware.com/cmake/cmake/-/issues/21552

Quote from a CMake dev:
"As far as CMake's design is concerned, we have no optional formats.
All should be supported. That's why we bundle sufficiently new versions
of libarchive and libzstd. If a distro builds with an older libarchive
that doesn't have zstd support, then that is not a proper packaging of CMake."

Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
---
 meta/recipes-devtools/cmake/cmake-native_3.20.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.20.1.bb b/meta/recipes-devtools/cmake/cmake-native_3.20.1.bb
index d91e42ef9a..335097d387 100644
--- a/meta/recipes-devtools/cmake/cmake-native_3.20.1.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_3.20.1.bb
@@ -1,7 +1,7 @@
 require cmake.inc
 inherit native
 
-DEPENDS += "bzip2-replacement-native xz-native zlib-native curl-native ncurses-native"
+DEPENDS += "bzip2-replacement-native xz-native zlib-native curl-native ncurses-native zstd-native"
 
 SRC_URI += "file://OEToolchainConfig.cmake \
             file://environment.d-cmake.sh \
-- 
2.25.1

