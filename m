Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA63CCD4F26
	for <webhook@archiver.kernel.org>; Sat, 20 Jun 2026 13:00:37 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5963.1781960427427398236
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jun 2026 06:00:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=33FmzKac;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4921e4dd62dso21696495e9.0
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 06:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781960426; x=1782565226; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WzZWTDBYHKEfeLN8yWlhdy7V6lMdWSjyMSpngS7qkf8=;
        b=33FmzKacFOPEb5Roks2JsI3PgoyDhyJZUPdu7yLinwwdIDJZTK5e52ZfjWtakdQJaz
         ravpgp4SvuGIKqCHO6liCMlFujU63V+7TfXsTnkW1LPqyPmAO01ajvIAs7pcZEaeLQ9+
         qCxdVB7ZOGqp2dxSxeS+iunYR6kdL7WXHuo9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781960426; x=1782565226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WzZWTDBYHKEfeLN8yWlhdy7V6lMdWSjyMSpngS7qkf8=;
        b=mIH0fGYtjAByjVd5Zfp+vKhDooBCuuadHB+xTJNhdA5sgKc5isph3pdBLcj/beE329
         3skr4K12t7Y2FJ+np+WuoVoLKy8wAZyNmXo7mPzK5n4Gf5Ef4r4WbIJUYz7YEoIHaHya
         dEjumk+0giR5Ukw1vWFsRd017wQR6du3VzYmDwvrEwxGTd0PyN+4lEOOSQoglBt1K1YK
         ozi9LPUGqXoZ5WDp+oXXnTShuPbAmiGL7uUeLPxoghfsyOEcr13ASO3tZTF+JOeOkBVy
         1k5POM0kQMasJNf7LuaBVUTsEvL3WxBIEFGVFvR+MGVC/mn9BKi1M5HraJqcoc1h9X9H
         AkXw==
X-Gm-Message-State: AOJu0YzQtc7tJ2z1LWEvAKYbt6/0aWG+KnYW1u2lkL2oC8cEBeXHTBva
	FsQFcqIri5ULWBViEK3TkmxyraRhP34sBfEiDq6DgnIf0JKRGkvZHYRPeGazu/5CFiaygpiDPC5
	nKCW2
X-Gm-Gg: AfdE7cknTALjDBJAOigVFf4o9a69pxZkQ41Fza++SRGLpozuCbStYiJ0oM//UqCK1pl
	TieKkxQ0CSXoNy04MPIo5pwaDlrnRGZwX1yBiMQ+qG2QVyi/WGUNwicSzYy+JhxWh3l10nQNF7e
	Ld1g4e1J1rTVBgkhqeW9+sNOmE+C4DH/N/Aurfi/kI0GMoLa1L2HLp7XDDmnL6ztTfSqePy+bW2
	sRKL9cUIRh92OPS6psnMkUrbFbDcNTbvduklqIENWc7mxt/MnFMcZQf+A5CJEfGJ6q2Ql1pILXU
	p/mBmc47zE5YjW/PJDrLXXHGwPhEqFhaIWgrb//aHU9mHyu6OAzq4VXgDSgBv2LpJIHpI/MhxHC
	tnWAewWA9NH1m6nfNDTMenb7lwGAQVpN7lcRvaMyiQDTb2Hg1G3aYVYv9biQ6Qqh2TieNNOJFTr
	Ex8zCAMGYPo+1MMUArfn5PzOEyQD3LG+8FnphjraFPRQ7aMR1Lxbs60TAilznF7TY3P19oqLG7w
	lPVFsCJMInL0SqN
X-Received: by 2002:a05:600c:e556:10b0:492:37a3:acda with SMTP id 5b1f17b1804b1-49240897a3bmr70851955e9.0.1781960425602;
        Sat, 20 Jun 2026 06:00:25 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4666722141csm7338573f8f.34.2026.06.20.06.00.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 06:00:25 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 25/36] glib-2.0: Change from Public Domain to Gnome GCR Documentation License
Date: Sat, 20 Jun 2026 14:59:40 +0200
Message-ID: <97610cf8a7eb8744f2afcec2762f797405f8984d.1781960051.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781960051.git.yoann.congal@smile.fr>
References: <cover.1781960051.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 13:00:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239235

From: Joshua Watt <JPEWhacker@gmail.com>

The file docs/reference/COPYING is an exact match for the text of the
Gnome GCR Documentation License (SPDX ID GCR-docs), so use that license
instead of Public Domain. This licenses actually requires that the
copyright notice be preserved, unlike Public Domain, so its likely that
using Public Domain is actually an error due to a misreading of the
license text.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9b79254e86878c1dd46cd6af41a73f8ca2bd0b18)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/glib-2.0/glib.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 349c33bd33c..ae40b7f41f3 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -4,7 +4,7 @@ HOMEPAGE = "https://developer.gnome.org/glib/"
 
 # pcre is under BSD;
 # docs/reference/COPYING is with a 'public domain'-like license!
-LICENSE = "LGPL-2.1-or-later & BSD-3-Clause & PD"
+LICENSE = "LGPL-2.1-or-later & BSD-3-Clause & GCR-docs"
 LIC_FILES_CHKSUM = "file://COPYING;md5=41890f71f740302b785c27661123bff5 \
                     file://glib/glib.h;beginline=4;endline=17;md5=72f7cc2847407f65d8981ef112e4e630 \
                     file://LICENSES/LGPL-2.1-or-later.txt;md5=41890f71f740302b785c27661123bff5 \

