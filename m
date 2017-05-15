Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id ACEAD72F28
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 13:27:21 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id p24so73057556ioi.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 06:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=4NVL4dHF47Kz0ZnFudyngdQF2JmyX5hDkHVpsqIkUcY=;
	b=hwHAVioZh9czLMqxTaP8YR20klVUrelcPkhsIzGvikiWvZ9BCifUMQtFoCxhSTpk1/
	3oAjboaOeJv1lBZljpzdQmD1Z0pS7XqSzYrle8vX7+qh1ZCexNAjkJqXO4z1PmgFWGKv
	pwRbjpYBqF7qwfay2JDr1UgXO73thztmHTIdZprij9soshQY3RLFSDjk1y+Nq8TaIoir
	Xmre8kWIzat+Y/8dtFjwARZ7UDBOG3YnJGvjGznIugj3w/QNFhUyx2jo4bd7w/DCCF7x
	7f98rCBwX+a4MP6jo7HljXt0jmFlnZ0mk+EUmKtu+3BdwvmpuIyrezzAgWRW1pwL7SO2
	wHcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=4NVL4dHF47Kz0ZnFudyngdQF2JmyX5hDkHVpsqIkUcY=;
	b=SVMlFMjzxT76tudN7UZQ/gKYknAybZvQgPDZyDbKnuPYF60gVc7LLTbh/DbOgWHugk
	xTgP/sJYNmakTBaE6h+9R3+wGtzCjJcBNDRFJ67MgYf7PqXSeyDjSkbTbZB6Wchv36hG
	otYI5iUIr6dTm6fG+nkOu+jSXkhXwqPqdPaT1dGhpS7ts8wTOp3PSI4BoeeL1Yk7IaVa
	9DxdAZJBafWPl5oP67SLwRaFEq1jsr7A6N0JJSfDHHm6yCN8af73KnFMTrsiItdFoxba
	ESrwB/nDq8AmcsvHb4sOHKVj9/2Dlw6/JEPPWTuJIqhGBJqRVHxgb9QvMGc9N98XKZPi
	BZpg==
X-Gm-Message-State: AODbwcDDVAFU7s/EGzOJKQ/yM6AIm794cvVtnVFAh2Pm5N9okvojh07c
	LlAocaKxRnxO8jrP8OQ=
X-Received: by 10.107.168.15 with SMTP id r15mr5242945ioe.45.1494854842170;
	Mon, 15 May 2017 06:27:22 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8F79A.dip0.t-ipconnect.de.
	[93.232.247.154])
	by smtp.gmail.com with ESMTPSA id c7sm4537765itc.14.2017.05.15.06.27.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 15 May 2017 06:27:21 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 May 2017 15:27:01 +0200
Message-Id: <0d2818fc569b6fda11ecd0674fe97933431d8312.1494854721.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.da0bfaf0b62cb1033573711fd83cf5251f8827f3.1494854721.git-series.patrick.ohly@intel.com>
References: <cover.da0bfaf0b62cb1033573711fd83cf5251f8827f3.1494854721.git-series.patrick.ohly@intel.com>
In-Reply-To: <cover.da0bfaf0b62cb1033573711fd83cf5251f8827f3.1494854721.git-series.patrick.ohly@intel.com>
References: <cover.da0bfaf0b62cb1033573711fd83cf5251f8827f3.1494854721.git-series.patrick.ohly@intel.com>
Subject: [RFC][PATCH 4/6] image-mode.bbclass: per-image production/development/debug mode
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
X-List-Received-Date: Mon, 15 May 2017 13:27:21 -0000

A global switch between different modes allows configuring image
recipes so that they adapt to the intended usage automatically. The
implementation here introduces three modes which progressively enable
more debugging features. That different modes cannot be combined is
meant to make the feature easier to use.

When a mode is explicitly set to something other than "production",
a warning about that is added to /etc/motd.

The default is to not set a mode explicitly. Image recipes then can
decide what they want to enable, depending on the normal usage, just
as they do now.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/image-mode.bbclass | 62 ++++++++++++++++++++++++++++++++++-
 1 file changed, 62 insertions(+)
 create mode 100644 meta/classes/image-mode.bbclass

diff --git a/meta/classes/image-mode.bbclass b/meta/classes/image-mode.bbclass
new file mode 100644
index 0000000..b036045
--- /dev/null
+++ b/meta/classes/image-mode.bbclass
@@ -0,0 +1,62 @@
+# Images can be built for "production", "debugging" or "development".
+# Additional modes might get defined by a distro or developer. This is
+# intentionally a separate variable. That way, IMAGE_FEATURES can be
+# set dynamically depending on IMAGE_MODE.
+#
+# They can be set independently from the "debug-build" DISTRO_FEATURE.
+# However, images that are explicitly marked as "production" get
+# disabled when "debug-build" is active.
+#
+# The intended usage is:
+# - production - enable and allow only features suitable for production
+# - development - enable also features useful while developing the distro and/or image content,
+#                 like easier root access
+# - debugging - same as development plus additional debug output
+#
+# The default is not to have a fixed mode. Which features an image
+# recipe enables in that case depends on whether the image and/or project is more
+# geared towards development or production. For example, the OE-core
+# local.conf.sample enables "debug-tweaks" by default unless "production"
+# is set.
+IMAGE_MODE ??= ""
+IMAGE_MODE_VALID ??= "production development debugging"
+
+python () {
+    # Sanity checks for IMAGE_MODE.
+    image_mode = d.getVar('IMAGE_MODE', d)
+    mode = set(image_mode.split())
+    if len(mode) == 0:
+        return
+    if len(mode) > 1:
+        bb.fatal('An image can only be built in exactly one mode: IMAGE_MODE=%s' % image_mode)
+    mode = mode.pop()
+    valid = d.getVar('IMAGE_MODE_VALID')
+    if mode not in valid.split():
+        bb.fatal('Invalid image mode: IMAGE_MODE=%s (not in %s)' % (image_mode, valid))
+
+    # Disable development images when we can't be sure that they'll only contain
+    # production content. This errs on the side of caution.
+    if mode == 'production' and 'debug-build' in d.getVar('DISTRO_FEATURES').split():
+        raise bb.parse.SkipRecipe("Production images are disabled when the 'debug-build' DISTRO_FEATURE is active.")
+}
+
+# Optional additional text appended to an image's /etc/motd
+# when some mode other than "production" is chosen explicitly.
+#
+# Set to empty to disable this.
+IMAGE_DEV_MOTD_DEFAULT () {
+*********************************************
+*** This is a ${IMAGE_MODE} image! ${@ ' ' * (19 - len(d.getVar('IMAGE_MODE')))} ***
+*** Do not use in production.             ***
+*********************************************
+}
+IMAGE_DEV_MOTD ??= "${IMAGE_DEV_MOTD_DEFAULT}"
+
+python dev_motd () {
+    motd = d.getVar('IMAGE_DEV_MOTD')
+    if motd:
+        with open(d.expand('${IMAGE_ROOTFS}${sysconfdir}/motd'), 'a') as f:
+            f.write(motd)
+}
+
+ROOTFS_POSTPROCESS_COMMAND += "${@'' if (d.getVar('IMAGE_MODE') or 'production') == 'production' else ' dev_motd;'}"
-- 
git-series 0.9.1

