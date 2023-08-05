Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A37AC00528
	for <webhook@archiver.kernel.org>; Sat,  5 Aug 2023 21:36:02 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.472.1691271357218024869
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Aug 2023 14:35:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=gU5XYv3I;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-3fe2bc2702cso32150625e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Aug 2023 14:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691271355; x=1691876155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Mo6uXZq6AdCXPEnr6edKgzadDfmIcYSKekEg0ONcaA=;
        b=gU5XYv3If4eddcM91DRhoNatGY/sz1bE0kUhqa5IexpdF5eT+PG1j1kkppDLjpWWO2
         9e+CT4CmSlulTp6AEMM8rwRb5XSGktWr7N7CDLeG/GBuSPXVNTlem00gnzzEeFf27RQC
         /Zi0lgAcZpWdAt+UYm0kZ/Qiw5rCO0yq3iiixOqzyyhpWZn3u6kv9a1i3zPivc4aJcA/
         hBzkYLO7R1bo4yiNt/qDT1feGoMT4fUsN3vRump9OGfOgD7RTBnCWnldgNSC54DtS9Pu
         eI5aitu9hF6zlBSqtEc583A7b3yKl9BBWLnY3QUo4pupJG+2sZCHLty+WXI9R1mTfXNj
         ePgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691271355; x=1691876155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Mo6uXZq6AdCXPEnr6edKgzadDfmIcYSKekEg0ONcaA=;
        b=VSQ68iLy4T4+Q2uwf9oMvA7ltny0ntAcvIyv2ji0/NovZpMen2P1mFkDPpb5AsNiOv
         67HIBdF9czuYFy+kiK1q/hyFzs4meF27xvVJOQQ8xQGS3wMejioVt+KDPyxlqv9lqlxj
         EkpjqhxVXCJwT1+NWPpqVUbQGImJFYgPFKWqEc4ip269mhIapzdOWK4tU2ef3JUM7wcw
         Bn0ux/kmhZ9PKCBJWKoJ6TuIMICoFpNP4LhzOerVB6rhyh1U9zMBFM5Sry+Iv0rqP9gG
         m+wmE/IuXTY1T1J92rWyYDRAWta/iZjd4lVuLOZPQ/E6o35Rh67kfjSLUTNF7S3cjjY6
         vjhQ==
X-Gm-Message-State: AOJu0YwRHKCPDd+Se4MF28Fgg4+W+zRvs9UYpjQBRpxmbQR4gIjKlBT2
	E3ScadDkwUfHaTW7wjCaVoy4YqeceWY=
X-Google-Smtp-Source: AGHT+IHqSinIgghjtuRaSDFjHaQYHAhXwSSHndb2RlGvR0/IEiXn6+cEWlUrbmyPghu3bkVh5jhQNw==
X-Received: by 2002:a05:600c:21d7:b0:3fb:40ff:1cba with SMTP id x23-20020a05600c21d700b003fb40ff1cbamr3864855wmj.6.1691271355238;
        Sat, 05 Aug 2023 14:35:55 -0700 (PDT)
Received: from localhost ([137.220.119.58])
        by smtp.gmail.com with ESMTPSA id y6-20020a05600c364600b003fe2a40d287sm5999667wmq.1.2023.08.05.14.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Aug 2023 14:35:54 -0700 (PDT)
From: luca.boccassi@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com
Subject: [PATCH v2] systemd: add usrmerge to REQUIRED_DISTRO_FEATURES
Date: Sat,  5 Aug 2023 22:35:51 +0100
Message-Id: <20230805213551.2737605-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230805110643.2708376-1-luca.boccassi@gmail.com>
References: <20230805110643.2708376-1-luca.boccassi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Aug 2023 21:36:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185557

From: Luca Boccassi <luca.boccassi@microsoft.com>

Support for unmerged-usr is deprecated upstream, taints the system and
has been removed for v255 (next release).
Enforce building merged-usr images when using systemd. This allows one
release cycle where it can be tested for any remaining issue, and can
still be overridden, before it stops working completely.

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
v2: rearrange so systemd-boot.bb is left as-is for now

 meta/recipes-core/systemd/systemd-compat-units.bb      | 3 ++-
 meta/recipes-core/systemd/systemd-conf_1.0.bb          | 3 +++
 meta/recipes-core/systemd/systemd-machine-units_1.0.bb | 3 ++-
 meta/recipes-core/systemd/systemd-serialgetty.bb       | 3 ++-
 meta/recipes-core/systemd/systemd_254.bb               | 6 +++++-
 5 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-compat-units.bb b/meta/recipes-core/systemd/systemd-compat-units.bb
index 55ebf99117f..75b1045728a 100644
--- a/meta/recipes-core/systemd/systemd-compat-units.bb
+++ b/meta/recipes-core/systemd/systemd-compat-units.bb
@@ -14,7 +14,8 @@ INHIBIT_DEFAULT_DEPS = "1"
 
 ALLOW_EMPTY:${PN} = "1"
 
-REQUIRED_DISTRO_FEATURES = "systemd"
+REQUIRED_DISTRO_FEATURES += "systemd"
+REQUIRED_DISTRO_FEATURES += "usrmerge"
 
 SYSTEMD_DISABLED_SYSV_SERVICES = " \
   busybox-udhcpc \
diff --git a/meta/recipes-core/systemd/systemd-conf_1.0.bb b/meta/recipes-core/systemd/systemd-conf_1.0.bb
index 61ce7939d3a..2355936631e 100644
--- a/meta/recipes-core/systemd/systemd-conf_1.0.bb
+++ b/meta/recipes-core/systemd/systemd-conf_1.0.bb
@@ -5,6 +5,9 @@ DefaultTimeoutStartSec setting."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
+inherit features_check
+REQUIRED_DISTRO_FEATURES += "usrmerge"
+
 PE = "1"
 
 PACKAGECONFIG ??= "dhcp-ethernet"
diff --git a/meta/recipes-core/systemd/systemd-machine-units_1.0.bb b/meta/recipes-core/systemd/systemd-machine-units_1.0.bb
index 12f27d6ae30..7e59e86f9be 100644
--- a/meta/recipes-core/systemd/systemd-machine-units_1.0.bb
+++ b/meta/recipes-core/systemd/systemd-machine-units_1.0.bb
@@ -7,7 +7,8 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 PR = "r19"
 
-inherit systemd
+inherit systemd features_check
+REQUIRED_DISTRO_FEATURES += "usrmerge"
 SYSTEMD_SERVICE:${PN} = ""
 
 ALLOW_EMPTY:${PN} = "1"
diff --git a/meta/recipes-core/systemd/systemd-serialgetty.bb b/meta/recipes-core/systemd/systemd-serialgetty.bb
index fd888bb8340..c2c67e6fe08 100644
--- a/meta/recipes-core/systemd/systemd-serialgetty.bb
+++ b/meta/recipes-core/systemd/systemd-serialgetty.bb
@@ -14,7 +14,8 @@ S = "${WORKDIR}"
 
 # As this package is tied to systemd, only build it when we're also building systemd.
 inherit features_check
-REQUIRED_DISTRO_FEATURES = "systemd"
+REQUIRED_DISTRO_FEATURES += "systemd"
+REQUIRED_DISTRO_FEATURES += "usrmerge"
 
 do_install() {
 	if [ ! -z "${SERIAL_CONSOLES}" ] ; then
diff --git a/meta/recipes-core/systemd/systemd_254.bb b/meta/recipes-core/systemd/systemd_254.bb
index 7ba4233f6a2..3fa49122cd6 100644
--- a/meta/recipes-core/systemd/systemd_254.bb
+++ b/meta/recipes-core/systemd/systemd_254.bb
@@ -10,9 +10,13 @@ SECTION = "base/shell"
 
 inherit useradd pkgconfig meson perlnative update-rc.d update-alternatives qemu systemd gettext bash-completion manpages features_check
 
+# unmerged-usr support is deprecated upstream, taints the system and will be
+# removed in the near future. Fail the build if it is not enabled.
+REQUIRED_DISTRO_FEATURES += "usrmerge"
+
 # As this recipe builds udev, respect systemd being in DISTRO_FEATURES so
 # that we don't build both udev and systemd in world builds.
-REQUIRED_DISTRO_FEATURES = "systemd"
+REQUIRED_DISTRO_FEATURES += "systemd"
 
 SRC_URI += " \
            file://touchscreen.rules \
-- 
2.39.2


