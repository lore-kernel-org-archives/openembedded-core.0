Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web12.3934.1619649673624905836
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Apr 2021 15:41:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pJMQGmby;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id t13so7520926pji.4
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Apr 2021 15:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/aehQKY2kzlGPQpRCcn52TC1MzZ6AETczEbyNW6xKMI=;
        b=pJMQGmbyXzi8EWr9tTL4YeaICk8wt+PV5GvZyySs6dVgnd+noI6pZlWWvhv0zpY/Lb
         ywAf72aZ/rxkiP38BD/cK2NNZaxEYVsCOj73t3Yb63C4zfLxvSKCu6HdpDG6R1YiZqor
         aBWaTjv8wFQP/x2zNylXXkpm4rKSFlBMcxrZO80OBUWSu6XGErXORb9+cD9TX7M5fcMC
         E6ddgftfX46ymOxaDRUAoY6ykKoBhAl9NidPYci2KPiTPcTGizmHmkbwep2dafGQ6TXd
         SEcNx8d55drhUZjizT0LInTXNR5mnwq3+yzN6t0GpgqtJ/U6eUcEjPxBOyrTXsiF3TSg
         jf1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/aehQKY2kzlGPQpRCcn52TC1MzZ6AETczEbyNW6xKMI=;
        b=goDf9QTuHnzNYdC9GTRDlFLGvy7jP7ulZrCPZlZMpkQ30fR3u9Gfoe4LokVVxdlLgt
         ignGqxCjxVMZJuKnIrZmzaf0x/f7wywx7dbJrYFjHCXl9wHi/IWHP4KE9o/iY49l98JR
         Bl+7icg688U+GeFwHEqDQs9tqhByNCcvnHDIKNrQZJPu503rJyBKhmqWK7dCdZ+5eAkT
         B7WS4DqaTrtIUHOXIFC6hV8J/NWCwAipj/Maa3atpkERK4fPGI+Aitv8Rt4U4p17/jza
         vl8XaCSCPOAOGnaJ1bYa4frfvpqZV7UXdPC5nrzij2wP87YSi5a+RxNgLl/nOhPJIet+
         vsLw==
X-Gm-Message-State: AOAM530GVuXYz5z8iAEyVfGmVXwL/7bKXVPEvvbZbBS3Zl6pS8CuS8Dm
	IeQx9PobKvwJP/pNs03BrTlC80cQoJ+PQQ==
X-Google-Smtp-Source: ABdhPJwSFNfkvJoXy1Y7JLgNlIRlOfXmlUBWhfl6khqYwA/zOF0B1LP8YPe3OLXAFmEtvXI8+FdLUw==
X-Received: by 2002:a17:902:bd09:b029:ec:7e58:a54a with SMTP id p9-20020a170902bd09b02900ec7e58a54amr33737606pls.62.1619649672861;
        Wed, 28 Apr 2021 15:41:12 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ef3])
        by smtp.gmail.com with ESMTPSA id w123sm598444pfb.109.2021.04.28.15.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Apr 2021 15:41:12 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] ltp: Filter out -ffile-prefix-map
Date: Wed, 28 Apr 2021 15:41:09 -0700
Message-Id: <20210428224110.3511598-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ffile-prefix-map is also needed for reproduble builds and when
introduced can be handled

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/ltp/ltp_20210121.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/ltp/ltp_20210121.bb b/meta/recipes-extended/ltp/ltp_20210121.bb
index d98c9fdc25..b99d64135b 100644
--- a/meta/recipes-extended/ltp/ltp_20210121.bb
+++ b/meta/recipes-extended/ltp/ltp_20210121.bb
@@ -78,6 +78,7 @@ do_install(){
     find ${D}${prefix} -name Makefile | xargs -n 1 sed -i \
          -e 's@[^ ]*-fdebug-prefix-map=[^ "]*@@g' \
          -e 's@[^ ]*-fmacro-prefix-map=[^ "]*@@g' \
+         -e 's@[^ ]*-ffile-prefix-map=[^ "]*@@g' \
          -e 's@[^ ]*--sysroot=[^ "]*@@g' 
 
     # The controllers memcg_stree test seems to cause us hangs and takes 900s
-- 
2.31.1

