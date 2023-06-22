Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E687EB64D8
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 02:36:23 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.1235.1687401379162120511
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jun 2023 19:36:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=AbxBnR2g;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-54fac329a71so3589770a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 19:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687401378; x=1689993378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DFd/+0s2zJk3CHC4BCYN0l3Q25RWMPRKJRDPMpjHxTI=;
        b=AbxBnR2gdqRJ5WxPX+3psJ6lNvXG3LfX9n23jxg0sf0XLqMFSpMZ9VKq7tDJd1UD3F
         TmQNCkE2TUGMcWxpzKh2UFlrVYFpSsdaDF5EoOe12EZFaB5LJ2+H0+tBCbUfN4i3PfcL
         gHDL/UJqvXYVvcWmeoj1wwx87tEjEp52nYlKziPaspGwb9EV24H/AJylj0xtC8mbx8YR
         9GmeQzBd67ieo+gv5RV/Q+2U5KFoK1vP1Ixju9HR2y2PzfN6zI4q14KVASojgqvGtiGI
         gpCuAUm6Z/xFHGWsMSYlclXyfg+FwMTkeg+CWSnzvwuj3KzTy9LCfRkH4Wxqjg4YNqgA
         RI2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687401378; x=1689993378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DFd/+0s2zJk3CHC4BCYN0l3Q25RWMPRKJRDPMpjHxTI=;
        b=TJbd6sDZTfEFEQlcISXvFkSJh57JBWwuAuCFazwiB7Dc1AiNQqZMJCKZoEbTWEx5YR
         U4oLGMlOio5WnAUIG19vlRwGWc9a2nmtDHSwXWlhytffoMsDaQ+wjHDN1Cy2e+mF10zf
         18ObVALOvmT4kAX8ZjXPY6XNOlSFYLIGjL2WBWu723JS7Ka6Xw/osoM3+sL+TXp7OGir
         Uy1Hqu6o2mRvsPAxrCMcpZbTe9qz3zQdW7MVI4ReP+MrXEWWIiSqpDHrY7xwkDv9d+OF
         ksz7rKGiUithTo3xfJBR/qA22e+7p3lWPKBh+6xX+/+wJA8yQM1i6/tc2amxVbMZcoKQ
         ZHzw==
X-Gm-Message-State: AC+VfDz+EF2QUfO978AWXEp9zYj0CM1n+ifJG6ZnI99l0p87e9CdukDk
	4IeDwMWOYBQqCo1Qye1eyBE1WQqOT7lw1DHdIc8=
X-Google-Smtp-Source: ACHHUZ4iorU8v7RafpU26AGUNqhet3OMmTfg0nYJ09gZ5mZkbxdOxqtL5qZGidKk+B6UrKGMUlhggQ==
X-Received: by 2002:a05:6a20:914d:b0:122:cef6:295 with SMTP id x13-20020a056a20914d00b00122cef60295mr5410812pzc.21.1687401378199;
        Wed, 21 Jun 2023 19:36:18 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jn9-20020a170903050900b001b679ec20f2sm4143691plb.31.2023.06.21.19.36.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 19:36:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 06/23] libmicrohttpd: upgrade 0.9.76 -> 0.9.77
Date: Wed, 21 Jun 2023 16:35:38 -1000
Message-Id: <5e82c4674835900753fb7d5e01aa6dfe41e5d84b.1687401182.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687401182.git.steve@sakoman.com>
References: <cover.1687401182.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 02:36:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183206

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 API changes:
-------------
 + Added new function MHD_get_version_bin().

 Improvements and enhancements:
-------------------------------
 * Digest Auth: changed algorithm identifiers in server generated
   headers from "md5" / "sha-256" to "MD5" / "SHA-256" to better match
   RFC (while clients should use caseless matching).
 * Improved Base64 decoding by new implementation with robust input
   data validation checks.
 * Improved configure for cross-compiling, for better compatibility
   with POSIX and for better compatibility with the latest compiler
   versions.
 * New internal tests: for Base64 decoding, Basic Auth and folded
   headers.
 * Supported new libcurl API in tests to mute deprecation warnings.
 * Supported ARM and ARM64 for VC compilers.

 Functionality changes:
------------------------
 * any negative number returned by response data generation callback
   function is treated as an error. Previously negative values except
   predefined error codes could produce undefined behaviour.
 * Added handling of "DEBUG" preprocessor macro as an alias of "_DEBUG".

 Fixes:
---------
 # Fixed functionality with blocking sockets.
 # Fixed very inefficient data pumping for upgraded TLS connections.
 # Fixed processing of folded headers in the requests.
 # Fixed data races when closing upgraded connection.
 # Removed duplication of "Connection: upgrade" header.
 # Digest auth: fixed thread sync to avoid "stale hash" results.
 # Fixed harmless unwanted extra data processing resulting in triggering
   of the assert.
 # Fixed tests for LTO.
 # Removed removed non-portable functions in examples.
 # Fixed delayed call of connection notification callback in
   thread-per-connection mode.
 # Fixed Address Sanitizer unpoison of memory when memory pool is
   destroyed. This fixed periodic ASAN error when used for a long time
   with the sanitizer.
 # Fixed compiler warnings in library code, examples, tests and configure
   checks.
 # New TLS certificates for test-suite: all with SAN fields and SHA-256
   hash.
 # Tests: fixed tests on Darwin 22.x (Ventura).
 # Tests: redesigned one tests group to avoid stress-testing of the OS.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit bdc28b0262ad8a57d56f029b55b338478afb3a07)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{libmicrohttpd_0.9.76.bb => libmicrohttpd_0.9.77.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libmicrohttpd/{libmicrohttpd_0.9.76.bb => libmicrohttpd_0.9.77.bb} (90%)

diff --git a/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb b/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb
similarity index 90%
rename from meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb
rename to meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb
index 7bd66f63cf..16159a0fd8 100644
--- a/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb
+++ b/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb
@@ -7,7 +7,7 @@ SECTION = "net"
 DEPENDS = "file"
 
 SRC_URI = "${GNU_MIRROR}/libmicrohttpd/${BPN}-${PV}.tar.gz"
-SRC_URI[sha256sum] = "f0b1547b5a42a6c0f724e8e1c1cb5ce9c4c35fb495e7d780b9930d35011ceb4c"
+SRC_URI[sha256sum] = "9e7023a151120060d2806a6ea4c13ca9933ece4eacfc5c9464d20edddb76b0a0"
 
 inherit autotools lib_package pkgconfig gettext
 
-- 
2.34.1


