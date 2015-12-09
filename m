Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id DC1866FFA6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Dec 2015 18:14:30 +0000 (UTC)
Received: by iofh3 with SMTP id h3so68553819iof.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Dec 2015 10:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=rzyaIENPHmhY7kpyIykjeOKuuWa9MnrPqqeqIZC7kkI=;
	b=nX0CP+pcHh3NRyA8LV64xnsAHvpcnLUaoqFIatJU9mNtNkw1VIoCRDugq88z/SMlHY
	SoxtM45zu5ECnMm4I/QdX2SeFwUXmmlHoCqaB3de6s1Y6uPu4/+8r1NwiJMRf3qlBZ2f
	PMFZk2H10RqupO2Q28hNz/dSozaCj24thxhsQdNEce4LQChzKTRsr7+6ySk9nX2lKAYx
	ftPob2da7ZFD2JthzCYghrGRouRDN4RqPmoLwTiu8+o/vOIQmedfHs875HiUERjQ/NaN
	FyNJvWPtiLhTsBLjUsMboiO/5oTMRfJ2U3ScYZxgedgs5uqFHLvXSEJFI7Tv9AnPCZpg
	P9Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=rzyaIENPHmhY7kpyIykjeOKuuWa9MnrPqqeqIZC7kkI=;
	b=Pfx57j8nk/mVQm3Vk05CvyTFerXGPGnNck6zwJa4GcoC59TgnmDhJ5lXKDQSC2hxfi
	QiNk+3bDDq27ul20ztTTmS6l1BpgOle2A1BEXboqwD3utik+YBXojb4pJ8HI1UCIIs0t
	NoOHAWfpqbyUaBPqNIngILB+Bw/pmmqvCipFr4cpb51ufSE7e5u7udFNdbaGVKnCfsSj
	xfPI5Kv/woYZQaXi4elpT9cxqneB7fMLLRnwxA616JxXVpGpx1MZzC0dn6DVvTWq07MC
	w2AlnX0m1IuNgCfuXpXzghqxmTyyL0oNjb6FPRgHVdhyhVchURTB9Sg4Q998jGRxVXnS
	XSjQ==
X-Gm-Message-State: ALoCoQkzA9AKcsaTvRVTOCs+mGlZmcyHd5Lriu8+nVv8ycde99xJXcM0dhJ/4NJPoGv83nmqWgmjIiEOdFIPi2hXqXAiik75zA==
X-Received: by 10.107.135.145 with SMTP id r17mr6706176ioi.176.1449684870827; 
	Wed, 09 Dec 2015 10:14:30 -0800 (PST)
Received: from pohly-desktop.fritz.box (p57A560AC.dip0.t-ipconnect.de.
	[87.165.96.172])
	by smtp.gmail.com with ESMTPSA id 79sm3710213ioh.19.2015.12.09.10.14.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 Dec 2015 10:14:30 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Dec 2015 20:14:29 +0100
Message-Id: <0c21befad53dcc9448973d3e561352e07047c149.1449683756.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1449683756.git.patrick.ohly@intel.com>
References: <cover.1449683756.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1449683756.git.patrick.ohly@intel.com>
References: <cover.1449683756.git.patrick.ohly@intel.com>
Subject: [PATCH 1/3] capabilities.bbclass: add file capabilities automatically
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
X-List-Received-Date: Wed, 09 Dec 2015 18:14:31 -0000

Setting file capabilities must be done in postinst scripts. This class
simplifies that by ensuring that the necessary tools are installed and
automatically generating the necessary postinst scripts based on the
CAPABILITIES_PACKAGES (list of packages which contain files with
special capabilities, ${PN} if not set) and CAPABILITIES_<pkg>
(definition of special files inside the <pkg> package).

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/capabilities.bbclass | 58 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 meta/classes/capabilities.bbclass

diff --git a/meta/classes/capabilities.bbclass b/meta/classes/capabilities.bbclass
new file mode 100644
index 0000000..92c2a9a
--- /dev/null
+++ b/meta/classes/capabilities.bbclass
@@ -0,0 +1,58 @@
+# Simplifies setting file capabilities. Those have to go into
+# a postinst script because it is not guaranteed that the package
+# format preserves the security.capabilities xattr that holds
+# the file capabilities.
+#
+# Using this class also ensures that the necessary tools are
+# available.
+#
+# Example usage (for a hypothetical ping_%.bb[append]):
+#   inherit capabilities
+#   CAPABILITIES_PACKAGES = "${PN}-bin"
+#   CAPABILITIES_${PN}-bin = "${bindir}/ping=net_raw,net_admin ${bindir}/pong=net_broadcast"
+#
+# Copyright (C) 2015 Intel Corporation
+# Licensed under the MIT license
+
+# Dependency when install in cross-compile mode on build host.
+# Runtime DEPENDS_<pkg> needs to be created dynamically.
+DEPENDS += "libcap-ng-native"
+
+# Space-separated list of packages containing files with capabilities.
+CAPABILITIES_PACKAGES ??= "${PN}"
+
+# Space-separated list of files and their capabilities.
+# Capability list may be empty.
+# CAPABILITIES_${PN} = "/foo/bar=capability1,capability2 /abc/def="
+
+# Ensure that add_capabilities_postinsts gets re-run when the content
+# of CAPABILITIES_PACKAGES changes. CAPABILITIES_PACKAGES_<pkg> is added below.
+add_capabilities_postinsts[vardeps] = "CAPABILITIES_PACKAGES"
+python add_capabilities_postinsts() {
+    for pkg in d.getVar('CAPABILITIES_PACKAGES', True).split():
+        bb.note("adding capabilities postinst script to %s" % pkg)
+        postinst = d.getVar('pkg_postinst_%s' % pkg, True) or d.getVar('pkg_postinst', True) or ''
+        files = d.getVar('CAPABILITIES_' + pkg, True)
+        if files is None:
+            bb.fatal('%s listed in CAPABILITIES_PACKAGES but CAPABILITIES_%s is not set' % (pkg, pkg))
+        for entry in files.split():
+            filename, capabilities = entry.split('=', 1)
+            capabilities = capabilities.split(',')
+            if capabilities:
+                cmd = 'filecap $D%s %s' % (filename, ' '.join(capabilities))
+                # TODO: errors during do_rootfs do not show up in log.do_rootfs.
+                # This makes it easy to miss problems.
+                postinst += 'echo "{0}"; {0} || exit 1\n'.format(cmd)
+            d.setVar('pkg_postinst_%s' % pkg, postinst)
+}
+
+PACKAGEFUNCS =+ "add_capabilities_postinsts"
+
+python () {
+    capabilities_pkgs = d.getVar('CAPABILITIES_PACKAGES', True).split()
+    for pkg in capabilities_pkgs:
+        d.appendVar('RDEPENDS_' + pkg, ' libcap-ng-bin')
+
+    d.appendVarFlag('add_capabilities_postinsts', 'vardeps',
+                    ' ' + ' '.join(['CAPABILITIES_' + pkg for pkg in capabilities_pkgs]))
+}
-- 
2.1.4


