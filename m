Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web08.222.1616596781386792466
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Mar 2021 07:39:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=HJOh0Dr3;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id f17so8044059plr.0
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Mar 2021 07:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=G1/jgt1g2TtFVzH0sYn3JWIzdwL0ah33weJ5AodRpqY=;
        b=HJOh0Dr3Y5nlQH+rq1gZ7ZETQSheE2GDgESWjnj9uUmGocIxsqI4qjiKA+xz7bdh95
         Tpq7vVNaooXpD9wlNPsDiXC0UniMfO8E8unPzAKCckbWaCcKM6UwcVreC5Rsy2AHwaVc
         N9sh5qduj6kdwnB/FTRGANCr4/sLAKGmRO7ypuEO6v4ALmzQh0E/vL8TzYzylkIchgO/
         umzdyTZpueZ47LCpMM54dXOkodQJT37lcgUNxEO7a+brs6Km12ZRxB+ocxagsAaF8pw+
         Hk1M1Rc3g/jMOgSIT+W2/GOFtrIRo2SliG+9ukT9zdlYxF6R/iOfMDlhb5n7bwwB6Pdm
         UuIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G1/jgt1g2TtFVzH0sYn3JWIzdwL0ah33weJ5AodRpqY=;
        b=lCM/0e7FzKFVqpVH8xucA8el6NzG1N6LqE2KT1QU2vOztNDDMhYZMWAMKThi0BbsUW
         IbBeZCuwjxJ4ZwAzSSuGoDkFWLa4S2LB2Emvhw62epPtsgVD1jDBGt4B9JqLYXZyzttc
         FXcwGceBlXALPPu12SXmQrZOOsscACJ64LkpLnLHk9w8SPTOd90gExRCfWApatm4PfDA
         dvuhBV6Nmr1skjs63JAib+B99IB/RH1diIBHTmxl0g7YdjZIcwcU88mIEdh7470+Oq5k
         GKaLZf4zpzNOD7pQi7FhyulBcFrTztWzwkWywrLN57j/jzlD/Tuj4qsIFYSfEZRHt4TY
         lM+Q==
X-Gm-Message-State: AOAM5308yJFl1qW9SUzZlrjqB040tPGPXiVDCKzue5rJVkJ+SYXrN5Eg
	vQ9n/pAj5EEsqiAYYsyE+hNf6V4BR3wyavqH
X-Google-Smtp-Source: ABdhPJwnh//apd8UupppzXkdNUeao3+WpY974IY0qWnqMVPB0xPh1yYknq/Fo+dWhGyl2fj2FWgNAg==
X-Received: by 2002:a17:90b:ecc:: with SMTP id gz12mr3758204pjb.79.1616596780390;
        Wed, 24 Mar 2021 07:39:40 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id w17sm2705806pgg.41.2021.03.24.07.39.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 07:39:39 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/21] iso-codes: fix protocol in SRC_URI
Date: Wed, 24 Mar 2021 04:38:57 -1000
Message-Id: <e739b039aebcd1ca839b0460e950d5b8bc2e3cdb.1616596544.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1616596544.git.steve@sakoman.com>
References: <cover.1616596544.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Martin Jansa <Martin.Jansa@gmail.com>

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 749eeb8cfaa8ffcfda29f3f06a77debaf6304288)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/iso-codes/iso-codes_4.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/iso-codes/iso-codes_4.4.bb b/meta/recipes-support/iso-codes/iso-codes_4.4.bb
index e3c521c514..e8210eca9b 100644
--- a/meta/recipes-support/iso-codes/iso-codes_4.4.bb
+++ b/meta/recipes-support/iso-codes/iso-codes_4.4.bb
@@ -8,7 +8,7 @@ BUGTRACKER = "https://salsa.debian.org/iso-codes-team/iso-codes/issues"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "git://salsa.debian.org/iso-codes-team/iso-codes.git;protocol=http;branch=main;"
+SRC_URI = "git://salsa.debian.org/iso-codes-team/iso-codes.git;protocol=https;branch=main;"
 SRCREV = "38edb926592954b87eb527124da0ec68d2a748f3"
 
 # inherit gettext cannot be used, because it adds gettext-native to BASEDEPENDS which
-- 
2.25.1

