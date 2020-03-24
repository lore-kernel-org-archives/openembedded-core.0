Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 by mx.groups.io with SMTP id smtpd.web10.11277.1585068646393144597
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2020 09:50:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=syntax error for token:  (domain: kernel.crashing.org, ip: 76.164.61.194, mailfrom: mark.hatle@kernel.crashing.org)
Received: from lons-builder.int.hatle.net ([192.40.192.88])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 02OGohjj024688
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2020 11:50:44 -0500
From: "Mark Hatle" <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] qemu.inc: Always disable compile time git updating
Date: Tue, 24 Mar 2020 11:50:43 -0500
Message-Id: <20200324165043.144562-1-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1

If the SRC_URI is switched to be git based, QEMU will automatically update
itself at compile time for select git submodules.  This by passes the
bitbake git fetcher.  These modules are always present in the release
tarballs, so only are problematic when used with git based SRC_URIs.

These switches will have no effect on a tarball based SRC_URI.

Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 meta/recipes-devtools/qemu/qemu.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 7cf436783d..a6205b06c9 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -82,6 +82,8 @@ EXTRA_OECONF = " \
     --disable-strip \
     --disable-werror \
     --extra-cflags='${CFLAGS}' \
+    --with-git=/bin/false \
+    --disable-git-update \
     ${PACKAGECONFIG_CONFARGS} \
     "
 
-- 
2.17.1

