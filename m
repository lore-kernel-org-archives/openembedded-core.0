Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id DF2E77FC59
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 21:29:20 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id m24so8762658wmc.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 13:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=HYqxvXqroTsVUDwFYvWCmEA1reRtVZ6x8IMWl193UlQ=;
	b=Cw0pqJQFoEjq/JYEwDh39ENNsnGvpV86AWPO0K1CC1RvhPRRs+yEeYA2DUZyZSattD
	X3jwHah+a8CsrS1Ig694jnkdmr0fyZNT4lc1lSOmn8+KP8Yl5NQ5l2xXOv4H2kklxjHO
	JSp/QRDQNmOZuBtDpLzf1HKafYltCksMaqK9UFWiVt3Ls0kdiLYLtcZYJdigSmxBP2Yr
	cITcgO/r+o22BxwpC1q+sAJmI2rkIrsgnk/Z05qIGTtWYLHHLP5agR3/O+Hz92674afz
	okaa2dxJJ0XqEQwNpDdNqP3xE6wd82NpmpE19pm0Uoj/rPVWXjPfwMhCgsVtdoX0MOyf
	xVtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=HYqxvXqroTsVUDwFYvWCmEA1reRtVZ6x8IMWl193UlQ=;
	b=bLGzI0iohAibKOX65hD+c2QO40bkVxftdhX60eRI+NxNpVovvM9JfJmCbrlszwjf9x
	cizGln571DJD8VEsNSrBpMIAlBCrgK4E19pYQgL2DiEXbl+6tmqjQ0bb94Kt+4wQPewc
	0u9Wd/PPoTO/yeBDmGhO6t4MNDKSagCuYumnkJY9BuqBWgxyD21juEPVqB8y56/VWoVz
	IpyVLIdEZpcUyqssLpsuslv0+oirHsXqDRO7MA3X22IlPuZGZ7pNZPy4mQZ7gjOjilTL
	v2yCeCDb5CMFhMgcspB+vpKhUQBQ3uQKY/ARkrwf7SZR6fxwTGLtJNRHju7iEEn/fz98
	eBzg==
X-Gm-Message-State: APjAAAXYm/0uGNsMS3WDvuShiJeChA15sUf8flhwNe4W9Rmf9HxL/frg
	U1/T+hCUUckIOKCYwSySmM4eemP2zAQ=
X-Google-Smtp-Source: APXvYqx+ntKKPreas5nRrh229GFyHrOEUt865Mj0XZsUhOXP3/FowogHQ2RO/0NeJGOw7lgmQvJuWA==
X-Received: by 2002:a05:600c:54b:: with SMTP id
	k11mr6548603wmc.63.1579296561369; 
	Fri, 17 Jan 2020 13:29:21 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0BBB19EA1F5BE194E084E5.dip0.t-ipconnect.de.
	[2003:f0:7f0b:bb19:ea1f:5be1:94e0:84e5])
	by smtp.gmail.com with ESMTPSA id
	l7sm36094689wrq.61.2020.01.17.13.29.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 17 Jan 2020 13:29:20 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jan 2020 22:29:02 +0100
Message-Id: <20200117212908.32647-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200117212908.32647-1-schnitzeltony@gmail.com>
References: <20200117212908.32647-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH][v2 04/10] mime.bbclass: rework
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
X-List-Received-Date: Fri, 17 Jan 2020 21:29:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* add a short descriptions of class' use case
* remove checks for update-mime-database - it can be considered available:
  * at build time by PACKAGE_WRITE_DEPS
  * at package upgrade by RDEPENDS chain
    pkg -> shared-mime-info-data -> shared-mime-info
* simplify (accelerate?) xml file extension detection
* run update-mime-database once only at image creation to avoid expensive
  redundant operations
* allow shared-mime-info to inherit mime.bbclass by avoiding circular
  dependencies

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta/classes/mime.bbclass                     | 62 ++++++++++---------
 .../postinst-intercepts/update_mime_database  |  9 +++
 2 files changed, 41 insertions(+), 30 deletions(-)
 create mode 100644 scripts/postinst-intercepts/update_mime_database

diff --git a/meta/classes/mime.bbclass b/meta/classes/mime.bbclass
index 6c7b868f79..c9072adf3b 100644
--- a/meta/classes/mime.bbclass
+++ b/meta/classes/mime.bbclass
@@ -1,46 +1,47 @@
-DEPENDS += "shared-mime-info"
+#
+# This class is used by recipes installing mime types
+#
+
+DEPENDS += "${@bb.utils.contains('BPN', 'shared-mime-info', '', 'shared-mime-info', d)}"
 PACKAGE_WRITE_DEPS += "shared-mime-info-native"
+MIMEDIR = "${datadir}/mime"
 
 mime_postinst() {
-if [ "$1" = configure ]; then
-	UPDATEMIMEDB=`which update-mime-database`
-	if [ -x "$UPDATEMIMEDB" ] ; then
-		echo "Updating MIME database... this may take a while."
-		$UPDATEMIMEDB $D${datadir}/mime
-	else
-		echo "Missing update-mime-database, update of mime database failed!"
-		exit 1
-	fi
+if [ "x$D" != "x" ]; then
+	$INTERCEPT_DIR/postinst_intercept update_mime_database ${PKG} \
+		mlprefix=${MLPREFIX} \
+		mimedir=${MIMEDIR}
+else
+	echo "Updating MIME database... this may take a while."
+	update-mime-database $D${MIMEDIR}
 fi
 }
 
 mime_postrm() {
-if [ "$1" = remove ] || [ "$1" = upgrade ]; then
-	UPDATEMIMEDB=`which update-mime-database`
-	if [ -x "$UPDATEMIMEDB" ] ; then
-		echo "Updating MIME database... this may take a while."
-		$UPDATEMIMEDB $D${datadir}/mime
-	else
-		echo "Missing update-mime-database, update of mime database failed!"
-		exit 1
-	fi
+if [ "x$D" != "x" ]; then
+	$INTERCEPT_DIR/postinst_intercept update_mime_database ${PKG} \
+		mlprefix=${MLPREFIX} \
+		mimedir=${MIMEDIR}
+else
+	echo "Updating MIME database... this may take a while."
+	update-mime-database $D${MIMEDIR}
 fi
 }
 
 python populate_packages_append () {
-    import re
     packages = d.getVar('PACKAGES').split()
     pkgdest =  d.getVar('PKGDEST')
+    mimedir = d.getVar('MIMEDIR')
 
     for pkg in packages:
-        mime_dir = '%s/%s/usr/share/mime/packages' % (pkgdest, pkg)
-        mimes = []
-        mime_re = re.compile(".*\.xml$")
-        if os.path.exists(mime_dir):
-            for f in os.listdir(mime_dir):
-                if mime_re.match(f):
-                    mimes.append(f)
-        if mimes:
+        mime_packages_dir = '%s/%s%s/packages' % (pkgdest, pkg, mimedir)
+        mimes_types_found = False
+        if os.path.exists(mime_packages_dir):
+            for f in os.listdir(mime_packages_dir):
+                if f.endswith('.xml'):
+                    mimes_types_found = True
+                    break
+        if mimes_types_found:
             bb.note("adding mime postinst and postrm scripts to %s" % pkg)
             postinst = d.getVar('pkg_postinst_%s' % pkg)
             if not postinst:
@@ -52,6 +53,7 @@ python populate_packages_append () {
                 postrm = '#!/bin/sh\n'
             postrm += d.getVar('mime_postrm')
             d.setVar('pkg_postrm_%s' % pkg, postrm)
-            bb.note("adding shared-mime-info-data dependency to %s" % pkg)
-            d.appendVar('RDEPENDS_' + pkg, " " + d.getVar('MLPREFIX')+"shared-mime-info-data")
+            if pkg != 'shared-mime-info-data':
+                bb.note("adding shared-mime-info-data dependency to %s" % pkg)
+                d.appendVar('RDEPENDS_' + pkg, " " + d.getVar('MLPREFIX')+"shared-mime-info-data")
 }
diff --git a/scripts/postinst-intercepts/update_mime_database b/scripts/postinst-intercepts/update_mime_database
new file mode 100644
index 0000000000..582d1e162c
--- /dev/null
+++ b/scripts/postinst-intercepts/update_mime_database
@@ -0,0 +1,9 @@
+#!/bin/sh
+#
+# SPDX-License-Identifier: MIT
+#
+# Post-install intercept for mime.bbclass
+
+echo "Updating MIME database... this may take a while."
+update-mime-database $D${mimedir}
+
-- 
2.21.0


