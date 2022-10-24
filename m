Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B00CC38A2D
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 11:33:27 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web09.18032.1666611201610762710
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Oct 2022 04:33:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FsoEOGSr;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id bk15so15618835wrb.13
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Oct 2022 04:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y0Nvxx6uopFGygcvK60f/7pFZC7mXufq7wHKpZ6N3dI=;
        b=FsoEOGSrbqvqzBNisjvvbff/txVTTtvcfu6ys9GtbwK7YpHma3EsgLaasIoCMO7bPM
         QPOV3LNrv5xFH5HVAkN/LzYAtKSq2Y9HzGCFwH5TiIqFjlBJKQF13VGJGwXFvR1zpaci
         VeeYDfOVNrkAEaJ9sZHgFO/k2+wzF+Q8Lc4gCtqtsaTicHYlJLyTe65AArK2ANRxKCvH
         Lq4RO6Un5wQYAUn+Yw+4i8P8Ku4fMq2Iz7KBm3dKSIhDglguEHBsbX6L4yGRpq/QEQWl
         ngJeXzlAkLRSOBeDJa0KQ0Rqu7UXWZBzIJ4l7RAQ050IYBS8uoe4l0zVsV4+5V6OIOGU
         WYXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y0Nvxx6uopFGygcvK60f/7pFZC7mXufq7wHKpZ6N3dI=;
        b=acVssMaQpWZ2oYS9ei/vWFQQRcf8bfoNd6LiK1vE7TEJKI+By9qTTAoZABVfHZ/hq+
         Q9gr3an7c8XGjEPnXbo49dqJvIpP0QISUS5kKCIzK5cOrh3gqPEY6sm05k4Dd7ufEnrv
         frp4DVNPkWkAt35WDUOIvtyfX26Ore/tB2oxKsBc2WVaeKYFI6sQ+BAZDXYYRZVoaBFw
         gUJab0maxX5pFn4OZktkpzTgto3rU3Hm7QcGaKDwZO/zMIWv+z1YVUBoZWubWOcC65JZ
         ++uzPBP7Q9k11pW5tKGFDu/OUx4d9JCdJTwrPWcGUP8rlOs4QabdRRkQPJvcId8GT5x4
         NKWA==
X-Gm-Message-State: ACrzQf1o2TJzbI3tNEcb9+YmUDvLBMHECI2JRAkDpZZS5LLKiWAwH5No
	XTu3xo/2uxOU2ZcT2AXtuqvWYYnWomMY3A==
X-Google-Smtp-Source: AMsMyM68p4gVLmazq+9lYb1zqWp03PbtuoxX6+YU+3XE+y8yO2Q7uKAbZ/G2Meun4M4nL9wg503gtQ==
X-Received: by 2002:a05:6000:1d82:b0:22c:ae77:c8dc with SMTP id bk2-20020a0560001d8200b0022cae77c8dcmr21735724wrb.413.1666611199695;
        Mon, 24 Oct 2022 04:33:19 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.io.net (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id n4-20020a1ca404000000b003c41144b3cfsm7880044wme.20.2022.10.24.04.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 04:33:19 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [PATCH v2] kernel-yocto: improve fatal error messages of symbol_why.py
Date: Mon, 24 Oct 2022 11:32:16 +0000
Message-Id: <20221024113215.2116725-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Oct 2022 11:33:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172085

Improve the fatal error message of the yocto-kernel-tools symbol_why.py
and shows the command that generate the error as it can help understand
the root cause of the error.

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---

v2: get cmd from the exception CalledProcessError

 meta/classes/kernel-yocto.bbclass | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index e8046bb8f6..82e792351f 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -500,7 +500,7 @@ python do_config_analysis() {
                 try:
                     analysis = subprocess.check_output(['symbol_why.py', '--dotconfig',  '{}'.format( d.getVar('B') + '/.config' ), '--blame', c], cwd=s, env=env ).decode('utf-8')
                 except subprocess.CalledProcessError as e:
-                    bb.fatal( "config analysis failed: %s" % e.output.decode('utf-8'))
+                    bb.fatal( "config analysis failed when running '%s': %s" % (" ".join(e.cmd), e.output.decode('utf-8')))
 
                 outfile = d.getVar( 'CONFIG_ANALYSIS_FILE' )
 
@@ -508,7 +508,7 @@ python do_config_analysis() {
                 try:
                     analysis = subprocess.check_output(['symbol_why.py', '--dotconfig',  '{}'.format( d.getVar('B') + '/.config' ), '--summary', '--extended', '--sanity', c], cwd=s, env=env ).decode('utf-8')
                 except subprocess.CalledProcessError as e:
-                    bb.fatal( "config analysis failed: %s" % e.output.decode('utf-8'))
+                    bb.fatal( "config analysis failed when running '%s': %s" % (" ".join(e.cmd), e.output.decode('utf-8')))
 
                 outfile = d.getVar( 'CONFIG_AUDIT_FILE' )
 
@@ -569,7 +569,7 @@ python do_kernel_configcheck() {
     try:
         analysis = subprocess.check_output(['symbol_why.py', '--dotconfig',  '{}'.format( d.getVar('B') + '/.config' ), '--mismatches', extra_params], cwd=s, env=env ).decode('utf-8')
     except subprocess.CalledProcessError as e:
-        bb.fatal( "config analysis failed: %s" % e.output.decode('utf-8'))
+        bb.fatal( "config analysis failed when running '%s': %s" % (" ".join(e.cmd), e.output.decode('utf-8')))
 
     if analysis:
         outfile = "{}/{}/cfg/mismatch.txt".format( s, kmeta )
@@ -591,7 +591,7 @@ python do_kernel_configcheck() {
     try:
         analysis = subprocess.check_output(['symbol_why.py', '--dotconfig',  '{}'.format( d.getVar('B') + '/.config' ), '--invalid', extra_params], cwd=s, env=env ).decode('utf-8')
     except subprocess.CalledProcessError as e:
-        bb.fatal( "config analysis failed: %s" % e.output.decode('utf-8'))
+        bb.fatal( "config analysis failed when running '%s': %s" % (" ".join(e.cmd), e.output.decode('utf-8')))
 
     if analysis:
         outfile = "{}/{}/cfg/invalid.txt".format(s,kmeta)
@@ -610,7 +610,7 @@ python do_kernel_configcheck() {
     try:
         analysis = subprocess.check_output(['symbol_why.py', '--dotconfig',  '{}'.format( d.getVar('B') + '/.config' ), '--sanity'], cwd=s, env=env ).decode('utf-8')
     except subprocess.CalledProcessError as e:
-        bb.fatal( "config analysis failed: %s" % e.output.decode('utf-8'))
+        bb.fatal( "config analysis failed when running '%s': %s" % (" ".join(e.cmd), e.output.decode('utf-8')))
 
     if analysis:
         outfile = "{}/{}/cfg/redefinition.txt".format(s,kmeta)
-- 
2.34.1


