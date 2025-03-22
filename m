Return-Path: <joaohf@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73029C36001
	for <webhook@archiver.kernel.org>; Sat, 22 Mar 2025 00:56:10 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.1433.1742604966117704364
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Mar 2025 17:56:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q9pP2erj;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: joaohf@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-223fd44daf8so7616745ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 17:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742604965; x=1743209765; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PpOnDcNo3hdXJZ/N/ylTDrK41RbygbwuPeSPTlej154=;
        b=Q9pP2erjKhzSds3F/Ze6YW+ic3RLPWdYiFO0KiIaNt9vErCbjYhHK7XuR3RDRRWf98
         7juXYVQQhD7uEjKsDxYMdMMS3sjAOeyuQZ/MQeLrztyHU3v6+aOfsq31ihzpVj6BpGvz
         oMfQpVOrz7B7p3wVrXovHB0BaDFCxBuGQb4vdoeWKCbCYjLfXo+POQWRwXPsnc/z2k8z
         0FR7TjqCxbhpb8GHFw4KAjPn7iDAcbtsYM3vvOB6qIppcNdb52wh/n8qKVz6sJmcq7Yr
         chCPvbcc1CqE0zST7Ha+deCsJP+WYtGQQ6XGlPr1g+GOmjdxzVsfzgb4caZrxknmhzXw
         GjdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742604965; x=1743209765;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PpOnDcNo3hdXJZ/N/ylTDrK41RbygbwuPeSPTlej154=;
        b=Nre4IhZL8wgqoqNhW+e5ZIa5uLM2E6s0VDotryxohVvTjrsa4OGxxmAerQS3YalfWD
         8+xyZYlyC7bnNt+/AbyHACNB3MVxLUSfpMu9MHuopXsPR63C0KoRbaeBtbyTVO+touo4
         +G4kIk0IxbtjREqEnNS5RSP9TYOHhz6Ez0a3xlUKKmADEz0lwi9akZ/xs7zM5DSW4IwH
         yTanVphYgmgTJ4p35EAZinRJLiwlkadUWdDQoNleRtCt1YS8OA5V13CawvKVyEDNlbME
         uuPG2nEUI1i1goQFAB5tE0EL3i4sKXLe4HI8NM0HfDuyAkyJThLVezftWQ70vHRAZiAH
         CpXA==
X-Gm-Message-State: AOJu0Yztu8MAOIaGKJ2Pkq7kowGetuo/iCl4sYycAp7yFwMIq2Caa/Wu
	rNeG0maT5oLHwKLGuoQF/ydoDeREARWDg+Geam1d8990Vdrc0dPZYeTOsw==
X-Gm-Gg: ASbGnctzApx0i1cRvsSqX9dzOZ9a2jR0O7xIEbsljvyhz1KfQ6iljo76luQZ+rLeEuD
	YfxoK2EN+ZvyIy38DGOH0v1S9R4Q8yFIA00vaVNsojmQjGFfbjJ7n/vHdvIUMoBN+3L8A8BZP5x
	kAuzhpW+qVMENpkVyswme3AvN5pK/ns/w3pitl7Vcgk5sygekzxAMXULer9beuIqtRAKdi9nFNs
	sRKBrL1a/8Ryik32aPABVOuUl4LgNOoIiWNPd15pO1pP3U+SXRZhXh9Ny0BxxJ4g20IqWHE6/dO
	F9zmIQdApJE5OEHibimRZOXOzO+JkvhtK78=
X-Google-Smtp-Source: AGHT+IEdcf7BXzbEjuP03aodRQ0nQIdu6K4s1blf5htA2NjvXlNf2F4VDcyJYc1JOaLaGmxpUHgdKA==
X-Received: by 2002:a17:902:ccca:b0:223:5732:9e4f with SMTP id d9443c01a7336-22780e15573mr35211885ad.12.1742604965110;
        Fri, 21 Mar 2025 17:56:05 -0700 (PDT)
Received: from porco.. ([189.79.243.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7390618de84sm2858782b3a.171.2025.03.21.17.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 17:56:04 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?= <joaohf@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?= <joaohf@gmail.com>
Subject: [PATCH v2] neard: use WIRELESS_DAEMON
Date: Fri, 21 Mar 2025 21:55:52 -0300
Message-ID: <20250322005552.603108-1-joaohf@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Mar 2025 00:56:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213490

Honor WIRELESS_DAEMON when wifi is enable for DISTRO_FEATURE.

Signed-off-by: João Henrique Ferreira de Freitas <joaohf@gmail.com>
---
 meta/recipes-connectivity/neard/neard_0.19.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/neard/neard_0.19.bb b/meta/recipes-connectivity/neard/neard_0.19.bb
index 94df1ac3d6..b04187bcc5 100644
--- a/meta/recipes-connectivity/neard/neard_0.19.bb
+++ b/meta/recipes-connectivity/neard/neard_0.19.bb
@@ -40,9 +40,10 @@ do_install:append() {
 RDEPENDS:${PN} = "dbus"
 
 # Bluez & Wifi are not mandatory except for handover
+WIRELESS_DAEMON ??= "wpa-supplicant"
 RRECOMMENDS:${PN} = "\
                      ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez5', '', d)} \
-                     ${@bb.utils.contains('DISTRO_FEATURES', 'wifi','wpa-supplicant', '', d)} \
+                     ${@bb.utils.contains('DISTRO_FEATURES', 'wifi','${WIRELESS_DAEMON}', '', d)} \
                     "
 
 INITSCRIPT_NAME = "neard"

