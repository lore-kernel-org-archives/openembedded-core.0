Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CE22CA5FFF
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 09:23:56 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16133.1791192228872231660
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Oct 2026 02:23:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=UeykYd6X;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3346; q=dns/txt;
  s=iport01; t=1791192228; x=1792401828;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gXHW8rSiFUZKra4+wlt4bwickkJVQNpF7+sPEE6ibo0=;
  b=UeykYd6XKfFbXAEcmeNRlicPY85J6cK7wqfkB6g9ZpaI9kM6K1e2K6EQ
   4RSPw5rFeb5m1QFII/bH7Y56WzoJbq7w2ntkPeekG/nEvb5ASiNsCrN9U
   YX0DXvKf+q0/FsyB2PkfDKLuZ5xAL3yeyu8EofkcZcw+Pcs+6Hwp3fVKG
   +ThrdZlaT4/pglO2s86OBvC+Zvn+z2zNGOMwR9wBP9EnF4aBf/e1I/hKW
   YpkEGeEHZbU9rEviArxrByUAknkZu7jBgcX/c5WDJVl7RKja3A3hvJdwF
   /mQSJvoZUXKZpQU2TrtcdpGB9FRg07wtrR+Hnv7I6kW37Gy/QaeNli35K
   Q==;
X-CSE-ConnectionGUID: li9eVVuVSD6L9VvK+2fU8Q==
X-CSE-MsgGUID: t+pI71z+R6C3NGdZP+IscA==
X-IPAS-Result: =?us-ascii?q?A0BIAgA6a8Nq/5P/Ja1aHgEBCxIMggULgld1YUJJlkoDi?=
 =?us-ascii?q?2SSNoF+DwEBAQ9EDQQBAYQ/RgKOCQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBC?=
 =?us-ascii?q?gEBBQEBAQIBBwWBDhOGTw2QEgECAQMyARgBLRAcAwECLyALIwgZgwIBgjoDN?=
 =?us-ascii?q?wIBEbU1giyBAYMpAT8CQ1DYSw2CWgELFAEFgTOFQIJ/hSRdGAGEfCcbG4Fyg?=
 =?us-ascii?q?RWDaYEFgRpCAQECiCMEgiKBDIFaHpNOSIEeA1ksAVUTDQoLBwWBZgM1EioVb?=
 =?us-ascii?q?jIdgSM+F4EHGwYFgR2BIIIWIxk2eoEJXoErKWABEBeBCYIHAoJUggACAUlBD?=
 =?us-ascii?q?gdFUwklRRJHJiIIEgkBExowC4EbODwJKEQXDBAYDUgRLDcVGQQ+bgeQUB6CE?=
 =?us-ascii?q?zoMB4EOASoBpgGCIaAecQoog3aMIo8+hXwaM6pvC5h9jgqECZJHhGmBaDyBR?=
 =?us-ascii?q?wsHcBWDIglKGQ+OOYNrgX+DFMcmJDUCCTIBAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:qO5tgq4tmFpw6pdYzWHhrQxRtG7GchMFZxGqfqrLsTDasY5as4F+v
 jRJWG6FPfiKZTDzetlzbd7koEtQvpSAx4diHFM6qng0Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOex9RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/KUzBHf/g2QqazpMt/rZwP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eOYxJ99hJHF912
 aI8eQ4TTVPZid/m+efuIgVsrpxLwMjDJogTvDRkiDreF/tjGMiFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkEQUrsUIMpWcOOAhmX/ej5RsnqepLE85C7YywkZPL3FbYGNJIbXGJ8F9qqej
 n6F50WmWwNZDoK0khyq/kCUxc7UlgquDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXzBCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1rN94cRva1fApEFI/
IronPort-HdrOrdr: A9a23:msxwya3Yk1M65YtyqO55OAqjBGokLtp133Aq2lEZdPWaSKOlfq
 eV7ZMmPHDP6Qr5NEtMpTnEAtjjfZq+z+8Q3WBuB9eftWDd0QPCRr2Kr7GSpgEIcBeRygcy78
 tdmoFFebvN5CBB/KXHyTj9Nco8y9+a963tr+Lfw3BxCTxOUchbnn5E4sLxKDwMeOGAbqBJbK
 ah2g==
X-Talos-CUID: 9a23:I4wRq2OygoV71u5DXCg2+XAqB/4eXiP5nUnOAAziB1s5cejA
X-Talos-MUID: =?us-ascii?q?9a23=3A//d42Q0tL3axrbuiH7IvrgdlmzUj/+e2KR9Ug9Y?=
 =?us-ascii?q?85eLfEwN8CQ/erS+8a9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,141,1787011200"; 
   d="scan'208";a="530625528"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Oct 2026 09:23:47 +0000
Received: from sjc-ads-4178.cisco.com (sjc-ads-4178.cisco.com [171.70.54.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id BD1CC180008A1;
	Mon,  5 Oct 2026 09:23:47 +0000 (GMT)
Received: by sjc-ads-4178.cisco.com (Postfix, from userid 1887505)
	id EFC68CC129C; Mon,  5 Oct 2026 02:23:46 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][scarthgap][PATCH v2 2/8] libxml2: Fix CVE-2026-86138
Date: Mon,  5 Oct 2026 02:23:40 -0700
Message-Id: <20261005092346.1670265-2-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261005092346.1670265-1-hthakar@cisco.com>
References: <20261005092346.1670265-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4178.cisco.com [171.70.54.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.199, sjc-ads-4178.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2026 09:23:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247227

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/GNOME/libxml2/commit/a4cba4b5b5a8c42e155ed42d2d2a44955465a2e4
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-86138

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../libxml/libxml2/CVE-2026-86138.patch       | 52 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.12.10.bb   |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-86138.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-86138.patch b/meta/recipes-core/libxml/libxml2/CVE-2026-86138.patch
new file mode 100644
index 0000000000..9b918f7570
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2026-86138.patch
@@ -0,0 +1,52 @@
+From d2e3efc8502313a1099ccc4aac19e8e03734e8c9 Mon Sep 17 00:00:00 2001
+From: mohammadmseet-hue <mohammadmseet@gmail.com>
+Date: Thu, 16 Apr 2026 02:54:24 +0200
+Subject: [PATCH] fix: add overflow checks to xmlDictAddQString in dict.c
+
+xmlDictAddString has overflow guards for pool size calculations, but its
+sibling xmlDictAddQString lacks these entirely. The namelen + plen + 1
+addition can overflow unsigned int, and 4 * (overflowed_value) produces
+a small allocation, leading to heap buffer overflow when memcpy writes
+the prefix and name.
+
+Add the same SIZE_MAX-based overflow guards and safe size_t cast.
+
+CVE: CVE-2026-86138
+Upstream-Status: Backport [https://github.com/GNOME/libxml2/commit/a4cba4b5b5a8c42e155ed42d2d2a44955465a2e4]
+
+(cherry picked from commit a4cba4b5b5a8c42e155ed42d2d2a44955465a2e4)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ dict.c | 19 +++++++++++++++----
+ 1 file changed, 15 insertions(+), 4 deletions(-)
+
+diff --git a/dict.c b/dict.c
+index d7156ed3..ae0210ea 100644
+--- a/dict.c
++++ b/dict.c
+@@ -225,10 +225,21 @@ xmlDictAddQString(xmlDictPtr dict, const xmlChar *prefix, unsigned int plen,
+             return(NULL);
+         }
+ 
+-        if (size == 0) size = 1000;
+-	else size *= 4; /* exponential growth */
+-        if (size < 4 * (namelen + plen + 1))
+-	    size = 4 * (namelen + plen + 1); /* just in case ! */
++        if (size == 0) {
++            size = 1000;
++        } else {
++            if (size < (SIZE_MAX - sizeof(xmlDictStrings)) / 4)
++                size *= 4; /* exponential growth */
++            else
++                size = SIZE_MAX - sizeof(xmlDictStrings);
++        }
++        if (size / 4 < namelen + plen + 1) {
++            if ((size_t) namelen + plen + 1 <
++                    (SIZE_MAX - sizeof(xmlDictStrings)) / 4)
++                size = 4 * ((size_t) namelen + plen + 1); /* just in case ! */
++            else
++                return(NULL);
++        }
+ 	pool = (xmlDictStringsPtr) xmlMalloc(sizeof(xmlDictStrings) + size);
+ 	if (pool == NULL)
+ 	    return(NULL);
diff --git a/meta/recipes-core/libxml/libxml2_2.12.10.bb b/meta/recipes-core/libxml/libxml2_2.12.10.bb
index e4db345af4..28ae601118 100644
--- a/meta/recipes-core/libxml/libxml2_2.12.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.12.10.bb
@@ -33,6 +33,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://CVE-2026-1757.patch \
            file://CVE-2026-11979.patch \
            file://CVE-2026-86137.patch \
+           file://CVE-2026-86138.patch \
            "
 
 SRC_URI[archive.sha256sum] = "c3d8c0c34aa39098f66576fe51969db12a5100b956233dc56506f7a8679be995"
-- 
2.35.6


