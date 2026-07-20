Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FC38C4452D
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 18:58:01 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4969.1784573873556979391
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 11:57:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=KBZpazti;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3597; q=dns/txt;
  s=iport01; t=1784573873; x=1785783473;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Yb9pR3eZ7I6H9uMbLjYJVwJusFFI05X/KER8Hr5f9Rc=;
  b=KBZpazti7xbYIesShTY7edqmW2mG5vdQgSFe9P5r2mUI9YsD0RDvcZVc
   xPvXqlLk/SJpxu4vd1KcjGaUJXgnoeD0ftBytD+orE/qTCEv/7QxL+3r6
   3g+YJZSfbRJBQojxjSNxzCER6lPb+OFCkNXiTVgfh3blzRiJDm76dqcmk
   fMptRWhNY+ixKbMRKblTMxX/0gucb72mdSvQ4lvI05OqXI1sjaCYvWIq8
   hWs6fUIAqJxrwS24YKMu+jHJ7QADeo4o6c8CpqDUyMo97IPYWbeOcwDai
   DSWkBFltXs0yDq7E0KvR6KA9S52PbDY60lwCYxt1Ucfn6751laKIhPQnv
   Q==;
X-CSE-ConnectionGUID: UqEOeuFmRpSZUuflx9Q9Nw==
X-CSE-MsgGUID: 4U2hIAaTTiWo3ortbBxCIw==
X-IPAS-Result: =?us-ascii?q?A0BIAgAQb15q/5X/Ja1aglmCV3ReQ0mWSgOeG4F+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYQ/RgKNVQImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDYZaAQIBAycLARgBLRAcAwECLysjCBmDAgGCdAMRvAWBeTOBAYMoA?=
 =?us-ascii?q?T8CQ1DbLgELFAEFgTOFP4ggXBgBhHwnGxuBcoEVg2mBBYFcAQEDgUWGXQSCI?=
 =?us-ascii?q?noSgVoej3lIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQwbBwWBHYE6g?=
 =?us-ascii?q?QKEdCMfAzl/gS91SnctaQESF4EmghICgTsCEwMLGA1IESw3FBkEPm4HjUEjg?=
 =?us-ascii?q?kB7EwEqAYEggRqlaKEPCiiDdYwhlToaM6psC5h9jgqWUIRpgWg8gUcLB3AVg?=
 =?us-ascii?q?yIJShkPjjiDa4F/gxTJRycyCzIBAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:OpEI6KmeHKpDmZcXj6f7nifo5gzQJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJKCzzTOvmLNmenKI1zaNjioB8O6pPXyNc2SQBqpS81HltH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZC31GONgWYubDpLsfrb9nuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FbAB18F6HE9Lz
 +QjGg0QYBST1tvn5q3uH4GAhux7RCXqFJkUtnclyXTSCuwrBMmZBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQTaz/7C7pm9AusrnXybTRes1KNjaE2+GPUigd21dABNfKII4fWH5oMzxvwS
 mTuo1mjAjAzPeCjyAWCqXW2muXljQjaR9dHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1dFHhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Oxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:/eJtf6FDAayCnRoRpLqEMMeALOsnbusQ8zAXPo5KJiC9Ffbo8P
 xG88576faZslsssTQb6LK90cq7MBfhHPxOgbX5VI3KNGKNhILrFvAG0WKI+VPd8kPFmtK1/J
 0QFZSWcOeAbmRSvILd/BSyFcomzZ2s9aClgvqb8lJWJDsaEp2JK2xCe32m+oocfng/OaYE
X-Talos-CUID: =?us-ascii?q?9a23=3ADhGJz2vuhVVihFHqTtLPfWPN6IsYa1D6wWr+JnW?=
 =?us-ascii?q?gMlRUVbORWQ6pqYV7xp8=3D?=
X-Talos-MUID: 9a23:rK2qfwRo7FuGZczdRXSwuWtiFe5h35ivN0dWlo8aseOUHg1vbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,175,1779148800"; 
   d="scan'208";a="513427195"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Jul 2026 18:57:52 +0000
Received: from sjc-ads-9357.cisco.com (sjc-ads-9357.cisco.com [10.30.212.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id 7F4E018000326;
	Mon, 20 Jul 2026 18:57:52 +0000 (GMT)
Received: by sjc-ads-9357.cisco.com (Postfix, from userid 1887503)
	id 25246CC12A8; Mon, 20 Jul 2026 11:57:52 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Devansh Patel <devanshp@cisco.com>
Subject: [OE-core][scarthgap][PATCH 2/8] openssh: Fix CVE-2026-59997
Date: Mon, 20 Jul 2026 11:57:43 -0700
Message-ID: <20260720185749.4098075-3-devanshp@cisco.com>
X-Mailer: git-send-email 2.44.4
In-Reply-To: <20260720185749.4098075-1-devanshp@cisco.com>
References: <20260720185749.4098075-1-devanshp@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-9357.cisco.com [10.30.212.121];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.212.121, sjc-ads-9357.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 18:58:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241478

From: Devansh Patel <devanshp@cisco.com>

This patch applies the upstream OpenSSH 10.4 backport for
CVE-2026-59997. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/openssh/openssh-portable/commit/e9916c44c1324ab9ab022719e4df08a390a83014
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-59997

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 .../openssh/openssh/CVE-2026-59997.patch      | 58 +++++++++++++++++++
 .../openssh/openssh_9.6p1.bb                  |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-59997.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-59997.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-59997.patch
new file mode 100644
index 0000000000..aa171def01
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-59997.patch
@@ -0,0 +1,58 @@
+From 3011cbb6bb73f3f3dc90fa1d48736803fa407509 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Fri, 5 Jun 2026 08:53:07 +0000
+Subject: [PATCH] upstream: pass >9 commandline arguments to the internal-sftp
+ server,
+
+previously they were silently dropped; reported by Steve Caffrey ok deraadt@
+
+CVE: CVE-2026-59997
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/e9916c44c1324ab9ab022719e4df08a390a83014]
+
+Backport Changes:
+- Retained the Scarthgap session.c OpenBSD revision identifier because the
+  10.4 identifier does not describe the older source baseline.
+
+OpenBSD-Commit-ID: ee6cd5430a3ca027c3223af54b58ad3cc7ccd624
+(cherry picked from commit e9916c44c1324ab9ab022719e4df08a390a83014)
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ session.c | 19 ++++++++++---------
+ 1 file changed, 10 insertions(+), 9 deletions(-)
+
+diff --git a/session.c b/session.c
+index eb932b8bf..1a01ecf74 100644
+--- a/session.c
++++ b/session.c
+@@ -1650,21 +1650,22 @@ do_child(struct ssh *ssh, Session *s, const char *command)
+ 		exit(1);
+ 	} else if (s->is_subsystem == SUBSYSTEM_INT_SFTP) {
+ 		extern int optind, optreset;
+-		int i;
+-		char *p, *args;
++		int sftp_argc;
++		char **sftp_argv;
+ 
+ 		setproctitle("%s@%s", s->pw->pw_name, INTERNAL_SFTP_NAME);
+-		args = xstrdup(command ? command : "sftp-server");
+-		for (i = 0, (p = strtok(args, " ")); p; (p = strtok(NULL, " ")))
+-			if (i < ARGV_MAX - 1)
+-				argv[i++] = p;
+-		argv[i] = NULL;
++		if (argv_split(command == NULL ? "sftp-server" : command,
++		    &sftp_argc, &sftp_argv, 1) != 0) {
++			error("internal error: can't split internal-sftp "
++			    "arguments");
++			exit(1);
++		}
+ 		optind = optreset = 1;
+-		__progname = argv[0];
++		__progname = sftp_argv[0];
+ #ifdef WITH_SELINUX
+ 		ssh_selinux_change_context("sftpd_t");
+ #endif
+-		exit(sftp_server_main(i, argv, s->pw));
++		exit(sftp_server_main(sftp_argc, sftp_argv, s->pw));
+ 	}
+ 
+ 	fflush(NULL);
diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index efb89d45d7..3c706b00ae 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -38,6 +38,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://CVE-2026-35414-CVE-2026-35387.patch \
            file://CVE-2026-35388.patch \
            file://CVE-2026-59999.patch \
+           file://CVE-2026-59997.patch \
            "
 SRC_URI[sha256sum] = "910211c07255a8c5ad654391b40ee59800710dd8119dd5362de09385aa7a777c"
 
-- 
2.44.4


