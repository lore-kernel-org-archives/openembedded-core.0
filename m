Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61994CD37B5
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 07:12:29 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8228.1778224338975706890
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 00:12:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Jbq61QaG;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4891b0786beso11459495e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 00:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778224337; x=1778829137; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a6CQ1E1+zpR80zJgccpyIiigfSWNE4vA+IIkU0nDwjQ=;
        b=Jbq61QaGD2lB4gCZ03LTW0AUBEiqpxY7iMaDvA4AWdniy9PERfqYJwsL3TulX7PZJc
         KHRHIwvoqCXtK6L+SgtqR/X2jImkuqHv/7QB7gNcjK2W9JuuFnqag4IwopSGC7hLn8J+
         GzPoIB/v4ZPiSo6dgdtoCwD2a9cB5c9A5iEzg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778224337; x=1778829137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a6CQ1E1+zpR80zJgccpyIiigfSWNE4vA+IIkU0nDwjQ=;
        b=DKtGd9FMT4shxA26fomrKnlLlm0/e0KcylMoc94OjE+jReXENGp4cTFmfAaXBY7T0P
         pBpPOwzHTNAvuHpzJdNZUFd9j4NWqW4JM6RYAjDk7lAUfn5JscfUYjHJu698sFNt37fX
         3ghQBEbPVAgTw1jdAMMKZI4jL69IJ0Yc7XKuuGOEnFNGNn7Y+avzrpaTYRWxqYTT1I93
         R5yFIsfnj6cCQkMKeASKtNy66WRmi6D1qnZ1yFuyakEZhCOv0H5sKI9wR9Dcya+ewZOP
         XQsfAS1ljSxAqKATxp00FAnRLdy1LZyT57K8tw9P94VrTjq9EH8GZgqEkRRwyO0MayE1
         YHYg==
X-Gm-Message-State: AOJu0YzDqbNjMfem+BSP2o+lCZXUTU2Eg4X7cjhfxlHVrfcuIWVYvOXb
	0Plaxwa1oZDpT6CZYf91OE+SF/SkrbWgiEcPTT5PKOlGPFeRuj356ii5hpLdJwK+Bx78lOn8Zfs
	YhcKS818=
X-Gm-Gg: AeBDietHBPSC4hBawZj9F80sZJ/STP13GJBWbaAOosiUgsFsXSrGLZ0n8cX9/A7IAMV
	jwe9XalB+VM1FqIEoRSR+Ir4PaKK7iEwMXc3Nc38SUKMZq2+ePSU4x1eUoc7pdANEREdKz/+ivD
	BokNwoQwhgMhklKv5FP5xK//uzPnEMkqLhBGdpFXcua4xedH56F9nVgGqTG1i07txYr2psmPFOV
	cLj964cPEz+dMDQAeh4RrF5f2KR5k91K3xaEWWnQF2AE15vtJnLxMXOwwkn9KXvyz3S+ZdtcNtC
	yZrMCrSsLafjBlG+COd81/R5oiUD/Eps48VOIPmyyDPoVzOoODy1C5eUHLHSzw3O42dJC8ki9W/
	5JrqLwZ7sSxSkEGRo0X0vaZMQ7L6nUuGQ4UyGuE8FLwBxdI0sewZL0siAkV/aToPtocURlbLgZ4
	o0Ww7n7V6c7HkL4aj+FjjApB72wYA++Gtn4UtGZmj5AeslJev07g2TVErXj+qtPSXnjlTGOisGe
	oaJ3HakQCPcjmB0BEI+jLpTqkk=
X-Received: by 2002:a05:600d:849c:20b0:488:a2ac:a34c with SMTP id 5b1f17b1804b1-48e51f220e7mr133668535e9.12.1778224337030;
        Fri, 08 May 2026 00:12:17 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6be40sm2415545f8f.12.2026.05.08.00.12.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:12:16 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 11/52] rsync: set status for CVE-2024-12084
Date: Fri,  8 May 2026 09:11:04 +0200
Message-ID: <7b9dd2b6c0890ae6f415244c005403d15a84367b.1778198557.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778198557.git.yoann.congal@smile.fr>
References: <cover.1778198557.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 07:12:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236653

From: Peter Marko <peter.marko@siemens.com>

Debian security tracker [1] says it's fixed in v3.4.0.
NVD [2] does not say that our version is vulnerable.

The CVE is reported probably because cvelistV5 has many CPE groups and
some of them are unparseable (so assumes vulnerable).

[1] https://security-tracker.debian.org/tracker/CVE-2024-12084
[2] https://nvd.nist.gov/vuln/detail/CVE-2024-12084

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d0edbcf24295d5ef8682488e2512561d1246efa4)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/rsync/rsync_3.4.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/rsync/rsync_3.4.1.bb b/meta/recipes-devtools/rsync/rsync_3.4.1.bb
index 697cdee829c..509be486b87 100644
--- a/meta/recipes-devtools/rsync/rsync_3.4.1.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.4.1.bb
@@ -64,3 +64,5 @@ do_install:append() {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+CVE_STATUS[CVE-2024-12084] = "fixed-version: fixed since v3.4.0"

