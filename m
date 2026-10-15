Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FAF7CC6B35
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:03:50 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32436.1792040628174560675
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:03:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=pJu1nbhj;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a172eb31f0so41257895e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 22:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792040626; x=1792645426; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=G/DuAt0I2Yn9btp8hElahjO6zcQT/p7N7Pkxm1USlYg=;
        b=pJu1nbhjjvICarbEMhXf9zVIY4iJWMpKr7Ntocdd65bKrpmR5Wpdam+sjAzwAEnA78
         oFIO/QRiXU65/Sn0vfrD38SUy9mlVQbF2rnk9KrCo+4dSPxxc9ZMR7O/xMJ2v4HUmbo1
         FVVeaVbzbX82LhR2gVfExayVcPqclmaeN62gM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792040626; x=1792645426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=G/DuAt0I2Yn9btp8hElahjO6zcQT/p7N7Pkxm1USlYg=;
        b=bhKFPei22M30g5HlteHw4mBWftZSoeYRdeTDMR5Ya/HuUcg76csEwuO9VB77Pf1cnN
         rX9e0sfgknWisRoe8anLc969bmjvVsP2en2O2kZ8D0Ds/wgQbbxgObByXq2t205FYjuf
         voQGzeS2cp5o7PiaMq2jCoRWttAD01WZ4FuH4MbK/z9Xnw+k92sPRUugfoAmx/vddoa5
         dFROegKJCi3aTPeYhAIICa3A+e4XByofnF6BdZxYRmUcvtzAbz+Ei2tvVd4UqAw4Mepw
         YHAUOXzCPkvLrm6+3pYfO41DZGnIugbsD4mZBpaQ1GpU3jHrrLZ6pHKSmN7NM/QKS7xl
         9hgw==
X-Gm-Message-State: AFq9FYKNAjZt11iJm6ZpwJmv3ImL7zxX5v2MuPYpp7T9+zrb3+45/Yr8
	+5KtScUGjUFA/9PszDoC3aviG4tUovfDuMyyidBeY5TR3mkRyUDKQz2ot6bmVdQlhbjVXSnPf3w
	n6esXGGk=
X-Gm-Gg: AYBFou3DTNkijqXIPrmUpjhpO7zR2OdECvrGItv8S2QYRuLceGBivRNBWZuhHBoWLrM
	6CDjPAbBwLMwlPIbClkzWafz3FN+yzuiRku03HCj+1sB/jnmvtkpW5o+jZiMcc44CyG+M3gKAHP
	rdBZpJa/YGt3hLIrTNBf5hRFLv8uO1h46St10mFIq3SpKzPwEfl70NFUS4Yg1gcqkFHyZzjZcq7
	ju8fZlzvhgk6X6VRsHmdH+f00joBw+BxiTVkq5cSfLHV0Xc8hkFyrD/kEHM9XBUbJChHFprEtLO
	RnEv9MSgPk8DNsDlg69lZXGQtW497QyiZvQhhowdoHRUcXCMh0XcrOuuqdHjuAVg06XdDH2ZfYv
	ns4sbf1rVE9qeuHC57c5PIUY1wg2lfVMu96h/E6nneEvJzdRre8WgQoSfJlBhNNXK+rrhOAftC+
	IlklcGHSb0trhk1EYoUj582IPNKFYSZ5IwHjI3sIGmeFNsR5glgFC7hi55WVVIIjfeVADPQk8rG
	C3i9WD1AxSBuGelZyqEHjJ4dakTT0qJR/IBV9BLo240GU/Z/7nZLenQHdyODen2gWZB6ksbzA==
X-Received: by 2002:a05:600c:4747:b0:4a1:88de:9e8b with SMTP id 5b1f17b1804b1-4a18e49d65dmr351662465e9.5.1792040626409;
        Wed, 14 Oct 2026 22:03:46 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd972aebsm46376245e9.1.2026.10.14.22.03.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:03:46 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 13/55] systemd: patch CVE-2026-4105
Date: Thu, 15 Oct 2026 07:02:36 +0200
Message-ID: <1018aaf3c77d7d140cdea7d7d74e2ec34b8710a6.1792020605.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792020605.git.yoann.congal@smile.fr>
References: <cover.1792020605.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 05:03:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247811

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

machine-varlink.c is not yet present in v255, so drop that hunk.
Same resolution is also done by Debian in [2] for v252.

[1] https://security-tracker.debian.org/tracker/CVE-2026-4105
[2] https://sources.debian.org/src/systemd/252.39-1~deb12u2/debian/patches/CVE-2026-4105.patch

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../systemd/systemd/CVE-2026-4105.patch       | 32 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_255.22.bb   |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2026-4105.patch

diff --git a/meta/recipes-core/systemd/systemd/CVE-2026-4105.patch b/meta/recipes-core/systemd/systemd/CVE-2026-4105.patch
new file mode 100644
index 00000000000..5b5c8e621e8
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/CVE-2026-4105.patch
@@ -0,0 +1,32 @@
+From 6941d92dc299667036cbe264435971cec59ebc76 Mon Sep 17 00:00:00 2001
+From: Luca Boccassi <luca.boccassi@gmail.com>
+Date: Sun, 8 Mar 2026 14:30:52 +0000
+Subject: [PATCH] machined: reject invalid class types when registering
+ machines
+
+Follow-up for fbe550738d03b178bb004a1390e74115e904118a
+
+(cherry picked from commit 6df5f80bd374be1b45c52d740e88f0236da922c7)
+(cherry picked from commit 497d0172416cbb5b70f96b95399d041407c223bd)
+(cherry picked from commit 749e2eaf7086c91598cf7043a31919854b1c2dfe)
+
+CVE: CVE-2026-4105
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/6941d92dc299667036cbe264435971cec59ebc76]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/machine/machined-dbus.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/machine/machined-dbus.c b/src/machine/machined-dbus.c
+index f4915f67da..3565836dc8 100644
+--- a/src/machine/machined-dbus.c
++++ b/src/machine/machined-dbus.c
+@@ -271,7 +271,7 @@ static int method_create_or_register_machine(Manager *manager, sd_bus_message *m
+                 c = _MACHINE_CLASS_INVALID;
+         else {
+                 c = machine_class_from_string(class);
+-                if (c < 0)
++                if (c < 0 || !IN_SET(c, MACHINE_CONTAINER, MACHINE_VM))
+                         return sd_bus_error_set(error, SD_BUS_ERROR_INVALID_ARGS, "Invalid machine class parameter");
+         }
+ 
diff --git a/meta/recipes-core/systemd/systemd_255.22.bb b/meta/recipes-core/systemd/systemd_255.22.bb
index e5a0fd91700..3c5e59542bf 100644
--- a/meta/recipes-core/systemd/systemd_255.22.bb
+++ b/meta/recipes-core/systemd/systemd_255.22.bb
@@ -37,6 +37,7 @@ SRC_URI += " \
            file://CVE-2026-29111-02.patch \
            file://CVE-2026-29111-03.patch \
            file://CVE-2026-29111-04.patch \
+           file://CVE-2026-4105.patch \
            "
 
 # patches needed by musl

