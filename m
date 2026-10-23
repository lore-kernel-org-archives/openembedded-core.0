Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14839.1792783804428939714
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 12:30:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=T+DsofCu;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20261023193002725ebeb9d6000207ea-l9qjsg@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20261023193002725ebeb9d6000207ea
        for <openembedded-core@lists.openembedded.org>;
        Fri, 23 Oct 2026 21:30:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=2XvOXx8FQWSlTTqgqKt+R1pWeXqIXvpr969ExfZnELY=;
 b=T+DsofCulOZsSYfRHKJL1d1lh5eRFcuSiJqU7XiC1qbCP+xUHItMb1G+zOZVtxy/JWnVkk
 aQlBxX8Ck3o/S0N0B/uETmD7FbkhfNY9d93lvO/wdnfsjTOxDkp8pU8QfXMo6rOj+ECcT8qO
 Hmh0UAYLKRubNX8rMYbeHa3YJ9IsNgLlsdAzLaFc98EJhrDBSFiXp+HiuO4iX2y+8NCMn1eb
 A7puUlbXL2ldUzkodgHZGO1b1ghYmULQcnOJL11esLHmaM3JBec+4A+25hyasP++Mdo2smUo
 577ZaVwZr+5iuG9m2eXovT5h78ZEhjpPHqvBC5downu8qg5UbffhSqFw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH 2/2] dropbear: patch CVE-2026-35385
Date: Fri, 23 Oct 2026 21:29:14 +0200
Message-ID: <20261023192914.159339-2-peter.marko@siemens.com>
In-Reply-To: <20261023192914.159339-1-peter.marko@siemens.com>
References: <20261023192914.159339-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 19:30:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248562
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
index 0000000000..33e1345247
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
+@@ -1111,8 +1111,10 @@ sink(int argc, char **argv, const char *src)
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
index 17f8a1ab3f..c2fe843299 100644
--- a/meta/recipes-core/dropbear/dropbear_2025.89.bb
+++ b/meta/recipes-core/dropbear/dropbear_2025.89.bb
@@ -28,6 +28,7 @@ SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
            file://CVE-2019-6111-01.patch \
            file://CVE-2019-6111-02.patch \
            file://CVE-2019-6111-03.patch \
+           file://CVE-2026-35385.patch \
            "
 
 SRC_URI[sha256sum] = "0d1f7ca711cfc336dc8a85e672cab9cfd8223a02fe2da0a4a7aeb58c9e113634"
