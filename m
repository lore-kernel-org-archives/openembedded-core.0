Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SFtqL-0005iB-Pb
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Apr 2012 23:03:45 +0200
Received: by wgbdr12 with SMTP id dr12so1465444wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Apr 2012 13:54:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=j/WSaVrITdzL2XLCzz8l0xN3VfE3lHy9hPpbndeTOAw=;
	b=Izok1BiI6wfTM8n2g+mMfgVqqypESqdzDhYr1/eQwdHpHmWIL6gMfRlunhc4wc1RZJ
	3NXsFHQL1cMENw5xwy4IPDC9fJNALP/d94Qk8AUvTHUDqw5TLwgWYrave+ffDp5tN1b5
	bcqAf2YL6POit9aEdUjuC2u0/xec3Z0ahcBRqavdyKKaWB7idCxky0ghwSeKoHJiunPM
	jBWfBk1dT41jomgvTSYRvnr9jLhJwzCMxNqkTHzQZSvDvwfBGBA2o91MQrTijTDdxsdh
	6/59mIFwAgQIhm1ux5NPtXmj2rB+oyPAGMyRZWNG3GDuZCyxB81JwBYjCuXCE37nx55s
	PvtQ==
Received: by 10.216.136.100 with SMTP id v78mr2512256wei.88.1333659273313;
	Thu, 05 Apr 2012 13:54:33 -0700 (PDT)
Received: from localhost.localdomain ([79.115.103.32])
	by mx.google.com with ESMTPS id j3sm606151wiw.1.2012.04.05.13.54.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 Apr 2012 13:54:32 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Apr 2012 23:54:20 +0300
Message-Id: <26438581812a6aaeff7be095554ad6f356fb0a50.1333659001.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1333659001.git.andrei@gherzan.ro>
References: <cover.1333659001.git.andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQlryERqiHs5h6JhbCAlP5yfS393TT9H74jCl+g2uk6co8/33PASo0910ugLImJzFUPzHGEE
Subject: [PATCH 1/6] gdbm: Activate -enable-libgdbm-compat and add symlinks to headers in include/gdbm
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
X-List-Received-Date: Thu, 05 Apr 2012 21:03:45 -0000

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



