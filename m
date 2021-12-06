Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 752E4C433F5
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 13:06:39 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web09.50955.1638795997257052991
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 05:06:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CQ7cP2MK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id
 k37-20020a05600c1ca500b00330cb84834fso10378035wms.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 05:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3y9y0jC6gLj0v0YgESPnu0ysNhZjX3RyF5t+6yNuYlw=;
        b=CQ7cP2MKQ/j6Nawm+ygxS6AagnPxYfgwQ9R4fSO1Qg/3v9b9sJAu8R/vICnXEo43jH
         LlchMiUylIieK/EZgJ4dWf+ZL6eVY7M3i7hdn/4DLOotOhDW8rQE5uvdmcp6Q/OGoexw
         Lvr3lmZoPEVOCthrRgrUe6GUC/FZ95fdnBAoo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3y9y0jC6gLj0v0YgESPnu0ysNhZjX3RyF5t+6yNuYlw=;
        b=XT2XvDjfkNQaP833uSOqyK9vizkrHZ9OPV9DA3gpj0biJIgyIJoY+VhllrbBCKzeB4
         y1DJJAfRpxP9a6dDEc73y2YnC4EyvnpivXiGZhrnpXUM+Ob8htdKYFu/c14hHzXFibZ8
         njroth2jItjnviCJKiiQjmVwl84/iG6Jf75nf510fPQ9lDeVLe2Y2Sg/K1YqPqKYdHrN
         DUCkA/gkm7r1MRZTog/2kSkuL7ojJD4O5+eoexLo/iZgZ2Ic/lgnoK9bNQW+wwfgq55y
         itnA2Ym11LAqYSGom76EYhPAHUH01AglU2vPaIRf+UMofLPNjlO9W7j3uiTn0HLIexmy
         9Xbg==
X-Gm-Message-State: AOAM533mgKAzB9BMflWI9VoHjTmMByydNWiEhGj8BHaGXFwQYyL37srI
	Zoj0JOJtFf6e4RYeTmbCSirjBbhKnsDFgQ==
X-Google-Smtp-Source: 
 ABdhPJzr4VufYqCUE+OJVoav2GB5x9ryslWSWPA6szdU+D8RhCExzCcIFTpXWqumLud+woWmVtcJAg==
X-Received: by 2002:a05:600c:40b:: with SMTP id
 q11mr38340822wmb.185.1638795995265;
        Mon, 06 Dec 2021 05:06:35 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:50e7:dab5:2141:24aa])
        by smtp.gmail.com with ESMTPSA id
 h7sm10761409wrt.64.2021.12.06.05.06.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 05:06:34 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] minicom: Upgrade 2.7.1 -> 2.8
Date: Mon,  6 Dec 2021 13:06:34 +0000
Message-Id: <20211206130634.500693-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Dec 2021 13:06:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159227

* Update the url to use .bz2 instead of .gz compression.
* Drop three patches merged upstream
* Submit two patches upstream
* Drop the musl patch since half was already applied upstream and
  musl now builds fine without the other piece

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...Fix-build-issus-surfaced-due-to-musl.patch | 47 -------------------
 ...ix-minicom-h-v-return-value-is-not-0.patch | 32 ++++++-------
 .../minicom/allow.to.disable.lockdev.patch    | 17 +++++--
 .../{minicom_2.7.1.bb => minicom_2.8.bb}      | 11 ++---
 4 files changed, 31 insertions(+), 76 deletions(-)
 delete mode 100644 meta/recipes-extended/minicom/minicom/0001-Fix-build-issus-surfaced-due-to-musl.patch
 rename meta/recipes-extended/minicom/{minicom_2.7.1.bb => minicom_2.8.bb} (68%)

diff --git a/meta/recipes-extended/minicom/minicom/0001-Fix-build-issus-surfaced-due-to-musl.patch b/meta/recipes-extended/minicom/minicom/0001-Fix-build-issus-surfaced-due-to-musl.patch
deleted file mode 100644
index fec67fdd3fd..00000000000
--- a/meta/recipes-extended/minicom/minicom/0001-Fix-build-issus-surfaced-due-to-musl.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From d62a5862e26ed3fc58d789efe9c40ca6c911d36b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 31 Aug 2015 22:35:31 +0000
-Subject: [PATCH] Fix build issus surfaced due to musl
-
-src/getsdir.h:28:14: error: 'MAXNAMLEN' undeclared here (not in a function)
-   char fname[MAXNAMLEN + 1];  /* filename + terminating null */
-
-src/dial.c:352:22: error: 'KIOCSOUND' undeclared (first use in this function)
-|      ioctl(consolefd, KIOCSOUND, k);
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- src/dial.c    | 2 +-
- src/getsdir.c | 1 +
- 2 files changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/src/dial.c b/src/dial.c
-index a90c1d2..bf02574 100644
---- a/src/dial.c
-+++ b/src/dial.c
-@@ -39,7 +39,7 @@
- #include "intl.h"
- 
- #ifdef VC_MUSIC
--#  if defined(__GLIBC__)
-+#  if defined(__GLIBC__) || defined(__linux__)
- #    include <sys/ioctl.h>
- #    include <sys/kd.h>
- #    include <sys/time.h>
-diff --git a/src/getsdir.c b/src/getsdir.c
-index 2195b27..b61a361 100644
---- a/src/getsdir.c
-+++ b/src/getsdir.c
-@@ -30,6 +30,7 @@
- #include <string.h>
- #include <sys/types.h>
- #include <sys/stat.h>
-+#include <sys/param.h>
- #include <errno.h>
- 
- #include "getsdir.h"
--- 
-2.5.1
-
diff --git a/meta/recipes-extended/minicom/minicom/0001-fix-minicom-h-v-return-value-is-not-0.patch b/meta/recipes-extended/minicom/minicom/0001-fix-minicom-h-v-return-value-is-not-0.patch
index bd8261c979d..9e67126f3e1 100644
--- a/meta/recipes-extended/minicom/minicom/0001-fix-minicom-h-v-return-value-is-not-0.patch
+++ b/meta/recipes-extended/minicom/minicom/0001-fix-minicom-h-v-return-value-is-not-0.patch
@@ -1,35 +1,33 @@
-Subject: [PATCH] fix minicom -h/-v return value is not 0
+Exit normally for help/verison options
 
-Upstream-Status: Pending
-
-Signed-off-by: Lu Chong <Chong.Lu@windriver.com>
+If -v or -h is used for the help/version information, it is a normal exit situation,
+not an error condition. Sometimes these are used as a simple operation test of the
+resulting binary so the exit code does matter.
 
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Upstream-Status: Submitted [https://salsa.debian.org/minicom-team/minicom/-/merge_requests/14]
 ---
  src/minicom.c |    6 ++----
  1 file changed, 2 insertions(+), 4 deletions(-)
 
-diff --git a/src/minicom.c b/src/minicom.c
-index e1a557b..730da7c 100644
---- a/src/minicom.c
-+++ b/src/minicom.c
-@@ -1166,15 +1166,13 @@ int main(int argc, char **argv)
- 	         "modify it under the terms of the GNU General Public License\n"
+Index: minicom-2.8/src/minicom.c
+===================================================================
+--- minicom-2.8.orig/src/minicom.c
++++ minicom-2.8/src/minicom.c
+@@ -1257,14 +1257,14 @@ int main(int argc, char **argv)
+                  "modify it under the terms of the GNU General Public License\n"
                   "as published by the Free Software Foundation; either version\n"
-                  "2 of the License, or (at your option) any later version.\n\n");
+                  "2 of the License, or (at your option) any later version.\n\n"));
 -          exit(1);
--          break;
 +          exit(0);
+           break;
          case 's': /* setup mode */
            dosetup = 1;
            break;
          case 'h':
            helpthem();
 -          exit(1);
--          break;
 +          exit(0);
+           break;
          case 'p': /* Pseudo terminal to use. */
            if (strncmp(optarg, "/dev/", 5) == 0)
-             optarg += 5;
--- 
-1.7.9.5
-
diff --git a/meta/recipes-extended/minicom/minicom/allow.to.disable.lockdev.patch b/meta/recipes-extended/minicom/minicom/allow.to.disable.lockdev.patch
index f5c08896ff5..39dc5c04925 100644
--- a/meta/recipes-extended/minicom/minicom/allow.to.disable.lockdev.patch
+++ b/meta/recipes-extended/minicom/minicom/allow.to.disable.lockdev.patch
@@ -1,10 +1,19 @@
-Upstream-Status: Pending
+configure: Allow lockdev to be disabled
+
+When the pkgconfig dependencies may be present, it is useful to be
+able to explictly disable the lockdev dependency. This adds such an
+option.
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Upstream-Status: Submitted [https://salsa.debian.org/minicom-team/minicom/-/merge_requests/14]
 
---- a/configure.in	2013-02-06 18:18:13.000000000 +0100
-+++ b/configure.in	2013-07-21 15:31:27.614828894 +0200
-@@ -40,7 +40,13 @@
+Index: minicom-2.8/configure.ac
+===================================================================
+--- minicom-2.8.orig/configure.ac
++++ minicom-2.8/configure.ac
+@@ -43,7 +43,13 @@ if test "x$enable_socket" = xyes; then
  fi
  
  PKG_PROG_PKG_CONFIG
diff --git a/meta/recipes-extended/minicom/minicom_2.7.1.bb b/meta/recipes-extended/minicom/minicom_2.8.bb
similarity index 68%
rename from meta/recipes-extended/minicom/minicom_2.7.1.bb
rename to meta/recipes-extended/minicom/minicom_2.8.bb
index 4f715cbc714..3abd8a41ca9 100644
--- a/meta/recipes-extended/minicom/minicom_2.7.1.bb
+++ b/meta/recipes-extended/minicom/minicom_2.8.bb
@@ -7,17 +7,12 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=420477abc567404debca0a2a1cb6b645 \
                     file://src/minicom.h;beginline=1;endline=12;md5=a58838cb709f0db517f4e42730c49e81"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/m/${BPN}/${BPN}_${PV}.orig.tar.gz \
+SRC_URI = "${DEBIAN_MIRROR}/main/m/${BPN}/${BPN}_${PV}.orig.tar.bz2 \
            file://allow.to.disable.lockdev.patch \
            file://0001-fix-minicom-h-v-return-value-is-not-0.patch \
-           file://0001-Fix-build-issus-surfaced-due-to-musl.patch \
-           file://0001-Drop-superfluous-global-variable-definitions.patch \
-           file://0002-Drop-superfluous-global-variable-definitions.patch \
-           file://0003-Drop-superfluous-global-variable-definitions.patch \
-          "
+"
 
-SRC_URI[md5sum] = "9021cb8c5445f6e6e74b2acc39962d62"
-SRC_URI[sha256sum] = "532f836b7a677eb0cb1dca8d70302b73729c3d30df26d58368d712e5cca041f1"
+SRC_URI[sha256sum] = "38cea30913a20349326ff3f1763ee1512b7b41601c24f065f365e18e9db0beba"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[lockdev] = "--enable-lockdev,--disable-lockdev,lockdev"
-- 
2.32.0


