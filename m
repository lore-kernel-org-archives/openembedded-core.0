Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32C6DC5DF9A
	for <webhook@archiver.kernel.org>; Sun, 23 Aug 2026 07:49:40 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10588.1787471371728328083
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2026 00:49:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RMC5jYK3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4957eefd361so15130665e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2026 00:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1787471370; x=1788076170; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2JBpUKFPPaPCxXf/tuP0PjSSXOXU57DvDIXS/FBBB6E=;
        b=RMC5jYK34fE4ZdHIq7IMVw+DAKGwhrYHyusD+AzKFRwhThd2llQiS+fkUXeBoqnFrR
         nvf+2k6tDolNLPLvXj9gQD7HxsdA7/WDC1qG1TVy7ZDC5cmGkScWznKNIdzAHe+OtJfW
         6YTqNlxdasvseRDLrma2oDByiTaKuIbrSlbKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787471370; x=1788076170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2JBpUKFPPaPCxXf/tuP0PjSSXOXU57DvDIXS/FBBB6E=;
        b=GxsSsYIfzBuupLSLWHrQs++E0lp1S+bp9HIU8Z/D70CYNddZWJuE1uaN0s7byBbI+Z
         yDAKHWTqGlokzJWTWKfoWcl2QOv1PPP/kG6XhlsyzvBDZTCoz4bh0oGOeW9M0YXISrUN
         TuUZgeIoyv813PIlxyP4YHn2afEONUel5kiLdOfO3+N2KJP/uPjqxaGiYrvLi8M/dcoA
         EmKPo/JB231UfvleMJJDGDLuD4wKYEjGpGpwn3Q4rffLNaNS4AZWVNSURMgMAOD4Sl++
         H4WBOT19DWNLSOqpGXrXMwukR/Y+zG15VDM5BbscKfDNTrCk1JCdS21hs9+r8NlhV5/i
         Y7yg==
X-Gm-Message-State: AFuF++l/0zlHM8/6uCSfvDYbdY6RRtfNSpJBsZEsts80FawZypWjXMFD
	r0hiZ8BkNX+r5li3V0bl19Orb4HqaXGyNFQ826T06HEi/ltz2uj6VmPqlwcdHtM9uztgxihcgUR
	2OJ1AP0k=
X-Gm-Gg: AR+sD12fMni2I6jVnuShlHVoYL4NB0JDvp2t95zQo9JeMMvfNsyEG2zKItmn0Mf900b
	hyNQPGs72ez44bdFh40EusAlYExqVtMB82skTVS5CcaIZh50ZucsqWmbvZloujnm9CKeYY9pF+l
	QI5RPPFj5mKWOAubeaX7BI48XDlu3A2tZQUOfJBRUmCDrKRwkpBdwXp5qgLRHb/wwV2kRo6Wdo1
	SUuw+ggQTZb1gdkunMO8UC+Kiwj77x/Ugyto1YDyjJNVTIc+uNZtUkNFSKlk9K5MXCGbbCTQo9r
	2JHdbJ3vYn/yduKXR3aDNJDzMtLt/F8bnJZdgaLK4xOwOhiV/KqWPtcLT12cRMCWjvjA0Yr7VI9
	vzmolLGm6XsO3fhA3HDZekASeEESHwlBThcYERm3XyK83oJ6qjSNLEjvs7SplDxju+SzlWHoYzu
	zalbJt6wT028OrYQspvG6qOzN9ivDEgOkgg/mZHyiVAY5Uw6mNG95VY2PFOLshlAO6YTJpr4A1i
	sQLHO3VhUjBYvNe46qwhss=
X-Received: by 2002:a05:600c:4f87:b0:499:5a50:b022 with SMTP id 5b1f17b1804b1-499b830d220mr193338795e9.3.1787471369966;
        Sun, 23 Aug 2026 00:49:29 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8601:39db:494d:605c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482c9bfcc31sm4279602f8f.17.2026.08.23.00.49.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 00:49:27 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/7] libxmlb: upgrade 0.3.28 -> 0.3.29
Date: Sun, 23 Aug 2026 08:49:10 +0100
Message-ID: <20260823074911.1711858-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260823074911.1711858-1-richard.purdie@linuxfoundation.org>
References: <20260823074911.1711858-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2026 07:49:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244017

Version 0.3.29
~~~~~~~~~~~~~~

New Features:
Bugfixes:
 - Avoid stale query indexes when reloading the silo (Richard Hughes)
 - Clear the query cache when reloading the silo (Richard Hughes)
 - Correctly mark the silo as invalid when re-loading malformed data (Richard Hughes)
 - Fix building the silo when shared-mime-info is installed (Richard Hughes)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch     | 2 +-
 .../libxmlb/{libxmlb_0.3.28.bb => libxmlb_0.3.29.bb}            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/libxmlb/{libxmlb_0.3.28.bb => libxmlb_0.3.29.bb} (93%)

diff --git a/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch b/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch
index 39e85b319ab..f0db37031e9 100644
--- a/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch
+++ b/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch
@@ -1,4 +1,4 @@
-From da7a7acacde7771ce4c0fd3ae7e55d0c151ee063 Mon Sep 17 00:00:00 2001
+From d4aa8d857e1b18dff8bc23cc810c56b4dba3aa95 Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
 Date: Sat, 16 Sep 2023 14:02:57 +0200
 Subject: [PATCH] xb-self-test.c: hardcode G_TEST_SRCDIR
diff --git a/meta/recipes-gnome/libxmlb/libxmlb_0.3.28.bb b/meta/recipes-gnome/libxmlb/libxmlb_0.3.29.bb
similarity index 93%
rename from meta/recipes-gnome/libxmlb/libxmlb_0.3.28.bb
rename to meta/recipes-gnome/libxmlb/libxmlb_0.3.29.bb
index 47c07d0c296..b070cbf99cd 100644
--- a/meta/recipes-gnome/libxmlb/libxmlb_0.3.28.bb
+++ b/meta/recipes-gnome/libxmlb/libxmlb_0.3.29.bb
@@ -8,7 +8,7 @@ SRC_URI = " \
 	file://0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch \
 	file://run-ptest \
 "
-SRCREV = "7a1b31db70bca83345de26219eb7e858cb85d321"
+SRCREV = "d942cd68a7d78e35b312b9299e69f68f9cd2e503"
 
 DEPENDS = "glib-2.0 xz zstd"
 

