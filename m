Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE566CD98E4
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 19:16:48 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5754.1781637407320753258
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 12:16:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GeOLiQ5l;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490cdae130cso24726215e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 12:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781637405; x=1782242205; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mDhDyzznnlphIq+oNOXU7iuXorXFGN+uo1MvH4CYph0=;
        b=GeOLiQ5lZPI77/ludUjC2rQhe5qmG0cLFlfbeRzVyZkhjTLb8a6KoREuTTW5vCIAE6
         Kyw0ZoXpXLd4Okye6O8WW5hyC4FD76p+HfO7V4rL9i9hQGJPLLnznqYj1W42+nMhgl6A
         d00B/zyr2j1720To/K6+mXMrozxc4ftzSuxT8T1ZrJ9bPrquDZLbd2mTfseBxTGpORrp
         ffUaDIffwBh1uE1670JNhkZqhboV1dN6PG9/7za+7RCZpSBdzSdaoCxjxML0ck/unjGb
         /bDJYpEosdJE+tLosJUYxBmxGOl/OAcN0TveInU5i1AS1zqPh9/ptHX8Xfc4pts2msFD
         D6iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781637405; x=1782242205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mDhDyzznnlphIq+oNOXU7iuXorXFGN+uo1MvH4CYph0=;
        b=d/+g6FD7Q3g4fmWOxjTW6bMmkdl6lV7EclG49tM99TLd8QPnnE5NeuhPbqd8RNv654
         mfNgawN4H3FMBInR9Gzwc9AaXtgipQJvlDMZGwcBjM1sR5nT9Us3RaCbC6q0bt7JSieT
         82wb3iBhiOV/zGgssLbwCqkjeqboXPegcS9ALRU0FacYHgW7ScQ0AvZrc663zGSDTKgA
         dZvgvFDph3nY5sru3EPNek9iNk6Ok5deB+OaoxLU6CnyAG1CUXZyUeopX/P0/uALdKTE
         V3ZUIRUc61f1dc34KENskkp6K8IsxTX5i2XMqI+QSnxHRpurtLAjaaMUKu45/x99Tr7Y
         NHjg==
X-Gm-Message-State: AOJu0Yxv/wM+Ed/QDBAOJcdxJ7smKDAgX8Wz9cQ4RRvHyj0N+1Au7xnf
	IYcBvYKSgxI0ZRh2L1vY6ikQeFyM+oElnVECoeG9zDlPiGjAJTU6czv5z3HFeXD1
X-Gm-Gg: Acq92OG7PDTOJL83d4WSbngPO/NanS9fc8EF9I33xm3rO4abzQHkIjx6cbocyfKp5iR
	CUxdk9v5RrFlVeU3EZwpOasRYPcS0YRh91yOkGSsbYrmhJouQzMhg2CA+LaIYeGAckDUwp8vXwc
	OQYxVmOIbbg9KfzFAMQeDZv9F9zowSKInMLjNCUr9svd5GxDDzzMxhaYwLNcFh7JOIicthnmncS
	sL3QJ+kgLH0ExnBH0vjVu+0lnhRXx9alrS0ppZkk1n5RAaAbpoL/BHI/Gli73wGsmsD4cQrWSGr
	ws4AF9zfQA8yxkEqQXpoQVDTy7+N4+hEdblfGjUvBT488UWu4MKXVvgLiC1CD1MibfdV3B0k2Tj
	VrurHU+gCRQGvsSNOijg62icsQga4bKoTihgO+QJeDV53AvvrRCzZaB06qpx//KLlm+jIyS5OKj
	pLah/lxxOuoKom/A5JC2tjrs+9UEp/rYj0ndQ8iBbJ0Nvc6GpBX61iqPiptWk=
X-Received: by 2002:a05:600c:2ed2:b0:48a:75b9:b0bc with SMTP id 5b1f17b1804b1-492333ef49emr9535255e9.29.1781637405420;
        Tue, 16 Jun 2026 12:16:45 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a4f8d7sm86982035e9.5.2026.06.16.12.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 12:16:44 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 13/30] minicom: upgrade 2.10 -> 2.11.1
Date: Tue, 16 Jun 2026 21:16:09 +0200
Message-ID: <20260616191628.2014553-13-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260616191628.2014553-1-alex.kanavin@gmail.com>
References: <20260616191628.2014553-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 19:16:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238938

From: Alexander Kanavin <alex@linutronix.de>

License-Update: removed old vcs lines

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../minicom/{minicom_2.10.bb => minicom_2.11.1.bb}           | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/minicom/{minicom_2.10.bb => minicom_2.11.1.bb} (78%)

diff --git a/meta/recipes-extended/minicom/minicom_2.10.bb b/meta/recipes-extended/minicom/minicom_2.11.1.bb
similarity index 78%
rename from meta/recipes-extended/minicom/minicom_2.10.bb
rename to meta/recipes-extended/minicom/minicom_2.11.1.bb
index 20ce5662c2..9623bd833b 100644
--- a/meta/recipes-extended/minicom/minicom_2.10.bb
+++ b/meta/recipes-extended/minicom/minicom_2.11.1.bb
@@ -5,11 +5,12 @@ SECTION = "console/network"
 DEPENDS = "ncurses virtual/libiconv"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=420477abc567404debca0a2a1cb6b645 \
-                    file://src/minicom.h;beginline=1;endline=12;md5=a58838cb709f0db517f4e42730c49e81"
+                    file://src/minicom.h;beginline=1;endline=10;md5=5c0ff1e7befaa8f7d7f570d77b1a88ef \
+                    "
 
 SRC_URI = "${DEBIAN_MIRROR}/main/m/${BPN}/${BPN}_${PV}.orig.tar.bz2"
 
-SRC_URI[sha256sum] = "90e7ce2856b3eaaa3f452354d17981c49d32c426a255b6f0d3063a227c101538"
+SRC_URI[sha256sum] = "87cf0da91af0531357cd61b8e1906b907edd2c9ef82f9ae74c277e1893d0f98c"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[lockdev] = "--enable-lockdev,--disable-lockdev,lockdev"
-- 
2.47.3


