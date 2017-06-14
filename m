Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 5981C78343
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 10:33:59 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id t87so70089898ioe.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 03:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ZZpMT7/8u0Wl05ZEwNbNoPBHuvd3PbJrJNy33nKsDUM=;
	b=YprNKjlLJkM4ukO6xbo4HBci+W795zFa/b86sS1UdJ3oQ6R5JWI+LjcSRgOZofzz9h
	JcCA9B//1VTUOdZhE1g6QeuEJg+LwrNTst/n4qhhGYEkZ96OHI6AGMN3z9iGjqnG9aRK
	+aKytm682XvJtA27eB+nlpgOddfSq7sm9uPlAxdGOqYR32AVqN2056/aLpfXCxgmmjzY
	jmtxF+MC85fpTID0J5E8AbbxeGpToUAGs54YeJD+pVDj+07l5hiQKoxPnUw9o+xgtfV5
	UH6MRLOEzPcAinzRjZkaRPmQH7TgAFiykIbiU8ahUv4xZk+9S1lXXys8tfRW2nQcnVuT
	IDwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ZZpMT7/8u0Wl05ZEwNbNoPBHuvd3PbJrJNy33nKsDUM=;
	b=aj6SDzAv3IRqPgmE9+ra6q+IfvE+4uzYF72wPxV+d0Ae7DZLLXv3cUcpLriLolAj47
	/47ivUw5akuV2KIouqkChTRTF7Vm/HJn389dC6h4ej2pdn5ROfMkvkrC1jlIulwSda2r
	pJLbX0MCAc8wETcWk2nT6RC/K7T4PuL0CQUd1iMVErfKWGz3KE/djfdwHLpSjbqYBqcY
	e7e/G1b16IP6ebGIQs0NbsM4Lb2euNuqKgJq/St5dwaLBPj3OR6naoopUmKtOqSq/4mm
	SiVzR1MngxN4cXZscz3Cmua0AUzOFLTB9r439yxz2iyT/LQq3WFrLd1t9TTWveNu5BMW
	i/Cw==
X-Gm-Message-State: AKS2vOyQWvFIzB+nYZYpAzWSqLq/xerv1Tg7oe2PWm4FoRcO61dQMWWD
	7kKRjh8RDOUy/scBfNI=
X-Received: by 10.107.34.206 with SMTP id i197mr5192637ioi.67.1497436440877;
	Wed, 14 Jun 2017 03:34:00 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8E312.dip0.t-ipconnect.de.
	[93.232.227.18])
	by smtp.gmail.com with ESMTPSA id j62sm175673iod.29.2017.06.14.03.33.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 14 Jun 2017 03:33:58 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Jun 2017 12:33:50 +0200
Message-Id: <7a767acd65589d50eb987129d75920cf96923347.1497436409.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <3389cda98c8b515e1f9b1e87457042274e88689b.1497436409.git-series.patrick.ohly@intel.com>
References: <3389cda98c8b515e1f9b1e87457042274e88689b.1497436409.git-series.patrick.ohly@intel.com>
Subject: [PATCH 2/2] distrooverrides.bbclass: DISTRO_FEATURES as overrides
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
X-List-Received-Date: Wed, 14 Jun 2017 10:34:00 -0000

This achieves the same goal as the same change to bitbake.conf itself,
but because the class gets added later as part expanding INHERIT, this
new approach is less likely to run into problems when DISTRO_FEATURES
contains complex code.

Another difference is that the class currently does not get inherited
by default and thus is completely absent from a build unless some
layer or include file adds it to INHERIT.

Compared to the earlier code in bitbake.conf and a similar class in
intel-iot-refkit, additional overrides now get sorted. This makes the
final OVERRIDES more deterministic.

The lessons learned about unintentionally depending on OVERRIDES are
documented in the class because such problems are more likely to show
up as unexpected signature differences when using this class.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/distrooverrides.bbclass | 32 +++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+)
 create mode 100644 meta/classes/distrooverrides.bbclass

diff --git a/meta/classes/distrooverrides.bbclass b/meta/classes/distrooverrides.bbclass
new file mode 100644
index 0000000..9a42712
--- /dev/null
+++ b/meta/classes/distrooverrides.bbclass
@@ -0,0 +1,32 @@
+# Turns certain DISTRO_FEATURES into overrides with the same
+# name plus a df- prefix. Ensures that these special
+# distro features remain set also for native and nativesdk
+# recipes, so that these overrides can also be used there.
+#
+# This makes it simpler to write .bbappends that only change the
+# task signatures of the recipe if the change is really enabled,
+# for example with:
+#   do_install_append_df-my-feature () { ... }
+# where "my-feature" is a DISTRO_FEATURE.
+#
+# The class is meant to be used in a layer.conf or distro
+# .inc file with:
+# INHERIT += "distrooverrides"
+# DISTRO_FEATURES_OVERRIDES += "my-feature"
+#
+# Beware that this part of OVERRIDES changes during parsing, so usage
+# of these overrides should be limited to .bb and .bbappend files,
+# because then DISTRO_FEATURES is final.
+
+DISTRO_FEATURE_OVERRIDES ?= ""
+DISTRO_FEATURE_OVERRIDES[doc] = "A space-separated list of <feature> entries. \
+Each entry is added to OVERRIDES as df-<feature> if <feature> is in DISTRO_FEATURES."
+
+DISTRO_FEATURES_FILTER_NATIVE_append = " ${DISTRO_FEATURES_OVERRIDES}"
+DISTRO_FEATURES_FILTER_NATIVESDK_append = " ${DISTRO_FEATURES_OVERRIDES}"
+
+# If DISTRO_FEATURES_OVERRIDES or DISTRO_FEATURES show up in a task
+# signature because of this line, then the task dependency on
+# OVERRIDES itself should be fixed. Excluding these two variables
+# with DISTROOVERRIDES[vardepsexclude] would just work around the problem.
+DISTROOVERRIDES .= "${@ ''.join([':df-' + x for x in sorted(set(d.getVar('DISTRO_FEATURES_OVERRIDES').split()) & set((d.getVar('DISTRO_FEATURES') or '').split()))]) }"
-- 
git-series 0.9.1

