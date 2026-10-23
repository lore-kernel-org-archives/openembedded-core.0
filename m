Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14849.1792783824009462967
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 12:30:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=cyhcW0wF;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-2026102319302269f01395f3000207f8-fklty0@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2026102319302269f01395f3000207f8
        for <openembedded-core@lists.openembedded.org>;
        Fri, 23 Oct 2026 21:30:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=DaU4cktC7idpq0XXQmSujLf6xwj1ddruHIJGb42NY4w=;
 b=cyhcW0wFGqV2fFGJaFVQm8zNslHyiSh9XYo4X4i7asw3vsUY8hQ3kW/EqgXBuyN9tjErU4
 pXpyp2f1yj0rmdlRaFEtoKk9R8e9i3y7pKfCo7EvvmjQ+nUZN1hK3M0XX+W3tR3k0zd3q3gW
 +tc0bdBteUBil7z1DqqBC8twjjd1xzSUfetYPg1goU2b6neX/vEa2Nwacq9UD21GqG9t5R8v
 5JtmiycPPtsXOKlsG+2rTxG8peHcAYs/omTHshQdX6FdPwpsmIYNQAYhrXp1cE5ii37Je4Rw
 entfeq3NvSFFOuayeX3YM4f9qlTiVqFGLeENbNeOG7OQb+o9KV87G+GQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [scarthgap][PATCH 2/2] dropbear: patch CVE-2026-35385
Date: Fri, 23 Oct 2026 21:29:32 +0200
Message-ID: <20261023192932.159420-2-peter.marko@siemens.com>
In-Reply-To: <20261023192932.159420-1-peter.marko@siemens.com>
References: <20261023192932.159420-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 19:30:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248564
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch referencing this CVE from 2026.90 release.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../dropbear/dropbear/CVE-2026-35385.patch    | 42 +++++++++++++++++++
 .../recipes-core/dropbear/dropbear_2022.83.bb |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2026-35385.patch

diff --git a/meta/recipes-core/dropbear/dropbear/CVE-2026-35385.patch b/meta/recipes-core/dropbear/dropbear/CVE-2026-35385.patch
new file mode 100644
index 00000000000..e220bf3a60b
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
+ scp.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/scp.c b/scp.c
+index 09297a5b..79b0a12d 100644
+--- a/scp.c
++++ b/scp.c
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
diff --git a/meta/recipes-core/dropbear/dropbear_2022.83.bb b/meta/recipes-core/dropbear/dropbear_2022.83.bb
index d0256f21211..ed68abce8ed 100644
--- a/meta/recipes-core/dropbear/dropbear_2022.83.bb
+++ b/meta/recipes-core/dropbear/dropbear_2022.83.bb
@@ -33,6 +33,7 @@ SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
            file://CVE-2019-6111-02.patch \
            file://CVE-2019-6111-03.patch \
            file://CVE-2019-6111-04.patch \
+           file://CVE-2026-35385.patch \
            "
 
 SRC_URI[sha256sum] = "bc5a121ffbc94b5171ad5ebe01be42746d50aa797c9549a4639894a16749443b"
