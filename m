Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B124CCD1A5
	for <webhook@archiver.kernel.org>; Tue, 21 Oct 2025 19:26:37 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.21918.1761074787027235145
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Oct 2025 12:26:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=HEUIczds;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202510211926246672656bb600020798-9qvf12@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202510211926246672656bb600020798
        for <openembedded-core@lists.openembedded.org>;
        Tue, 21 Oct 2025 21:26:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=8bsZTdiQvwsTtoKl0M0J/GL4saw3DFQODDLI1Fgb8fg=;
 b=HEUIczdsDwyGUSg+y3v/igZYCvDbxEdf0JJoXptjBUM0g6UQZYv9A0YeWdB5uyzSn9oSo5
 9JYa5oHItndhBG+LijPzeSWbW5/gc+pqV7xVfIcNhGl6c+yLdA0E6fOYOuscLljzbmYBswKR
 uC7/Oa2HeQNvbFuxx+tn0kL9+VZTenw11+a19oOc6C0EGV9BWRlHc1vOuTF4rXh9fA+dekiC
 URcXy4UpW68Y12zr5fmWDOiI14FRUeWe3gh/zDvSeQLbfwV98bl5ApswXqWL/tUe1OKt1dtQ
 pHYI1d289ptFmrxYiVaOl6+JerWq8VgcT6Mc3+o40eMGhrva0tfjPQcg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] curl: only set CA bundle in target build
Date: Tue, 21 Oct 2025 21:26:12 +0200
Message-Id: <20251021192612.1777123-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Oct 2025 19:26:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225164

From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>

In native/nativesdk builds, sysconfdir refers to a recipe sysroot
directory, which will disappear once the workdir is cleaned up, breaking
libcurl's HTTPS connections.

By simply not setting --with-ca-bundle at all in non-target builds, curl
defaults to the host system's CA certificates, which is desirable anyways
to allow builds in environments that require local CA certificates.

(From OE-Core rev: 4909a46e93ba774c960c3d3c277e2a669af3fea6)

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-support/curl/curl_8.7.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index 6ed3d6e84dc..713d90a3787 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -94,11 +94,13 @@ PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd"
 EXTRA_OECONF = " \
     --disable-libcurl-option \
     --disable-ntlm-wb \
-    --with-ca-bundle=${sysconfdir}/ssl/certs/ca-certificates.crt \
     --without-libpsl \
     --enable-optimize \
     ${@'--without-ssl' if (bb.utils.filter('PACKAGECONFIG', 'gnutls mbedtls openssl', d) == '') else ''} \
 "
+EXTRA_OECONF:append:class-target = " \
+    --with-ca-bundle=${sysconfdir}/ssl/certs/ca-certificates.crt \
+"
 
 fix_absolute_paths () {
 	# cleanup buildpaths from curl-config

