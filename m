Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34436C54731
	for <webhook@archiver.kernel.org>; Sun, 25 Aug 2024 18:50:05 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.37434.1724611801994339493
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Aug 2024 11:50:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=yASfdZkP;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2d3da94f059so2437236a91.2
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Aug 2024 11:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1724611801; x=1725216601; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=woDdN/nS08VA87R6iDArZFtZGcWPgw9UoPAP2cS8BPQ=;
        b=yASfdZkP8qIZWCt40pFz/Y35mrMD8X4vKTlasAtZOR9wyGkTjGzJrxokscSwPRTzpG
         CnIJCMSmDfaNB2nM25mZB2PhrBIGH6Le1duxkQ7qkJveZ2j+g2l7yXvFxn7BAWEH3xYy
         /RNM7JGNtkO1SQZi9jK2w2l4rRnauYHbzytLFnDFtwqFau5Tz8/agbMpmT5B/0/VCnob
         /7r003IGW+grQ2VzTaNOR6Y617bXP8F3CkCDjRi+sMWiqieIVwpD05UQdAp45Li8kdS4
         NQkKQ+GhZKmr9JkHNwR6m0LKeMLiNgzaODlvKxSBD/XQ+ZEptxukZUr57PSPaugJLrw5
         o2SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724611801; x=1725216601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=woDdN/nS08VA87R6iDArZFtZGcWPgw9UoPAP2cS8BPQ=;
        b=rn50XLO4h36+5DGyvTHlz6+OZtDSByj8bsdZoeN2t6Z3UmEsd7QqGgk0xwRuu4TJ/R
         10eaEf2UYWzFySHo3/Y3hZJCIi7OCQWu2LYiHbKly87vy3LBAT9SgbQi19ZRUf3u/Tm1
         R6+a4/cDDA+lpwOGhS0AjUUX7WeGkVf3NHLAtfq0Lu7oEgHYCVo4TnMK3DQd+pdqU1PD
         b+kD14kPotRZo8FUbsMOSJXgnAEC/cvBt/viSteopDgdHDwFdWGJwRKsZ3Jv5Unlwn20
         eAMfIg1IShhx7Zss7QVD0QSnrmns4eoPAu5FsqiVDsl+AsN5Qbnr4xiEb5gA0ngOkXzO
         SPbw==
X-Gm-Message-State: AOJu0YzJWUlxLxaQ9DHP1465s6bVv5hs6AuHNxbnhU2TU/pIGIN0OgNy
	fRku0SMTdzNfGVajOPN4mR1mx52Nf4H9VGtJ2QOzeU3GNxtG7GXj3Q0SY7KE4FdwJWcNe0aNMxW
	rkh9+EQ==
X-Google-Smtp-Source: AGHT+IH3K+29NS19Dn8ieS9hCOX+Q/TYEg8iJkcd5Kz4xN5XW/NjH5b2QYLW4+0BBLacPrb8flGfSA==
X-Received: by 2002:a17:90b:1651:b0:2c9:cf1d:1bcc with SMTP id 98e67ed59e1d1-2d646d44d9dmr6161589a91.36.1724611801206;
        Sun, 25 Aug 2024 11:50:01 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d61391fe09sm8294216a91.19.2024.08.25.11.50.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Aug 2024 11:50:00 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/6] python3: add PACKAGECONFIG[editline]
Date: Sun, 25 Aug 2024 11:49:49 -0700
Message-Id: <12dc7d2081a1aaec90ffb3ed6718d757ce14b5ab.1724611692.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1724611692.git.steve@sakoman.com>
References: <cover.1724611692.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Aug 2024 18:50:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203729

From: Leon Anavi <leon.anavi@konsulko.com>

Backport PACKAGECONFIG[editline] from Scarthgap to Kirkstone
because libedit has feature parity with readline but is more
permissively licensed (BSD verses GPLv3). This patch provides
means of enabling editline in a distribution without GPLv3 and
in this case improves Python REPL keyboard support.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/python/python3_3.10.14.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.10.14.bb b/meta/recipes-devtools/python/python3_3.10.14.bb
index 31c458c09a..b5bc80ab88 100644
--- a/meta/recipes-devtools/python/python3_3.10.14.bb
+++ b/meta/recipes-devtools/python/python3_3.10.14.bb
@@ -106,7 +106,8 @@ CACHED_CONFIGUREVARS = " \
 PACKAGECONFIG:class-target ??= "readline gdbm ${@bb.utils.filter('DISTRO_FEATURES', 'lto', d)}"
 PACKAGECONFIG:class-native ??= "readline gdbm"
 PACKAGECONFIG:class-nativesdk ??= "readline gdbm"
-PACKAGECONFIG[readline] = ",,readline"
+PACKAGECONFIG[readline] = "--with-readline=readline,,readline,,,editline"
+PACKAGECONFIG[editline] = "--with-readline=editline,,libedit,,,readline"
 # Use profile guided optimisation by running PyBench inside qemu-user
 PACKAGECONFIG[pgo] = "--enable-optimizations,,qemu-native"
 PACKAGECONFIG[tk] = ",,tk"
@@ -118,7 +119,7 @@ do_configure:prepend () {
     cat > ${B}/Modules/Setup.local << EOF
 *disabled*
 ${@bb.utils.contains('PACKAGECONFIG', 'gdbm', '', '_gdbm _dbm', d)}
-${@bb.utils.contains('PACKAGECONFIG', 'readline', '', 'readline', d)}
+${@bb.utils.contains_any('PACKAGECONFIG', 'readline editline', '', 'readline', d)}
 EOF
 }
 
-- 
2.34.1


