Received: from mail-wi0-f176.google.com ([209.85.212.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UQb5P-0002C4-70
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Apr 2013 12:20:23 +0200
Received: by mail-wi0-f176.google.com with SMTP id hm14so1402780wib.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2013 03:02:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=38/qV6mEjr2aZTe0v1jEHMFyQcW7BiKBp9hwvXzN7Ag=;
	b=RqGDYwYVhxSw2Gq4DcS91Jy+zyKt5KkvSdcpUoWEKQerI17UrXMy1IqsrtHdHAk+hn
	e7lNOvKL1SczAm0fxfQ3vc6zyESf0pL3k7El0JLNoGf5ZcZx1ebEDlv22sXuz3PZZOc6
	G7mmaOKbIVz3f7+mTEzag9xuXSxa/4v/w31SHrJyN71pKrGgYV4iLn8NCU+usoXToqCE
	smnoN8eI3i5XsM/AOsho7EwFoBhlUciSjBaf5D3kEYU0EE8eFcFfPHYyDsCJl6L48p0C
	7cYGFasaFBJTQR+msF2JIQnmiD7QK1Rm95IH6LLTeKjb/XZ8fFjfVVgcDl4+iobr0IKW
	H/KA==
X-Received: by 10.180.81.232 with SMTP id d8mr2847730wiy.25.1365760958911;
	Fri, 12 Apr 2013 03:02:38 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id bq19sm2580609wib.7.2013.04.12.03.02.37
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 12 Apr 2013 03:02:37 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Apr 2013 10:59:51 +0100
Message-Id: <1365760791-7647-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQmTLcFytU9QOEcHPUudQCOd/Esw5lylmWITy6yHJLVhOV/r1to9VX9+f6at8y+N76Rx4XgB
Subject: [PATCH] xmodmap: fix compile with gcc 4.8
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Apr 2013 10:20:32 -0000

With gcc 4.8 there are compile errors:

xmodmap.c:289:5: error: implicit declaration of function 'asprintf' [-Werror=implicit-function-declaration]
(and more)

These have been fixed upstream so take the patch from git until 1.0.8 is
released.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../xorg-app/xmodmap/gnu-source.patch              |   60 ++++++++++++++++++++
 meta/recipes-graphics/xorg-app/xmodmap_1.0.7.bb    |    2 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-app/xmodmap/gnu-source.patch

diff --git a/meta/recipes-graphics/xorg-app/xmodmap/gnu-source.patch b/meta/recipes-graphics/xorg-app/xmodmap/gnu-source.patch
new file mode 100644
index 0000000..84bd973
--- /dev/null
+++ b/meta/recipes-graphics/xorg-app/xmodmap/gnu-source.patch
@@ -0,0 +1,60 @@
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 42f99a7a7b836f6f9704a7b1747eb722c93446ec Mon Sep 17 00:00:00 2001
+From: Alan Coopersmith <alan.coopersmith@oracle.com>
+Date: Mon, 23 Apr 2012 14:28:39 +0000
+Subject: include config.h before stdio.h & other system headers
+
+Ensures definitions like _GNU_SOURCE are visible when needed.
+
+Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
+Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
+---
+diff --git a/exec.c b/exec.c
+index dbcb669..419b10e 100644
+--- a/exec.c
++++ b/exec.c
+@@ -54,6 +54,10 @@ from The Open Group.
+  * original xmodmap, written by David Rosenthal, of Sun Microsystems.
+  */
+ 
++#ifdef HAVE_CONFIG_H
++# include "config.h"
++#endif
++
+ #include <X11/Xos.h>
+ #include <X11/Xlib.h>
+ #include <stdio.h>
+diff --git a/pf.c b/pf.c
+index 0eb0f55..3f0c3f4 100644
+--- a/pf.c
++++ b/pf.c
+@@ -26,6 +26,10 @@ from The Open Group.
+ 
+ */
+ 
++#ifdef HAVE_CONFIG_H
++# include "config.h"
++#endif
++
+ #include <X11/Xos.h>
+ #include <X11/Xlib.h>
+ #include <stdio.h>
+diff --git a/xmodmap.c b/xmodmap.c
+index 58a8e70..0f89629 100644
+--- a/xmodmap.c
++++ b/xmodmap.c
+@@ -26,6 +26,10 @@ from The Open Group.
+ 
+ */
+ 
++#ifdef HAVE_CONFIG_H
++# include "config.h"
++#endif
++
+ #include <X11/Xos.h>
+ #include <X11/Xlib.h>
+ #include <stdio.h>
+--
+cgit v0.9.0.2-2-gbebe
\ No newline at end of file
diff --git a/meta/recipes-graphics/xorg-app/xmodmap_1.0.7.bb b/meta/recipes-graphics/xorg-app/xmodmap_1.0.7.bb
index fab1b16..573eecb 100644
--- a/meta/recipes-graphics/xorg-app/xmodmap_1.0.7.bb
+++ b/meta/recipes-graphics/xorg-app/xmodmap_1.0.7.bb
@@ -14,5 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eef098b27f09d0ac39268df0cc2c00b5"
 PR = "${INC_PR}.0"
 PE = "1"
 
+SRC_URI += "file://gnu-source.patch"
+
 SRC_URI[md5sum] = "d9b65f6881afe0d6d9863b30e1081bde"
 SRC_URI[sha256sum] = "ef22ede9c4a3c720da539292c6911515a8408e618e0dec6aa2196ee2153de4b5"
-- 
1.7.10.4



