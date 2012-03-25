Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SBbgs-0007W0-FU
	for openembedded-core@lists.openembedded.org;
	Sun, 25 Mar 2012 01:52:14 +0100
Received: by wgbdr12 with SMTP id dr12so2671622wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Mar 2012 17:43:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=j/WSaVrITdzL2XLCzz8l0xN3VfE3lHy9hPpbndeTOAw=;
	b=GnBxo3N2Reif/U2wJ7/0i3aUXsxEltWwHv6aGpre5AUVjXGa47GiK9fWC+zwpLP+OE
	WoJV43sX4bTKE0HFguvH8z562cRQK0ty0oTRJRPWTP/PoQktSI/dCHfPWQpOGqYoy2QQ
	jZ+dnPu1e3jUGR3aZXY3ImdaEwEn33am7A0yqL4ah8sxqE+fq4Ec/lgFp9iYIM7CxwJY
	E1uoRcp8ZEqxYBrQo8/3VXxcKlupDBlw/ja0CZTS4LrlfHXF2pW0KAEBbCeyWuhRgNkf
	hmwmSAFpi15AlS8dNFtkYhEVPhuDXwlQ3f7geR5Zw0RljBHrJolXxyx6Ns1HlKr823E8
	kl4w==
Received: by 10.216.144.138 with SMTP id n10mr9691534wej.56.1332636196513;
	Sat, 24 Mar 2012 17:43:16 -0700 (PDT)
Received: from localhost.localdomain ([79.117.107.69])
	by mx.google.com with ESMTPS id l5sm27303664wia.11.2012.03.24.17.43.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 24 Mar 2012 17:43:16 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Sun, 25 Mar 2012 02:43:08 +0200
Message-Id: <d6bc9ce28547772a079773078e6440568f1dd26c.1332635505.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1332635505.git.andrei@gherzan.ro>
References: <cover.1332635505.git.andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQmsjXwT1iHdeIZMGjQQUH4eTiqNQJ8T9XG2LqQJMI/M+v2Lit4KhIG+ZA4eZF8e9fueScGU
Subject: [PATCH 1/3] gdbm: Activate -enable-libgdbm-compat and add symlinks to headers in include/gdbm
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 25 Mar 2012 00:52:14 -0000

ndbm.h is needed by python for dbm module. This is why -enable-libgdbm-compat was added
to configure.
The second change is because python is looking for the gdbm headers in include/gdbm.
The easiest way to solve this issue is to add symlinks in include/gdbm.

[YOCTO #1937]

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/recipes-support/gdbm/gdbm_1.10.bb |   13 ++++++++++++-
 1 files changed, 12 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-support/gdbm/gdbm_1.10.bb b/meta/recipes-support/gdbm/gdbm_1.10.bb
index 9b2fde4..26b8009 100644
--- a/meta/recipes-support/gdbm/gdbm_1.10.bb
+++ b/meta/recipes-support/gdbm/gdbm_1.10.bb
@@ -4,7 +4,7 @@ SECTION = "libs"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=241da1b9fe42e642cbb2c24d5e0c4d24"
 
-PR = "r1" 
+PR = "r2"
 
 SRC_URI = "${GNU_MIRROR}/gdbm/gdbm-${PV}.tar.gz"
 
@@ -13,4 +13,15 @@ SRC_URI[sha256sum] = "23f8134c5b94bbfb06d756a6b78f074fba6e6028cf2fe01341d40b26db
 
 inherit autotools gettext lib_package
 
+# Needed for dbm python module
+EXTRA_OECONF = "-enable-libgdbm-compat"
+
 BBCLASSEXTEND = "native nativesdk"
+
+do_install_append () {
+    # Create a symlink to ndbm.h and gdbm.h in include/gdbm to let other packages to find
+    # these headers
+    install -d ${D}${includedir}/gdbm
+    ln -sf ../ndbm.h ${D}/${includedir}/gdbm/ndbm.h
+    ln -sf ../gdbm.h ${D}/${includedir}/gdbm/gdbm.h
+}
-- 
1.7.5.4



