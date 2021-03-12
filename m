Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web08.9086.1615559602279948805
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Mar 2021 06:33:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lYNwJPa5;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id g25so3927474wmh.0
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Mar 2021 06:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x0PtJQiXw3DDaxg7n9HaBFCTnfch2YQFgg6UnfTsNOc=;
        b=lYNwJPa5DlPji77O4E2A1Ul0VRR4CReagLGA8MVU+3G7vTGQsHiAM+E1U+fcOz/dKz
         cdMkC0zkNY42FhXb6G2Q3SepxRauCxpGaN5mu5u1rlq9uCT5LZVXw8MDjrpB3b8JJCgy
         QzmYvESSompayc5YjLfKdSPGz3NZOjn99y93eceHIT1eCOgOIRSDma9GQJMt9lqqfSRB
         BfMk76AeZFD10C1COS57xuQ73sTN6ZPMSb2ciEOa+Zt8ttulHWLUpWKXn4qA9G3KzQ9Z
         D/GVGdcrePhba1oGwmEmEtzd4iY2ukFPrTQygG9Ay7wguxizHL5gAiHnSPWYyH8eZ8MP
         SqSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x0PtJQiXw3DDaxg7n9HaBFCTnfch2YQFgg6UnfTsNOc=;
        b=qr9R4eCwsrbdJmcnvbiqh6Pqf3Idxgo1q7ni7a2CVopEwfNEX1m2YETTPo8kwdColO
         kCPeYcGzAQTUVwCFiqzLqxWjFCoxJFQEZ1EgdsPQJBPZ5mu+6AriRB7cRnbHEjjMgifG
         SD+ymr2+bQCrN6QpzpDvv8xpOrcg5pJoatA00Of4RaZ12MA1SBhgYogI2ynpuHB+TVse
         jDbr9ONr/8LItMyv+d/Gpipc1ofLRF+ypmbW+NBwHMq9cDShKSMCo/Ad0kGyN1fvRzsx
         qDx1gQLAeRrlIJ39xdIV8+AMQ18cX3sh8q1E2TubEEptfXotYgSxwpGvBJvcKj943OUq
         dLpA==
X-Gm-Message-State: AOAM530amxoHRM06AQvejzVtir4DC8rL5fKXq69XWHk+5ngbM7Y+2YWQ
	9oZPBcz/L++rqEZY3GrXY16k9+qiflQ=
X-Google-Smtp-Source: ABdhPJzMmT2e7HCbdx64m9sURaCz3dpE5uw3bEOI4waJa2vZAKg+tjeNVd7KSJCRn/niITbyuBUEWA==
X-Received: by 2002:a7b:c209:: with SMTP id x9mr13365089wmi.92.1615559600389;
        Fri, 12 Mar 2021 06:33:20 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id l22sm8106036wrb.4.2021.03.12.06.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 06:33:20 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] iso-codes: fix protocol in SRC_URI
Date: Fri, 12 Mar 2021 15:33:18 +0100
Message-Id: <20210312143318.1436912-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* it doesn't listen on http and the redirect sometimes doesn't work

WARNING: iso-codes-4.6.0-r0 do_fetch: Failed to fetch URL git://salsa.debian.org/iso-codes-team/iso-codes.git;protocol=http;branch=main;, attempting MIRRORS if available

The protocol should be changed to https, like all other salsa.debian.org pulls are, so that it doesn't depend on mirrors.bbclass to resolve this.
meta/classes/mirrors.bbclass:git://salsa.debian.org/.*     git://salsa.debian.org/PATH;protocol=https \n \

from log.do_fetch:
DEBUG: Fetcher accessed the network with the command LANG=C git -c core.fsyncobjectfiles=0 fetch -f --progress http://salsa.debian.org/iso-codes-team/iso-codes.git refs/*:refs/*
fatal: unable to access 'http://salsa.debian.org/iso-codes-team/iso-codes.git/': Couldn't connect to server
WARNING: Failed to fetch URL git://salsa.debian.org/iso-codes-team/iso-codes.git;protocol=http;branch=main;, attempting MIRRORS if available
...
warning: redirecting to https://salsa.debian.org/iso-codes-team/iso-codes.git/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-support/iso-codes/iso-codes_4.6.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/iso-codes/iso-codes_4.6.0.bb b/meta/recipes-support/iso-codes/iso-codes_4.6.0.bb
index 960989281d..f915716ce7 100644
--- a/meta/recipes-support/iso-codes/iso-codes_4.6.0.bb
+++ b/meta/recipes-support/iso-codes/iso-codes_4.6.0.bb
@@ -8,7 +8,7 @@ BUGTRACKER = "https://salsa.debian.org/iso-codes-team/iso-codes/issues"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "git://salsa.debian.org/iso-codes-team/iso-codes.git;protocol=http;branch=main;"
+SRC_URI = "git://salsa.debian.org/iso-codes-team/iso-codes.git;protocol=https;branch=main;"
 SRCREV = "3c012d266acaeda93d3e61ec11b8c18c1964fce1" 
 
 # inherit gettext cannot be used, because it adds gettext-native to BASEDEPENDS which
-- 
2.30.2

