Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E03E6C4708E
	for <webhook@archiver.kernel.org>; Thu, 29 Dec 2022 16:01:32 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.206920.1672329683197847255
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Dec 2022 08:01:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kzMPB7zc;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id m26-20020a05600c3b1a00b003d9811fcaafso6938240wms.5
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 08:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0jdHmJjSynyssPEPweDcJOqJHoMG509dF80vA/vXvaE=;
        b=kzMPB7zcIlsmI0Ut4Tw1I3sJEW0LwjPGpPDceFhJluK+5b8bB7RiGPnDNZ8Q6mbTsr
         Cuu+JfTeAFZE11CajBXbs0VPjbvlm4duVjEWPw/B/RrM7x9fP0jgI+QPkLuYswsQTzts
         zL5NujVkOydouSnO5RlL1+hcNUw06ckpsfZH8ApEja4Br/h/RSrZMbnggH9wB5T4/GKQ
         9x+teZF5uGZ4XMnSPdCGCt5nKW1mqyOxJ+JL7pbiuYMVMqYSpSxaPCyOmWc1/WFYCpZD
         Wxjwj87E1Gh9duzdGhLyKMYMkWeZXESk0HYhyfT90+H1EGQkW4oXfdjTxJIGD0W5zG1c
         6w1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0jdHmJjSynyssPEPweDcJOqJHoMG509dF80vA/vXvaE=;
        b=RFz/ojXmB6lP2ERLaC/hhuP0qQYFMID3fCTuupufZ+pct7ascUedcz1fBCdXEPIQVM
         2AXFwpZY3Mr8KgMPaKebtojyFzkbu+g0S4WrV+5MoDVxRwy7B+M+zS5i9jbamZuauFL3
         NBI3OFwnymbTIfeQ+3jcfpAWTryTypk6f4t1YUIv5Fp/zY9n3pEj0AiQBvNI4Zy60cfF
         et2UYSmDtlHIWBTS3o+Z/so3M1rykYQbOcc2uQ7zKR+V0L75vt6MIs6A9PRaSxTdTuqO
         PpJ429UP7lNwDz/kJk9uG5jlkWMsGQ9aTKhmcGCQLE8JIx3NJ3c0xsQU/uPJ7nVZgQV6
         6xdQ==
X-Gm-Message-State: AFqh2ko+iDVVHVny3eIKPdVZGsV7tnmSF6l6zRQMkqLSaN1bmIFm34am
	BzGD88mNy6ZhUWGH7wTt7Gvh2T8Iv8g=
X-Google-Smtp-Source: AMrXdXtFCpk0SoKsZrx6vH64gTbtoJbtVGzPACyYsL2G8L2pWL1SDpX5DPuB1dwCVgQLgxX+y9f9dA==
X-Received: by 2002:a7b:c7d6:0:b0:3d1:ee3a:62ae with SMTP id z22-20020a7bc7d6000000b003d1ee3a62aemr23515230wmk.8.1672329681519;
        Thu, 29 Dec 2022 08:01:21 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id bg12-20020a05600c3c8c00b003d1e34bcbb2sm28161735wmb.13.2022.12.29.08.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 08:01:21 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 06/10] libportal: add from meta-openembedded/meta-gnome
Date: Thu, 29 Dec 2022 17:01:06 +0100
Message-Id: <20221229160110.255775-6-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221229160110.255775-1-alex@linutronix.de>
References: <20221229160110.255775-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 16:01:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175112

This used to be required by epiphany, then it became
optional and was moved to meta-oe, now it is again required.

The recipe was originally provided by... actually me :-)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 meta/recipes-gnome/libportal/libportal_0.6.bb | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 meta/recipes-gnome/libportal/libportal_0.6.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index be96123ce6..0affa1bded 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -371,6 +371,7 @@ RECIPE_MAINTAINER:pn-libpcre = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-libpcre2 = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libpipeline = "Wang Mingyu <wangmy@fujitsu.com>"
 RECIPE_MAINTAINER:pn-libpng = "Anuj Mittal <anuj.mittal@intel.com>"
+RECIPE_MAINTAINER:pn-libportal = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-libproxy = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-libpthread-stubs = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-libptytty = "Alexander Kanavin <alex.kanavin@gmail.com>"
diff --git a/meta/recipes-gnome/libportal/libportal_0.6.bb b/meta/recipes-gnome/libportal/libportal_0.6.bb
new file mode 100644
index 0000000000..9784f04818
--- /dev/null
+++ b/meta/recipes-gnome/libportal/libportal_0.6.bb
@@ -0,0 +1,19 @@
+SUMMARY = "libportal provides GIO-style async APIs for most Flatpak portals."
+DESCRIPTION = "It provides simple asynchronous wrappers for most Flatpak portals \
+with a familiar GObject API along side the D-Bus API"
+HOMEPAGE = "https://github.com/flatpak/libportal"
+BUGTRACKER = "https://github.com/flatpak/libportal/issues"
+LICENSE = "LGPL-3.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=3000208d539ec061b899bce1d9ce9404"
+
+SRC_URI = "git://github.com/flatpak/${BPN}.git;protocol=https;branch=main"
+SRCREV = "13df0b887a7eb7b0f9b14069561a41f62e813155"
+S = "${WORKDIR}/git"
+
+inherit meson gtk-doc gobject-introspection features_check
+
+ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
+
+DEPENDS += "glib-2.0 glib-2.0-native gtk+3"
+
+EXTRA_OEMESON = "-Dbackends=gtk3 -Dvapi=false"
-- 
2.30.2


