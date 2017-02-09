Return-Path: <dwesterg@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0301571E5F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Feb 2017 16:09:42 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id y143so496897pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Feb 2017 08:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=EJGa56O7a+0CupRwpbDsNArVKg9xV88S6cxhnzWcPf4=;
	b=sGQ5nHALLw328GL0hFQGOWslgfWV+kWaZ9wicztrjMfLAkxGJ6uuUIherHbt7zVfTe
	Rz8/fQwRQ0R1AfaSTsioxi3OdrjLBPoh5mh9RRgxZgIpchCbsgW1AFPFZw93xDYzQw6s
	aBqCI9ULnBWA3EWVVjPTNiUZ9lgLYkFXVYRb6YRjiQfaeGUZE+300JgUPbGgvwssSlke
	LQ7FmbL7fUCGb4pe9gSkPA/GyAjmmm8//dpCeFlMcfqC7vqEOzo6yKXQMgK1h//FGXU7
	dFX7/0tMPXGftPJaJdhvTEfLGi6K/fjNcSNJtb4X7sqbwma1Z3W4qHAhAgxAYCD9IjUv
	g4ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=EJGa56O7a+0CupRwpbDsNArVKg9xV88S6cxhnzWcPf4=;
	b=UMhcwbt4W6b6EmV92+FrBzki8+o8+XMVAenjvWdMmW2298Od5TEyUKWzUxhPGxzCsA
	6ymY1r1Fk3FUKYFSCCc6ipYsWYSmhoFE7/6J1cBCjrxSqQW/vVqANhMpFVR7551d0AeO
	m/9uhOZlXiJG/smikUJxfeXOk7qkpjC4EPha7QoI9eCBWXQPJa+KD//KlazWN9cwnR9I
	JCpX5n4pxclbtp2CZ+XjT88VMdIo3O7+FJfOfsN/0D0tWemmNzNbahM+8BrGTleygDa0
	+jwlplV8N38L0cBzOY18GRDO6uCRS4pCbSH+1ooNNGRNsA7JgB+tdzXV5k1yYRV56r1X
	yC1Q==
X-Gm-Message-State: AMke39kiw5hZ22HUt8VRpEQDivK/1aS69jikHCaR+wznhrHVmNI7pxKn4kzCDsZbfKCF7Q==
X-Received: by 10.99.95.151 with SMTP id t145mr4792724pgb.75.1486656582936;
	Thu, 09 Feb 2017 08:09:42 -0800 (PST)
Received: from dwesterg-mobl1.amr.corp.intel.com ([192.55.54.40])
	by smtp.gmail.com with ESMTPSA id
	d124sm30235972pga.30.2017.02.09.08.09.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Feb 2017 08:09:42 -0800 (PST)
From: Dalon Westergreen <dwesterg@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Feb 2017 08:09:30 -0800
Message-Id: <1486656570-20299-1-git-send-email-dwesterg@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] uboot-extlinux-config.bbclass: add support for timeout & default
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Feb 2017 16:09:43 -0000

When multible targets are defined it is useful to allow for
a default target along with a timeout.  After timeout, the
default target will be selected.

Signed-off-by: Dalon Westergreen <dwesterg@gmail.com>
---
 meta/classes/uboot-extlinux-config.bbclass | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/meta/classes/uboot-extlinux-config.bbclass b/meta/classes/uboot-extlinux-config.bbclass
index ec5fffb..96b5a2e 100644
--- a/meta/classes/uboot-extlinux-config.bbclass
+++ b/meta/classes/uboot-extlinux-config.bbclass
@@ -16,6 +16,10 @@
 #                                    concatenate and use as an initrd (optional).
 # UBOOT_EXTLINUX_MENU_DESCRIPTION  - Name to use as description.
 # UBOOT_EXTLINUX_ROOT              - Root kernel cmdline.
+# UBOOT_EXTLINUX_TIMEOUT           - Timeout before DEFAULT selection is made.
+#                                    Measured in 1/10 of a second.
+# UBOOT_EXTLINUX_DEFAULT_LABEL     - Target to be selected by default after
+#                                    the timeout period
 #
 # If there's only one label system will boot automatically and menu won't be
 # created. If you want to use more than one labels, e.g linux and alternate,
@@ -25,6 +29,9 @@
 #
 # UBOOT_EXTLINUX_LABELS ??= "default fallback"
 #
+# UBOOT_EXTLINUX_DEFAULT_LABEL ??= "Linux Default"
+# UBOOT_EXTLINUX_TIMEOUT ??= "30"
+#
 # UBOOT_EXTLINUX_KERNEL_IMAGE_default ??= "../zImage"
 # UBOOT_EXTLINUX_MENU_DESCRIPTION_default ??= "Linux Default"
 #
@@ -34,6 +41,8 @@
 # Results:
 #
 # menu title Select the boot mode
+# TIMEOUT 30
+# DEFAULT Linux Default
 # LABEL Linux Default
 #   KERNEL ../zImage
 #   FDTDIR ../
@@ -82,6 +91,15 @@ python create_extlinux_config() {
             if len(labels.split()) > 1:
                 cfgfile.write('menu title Select the boot mode\n')
 
+            timeout =  localdata.getVar('UBOOT_EXTLINUX_TIMEOUT')
+            if timeout:
+                cfgfile.write('TIMEOUT %s\n' % (timeout))
+
+            if len(labels.split()) > 1:
+                default = localdata.getVar('UBOOT_EXTLINUX_DEFAULT_LABEL')
+                if default:
+                    cfgfile.write('DEFAULT %s\n' % (default))
+                    
             for label in labels.split():
                 localdata = bb.data.createCopy(d)
 
-- 
2.7.4


