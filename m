Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEA7BEB64DC
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 14:10:03 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.20270.1689343801981070889
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jul 2023 07:10:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=BJ6uCtHx;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3141fa31c2bso1971547f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 07:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689343800; x=1691935800;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AH2aQu16C/6N57otlliaRtPGOY13+1ztuGdXc/4mykk=;
        b=BJ6uCtHxAv/+Pl9ignzOpJ+i41GkNnEikyDmb+VUVJ81VRFz8rDmuSlmMcKx+P7w3b
         +J3p9fN0dyUN/Jr7ZEbwyOe66ZEmC24N2tL5ZkKuWqum91zvNUnhm5gFWV8iNKedlOy4
         zoo1OhttAeoYZO0xmhhXoqPjMmXsl4hHJKlNgo+USaUUZeaY1NkBH+kfsjHEC8gBj6DP
         TOsa7i0PFtKlW/sBZR5Y60NRC3whqJhQc7DURwAOxn9UhYWBozmELz0iBHwMY1ryK8U3
         82rHWh/um9xmTBbHggdTU2IlV3GDqBhdrvemU96AeAR7vfqaKzrsMXTBST9j5PujIZyi
         1QNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689343800; x=1691935800;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AH2aQu16C/6N57otlliaRtPGOY13+1ztuGdXc/4mykk=;
        b=JTKlqkwNeJJGxW/tGbpVTJJuoC/lcqLsCP8WqunrvwMCBf6+AkvXUK2QvsdYuGnpZ1
         XCyE9jQ9xkM/bos9juW4n2ltfbMfodDZD36faXqlsacwb5GJ5IfJq/1IphoxxnZzESOK
         fNs5Dmo86gv1t2AOA570X8rZ5N68UckbXlgIPkla4hU//8wRntlqUKkT/8zX+A/JgNmP
         4uZ6OjPHfwRjr3nnM9vCZ7qW1HJm6TZVssbiN8Hx19S0JpkJU4FBjZGNseSGJbUAY5hf
         s4udJC9IgaDRYdCxz3MKALoxdcnIiqmeZ+QJmtwyocB2SMYeg/iI1bCb6CDNEJK5Hd35
         SNNA==
X-Gm-Message-State: ABy/qLbVoxYvcO4AU6ftud/K8E0JMwOlC/GB+kRpSq6wYKT9e92NVePg
	j68QbeMh9ReEsBrsLSS68Af8tApCLP4=
X-Google-Smtp-Source: APBJJlE+IQHNLb3lK0J01g7AYjXr0gBMdlhaxlO/gfTvcTBGshIv4itKREGM22dOTCBjF6eyxQ/0ng==
X-Received: by 2002:a5d:4711:0:b0:314:1f6:2c24 with SMTP id y17-20020a5d4711000000b0031401f62c24mr4429821wrq.36.1689343799958;
        Fri, 14 Jul 2023 07:09:59 -0700 (PDT)
Received: from localhost.localdomain (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id t14-20020a5d690e000000b003112f836d4esm10933870wru.85.2023.07.14.07.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 07:09:59 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH] eudev: Add group sgx to eudev package
Date: Fri, 14 Jul 2023 15:09:55 +0100
Message-Id: <20230714140955.28052-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 14:10:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184267

Fix startup warning:

  udevd[171]: specified group 'sgx' unknown

This mirrors the change in bab455cd9b1b ("systemd: add group sgx to udev
package") for systemd-udev.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

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


