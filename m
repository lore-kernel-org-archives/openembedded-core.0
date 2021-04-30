Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web09.13580.1619796873905832826
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Apr 2021 08:34:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=XgDGrYWl;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id z6-20020a17090a1706b0290155e8a752d8so1920468pjd.4
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Apr 2021 08:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=U/jslX3H+oTiAuD8oRTt7BPnNnACz/YOROt4DRmZDG8=;
        b=XgDGrYWlhJDfzjB6HbWSdP3yXthdzD2p+iVXtFdkN1CwINt8Pf9tL/tHoZvVVZoDOX
         N3U0tf6GI0YqcD5evE0K5h4hUz/W+2C1ytGviZxoNhTikl28Equ9avIlbyxSZzOS+4i9
         dSfDXHRQJytaKAkYIFgHQ51jzyJcwmxuUgdQWWTmZ/VzLECgfq2SmY0ZqCh7gO+2k3kk
         zVjFcUluMy4p7hVqPES2TVJqmR0rj1xVdC5vOjZLf76TUl9dplT8wXT9aInB9p1rWhQX
         A1jrMeO3SCz1Nwp9l+KS502+wCo7XWDrZm8XPiX1vMNSdmjkv+JSLbiY7/VXGBKDkPGv
         Qo9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U/jslX3H+oTiAuD8oRTt7BPnNnACz/YOROt4DRmZDG8=;
        b=Cp6gcEvnHUU70kPiqXt6NRcRmPuQPfhHOJRGc1O8F9IPGRZmLi910pvMz+zh3qWntU
         weUl9r+ReXBZ2P8VPVgDGrjV6ePyP+7qoZrzqJRLWebc3/VjB2FRA00az5mCqNLGby32
         7eqyyPSk9gloRj5eefrwN+8whlB0LWpbSY7XZMQ3LC8XO6Obl1oQV64cRPr3McW60ydT
         2c41x9i6VQuZKcffrWJxJ6H3r84i7phSAmIR6FsIhx3X+6sZlEMy3VWA4h5QojWgQFTk
         Ezcuvuluajs7WqEG0UIrxVKrgQ1YQveASeay1FxtN6sRKmBRf1IxiKUxHgtKiSV9rgJm
         U4rw==
X-Gm-Message-State: AOAM530opkENXkF5AsSt3MlDQl2eXAtQkInSQm54n6IdBgaNnkFL1u89
	kxSgL6Ej1Mqem1w5Ek9LVLFTbqzZaDoWV3Lk
X-Google-Smtp-Source: ABdhPJxqO9ZhKBGzxX4abiYAs6TIUsMFW3GtufKlNrR+yPpX2sajeeKWJob8oTNh1498Tj1u4wDopg==
X-Received: by 2002:a17:902:8604:b029:e6:60ad:6921 with SMTP id f4-20020a1709028604b02900e660ad6921mr6062623plo.15.1619796873039;
        Fri, 30 Apr 2021 08:34:33 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id x9sm2900386pfq.197.2021.04.30.08.34.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 08:34:32 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/12] cve-update-db-native: skip on empty cpe23Uri
Date: Fri, 30 Apr 2021 05:33:41 -1000
Message-Id: <45148918628ba797755f3cbb52f065ec6dbbcfd2.1619796615.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1619796615.git.steve@sakoman.com>
References: <cover.1619796615.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Konrad Weihmann <kweihmann@outlook.com>

Recently an entry in the NVD DB appeared that looks like that
{'vulnerable': True, 'cpe_name': []}.
As besides all the vulnerable flag no data is present we would get
a KeyError exception on acccess.
Use get method on dictionary and return if no meta data is present
Also quit if the length of the array after splitting is less than 6

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 00ce2796d97de2bc376b038d0ea7969088791d34)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 5d9fb59cbc..e86c69803f 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -132,7 +132,12 @@ def parse_node_and_insert(c, node, cveId):
         for cpe in node.get('cpe_match', ()):
             if not cpe['vulnerable']:
                 return
-            cpe23 = cpe['cpe23Uri'].split(':')
+            cpe23 = cpe.get('cpe23Uri')
+            if not cpe23:
+                return
+            cpe23 = cpe23.split(':')
+            if len(cpe23) < 6:
+                return
             vendor = cpe23[3]
             product = cpe23[4]
             version = cpe23[5]
-- 
2.25.1

