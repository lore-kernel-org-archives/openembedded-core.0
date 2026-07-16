Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B37FCC4450E
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 11:37:31 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10861.1784201850803516528
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 04:37:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=h+SL38jQ;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3583; q=dns/txt;
  s=iport01; t=1784201850; x=1785411450;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qaIEb6wq5t5QsiAYz3dIVAv/ZnZq/JgmAHQxF1N9X7A=;
  b=h+SL38jQ/9XmABjAwSwCowR/LJRNRIrf87zUSdfsAO7XY3/cO0Q15v53
   6kAJeRZ7Y0pwNYkARJ3fq2NzRIAQQjeg2Bois7cXLODWYcVb8SQnUwqTX
   qVK4L8aRcHjHsgjGI7ApeOdH1O6TC04j3nzJw27Gp5PvX4rH65m+WitKG
   Cw69j5GGMaWv5TAC49lWk4PDvRs18YjiPg5mp2EXKw8yrAQbob4FeeF7D
   HGDQs3h1JMFyzGRdrA+Pc3wCoFL1ZkP1jf0cPM6G3HLJns7A5ZhObcuBg
   cb48asBPMNZJ1AxorHbeUr+B/plFXNRQznLKlX4xT5dElyjksXun2HIUk
   w==;
X-CSE-ConnectionGUID: Z9z4222dSoWLt+J0hO+Tog==
X-CSE-MsgGUID: TG0jyyQJTdu5DDm59U4zbA==
X-IPAS-Result: =?us-ascii?q?A0BHAgCTwVhq/43/Ja1aglmCV3ReQ0mEV5FzgRadCIF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYUFjVMCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2GWgECASYPAUYsAwECAwImAi0jGAkagmgBgnQDEb1VeoEygQGDa?=
 =?us-ascii?q?AJDUNsuAQsUAQWBBS6FP4MdAYUCXBgBhHwnGxuBcoEVgnN2gQWBXAEDGIEdh?=
 =?us-ascii?q?ASCagSCInoSgVoYBjIejy5IgQIcA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F?=
 =?us-ascii?q?zRYGwcFgR2BOoEAhHYjHwM5f4EvdUp3LWkBEheBToIUgTkDCxgNSBEsNxQbB?=
 =?us-ascii?q?D0BbgeNRyOCOAcxXQErT3aTeJJloQ8KKIN1jCGVOhozhVulEQuYfY4KllCEa?=
 =?us-ascii?q?YFoPIFHCwdwFYMiCUoZD444hWpXgj3HeCcyAgEBBzIBAQcCBwIMAwuBaJAAL?=
 =?us-ascii?q?IFSAQE?=
IronPort-Data: A9a23:XaeMFavrfg370G9jepaJ0+xi1efnVAdfMUV32f8akzHdYApBsoF/q
 tZmKTiAPvvbYGKjct10aNjk8k8A6seDy4QwGwJl+30wRitBgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZTdJ5xYuajhKs/3a9ks21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIwyLdlXTsUr
 /AjLw8pclOh3+KRg468Rbw57igjBJGD0II3oHpsy3TdSP0hW52GG/mM7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtOYH49tL/Aan3Xfz5VrFuUtKMf6GnIxws327/oWDbQUoHTHJwOwxvB9
 woq+UzFLUkYJc2m6waJ7y+AquqSzB6nSog7QejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dUL
 FYZ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2YdLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWja1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:707Xuquhc/c2wcpd3kv0Aj0a7skDVNV00zEX/kB9WHVpmwKj+P
 xG+85rsSMc6QxhPU3I9urgBEDtex7hHP1OkOss1MmZPDUO0VHAROoJ0WKI+VPd8kPFmtK1/J
 0QFJSWcOeAbmRSvILd/BSyFcomzZ2s9aClgvqb8lJWJDsaDZ2JK2xCe36m+oocfng+OaYE
X-Talos-CUID: 9a23:EE8qUW6eQJgMJR/tFtssxh8GRpp/KHHmy0j0PwyaUWZOC4GSRgrF
X-Talos-MUID: 9a23:3qZ5KgUMBAC87nLq/APD3DNzJf5K36izVWwhlMhXhpWWPwUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,167,1779148800"; 
   d="scan'208";a="511135519"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Jul 2026 11:37:29 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id AE42018000186;
	Thu, 16 Jul 2026 11:37:29 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 55D23CAB209; Thu, 16 Jul 2026 04:37:29 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH] gzip: Fix CVE-2026-41991
Date: Thu, 16 Jul 2026 04:37:12 -0700
Message-Id: <20260716113712.1959863-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 11:37:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241086

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix for CVE-2026-41991 as referenced
in [2], using the upstream commit identified in [1].

[1] https://cgit.git.savannah.gnu.org/cgit/gzip.git/commit/?id=4e6f8b24ab823146ab8776f0b7fe486ab34d4269
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-41991

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../gzip/gzip-1.14/CVE-2026-41991.patch       | 75 +++++++++++++++++++
 meta/recipes-extended/gzip/gzip_1.14.bb       |  1 +
 2 files changed, 76 insertions(+)
 create mode 100644 meta/recipes-extended/gzip/gzip-1.14/CVE-2026-41991.patch

diff --git a/meta/recipes-extended/gzip/gzip-1.14/CVE-2026-41991.patch b/meta/recipes-extended/gzip/gzip-1.14/CVE-2026-41991.patch
new file mode 100644
index 0000000000..20c35fe352
--- /dev/null
+++ b/meta/recipes-extended/gzip/gzip-1.14/CVE-2026-41991.patch
@@ -0,0 +1,75 @@
+From b1545c47cddc9948cb0743b2ceb140a63c88acbc Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Thu, 16 Apr 2026 12:11:44 -0700
+Subject: [PATCH] gzexe: use -C if lacking mktemp
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+(Problem reported by Michał Majchrowicz.)
+* gzexe.in: If mktemp is needed but not installed,
+use ‘set -C’ to avoid a race when creating a temporary file.
+* zdiff.in: Use the same pattern here, even though the old
+code was probably OK anyway.
+
+CVE: CVE-2026-41991
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/gzip.git/commit/?id=4e6f8b24ab823146ab8776f0b7fe486ab34d4269]
+
+(cherry picked from commit 4e6f8b24ab823146ab8776f0b7fe486ab34d4269)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ NEWS     | 5 +++++
+ gzexe.in | 1 +
+ zdiff.in | 7 +++----
+ 3 files changed, 9 insertions(+), 4 deletions(-)
+
+diff --git a/NEWS b/NEWS
+index 53bdf56..2d2eb81 100644
+--- a/NEWS
++++ b/NEWS
+@@ -1,5 +1,10 @@
+ GNU gzip NEWS                                    -*- outline -*-
+ 
++  On old-fashioned or limited platforms lacking mktemp, gzexe and
++  zdiff no longer have a race when creating a temporary file.
++  [bug present since the beginning]
++
++
+ * Noteworthy changes in release 1.14 (2025-04-09) [stable]
+ 
+ ** Bug fixes
+diff --git a/gzexe.in b/gzexe.in
+index 1267d6e..09a2571 100644
+--- a/gzexe.in
++++ b/gzexe.in
+@@ -127,6 +127,7 @@ for i do
+     tmp=`mktemp "${dir}gzexeXXXXXXXXX"`
+   else
+     tmp=${dir}gzexe$$
++    (umask 77; set -C; > "$tmp")
+   fi && { cp -p "$file" "$tmp" 2>/dev/null || cp "$file" "$tmp"; } || {
+     res=$?
+     printf >&2 '%s\n' "$0: cannot copy $file"
+diff --git a/zdiff.in b/zdiff.in
+index a8689a0..c04a8c0 100644
+--- a/zdiff.in
++++ b/zdiff.in
+@@ -156,12 +156,11 @@ case $file2 in
+                           *) TMPDIR=/tmp/;;
+                         esac
+                         if command -v mktemp >/dev/null 2>&1; then
+-                          tmp=`mktemp "${TMPDIR}zdiffXXXXXXXXX"` ||
+-                            exit 2
++                          tmp=`mktemp "${TMPDIR}zdiffXXXXXXXXX"`
+                         else
+-                          set -C
+                           tmp=${TMPDIR}zdiff$$
+-                        fi
++                          (umask 77; set -C; > "$tmp")
++                        fi &&
+                         'gzip' -cdfq -- "$file2" > "$tmp" || exit 2
+                         gzip_status=$(
+                           exec 4>&1
+-- 
+2.53.0
+
diff --git a/meta/recipes-extended/gzip/gzip_1.14.bb b/meta/recipes-extended/gzip/gzip_1.14.bb
index c7837cdae0..f3c8cc6050 100644
--- a/meta/recipes-extended/gzip/gzip_1.14.bb
+++ b/meta/recipes-extended/gzip/gzip_1.14.bb
@@ -6,6 +6,7 @@ LICENSE = "GPL-3.0-or-later"
 
 SRC_URI = "${GNU_MIRROR}/gzip/${BP}.tar.gz \
            file://run-ptest \
+           file://CVE-2026-41991.patch \
            "
 SRC_URI:append:class-target = " file://wrong-path-fix.patch"
 
-- 
2.35.6


