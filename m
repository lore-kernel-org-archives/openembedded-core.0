Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A982EC4332F
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 17:53:13 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.379.1667929983562851858
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Nov 2022 09:53:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Q9oTL6pS;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20221108175300b5a76def0b75875463-zuyy8y@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20221108175300b5a76def0b75875463
        for <openembedded-core@lists.openembedded.org>;
        Tue, 08 Nov 2022 18:53:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=4VNiFpG0zdkbTlHuqNs60xE6MWa888MccOl6VHYZN+Q=;
 b=Q9oTL6pSFtdlJ+XiWGmnIr6YnzHDRCjB63/woaDw+gqn4K59sMwTNb6Sp/jtcYWGRv83UU
 NfWlcmPgYRU9kIz4TKE1iufttg3jOUsMpGhFiRcMyNMVD9GdqrrM/EHCg1ZyTz7L/TG0XLLj
 325z0jgVtLtIxnxWFSAWemIuzEU1w=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] systemd: add group render to udev package
Date: Tue,  8 Nov 2022 18:51:54 +0100
Message-Id: <20221108175154.280624-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 17:53:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172987

From NEWS for v236:
* The "uaccess" udev tag has been dropped from /dev/kvm and
  /dev/dri/renderD*.  These devices now have the 0666 permissions by
  default (but this may be changed at build-time). /dev/dri/renderD*
  will now be owned by the "render" group along with /dev/kfd.

Without the group systemd-udevd startup logs:
  /lib/udev/rules.d/50-udev-default.rules:39 Unknown group 'render', ignoring
  /lib/udev/rules.d/50-udev-default.rules:40 Unknown group 'render', ignoring

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/systemd/systemd_251.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_251.4.bb b/meta/recipes-core/systemd/systemd_251.4.bb
index 1b771a7b86..5fb0e86982 100644
--- a/meta/recipes-core/systemd/systemd_251.4.bb
+++ b/meta/recipes-core/systemd/systemd_251.4.bb
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
2.30.2


