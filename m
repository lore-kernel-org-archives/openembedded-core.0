Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA16E105A58B
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 11:33:59 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19148.1773315232500136151
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 04:33:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J0H+a0X9;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4852fdb36a8so10240825e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 04:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773315231; x=1773920031; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dhb3JyMR8iyCI41Y8XVFlOn5/kaLAZuV/wRYdvOE2no=;
        b=J0H+a0X9FgiXMPzr0py6eeg0yFXPNYUY3EVDJYnR6j2MzBfL9xNLb0V6f6vowIS8iG
         PK7KFP+96G7/NMj7XEJJhWiBd6Wua324F0k9u9ie446i0NDpGKW49ytGfn49C5aixRNz
         NMkRp+bvz85DZhj01IYE9poTroZsh4S6UNph/S+5dKW2uvG3nDwtYVybtRh5mR9OuWAJ
         BDn6wcVvlOAWGdS2LzMqpi7jVV4xiYLNtc5ddmoiRTsbKYF5xJNPy+tBfC/dzWzr4n9z
         Tu54G7S5SHd8bgc9PucIHFPOpjE9tBLyvi2OaHrNd/jyV3YPKKw0JZD+BoXNUsAvL7EX
         CU/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773315231; x=1773920031;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dhb3JyMR8iyCI41Y8XVFlOn5/kaLAZuV/wRYdvOE2no=;
        b=HKYb0NylpRNrlasmAlSWTMsj3lmrdmvWN3NxqW19BHJWbu/2GvoOHKEutWUg8dBVkT
         xm0m79ORQ45OZJmVJ0j6G8EpXEtJkHLLG2eIpyHYd/aKGO5nUhfVCnijalLI/qe7xfkk
         fmn1V9MWmChdtccu74eUWKSz/r5NebzPvhMV9Pe8V5wPdi27AecSv4P8UPy1lCIlU5xt
         +hVTW9Bo/ewxaBrNln0AUpFBU+NKLt/fCA1eopZaJH4YJfcBj5a9ZuYpxNhu71yFr0MJ
         2nmeOKFpyiojkDP/i1Z8m/sZWon92HixXjZ01DBMGP2jiM2hVrEI2e+BTAhEeBXTpxP5
         otiw==
X-Gm-Message-State: AOJu0YyRQ8oLnoSqau0T6h9wS8/nJRbWbk2EAuLcYUiECTI46R0u1YL+
	QDDsCFrIt/pJ5OpxbwvdM37WqSjQXbxNspph9m6RCAMFkmFNXgxcG32hLl39MA==
X-Gm-Gg: ATEYQzwK0I22cHxaixcU82ZBs41eSAcJCmoFVkgvUwvWdAoxDCUNPaqTMuYA3xQjbK2
	WlqPv7rJ0/Dw8teKMhVd5a4QBO0hvUeA3x6wembF3JzqXaqZWeS+mromujearlH/4z7aD/dXOTh
	xV3iT1RhnaK6S6tJvHy9Agms7h4NakqBGysDFIluk0n9/Oxxd8qU/gqVZeMRE17DPNzbkuMQ8j5
	z8VyGYj1kSwhCyagaFdlV5icbM5z5PUtBqKvrap7lKfy30uHxRR9UavP2IP4bouqafJJ4aMzeaU
	Ob3N29dAv4+dNfTnUL2URWoGDLFJI+jTHsXULjet515obYRzzvci/5xhN57hRC6K+L2MmmLuFPe
	7Sci29S3sKMx4HpUx63sCmZgDKcmMhafTRZViLI3E160dmrHXs5YxdJ/Hj3EEdz83SIIrHWLw5/
	fX1W+QfRk+emUzrE+AiC8zO7QR97+7z6X9YRkK0jhXnaM=
X-Received: by 2002:a05:600c:3b1a:b0:485:34b3:8585 with SMTP id 5b1f17b1804b1-4854b0d6ca4mr111739115e9.8.1773315230358;
        Thu, 12 Mar 2026 04:33:50 -0700 (PDT)
Received: from fedora (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541aac28bsm212883885e9.1.2026.03.12.04.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 04:33:49 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH] python3: Add a new PACKAGECONFIG knob for free threading
Date: Thu, 12 Mar 2026 12:33:43 +0100
Message-ID: <20260312113343.3570819-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 11:33:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232940

One of the main points in the Python 3.14.x release notes was
that free threading is officially supported.

Add PACKAGECONFIG[freethreading] to turn it on with --disable-gil.
GIL is the Global Interpreter Lock, which is kept enabled without
this option.

By default, keep free threading disabled, i.e. GIL enabled.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-devtools/python/python3_3.14.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3_3.14.3.bb b/meta/recipes-devtools/python/python3_3.14.3.bb
index 7047cd8e8d..1b2ef1e915 100644
--- a/meta/recipes-devtools/python/python3_3.14.3.bb
+++ b/meta/recipes-devtools/python/python3_3.14.3.bb
@@ -112,6 +112,7 @@ CACHED_CONFIGUREVARS:append:libc-musl = "\
 
 # PGO currently causes builds to not be reproducible so disable by default, see YOCTO #13407
 PACKAGECONFIG ??= "editline gdbm ${@bb.utils.filter('DISTRO_FEATURES', 'lto', d)}"
+PACKAGECONFIG[freethreading] = "--disable-gil,"
 PACKAGECONFIG[readline] = "--with-readline=readline,,readline,,,editline"
 PACKAGECONFIG[editline] = "--with-readline=editline,,libedit,,,readline"
 # Use profile guided optimisation by running PyBench inside qemu-user
-- 
2.53.0


