Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web12.3451.1611009475183854621
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jan 2021 14:37:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=vFy/uxha;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id x12so9385834plr.10
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Jan 2021 14:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=HjJT7/fH8gjDk4srI8W2ygxmSwrCCSzetXz56tv+0ow=;
        b=vFy/uxhaxrWz6VdQEyYu2yPywGcSKIr/9lMH0iLMhHAR4lawf+0xtg/3dB6lso/Fo/
         hMDSD+P6T9k+oKnml9W3eu4+UTBnjiIVzfsi+uxtCncokYIt5qxyyF7hedH2H6dRhM1Z
         7YxrT5jevHtvKV766t1fXs6hSMiN57fLJ0W6GqyfV10VIzmDXdbdZu06BQ9Fcpd9Lgz8
         /6QSUkGQnfxxrz9ZgG4vjUgPXEMni7nEdqbiCOagjsTnJ/oxRjwFIQ3HxYh0z6zJz5LO
         11YOLe6UDF8hiA/s01rto7uYROZ+CZBdPONGTneL5c5vqnkGrssGLRVO80KkiZduCAZS
         wvLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=HjJT7/fH8gjDk4srI8W2ygxmSwrCCSzetXz56tv+0ow=;
        b=T2UMNV0m1mo5RNr1KmwBM5MMa2LfuJPnHP3MK1JXEQd0pV5MnN0leuOwURSUUktKIH
         qSZVeRu49+6eVFe7qKwbbYqTttJGZ8QuGwkRCPqDTU6lI3AyegNBpcXivRycuhz2ualz
         05VqIMqdnABnAgryDW9svra3OMvrE6JKVlz27T6soUeJwLFce+SMyYmWF7OX44/K5bBX
         ZohkEBNewUx+RDIjaprwGpDMtk+rZK4yKdbuixO4XMyea7rNt0EIBGXd6yRm+kWA80zL
         iE6JYQ9OfwnFxVI5yTQj/kfflwvQIc0dN7kkEcUiFsr13Vbxnn33/EZeO/ys5wQTx62J
         eyYA==
X-Gm-Message-State: AOAM531D7KznBwmga07uf+SGpTjKWtheWx/nWcngzNo+SIy9B/FhsRPS
	QL/1qWZvn0hCd+nMpTXy9RMvZrSMAkXeK6n8Gjo=
X-Google-Smtp-Source: ABdhPJwrztFXH/ubccT0aOI6WlRIu2nRgURq+dz5weKdauqDFyZHTXsDWSNLEYCVHJln9tkz4511zw==
X-Received: by 2002:a17:902:6b43:b029:db:c7fc:82f3 with SMTP id g3-20020a1709026b43b02900dbc7fc82f3mr1426232plt.74.1611009474120;
        Mon, 18 Jan 2021 14:37:54 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.150])
        by smtp.gmail.com with ESMTPSA id a12sm16835556pgq.5.2021.01.18.14.37.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jan 2021 14:37:53 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/19] lib/oe/utils: Return empty string in parallel_make
Date: Mon, 18 Jan 2021 12:36:18 -1000
Message-Id: <c03c6105124e051dcd6da6880ae1a99fd4ef0836.1611009050.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1611009050.git.steve@sakoman.com>
References: <cover.1611009050.git.steve@sakoman.com>

From: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>

In cmake.bbclass we set CMAKE_BUILD_PARALLEL_LEVEL using parallel_make
function and if PARALLEL_MAKE is set to empty string then this variable
is exported as "None" causing cmake to fail with:
"'CMAKE_BUILD_PARALLEL_LEVEL' environment variable
invalid number 'None' given."

Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2f790ded554a52ac18d1c28002142f9c62abec8b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/utils.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 13f4271da0..83d298906b 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -193,7 +193,7 @@ def parallel_make(d, makeinst=False):
 
         return int(v)
 
-    return None
+    return ''
 
 def parallel_make_argument(d, fmt, limit=None, makeinst=False):
     """
-- 
2.17.1

