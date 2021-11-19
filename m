Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90259C433EF
	for <webhook@archiver.kernel.org>; Fri, 19 Nov 2021 02:12:56 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web09.3043.1637287974446091385
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Nov 2021 18:12:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gQHJO0Zp;
 spf=pass (domain: gmail.com, ip: 209.85.167.178,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id s139so18584693oie.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Nov 2021 18:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N3Bv38PC8NjeWU2D41ytxd/0Pey9nDJ6IHaPgiK5meI=;
        b=gQHJO0ZpL1bk6YdG+6KzGiWuBHoWXd/8jr4CooUXSJyAH0evBgaJcy6w5YDUMmxMM1
         TlItZ5sPx1Wc+XdvV6jzaeK5ULqnWDn4qGn7ZZcda6dhT9RC636zzDMIap5evPuFyqJ/
         ybNORQCU335ar0jNoh/yBUWNPZP8kwE5BNEZj9bHT40VhnJ34EwU2e/RvBIkN1tf9iz+
         X94id/ss0ZuM2Ht+fvqEVTeeRh8uhprXc8BT5Odxwm9vYHRInbWSmO11t7zt4+H6kiAM
         B2HyNCqneVlfItoeVLcM1gU54OJTUxTjRfv6gypZ6TIh/UvYptNvndpSk9nGb70Hqx1i
         qCnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N3Bv38PC8NjeWU2D41ytxd/0Pey9nDJ6IHaPgiK5meI=;
        b=o91az2VTAjR2ATNO2E6LkvV0GELOhS5Tqgg51URcRhCQQzK+Bd7KGs+S15Bm7QGSCr
         +6ZQ40OFLOSqE6dhp2Phk0FBXf43jnKnhnsxu3Nlz8J3CEkSYBW9xAmXX4nKmlK/AULi
         gJ3H6l2eg+HEgAV0m48wWs0JSV9w/PASnHy86Y6QF7DmJLgGm+fcGoPBdSAjDimfXUfV
         HASjSbxOMwsvi4gLFX+PFREg0JMr1s1re5qxCYrh9gTmafkSOZWO4Owl6344Fml1VgC7
         il3VbwS44gdGkcB+ttLRNJEnx71DuiGXkpY2qLyWsiAMrY44a6JwCs9j46pgSJYbBHOG
         bzbA==
X-Gm-Message-State: AOAM533kv8n+9k1pCoV5Gh/gsw0o27OLWMlELXpTs68nOjP8EVsOiZJv
	NkpXmEON7v3UeOY8GLt3iozwfxtugnQ=
X-Google-Smtp-Source: 
 ABdhPJyiGeSr6Znm1YZMWYlFjwaGuMQ6Ai3+M3lNdfi1eeHK98hLgqLCb9ogd4RBNgY0ooS4/jdOKQ==
X-Received: by 2002:a05:6808:1984:: with SMTP id
 bj4mr1640296oib.165.1637287973574;
        Thu, 18 Nov 2021 18:12:53 -0800 (PST)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id k17sm307746oom.6.2021.11.18.18.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 18:12:53 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] classes/crate-fetch: Ensure crate fetcher is
 available
Date: Thu, 18 Nov 2021 20:12:49 -0600
Message-Id: <20211119021249.113892-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Nov 2021 02:12:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158489

Reworks the crate fetcher class to have it install the fetcher at recipe
finalization so that it is always available before SRC_URI is expanded.
In addition, override the value of SRCPV to also install the fetcher
when SRCPV is expanded so that AUTOREV works.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/crate-fetch.bbclass | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/meta/classes/crate-fetch.bbclass b/meta/classes/crate-fetch.bbclass
index c0ed434a96..a7fa22b2a0 100644
--- a/meta/classes/crate-fetch.bbclass
+++ b/meta/classes/crate-fetch.bbclass
@@ -7,7 +7,22 @@
 # crate://<packagename>/<version>
 #
 
-python () {
-        import crate
-        bb.fetch2.methods.append( crate.Crate() )
+def import_crate(d):
+    import crate
+    if not getattr(crate, 'imported', False):
+        bb.fetch2.methods.append(crate.Crate())
+        crate.imported = True
+
+python crate_import_handler() {
+    import_crate(d)
 }
+
+addhandler crate_import_handler
+crate_import_handler[eventmask] = "bb.event.RecipePreFinalise"
+
+def crate_get_srcrev(d):
+    import_crate(d)
+    return bb.fetch2.get_srcrev(d)
+
+# Override SRCPV to make sure it imports the fetcher first
+SRCPV = "${@crate_get_srcrev(d)}"
-- 
2.33.0


