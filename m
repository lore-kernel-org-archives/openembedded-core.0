Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6A8BC433FE
	for <webhook@archiver.kernel.org>; Sun, 17 Oct 2021 08:09:48 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web08.20773.1634458187441293325
 for <Openembedded-core@lists.openembedded.org>;
 Sun, 17 Oct 2021 01:09:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ICykvVTM;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id m42so5923455wms.2
        for <Openembedded-core@lists.openembedded.org>;
 Sun, 17 Oct 2021 01:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PM8d23vI0UiTdiVgeiZwPYiT0eaospGjtJXmQEfKElg=;
        b=ICykvVTM9os3i1r1RHkNePrBIKbUo4TaSFtFBl5CCju2ASc1oL3OUAh10vSbC5cYXg
         0MXF/16Of2FUwaRugUHYrTr47+uHZ7XkipGaAv3nZNh9gbeaoLoIO4yiQFo5oxy3N/Os
         ZwmoVsty2c50LXj7cSPToc/GT/cSggbuXsgnpl8becsWgE6OMrmhkI3Mvp3O2IXkRkoj
         eNBmSrNtTE5BQ79leCqfiVMARM90KtaYVTre4Us31puIqjNAK+cFy9gZhbW42lghDt9g
         4t1dxVP3IF1eBaxfq9vG6h7WC+UlVw1vpUhXLamWLcb0LUxfaFtyDThadaYvw17sNuZg
         Qd6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PM8d23vI0UiTdiVgeiZwPYiT0eaospGjtJXmQEfKElg=;
        b=645erh/qenCnSg+W5pudObu3Jhm5F9gap3biRGVGqQTRia63QwTUaWb1bFyAFSD6mk
         GjDkN5OvaOfI0Xnn8UwDknfc7Fwx2Mz+4oL6qXqljABYvbc/Ei51q0vgeBzrJP8ufuvq
         smmm1RkUjgUc6IcizEmalvrrpiNvqu7fx+4KW0g4Hbo2vtuRy1H1M5lEl/hen9NRVmJl
         DMm5SJhtpKgyjGinyK2O1Bx546rPgIVQXFYg2/543EUIpfH41UW9/9g1FSnk4efw7woz
         SMhWXVqXSqn3H9nlBb9r+wUvsz4Sgy4KUp8iq1EdPWr+k/bu9HcXwlwV60K3P+u4FRB6
         pjmQ==
X-Gm-Message-State: AOAM531b7JLKGBrH5+pN3EybhsHZLvoWcntaVLh+a+f0h242RoCvKc5B
	MTHl0qnFpypoEOVjvCZ1Zj80NGEkLKMGCfnO
X-Google-Smtp-Source: 
 ABdhPJwgVQU0dotyf2umd/I6JY//moCpV22+abhTA4jnIdn5iDr72PPUWvPZtEA9icUz6pC7+H2X6A==
X-Received: by 2002:a1c:f713:: with SMTP id
 v19mr22960697wmh.188.1634458185630;
        Sun, 17 Oct 2021 01:09:45 -0700 (PDT)
Received: from slackware.local
 (dslb-002-205-236-074.002.205.pools.vodafone-ip.de. [2.205.236.74])
        by smtp.gmail.com with ESMTPSA id
 e15sm9266657wrv.74.2021.10.17.01.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 01:09:45 -0700 (PDT)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: Openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH 2/5] oeqa/selftest: refactor common functions
Date: Sun, 17 Oct 2021 10:08:56 +0200
Message-Id: <20211017080859.96939-2-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20211017080859.96939-1-uvv.mail@gmail.com>
References: <20211017080859.96939-1-uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Oct 2021 08:09:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157027

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta/lib/oeqa/selftest/cases/overlayfs.py | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/overlayfs.py b/meta/lib/oeqa/selftest/cases/overlayfs.py
index 0184d52494..f0c9860b48 100644
--- a/meta/lib/oeqa/selftest/cases/overlayfs.py
+++ b/meta/lib/oeqa/selftest/cases/overlayfs.py
@@ -8,11 +8,14 @@ from oeqa.utils.commands import runCmd, bitbake, get_bb_var, runqemu
 class OverlayFSTests(OESelftestTestCase):
     """Overlayfs class usage tests"""
 
-    def getline(self, res, line):
-        for l in res.output.split('\n'):
+    def getline_qemu(self, out, line):
+        for l in out.split('\n'):
             if line in l:
                 return l
 
+    def getline(self, res, line):
+        return self.getline_qemu(res.output, line)
+
     def add_overlay_conf_to_machine(self):
         machine_inc = """
 OVERLAYFS_MOUNT_POINT[mnt-overlay] = "/mnt/overlay"
@@ -154,18 +157,13 @@ EOT
 
         bitbake('core-image-minimal')
 
-        def getline_qemu(out, line):
-            for l in out.split('\n'):
-                if line in l:
-                    return l
-
         with runqemu('core-image-minimal') as qemu:
             # Check that we have /mnt/overlay fs mounted as tmpfs and
             # /usr/share/my-application as an overlay (see overlayfs-user recipe)
             status, output = qemu.run_serial("/bin/mount -t tmpfs,overlay")
 
-            line = getline_qemu(output, "on /mnt/overlay")
+            line = self.getline_qemu(output, "on /mnt/overlay")
             self.assertTrue(line and line.startswith("tmpfs"), msg=output)
 
-            line = getline_qemu(output, "upperdir=/mnt/overlay/upper/usr/share/my-application")
+            line = self.getline_qemu(output, "upperdir=/mnt/overlay/upper/usr/share/my-application")
             self.assertTrue(line and line.startswith("overlay"), msg=output)
-- 
2.28.0


