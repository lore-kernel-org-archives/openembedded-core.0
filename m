Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 144CA77E1C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 07:59:05 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id o12so4476534iod.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 00:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Vbw86Ro9SCqlxTGCKwFzY6GgLcyWe4f+UIBYHNyaitI=;
	b=bhmpL1gLu57CgHde/32lF4PxUsL2JA5v5OeRSFsoBi3f8tjWFWcmCjdBY6roqKdWAp
	ycOuvUuIa5nsi65jvMt3o2s1c6mkwPfR9yf/UlQS2ff+Nm1MbeV9yV+G+b/S5bGNIhzb
	p9p6uD6Hx5ijir5CMZcB7q9vxRH8ecZt4N9G/unisknxHhX+OYMSrkkn/aRjFvJt4HRd
	M5rAgKXTQAKHecyOaATj8YfLUSDnJLYAQGpuyweuv43zmllCljG4EEQNO7k2XDuoxJ/T
	AUdmQDvb7gmeuHVxa0XsjP3Cb5o/BA+Q3nZt99XQKfvxw9SJcJ0Gq7tz94Bc8rRrHqSQ
	BxEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Vbw86Ro9SCqlxTGCKwFzY6GgLcyWe4f+UIBYHNyaitI=;
	b=pjEwhGcuSykZ+J0MW7mG0QYNtkKEXFfhCLVy0Lys6IMWtvZUvqll6m3nQu1Yb014aN
	d9EhHaATC4Lc6ASuK0WkDnuXfwQolLoJPitoMLOSKvoFdPYPNybe1KXtmmdj8y+ASfZi
	Fn5Cj2KK+DNWWOJ1IVxf7lybSpXtTYGHoHbdTRtsgYCVvd64bQ76tTT2TfvsKFN0x8Xf
	+KCqtcdoRCcGfm8GlQLl0+i2W6LKiQwBCUa58vXdDRfIbPkTggGeTOq9FV6gQjD5b17i
	vH2ahcBaGhIPLDkvux089QKwilMdqGU2teHYd8HAjzc5FlI/cicn7SEhF9xttOourBhO
	oEGw==
X-Gm-Message-State: AODbwcBMFGiPygjXZTtJarO7iX9OmUFo59Ef6NrEWv7UGjCJ+okZbNmG
	OJ3/2zudF1ro6rIRrHQ=
X-Received: by 10.107.175.37 with SMTP id y37mr1896943ioe.38.1495007946603;
	Wed, 17 May 2017 00:59:06 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8F2FD.dip0.t-ipconnect.de.
	[93.232.242.253])
	by smtp.gmail.com with ESMTPSA id i74sm7109100itb.5.2017.05.17.00.59.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 17 May 2017 00:59:05 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 May 2017 09:58:57 +0200
Message-Id: <8810a4bbb1c67b438a7320df810db02099fcb5a0.1495007905.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.eea09064b94ca036ef2177896c19070d316ee965.1495007905.git-series.patrick.ohly@intel.com>
References: <cover.eea09064b94ca036ef2177896c19070d316ee965.1495007905.git-series.patrick.ohly@intel.com>
Subject: [PATCH v2 1/1] image-mode.bbclass: common infrastructure for choosing image defaults
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
X-List-Received-Date: Wed, 17 May 2017 07:59:06 -0000

A distro might want to offer developers different, pre-defined ways of
building an image, for example a "development" mode with easy (but
insecure) login methods and a "production" mode with hardened
settings.

image-mode.bbclass introduces IMAGE_MODE as the switch that defines
how developers want to build an image. It can be set differently for
different images. The intention is that the image recipe checks
IMAGE_MODE when setting the default IMAGE_FEATURES or whether
pre-generated signing keys are to be used for features like dm-verity.

All functionality is opt-in: if a distro does not change the defaults,
then the class only warns when a developer sets IMAGE_MODE althought
it isn't supported. The purpose of having this class in OE-core
although it doesn't do much by default is to achieve consistent
behavior between different distros.

Distros can define different modes (if desired, even differently for
different images) and can define additional text that gets appended to
/etc/motd of an image when a certain mode was used for the image.

The functionality is provided as a separate helper class to ease
copying of the functionality into distros not based on OE-core master
yet and to keep it in one place. The alternative is to copy the code
into image.bbclass and rootfs-postcommands.bbclass.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/image-mode.bbclass | 66 ++++++++++++++++++++++++++++++++++-
 meta/classes/image.bbclass      |  2 +-
 2 files changed, 68 insertions(+)
 create mode 100644 meta/classes/image-mode.bbclass

diff --git a/meta/classes/image-mode.bbclass b/meta/classes/image-mode.bbclass
new file mode 100644
index 0000000..6137010
--- /dev/null
+++ b/meta/classes/image-mode.bbclass
@@ -0,0 +1,66 @@
+# Some distros may want to build images in different modes ("development",
+# "production", etc.). The same image recipe might get built differently
+# based on local configuration, or different image recipes might inherit
+# from the same base and just differ in their mode. This class introduces
+# "IMAGE_MODE" as the per-image variable which controls this mode.
+#
+# IMAGE_MODE is intentionally a separate variable. This way, IMAGE_FEATURES
+# can be set dynamically depending on IMAGE_MODE.
+#
+# There are no pre-defined modes. Distros which want to use modes
+# must set the IMAGE_MODE_VALID variable, either globally or per image.
+# Distros which don't have modes can still use the class to trigger
+# an error message when developers set the variable although it doesn't
+# have an effect.
+
+# The default is to have no fixed mode.
+IMAGE_MODE ??= ""
+
+# Set this in the distro or image to enable mode support. For example:
+# IMAGE_MODE_VALID ??= "production development debugging"
+
+# Optionally this class extends /etc/motd in each image depending on the
+# IMAGE_MODE of the image. To use this, set IMAGE_MODE_MOTD[<image mode>]
+# to a string for that mode or IMAGE_MODE_MOTD[none] for empty or
+# unset IMAGE_MODE. IMAGE_MODE_MOTD is used as default when the varflag
+# is not set.
+#
+# When the motd text is empty, /etc/motd is not touched at all.
+#
+# Example:
+# IMAGE_MODE_MOTD_NOT_PRODUCTION () {
+# *********************************************
+# *** This is a ${IMAGE_MODE} image! ${@ ' ' * (19 - len(d.getVar('IMAGE_MODE')))} ***
+# *** Do not use in production.             ***
+# *********************************************
+# }
+# IMAGE_MODE_MOTD = "${IMAGE_MODE_MOTD_NOT_PRODUCTION}"
+# IMAGE_MODE_MOTD[production] = ""
+
+# Empty when IMAGE_MODE is unset, otherwise -<IMAGE_MODE>.
+IMAGE_MODE_SUFFIX = "${@ '-' + d.getVar('IMAGE_MODE') if d.getVar('IMAGE_MODE') else '' }"
+
+python () {
+    # Sanity checks for IMAGE_MODE.
+    image_mode = d.getVar('IMAGE_MODE')
+    mode = set(image_mode.split())
+    if len(mode) == 0:
+        return
+    if len(mode) > 1:
+        bb.fatal('An image can only be built in exactly one mode: IMAGE_MODE=%s' % image_mode)
+    mode = mode.pop()
+    valid = d.getVar('IMAGE_MODE_VALID') or ''
+    if mode not in valid.split():
+        bb.fatal('Invalid image mode: IMAGE_MODE=%s (not in %s)' % (image_mode, valid))
+}
+
+python image_mode_motd () {
+    image_mode = d.getVar('IMAGE_MODE')
+    motd = d.getVarFlag('IMAGE_MODE_MOTD', image_mode or 'none')
+    if motd is None:
+        motd = d.getVar('IMAGE_MODE_MOTD')
+    if motd:
+        with open(d.expand('${IMAGE_ROOTFS}${sysconfdir}/motd'), 'a') as f:
+            f.write(motd)
+}
+ROOTFS_POSTPROCESS_COMMAND += "image_mode_motd;"
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 405fd73..b381d53 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -204,7 +204,9 @@ LINGUAS_INSTALL ?= "${@" ".join(map(lambda s: "locale-base-%s" % s, d.getVar('IM
 # aren't yet available.
 PSEUDO_PASSWD = "${IMAGE_ROOTFS}:${STAGING_DIR_NATIVE}"
 
+# Inherit helper classes.
 inherit rootfs-postcommands
+inherit image-mode
 
 PACKAGE_EXCLUDE ??= ""
 PACKAGE_EXCLUDE[type] = "list"
-- 
git-series 0.9.1

