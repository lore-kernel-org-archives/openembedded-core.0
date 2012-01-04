Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RiVF9-0007kA-O0
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 19:07:19 +0100
Received: by ggnh1 with SMTP id h1so10411996ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jan 2012 09:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	bh=hyEavl/Fr5FhgixqeQuRlT9B2xEo1qIrDfJfMRUTteU=;
	b=W0A1NAscBjfkpC9/+o2wNJ6tNmz86WfX2oUSuZK0VoHbveHKH/2j0coIVBNZ3Mo37+
	z0p88miVSYsBIGTYOdxe07GFvYrDz/VpU1MoQbYFHMg9/D5ZYZBTHj6Cq/SFEbkzcQUg
	g+q4CwTuIBR37PdzJW/IL/SL5vAuYggo+lWAE=
Received: by 10.50.214.39 with SMTP id nx7mr7661199igc.6.1325699997358;
	Wed, 04 Jan 2012 09:59:57 -0800 (PST)
Received: from localhost.localdomain (ip24-251-167-38.ph.ph.cox.net.
	[24.251.167.38])
	by mx.google.com with ESMTPS id r5sm83084319igl.3.2012.01.04.09.59.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 04 Jan 2012 09:59:56 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Jan 2012 11:00:00 -0700
Message-Id: <1325700000-7646-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.7.8.1
Subject: [PATCH] opkg-utils: use /usr/bin/env python
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
X-List-Received-Date: Wed, 04 Jan 2012 18:07:19 -0000

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 .../opkg-utils/opkg-utils/shebang.patch            |   46 ++++++++++++++++++++
 meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb |    3 +-
 2 files changed, 48 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/shebang.patch

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/shebang.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/shebang.patch
new file mode 100644
index 0000000..f6a2ef9
--- /dev/null
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils/shebang.patch
@@ -0,0 +1,46 @@
+Use python via the PATH, rather than hardcoding /usr/bin/python
+
+Upstream-Status: Pending
+
+Signed-off-by: Christopher Larson <kergoth@gmail.com>
+
+--- opkg-utils.orig/opkg-list-fields
++++ opkg-utils/opkg-list-fields
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python
++#!/usr/bin/env python
+ 
+ import sys, opkg
+ 
+--- opkg-utils.orig/opkg-make-index
++++ opkg-utils/opkg-make-index
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python
++#!/usr/bin/env python
+ 
+ import sys, os, posixpath
+ from glob import glob
+--- opkg-utils.orig/opkg-show-deps
++++ opkg-utils/opkg-show-deps
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python
++#!/usr/bin/env python
+ 
+ import sys, os, posixpath
+ from glob import glob
+--- opkg-utils.orig/opkg-unbuild
++++ opkg-utils/opkg-unbuild
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python
++#!/usr/bin/env python
+ 
+ import sys, os, re
+ 
+--- opkg-utils.orig/opkg-update-index
++++ opkg-utils/opkg-update-index
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python2.1
++#!/usr/bin/env python
+ 
+ import sys, os
+ from glob import glob
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb
index 9b94aff..9702131 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb
@@ -8,13 +8,14 @@ RDEPENDS_${PN} = "python"
 RDEPENDS_${PN}_virtclass-native = ""
 SRCREV = "4747"
 PV = "0.1.8+svnr${SRCPV}"
-PR = "r6"
+PR = "r7"
 
 SRC_URI = "svn://svn.openmoko.org/trunk/src/host/;module=opkg-utils;proto=http \
            file://index-ignore-filenotfound.patch \
            file://mtime-int.patch \
            file://add-license-field.patch \
            file://arfile_header_split.patch \
+           file://shebang.patch \
            "
 
 S = "${WORKDIR}/opkg-utils"
-- 
1.7.8.1



