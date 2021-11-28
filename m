Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B38A2C433EF
	for <webhook@archiver.kernel.org>; Sun, 28 Nov 2021 21:58:53 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.52864.1638136732944408596
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:58:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ZNkSAlss;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id l190so13875772pge.7
        for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=DdQHNR3eahurPENbkeMPWP7LJkhO5LRCp0w9rgtR9Uk=;
        b=ZNkSAlss1LPZLrDsAJDvE6cVhj6PqVoxxBSV5kkNpxVvoZAT6MUlvLai89ch9Zjrip
         T1BYBW+X6OKpbI/vSARfJ+helebNQG+AB23d+cGY0YUXsxt5decFN2qP7XORKUhM2VAk
         WUstn8zi1M3nr9KGcky+L8jbezzCZOXELfmcZClqiXYPUJ262tr7GohrM2xE6B+KYZN1
         9ctcqlSNJsKvJgqaC8HuDt+WPpKRui5W8utUuZtd4cfVNSCbDSX5OsoEg6CzqO+Z12qb
         c5ijmbxL6tc8sRhNFzotED3/9LF3LtRzZiSKYWONqQP/u2ODuEDeTFtKXokIYz/19wTK
         qhiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DdQHNR3eahurPENbkeMPWP7LJkhO5LRCp0w9rgtR9Uk=;
        b=dzFx2UYmuYyHPXfjn1WineedfFqzwu6OI53Sv2UxMcq1CqkLbMmU6kfNiCoLbH3WB+
         fBA4Pac+QuQEZbSgi/WPxUEQgTTEsSfBO/GNhZD220+xfLxCr1QWBSnFR1sAUAxF4Bba
         ka1XBPjQZ0PbzKIKGzGwIfLXpkN+VtED++/syIitYniSINfIUDpP+fvbH2a1ezO7fXqE
         EcwxsQX9RB7hQEjnZJ20HiDe9x3rSNJm5tiVUpM0DNL8Skn9leuSFaU5aQTTgC3uM1fk
         2lVf7Dt2q4r/vdoAYf53JL6pt2hmJjrtHNaosRuuW5RdvN8EoE+0P4DguBJK//o2JyP6
         JQ3A==
X-Gm-Message-State: AOAM531aDQ6zn+R4LIlqVJYr76tB08fvZnZGgw+H6OPpdAnBJdH3cNHc
	w48Mgv+jWWqvloH5YuEcSizisnMUHApkaMPBBQ8=
X-Google-Smtp-Source: 
 ABdhPJwSB+Q9wOGGUy1UmX+23ZgLS8sMGN1uD8yj71Yd/58R4INVBE0oqfLp3adA1dZOc1KOiyqZhg==
X-Received: by 2002:a63:6987:: with SMTP id
 e129mr18544245pgc.520.1638136731916;
        Sun, 28 Nov 2021 13:58:51 -0800 (PST)
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 y32sm14769050pfa.145.2021.11.28.13.58.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 13:58:51 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/42] scripts/oe-package-browser: Handle no
 packages being built
Date: Sun, 28 Nov 2021 11:57:25 -1000
Message-Id: 
 <4b6d3564c09dbea3794f2915b65cbd2314ccffb6.1638136329.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638136329.git.steve@sakoman.com>
References: <cover.1638136329.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Nov 2021 21:58:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158895

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Give the user a proper error message if there aren't packages built,
rather than a less friendly traceback.

[YOCTO #14619]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b14c176b7dd74b7d63ca0f72e6e00fbf209f5a0b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/oe-pkgdata-browser | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/oe-pkgdata-browser b/scripts/oe-pkgdata-browser
index 8d223185a4..65a6ee956e 100755
--- a/scripts/oe-pkgdata-browser
+++ b/scripts/oe-pkgdata-browser
@@ -236,6 +236,8 @@ class PkgUi():
         update_deps("RPROVIDES", "Provides: ", self.provides_label, clickable=False)
 
     def load_recipes(self):
+        if not os.path.exists(pkgdata):
+            sys.exit("Error: Please ensure %s exists by generating packages before using this tool." % pkgdata)
         for recipe in sorted(os.listdir(pkgdata)):
             if os.path.isfile(os.path.join(pkgdata, recipe)):
                 self.recipe_iters[recipe] = self.recipe_store.append([recipe])
-- 
2.25.1


