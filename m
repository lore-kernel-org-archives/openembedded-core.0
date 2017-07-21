Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9BE3E7842A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jul 2017 12:47:42 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id f66so3515255iof.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jul 2017 05:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=mbsxAkG9byZBarQXWCWM6mL7PGB85CkAW0OArxKFjEo=;
	b=CIN1A3YB5SVHYWVtb6YIj9iYcii9KyeCaVzp61GC8+ti0h4cgU/Nrxv/7r/HEk5k5N
	Moe0FLdUT06XR2jDP0LtnJ9aSo8Q75DSdzLnVqz28iVibZcoUcjsumgSlrVyvKh5AaK+
	JROG0yK78wmK1LO20hKFbpS7B7x4UCXs67/tEW/wN87UknxNsD50s7NAxAZxOQEKDdEe
	+u7K9dPTMvg1zRadSWsAc+OvLvAyeVRBsAU5VQyPKuvP61vhXYh6KMK4WrKGBYwcqE02
	1UgcAlno4p8ycw/4Hlq7Um7aANXP5g84b+DPmrMgEIKdYz9YrtwqY5b3vM5YDJb9tdD0
	FPxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=mbsxAkG9byZBarQXWCWM6mL7PGB85CkAW0OArxKFjEo=;
	b=EsbNztjljy5K5l+AVRRkFZccbfkBL3YwN9q1lTYysunp7jh2uwyGrqOE78T9qnKgDL
	OIsVv9kJRfEojNSP51PuzVqldkoczUlK8I8JWSQXvXc2fr/tFyW4wYvLLqyj4Vgso4H+
	7VLK5FK3tbm6wkYL4LU0bPEOC2uBnXI6Qabbwt1c8riJ01uSh5kNUQKS9xKHa/bC1s0Z
	2jvgIiek+Wc0H10QkvGGYeQaQFoHdGr9XpOYSN+fmw2hKQ6v7E90P3advaDggfTn6ltO
	oGCs+fdUaZqRsln1JvNhyYdb+3189o7IspOFf02ImoAuOHqsm15+lxnyE6E8PIMCbJFS
	MdiQ==
X-Gm-Message-State: AIVw112kYqRnL8ljYCT0Opp8xVM/8A8xH5ZPyTyk4boahN3jacgmQTwC
	xxWnyDshsX1a/DHOs+A=
X-Received: by 10.107.8.208 with SMTP id h77mr2159346ioi.69.1500641263426;
	Fri, 21 Jul 2017 05:47:43 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id o17sm2366185ioe.1.2017.07.21.05.47.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 21 Jul 2017 05:47:42 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Jul 2017 08:47:40 -0400
Message-Id: <20170721124740.11866-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.13.0
Subject: [PATCH] classes/machine-overrides-extended.bbclass: add
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
X-List-Received-Date: Fri, 21 Jul 2017 12:47:42 -0000

Copy this class from meta-freescale so all BSPs can use it.

This class makes it easy for a BSP to specify multiple sets of configurations
for a given MACHINE. In some cases there are multiple choices for the user.
For example: for the kernel, the user could choose either the vendor kernel or
the upstream kernel. However, sometimes these decisions are "locked" together:
i.e. if you want to use the vendor's binary blob for (say) graphics, then
you have to use their vendor kernel as well. It's not possible for a user to
choose, say, the graphics binary blob but want to use the upstream kernel too.
Therefore the BSP ends up with "sets" of configurations which need to be taken
collectively instead of piecemeal.

In the example of meta-freescale, if the user does nothing special,
they get the vendor options. If they add the following line to their
configuration, they get the upstream pieces:

	MACHINEOVERRIDES .= ":use-mainline-bsp"

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/classes/machine-overrides-extender.bbclass | 48 +++++++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 meta/classes/machine-overrides-extender.bbclass

diff --git a/meta/classes/machine-overrides-extender.bbclass b/meta/classes/machine-overrides-extender.bbclass
new file mode 100644
index 0000000000..f333a0fcb7
--- /dev/null
+++ b/meta/classes/machine-overrides-extender.bbclass
@@ -0,0 +1,48 @@
+# -*- python -*-
+# Automatically set extend the MACHINEOVERRIDES
+#
+# This allow to grouping of different settings for similar platforms.
+#
+# To indicate that a SoC contains following set of overrides, you can use:
+#
+# MACHINEOVERRIDES_EXTENDER_soc = "group1:group2"
+#
+# However to indicate that an override replaces a set of other
+# overrides, you can use:
+#
+# MACHINEOVERRIDES_EXTENDER_FILTER_OUT_override = "group1 group2"
+#
+# Copyright 2016-2017 (C) O.S. Systems Software LTDA.
+
+def machine_overrides_extender(d):
+    machine_overrides = (d.getVar('MACHINEOVERRIDES', True) or '').split(':')
+
+    # Gather the list of overrides to filter out
+    machine_overrides_filter_out = []
+    for override in machine_overrides:
+        machine_overrides_filter_out += (d.getVar('MACHINEOVERRIDES_EXTENDER_FILTER_OUT_%s' % override, True) or '').split()
+
+    # Drop any overrides of filter_out prior extending
+    machine_overrides = [o for o in machine_overrides if o not in machine_overrides_filter_out]
+
+    for override in machine_overrides:
+        extender = d.getVar('MACHINEOVERRIDES_EXTENDER_%s' % override, True)
+
+        if extender:
+            extender = extender.split(':')
+
+            # Drop any extension if in filter_out
+            extender = [e for e in extender if e not in machine_overrides_filter_out]
+
+            extender.reverse()
+            if not set(extender).issubset(set(machine_overrides)):
+                index = machine_overrides.index(override)
+                for e in extender:
+                    machine_overrides.insert(index, e)
+    d.setVar('MACHINEOVERRIDES', ':'.join(machine_overrides))
+
+python machine_overrides_extender_handler() {
+    machine_overrides_extender(e.data)
+}
+machine_overrides_extender_handler[eventmask] = "bb.event.ConfigParsed"
+addhandler machine_overrides_extender_handler
-- 
2.13.0


