Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8B4EC87FD2
	for <webhook@archiver.kernel.org>; Mon, 11 Aug 2025 04:05:43 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web11.40387.1754885134392963422
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Aug 2025 21:05:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=OeuYsebq;
 spf=pass (domain: underview.tech, ip: 209.85.222.170, mailfrom: vince@underview.tech)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7e7f940a386so228775185a.3
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Aug 2025 21:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1754885133; x=1755489933; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pQSdVNHa8b06wy7TY99YbaIK6vi5QRCkJPGn0a36DE0=;
        b=OeuYsebqknKkp9eXG0oD4KfvCAN3M9i9ODwSkBv83clPwJrXz8nVxlkycfvOwwRPSf
         SIG7Q61QBC/upVlNCze1OZ7vLzMYipB6MEcTTueA84agszalzjAMvnuXGr9ESbFUDcV8
         W7EsU4Jf23NR8xnM/gUq50qTxa53LdCJ+mUMH8X5WYCUDmqjXojQwC33BKQugmPOQOzy
         JQgbbcPnvzbULqvtRsKt3Ion/Y1RehXZNYPtY4V9Bk/HoQpabU0lJhV4N7JPglQnMR14
         iiDhl82vw1OgIGEx4Io0/615ZFw2rvBiFs02AWRSFdV3XcjBZN8UGPVLWyTyQEk6nE0a
         e7kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754885133; x=1755489933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pQSdVNHa8b06wy7TY99YbaIK6vi5QRCkJPGn0a36DE0=;
        b=JdbKsyZgdvB2Ryt2tir5rHdMRiXfqyKjrNmjHszJXGSNzy9uzFriylfJdK07502Gn8
         IVrV4Y5dH3RlOhh43x3z65ZeInst62oNUIW0Gc6MHV6mwcrG/n+pmazbfD7y4OjFRH7A
         g5a1K45LqRoc/8unjHNuicIlxITQggXzfH4+kv/wQ/ClMUA9AzuyTZ8EiPOU9+LTKzkr
         WmoCMNR20U/FBLp0yub/QObFg3MDkpwqouph2dZLKkUpNHt4G/bsMaDDrPMdyTsqnGlc
         0SIKohxeX5AedMUMYjc48mFh6B4CwnEa28qmx1/2hEfEaTRUULKg5SknnTVctn8Gnp5V
         BQRA==
X-Gm-Message-State: AOJu0Yw4AjJKqBEkMqYSpQHBT1WUnzknmosiRQ5rg1ZsJwRFHrde5I8D
	t6p4+Ad945Xom7s1G4vR+xziaGJfa0iIhtvtsQS/J6c7ohKn6/3WHs/5juuXuh8e/0lsyN2jYj7
	PfZ+k
X-Gm-Gg: ASbGncsCS6AEUClhsRzLPEhyHyX/j3vtXxj9Ja4+Bn/rezs5bC7EHO0i3fKLWlxO6Xu
	cZEDo3yB0glK79FGIkkAFpG6nvjh+Wt31I9zTgK2wYjwCCa+WRivQ3FOqWxnu+cgejrKd3Kfl7T
	uSz/7/DE3xJ5qDlE0U+/KwHWa3HC3KEpfkX/f42sKT7jTKI0t0kOCGRSDBxzyrnOMsHsBjBupSO
	miQ6rrLFebsMIabKJNdSHAGJtA8TgqFffq4af3g6Z7LOPYwjniBkLPTlNQSvhuiprPqRjYxGJ0g
	JxTcpZ4XAFH1ctr6LjbhWKN8bpQunjRMUbz3aLKiDUe3fq9uzxl1Q6ckecF2RYaMxQp3gGy0ej/
	giYhL6LwnNlY=
X-Google-Smtp-Source: AGHT+IGICgUsBsRaNkz8ywxq+ildCy2o5LKT80bMQl5MOfBTiL8UiGPEOctecJsWptZJqwTIAtSYVg==
X-Received: by 2002:a05:620a:3190:b0:7e8:46ff:a520 with SMTP id af79cd13be357-7e846ffa5f3mr614782485a.59.1754885132999;
        Sun, 10 Aug 2025 21:05:32 -0700 (PDT)
Received: from vince-server.. ([2601:406:4d01:1820::6d26])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e823fddc10sm597842685a.16.2025.08.10.21.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 21:05:31 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v7 4/9] bootimg_pcbios: cleanup _do_configure_syslinux function
Date: Mon, 11 Aug 2025 00:03:38 -0400
Message-ID: <20250811040339.857858-8-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250811040339.857858-2-vince@underview.tech>
References: <20250811040339.857858-2-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 04:05:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221711

Commit:
	1. Removes all unrequired function parameters.
	   The part parameter was kept due to it's potential
	   future usage in _do_configure_syslinux function.
	   part.fstype specifically may be used with he
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
	   need to re-implement what variable is already
	   defined to store.

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
2.43.0


