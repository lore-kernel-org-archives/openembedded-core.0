Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.web10.10598.1628177870061219980
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Aug 2021 08:37:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ABMI6dax;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.41, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f41.google.com with SMTP id y14-20020a4acb8e0000b029028595df5518so836406ooq.6
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Aug 2021 08:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=vc9ZFZRl7cY8qtmaQ0y0Z3Vz1KqEJYT5AXHfly3K4Yk=;
        b=ABMI6daxP0q/Ur5l96JstXjG8UbybXVQ1e0nFf37SD6efJTw3U0sXYl90GDQDPw4Tl
         kkGRf8hN7a13R3kIkHfQOvwwC7FNnl6nMPRbu5Ayiq8QKw/li35xiwTv0Ju7zfbTDDJA
         O30O99n8f5p/Q+bwvTpYNcE6359uTedek3Ly5cJFj+PSWxmZPW7j9Ja6fZVhCVDSlc70
         +0CE1RfhpGlcDRDyZ6eBEcuANVTlXKCBVMkp2gZSm7UJOftl5EHezCRO10p/G7+eml1L
         aOgVFtdfdIH54aZ9T6KbyGTjwsgY4JaDyfY779Hknqs06m26sP8AYQw5HLmhh61uUekv
         KTYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vc9ZFZRl7cY8qtmaQ0y0Z3Vz1KqEJYT5AXHfly3K4Yk=;
        b=SlmmgLOJ7lVr+LtZq1Tz2amVQd/QQsyvSv/FVTLA3bbCSAOGG7gObN70U5ugxAW2fr
         ABXezphA/mqlQRevJSlQ5/XincqXvAo9KKnZRa3g2as6ADSPF8Qd+3S8Iqsc4xfZuCFX
         4iYmkmmYWd405rQeZIuyvwCJ3Ppw8ZVmgTDhTddRKcFjlLO2QjsjpMxVy5LhcoJ7RiFB
         yYeHnOebZH1r+DdJ+I65W8NDa3F2NcYgzQD7fvoM1t8WvEcnKa9WWAbQDIg8nwiKKxFv
         +Ux7fVRPaxDwezEWF3gAFj5iKOZbSz1Q4wBSknaeFLUNsWDp4jFDtAqvEKSBuOzyqmHu
         GgjQ==
X-Gm-Message-State: AOAM530yj8gvx7R4RRHPNEfR7KFFqa0y/6qAV/pKEmMOeHtmS0XsKwan
	jZuXGMyTvdeveS5u+iB2bZONjd4wNkz0O1+/
X-Google-Smtp-Source: ABdhPJwUkO49yMFrSc+TyvLDVzyrHmAZ+gAgNhpzHccw+w3WopEwJmJIme8nup+43Qiimil/fQubYw==
X-Received: by 2002:a4a:b402:: with SMTP id y2mr1619396oon.89.1628177869033;
        Thu, 05 Aug 2021 08:37:49 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id bf41sm1103076oib.41.2021.08.05.08.37.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 08:37:48 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 28/33] checklayer: new function get_layer_dependencies()
Date: Thu,  5 Aug 2021 05:34:05 -1000
Message-Id: <e11c7ceed212c0d38e3d38de3099389a4e397818.1628176985.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628176985.git.steve@sakoman.com>
References: <cover.1628176985.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nicolas Dechesne <nicolas.dechesne@linaro.org>

Split add_layer_dependencies() into 2 parts. First search for layer
dependencies, and then add them to the config. That allows us to
call get_layer_dependencies() independently.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 08edf928aac3f2daaa0c256d4c21e56e2db72bff)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/checklayer/__init__.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/checklayer/__init__.py b/scripts/lib/checklayer/__init__.py
index fe545607bb..72d9df0a62 100644
--- a/scripts/lib/checklayer/__init__.py
+++ b/scripts/lib/checklayer/__init__.py
@@ -156,7 +156,7 @@ def _find_layer_depends(depend, layers):
                 return layer
     return None
 
-def add_layer_dependencies(bblayersconf, layer, layers, logger):
+def get_layer_dependencies(layer, layers, logger):
     def recurse_dependencies(depends, layer, layers, logger, ret = []):
         logger.debug('Processing dependencies %s for layer %s.' % \
                     (depends, layer['name']))
@@ -203,6 +203,11 @@ def add_layer_dependencies(bblayersconf, layer, layers, logger):
         layer_depends = recurse_dependencies(depends, layer, layers, logger, layer_depends)
 
     # Note: [] (empty) is allowed, None is not!
+    return layer_depends
+
+def add_layer_dependencies(bblayersconf, layer, layers, logger):
+
+    layer_depends = get_layer_dependencies(layer, layers, logger)
     if layer_depends is None:
         return False
     else:
-- 
2.25.1

