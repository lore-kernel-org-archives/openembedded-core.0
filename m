Return-Path: <dwesterg@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id DEB546AC4B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 01:06:21 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id b145so361957pfb.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Feb 2017 17:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Lk6e4KACqXEVkf7y8rgL58tgIeLSxOP4+YiN8CNWQEY=;
	b=FHy5EsYjw3LHqSYS9Rg37rugJzAKdydvRVmEUQvk61RduHK7pzWF7uGvknjhshuyn5
	Yfe6riAJecKXf5uxS9W95FEnit1KRtUaywT877CVTX3ldlfbjd9K7sN2ROjB2WNMcNz0
	yDxNhAQmisMizJTayOfQAeNm1XlR5aHqVIbgP0ZPNm0m8U4NJP0DHENAPCH4ZzUvKWjW
	LOkYM74UTECLGTkbH1Z0E2BzcSE8F06iydwofgtt+CBUSnauS1T1gpIIXL2VHQ12ltNx
	M2i+fnvH6r4ssdpIrxJeKjq9orS47wwqL5COuMyFXFGP/Ub+woGvvTllBq7u4798gcsg
	mmeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Lk6e4KACqXEVkf7y8rgL58tgIeLSxOP4+YiN8CNWQEY=;
	b=K7NQJZPFlzihT6zpCkgs8iJdUlrHNPcwZeEuNLAdeHrZBk2Fy7sJbkTq19uS5f9i8Q
	+QX2xvF1hchGgnkbWoue6xKrF+V8GjFIfTr00pSKFJIMzl6nmxvNRDwI1RxQnykRiieh
	q3oXUcB2nAC6RH+utb+2VS3WLpBAIrVOm+5+LNHNwWaLQ3ccGOD+1jHMxQ21r747feZN
	qkjcizHdABeVzz6YOYqH9CoX6/mkP4NytPew36ZP4vqnxQ6kEbYMR+xFTJJvbEK6Fuvl
	J+ENUKA7/+4RWtr/tahgIUzQltP6IQXoos8OkMDgwMw3z4n2kbamMQIBkGQn85Y2jYh4
	I2rw==
X-Gm-Message-State: AMke39mE5Ryr+GVqpdmKDjWeKxuJSQxwFKRdGi0qLpfIp2OkwFMJBIHy0QqelEx0GjRpzg==
X-Received: by 10.99.126.76 with SMTP id o12mr7347670pgn.84.1486688781402;
	Thu, 09 Feb 2017 17:06:21 -0800 (PST)
Received: from dwesterg-mobl1.amr.corp.intel.com ([192.55.54.42])
	by smtp.gmail.com with ESMTPSA id x81sm60684pff.69.2017.02.09.17.06.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Feb 2017 17:06:20 -0800 (PST)
From: Dalon Westergreen <dwesterg@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Feb 2017 17:06:13 -0800
Message-Id: <1486688773-17655-1-git-send-email-dwesterg@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v2] uboot-extlinux-config.bbclass: add support for timeout & default
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
X-List-Received-Date: Fri, 10 Feb 2017 01:06:24 -0000

When multible targets are defined it is useful to allow for
a default target along with a timeout.  After timeout, the
default target will be selected.

Signed-off-by: Dalon Westergreen <dwesterg@gmail.com>

--
v2:
 - fixed UnboundLocalError
---
 meta/classes/uboot-extlinux-config.bbclass | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/meta/classes/uboot-extlinux-config.bbclass b/meta/classes/uboot-extlinux-config.bbclass
index ec5fffb..f075a37 100644
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
@@ -82,6 +91,14 @@ python create_extlinux_config() {
             if len(labels.split()) > 1:
                 cfgfile.write('menu title Select the boot mode\n')
 
+            timeout =  d.getVar('UBOOT_EXTLINUX_TIMEOUT')
+            if timeout:
+                cfgfile.write('TIMEOUT %s\n' % (timeout))
+
+            default = d.getVar('UBOOT_EXTLINUX_DEFAULT_LABEL')
+            if default:
+                cfgfile.write('DEFAULT %s\n' % (default))
+                    
             for label in labels.split():
                 localdata = bb.data.createCopy(d)
 
-- 
2.7.4


