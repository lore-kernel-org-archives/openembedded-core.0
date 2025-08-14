Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2297CA0EDC
	for <webhook@archiver.kernel.org>; Thu, 14 Aug 2025 04:26:09 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web11.15407.1755145567883970657
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Aug 2025 21:26:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=GP9GALVc;
 spf=pass (domain: underview.tech, ip: 209.85.219.48, mailfrom: vince@underview.tech)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-70a928ad710so5558436d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 21:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1755145566; x=1755750366; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fY2EWCWOrRqghnf+n2KE3YOARzOkxsT1AF2Fqu6fdiY=;
        b=GP9GALVcDTl50StKjhirexY/xt4aL36R4EuNTPmI4wcMsnTnDgn+iAIpGt1wQiRLle
         DYLMYo0LpWnAMQ6p0h629zafUy860Uc0zqz6pGV5Xnw4uFLvJhSceNI8EHSlGbaE3gBL
         VxOBkV8UItPjpMMS+fok83mqCqo/M2qv5XuaA8ygtWfNjtjqoKLZtj4VgXBMBF5SlexZ
         yj0HlaWDzZy5ckq4+xIErvFnb/f/9zO3pk3Ym2btQFVWIGZ6ATh59JHy8jaUgtbnTI0m
         SVyJOsAm3fusPAiC4Jgxdl64UjUL9Cv2Pn9zbpzqb2DTA41kdiBUO7nCQIQw6bwFwNEk
         F+MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755145566; x=1755750366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fY2EWCWOrRqghnf+n2KE3YOARzOkxsT1AF2Fqu6fdiY=;
        b=ZQnC6LmVOmmAWDrXgdZb0PzuUlRcd7C9S/B/m0NDyCb5+kPL9NyguV8xxaI3heQqSw
         cARaAjbFAqZ/bu8un8lK4Ng7yCecAsLQi+ARg6VzhbxSfeAS25iyBPat4L7znqYtdeXM
         DlpEy3NgA0Kei5uoKo8O0d1T/QS4r84M+TtwwAFdJHpU/d3Lm8RkQ08vCoRqNpq6mlUR
         fatr1J8769uIrBVA+ypH7PCOv6D8QkXJQZ6QAnvZpvmIRFMpDrJQLK2am/SZ8+6SvMMu
         gCwZKtnTyRq9U361dPlGAxSXS7RZusB2MchcGVGs8Qv/n6HTSKb2qm4Qua4hsOBTu61q
         NP3w==
X-Gm-Message-State: AOJu0YwjA5OHl01bb1jJZKHjnSyrF44DCzCZa3oMnajVbl4pd/dc3Ayz
	Tr+Z7Fa0V2xBqeI8x1HFFl1VyYJ+5IvMjyNkRdm4vheNBvekEE+60fSovR1w9zRr4Q44Z7QNaDS
	NlTPma64=
X-Gm-Gg: ASbGncsGvyj5LkNqOtHxisHqZl4cI83kxjN3fpoeef9bz3/qoW1RIiwnT8hOWZbw4Ya
	7izI4J4vFaKUFExohUFahO8KS69cTIoOsL/FzXkteT8UlsJ44k94Hxcmk1XOnf1U+L61PAPpD94
	70QVbgGp1evQDd9C4+SOOpcXpTVhpmGcoplkq9tXW3zGHOnPWHUgjuv3DZDhAN/DfbjIvO04TSf
	AzSxQUXhDc64WgG7SsKMFHnAGVIuN4vERR9XgVos6TkgqOvSeJLivLtxIHhfgGJHsR7G4fgnhst
	4CmfkOISnOBtJhhhAZjeqc7hZiVLZffch+sTJkkrk4daqCcuKx265iA9SZsbAJ8h2KbaqgEMCFP
	99Viw8ky6DcO+yR8KD/R1gGLLABwejAoQXyeWnhE+UbljgQ==
X-Google-Smtp-Source: AGHT+IHpfor4ZS7TvhMFwBuMlNJApfF9I7hSrgqiU2TyrisdyOK1/P4RRHKwB9trlFAkrC3Hd3M+1w==
X-Received: by 2002:a05:6214:1bcc:b0:707:4c29:c53b with SMTP id 6a1803df08f44-70af5f4106bmr25392476d6.51.1755145566519;
        Wed, 13 Aug 2025 21:26:06 -0700 (PDT)
Received: from vince-B550I-AORUS-PRO-AX.. ([2601:406:4d01:1820:e358:dd1a:4ea0:986c])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70ae6cb6cc2sm8322816d6.22.2025.08.13.21.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 21:26:06 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v8 3/9] bootimg_pcbios: seperate bootloader config creation
Date: Thu, 14 Aug 2025 00:25:46 -0400
Message-Id: <20250814042552.21887-3-vince@underview.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250814042552.21887-1-vince@underview.tech>
References: <20250814042552.21887-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Aug 2025 04:26:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221843

Most bootloaders that will be included in this
wics plugin will require a configuration file
to define kernel params, execute custom
modules, or enable the ability to select
one of multiple boot entries.

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
2.34.1


