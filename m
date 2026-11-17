Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1011.1794956381573399535
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 14:59:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=bf8ElDfQ;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-20261117225938f10ea6ce81000207ec-3a9h5g@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20261117225938f10ea6ce81000207ec
        for <openembedded-core@lists.openembedded.org>;
        Tue, 17 Nov 2026 23:59:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=ylJjyaBw4LwLyS+UFNX3ZFp3JGv0422eB1qplaBxW0s=;
 b=bf8ElDfQr/oBzzdXxqRMSblMHoT8t7ZMnvPv/CJTCj5ZDdqFECNzFnNhuwlVoEPWCyvnzf
 LbE/lGU7ysOXQHNa7AD35imeQ90sYqC7X5enKM/MGRz7A82qet41B4cpSFnwVbUsNbqRX8H2
 H4aarEW5s71VSdAFhSQID55hpl1+FzyVfKe81ANYDo7cCOgnJri/kLrJxd4zWtMbiZdykFbT
 sPCkDJZYUI8Ij4D2APjRfAq55azo6Tc5HmaMvFX/rlXQDCVtj7BcabGh3MbRHBvv3hU5pJFi
 DsQ95KA8HYilvg8NlOakwAgAXT9xMgF3XZhVpmXb8uVr87FB2dfPy2KA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [blacksail][PATCH] zlib: patch CVE-2026-85091
Date: Tue, 17 Nov 2026 23:59:30 +0100
Message-ID: <20261117225930.3886161-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 22:59:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250498
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
index 00000000000..62e361539ce
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
+CVE: CVE-2026-XXXXX
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
index 8a23d98cd3e..c6619f81ccb 100644
--- a/meta/recipes-core/zlib/zlib_1.3.2.bb
+++ b/meta/recipes-core/zlib/zlib_1.3.2.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://zlib.h;beginline=6;endline=23;md5=5377232268e952e9ef6
 # The source tarball needs to be .gz as only the .gz ends up in fossils/
 SRC_URI = "https://zlib.net/${BP}.tar.gz \
            file://run-ptest \
+           file://CVE-2026-85091.patch \
            "
 UPSTREAM_CHECK_URI = "http://zlib.net/"
 
