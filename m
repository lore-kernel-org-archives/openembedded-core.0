Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF2CDC7EE30
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 13:38:33 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.11122.1751377104798382728
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 06:38:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=n+9cY5Ek;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3141b84bf65so5473589a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 06:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751377104; x=1751981904; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m2jkSQsusCSIuqw1LWPNPFwA+NrZLTPmuwSgy8AZosQ=;
        b=n+9cY5EkbiwZhKxguTsazPHp+AcGJ+ov39fq6Vdyf5EiOsuL3lbuBeN29X0L+AgbYf
         g0TMzyO6/U5vJLs3dX7yunlHbnBu35zWBwpMFJFS9SytlE0IOXTw/2owDMhK0meGpDYB
         4ROrD3LFI3v11ssmnkd0cqE/Megh/HRtyDyGeUAaBrMWEWTUyTuOfGAl5lR7d6/KZ2lz
         EtO85tvkpqWrTx/CyaCEHGSvb3HtqKSS1jeaDQ+1HGq+oGTWmran6CG8zkw/DgiyO8cN
         YtvL2wtSkv+LSjuojmbmETUUO9dOx0GPO4iWk1+IWw4lhVV0tPTqhqiZ7bKdDTm3TCyD
         uLAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751377104; x=1751981904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m2jkSQsusCSIuqw1LWPNPFwA+NrZLTPmuwSgy8AZosQ=;
        b=Kzz/uPLUGsHl6yTCmoFTc/tgLt6q6qFveY6EDCIlOSFnflHT10OhOeaiXEAY6olld9
         3LAzvdkF28kbLsbrpFeMtkq79hQoiacKZYAAB+fX0egISDWKS090MZuaHUKHaaxWvbF0
         DxmdP9c2gMteRYfQsGXcEUVB2IX65Gf3yD6GUp+ZP0oMlKs42xgLz1sAyh8kym4vK4VX
         gqMBFY+YppYYoWRyWTDzNgFGrUnLgpXWxCQ3w4wWxms74hRzFLeaRkUIA/fkZktGuH/I
         uQGnq0YcElthCqlnm+Hpw2RYR1J1dQBU9T6SDgXP2Hc9iDhEIeB9sELqjOqDAtvBLN+f
         cObQ==
X-Gm-Message-State: AOJu0YwOuwbssqaDLP4Y7/VRMeiVrTciHfdMKXjkpXNJSbJpkMNyXdUm
	H+8RH/fiGiqKwuuqWxGxDO2gnipjMoyS3nVjN86l/JhGXLqGB8PWwqEcd60dAI94YDoZZgP1sfl
	ztRJt
X-Gm-Gg: ASbGncuVxqB6Yri+4sLffHJ2ltN1M9a2zaP8a2OZGIhROYY7m9Ww83G9ZIt+Klcluqi
	pbAwUNxruMOVurinD4Z0EHrth2pJDG128nLVwr8x+efpEThbFbb3A1PDC4aR4WhEFo7kS/a+P0d
	wAp3ngg9tblX0MCZovnwYUEF7JHxvyggqDCLq4WY7d0MuFeW/Rj7u9EZC/u6aJ2izI2FmOA9tol
	9Gkg55jJBhKn0fZ0kYX7lyWYvVOvG5UvvkRP1aulvR4XAp0LL56C0G/JaVihfvxYNvBX+mbXY92
	WowSKNk/MslQM8liwYSqCzKcutJLOIHyldUDpTTtZ8Y0bI3eaNzofw==
X-Google-Smtp-Source: AGHT+IGYSgigoYh8zTx3HvtR4JTObpDx1Szgw47++i7bIrsVPd1vldS1GRPIp5fVQ/QrZV75LHtH+A==
X-Received: by 2002:a17:90b:3c03:b0:311:c970:c9ce with SMTP id 98e67ed59e1d1-318c930ff71mr24128616a91.28.1751377103980;
        Tue, 01 Jul 2025 06:38:23 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:34f8:320a:2e39:118e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-318c152331fsm11466117a91.44.2025.07.01.06.38.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 06:38:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 05/11] python3: drop old nis module dependencies
Date: Tue,  1 Jul 2025 06:38:03 -0700
Message-ID: <cbc7b1ed7747ef69d8bcbaee27c90560ded713d6.1751376952.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751376952.git.steve@sakoman.com>
References: <cover.1751376952.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 13:38:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219576

From: Guðni Már Gilbert <gudni.m.g@gmail.com>

libnsl2 and libtirpc were build dependencies for the nis module.

The nis module was deprecated in Python 3.11 and removed in Python 3.13

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/python/python3_3.13.4.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.13.4.bb b/meta/recipes-devtools/python/python3_3.13.4.bb
index 5d904d6207..5b49fee3bf 100644
--- a/meta/recipes-devtools/python/python3_3.13.4.bb
+++ b/meta/recipes-devtools/python/python3_3.13.4.bb
@@ -72,8 +72,6 @@ DEPENDS = "\
     bzip2-replacement-native \
     expat \
     libffi \
-    libnsl2 \
-    libtirpc \
     ncurses \
     openssl \
     sqlite3 \
-- 
2.43.0


