Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7474BEC0497
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 10:10:07 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14972.1772532603597446621
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 02:10:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UkCsp8Tb;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772532604; x=1804068604;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EZ45id2Kz1mGoL/Qryw8cmBavcxDgklg2jayeeMxpMo=;
  b=UkCsp8Tb463D37AXGsMIudgXlSiVk2TJaNFoSzNpWBjxnBhQ8Z17HDLr
   MfieDuVPykKQaJchldU1Iew43CgNw0gcGecQzxfwVoTSY4wFFD3cK2tQo
   yRvpf6WvfVFSmFGpGqasu2w4iF5lgGPZAvNnsd+kP4DDW/pp0uafdhHvH
   a3luWP3yZZ3DHt8m57hSpZ5mxhMtjwIpazVlOTN9HM2pf3dSnhmUrcJVM
   FOiqzASwUI2koJEkMeQzD7MIBkXKDeduLw1dJ6IvOc5KNUc4XSSGxJu9w
   mp1dVL5UW+plNj/jpdGvkbiFzawhM6QCT8icyhFcTo15cy4nKiQ+QEatU
   g==;
X-CSE-ConnectionGUID: jIiuNXA4TJ2eGvclsjYXEg==
X-CSE-MsgGUID: CwEJm+t8TXu94eYS8HPfgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="231155258"
X-IronPort-AV: E=Sophos;i="6.21,321,1763391600"; 
   d="scan'208";a="231155258"
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.fujitsu.com (Postfix) with ESMTPS id 0359B1C17341
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Mar 2026 10:10:02 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id AE29718000AC
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Mar 2026 10:10:01 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 187C31001CDC;
	Tue,  3 Mar 2026 10:09:58 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 11/23] libsoup: upgrade 3.6.5 -> 3.6.6
Date: Tue,  3 Mar 2026 18:09:16 +0800
Message-ID: <20260303100929.1624-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260303100929.1624-1-wangmy@fujitsu.com>
References: <20260303100929.1624-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 10:10:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232287

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* websocket: Fix out-of-bounds read in process_frame
* Check nulls returned by soup_date_time_new_from_http_string()
* Numerous fixes to handling of Range headers
* server: close the connection after responsing a request containing Content-Length and Transfer-Encoding
* Use CRLF as line boundary when parsing chunked enconding data
* websocket: do not accept messages frames after closing due to an error
* Sanitize filename of content disposition header values
* Always validate the headers value when coming from untrusted source
* uri-utils: do host validation when checking if a GUri is valid
* multipart: check length of bytes read soup_filter_input_stream_read_until()
* message-headers: Reject duplicate Host headers
* server: null-check soup_date_time_to_string()
* auth-digest: fix crash in soup_auth_digest_get_protection_space()
* session: fix 'heap-use-after-free' caused by 'finishing' queue item twice
* cookies: Avoid expires attribute if date is invalid
* http1: Set EOF flag once content-length bytes have been read
* date-utils: Add value checks for date/time parsing
* multipart: Fix multiple boundry limits
* Fixed multiple possible memory leaks
* message-headers: Correct merge of ranges
* body-input-stream: Correct chunked trailers end detection
* server-http2: Correctly validate URIs
* multipart: Fix read out of buffer bounds under soup_multipart_new_from_message()
* headers: Ensure Request-Line comprises entire first line
* tests: Fix MSVC build error
* Fix possible deadlock on init from gmodule usage
* Add Cornish translation
* Update Turkish translation
* Update Uighur translation
* Update Romanian translation
* Add Uzbek (Latin) translation
* Add Kazakh translation

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libsoup/{libsoup_3.6.5.bb => libsoup_3.6.6.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libsoup/{libsoup_3.6.5.bb => libsoup_3.6.6.bb} (95%)

diff --git a/meta/recipes-support/libsoup/libsoup_3.6.5.bb b/meta/recipes-support/libsoup/libsoup_3.6.6.bb
similarity index 95%
rename from meta/recipes-support/libsoup/libsoup_3.6.5.bb
rename to meta/recipes-support/libsoup/libsoup_3.6.6.bb
index 549bbb7981..f9dd5311a4 100644
--- a/meta/recipes-support/libsoup/libsoup_3.6.5.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.6.6.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
 DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 libpsl nghttp2"
 
-SRC_URI[archive.sha256sum] = "6891765aac3e949017945c3eaebd8cc8216df772456dc9f460976fbdb7ada234"
+SRC_URI[archive.sha256sum] = "51ed0ae06f9d5a40f401ff459e2e5f652f9a510b7730e1359ee66d14d4872740"
 
 PROVIDES = "libsoup-3.0"
 
-- 
2.43.0


