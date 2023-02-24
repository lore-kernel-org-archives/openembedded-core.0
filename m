Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E3C2C61DA3
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 13:54:20 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.17981.1677246851066960041
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Feb 2023 05:54:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=TVu5sY9X;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-2023022413540792fc1c3125bfa2508d-74j5z3@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 2023022413540792fc1c3125bfa2508d
        for <openembedded-core@lists.openembedded.org>;
        Fri, 24 Feb 2023 14:54:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=fKuJpFH98ASpGlZRFUpy47oUK0yi7eJC2mZqmr83XMI=;
 b=TVu5sY9XqYeGL2fmTKJ6MyR/LICXnlRvU1uJKgct+ausS77fNAOaQrhXLXRbZCU2JddcFO
 M2iT7mpw66ny0VYEs9TsKQrriJoP8lz6A6hK+YSpFgryNo0s0LLRnHjmdaZk7/DxzIMHY1bS
 iioRBHGkN8p2HCYrO8Ul772gTMu8I=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] systemd: add group sgx to udev package
Date: Fri, 24 Feb 2023 14:53:09 +0100
Message-Id: <20230224135309.367686-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 13:54:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177684

From NEWS for v250:
* Device nodes for the Software Guard eXtension enclaves (sgx_vepc) are
  now also owned by the system group "sgx".

From NEWS for v248:
* Intel SGX enclave device nodes (which expose a security feature of
  newer Intel CPUs) will now be owned by a new system group "sgx".

Fixes following journal error entry during startup:
  /lib/udev/rules.d/50-udev-default.rules:43 Unknown group 'sgx', ignoring
This is seen already on kirkstone.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-selftest/files/static-group           | 1 +
 meta/recipes-core/systemd/systemd_252.5.bb | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-selftest/files/static-group b/meta-selftest/files/static-group
index b13dde3218..cbec6f1377 100644
--- a/meta-selftest/files/static-group
+++ b/meta-selftest/files/static-group
@@ -24,3 +24,4 @@ weston-launch:x:524:
 weston:x:525:
 wayland:x:526:
 render:x:527:
+sgx:x:528:
diff --git a/meta/recipes-core/systemd/systemd_252.5.bb b/meta/recipes-core/systemd/systemd_252.5.bb
index 64a3efa1d4..f67351d207 100644
--- a/meta/recipes-core/systemd/systemd_252.5.bb
+++ b/meta/recipes-core/systemd/systemd_252.5.bb
@@ -410,7 +410,7 @@ USERADD_PACKAGES = "${PN} ${PN}-extra-utils \
                     ${@bb.utils.contains('PACKAGECONFIG', 'journal-upload', '${PN}-journal-upload', '', d)} \
 "
 GROUPADD_PARAM:${PN} = "-r systemd-journal;"
-GROUPADD_PARAM:udev = "-r render"
+GROUPADD_PARAM:udev = "-r render;-r sgx;"
 GROUPADD_PARAM:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'polkit_hostnamed_fallback', '-r systemd-hostname;', '', d)}"
 USERADD_PARAM:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'coredump', '--system -d / -M --shell /sbin/nologin systemd-coredump;', '', d)}"
 USERADD_PARAM:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'networkd', '--system -d / -M --shell /sbin/nologin systemd-network;', '', d)}"
-- 
2.30.2


