Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5827EB64D7
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 14:13:17 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.17567.1687961595167255590
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jun 2023 07:13:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=cT68fuAb;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1b7ef3e74edso23653105ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 07:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687961594; x=1690553594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nnfijqIZ9esSVtXNRsoz+VsF6XI0oy3HCkZ1TdhUHCE=;
        b=cT68fuAbRRu0H+fspn1Eyz8vHJ07xvcMICY5lCzzzQP2wxJRtxoXgroVscI4AMT+S/
         AnvEgq9k3DVkYoaQxdgCqkXg9/dwH+1IvYiSzrl672vhYjukYNh8rjmN9+wLFwdMdXny
         Rn38bfkGV44JPhCjJDsh0mGASzejA2bTbYeh7dtuB6QBSfKLQL23vHIxnZ5Vl69e4MhJ
         ltEC2SaxgyGDXZ5COGteBa9rQ8RtZrKy7YngepTS/cg01XMQKeVnGn5lvuXT+H3zcw9+
         LRG77tQmcJQLfKMsKQZpFVVO0hbiDiPKFZXb61pCYKEq0XyjHSQewqvz65tkeb+YkxTM
         JrdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687961594; x=1690553594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nnfijqIZ9esSVtXNRsoz+VsF6XI0oy3HCkZ1TdhUHCE=;
        b=h801ulgTFHMbUOFp7PE7DLaUtc6mYTkUBfEsA1vNhVcUYERycELw2AtjAWUIvVK/P8
         n+ZL3H+im3XBZ7o27oBD+DFaA+EDzohyOnI/IntMI40wOFLRbaTBD9Lfhmru+MC5jo5x
         La3adp11Bz0LhNxgigqeJxvn829/iJKHuMgSwMrRUqy2EO5u9fyNorwVYO7iuTh8aXhh
         /8tLm2cYtaxxeg9uqhG2SCjNy1MJOGuUpsGLrY9rF9SNOqZq6Ifak0OtT3alQDWzY5sj
         wFUDDm1VsOE/bxwEtjDG2mKfDXTBPZlSUHi76ckthpkVJEbCpeYoYkZp7Ea6OqVMAyH3
         QFuQ==
X-Gm-Message-State: AC+VfDyTpCoCwWd8Zbe9igmFCx3pKexTY6NCLFwVE0MVOpuVCwIGWif7
	e8YRd3jMioC0OQR2nuA8v9sd8xQ+0WqR5SMweJZ2wQ==
X-Google-Smtp-Source: ACHHUZ4HmgkMaMn0dS2KXToMBXyB2sLF0lXSK2Y+qng7ZlEKDkP3QbK9SC987rrMybZGrSnSvWNzWA==
X-Received: by 2002:a17:902:ec8f:b0:1b6:b445:36d4 with SMTP id x15-20020a170902ec8f00b001b6b44536d4mr9347962plg.43.1687961594213;
        Wed, 28 Jun 2023 07:13:14 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id b19-20020a170902d89300b001b3ce619e2esm7792092plz.179.2023.06.28.07.13.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 07:13:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/29] libxpm: upgrade 3.5.15 -> 3.5.16
Date: Wed, 28 Jun 2023 04:12:33 -1000
Message-Id: <22d9e097538f84a12dd262c1ae936fb8107c2768.1687961326.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687961326.git.steve@sakoman.com>
References: <cover.1687961326.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 14:13:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183563

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
test: skip compressed file tests when --disable-open-zfile is used
itlab CI: build with each of --enable-open-zfile & --disable-open-zfile
configure: correct error message to suggest --disable-open-zfile
Fix a memleak in ParsePixels error code path
Fix CVE-2022-44617: Runaway loop with width of 0 and enormous height
open-zfile: Make compress & uncompress commands optional
Require LT_INIT from libtool 2 instead of deprecated AC_PROG_LIBTOOL
test: Use PACKAGE_BUGREPORT instead of hard-coded URL's
test: Add simple test cases for functions in src/rgb.c
xpmReadRgbNames: constify filename argument
XpmCreateDataFromXpmImage: Fix misleading indentation
parse.c: Wrap FREE_CIDX definition in do { ... } while(0)
parse.c: remove unused function xstrlcpy()

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 4d9f0958eecdf683434d77a4f65611803cffd247)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xorg-lib/{libxpm_3.5.15.bb => libxpm_3.5.16.bb}            | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxpm_3.5.15.bb => libxpm_3.5.16.bb} (83%)

diff --git a/meta/recipes-graphics/xorg-lib/libxpm_3.5.15.bb b/meta/recipes-graphics/xorg-lib/libxpm_3.5.16.bb
similarity index 83%
rename from meta/recipes-graphics/xorg-lib/libxpm_3.5.15.bb
rename to meta/recipes-graphics/xorg-lib/libxpm_3.5.16.bb
index 22e322a9eb..28a775c5f4 100644
--- a/meta/recipes-graphics/xorg-lib/libxpm_3.5.15.bb
+++ b/meta/recipes-graphics/xorg-lib/libxpm_3.5.16.bb
@@ -23,7 +23,6 @@ PACKAGES =+ "sxpm cxpm"
 FILES:cxpm = "${bindir}/cxpm"
 FILES:sxpm = "${bindir}/sxpm"
 
-SRC_URI[md5sum] = "b3c58c94e284fd6940d3615e660a0007"
-SRC_URI[sha256sum] = "60bb906c5c317a6db863e39b69c4a83fdbd2ae2154fcf47640f8fefc9fdfd1c1"
+SRC_URI[sha256sum] = "e6bc5da7a69dbd9bcc67e87c93d4904fe2f5177a0711c56e71fa2f6eff649f51"
 
 BBCLASSEXTEND = "native"
-- 
2.34.1


