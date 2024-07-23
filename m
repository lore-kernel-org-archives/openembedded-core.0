Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79859C49EA1
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 11:53:51 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.42261.1721735625806072036
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 04:53:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DjO+qEEE;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4266ed6c691so36064415e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 04:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721735623; x=1722340423; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jiI9KetorS/9A07ChLdSkFBO47gtER30WpzVa4qfC3k=;
        b=DjO+qEEEwh7lCHrd5gP2jiVWh7BYhiL+EkvxIFgFEqTicZZoE1ww2/3rJXw5IsswLW
         04Igm+4TOffY5oofHBwwXRDTfak3AsydCJp0wfwqdr+13VcoaGh8yQyj6bNrzbGXPM3+
         lTmY0tVA7RXztSYn1UKZux/JLgiupBjeSGhZV4IfALtAOxj4DO305/wLY6Tvg2p1mDDY
         6qoa8zI5mnVpGYzLCoSOpviPfxMEkD7RzxsFYpruqD+6j7RGZXK8cdMcgygjxwxBJeeS
         49Rgtks8j/TUVlvWQilq68QlBXY1tg0pz77lrCeduL1kTfPYFW2t3/5VZc+8O+GmwW6R
         z8iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721735623; x=1722340423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jiI9KetorS/9A07ChLdSkFBO47gtER30WpzVa4qfC3k=;
        b=sqVPWNFwKrR9YxUq0pwkF703sVd8tK1UmwF3mwmS/jQEYOjLHgA3NAih3aLK7ANNst
         mgakTwwlMIBYpT7HAlnhwRrogJggRb7vwFrIsRV21EuAMjA7mf9Pk9LS3yZoLCSSQh3Y
         J8AVDflhQiPGRwEex86KtBXElqvLbFh6f3Zhl91LTHvgp9TjI1UF74UTqE2iDB6QtamR
         z0R8xcntb/tyri6Hjh9nAQwfYtx8knzlAcfccSTPc/UNEBlkWZUPZ+FENotgvARZ6Kdx
         +YaHUecpX1U6BTvrFSP/SU5LLYH5wK8ou4KA4StOTkcJuetkyB0IBbOYTyc8FTShRp/O
         gBog==
X-Gm-Message-State: AOJu0Yx19zs7dAqjwKA02Pv3gIv3JKFKz6op92SfibKOqIYHQ30ti8Es
	dBtY4j7ieDMx+1TMewdQy4gQYRwnUyjjULhrI2FWf/P6x0DYHJyGK/p8EQ==
X-Google-Smtp-Source: AGHT+IESLdkOgmbNqp7wJBPc2aobgjelLqHu+RxnP7xfWemg75Wt9IOGoKRLRfs4zGZypTxWUdQCgA==
X-Received: by 2002:a05:600c:cc6:b0:426:6f48:2dad with SMTP id 5b1f17b1804b1-427daa67d53mr64271255e9.35.1721735623594;
        Tue, 23 Jul 2024 04:53:43 -0700 (PDT)
Received: from localhost.localdomain ([80.215.234.192])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d6900caasm168537075e9.11.2024.07.23.04.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 04:53:42 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@syslinbit.com>
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <marta.rybczynska@syslinbit.com>,
	Samantha Jalabert <samantha.jalabert@syslinbit.com>
Subject: [OE-core][PATCH v2 4/5] cve-check-map: add new statuses
Date: Tue, 23 Jul 2024 13:53:14 +0200
Message-ID: <20240723115315.207013-4-marta.rybczynska@syslinbit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240723115315.207013-1-marta.rybczynska@syslinbit.com>
References: <20240723115315.207013-1-marta.rybczynska@syslinbit.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 11:53:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202339

Add 'fix-file-included', 'version-not-in-range' and 'version-in-range' generated
by the cve-check.

'fix-file-included' means that a fix file for the CVE has been located.

'version-not-in-range' means that the product version has been found outside of
the vulnerable range.

'version-in-range' means that the product version has been found inside of the
vulnerable range.

Signed-off-by: Marta Rybczynska <marta.rybczynska@syslinbit.com>
Signed-off-by: Samantha Jalabert <samantha.jalabert@syslinbit.com>
---
 meta/conf/cve-check-map.conf | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/conf/cve-check-map.conf b/meta/conf/cve-check-map.conf
index 17b0f15571..ac956379d1 100644
--- a/meta/conf/cve-check-map.conf
+++ b/meta/conf/cve-check-map.conf
@@ -8,11 +8,17 @@ CVE_CHECK_STATUSMAP[backported-patch] = "Patched"
 CVE_CHECK_STATUSMAP[cpe-stable-backport] = "Patched"
 # use when NVD DB does not mention correct version or does not mention any verion at all
 CVE_CHECK_STATUSMAP[fixed-version] = "Patched"
+# use when a fix file has been included (set automatically)
+CVE_CHECK_STATUSMAP[fix-file-included] = "Patched"
+# do not use directly: automatic scan reports version number NOT in the vulnerable range (set automatically)
+CVE_CHECK_STATUSMAP[version-not-in-range] = "Patched"
 
 # used internally by this class if CVE vulnerability is detected which is not marked as fixed or ignored
 CVE_CHECK_STATUSMAP[unpatched] = "Unpatched"
 # use when CVE is confirmed by upstream but fix is still not available
 CVE_CHECK_STATUSMAP[vulnerable-investigating] = "Unpatched"
+# do not use directly: automatic scan reports version number IS in the vulnerable range (set automatically)
+CVE_CHECK_STATUSMAP[version-in-range] = "Unpatched"
 
 # used for migration from old concept, do not use for new vulnerabilities
 CVE_CHECK_STATUSMAP[ignored] = "Ignored"
@@ -26,3 +32,6 @@ CVE_CHECK_STATUSMAP[not-applicable-config] = "Ignored"
 CVE_CHECK_STATUSMAP[not-applicable-platform] = "Ignored"
 # use when upstream acknowledged the vulnerability but does not plan to fix it
 CVE_CHECK_STATUSMAP[upstream-wontfix] = "Ignored"
+
+# use when it is impossible to conclude if the vulnerability is present or not
+CVE_CHECK_STATUSMAP[unknown] = "Unknown"
-- 
2.43.0


