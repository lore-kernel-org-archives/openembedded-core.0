Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFBABC46CD2
	for <webhook@archiver.kernel.org>; Wed, 24 Jan 2024 13:55:38 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.22859.1706104537764906967
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jan 2024 05:55:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Oxl0cRZW;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: festevam@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6d9b41a3cb7so1797005b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 05:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706104537; x=1706709337; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x65+1u13OSmuFgDnWarfV7tynxplEswm7OR/HGr6bHI=;
        b=Oxl0cRZWk2o1SSkLAKa+m99HC1o+j+KXXj/xTrA3fZqXf8r30dsdsB0apnGhYvKe3x
         2QvKRPks/aVK/MQtJ2iHYLWbrThsv6XCRlPGLXb3GliOommNp2umxhc9yaI+wuNlLfHT
         SEpo4RDyqFpoptdooDVCtNjjDOi4hnMZPwY33Qz+WuuayR8zz4vq9QhAIC7dGSvS5RNE
         7FyFaZUlNEtY/3puGn6lDoLMo7pdzbl81xM85XddBCmA6Lssi5milyyEB4AZgwtf0dCR
         hsRNRztHxjZMjnqUIk8W2O33un3w/faHrmw8CH6C/bb6oHhgOoILqwGcpA4XwlZs1RG0
         8zUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706104537; x=1706709337;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x65+1u13OSmuFgDnWarfV7tynxplEswm7OR/HGr6bHI=;
        b=D8Y1ZQE4TMJ6gbRb22Afj9F1mIOpA6ls8c/MzrYk2gZKGO/Doj7jirOxqUBp51KzeD
         OClvHtn4nLXRMC1HgAcAsMWviB/FiyrnbzLRIVHtIbBz5123x46lsdv1JDaeIzP03hB2
         rKgWjYPaZ5n/wtlJbtQ++ZYP8ryFkw+SI22A4y2oZ6kMIG6OvcwJhmettqjfb6viA1+s
         54NIWOyztxJcVO5A77zS36qISCPK4xHpLsmb/fSZZ+Z5KrTTDLG5/YoT0hxEMGIaztNc
         6OpynvnbfFm43H2X0BC8tcBCKsp35KbzQWFKJbuWSAf9K+qqig4XF7f6jijBjlqLaVkS
         HjAg==
X-Gm-Message-State: AOJu0YxGxkw7e/MP7fwgAMwFFv4zNe207iq8OwOqEk+F0qP/UCD8lYz0
	03anDt/7/g7wfA9T6KaRIBJcX6s9dceHEmcyOnAxENZsKU4BAiBxKgx1+Ugl
X-Google-Smtp-Source: AGHT+IFBRlRz6xgxN3BwcGy4d567uQEqRsrL396qFRtj8SqW/AskvdvD4d2zlXUkR3RLUfr61Gm80g==
X-Received: by 2002:a05:6a21:3941:b0:19b:1da3:cbc4 with SMTP id ac1-20020a056a21394100b0019b1da3cbc4mr2380542pzc.0.1706104536680;
        Wed, 24 Jan 2024 05:55:36 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:724e:200c:fdfa:fca])
        by smtp.gmail.com with ESMTPSA id m24-20020a63ed58000000b005cf64b907a9sm11833513pgk.18.2024.01.24.05.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 05:55:36 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH v2] pulseaudio: Update to 17.0
Date: Wed, 24 Jan 2024 10:55:15 -0300
Message-Id: <20240124135515.1558300-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 13:55:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194275

From: Fabio Estevam <festevam@denx.de>

Update to pulseaudio 17.0 version.

Since pulseaudio commit e96d278bfc51 ("daemon/meson.build: Install
dbus policy in /usr, not /etc"), pulseaudio-system.conf needs to be passed
in FILES, otherwise the following QA error is seen:

ERROR: pulseaudio-17.0-r0 do_package: QA Issue: pulseaudio: Files/directories were installed but not shipped in any package:
  /usr/share/dbus-1
  /usr/share/dbus-1/system.d
  /usr/share/dbus-1/system.d/pulseaudio-system.conf

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v1:
- Onley add the specific pulseaudio-system.conf" instead of
whole ${datadir} (Ross).

 meta/recipes-multimedia/pulseaudio/pulseaudio.inc               | 1 +
 .../pulseaudio/{pulseaudio_16.1.bb => pulseaudio_17.0.bb}       | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)
 rename meta/recipes-multimedia/pulseaudio/{pulseaudio_16.1.bb => pulseaudio_17.0.bb} (84%)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 2245a73392..ae16056d24 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -187,6 +187,7 @@ FILES:${PN}-dev += "${libdir}/pulse-${PV}/modules/*.la ${datadir}/vala"
 FILES:${PN}-bin += "${sysconfdir}/default/volatiles/04_pulse"
 FILES:${PN}-pa-info = "${bindir}/pa-info"
 FILES:${PN}-server = "${bindir}/pulseaudio ${bindir}/start-* ${sysconfdir} ${bindir}/pactl */udev/rules.d/*.rules */*/udev/rules.d/*.rules ${systemd_user_unitdir}/*"
+FILES:${PN}-server += "${datadir}/dbus-1/system.d/pulseaudio-system.conf"
 
 #SYSTEMD_PACKAGES = "${PN}-server"
 SYSTEMD_SERVICE:${PN}-server = "pulseaudio.service"
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb
similarity index 84%
rename from meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb
rename to meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb
index 64002cd1cc..54c79b4097 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb
@@ -6,5 +6,5 @@ SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/${BP}.tar.xz \
            file://volatiles.04_pulse \
            file://0001-doxygen-meson.build-remove-dependency-on-doxygen-bin.patch \
            "
-SRC_URI[sha256sum] = "8eef32ce91d47979f95fd9a935e738cd7eb7463430dabc72863251751e504ae4"
+SRC_URI[sha256sum] = "053794d6671a3e397d849e478a80b82a63cb9d8ca296bd35b73317bb5ceb87b5"
 UPSTREAM_CHECK_REGEX = "pulseaudio-(?P<pver>\d+(\.(?!99)\d+)+)\.tar"
-- 
2.37.3


