Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.9247.1632049058556279244
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Sep 2021 03:57:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AaHyspLC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id q11so23315582wrr.9
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Sep 2021 03:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aMp6D5e8oLLUjkEVwEQwCwFj3AhY10OJ3WTkMBY+MO4=;
        b=AaHyspLCwAsNQUDEkt2yAtWC3miMUmN7aM99yaXV3G7GBazmqu0mTtvcmNARlBNtzN
         li9mMPIHgiqE4ZsazsdIy2BHL1kSGob6/qYA/AD+sr79HTF5FpslAB+MjqrzVWm2Xext
         7yGRCesnQJOajRRpoTRvUELNZ80EzTskiWvX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aMp6D5e8oLLUjkEVwEQwCwFj3AhY10OJ3WTkMBY+MO4=;
        b=VcPN4txLuMy/1Uo2lk4whkSgGAna7DggzcvC5F1PIExuuX9Bw3BZ5b/euOCA0SAgal
         /zftER+XUo1dFmODwuPGiAvFLAwxV2ViuLjp7QbufsFGVLmkYNguzxrOsiIv0ItwsctK
         3nOqwJOe55Xo7jMnDJ5iKeOQOWLEtFdfcc9m+W1nzJZvyb4qRicdq1fv3d2fLQwm7Uge
         +VlPUcZTh7lJm51nY1uurKpsgOeJIoVvy60atAGz9NWj1/cWQTTPf00MSO2W+fLn67Y7
         xxoTpjxb9+ar7r/yYoSH9pr4KljnelFAAyz/F1kpCAUE4UN3Aku6YdvD4vEVJwMjV9eN
         3Wmg==
X-Gm-Message-State: AOAM532pRdKkcsLB1MDT5s5DxFOciQHzlj+yh4GmEbcADOIkCh10YEHy
	o2pNelg5irKJRPanL0KSWiA0UFptVn3ycM5N
X-Google-Smtp-Source: ABdhPJyUKiHG7ZLjMNKWbSWtW1KZvZm0tnyZ/1UNchDXsKpWdeNk6gQpOy0+pE6uBhCHJ8SoHOvIeA==
X-Received: by 2002:a5d:60c8:: with SMTP id x8mr22226482wrt.293.1632049056670;
        Sun, 19 Sep 2021 03:57:36 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:f583:326e:a3bb:7da1])
        by smtp.gmail.com with ESMTPSA id o13sm14049892wri.53.2021.09.19.03.57.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Sep 2021 03:57:36 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH] package_ipk/deb/rpm: Drop recursive do_build task dependencies
Date: Sun, 19 Sep 2021 11:57:35 +0100
Message-Id: <20210919105735.1543088-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a controversial change which removes the recursive dependencies
from the do_build target of packaging tasks of recipes.

Currently this means when you "bitbake <image>" or "bitbake <recipe>",
the packaging tasks run for all packaging backends enabled for all recipes
in the dependency chain. The same therefore then applies to images.

We don't actually need that, it is a convinience thing. Removing it
massively simplifies the task graph and causes much fewer tasks to execute
in many common scenarios. It also means less sstate is fetched for
example when building an image.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package_deb.bbclass | 2 --
 meta/classes/package_ipk.bbclass | 2 --
 meta/classes/package_rpm.bbclass | 2 --
 3 files changed, 6 deletions(-)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index eca43e17876..8f0eadbcd2e 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -320,5 +320,3 @@ addtask package_write_deb after do_packagedata do_package
 
 PACKAGEINDEXDEPS += "dpkg-native:do_populate_sysroot"
 PACKAGEINDEXDEPS += "apt-native:do_populate_sysroot"
-
-do_build[recrdeptask] += "do_package_write_deb"
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index c3b53854e8b..756744279e1 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -278,5 +278,3 @@ addtask package_write_ipk after do_packagedata do_package
 
 PACKAGEINDEXDEPS += "opkg-utils-native:do_populate_sysroot"
 PACKAGEINDEXDEPS += "opkg-native:do_populate_sysroot"
-
-do_build[recrdeptask] += "do_package_write_ipk"
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 88d861c0e75..9f415b234de 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -752,5 +752,3 @@ addtask package_write_rpm after do_packagedata do_package
 
 PACKAGEINDEXDEPS += "rpm-native:do_populate_sysroot"
 PACKAGEINDEXDEPS += "createrepo-c-native:do_populate_sysroot"
-
-do_build[recrdeptask] += "do_package_write_rpm"
-- 
2.32.0

