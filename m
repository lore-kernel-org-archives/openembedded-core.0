Return-Path: <qorin.wu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72D9AC433EF
	for <webhook@archiver.kernel.org>; Mon, 20 Jun 2022 13:13:47 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.19750.1655730824573083043
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jun 2022 06:13:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YmyuR8Fw;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: qorin.wu@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id mf9so719924ejb.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jun 2022 06:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cEsANNVublWh/ZNL0ICIbZxjBw9PVXt8KTIr3XA0SA4=;
        b=YmyuR8FwdawayRsY1rGScFn/7oo+Cf1DHvONTXbpfQydICNzRAXU0BOtvdNaBq1gnV
         JmkH+TBO6X+H0Qa7EWM8+w+LTmTUoMddhHDyE4plMUowN/vKileoL7kyP3QoH1EGmNz6
         Fsx8ET7NjtWnMDIzZwJMJWKTc+b0lpZ9iapkjOCgGe04zLpO82eKSmM3lYNKU85C4+TB
         dHuWFsXNtkHf9GXiosM8/zdO9fckPWEVbZLR9pKHjW+1ryeyX1xy1gfaLd2C+DxQVw/J
         pkTGpaDso9SsRQ10OxdPxdlawrL14bJPfYdPUNg9rCo+xs0DNGDZtW3OEduiXLm3Lavz
         p3/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cEsANNVublWh/ZNL0ICIbZxjBw9PVXt8KTIr3XA0SA4=;
        b=oMX0zIpnfF+GXYDrwF6TPij3s86FVgQ2nKRPoqAvvzKxo37BUI9GPFyezvVHJONE9F
         Qq8DjncfLDQNufhE2aN1zAloFsUbn99PV2cIR1XmDnzZqDnY49kvIO9UNZPwhFGhr74U
         4JG0zAR4etElK/aekdZSM9sxLlq6z0ayKrHdHdj4P9NMG7H7DamBJ4yHcWbLDwoVXcry
         GOuWy8Wfa0bujaeeaAgZQlc+EsdkmjGdR02VNZKhg+YOPI38dFDU5cItfb+jblImphyF
         YYGvcDFyLLqlxFhls8Zrr2L3HzXyxJFjU+rZxlbW0gKjOj2KFZPPqVlRrXAJpIS7dSH4
         U+kQ==
X-Gm-Message-State: AJIora+UbHM3NHs1d8RgZtUxHit2t7V9blz2tbNf82r+C86l3hMndte3
	6dn15l5Z5PXyF2yRlSPEVxnrYqH7cQ==
X-Google-Smtp-Source: 
 AGRyM1tA7z1VPO+1VrT9Rbpy/diZx9jkFsBOqdHQ1gVLjo6UH3VOaZs/8Fv53eewVKC9JzvRkSvjEw==
X-Received: by 2002:a17:907:628a:b0:6fe:526c:ebc with SMTP id
 nd10-20020a170907628a00b006fe526c0ebcmr20424338ejc.531.1655730822718;
        Mon, 20 Jun 2022 06:13:42 -0700 (PDT)
Received: from localhost.localdomain
 (2001-1c00-0f23-2600-7412-8cb3-b465-5ec2.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:f23:2600:7412:8cb3:b465:5ec2])
        by smtp.gmail.com with ESMTPSA id
 fq36-20020a1709069da400b006fecef65fc4sm6051550ejc.179.2022.06.20.06.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 06:13:42 -0700 (PDT)
From: Qorin <qorin.wu@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Qorin <qorin.qorinna@nl.abb.com>
Subject: [PATCH] resolvconf: Install missing normalize-resolvconf file
Date: Mon, 20 Jun 2022 15:13:38 +0200
Message-Id: <20220620131338.160501-1-qorin.wu@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jun 2022 13:13:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167100

From: Qorin <qorin.qorinna@nl.abb.com>

It was moved to a separate file in version 1.90
---
 meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb
index 94fd2c1a70..dba58ad2d6 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb
@@ -25,6 +25,10 @@ UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/r/resolvconf/"
 
 inherit allarch
 
+# The normalize-resolvconf sed script uses /bin/sed on the shebang line.
+# Ignore the file-rdeps test to avoid having to add a runtime dependency on sed.
+INSANE_SKIP:${PN} += "file-rdeps"
+
 do_compile () {
 	:
 }
@@ -46,6 +50,7 @@ do_install () {
 	chown -R root:root ${D}${sysconfdir}/
 	install -m 0755 bin/resolvconf ${D}${base_sbindir}/
 	install -m 0755 bin/list-records ${D}${base_libdir}/${BPN}
+	install -m 0755 bin/normalize-resolvconf ${D}${base_libdir}/${BPN}
 	install -d ${D}/${sysconfdir}/network/if-up.d
 	install -m 0755 debian/resolvconf.000resolvconf.if-up ${D}/${sysconfdir}/network/if-up.d/000resolvconf
 	install -d ${D}/${sysconfdir}/network/if-down.d
-- 
2.30.2


