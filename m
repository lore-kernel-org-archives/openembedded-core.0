Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1105CC6B38
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 06:53:26 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16261.1792133603787434259
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 23:53:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=eJCFOxW6;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3836; q=dns/txt;
  s=iport01; t=1792133603; x=1793343203;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=x8w16JOCJZ3u5qIMAUJxhV2dU/PpkIix6inJwfAlHTM=;
  b=eJCFOxW6CNvcHg7+rTWuP1SzHX0si89TUej9snPWVEiqsY6GpX33ZcOB
   mp/WaJx8uFyhpn6CVGBsxezbMur+sRkivW3YwzARRnv3ve3o8FeX02mR4
   rS9wxhdCnBWGHz6Q0xhpDIiD0c/RHdxq1FxTprpEBaP9KX6WZPW9lSyCG
   BChmnAP7W94Dn0tn38rO/NojaW0L3rfjqMVN+l34tzL5NAOhZWoODFKLO
   yYem0Z4Ry0ZsfWp64LBzjjjA0nj5047WGvDDnqAaMQovLYtfUzgqq4zQX
   J4jh1ULf9u5XyZGqAte61DOzrDJnhpLR0oUibFZfRFm0ImKYV5nZVOE/o
   w==;
X-CSE-ConnectionGUID: uxsFx1g6SkGMaYHL2PoA8g==
X-CSE-MsgGUID: mhiOUXHfS0Wm2UcDGC7RLw==
X-IPAS-Result: =?us-ascii?q?A0AoAADEyNFq/5X/Ja1aHQEBAQEJARIBBQUBgXwIAQsBg?=
 =?us-ascii?q?lZ1YENJjHKJWAOLZZI3gXQKDwEBAQ8uDxQEAQGFBQKOFQImNAkOAQIEAwIDA?=
 =?us-ascii?q?QEBAQEBAQEBAQEBCgEBBQEBAQIBBwWBDhOGTw2QEgECAQMBJgsBGAEtEBwDA?=
 =?us-ascii?q?QIvIAcEIwgZgwIBgjoDNwMRBrxkgXkzgQGDKQE/AkNQ2EsNgloBCxQBgTgBh?=
 =?us-ascii?q?T+Cf4UkXRgBhHwnGxuBcoEVg2mBBYEaQgECAoEqC4ZtBIIigQyBWh5llERIg?=
 =?us-ascii?q?R4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIz4XgQcbBgWBHYEgghYjGTZ6gQleg?=
 =?us-ascii?q?SspYAEQF4EJggcCglSCAAIBSUEOB0VTCSVDEkcmIggSCQETGjALgRs4PAkoQ?=
 =?us-ascii?q?RcMcwwdBXIIAg0JBykYDUgRLDcVGQQ+bgeSFB6CZXUGEwEpAoFNpDOCIaAec?=
 =?us-ascii?q?Qoog3aMIo0+ggCFfBozqm8LmH2OCoQJkkaEaYFoPIEoHwsHcBVIDoJMCUoZD?=
 =?us-ascii?q?445hWqCWcoCJzICOwEBBwIHDgMLgWiQAYF9AQE?=
IronPort-Data: A9a23:14cxO6J9i19sCA1GFE+RgJQlxSXFcZb7ZxGr2PjKsXjdYENS3jMOy
 2JOW2GPO/qDZGv0eox0adzn9E0OuMOEx9JlHQod+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZpCCea+Uf1WlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnS0
 T/Oi5eHYgH8g2cqajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1zHFoYLdQXpN10LkRHx
 Nw8cggKR0CM0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSAV7AtQIvIROPB4towMDUY358VW62BI
 ZBENHw2MEWojx5nYj/7DLoyn+qsj3juehVTqUmeouw85G27IAlZjeOzaoKJIYPQLSlTtkOYp
 0X7z0T3OUklMYaiwhaq2S2WovCayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRulzfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:tTFb86/c2ccfFxnZeSRuk+D6I+orL9Y04lQ7vn2ZhyY7TiX+rb
 HIoB11737JYVoqNU3I3OrwWpVoIkmskaKdn7NwAV7KZmCP0wGVxcNZnO7fKlbbdREWmNQw6U
 4ZSdkcNPTASX5nkM39/A60V/wkwNWB7eSUoN229QYKcemvAJsQlzuQzW2gYzRLeDU=
X-Talos-CUID: 9a23:jaqv2W1+78/mfYIDGchhpbxfB9A+XG2EwynrIGCdAFdJbOetTnbA9/Yx
X-Talos-MUID: =?us-ascii?q?9a23=3A4RoAZAyOocM+uMcyyaQbdzKTn3aaqKGuCWcwobU?=
 =?us-ascii?q?IgJG7MHZNMBuyp2uNZpByfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536204372"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 06:53:22 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id 91DC0180001CF;
	Fri, 16 Oct 2026 06:53:22 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 3B782CBF202; Thu, 15 Oct 2026 23:53:22 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH 3/3] busybox: fix CVE-2026-38755
Date: Thu, 15 Oct 2026 23:53:14 -0700
Message-Id: <20261016065314.3923094-3-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016065314.3923094-1-dkelaiya@cisco.com>
References: <20261016065314.3923094-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 06:53:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247998

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix shown in [1].
The advisory identifying the fix is referenced in [2].

[1] https://lists.busybox.net/pipermail/busybox/2026-June/092354.html
[2] https://nvd.nist.gov/vuln/detail/cve-2026-38755

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../busybox/busybox/CVE-2026-38755.patch      | 70 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.37.0.bb   |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2026-38755.patch

diff --git a/meta/recipes-core/busybox/busybox/CVE-2026-38755.patch b/meta/recipes-core/busybox/busybox/CVE-2026-38755.patch
new file mode 100644
index 00000000000..4e79e3847f4
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2026-38755.patch
@@ -0,0 +1,70 @@
+From 0efa89307bb63c456d25adfb352c3dcc48d8760b Mon Sep 17 00:00:00 2001
+From: Sanghyun Park <sanghyun.park.cnu@gmail.com>
+Date: Tue, 16 Jun 2026 12:19:27 +0900
+Subject: [PATCH] ash: fix stack overflow in evalfun()
+
+Recursive shell functions can repeatedly enter evalfun() until the
+process stack is exhausted. Track active shell function calls and raise a
+normal shell error when the recursion limit is reached.
+
+The counter is decremented through the existing funcdone cleanup path so
+errors raised from inside the function body unwind it correctly.
+
+CVE: CVE-2026-38755
+Upstream-Status: Submitted [https://lists.busybox.net/pipermail/busybox/2026-June/092354.html]
+
+Signed-off-by: Sanghyun Park <sanghyun.park.cnu@gmail.com>
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ shell/ash.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/shell/ash.c b/shell/ash.c
+index bbd7307..a66d3cc 100644
+--- a/shell/ash.c
++++ b/shell/ash.c
+@@ -414,6 +414,7 @@ struct globals_misc {
+ 	int shlvl;
+ #define rootshell (!shlvl)
+ 	int errlinno;
++	unsigned func_depth;
+ 
+ 	char *minusc;  /* argument to -c option */
+ 
+@@ -506,6 +507,7 @@ extern struct globals_misc *BB_GLOBAL_CONST ash_ptr_to_globals_misc;
+ #define rootpid     (G_misc.rootpid    )
+ #define shlvl       (G_misc.shlvl      )
+ #define errlinno    (G_misc.errlinno   )
++#define func_depth  (G_misc.func_depth )
+ #define minusc      (G_misc.minusc     )
+ #define curdir      (G_misc.curdir     )
+ #define physdir     (G_misc.physdir    )
+@@ -9920,6 +9922,10 @@ evalfun(struct funcnode *func, int argc, char **argv, int flags)
+ 	int savefuncline;
+ 	char *savefuncname;
+ 	char *savetrap = NULL;
++	enum { MAX_ASH_FUNC_DEPTH = 1000 };
++
++	if (func_depth >= MAX_ASH_FUNC_DEPTH)
++		ash_msg_and_raise_error("function recursion limit exceeded");
+ 
+ 	if (!Eflag) {
+ 		savetrap = trap[NTRAP_ERR];
+@@ -9938,6 +9944,7 @@ evalfun(struct funcnode *func, int argc, char **argv, int flags)
+ 	exception_handler = &jmploc;
+ 	shellparam.malloced = 0;
+ 	func->count++;
++	func_depth++;
+ 	funcname = func->n.ndefun.text;
+ 	funcline = func->n.ndefun.linno;
+ 	INT_ON;
+@@ -9959,6 +9966,7 @@ evalfun(struct funcnode *func, int argc, char **argv, int flags)
+ 	}
+ 	funcline = savefuncline;
+ 	lineno = savelineno;
++	func_depth--;
+ 	freefunc(func);
+ 	freeparam(&shellparam);
+ 	shellparam = saveparam;
+-- 
+2.35.6
diff --git a/meta/recipes-core/busybox/busybox_1.37.0.bb b/meta/recipes-core/busybox/busybox_1.37.0.bb
index 8da8338a57b..744ab03451a 100644
--- a/meta/recipes-core/busybox/busybox_1.37.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.37.0.bb
@@ -69,6 +69,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://CVE-2026-38752.patch \
            file://CVE-2026-38753.patch \
            file://CVE-2026-38754.patch \
+           file://CVE-2026-38755.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg"
 SRC_URI:append:x86-64 = " file://sha_accel.cfg"
-- 
2.35.6


