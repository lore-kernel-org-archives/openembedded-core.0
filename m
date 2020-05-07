Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.1166.1588832544989110325
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2020 23:22:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=B3ocyaFs;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id hi11so2190817pjb.3
        for <openembedded-core@lists.openembedded.org>; Wed, 06 May 2020 23:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2Bgn+AE7ws7EXrX1ddrO8DyhyGf4MVtkj35XxmQkXVY=;
        b=B3ocyaFsn8rnMfCzMGigOP25YTBYYH5Pm3EYpA0cyZsIiWBx3iPW8rCzYOQhag+cKU
         IHt8nu84kXdCY9KJYDtiye96LABvmWfFixXzEoYlU/A3Z1VWYLqENmI+buA7VzBCS07y
         sUCK3FfqCjx5VEmArdshLZTRS/gzVBgM4Psy8JWt5frcAU/tI3Q64fCxtbseNF/wNXFL
         XGDAYG/W2AMh0Muw60eLnGLmTdCbcy7dSSNDzCoRrCxrNBCdrHBdZGwE3BktgbnoG8Lo
         QyaQdb91HJNXLHG6jbrLYyf3FkdsocUNBLR2RmBbEib9m4FSdEUau4B1ZxBHMH5waSAR
         oqjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2Bgn+AE7ws7EXrX1ddrO8DyhyGf4MVtkj35XxmQkXVY=;
        b=V6AxNnTVyWwyJtotCmsS/QEXumQIO0JhytGANiKG3jmDR730BjY9TqCtkRy3s+76zo
         TeOcQu1pwcbV3F1ebRKpWY5DahBiFVYgorPYE/Er0xnvbOI717+M2ZRQ26l6e0b+qiBr
         ESNlmRw/X+p443qVYc/oAlCBUw5WRaB1rv+Z49SBvgnO8lI7OUYgZFzAzXzELKoCw7HK
         /dESYkmZUNyzD7+XNW8YdC6Aq7cTqfPDs4hb4QJPkzJe58fNSXLSj49pfPP4jHVl4JA/
         9KBM/ProxzCQ11vntWiRBPSL3McLRCmgxiQNbM0TduPPx2TsmlN7kl+kuN9gIpX6fq1Y
         QMrA==
X-Gm-Message-State: AGi0PuaiHhyGXaq6A2jmdIzfABSZZlComtjgwxZu3idwcF1BjoRjutpD
	tmoX0ygtkRU9Zw95rzRKwfV3EGp3TUg=
X-Google-Smtp-Source: APiQypKzVxnXE/v/kWaaf1ns7aZr0C4DGQqZPdA875mgKvng+nsSj4zTXc1y+O3L4BjYCigT8NO1kQ==
X-Received: by 2002:a17:90a:33c5:: with SMTP id n63mr13197672pjb.4.1588832544053;
        Wed, 06 May 2020 23:22:24 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::d90d])
        by smtp.gmail.com with ESMTPSA id a136sm3858814pfa.99.2020.05.06.23.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 23:22:23 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] avahi: Cover gtk packageconfig with x11/wayland distro features
Date: Wed,  6 May 2020 23:22:21 -0700
Message-Id: <20200507062221.1869296-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This ensures that avahi can compile for EGLFS distros (headless)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-connectivity/avahi/avahi_0.8.bb
index f4924fa1cb..3a2c24f9f8 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -35,7 +35,7 @@ DEPENDS = "expat libcap libdaemon glib-2.0 intltool-native"
 # For gtk related PACKAGECONFIGs: gtk, gtk3
 AVAHI_GTK ?= "gtk3"
 
-PACKAGECONFIG ??= "dbus ${AVAHI_GTK}"
+PACKAGECONFIG ??= "dbus ${@bb.utils.contains_any('DISTRO_FEATURES','x11 wayland','${AVAHI_GTK}','',d)}"
 PACKAGECONFIG[dbus] = "--enable-dbus,--disable-dbus,dbus"
 PACKAGECONFIG[gtk] = "--enable-gtk,--disable-gtk,gtk+"
 PACKAGECONFIG[gtk3] = "--enable-gtk3,--disable-gtk3,gtk+3"
-- 
2.26.2

