Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19403.1795278181322634034
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Nov 2026 08:23:01 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=n63LemOS;
 spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout02.t-online.de (Postfix) with SMTP id 9C93FE609
	for <openembedded-core@lists.openembedded.org>; Sat, 21 Nov 2026 17:22:17 +0100 (CET)
Received: from localhost.localdomain ([84.154.170.58]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xUnqy-2ZMwO90; Sat, 21 Nov 2026 17:22:16 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCHv2] cups: fix temporary queues for discovered printers
Date: Sat, 21 Nov 2026 17:22:03 +0100
Message-ID: <20261121162210.2347337-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121162210.2347337-1-f_l_k@t-online.de>
References: <20261121162210.2347337-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1795278136-50FD69F7-EDCB07C8/0/0 CLEAN NORMAL
X-TOI-MSGID: b763ee8f-5071-46f8-a2db-8d406be93c3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1795278137; i=f_l_k@t-online.de;
	bh=nC3IxZt4rLuiWdx752EUsGC0fswHbk6sidvs5rBHy6s=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=n63LemOSmJwzRwSzY559KX8hE1WOu3wvHm2J7TVP1XP6aDK8Fi056Cerkri7eTDvj
	 cz8cqiUklzvhoFNi4mloc4VJ1MyEhQV3FEcrBreNQvCtJqzfhZcfW3Bptf4IqFidKk
	 tPSJgnSGiXjTByUheeJd5W2PzbVTzy1irbvW39HlBOSTi0MZdq8+kEXQ+FIFdhOs99
	 yN6XwxZeG72qn1fjx3Ug3IjPFFbqR8MJficN4Fe6qgRfopRu4jUw6w5Z656zGcH8L8
	 252dJcvYv+BqJiZ2hGsJwkWgVN5Srhpt58g66gQYLjDDyVAjzDXAJQdnJ8bXaYvn3q
	 lmRqMVvzECQ0A==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 21 Nov 2026 16:23:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250852
Content-Type: text/plain; charset="utf-8"

Since 2.4.20 cupsd stores the device URI "://" for every temporary
queue: create_local_printer() reads the URI into device_uri_ptr but
still splits and stores the former printer-name pointer. Discovered
IPP Everywhere printers without a configured queue can no longer be
used. Backport the two upstream fixes from the 2.4.x branch.

Tested by printing to a discovered IPP Everywhere printer without a
configured queue.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-extended/cups/cups.inc           |  1 +
 ...Fix-regression-with-temporary-queues.patch | 43 +++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/0005-Fix-regression-w=
ith-temporary-queues.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/=
cups/cups.inc
index f82fc0a1aa..b7579ff70a 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -13,6 +13,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/cups-${=
PV}-source.tar.gz \
            file://0002-don-t-try-to-run-generated-binaries.patch \
            file://libexecdir.patch \
            file://0004-cups-fix-multilib-install-file-conflicts.patch \
+           file://0005-Fix-regression-with-temporary-queues.patch \
            file://volatiles.99_cups \
            file://cups-volatiles.conf \
            "
diff --git a/meta/recipes-extended/cups/cups/0005-Fix-regression-with-tem=
porary-queues.patch b/meta/recipes-extended/cups/cups/0005-Fix-regression=
-with-temporary-queues.patch
new file mode 100644
index 0000000000..67586dd3d8
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/0005-Fix-regression-with-temporary-=
queues.patch
@@ -0,0 +1,43 @@
+From 67dcee9f60a2a1410993510ab00c7203af5c5804 Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <msweet@msweet.org>
+Date: Fri, 9 Oct 2026 12:01:20 -0400
+Subject: [PATCH] Fix regression with temporary queues (Issue #1751)
+
+create_local_printer() took the device URI into device_uri_ptr, but stil=
l
+split and stored the former printer-name pointer, so every temporary que=
ue
+got the device URI "://" and failed.
+
+Combines the upstream commits 67dcee9f60 and e11ff1a9e8 on the 2.4.x
+branch, without the CHANGES.md entry.
+
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/6=
7dcee9f60a2a1410993510ab00c7203af5c5804, https://github.com/OpenPrinting/=
cups/commit/e11ff1a9e8c6ec71edbaac5d5e5590d11aff64ef]
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+---
+diff --git a/scheduler/ipp.c b/scheduler/ipp.c
+index af8cf12..96364f4 100644
+--- a/scheduler/ipp.c
++++ b/scheduler/ipp.c
+@@ -5796,11 +5796,11 @@ create_local_printer(
+=20
+   if (nameptr)
+   {
+-    size_t host_len,
+-        server_name_len;
++    size_t	host_len,		/* Length of hostname */
++		server_name_len;	/* Length of server name */
+=20
+     /* Get host name of device URI */
+-    httpSeparateURI(HTTP_URI_CODING_ALL, ptr,
++    httpSeparateURI(HTTP_URI_CODING_ALL, device_uri_ptr,
+ 		    scheme, sizeof(scheme), userpass, sizeof(userpass), host,
+ 		    sizeof(host), &port, resource, sizeof(resource));
+=20
+@@ -5832,7 +5832,7 @@ create_local_printer(
+     cupsdSetDeviceURI(printer, uri);
+   }
+   else
+-    cupsdSetDeviceURI(printer, ptr);
++    cupsdSetDeviceURI(printer, device_uri_ptr);
+=20
+   if (printer_geo_location)
+     cupsdSetString(&printer->geo_location, ippGetString(printer_geo_loc=
ation, 0, NULL));
--=20
2.56.1

