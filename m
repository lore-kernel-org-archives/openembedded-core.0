Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SBDZO-0007ue-81
	for openembedded-core@lists.openembedded.org;
	Sat, 24 Mar 2012 00:06:54 +0100
Received: by wera1 with SMTP id a1so3019861wer.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 15:57:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=Sbyacx6V0LffVhm3w9ghVpW9SXhxenU+Q7rcm0V4XjA=;
	b=O5QD5Jl5sZBCCWu9i8xV4BhkciZ0AxtqjzJn094WzuIebLzs9H/29OE/IeIDVKiFCV
	zXdRJWCdF/Njo1co4C3GhGedl2HVVJGulDS0sLXfK6/EwkDhOJlUImXOv+kQCqWIlRJk
	pmPwVc9YjNNmenP06KgOkJsgCJDjbOxGs+w4df5JGYiQkhE4RXrOVUy/PIWAlAM7TtpM
	2dIWudjL9Tlqu7LxoL2NUGtdMhCZbEZyQzdzoiJrnBem0wkoBIDY2O6cl6loRJ30A1WK
	LYO2faD/w74N9vWbj/EO1drm1nebIb+GvAt1JxSTOAt+XgFYHUOyuY5mDUXGlx7L3RF7
	h6VA==
MIME-Version: 1.0
Received: by 10.180.91.10 with SMTP id ca10mr702103wib.17.1332543477866;
	Fri, 23 Mar 2012 15:57:57 -0700 (PDT)
Received: from localhost.localdomain ([79.117.107.69])
	by mx.google.com with ESMTPS id gg2sm28926628wib.7.2012.03.23.15.57.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Mar 2012 15:57:57 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Sat, 24 Mar 2012 00:57:50 +0200
Message-Id: <6d8cb56a00a2d0f140b6b569f8577f96c6113e14.1332543292.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1332543292.git.andrei@gherzan.ro>
References: <cover.1332543292.git.andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQkFZXlI5O8SmvRxL6Mj9gpxsZ5AdsjK9D6ZynpnmjR2t71uI/rkN3yBTbMRxU8sHDNNptWJ
Subject: [PATCH 1/2] gdbm: Activate -enable-libgdbm-compat and add symlinks to headers in include/gdbm
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
X-List-Received-Date: Fri, 23 Mar 2012 23:06:54 -0000

ndbm.h is needed by python for dbm module. This is why -enable-libgdbm-compat was added
to configure.
The second change is because python is looking for the gdbm headers in include/gdbm.
The easiest way to solve this issue is to add symlinks in include/gdbm.

[YOCTO #1937]

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/recipes-support/gdbm/gdbm_1.10.bb |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-support/gdbm/gdbm_1.10.bb b/meta/recipes-support/gdbm/gdbm_1.10.bb
index 9b2fde4..e9fef6e 100644
--- a/meta/recipes-support/gdbm/gdbm_1.10.bb
+++ b/meta/recipes-support/gdbm/gdbm_1.10.bb
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



