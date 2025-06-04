Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC340C5B543
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 05:37:07 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.9396.1749015426729684281
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jun 2025 22:37:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=En1PnHIG;
 spf=pass (domain: mvista.com, ip: 209.85.210.182, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-742caef5896so5466478b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 22:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1749015426; x=1749620226; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OsYEY+1X+kIy/VFKjU5s/nwKe//5q1PvC4vl87YaXgI=;
        b=En1PnHIGAiPt+l8zuNALbg/XO5nJLAZ/UCZg4f0SBEju97gavR2RQ7irHwj1vVTjqt
         yk6SitvF/2qmaTytZWlujQLygNV7zo58FQ3KrgKcyGTgYwuMwhuo4vWvBYqddCYWwunY
         g8+y0hRJggbK57LpC67wRpXNA9ePQeP+dpKgE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749015426; x=1749620226;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OsYEY+1X+kIy/VFKjU5s/nwKe//5q1PvC4vl87YaXgI=;
        b=qTHoal/WpGIn9vj0USkOPeaXA4BNCY6T+G2Nf09Xn9AjsvuoCU7OCrg6ArKZPBDjed
         49NS/i5VbpxBXATfFIuO1iFwJAddVGVYG3V6h201lyluMTIxckuogvQ/EAyGLzzRd+JE
         UVIfjwzKiWeiTF9wmJqhpMv6vvve8MM/8OvWAAWpEY5tJsYXheAglFlyRscGEnuUGC4Y
         FXkLmDc14ghulHlq4zL+tIlOyF0LE2xf/74FP1ZCrUglCwenHWJMjLQwBDCyvOEqPviY
         KVwja84dXyh0peyw842g1q4mt0Fwkv5DSgSsAAHFw/Cckb69chfHqJOmTHLSXxFYpRSc
         6PUA==
X-Gm-Message-State: AOJu0YxSHSuPb3hFOFmZcBmeLvcbTTnw1We1gms51G5gbPlq3jW4DlJ/
	eMQbXOcykBdKAIjCIdfcPgOmqhZywYMZ0SY3lbsyfwhKBwuxtbayfjXWGCtUP/h2sLAudjjWaHe
	EGaP8/2k=
X-Gm-Gg: ASbGncuy6SVjMssjqpd4hLGdEA2/m5ZG4eI1uJNzGf4fDNABu2P+Ce5yqJrgvoWv55U
	bdKupycEjsF2hd8rZOJ33IGeIHLTurE36uo6ShDlmzGtE+zJt9VlLbgosimLnn3+8zh6/7V83wn
	QfftzGe8c+23bxVu9gbTqlp28pkHH5iAA3fZXSuGFHkuW1IVkhGhO0hUKKoDkfExG2j/Ex7Cwte
	fslVAr/DgMBdo/AY99UaLej3Kz0pADY096HF9qVNbPY3ibud/iczP4X2rZIHJroQZzMswjDV1FC
	geAfwHx8vGece8IiouJALDfHGjQm7nfGxBxAiqHIWuMQ30pcPfL+XPsSn550UPE=
X-Google-Smtp-Source: AGHT+IGx8DYRWE1dy7KxEIhkOApZFDIUilXHB/0LgAW8lpZmNT20ra9j6nIdwmCGyeHK2jz3QUybbw==
X-Received: by 2002:a17:902:e887:b0:235:6e1:3edf with SMTP id d9443c01a7336-235e11db615mr23380045ad.34.1749015425704;
        Tue, 03 Jun 2025 22:37:05 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.214.116])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-235069fa2c7sm95675245ad.0.2025.06.03.22.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 22:37:05 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][PATCH] kea: upgrade 2.4.1 -> 2.4.2
Date: Wed,  4 Jun 2025 11:06:55 +0530
Message-Id: <20250604053655.96207-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 05:37:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217836

From: Vijay Anusuri <vanusuri@mvista.com>

Changelog
https://downloads.isc.org/isc/kea/2.4.2/Kea-2.4.2-ReleaseNotes.txt

License-Update: Update copyright year

Includes security fixes for CVE-2025-32801, CVE-2025-32802 and CVE-2025-32803

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 meta/recipes-connectivity/kea/{kea_2.4.1.bb => kea_2.4.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/kea/{kea_2.4.1.bb => kea_2.4.2.bb} (94%)

diff --git a/meta/recipes-connectivity/kea/kea_2.4.1.bb b/meta/recipes-connectivity/kea/kea_2.4.2.bb
similarity index 94%
rename from meta/recipes-connectivity/kea/kea_2.4.1.bb
rename to meta/recipes-connectivity/kea/kea_2.4.2.bb
index fcdb4889d9..6bb7cb9164 100644
--- a/meta/recipes-connectivity/kea/kea_2.4.1.bb
+++ b/meta/recipes-connectivity/kea/kea_2.4.2.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Kea is the next generation of DHCP software developed by ISC. It
 HOMEPAGE = "http://kea.isc.org"
 SECTION = "connectivity"
 LICENSE = "MPL-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ea061fa0188838072c4248c1318ec131"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ee16e7280a6cf2a1487717faf33190dc"
 
 DEPENDS = "boost log4cplus openssl"
 
@@ -18,7 +18,7 @@ SRC_URI = "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.gz \
            file://fix_pid_keactrl.patch \
            file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch \
            "
-SRC_URI[sha256sum] = "815c61f5c271caa4a1db31dd656eb50a7f6ea973da3690f7c8581408e180131a"
+SRC_URI[sha256sum] = "6e82fb319d3b871c0d39bbd504f2cda0c66fa1262865872985fb4fb91b4eaafc"
 
 inherit autotools systemd update-rc.d upstream-version-is-even
 
-- 
2.25.1


