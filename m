Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4548.1795813577392498218
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 13:06:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=bFq66b/X;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20261127210615dd442bf21000020743-s3gepu@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20261127210615dd442bf21000020743
        for <openembedded-core@lists.openembedded.org>;
        Fri, 27 Nov 2026 22:06:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Ol76yUnVwsWQzelHv/QGVYSP7eOhhnrXPYnnAK5Xqb0=;
 b=bFq66b/XqLmzdyASOu56F8SZ46mAWtDMBgKAnTCOTxS/1YIVPidSO9DbYClVjE7vbvGwOQ
 0HRaXlc51KF69WT6xtU3VRUJFt0EnBLUhwvgjyhJl+CAwHAMbtPaDGw0uFgymL1WjsY5CBC4
 VsvA6yXq9wtW0zPhshj5fv+vXe5gm33UI5muNxg0mp9TAvm3SFP9fTNW3KSBTurFdy9xgjeu
 FtZb+J1h5KHpSo1iS6WMM82QUVKPIv13bJkJ2BrFo0nSPSwfF9Gjk1MmfYDeeKN2ouX4l5/y
 EicnAerDM4hWn9CrX15WO7lgt/IabRZmvkDnZpC5JuAKTaOobnONyQqg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [scarthgap][PATCH] gpgme: patch CVE-2026-129975
Date: Fri, 27 Nov 2026 22:05:33 +0100
Message-ID: <20261127210533.676581-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 21:06:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251459
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch per https://security-tracker.debian.org/tracker/CVE-2026-129975

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../gpgme/gpgme/CVE-2026-129975.patch         | 64 +++++++++++++++++++
 meta/recipes-support/gpgme/gpgme_1.23.2.bb    |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-support/gpgme/gpgme/CVE-2026-129975.patch

diff --git a/meta/recipes-support/gpgme/gpgme/CVE-2026-129975.patch b/meta/recipes-support/gpgme/gpgme/CVE-2026-129975.patch
new file mode 100644
index 00000000000..a9a7f2dc6bd
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
+@@ -1362,7 +1362,9 @@ read_status (engine_gpg_t gpg)
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
+@@ -1474,8 +1476,6 @@ read_status (engine_gpg_t gpg)
+     }
+ 
+   /* Update the gpg object.  */
+-  gpg->status.bufsize = bufsize;
+-  gpg->status.buffer = buffer;
+   gpg->status.readpos = readpos;
+   return 0;
+ }
+@@ -1515,6 +1515,8 @@ read_colon_line (engine_gpg_t gpg)
+       buffer = realloc (buffer, bufsize);
+       if (!buffer)
+ 	return gpg_error_from_syserror ();
++      gpg->colon.bufsize = bufsize;
++      gpg->colon.buffer  = buffer;
+     }
+ 
+   nread = _gpgme_io_read (gpg->colon.fd[0], buffer+readpos, bufsize-readpos);
+@@ -1594,8 +1596,6 @@ read_colon_line (engine_gpg_t gpg)
+     }
+ 
+   /* Update the gpg object.  */
+-  gpg->colon.bufsize = bufsize;
+-  gpg->colon.buffer  = buffer;
+   gpg->colon.readpos = readpos;
+   return 0;
+ }
diff --git a/meta/recipes-support/gpgme/gpgme_1.23.2.bb b/meta/recipes-support/gpgme/gpgme_1.23.2.bb
index 55f164e4a95..0ee0bef2e7b 100644
--- a/meta/recipes-support/gpgme/gpgme_1.23.2.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.23.2.bb
@@ -29,6 +29,7 @@ SRC_URI = "${GNUPG_MIRROR}/gpgme/${BP}.tar.bz2 \
            file://0001-use-closefrom-on-linux-and-glibc-2.34.patch \
            file://0001-posix-io.c-Use-off_t-instead-of-off64_t.patch \
            file://0001-autogen.sh-remove-unknown-in-version.patch \
+           file://CVE-2026-129975.patch \
            "
 
 SRC_URI[sha256sum] = "9499e8b1f33cccb6815527a1bc16049d35a6198a6c5fae0185f2bd561bce5224"
