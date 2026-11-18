Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7531.1794985581110751517
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 23:06:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=JnQLxTP1;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202611180706182f371d6c11000207da-uxycmn@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202611180706182f371d6c11000207da
        for <openembedded-core@lists.openembedded.org>;
        Wed, 18 Nov 2026 08:06:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=S7mQBT+eQYBadJg4o22rHNwITDhltktkOwhn8CSVRO4=;
 b=JnQLxTP1kNTHwjm6yX8QqNIov4sQ3iYwXEHB8YnZ0EUYzG7pL0hHBeAxTrZi2RzUEYRkEJ
 FfeZXe/hvKbBabDRUBCWfVhHNvwPQm+3MbxQpP3+mqHWJqmN9bIa0Hv3+rfOAADmAHkFegoG
 sOZd3qpG/d6MtFyfLsdD7/hlULn1sz9NRlpqeIZBkx37thumtG//66qlWGNQ01Lk/j1itKaf
 rZQOb6UQl5RD1Y8n2O82jRUBLsVakWgDJ1cceCo0xiT9zijo95boHTJdwTWg36OK5qnLWD4c
 5QVoyqZT0emVX62fIcr2uN3AI5iEoyRrwMF11NI5ew9hx+2q8JbharNA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH v2] zlib: patch CVE-2026-85091
Date: Wed, 18 Nov 2026 08:06:11 +0100
Message-ID: <20261118070611.3315-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 07:06:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250521
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick path per [1].

[1] https://security-tracker.debian.org/tracker/CVE-2026-85091

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../zlib/zlib/CVE-2026-85091.patch            | 31 +++++++++++++++++++
 meta/recipes-core/zlib/zlib_1.3.2.bb          |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-core/zlib/zlib/CVE-2026-85091.patch

diff --git a/meta/recipes-core/zlib/zlib/CVE-2026-85091.patch b/meta/recipes-core/zlib/zlib/CVE-2026-85091.patch
new file mode 100644
index 0000000000..b39aa05733
--- /dev/null
+++ b/meta/recipes-core/zlib/zlib/CVE-2026-85091.patch
@@ -0,0 +1,31 @@
+From df84af25dc1942490e1d1c899a07619152a46148 Mon Sep 17 00:00:00 2001
+From: Mark Adler <git@madler.net>
+Date: Wed, 16 Sep 2026 16:26:14 -0700
+Subject: [PATCH] Fix buffer overflow bug in non-blocking gzwrite.
+
+This addresses CVE-2026-85091.
+
+CVE: CVE-2026-85091
+Upstream-Status: Backport [https://github.com/madler/zlib/commit/df84af25dc1942490e1d1c899a07619152a46148]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ gzwrite.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/gzwrite.c b/gzwrite.c
+index b217b85..5123292 100644
+--- a/gzwrite.c
++++ b/gzwrite.c
+@@ -242,8 +242,11 @@ local z_size_t gz_write(gz_statep state, voidpc buf, z_size_t len) {
+             n -= state->strm.avail_in;
+             state->x.pos += n;
+             len -= n;
+-            if (ret == -1)
++            if (ret == -1) {
++                state->strm.avail_in = 0;
++                state->strm.next_in = state->in;
+                 return state->again ? put - len : 0;
++            }
+         } while (len);
+     }
+ 
diff --git a/meta/recipes-core/zlib/zlib_1.3.2.bb b/meta/recipes-core/zlib/zlib_1.3.2.bb
index 8a23d98cd3..c6619f81cc 100644
--- a/meta/recipes-core/zlib/zlib_1.3.2.bb
+++ b/meta/recipes-core/zlib/zlib_1.3.2.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://zlib.h;beginline=6;endline=23;md5=5377232268e952e9ef6
 # The source tarball needs to be .gz as only the .gz ends up in fossils/
 SRC_URI = "https://zlib.net/${BP}.tar.gz \
            file://run-ptest \
+           file://CVE-2026-85091.patch \
            "
 UPSTREAM_CHECK_URI = "http://zlib.net/"
 
