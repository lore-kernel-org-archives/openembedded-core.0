Return-Path: <zeenix@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id D6ECA76EBF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 14:00:53 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id z194so1405719wmd.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 07:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=vbLjDJzwyBM+YbPxKjHYjcWAs4vbJVfeCgCapwm3l7U=;
	b=DiLMJs+eg6IdQtaeTQIdDnKiUZ8600MsCwXDgpIm9l8YTeNbfxqnXCLhAzu0xgKTWJ
	jEoyUY45hcqNaNPNhPkhjdVhvAJ+Kdo5SUUL6AomuNCphiOsrCCM5oKXKQ5Psf4+fl8C
	vlfm2+6WD3gXkWV/PJ0fibOSTZS1PVkUulvMlUSUPTjHLdjHlougS7gTqQIPTjFRYugQ
	gurix62m6KJryVJBGiZ7jF10Qi3dmVm8KkpMum2XoAZ3G7y+ESZnTn2vOvZxpOnjrW5C
	5kbgXOPxCUwDgSMfkN46xLPj0T7bzOuQR8ojvgOMbC14LoR9s0llxHrEwFPT1STIBRCr
	H+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=vbLjDJzwyBM+YbPxKjHYjcWAs4vbJVfeCgCapwm3l7U=;
	b=EdpKO1scxQvNM3OMXl2wSTHpbJMRXVYf/pe6a66cwkBE3ieMoX2AKNso7cFHNpFYG2
	IF+Wed1QfU+T6FRnCkG9+cHkmDS49b0laLiUe5Wt4dBL+omdtsR71AebIOpndTyy5NuP
	eXnrmKL+EvL1nfv4vbgPxvGzxS2TuivwKa6zilC4JPlRY5pUshoLqu01CGgSsUaRBL+U
	zMIRzHy0X/y7ORaVQx6ilHIX+LC1yJM+94tw+YBECpaLmPRBEHBbI8ErCSaU+Cq7V8d7
	C+Eea7qywYgkt0OpXOB22HOZVG/7V+8nljwmP1hHI/oiggGX4eQn/l+0u1fzN90C1myo
	A5ww==
X-Gm-Message-State: AE9vXwMd/Vvb9AOQCISsnd9vqBpkwFI9wMFDlaVEKM+ePUO29Bog15JUckYXlDgC7k/ngg==
X-Received: by 10.28.132.71 with SMTP id g68mr108182wmd.20.1473688853796;
	Mon, 12 Sep 2016 07:00:53 -0700 (PDT)
Received: from zeelaptop.office.pelagicore.net ([83.218.80.242])
	by smtp.gmail.com with ESMTPSA id 137sm401800wmi.16.2016.09.12.07.00.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Sep 2016 07:00:52 -0700 (PDT)
From: Zeeshan Ali <zeenix@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Sep 2016 16:00:45 +0200
Message-Id: <1473688845-10252-1-git-send-email-zeenix@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] [krogoth] gobject-introspection.bbclass: disable introspection for -native and -nativesdk recipes
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
X-List-Received-Date: Mon, 12 Sep 2016 14:00:54 -0000

From: Alexander Kanavin <alexander.kanavin@linux.intel.com>

It is not necessary for those targets, adds to the build time, and pulls
in the unneeded qemu-native dependency.

(From OE-Core rev: be18364edd5cd2c664f68120063a1e147563faab)

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/gobject-introspection.bbclass | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta/classes/gobject-introspection.bbclass b/meta/classes/gobject-introspection.bbclass
index 2d73e40..cc7ca5a 100644
--- a/meta/classes/gobject-introspection.bbclass
+++ b/meta/classes/gobject-introspection.bbclass
@@ -3,13 +3,23 @@
 # This sets up autoconf-based recipes to build introspection data (or not),
 # depending on distro and machine features (see gobject-introspection-data class).
 inherit gobject-introspection-data
-EXTRA_OECONF_prepend = "${@bb.utils.contains('GI_DATA_ENABLED', 'True', '--enable-introspection', '--disable-introspection', d)} "
+EXTRA_OECONF_prepend_class-target = "${@bb.utils.contains('GI_DATA_ENABLED', 'True', '--enable-introspection', '--disable-introspection', d)} "
+
+# When building native recipes, disable introspection, as it is not necessary,
+# pulls in additional dependencies, and makes build times longer
+EXTRA_OECONF_prepend_class-native = "--disable-introspection "
+EXTRA_OECONF_prepend_class-nativesdk = "--disable-introspection "
 
 UNKNOWN_CONFIGURE_WHITELIST_append = " --enable-introspection --disable-introspection"
 
 # Generating introspection data depends on a combination of native and target
 # introspection tools, and qemu to run the target tools.
-DEPENDS_append = " gobject-introspection gobject-introspection-native qemu-native"
+DEPENDS_append_class-target = " gobject-introspection gobject-introspection-native qemu-native"
+
+# Even though introspection is disabled on -native, gobject-introspection package is still
+# needed for m4 macros.
+DEPENDS_append_class-native = " gobject-introspection-native"
+DEPENDS_append_class-nativesdk = " gobject-introspection-native"
 
 # This is necessary for python scripts to succeed - distutils fails if these
 # are not set
-- 
2.7.4


