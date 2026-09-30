Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD16DCA5FC8
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 08:17:02 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8490.1790756213355136607
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 01:16:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=z9BVRkfk;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A39DD1A107E
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:16:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7885D60749
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:16:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6BC20103298A9;
	Wed, 30 Sep 2026 10:16:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790756210; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BkJL8XpmszDZqERGn3whW+54jfqFPbFFMdc3M7U1bgo=;
	b=z9BVRkfkW9tvw75M/WtZrOKBFRZt/X20Ja15Vt7NljCFRTLNJgph5xAU74vL/CZ7faQKxm
	9U+r7CLGAeT6q5TIBHu8LlJD4Dxd8KaUR8LP8pu2RcqbyJ270ltGDN0+rbPMVvS4VL0emQ
	kzx8XaifcoVWMe62VVesKGt6E0AY/zSCfMwx+Dc0q345g52elkgtyX3DPf3fFlYEdU2jMk
	zFmv454RBOdWyDn6lb2BcsecN2peUD2aET+q0QlyMkaaIVfNQ4tnmr4SnrvaUTwJbgJcs+
	ts4moV78OjQpWCgTZfn9QnqJCDmHXXMkXho3KrAwkw1bClMD/x+QqFArbAkrKA==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Wed, 30 Sep 2026 10:16:33 +0200
Subject: [PATCH 08/24] ccache: upgrade 4.14 -> 4.14.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-mathieu-upgrades-2026-02-29-v1-8-102c38be04df@bootlin.com>
References: <20260930-mathieu-upgrades-2026-02-29-v1-0-102c38be04df@bootlin.com>
In-Reply-To: <20260930-mathieu-upgrades-2026-02-29-v1-0-102c38be04df@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790756204; l=2029;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=km/uxOkPl3xDEyPjYj36Dql3Q67ud3aZcm+XfYkICJY=;
 b=2ta3BYllbLZUF0zNyMQkmWw7LOekSrHwIPs17EeO7qy5FvW+JQuENLiJn9mGzJmlVTV77R43C
 NqBh7kr9ZR0ATaihjTjMTl7OZ69BQgZhoCWjPbuqh4ul6/2vkAKCDJh
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:17:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246932

=== New deliverables

- Added musl static binary release for Linux s390x. +

=== Bug fixes

- Restored storage helper lock compatibility with ccache versions
  earlier than 4.14.
- Fixed lookup of GCC 9+ profile data for object files in subdirectories
  and added support for GCC's `-fprofile-partial-training` option.
- Fixed the output location of files produced by GCC's
  `-fdump-ipa-clones` option.
- Fixed hashing of C++20 module files found via Clang's
  `-fprebuilt-module-path` option, preventing false cache hits when a
  module changes.
- Made ccache reject clang-cl's `/clang:` option and MSVC's `/FA` and
  `/Fa` options instead of potentially caching compilations incorrectly.
- Fixed cleanup of temporary response files on Windows.

=== Build improvements

- Avoided passing a superfluous `-include` option when building with MSVC. +

=== Test improvements

- Made the `remote_file` and `remote_only` test suites work on Windows. +
- Improved MSVC test failure diagnostics. +
- Improved skip messages for test suites known to fail on Windows. +

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 meta/recipes-devtools/ccache/{ccache_4.14.bb => ccache_4.14.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/ccache/ccache_4.14.bb b/meta/recipes-devtools/ccache/ccache_4.14.1.bb
similarity index 93%
rename from meta/recipes-devtools/ccache/ccache_4.14.bb
rename to meta/recipes-devtools/ccache/ccache_4.14.1.bb
index 6d922d85147f..4dd8da212cef 100644
--- a/meta/recipes-devtools/ccache/ccache_4.14.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.14.1.bb
@@ -16,7 +16,7 @@ DEPENDS = "zstd fmt xxhash"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "fca63f36a83fb2f4b3cc4c01b2c7a1cd6e3629e7f7bd1e01a2eb8810f947c5ab"
+SRC_URI[sha256sum] = "dfd2b9e446b2cf68e83e21b25317d8f868de6f1b246c7e99e04d07f4e1b0b97e"
 
 inherit cmake github-releases
 

-- 
2.47.3


