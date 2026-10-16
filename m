Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B691CCCA46D
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 06:53:26 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16259.1792133603517260169
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 23:53:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=JR72ZV+V;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3349; q=dns/txt;
  s=iport01; t=1792133603; x=1793343203;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jvaEU70EiQprn3b8Er25E5mwr7T0Sj9XKBhTBlhIp+0=;
  b=JR72ZV+VEIvJsy+hemC9nP515r9zM6JlurMqipQe09bF9I5HJSxMbi/u
   N/wNkJYUAeBOUoCz+fMI7aF6Ede6qYyL5Vw7qX/DQYAutW+2YDi9Q/+08
   929chV6cs9v4V+cKHw+bBYVZBvtus2VvvHHyFZn+lfMzzwf+ZV7D3eIEs
   vBRku8nFaYGSwyK8/TOWUECRhFqmxHXtgYrudISNnDIU1+NE9Bhn6a3fd
   6GNPbQOme4qI+Voi5fzLNO0FpPKhK8BtlyBgGGAlIwEIXLn02+XF8wgdO
   4hH0chA+VPZj+T7ODKrM7hpxRh6F3H4U+cYYosw2eDxOUzAgvAbdj3Ryp
   w==;
X-CSE-ConnectionGUID: OsY4ajDZQyy0ZxVgKgB5Dw==
X-CSE-MsgGUID: i6n/2t9YTwafjsTzwBQiUA==
X-IPAS-Result: =?us-ascii?q?A0BeAgDEyNFq/5D/Ja1aglmCV3VgQ0mWSgOLZZI3gXQKD?=
 =?us-ascii?q?wEBAQ8uDxQEAQGFBQKOFQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2QEgECAQMBMQEYAS0QHAMBAi8gBwQjCBmDAgGCOgM3AxEGv?=
 =?us-ascii?q?GSCLIEBgykBPwJDUNhLDYJaAQsUAYE4hUCCf4UkXRgBhHwnGxuBcoEVg2mBB?=
 =?us-ascii?q?YEaQgECAoFHhlsEgiKBDIFaHmWUREiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yH?=
 =?us-ascii?q?YEjPheBBxsGBYEdgSCCFiMZNnqBCV6BKylgARAXgQmCBwKCVIIAAgFJQQ4HR?=
 =?us-ascii?q?VMJJUMSRyYiCBIJARMaMAuBGzg8CShBFwxzDB0FcggCDQkHKRgNSBEsNxUZB?=
 =?us-ascii?q?D5uB5IUHoJkATFdARMWAqYAgiGgHnEKKIN2jCKNPoIAhXwaM6pvC5h9jgqEC?=
 =?us-ascii?q?ZJGhGmBaDyBKB8LB3AVSA6CTAlKGQ+OOYVqglnKAicyAjsBAQcCBw4DC4Fok?=
 =?us-ascii?q?AGBfQEB?=
IronPort-Data: A9a23:939koKrNM6W4Jo8yOhqPwPmMwEheBmJJZBIvgKrLsJaIsI4StFCzt
 garIBmEbv7cNzSjeYsjbIi+oUwD6JTWm9dmQABlrnw9ESgSpePIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOWn9T8jhfngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgDNNwJcaDpOtfvb8U035ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0sFsMD1H9
 9AqESEcNiKTue2Vz5jmZvY506zPLOGzVG8ekmtrwTecCbMtRorOBv2Vo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LVPrSn8/w7pX7WzFbpVacpLs+y2PS1wd2lrPqNbI5f/TXHpgLxB/J+
 TyuE2LRA08cc4aDmAu57XuihPTzjzzRYYMvPejtnhJtqBjJroAJMzURTVa9rPyzh0KyVt4aI
 EsO9wIqrLMu7wqsVtT7UhiyrXKIsxJaXMBfe9DW8ymXwabSpgLcDW8eQ3sZN5ottdQ9Qnoh0
 Vrhc87VOAGDeYa9ERq1nop4ZxvrUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:DIRiJaiVEL3QEzzQgApZWoKajXBQXvgji2hC6mlwRA09TyVXra
 +TdZMgpHjJYVkqOU3I9ersBEDEewK/yXcX2/h0AV7dZmnbUQKTRekIh7cKgQeQfhEWndQy6U
 4PScRD4aXLfDtHpPe/xhWkGNA9x9TC2qWpieDCi0pJd2hRGsddB8MTMHfiLqWwLzM2fKYEKA
 ==
X-Talos-CUID: 9a23:isoAj299Ck6BlRobXJ6Vv2kPK5wscFHv9WbBe32oN2lKR5fIZUDFrQ==
X-Talos-MUID: 9a23:LdzgGQZMzapOleBTtmHqw2t+ZfZU/K2gClsxg4osgsi5HHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="535621976"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 06:53:22 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id 8F6AF1800049A;
	Fri, 16 Oct 2026 06:53:22 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 36808CBF201; Thu, 15 Oct 2026 23:53:22 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH 2/3] busybox: fix CVE-2026-38753
Date: Thu, 15 Oct 2026 23:53:13 -0700
Message-Id: <20261016065314.3923094-2-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016065314.3923094-1-dkelaiya@cisco.com>
References: <20261016065314.3923094-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 06:53:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247996

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix shown in [1].
The advisory identifying the fix is referenced in [2].

[1] https://lists.busybox.net/pipermail/busybox/2026-June/092352.html
[2] https://nvd.nist.gov/vuln/detail/cve-2026-38753

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../busybox/busybox/CVE-2026-38753.patch      | 54 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.37.0.bb   |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2026-38753.patch

diff --git a/meta/recipes-core/busybox/busybox/CVE-2026-38753.patch b/meta/recipes-core/busybox/busybox/CVE-2026-38753.patch
new file mode 100644
index 00000000000..b7095b0d379
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2026-38753.patch
@@ -0,0 +1,54 @@
+From 2ab1e56dbb740769b703822d839222c68813a97b Mon Sep 17 00:00:00 2001
+From: Sanghyun Park <sanghyun.park.cnu@gmail.com>
+Date: Tue, 16 Jun 2026 12:18:43 +0900
+Subject: [PATCH] awk: fix use-after-free in awk_sub()
+
+awk_sub() receives the replacement text as a pointer into awk variable
+storage. Evaluating the regular expression argument can change that
+storage through as_regex(), leaving the replacement pointer dangling
+before strlen() and the replacement loop use it.
+
+Copy the replacement string before calling as_regex() so substitution
+uses stable storage for the duration of the operation.
+
+CVE: CVE-2026-38753
+Upstream-Status: Submitted [https://lists.busybox.net/pipermail/busybox/2026-June/092352.html]
+
+Signed-off-by: Sanghyun Park <sanghyun.park.cnu@gmail.com>
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ editors/awk.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/editors/awk.c b/editors/awk.c
+index 299e480..e0781ee 100644
+--- a/editors/awk.c
++++ b/editors/awk.c
+@@ -2561,6 +2561,7 @@ static char *awk_printf(node *n, size_t *len)
+ static int awk_sub(node *rn, const char *repl, int nm, var *src, var *dest /*,int subexp*/)
+ {
+ 	char *resbuf;
++	char *repl_copy;
+ 	const char *sp;
+ 	int match_no, residx, replen, resbufsize;
+ 	int regexec_flags;
+@@ -2578,7 +2579,9 @@ static int awk_sub(node *rn, const char *repl, int nm, var *src, var *dest /*,in
+ 	resbuf = NULL;
+ 	residx = 0;
+ 	match_no = 0;
++	repl_copy = xstrdup(repl);
+ 	regex = as_regex(rn, &sreg);
++	repl = repl_copy;
+ 	sp = getvar_s(src ? src : intvar[F0]);
+ #if defined(REG_STARTEND)
+ 	src_string = sp;
+@@ -2668,6 +2671,7 @@ static int awk_sub(node *rn, const char *repl, int nm, var *src, var *dest /*,in
+ 	setvar_p(dest ? dest : intvar[F0], resbuf);
+ 	if (regex == &sreg)
+ 		regfree(regex);
++	free(repl_copy);
+ 	return match_no;
+ }
+ 
+-- 
+2.35.6
diff --git a/meta/recipes-core/busybox/busybox_1.37.0.bb b/meta/recipes-core/busybox/busybox_1.37.0.bb
index d4352fd4cbe..8da8338a57b 100644
--- a/meta/recipes-core/busybox/busybox_1.37.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.37.0.bb
@@ -67,6 +67,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://CVE-2026-29004-01.patch \
            file://CVE-2026-29004-02.patch \
            file://CVE-2026-38752.patch \
+           file://CVE-2026-38753.patch \
            file://CVE-2026-38754.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg"
-- 
2.35.6


