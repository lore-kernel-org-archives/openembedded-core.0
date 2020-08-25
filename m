Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web10.14208.1598363820133737285
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2020 06:57:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bi/XUIvS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id f7so12861608wrw.1
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2020 06:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ACgUvTXCOSrbxPOCRlXR8oVDJ7p4zBsCiy5HUdnDAGE=;
        b=bi/XUIvS/2Yeuw6VLw+UKAg0Kmjjudo7Zr7oYZXwNC2Ekpe49Wj9NcI9H4d+swMdE4
         s6zXUEv00fktkapKq7Me3X3Ub6DTxyO1ActWVhkl2EsiwCEQISA1ROgA6xRLYESwD/7T
         Modnmmzi0mODioGM+XpAIwK//FQLRrVpvaUH4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ACgUvTXCOSrbxPOCRlXR8oVDJ7p4zBsCiy5HUdnDAGE=;
        b=hi8i2nfBBcof8ydY2zaRG2CHdDBX503cDyUh8gzqKR6WsdJA1yuz1XMOcjAYxtBPuz
         9pz3HliP0aGwLB4ZIkamELVHrPnWh8z3Dv9fZgO6G2XkSJV2uQRzCVbK48vXyvpOPA4P
         VAcdY9Zn6aV1+/EAhl8LZD75vsSb0D79giqcmqBKsS0zT0s0o0svZqvzftXScMW+bkaM
         fVMoy36X4g+R5uif3ZQa7bcbRE7uwKobVMku6CO8cE9cWggPpCavOEctWo0BF0gn8pTW
         mc3kXpYzngNwKOjT+5KNIwmcy9FuHmj53DKl4oEF/qpWoO2+7GB+j4UzotztfuvDbMzV
         mOkw==
X-Gm-Message-State: AOAM531DEkRirR/CYpz0AwyE5qpintogFMhz/kmb3mbm6Sa0vWGvztQF
	+kgu3vfwtckkXSgb8HtaQM1MrbcSZtfKKdXE
X-Google-Smtp-Source: ABdhPJyHpl+h0MJq0z0eihNE05VZbUAAl6vpgudEVwAO97LBsPA+ZzaKw3stBSDJndR3rlQN9kXnow==
X-Received: by 2002:adf:fe0c:: with SMTP id n12mr10415290wrr.48.1598363818126;
        Tue, 25 Aug 2020 06:56:58 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (d.9.b.8.7.0.d.0.8.3.5.0.7.0.4.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:c407:538:d07:8b9d])
        by smtp.gmail.com with ESMTPSA id 32sm33674904wrh.18.2020.08.25.06.56.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2020 06:56:57 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] connman-gnome/matchbox-desktop: Remove file:// globbing
Date: Tue, 25 Aug 2020 14:56:55 +0100
Message-Id: <20200825135656.1422309-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A directory can be specified in SRC_URI, there is no need to use
globbing. This means that the files are checksummed correctly and
the recipe rebuilds when the files change as globbing breaks that.

We're about to remove the use of globbing in SRC_URI so improve these.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-connectivity/connman/connman-gnome_0.7.bb     | 2 +-
 meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.2.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
index 778bf501918..af986c4eab3 100644
--- a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
+++ b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
@@ -13,7 +13,7 @@ SRCREV = "cf3c325b23dae843c5499a113591cfbc98acb143"
 SRC_URI = "git://github.com/connectivity/connman-gnome.git \
            file://0001-Removed-icon-from-connman-gnome-about-applet.patch \
            file://null_check_for_ipv4_config.patch \
-           file://images/* \
+           file://images/ \
            file://connman-gnome-fix-dbus-interface-name.patch \
            file://0001-Port-to-Gtk3.patch \
           "
diff --git a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.2.bb b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.2.bb
index 5c23e852021..e7d8a284bb6 100644
--- a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.2.bb
+++ b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.2.bb
@@ -13,7 +13,7 @@ SECTION = "x11/wm"
 # SRCREV tagged 2.2
 SRCREV = "6bc67d09da4147e5552fe30011a05a2c59d2f777"
 SRC_URI = "git://git.yoctoproject.org/${BPN}-2 \
-           file://vfolders/* \
+           file://vfolders/ \
            "
 
 EXTRA_OECONF = "--enable-startup-notification --with-dbus"
-- 
2.25.1

