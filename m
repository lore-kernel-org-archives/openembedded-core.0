Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 066EFD58088
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 12:02:04 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.17106.1732536114014893200
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 04:01:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DN2nL5Y+;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3824446d2bcso3886197f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 04:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732536112; x=1733140912; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+BhHdqsNCEPYwjckYE+QEW77eGR0WLg/Jw53rfO9tM0=;
        b=DN2nL5Y+I4gYMeRFUeqQRGoRHsg/+8hcFDA7FGYN00D6emGNPp4isHDz8IDzlNFbmJ
         HoiZnB+tO59UDCVqPNT5xuiBfTBCCiWRT/jugkuKFQQL7vIQeF3F+GJ+k7slG6Z5x45e
         hkq+K8Ysm5n4Hg85WNNc9AHA8D+XXN4ZOQdaMH/AP+TFXDRy7/zF3ix/DvLf3DO8Nm2h
         XWMd83J8M6jFQw6htLaCjc2DxxYCzJF000EdbEsZF6HTN9kLo/93BIzV9Pe8D+99n1tH
         7a/oxxgwtcBvI7nJwZ61G+uErTLbZoFVZ/8kem7bgKQ0/+n2VeMJFbhHC5ZQyOW6YIEx
         SaSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732536112; x=1733140912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+BhHdqsNCEPYwjckYE+QEW77eGR0WLg/Jw53rfO9tM0=;
        b=a6w62cDLFPouuErIcyjBkBSubFA7tBQ3V82l8Erd2DQ0U9/bMC9UQWMaLZKrZH1Ltq
         hCdBkNrQW+OMkCpQ4J3iK8ygaZYbUOOFcHoDeqSNf9aQIeeu5eqq0+PQjcjMIfeSb9eo
         P9z89Oew4S5p+lkz1pqrFrLRyTlUQ63RFATk1u5WcKJ5EuvxNxqI2MOeyOAhon3gz0Fd
         N/axLuoZr4EFC1f2Ma/Oy+A9h7HOxK+msEM7ENKC7iXzzG3DVRpsXx+izFl/6vety1P7
         pyX5Er67YaTig5CA6B/heFnfyH/A9WS9DlSLt5atPfmln92X5ruYxG/YdwBOikXAdcfF
         aVFA==
X-Gm-Message-State: AOJu0YxBBLvf0nE5/ewxexnkoTahPtr3dYBRrDq8WI3a/WoqJXpS8N5g
	vmok/cAVvsqyga0Q7VMVf1iNTemcWsJZFEcR5v8XDgrbifsYut1aJtr+Ww==
X-Gm-Gg: ASbGncssZXaSuVb+VNvS5LzaT6B29KJmklDufaQufn5thVpMceAOyC/3MsjBYGteFff
	qZdn8jsadukx5hZ2rUCLcIGqpKe9qUYuypEcMXjs+RWbUUBZcMqJuyhIelxenhUkQ6JvxeYayIa
	stnz1PwiOsaYsTmnhzi7PWC9nXb6YPP5rPN0rtbKgY6ZO6vvg8ezWGHhv111W1eU3ZMQNqCdYKh
	MaEm5QENgINcenAAH9wbgs+v4yWpIKVUH8i11me9UXcKKP3NVcajGTMQFrt0pnst7N+Oxlm2Sur
	NrmFAEY1OWo=
X-Google-Smtp-Source: AGHT+IHqmYerQCtS8nrBeoLYAe+USPxbsn9NaH+wNzj6/CtG3tCezXO6ucv9j1eOAwgD6tFz4eGn5Q==
X-Received: by 2002:a05:6000:389:b0:382:5206:8b82 with SMTP id ffacd0b85a97d-38260b64481mr12748983f8f.29.1732536112175;
        Mon, 25 Nov 2024 04:01:52 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4349e80e51esm44881115e9.33.2024.11.25.04.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 04:01:51 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 29/35] sudo: upgrade 1.9.15p5 -> 1.9.16p1
Date: Mon, 25 Nov 2024 13:01:21 +0100
Message-Id: <20241125120127.2205232-29-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241125120127.2205232-1-alex.kanavin@gmail.com>
References: <20241125120127.2205232-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 12:02:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207777

From: Alexander Kanavin <alex@linutronix.de>

License-Update: copyright years

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../files/0001-sudo.conf.in-fix-conflict-with-multilib.patch   | 3 +--
 meta/recipes-extended/sudo/sudo.inc                            | 2 +-
 .../sudo/{sudo_1.9.15p5.bb => sudo_1.9.16p1.bb}                | 2 +-
 3 files changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/sudo/{sudo_1.9.15p5.bb => sudo_1.9.16p1.bb} (96%)

diff --git a/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch b/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch
index 041c717e005..ec0384e257a 100644
--- a/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch
+++ b/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch
@@ -1,4 +1,4 @@
-From 6e835350b7413210c410d3578cfab804186b7a4f Mon Sep 17 00:00:00 2001
+From 61ae82a2ba502492b6a78f248258abb71daeb227 Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Tue, 17 Nov 2020 11:13:40 +0800
 Subject: [PATCH] sudo.conf.in: fix conflict with multilib
@@ -15,7 +15,6 @@ Update the comments in sudo.conf.in to avoid the conflict.
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
 
 Upstream-Status: Inappropriate [OE configuration specific]
-
 ---
  examples/sudo.conf.in | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index feb1cf35a75..0afbf669f08 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sudo.ws"
 BUGTRACKER = "http://www.sudo.ws/bugs/"
 SECTION = "admin"
 LICENSE = "ISC & BSD-3-Clause & BSD-2-Clause & Zlib"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=5100e20d35f9015f9eef6bdb27ba194f \
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=0a6876cbeb2aa51837935ba3fd82ee87 \
                     file://plugins/sudoers/redblack.c;beginline=1;endline=46;md5=03e35317699ba00b496251e0dfe9f109 \
                     file://lib/util/reallocarray.c;beginline=3;endline=15;md5=397dd45c7683e90b9f8bf24638cf03bf \
                     file://lib/util/fnmatch.c;beginline=3;endline=27;md5=004d7d2866ba1f5b41174906849d2e0f \
diff --git a/meta/recipes-extended/sudo/sudo_1.9.15p5.bb b/meta/recipes-extended/sudo/sudo_1.9.16p1.bb
similarity index 96%
rename from meta/recipes-extended/sudo/sudo_1.9.15p5.bb
rename to meta/recipes-extended/sudo/sudo_1.9.16p1.bb
index 2fd2ae6d052..5907b0556de 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.15p5.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.16p1.bb
@@ -7,7 +7,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[sha256sum] = "558d10b9a1991fb3b9fa7fa7b07ec4405b7aefb5b3cb0b0871dbc81e3a88e558"
+SRC_URI[sha256sum] = "404994e23ae8bcf4be59ed6fd3759ad70a8cefa9bcf71640b33f176afec243b0"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS:${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.39.5


