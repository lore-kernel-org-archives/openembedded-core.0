Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E45CC4167B
	for <webhook@archiver.kernel.org>; Sat, 26 Nov 2022 14:16:26 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.70860.1669472177352263455
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Nov 2022 06:16:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=lsdtH69I;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id b21so6295004plc.9
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 06:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p14tb1B7+eFHXmz0ezSJu51UHpwfuA7L5z27+4JodCM=;
        b=lsdtH69I/IBwnh3f8u5yx3qgx144Rzr/RsyjVPevUy+kv6ZLQqwIHVI1xFfc56beYN
         1EZ8Sj6qWkovaJNyNUql248GZLXPH2zkdpsSa06d7kNmm7dJux7e3ofNsikvDV+o6HZC
         K4GeqTJhevjV/8DJWxohpqt3Du7lygAfdUQcQuyadTKBlpYQkO33fN0pe/kwO+EH3KWy
         NaEedMmUqXN5QVoMzf5zUvAe413tkcwNnmCGSC3N2lXbF57ZCc8yNvDXxC/o//AikFAY
         OkIEDSkTBbDyoJqfKJHZ57Ti4JEh8Lviyu1Wihc1PhA12PTVoOtNbkD/r5MR7TsFAouX
         JKiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p14tb1B7+eFHXmz0ezSJu51UHpwfuA7L5z27+4JodCM=;
        b=Bw6yUZ4e3wCzZenFrnd4y6k2B1y2Ufm0PhjQGi7tvgRrt0LgcrheCAXFBG3y39h3X6
         mIzvDnT1q9FJTCAZuAEAym85INrxf4BhekxprnLyWp8Nr/f63lYJdmQjVPgDtjaW7CcQ
         +QtzO+eq9ufkfs3dnBS1jjZhVLrR3PQWTj0PxzvZUMCv+PnWrIl44YApVTA27IK28/9n
         tpNQKAfa0JkBoAufs1PstLuTdJN/NJXBP71inRgs+CZALiovBNZSClNMHvb2ZbyibRUL
         G6vN47HnBQ2uwB7mKVNieiqEuq69oEMbawpr0DcJhl5LAdhOmswOHMdsSj+2rKdk3uwY
         Fwzg==
X-Gm-Message-State: ANoB5pnpXg8+/hJp4z12sXqwckr1vRp1GMj25/WfWuuaTeGbCEx6rEwL
	U/wpBGz6H1dtUIIdhSMds4X5qd2VsY3kj7PyHA0=
X-Google-Smtp-Source: AA0mqf4UPuHOnFn8fcJJuQTl9LiFhscdsWBDnkamLuzY39aMoHHjPsix+FINwfi5wAc5a/LKwjeblw==
X-Received: by 2002:a17:90a:307:b0:213:ff80:b37f with SMTP id 7-20020a17090a030700b00213ff80b37fmr52185179pje.118.1669472176450;
        Sat, 26 Nov 2022 06:16:16 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id im22-20020a170902bb1600b001895f7c8a71sm4649177plb.97.2022.11.26.06.16.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Nov 2022 06:16:16 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 35/37] systemd: add group render to udev package
Date: Sat, 26 Nov 2022 04:14:39 -1000
Message-Id: <f8e78f3f655b513280675fb353b21be6fb5e88c4.1669471990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669471990.git.steve@sakoman.com>
References: <cover.1669471990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 14:16:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173828

From: Peter Marko <peter.marko@siemens.com>

From NEWS for v236:
* The "uaccess" udev tag has been dropped from /dev/kvm and
  /dev/dri/renderD*.  These devices now have the 0666 permissions by
  default (but this may be changed at build-time). /dev/dri/renderD*
  will now be owned by the "render" group along with /dev/kfd.

Without the group systemd-udevd startup logs:
  /lib/udev/rules.d/50-udev-default.rules:39 Unknown group 'render', ignoring
  /lib/udev/rules.d/50-udev-default.rules:40 Unknown group 'render', ignoring

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 84efd72d48616405dbe4d73ec95917077144ed09)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/systemd/systemd_251.8.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_251.8.bb b/meta/recipes-core/systemd/systemd_251.8.bb
index 1b771a7b86..5fb0e86982 100644
--- a/meta/recipes-core/systemd/systemd_251.8.bb
+++ b/meta/recipes-core/systemd/systemd_251.8.bb
@@ -395,11 +395,13 @@ SYSTEMD_PACKAGES = "${@bb.utils.contains('PACKAGECONFIG', 'binfmt', '${PN}-binfm
 SYSTEMD_SERVICE:${PN}-binfmt = "systemd-binfmt.service"
 
 USERADD_PACKAGES = "${PN} ${PN}-extra-utils \
+                    udev \
                     ${@bb.utils.contains('PACKAGECONFIG', 'microhttpd', '${PN}-journal-gatewayd', '', d)} \
                     ${@bb.utils.contains('PACKAGECONFIG', 'microhttpd', '${PN}-journal-remote', '', d)} \
                     ${@bb.utils.contains('PACKAGECONFIG', 'journal-upload', '${PN}-journal-upload', '', d)} \
 "
 GROUPADD_PARAM:${PN} = "-r systemd-journal;"
+GROUPADD_PARAM:udev = "-r render"
 GROUPADD_PARAM:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'polkit_hostnamed_fallback', '-r systemd-hostname;', '', d)}"
 USERADD_PARAM:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'coredump', '--system -d / -M --shell /sbin/nologin systemd-coredump;', '', d)}"
 USERADD_PARAM:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'networkd', '--system -d / -M --shell /sbin/nologin systemd-network;', '', d)}"
-- 
2.25.1


