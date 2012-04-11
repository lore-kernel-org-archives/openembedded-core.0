Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SHyW8-0004OB-5O
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Apr 2012 16:27:28 +0200
Received: by wibhm17 with SMTP id hm17so3778338wib.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2012 07:18:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=WNQMsZY55ZnsAm+OFANMpgkr8hx7i/gbLpPxQfU9om4=;
	b=XNkzXvdsjwdg7gzwmg74SmQD7tl2fq68r/HjAuhoObnIud3EKlY2X0P6fkxIK5QFdv
	8SllEi7xCkWagnvl9LtJnMndVAoqEg+w+a0wvZEJxPEmKfMlSUJITxenICiQeYC97I1g
	GbovvV3LL2+YGQk1RU4x7rNhDH2HODHqBmRJw5qiBwmekwCMM2eVmFwAWLVvUUbCfdEk
	Z8oi7t9k14DI1KEvYkMly0+vI4q/g3DU8L+MDLrDX++qaBr8XCmZ3qGXoUEqh62b2nrV
	K0sfMvlyPlsaaCzlCcuQ9jI6p+H7O2yar9QjHadPKGJPeWGCDy6CCfzXM9bcYBsD+1Wz
	Ap+Q==
Received: by 10.180.92.228 with SMTP id cp4mr7142021wib.2.1334153889254;
	Wed, 11 Apr 2012 07:18:09 -0700 (PDT)
Received: from localhost.localdomain ([89.121.200.106])
	by mx.google.com with ESMTPS id n8sm10077156wix.10.2012.04.11.07.18.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 Apr 2012 07:18:08 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Apr 2012 17:18:03 +0300
Message-Id: <615f8201f2fb18a7e3e0e0c07febd57f788005ad.1334153781.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1334153781.git.andrei@gherzan.ro>
References: <cover.1334153781.git.andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQn1Wnnj06fca/bNKu1qbRgYGzU69e5w8RVY0DPMBKkOQQCtEZoY6N/aUSFQiTaRzixOw1m4
Subject: [PATCH 1/1] gdbm: Activate -enable-libgdbm-compat and add symlinks to headers in include/gdbm
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
X-List-Received-Date: Wed, 11 Apr 2012 14:27:28 -0000

ndbm.h is needed by python for dbm module. This is why -enable-libgdbm-compat was added
to configure.
The second change is because python is looking for the gdbm headers in include/gdbm.
The easiest way to solve this issue is to add symlinks in include/gdbm.

In order to avoid breaking packages which depend on old package name libgdbm4 (>= 1.10),
compat libs are packaged into a separate package named gdbm-compat.

[YOCTO #1937]

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/recipes-support/gdbm/gdbm_1.10.bb |   18 +++++++++++++++++-
 1 files changed, 17 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-support/gdbm/gdbm_1.10.bb b/meta/recipes-support/gdbm/gdbm_1.10.bb
index 9b2fde4..40bdd86 100644
--- a/meta/recipes-support/gdbm/gdbm_1.10.bb
+++ b/meta/recipes-support/gdbm/gdbm_1.10.bb
@@ -4,7 +4,7 @@ SECTION = "libs"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=241da1b9fe42e642cbb2c24d5e0c4d24"
 
-PR = "r1" 
+PR = "r2"
 
 SRC_URI = "${GNU_MIRROR}/gdbm/gdbm-${PV}.tar.gz"
 
@@ -13,4 +13,20 @@ SRC_URI[sha256sum] = "23f8134c5b94bbfb06d756a6b78f074fba6e6028cf2fe01341d40b26db
 
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
+
+PACKAGES =+ "${PN}-compat \
+            "
+FILES_${PN}-compat = "${libdir}/libgdbm_compat${SOLIBS} \
+                     "
-- 
1.7.5.4



