Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4538.1795813561620049510
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 13:06:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Ykx7CNEL;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20261127210559d7a2075bd0000207f7-_5hqyx@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20261127210559d7a2075bd0000207f7
        for <openembedded-core@lists.openembedded.org>;
        Fri, 27 Nov 2026 22:05:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=i/CChn+Uvojh5OIp1Kgdb986rsUtLK9mHzt2fuidlVc=;
 b=Ykx7CNEL+oZJNsQz+13ZUeFbIHfbnbebgmqIU67g4adwgnFCRni376hz2/kkQq2Y8vzsQj
 k0TdMR6kgsPO/PSOldTy6gSYUyTjpGoVJ3Fi6RMin7PSeGEAQyaJrdsQKn3Wt5+iugIhc0s1
 mL2Ou10HU5vhxJKJDV2GT4yTWeer7SpWJHl+Nhsc03ZFCDrH0zNFSH9pjGdQIdJ9E7FWd3d/
 pCexSH1Y3O06bmoog4dl/bJNW5jTy494JwtWvLukGVOTDxjhN9vTTa6MLWyAPDbx+F6CiEjd
 vDJgJOwwr4BgbRcPPpFQNY3kum9xODS8RztwRmf4Pjrf/fKRGlZpQH6A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [blacksail][PATCH] gpgme: patch CVE-2026-129975
Date: Fri, 27 Nov 2026 22:05:18 +0100
Message-ID: <20261127210518.676479-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 21:06:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251457
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch per https://security-tracker.debian.org/tracker/CVE-2026-129975

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../gpgme/gpgme/CVE-2026-129975.patch         | 64 +++++++++++++++++++
 meta/recipes-support/gpgme/gpgme_2.1.2.bb     |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-support/gpgme/gpgme/CVE-2026-129975.patch

diff --git a/meta/recipes-support/gpgme/gpgme/CVE-2026-129975.patch b/meta/recipes-support/gpgme/gpgme/CVE-2026-129975.patch
new file mode 100644
index 00000000000..dcf0317c8a4
--- /dev/null
+++ b/meta/recipes-support/gpgme/gpgme/CVE-2026-129975.patch
@@ -0,0 +1,64 @@
+From 14499348b966cd7b3d72afee15a5cd51cdd0a727 Mon Sep 17 00:00:00 2001
+From: Werner Koch <wk@gnupg.org>
+Date: Sat, 14 Nov 2026 13:43:00 +0100
+Subject: [PATCH] Fix a double free in the status line read code.
+
+* src/engine-gpg.c (read_status): Immediately assign the realloced
+buffer to the context and not just at the end.
+(read_colon_line): Ditto.
+--
+
+This fixes a 24 years old bug introduced with
+Fixes-commit: f12433c1e476f52c92496a885c1ffcd10fa2a322
+GnuPG-bug-id: T8557
+Reported-by: Johan Carlsson (https://hackerone.com/joaxcar?type=user)
+
+CVE: CVE-2026-129975
+Upstream-Status: Backport [https://github.com/gpg/gpgme/commit/14499348b966cd7b3d72afee15a5cd51cdd0a727]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/engine-gpg.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/src/engine-gpg.c b/src/engine-gpg.c
+index eea97bc7..66e567b0 100644
+--- a/src/engine-gpg.c
++++ b/src/engine-gpg.c
+@@ -1494,7 +1494,9 @@ read_status (engine_gpg_t gpg)
+       buffer = realloc (buffer, bufsize);
+       if (!buffer)
+ 	return gpg_error_from_syserror ();
+-    }
++      gpg->status.bufsize = bufsize;
++      gpg->status.buffer = buffer;
++   }
+ 
+   nread = _gpgme_io_read (gpg->status.fd[0],
+ 			  buffer + readpos, bufsize-readpos);
+@@ -1606,8 +1608,6 @@ read_status (engine_gpg_t gpg)
+     }
+ 
+   /* Update the gpg object.  */
+-  gpg->status.bufsize = bufsize;
+-  gpg->status.buffer = buffer;
+   gpg->status.readpos = readpos;
+   return 0;
+ }
+@@ -1647,6 +1647,8 @@ read_colon_line (engine_gpg_t gpg)
+       buffer = realloc (buffer, bufsize);
+       if (!buffer)
+ 	return gpg_error_from_syserror ();
++      gpg->colon.bufsize = bufsize;
++      gpg->colon.buffer  = buffer;
+     }
+ 
+   nread = _gpgme_io_read (gpg->colon.fd[0], buffer+readpos, bufsize-readpos);
+@@ -1726,8 +1728,6 @@ read_colon_line (engine_gpg_t gpg)
+     }
+ 
+   /* Update the gpg object.  */
+-  gpg->colon.bufsize = bufsize;
+-  gpg->colon.buffer  = buffer;
+   gpg->colon.readpos = readpos;
+   return 0;
+ }
diff --git a/meta/recipes-support/gpgme/gpgme_2.1.2.bb b/meta/recipes-support/gpgme/gpgme_2.1.2.bb
index 32db75fdfd7..ba35354dae4 100644
--- a/meta/recipes-support/gpgme/gpgme_2.1.2.bb
+++ b/meta/recipes-support/gpgme/gpgme_2.1.2.bb
@@ -22,6 +22,7 @@ SRC_URI = "${GNUPG_MIRROR}/gpgme/${BP}.tar.bz2 \
            file://0001-use-closefrom-on-linux-and-glibc-2.34.patch \
            file://0001-posix-io.c-Use-off_t-instead-of-off64_t.patch \
            file://0001-autogen.sh-remove-unknown-in-version.patch \
+           file://CVE-2026-129975.patch \
            "
 
 SRC_URI[sha256sum] = "0687a95b299871c4141f507c0f740de6b429c9ac067d0fa4e062e3264df5fb77"
