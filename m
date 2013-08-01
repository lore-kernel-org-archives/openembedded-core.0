Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f52.google.com (mail-yh0-f52.google.com
	[209.85.213.52])
	by mail.openembedded.org (Postfix) with ESMTP id 86F3961883
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2013 22:14:17 +0000 (UTC)
Received: by mail-yh0-f52.google.com with SMTP id f11so1247119yha.39
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Aug 2013 15:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=u2hMn5m3VAEoFi6Y/ExpJnULVsb8BSkj5tqJM3KIhAg=;
	b=j15ppgvRw/MtmClbYhWRmjSGjb7Fv8IEupLoeR3ph72CS0vDF8a6PLn1OC4wTrS3WZ
	9hlD59KnTK/ylUPyHwMeabc03how1XndI46dU5U2SPwRMLqgswz1VpLpcyVpGPewkhsI
	pcW3uQofR2qEMnBqAZsft66QO/2Y0unrenoao1Fl3tIGWw+t2s6HjnnulgTcLdyQfig+
	oQdm/ZKOrokylUMIANapbqiWURAwElvfyQbFkH9HBTOEurEc+7a86OfXPTK/oFI9k3EH
	NSAkvO7IjHdXe1QpiZDQlOntNp1AEF/VwQNgPvV7xfqhTmTwn34twcRlrwuKl4qtXSOx
	GRdw==
X-Received: by 10.236.59.38 with SMTP id r26mr2334241yhc.132.1375395257768;
	Thu, 01 Aug 2013 15:14:17 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([187.23.155.55])
	by mx.google.com with ESMTPSA id d68sm7322532yhk.7.2013.08.01.15.14.15
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 01 Aug 2013 15:14:17 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu,  1 Aug 2013 19:13:57 -0300
Message-Id: <1375395237-17840-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.3.2
Cc: Evan Kotara <evan.kotara@freescale.com>,
	Lauren Post <lauren.post@freescale.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Daiane Angolini <daiane.angolini@freescale.com>
Subject: [PATCH v3] distro_features_check.bbclass: Allow checking of required/conflicting features
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
X-List-Received-Date: Thu, 01 Aug 2013 22:14:18 -0000

This add support to list required/confliting distro features for a
recipe; this avoids user mistake when building recipes/images which
would not work depending on DISTRO_FEATURES option set.

Adding:

,----[ Use example ]
| inherit distro_features_check
|
| REQUIRED_DISTRO_FEATURES = "x11"
| CONFLICT_DISTRO_FEATURES_mx6 = "wayland"
`----

In the image recipe allow us to make clear to user that this image
needs X11 and /cannot/ be build with Wayland support in i.MX6
platforms, for example.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
Changes in v3:
- Move code from base.bbclass to distro_features_check.bbclass
- Rework code
- Rework commit log

Changes in v2:
- Rename to REQUIRED_DISTRO_FEATURES;
- Remove spurious bb.note;
- Rewrote error message;

 meta/classes/distro_features_check.bbclass | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta/classes/distro_features_check.bbclass

diff --git a/meta/classes/distro_features_check.bbclass b/meta/classes/distro_features_check.bbclass
new file mode 100644
index 0000000..61b11b7
--- /dev/null
+++ b/meta/classes/distro_features_check.bbclass
@@ -0,0 +1,28 @@
+# Allow checking of required and conflicting DISTRO_FEATURES
+#
+# REQUIRED_DISTRO_FEATURES: ensure every item on this list is included
+#                           in DISTRO_FEATURES.
+# CONFLICT_DISTRO_FEATURES: ensure no item in this list is included in
+#                           DISTRO_FEATURES.
+#
+# Copyright 2013 (C) O.S. Systems Software LTDA.
+
+python () {
+    required_distro_features = d.getVar('REQUIRED_DISTRO_FEATURES', True)
+    if required_distro_features:
+        required_distro_features = required_distro_features.split()
+        distro_features = (d.getVar('DISTRO_FEATURES', True) or "").split()
+        for f in required_distro_features:
+            if f in distro_features:
+                break
+        else:
+            raise bb.parse.SkipPackage("missing required distro feature %s (not in DISTRO_FEATURES)" % required_distro_features)
+
+    conflict_distro_features = d.getVar('CONFLICT_DISTRO_FEATURES', True)
+    if conflict_distro_features:
+        conflict_distro_features = conflict_distro_features.split()
+        distro_features = (d.getVar('DISTRO_FEATURES', True) or "").split()
+        for f in conflict_distro_features:
+            if f in distro_features:
+                raise bb.parse.SkipPackage("conflicting distro feature %s (in DISTRO_FEATURES)" % conflict_distro_features)
+}
-- 
1.8.3.2


