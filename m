Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A54C9C4450E
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 11:54:31 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11153.1784202861976430540
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 04:54:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=NgQW9q94;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3587; q=dns/txt;
  s=iport01; t=1784202861; x=1785412461;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qJ2kl/0DeEXY/Qc05MoMCFYyYAu+JcxnAwxvlrDxIow=;
  b=NgQW9q94pj+WUURrOOnLAYfe4si7itQa4Pv1dS6QgtRZ4XmnkbX0eTf0
   TJWAUhPqJcHyzrTFLd4U6pYOL85Gn8jubBgH39MtYgRrfiTNEEfCJHI7y
   augXnsM3U4z4f+KVF1cPAZyjuNlW8O3LJ8H6Z7BucNEl7HMp0eas8EF7m
   j8XzxxHq4LPbMKn5BFH3H2P4e3yWk1fVjvArll80bz043k0EB8IlYwAU6
   n7qeeNI4l32a9R+DHdTbbsBLaF+oV0pS8maijfbv884WJOkAycKzgl4TA
   7TzEbNSfESWQAEgcnsQdKDnwofM/tRONj3K7CAnOwVCXUIgnUWT3+j5VH
   w==;
X-CSE-ConnectionGUID: veD+TIftRAGqpKzl9frG/Q==
X-CSE-MsgGUID: Xn8XVO1wTles8khHW/7WzA==
X-IPAS-Result: =?us-ascii?q?A0BHAgBtxVhq/4//Ja1aglmCV3ReQ0mEV5FzgRadCIF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYUFjVMCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2GWgECASYPAUYsAwECAwImAi0jGAkagmgBgnQDEb1HeoEygQGDa?=
 =?us-ascii?q?AJDUNsuAQsUAQWBBS6FP4MdAYUCXBgBhHwnGxuBcoEVgnN2gQWBXAEDGIEdh?=
 =?us-ascii?q?ASCagSCInoSgVoYBjIejy5IgQIcA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F?=
 =?us-ascii?q?zRYGwcFgR2BOoEAhHYjHwM5f4EvdUp3LWkBEheBToIUgTkDCxgNSBEsNxQbB?=
 =?us-ascii?q?D0BbgeNRyOCOAcxXQErT3aTeJJloQ8KKIN1jCGVOhozhVulEQuYfY4KllCEa?=
 =?us-ascii?q?YFoPIFHCwdwFYMiCUoZD444hWpXgj3IAicyAgEBBzIBAQcCBwIMAwuBaJAAL?=
 =?us-ascii?q?IFSAQE?=
IronPort-Data: A9a23:FBpir6lD4ohaUF8XUYDx59Ho5gzQJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJMW2CHO/uJYWrweo93YdiypE4BuJDQyNRjSwo++ygxRVtH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZC31GONgWYubDpLsvzb8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FZMV1qVLIG9Sz
 9U3MSgufBTSifiZh4vuH4GAhux7RCXqFJkUtnclyXTSCuwrBMidBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQTYT/7C7pm9AusrnX8fjlRqUOcjaE2+GPUigd21dABNfKII4XTGZ4MzhrwS
 mTuz2KpMi89bcOjzTeeonGsptCIwhzpcddHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1cEHhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Nxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:Lgxqr6vxMfk/eP0XYn2fisoC7skDVNV00zEX/kB9WHVpmwKj+P
 xG+85rsSMc6QxhPU3I9urgBEDtex7hHP1OkOss1NWZPDUO0VHAROoJ0WKI+VPd8kPFmtK1/J
 0QFJSWcOeAbmRSvILd/BSyFcomzZ2s9aClgvqb8lJWJDsaDZ2JK2xCe36m+oocfng+OaYE
X-Talos-CUID: =?us-ascii?q?9a23=3Ar314Lmun2i8xkjLEWiJtnVk36Is7f1Ge8FbeP3W?=
 =?us-ascii?q?RJn9xa6+RGFGK1+Rdxp8=3D?=
X-Talos-MUID: 9a23:d1s4cQskVnuXCDXlWM2ntDcyBPlPuruSDE0WwZYGm/bDahNiEmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,167,1779148800"; 
   d="scan'208";a="511143184"
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Jul 2026 11:54:21 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id 05F36180003B9;
	Thu, 16 Jul 2026 11:54:21 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id A0FE5CAB209; Thu, 16 Jul 2026 04:54:20 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][scarthgap][PATCH] gzip: Fix CVE-2026-41991
Date: Thu, 16 Jul 2026 04:54:15 -0700
Message-ID: <20260716115416.2004084-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.44.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 11:54:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241087

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix for CVE-2026-41991 as referenced
in [2], using the upstream commit identified in [1].

[1] https://cgit.git.savannah.gnu.org/cgit/gzip.git/commit/?id=4e6f8b24ab823146ab8776f0b7fe486ab34d4269
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-41991

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../gzip/gzip-1.13/CVE-2026-41991.patch       | 75 +++++++++++++++++++
 meta/recipes-extended/gzip/gzip_1.13.bb       |  1 +
 2 files changed, 76 insertions(+)
 create mode 100644 meta/recipes-extended/gzip/gzip-1.13/CVE-2026-41991.patch

diff --git a/meta/recipes-extended/gzip/gzip-1.13/CVE-2026-41991.patch b/meta/recipes-extended/gzip/gzip-1.13/CVE-2026-41991.patch
new file mode 100644
index 0000000000..9728b38658
--- /dev/null
+++ b/meta/recipes-extended/gzip/gzip-1.13/CVE-2026-41991.patch
@@ -0,0 +1,75 @@
+From 0af3a96047fe02690473d4e106c39552e0c1285e Mon Sep 17 00:00:00 2001
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
+index 6a20892..c643b2f 100644
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
+ * Noteworthy changes in release 1.13 (2023-08-19) [stable]
+ 
+ ** Changes in behavior
+diff --git a/gzexe.in b/gzexe.in
+index 5e3d4c2..f31b9c8 100644
+--- a/gzexe.in
++++ b/gzexe.in
+@@ -128,6 +128,7 @@ for i do
+     tmp=`mktemp "${dir}gzexeXXXXXXXXX"`
+   else
+     tmp=${dir}gzexe$$
++    (umask 77; set -C; > "$tmp")
+   fi && { cp -p "$file" "$tmp" 2>/dev/null || cp "$file" "$tmp"; } || {
+     res=$?
+     printf >&2 '%s\n' "$0: cannot copy $file"
+diff --git a/zdiff.in b/zdiff.in
+index e35e6fe..bbcc75b 100644
+--- a/zdiff.in
++++ b/zdiff.in
+@@ -157,12 +157,11 @@ case $file2 in
+                           *) TMPDIR=/tmp/;;
+                         esac
+                         if type mktemp >/dev/null 2>&1; then
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
+2.44.4
+
diff --git a/meta/recipes-extended/gzip/gzip_1.13.bb b/meta/recipes-extended/gzip/gzip_1.13.bb
index fd846b30a5..ca84e4315b 100644
--- a/meta/recipes-extended/gzip/gzip_1.13.bb
+++ b/meta/recipes-extended/gzip/gzip_1.13.bb
@@ -6,6 +6,7 @@ LICENSE = "GPL-3.0-or-later"
 
 SRC_URI = "${GNU_MIRROR}/gzip/${BP}.tar.gz \
            file://run-ptest \
+           file://CVE-2026-41991.patch \
            "
 SRC_URI:append:class-target = " file://wrong-path-fix.patch"
 
-- 
2.44.4


