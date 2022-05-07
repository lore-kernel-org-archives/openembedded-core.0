Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9395BC433F5
	for <webhook@archiver.kernel.org>; Sat,  7 May 2022 11:22:26 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web08.8781.1651922542421113458
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 May 2022 04:22:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BJRRFqXO;
 spf=pass (domain: gmail.com, ip: 209.85.208.48,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id p18so11294901edr.7
        for <openembedded-core@lists.openembedded.org>;
 Sat, 07 May 2022 04:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XSpMLWwcsCAyOsdwdMOvkhOy5RrZetJXc08Y3HVVDlk=;
        b=BJRRFqXOBQhnnZldc29TqZAJ1Tm6mInSh8YGXJphdxyVJYykgbmdWIgRfnzwhBzLad
         30boIoOqJPkhFQivOQCvq1l2XKjL6GSL5TtBh373twqZUhDuzYrJxtmVKpvWkrn1GWSx
         PFAUbG/OubhlyuPdUMeyzuZRYCncwlms/oN6CG2At2oVr1hCJ8PiIu/B/WYR7khcnZxE
         bxxtIzaoO2bHKzrv9mGoncXRvOGsscCeHzggEGI0lIaq9ec4LuHmpStc3cFexnNWNbP9
         F/yEhWM65HcgOjkZGe/5LcPAY7XMhB3019RBCACSvuPcHROgZWIHgqCEzN36Fc8SgEmh
         /ZNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XSpMLWwcsCAyOsdwdMOvkhOy5RrZetJXc08Y3HVVDlk=;
        b=MEVBpEkKx/hkTE8uKfRm3FfsqkYOHrsmAW8FLwPCfZRw8zvjdSASXXCZI4FpGjten7
         tVhy2oOLT+4Db64arPyrNhY4k/QL0L/Zc+rUOJFqzMQffxHKNpx9NSPIsG4Rh0ZEKozn
         OtyG86H2pMHaR4seewhwaXkRXAF8CtuZXiSf43x8s6RxYpucRaMMaQXHgzZAgRu7Nbnb
         Tcy9V3Yk47QlBI8uoScO/yseesH9FaDdJTX5p+8iQ5qAlUWACvavFkDu/M7PTMBG64lt
         9ToI/ZkDJYQlopnOmtvFFzvdsu7OHZb1XVD29H2eXR6r8YIwx0gJnYwV5hTRHorIRw52
         +R+g==
X-Gm-Message-State: AOAM532SWPRu2/WgugyEdnROz+3JQI2kKjALDEh1WDklj3E9zWoUL4Yi
	31TMLDGOmNB7qFH34OaaGK8GqjS6uJY=
X-Google-Smtp-Source: 
 ABdhPJwUEbBfgiRCghBWgcpHHxycyhs9qNby5HMako+0YHDv12gxMRewWbIgggXNGvcBJ4oIG9Spug==
X-Received: by 2002:a05:6402:3508:b0:427:b100:b825 with SMTP id
 b8-20020a056402350800b00427b100b825mr8051858edd.268.1651922540579;
        Sat, 07 May 2022 04:22:20 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
 [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id
 gz12-20020a170906f2cc00b006f3ef214de8sm2898577ejb.78.2022.05.07.04.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 May 2022 04:22:20 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>,
	Alex Kiernan <alexk@zuma.ai>
Subject: [OE-Core][PATCH 2/4] eudev: Add PACKAGECONFIG for manpages & selinux
Date: Sat,  7 May 2022 12:22:10 +0100
Message-Id: <20220507112212.16408-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220507112212.16408-1-alex.kiernan@gmail.com>
References: <20220507112212.16408-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 May 2022 11:22:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165361

Drop DEPENDS on libxslt-native which is unused as the tarball includes
the manpages and the build process never invokes the script which
regenerates them (make.sh)

Signed-off-by: Alex Kiernan <alexk@zuma.ai>
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 meta/recipes-core/udev/eudev_3.2.11.bb | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/udev/eudev_3.2.11.bb b/meta/recipes-core/udev/eudev_3.2.11.bb
index 56a39320d300..841039f6d745 100644
--- a/meta/recipes-core/udev/eudev_3.2.11.bb
+++ b/meta/recipes-core/udev/eudev_3.2.11.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
 LICENSE:libudev = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-DEPENDS = "glib-2.0 glib-2.0-native gperf-native kmod libxslt-native util-linux"
+DEPENDS = "glib-2.0 glib-2.0-native gperf-native kmod util-linux"
 
 PROVIDES = "udev"
 
@@ -19,7 +19,7 @@ SRC_URI[sha256sum] = "19847cafec67897da855fde56f9dc7d92e21c50e450aa79068a7e704ed
 UPSTREAM_CHECK_URI = "https://github.com/eudev-project/eudev/releases"
 UPSTREAM_CHECK_REGEX = "eudev-(?P<pver>\d+(\.\d+)+)\.tar"
 
-inherit autotools update-rc.d qemu pkgconfig features_check
+inherit autotools update-rc.d qemu pkgconfig features_check manpages
 
 CONFLICT_DISTRO_FEATURES = "systemd"
 
@@ -30,8 +30,12 @@ EXTRA_OECONF = " \
     --with-rootprefix= \
 "
 
-PACKAGECONFIG ??= "hwdb"
+PACKAGECONFIG ?= "hwdb \
+                  ${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)} \
+"
 PACKAGECONFIG[hwdb] = "--enable-hwdb,--disable-hwdb"
+PACKAGECONFIG[manpages] = "--enable-manpages,--disable-manpages"
+PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux"
 
 do_install:append() {
 	install -d ${D}${sysconfdir}/init.d
@@ -60,7 +64,6 @@ INITSCRIPT_PARAMS = "start 04 S ."
 PACKAGES =+ "libudev"
 PACKAGES =+ "eudev-hwdb"
 
-
 FILES:${PN} += "${libexecdir} ${nonarch_base_libdir}/udev ${bindir}/udevadm"
 FILES:${PN}-dev = "${datadir}/pkgconfig/udev.pc \
                    ${includedir}/libudev.h ${libdir}/libudev.so \
-- 
2.35.1


