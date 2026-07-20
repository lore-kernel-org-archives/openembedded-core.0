Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C28EC4452F
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 17:57:09 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3657.1784570226506229953
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 10:57:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=YJPF7e3M;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3683; q=dns/txt;
  s=iport01; t=1784570226; x=1785779826;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UZgrcunvlJuojD7vSuX1prOrrj3/VbZv5eh0lC69Azk=;
  b=YJPF7e3Mk4c+k9s0ymojbkOFYlVDaFnV9OcQ6OuBQpPBpNnCHslfUcZq
   il1cUwNVTDQ2hd9sxZdjs/oG05oZ/ZMpaaKx5FZGXWJSDnRC6+HcysHYs
   EHbcUKO+tllvyf94Kwb0vm1i/RcTJQ97Sygkcqq9YdVBylX4IKPNa+xCY
   IgKaBXxknf4QvANl2uheysJ9RzlpNyXlO15/jZsnkwnN/6ZsrUxRCxwly
   7xwfpJ7Gcmp/FLfg1tSiCLpnvw0rllLvdwxXXgiVFG9QAKNuJteXBhXQu
   WLUUq9mYTOngTbqhVylVbLFIoBv94nao2DfznzeBKdZw35zJQrenZFBdO
   w==;
X-CSE-ConnectionGUID: YF+wAkdQTwetCuIuF7tMXg==
X-CSE-MsgGUID: rjrt8K08Rvq+/EI6DKUBkw==
X-IPAS-Result: =?us-ascii?q?A0BIAgCzYF5q/5P/Ja1aglmCV3RfQkmWSgOeG4F+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYQ/RgKNUwImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDYZaAQIBAycLARgBGxIQHAMBAi8rIwgZgwIBgnQCARG7fIF5M4EBg?=
 =?us-ascii?q?ygBPwJDUNsuAQsUAQWBM4U/iCBcGAGEfCcbG4FygRWDaYEFgVwCAgEXgS6GX?=
 =?us-ascii?q?QSCInoSgVoej3RIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQwbBwWBH?=
 =?us-ascii?q?YE6gQKEdCMfAzl/gS91SnctaQESF4EmghICgTsCDgMLGA1IESw3FBkEPm4Hj?=
 =?us-ascii?q?UAjgj8BexMBK4EggQwOpWihDwoog3WMIZU6GjOqbAuYfY4KllCEaYFoPIFZc?=
 =?us-ascii?q?BWDIglKGQ+OOINrhRPJRyQ1CzIBAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:0KQXV6/WHfRFuFsgEi8MDrUD0X+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 GdOCzyFOquDZDCmLY11YYm28RwAup6Am9JjTwU5rX1EQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mvyyHjEAX9gWAsbThMs/zrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kHE84H0+V7OF1R+
 OAzNREQQE+fotK5lefTpulE3qzPLeHxN48Z/3UlxjbDALN/GdbIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZP0In1lQ/UPrSmM+ki2f2dSZYsHqepLE85C7YywkZPL3FbYOPIIbbHJsN9qqej
 njE5XipIUlKDsKGin2o0yyApdLlnjyuDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXzBCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1rN94cRva1fApEFI/
IronPort-HdrOrdr: A9a23:AZ6OI6k2kYGS/lyv6g7yDUeL1DvpDfL03DAbv31ZSRFFG/FwWf
 rAoB19726StN9/YhAdcLy7VZVoBEmsl6KdgrNhWYtKIjOHhILAFugLhuHfKn/bakjDH4Vmu5
 uIHZITNDTYNykdsS+D2njaL/8QhP+a7auvmeDSi11pTQ1sduVcyj0RMHfjLqWzLzM2fqbQ0/
 Gnl7J6mwY=
X-Talos-CUID: 9a23:Vwo8Y28piieDaP8bN7aVv386Wd8McXHk8GjdP2SlKHtHF6GweVDFrQ==
X-Talos-MUID: 9a23:RheC4AXitdEueqfq/CXuni0yF5842bq3SwcgsMsqmPSuNjMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,175,1779148800"; 
   d="scan'208";a="512229160"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Jul 2026 17:57:05 +0000
Received: from sjc-ads-20746.cisco.com (sjc-ads-20746.cisco.com [171.70.189.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id 5B40018000247;
	Mon, 20 Jul 2026 17:57:05 +0000 (GMT)
Received: by sjc-ads-20746.cisco.com (Postfix, from userid 1887503)
	id F1C79CEC313; Mon, 20 Jul 2026 10:57:04 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Devansh Patel <devanshp@cisco.com>
Subject: [OE-core][wrynose][PATCH 2/8] openssh: Fix CVE-2026-59997
Date: Mon, 20 Jul 2026 10:55:12 -0700
Message-Id: <20260720175518.3546447-2-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260720175518.3546447-1-devanshp@cisco.com>
References: <20260720175518.3546447-1-devanshp@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-20746.cisco.com [171.70.189.245];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 171.70.189.245, sjc-ads-20746.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 17:57:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241470

From: Devansh Patel <devanshp@cisco.com>

This patch applies the upstream OpenSSH 10.4p1 backport for
CVE-2026-59997. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/openssh/openssh-portable/commit/e9916c44c1324ab9ab022719e4df08a390a83014
[2] https://www.cve.org/CVERecord?id=CVE-2026-59997

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 .../openssh/openssh/CVE-2026-59997.patch      | 60 +++++++++++++++++++
 .../openssh/openssh_10.3p1.bb                 |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-59997.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-59997.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-59997.patch
new file mode 100644
index 0000000000..7d77fbcc9e
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-59997.patch
@@ -0,0 +1,60 @@
+From 91ce99061c78d0ae84dafc96409c8ea9746f70c0 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Fri, 5 Jun 2026 08:53:07 +0000
+Subject: [PATCH] upstream: pass >9 commandline arguments to the internal-sftp
+ server,
+
+previously they were silently dropped; reported by Steve Caffrey ok deraadt@
+
+OpenBSD-Commit-ID: ee6cd5430a3ca027c3223af54b58ad3cc7ccd624
+
+CVE: CVE-2026-59997
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/e9916c44c1324ab9ab022719e4df08a390a83014]
+
+Backport Changes:
+- Omitted the upstream OpenBSD revision-only hunk in session.c and
+  retained the Wrynose OpenSSH 10.3p1 revision because this stable
+  backport carries only the functional security change.
+
+(cherry picked from commit e9916c44c1324ab9ab022719e4df08a390a83014)
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ session.c | 19 ++++++++++---------
+ 1 file changed, 10 insertions(+), 9 deletions(-)
+
+diff --git a/session.c b/session.c
+index 93de35d7c..b1f125a3c 100644
+--- a/session.c
++++ b/session.c
+@@ -1607,21 +1607,22 @@ do_child(struct ssh *ssh, Session *s, const char *command)
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
diff --git a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
index 2c3b839442..87bd417b2d 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
@@ -25,6 +25,7 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            file://sshd_check_keys \
            file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch \
            file://CVE-2026-59999.patch \
+           file://CVE-2026-59997.patch \
            "
 SRC_URI[sha256sum] = "56682a36bb92dcf4b4f016fd8ec8e74059b79a8de25c15d670d731e7d18e45f4"
 
-- 
2.35.6


