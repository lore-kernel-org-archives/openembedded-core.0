Return-Path: <dwesterg@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2E5F060103
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Feb 2017 23:46:46 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id y143so10231827pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Feb 2017 15:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=EJGa56O7a+0CupRwpbDsNArVKg9xV88S6cxhnzWcPf4=;
	b=TbkqRShI5L1GX85jgY301Fs9fnRueFDYkZ9qYgooaSrLrTBFhRrRW4u3N4Fo8OETSD
	yY97j24XySxt7lAymVxS8ZLWIEl59Z38QQtYDQJ9RNV5IMU72ZbYJIP8uYz8/ax0arpo
	heDHoMkHY1IWuZ9TgxKpnRBP+8cwELmWFhtwrxnsCjkn39e6t2iUeefx84rK5DHA3OcY
	D1qEKbCn/iz1LEwkznuWlHpY0i1ecp6gpIcr9UrRKiHOj9w6CuZFLgHOqgrsTtHNwBMo
	3oXC80/+FeE+9Ql9ugnFQwg4SYc9We5oAZO8JZtV+qev6NtejJohYbDT7ZrDn8LXAvrK
	gvwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=EJGa56O7a+0CupRwpbDsNArVKg9xV88S6cxhnzWcPf4=;
	b=HPkr1h4E1y1nRGeBNwZiddAnwnVzAZv84h91XwFhQkY7jitfh9D70rBc69PO+lJlC6
	obIgzRyH1O8wVaWpzp2c2Kfa++A/2RPjMqAQoUSYRC+Nl7o/ZvX9mWwwkwK1BnNeneGz
	gUhHTnyG8iZv92a7EiH6ECY3vpj/O/InBIoR8H2ZLWArXJ+KbA36atmgR9qF7jG/a3na
	/S8dHJXs0m/4ZFLLRrP4PjTjaE28yNZ/pE6KW1Rod1+iSCN9HGw4FSN2Mfziu0qrEXN8
	puCIsR0yTZula3qzFh3FQdHTo2wydl7gBydu5/f2WwmKcMSCFtndrldECZJYxhwjwitd
	Qfig==
X-Gm-Message-State: AIkVDXJ1KLmyOaSfNeDW09BET7tDgxgrE6+UxaVZWDEKobsO7K/NIYKXAkw5PUqD8+fUXg==
X-Received: by 10.99.44.138 with SMTP id s132mr23864031pgs.88.1486511207012;
	Tue, 07 Feb 2017 15:46:47 -0800 (PST)
Received: from dwesterg-mobl1.amr.corp.intel.com ([192.55.55.41])
	by smtp.gmail.com with ESMTPSA id
	x16sm14144277pfk.79.2017.02.07.15.46.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Feb 2017 15:46:46 -0800 (PST)
From: Dalon Westergreen <dwesterg@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Feb 2017 15:46:29 -0800
Message-Id: <1486511189-3339-1-git-send-email-dwesterg@gmail.com>
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
X-List-Received-Date: Tue, 07 Feb 2017 23:46:47 -0000

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


