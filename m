Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13560.1792779843568111603
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 11:24:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=SV+pLC+D;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202610231823590447c7d5260002075b-7hjki3@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202610231823590447c7d5260002075b
        for <openembedded-core@lists.openembedded.org>;
        Fri, 23 Oct 2026 20:24:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=muBqXsaoMi2DpK70xfNQA97kqcjh+fuUQBcLi6JPVr4=;
 b=SV+pLC+DKY5K+4RN99GAHz8sHyvZ9ByiSOBupG/QU9jC/GFuhN5ZBw1/7c/gHktcZUol1L
 dKwzm25ca11eGfbRU5FuAHaGn4S7WUogCG+BRFO0KKRlnApP1N4jf4tQaHmPdiWGE1wljrt5
 1SNLLx/ue//2lQ5yGdzk9mpaznCAw7reLnR+lqJaHjZBtQOI6ihjRRbD/7DE7RKGzlbO9WcU
 6xC9xYZHkcx3dmwG9x1AjN3gu0mJzEs6jGoP6e1X7i+l+o67LfXoRgtTaj8U8vVWyo38tCxS
 3QM62yYCTGyIo5q0vjhgB0rxBjcccQsantaZRqPCIdeedYSbhUNWonXQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [scarthgap][PATCH] dhcpcd: patch CVE-2025-70102
Date: Fri, 23 Oct 2026 20:23:46 +0200
Message-ID: <20261023182346.52542-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 18:24:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248559
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://security-tracker.debian.org/tracker/CVE-2025-70102

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../dhcpcd/dhcpcd_10.0.6.bb                   |  1 +
 .../dhcpcd/files/CVE-2025-70102.patch         | 30 +++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/CVE-2025-70102.patch

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb
index e6854e1c7f2..029040a2236 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb
@@ -18,6 +18,7 @@ SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=ma
            file://CVE-2026-56113.patch \
            file://CVE-2026-56114.patch \
            file://CVE-2026-56117.patch \
+           file://CVE-2025-70102.patch \
            "
 
 SRCREV = "1c8ae59836fa87b4c63c598087f0460ec20ed862"
diff --git a/meta/recipes-connectivity/dhcpcd/files/CVE-2025-70102.patch b/meta/recipes-connectivity/dhcpcd/files/CVE-2025-70102.patch
new file mode 100644
index 00000000000..e2b0e291f9c
--- /dev/null
+++ b/meta/recipes-connectivity/dhcpcd/files/CVE-2025-70102.patch
@@ -0,0 +1,30 @@
+From 117742d755b591764036dd4218f314f748a3d2b7 Mon Sep 17 00:00:00 2001
+From: Roy Marples <roy@marples.name>
+Date: Sun, 21 Dec 2025 08:31:52 +0000
+Subject: [PATCH] options: Ensure ldop is not NULL dereferenced (#568)
+
+ldop itself cannot be non NULL as it points to the location.
+but *ldop CAN be NULL.
+
+Fixes #567.
+
+CVE: CVE-2025-70102
+Upstream-Status: Backport [https://github.com/NetworkConfiguration/dhcpcd/commit/117742d755b591764036dd4218f314f748a3d2b7]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/if-options.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/if-options.c b/src/if-options.c
+index 083449b9..9ac9f0b8 100644
+--- a/src/if-options.c
++++ b/src/if-options.c
+@@ -1882,7 +1882,7 @@ err_sla:
+ 			if (*edop) {
+ 				dop = &(*edop)->embopts;
+ 				dop_len = &(*edop)->embopts_len;
+-			} else if (ldop) {
++			} else if (*ldop) {
+ 				dop = &(*ldop)->embopts;
+ 				dop_len = &(*ldop)->embopts_len;
+ 			} else {
