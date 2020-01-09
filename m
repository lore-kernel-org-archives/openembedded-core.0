Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id 97E287FDF6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2020 20:26:37 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id 20so4267748wmj.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2020 12:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=/Qskxg+s7l9vOYcqxO7N3Osgq4785cKCkkiCf2SJogQ=;
	b=sn/vgR1wFHbI9x7EfImoillRZKd3JDg1IudWR+VepW/O5IyIo191d9p6Dc/n7vXdRt
	Xc0TkuLFMFzpLGowEfy1We1ytIrOXCXOknH1nWpzN/yVB79BOB22BrCndjrBPL2BqP+O
	pZWk3XkvhOZzsmctZqgSnLJjxFtexc3cdsFZs6ffKpQQKmTqZlpFmSh7kPWx1f17PDhZ
	44HHg2+UoZnx5ug1w2STrOOg4HGpVLDZBze02Pv3H2wI99jrvYdHAPz8+jqeqqNZBD6p
	qXHeU4JcKdQP1Ngav2bLPpaA+GTaNRsBBnc2UVwf4S0GI+goxIL25bWc6yZ9aX+bS5F3
	6ebA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=/Qskxg+s7l9vOYcqxO7N3Osgq4785cKCkkiCf2SJogQ=;
	b=QWmZnkf8ZABNEbKXl21t2jACMyw6S4J/In3V8dcgCSrHP0magL/uryZYqWZgA+kZvm
	lSXOHRZC5brmjCm5wRzQcyGxnWm5dgNlDrsob1xmj6ByvL1MbpH8hdLtQrL3d3EpYiz6
	tFp+GESwZqSw1ruTXjOiY2C2puwU//gI5RNZ/1jw3Kt4XOB03ko8NxOsGV3cHi9xgNgk
	r1DR+dOtEtt/a3gXr/sl/Aq68zMC5wNXzZ6sSd6SsbFYDXzW13pOqnNEPJTEIijlKvlE
	sEW982yGBHus1FyTjqX41D5r0BMnOmOdxvo4mAOEicLZLBqBwbEU1pUZdSeCo8aeKEup
	E+kw==
X-Gm-Message-State: APjAAAUpZL3KjARujJkxj+wqFPmvOiVUk8760iepYs/JJkxDcEFTpUgg
	r7zRFeuJfGIi8pioiBxHcnC1zPY0GbU=
X-Google-Smtp-Source: APXvYqxeKqn5m1lE9WxJPGAaLS9QfHpVXouzUwaMmOVucEiuFITL9t9BdP0HydZ5KkiJUjLlJPKGAw==
X-Received: by 2002:a7b:cb91:: with SMTP id m17mr6832271wmi.146.1578601598055; 
	Thu, 09 Jan 2020 12:26:38 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0446528B12EBEBA10192C2.dip0.t-ipconnect.de.
	[2003:f0:7f04:4652:8b12:ebeb:a101:92c2])
	by smtp.gmail.com with ESMTPSA id z6sm9149986wrw.36.2020.01.09.12.26.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 09 Jan 2020 12:26:37 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jan 2020 21:26:17 +0100
Message-Id: <20200109202623.28936-6-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200109202623.28936-1-schnitzeltony@gmail.com>
References: <20200109202623.28936-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 05/11] mime.bbclass: rework
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
X-List-Received-Date: Thu, 09 Jan 2020 20:26:37 -0000
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
 meta/classes/mime.bbclass                     | 60 ++++++++++---------
 .../postinst-intercepts/update_mime_database  |  9 +++
 2 files changed, 40 insertions(+), 29 deletions(-)
 create mode 100644 scripts/postinst-intercepts/update_mime_database

diff --git a/meta/classes/mime.bbclass b/meta/classes/mime.bbclass
index 6c7b868f79..9018bbc449 100644
--- a/meta/classes/mime.bbclass
+++ b/meta/classes/mime.bbclass
@@ -1,29 +1,29 @@
-DEPENDS += "shared-mime-info"
+#
+# This class is used by recipes installing mime types
+#
+
+DEPENDS += "${@bb.utils.contains('BPN', 'shared-mime-info', '', 'shared-mime-info', d)}"
 PACKAGE_WRITE_DEPS += "shared-mime-info-native"
 
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
+		mimedir=${mimedir}
+else
+	echo "Updating MIME database... this may take a while."
+	update-mime-database $D${mimedir}
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
+		mimedir=${mimedir}
+else
+	echo "Updating MIME database... this may take a while."
+	update-mime-database $D${mimedir}
 fi
 }
 
@@ -31,16 +31,17 @@ python populate_packages_append () {
     import re
     packages = d.getVar('PACKAGES').split()
     pkgdest =  d.getVar('PKGDEST')
+    mimedir = d.getVar('mimedir')
 
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


