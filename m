Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76344C52D7D
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 04:09:51 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.38912.1723435789535240828
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Aug 2024 21:09:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S0yaM9/f;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42809d6e719so29447275e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Aug 2024 21:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723435787; x=1724040587; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jiI9KetorS/9A07ChLdSkFBO47gtER30WpzVa4qfC3k=;
        b=S0yaM9/fTDCimzH9SvkQfCzq/MTfwZyfb8UUME7wTHRQ0EN1F2JA/KMqbk8CGzz83m
         H+sr/pdHqBx8/EU24Gsp7kJJVy8mfyA9B82Y+DoFqwfnbKgOF7UP7i0i9z118TIxps3i
         6Lp7ccUqs+doI59C7CiWn0Wnhm7Vu5En/Wx/x6Sa/aOeQdO/087kfPpdwzx1ZcT59SFX
         nUdBjuhJf879SVW+GuawvwLqM6CVR8ppLH27d03ntUBmq1djASBKbu9TBaCsP6DEA/Rj
         oXY8ddSCGm9+74eHHkl5qYsnbHZoF5zFlGFoYtSkLJVYiV19al/pjpFWg6wBilFf0hi0
         kxfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723435787; x=1724040587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jiI9KetorS/9A07ChLdSkFBO47gtER30WpzVa4qfC3k=;
        b=Ya6ysa3oxMIXqdOClCn2X0gnnxQoD0vrZWFJzuKdx2vLCM97b2n+QMRmnGJWKD8ad2
         SWkARE9ahwtwFjSYECK/jk7ERce/nRxvy3YZiGbOx+TtaVqZVZ8LVC4c8nl7ZrHf+eYp
         72yf/eE/jyUp1SB82DvinSueVpVxRYAxGFDLWG6+3gNeOWp/20/id88IQYqw0VZdZ13r
         xiEfOaqxMwda4cyeYa2ka4D2dSXJwP+0kdc6NLR8tQDzoPqJEnPfA4GPW+rFeBe+fM5j
         TEFulqWiq32BzQc4pmNxi6yZXJIT5VQGM9641mPoM+KE5DJ9TvA1raS64TWNDnkIHVjq
         vrVw==
X-Gm-Message-State: AOJu0YxMGK5s8z+QffwvLWGrUFApsQ6c6uO+F2WFfy7EcM6sT6jBqclc
	RfwzFs2HK4wTr1svrR/yMIi4tOxOQjHXcasltxypO86q1STBZMyIALi93A==
X-Google-Smtp-Source: AGHT+IEMSHDyeQps09H0fmeN6VEdiCYCYMSAU+BuTKiFh9+Yvc1OnIoW+hZ3Atn81sQ0AYtAdZCL9w==
X-Received: by 2002:a05:600c:4746:b0:426:59fe:ac2d with SMTP id 5b1f17b1804b1-429c3a5b3e8mr63679385e9.32.1723435787260;
        Sun, 11 Aug 2024 21:09:47 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:76:4400:56c3:4c21:1a48:89b5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290c7bc8c3sm174144655e9.47.2024.08.11.21.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 21:09:46 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@syslinbit.com>
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <marta.rybczynska@syslinbit.com>,
	Samantha Jalabert <samantha.jalabert@syslinbit.com>
Subject: [PATCH v4][OE-core 6/6] cve-check-map: add new statuses
Date: Mon, 12 Aug 2024 06:09:11 +0200
Message-ID: <20240812040911.13096-6-marta.rybczynska@syslinbit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240812040911.13096-1-marta.rybczynska@syslinbit.com>
References: <20240812040911.13096-1-marta.rybczynska@syslinbit.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 04:09:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203199

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


