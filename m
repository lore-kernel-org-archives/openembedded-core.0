Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
 by mx.groups.io with SMTP id smtpd.web11.12660.1594996700764495833
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2020 07:38:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=teZAXD8I;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.67, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f67.google.com with SMTP id k71so6620374pje.0
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2020 07:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=mof5BWK4pyv4MHf+Kb+k6wuS8pwvM1ffrAUpv3GFx3A=;
        b=teZAXD8I0FuyJP7y4IaQWmgUPA818nwH4P+L33uQsjy1x+lCwda7TO/P39GJjunEsu
         snjyDl57qVejldwOK763VIOR6aqHg4ydUDCvJjd3yRsWULA5fkuj/hUsskDcAKAsRn5W
         7xph4PJ8XB/D1ETOPtA2hlT7IxwJdNp1F09HIiEA9wyStWlYmnYtAkTocUBV78IH1VNN
         K1au7Mt88BLKddS15gHmOQdN+UoMOeYjZ0HnzL4iiB5Fbr/YCZxFH2VCPyNMAHyUNB3s
         wB+codvpdCue1LUROuyVrHQmyNo9KBTKmQkWOKhVJg7/2rbnzzn5rFfeE2kDUFzsn3KN
         QMYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=mof5BWK4pyv4MHf+Kb+k6wuS8pwvM1ffrAUpv3GFx3A=;
        b=GcbzXp1VarTLecVR32YiZCa8FC7lNrebIfeIs0orGk6vDHQ+J9OO72iIRTHH9y9RuN
         VL/Tudn6x844py4+CN0WVFwG/QOuJ6F+QrnXWDpSI7A2gh24zdG/mHvToCFMdwtMhx3c
         6EjspPzzSl1CIFK5eYfODJoSms3+zTaAIczOtsf5Zw+Z/yLd9nV2UeZBxMCqz7qWQOgg
         cnzGoIqnelj0scYluMP6GnsJeoAP+IV/pBE6EZF3NkxNhcxdwC8MSs5rXfNhVX6PB9V1
         +rMojz1+fYwrG0gMi0lO3AHFfVtDVgx9pHINKCFqexRHxzdRlaZTJ29jJGTFw4tak5EU
         3nAA==
X-Gm-Message-State: AOAM531Wbn3u5a2LFUeUomRpzYYVBWPAQ16hZVgZBLoqZrJ9cDQYjxEw
	aoGvKuIeCaCHXxNi+QnMWYKf0P6BJgs=
X-Google-Smtp-Source: ABdhPJxJDojCxawHio53hqawADK84K5G6N1ehVHn2CNSxb8tGDfeAxGTKsLgE5j8iw/CHliKAs/7dA==
X-Received: by 2002:a17:90b:3748:: with SMTP id ne8mr9463573pjb.7.1594996699884;
        Fri, 17 Jul 2020 07:38:19 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id mw5sm3448727pjb.27.2020.07.17.07.38.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 07:38:19 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/20] u-boot: fix condition to allow use of *.cfg
Date: Fri, 17 Jul 2020 04:37:14 -1000
Message-Id: <4fc386279ef4616d1e103cb70facee5716d335ff.1594996440.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594996440.git.steve@sakoman.com>
References: <cover.1594996440.git.steve@sakoman.com>

From: Charlie Davies <charles.davies@whitetree.xyz>

U-boot recipe supports .cfg files in SRC_URI, but bug in conditional
statement meant that the code was unreachable and the .cfg files
were never applied.

Signed-off-by: Charlie Davies <charles.davies@whitetree.xyz>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 766f827df4c3f76b1ef06acaba3c4f160c3791aa)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index bed759c7c5..23cc795cab 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -89,7 +89,7 @@ do_configure () {
                 j=$(expr $j + 1);
                 if [ $j -eq $i ]; then
                     oe_runmake -C ${S} O=${B}/${config} ${config}
-                    if [ test -n "${@' '.join(find_cfgs(d))}" ]; then
+                    if [ -n "${@' '.join(find_cfgs(d))}" ]; then
                         merge_config.sh -m -O ${B}/${config} ${B}/${config}/.config ${@" ".join(find_cfgs(d))}
                         oe_runmake -C ${S} O=${B}/${config} oldconfig
                     fi
-- 
2.17.1

