Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7932.1794264970479509061
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 14:56:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=kwIc8nG9;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20261109225608b22bd656d30002079e-vuk1l3@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20261109225608b22bd656d30002079e
        for <openembedded-core@lists.openembedded.org>;
        Mon, 09 Nov 2026 23:56:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Z6EGqkzP9g3Pi2dsD7aHCkdgkpj25WWjURg8hhsIPnc=;
 b=kwIc8nG9SiVlS8H/7QUDf9Vj0qy3ufrPJ7Bevagiou83YrdqfF47YDVgcYbb5X8NtKoopM
 ab9Ey4sgqby8F54GbdTGzPpCbAaBthqgd8BY/PV9diQgk5Vyzd0EZm0fOwx4DAn9icERqeJG
 +04L+tkyOJ3PFDbk8SJyWUx/+wdbKcM0POTO3DfKhCbMq/bfwl7KoAOmmpYbFKrM6XHp/87q
 Cg4vIicLU9P/rLas05pE4vYMDtLNGoB5BKlb0Dbxz3P2jHr4Nmq7DpOUOp9LV+HeS+/I6LU6
 Q+piSGb75HZ+k5llAst23hTFls3SUBcYU5RS3TfOC9Ey/nP7iFMkPcDA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH v2 2/2] dropbear: patch CVE-2026-35385
Date: Mon,  9 Nov 2026 23:55:33 +0100
Message-ID: <20261109225533.1221067-2-peter.marko@siemens.com>
In-Reply-To: <20261109225533.1221067-1-peter.marko@siemens.com>
References: <20261109225533.1221067-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 22:56:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249880
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch referencing this CVE from 2026.90 release.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../dropbear/dropbear/CVE-2026-35385.patch    | 42 +++++++++++++++++++
 .../recipes-core/dropbear/dropbear_2025.89.bb |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2026-35385.patch

diff --git a/meta/recipes-core/dropbear/dropbear/CVE-2026-35385.patch b/meta/recipes-core/dropbear/dropbear/CVE-2026-35385.patch
new file mode 100644
index 0000000000..6794acd57a
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear/CVE-2026-35385.patch
@@ -0,0 +1,42 @@
+From 443ccc1fd1b9a4e3747f6b5cd644b7af49064308 Mon Sep 17 00:00:00 2001
+From: Matt Johnston <matt@ucc.asn.au>
+Date: Sat, 2 May 2026 08:17:25 +0800
+Subject: [PATCH] scp: clear setuid/setgid bits on received files
+
+From openssh-portable 487e8ac146f7d6616f65c125d5edb210519b833a
+Tracked as CVE-2026-35385
+
+upstream: when downloading files as root in legacy (-O) mode and
+
+without the -p (preserve modes) flag set, clear setuid/setgid bits from
+downloaded files as one might expect.
+
+AFAIK this bug dates back to the original Berkeley rcp program.
+
+Reported by Christos Papakonstantinou of Cantina and Spearbit.
+
+OpenBSD-Commit-ID: 49e902fca8dd933a92a9b547ab31f63e86729fa1
+
+CVE: CVE-2026-35385
+Upstream-Status: Backport [https://github.com/mkj/dropbear/commit/443ccc1fd1b9a4e3747f6b5cd644b7af49064308]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/scp.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/scp.c b/src/scp.c
+index 09297a5b..79b0a12d 100644
+--- a/src/scp.c
++++ b/src/scp.c
+@@ -1114,8 +1114,10 @@ sink(int argc, char **argv, const char *src)
+ 
+ 	setimes = targisdir = 0;
+ 	mask = umask(0);
+-	if (!pflag)
++	if (!pflag) {
++		mask |= 07000;
+ 		(void) umask(mask);
++	}
+ 	if (argc != 1) {
+ 		run_err("ambiguous target");
+ 		exit(1);
diff --git a/meta/recipes-core/dropbear/dropbear_2025.89.bb b/meta/recipes-core/dropbear/dropbear_2025.89.bb
index 6cb520f68d..9f04327bd1 100644
--- a/meta/recipes-core/dropbear/dropbear_2025.89.bb
+++ b/meta/recipes-core/dropbear/dropbear_2025.89.bb
@@ -29,6 +29,7 @@ SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
            file://CVE-2019-6111-02.patch \
            file://CVE-2019-6111-03.patch \
            file://CVE-2019-6111-04.patch \
+           file://CVE-2026-35385.patch \
            "
 
 SRC_URI[sha256sum] = "0d1f7ca711cfc336dc8a85e672cab9cfd8223a02fe2da0a4a7aeb58c9e113634"
