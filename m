Return-Path: <mklntf@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD637C4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 20:55:39 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.74721.1699476936843431668
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Nov 2023 12:55:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A3iYGuUE;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: mklntf@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4084095722aso484305e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 12:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699476935; x=1700081735; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ll9exGEacNO12Z7JpOjvW6m+RYWjkUWp3z/LggrcSKs=;
        b=A3iYGuUEeCIewR3qTQEMnOtHQ3Y7KJYPIWVWlq1qDIxNmyC5iTi5KfMuQOmHmQBnQU
         z26RW4PvzR0OIYA4Dub+T6GTyDTJ5M8lC0K+dCiPnQ9YGW3IGykoM0K0Ag1grfyVUt9v
         +jeE7wy6oeQCIdApR4hIY4TwVz6fJ7h0ohRlPIVWmWcMXaQbDEMJvnyKnSpiuybxUQaG
         MG2M5UDx3PuGok33fvK9BwV48fcx8IhcY5fzKwZuu+t/UubCW+GBeQTlBi/2FPcToAtJ
         U20w6yWuFEPyieXohXmFtPgQp95zXQlVsgdmLQz9gDxdSkRvsrMf3wEkRWE5C8DOg28V
         nkWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699476935; x=1700081735;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ll9exGEacNO12Z7JpOjvW6m+RYWjkUWp3z/LggrcSKs=;
        b=aFE/kS51DBON6mfnOdBNhBcJ2o0XfZBNB6m8v6leBR/G0pE6tpjjbB5+MZwOeeUJVX
         nd3V7KPWAHQjIwrzkQT7VobpSU0roZSYnufwHOzQGjFyBXf1/dCjKm/w0wdimo1kEArf
         0T8fFaZQheggaO3YN+v+fQtqjXcJXgazdB6kXgxclSR9Vo0TKpWS0a+EQbwZQQiaH7Wn
         undPxXy5EPzRpp8n2PNgOP2Fg2yB9SahZWpsWcS2RmA/AVFznzU3ennabyOKtdMXObdm
         72Qy8iR9+ZMJwgYcA5V4tkes5ethwclcu3/er4rXSrBGF2LUuY/7vFH/njTfO0qh7KUe
         iFCg==
X-Gm-Message-State: AOJu0YxlLCKdAH71f8kbmi8LNftebtXD4/owfzUCK04yAZbQ6wfK+WKX
	8SBC7V9G5ZRCdCbf6GeeOxyJZ7X/gEYbAg==
X-Google-Smtp-Source: AGHT+IHGsQsBy5qUWwJ+uTVhYq4uGM6Y740Yc42kplFVQtpJwNhpMgSbdIDtK7o5M4AdekxBYLHELA==
X-Received: by 2002:a05:6000:2c1:b0:32d:a43c:a23d with SMTP id o1-20020a05600002c100b0032da43ca23dmr3788455wry.3.1699476935022;
        Wed, 08 Nov 2023 12:55:35 -0800 (PST)
Received: from nbmf.example ([2a02:810d:6e40:708:d1f8:a4c2:4c8d:975e])
        by smtp.gmail.com with ESMTPSA id d7-20020adffd87000000b0032fb7b4f191sm5709887wrr.91.2023.11.08.12.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 12:55:34 -0800 (PST)
From: mklntf@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Markus Fuchs <mklntf@gmail.com>
Subject: [PATCH] systemd: Add 'no-ntp-fallback' PACKAGECONFIG option
Date: Wed,  8 Nov 2023 21:55:31 +0100
Message-ID: <20231108205531.14011-1-mklntf@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 20:55:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190357

From: Markus Fuchs <mklntf@gmail.com>

systemd defines a default set of fallback NTP servers in
https://github.com/systemd/systemd/blob/v254/meson_options.txt#L343-L345

A no-dns-fallback option was added previously to comfortably allow to
disable the default set of DNS fallback servers. This patch does the
same for the default set of NTP servers.

Signed-off-by: Markus Fuchs <mklntf@gmail.com>
---
 meta/recipes-core/systemd/systemd_254.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_254.4.bb b/meta/recipes-core/systemd/systemd_254.4.bb
index 80ef418726..cc0e29fdd2 100644
--- a/meta/recipes-core/systemd/systemd_254.4.bb
+++ b/meta/recipes-core/systemd/systemd_254.4.bb
@@ -179,6 +179,7 @@ PACKAGECONFIG[microhttpd] = "-Dmicrohttpd=true,-Dmicrohttpd=false,libmicrohttpd"
 PACKAGECONFIG[myhostname] = "-Dnss-myhostname=true,-Dnss-myhostname=false,,libnss-myhostname"
 PACKAGECONFIG[networkd] = "-Dnetworkd=true,-Dnetworkd=false"
 PACKAGECONFIG[no-dns-fallback] = "-Ddns-servers="
+PACKAGECONFIG[no-ntp-fallback] = "-Dntp-servers="
 PACKAGECONFIG[nss] = "-Dnss-systemd=true,-Dnss-systemd=false,,libnss-systemd"
 PACKAGECONFIG[nss-mymachines] = "-Dnss-mymachines=true,-Dnss-mymachines=false"
 PACKAGECONFIG[nss-resolve] = "-Dnss-resolve=true,-Dnss-resolve=false"
-- 
2.42.0


