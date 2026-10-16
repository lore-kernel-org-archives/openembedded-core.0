Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63084CC6B38
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 03:37:44 +0000 (UTC)
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13985.1792121859155516438
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 20:37:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=hRfcn10W;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3197; q=dns/txt;
  s=iport01; t=1792121859; x=1793331459;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+WrBvyS2uX+pEC7bRWdl+NEB/HNKODjkZaCJhp9zk3Q=;
  b=hRfcn10W3vfaWqQUQONqbRhwQQcaHKkt3nf/o5sdfXeqX4F+/jp3x0yK
   mBgbpPrdqXzCYgfscAIWNm3YxQWSefyzuiZTJ4hllvzjbvtUcVn9nl0g7
   GwzSdAoKPs0LgyUwoMc2PD8KeS4OpU+CZEK/DPSWtPRYyC//5x0msFXrv
   6EWINv45meryCLQ/3mr1taWqBdFRgf9i5FTtojz0RCk4NYzCpdneSYkm4
   askKjTZPk8oJ/hMKvP2JhTt4BTf9m6ew3+RT9HZKakkJ8eKpTU7wyICM8
   i0OoUBTg4Aq44pZvaBheoLyuKOIvl5L/6bl0eOzu7Go1apOnd5LJ3/anO
   Q==;
X-CSE-ConnectionGUID: FvpcXsteQ1mZ/+OXH4W1UQ==
X-CSE-MsgGUID: 5lgYZ9mvRhehCTxUSFYYEw==
X-IPAS-Result: =?us-ascii?q?A0BIAgCzm9Fq/4r/Ja1aglmCV3VgQ0mWSgOeHIF+DwEBA?=
 =?us-ascii?q?Q9KBwQBAYUFAo4VAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDZASAQIBAzIBGAEtEBwDAQIvKyMIGRqCaAGCdAMRvHWCLIEBgykBg?=
 =?us-ascii?q?VTbMgELFAEFgTOFQIgjXRgBhHwnGxuBcoEUAYE7gi6BBYFcAoIGhh8EgiJ6E?=
 =?us-ascii?q?oFaHogbjQ5IgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIz4XgQcbBgWBHYEgg?=
 =?us-ascii?q?hYjGTZ6gQlegSspYAEQF4EJggcCglSCAAIBSUEOB0VTCSVDEkcmIggSCQETG?=
 =?us-ascii?q?jALgRs4PAkoQRcMcwwdBXIIAg0JBykYDUgRLDcVGQQ+bgeSEx6CZXsTARMYg?=
 =?us-ascii?q?WgBQ5MRkEOCIaEPCiiDdowilToaM6pvC5h9jgqVUn2EaYFoPIFZcBWDIglKG?=
 =?us-ascii?q?Q+OOYNrM84nJzICAQgyAQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:3dVG2a9BffVSF6oT00T5DrUD1n+TJUtcMsCJ2f8bNWPcYEJGY0x3m
 mYeXGCPOv6DNmv8fYogOt+y8hxVsJCBzdRlSQBuqH9EQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmB4E/rbei5xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mtyyHjEAX9gWAtajtKs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kYI5UTyv1rDFgX8
 M5faxc9Tky83t+PlefTpulE3qzPLeHxN48Z/3UlxjbDALN+GNbIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZOE0n1lQ/UPrSmM+omnn2cDRCgFmUvqEwpWPUyWSd1ZCwa4SMK4HWGZ89ckCw+
 2bJzlaoBw8gNNGf4gaVz0mCt97ignauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBXy4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rHnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:1TIIP6O0HyYZfsBcThmjsMiBIKoaSvp037Dk7S9MoHtuA6ulfq
 +V/cjzuSWYtN9VYgBDpTniAtjlfZqjz/5ICOAqVN/INjUO+lHYSb2KhrGN/9SPIUHDH8dmpM
 FdmtBFeb7NJGk/q9rm6w+lFNtl6tyG/Ke0wdr69R5WPHhXg2UK1XYDNu5deXcGPDV7OQ==
X-Talos-CUID: 9a23:yvlXJm3b/5SZAKHMJVBrUbxfNN49eU3G0HrpekqKTiVOeJ3JdgatwfYx
X-Talos-MUID: 9a23:4Ojdxgaf2FhFt+BT6jvjtQMzMdlS46muI3wdrK4oivipKnkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536195442"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 03:37:26 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id C3A4918000312;
	Fri, 16 Oct 2026 03:37:26 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 6A71ECBF202; Thu, 15 Oct 2026 20:37:26 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][wrynose][PATCH 3/3] lrzsz: fix CVE-2026-105842
Date: Thu, 15 Oct 2026 20:37:26 -0700
Message-Id: <20261016033726.426908-3-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016033726.426908-1-hthakar@cisco.com>
References: <20261016033726.426908-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 03:37:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247905

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/UweOhse/lrzsz/commit/f8caa7b1b1a3a1bb50cf08677b15be7b17c2956f
[2] https://www.vulncheck.com/advisories/lrzsz-before-0.13.0-heap-buffer-overflow-via-lrz-procheader-pathname

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../lrzsz/lrzsz-0.12.20/CVE-2026-105842.patch | 57 +++++++++++++++++++
 meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb       |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-bsp/lrzsz/lrzsz-0.12.20/CVE-2026-105842.patch

diff --git a/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/CVE-2026-105842.patch b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/CVE-2026-105842.patch
new file mode 100644
index 00000000000..afa6a8ab3b4
--- /dev/null
+++ b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/CVE-2026-105842.patch
@@ -0,0 +1,57 @@
+From f8caa7b1b1a3a1bb50cf08677b15be7b17c2956f Mon Sep 17 00:00:00 2001
+From: Uwe Ohse at akiar <uwe@ohse.de>
+Date: Mon, 10 Aug 2026 18:40:36 +0200
+Subject: [PATCH] avoid buffer overflows by strdup instead of
+ malloc(PATH_MAX+...).
+
+CVE: CVE-2026-105842
+Upstream-Status: Backport [https://github.com/UweOhse/lrzsz/commit/f8caa7b1b1a3a1bb50cf08677b15be7b17c2956f]
+
+Backport Changes:
+- Omitted NEWS because its 0.13.0 release-note hunk conflicts with the
+  0.12.20 release history and is not needed for the security fix.
+
+(cherry picked from commit f8caa7b1b1a3a1bb50cf08677b15be7b17c2956f)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/lrz.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/lrz.c b/src/lrz.c
+index 168636e..e11f909 100644
+--- a/src/lrz.c
++++ b/src/lrz.c
+@@ -743,11 +743,10 @@ wcreceive(int argc, char **argp)
+ 		if (Pathname)
+ 			free(Pathname);
+ 		errno=0;
+-		Pathname=malloc(PATH_MAX+1);
++		Pathname=strdup(*argp);
+ 		if (!Pathname)
+ 			error(1,0,_("out of memory"));
+ 
+-		strcpy(Pathname, *argp);
+ 		checkpath(Pathname);
+ #ifdef ENABLE_SYSLOG
+ 		shortname=strrchr(*argp,'/');
+@@ -1288,15 +1287,16 @@ procheader(char *name, struct zm_fileinfo *zi)
+                 return OK; /* dummy */
+         if (Pathname)
+                 free(Pathname);
+-        Pathname=malloc((PATH_MAX)*2);
++
++        Pathname=strdup(name_static);
+         if (!Pathname)
+                 error(1,0,_("out of memory"));
+-        strcpy(Pathname, name_static);
+         if (Verbose) {
+                 /* overwrite the "waiting to receive" line */
+                 vstring("\r                                                                     \r");
+                 vstringf(_("Receiving: %s\n"), name_static);
+         }
++
+         checkpath(name_static);
+         if (Nflag)
+         {
+-- 
+2.35.6
diff --git a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb b/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
index ec98f690153..a6d1f62c61e 100644
--- a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
+++ b/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
@@ -23,6 +23,7 @@ SRC_URI = "https://www.ohse.de/uwe/releases/lrzsz-${PV}.tar.gz \
            file://0001-lrzsz-convert-K-R-function-definitions-to-ANSI-C-pro.patch \
            file://CVE-2026-105841.patch \
            file://CVE-2026-105840.patch \
+           file://CVE-2026-105842.patch \
            "
 SRC_URI[sha256sum] = "c28b36b14bddb014d9e9c97c52459852f97bd405f89113f30bee45ed92728ff1"
 
-- 
2.35.6


