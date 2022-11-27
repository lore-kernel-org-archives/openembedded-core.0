Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43367C352A1
	for <webhook@archiver.kernel.org>; Sun, 27 Nov 2022 13:56:33 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.91907.1669557389949064168
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Nov 2022 05:56:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=InwCkB4p;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id w79so8155393pfc.2
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 05:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ymNwStmb55ScjcMa1wVKe+qWhcfhgVWvTYeahcB2WQk=;
        b=InwCkB4pc5SPwwh1ayCbmgO6enBi2v9TVAEnSnGg5DYUJGEAbPZmJqyIsZqYTiwwC+
         R8O9A3C2cCTarTKCnhA/tKqn3GQg+oQvZgUngrXCv2exZXTbKYOY8Rl5YPpUjE08sXLS
         8gqMiywMRLBHsdYQ5nO/GS2zB1GUV7aZ9P3N/DNhpKCm4S4paSd9eL0NUPGomiv40qa4
         4DGH67fbRD1iHN+E4/Uf9jjIKVJpXG8b/nXWuMtwtl3YE1YJ6+5LFo2/xkHgZ9czX0Xv
         FcZ3VQMOMfLZ13qJaSQM9MHqqPY+o36qvEeVINk+WaRMJXRkRZT1RYjgIeT2mP8QDn7z
         8jbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ymNwStmb55ScjcMa1wVKe+qWhcfhgVWvTYeahcB2WQk=;
        b=QylKUEFa24NnFau1rseE5e349j4aSwzv69eupIe1dW/Kum14DI+2rlHWtYJ9ei9ChG
         iG4Zxjfhf0kqDFvoqg5GEvU/VXiyguV7vsx29OdT3Xsa/y4SaCEYo51T326bNIt7zb1t
         BBDpI92pL9Ycz/nlDH3UCJyRlW350LHwRZDp/gidJ2N242U2p2gmcefbDi6VnHPFRuAh
         MRWdtGkDuRbXCOjjQgJsHVZkCupfjmtAFFiFgvQkqILPEWGghkWNGM/+EtkkUYe2k8jX
         CfwvSEL2X+XYKxcfn5gnNWimXViFTjzLbaA78FEFCwyTmFGx25CiIibNMVLzKplmTdPt
         XHeQ==
X-Gm-Message-State: ANoB5pmZ0nUSk0CEiQnLQcPrqKVCkE2uzwf0WC3NcmjPQrVYvbgIFMEA
	2SNsmVPjsOJpKFss7knbFw7P8OxASQb90PYh3QE=
X-Google-Smtp-Source: AA0mqf581ePgntskoIQQbLkzDLSo2iS3E41X+nCyjj1xVtfw2Aq0X278qBh8J0dbDrGmYV8pAd7nVg==
X-Received: by 2002:a63:ec07:0:b0:470:90f1:6216 with SMTP id j7-20020a63ec07000000b0047090f16216mr41718708pgh.42.1669557388932;
        Sun, 27 Nov 2022 05:56:28 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id c15-20020a170902d48f00b001868bf6a7b8sm6910544plg.146.2022.11.27.05.56.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 05:56:28 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 29/31] systemd: add group render to udev package
Date: Sun, 27 Nov 2022 03:55:15 -1000
Message-Id: <f902338f312cf5c55b2857e5c7e980cb11a26a9c.1669557026.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669557026.git.steve@sakoman.com>
References: <cover.1669557026.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 13:56:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173874

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
 meta/recipes-core/systemd/systemd_250.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_250.5.bb b/meta/recipes-core/systemd/systemd_250.5.bb
index 93cdd6fa16..ab349b7307 100644
--- a/meta/recipes-core/systemd/systemd_250.5.bb
+++ b/meta/recipes-core/systemd/systemd_250.5.bb
@@ -389,11 +389,13 @@ SYSTEMD_PACKAGES = "${@bb.utils.contains('PACKAGECONFIG', 'binfmt', '${PN}-binfm
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


