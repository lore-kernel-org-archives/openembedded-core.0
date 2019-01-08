Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id ABC27605BF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jan 2019 14:38:54 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id f188so4597371wmf.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jan 2019 06:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=vpcV7eoT+yG5rhSSbV3EYgSmqhyE2tiatylu+JLqszg=;
	b=QmyFNsc1QK6ETAMQ3YMG5sjLFawcv6m4se9N7FHjlk7bRMVdev7JObwVgYabwXk+tf
	Xp+qwgvOM+SMXau/Yxkptudgek4HJD/36tLfiJ4yRAlYAdgGQEov/mWbajnjlfAErDcx
	JPXYWbUK8Bf8lD8Hycy77DQiHVETWygyUZjLZCcsAYg4DoAMor6ItuyqapjvuFIzrxwr
	mbJWK/t5xztvW0OemRApDniNBVYHbCSZkurGXUsKU3+xgTZ+pHrUC+8eWtH04FcdgYuj
	WaUZX5jXmv8yj/H5q8NgT64Rb12IpM3/icjkT4qyO+pgSk+KO4n9dGprPp2K/433eig3
	+cPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=vpcV7eoT+yG5rhSSbV3EYgSmqhyE2tiatylu+JLqszg=;
	b=Gp+MzRyBErQZJ+BQ8qcW/gx532R4Xjnx8B5oRfPGXg9hjafVoYbNPdjU0TtZUtRwjp
	jEeuridCSKpJbajF2rRNMN2qsXtAezX1dJFBZzFSY5SfK3qlv2fhGM2ehIQ1KbrBrHae
	AfIrFIacsXNUqmkjFG+uh2VU0/DHCMN474v5Zw5oP+mnCJEBJgNelG5QqzdPF9VIv8a2
	YiNUlwB8o144K9rTrpXcnZ/41/wFPUtY4TLV7tOSFOZ5jhGqwVCinEtalQSvqr2V5XAL
	dV8a4XLAWO11sGgwnXDnj0gvC9D0WtDvlMliH0fd66OfSS9EXFvJ72zc2Vtw2q5X3AC+
	mdyA==
X-Gm-Message-State: AJcUukeLz6V7ot+i5s/d1G/Xto0/5aajMb/ITXQ6A16Hden767fwl6yX
	R1J35xiZhJU50OjA3l6Eb7+fEKtPsgQ=
X-Google-Smtp-Source: ALg8bN4y3fjKfSm2zF5lPlmJUHqBrvz5NSlSbvKlxKFupzo2vJYknQlw5Ww7abEslE6srOHcwYEp+g==
X-Received: by 2002:a1c:cec1:: with SMTP id e184mr2070646wmg.75.1546958335123; 
	Tue, 08 Jan 2019 06:38:55 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id m4sm11803498wmi.3.2019.01.08.06.38.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Jan 2019 06:38:54 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Jan 2019 14:38:49 +0000
Message-Id: <20190108143851.20544-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/3] gsettings: allow the schemas to be in any package
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
X-List-Received-Date: Tue, 08 Jan 2019 14:38:55 -0000

Instead of assuming that the schemas are located in ${PN}, add a
GSETTINGS_PACKAGE variable for the package name and default it to ${PN}.

For recipe that can conditionally ship schemas, support GSETTINGS_PACKAGE being
empty gracefully by doing nothing.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/gsettings.bbclass | 48 +++++++++++++++++++++++-------------------
 1 file changed, 26 insertions(+), 22 deletions(-)

diff --git a/meta/classes/gsettings.bbclass b/meta/classes/gsettings.bbclass
index eae3dc7999f..47cf00102ec 100644
--- a/meta/classes/gsettings.bbclass
+++ b/meta/classes/gsettings.bbclass
@@ -7,32 +7,36 @@
 
 # TODO use a trigger so that this runs once per package operation run
 
-
-RDEPENDS_${PN} += "glib-2.0-utils"
-
-FILES_${PN} += "${datadir}/glib-2.0/schemas"
-
-PACKAGE_WRITE_DEPS += "glib-2.0-native"
+GSETTINGS_PACKAGE ?= "${PN}"
+
+python __anonymous() {
+    pkg = d.getVar("GSETTINGS_PACKAGE")
+    if pkg:
+        d.appendVar("PACKAGE_WRITE_DEPS", " glib-2.0-native")
+        d.appendVar("RDEPENDS_" + pkg, " glib-2.0-utils")
+        d.appendVar("FILES_" + pkg, " ${datadir}/glib-2.0/schemas")
+}
 
 gsettings_postinstrm () {
 	glib-compile-schemas $D${datadir}/glib-2.0/schemas
 }
 
 python populate_packages_append () {
-    pkg = d.getVar('PN')
-    bb.note("adding gsettings postinst scripts to %s" % pkg)
-
-    postinst = d.getVar('pkg_postinst_%s' % pkg) or d.getVar('pkg_postinst')
-    if not postinst:
-        postinst = '#!/bin/sh\n'
-    postinst += d.getVar('gsettings_postinstrm')
-    d.setVar('pkg_postinst_%s' % pkg, postinst)
-
-    bb.note("adding gsettings postrm scripts to %s" % pkg)
-
-    postrm = d.getVar('pkg_postrm_%s' % pkg) or d.getVar('pkg_postrm')
-    if not postrm:
-        postrm = '#!/bin/sh\n'
-    postrm += d.getVar('gsettings_postinstrm')
-    d.setVar('pkg_postrm_%s' % pkg, postrm)
+    pkg = d.getVar('GSETTINGS_PACKAGE')
+    if pkg:
+        bb.note("adding gsettings postinst scripts to %s" % pkg)
+
+        postinst = d.getVar('pkg_postinst_%s' % pkg) or d.getVar('pkg_postinst')
+        if not postinst:
+            postinst = '#!/bin/sh\n'
+        postinst += d.getVar('gsettings_postinstrm')
+        d.setVar('pkg_postinst_%s' % pkg, postinst)
+
+        bb.note("adding gsettings postrm scripts to %s" % pkg)
+
+        postrm = d.getVar('pkg_postrm_%s' % pkg) or d.getVar('pkg_postrm')
+        if not postrm:
+            postrm = '#!/bin/sh\n'
+        postrm += d.getVar('gsettings_postinstrm')
+        d.setVar('pkg_postrm_%s' % pkg, postrm)
 }
-- 
2.11.0


