Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id E4E097F2DD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2019 15:10:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 464Bcp2F2cz3P
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2019 17:10:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1565277004;
	bh=A81hPephn8fi2t9eqCuspjLNgFOfTxuYSFJYop0bH2Y=;
	h=From:To:Subject:Date:From;
	b=FfJQ6fIaAf7jEYer02YLfgoATf+kMo/SSDI7rfMD9VcMYFAhlw1ah6pu+hMIkS4uB
	onw+4MKz7uBAQVZuXdNKF243LDw73U2iTieqgDMLpuPhKpGQnMzfBMT5mhaUSlSX/A
	TBT6YdnN5rmAN+PwsW6L+DdsPbN1nMrCY28gXkFZ2d2ThXNsSvF1K8DP+azf6H9E0l
	O7kWAWKMYMDzjg+NvwDIi7PX1OoL+ZeQWEoiSjAe4RyiXa3O1Tqu+srf5f9GXrtDnv
	fP929aXapgoOqyxWwiCGNXzXVfAEM2+mT/sOroMw1/AEEuN+hV/aqXylIh1JimDAsh
	52P0vk7nT2W0mcymdCiR+5WxY1+wPwYhTdwVQ9FgXc2uwVSygZgMWB0ckIIw46JJ/0
	Q6GRJtcqXHPgRAkpZ0i49317MgoempeUiDByZTeYGeUsfFqhq010sUx2rgCaOYHhgf
	A5LFWDtqHpbvvC6AI7UxyEWzoI+HDKLEWRuto/zqCcuy430WOoIbmcPi4fJFiI0Kyw
	kpDQnTIt7JddUK4GMqIHXFSoGskicEzrc7dZSvAPJNUZCzQWMJDmBiZYU8kYdy8jzM
	9xF0L1hyt90HJlmEfUX/5FFwjYs05BC8f0xtsMMqu0mv234wUa3pfQLlVxs7nyv22f
	rB/Xt0aOz7knuT6dH5p53DOE=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Aug 2019 18:09:54 +0300
Message-Id: <20190808150954.4959-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH] screen: Backport fix for an implicit function declaration
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
X-List-Received-Date: Thu, 08 Aug 2019 15:10:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...0001-Remove-more-compatibility-stuff.patch | 31 +++++++++++++++++++
 meta/recipes-extended/screen/screen_4.6.2.bb  |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-extended/screen/screen/0001-Remove-more-compatibility-stuff.patch

diff --git a/meta/recipes-extended/screen/screen/0001-Remove-more-compatibility-stuff.patch b/meta/recipes-extended/screen/screen/0001-Remove-more-compatibility-stuff.patch
new file mode 100644
index 0000000000..1413724d07
--- /dev/null
+++ b/meta/recipes-extended/screen/screen/0001-Remove-more-compatibility-stuff.patch
@@ -0,0 +1,31 @@
+This fixes
+../screen-4.6.2/pty.c: In function 'OpenPTY':
+../screen-4.6.2/pty.c:328:7: warning: implicit declaration of function 'openpty'; did you mean 'openat'? [-Wimplicit-function-declaration]
+   if (openpty(&f, &s, TtyName, NULL, NULL) != 0)
+       ^~~~~~~
+
+Signed-off-by: Amadeusz Sławiński <amade@asmblr.net>
+Signed-off-by: Adrian Bunk <bunk@stusta.de>
+Upstream-Status: Backport
+
+---
+ pty.c | 6 +-----
+ 1 file changed, 1 insertion(+), 5 deletions(-)
+
+diff --git a/pty.c b/pty.c
+index 1c0660e..502338f 100644
+--- a/pty.c
++++ b/pty.c
+@@ -47,11 +47,7 @@
+ # include <sys/ttold.h>
+ #endif
+ 
+-#ifdef ISC
+-# include <sys/tty.h>
+-# include <sys/sioctl.h>
+-# include <sys/pty.h>
+-#endif
++#include <pty.h>
+ 
+ #ifdef sgi
+ # include <sys/sysmacros.h>
diff --git a/meta/recipes-extended/screen/screen_4.6.2.bb b/meta/recipes-extended/screen/screen_4.6.2.bb
index 375dce949d..24ec751070 100644
--- a/meta/recipes-extended/screen/screen_4.6.2.bb
+++ b/meta/recipes-extended/screen/screen_4.6.2.bb
@@ -24,6 +24,7 @@ SRC_URI = "${GNU_MIRROR}/screen/screen-${PV}.tar.gz \
            file://0002-comm.h-now-depends-on-term.h.patch \
            file://0001-fix-for-multijob-build.patch \
            file://0001-configure.ac-fix-configure-failed-while-build-dir-ha.patch \
+           file://0001-Remove-more-compatibility-stuff.patch \
           "
 
 SRC_URI[md5sum] = "a0f529d3333b128dfaa324d978ba73a8"
-- 
2.17.1


