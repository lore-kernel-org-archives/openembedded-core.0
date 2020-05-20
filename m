Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web12.854.1589992274898632773
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2020 09:31:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=dCVNFb++;
 spf=pass (domain: konsulko.com, ip: 209.85.128.68, mailfrom: pbarker@konsulko.com)
Received: by mail-wm1-f68.google.com with SMTP id m12so3111687wmc.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2020 09:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sU2EGc9/OoQnhpBPruVqell3wlDpgbKRDkguMW/lgXk=;
        b=dCVNFb++G5oB3GKSEUhjl9xpwIPaUCjuu5WVMjREQ40WJ10QxiFPOOnUyj5zWYLDOg
         ugdik+IFzQsKZZEqH9YOwHTayjYNhC+fa1Fjq6esIImUxUBV9LRxwXsYjgPHwJ52DQim
         5MMfpoIimHZ6mNKozOdNarwbCDDsmQj4Lpm1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sU2EGc9/OoQnhpBPruVqell3wlDpgbKRDkguMW/lgXk=;
        b=O/7qD9Tx0RE5Wm9pP1wN5JXm9Ty3fvd5R7PKKwxPeR5Y0P5mUUWBa6j1xCi9Bb3dhM
         kZltxkvk3OlZwCNRHT8HfWMafmx0BKP33hyhN0G43EOKwy261kLceBsdL/6LR8rGnjAe
         i309MR6pXlLHKTJHYL5kVOXuh43Ga+/FXzlY+mWe3LUVfwbORhzEu7Ce5MDQBaKDbppJ
         PqqAeQnJqOiZkALmZiD7pUNphORD5t2xFYdLNcgRKpcVzX3A/wnhxz24A9m+P1si4O+X
         YVZlceVgBViFLndJfF8l5D3W9q7od5ZKl8BBPlrFQunjpQo8Rc74gYCo2Dr9VXyRR5fl
         ZmvA==
X-Gm-Message-State: AOAM5302CZtW8SjyYuTeAG6IuVPFSsY8hKNN/alEvjoUlL1FOv1xC3Rb
	N6+rjEyyxVzovZOKYBVZslHP/Gt0BNNMdQ==
X-Google-Smtp-Source: ABdhPJyvENU/ctIsSOpMcY5K3HuW9D1LHIMm8cpxpCjluOO8Ct3Fs4pQn2UZL3nQNBRYLlX48rrG/w==
X-Received: by 2002:a05:600c:228d:: with SMTP id 13mr5524097wmf.182.1589992272999;
        Wed, 20 May 2020 09:31:12 -0700 (PDT)
Return-Path: <pbarker@konsulko.com>
Received: from ar2.home.b5net.uk ([213.48.11.149])
        by smtp.gmail.com with ESMTPSA id 32sm3586570wrr.38.2020.05.20.09.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 09:31:12 -0700 (PDT)
From: "Paul Barker" <pbarker@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [PATCH] avahi: Don't advertise example services by default
Date: Wed, 20 May 2020 17:31:09 +0100
Message-Id: <20200520163109.17650-1-pbarker@konsulko.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The example service files are placed into /etc/avahi/services when we
run `make install` for avahi. This results in ssh and sftp-ssh services
being announced by default even if no ssh server is installed in an
image.

These example files should be moved away to another location such as
/usr/share/doc/avahi (taking inspiration from Arch Linux).

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-connectivity/avahi/avahi_0.8.bb
index 3a2c24f9f8..2b0c71159d 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -81,6 +81,11 @@ do_install() {
 	rm -rf ${D}${datadir}/dbus-1/interfaces
 	test -d ${D}${datadir}/dbus-1 && rmdir --ignore-fail-on-non-empty ${D}${datadir}/dbus-1
 	rm -rf ${D}${libdir}/avahi
+
+	# Move example service files out of /etc/avahi/services so we don't
+	# advertise ssh & sftp-ssh by default
+	install -d ${D}${docdir}/avahi
+	mv ${D}${sysconfdir}/avahi/services/* ${D}${docdir}/avahi
 }
 
 PACKAGES =+ "${@bb.utils.contains("PACKAGECONFIG", "libdns_sd", "libavahi-compat-libdnssd", "", d)}"
-- 
2.26.2

