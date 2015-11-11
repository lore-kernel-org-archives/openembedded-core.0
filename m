Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 61CE07718D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 17:41:52 +0000 (UTC)
Received: by pabfh17 with SMTP id fh17so36810222pab.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 09:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BgOL22aId2RtP3rcTCTZ4fsQrigX01jxeNdo9Yhjux4=;
	b=i+1M7htwjG6yp52b4YXfoZC/stAMb01UpAEvC7n/NjQU+KpAtKs5p5NzN/QEyDBb1k
	md7+k81Qg1U3EsKocgEEAj3NEZp3fOO8zoJLf+hmTDRfPmmO2TBNWUWSMzsHYja96ofm
	GpYJ+WaIQni3T50QC5j5Ho5jnRUb+mIAcPRZke0m4kYovjq5ke+/tGaRkCnfsBfV6lMf
	KKLrP1Lo83ROP27j6G/uHcU3F815n5azbHlRh9YBET+VVEdRgy0Jm+ddj87cl1E/BuQO
	PxQ8vvbXrk4uUKvTbGwAXvHhICd37I2tOq/GeizEC3wEsGX6zz+zn3P/YmhK4t7kKtpw
	QFFA==
X-Received: by 10.68.175.193 with SMTP id cc1mr16626951pbc.16.1447263713206;
	Wed, 11 Nov 2015 09:41:53 -0800 (PST)
Received: from Pahoa2.hsd1.ca.comcast.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	v17sm10395426pbs.69.2015.11.11.09.41.51
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 Nov 2015 09:41:52 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Nov 2015 09:41:46 -0800
Message-Id: <1447263707-27696-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1447263707-27696-1-git-send-email-akuster808@gmail.com>
References: <1447263707-27696-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: [PATCH 1/2] ldconfig: add method to extend ldconfig search dirs
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
X-List-Received-Date: Wed, 11 Nov 2015 17:41:53 -0000

From: Armin Kuster <akuster@mvista.com>

this provides a method to extend the search path ldconfig-native
uses when creating ls.so.cache.

To enable in recipe:

add:
inherit ldconfig

LDSOCONF = "/opt/lib"

this will create a ld.so.conf file in work-shared/ldconfig/${PN}/

to create an image with these new search paths included, add to local.conf:

INHERIT += "image-ldconfig"

this will take all the ${PN}/ld.so.conf files and create a single ld.so.conf
that will be used by ldconfig-native when building an image.

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/classes/image-ldconfig.bbclass | 26 ++++++++++++++++++++++++++
 meta/classes/ldconfig.bbclass       | 27 +++++++++++++++++++++++++++
 meta/conf/bitbake.conf              |  5 +++++
 3 files changed, 58 insertions(+)
 create mode 100644 meta/classes/image-ldconfig.bbclass
 create mode 100644 meta/classes/ldconfig.bbclass

diff --git a/meta/classes/image-ldconfig.bbclass b/meta/classes/image-ldconfig.bbclass
new file mode 100644
index 0000000..e9946da
--- /dev/null
+++ b/meta/classes/image-ldconfig.bbclass
@@ -0,0 +1,26 @@
+#
+# To enable, use INHERIT in local.conf:
+#
+#       INHERIT += "image-ldconfig"
+
+do_rootfs[depends] += "ldconfig-native:do_populate_sysroot"
+
+IMAGE_PREPROCESS_COMMAND += "ld_so_conf; "
+
+ld_so_conf() {
+
+    rm -f ${STAGING_DIR_NATIVE}${sysconfdir_native}/ld.so.conf
+
+    # save lib dirs as defined in recipes
+    for file in `find ${STAGING_LDSO_CONF_DIR}/*/* -name "ld.so.conf"`;
+    do
+        cat ${file} >> ${STAGING_LDSO_CONF_DIR}/ld.so.conf
+    done
+
+    # remove dups and sort
+    cat ${STAGING_LDSO_CONF_DIR}/ld.so.conf | sort -u > ${IMAGE_ROOTFS}/etc/ld.so.conf
+
+    # this seems to work if at rootfs location.
+    cd ${IMAGE_ROOTFS}
+    ${STAGING_DIR_NATIVE}${bindir_native}/ldconfig -r . -c new -f etc/ld.so.conf 
+}
diff --git a/meta/classes/ldconfig.bbclass b/meta/classes/ldconfig.bbclass
new file mode 100644
index 0000000..558122f
--- /dev/null
+++ b/meta/classes/ldconfig.bbclass
@@ -0,0 +1,27 @@
+# Allows adding libs or alt lib locations to be included
+# during ld.so.cache creation.
+#
+#
+
+do_package[postfuncs] += "save_ld_so_conf "
+do_clean[cleandirs] += "${STAGING_LDSO_CONF_DIR}/${PN} "
+
+python save_ld_so_conf() {
+    import os
+
+    if (d.getVar('USE_LDCONFIG', True) or "1") == "1":
+        ldsodir = d.getVar('STAGING_LDSO_CONF_DIR', True)
+        if not os.path.isdir(ldsodir):
+            os.mkdir(ldsodir)
+    
+        staging_ld = os.path.join(ldsodir, d.expand("${PN}"))
+        if not os.path.isdir(staging_ld):
+            os.mkdir(staging_ld)
+
+        ldsofile = os.path.join(staging_ld, 'ld.so.conf')
+
+        ldconf = d.getVar('LDSOCONF', True).split()
+        with open(ldsofile, 'w') as lsdo:
+            for ldso_entry in ldconf:
+                lsdo.write(ldso_entry+"\n")
+}
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 06971da..f0471f4 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -811,3 +811,8 @@ BB_SIGNATURE_EXCLUDE_FLAGS ?= "doc deps depends \
 
 MLPREFIX ??= ""
 MULTILIB_VARIANTS ??= ""
+
+# 
+# ldconfig stuff
+#
+STAGING_LDSO_CONF_DIR = "${TMPDIR}/work-shared/ldconfig"
-- 
2.3.5


