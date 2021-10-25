Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CEDBC433F5
	for <webhook@archiver.kernel.org>; Mon, 25 Oct 2021 23:32:02 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.5034.1635204721432844356
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 16:32:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=XfqNG8US;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id om14so9473517pjb.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 16:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=/yFL0nl4zCEZa78biwfkJQ7TMbL9EeGHqR+pD8Pp+A4=;
        b=XfqNG8USCn/pn3vCfikUAFe8bVRACU0r+oHNezoivFjm10X7ZJM0G91W3SeL4XNU2x
         Xb9lt+WdfUriFNSutCCHhTXBtSZ82DGNlcabvicNWX+9OICnsxbVF1f2NVSQfUiWHoPH
         RddyJ+WX2aMQB1R0pVpmTUoVofCsNiQNqG9B7QGDkAGHWcCvr5kDQB58bXukQI+Px9B7
         CiOhaE2AW5aHkzWrTV78er/TljCcGwmSowz99PR8IHrRPo8SXUVLU0A/PxIB6xUdwUev
         1ZtYE0AZKLbZkAYaf+SGdIYHelHUR3cI6USHGqQvWCDRiebqALER3dOvuz+89iywSeyW
         IvTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/yFL0nl4zCEZa78biwfkJQ7TMbL9EeGHqR+pD8Pp+A4=;
        b=TT9QQHhHgGTqNve2LYFk6zVJnIil6qQR04pmBzwxOmxOGwz9xx9wdCb7UdjKExRUyA
         qWuF9gnTiLQMMS1ew8RVQrIpqFN7vSsmiTNRQ9s+GtrW02afHSusH81IcC30fQ0kK3Fg
         3LjYJhu3h5GOq8lQWg5yEwzpSNWcnRF3hMXfUbIJhOl1a8T5UCu14tmSZcFMPKBWxiCK
         lDMXBqNlxJzwjY0pQ7ExLsk4lILJuQcRESA04Yn7OvpWfvN5KblSeSq39vGreqV2P2Kg
         2JJ3Auh/jmI3xnFSueZN33Kx9+7mV3V2W6kIUGykUV6WswpvxodjK0XJCgrXfdrQUc+M
         D43w==
X-Gm-Message-State: AOAM531nmGiPIq0JUHyxhUbSDVrRbJTUG5cncdqLYr9FHprAIhZgGFMx
	NJLeBbQ1DUP2ao2HMHS+BCXDmLOQeJ2lKYof
X-Google-Smtp-Source: 
 ABdhPJx5h+nG3+jxsyx+ejiMAmeVFWmy6tljbDqcEz8BRlk+yXS9UlUUsNbNGN+YnrHHtLG4a7cXyQ==
X-Received: by 2002:a17:902:6544:b0:13e:dd16:bd5b with SMTP id
 d4-20020a170902654400b0013edd16bd5bmr19538757pln.61.1635204720380;
        Mon, 25 Oct 2021 16:32:00 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 i2sm20383990pjt.21.2021.10.25.16.31.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 16:31:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 2/4] reproducible_build: Work around caching issues
Date: Mon, 25 Oct 2021 13:31:43 -1000
Message-Id: 
 <257eb2ee73831afe84600235c967cbb4c2627e26.1635204568.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1635204568.git.steve@sakoman.com>
References: <cover.1635204568.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Oct 2021 23:32:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157370

From: Richard Purdie <richard.purdie@linuxfoundation.org>

SOURCE_DATE_EPOCH can be expanded early in the parsing process before
the class extensions are applied. This can mean the directory pointed
to for the SDE can be incorrect until later in parsing. Cache the file
name in the cached value and allow it to dynamically update.

This isn't ideal but avoding expansion of the variable likely isn't
possible and I'm not sure how else to handle this. This works around
the issue until a better solution can be found.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 44dc97cd1223e4d2b635669627ec5f796838d42d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/reproducible_build.bbclass | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/classes/reproducible_build.bbclass b/meta/classes/reproducible_build.bbclass
index f06e00d70d..43cf9dc894 100644
--- a/meta/classes/reproducible_build.bbclass
+++ b/meta/classes/reproducible_build.bbclass
@@ -91,11 +91,14 @@ python create_source_date_epoch_stamp() {
 }
 
 def get_source_date_epoch_value(d):
-    cached = d.getVar('__CACHED_SOURCE_DATE_EPOCH')
-    if cached:
+    epochfile = d.getVar('SDE_FILE')
+    cached, efile = d.getVar('__CACHED_SOURCE_DATE_EPOCH') or (None, None)
+    if cached and efile == epochfile:
         return cached
 
-    epochfile = d.getVar('SDE_FILE')
+    if cached and epochfile != efile:
+        bb.debug(1, "Epoch file changed from %s to %s" % (efile, epochfile))
+
     source_date_epoch = int(d.getVar('SOURCE_DATE_EPOCH_FALLBACK'))
     if os.path.isfile(epochfile):
         with open(epochfile, 'r') as f:
@@ -113,7 +116,7 @@ def get_source_date_epoch_value(d):
     else:
         bb.debug(1, "Cannot find %s. SOURCE_DATE_EPOCH will default to %d" % (epochfile, source_date_epoch))
 
-    d.setVar('__CACHED_SOURCE_DATE_EPOCH', str(source_date_epoch))
+    d.setVar('__CACHED_SOURCE_DATE_EPOCH', (str(source_date_epoch), epochfile))
     return str(source_date_epoch)
 
 export SOURCE_DATE_EPOCH ?= "${@get_source_date_epoch_value(d)}"
-- 
2.25.1


