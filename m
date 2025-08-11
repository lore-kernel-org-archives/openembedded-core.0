Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A844DC87FD2
	for <webhook@archiver.kernel.org>; Mon, 11 Aug 2025 04:05:23 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web11.40386.1754885121983606610
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Aug 2025 21:05:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=W7tXG6pP;
 spf=pass (domain: underview.tech, ip: 209.85.222.171, mailfrom: vince@underview.tech)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7e835e02d96so210374385a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Aug 2025 21:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1754885121; x=1755489921; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S2q3Sd+TruzbpygG2jmkICKxLwXZGUyCtj4TKM1OoMw=;
        b=W7tXG6pPZz73VZeFjyhuqOh1pt9IH3j69u3KVc2PH2UwOzDfXoxAmbDAc+B20eKGjC
         4t89QhezhQxb02jtXeaD+4/QJ5ihmcvHO6jwAQ24pHW2SYYToCquZAFTSiEo0miu4ahG
         f9la58G1Kr01fu0Whe++NIf0LmKh57DG5bwXyOVZym6zSjxlSUKDNabfBcM7abLTUMcp
         mHlHbmapHS93XoGmWdgKju+d/xh0dRPwumcbi6QYEugkQ+Vhw59x7JuvsYWQd7FEAuKD
         XEZMsduxblg10bUsQfvXSQO7xX+K7UD7nKmj5BFqh5lrwD7TxDO4f9zK/fMYZC7Y1Mb2
         kx6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754885121; x=1755489921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S2q3Sd+TruzbpygG2jmkICKxLwXZGUyCtj4TKM1OoMw=;
        b=cEUYHEbCcs1AknU/U0LovnC6wbogdymAY1tM3zFc2xuZfe+NYosW4ZvaJhyMXMkZ7N
         Gat9AbfFmm7O6BiEupC0VGxOke5tfWIPt0BQsodQljCSRbbMYnXXDKbny5H32Pfh6awP
         RydxwI+Rk9s6R4t7CbJBt9qQLCYovyFcIlsREkqAujwBEUOWTZHB5eDzEygm1/2YHlfX
         Yf0Jt893CmiL947hrz8QqfAR/aoLfs+ZsP10J7NCrviDWsvhsmvdhQ7CG/cp00aNmmtG
         no2l0EtU/Ba8ya/AcwtccGZG07mqcnZN+y96ZKJWtL2L9DXzsYn0oCvTsub/AbflqP+e
         jP3Q==
X-Gm-Message-State: AOJu0Yymjj5dHLP9x4+pXv+MgK4NHRJVjGBY1GYBQ9PSkxqLyQj10TM+
	bDnChA9gJXxZyXInot3e/0V+vXy4HTDCFHFs95nf+NyIfh/qQaCCBoVATBsWFg9PZHBPfg1Yg6W
	azPFn
X-Gm-Gg: ASbGncstzMFwx9c7nSfy01EboesyvOkWccnKlXEsYgquvbOl08srgQc/WlKW7MYh//9
	MVk7/RanpRi4AAZGFbCS2JPNXIBzeXYx+HOkus9hIUU5wyMAdk38pgFcvCwmvHObrzHrKzeUx0s
	96w/vjxkDYdZ/bSKcU6X9oHrbugcuCcwcehg5KdcK38oJH61tPsJAN6F08PQ0LF3K7b273Ze+2z
	siXHoCO7G/h/Ate3JomnMAnFBP15TG3q8RgaW4Q6mCwwLRijjlOFpGfi++P2CnKDtKMLmBBwHd0
	0JHwVEIJ2BIDcgU10sZoy6XnvTsXBddFtAvmg28BqRyXSelEDS8CKDLNmPn/plhRTiM3ngJMvVE
	u6TwVGeg54mI=
X-Google-Smtp-Source: AGHT+IFRs62uxfL3gQc9cttC1RrpSfj64zftcCO3AFbtN1mNqOaNfltAekiN8Q/KNdHPd5p8/RCM6w==
X-Received: by 2002:a05:620a:7183:b0:7e6:4fc9:6457 with SMTP id af79cd13be357-7e82c77d504mr1169043685a.54.1754885120641;
        Sun, 10 Aug 2025 21:05:20 -0700 (PDT)
Received: from vince-server.. ([2601:406:4d01:1820::6d26])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e823fddc10sm597842685a.16.2025.08.10.21.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 21:05:20 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: "Vincent Davis Jr." <vince@underview.tech>
Subject: [PATCH v7 3/9] bootimg_pcbios: seperate bootloader config creation
Date: Mon, 11 Aug 2025 00:03:36 -0400
Message-ID: <20250811040339.857858-6-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250811040339.857858-2-vince@underview.tech>
References: <20250811040339.857858-2-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 04:05:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221710

From: "Vincent Davis Jr." <vince@underview.tech>

Most bootloaders that will be included in this
wic plugin will require a configuration file
to define kernel params or execute custom
modules.

Create a seperate generic function to facilitate
finding if a bootloader config file passed through
bootloader --configfile flag. So, that other functions
that are used to create/install a bootloader boot
configuration file can leverage the function.

Signed-off-by: Vincent Davis Jr. <vince@underview.tech>
---
 .../lib/wic/plugins/source/bootimg_pcbios.py  | 31 +++++++++++--------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg_pcbios.py b/scripts/lib/wic/plugins/source/bootimg_pcbios.py
index 9ad301b008..47fd4b9415 100644
--- a/scripts/lib/wic/plugins/source/bootimg_pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg_pcbios.py
@@ -72,6 +72,22 @@ class BootimgPcbiosPlugin(SourcePlugin):
                                  oe_builddir, bootimg_dir, kernel_dir,
                                  rootfs_dir, native_sysroot)
 
+    @classmethod
+    def _get_bootloader_config(cls, bootloader, loader):
+        custom_cfg = None
+
+        if bootloader.configfile:
+            custom_cfg = get_custom_config(bootloader.configfile)
+            if custom_cfg:
+                logger.debug("Using custom configuration file %s "
+                             "for %s.cfg", bootloader.configfile,
+                             loader)
+                return custom_cfg
+            else:
+                raise WicError("configfile is specified but failed to "
+                               "get it from %s." % bootloader.configfile)
+        return custom_cfg
+
     @classmethod
     def _do_configure_syslinux(cls, part, source_params, creator, cr_workdir,
                                oe_builddir, bootimg_dir, kernel_dir,
@@ -86,20 +102,9 @@ class BootimgPcbiosPlugin(SourcePlugin):
         exec_cmd(install_cmd)
 
         bootloader = creator.ks.bootloader
+        syslinux_conf = cls._get_bootloader_config(bootloader, 'syslinux')
 
-        custom_cfg = None
-        if bootloader.configfile:
-            custom_cfg = get_custom_config(bootloader.configfile)
-            if custom_cfg:
-                # Use a custom configuration for grub
-                syslinux_conf = custom_cfg
-                logger.debug("Using custom configuration file %s "
-                             "for syslinux.cfg", bootloader.configfile)
-            else:
-                raise WicError("configfile is specified but failed to "
-                               "get it from %s." % bootloader.configfile)
-
-        if not custom_cfg:
+        if not syslinux_conf:
             # Create syslinux configuration using parameters from wks file
             splash = os.path.join(cr_workdir, "/hdd/boot/splash.jpg")
             if os.path.exists(splash):
-- 
2.43.0


