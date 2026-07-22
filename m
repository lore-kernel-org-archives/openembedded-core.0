Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 600E9C4453A
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 10:08:38 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44511.1784714916011972994
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 03:08:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=eWiNgOU2;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3745; q=dns/txt;
  s=iport01; t=1784714916; x=1785924516;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dzf+3j9TFgoQ9jzANZhLlhrRuzaXIkAb2pBc959C+8c=;
  b=eWiNgOU2BzDWWlruzt/DYH9kzuRPdzUL0prWo9IXqPzZJ/kndsdaLdCK
   Tik0HSG6SmCmvRzuhvczFCTjVtaLVvo8hlc9rPQVhpl0rjaJVNTgu3CZW
   9N0qiA2GMGcD2c9JgHM/YreCucJP8XdyTQ7aB40g6VJbxe+VGRmGefbB6
   XvgZ7HnNjwHtoNHzfGFzaHssr/FN/hk0bKnxoSYEn9xJp77i/XdyQ85Dc
   qj2npXyRMBSmtkB69Lspo76kXUWv6G6J88p+P3kFKXX4h7ZtkxgFKyXA1
   I7Do4Xi6+PMR1vynWNnFVNql/a0UgDNXZyTCywFl4LzWOBiMnFzEk0U+N
   Q==;
X-CSE-ConnectionGUID: r2RQbmulSkuy4hDujXHynw==
X-CSE-MsgGUID: Muc8p38xQcKNevs2fYPNMA==
X-IPAS-Result: =?us-ascii?q?A0BHAgBAlWBq/47/Ja1aHgEBCxIMggULgld0XkNJlk2LZ?=
 =?us-ascii?q?JI3gX4PAQEBD0QNBAEBhQUCjVcCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBB?=
 =?us-ascii?q?QEBAQIBBwWBDhOGTw2GWgECAQMyARgBLRAcAwECLyALIwgZgwIBgjoDNwMRw?=
 =?us-ascii?q?GaCLIEBgygBPwJDUNhJDYJYAQsUAQWBM4U/gn2FI1wYAYR8JxsbgXKBFYNpg?=
 =?us-ascii?q?QWBGkIBgUmGXQSCIoEMgVoYBpAiSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdg?=
 =?us-ascii?q?SM+F4EMGwcFgR2BLoEChG4jHwM5f4EvdUp3LWkBEheBJoIUgToCgQMDCxgNS?=
 =?us-ascii?q?BEsNxQZBD5uB41pI4JAgQ4BKgGVZAeSN6AecQoog3WMIY8+hXwaM6psC5h9j?=
 =?us-ascii?q?gqECZJHhGmBaDyBRwsHcBWDIglKGQ+OKg4Lg2CBf8wGJzICCTIBAQcCBw4DC?=
 =?us-ascii?q?4FokX4BAQ?=
IronPort-Data: A9a23:48C7bK6uasC2ngD0LRYmTAxRtG7GchMFZxGqfqrLsTDasY5as4F+v
 jAeXGGAaK2IZDHwKosla9zgp0tVvsSHy4QxHgo/pCkxZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/qUzBHf/g2Qqaj1OsfrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eJ9ciw+xyHGV19
 uEJdDAhcxKzp/Ow3+fuIgVsrpxLwMjDJogTvDRkiDreF/tjGc2FSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkEVUrsUIMpWcOOAhmX/ej5RsnqepLE85C7YywkZPL3FbYOOKo3SG5kL9qqej
 kfb9DThWUEKDde87zeb6Siit9fpuAquDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXjVCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:8QHjGKC8X7umLoflHel055DYdb4zR+YMi2TDGXofdfUzSL3+qy
 nAppUmPHPP5Qr5HUtQ++xoW5PwJU80i6QU3WB5B97LN2PbUSmTXeRfBODZrQEIdReTygd179
 YHT0EHMqySMXFKyeDn/QK/D9EshPOD8KyumKPi6k0Fd3ASV0mlhD0JcTpy1SZNNXF7OaY=
X-Talos-CUID: =?us-ascii?q?9a23=3AHhD9v2prFpvAsKrE7yKXyWjmUdp/SETXyWrUGEy?=
 =?us-ascii?q?lGDppZKCXeX+B/rwxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3Aj4Qy3A7X9u7KXcNrr/eExhvDxoxN/q/+EBtdgaw?=
 =?us-ascii?q?NmO+JKzcqNQalqhGeF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,178,1779148800"; 
   d="scan'208";a="513890646"
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 22 Jul 2026 10:08:35 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id 200501800023F;
	Wed, 22 Jul 2026 10:08:35 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id BAA38CD144D; Wed, 22 Jul 2026 03:08:34 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [OE-core][wrynose][PATCH 2/4] wget: Fix CVE-2026-58470
Date: Wed, 22 Jul 2026 03:07:52 -0700
Message-Id: <20260722100754.1568842-2-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260722100754.1568842-1-hthakar@cisco.com>
References: <20260722100754.1568842-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 10:08:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241646

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://gitlab.com/gnuwget/wget/-/commit/43d3ba9336bc94937e6fae2365c6ffd30c34ffcf
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-58470

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../wget/wget/CVE-2026-58470.patch            | 79 +++++++++++++++++++
 meta/recipes-extended/wget/wget_1.25.0.bb     |  1 +
 2 files changed, 80 insertions(+)
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58470.patch

diff --git a/meta/recipes-extended/wget/wget/CVE-2026-58470.patch b/meta/recipes-extended/wget/wget/CVE-2026-58470.patch
new file mode 100644
index 0000000000..5d864c5fda
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/CVE-2026-58470.patch
@@ -0,0 +1,79 @@
+From 8740efcdd0d9e7eb04122f63bdb151f1f4d94af8 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Tim=20R=C3=BChsen?= <tim.ruehsen@gmx.de>
+Date: Mon, 29 Jun 2026 18:57:54 +0200
+Subject: [PATCH] * src/http.c (parse_content_range): Fix integer overflow
+
+Reported-by: TristanInSec@gmail.com
+
+CVE: CVE-2026-58470
+Upstream-Status: Backport [https://gitlab.com/gnuwget/wget/-/commit/43d3ba9336bc94937e6fae2365c6ffd30c34ffcf]
+
+(cherry picked from commit 43d3ba9336bc94937e6fae2365c6ffd30c34ffcf)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/http.c | 35 ++++++++++++++++++++++++-----------
+ 1 file changed, 24 insertions(+), 11 deletions(-)
+
+diff --git a/src/http.c b/src/http.c
+index 07af1867..ea2e591b 100644
+--- a/src/http.c
++++ b/src/http.c
+@@ -914,6 +914,7 @@ parse_content_range (const char *hdr, wgint *first_byte_ptr,
+                      wgint *last_byte_ptr, wgint *entity_length_ptr)
+ {
+   wgint num;
++  char *end;
+ 
+   /* Ancient versions of Netscape proxy server, presumably predating
+      rfc2068, sent out `Content-Range' without the "bytes"
+@@ -932,27 +933,39 @@ parse_content_range (const char *hdr, wgint *first_byte_ptr,
+     }
+   if (!c_isdigit (*hdr))
+     return false;
+-  for (num = 0; c_isdigit (*hdr); hdr++)
+-    num = 10 * num + (*hdr - '0');
+-  if (*hdr != '-' || !c_isdigit (*(hdr + 1)))
++
++  errno = 0;
++  num = strtol(hdr, &end, 10);
++  if (errno == ERANGE)
++    return false;
++  hdr = end;
++
++  if (*hdr++ != '-' || !c_isdigit (*hdr))
+     return false;
+   *first_byte_ptr = num;
+-  ++hdr;
+-  for (num = 0; c_isdigit (*hdr); hdr++)
+-    num = 10 * num + (*hdr - '0');
+-  if (*hdr != '/')
++
++  errno = 0;
++  num = strtol(hdr, &end, 10);
++  if (errno == ERANGE)
++    return false;
++  hdr = end;
++
++  if (*hdr++ != '/')
+     return false;
+   *last_byte_ptr = num;
+-  if (!(c_isdigit (*(hdr + 1)) || *(hdr + 1) == '*'))
++  if (!(c_isdigit (*hdr) || *hdr == '*'))
+     return false;
+   if (*last_byte_ptr < *first_byte_ptr)
+     return false;
+-  ++hdr;
+   if (*hdr == '*')
+     num = -1;
+   else
+-    for (num = 0; c_isdigit (*hdr); hdr++)
+-      num = 10 * num + (*hdr - '0');
++    {
++      errno = 0;
++      num = strtol(hdr, NULL, 10);
++      if (errno == ERANGE)
++        return false;
++    }
+   *entity_length_ptr = num;
+   if ((*entity_length_ptr <= *last_byte_ptr) && *entity_length_ptr != -1)
+     return false;
diff --git a/meta/recipes-extended/wget/wget_1.25.0.bb b/meta/recipes-extended/wget/wget_1.25.0.bb
index fb77754965..e8847de042 100644
--- a/meta/recipes-extended/wget/wget_1.25.0.bb
+++ b/meta/recipes-extended/wget/wget_1.25.0.bb
@@ -18,6 +18,7 @@ SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://CVE-2026-58469.patch \
            file://CVE-2026-58469-regression_p1.patch \
            file://CVE-2026-58469-regression_p2.patch \
+           file://CVE-2026-58470.patch \
            "
 
 SRC_URI[sha256sum] = "766e48423e79359ea31e41db9e5c289675947a7fcf2efdcedb726ac9d0da3784"
-- 
2.35.6


