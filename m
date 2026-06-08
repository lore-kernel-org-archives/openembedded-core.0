Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B46FCD8CA7
	for <webhook@archiver.kernel.org>; Mon,  8 Jun 2026 21:57:24 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.66311.1780955840857254413
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2026 14:57:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=bwzugLbu;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-202606082157190356e05e4d0002070e-94y4_e@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202606082157190356e05e4d0002070e
        for <openembedded-core@lists.openembedded.org>;
        Mon, 08 Jun 2026 23:57:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=kmELu4xM5XaHVXmjdXY4hRJ5wfLJZqJiCfgkj6Jxn3I=;
 b=bwzugLbuiSvQWathAdSPjwY5U7h30g4HJkOKQ3gRqeDNHDavn59D0++TAh8mlFXawjCx/K
 JU5EosuPNOg+0Dqhg8qFpPIS3SJimpDa73QRIDfDvR79MZGxQF14qeoi/cN9bcyAABy8B24i
 7BsPy6bza+1JKHLQsTBRDTstfr6fJ9ayV0tuLyG4c2BTmqN2/N/ODo/cFYdH/QRuLVDlRpKu
 vVcWTz4GuH4zW0GBLFJQFDlr0u41t46wxFh3pCNsEC+ThmC2id4IkUow2lYNVkoWbC2lNpIN
 kTNYZwQLCDQ8L6G2nlv37zN/Z5JdtnLCfe1SH0TtjjuX3bhOM3bJ8Ttw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [wrynose][PATCH 4/6] python3: use += instead of :append in SKIPPED_TESTS
Date: Mon,  8 Jun 2026 23:56:50 +0200
Message-ID: <20260608215654.3664494-3-peter.marko@siemens.com>
In-Reply-To: <20260608215654.3664494-1-peter.marko@siemens.com>
References: <20260608215354.3664441-1-peter.marko@siemens.com>
 <20260608215654.3664494-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2026 21:57:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238262

From: Ross Burton <ross.burton@arm.com>

+= is less computationally intensive than :append so use it unless the
semantics of :append are needed.

Also remove the class-target override, this is not required as ptests
are only used in target builds.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 8ba5db86ac364b85fa6c1ee36fa5a037c0ee818a)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/python/python3_3.14.5.bb | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.14.5.bb b/meta/recipes-devtools/python/python3_3.14.5.bb
index 2f821b130f..501de75fb1 100644
--- a/meta/recipes-devtools/python/python3_3.14.5.bb
+++ b/meta/recipes-devtools/python/python3_3.14.5.bb
@@ -271,13 +271,13 @@ SKIPPED_TESTS = " \
 # but not bang completion. test_bang_completion_without_do_shell() passes if
 # building with readline, but we don't want to change the default, so skip the
 # test.
-SKIPPED_TESTS:append = " \
+SKIPPED_TESTS += " \
     --ignore test_bang_completion_without_do_shell \
 "
 
 # Also fails with editline instead of readline. See:
 # https://github.com/python/cpython/issues/123018
-SKIPPED_TESTS:append = " \
+SKIPPED_TESTS += " \
     --ignore test_write_read_limited_history \
 "
 
@@ -294,22 +294,22 @@ SKIPPED_TESTS:append = " \
 # write is seeing the equivalent of:
 #
 # ANY, b"21"
-SKIPPED_TESTS:append = " \
+SKIPPED_TESTS += " \
     --ignore test_cursor_back_write \
 "
 
 # Needs IMAGE_FEATURE += \"tools-sdk\"
-SKIPPED_TESTS:append = " \
+SKIPPED_TESTS += " \
     --ignore test_find_library_with_gcc \
     --ignore test_find_library_with_ld \
 "
 
 # Fails due to differences in CFLAGS as as modified during build
-SKIPPED_TESTS:append = " \
+SKIPPED_TESTS += " \
     --ignore test_sysconfigdata_json \
 "
 
-SKIPPED_TESTS:append:class-target:libc-musl = " \
+SKIPPED_TESTS:append:libc-musl = " \
     -x test__locale \
     -x test_c_locale_coercion \
     -x test_locale \

