Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 965AAC3DA4A
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 02:51:36 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.7680.1738205494299515063
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 18:51:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=qlG04N++;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2162c0f6a39so26416775ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 18:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1738205493; x=1738810293; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XgzkULlRR5Yw1IHIAYdymSzudzisPdgSnyL+Q8A1fXI=;
        b=qlG04N++Fn39pZtraH82tW0t+37mHYfFLIpA/qlE0+By9iABKZfrb9oK5+9dmWzs2r
         cXPmZW5esngmNQx76O14LKH+Cf1rwWYFKqtE2dRij+focwacP84aIO1vO4V7W9eb0HDB
         NmF31Uhp5cOyfg5kDMKIWvQmxzPur9mSryPlGE7RrzcrgrqtQm2vZGI+k5wupQwURhOI
         dJ9Y2NIwYXv5yjBKz28DJeXWQjqxNgAx5E5ID6qFo0rs+QbUM81cxDkFk1pnTq6pbs9R
         rrNbSkrdhF+K78b1cLt/s40+lCQKViZ5nlreAeDHLmTiWMWbnxDDRjdiEj8T9TMotzWb
         Q7bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738205493; x=1738810293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XgzkULlRR5Yw1IHIAYdymSzudzisPdgSnyL+Q8A1fXI=;
        b=h82nAJ5UNgdieIlerDAW1VRFUqOYkkjhb6MXCC1iLcHOT0Z5CuqYjhE11IZu6x3AY7
         d/HLAJKBlHRsqeh87qi3tTFhc90qmxpv0dVwpBDWRTyiamV029QH8YHs1e++CBNhzR2v
         idDiAqpidfhyQHzYj3qKFNaN1IEb1Z/rPZ8VV6Rp6YgitiQP5tr91uMe3+pSYKouVLvI
         H/01Tx9v/XCR1JzFbAT4JsuLSON8k/9eSuZGf1hd1Jh5laFMLl0uV2XBEKztj9kBx4OK
         /lVK8eKBRUNLE2PGQQv+rva/zlIWRlU+sXx++sqKUQcfEuPzSNgHconunjgAUt/nLa30
         UlXQ==
X-Gm-Message-State: AOJu0YyMrDIMuIn9odcO8wxQVUNO5DTzYlX6rGFD027uzNZJyWDErpPy
	Oet75C/WBlHtl4nqrJ/6x7LtYaN6pMv/hdgWI0llUIhZR4ascMcpQk3BjeHfysL0XtwD04kOcIP
	CM1k=
X-Gm-Gg: ASbGnctTo5baVugFOIL5xU7c2TqIq3hWoMeVfpwBpCLDaqZ95F0fSUYSyn/4/jIBmyX
	LQX7XBNQ/y+vg6wlR6yOoK8P6jQigmLPOiZQCxX7sCbHpb7SsnaU4Xq7sexyMhrB83C0x91qyn+
	fR2PMu3okO/HN1RnMkaq1F55byZr0Dd/tSmzr+jbG0R6jADWWmGc0zEOxxsOJyvh4Uwou8cM8gT
	stK7nY5MlTUp7X6icSrReOLj4bxeCChXbj61mzUYwXhN7qxDB94rbEQku3JTTZT9wmqZR3DkwWA
	DxM9
X-Google-Smtp-Source: AGHT+IEFwskujvesBhE0pPM39eIWi5g6DgMaDHy4ZOJho5oT+hQWdfvj3YPlvbF6Z2rtW1+0ZJqaMA==
X-Received: by 2002:a05:6a20:7fa6:b0:1d8:c74d:1ca0 with SMTP id adf61e73a8af0-1ed8731b796mr2116988637.11.1738205493404;
        Wed, 29 Jan 2025 18:51:33 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acec04794a4sm249726a12.60.2025.01.29.18.51.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 18:51:33 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/12] devtool: modify support debug-builds
Date: Wed, 29 Jan 2025 18:51:08 -0800
Message-ID: <fa30d8dd71393e10aa678c6e938c23d486b336c6.1738205405.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1738205405.git.steve@sakoman.com>
References: <cover.1738205405.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 02:51:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210428

From: Adrian Freihofer <adrian.freihofer@gmail.com>

Add a new option --debug-builds to automatically add DEBUG_BUILD = “1”
to the bbappend file of this recipe. This is especially useful when
invoking devtool modify before invoking devtool ide-sdk to perform a
remote debugging session.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/devtool/standard.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 05161942b7..908869cc4f 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1031,6 +1031,8 @@ def modify(args, config, basepath, workspace):
                     if branch == args.branch:
                         continue
                     f.write('# patches_%s: %s\n' % (branch, ','.join(branch_patches[branch])))
+            if args.debug_build:
+                f.write('\nDEBUG_BUILD = "1"\n')
 
         update_unlockedsigs(basepath, workspace, args.fixed_setup, [pn])
 
@@ -2396,6 +2398,7 @@ def register_commands(subparsers, context):
     parser_modify.add_argument('--branch', '-b', default="devtool", help='Name for development branch to checkout (when not using -n/--no-extract) (default "%(default)s")')
     parser_modify.add_argument('--no-overrides', '-O', action="store_true", help='Do not create branches for other override configurations')
     parser_modify.add_argument('--keep-temp', help='Keep temporary directory (for debugging)', action="store_true")
+    parser_modify.add_argument('--debug-build', action="store_true", help='Add DEBUG_BUILD = "1" to the modified recipe')
     parser_modify.set_defaults(func=modify, fixed_setup=context.fixed_setup)
 
     parser_extract = subparsers.add_parser('extract', help='Extract the source for an existing recipe',
-- 
2.43.0


