Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 871F4D597DC
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 03:16:58 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.3432.1731467809497396171
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 19:16:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=EhBcOwtv;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-720be27db27so5392629b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 19:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1731467809; x=1732072609; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z3l92nJidW3GXLTCDf+6PaAudyjsser0EOV30kxSKe0=;
        b=EhBcOwtvhJe76R7chgdENO6V3AEZVdFVJliQ5o4cdtqBvNxG2N6iZ1XNhQZdmNM5b0
         yEAagkNATztpKGEYoE4KJhI8NI3U9PdJ9pmOFVWehvae3rMl+Cf5XGPuYVK2gqW7cn5a
         nvB2Y8e6S3xmIKyq+sp6bbgF7Rx8I7oJH26/VcGdyqusATqe+tz9QqGqJ2/3S0grcFG8
         VtDI1SDW1HQUnHS5KaZ10I/k/mF1YpXNZl5F7NlTkGZGaRGGcEirfiQLOXYmqfQHn5ea
         OrUgfB8yp/Y5MF9EuUHiwtVP+vA4Rij6ayndFIBdRXz32K7YPCHh4kLXeqe24Z6whP8x
         U88w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731467809; x=1732072609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z3l92nJidW3GXLTCDf+6PaAudyjsser0EOV30kxSKe0=;
        b=fWUq0LwCvd6Pqpj34WPRfjdVa9H72nnpfKNDlCPKzeXYQo0IP3uAmXQcBVtVIkTx/a
         6irVrXL0R1YYTmmTs/4KDqWqf0wu70gojaCMs7CYeHwvp2/njynlNDPIc8nsDus0ctgM
         UoPZ2O8oLpLK0xIG8iZWsgZA+0GoWqH0erS2Z+YZDCe0/p26kN8P2QJm1G5HzCCeolh5
         6HwUSAx95B3iiJXtMpTMJAzmRo2zJzik37wAVj7ZSK/iUsRKOu5nu7HX/FV7ibS9eMbS
         G1VF7Mf6p+aBhww/Uk/SV7DaGC2A16ZNC3zfUYJJxc9SaYLzT4pnyUVRklq4WOD8e+hv
         k2Cg==
X-Gm-Message-State: AOJu0YxPwYPU8xd7oe5f5N4UQhtrZPUnf991WSzAhufFY1VrjJfuqT3V
	4DiZV2uoRaa69v1povDKtxHcWMdQy3c/6mNpGeUntXvJFYdF0bc7hPXYC/VmP+FMmV/rE+J05OF
	d
X-Google-Smtp-Source: AGHT+IFLmqwDVjcgWQ9qkMW2gQULA1PqBsegCnXZ82BK0745s6heBuV4Ks1ftYbVaVszcs900RphCw==
X-Received: by 2002:a05:6a21:8cca:b0:1db:ff57:562b with SMTP id adf61e73a8af0-1dc5f982de0mr7284924637.31.1731467808814;
        Tue, 12 Nov 2024 19:16:48 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f41f64616csm9660213a12.64.2024.11.12.19.16.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 19:16:48 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 19/19] pseudo: Fix envp bug and add posix_spawn wrapper
Date: Tue, 12 Nov 2024 19:16:12 -0800
Message-Id: <89b64526ac2bf0609a18c4d44b4835028f686978.1731467662.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1731467662.git.steve@sakoman.com>
References: <cover.1731467662.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 03:16:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207092

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Fix pseudo with python 3.13 by adding a wrapper for posix_spawn and
fixing a NULL pointer dereference in envp handling it uncovered. This
fixes issues on Fedora 41.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index b390ca7db9..405d2340ae 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -14,7 +14,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "374089f2ed83da4d0d4e58df067142ff99c7eb12"
+SRCREV = "28dcefb809ce95db997811b5662f0b893b9923e0"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.34.1


