Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26586EB64DC
	for <webhook@archiver.kernel.org>; Thu, 20 Jul 2023 10:22:25 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.9739.1689848536223839013
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jul 2023 03:22:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=ZcG4h9BR;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3fbc244d384so5025055e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 03:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689848534; x=1690453334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z4M2r4JSmF9EIQtQ7nvBmevsBwlLNlV81EQYNX/Mjjw=;
        b=ZcG4h9BRYddrmHbbTRZGVG5+ZiJ9pTWIojFlu0QiUPYMq+Dsz0ZNB0sX2zkcVwFOTU
         oizeUmByb86ierx+7IhgeRQzBi2SSX7dYGrstSSjMHMKnEUqIYbDtvw/BnNzaecsgtKn
         BgqJNkUq7vaqwzPm61PO5pfcvQlPygjRVwMUTGyIF17eWpd5+F+FX7ECUC4D+eo7ec71
         6xsn5jZROgVOpPfE51+Z1tGG5yENZzdPF/RNl2u/Nr2Ei0GSVyDb97FsMk4gqdAqyU0d
         tikDghq6ZijIYm4plQqmH336KUgy1B+asnFepVZ/Qje3ol927/IbcEjYjzyknbb2s8iC
         va1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689848534; x=1690453334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z4M2r4JSmF9EIQtQ7nvBmevsBwlLNlV81EQYNX/Mjjw=;
        b=BiSq118xtAIANyILd/V4kQ0MYsYfEUL1NyHUmraAR3W3V4v/SH52F8y4W5mq0iTmys
         d08HdqGU6uUmFx0qMFZHajZJd1zPNOxyhASNOJzu9ifCo3IK0nUy7H53EUSRQIlRM3Nc
         qWRa0Ta5GKIyWYkgA28tAAZ9NVfWj6p4pSZ5ANQO+wTBl5aweMCrftumw9/MUtYYSCkV
         JD0Rx9qeFWhF9juwpF7FBSL6cocEcHxSY1Zr7VuSITHXJBkfz6K51A6+XfJQNfO1/ODG
         74YOJ0b8hCBgrT0rBmSaZZ/zilRgonW8Q9LPJHGR0CEXVyjLN5Y8sOt1+qLmzp/ZScht
         h5PQ==
X-Gm-Message-State: ABy/qLaAfki15i5s62ue8KojnFN0uBL2gBcEZs/3cu7vOf+wfpvG9x1w
	7+QItDxMEVHhhLgDVCRs+grYAinCDsE=
X-Google-Smtp-Source: APBJJlGvlqsW1cwZs6tcqqTmy9PDMBvcmA8PMVgRiv5oVmUwo2mUhB/j1oyRV/9NbFPWt6R7Z9G9zA==
X-Received: by 2002:a05:600c:3797:b0:3fb:40ec:9483 with SMTP id o23-20020a05600c379700b003fb40ec9483mr6229433wmr.16.1689848534098;
        Thu, 20 Jul 2023 03:22:14 -0700 (PDT)
Received: from localhost.localdomain (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id f12-20020a7bcc0c000000b003fc0062f0f8sm841604wmh.9.2023.07.20.03.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 03:22:13 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v2 3/3] eudev: Add group sgx to eudev package
Date: Thu, 20 Jul 2023 11:20:14 +0100
Message-Id: <20230720102014.11236-3-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230720102014.11236-1-alex.kiernan@gmail.com>
References: <20230720102014.11236-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 10:22:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184631

Fix startup warning:

  udevd[171]: specified group 'sgx' unknown

This mirrors the change in bab455cd9b1b ("systemd: add group sgx to udev
package") for systemd-udev.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

Changes in v2:
- Rework rpm handling so that the debugfs doesn't include a spurious
  copy of /etc which caused the gdbserver selftest to fail because of a
  duplicate /etc/gshadow file

 meta/recipes-core/udev/eudev_3.2.12.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/udev/eudev_3.2.12.bb b/meta/recipes-core/udev/eudev_3.2.12.bb
index 572ccecafd0c..4268bcc2c5de 100644
--- a/meta/recipes-core/udev/eudev_3.2.12.bb
+++ b/meta/recipes-core/udev/eudev_3.2.12.bb
@@ -18,7 +18,7 @@ SRC_URI[sha256sum] = "ccdd64ec3c381d3c3ed0e99d2e70d1f62988c7763de89ca7bdffafa5ea
 
 GITHUB_BASE_URI = "https://github.com/eudev-project/eudev/releases"
 
-inherit autotools update-rc.d qemu pkgconfig features_check manpages github-releases
+inherit autotools update-rc.d qemu pkgconfig features_check manpages github-releases useradd
 
 CONFLICT_DISTRO_FEATURES = "systemd"
 
@@ -85,3 +85,6 @@ pkg_postinst:${PN}-hwdb () {
 pkg_prerm:${PN}-hwdb () {
 	rm -f $D${sysconfdir}/udev/hwdb.bin
 }
+
+USERADD_PACKAGES = "${PN}"
+GROUPADD_PARAM:${PN} = "-r sgx"
-- 
2.39.0


