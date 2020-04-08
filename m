Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web12.13554.1586358904145161036
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2020 08:15:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=krko7Xcd;
 spf=pass (domain: konsulko.com, ip: 209.85.221.65, mailfrom: pbarker@konsulko.com)
Received: by mail-wr1-f65.google.com with SMTP id c15so8172782wro.11
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2020 08:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8XdXNd5/tX7Ukl9iMK76yXQh5QpzD7GfmlwG+jbC390=;
        b=krko7XcdXI4/Ywfuof7oGeYtaLsQJpg8nl7csV99PNZFxHLij2sl/ddE/pfbdkGBd6
         ITi5o3DeQyhiTOdwnzbIWfW1M+kp4uW19N6hN67VqKwWDBvphlT+wnulV/qSzrqid1A9
         ZUX7BSCQ9Wq0r1/hC6J/+PnbNiaZPKQQCJXYs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8XdXNd5/tX7Ukl9iMK76yXQh5QpzD7GfmlwG+jbC390=;
        b=ee7tOZhN1/eDes8UaSz5tSnxCV5knZzKd9iibqzso6Xk2+FJmpZxDunoYeiP+Am9cY
         m24xqrCbUucFxsEBtFqsRJ/Fx1jFDspLCyrPA2tkt0CNSCm6P2dsOGcNYPo8KEGb66t3
         lV0MrYQQ+zqKljh36bKvRAecRoOOEFMLYVJuMP1J90hxH1A4vf/KFFXiq1nyedZodC5y
         vwgi0I7PXwKE8TzUIqyxFhMenGl5I51DAUjvUh2+N86/D5y6BCRLuPwtt8Cvb6WR1jVh
         V4Crnqd+lAD2QatDJYMmkN0ROq7l3rCwOHlFpmjGV8ZT6TWjy4AbTaZ0GwMkDxGHGHKk
         dH8w==
X-Gm-Message-State: AGi0PuYSL0VxTk5DeuWRYqhCE7Xa0ypeJ8D3e30mZpdC3SSgaicB1CYf
	Yq1YEmbmAAIe9AbGDEFB9qSTh150IA4R2w==
X-Google-Smtp-Source: APiQypIzQ6n/qRFifS7/mrri3i744EXNrNhOSxw7kIJx0yK7A/DnewHzqw96jogZwPMG0bAVO8AaNg==
X-Received: by 2002:a5d:4d12:: with SMTP id z18mr9122367wrt.67.1586358902235;
        Wed, 08 Apr 2020 08:15:02 -0700 (PDT)
Return-Path: <pbarker@konsulko.com>
Received: from ub1910.Hitronhub.home ([213.48.11.149])
        by smtp.gmail.com with ESMTPSA id n6sm7149067wmc.28.2020.04.08.08.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 08:15:01 -0700 (PDT)
From: "Paul Barker" <pbarker@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [PATCH] kernel-yocto.bbclass: Fix deps when externalsrc is used
Date: Wed,  8 Apr 2020 16:14:55 +0100
Message-Id: <20200408151455.4480-1-pbarker@konsulko.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

do_kernel_configme was recently removed from SRCTREECOVEREDTASKS so this
task still runs when externalsrc is used. This task normally runs after
do_patch but when externalsrc is used, do_patch is removed and this ordering
restriction does nothing. This allows bitbake to execute do_kernel_configme
too early, causing races with do_unpack.

This is fixed by adding in a dependency on do_unpack when externalsrc is
used.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 meta/classes/kernel-yocto.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 6792c9a233..5bc627066e 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -489,6 +489,12 @@ python () {
     # If diffconfig is available, ensure it runs after kernel_configme
     if 'do_diffconfig' in d:
         bb.build.addtask('do_diffconfig', None, 'do_kernel_configme', d)
+
+    externalsrc = d.getVar('EXTERNALSRC')
+    if externalsrc:
+        # If we deltask do_patch, do_kernel_configme is left without
+        # dependencies and runs too early
+        d.setVarFlag('do_kernel_configme', 'deps', (d.getVarFlag('do_kernel_configme', 'deps', False) or []) + ['do_unpack'])
 }
 
 # extra tasks
-- 
2.20.1

