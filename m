Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4C42CA0EE4
	for <webhook@archiver.kernel.org>; Thu, 14 Aug 2025 04:26:19 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web10.15474.1755145570137090524
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Aug 2025 21:26:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=B3xxinr7;
 spf=pass (domain: underview.tech, ip: 209.85.219.47, mailfrom: vince@underview.tech)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-70a928133e1so5597226d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 21:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1755145569; x=1755750369; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vYL3+SMxOfz7LJXvuqv95zUvs4DZCf9tVJZcvGNurJo=;
        b=B3xxinr7wQt+eATQf8v56x2eJ1EW8FwKW9t5oFKfr43yZc24w9q4rx2ihyhvtEWHUo
         ZafN/WQPDYTw4fR+r6wcbTSbgkyI1OKGC6bkh8W8rRN9R6kMoxpWG9zpTRNMJUj2M5wM
         u65yPRn5o6wV2/siN9ktmmcPo02MrudJ8KORv9U0CzSJK3t5l3QUgOSncUtgk8GJdhIo
         /d1AILikWeKFjaYNCnbfqz246Sn+sjQPAkGCwqjTwL8qwDY3Fg3bfEfaVDM/J7pd9qMV
         frUpouclQrAfwZIDrgEwsAS8TM1++uAX/Bpop7uwYJNfjgE/oK50RDtpsitWHYjwIsuG
         3/fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755145569; x=1755750369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vYL3+SMxOfz7LJXvuqv95zUvs4DZCf9tVJZcvGNurJo=;
        b=UIF6pAGf+taGIo4wJKfoWEsaS9noucbM4RCWHrw6QxhZapn5svbP6D2Z/BAab20UR6
         cLOQXFMyN4OhuKa5azXkwa61nD0SZbTWoEzfEfdIpTbW5NgrPc3LmwHpIPyMr9FP5gTz
         3PJvQr8/U0lt9KwdC+1KhsaPpUPGKfIR1YJ1BT80LxopEJyuJv+jzb8ZwakllqmPZImB
         FXX5uPs/kzMCMJlgc35z6d5yQE38eTJf2e4KdaFBkN0guh/IPQwSuuN9zRb5mESy/wGf
         dUv3FEJDrSYdDoVYhfT2l3R9dpJu1/TFYsm9RlV+Qz7KPX+wd8DaX3vimt2hKxYJBMA8
         PN0A==
X-Gm-Message-State: AOJu0YyTh2Qe6ln+OnSNaCg9wKoykLZzxbHyBZAHuqLocALLU22o7kGU
	Gx2wsobsifwhTMadJBlRtpFG3Hf9aMppyiTWCsQt3bgJNuzDOdhbjCRMoYMRlMIrByQrbhCN1Tm
	yWm00TVg=
X-Gm-Gg: ASbGncvF2Rs7+OreXPi9+nwu30TppLbPHVWc6+ul+bUGre1nMKGo6KjbXnZepN7KfjQ
	SNCH4bkOq/qIeur1NM2a3wLbAMSzsrUcbyoUeLoxPBhnzaMMdrWJ+Hphj4R3BE8pgUSHfIGBTNE
	rgZ452zxSR8ZiB/LZXZ1AffOcIwKlb+jYZxvZdn1WU+AuxE5L2zXxs+hQoRMDfHNbHjyb66V9a3
	s+QAaMtWeZJAFKKWyFuOhxPh8TkSAMEyhs8FP9jVXCt66zei3ni5BSlExQkjLzTIcPojeJ/OLnX
	6x+NEmTzmeXfTpBAwiVnHtiLVme5mgFekWTHL1ZyGwONjAxuZ4cXm9SJTgq1mLiytiNpaLNtsXB
	duDLIo2VW5oY1F/tRlZRJgbLDJa3KkTqPK/sg5R58psK5Kg==
X-Google-Smtp-Source: AGHT+IEhqjBhnZoPmx74JyPCxRvT16xuAEqpXJgmGcfGsps6zNYnxXr9qq6UWGE97H0V6lFCUddaqA==
X-Received: by 2002:ad4:5aa9:0:b0:702:b805:276b with SMTP id 6a1803df08f44-70ae6f6f80amr27253076d6.20.1755145568803;
        Wed, 13 Aug 2025 21:26:08 -0700 (PDT)
Received: from vince-B550I-AORUS-PRO-AX.. ([2601:406:4d01:1820:e358:dd1a:4ea0:986c])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70ae6cb6cc2sm8322816d6.22.2025.08.13.21.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 21:26:08 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v8 4/9] bootimg_pcbios: cleanup _do_configure_syslinux function
Date: Thu, 14 Aug 2025 00:25:47 -0400
Message-Id: <20250814042552.21887-4-vince@underview.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250814042552.21887-1-vince@underview.tech>
References: <20250814042552.21887-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Aug 2025 04:26:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221844

This commit:

1. Removes all unrequired function parameters.
   The part parameter was kept due to it's potential
   future usage in _do_configure_syslinux function.
   part.fstype specifically may be used with the
   rootfstype kernel paramater.

2. Sets a default timeout to 500 if bootloader --timeout
   not specified. To avoid 'None' being placed
   as the value in resulting configuartion file.
3. Sets a default kernel parameter string if
   bootloader --append not specified. This also
   helps avoid 'None' being places as the value
   in resulting configuration file.
4. Replace all instances of

   cr_workdir, "/hdd/boot"

   with variable

   hdddir

   as it's set at the top of the function. No,
   need to re-implement what the variable is
   already defined to store.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 .../lib/wic/plugins/source/bootimg_pcbios.py  | 25 ++++++++++++-------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg_pcbios.py b/scripts/lib/wic/plugins/source/bootimg_pcbios.py
index 47fd4b9415..887a548cde 100644
--- a/scripts/lib/wic/plugins/source/bootimg_pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg_pcbios.py
@@ -59,9 +59,7 @@ class BootimgPcbiosPlugin(SourcePlugin):
                                oe_builddir, bootimg_dir, kernel_dir,
                                native_sysroot):
 
-        cls._do_configure_syslinux(part, source_params, creator, cr_workdir,
-                                   oe_builddir, bootimg_dir, kernel_dir,
-                                   native_sysroot)
+        cls._do_configure_syslinux(part, creator, cr_workdir)
 
     @classmethod
     def do_prepare_partition(cls, part, source_params, creator, cr_workdir,
@@ -89,9 +87,7 @@ class BootimgPcbiosPlugin(SourcePlugin):
         return custom_cfg
 
     @classmethod
-    def _do_configure_syslinux(cls, part, source_params, creator, cr_workdir,
-                               oe_builddir, bootimg_dir, kernel_dir,
-                               native_sysroot):
+    def _do_configure_syslinux(cls, part, creator, cr_workdir):
         """
         Called before do_prepare_partition(), creates syslinux config
         """
@@ -106,12 +102,24 @@ class BootimgPcbiosPlugin(SourcePlugin):
 
         if not syslinux_conf:
             # Create syslinux configuration using parameters from wks file
-            splash = os.path.join(cr_workdir, "/hdd/boot/splash.jpg")
+            splash = os.path.join(hdddir, "/splash.jpg")
             if os.path.exists(splash):
                 splashline = "menu background splash.jpg"
             else:
                 splashline = ""
 
+            # Set a default timeout if none specified to avoid
+            # 'None' being the value placed within the configuration
+            # file.
+            if not bootloader.timeout:
+                bootloader.timeout = 500
+
+            # Set a default kernel params string if none specified
+            # to avoid 'None' being the value placed within the
+            # configuration file.
+            if not bootloader.append:
+                bootloader.append = "rootwait console=ttyS0,115200 console=tty0"
+
             syslinux_conf = ""
             syslinux_conf += "PROMPT 0\n"
             syslinux_conf += "TIMEOUT " + str(bootloader.timeout) + "\n"
@@ -130,8 +138,7 @@ class BootimgPcbiosPlugin(SourcePlugin):
             syslinux_conf += "APPEND label=boot root=%s %s\n" % \
                              (creator.rootdev, bootloader.append)
 
-        logger.debug("Writing syslinux config %s/hdd/boot/syslinux.cfg",
-                     cr_workdir)
+        logger.debug("Writing syslinux config %s/syslinux.cfg", hdddir)
         cfg = open("%s/hdd/boot/syslinux.cfg" % cr_workdir, "w")
         cfg.write(syslinux_conf)
         cfg.close()
-- 
2.34.1


