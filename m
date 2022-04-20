Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84C96C636D5
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:08 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web09.8112.1650463764042431048
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 07:09:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=dntRUd7u;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id p8so2021936pfh.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 07:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=vaZ0n1XyuoblimYdE2YOVBPX73nzPQP3pTU/zuxZDAk=;
        b=dntRUd7udAqiDEJyUWlyzLbgZyS0KD2hSwA+dkO5NPXgHAMTZi7ruqwD9SnjSO24Bl
         QI/2UEVarYXUH/FCLGmQAvqsEOaSllIRrrzRHQzXRgQz+mLhNfy8UhZ24m1CtzLk8fcT
         Gt3EZsqpCZNauBt7n7qu2rNb+h3s9fH4G+noJSBh8zafRb70IAuAg8Zkxc1ep4mngc6P
         SYZ03PU/5dfX8R0FhVJ7qx3PZ2VcN53AcwQj5hIrrwhPXbN+i63C9bmAwU76b16TbE8H
         jIKlUlAAiRe7l0PW6tJhKi3Eo/ifZXirLcfFGXVdAnJ7WhZmTNX0GYhm4r8UrFo+Cc/e
         UW5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vaZ0n1XyuoblimYdE2YOVBPX73nzPQP3pTU/zuxZDAk=;
        b=NV98R3Wpv74lpyGqsVO2GEFC3C80MbuIRMokTZAXwuv2T/xMg1WOscyQWUHXHRIfr6
         TYMg9nf++Nh8yLWHoEvaXA8clc1G00wC4PvIQE3JlKoUSW1ugtqjfOC42RerKCDQ9Bx8
         /KI3Gzd91iNQUXDg0wzbiiaCNRUU7/+ZVPpVskeKKShOZKpNkW9tGK7QYS5TLi/lmdZo
         dJ3egOv2DrvBjIaJVxr7BRnH6SO7NPDnwyj0D3tKXHh2tXXp6ll8puaAONC0ZIpKwI9a
         J1CrFS9bhoxNKY4PEthsHdrnVT853olabPdPuzo8MnzkiOJ++ff4KQTQadFdefzrq5+J
         UAkw==
X-Gm-Message-State: AOAM531UgR0S+OM+58dsbtTh3WbdJ7/cNe+frisbta4QqOj2KwtHUn3S
	N1N36Z0SyZ8/JtpqJFAjMDRFEACKcJxASyeUbtY=
X-Google-Smtp-Source: 
 ABdhPJxCT5hYArdX3SQQXBIpq/HsRgzS0Vf2FVCJ3etYAr26ihAm2KpT3s5YEKb0nD2deRVHAj7+Rg==
X-Received: by 2002:a05:6a00:c8d:b0:50a:62e5:6d30 with SMTP id
 a13-20020a056a000c8d00b0050a62e56d30mr19704031pfv.47.1650463763059;
        Wed, 20 Apr 2022 07:09:23 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 96-20020a17090a09e900b001cb62ee05besm22941091pjo.55.2022.04.20.07.09.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 07:09:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 18/27] update_udev_hwdb: fix multilib issue with
 systemd
Date: Wed, 20 Apr 2022 04:08:06 -1000
Message-Id: 
 <c30029df34094887d4982a2113c019a2351c053c.1650463004.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650463004.git.steve@sakoman.com>
References: <cover.1650463004.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164686

From: Kai Kang <kai.kang@windriver.com>

It duplicates udevadm in systemd recipe to make it could run
update_udev_hwdb with multilib enabled. Since systemd last update,
it deploys a shared library libsystemd-shared-250.so in /lib/systemd/.
The library will be overwritten when multilib enabled. Then if both
udev-hwdb and lib32-udev-hwdb are installed, it fails to run the
multilib version postinstall intercept update_udev_hwdb:

| /path/to/build/tmp-glibc/work/intel_x86_64-wrs-linux/wrlinux-image-small/1.0-r1/rootfs/usr/libexec/lib32-udevadm:
    error while loading shared libraries: libsystemd-shared-250.so: wrong ELF class: ELFCLASS64

`udevadm hwdb --update` just concatenates .hwdb files in dirs
/etc/udev/hwdb.d and /lib/udev/hwdb.d. The output file hwdb.bin is
identical with the one created by lib32-udevadm. So do NOT duplicate
lib32-udevadm in systemd and eudev. And update intercept script
update_udev_hwdb that re-run udevadm with same arch qemuwrapper if run
${binprefix}qemuwrapper failed.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3dba872a42c2be7d0865a30118984ab013850292)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/systemd/systemd_250.4.bb   | 5 -----
 meta/recipes-core/udev/eudev_3.2.10.bb       | 4 ----
 scripts/postinst-intercepts/update_udev_hwdb | 5 ++++-
 3 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_250.4.bb b/meta/recipes-core/systemd/systemd_250.4.bb
index 2b346113b5..15e2185dff 100644
--- a/meta/recipes-core/systemd/systemd_250.4.bb
+++ b/meta/recipes-core/systemd/systemd_250.4.bb
@@ -337,10 +337,6 @@ do_install() {
 	# create link for existing udev rules
 	ln -s ${base_bindir}/udevadm ${D}${base_sbindir}/udevadm
 
-	# duplicate udevadm for postinst script
-	install -d ${D}${libexecdir}
-	ln ${D}${base_bindir}/udevadm ${D}${libexecdir}/${MLPREFIX}udevadm
-
 	# install default policy for presets
 	# https://www.freedesktop.org/wiki/Software/systemd/Preset/#howto
 	install -Dm 0644 ${WORKDIR}/99-default.preset ${D}${systemd_unitdir}/system-preset/99-default.preset
@@ -718,7 +714,6 @@ FILES:udev += "${base_sbindir}/udevd \
                ${base_bindir}/systemd-hwdb \
                ${base_bindir}/udevadm \
                ${base_sbindir}/udevadm \
-               ${libexecdir}/${MLPREFIX}udevadm \
                ${datadir}/bash-completion/completions/udevadm \
                ${systemd_system_unitdir}/systemd-hwdb-update.service \
               "
diff --git a/meta/recipes-core/udev/eudev_3.2.10.bb b/meta/recipes-core/udev/eudev_3.2.10.bb
index dec16be046..ccc66ae131 100644
--- a/meta/recipes-core/udev/eudev_3.2.10.bb
+++ b/meta/recipes-core/udev/eudev_3.2.10.bb
@@ -51,10 +51,6 @@ do_install:append() {
 
 	# hid2hci has moved to bluez4. removed in udev as of version 169
 	rm -f ${D}${base_libdir}/udev/hid2hci
-
-	# duplicate udevadm for postinst script
-	install -d ${D}${libexecdir}
-	ln ${D}${bindir}/udevadm ${D}${libexecdir}/${MLPREFIX}udevadm
 }
 
 do_install:prepend:class-target () {
diff --git a/scripts/postinst-intercepts/update_udev_hwdb b/scripts/postinst-intercepts/update_udev_hwdb
index 8076b8ae6f..8b3f5de791 100644
--- a/scripts/postinst-intercepts/update_udev_hwdb
+++ b/scripts/postinst-intercepts/update_udev_hwdb
@@ -9,14 +9,17 @@ case "${PREFERRED_PROVIDER_udev}" in
 	systemd)
 		UDEV_EXTRA_ARGS="--usr"
 		UDEVLIBDIR="${rootlibexecdir}"
+		UDEVADM="${base_bindir}/udevadm"
 		;;
 
 	*)
 		UDEV_EXTRA_ARGS=""
 		UDEVLIBDIR="${sysconfdir}"
+		UDEVADM="${bindir}/udevadm"
 		;;
 esac
 
 rm -f $D${UDEVLIBDIR}/udev/hwdb.bin
-PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D $D${libexecdir}/${binprefix}udevadm hwdb --update --root $D ${UDEV_EXTRA_ARGS}
+PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D $D${UDEVADM} hwdb --update --root $D ${UDEV_EXTRA_ARGS} ||
+	PSEUDO_UNLOAD=1 qemuwrapper -L $D $D${UDEVADM} hwdb --update --root $D ${UDEV_EXTRA_ARGS}
 chown root:root $D${UDEVLIBDIR}/udev/hwdb.bin
-- 
2.25.1


