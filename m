Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5003BC001DE
	for <webhook@archiver.kernel.org>; Fri, 28 Jul 2023 09:45:56 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.29045.1690537547826736272
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jul 2023 02:45:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=NtGWTyt0;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-3fbea14700bso19328875e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Jul 2023 02:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690537546; x=1691142346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Up8E2I4uAjlBJYaLYtFnLuMchk0LPLrotJpBhlaK6uI=;
        b=NtGWTyt0/elRNxXSCZIPsZDekPpJ+RqJnyAMDwcHJj9unZy0NeZB9zOl5bRs+Soy5A
         6rOXyfHH5KfQlg7WXm+7CYljRoV4S+USAJs3DT/rkt83ILDKmApspAqLCIaJKIQUVK37
         HIy1yc3dtu09BQs/qYO2/EGTlDxFPSZmEQadwat82bpA2xcg5U8dcVUYlrq2eOgb7zjs
         +vp9Ajk3e2sUaTIQBIOkKcxyJxNwu3PLKpD/afWPwWQtBPLTlltrDNP5hTMQBy11JsyB
         kxVfRTDGRHN9ky1ULycSKUMzuXB6WrWS/Q0enGNYeOLaVJBOdKxNRUt4znw6uWZCcUnN
         wjEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690537546; x=1691142346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Up8E2I4uAjlBJYaLYtFnLuMchk0LPLrotJpBhlaK6uI=;
        b=INCfxBVdVeGdQOFzKuV3Jy7hCr/7NWb8kjRRwvdQ1p1eNttmQReXOvRhwWRyY/pvAX
         UgwhXA/PrTMfVrVqHm+QUG1kBeHPy81MupFGeNh9PQOyF1HRQQjW5TCs3YFy3cnYWTaV
         KzqFZl8k9I/8bOkmuc9AF8+4Sd/Z9xhJib4IY7OM8cDVA+02ekucFiyKhNLNb9hA4Zx2
         zOalXhW0I7rEIy6qXNloBtIbnaUS4VA97UtaetnPaG9F02LcRjZr5W79/1t21+W81mA+
         27KUQ9y8c/PjEaCH38VTITp5PMS07nkc+9lXfPNgZv3KXxsbPGHyV7VpvOTWPeOeYJJW
         yMRw==
X-Gm-Message-State: ABy/qLZACdlFXenleVvvOd0XudyQvKDTf8YSAuTDMnUJvSVmb6kgy2+H
	2G7zAUhW3GBNdoth4R4a+JRwLoHydWU=
X-Google-Smtp-Source: APBJJlGi+gYV8wp5i5vRq+3MwOQDDpRNg17J3OzpFQ5Hj+QFybCzfTV8ad0u0AqJMyr9jC+UPOiuZQ==
X-Received: by 2002:a1c:6a14:0:b0:3fb:fef9:cdcd with SMTP id f20-20020a1c6a14000000b003fbfef9cdcdmr1238705wmc.22.1690537545701;
        Fri, 28 Jul 2023 02:45:45 -0700 (PDT)
Received: from localhost.localdomain (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id 9-20020a05600c230900b003fbe561f6a3sm6564537wmo.37.2023.07.28.02.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 02:45:45 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH 2/2] udev: eudev: Revert add group to sgx
Date: Fri, 28 Jul 2023 10:39:49 +0100
Message-Id: <20230728093950.12046-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230728093950.12046-1-alex.kiernan@gmail.com>
References: <20230728093950.12046-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Jul 2023 09:45:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185016

The sgx group is part of base-passwd now.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/recipes-core/systemd/systemd_253.3.bb | 2 +-
 meta/recipes-core/udev/eudev_3.2.12.bb     | 5 +----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_253.3.bb b/meta/recipes-core/systemd/systemd_253.3.bb
index cf0e17ff002b..1fd4556afd0e 100644
--- a/meta/recipes-core/systemd/systemd_253.3.bb
+++ b/meta/recipes-core/systemd/systemd_253.3.bb
@@ -424,7 +424,7 @@ USERADD_PACKAGES = "${PN} ${PN}-extra-utils \
                     ${@bb.utils.contains('PACKAGECONFIG', 'journal-upload', '${PN}-journal-upload', '', d)} \
 "
 GROUPADD_PARAM:${PN} = "-r systemd-journal;"
-GROUPADD_PARAM:udev = "-r render;-r sgx;"
+GROUPADD_PARAM:udev = "-r render"
 GROUPADD_PARAM:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'polkit_hostnamed_fallback', '-r systemd-hostname;', '', d)}"
 USERADD_PARAM:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'coredump', '--system -d / -M --shell /sbin/nologin systemd-coredump;', '', d)}"
 USERADD_PARAM:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'networkd', '--system -d / -M --shell /sbin/nologin systemd-network;', '', d)}"
diff --git a/meta/recipes-core/udev/eudev_3.2.12.bb b/meta/recipes-core/udev/eudev_3.2.12.bb
index 4268bcc2c5de..572ccecafd0c 100644
--- a/meta/recipes-core/udev/eudev_3.2.12.bb
+++ b/meta/recipes-core/udev/eudev_3.2.12.bb
@@ -18,7 +18,7 @@ SRC_URI[sha256sum] = "ccdd64ec3c381d3c3ed0e99d2e70d1f62988c7763de89ca7bdffafa5ea
 
 GITHUB_BASE_URI = "https://github.com/eudev-project/eudev/releases"
 
-inherit autotools update-rc.d qemu pkgconfig features_check manpages github-releases useradd
+inherit autotools update-rc.d qemu pkgconfig features_check manpages github-releases
 
 CONFLICT_DISTRO_FEATURES = "systemd"
 
@@ -85,6 +85,3 @@ pkg_postinst:${PN}-hwdb () {
 pkg_prerm:${PN}-hwdb () {
 	rm -f $D${sysconfdir}/udev/hwdb.bin
 }
-
-USERADD_PACKAGES = "${PN}"
-GROUPADD_PARAM:${PN} = "-r sgx"
-- 
2.39.0


