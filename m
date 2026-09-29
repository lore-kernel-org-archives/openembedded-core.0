Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA204CA5FAC
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 04:18:38 +0000 (UTC)
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.656.1790655517560151638
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 21:18:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=WXlLwNlr;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3346; q=dns/txt;
  s=iport01; t=1790655517; x=1791865117;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gXHW8rSiFUZKra4+wlt4bwickkJVQNpF7+sPEE6ibo0=;
  b=WXlLwNlrw5YM4s4UCHrY75Y2XEZIsL2qvx2jj+ZIQ+BQrOhUfBCy1DOY
   suefzq8OewOEncFkfx67Gv2y6jUe8KCve/loa3a/l59xYmSI7kYtG66OV
   sb+XgOlcpECD5cLJ3R+79qrk/tmJL5DYd3SogAePejC9buQthz1aXhyWE
   m392P6QDFBcG9UxbcykSv4fRQAh+wi/WvhDMrgk/W77Qo7yDQqwuPlP87
   XG2KQsScAAK68IVcshQyxyQxU3yoFHrAnha41yHwqU+RbHaTiT5Owl2il
   LlGyWbuJI0r9YbMWlJ0vQNAzhAALoIp67xfP4RVSsvSUqbDVw7WHZCWrf
   w==;
X-CSE-ConnectionGUID: rEvbAvW5Rpijl3LNxY2HWQ==
X-CSE-MsgGUID: dmWBPNilQcuAI6JVPjPqUA==
X-IPAS-Result: =?us-ascii?q?A0BIAgDTOrtq/5D/Ja1aHgEBCxIMggULgld1YUJJlkoDi?=
 =?us-ascii?q?2SSNoF+DwEBAQ9EDQQBAYQ/RgKOCAImNAkOAQIEAwIDAQEBAQEBAQEBAQEBC?=
 =?us-ascii?q?gEBBQEBAQIBBwWBDhOGTw2QEgECAQMyARgBLRAcAwECLyALIwgZgwIBgjoDN?=
 =?us-ascii?q?wIBEcAJgiyBAYMpAT8CQ1DYSw2CWgELFAEFgTOFQIJ/hSRdGAGEfCcbG4Fyg?=
 =?us-ascii?q?RWDaYEFgRpCAQECiCMEgiKBDIFaHpM4SIEeA1ksAVUTDQoLBwWBZgM1EioVb?=
 =?us-ascii?q?jIdgSM+F4EHGwYFgR2BIIIZIxk2eoEJXoErKWABEBeBB4IHAoJUggECAUlDD?=
 =?us-ascii?q?gdFUwklRRJHJiIIEgkBExowC4EhOEEJKD8YDUgRLDcVGQQ+bgeQPx6CGDoMB?=
 =?us-ascii?q?4EOASoBpgGCIaAecQoog3aMIo8+hXwaM6pvC5h9jgqECZJHhGmBaDyBRwsHc?=
 =?us-ascii?q?BWDIglKGQ+OOYNrgX+DFMcmJDUCCTIBAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:Xtt9ZayJGoAA72GzpV56t+dhxyrEfRIJ4+MujC+fZmUNrF6WrkVTm
 2cZXzyGP/iIZWegetF1ad++904F7MDTyNRgTQdkrFhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lHyYuCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWYlaDJMscpvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJFsbI4cx5NkqO3lP9
 /hDDBYdX0qjuNvjldpXSsE07igiBNPgMIVavjRryivUSK55B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cP3WjOX9PYH46tOe0hnD8eidwo1OOrq1x6G/WpOB0+OW3b4qJI43XFK25mG6Uo
 13sx0L4BigRKfW+lxi7ynCUn9LmyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl7GQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSj1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:ReeLvK9gXJu0desAZ59uk+AAI+orL9Y04lQ7vn2ZhyY7TiX+rb
 HIoB11737JYVoqNU3I3OrwWpVoIkmskaKdn7NwAV7KZmCP0wGVxcNZnO7fKlbbdREWmNQw6U
 5ISdkZNDSJNykYse/KpC+lDt0n3N6LtIqshevY0jNRaDsCUdAY0++8YTzraXGfg2J9dOIEKK
 Y=
X-Talos-CUID: =?us-ascii?q?9a23=3AlITB5mjA+lajOFJAjj4J9oAlTTJuaFDDxl7OHBK?=
 =?us-ascii?q?CEWdrTOaxb0+hooNbqp87?=
X-Talos-MUID: =?us-ascii?q?9a23=3AnL82ug6Divk1kNIt0aBtAUK4xoxk5puEMGYMlaw?=
 =?us-ascii?q?NpuClaw5OAzWllQmeF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,129,1787011200"; 
   d="scan'208";a="527841959"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Sep 2026 04:18:36 +0000
Received: from sjc-ads-4178.cisco.com (sjc-ads-4178.cisco.com [171.70.54.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id A66F3180003E5;
	Tue, 29 Sep 2026 04:18:36 +0000 (GMT)
Received: by sjc-ads-4178.cisco.com (Postfix, from userid 1887505)
	id 4E4A6CC129C; Mon, 28 Sep 2026 21:18:36 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][scarthgap][PATCH 2/8] libxml2: Fix CVE-2026-86138
Date: Mon, 28 Sep 2026 21:18:30 -0700
Message-Id: <20260929041836.2217090-2-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260929041836.2217090-1-hthakar@cisco.com>
References: <20260929041836.2217090-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4178.cisco.com [171.70.54.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.199, sjc-ads-4178.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 04:18:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246810

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


