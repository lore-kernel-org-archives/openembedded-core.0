Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web12.10042.1619186414283172969
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Apr 2021 07:00:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=SK6lMzAz;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id g16so8408316plq.3
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Apr 2021 07:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=LcHBlXq93IgNjcF9FtzSZ1wGoQIDizhfE/ksV1NsEF0=;
        b=SK6lMzAzM+nLX13lWUbKKpQNw+noZ+Tw4IGPBVar/pvVNX9+f8joiK+TWaCt/j6YGN
         VoT06UeIHkfZ86gaJ3hHpAu9PrIFoJo6rj0ZN1lCB4vGiEZNLE3egGPjmdFC33SXmg36
         fmRpw+Gi/A0kff/aj4Xl7Zh+6ceZMe1FG49ILQikMIOuT/M1qX3k0hWzrMs0LDiCrNlq
         gWQXveXLAOigOrHnHZV/Eusd/CTW92RvAo/eTleI76nW/U7ZPJltr41dVLTsDG14Hubl
         usULAH+cAQWYvCgtyF42XMKiFAJ6wDCJlSPs6waISNLpx6fN3zddQAfm5cPun9xOc72d
         trMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LcHBlXq93IgNjcF9FtzSZ1wGoQIDizhfE/ksV1NsEF0=;
        b=F3LRGbY6CanoC07LrFn5QTCjRO4ciCWU4B681vLErIPiaC6iwPM6Ly/CyPysOJJoHD
         QOB3p//WnCsPTeYIvtu1foVkNyfTSnwYlm9cxNNVOLRowZsuOB5yTKQP15L5hFbtx3nP
         mvr/U1dJY1RKGHIvsiO0fRnfDNkbKx9PwaI38E6NK+c22GZkdCc/MBGnnjj4MvjOWSL3
         E/9+y4SP/Tx8UmaRh0pxyPbCuSQo5u+7QDnDT8/pOXqSamOqZD1qXvOxNBrVvDLZUIr5
         dy/2Uo/C4+8moQk4DZhAHYDHYNpdgbsha0nrpEwlY1kd0yRWBcRnL1vpqt7xVQJUfYkO
         VrbA==
X-Gm-Message-State: AOAM5309nCZyKzEoZtwCXibL6iSIGpYpsUYtibtedk2jIVQX0Kj1FGto
	BiC/XRy0rwglXt5vS20rpyTVvQCc0COVVS6S0UA=
X-Google-Smtp-Source: ABdhPJw+82SnPVcdHfqqU36s/pxZL56nQhjVA0XS4Oq1P9MxBFTgslBdDgq6zIrW1EukAqpCO+p34Q==
X-Received: by 2002:a17:903:248e:b029:ec:b399:7d75 with SMTP id p14-20020a170903248eb02900ecb3997d75mr3835426plw.35.1619186413168;
        Fri, 23 Apr 2021 07:00:13 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id b25sm4988379pfd.7.2021.04.23.07.00.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 07:00:12 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/19] sanity: Add error check for '%' in build path
Date: Fri, 23 Apr 2021 03:58:49 -1000
Message-Id: <cce199341ab9a3d6678c57afa803ccd83806de20.1619186107.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1619186107.git.steve@sakoman.com>
References: <cover.1619186107.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

It has been reported that '%' characters in build paths break with python
exceptions, probably due to confusion with python string escaping. Whilst it
is probably fixable, showing the user a human readable error is better given
it doesn't work.

[YOCTO #14282]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 31a3cf78452270131a657be45e76569515cff7ef)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/sanity.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 866d066288..5b6b7b598e 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -887,6 +887,8 @@ def check_sanity_everybuild(status, d):
         status.addresult("Error, you have an invalid character (+) in your COREBASE directory path. Please move the installation to a directory which doesn't include any + characters.")
     if oeroot.find('@') != -1:
         status.addresult("Error, you have an invalid character (@) in your COREBASE directory path. Please move the installation to a directory which doesn't include any @ characters.")
+    if oeroot.find('%') != -1:
+        status.addresult("Error, you have an invalid character (%) in your COREBASE directory path which causes problems with python string formatting. Please move the installation to a directory which doesn't include any % characters.") 
     if oeroot.find(' ') != -1:
         status.addresult("Error, you have a space in your COREBASE directory path. Please move the installation to a directory which doesn't include a space since autotools doesn't support this.")
 
-- 
2.25.1

