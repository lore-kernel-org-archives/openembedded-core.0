Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F5F3C6FD19
	for <webhook@archiver.kernel.org>; Sun,  5 Mar 2023 20:10:09 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.20448.1677252722588313264
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Feb 2023 07:32:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HzeXIw9Q;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: peron.clem@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id p18-20020a05600c359200b003dc57ea0dfeso2500824wmq.0
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 07:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mRMqetigRppqVEEjoW3iKq1FAZltUpeFBDBa6iyHV48=;
        b=HzeXIw9QVWte/ddpfs4UPOg6/46YIFIm0BZ2QosjY7dUMhOeYMsN40ntbgB/6x8A6n
         7kuXDglPoJvlkOBixXXaTe6CEZCa8oQk2rxAh0uUeP4NaicqS6inSrIdB27FhXUEf33q
         wMiTX444v+Gt+thvD1nm7VKa3x7+30XCQ44y1Qqo77McuHLOIEft6bcwQqADxzFFwZTX
         52EptreyJx0mgl8iM+LASR8Auoy22bZ7p9Sbbu9/6g5bfp9s1YQE16LpiYLo2OfWjvG/
         Fsfac/gQoGyLIYpNB9lpoueiO9fvV8LlhauTW7W5z1+n4YkvOGxNkwnvLeTRJ1r+AEBL
         S5Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mRMqetigRppqVEEjoW3iKq1FAZltUpeFBDBa6iyHV48=;
        b=nsSTSDIeypSUyEagZmuIk0YJybSq+RzZ765wqK4UD0cTjoOeX69YdN2q2mOez1zgGs
         1lFh5NbqyCzvN9nXeLlgoMIkhLMA3U01H+1ADQkeFLL+3kjn2QolTTe+VHVezF9PIoro
         kne7MBH4d+10j/rjUsQYvqUVhtEsOCMP3NKCOkyF0xYp9bqjcAzkuB0Ha0UFVdZD+X7i
         NXjZEbm6VxPQj+jAEv6SGUYnzG2AKMfI35qHhSJG+NeSGDYLC+yLR3XVErtN0jwsw+t5
         RuLZedZs0cdIhnAqOdVM4IlSnopAp3vsievwQZ6jAZRyf/FL+cQBucW/A6g714lUQMjA
         mHVw==
X-Gm-Message-State: AO0yUKXhriDTrayvY64jnZqLkqFZqCGVgZyIuQAGwwWO3oKLHgKZaWOE
	sxwuTAeZ2T1ns1xkb4/U36/Po1yRWAk=
X-Google-Smtp-Source: AK7set9YDNDwmxdsFLy/woZOY588L0htwOkYCy4MvT9Cp55wfgLlT3OEY2TefNEeGUK3XAbIeahYgg==
X-Received: by 2002:a05:600c:16c7:b0:3e2:1e01:803a with SMTP id l7-20020a05600c16c700b003e21e01803amr11948617wmn.9.1677252720251;
        Fri, 24 Feb 2023 07:32:00 -0800 (PST)
Received: from Clement-Blade14.outsight.local (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
        by smtp.gmail.com with ESMTPSA id z14-20020a05600c220e00b003e11f280b8bsm3114284wml.44.2023.02.24.07.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 07:31:59 -0800 (PST)
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
	Brenda Streiff <brenda.streiff@ni.com>
Subject: [PATCH v2 1/2] qemu: split out qemu-guest-agent, add startup scripts
Date: Fri, 24 Feb 2023 16:31:56 +0100
Message-Id: <20230224153157.20305-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Mar 2023 20:10:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178050

Split out the QEMU guest agent into a separate package. The agent is
intended to be installed within a QEMU VM guest where a user is likely
to not want to have the rest of the QEMU installation within it.

Additionally, an initscript, udev rules file, and systemd unit file are
added to the package so that the guest agent can start automatically;
the former two come from Debian's packaging for qemu-guest-agent.

Signed-off-by: Brenda Streiff <brenda.streiff@ni.com>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---

This is a resend of the patch from Brenda Streiff where I changed
the:
SYSTEMD_SERVICE:${PN}-guest-agent = "${PN}-guest-agent.service"
in
SYSTEMD_SERVICE:${PN}-guest-agent = "qemu-guest-agent.service"

 meta/recipes-devtools/qemu/qemu.inc | 35 ++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 92828e8f2d..cb443769f2 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -9,7 +9,7 @@ LICENSE = "GPL-2.0-only & LGPL-2.1-only"
 RDEPENDS:${PN}-ptest = "bash"
 
 require qemu-targets.inc
-inherit pkgconfig ptest
+inherit pkgconfig ptest update-rc.d systemd
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
                     file://COPYING.LIB;endline=24;md5=8c5efda6cf1e1b03dcfd0e6c0d271c7f"
@@ -30,6 +30,8 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0001-contrib-vhost-user-blk-Replace-lseek64-with-lseek.patch \
            file://0002-linux-user-Replace-use-of-lfs64-related-functions-an.patch \
            file://0001-configure-Fix-check-tcg-not-executing-any-tests.patch \
+           file://qemu-guest-agent.init \
+           file://qemu-guest-agent.udev \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
@@ -130,6 +132,20 @@ do_configure[cleandirs] += "${B}"
 do_install () {
 	export STRIP=""
 	oe_runmake 'DESTDIR=${D}' install
+
+	# If we built the guest agent, also install startup/udev rules
+	if [ -e "${D}${bindir}/qemu-ga" ]; then
+		install -d ${D}${sysconfdir}/init.d/
+		install -m 0755 ${WORKDIR}/qemu-guest-agent.init ${D}${sysconfdir}/init.d/qemu-guest-agent
+		sed -i 's:@bindir@:${bindir}:' ${D}${sysconfdir}/init.d/qemu-guest-agent
+
+		install -d ${D}${sysconfdir}/udev/rules.d/
+		install -m 0644 ${WORKDIR}/qemu-guest-agent.udev ${D}${sysconfdir}/udev/rules.d/60-qemu-guest-agent.rules
+
+		install -d ${D}${systemd_unitdir}/system/
+		install -m 0644 ${S}/contrib/systemd/qemu-guest-agent.service ${D}${systemd_unitdir}/system
+		sed -i -e 's,-/usr/bin/,-${bindir}/,g' ${D}${systemd_unitdir}/system/qemu-guest-agent.service
+	fi
 }
 
 # The following fragment will create a wrapper for qemu-mips user emulation
@@ -208,3 +224,20 @@ PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack,"
 INSANE_SKIP:${PN} = "arch"
 
 FILES:${PN} += "${datadir}/icons"
+
+# Put the guest agent in a separate package
+PACKAGES =+ "${PN}-guest-agent"
+SUMMARY:${PN}-guest-agent = "QEMU guest agent"
+FILES:${PN}-guest-agent += " \
+    ${bindir}/qemu-ga \
+    ${sysconfdir}/udev/rules.d/60-qemu-guest-agent.rules \
+    ${sysconfdir}/init.d/qemu-guest-agent \
+    ${systemd_unitdir}/system/qemu-guest-agent.service \
+"
+
+INITSCRIPT_PACKAGES = "${PN}-guest-agent"
+INITSCRIPT_NAME:${PN}-guest-agent = "qemu-guest-agent"
+INITSCRIPT_PARAMS:${PN}-guest-agent = "defaults"
+
+SYSTEMD_PACKAGES = "${PN}-guest-agent"
+SYSTEMD_SERVICE:${PN}-guest-agent = "qemu-guest-agent.service"
-- 
2.34.1


