Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 27EEE6B122
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2013 03:30:07 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r683U8pQ025197
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 7 Jul 2013 20:30:08 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Sun, 7 Jul 2013 20:30:07 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 8 Jul 2013 11:30:04 +0800
Message-ID: <e2fa93a52c32522d4831e3d29f87bae4c6625f27.1373253998.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1373253998.git.jackie.huang@windriver.com>
References: <cover.1373253998.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] glib: fix the python script munging for cross compile
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
X-List-Received-Date: Mon, 08 Jul 2013 03:30:07 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Fix the munging of python scripts so that they'll work
on the target, we don't want ${PYTHON}, because that is
the path on the host, not the target.

Signed-off-by: David Borman <david.borman@windriver.com>
Signed-off-by: Jesse Zhang <sen.zhang@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../glib-2.0/glib-2.0/glib2-python-ref.patch       |   33 ++++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.36.2.bb      |    1 +
 2 files changed, 34 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/glib2-python-ref.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/glib2-python-ref.patch b/meta/recipes-core/glib-2.0/glib-2.0/glib2-python-ref.patch
new file mode 100644
index 0000000..d2f8d44
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/glib2-python-ref.patch
@@ -0,0 +1,33 @@
+glib: fix the python script munging for cross compile
+
+Fix the munging of python scripts so that they'll work
+on the target, we don't want ${PYTHON}, because that is
+the path on the host, not the target.
+
+Upstream-status: Inappropriate [ embedded specific ]
+
+Signed-off-by: David Borman <david.borman@windriver.com>
+Signed-off-by: Jesse Zhang <sen.zhang@windriver.com>
+
+--- glib-2.26.0/glib/Makefile.am
++++ glib-2.26.0/glib/Makefile.am
+@@ -413,7 +413,7 @@
+ 	  mv -f "$(DESTDIR)$(bindir)/$$sf" "$(DESTDIR)$(bindir)/$$sf".tmp \
+ 	  && sed < "$(DESTDIR)$(bindir)/$$sf".tmp > "$(DESTDIR)$(bindir)/$$sf" \
+ 	    -e '1,24s|^ *#@PKGINSTALL_CONFIGVARS_IN24LINES@|  ${CONFIGVARS}|' \
+-	    -e '1,1s|#! /usr/bin/env python\([0-9]\+\(\.[0-9]\+\)\?\)\?|#!${PYTHON}|' \
++	    -e '1,1s|#! /usr/bin/env python\([0-9]\+\(\.[0-9]\+\)\?\)\?|#!/usr/bin/python|' \
+ 	  || exit $$? ; \
+ 	  chmod a+x $(DESTDIR)$(bindir)/$$sf ; \
+ 	  rm -f "$(DESTDIR)$(bindir)/$$sf".tmp ; \
+--- glib-2.26.0/glib/Makefile.in
++++ glib-2.26.0/glib/Makefile.in
+@@ -1759,7 +1759,7 @@
+ @OS_UNIX_TRUE@	  mv -f "$(DESTDIR)$(bindir)/$$sf" "$(DESTDIR)$(bindir)/$$sf".tmp \
+ @OS_UNIX_TRUE@	  && sed < "$(DESTDIR)$(bindir)/$$sf".tmp > "$(DESTDIR)$(bindir)/$$sf" \
+ @OS_UNIX_TRUE@	    -e '1,24s|^ *#@PKGINSTALL_CONFIGVARS_IN24LINES@|  ${CONFIGVARS}|' \
+-@OS_UNIX_TRUE@	    -e '1,1s|#! /usr/bin/env python\([0-9]\+\(\.[0-9]\+\)\?\)\?|#!${PYTHON}|' \
++@OS_UNIX_TRUE@	    -e '1,1s|#! /usr/bin/env python\([0-9]\+\(\.[0-9]\+\)\?\)\?|#!/usr/bin/python|' \
+ @OS_UNIX_TRUE@	  || exit $$? ; \
+ @OS_UNIX_TRUE@	  chmod a+x $(DESTDIR)$(bindir)/$$sf ; \
+ @OS_UNIX_TRUE@	  rm -f "$(DESTDIR)$(bindir)/$$sf".tmp ; \
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.36.2.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.36.2.bb
index d9d8932..ffe34ac 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.36.2.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.36.2.bb
@@ -14,6 +14,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://fix-conflicting-rand.patch \
            file://Makefile-ptest.patch \
            file://add-march-i486-into-CFLAGS-automatically.patch \
+           file://glib2-python-ref.patch \
            file://run-ptest \
           "
 
-- 
1.7.4.1


