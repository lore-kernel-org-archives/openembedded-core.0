Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CA8FCC6B03
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 06:57:36 +0000 (UTC)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10221.1775113048438605743
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 23:57:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=PpG3AfIa;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2317; q=dns/txt;
  s=iport01; t=1775113048; x=1776322648;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=1yvVojrpUi8ty43GsJgXdQB5BV6eVpHnceEY9j03+zo=;
  b=PpG3AfIadLQ9wwp4iWYDuM8+db34A+GlY3mETDtYPrlF9Z4CVRK6XCag
   UOZM4SZp8Vq/sasHJvsJzGfH+BAqvL1ZXj3hwEftb4GCVRaZfOWmKoTWq
   Bq/EdUk53UMvr+KJDXpm7fkN0FGfZ6n6MA3U1/IeSLXkMuXNtKMUzBVJX
   LAmZqbPY1QhquY61hWw2qCZvlRq6mY8uNztq94AOFtlFfsvnhArhRYzcJ
   KM+nvj/N/Db59Oiou3Kk4Hob1jzst06sKVwE8zQBLdpsKH9Ryc8Pe3EAY
   20bsUqezJmDOoJRIw2dGDVNsbDZM+iqhzkvx4aO1Q4q3DH9hv6OCnX96E
   w==;
X-CSE-ConnectionGUID: 3cPHwvBQRv6BozmskAJs+Q==
X-CSE-MsgGUID: m5NY5smVTZS8ZveY0c9VBw==
X-IPAS-Result: =?us-ascii?q?A0CaAgA/Es5p/47/Ja1aglmCV3FfQkmUKoIki2SSNoF/D?=
 =?us-ascii?q?wEBAQ9EDQQBAYUHAo0nAiY0CQ4BAgQBAQEBAwIDAQEBAQEBAQEBAQELAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZPDYZaAQIBAycLAVYcAwECLyALIwgZgwIBgjoDNgIBEbQYg?=
 =?us-ascii?q?XkzgQGDaAJDT9hHDYJSAQUGFAGBOIU+gnmFI1sYAYR6JxsbgXKBFYE7gi2BB?=
 =?us-ascii?q?YEaQgEDGIIThXcEgiKBDoFhjxlIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BI?=
 =?us-ascii?q?z4XgQwbBwWBS4dcdG2BE4N+VwMLGA1IESw3FBsEPm4Hi3MpgjaBDiyoIKAdc?=
 =?us-ascii?q?Qoog3SMHo8+hXwaM6prC5h7jgmECZJHhGiBaDyBRwsHcBWDIlIZD444hWiDF?=
 =?us-ascii?q?L8UIzUCCTMBBwIHDgKBc5F9AQE?=
IronPort-Data: A9a23:aFK1zKifa+rBiGB66VW+3UD+X161MREKZh0ujC45NGQN5FlHY01je
 htvUTyCOvnZZWahKI9yaNjn9RgF7Zfdm9cxHlFqq3pmRChjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeEULOZ82QsaDxMt/rZ8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqVD8d5XHn9kz
 MYGdhoKfBWYhMuU2/GCH7wEasQLdKEHPasFsX1miDWcBvE8TNWbHuPB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZg1/5JEWxI9EglHzfjBCoU6VooI84nPYy0p6172F3N/9JYTaH5gNwBbGz
 o7A12GkJCBHL9mh9Qi+okCyi96XlnLFcp1HQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBFmMHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn288Vte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:aSbMAqir89vg2AN1940AFH6toHBQXtsji2hC6mlwRA09TyX+rb
 HLoB1173HJYVoqNU3I3OrwW5VoIkmskKKdn7NxAV7KZmCP0wGVxcNZnOnfKlbbdBEWmNQw6U
 4ZSchD4BmaNykdsS48izPIdOod/A==
X-Talos-CUID: 9a23:/Nf4sW21SV2ztc8+grvesbxfQcsdUmLD5k7qPRGSDnRsU768a0TTwfYx
X-Talos-MUID: 9a23:arIx5wt8Gcnz5mgxIs2ngWxEBZpz5pqSOntdo4sLipGPZBJaJGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,155,1770595200"; 
   d="scan'208";a="708250686"
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by alln-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 02 Apr 2026 06:57:23 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id 010D118000341
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Apr 2026 06:57:23 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id A1115CC12B5; Wed,  1 Apr 2026 23:57:22 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter][PATCH v4 3/4] binutils: Fix CVE-2025-69649
Date: Wed,  1 Apr 2026 23:57:10 -0700
Message-Id: <20260402065710.3784045-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260317041229.2932275-1-deeratho@cisco.com>
References: <20260317041229.2932275-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 06:57:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234492

From: Deepak Rathore <deeratho@cisco.com>

Pick the patch [1] as mentioned in [2]

[1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=66a3492ce68e1ae45b2489bd9a815c39ea5d7f66
[2] https://nvd.nist.gov/vuln/detail/CVE-2025-69649

Signed-off-by: Deepak Rathore <deeratho@cisco.com>

diff --git a/meta/recipes-devtools/binutils/binutils-2.45.inc b/meta/recipes-devtools/binutils/binutils-2.45.inc
index 48579b3602..2f34037eed 100644
--- a/meta/recipes-devtools/binutils/binutils-2.45.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.45.inc
@@ -48,4 +48,5 @@ SRC_URI = "\
      file://0020-CVE-2025-11840.patch \
      file://CVE-2025-69648.patch \
      file://CVE-2025-69644_CVE-2025-69647.patch \
+     file://CVE-2025-69649.patch \
 "
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-69649.patch b/meta/recipes-devtools/binutils/binutils/CVE-2025-69649.patch
new file mode 100644
index 0000000000..05b382ea52
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-69649.patch
@@ -0,0 +1,41 @@
+From cc53801dff2ba4bc62eaa666b3b7d9401232089c Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Mon, 8 Dec 2025 15:58:33 +1030
+Subject: [PATCH] PR 33697, fuzzer segfault
+
+	PR 33697
+	* readelf.c (process_relocs): Don't segfault on no sections.
+
+CVE: CVE-2025-69649
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=66a3492ce68e1ae45b2489bd9a815c39ea5d7f66]
+
+(cherry picked from commit 66a3492ce68e1ae45b2489bd9a815c39ea5d7f66)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ binutils/readelf.c | 8 +++-----
+ 1 file changed, 3 insertions(+), 5 deletions(-)
+
+diff --git a/binutils/readelf.c b/binutils/readelf.c
+index 8f188e8c3e2..8d28b1c30e4 100644
+--- a/binutils/readelf.c
++++ b/binutils/readelf.c
+@@ -9621,13 +9621,11 @@ process_relocs (Filedata * filedata)
+       size_t i;
+       bool found = false;
+ 
+-      for (i = 0, section = filedata->section_headers;
+-	   i < filedata->file_header.e_shnum;
+-	   i++, section++)
+-	{
++      section = filedata->section_headers;
++      if (section != NULL)
++	for (i = 0; i < filedata->file_header.e_shnum; i++, section++)
+ 	  if (display_relocations (section, filedata))
+ 	    found = true;
+-	}
+ 
+       if (! found)
+ 	{
+-- 
+2.35.6
+
-- 
2.35.6


