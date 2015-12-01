Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id 21914606D1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Dec 2015 21:41:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 23E7D2602EC
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Dec 2015 21:41:00 +0000
Message-Id: <1449006060-24284-1-git-send-email-joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.4.3
Subject: [PATCH] cracklib: fix for base_libdir == libdir
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
X-List-Received-Date: Tue, 01 Dec 2015 21:41:05 -0000

Don't try and move the python packages from base_libdir to libdir
if they are the same location.

Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
---
 meta/recipes-extended/cracklib/cracklib_2.9.5.bb | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/cracklib/cracklib_2.9.5.bb b/meta/recipes-extended/cracklib/cracklib_2.9.5.bb
index c0ffe33..23f259c 100644
--- a/meta/recipes-extended/cracklib/cracklib_2.9.5.bb
+++ b/meta/recipes-extended/cracklib/cracklib_2.9.5.bb
@@ -28,10 +28,13 @@ do_install_append() {
 	src_dir="${D}${base_libdir}/${PYTHON_DIR}/site-packages"
 	rm -f $src_dir/*.pyo
 	rm -f $src_dir/test_cracklib.py
-	# Move python files from ${base_libdir} to ${libdir} since used --libdir=${base_libdir}
-	install -d -m 0755 ${D}${PYTHON_SITEPACKAGES_DIR}/
-	mv $src_dir/* ${D}${PYTHON_SITEPACKAGES_DIR}
-	rm -fr ${D}${base_libdir}/${PYTHON_DIR}
+
+	if [ "${base_libdir}" != "${libdir}" ] ; then
+	   # Move python files from ${base_libdir} to ${libdir} since used --libdir=${base_libdir}
+	   install -d -m 0755 ${D}${PYTHON_SITEPACKAGES_DIR}/
+	   mv $src_dir/* ${D}${PYTHON_SITEPACKAGES_DIR}
+	   rm -fr ${D}${base_libdir}/${PYTHON_DIR}
+	fi
 }
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.4.3


