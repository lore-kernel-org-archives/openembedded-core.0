Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC262CC6B04
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 05:22:14 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9313.1775107333871543286
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 22:22:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=iz7tptja;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48704db565eso4421275e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 22:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775107332; x=1775712132; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KIu9/ohlSM3e3rUK5FRTbptBEDpYQafGfAQSZmAjDuY=;
        b=iz7tptjaKWqLw1vRSu0ESobr1w4o5cUM3vzWt7mVm4l9U789wJVuqBfuL9N4p/qSg8
         fnB0s5uYXeheysBot05+FHtEGqw5zY8ob0KrVfczLqoVAcnHkQhTrTIMZ1FqhbCt9pva
         hBqLru68JKvjuQkwtqud90lx8q75G07ZA8xtc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775107332; x=1775712132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KIu9/ohlSM3e3rUK5FRTbptBEDpYQafGfAQSZmAjDuY=;
        b=Tr0x20EPXC6blakN2KzfEeRTkgG3hciKuioj3kGKqj/r8pxwCIZJWAxNDUttEJZKCc
         PnsM+pvVUEopZyQtZlnjRR69+tNkR+G8vsClEU9dmPXZRfCElcFJDSKO+FaS3gGkN225
         MSHi9MGBStuW4EohF/0jxfE2dwCK5sN99GodO5T9ckzJ2rpZU6UBSGh1lLBEc3+3BYD0
         zwJNRZNKpB984aN5UEQJK0m69j8sEZG/vhs/CQvElStMRgF3stQNUt8o3JzX/FyPP8Oc
         tMlxpxzWEZAeQnCTpa4VP0Yus0fXxHH46iUXFQItUfgAs25TFBITUAltOnuaMjSPJhKl
         BoIg==
X-Gm-Message-State: AOJu0YxphXaSiZMibqmeF5bVBh60cPAY+z9hvyF3NYv3FFhfoy8H4Xf0
	7mKuPfZV/oCKkpvF5uaux7ESO5TWbrAYeywWKwcK5JdI/p78Wn/bRlujpqr2u61oGsdpvcfhU2X
	QRMU8XjQ=
X-Gm-Gg: ATEYQzy7YU2YWV6rzZUuv4LWjVOdvCr03dQkP6nD/eqITdr63QfJ0Exrzo3d2uqYGHu
	+a83k95oLYis5Zt9wKPw9iSHFuIK4bp/k0PdYxnbrWoXiXXN8i6DjRNQQUBIggaGtszWFeDp4fs
	81IRQsUtcBU4h6nnBeczcHVxvQt6BIUK09CIznkjnMZ0gPauyqrPTlqclAstc40xTebAJ9KDcX/
	YBuhhS38oS71FRYTR+t5d05fX+Alu1MbMR+i2u6j5k0rxyk867vrjw4ReeW2cxSunSv9c6Xd2Ga
	LcC6riLktT8CMoxmj6UuLSQdB8LEnRupC01OE8obnd6SzfYNpEAyrWymLNem5HCeC5ZCGA0YbV/
	CyCHuqCgocMkpbxo+rgR25sYKwoyfLvftkUMfpIPgjYvyeUge2TamS1YpGSugW2HePH8vss8ayH
	CmYZSBTR5ZgqmV48UwOXxW+zG59mGbrwar+1cT7kVKS2A1fiMZK1VzqoxcMT9jKI7XgC7fNNh6T
	7XelRwP8mKqwhVoXBfY9Rpuw3g=
X-Received: by 2002:a05:600c:638e:b0:483:2c98:4368 with SMTP id 5b1f17b1804b1-4888b76980bmr30764905e9.18.1775107331858;
        Wed, 01 Apr 2026 22:22:11 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e829c43sm151111865e9.5.2026.04.01.22.22.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 22:22:11 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 04/15] libsoup: upgrade 3.6.5 -> 3.6.6
Date: Thu,  2 Apr 2026 07:21:21 +0200
Message-ID: <4a18760105b812db9c41da349bedbf72a9134457.1775106968.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775106968.git.yoann.congal@smile.fr>
References: <cover.1775106968.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 05:22:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234476

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
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b6fb8f26a26a28a13f64c4c31003b2d0bf1061a2)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libsoup/{libsoup_3.6.5.bb => libsoup_3.6.6.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libsoup/{libsoup_3.6.5.bb => libsoup_3.6.6.bb} (95%)

diff --git a/meta/recipes-support/libsoup/libsoup_3.6.5.bb b/meta/recipes-support/libsoup/libsoup_3.6.6.bb
similarity index 95%
rename from meta/recipes-support/libsoup/libsoup_3.6.5.bb
rename to meta/recipes-support/libsoup/libsoup_3.6.6.bb
index 549bbb79810..f9dd5311a46 100644
--- a/meta/recipes-support/libsoup/libsoup_3.6.5.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.6.6.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
 DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 libpsl nghttp2"
 
-SRC_URI[archive.sha256sum] = "6891765aac3e949017945c3eaebd8cc8216df772456dc9f460976fbdb7ada234"
+SRC_URI[archive.sha256sum] = "51ed0ae06f9d5a40f401ff459e2e5f652f9a510b7730e1359ee66d14d4872740"
 
 PROVIDES = "libsoup-3.0"
 

