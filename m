Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86826C48BE4
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 14:48:28 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.75.1659106106967190621
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 07:48:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=nKz65C3Y;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id
 q7-20020a17090a7a8700b001f300db8677so5471074pjf.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 07:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=F86yF9MvYd73AcktfwE4JEKK4CU4z3VM136FfCQymgs=;
        b=nKz65C3YPzTz9KZMO5WDorhau+SCxQj32AqxGpYKg+GWf15y664lDiDj29vcg67eCW
         gYAzNbNgithfKgbTkqOY6tDn25oei7Q4RrPjbplhdW8qj9nIWdpo6lcjoCF7DZM89uYG
         5EW/UzIi95p/gwIjkgpiq/gMT+qiBhVL/EZq4wz6uz1ghU7gzx7TVYwFv5RTbKFUYwuK
         /rXnVG2jSFrrg/6KmM5dOhb123eRBGf3DNWmyOfSVQ95X3R6rNcqpOEKiSsKL7ZBJyCs
         +LJNMMHQuarzby/YG8YChn3vmGKnbAQOG+Gca3OjqdkWNo0hPP8qr8HfphGRmsSRGYIx
         PcMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F86yF9MvYd73AcktfwE4JEKK4CU4z3VM136FfCQymgs=;
        b=XYSPABF3EyDTRJGvbPtgirS4gBM+9KCALeP2CV/ZZFaSOW/cZm8i7ItGgAWvYBX40/
         UuJwp6XKghkyshiKcGbXhtLQbVLAJxJ0inFJbVaN6RIWQsM5GUPEwoDo2dv5OiRRRLdB
         bK+9SqKQ9zvFBuYJENSdoCJ2NxhSUDRabuURIieUfg+EGjIdxSSV+kvlvIzc/aWc9G4k
         YTkH5FtgFrEqVclFvatAel6rbCMtzih8hMJppEHinCOY2gi3zg8ve9RaWN8wnvaSpv1M
         9GBKgTNS3vJsMta2svwS31dW1/ex8Z6W2RYSidEe+kt6Q64/NJLMCEew85uj7/jiXeBk
         Zxew==
X-Gm-Message-State: ACgBeo0qR019AleKTBa68CDzPBoC7C0JazW7t36lq7YRhNgmdIeweK07
	jGevWl8eNPBrkQidOP04CevA/yrCjgPyswuU
X-Google-Smtp-Source: 
 AA6agR6JD/iaFgqwldN4lqwnuyfR11SleshuzPEUewQaoejUHhSOniFH0vLF4d2T5D55SVmOb9WBYg==
X-Received: by 2002:a17:902:e54c:b0:16d:4c2d:d52b with SMTP id
 n12-20020a170902e54c00b0016d4c2dd52bmr4308242plf.90.1659106105832;
        Fri, 29 Jul 2022 07:48:25 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x24-20020aa79418000000b00528c6c7bf37sm2958782pfo.129.2022.07.29.07.48.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 07:48:24 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 26/29] base/reproducible: Change Source Date
 Epoch generation methods
Date: Fri, 29 Jul 2022 04:46:42 -1000
Message-Id: 
 <400ed3bc77232b9d67594fa012b1278a6c8be3c6.1659105705.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1659105705.git.steve@sakoman.com>
References: <cover.1659105705.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Jul 2022 14:48:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168661

From: Richard Purdie <richard.purdie@linuxfoundation.org>

In bc, we found that there are files newer than Changelog (e.g. scan.l)
which means after install runs, the timestamp is clamped to SDE which means
"bitbake bc -C compile" would then try and regenerate generated files and
complain flex was missing.

Rather than assuming Changelog/NEWS are magic for dates, drop that scan
method and scan all unpacked files. This shouldn't be that slow as they'd
be in the disk cache already after an unpack.

For bc, this changes SDE by about two minutes and avoids the problems
rebuilding.

Add a version comment to the task definition as changes in python library
code won't trigger a rebuild and we need one here.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 32dda0ad91a9e7946351c897578b4c97ae142341)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/base.bbclass   | 1 +
 meta/lib/oe/reproducible.py | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 0cf27fbb91..cb9da78ab6 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -208,6 +208,7 @@ addtask do_deploy_source_date_epoch_setscene
 addtask do_deploy_source_date_epoch before do_configure after do_patch
 
 python create_source_date_epoch_stamp() {
+    # Version: 1
     source_date_epoch = oe.reproducible.get_source_date_epoch(d, d.getVar('S'))
     oe.reproducible.epochfile_write(source_date_epoch, d.getVar('SDE_FILE'), d)
 }
diff --git a/meta/lib/oe/reproducible.py b/meta/lib/oe/reproducible.py
index 35b8be6d08..2e815df190 100644
--- a/meta/lib/oe/reproducible.py
+++ b/meta/lib/oe/reproducible.py
@@ -152,7 +152,6 @@ def fixed_source_date_epoch(d):
 def get_source_date_epoch(d, sourcedir):
     return (
         get_source_date_epoch_from_git(d, sourcedir) or
-        get_source_date_epoch_from_known_files(d, sourcedir) or
         get_source_date_epoch_from_youngest_file(d, sourcedir) or
         fixed_source_date_epoch(d)       # Last resort
     )
-- 
2.25.1


